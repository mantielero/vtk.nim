## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCPExodusIIResultsArrayTemplate.h
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
##  @class   vtkCPExodusIIResultsArrayTemplate
##  @brief   Map native Exodus II results arrays
##  into the vtkDataArray interface.
##
##
##  Map native Exodus II results arrays into the vtkDataArray interface. Use
##  the vtkCPExodusIIInSituReader to read an Exodus II file's data into this
##  structure.
##

import
  vtkMappedDataArray, vtkObjectFactory

type
  vtkCPExodusIIResultsArrayTemplate*[Scalar] {.
      importcpp: "vtkCPExodusIIResultsArrayTemplate<\'0>",
      header: "vtkCPExodusIIResultsArrayTemplate.h", bycopy.} = object of vtkMappedDataArray[
      Scalar]
    vtkCPExodusIIResultsArrayTemplate* {.importc: "vtkCPExodusIIResultsArrayTemplate".}: VTK_NEWINSTANCE
    vtkArrayIterator* {.importc: "vtkArrayIterator".}: VTK_NEWINSTANCE
    ## /@{
    ## *
    ##  By default Save is false.
    ##
    ## /@}

  vtkCPExodusIIResultsArrayTemplateSuperclass* = vtkMappedDataArray[Scalar]

proc IsTypeOf*[Scalar](`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCPExodusIIResultsArrayTemplate::IsTypeOf(@)",
    header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc IsA*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar];
                 `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc SafeDownCast*[Scalar](o: ptr vtkObjectBase): ptr vtkCPExodusIIResultsArrayTemplate[
    Scalar] {.importcpp: "vtkCPExodusIIResultsArrayTemplate::SafeDownCast(@)",
             header: "vtkCPExodusIIResultsArrayTemplate.h".}
## !!!Ignored construct:  < Scalar > * NewInstance ( ) const { return vtkCPExodusIIResultsArrayTemplate < Scalar > :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( typeid ( vtkCPExodusIIResultsArrayTemplate < Scalar > ) . name ( ) , type ) ) { return 0 ; } return 1 + vtkMappedDataArray < Scalar > :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCPExodusIIResultsArrayTemplate < Scalar > :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : vtkMappedDataArrayNewInstanceMacro ( vtkCPExodusIIResultsArrayTemplate < Scalar > ) static vtkCPExodusIIResultsArrayTemplate * New ( ) ;
## Error: identifier expected, but got: <!!!

proc PrintSelf*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar];
                       os: var ostream; indent: vtkIndent) {.importcpp: "PrintSelf",
    header: "vtkCPExodusIIResultsArrayTemplate.h".}
type
  vtkCPExodusIIResultsArrayTemplateValueType* = ValueType

proc SetExodusScalarArrays*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[
    Scalar]; arrays: vector[ptr Scalar]; numTuples: vtkIdType) {.
    importcpp: "SetExodusScalarArrays",
    header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc SetExodusScalarArrays*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[
    Scalar]; arrays: vector[ptr Scalar]; numTuples: vtkIdType; save: bool) {.
    importcpp: "SetExodusScalarArrays",
    header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc Initialize*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar]) {.
    importcpp: "Initialize", header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc GetTuples*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar];
                       ptIds: ptr vtkIdList; output: ptr vtkAbstractArray) {.
    importcpp: "GetTuples", header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc GetTuples*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar];
                       p1: vtkIdType; p2: vtkIdType; output: ptr vtkAbstractArray) {.
    importcpp: "GetTuples", header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc Squeeze*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar]) {.
    importcpp: "Squeeze", header: "vtkCPExodusIIResultsArrayTemplate.h".}
## !!!Ignored construct:  * NewIterator ( ) override ;
## Error: identifier expected, but got: *!!!

