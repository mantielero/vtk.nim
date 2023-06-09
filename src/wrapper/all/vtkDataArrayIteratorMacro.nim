## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDataArrayIteratorMacro.h
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
##  @def   vtkDataArrayIteratorMacro
##  @brief   (deprecated) A macro for obtaining iterators to
##  vtkDataArray data when the array implementation and type are unknown.
##
##  @deprecated This macro is deprecated and should not be used any longer. See
##  vtkArrayDispatch.h and vtkDataArrayRange.h for replacements.
##
##  See vtkTemplateMacro.
##  This macro is similar, but defines several additional typedefs and variables
##  for safely iterating through data in a vtkAbstractArray container:
##   - vtkDAValueType is typedef'd to the array's element value type.
##   - vtkDAContainerType is typedef'd to the most derived class of
##     vtkAbstractArray for which a suitable iterator has been found.
##   - vtkDAIteratorType is typedef'd to the most suitable iterator type found.
##   - vtkDABegin is an object of vtkDAIteratorType that points to the first
##     component of the first tuple in the array.
##   - vtkDAEnd is an object of vtkDAIteratorType that points to the element
##     *after* the last component of the last tuple in the array.
##  The primary advantage to using this macro is that arrays with non-standard
##  memory layouts will be safely handled, and dangerous calls to GetVoidPointer
##  are avoided.
##  For arrays with > 1 component, the iterator will proceed through all
##  components of a tuple before moving on to the next tuple.
##  This matches the memory layout of the standard vtkDataArray subclasses such
##  as vtkFloatArray.
##
##  For the standard vtkDataArray implementations (which are subclasses of
##  vtkAOSDataArrayTemplate), the iterators will simply be pointers to the raw
##  memory of the array.
##  This allows very fast iteration when possible, and permits compiler
##  optimizations in the standard template library to occur (such as reducing
##  std::copy to memmove).
##
##  For arrays that are subclasses of vtkTypedDataArray, a
##  vtkTypedDataArrayIterator is used.
##  Such iterators safely traverse the array using API calls and have
##  pointer-like semantics, but add about a 35% performance overhead compared
##  with iterating over the raw memory (measured by summing a vtkFloatArray
##  containing 10M values on GCC 4.8.1 with -O3 optimization using both iterator
##  types -- see TestDataArrayIterators).
##
##  For arrays that are not subclasses of vtkTypedDataArray, there is no reliably
##  safe way to iterate over the array elements.
##  In such cases, this macro performs the legacy behavior of casting
##  vtkAbstractArray::GetVoidPointer(...) to vtkDAValueType* to create the
##  iterators.
##
##  To use this macro, create a templated worker function:
##
##  @code
##  template <class Iterator>
##  void myFunc(Iterator begin, Iterator end, ...) {...}
##
##  and then call the vtkDataArrayIteratorMacro inside of a switch statement
##  using the above objects and typedefs as needed:
##
##  vtkAbstractArray *someArray = ...;
##  switch (someArray->GetDataType())
##  {
##    vtkDataArrayIteratorMacro(someArray, myFunc(vtkDABegin, vtkDAEnd, ...));
##  }
##  @endcode
##
##  @sa
##  vtkArrayDispatch vtkGenericDataArray
##  vtkTemplateMacro vtkTypedDataArrayIterator
##

import
  vtkAOSDataArrayTemplate, vtkSetGet, vtkTypedDataArray

##  Silence 'unused typedef' warnings on GCC.
##  use of the typedef in question depends on the macro
##  argument _call and thus should not be removed.

when defined(__GNUC__):
  discard
else:
  const
    __attribute__* = ((unused))
##  VTK-HeaderTest-Exclude: vtkDataArrayIteratorMacro.h
