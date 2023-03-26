## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkArrayRename.h
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
##  @class   vtkArrayRename
##  @brief   Rename data arrays.
##
##   This class takes any vtkDataObject as input, shallow copies its content to
##   the output and renames its data arrays.
##
##   For each attributes type, array name should be unique.
##
##   Supported attributes type are the following: POINT, CELL, FIELD, VERTEX, EDGE and ROW.
##

import
  vtkFiltersCoreModule, vtkPassInputTypeAlgorithm, vtkDataObject

type
  vtkArrayRename* {.importcpp: "vtkArrayRename", header: "vtkArrayRename.h", bycopy.} = object of vtkPassInputTypeAlgorithm
    vtkArrayRename* {.importc: "vtkArrayRename".}: VTK_NEWINSTANCE


proc New*(): ptr vtkArrayRename {.importcpp: "vtkArrayRename::New(@)",
                              header: "vtkArrayRename.h".}
type
  vtkArrayRenameSuperclass* = vtkPassInputTypeAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkArrayRename::IsTypeOf(@)", header: "vtkArrayRename.h".}
proc IsA*(this: var vtkArrayRename; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkArrayRename.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkArrayRename {.
    importcpp: "vtkArrayRename::SafeDownCast(@)", header: "vtkArrayRename.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkArrayRename :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPassInputTypeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkArrayRename :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkArrayRename :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkArrayRename; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkArrayRename.h".}
proc GetNumberOfArrays*(this: var vtkArrayRename; attributeType: cint): cint {.
    importcpp: "GetNumberOfArrays", header: "vtkArrayRename.h".}
proc GetArrayOriginalName*(this: var vtkArrayRename; attributeType: cint; idx: cint): cstring {.
    importcpp: "GetArrayOriginalName", header: "vtkArrayRename.h".}
proc GetArrayNewName*(this: var vtkArrayRename; attributeType: cint; idx: cint): cstring {.
    importcpp: "GetArrayNewName", header: "vtkArrayRename.h".}
proc SetArrayName*(this: var vtkArrayRename; attributeType: cint; idx: cint;
                  newName: cstring) {.importcpp: "SetArrayName",
                                    header: "vtkArrayRename.h".}
proc SetArrayName*(this: var vtkArrayRename; attributeType: cint; inputName: cstring;
                  newName: cstring) {.importcpp: "SetArrayName",
                                    header: "vtkArrayRename.h".}
proc ClearMapping*(this: var vtkArrayRename; attributeType: cint) {.
    importcpp: "ClearMapping", header: "vtkArrayRename.h".}
proc GetNumberOfPointArrays*(this: var vtkArrayRename): cint {.
    importcpp: "GetNumberOfPointArrays", header: "vtkArrayRename.h".}
proc GetPointArrayOriginalName*(this: var vtkArrayRename; idx: cint): cstring {.
    importcpp: "GetPointArrayOriginalName", header: "vtkArrayRename.h".}
proc GetPointArrayNewName*(this: var vtkArrayRename; idx: cint): cstring {.
    importcpp: "GetPointArrayNewName", header: "vtkArrayRename.h".}
proc SetPointArrayName*(this: var vtkArrayRename; idx: cint; newName: cstring) {.
    importcpp: "SetPointArrayName", header: "vtkArrayRename.h".}
proc SetPointArrayName*(this: var vtkArrayRename; inputName: cstring; newName: cstring) {.
    importcpp: "SetPointArrayName", header: "vtkArrayRename.h".}
proc ClearPointMapping*(this: var vtkArrayRename) {.importcpp: "ClearPointMapping",
    header: "vtkArrayRename.h".}
proc GetNumberOfCellArrays*(this: var vtkArrayRename): cint {.
    importcpp: "GetNumberOfCellArrays", header: "vtkArrayRename.h".}
proc GetCellArrayOriginalName*(this: var vtkArrayRename; idx: cint): cstring {.
    importcpp: "GetCellArrayOriginalName", header: "vtkArrayRename.h".}
proc GetCellArrayNewName*(this: var vtkArrayRename; idx: cint): cstring {.
    importcpp: "GetCellArrayNewName", header: "vtkArrayRename.h".}
proc SetCellArrayName*(this: var vtkArrayRename; idx: cint; newName: cstring) {.
    importcpp: "SetCellArrayName", header: "vtkArrayRename.h".}
proc SetCellArrayName*(this: var vtkArrayRename; inputName: cstring; newName: cstring) {.
    importcpp: "SetCellArrayName", header: "vtkArrayRename.h".}
proc ClearCellMapping*(this: var vtkArrayRename) {.importcpp: "ClearCellMapping",
    header: "vtkArrayRename.h".}
proc GetNumberOfFieldArrays*(this: var vtkArrayRename): cint {.
    importcpp: "GetNumberOfFieldArrays", header: "vtkArrayRename.h".}
proc GetFieldArrayOriginalName*(this: var vtkArrayRename; idx: cint): cstring {.
    importcpp: "GetFieldArrayOriginalName", header: "vtkArrayRename.h".}
proc GetFieldArrayNewName*(this: var vtkArrayRename; idx: cint): cstring {.
    importcpp: "GetFieldArrayNewName", header: "vtkArrayRename.h".}
proc SetFieldArrayName*(this: var vtkArrayRename; idx: cint; newName: cstring) {.
    importcpp: "SetFieldArrayName", header: "vtkArrayRename.h".}
proc SetFieldArrayName*(this: var vtkArrayRename; inputName: cstring; newName: cstring) {.
    importcpp: "SetFieldArrayName", header: "vtkArrayRename.h".}
proc ClearFieldMapping*(this: var vtkArrayRename) {.importcpp: "ClearFieldMapping",
    header: "vtkArrayRename.h".}
proc GetNumberOfVertexArrays*(this: var vtkArrayRename): cint {.
    importcpp: "GetNumberOfVertexArrays", header: "vtkArrayRename.h".}
proc GetVertexArrayOriginalName*(this: var vtkArrayRename; idx: cint): cstring {.
    importcpp: "GetVertexArrayOriginalName", header: "vtkArrayRename.h".}
proc GetVertexArrayNewName*(this: var vtkArrayRename; idx: cint): cstring {.
    importcpp: "GetVertexArrayNewName", header: "vtkArrayRename.h".}
proc SetVertexArrayName*(this: var vtkArrayRename; idx: cint; newName: cstring) {.
    importcpp: "SetVertexArrayName", header: "vtkArrayRename.h".}
proc SetVertexArrayName*(this: var vtkArrayRename; inputName: cstring;
                        newName: cstring) {.importcpp: "SetVertexArrayName",
    header: "vtkArrayRename.h".}
proc ClearVertexMapping*(this: var vtkArrayRename) {.
    importcpp: "ClearVertexMapping", header: "vtkArrayRename.h".}
proc GetNumberOfEdgeArrays*(this: var vtkArrayRename): cint {.
    importcpp: "GetNumberOfEdgeArrays", header: "vtkArrayRename.h".}
proc GetEdgeArrayOriginalName*(this: var vtkArrayRename; idx: cint): cstring {.
    importcpp: "GetEdgeArrayOriginalName", header: "vtkArrayRename.h".}
proc GetEdgeArrayNewName*(this: var vtkArrayRename; idx: cint): cstring {.
    importcpp: "GetEdgeArrayNewName", header: "vtkArrayRename.h".}
proc SetEdgeArrayName*(this: var vtkArrayRename; idx: cint; newName: cstring) {.
    importcpp: "SetEdgeArrayName", header: "vtkArrayRename.h".}
proc SetEdgeArrayName*(this: var vtkArrayRename; inputName: cstring; newName: cstring) {.
    importcpp: "SetEdgeArrayName", header: "vtkArrayRename.h".}
proc ClearEdgeMapping*(this: var vtkArrayRename) {.importcpp: "ClearEdgeMapping",
    header: "vtkArrayRename.h".}
proc GetNumberOfRowArrays*(this: var vtkArrayRename): cint {.
    importcpp: "GetNumberOfRowArrays", header: "vtkArrayRename.h".}
proc GetRowArrayOriginalName*(this: var vtkArrayRename; idx: cint): cstring {.
    importcpp: "GetRowArrayOriginalName", header: "vtkArrayRename.h".}
proc GetRowArrayNewName*(this: var vtkArrayRename; idx: cint): cstring {.
    importcpp: "GetRowArrayNewName", header: "vtkArrayRename.h".}
proc SetRowArrayName*(this: var vtkArrayRename; idx: cint; newName: cstring) {.
    importcpp: "SetRowArrayName", header: "vtkArrayRename.h".}
proc SetRowArrayName*(this: var vtkArrayRename; inputName: cstring; newName: cstring) {.
    importcpp: "SetRowArrayName", header: "vtkArrayRename.h".}
proc ClearRowMapping*(this: var vtkArrayRename) {.importcpp: "ClearRowMapping",
    header: "vtkArrayRename.h".}
proc ClearAll*(this: var vtkArrayRename) {.importcpp: "ClearAll",
                                       header: "vtkArrayRename.h".}