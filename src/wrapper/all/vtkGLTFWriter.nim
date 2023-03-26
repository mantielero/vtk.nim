## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGLTFWriter.h
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
##  @class   vtkGLTFWriter
##  @brief   export a scene into GLTF 2.0 format.
##
##  vtkGLTFWriter is a concrete subclass of vtkWriter that writes GLTF
##  2.0 files. Its input is a multiblock dataset as it is produced by
##  the CityGML reader. The dataset contains a list of buildings, a mesh
##  or a point cloud.
##
##  For buildings, each building is made of pieces (polydata), each
##  piece could potentially have a different texture. The mesh input
##  is the same as one building. The point cloud input, is the same as
##  mesh input but with Verts instead of Polys.
##
##  Materials, including textures, are described as fields in the
##  polydata. If InlineData is false, we only refer to textures files
##  refered in the data, otherwise we read the textures and save them
##  encoded in the file.
##
##  @sa
##  vtkCityGMLReader
##  vtkPolyData
##

import
  vtkIOGeometryModule, vtkWriter

discard "forward decl of vtkMultiBlockDataSet"
type
  vtkGLTFWriter* {.importcpp: "vtkGLTFWriter", header: "vtkGLTFWriter.h", bycopy.} = object of vtkWriter
    vtkGLTFWriter* {.importc: "vtkGLTFWriter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkGLTFWriter {.importcpp: "vtkGLTFWriter::New(@)",
                             header: "vtkGLTFWriter.h".}
type
  vtkGLTFWriterSuperclass* = vtkWriter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGLTFWriter::IsTypeOf(@)", header: "vtkGLTFWriter.h".}
