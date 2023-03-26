## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkArrayDispatch.h
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkArrayDispatch
##  @brief   vtkDataArray code generator/dispatcher.
##
##  vtkArrayDispatch implements a mechanism for generating optimized code for
##  multiple subclasses of vtkDataArray at once. Using a TypeList based
##  approach (see vtkTypeList), a templated worker implementation is generated
##  for a restricted or unrestricted set of vtkDataArray subclasses.
##
##  A more detailed description of this class and related tools can be found
##  \ref VTK-7-1-ArrayDispatch "here".
##
##  The primary goals of this class are to simplify multi-array dispatch
##  implementations, and provide tools to lower compilation time and binary
##  size (i.e. avoiding 'template explosions').
##
##  vtkArrayDispatch is also intended to replace code that currently relies on
##  the encapsulation-breaking vtkDataArray::GetVoidPointer method. Not all
##  subclasses of vtkDataArray use the memory layout assumed by GetVoidPointer;
##  calling this method on, e.g. a vtkSOADataArrayTemplate will trigger a deep
##  copy of the array data into an AOS buffer. This is very inefficient and
##  should be avoided.
##
##  The vtkDataArrayRange.h utilities are worth mentioning here, as they allow
##  vtkArrayDispatch workers to operate on selected concrete subclasses for
##  'fast paths', yet fallback to using the slower vtkDataArray API for uncommon
##  array types. This helps mitigate the "template explosion" issues that can
##  result from instantiating a large worker functions for many array types.
##
##  These dispatchers extend the basic functionality of vtkTemplateMacro with
##  the following features:
##  - Multiarray dispatch: A single call can dispatch up to 3 arrays at once.
##  - Array restriction: The set of valid arrays for a particular dispatch
##    can be restricted. For example, if only vtkDoubleArray or vtkFloatArray
##    will be passed into the call, the dispatcher will only generate code paths
##    that use those arrays.
##  - ValueType restriction: If both SoA and AoS arrays need to be supported,
##    but only certain ValueTypes are expected, the dispatcher can restrict
##    itself to only use arrays that match this criteria.
##  - Application-wide array restrictions: If a VTK application uses only a few
##    arraytype / valuetype combinations, certain dispatchers will eliminate
##    paths using unsupported arrays at compile time.
##
##  The basic Dispatch implementation will generate code paths for all arrays
##  in the application-wide array list, and operates on a single array.
##
##  Dispatchers that start with Dispatch2 operate on 2 arrays simultaneously,
##  while those that begin with Dispatch3 operate on 3 arrays.
##
##  To reduce compile time and binary size, the following dispatchers can be
##  used to restrict the set of arrays that will be used. There are versions of
##  these that operate on 1, 2, or 3 arrays:
##
##  - DispatchByArray:
##    Accepts an explicit TypeList of arrays to consider.
##    These dispatchers do NOT respect the application-wide array restrictions.
##    Example usecase: A filter that creates either vtkFloatArray or
##    vtkDoubleArray depending on configuration can use this to restrict itself
##    to only these specific types.
##    Note that these should not be used for operating on filter inputs, instead
##    use DispatchByValueType, which also considers variations in vtkDataArray
##    subclasses and respects the application-wide array restrictions.
##
##  - DispatchByValueType:
##    Accepts an explicit TypeList of ValueTypes to consider.
##    These dispatchers respect the application-wide array restrictions.
##    Example usecase: An image filter that operates on an input array that must
##    have either a float or unsigned char ValueType.
##
##  - DispatchNByArrayWithSameValueType:
##    Multiarray dispatcher that accepts an explicit TypeList of arrays for
##    consideration. Generated code paths are further restricted to enforce that
##    all dispatched arrays will have the same ValueType.
##    Example usecase: A filter that creates and operates on multiple arrays at
##    the same time, where the arrays are guaranteed to have the same ValueType.
##    Note that these should not be used for operating on filter inputs, instead
##    use DispatchNBySameValueType, which also considers variations in
##    vtkDataArray subclasses and respects the application-wide array
##    restrictions.
##
##  - DispatchNBySameValueType:
##    Multiarray dispatcher that accepts an explicit TypeList of ValueTypes to
##    consider. Generated code paths are further restricted to enforce that
##    all dispatched arrays will have the same ValueType.
##    Example usecase: A filter that creates a modified version of an input
##    array using NewInstance(). Both arrays may be passed into the dispatcher
##    using a worker function that produces the output from the input.
##
##  Execution:
##  There are three components to a dispatch: The dispatcher, the worker, and
##  the array(s). They are combined like so:
##
##  @code
##  bool result = Dispatcher<...>::Execute(array, worker);
##  @endcode
##
##  For convenience, the dispatcher may be aliased to a shorter name, e.g.:
##
##  @code
##  using MyDispatcher = vtkArrayDispatch::SomeDispatcher<...>;
##  MyWorker worker;
##  bool result = MyDispatcher::Execute(array, worker);
##  @endcode
##
##  Return value:
##  The Execute method of the dispatcher will return true if a code path matching
##  the array arguments is found, or false if the arrays are not supported. If
##  false is returned, the arrays will not be modified, and the worker will not
##  be executed.
##
##  Workers:
##  The dispatch requires a Worker functor that performs the work.
##  For single array, the functor must be callable where the first parameter is
##  an array object. For 2-array dispatch, the first two arguments must be (array1, array2).
##  For 3-array dispatch, the first three arguments must be (array1, array2, array3).
##  Workers are passed by reference, so stateful functors are permitted if
##  additional input/output data is needed and not being passed as additional
##  parameters to the Execute method.
##
##  A simple worker implementation for triple dispatch:
##  @code
##  struct MyWorker
##  {
##    template <typename Array1T, typename Array2T, typename Array3T>
##    void operator()(Array1T *array1, Array2T *array2, Array3T *array3)
##    {
##      // Do work using vtkGenericDataArray API...
##    }
##  };
##  @endcode
##
##  Note that optimized implementations (e.g. for AoS arrays vs SoA arrays) can
##  be supported by providing overloads of operator() that have more restrictive
##  template parameters.
##
##  A worker's operator() implementation can accept additional parameters that
##  follow the arrays. These parameters are passed to the dispatcher during
##  execution. For instance, this worker scales an array by a runtime-value,
##  writing it into a second array:
##
##  @code
##  struct ScaleArray
##  {
##    template <typename ArraySrc, typename ArrayDst>
##    void operator()(ArraySrc *srcArray, ArrayDst *dstArray,
##                    double scaleFactor) const
##    {
##      using SrcType = vtk::GetAPIType<ArraySrc>;
##      using DstType = vtk::GetAPIType<ArrayDst>;
##
##      const auto srcRange = vtk::DataArrayValueRange(srcArray);
##      auto dstRange = vtk::DataArrayValueRange(dstArray);
##
##      assert(srcRange.size() == dstRange.size());
##
##      auto dstIter = dstRange.begin();
##      for (SrcType srcVal : srcRange)
##      {
##        *dstIter++ = static_cast<DstType>(srcVal * scaleFactor);
##      }
##    }
##  };
##
##  vtkDataArray *src = ...;
##  vtkDataArray *dst = ...;
##  // Scale src by 3 (scaleFactor) and store in dst:
##  if (!vtkArrayDispatch::Dispatch2::Execute(src, dst, ScaleArray, 3))
##  {
##    scaleArray(src, dst, 3);
##  }
##  @endcode
##
##  Examples:
##  See TestArrayDispatchers.cxx for examples of each dispatch type and
##  ExampleDataArrayRangeDispatch.cxx for more real-world examples.
##
##  @sa
##  vtkDataArrayAccessor
##

