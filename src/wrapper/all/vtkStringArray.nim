## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkStringArray.h
##   Language:  C++
##
##   Copyright 2004 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000, there is a non-exclusive
##   license for use of this work by or on behalf of the
##   U.S. Government. Redistribution and use in source and binary forms, with
##   or without modification, are permitted provided that this Notice and any
##   statement of authorship are reproduced on all copies.
##
## =========================================================================
## *
##  @class   vtkStringArray
##  @brief   a vtkAbstractArray subclass for strings
##
##  Points and cells may sometimes have associated data that are stored
##  as strings, e.g. labels for information visualization projects.
##  This class provides a clean way to store and access those strings.
##  @par Thanks:
##  Andy Wilson (atwilso@sandia.gov) wrote this class.
##

import
  vtkAbstractArray, vtkCommonCoreModule, vtkStdString

discard "forward decl of vtkStringArrayLookup"
type
  vtkStringArray* {.importcpp: "vtkStringArray", header: "vtkStringArray.h", bycopy.} = object of vtkAbstractArray
    vtkStringArray* {.importc: "vtkStringArray".}: VTK_NEWINSTANCE
    vtkArrayIterator* {.importc: "vtkArrayIterator".}: VTK_NEWINSTANCE
    ##  pointer to data

  vtkStringArrayDeleteMethod* {.size: sizeof(cint),
                               importcpp: "vtkStringArray::DeleteMethod",
                               header: "vtkStringArray.h".} = enum
    VTK_DATA_ARRAY_FREE = VTK_DATA_ARRAY_FREE,
    VTK_DATA_ARRAY_DELETE = VTK_DATA_ARRAY_DELETE,
    VTK_DATA_ARRAY_ALIGNED_FREE = VTK_DATA_ARRAY_ALIGNED_FREE,
    VTK_DATA_ARRAY_USER_DEFINED = VTK_DATA_ARRAY_USER_DEFINED


proc New*(): ptr vtkStringArray {.importcpp: "vtkStringArray::New(@)",
                              header: "vtkStringArray.h".}
proc ExtendedNew*(): ptr vtkStringArray {.importcpp: "vtkStringArray::ExtendedNew(@)",
                                      header: "vtkStringArray.h".}
