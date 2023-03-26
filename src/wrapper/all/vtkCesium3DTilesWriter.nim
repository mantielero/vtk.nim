## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCesium3DTilesWriter.h
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
##  @class   vtkCesium3DTilesWriter
##  @brief   Writes a dataset into 3D Tiles format.
##
##
##  Valid inputs include the vtkMultiBlockDataSet (as created by
##  vtkCityGMLReader) storing 3D buidlings, vtkPointSet storing a point
##  cloud or vtkPolyData for storing a mesh.
##
##

import
  vtkIOCesium3DTilesModule, vtkWriter

type
  vtkCesium3DTilesWriter* {.importcpp: "vtkCesium3DTilesWriter",
                           header: "vtkCesium3DTilesWriter.h", bycopy.} = object of vtkWriter
    vtkCesium3DTilesWriter* {.importc: "vtkCesium3DTilesWriter".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH


proc New*(): ptr vtkCesium3DTilesWriter {.importcpp: "vtkCesium3DTilesWriter::New(@)",
                                      header: "vtkCesium3DTilesWriter.h".}
proc PrintSelf*(this: var vtkCesium3DTilesWriter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCesium3DTilesWriter.h".}
type
  vtkCesium3DTilesWriterSuperclass* = vtkWriter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCesium3DTilesWriter::IsTypeOf(@)",
    header: "vtkCesium3DTilesWriter.h".}
proc IsA*(this: var vtkCesium3DTilesWriter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkCesium3DTilesWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCesium3DTilesWriter {.
    importcpp: "vtkCesium3DTilesWriter::SafeDownCast(@)",
    header: "vtkCesium3DTilesWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCesium3DTilesWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCesium3DTilesWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCesium3DTilesWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

type
  vtkCesium3DTilesWriterInputType* {.size: sizeof(cint), importcpp: "vtkCesium3DTilesWriter::InputType",
                                    header: "vtkCesium3DTilesWriter.h".} = enum
    Buildings, Points, Mesh


## !!!Ignored construct:  /@{ *
##  Accessor for name of the directory where Cesium3DTiles data is written
##  virtual void SetDirectoryNameDirectoryName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << DirectoryName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> DirectoryName == nullptr && _arg == nullptr ) { return ; } if ( this -> DirectoryName && _arg && ( ! strcmp ( this -> DirectoryName , _arg ) ) ) { return ; } delete [ ] this -> DirectoryName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> DirectoryName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> DirectoryName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetDirectoryName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DirectoryName  of  << ( this -> DirectoryName ? this -> DirectoryName : (null) ) ) ; return this -> DirectoryName ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Path used to prefix all texture paths stored as fields in the input data.
##  @see vtkCityGMLReader
##  virtual void SetDirectoryNameDirectoryNameTextureBaseDirectoryTextureBaseDirectory ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << TextureBaseDirectory  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> TextureBaseDirectory == nullptr && _arg == nullptr ) { return ; } if ( this -> TextureBaseDirectory && _arg && ( ! strcmp ( this -> TextureBaseDirectory , _arg ) ) ) { return ; } delete [ ] this -> TextureBaseDirectory ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> TextureBaseDirectory = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> TextureBaseDirectory = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetDirectoryNameTextureBaseDirectory ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TextureBaseDirectory  of  << ( this -> TextureBaseDirectory ? this -> TextureBaseDirectory : (null) ) ) ; return this -> TextureBaseDirectory ; } ;
## Error: expected ';'!!!

proc SetOffset*(this: var vtkCesium3DTilesWriter; _arg1: cdouble; _arg2: cdouble;
               _arg3: cdouble) {.importcpp: "SetOffset",
                               header: "vtkCesium3DTilesWriter.h".}
proc SetOffset*(this: var vtkCesium3DTilesWriter; _arg: array[3, cdouble]) {.
    importcpp: "SetOffset", header: "vtkCesium3DTilesWriter.h".}
## !!!Ignored construct:  virtual double * GetOffset ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Offset  pointer  << this -> Offset ) ; return this -> Offset ; } VTK_WRAPEXCLUDE virtual void GetOffset ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Offset [ 0 ] ; _arg2 = this -> Offset [ 1 ] ; _arg3 = this -> Offset [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Offset  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetOffset ( double _arg [ 3 ] ) { this -> GetOffset ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetSaveTextures*(this: var vtkCesium3DTilesWriter; _arg: bool) {.
    importcpp: "SetSaveTextures", header: "vtkCesium3DTilesWriter.h".}
## !!!Ignored construct:  virtual bool GetSaveTextures ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SaveTextures  of  << this -> SaveTextures ) ; return this -> SaveTextures ; } ;
## Error: expected ';'!!!

proc SaveTexturesOn*(this: var vtkCesium3DTilesWriter) {.
    importcpp: "SaveTexturesOn", header: "vtkCesium3DTilesWriter.h".}
proc SaveTexturesOff*(this: var vtkCesium3DTilesWriter) {.
    importcpp: "SaveTexturesOff", header: "vtkCesium3DTilesWriter.h".}
  ## @
  ## @{
  ## *
  ##  Save the tiles (B3DMs) as part of the 3D Tiles dataset. Default true.
  ##  Otherwise save only the tileset (JSON) file. This is mainly used for
  ##  debugging. Default true.
  ##
proc SetSaveTexturesSaveTiles*(this: var vtkCesium3DTilesWriter; _arg: bool) {.
    importcpp: "SetSaveTexturesSaveTiles", header: "vtkCesium3DTilesWriter.h".}
## !!!Ignored construct:  virtual bool GetSaveTexturesSaveTiles ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SaveTiles  of  << this -> SaveTiles ) ; return this -> SaveTiles ; } ;
## Error: expected ';'!!!

proc SaveTilesOn*(this: var vtkCesium3DTilesWriter) {.importcpp: "SaveTilesOn",
    header: "vtkCesium3DTilesWriter.h".}
proc SaveTilesOff*(this: var vtkCesium3DTilesWriter) {.importcpp: "SaveTilesOff",
    header: "vtkCesium3DTilesWriter.h".}
  ## @
  ## @{
  ## *
  ##  Merge all meshes in each tile to end up with one mesh per tile.
  ##  Default is false which means that we expect an external program to merge
  ##  the meshes in each tile to improve performance (such as meshoptimizer).
  ##  otherwise we merge the polydata in VTK.
  ##  @see
  ##  https://meshoptimizer.org/
  ##
proc SetSaveTexturesSaveTilesMergeTilePolyData*(this: var vtkCesium3DTilesWriter;
    _arg: bool) {.importcpp: "SetSaveTexturesSaveTilesMergeTilePolyData",
                header: "vtkCesium3DTilesWriter.h".}
## !!!Ignored construct:  virtual bool GetSaveTexturesSaveTilesMergeTilePolyData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MergeTilePolyData  of  << this -> MergeTilePolyData ) ; return this -> MergeTilePolyData ; } ;
## Error: expected ';'!!!

proc MergeTilePolyDataOn*(this: var vtkCesium3DTilesWriter) {.
    importcpp: "MergeTilePolyDataOn", header: "vtkCesium3DTilesWriter.h".}
proc MergeTilePolyDataOff*(this: var vtkCesium3DTilesWriter) {.
    importcpp: "MergeTilePolyDataOff", header: "vtkCesium3DTilesWriter.h".}
  ## @
  ## @{
  ## *
  ##  What is the file type used to save tiles. If ContentGLTF is false
  ##  (the default) we use B3DM for Buildings or Mesh and PNTS for
  ##  PointCloud otherwise  we use GLB (3DTILES_content_gltf
  ##  extension).  If the file type is B3DM or GLB, external programs are
  ##  needed to convert GLTF -> GLB -> B3DM.
  ##
  ##
proc SetSaveTexturesSaveTilesMergeTilePolyDataContentGLTF*(
    this: var vtkCesium3DTilesWriter; _arg: bool) {.
    importcpp: "SetSaveTexturesSaveTilesMergeTilePolyDataContentGLTF",
    header: "vtkCesium3DTilesWriter.h".}
## !!!Ignored construct:  virtual bool GetSaveTexturesSaveTilesMergeTilePolyDataContentGLTF ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ContentGLTF  of  << this -> ContentGLTF ) ; return this -> ContentGLTF ; } ;
## Error: expected ';'!!!

proc ContentGLTFOn*(this: var vtkCesium3DTilesWriter) {.importcpp: "ContentGLTFOn",
    header: "vtkCesium3DTilesWriter.h".}
proc ContentGLTFOff*(this: var vtkCesium3DTilesWriter) {.
    importcpp: "ContentGLTFOff", header: "vtkCesium3DTilesWriter.h".}
  ## @
  ## @{
  ## *
  ##  Input is Buildings, Points or Mesh.
  ##
proc SetSaveTexturesSaveTilesMergeTilePolyDataContentGLTFInputType*(
    this: var vtkCesium3DTilesWriter; _arg: cint) {.
    importcpp: "SetSaveTexturesSaveTilesMergeTilePolyDataContentGLTFInputType",
    header: "vtkCesium3DTilesWriter.h".}
## !!!Ignored construct:  virtual int GetSaveTexturesSaveTilesMergeTilePolyDataContentGLTFInputType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InputType  of  << this -> InputType ) ; return this -> InputType ; } ;
## Error: expected ';'!!!

proc SetSaveTexturesSaveTilesMergeTilePolyDataContentGLTFInputTypeNumberOfFeaturesPerTile*(
    this: var vtkCesium3DTilesWriter; _arg: cint) {.importcpp: "SetSaveTexturesSaveTilesMergeTilePolyDataContentGLTFInputTypeNumberOfFeaturesPerTile",
    header: "vtkCesium3DTilesWriter.h".}
## !!!Ignored construct:  virtual int GetSaveTexturesSaveTilesMergeTilePolyDataContentGLTFInputTypeNumberOfFeaturesPerTile ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfFeaturesPerTile  of  << this -> NumberOfFeaturesPerTile ) ; return this -> NumberOfFeaturesPerTile ; } ;
## Error: expected ';'!!!

proc SetCRS*(this: var vtkCesium3DTilesWriter; _arg: cstring) {.importcpp: "SetCRS",
    header: "vtkCesium3DTilesWriter.h".}
proc GetCRS*(this: var vtkCesium3DTilesWriter): cstring {.importcpp: "GetCRS",
    header: "vtkCesium3DTilesWriter.h".}
  ## /@}