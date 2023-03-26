## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLSDynaPart.h
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
## =========================================================================

import
  LSDynaMetaData, vtkIOLSDynaModule, vtkObject, vtkStdString

discard "forward decl of vtkUnstructuredGrid"
discard "forward decl of vtkPoints"
type
  vtkLSDynaPart* {.importcpp: "vtkLSDynaPart", header: "vtkLSDynaPart.h", bycopy.} = object of vtkObject
    vtkLSDynaPart* {.importc: "vtkLSDynaPart".}: VTK_NEWINSTANCE
    ##  used when reading properties


proc New*(): ptr vtkLSDynaPart {.importcpp: "vtkLSDynaPart::New(@)",
                             header: "vtkLSDynaPart.h".}
type
  vtkLSDynaPartSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkLSDynaPart::IsTypeOf(@)", header: "vtkLSDynaPart.h".}
proc IsA*(this: var vtkLSDynaPart; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkLSDynaPart.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkLSDynaPart {.
    importcpp: "vtkLSDynaPart::SafeDownCast(@)", header: "vtkLSDynaPart.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkLSDynaPart :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLSDynaPart :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLSDynaPart :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkLSDynaPart; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkLSDynaPart.h".}
proc SetPartType*(this: var vtkLSDynaPart; `type`: cint) {.importcpp: "SetPartType",
    header: "vtkLSDynaPart.h".}
proc PartType*(this: vtkLSDynaPart): LSDYNA_TYPES {.noSideEffect,
    importcpp: "PartType", header: "vtkLSDynaPart.h".}
proc hasValidType*(this: vtkLSDynaPart): bool {.noSideEffect,
    importcpp: "hasValidType", header: "vtkLSDynaPart.h".}
proc GetUserMaterialId*(this: vtkLSDynaPart): vtkIdType {.noSideEffect,
    importcpp: "GetUserMaterialId", header: "vtkLSDynaPart.h".}
proc GetPartId*(this: vtkLSDynaPart): vtkIdType {.noSideEffect,
    importcpp: "GetPartId", header: "vtkLSDynaPart.h".}
proc HasCells*(this: vtkLSDynaPart): bool {.noSideEffect, importcpp: "HasCells",
                                        header: "vtkLSDynaPart.h".}
proc InitPart*(this: var vtkLSDynaPart; name: vtkStdString; partId: vtkIdType;
              userMaterialId: vtkIdType; numGlobalPoints: vtkIdType;
              sizeOfWord: cint) {.importcpp: "InitPart", header: "vtkLSDynaPart.h".}
proc AllocateCellMemory*(this: var vtkLSDynaPart; numCells: vtkIdType;
                        cellLen: vtkIdType) {.importcpp: "AllocateCellMemory",
    header: "vtkLSDynaPart.h".}
proc AddCell*(this: var vtkLSDynaPart; cellType: cint; npts: vtkIdType;
             conn: array[8, vtkIdType]) {.importcpp: "AddCell",
                                       header: "vtkLSDynaPart.h".}
proc BuildToplogy*(this: var vtkLSDynaPart) {.importcpp: "BuildToplogy",
    header: "vtkLSDynaPart.h".}
proc IsTopologyBuilt*(this: vtkLSDynaPart): bool {.noSideEffect,
    importcpp: "IsTopologyBuilt", header: "vtkLSDynaPart.h".}
proc GenerateGrid*(this: var vtkLSDynaPart): ptr vtkUnstructuredGrid {.
    importcpp: "GenerateGrid", header: "vtkLSDynaPart.h".}
proc EnableDeadCells*(this: var vtkLSDynaPart; deadCellsAsGhostArray: cint) {.
    importcpp: "EnableDeadCells", header: "vtkLSDynaPart.h".}
proc DisableDeadCells*(this: var vtkLSDynaPart) {.importcpp: "DisableDeadCells",
    header: "vtkLSDynaPart.h".}
proc SetCellsDeadState*(this: var vtkLSDynaPart; dead: ptr cuchar; size: vtkIdType) {.
    importcpp: "SetCellsDeadState", header: "vtkLSDynaPart.h".}
proc EnableCellUserIds*(this: var vtkLSDynaPart) {.importcpp: "EnableCellUserIds",
    header: "vtkLSDynaPart.h".}
proc SetNextCellUserIds*(this: var vtkLSDynaPart; value: vtkIdType) {.
    importcpp: "SetNextCellUserIds", header: "vtkLSDynaPart.h".}
proc AddPointProperty*(this: var vtkLSDynaPart; name: cstring; numComps: vtkIdType;
                      isIdTypeProperty: bool; isProperty: bool;
                      isGeometryPoints: bool) {.importcpp: "AddPointProperty",
    header: "vtkLSDynaPart.h".}
proc ReadPointBasedProperty*(this: var vtkLSDynaPart; data: ptr cfloat;
                            numTuples: vtkIdType; numComps: vtkIdType;
                            currentGlobalPointIndex: vtkIdType) {.
    importcpp: "ReadPointBasedProperty", header: "vtkLSDynaPart.h".}
proc ReadPointBasedProperty*(this: var vtkLSDynaPart; data: ptr cdouble;
                            numTuples: vtkIdType; numComps: vtkIdType;
                            currentGlobalPointIndex: vtkIdType) {.
    importcpp: "ReadPointBasedProperty", header: "vtkLSDynaPart.h".}
proc AddCellProperty*(this: var vtkLSDynaPart; name: cstring; offset: cint;
                     numComps: cint) {.importcpp: "AddCellProperty",
                                     header: "vtkLSDynaPart.h".}
proc ReadCellProperties*(this: var vtkLSDynaPart; cellProperties: ptr cfloat;
                        numCells: vtkIdType; numPropertiesInCell: vtkIdType) {.
    importcpp: "ReadCellProperties", header: "vtkLSDynaPart.h".}
proc ReadCellProperties*(this: var vtkLSDynaPart; cellsProperties: ptr cdouble;
                        numCells: vtkIdType; numPropertiesInCell: vtkIdType) {.
    importcpp: "ReadCellProperties", header: "vtkLSDynaPart.h".}
proc GetMinGlobalPointId*(this: vtkLSDynaPart): vtkIdType {.noSideEffect,
    importcpp: "GetMinGlobalPointId", header: "vtkLSDynaPart.h".}
proc GetMaxGlobalPointId*(this: vtkLSDynaPart): vtkIdType {.noSideEffect,
    importcpp: "GetMaxGlobalPointId", header: "vtkLSDynaPart.h".}