import
  vtkArrayDispatchArrayList, vtkType, vtkTypeList

## *
##  A TypeList containing all real ValueTypes.
##

type
  Reals* = Create[cdouble, cfloat]

## *
##  A Typelist containing all integral ValueTypes.
##

type
  Integrals* = Result[Create[char, cint, clong, clonglong, cshort, cchar, cuchar, cuint,
                           culong, culonglong, cushort, vtkIdType]]

## *
##  A Typelist containing all standard VTK array ValueTypes.
##

type
  AllTypes* = Result[Reals, Integrals]

## ------------------------------------------------------------------------------
## *
##  Dispatch a single array against all array types in the application-wide
##  vtkArrayDispatch::Arrays list.
##  The entry point is:
##  bool Dispatch::Execute(vtkDataArray *array, Worker &worker).
##

discard "forward decl of Dispatch"
discard "forward decl of DispatchByArray"
discard "forward decl of DispatchByValueType"
discard "forward decl of Dispatch2"
discard "forward decl of Dispatch2SameValueType"
discard "forward decl of Dispatch2ByArray"
discard "forward decl of Dispatch2ByValueType"
discard "forward decl of Dispatch2ByArrayWithSameValueType"
discard "forward decl of Dispatch2BySameValueType"
discard "forward decl of Dispatch3"
discard "forward decl of Dispatch3SameValueType"
discard "forward decl of Dispatch3ByArray"
discard "forward decl of Dispatch3ByValueType"
discard "forward decl of Dispatch3ByArrayWithSameValueType"
discard "forward decl of Dispatch3BySameValueType"
discard "forward decl of FilterArraysByValueType"
##  end namespace vtkArrayDispatch

import
  vtkArrayDispatch
