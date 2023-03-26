## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTypedDataArray.h
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
##  @class   vtkTypedDataArray
##  @brief   Extend vtkDataArray with abstract type-specific API
##
##
##  This templated class decorates vtkDataArray with additional type-specific
##  methods that can be used to interact with the data.
##
##  NOTE: This class has been made obsolete by the newer vtkGenericDataArray.
##
##  @warning
##  This class uses vtkTypeTraits to implement GetDataType(). Since vtkIdType
##  is a typedef for either a 32- or 64-bit integer, subclasses that are designed
##  to hold vtkIdTypes will, by default, return an incorrect value from
##  GetDataType(). To fix this, such subclasses should override GetDataType() to
##  return VTK_ID_TYPE.
##
##  @sa
##  vtkGenericDataArray
##

## !!!Ignored construct:  # vtkTypedDataArray_h [NewLine] # vtkTypedDataArray_h [NewLine] # vtkGenericDataArray.h [NewLine] # vtkCommonCoreModule.h  For export macro # vtkTypeTraits.h  For type metadata [NewLine] template < class Scalar > [end of template] class vtkTypedDataArrayIterator ;
## Error: token expected: ; but got: <!!!

type
  vtkTypedDataArray*[Scalar] {.importcpp: "vtkTypedDataArray<\'0>",
                              header: "vtkTypedDataArray.h", bycopy.} = object of vtkGenericDataArray[
      vtkTypedDataArray[Scalar], Scalar]
    vtkTypedDataArray* {.importc: "vtkTypedDataArray".}: VTK_NEWINSTANCE

  vtkTypedDataArraySuperclass* = vtkTypedDataArrayGenericDataArrayType

