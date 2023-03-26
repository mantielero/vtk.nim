## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTexturedActor2D.h
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
##  @class   vtkTexturedActor2D
##  @brief   actor that draws 2D data with texture support
##
##  vtkTexturedActor2D is an Actor2D which has additional support for
##  textures, just like vtkActor. To use textures, the geometry must have
##  texture coordinates, and the texture must be set with SetTexture().
##
##  @sa
##  vtkActor2D vtkProp vtkMapper2D vtkProperty2D
##

import
  vtkActor2D, vtkRenderingCoreModule

discard "forward decl of vtkProp"
discard "forward decl of vtkTexture"
discard "forward decl of vtkViewport"
discard "forward decl of vtkWindow"
type
  vtkTexturedActor2D* {.importcpp: "vtkTexturedActor2D",
                       header: "vtkTexturedActor2D.h", bycopy.} = object of vtkActor2D
    vtkTexturedActor2D* {.importc: "vtkTexturedActor2D".}: VTK_NEWINSTANCE


proc New*(): ptr vtkTexturedActor2D {.importcpp: "vtkTexturedActor2D::New(@)",
                                  header: "vtkTexturedActor2D.h".}
proc PrintSelf*(this: var vtkTexturedActor2D; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTexturedActor2D.h".}
type
  vtkTexturedActor2DSuperclass* = vtkActor2D

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTexturedActor2D::IsTypeOf(@)", header: "vtkTexturedActor2D.h".}
proc IsA*(this: var vtkTexturedActor2D; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTexturedActor2D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTexturedActor2D {.
    importcpp: "vtkTexturedActor2D::SafeDownCast(@)",
    header: "vtkTexturedActor2D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTexturedActor2D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkActor2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTexturedActor2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTexturedActor2D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc SetTexture*(this: var vtkTexturedActor2D; texture: ptr vtkTexture) {.
    importcpp: "SetTexture", header: "vtkTexturedActor2D.h".}
proc GetnameTexture*(this: var vtkTexturedActor2D): ptr vtkTexture {.
    importcpp: "GetnameTexture", header: "vtkTexturedActor2D.h".}
  ## /@}
  ## *
  ##  Release any graphics resources that are being consumed by this actor.
  ##  The parameter window could be used to determine which graphic
  ##  resources to release.
  ##
proc ReleaseGraphicsResources*(this: var vtkTexturedActor2D; win: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkTexturedActor2D.h".}
proc RenderOverlay*(this: var vtkTexturedActor2D; viewport: ptr vtkViewport): cint {.
    importcpp: "RenderOverlay", header: "vtkTexturedActor2D.h".}
proc RenderOpaqueGeometry*(this: var vtkTexturedActor2D; viewport: ptr vtkViewport): cint {.
    importcpp: "RenderOpaqueGeometry", header: "vtkTexturedActor2D.h".}
proc RenderTranslucentPolygonalGeometry*(this: var vtkTexturedActor2D;
                                        viewport: ptr vtkViewport): cint {.
    importcpp: "RenderTranslucentPolygonalGeometry",
    header: "vtkTexturedActor2D.h".}
proc GetMTime*(this: var vtkTexturedActor2D): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkTexturedActor2D.h".}
proc ShallowCopy*(this: var vtkTexturedActor2D; prop: ptr vtkProp) {.
    importcpp: "ShallowCopy", header: "vtkTexturedActor2D.h".}