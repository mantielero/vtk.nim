## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPoints2D.h
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
##  @class   vtkPoints2D
##  @brief   represent and manipulate 2D points
##
##  vtkPoints2D represents 2D points. The data model for vtkPoints2D is an
##  array of vx-vy doublets accessible by (point or cell) id.
##

import
  vtkCommonCoreModule, vtkObject, vtkDataArray

discard "forward decl of vtkIdList"
type
  vtkPoints2D* {.importcpp: "vtkPoints2D", header: "vtkPoints2D.h", bycopy.} = object of vtkObject
    vtkPoints2D* {.importc: "vtkPoints2D".}: VTK_NEWINSTANCE
    ##  Time at which bounds computed
    ##  Array which represents data


proc New*(dataType: cint): ptr vtkPoints2D {.importcpp: "vtkPoints2D::New(@)",
                                        header: "vtkPoints2D.h".}
proc New*(): ptr vtkPoints2D {.importcpp: "vtkPoints2D::New(@)",
                           header: "vtkPoints2D.h".}
type
  vtkPoints2DSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPoints2D::IsTypeOf(@)", header: "vtkPoints2D.h".}
proc IsA*(this: var vtkPoints2D; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkPoints2D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPoints2D {.
    importcpp: "vtkPoints2D::SafeDownCast(@)", header: "vtkPoints2D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPoints2D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPoints2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPoints2D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPoints2D; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPoints2D.h".}
proc Allocate*(this: var vtkPoints2D; sz: vtkIdType; ext: vtkIdType = 1000): vtkTypeBool {.
    importcpp: "Allocate", header: "vtkPoints2D.h".}
proc Initialize*(this: var vtkPoints2D) {.importcpp: "Initialize",
                                      header: "vtkPoints2D.h".}
proc SetData*(this: var vtkPoints2D; a2: ptr vtkDataArray) {.importcpp: "SetData",
    header: "vtkPoints2D.h".}
proc GetData*(this: var vtkPoints2D): ptr vtkDataArray {.importcpp: "GetData",
    header: "vtkPoints2D.h".}
proc GetDataType*(this: vtkPoints2D): cint {.noSideEffect, importcpp: "GetDataType",
    header: "vtkPoints2D.h".}
proc SetDataType*(this: var vtkPoints2D; dataType: cint) {.importcpp: "SetDataType",
    header: "vtkPoints2D.h".}
proc SetDataTypeToBit*(this: var vtkPoints2D) {.importcpp: "SetDataTypeToBit",
    header: "vtkPoints2D.h".}
proc SetDataTypeToChar*(this: var vtkPoints2D) {.importcpp: "SetDataTypeToChar",
    header: "vtkPoints2D.h".}
proc SetDataTypeToUnsignedChar*(this: var vtkPoints2D) {.
    importcpp: "SetDataTypeToUnsignedChar", header: "vtkPoints2D.h".}
proc SetDataTypeToShort*(this: var vtkPoints2D) {.importcpp: "SetDataTypeToShort",
    header: "vtkPoints2D.h".}
proc SetDataTypeToUnsignedShort*(this: var vtkPoints2D) {.
    importcpp: "SetDataTypeToUnsignedShort", header: "vtkPoints2D.h".}
proc SetDataTypeToInt*(this: var vtkPoints2D) {.importcpp: "SetDataTypeToInt",
    header: "vtkPoints2D.h".}
proc SetDataTypeToUnsignedInt*(this: var vtkPoints2D) {.
    importcpp: "SetDataTypeToUnsignedInt", header: "vtkPoints2D.h".}
proc SetDataTypeToLong*(this: var vtkPoints2D) {.importcpp: "SetDataTypeToLong",
    header: "vtkPoints2D.h".}
proc SetDataTypeToUnsignedLong*(this: var vtkPoints2D) {.
    importcpp: "SetDataTypeToUnsignedLong", header: "vtkPoints2D.h".}
proc SetDataTypeToFloat*(this: var vtkPoints2D) {.importcpp: "SetDataTypeToFloat",
    header: "vtkPoints2D.h".}
proc SetDataTypeToDouble*(this: var vtkPoints2D) {.importcpp: "SetDataTypeToDouble",
    header: "vtkPoints2D.h".}
proc GetVoidPointer*(this: var vtkPoints2D; id: cint): pointer {.
    importcpp: "GetVoidPointer", header: "vtkPoints2D.h".}
proc Squeeze*(this: var vtkPoints2D) {.importcpp: "Squeeze", header: "vtkPoints2D.h".}
proc Reset*(this: var vtkPoints2D) {.importcpp: "Reset", header: "vtkPoints2D.h".}
proc DeepCopy*(this: var vtkPoints2D; ad: ptr vtkPoints2D) {.importcpp: "DeepCopy",
    header: "vtkPoints2D.h".}
proc ShallowCopy*(this: var vtkPoints2D; ad: ptr vtkPoints2D) {.
    importcpp: "ShallowCopy", header: "vtkPoints2D.h".}
proc GetActualMemorySize*(this: var vtkPoints2D): culong {.
    importcpp: "GetActualMemorySize", header: "vtkPoints2D.h".}
proc GetNumberOfPoints*(this: vtkPoints2D): vtkIdType {.noSideEffect,
    importcpp: "GetNumberOfPoints", header: "vtkPoints2D.h".}
## !!!Ignored construct:  *
##  Return a pointer to a double point x[2] for a specific id.
##  WARNING: Just don't use this error-prone method, the returned pointer
##  and its values are only valid as long as another method invocation is not
##  performed. Prefer GetPoint() with the return value in argument.
##  double * GetPoint ( vtkIdType id ) VTK_SIZEHINT ( 2 ) { return this -> Data -> GetTuple ( id ) ; } *
##  Copy point components into user provided array v[2] for specified id.
##  void GetPoint ( vtkIdType id , double x [ 2 ] ) { this -> Data -> GetTuple ( id , x ) ; } *
##  Insert point into object. No range checking performed (fast!).
##  Make sure you use SetNumberOfPoints() to allocate memory prior
##  to using SetPoint().
##  void SetPoint ( vtkIdType id , const float x [ 2 ] ) { this -> Data -> SetTuple ( id , x ) ; } void SetPoint ( vtkIdType id , const double x [ 2 ] ) { this -> Data -> SetTuple ( id , x ) ; } void SetPoint ( vtkIdType id , double x , double y ) ;
## Error: expected ';'!!!

proc InsertPoint*(this: var vtkPoints2D; id: vtkIdType; x: array[2, cfloat]) {.
    importcpp: "InsertPoint", header: "vtkPoints2D.h".}
proc InsertPoint*(this: var vtkPoints2D; id: vtkIdType; x: array[2, cdouble]) {.
    importcpp: "InsertPoint", header: "vtkPoints2D.h".}
proc InsertPoint*(this: var vtkPoints2D; id: vtkIdType; x: cdouble; y: cdouble) {.
    importcpp: "InsertPoint", header: "vtkPoints2D.h".}
proc InsertNextPoint*(this: var vtkPoints2D; x: array[2, cfloat]): vtkIdType {.
    importcpp: "InsertNextPoint", header: "vtkPoints2D.h".}
proc InsertNextPoint*(this: var vtkPoints2D; x: array[2, cdouble]): vtkIdType {.
    importcpp: "InsertNextPoint", header: "vtkPoints2D.h".}
proc InsertNextPoint*(this: var vtkPoints2D; x: cdouble; y: cdouble): vtkIdType {.
    importcpp: "InsertNextPoint", header: "vtkPoints2D.h".}
proc RemovePoint*(this: var vtkPoints2D; id: vtkIdType) {.importcpp: "RemovePoint",
    header: "vtkPoints2D.h".}
proc SetNumberOfPoints*(this: var vtkPoints2D; numPoints: vtkIdType) {.
    importcpp: "SetNumberOfPoints", header: "vtkPoints2D.h".}
proc Resize*(this: var vtkPoints2D; numPoints: vtkIdType): vtkTypeBool {.
    importcpp: "Resize", header: "vtkPoints2D.h".}
proc GetPoints*(this: var vtkPoints2D; ptId: ptr vtkIdList; fp: ptr vtkPoints2D) {.
    importcpp: "GetPoints", header: "vtkPoints2D.h".}
proc ComputeBounds*(this: var vtkPoints2D) {.importcpp: "ComputeBounds",
    header: "vtkPoints2D.h".}
## !!!Ignored construct:  *
##  Return the bounds of the points.
##  double * GetBounds ( ) VTK_SIZEHINT ( 4 ) ;
## Error: expected ';'!!!

proc GetBounds*(this: var vtkPoints2D; bounds: array[4, cdouble]) {.
    importcpp: "GetBounds", header: "vtkPoints2D.h".}
proc Reset*(this: var vtkPoints2D) {.importcpp: "Reset", header: "vtkPoints2D.h".}
proc SetNumberOfPoints*(this: var vtkPoints2D; numPoints: vtkIdType) {.
    importcpp: "SetNumberOfPoints", header: "vtkPoints2D.h".}
proc Resize*(this: var vtkPoints2D; numPoints: vtkIdType): vtkTypeBool {.
    importcpp: "Resize", header: "vtkPoints2D.h".}
proc SetPoint*(this: var vtkPoints2D; id: vtkIdType; x: cdouble; y: cdouble) {.
    importcpp: "SetPoint", header: "vtkPoints2D.h".}
proc InsertPoint*(this: var vtkPoints2D; id: vtkIdType; x: cdouble; y: cdouble) {.
    importcpp: "InsertPoint", header: "vtkPoints2D.h".}
proc InsertNextPoint*(this: var vtkPoints2D; x: cdouble; y: cdouble): vtkIdType {.
    importcpp: "InsertNextPoint", header: "vtkPoints2D.h".}