proc IsTypeOf*[Scalar](`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTypedDataArray::IsTypeOf(@)", header: "vtkTypedDataArray.h".}
proc IsA*[Scalar](this: var vtkTypedDataArray[Scalar]; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTypedDataArray.h".}
proc SafeDownCast*[Scalar](o: ptr vtkObjectBase): ptr vtkTypedDataArray[Scalar] {.
    importcpp: "vtkTypedDataArray::SafeDownCast(@)", header: "vtkTypedDataArray.h".}
## !!!Ignored construct:  < Scalar > * NewInstance ( ) const { return vtkTypedDataArray < Scalar > :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( typeid ( vtkTypedDataArray < Scalar > ) . name ( ) , type ) ) { return 0 ; } return 1 + GenericDataArrayType :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTypedDataArray < Scalar > :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : ;
## Error: identifier expected, but got: <!!!

type
  vtkTypedDataArrayValueType* = ValueType
  vtkTypedDataArrayIterator* = vtkTypedDataArrayIterator[
      vtkTypedDataArrayValueType]

proc Begin*[Scalar](this: var vtkTypedDataArray[Scalar]): vtkTypedDataArrayIterator {.
    importcpp: "Begin", header: "vtkTypedDataArray.h".}
proc End*[Scalar](this: var vtkTypedDataArray[Scalar]): vtkTypedDataArrayIterator {.
    importcpp: "End", header: "vtkTypedDataArray.h".}
const
  vtkTypedDataArrayVTK_DATA_TYPE* = VTK_TYPE_ID[vtkTypedDataArrayValueType]

proc FastDownCast*[Scalar](source: ptr vtkAbstractArray): ptr vtkTypedDataArray[
    Scalar] {.importcpp: "vtkTypedDataArray::FastDownCast(@)",
             header: "vtkTypedDataArray.h".}
proc GetDataType*[Scalar](this: vtkTypedDataArray[Scalar]): cint {.noSideEffect,
    importcpp: "GetDataType", header: "vtkTypedDataArray.h".}
proc GetDataTypeSize*[Scalar](this: vtkTypedDataArray[Scalar]): cint {.noSideEffect,
    importcpp: "GetDataTypeSize", header: "vtkTypedDataArray.h".}
proc SetTypedTuple*[Scalar](this: var vtkTypedDataArray[Scalar]; i: vtkIdType;
                           t: ptr vtkTypedDataArrayValueType) {.
    importcpp: "SetTypedTuple", header: "vtkTypedDataArray.h".}
proc InsertTypedTuple*[Scalar](this: var vtkTypedDataArray[Scalar]; i: vtkIdType;
                              t: ptr vtkTypedDataArrayValueType) {.
    importcpp: "InsertTypedTuple", header: "vtkTypedDataArray.h".}
proc InsertNextTypedTuple*[Scalar](this: var vtkTypedDataArray[Scalar];
                                  t: ptr vtkTypedDataArrayValueType): vtkIdType {.
    importcpp: "InsertNextTypedTuple", header: "vtkTypedDataArray.h".}
proc GetValue*[Scalar](this: vtkTypedDataArray[Scalar]; idx: vtkIdType): vtkTypedDataArrayValueType {.
    noSideEffect, importcpp: "GetValue", header: "vtkTypedDataArray.h".}
proc GetValueReference*[Scalar](this: var vtkTypedDataArray[Scalar]; idx: vtkIdType): var vtkTypedDataArrayValueType {.
    importcpp: "GetValueReference", header: "vtkTypedDataArray.h".}
proc SetValue*[Scalar](this: var vtkTypedDataArray[Scalar]; idx: vtkIdType;
                      value: vtkTypedDataArrayValueType) {.importcpp: "SetValue",
    header: "vtkTypedDataArray.h".}
proc GetTypedTuple*[Scalar](this: vtkTypedDataArray[Scalar]; idx: vtkIdType;
                           t: ptr vtkTypedDataArrayValueType) {.noSideEffect,
    importcpp: "GetTypedTuple", header: "vtkTypedDataArray.h".}
proc InsertNextValue*[Scalar](this: var vtkTypedDataArray[Scalar];
                             v: vtkTypedDataArrayValueType): vtkIdType {.
    importcpp: "InsertNextValue", header: "vtkTypedDataArray.h".}
proc InsertValue*[Scalar](this: var vtkTypedDataArray[Scalar]; idx: vtkIdType;
                         v: vtkTypedDataArrayValueType) {.
    importcpp: "InsertValue", header: "vtkTypedDataArray.h".}
proc GetTypedComponent*[Scalar](this: vtkTypedDataArray[Scalar];
                               tupleIdx: vtkIdType; comp: cint): vtkTypedDataArrayValueType {.
    noSideEffect, importcpp: "GetTypedComponent", header: "vtkTypedDataArray.h".}
proc SetTypedComponent*[Scalar](this: var vtkTypedDataArray[Scalar];
                               tupleIdx: vtkIdType; comp: cint;
                               v: vtkTypedDataArrayValueType) {.
    importcpp: "SetTypedComponent", header: "vtkTypedDataArray.h".}
proc GetArrayType*[Scalar](this: vtkTypedDataArray[Scalar]): cint {.noSideEffect,
    importcpp: "GetArrayType", header: "vtkTypedDataArray.h".}
proc Allocate*[Scalar](this: var vtkTypedDataArray[Scalar]; size: vtkIdType;
                      ext: vtkIdType = 1000): vtkTypeBool {.importcpp: "Allocate",
    header: "vtkTypedDataArray.h".}
proc Resize*[Scalar](this: var vtkTypedDataArray[Scalar]; numTuples: vtkIdType): vtkTypeBool {.
    importcpp: "Resize", header: "vtkTypedDataArray.h".}
##  Declare vtkArrayDownCast implementations for typed containers:

vtkArrayDownCast_TemplateFastCastMacro(constructvtkTypedDataArray)
##  Included here to resolve chicken/egg issue with container/iterator:

import
  vtkTypedDataArrayIterator

## !!!Ignored construct:  template < class Scalar > [end of template] inline typename vtkTypedDataArray < Scalar > :: Iterator vtkTypedDataArray < Scalar > :: Begin ( ) { return Iterator ( this , 0 ) ; } template < class Scalar > inline typename vtkTypedDataArray < Scalar > :: Iterator vtkTypedDataArray < Scalar > :: End ( ) { return Iterator ( this , this -> MaxId + 1 ) ; } # vtkTypedDataArray.txx [NewLine] #  vtkTypedDataArray_h [NewLine]  VTK-HeaderTest-Exclude: vtkTypedDataArray.h
## Error: token expected: ; but got: <!!!
