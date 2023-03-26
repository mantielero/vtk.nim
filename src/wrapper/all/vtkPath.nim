## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPath.h
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
##  @class   vtkPath
##  @brief   concrete dataset representing a path defined by Bezier
##  curves.
##
##  vtkPath provides a container for paths composed of line segments,
##  2nd-order (quadratic) and 3rd-order (cubic) Bezier curves.
##

import
  vtkCommonDataModelModule, vtkPointSet

discard "forward decl of vtkIntArray"
type
  vtkPath* {.importcpp: "vtkPath", header: "vtkPath.h", bycopy.} = object of vtkPointSet
    vtkPath* {.importc: "vtkPath".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPath {.importcpp: "vtkPath::New(@)", header: "vtkPath.h".}
type
  vtkPathSuperclass* = vtkPointSet

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkPath::IsTypeOf(@)",
    header: "vtkPath.h".}
proc IsA*(this: var vtkPath; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkPath.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPath {.
    importcpp: "vtkPath::SafeDownCast(@)", header: "vtkPath.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPath :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPointSet :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPath :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPath :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPath; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPath.h".}
proc GetDataObjectType*(this: var vtkPath): cint {.importcpp: "GetDataObjectType",
    header: "vtkPath.h".}
type
  vtkPathControlPointType* {.size: sizeof(cint),
                            importcpp: "vtkPath::ControlPointType",
                            header: "vtkPath.h".} = enum
    MOVE_TO = 0, LINE_TO, CONIC_CURVE, CUBIC_CURVE


proc InsertNextPoint*(this: var vtkPath; pts: array[3, cfloat]; code: cint) {.
    importcpp: "InsertNextPoint", header: "vtkPath.h".}
proc InsertNextPoint*(this: var vtkPath; pts: array[3, cdouble]; code: cint) {.
    importcpp: "InsertNextPoint", header: "vtkPath.h".}
proc InsertNextPoint*(this: var vtkPath; x: cdouble; y: cdouble; z: cdouble; code: cint) {.
    importcpp: "InsertNextPoint", header: "vtkPath.h".}
proc SetCodes*(this: var vtkPath; a2: ptr vtkIntArray) {.importcpp: "SetCodes",
    header: "vtkPath.h".}
proc GetCodes*(this: var vtkPath): ptr vtkIntArray {.importcpp: "GetCodes",
    header: "vtkPath.h".}
proc GetNumberOfCells*(this: var vtkPath): vtkIdType {.importcpp: "GetNumberOfCells",
    header: "vtkPath.h".}
## using statement

proc GetCell*(this: var vtkPath; a2: vtkIdType): ptr vtkCell {.importcpp: "GetCell",
    header: "vtkPath.h".}
proc GetCell*(this: var vtkPath; a2: vtkIdType; a3: ptr vtkGenericCell) {.
    importcpp: "GetCell", header: "vtkPath.h".}
proc GetCellType*(this: var vtkPath; a2: vtkIdType): cint {.importcpp: "GetCellType",
    header: "vtkPath.h".}
proc GetCellPoints*(this: var vtkPath; a2: vtkIdType; ptIds: ptr vtkIdList) {.
    importcpp: "GetCellPoints", header: "vtkPath.h".}
proc GetPointCells*(this: var vtkPath; ptId: vtkIdType; cellIds: ptr vtkIdList) {.
    importcpp: "GetPointCells", header: "vtkPath.h".}
proc GetMaxCellSize*(this: var vtkPath): cint {.importcpp: "GetMaxCellSize",
    header: "vtkPath.h".}
proc Allocate*(this: var vtkPath; size: vtkIdType = 1000; extSize: cint = 1000) {.
    importcpp: "Allocate", header: "vtkPath.h".}
proc Reset*(this: var vtkPath) {.importcpp: "Reset", header: "vtkPath.h".}
proc GetData*(info: ptr vtkInformation): ptr vtkPath {.
    importcpp: "vtkPath::GetData(@)", header: "vtkPath.h".}
proc GetData*(v: ptr vtkInformationVector; i: cint = 0): ptr vtkPath {.
    importcpp: "vtkPath::GetData(@)", header: "vtkPath.h".}