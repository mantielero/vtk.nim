## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPeriodicDataArray.h
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##     This software is distributed WITHOUT ANY WARRANTY; without even
##     the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##     PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkPeriodicDataArray
##  @brief   Map native an Array into an angulat
##  periodic array
##
##
##  Map an array into a periodic array. Data from the original array are
##  rotated (on the fly) by the specified angle along the specified axis
##  around the specified point. Lookup is not implemented.
##  Creating the array is virtually free, accessing a tuple require some
##  computation.
##

import
  vtkAOSDataArrayTemplate, vtkGenericDataArray

type
  vtkPeriodicDataArray*[Scalar] {.importcpp: "vtkPeriodicDataArray<\'0>",
                                 header: "vtkPeriodicDataArray.h", bycopy.} = object of vtkGenericDataArray[
      vtkPeriodicDataArray[Scalar], Scalar]
    vtkPeriodicDataArray* {.importc: "vtkPeriodicDataArray".}: VTK_NEWINSTANCE
    vtkArrayIterator* {.importc: "vtkArrayIterator".}: VTK_NEWINSTANCE
    ##  If transformed vector must be normalized
    ##  Temporary array used by GetTypedTuple methods
    ##  Temporary array used by GetTuple vethods
    ##  Location of currently stored Temp Tuple to use as cache
    ##  Original data
    ##  Transformed periodic range
    ##  Transformed periodic finite range

  vtkPeriodicDataArraySuperclass* = vtkPeriodicDataArrayGenericBase

