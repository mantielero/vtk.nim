## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDataArrayMeta.h
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

## !!!Ignored construct:  # vtkDataArrayMeta_h [NewLine] # vtkDataArrayMeta_h [NewLine] # vtkAssume.h [NewLine] # vtkDataArray.h [NewLine] # vtkDebugRangeIterators.h [NewLine] # vtkMeta.h [NewLine] # vtkSetGet.h [NewLine] # vtkType.h [NewLine] # < type_traits > [NewLine] # < utility > [NewLine] *
##  @file vtkDataArrayMeta.h
##  This file contains a variety of metaprogramming constructs for working
##  with vtkDataArrays.
##   When enabled, extra debugging checks are enabled for the iterators.
##  Specifically:
##  - Specializations are disabled (All code uses the generic implementation).
##  - Additional assertions are inserted to ensure correct runtime usage.
##  - Performance-related annotations (e.g. force inlining) are disabled. # defined ( VTK_DEBUG_RANGE_ITERATORS ) [NewLine] # assert ( ( x ) && msg ) [NewLine] # [NewLine] # [NewLine] # [NewLine] # defined ( VTK_ALWAYS_OPTIMIZE_ARRAY_ITERATORS ) && ! defined ( VTK_DEBUG_RANGE_ITERATORS ) [NewLine] # VTK_ITER_INLINE VTK_ALWAYS_INLINE [NewLine] # VTK_ITER_ASSUME VTK_ASSUME_NO_ASSERT [NewLine] # VTK_ITER_OPTIMIZE_START VTK_ALWAYS_OPTIMIZE_START [NewLine] # VTK_ITER_OPTIMIZE_END VTK_ALWAYS_OPTIMIZE_START [NewLine] # [NewLine] # VTK_ITER_INLINE inline [NewLine] # VTK_ITER_ASSUME VTK_ASSUME [NewLine] # VTK_ITER_OPTIMIZE_START [NewLine] # VTK_ITER_OPTIMIZE_END [NewLine] # [NewLine] VTK_ITER_OPTIMIZE_START  For IsAOSDataArray: template < typename ValueType > class vtkAOSDataArrayTemplate ;
## Error: expected ';'!!!

##  Typedef for data array indices:

type
  ComponentIdType* = cint

## ignored statement

type
  TupleIdType* = vtkIdType

## ignored statement

type
  ValueIdType* = vtkIdType

## ignored statement

## ------------------------------------------------------------------------------
##  Used by ranges/iterators when tuple size is unknown at compile time

var DynamicTupleSize* {.importcpp: "vtk::detail::DynamicTupleSize",
                      header: "vtkDataArrayMeta.h".}: ComponentIdType

## ------------------------------------------------------------------------------
##  Detect data array value types

type
  IsVtkDataArray*[T] {.importcpp: "vtk::detail::IsVtkDataArray<\'0>",
                      header: "vtkDataArrayMeta.h", bycopy.} = object of is_base_of[
      vtkDataArray, T]


## !!!Ignored construct:  template < typename T > [end of template] using EnableIfVtkDataArray = typename std :: enable_if < IsVtkDataArray < T > :: value > :: type ;
## Error: token expected: ; but got: [identifier]!!!

## ------------------------------------------------------------------------------
##  If a value is a valid tuple size

## !!!Ignored construct:  template < ComponentIdType Size > [end of template] struct IsValidTupleSize : std :: integral_constant < bool , ( Size > 0 || Size == DynamicTupleSize ) > { } ;
## Error: token expected: > [end of template] but got: [identifier]!!!

## !!!Ignored construct:  template < ComponentIdType TupleSize > [end of template] using EnableIfValidTupleSize = typename std :: enable_if < IsValidTupleSize < TupleSize > :: value > :: type ;
## Error: token expected: > [end of template] but got: [identifier]!!!

## ------------------------------------------------------------------------------
##  If a value is a non-dynamic tuple size

## !!!Ignored construct:  template < ComponentIdType Size > [end of template] struct IsStaticTupleSize : std :: integral_constant < bool , ( Size > 0 ) > { } ;
## Error: token expected: > [end of template] but got: [identifier]!!!

## !!!Ignored construct:  template < ComponentIdType TupleSize > [end of template] using EnableIfStaticTupleSize = typename std :: enable_if < IsStaticTupleSize < TupleSize > :: value > :: type ;
## Error: token expected: > [end of template] but got: [identifier]!!!

## ------------------------------------------------------------------------------
##  If two values are valid non-dynamic tuple sizes:

## !!!Ignored construct:  template < ComponentIdType S1 , ComponentIdType S2 > [end of template] struct AreStaticTupleSizes : std :: integral_constant < bool , ( IsStaticTupleSize < S1 > :: value && IsStaticTupleSize < S2 > :: value ) > { } ;
## Error: token expected: > [end of template] but got: [identifier]!!!

