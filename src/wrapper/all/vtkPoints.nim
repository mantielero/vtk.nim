## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPoints.h
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
##  @class   vtkPoints
##  @brief   represent and manipulate 3D points
##
##  vtkPoints represents 3D points. The data model for vtkPoints is an
##  array of vx-vy-vz triplets accessible by (point or cell) id.
##

import
  vtkCommonCoreModule, vtkObject, vtkDataArray

discard "forward decl of vtkIdList"
type
  vtkPoints* {.importcpp: "vtkPoints", header: "vtkPoints.h", bycopy.} = object of vtkObject
    vtkPoints* {.importc: "vtkPoints".}: VTK_NEWINSTANCE
    ##  Time at which bounds computed
    ##  Array which represents data


proc New*(dataType: cint): ptr vtkPoints {.importcpp: "vtkPoints::New(@)",
                                      header: "vtkPoints.h".}
proc New*(): ptr vtkPoints {.importcpp: "vtkPoints::New(@)", header: "vtkPoints.h".}
type
  vtkPointsSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkPoints::IsTypeOf(@)",
    header: "vtkPoints.h".}
proc IsA*(this: var vtkPoints; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkPoints.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPoints {.
    importcpp: "vtkPoints::SafeDownCast(@)", header: "vtkPoints.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPoints :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPoints :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPoints :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPoints; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPoints.h".}
proc Allocate*(this: var vtkPoints; sz: vtkIdType; ext: vtkIdType = 1000): vtkTypeBool {.
    importcpp: "Allocate", header: "vtkPoints.h".}
proc Initialize*(this: var vtkPoints) {.importcpp: "Initialize", header: "vtkPoints.h".}
proc SetData*(this: var vtkPoints; a2: ptr vtkDataArray) {.importcpp: "SetData",
    header: "vtkPoints.h".}
proc GetData*(this: var vtkPoints): ptr vtkDataArray {.importcpp: "GetData",
    header: "vtkPoints.h".}
proc GetDataType*(this: vtkPoints): cint {.noSideEffect, importcpp: "GetDataType",
                                       header: "vtkPoints.h".}
proc SetDataType*(this: var vtkPoints; dataType: cint) {.importcpp: "SetDataType",
    header: "vtkPoints.h".}
proc SetDataTypeToBit*(this: var vtkPoints) {.importcpp: "SetDataTypeToBit",
    header: "vtkPoints.h".}
proc SetDataTypeToChar*(this: var vtkPoints) {.importcpp: "SetDataTypeToChar",
    header: "vtkPoints.h".}
proc SetDataTypeToUnsignedChar*(this: var vtkPoints) {.
    importcpp: "SetDataTypeToUnsignedChar", header: "vtkPoints.h".}
proc SetDataTypeToShort*(this: var vtkPoints) {.importcpp: "SetDataTypeToShort",
    header: "vtkPoints.h".}
proc SetDataTypeToUnsignedShort*(this: var vtkPoints) {.
    importcpp: "SetDataTypeToUnsignedShort", header: "vtkPoints.h".}
proc SetDataTypeToInt*(this: var vtkPoints) {.importcpp: "SetDataTypeToInt",
    header: "vtkPoints.h".}
proc SetDataTypeToUnsignedInt*(this: var vtkPoints) {.
    importcpp: "SetDataTypeToUnsignedInt", header: "vtkPoints.h".}
proc SetDataTypeToLong*(this: var vtkPoints) {.importcpp: "SetDataTypeToLong",
    header: "vtkPoints.h".}
proc SetDataTypeToUnsignedLong*(this: var vtkPoints) {.
    importcpp: "SetDataTypeToUnsignedLong", header: "vtkPoints.h".}
proc SetDataTypeToFloat*(this: var vtkPoints) {.importcpp: "SetDataTypeToFloat",
    header: "vtkPoints.h".}
proc SetDataTypeToDouble*(this: var vtkPoints) {.importcpp: "SetDataTypeToDouble",
    header: "vtkPoints.h".}
proc GetVoidPointer*(this: var vtkPoints; id: cint): pointer {.
    importcpp: "GetVoidPointer", header: "vtkPoints.h".}
proc Squeeze*(this: var vtkPoints) {.importcpp: "Squeeze", header: "vtkPoints.h".}
proc Reset*(this: var vtkPoints) {.importcpp: "Reset", header: "vtkPoints.h".}
proc DeepCopy*(this: var vtkPoints; ad: ptr vtkPoints) {.importcpp: "DeepCopy",
    header: "vtkPoints.h".}
proc ShallowCopy*(this: var vtkPoints; ad: ptr vtkPoints) {.importcpp: "ShallowCopy",
    header: "vtkPoints.h".}
proc GetActualMemorySize*(this: var vtkPoints): culong {.
    importcpp: "GetActualMemorySize", header: "vtkPoints.h".}
proc GetNumberOfPoints*(this: vtkPoints): vtkIdType {.noSideEffect,
    importcpp: "GetNumberOfPoints", header: "vtkPoints.h".}
## !!!Ignored construct:  *
##  Return a pointer to a double point x[3] for a specific id.
##  WARNING: Just don't use this error-prone method, the returned pointer
##  and its values are only valid as long as another method invocation is not
##  performed. Prefer GetPoint() with the return value in argument.
##  double * GetPoint ( vtkIdType id ) VTK_EXPECTS ( 0 <= id && id < GetNumberOfPoints ( ) ) VTK_SIZEHINT ( 3 ) { return this -> Data -> GetTuple ( id ) ; } *
##  Copy point components into user provided array v[3] for specified
##  id.
##  void GetPoint ( vtkIdType id , double x [ 3 ] ) VTK_EXPECTS ( 0 <= id && id < GetNumberOfPoints ( ) ) VTK_SIZEHINT ( 3 ) { this -> Data -> GetTuple ( id , x ) ; } *
##  Insert point into object. No range checking performed (fast!).
##  Make sure you use SetNumberOfPoints() to allocate memory prior
##  to using SetPoint(). You should call Modified() finally after
##  changing points using this method as it will not do it itself.
##  void SetPoint ( vtkIdType id , const float x [ 3 ] ) VTK_EXPECTS ( 0 <= id && id < GetNumberOfPoints ( ) ) { this -> Data -> SetTuple ( id , x ) ; } void SetPoint ( vtkIdType id , const double x [ 3 ] ) VTK_EXPECTS ( 0 <= id && id < GetNumberOfPoints ( ) ) { this -> Data -> SetTuple ( id , x ) ; } void SetPoint ( vtkIdType id , double x , double y , double z ) VTK_EXPECTS ( 0 <= id && id < GetNumberOfPoints ( ) ) ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@{ *
##  Insert point into object. Range checking performed and memory
##  allocated as necessary.
##  void InsertPoint ( vtkIdType id , const float x [ 3 ] ) VTK_EXPECTS ( 0 <= id ) { this -> Data -> InsertTuple ( id , x ) ; } void InsertPoint ( vtkIdType id , const double x [ 3 ] ) VTK_EXPECTS ( 0 <= id ) { this -> Data -> InsertTuple ( id , x ) ; } void InsertPoint ( vtkIdType id , double x , double y , double z ) VTK_EXPECTS ( 0 <= id ) ;
## Error: expected ';'!!!

proc InsertPoints*(this: var vtkPoints; dstIds: ptr vtkIdList; srcIds: ptr vtkIdList;
                  source: ptr vtkPoints) {.importcpp: "InsertPoints",
                                        header: "vtkPoints.h".}
proc InsertPoints*(this: var vtkPoints; dstStart: vtkIdType; n: vtkIdType;
                  srcStart: vtkIdType; source: ptr vtkPoints) {.
    importcpp: "InsertPoints", header: "vtkPoints.h".}
proc InsertNextPoint*(this: var vtkPoints; x: array[3, cfloat]): vtkIdType {.
    importcpp: "InsertNextPoint", header: "vtkPoints.h".}
proc InsertNextPoint*(this: var vtkPoints; x: array[3, cdouble]): vtkIdType {.
    importcpp: "InsertNextPoint", header: "vtkPoints.h".}
proc InsertNextPoint*(this: var vtkPoints; x: cdouble; y: cdouble; z: cdouble): vtkIdType {.
    importcpp: "InsertNextPoint", header: "vtkPoints.h".}
proc SetNumberOfPoints*(this: var vtkPoints; numPoints: vtkIdType) {.
    importcpp: "SetNumberOfPoints", header: "vtkPoints.h".}
proc Resize*(this: var vtkPoints; numPoints: vtkIdType): vtkTypeBool {.
    importcpp: "Resize", header: "vtkPoints.h".}
proc GetPoints*(this: var vtkPoints; ptId: ptr vtkIdList; outPoints: ptr vtkPoints) {.
    importcpp: "GetPoints", header: "vtkPoints.h".}
proc ComputeBounds*(this: var vtkPoints) {.importcpp: "ComputeBounds",
                                       header: "vtkPoints.h".}
## !!!Ignored construct:  *
##  Return the bounds of the points.
##  double * GetBounds ( ) VTK_SIZEHINT ( 6 ) ;
## Error: expected ';'!!!

proc GetBounds*(this: var vtkPoints; bounds: array[6, cdouble]) {.
    importcpp: "GetBounds", header: "vtkPoints.h".}
proc GetMTime*(this: var vtkPoints): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkPoints.h".}
proc Modified*(this: var vtkPoints) {.importcpp: "Modified", header: "vtkPoints.h".}
proc Reset*(this: var vtkPoints) {.importcpp: "Reset", header: "vtkPoints.h".}
proc SetNumberOfPoints*(this: var vtkPoints; numPoints: vtkIdType) {.
    importcpp: "SetNumberOfPoints", header: "vtkPoints.h".}
proc Resize*(this: var vtkPoints; numPoints: vtkIdType): vtkTypeBool {.
    importcpp: "Resize", header: "vtkPoints.h".}
proc SetPoint*(this: var vtkPoints; id: vtkIdType; x: cdouble; y: cdouble; z: cdouble) {.
    importcpp: "SetPoint", header: "vtkPoints.h".}
proc InsertPoint*(this: var vtkPoints; id: vtkIdType; x: cdouble; y: cdouble; z: cdouble) {.
    importcpp: "InsertPoint", header: "vtkPoints.h".}
proc InsertNextPoint*(this: var vtkPoints; x: cdouble; y: cdouble; z: cdouble): vtkIdType {.
    importcpp: "InsertNextPoint", header: "vtkPoints.h".}