type
  vtkStringArraySuperclass* = vtkAbstractArray

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkStringArray::IsTypeOf(@)", header: "vtkStringArray.h".}
proc IsA*(this: var vtkStringArray; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkStringArray.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkStringArray {.
    importcpp: "vtkStringArray::SafeDownCast(@)", header: "vtkStringArray.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkStringArray :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractArray :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkStringArray :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkStringArray :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkStringArray; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkStringArray.h".}
proc GetDataType*(this: vtkStringArray): cint {.noSideEffect,
    importcpp: "GetDataType", header: "vtkStringArray.h".}
proc IsNumeric*(this: vtkStringArray): cint {.noSideEffect, importcpp: "IsNumeric",
    header: "vtkStringArray.h".}
proc Initialize*(this: var vtkStringArray) {.importcpp: "Initialize",
    header: "vtkStringArray.h".}
proc GetDataTypeSize*(this: vtkStringArray): cint {.noSideEffect,
    importcpp: "GetDataTypeSize", header: "vtkStringArray.h".}
proc Squeeze*(this: var vtkStringArray) {.importcpp: "Squeeze",
                                      header: "vtkStringArray.h".}
proc Resize*(this: var vtkStringArray; numTuples: vtkIdType): vtkTypeBool {.
    importcpp: "Resize", header: "vtkStringArray.h".}
proc SetTuple*(this: var vtkStringArray; i: vtkIdType; j: vtkIdType;
              source: ptr vtkAbstractArray) {.importcpp: "SetTuple",
    header: "vtkStringArray.h".}
proc InsertTuple*(this: var vtkStringArray; i: vtkIdType; j: vtkIdType;
                 source: ptr vtkAbstractArray) {.importcpp: "InsertTuple",
    header: "vtkStringArray.h".}
proc InsertTuples*(this: var vtkStringArray; dstIds: ptr vtkIdList;
                  srcIds: ptr vtkIdList; source: ptr vtkAbstractArray) {.
    importcpp: "InsertTuples", header: "vtkStringArray.h".}
proc InsertTuplesStartingAt*(this: var vtkStringArray; dstStart: vtkIdType;
                            srcIds: ptr vtkIdList; source: ptr vtkAbstractArray) {.
    importcpp: "InsertTuplesStartingAt", header: "vtkStringArray.h".}
proc InsertTuples*(this: var vtkStringArray; dstStart: vtkIdType; n: vtkIdType;
                  srcStart: vtkIdType; source: ptr vtkAbstractArray) {.
    importcpp: "InsertTuples", header: "vtkStringArray.h".}
proc InsertNextTuple*(this: var vtkStringArray; j: vtkIdType;
                     source: ptr vtkAbstractArray): vtkIdType {.
    importcpp: "InsertNextTuple", header: "vtkStringArray.h".}
proc InterpolateTuple*(this: var vtkStringArray; i: vtkIdType;
                      ptIndices: ptr vtkIdList; source: ptr vtkAbstractArray;
                      weights: ptr cdouble) {.importcpp: "InterpolateTuple",
    header: "vtkStringArray.h".}
proc InterpolateTuple*(this: var vtkStringArray; i: vtkIdType; id1: vtkIdType;
                      source1: ptr vtkAbstractArray; id2: vtkIdType;
                      source2: ptr vtkAbstractArray; t: cdouble) {.
    importcpp: "InterpolateTuple", header: "vtkStringArray.h".}
proc GetTuples*(this: var vtkStringArray; ptIds: ptr vtkIdList;
               output: ptr vtkAbstractArray) {.importcpp: "GetTuples",
    header: "vtkStringArray.h".}
proc GetTuples*(this: var vtkStringArray; p1: vtkIdType; p2: vtkIdType;
               output: ptr vtkAbstractArray) {.importcpp: "GetTuples",
    header: "vtkStringArray.h".}
proc Allocate*(this: var vtkStringArray; sz: vtkIdType; ext: vtkIdType = 1000): vtkTypeBool {.
    importcpp: "Allocate", header: "vtkStringArray.h".}
## !!!Ignored construct:  *
##  Read-access of string at a particular index.
##  const vtkStdString & GetValue ( vtkIdType id ) const VTK_EXPECTS ( 0 <= id && id < this -> GetNumberOfValues ( ) ) ;
## Error: expected ';'!!!

## !!!Ignored construct:  *
##  Get the string at a particular index.
##  vtkStdString & GetValue ( vtkIdType id ) VTK_EXPECTS ( 0 <= id && id < this -> GetNumberOfValues ( ) ) ;
## Error: expected ';'!!!

## !!!Ignored construct:  *
##  Set the data at a particular index. Does not do range checking. Make sure
##  you use the method SetNumberOfValues() before inserting data.
##  void SetValue ( vtkIdType id , vtkStdString value ) VTK_EXPECTS ( 0 <= id && id < this -> GetNumberOfValues ( ) ) { this -> Array [ id ] = value ; this -> DataChanged ( ) ; } void SetValue ( vtkIdType id , const char * value ) VTK_EXPECTS ( 0 <= id && id < this -> GetNumberOfValues ( ) ) VTK_EXPECTS ( value != nullptr ) ;
## Error: expected ';'!!!

proc SetNumberOfTuples*(this: var vtkStringArray; number: vtkIdType) {.
    importcpp: "SetNumberOfTuples", header: "vtkStringArray.h".}
proc GetNumberOfValues*(this: vtkStringArray): vtkIdType {.noSideEffect,
    importcpp: "GetNumberOfValues", header: "vtkStringArray.h".}
proc GetNumberOfElementComponents*(this: var vtkStringArray): cint {.
    importcpp: "GetNumberOfElementComponents", header: "vtkStringArray.h".}
proc GetElementComponentSize*(this: vtkStringArray): cint {.noSideEffect,
    importcpp: "GetElementComponentSize", header: "vtkStringArray.h".}
## !!!Ignored construct:  *
##  Insert data at a specified position in the array.
##  void InsertValue ( vtkIdType id , vtkStdString f ) VTK_EXPECTS ( 0 <= id ) ;
## Error: expected ';'!!!

## !!!Ignored construct:  void InsertValue ( vtkIdType id , const char * val ) VTK_EXPECTS ( 0 <= id ) VTK_EXPECTS ( val != nullptr ) ;
## Error: expected ';'!!!

proc SetVariantValue*(this: var vtkStringArray; idx: vtkIdType; value: vtkVariant) {.
    importcpp: "SetVariantValue", header: "vtkStringArray.h".}
proc InsertVariantValue*(this: var vtkStringArray; idx: vtkIdType; value: vtkVariant) {.
    importcpp: "InsertVariantValue", header: "vtkStringArray.h".}
proc InsertNextValue*(this: var vtkStringArray; f: vtkStdString): vtkIdType {.
    importcpp: "InsertNextValue", header: "vtkStringArray.h".}
## !!!Ignored construct:  vtkIdType InsertNextValue ( const char * f ) VTK_EXPECTS ( f != nullptr ) ;
## Error: expected ';'!!!

proc WritePointer*(this: var vtkStringArray; id: vtkIdType; number: vtkIdType): ptr vtkStdString {.
    importcpp: "WritePointer", header: "vtkStringArray.h".}
proc GetPointer*(this: var vtkStringArray; id: vtkIdType): ptr vtkStdString {.
    importcpp: "GetPointer", header: "vtkStringArray.h".}
proc GetVoidPointer*(this: var vtkStringArray; id: vtkIdType): pointer {.
    importcpp: "GetVoidPointer", header: "vtkStringArray.h".}
proc DeepCopy*(this: var vtkStringArray; aa: ptr vtkAbstractArray) {.
    importcpp: "DeepCopy", header: "vtkStringArray.h".}
proc SetArray*(this: var vtkStringArray; array: ptr vtkStdString; size: vtkIdType;
              save: cint; deleteMethod: cint = VTK_DATA_ARRAY_DELETE) {.
    importcpp: "SetArray", header: "vtkStringArray.h".}
proc SetVoidArray*(this: var vtkStringArray; array: pointer; size: vtkIdType; save: cint) {.
    importcpp: "SetVoidArray", header: "vtkStringArray.h".}
proc SetVoidArray*(this: var vtkStringArray; array: pointer; size: vtkIdType;
                  save: cint; deleteMethod: cint) {.importcpp: "SetVoidArray",
    header: "vtkStringArray.h".}
proc SetArrayFreeFunction*(this: var vtkStringArray; callback: proc (a1: pointer)) {.
    importcpp: "SetArrayFreeFunction", header: "vtkStringArray.h".}
proc GetActualMemorySize*(this: vtkStringArray): culong {.noSideEffect,
    importcpp: "GetActualMemorySize", header: "vtkStringArray.h".}
## !!!Ignored construct:  * NewIterator ( ) override ;
## Error: identifier expected, but got: *!!!

proc GetDataSize*(this: vtkStringArray): vtkIdType {.noSideEffect,
    importcpp: "GetDataSize", header: "vtkStringArray.h".}
proc LookupValue*(this: var vtkStringArray; value: vtkVariant): vtkIdType {.
    importcpp: "LookupValue", header: "vtkStringArray.h".}
proc LookupValue*(this: var vtkStringArray; value: vtkVariant; ids: ptr vtkIdList) {.
    importcpp: "LookupValue", header: "vtkStringArray.h".}
proc LookupValue*(this: var vtkStringArray; value: vtkStdString): vtkIdType {.
    importcpp: "LookupValue", header: "vtkStringArray.h".}
proc LookupValue*(this: var vtkStringArray; value: vtkStdString; ids: ptr vtkIdList) {.
    importcpp: "LookupValue", header: "vtkStringArray.h".}
proc LookupValue*(this: var vtkStringArray; value: cstring): vtkIdType {.
    importcpp: "LookupValue", header: "vtkStringArray.h".}
proc LookupValue*(this: var vtkStringArray; value: cstring; ids: ptr vtkIdList) {.
    importcpp: "LookupValue", header: "vtkStringArray.h".}
proc DataChanged*(this: var vtkStringArray) {.importcpp: "DataChanged",
    header: "vtkStringArray.h".}
proc DataElementChanged*(this: var vtkStringArray; id: vtkIdType) {.
    importcpp: "DataElementChanged", header: "vtkStringArray.h".}
proc ClearLookup*(this: var vtkStringArray) {.importcpp: "ClearLookup",
    header: "vtkStringArray.h".}