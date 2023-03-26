## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTextMapper.h
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
##  @class   vtkTextMapper
##  @brief   2D text annotation
##
##  vtkTextMapper provides 2D text annotation support for VTK.  It is a
##  vtkMapper2D that can be associated with a vtkActor2D and placed into a
##  vtkRenderer.
##
##  To use vtkTextMapper, specify an input text string.
##
##  @sa
##  vtkActor2D vtkTextActor vtkTextActor3D vtkTextProperty vtkTextRenderer
##

import
  vtkMapper2D, vtkRenderingCoreModule, vtkNew

discard "forward decl of vtkActor2D"
discard "forward decl of vtkImageData"
discard "forward decl of vtkPoints"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkPolyDataMapper2D"
discard "forward decl of vtkTextProperty"
discard "forward decl of vtkTexture"
discard "forward decl of vtkTimeStamp"
discard "forward decl of vtkViewport"
type
  vtkTextMapper* {.importcpp: "vtkTextMapper", header: "vtkTextMapper.h", bycopy.} = object of vtkMapper2D
    vtkTextMapper* {.importc: "vtkTextMapper".}: VTK_NEWINSTANCE

  vtkTextMapperSuperclass* = vtkMapper2D

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTextMapper::IsTypeOf(@)", header: "vtkTextMapper.h".}
proc IsA*(this: var vtkTextMapper; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkTextMapper.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTextMapper {.
    importcpp: "vtkTextMapper::SafeDownCast(@)", header: "vtkTextMapper.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTextMapper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMapper2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTextMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTextMapper :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTextMapper; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTextMapper.h".}
proc New*(): ptr vtkTextMapper {.importcpp: "vtkTextMapper::New(@)",
                             header: "vtkTextMapper.h".}
proc GetSize*(this: var vtkTextMapper; a2: ptr vtkViewport; size: array[2, cint]) {.
    importcpp: "GetSize", header: "vtkTextMapper.h".}
proc GetWidth*(this: var vtkTextMapper; v: ptr vtkViewport): cint {.
    importcpp: "GetWidth", header: "vtkTextMapper.h".}
proc GetHeight*(this: var vtkTextMapper; v: ptr vtkViewport): cint {.
    importcpp: "GetHeight", header: "vtkTextMapper.h".}
proc SetInput*(this: var vtkTextMapper; _arg: cstring) {.importcpp: "SetInput",
    header: "vtkTextMapper.h".}
proc GetInput*(this: var vtkTextMapper): cstring {.importcpp: "GetInput",
    header: "vtkTextMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the text property.
  ##
proc SetTextProperty*(this: var vtkTextMapper; p: ptr vtkTextProperty) {.
    importcpp: "SetTextProperty", header: "vtkTextMapper.h".}
proc GetnameTextProperty*(this: var vtkTextMapper): ptr vtkTextProperty {.
    importcpp: "GetnameTextProperty", header: "vtkTextMapper.h".}
  ## /@}
  ## *
  ##  Shallow copy of an actor.
  ##
proc ShallowCopy*(this: var vtkTextMapper; m: ptr vtkAbstractMapper) {.
    importcpp: "ShallowCopy", header: "vtkTextMapper.h".}
proc SetConstrainedFontSize*(this: var vtkTextMapper; a2: ptr vtkViewport;
                            targetWidth: cint; targetHeight: cint): cint {.
    importcpp: "SetConstrainedFontSize", header: "vtkTextMapper.h".}
proc SetConstrainedFontSize*(a1: ptr vtkTextMapper; a2: ptr vtkViewport;
                            targetWidth: cint; targetHeight: cint): cint {.
    importcpp: "vtkTextMapper::SetConstrainedFontSize(@)",
    header: "vtkTextMapper.h".}
proc SetMultipleConstrainedFontSize*(a1: ptr vtkViewport; targetWidth: cint;
                                    targetHeight: cint;
                                    mappers: ptr ptr vtkTextMapper;
                                    nbOfMappers: cint; maxResultingSize: ptr cint): cint {.
    importcpp: "vtkTextMapper::SetMultipleConstrainedFontSize(@)",
    header: "vtkTextMapper.h".}
proc SetRelativeFontSize*(a1: ptr vtkTextMapper; a2: ptr vtkViewport;
                         winSize: ptr cint; stringSize: ptr cint;
                         sizeFactor: cfloat = 0.0): cint {.
    importcpp: "vtkTextMapper::SetRelativeFontSize(@)", header: "vtkTextMapper.h".}
proc SetMultipleRelativeFontSize*(viewport: ptr vtkViewport;
                                 textMappers: ptr ptr vtkTextMapper;
                                 nbOfMappers: cint; winSize: ptr cint;
                                 stringSize: ptr cint; sizeFactor: cfloat): cint {.
    importcpp: "vtkTextMapper::SetMultipleRelativeFontSize(@)",
    header: "vtkTextMapper.h".}
proc RenderOverlay*(this: var vtkTextMapper; a2: ptr vtkViewport; a3: ptr vtkActor2D) {.
    importcpp: "RenderOverlay", header: "vtkTextMapper.h".}
proc ReleaseGraphicsResources*(this: var vtkTextMapper; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkTextMapper.h".}
proc GetMTime*(this: var vtkTextMapper): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkTextMapper.h".}