## !!!Ignored construct:  template < ComponentIdType S1 , ComponentIdType S2 , typename T = void > [end of template] using EnableIfStaticTupleSizes = typename std :: enable_if < AreStaticTupleSizes < S1 , S2 > :: value , T > :: type ;
## Error: token expected: > [end of template] but got: [identifier]!!!

## ------------------------------------------------------------------------------
##  If either of the tuple sizes is not statically defined

## !!!Ignored construct:  template < ComponentIdType S1 , ComponentIdType S2 > [end of template] struct IsEitherTupleSizeDynamic : std :: integral_constant < bool , ( ! IsStaticTupleSize < S1 > :: value || ! IsStaticTupleSize < S2 > :: value ) > { } ;
## Error: token expected: > [end of template] but got: [identifier]!!!

## !!!Ignored construct:  template < ComponentIdType S1 , ComponentIdType S2 , typename T = void > [end of template] using EnableIfEitherTupleSizeIsDynamic = typename std :: enable_if < IsEitherTupleSizeDynamic < S1 , S2 > :: value , T > :: type ;
## Error: token expected: > [end of template] but got: [identifier]!!!

## ------------------------------------------------------------------------------
##  Helper that switches between a storageless integral constant for known
##  sizes, and a runtime variable for variable sizes.

## !!!Ignored construct:  template < ComponentIdType TupleSize > [end of template] struct GenericTupleSize : public std :: integral_constant < ComponentIdType , TupleSize > { static_assert ( IsValidTupleSize < TupleSize > :: value , Invalid tuple size. ) ; private : using Superclass = std :: integral_constant < ComponentIdType , TupleSize > ; public :  Need to construct from array for specialization. using Superclass :: Superclass ; VTK_ITER_INLINE GenericTupleSize ( ) noexcept = default ; VTK_ITER_INLINE GenericTupleSize ( vtkDataArray * ) noexcept { } } ;
## Error: token expected: > [end of template] but got: [identifier]!!!

##  Specialize for dynamic types, mimicking integral_constant API:

## !!!Ignored construct:  template < > [end of template] struct GenericTupleSize < DynamicTupleSize > { using value_type = ComponentIdType ; VTK_ITER_INLINE GenericTupleSize ( ) noexcept : value ( 0 ) { } VTK_ITER_INLINE explicit GenericTupleSize ( vtkDataArray * array ) : value ( array -> GetNumberOfComponents ( ) ) { } VTK_ITER_INLINE operator value_type ( ) const noexcept { return value ; } VTK_ITER_INLINE value_type operator ( ) ( ) const noexcept { return value ; } ComponentIdType value ; } ;
## Error: identifier expected, but got: <!!!

type
  GenericTupleSizeGetAPITypeImpl*[ArrayType] {.
      importcpp: "vtk::detail::GenericTupleSize<\'0>::GetAPITypeImpl<\'1>",
      header: "vtkDataArrayMeta.h", bycopy.} = object

  APIType* = typename

## !!!Ignored construct:  ArrayType :: ValueType ;
## Error: identifier expected, but got: ;!!!

## !!!Ignored construct:  template < > [end of template] struct GetAPITypeImpl < vtkDataArray > { using APIType = double ; } ;
## Error: identifier expected, but got: <!!!

##  end namespace detail
## ------------------------------------------------------------------------------
##  Typedef for double if vtkDataArray, or the array's ValueType for subclasses.

## !!!Ignored construct:  template < typename ArrayType , typename = detail :: EnableIfVtkDataArray < ArrayType > [end of template] > [end of template] using GetAPIType = typename detail :: GetAPITypeImpl < ArrayType > :: APIType ;
## Error: identifier expected, but got: =!!!

## ------------------------------------------------------------------------------

type
  GenericTupleSizeGetAPITypeImplIsAOSDataArrayImpl*[ArrayType] {.importcpp: "vtk::detail::GenericTupleSize<\'0>::GetAPITypeImpl<\'1>::IsAOSDataArrayImpl<\'2>",
      header: "vtkDataArrayMeta.h", bycopy.} = object

  APIType* = GetAPIType[ArrayType]

##  end namespace detail
## ------------------------------------------------------------------------------
##  True if ArrayType inherits some specialization of vtkAOSDataArrayTemplate

var IsAOSDataArray* {.importcpp: "vtk::IsAOSDataArray", header: "vtkDataArrayMeta.h".}: `using`

##  end namespace vtk

## !!!Ignored construct:  VTK_ITER_OPTIMIZE_END #  vtkDataArrayMeta_h [NewLine]  VTK-HeaderTest-Exclude: vtkDataArrayMeta.h
## Error: expected ';'!!!