proc IsA*(this: var vtkGLTFWriter; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkGLTFWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGLTFWriter {.
    importcpp: "vtkGLTFWriter::SafeDownCast(@)", header: "vtkGLTFWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGLTFWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGLTFWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGLTFWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGLTFWriter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGLTFWriter.h".}
proc SetFileName*(this: var vtkGLTFWriter; _arg: cstring) {.importcpp: "SetFileName",
    header: "vtkGLTFWriter.h".}
proc GetFileName*(this: var vtkGLTFWriter): cstring {.importcpp: "GetFileName",
    header: "vtkGLTFWriter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify the base directory for texture files.
  ##
proc SetFileNameTextureBaseDirectory*(this: var vtkGLTFWriter; _arg: cstring) {.
    importcpp: "SetFileNameTextureBaseDirectory", header: "vtkGLTFWriter.h".}
proc GetFileNameTextureBaseDirectory*(this: var vtkGLTFWriter): cstring {.
    importcpp: "GetFileNameTextureBaseDirectory", header: "vtkGLTFWriter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Should the binary data be included in the json file as a base64
  ##  string.
  ##
## !!!Ignored construct:  virtual bool GetInlineData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InlineData  of  << this -> InlineData ) ; return this -> InlineData ; } ;
## Error: expected ';'!!!

proc SetInlineData*(this: var vtkGLTFWriter; _arg: bool) {.importcpp: "SetInlineData",
    header: "vtkGLTFWriter.h".}
proc InlineDataOn*(this: var vtkGLTFWriter) {.importcpp: "InlineDataOn",
    header: "vtkGLTFWriter.h".}
proc InlineDataOff*(this: var vtkGLTFWriter) {.importcpp: "InlineDataOff",
    header: "vtkGLTFWriter.h".}
  ## /@}
  ## /@{
  ## *
  ##  It looks for the normals point attribute and saves it in the
  ##  GLTF file if found with the name NORMAL
  ##  Cesium needs this to render buildings correctly
  ##  if there is no texture.
  ##
## !!!Ignored construct:  virtual bool GetInlineDataSaveNormal ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SaveNormal  of  << this -> SaveNormal ) ; return this -> SaveNormal ; } ;
## Error: expected ';'!!!

proc SetInlineDataSaveNormal*(this: var vtkGLTFWriter; _arg: bool) {.
    importcpp: "SetInlineDataSaveNormal", header: "vtkGLTFWriter.h".}
proc SaveNormalOn*(this: var vtkGLTFWriter) {.importcpp: "SaveNormalOn",
    header: "vtkGLTFWriter.h".}
proc SaveNormalOff*(this: var vtkGLTFWriter) {.importcpp: "SaveNormalOff",
    header: "vtkGLTFWriter.h".}
  ## /@}
  ## /@{
  ## *
  ##  It looks for point arrays called
  ##  _BATCHID in the data and it saves it in the
  ##  GLTF file if found.
  ##  _BATCHID is an index used in 3D Tiles b3dm format. This format stores
  ##  a binary gltf with a mesh that has several objects (buildings).
  ##  Objects are indexed from 0 to number of objects - 1, all points
  ##  of an objects have the same index. These index values are stored
  ##  in _BATCHID
  ##
## !!!Ignored construct:  virtual bool GetInlineDataSaveNormalSaveBatchId ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SaveBatchId  of  << this -> SaveBatchId ) ; return this -> SaveBatchId ; } ;
## Error: expected ';'!!!

proc SetInlineDataSaveNormalSaveBatchId*(this: var vtkGLTFWriter; _arg: bool) {.
    importcpp: "SetInlineDataSaveNormalSaveBatchId", header: "vtkGLTFWriter.h".}
proc SaveBatchIdOn*(this: var vtkGLTFWriter) {.importcpp: "SaveBatchIdOn",
    header: "vtkGLTFWriter.h".}
proc SaveBatchIdOff*(this: var vtkGLTFWriter) {.importcpp: "SaveBatchIdOff",
    header: "vtkGLTFWriter.h".}
  ## /@}
  ## /@{
  ## *
  ##  If true (default) we save textures. We only include a reference to the
  ##  texture file unless you want to include the binary data in the json file using
  ##  InlineData in which case we have to load the texture in memory and save
  ##  it encoded in the json file.
  ##  @sa
  ##  TextureBaseDirectory
  ##
## !!!Ignored construct:  virtual bool GetInlineDataSaveNormalSaveBatchIdSaveTextures ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SaveTextures  of  << this -> SaveTextures ) ; return this -> SaveTextures ; } ;
## Error: expected ';'!!!

proc SetInlineDataSaveNormalSaveBatchIdSaveTextures*(this: var vtkGLTFWriter;
    _arg: bool) {.importcpp: "SetInlineDataSaveNormalSaveBatchIdSaveTextures",
                header: "vtkGLTFWriter.h".}
proc SaveTexturesOn*(this: var vtkGLTFWriter) {.importcpp: "SaveTexturesOn",
    header: "vtkGLTFWriter.h".}
proc SaveTexturesOff*(this: var vtkGLTFWriter) {.importcpp: "SaveTexturesOff",
    header: "vtkGLTFWriter.h".}
  ## /@}
  ## /@{
  ## *
  ##  If true, the writer looks at the active scalar and if it finds a
  ##  3 or 4 component, float, unsigned char or unsigned short it
  ##  stores a RGB or RGBA attribute called COLOR_0 in the GLTF
  ##  file. The default is false.  Note a float component has to be
  ##  bewtween [0, 1] while the unsigned chars and unsigned short are
  ##  OpenGL normalized integers (are used to store a float between [0,
  ##  1]).
  ##
## !!!Ignored construct:  virtual bool GetInlineDataSaveNormalSaveBatchIdSaveTexturesSaveActivePointColor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SaveActivePointColor  of  << this -> SaveActivePointColor ) ; return this -> SaveActivePointColor ; } ;
## Error: expected ';'!!!

proc SetInlineDataSaveNormalSaveBatchIdSaveTexturesSaveActivePointColor*(
    this: var vtkGLTFWriter; _arg: bool) {.importcpp: "SetInlineDataSaveNormalSaveBatchIdSaveTexturesSaveActivePointColor",
                                      header: "vtkGLTFWriter.h".}
proc SaveActivePointColorOn*(this: var vtkGLTFWriter) {.
    importcpp: "SaveActivePointColorOn", header: "vtkGLTFWriter.h".}
proc SaveActivePointColorOff*(this: var vtkGLTFWriter) {.
    importcpp: "SaveActivePointColorOff", header: "vtkGLTFWriter.h".}
  ## /@}
  ## *
  ##  Write the result to a string instead of a file
  ##
proc WriteToString*(this: var vtkGLTFWriter): string {.importcpp: "WriteToString",
    header: "vtkGLTFWriter.h".}
proc WriteToStream*(this: var vtkGLTFWriter; `out`: var ostream;
                   `in`: ptr vtkDataObject) {.importcpp: "WriteToStream",
    header: "vtkGLTFWriter.h".}