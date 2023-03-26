## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGenericDataArrayLookupHelper.h
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
##  @class   vtkGenericDataArrayLookupHelper
##  @brief   internal class used by
##  vtkGenericDataArray to support LookupValue.
##
##

import
  vtkIdList

## !!!Ignored construct:  template < typename T , bool > [end of template] struct has_NaN ;
## Error: identifier expected, but got: > [end of template]!!!

## !!!Ignored construct:  template < typename T > [end of template] struct has_NaN < T , true > { static bool isnan ( T x ) { return std :: isnan ( x ) ; } } ;
## Error: identifier expected, but got: <!!!

## !!!Ignored construct:  template < typename T > [end of template] struct has_NaN < T , false > { static bool isnan ( T ) { return false ; } } ;
## Error: identifier expected, but got: <!!!

proc isnan*[T](x: T): bool =
  discard

##  namespace detail

type
  has_NaNhas_NaNvtkGenericDataArrayLookupHelper*[ArrayTypeT] {.importcpp: "has_NaN<\'0>::has_NaN<\'1>::vtkGenericDataArrayLookupHelper<\'2>",
      header: "vtkGenericDataArrayLookupHelper.h", bycopy.} = object

  has_NaNhas_NaNvtkGenericDataArrayLookupHelperArrayType*[ArrayTypeT] = ArrayTypeT
  has_NaNhas_NaNvtkGenericDataArrayLookupHelperValueType* = ValueType

proc constructhas_NaNhas_NaNvtkGenericDataArrayLookupHelper*[ArrayTypeT](): has_NaNhas_NaNvtkGenericDataArrayLookupHelper[
    ArrayTypeT] {.constructor, importcpp: "has_NaN<\'*0>::has_NaN<\'*1>::vtkGenericDataArrayLookupHelper<\'*2>(@)",
                 header: "vtkGenericDataArrayLookupHelper.h".}
proc destroyhas_NaNhas_NaNvtkGenericDataArrayLookupHelper*[ArrayTypeT](
    this: var has_NaNhas_NaNvtkGenericDataArrayLookupHelper[ArrayTypeT]) {.
    importcpp: "#.~vtkGenericDataArrayLookupHelper()",
    header: "vtkGenericDataArrayLookupHelper.h".}
proc SetArray*[ArrayTypeT](this: var has_NaNhas_NaNvtkGenericDataArrayLookupHelper[
    ArrayTypeT]; array: ptr ArrayTypeT) {.importcpp: "SetArray", header: "vtkGenericDataArrayLookupHelper.h".}
proc LookupValue*[ArrayTypeT](this: var has_NaNhas_NaNvtkGenericDataArrayLookupHelper[
    ArrayTypeT]; elem: has_NaNhas_NaNvtkGenericDataArrayLookupHelperValueType): vtkIdType {.
    importcpp: "LookupValue", header: "vtkGenericDataArrayLookupHelper.h".}
proc LookupValue*[ArrayTypeT](this: var has_NaNhas_NaNvtkGenericDataArrayLookupHelper[
    ArrayTypeT]; elem: has_NaNhas_NaNvtkGenericDataArrayLookupHelperValueType;
                             ids: ptr vtkIdList) {.importcpp: "LookupValue",
    header: "vtkGenericDataArrayLookupHelper.h".}
proc ClearLookup*[ArrayTypeT](this: var has_NaNhas_NaNvtkGenericDataArrayLookupHelper[
    ArrayTypeT]) {.importcpp: "ClearLookup",
                  header: "vtkGenericDataArrayLookupHelper.h".}
## !!!Ignored construct:  { nullptr } ;
## Error: identifier expected, but got: {!!!

##  VTK-HeaderTest-Exclude: vtkGenericDataArrayLookupHelper.h
