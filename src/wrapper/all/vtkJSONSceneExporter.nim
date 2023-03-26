## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkJSONSceneExporter.h
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
##  @class   vtkJSONSceneExporter
##  @brief   Export the content of a vtkRenderWindow into a directory with
##           a JSON meta file describing the scene along with the http datasets
##
##  @warning
##  This writer assume LittleEndian by default. Additional work should be done to properly
##  handle endianness.
##

import
  vtkExporter, vtkIOExportModule, vtkSmartPointer

discard "forward decl of vtkActor"
discard "forward decl of vtkColorTransferFunction"
discard "forward decl of vtkDataObject"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkPiecewiseFunction"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkPropCollection"
discard "forward decl of vtkScalarsToColors"
discard "forward decl of vtkTexture"
discard "forward decl of vtkVolume"
discard "forward decl of vtkVolumeCollection"
type
  vtkJSONSceneExporter* {.importcpp: "vtkJSONSceneExporter",
                         header: "vtkJSONSceneExporter.h", bycopy.} = object of vtkExporter
    vtkJSONSceneExporter* {.importc: "vtkJSONSceneExporter".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    ##  Files that subclasses should zip


proc New*(): ptr vtkJSONSceneExporter {.importcpp: "vtkJSONSceneExporter::New(@)",
                                    header: "vtkJSONSceneExporter.h".}
type
  vtkJSONSceneExporterSuperclass* = vtkExporter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkJSONSceneExporter::IsTypeOf(@)",
    header: "vtkJSONSceneExporter.h".}
proc IsA*(this: var vtkJSONSceneExporter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkJSONSceneExporter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkJSONSceneExporter {.
    importcpp: "vtkJSONSceneExporter::SafeDownCast(@)",
    header: "vtkJSONSceneExporter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkJSONSceneExporter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkExporter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkJSONSceneExporter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkJSONSceneExporter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkJSONSceneExporter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkJSONSceneExporter.h".}
## !!!Ignored construct:  /@{ *
##  Specify file name of vtk data file to write.
##  This correspond to the root directory of the data to write.
##  virtual void SetFileNameFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

proc SetWriteTextures*(this: var vtkJSONSceneExporter; _arg: bool) {.
    importcpp: "SetWriteTextures", header: "vtkJSONSceneExporter.h".}
## !!!Ignored construct:  virtual bool GetWriteTextures ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WriteTextures  of  << this -> WriteTextures ) ; return this -> WriteTextures ; } ;
## Error: expected ';'!!!

proc SetWriteTexturesWriteTextureLODs*(this: var vtkJSONSceneExporter; _arg: bool) {.
    importcpp: "SetWriteTexturesWriteTextureLODs",
    header: "vtkJSONSceneExporter.h".}
## !!!Ignored construct:  virtual bool GetWriteTexturesWriteTextureLODs ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WriteTextureLODs  of  << this -> WriteTextureLODs ) ; return this -> WriteTextureLODs ; } ;
## Error: expected ';'!!!

proc SetWriteTexturesWriteTextureLODsTextureLODsBaseSize*(
    this: var vtkJSONSceneExporter; _arg: csize_t) {.
    importcpp: "SetWriteTexturesWriteTextureLODsTextureLODsBaseSize",
    header: "vtkJSONSceneExporter.h".}
## !!!Ignored construct:  virtual size_t GetWriteTexturesWriteTextureLODsTextureLODsBaseSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TextureLODsBaseSize  of  << this -> TextureLODsBaseSize ) ; return this -> TextureLODsBaseSize ; } ;
## Error: expected ';'!!!

proc SetTextureLODsBaseUrl*(this: var vtkJSONSceneExporter; _arg: cstring) {.
    importcpp: "SetTextureLODsBaseUrl", header: "vtkJSONSceneExporter.h".}
proc GetTextureLODsBaseUrl*(this: var vtkJSONSceneExporter): cstring {.
    importcpp: "GetTextureLODsBaseUrl", header: "vtkJSONSceneExporter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Whether or not to write poly LODs.
  ##  This will write out the poly LOD sources in a series of decreasing
  ##  resolution data sets, which are intended to be uploaded to the
  ##  web. vtkQuadricCluster is used to decrease the resolution of the
  ##  poly data. Each will be approximately 1/4 the size of the previous
  ##  one (unless certain errors occur, and then the defaults for quadric
  ##  clustering will be used, which will produce an unknown size). The
  ##  files will stop being written out when one is smaller than the
  ##  PolyLODsBaseSize, or if the difference in the sizes of the two
  ##  most recent LODs is less than 5%. The smallest LOD will be written
  ##  into the vtkjs file, rather than with the rest of the LODs.
  ##  Default is false.
  ##
proc SetWriteTexturesWriteTextureLODsTextureLODsBaseSizeWritePolyLODs*(
    this: var vtkJSONSceneExporter; _arg: bool) {.importcpp: "SetWriteTexturesWriteTextureLODsTextureLODsBaseSizeWritePolyLODs",
    header: "vtkJSONSceneExporter.h".}
## !!!Ignored construct:  virtual bool GetWriteTexturesWriteTextureLODsTextureLODsBaseSizeWritePolyLODs ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WritePolyLODs  of  << this -> WritePolyLODs ) ; return this -> WritePolyLODs ; } ;
## Error: expected ';'!!!

proc SetWriteTexturesWriteTextureLODsTextureLODsBaseSizeWritePolyLODsPolyLODsBaseSize*(
    this: var vtkJSONSceneExporter; _arg: csize_t) {.importcpp: "SetWriteTexturesWriteTextureLODsTextureLODsBaseSizeWritePolyLODsPolyLODsBaseSize",
    header: "vtkJSONSceneExporter.h".}
## !!!Ignored construct:  virtual size_t GetWriteTexturesWriteTextureLODsTextureLODsBaseSizeWritePolyLODsPolyLODsBaseSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PolyLODsBaseSize  of  << this -> PolyLODsBaseSize ) ; return this -> PolyLODsBaseSize ; } ;
## Error: expected ';'!!!

proc SetTextureLODsBaseUrlPolyLODsBaseUrl*(this: var vtkJSONSceneExporter;
    _arg: cstring) {.importcpp: "SetTextureLODsBaseUrlPolyLODsBaseUrl",
                   header: "vtkJSONSceneExporter.h".}
proc GetTextureLODsBaseUrlPolyLODsBaseUrl*(this: var vtkJSONSceneExporter): cstring {.
    importcpp: "GetTextureLODsBaseUrlPolyLODsBaseUrl",
    header: "vtkJSONSceneExporter.h".}
  ## /@}