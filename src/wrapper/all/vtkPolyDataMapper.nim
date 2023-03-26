## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPolyDataMapper.h
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
##  @class   vtkPolyDataMapper
##  @brief   map vtkPolyData to graphics primitives
##
##  vtkPolyDataMapper is a class that maps polygonal data (i.e., vtkPolyData)
##  to graphics primitives. vtkPolyDataMapper serves as a superclass for
##  device-specific poly data mappers, that actually do the mapping to the
##  rendering/graphics hardware/software.
##

import
  vtkMapper, vtkRenderingCoreModule

discard "forward decl of vtkPolyData"
discard "forward decl of vtkRenderer"
discard "forward decl of vtkRenderWindow"
type
  vtkPolyDataMapper* {.importcpp: "vtkPolyDataMapper",
                      header: "vtkPolyDataMapper.h", bycopy.} = object of vtkMapper
    vtkPolyDataMapper* {.importc: "vtkPolyDataMapper".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPolyDataMapper {.importcpp: "vtkPolyDataMapper::New(@)",
                                 header: "vtkPolyDataMapper.h".}
type
  vtkPolyDataMapperSuperclass* = vtkMapper

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPolyDataMapper::IsTypeOf(@)", header: "vtkPolyDataMapper.h".}
proc IsA*(this: var vtkPolyDataMapper; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPolyDataMapper.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPolyDataMapper {.
    importcpp: "vtkPolyDataMapper::SafeDownCast(@)", header: "vtkPolyDataMapper.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPolyDataMapper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPolyDataMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPolyDataMapper :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPolyDataMapper; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPolyDataMapper.h".}
proc RenderPiece*(this: var vtkPolyDataMapper; a2: ptr vtkRenderer; a3: ptr vtkActor) {.
    importcpp: "RenderPiece", header: "vtkPolyDataMapper.h".}
  ## *
  ##  This calls RenderPiece (in a for loop if streaming is necessary).
  ##
proc Render*(this: var vtkPolyDataMapper; ren: ptr vtkRenderer; act: ptr vtkActor) {.
    importcpp: "Render", header: "vtkPolyDataMapper.h".}
proc SetInputData*(this: var vtkPolyDataMapper; `in`: ptr vtkPolyData) {.
    importcpp: "SetInputData", header: "vtkPolyDataMapper.h".}
proc GetInput*(this: var vtkPolyDataMapper): ptr vtkPolyData {.importcpp: "GetInput",
    header: "vtkPolyDataMapper.h".}
proc Update*(this: var vtkPolyDataMapper; port: cint) {.importcpp: "Update",
    header: "vtkPolyDataMapper.h".}
proc Update*(this: var vtkPolyDataMapper) {.importcpp: "Update",
                                        header: "vtkPolyDataMapper.h".}
proc Update*(this: var vtkPolyDataMapper; port: cint;
            requests: ptr vtkInformationVector): vtkTypeBool {.importcpp: "Update",
    header: "vtkPolyDataMapper.h".}
proc Update*(this: var vtkPolyDataMapper; requests: ptr vtkInformation): vtkTypeBool {.
    importcpp: "Update", header: "vtkPolyDataMapper.h".}
proc SetPiece*(this: var vtkPolyDataMapper; _arg: cint) {.importcpp: "SetPiece",
    header: "vtkPolyDataMapper.h".}
## !!!Ignored construct:  virtual int GetPiece ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Piece  of  << this -> Piece ) ; return this -> Piece ; } ;
## Error: expected ';'!!!

proc SetPieceNumberOfPieces*(this: var vtkPolyDataMapper; _arg: cint) {.
    importcpp: "SetPieceNumberOfPieces", header: "vtkPolyDataMapper.h".}
## !!!Ignored construct:  virtual int GetPieceNumberOfPieces ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfPieces  of  << this -> NumberOfPieces ) ; return this -> NumberOfPieces ; } ;
## Error: expected ';'!!!

proc SetPieceNumberOfPiecesNumberOfSubPieces*(this: var vtkPolyDataMapper;
    _arg: cint) {.importcpp: "SetPieceNumberOfPiecesNumberOfSubPieces",
                header: "vtkPolyDataMapper.h".}
## !!!Ignored construct:  virtual int GetPieceNumberOfPiecesNumberOfSubPieces ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfSubPieces  of  << this -> NumberOfSubPieces ) ; return this -> NumberOfSubPieces ; } ;
## Error: expected ';'!!!

proc SetPieceNumberOfPiecesNumberOfSubPiecesGhostLevel*(
    this: var vtkPolyDataMapper; _arg: cint) {.
    importcpp: "SetPieceNumberOfPiecesNumberOfSubPiecesGhostLevel",
    header: "vtkPolyDataMapper.h".}
## !!!Ignored construct:  virtual int GetPieceNumberOfPiecesNumberOfSubPiecesGhostLevel ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GhostLevel  of  << this -> GhostLevel ) ; return this -> GhostLevel ; } ;
## Error: expected ';'!!!

proc SetPieceNumberOfPiecesNumberOfSubPiecesGhostLevelSeamlessU*(
    this: var vtkPolyDataMapper; _arg: bool) {.
    importcpp: "SetPieceNumberOfPiecesNumberOfSubPiecesGhostLevelSeamlessU",
    header: "vtkPolyDataMapper.h".}
## !!!Ignored construct:  virtual bool GetPieceNumberOfPiecesNumberOfSubPiecesGhostLevelSeamlessU ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SeamlessU  of  << this -> SeamlessU ) ; return this -> SeamlessU ; } ;
## Error: expected ';'!!!

proc SeamlessUOn*(this: var vtkPolyDataMapper) {.importcpp: "SeamlessUOn",
    header: "vtkPolyDataMapper.h".}
proc SeamlessUOff*(this: var vtkPolyDataMapper) {.importcpp: "SeamlessUOff",
    header: "vtkPolyDataMapper.h".}
proc SetPieceNumberOfPiecesNumberOfSubPiecesGhostLevelSeamlessUSeamlessV*(
    this: var vtkPolyDataMapper; _arg: bool) {.importcpp: "SetPieceNumberOfPiecesNumberOfSubPiecesGhostLevelSeamlessUSeamlessV",
    header: "vtkPolyDataMapper.h".}
## !!!Ignored construct:  virtual bool GetPieceNumberOfPiecesNumberOfSubPiecesGhostLevelSeamlessUSeamlessV ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SeamlessV  of  << this -> SeamlessV ) ; return this -> SeamlessV ; } ;
## Error: expected ';'!!!

proc SeamlessVOn*(this: var vtkPolyDataMapper) {.importcpp: "SeamlessVOn",
    header: "vtkPolyDataMapper.h".}
proc SeamlessVOff*(this: var vtkPolyDataMapper) {.importcpp: "SeamlessVOff",
    header: "vtkPolyDataMapper.h".}
  ## /@}
  ## *
  ##  Return bounding box (array of six doubles) of data expressed as
  ##  (xmin,xmax, ymin,ymax, zmin,zmax).
  ##
## !!!Ignored construct:  double * GetBounds ( ) VTK_SIZEHINT ( 6 ) override ;
## Error: expected ';'!!!

proc GetBounds*(this: var vtkPolyDataMapper; bounds: array[6, cdouble]) {.
    importcpp: "GetBounds", header: "vtkPolyDataMapper.h".}
proc ShallowCopy*(this: var vtkPolyDataMapper; m: ptr vtkAbstractMapper) {.
    importcpp: "ShallowCopy", header: "vtkPolyDataMapper.h".}
proc MapDataArrayToVertexAttribute*(this: var vtkPolyDataMapper;
                                   vertexAttributeName: cstring;
                                   dataArrayName: cstring; fieldAssociation: cint;
                                   componentno: cint = -1) {.
    importcpp: "MapDataArrayToVertexAttribute", header: "vtkPolyDataMapper.h".}
proc MapDataArrayToMultiTextureAttribute*(this: var vtkPolyDataMapper;
    textureName: cstring; dataArrayName: cstring; fieldAssociation: cint;
    componentno: cint = -1) {.importcpp: "MapDataArrayToMultiTextureAttribute",
                          header: "vtkPolyDataMapper.h".}
proc RemoveVertexAttributeMapping*(this: var vtkPolyDataMapper;
                                  vertexAttributeName: cstring) {.
    importcpp: "RemoveVertexAttributeMapping", header: "vtkPolyDataMapper.h".}
proc RemoveAllVertexAttributeMappings*(this: var vtkPolyDataMapper) {.
    importcpp: "RemoveAllVertexAttributeMappings", header: "vtkPolyDataMapper.h".}
proc ProcessRequest*(this: var vtkPolyDataMapper; a2: ptr vtkInformation;
                    a3: ptr ptr vtkInformationVector; a4: ptr vtkInformationVector): vtkTypeBool {.
    importcpp: "ProcessRequest", header: "vtkPolyDataMapper.h".}