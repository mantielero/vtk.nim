## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCPExodusIINodalCoordinatesTemplate.h
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
##  @class   vtkCPExodusIINodalCoordinatesTemplate
##  @brief   Map native Exodus II coordinate
##  arrays into the vtkDataArray interface.
##
##
##  Map native Exodus II coordinate arrays into the vtkDataArray interface. Use
##  the vtkCPExodusIIInSituReader to read an Exodus II file's data into this
##  structure.
##

import
  vtkIOExodusModule, vtkMappedDataArray, vtkObjectFactory

type
  vtkCPExodusIINodalCoordinatesTemplate*[Scalar] {.
      importcpp: "vtkCPExodusIINodalCoordinatesTemplate<\'0>",
      header: "vtkCPExodusIINodalCoordinatesTemplate.h", bycopy.} = object of vtkMappedDataArray[
      Scalar]
    vtkCPExodusIINodalCoordinatesTemplate*
        {.importc: "vtkCPExodusIINodalCoordinatesTemplate".}: VTK_NEWINSTANCE
    vtkArrayIterator* {.importc: "vtkArrayIterator".}: VTK_NEWINSTANCE

  vtkCPExodusIINodalCoordinatesTemplateSuperclass* = vtkMappedDataArray[Scalar]

proc IsTypeOf*[Scalar](`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCPExodusIINodalCoordinatesTemplate::IsTypeOf(@)",
    header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc IsA*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[Scalar];
                 `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc SafeDownCast*[Scalar](o: ptr vtkObjectBase): ptr vtkCPExodusIINodalCoordinatesTemplate[
    Scalar] {.importcpp: "vtkCPExodusIINodalCoordinatesTemplate::SafeDownCast(@)",
             header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
## !!!Ignored construct:  < Scalar > * NewInstance ( ) const { return vtkCPExodusIINodalCoordinatesTemplate < Scalar > :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( typeid ( vtkCPExodusIINodalCoordinatesTemplate < Scalar > ) . name ( ) , type ) ) { return 0 ; } return 1 + vtkMappedDataArray < Scalar > :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCPExodusIINodalCoordinatesTemplate < Scalar > :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : vtkMappedDataArrayNewInstanceMacro ( vtkCPExodusIINodalCoordinatesTemplate < Scalar > ) static vtkCPExodusIINodalCoordinatesTemplate * New ( ) ;
## Error: identifier expected, but got: <!!!

proc PrintSelf*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[Scalar];
                       os: var ostream; indent: vtkIndent) {.importcpp: "PrintSelf",
    header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
type
  vtkCPExodusIINodalCoordinatesTemplateValueType* = ValueType

proc SetExodusScalarArrays*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[
    Scalar]; x: ptr Scalar; y: ptr Scalar; z: ptr Scalar; numPoints: vtkIdType) {.
    importcpp: "SetExodusScalarArrays",
    header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc Initialize*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[Scalar]) {.
    importcpp: "Initialize", header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc GetTuples*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[Scalar];
                       ptIds: ptr vtkIdList; output: ptr vtkAbstractArray) {.
    importcpp: "GetTuples", header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc GetTuples*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[Scalar];
                       p1: vtkIdType; p2: vtkIdType; output: ptr vtkAbstractArray) {.
    importcpp: "GetTuples", header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc Squeeze*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[Scalar]) {.
    importcpp: "Squeeze", header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
## !!!Ignored construct:  * NewIterator ( ) override ;
## Error: identifier expected, but got: *!!!

proc LookupValue*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[Scalar];
                         value: vtkVariant): vtkIdType {.importcpp: "LookupValue",
    header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc LookupValue*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[Scalar];
                         value: vtkVariant; ids: ptr vtkIdList) {.
    importcpp: "LookupValue", header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc GetVariantValue*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[
    Scalar]; idx: vtkIdType): vtkVariant {.importcpp: "GetVariantValue", header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc ClearLookup*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[Scalar]) {.
    importcpp: "ClearLookup", header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc GetTuple*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[Scalar];
                      i: vtkIdType): ptr cdouble {.importcpp: "GetTuple",
    header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc GetTuple*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[Scalar];
                      i: vtkIdType; `tuple`: ptr cdouble) {.importcpp: "GetTuple",
    header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc LookupTypedValue*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[
    Scalar]; value: Scalar): vtkIdType {.importcpp: "LookupTypedValue", header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc LookupTypedValue*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[
    Scalar]; value: Scalar; ids: ptr vtkIdList) {.importcpp: "LookupTypedValue",
    header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc GetValue*[Scalar](this: vtkCPExodusIINodalCoordinatesTemplate[Scalar];
                      idx: vtkIdType): vtkCPExodusIINodalCoordinatesTemplateValueType {.
    noSideEffect, importcpp: "GetValue",
    header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc GetValueReference*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[
    Scalar]; idx: vtkIdType): var vtkCPExodusIINodalCoordinatesTemplateValueType {.
    importcpp: "GetValueReference",
    header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc GetTypedTuple*[Scalar](this: vtkCPExodusIINodalCoordinatesTemplate[Scalar];
                           idx: vtkIdType; t: ptr Scalar) {.noSideEffect,
    importcpp: "GetTypedTuple", header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc Allocate*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[Scalar];
                      sz: vtkIdType; ext: vtkIdType): vtkTypeBool {.
    importcpp: "Allocate", header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc Resize*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[Scalar];
                    numTuples: vtkIdType): vtkTypeBool {.importcpp: "Resize",
    header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc SetNumberOfTuples*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[
    Scalar]; number: vtkIdType) {.importcpp: "SetNumberOfTuples", header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc SetTuple*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[Scalar];
                      i: vtkIdType; j: vtkIdType; source: ptr vtkAbstractArray) {.
    importcpp: "SetTuple", header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc SetTuple*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[Scalar];
                      i: vtkIdType; source: ptr cfloat) {.importcpp: "SetTuple",
    header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc SetTuple*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[Scalar];
                      i: vtkIdType; source: ptr cdouble) {.importcpp: "SetTuple",
    header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc InsertTuple*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[Scalar];
                         i: vtkIdType; j: vtkIdType; source: ptr vtkAbstractArray) {.
    importcpp: "InsertTuple", header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc InsertTuple*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[Scalar];
                         i: vtkIdType; source: ptr cfloat) {.
    importcpp: "InsertTuple", header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc InsertTuple*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[Scalar];
                         i: vtkIdType; source: ptr cdouble) {.
    importcpp: "InsertTuple", header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc InsertTuples*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[Scalar];
                          dstIds: ptr vtkIdList; srcIds: ptr vtkIdList;
                          source: ptr vtkAbstractArray) {.
    importcpp: "InsertTuples", header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc InsertTuplesStartingAt*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[
    Scalar]; dstStart: vtkIdType; srcIds: ptr vtkIdList; source: ptr vtkAbstractArray) {.
    importcpp: "InsertTuplesStartingAt",
    header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc InsertTuples*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[Scalar];
                          dstStart: vtkIdType; n: vtkIdType; srcStart: vtkIdType;
                          source: ptr vtkAbstractArray) {.
    importcpp: "InsertTuples", header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc InsertNextTuple*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[
    Scalar]; j: vtkIdType; source: ptr vtkAbstractArray): vtkIdType {.
    importcpp: "InsertNextTuple",
    header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc InsertNextTuple*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[
    Scalar]; source: ptr cfloat): vtkIdType {.importcpp: "InsertNextTuple",
    header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc InsertNextTuple*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[
    Scalar]; source: ptr cdouble): vtkIdType {.importcpp: "InsertNextTuple",
    header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc DeepCopy*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[Scalar];
                      aa: ptr vtkAbstractArray) {.importcpp: "DeepCopy",
    header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc DeepCopy*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[Scalar];
                      da: ptr vtkDataArray) {.importcpp: "DeepCopy",
    header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc InterpolateTuple*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[
    Scalar]; i: vtkIdType; ptIndices: ptr vtkIdList; source: ptr vtkAbstractArray;
                              weights: ptr cdouble) {.
    importcpp: "InterpolateTuple",
    header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc InterpolateTuple*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[
    Scalar]; i: vtkIdType; id1: vtkIdType; source1: ptr vtkAbstractArray;
                              id2: vtkIdType; source2: ptr vtkAbstractArray;
                              t: cdouble) {.importcpp: "InterpolateTuple",
    header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc SetVariantValue*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[
    Scalar]; idx: vtkIdType; value: vtkVariant) {.importcpp: "SetVariantValue",
    header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc InsertVariantValue*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[
    Scalar]; idx: vtkIdType; value: vtkVariant) {.importcpp: "InsertVariantValue",
    header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc RemoveTuple*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[Scalar];
                         id: vtkIdType) {.importcpp: "RemoveTuple", header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc RemoveFirstTuple*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[
    Scalar]) {.importcpp: "RemoveFirstTuple",
              header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc RemoveLastTuple*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[
    Scalar]) {.importcpp: "RemoveLastTuple",
              header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc SetTypedTuple*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[Scalar];
                           i: vtkIdType; t: ptr Scalar) {.importcpp: "SetTypedTuple",
    header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc InsertTypedTuple*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[
    Scalar]; i: vtkIdType; t: ptr Scalar) {.importcpp: "InsertTypedTuple", header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc InsertNextTypedTuple*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[
    Scalar]; t: ptr Scalar): vtkIdType {.importcpp: "InsertNextTypedTuple", header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc SetValue*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[Scalar];
                      idx: vtkIdType; value: Scalar) {.importcpp: "SetValue",
    header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc InsertNextValue*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[
    Scalar]; v: Scalar): vtkIdType {.importcpp: "InsertNextValue", header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
proc InsertValue*[Scalar](this: var vtkCPExodusIINodalCoordinatesTemplate[Scalar];
                         idx: vtkIdType; v: Scalar) {.importcpp: "InsertValue",
    header: "vtkCPExodusIINodalCoordinatesTemplate.h".}
import
  vtkCPExodusIINodalCoordinatesTemplate

##  VTK-HeaderTest-Exclude: vtkCPExodusIINodalCoordinatesTemplate.h