proc LookupValue*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar];
                         value: vtkVariant): vtkIdType {.importcpp: "LookupValue",
    header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc LookupValue*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar];
                         value: vtkVariant; ids: ptr vtkIdList) {.
    importcpp: "LookupValue", header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc GetVariantValue*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar];
                             idx: vtkIdType): vtkVariant {.
    importcpp: "GetVariantValue", header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc ClearLookup*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar]) {.
    importcpp: "ClearLookup", header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc GetTuple*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar];
                      i: vtkIdType): ptr cdouble {.importcpp: "GetTuple",
    header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc GetTuple*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar];
                      i: vtkIdType; `tuple`: ptr cdouble) {.importcpp: "GetTuple",
    header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc LookupTypedValue*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar];
                              value: Scalar): vtkIdType {.
    importcpp: "LookupTypedValue", header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc LookupTypedValue*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar];
                              value: Scalar; ids: ptr vtkIdList) {.
    importcpp: "LookupTypedValue", header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc GetValue*[Scalar](this: vtkCPExodusIIResultsArrayTemplate[Scalar];
                      idx: vtkIdType): vtkCPExodusIIResultsArrayTemplateValueType {.
    noSideEffect, importcpp: "GetValue",
    header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc GetValueReference*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar];
                               idx: vtkIdType): var vtkCPExodusIIResultsArrayTemplateValueType {.
    importcpp: "GetValueReference", header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc GetTypedTuple*[Scalar](this: vtkCPExodusIIResultsArrayTemplate[Scalar];
                           idx: vtkIdType; t: ptr Scalar) {.noSideEffect,
    importcpp: "GetTypedTuple", header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc Allocate*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar];
                      sz: vtkIdType; ext: vtkIdType): vtkTypeBool {.
    importcpp: "Allocate", header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc Resize*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar];
                    numTuples: vtkIdType): vtkTypeBool {.importcpp: "Resize",
    header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc SetNumberOfTuples*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar];
                               number: vtkIdType) {.
    importcpp: "SetNumberOfTuples", header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc SetTuple*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar];
                      i: vtkIdType; j: vtkIdType; source: ptr vtkAbstractArray) {.
    importcpp: "SetTuple", header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc SetTuple*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar];
                      i: vtkIdType; source: ptr cfloat) {.importcpp: "SetTuple",
    header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc SetTuple*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar];
                      i: vtkIdType; source: ptr cdouble) {.importcpp: "SetTuple",
    header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc InsertTuple*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar];
                         i: vtkIdType; j: vtkIdType; source: ptr vtkAbstractArray) {.
    importcpp: "InsertTuple", header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc InsertTuple*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar];
                         i: vtkIdType; source: ptr cfloat) {.
    importcpp: "InsertTuple", header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc InsertTuple*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar];
                         i: vtkIdType; source: ptr cdouble) {.
    importcpp: "InsertTuple", header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc InsertTuples*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar];
                          dstIds: ptr vtkIdList; srcIds: ptr vtkIdList;
                          source: ptr vtkAbstractArray) {.
    importcpp: "InsertTuples", header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc InsertTuplesStartingAt*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[
    Scalar]; dstStart: vtkIdType; srcIds: ptr vtkIdList; source: ptr vtkAbstractArray) {.
    importcpp: "InsertTuplesStartingAt",
    header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc InsertTuples*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar];
                          dstStart: vtkIdType; n: vtkIdType; srcStart: vtkIdType;
                          source: ptr vtkAbstractArray) {.
    importcpp: "InsertTuples", header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc InsertNextTuple*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar];
                             j: vtkIdType; source: ptr vtkAbstractArray): vtkIdType {.
    importcpp: "InsertNextTuple", header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc InsertNextTuple*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar];
                             source: ptr cfloat): vtkIdType {.
    importcpp: "InsertNextTuple", header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc InsertNextTuple*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar];
                             source: ptr cdouble): vtkIdType {.
    importcpp: "InsertNextTuple", header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc DeepCopy*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar];
                      aa: ptr vtkAbstractArray) {.importcpp: "DeepCopy",
    header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc DeepCopy*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar];
                      da: ptr vtkDataArray) {.importcpp: "DeepCopy",
    header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc InterpolateTuple*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar];
                              i: vtkIdType; ptIndices: ptr vtkIdList;
                              source: ptr vtkAbstractArray; weights: ptr cdouble) {.
    importcpp: "InterpolateTuple", header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc InterpolateTuple*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar];
                              i: vtkIdType; id1: vtkIdType;
                              source1: ptr vtkAbstractArray; id2: vtkIdType;
                              source2: ptr vtkAbstractArray; t: cdouble) {.
    importcpp: "InterpolateTuple", header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc SetVariantValue*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar];
                             idx: vtkIdType; value: vtkVariant) {.
    importcpp: "SetVariantValue", header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc InsertVariantValue*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar];
                                idx: vtkIdType; value: vtkVariant) {.
    importcpp: "InsertVariantValue", header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc RemoveTuple*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar];
                         id: vtkIdType) {.importcpp: "RemoveTuple", header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc RemoveFirstTuple*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar]) {.
    importcpp: "RemoveFirstTuple", header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc RemoveLastTuple*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar]) {.
    importcpp: "RemoveLastTuple", header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc SetTypedTuple*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar];
                           i: vtkIdType; t: ptr Scalar) {.importcpp: "SetTypedTuple",
    header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc InsertTypedTuple*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar];
                              i: vtkIdType; t: ptr Scalar) {.
    importcpp: "InsertTypedTuple", header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc InsertNextTypedTuple*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[
    Scalar]; t: ptr Scalar): vtkIdType {.importcpp: "InsertNextTypedTuple", header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc SetValue*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar];
                      idx: vtkIdType; value: Scalar) {.importcpp: "SetValue",
    header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc InsertNextValue*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar];
                             v: Scalar): vtkIdType {.importcpp: "InsertNextValue",
    header: "vtkCPExodusIIResultsArrayTemplate.h".}
proc InsertValue*[Scalar](this: var vtkCPExodusIIResultsArrayTemplate[Scalar];
                         idx: vtkIdType; v: Scalar) {.importcpp: "InsertValue",
    header: "vtkCPExodusIIResultsArrayTemplate.h".}
import
  vtkCPExodusIIResultsArrayTemplate

##  VTK-HeaderTest-Exclude: vtkCPExodusIIResultsArrayTemplate.h
