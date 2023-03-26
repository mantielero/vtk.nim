## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGLTFExporter.h
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
##  @class   vtkGLTFExporter
##  @brief   export a scene into GLTF 2.0 format.
##
##  vtkGLTFExporter is a concrete subclass of vtkExporter that writes GLTF 2.0
##  files. It currently only supports a very small subset of what VTK can do
##  including polygonal meshes with optional vertex colors. Over time the class
##  can be expanded to support more and more of what VTK renders.
##
##  It should be noted that gltf is a format for rendering data. As such
##  it stores what the VTK scene renders as, not the underlying data. For
##  example it currently does not support quads or higher sided polygons
##  although VTK does. As such taking an exported gltf file and then selecting
##  wireframe in a viewer will give all triangles where VTK's rendering
##  would correctly draw the original polygons. etc.
##
##  @sa
##  vtkExporter
##

import
  vtkExporter, vtkIOExportModule

type
  vtkGLTFExporter* {.importcpp: "vtkGLTFExporter", header: "vtkGLTFExporter.h",
                    bycopy.} = object of vtkExporter
    vtkGLTFExporter* {.importc: "vtkGLTFExporter".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH


proc New*(): ptr vtkGLTFExporter {.importcpp: "vtkGLTFExporter::New(@)",
                               header: "vtkGLTFExporter.h".}
type
  vtkGLTFExporterSuperclass* = vtkExporter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGLTFExporter::IsTypeOf(@)", header: "vtkGLTFExporter.h".}
proc IsA*(this: var vtkGLTFExporter; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkGLTFExporter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGLTFExporter {.
    importcpp: "vtkGLTFExporter::SafeDownCast(@)", header: "vtkGLTFExporter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGLTFExporter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkExporter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGLTFExporter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGLTFExporter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGLTFExporter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGLTFExporter.h".}
## !!!Ignored construct:  /@{ *
##  Specify the name of the GLTF file to write.
##  virtual void SetFileNameFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Should the binary data be included in the json file as a base64
##  string.
##  virtual bool GetInlineDataInlineData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InlineData  of  << this -> InlineData ) ; return this -> InlineData ; } ;
## Error: expected ';'!!!

proc SetInlineData*(this: var vtkGLTFExporter; _arg: bool) {.
    importcpp: "SetInlineData", header: "vtkGLTFExporter.h".}
proc InlineDataOn*(this: var vtkGLTFExporter) {.importcpp: "InlineDataOn",
    header: "vtkGLTFExporter.h".}
proc InlineDataOff*(this: var vtkGLTFExporter) {.importcpp: "InlineDataOff",
    header: "vtkGLTFExporter.h".}
  ## /@}
  ## /@{
  ## *
  ##  It looks for a point array called
  ##  NORMAL in the data and it saves it in the
  ##  GLTF file if found.
  ##  NORMAL is the vertex normal. Cesium needs this to render buildings correctly
  ##  if there is no texture.
  ##
## !!!Ignored construct:  virtual bool GetInlineDataInlineDataSaveNormal ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SaveNormal  of  << this -> SaveNormal ) ; return this -> SaveNormal ; } ;
## Error: expected ';'!!!

proc SetInlineDataSaveNormal*(this: var vtkGLTFExporter; _arg: bool) {.
    importcpp: "SetInlineDataSaveNormal", header: "vtkGLTFExporter.h".}
proc SaveNormalOn*(this: var vtkGLTFExporter) {.importcpp: "SaveNormalOn",
    header: "vtkGLTFExporter.h".}
proc SaveNormalOff*(this: var vtkGLTFExporter) {.importcpp: "SaveNormalOff",
    header: "vtkGLTFExporter.h".}
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
## !!!Ignored construct:  virtual bool GetInlineDataInlineDataSaveNormalSaveBatchId ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SaveBatchId  of  << this -> SaveBatchId ) ; return this -> SaveBatchId ; } ;
## Error: expected ';'!!!

proc SetInlineDataSaveNormalSaveBatchId*(this: var vtkGLTFExporter; _arg: bool) {.
    importcpp: "SetInlineDataSaveNormalSaveBatchId", header: "vtkGLTFExporter.h".}
proc SaveBatchIdOn*(this: var vtkGLTFExporter) {.importcpp: "SaveBatchIdOn",
    header: "vtkGLTFExporter.h".}
proc SaveBatchIdOff*(this: var vtkGLTFExporter) {.importcpp: "SaveBatchIdOff",
    header: "vtkGLTFExporter.h".}
  ## /@}
  ## *
  ##  Write the result to a string instead of a file
  ##
proc WriteToString*(this: var vtkGLTFExporter): string {.importcpp: "WriteToString",
    header: "vtkGLTFExporter.h".}
proc WriteToStream*(this: var vtkGLTFExporter; `out`: var ostream) {.
    importcpp: "WriteToStream", header: "vtkGLTFExporter.h".}