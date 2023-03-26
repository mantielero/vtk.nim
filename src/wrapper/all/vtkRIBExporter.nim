## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRIBExporter.h
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
##  @class   vtkRIBExporter
##  @brief   export a scene into RenderMan RIB format.
##
##  vtkRIBExporter is a concrete subclass of vtkExporter that writes a
##  Renderman .RIB files. The input specifies a vtkRenderWindow. All
##  visible actors and lights will be included in the rib file. The
##  following file naming conventions apply:
##    rib file - FilePrefix.rib
##    image file created by RenderMan - FilePrefix.tif
##    texture files - TexturePrefix_0xADDR_MTIME.tif
##  This object does NOT generate an image file. The user must run either
##  RenderMan or a RenderMan emulator like Blue Moon Ray Tracer (BMRT).
##  vtk properties are convert to Renderman shaders as follows:
##    Normal property, no texture map - plastic.sl
##    Normal property with texture map - txtplastic.sl
##  These two shaders must be compiled by the rendering package being
##  used.  vtkRIBExporter also supports custom shaders. The shaders are
##  written using the Renderman Shading Language. See "The Renderman
##  Companion", ISBN 0-201-50868, 1989 for details on writing shaders.
##  vtkRIBProperty specifies the declarations and parameter settings for
##  custom shaders.
##
##  @sa
##  vtkExporter vtkRIBProperty vtkRIBLight
##

import
  vtkExporter, vtkIOExportModule

discard "forward decl of vtkActor"
discard "forward decl of vtkCamera"
discard "forward decl of vtkLight"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkProperty"
discard "forward decl of vtkRenderer"
discard "forward decl of vtkTexture"
discard "forward decl of vtkUnsignedCharArray"
type
  vtkRIBExporter* {.importcpp: "vtkRIBExporter", header: "vtkRIBExporter.h", bycopy.} = object of vtkExporter
    vtkRIBExporter* {.importc: "vtkRIBExporter".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    ## *
    ##  This variable defines whether the arrays are exported or not.
    ##
    ## /@{
    ## *
    ##  Write the RIB header.
    ##


proc New*(): ptr vtkRIBExporter {.importcpp: "vtkRIBExporter::New(@)",
                              header: "vtkRIBExporter.h".}
type
  vtkRIBExporterSuperclass* = vtkExporter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkRIBExporter::IsTypeOf(@)", header: "vtkRIBExporter.h".}
proc IsA*(this: var vtkRIBExporter; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkRIBExporter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkRIBExporter {.
    importcpp: "vtkRIBExporter::SafeDownCast(@)", header: "vtkRIBExporter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkRIBExporter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkExporter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRIBExporter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRIBExporter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkRIBExporter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkRIBExporter.h".}
proc SetSize*(this: var vtkRIBExporter; _arg1: cint; _arg2: cint) {.
    importcpp: "SetSize", header: "vtkRIBExporter.h".}
proc SetSize*(this: var vtkRIBExporter; _arg: array[2, cint]) {.importcpp: "SetSize",
    header: "vtkRIBExporter.h".}
## !!!Ignored construct:  virtual int * GetSize ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Size  pointer  << this -> Size ) ; return this -> Size ; } VTK_WRAPEXCLUDE virtual void GetSize ( int data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> Size [ i ] ; } } ;
## Error: expected ';'!!!

proc SetSizePixelSamples*(this: var vtkRIBExporter; _arg1: cint; _arg2: cint) {.
    importcpp: "SetSizePixelSamples", header: "vtkRIBExporter.h".}
proc SetSizePixelSamples*(this: var vtkRIBExporter; _arg: array[2, cint]) {.
    importcpp: "SetSizePixelSamples", header: "vtkRIBExporter.h".}
## !!!Ignored construct:  virtual int * GetSizePixelSamples ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << PixelSamples  pointer  << this -> PixelSamples ) ; return this -> PixelSamples ; } VTK_WRAPEXCLUDE virtual void GetSizePixelSamples ( int data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> PixelSamples [ i ] ; } } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Specify the prefix of the files to write out. The resulting file names
##  will have .rib appended to them.
##  virtual void SetFilePrefixFilePrefix ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FilePrefix  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FilePrefix == nullptr && _arg == nullptr ) { return ; } if ( this -> FilePrefix && _arg && ( ! strcmp ( this -> FilePrefix , _arg ) ) ) { return ; } delete [ ] this -> FilePrefix ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FilePrefix = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FilePrefix = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFilePrefix ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FilePrefix  of  << ( this -> FilePrefix ? this -> FilePrefix : (null) ) ) ; return this -> FilePrefix ; } ;
## Error: expected ';'!!!

proc SetTexturePrefix*(this: var vtkRIBExporter; _arg: cstring) {.
    importcpp: "SetTexturePrefix", header: "vtkRIBExporter.h".}
proc GetTexturePrefix*(this: var vtkRIBExporter): cstring {.
    importcpp: "GetTexturePrefix", header: "vtkRIBExporter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the background flag. Default is 0 (off).
  ##  If set, the rib file will contain an
  ##  image shader that will use the renderer window's background
  ##  color. Normally, RenderMan does generate backgrounds. Backgrounds are
  ##  composited into the scene with the tiffcomp program that comes with
  ##  Pixar's RenderMan Toolkit.  In fact, Pixar's Renderman will accept an
  ##  image shader but only sets the alpha of the background. Images created
  ##  this way will still have a black background but contain an alpha of 1
  ##  at all pixels and CANNOT be subsequently composited with other images
  ##  using tiffcomp.  However, other RenderMan compliant renderers like
  ##  Blue Moon Ray Tracing (BMRT) do allow image shaders and properly set
  ##  the background color. If this sounds too confusing, use the following
  ##  rules: If you are using Pixar's Renderman, leave the Background
  ##  off. Otherwise, try setting BackGroundOn and see if you get the
  ##  desired results.
  ##
proc SetBackground*(this: var vtkRIBExporter; _arg: vtkTypeBool) {.
    importcpp: "SetBackground", header: "vtkRIBExporter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetBackground ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Background  of  << this -> Background ) ; return this -> Background ; } ;
## Error: expected ';'!!!

proc BackgroundOn*(this: var vtkRIBExporter) {.importcpp: "BackgroundOn",
    header: "vtkRIBExporter.h".}
proc BackgroundOff*(this: var vtkRIBExporter) {.importcpp: "BackgroundOff",
    header: "vtkRIBExporter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set or get the ExportArrays. If ExportArrays is set, then
  ##  all point data, field data, and cell data arrays will get
  ##  exported together with polygons. Default is Off (0).
  ##
proc SetExportArrays*(this: var vtkRIBExporter; _arg: vtkTypeBool) {.
    importcpp: "SetExportArrays", header: "vtkRIBExporter.h".}
proc GetExportArraysMinValue*(this: var vtkRIBExporter): vtkTypeBool {.
    importcpp: "GetExportArraysMinValue", header: "vtkRIBExporter.h".}
proc GetExportArraysMaxValue*(this: var vtkRIBExporter): vtkTypeBool {.
    importcpp: "GetExportArraysMaxValue", header: "vtkRIBExporter.h".}
proc ExportArraysOn*(this: var vtkRIBExporter) {.importcpp: "ExportArraysOn",
    header: "vtkRIBExporter.h".}
proc ExportArraysOff*(this: var vtkRIBExporter) {.importcpp: "ExportArraysOff",
    header: "vtkRIBExporter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetBackgroundExportArrays ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ExportArrays  of  << this -> ExportArrays ) ; return this -> ExportArrays ; } ;
## Error: expected ';'!!!