proc IsTypeOf*[Scalar](`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPeriodicDataArray::IsTypeOf(@)",
    header: "vtkPeriodicDataArray.h".}
proc IsA*[Scalar](this: var vtkPeriodicDataArray[Scalar]; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPeriodicDataArray.h".}
proc SafeDownCast*[Scalar](o: ptr vtkObjectBase): ptr vtkPeriodicDataArray[Scalar] {.
    importcpp: "vtkPeriodicDataArray::SafeDownCast(@)",
    header: "vtkPeriodicDataArray.h".}
## !!!Ignored construct:  < Scalar > * NewInstance ( ) const { return vtkPeriodicDataArray < Scalar > :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( typeid ( vtkPeriodicDataArray < Scalar > ) . name ( ) , type ) ) { return 0 ; } return 1 + GenericBase :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPeriodicDataArray < Scalar > :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : ;
## Error: identifier expected, but got: <!!!

type
  vtkPeriodicDataArrayValueType* = ValueType

proc PrintSelf*[Scalar](this: var vtkPeriodicDataArray[Scalar]; os: var ostream;
                       indent: vtkIndent) {.importcpp: "PrintSelf",
    header: "vtkPeriodicDataArray.h".}
proc InitializeArray*[Scalar](this: var vtkPeriodicDataArray[Scalar];
                             inputData: ptr vtkAOSDataArrayTemplate[Scalar]) {.
    importcpp: "InitializeArray", header: "vtkPeriodicDataArray.h".}
proc Initialize*[Scalar](this: var vtkPeriodicDataArray[Scalar]) {.
    importcpp: "Initialize", header: "vtkPeriodicDataArray.h".}
proc GetTuples*[Scalar](this: var vtkPeriodicDataArray[Scalar];
                       ptIds: ptr vtkIdList; output: ptr vtkAbstractArray) {.
    importcpp: "GetTuples", header: "vtkPeriodicDataArray.h".}
proc GetTuples*[Scalar](this: var vtkPeriodicDataArray[Scalar]; p1: vtkIdType;
                       p2: vtkIdType; output: ptr vtkAbstractArray) {.
    importcpp: "GetTuples", header: "vtkPeriodicDataArray.h".}
proc Squeeze*[Scalar](this: var vtkPeriodicDataArray[Scalar]) {.
    importcpp: "Squeeze", header: "vtkPeriodicDataArray.h".}
## !!!Ignored construct:  * NewIterator ( ) override ;
## Error: identifier expected, but got: *!!!

proc LookupValue*[Scalar](this: var vtkPeriodicDataArray[Scalar]; value: vtkVariant): vtkIdType {.
    importcpp: "LookupValue", header: "vtkPeriodicDataArray.h".}
proc LookupValue*[Scalar](this: var vtkPeriodicDataArray[Scalar]; value: vtkVariant;
                         ids: ptr vtkIdList) {.importcpp: "LookupValue",
    header: "vtkPeriodicDataArray.h".}
proc GetVariantValue*[Scalar](this: var vtkPeriodicDataArray[Scalar]; idx: vtkIdType): vtkVariant {.
    importcpp: "GetVariantValue", header: "vtkPeriodicDataArray.h".}
proc ClearLookup*[Scalar](this: var vtkPeriodicDataArray[Scalar]) {.
    importcpp: "ClearLookup", header: "vtkPeriodicDataArray.h".}
proc GetTuple*[Scalar](this: var vtkPeriodicDataArray[Scalar]; i: vtkIdType): ptr cdouble {.
    importcpp: "GetTuple", header: "vtkPeriodicDataArray.h".}
proc GetTuple*[Scalar](this: var vtkPeriodicDataArray[Scalar]; i: vtkIdType;
                      `tuple`: ptr cdouble) {.importcpp: "GetTuple",
    header: "vtkPeriodicDataArray.h".}
proc LookupTypedValue*[Scalar](this: var vtkPeriodicDataArray[Scalar]; value: Scalar): vtkIdType {.
    importcpp: "LookupTypedValue", header: "vtkPeriodicDataArray.h".}
proc LookupTypedValue*[Scalar](this: var vtkPeriodicDataArray[Scalar];
                              value: Scalar; ids: ptr vtkIdList) {.
    importcpp: "LookupTypedValue", header: "vtkPeriodicDataArray.h".}
proc GetValue*[Scalar](this: vtkPeriodicDataArray[Scalar]; idx: vtkIdType): vtkPeriodicDataArrayValueType {.
    noSideEffect, importcpp: "GetValue", header: "vtkPeriodicDataArray.h".}
proc GetValueReference*[Scalar](this: var vtkPeriodicDataArray[Scalar];
                               idx: vtkIdType): var vtkPeriodicDataArrayValueType {.
    importcpp: "GetValueReference", header: "vtkPeriodicDataArray.h".}
proc GetTypedTuple*[Scalar](this: vtkPeriodicDataArray[Scalar]; idx: vtkIdType;
                           t: ptr Scalar) {.noSideEffect,
    importcpp: "GetTypedTuple", header: "vtkPeriodicDataArray.h".}
proc GetTypedComponent*[Scalar](this: vtkPeriodicDataArray[Scalar];
                               tupleIdx: vtkIdType; compIdx: cint): vtkPeriodicDataArrayValueType {.
    noSideEffect, importcpp: "GetTypedComponent", header: "vtkPeriodicDataArray.h".}
proc GetActualMemorySize*[Scalar](this: vtkPeriodicDataArray[Scalar]): culong {.
    noSideEffect, importcpp: "GetActualMemorySize",
    header: "vtkPeriodicDataArray.h".}
proc Allocate*[Scalar](this: var vtkPeriodicDataArray[Scalar]; sz: vtkIdType;
                      ext: vtkIdType): vtkTypeBool {.importcpp: "Allocate",
    header: "vtkPeriodicDataArray.h".}
proc Resize*[Scalar](this: var vtkPeriodicDataArray[Scalar]; numTuples: vtkIdType): vtkTypeBool {.
    importcpp: "Resize", header: "vtkPeriodicDataArray.h".}
proc SetNumberOfTuples*[Scalar](this: var vtkPeriodicDataArray[Scalar];
                               number: vtkIdType) {.
    importcpp: "SetNumberOfTuples", header: "vtkPeriodicDataArray.h".}
proc SetTuple*[Scalar](this: var vtkPeriodicDataArray[Scalar]; i: vtkIdType;
                      j: vtkIdType; source: ptr vtkAbstractArray) {.
    importcpp: "SetTuple", header: "vtkPeriodicDataArray.h".}
proc SetTuple*[Scalar](this: var vtkPeriodicDataArray[Scalar]; i: vtkIdType;
                      source: ptr cfloat) {.importcpp: "SetTuple",
    header: "vtkPeriodicDataArray.h".}
proc SetTuple*[Scalar](this: var vtkPeriodicDataArray[Scalar]; i: vtkIdType;
                      source: ptr cdouble) {.importcpp: "SetTuple",
    header: "vtkPeriodicDataArray.h".}
proc InsertTuple*[Scalar](this: var vtkPeriodicDataArray[Scalar]; i: vtkIdType;
                         j: vtkIdType; source: ptr vtkAbstractArray) {.
    importcpp: "InsertTuple", header: "vtkPeriodicDataArray.h".}
proc InsertTuple*[Scalar](this: var vtkPeriodicDataArray[Scalar]; i: vtkIdType;
                         source: ptr cfloat) {.importcpp: "InsertTuple",
    header: "vtkPeriodicDataArray.h".}
proc InsertTuple*[Scalar](this: var vtkPeriodicDataArray[Scalar]; i: vtkIdType;
                         source: ptr cdouble) {.importcpp: "InsertTuple",
    header: "vtkPeriodicDataArray.h".}
proc InsertTuples*[Scalar](this: var vtkPeriodicDataArray[Scalar];
                          dstIds: ptr vtkIdList; srcIds: ptr vtkIdList;
                          source: ptr vtkAbstractArray) {.
    importcpp: "InsertTuples", header: "vtkPeriodicDataArray.h".}
proc InsertTuplesStartingAt*[Scalar](this: var vtkPeriodicDataArray[Scalar];
                                    dstStart: vtkIdType; srcIds: ptr vtkIdList;
                                    source: ptr vtkAbstractArray) {.
    importcpp: "InsertTuplesStartingAt", header: "vtkPeriodicDataArray.h".}
proc InsertTuples*[Scalar](this: var vtkPeriodicDataArray[Scalar];
                          dstStart: vtkIdType; n: vtkIdType; srcStart: vtkIdType;
                          source: ptr vtkAbstractArray) {.
    importcpp: "InsertTuples", header: "vtkPeriodicDataArray.h".}
proc InsertNextTuple*[Scalar](this: var vtkPeriodicDataArray[Scalar]; j: vtkIdType;
                             source: ptr vtkAbstractArray): vtkIdType {.
    importcpp: "InsertNextTuple", header: "vtkPeriodicDataArray.h".}
proc InsertNextTuple*[Scalar](this: var vtkPeriodicDataArray[Scalar];
                             source: ptr cfloat): vtkIdType {.
    importcpp: "InsertNextTuple", header: "vtkPeriodicDataArray.h".}
proc InsertNextTuple*[Scalar](this: var vtkPeriodicDataArray[Scalar];
                             source: ptr cdouble): vtkIdType {.
    importcpp: "InsertNextTuple", header: "vtkPeriodicDataArray.h".}
proc DeepCopy*[Scalar](this: var vtkPeriodicDataArray[Scalar];
                      aa: ptr vtkAbstractArray) {.importcpp: "DeepCopy",
    header: "vtkPeriodicDataArray.h".}
proc DeepCopy*[Scalar](this: var vtkPeriodicDataArray[Scalar]; da: ptr vtkDataArray) {.
    importcpp: "DeepCopy", header: "vtkPeriodicDataArray.h".}
proc InterpolateTuple*[Scalar](this: var vtkPeriodicDataArray[Scalar]; i: vtkIdType;
                              ptIndices: ptr vtkIdList;
                              source: ptr vtkAbstractArray; weights: ptr cdouble) {.
    importcpp: "InterpolateTuple", header: "vtkPeriodicDataArray.h".}
proc InterpolateTuple*[Scalar](this: var vtkPeriodicDataArray[Scalar]; i: vtkIdType;
                              id1: vtkIdType; source1: ptr vtkAbstractArray;
                              id2: vtkIdType; source2: ptr vtkAbstractArray;
                              t: cdouble) {.importcpp: "InterpolateTuple",
    header: "vtkPeriodicDataArray.h".}
proc SetVariantValue*[Scalar](this: var vtkPeriodicDataArray[Scalar];
                             idx: vtkIdType; value: vtkVariant) {.
    importcpp: "SetVariantValue", header: "vtkPeriodicDataArray.h".}
proc InsertVariantValue*[Scalar](this: var vtkPeriodicDataArray[Scalar];
                                idx: vtkIdType; value: vtkVariant) {.
    importcpp: "InsertVariantValue", header: "vtkPeriodicDataArray.h".}
proc RemoveTuple*[Scalar](this: var vtkPeriodicDataArray[Scalar]; id: vtkIdType) {.
    importcpp: "RemoveTuple", header: "vtkPeriodicDataArray.h".}
proc RemoveFirstTuple*[Scalar](this: var vtkPeriodicDataArray[Scalar]) {.
    importcpp: "RemoveFirstTuple", header: "vtkPeriodicDataArray.h".}
proc RemoveLastTuple*[Scalar](this: var vtkPeriodicDataArray[Scalar]) {.
    importcpp: "RemoveLastTuple", header: "vtkPeriodicDataArray.h".}
proc SetTypedTuple*[Scalar](this: var vtkPeriodicDataArray[Scalar]; i: vtkIdType;
                           t: ptr Scalar) {.importcpp: "SetTypedTuple",
    header: "vtkPeriodicDataArray.h".}
proc SetTypedComponent*[Scalar](this: var vtkPeriodicDataArray[Scalar];
                               t: vtkIdType; c: cint; v: Scalar) {.
    importcpp: "SetTypedComponent", header: "vtkPeriodicDataArray.h".}
proc InsertTypedTuple*[Scalar](this: var vtkPeriodicDataArray[Scalar]; i: vtkIdType;
                              t: ptr Scalar) {.importcpp: "InsertTypedTuple",
    header: "vtkPeriodicDataArray.h".}
proc InsertNextTypedTuple*[Scalar](this: var vtkPeriodicDataArray[Scalar];
                                  t: ptr Scalar): vtkIdType {.
    importcpp: "InsertNextTypedTuple", header: "vtkPeriodicDataArray.h".}
proc SetValue*[Scalar](this: var vtkPeriodicDataArray[Scalar]; idx: vtkIdType;
                      value: Scalar) {.importcpp: "SetValue",
                                     header: "vtkPeriodicDataArray.h".}
proc InsertNextValue*[Scalar](this: var vtkPeriodicDataArray[Scalar]; v: Scalar): vtkIdType {.
    importcpp: "InsertNextValue", header: "vtkPeriodicDataArray.h".}
proc InsertValue*[Scalar](this: var vtkPeriodicDataArray[Scalar]; idx: vtkIdType;
                         v: Scalar) {.importcpp: "InsertValue",
                                    header: "vtkPeriodicDataArray.h".}
proc SetNormalize*[Scalar](this: var vtkPeriodicDataArray[Scalar]; _arg: bool) {.
    importcpp: "SetNormalize", header: "vtkPeriodicDataArray.h".}
## !!!Ignored construct:  virtual bool GetNormalize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Normalize  of  << this -> Normalize ) ; return this -> Normalize ; } ;
## Error: expected ';'!!!

## using statement

## using statement

## using statement

## using statement

import
  vtkPeriodicDataArray
