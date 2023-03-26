## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTextActor3D.h
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
##  @class   vtkTextActor3D
##  @brief   An actor that displays text.
##
##  The input text is rendered into a buffer, which in turn is used as a
##  texture applied onto a quad (a vtkImageActor is used under the hood).
##  @warning
##  This class is experimental at the moment.
##  - The orientation is not optimized, the quad should be oriented, not
##    the text itself when it is rendered in the buffer (we end up with
##    excessively big textures for 45 degrees angles).
##    This will be fixed first.
##  - No checking is done at the moment regarding hardware texture size limits.
##
##  @sa
##  vtkProp3D
##

import
  vtkProp3D, vtkRenderingCoreModule

discard "forward decl of vtkImageActor"
discard "forward decl of vtkImageData"
discard "forward decl of vtkTextProperty"
type
  vtkTextActor3D* {.importcpp: "vtkTextActor3D", header: "vtkTextActor3D.h", bycopy.} = object of vtkProp3D
    vtkTextActor3D* {.importc: "vtkTextActor3D".}: VTK_NEWINSTANCE


proc New*(): ptr vtkTextActor3D {.importcpp: "vtkTextActor3D::New(@)",
                              header: "vtkTextActor3D.h".}
type
  vtkTextActor3DSuperclass* = vtkProp3D

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTextActor3D::IsTypeOf(@)", header: "vtkTextActor3D.h".}
proc IsA*(this: var vtkTextActor3D; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkTextActor3D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTextActor3D {.
    importcpp: "vtkTextActor3D::SafeDownCast(@)", header: "vtkTextActor3D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTextActor3D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkProp3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTextActor3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTextActor3D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTextActor3D; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTextActor3D.h".}
proc SetInput*(this: var vtkTextActor3D; _arg: cstring) {.importcpp: "SetInput",
    header: "vtkTextActor3D.h".}
proc GetInput*(this: var vtkTextActor3D): cstring {.importcpp: "GetInput",
    header: "vtkTextActor3D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the text property.
  ##
proc SetTextProperty*(this: var vtkTextActor3D; p: ptr vtkTextProperty) {.
    importcpp: "SetTextProperty", header: "vtkTextActor3D.h".}
proc GetnameTextProperty*(this: var vtkTextActor3D): ptr vtkTextProperty {.
    importcpp: "GetnameTextProperty", header: "vtkTextActor3D.h".}
  ## /@}
  ## *
  ##  Since a 3D text actor is not pixel-aligned and positioned in 3D space,
  ##  the text is rendered at a constant DPI, rather than using the current
  ##  window DPI. This static method returns the DPI value used to produce the
  ##  text images.
  ##
proc GetRenderedDPI*(): cint {.importcpp: "vtkTextActor3D::GetRenderedDPI(@)",
                            header: "vtkTextActor3D.h".}
proc ShallowCopy*(this: var vtkTextActor3D; prop: ptr vtkProp) {.
    importcpp: "ShallowCopy", header: "vtkTextActor3D.h".}
## !!!Ignored construct:  *
##  Get the bounds for this Prop3D as (Xmin,Xmax,Ymin,Ymax,Zmin,Zmax).
##  double * GetBounds ( ) VTK_SIZEHINT ( 6 ) override ;
## Error: expected ';'!!!

proc GetBounds*(this: var vtkTextActor3D; bounds: array[6, cdouble]) {.
    importcpp: "GetBounds", header: "vtkTextActor3D.h".}
proc GetBoundingBox*(this: var vtkTextActor3D; bbox: array[4, cint]): cint {.
    importcpp: "GetBoundingBox", header: "vtkTextActor3D.h".}
proc ReleaseGraphicsResources*(this: var vtkTextActor3D; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkTextActor3D.h".}
proc SetForceOpaque*(this: var vtkTextActor3D; opaque: bool) {.
    importcpp: "SetForceOpaque", header: "vtkTextActor3D.h".}
proc GetForceOpaque*(this: var vtkTextActor3D): bool {.importcpp: "GetForceOpaque",
    header: "vtkTextActor3D.h".}
proc ForceOpaqueOn*(this: var vtkTextActor3D) {.importcpp: "ForceOpaqueOn",
    header: "vtkTextActor3D.h".}
proc ForceOpaqueOff*(this: var vtkTextActor3D) {.importcpp: "ForceOpaqueOff",
    header: "vtkTextActor3D.h".}
proc SetForceTranslucent*(this: var vtkTextActor3D; trans: bool) {.
    importcpp: "SetForceTranslucent", header: "vtkTextActor3D.h".}
proc GetForceTranslucent*(this: var vtkTextActor3D): bool {.
    importcpp: "GetForceTranslucent", header: "vtkTextActor3D.h".}
proc ForceTranslucentOn*(this: var vtkTextActor3D) {.
    importcpp: "ForceTranslucentOn", header: "vtkTextActor3D.h".}
proc ForceTranslucentOff*(this: var vtkTextActor3D) {.
    importcpp: "ForceTranslucentOff", header: "vtkTextActor3D.h".}
proc RenderOpaqueGeometry*(this: var vtkTextActor3D; viewport: ptr vtkViewport): cint {.
    importcpp: "RenderOpaqueGeometry", header: "vtkTextActor3D.h".}
proc RenderTranslucentPolygonalGeometry*(this: var vtkTextActor3D;
                                        viewport: ptr vtkViewport): cint {.
    importcpp: "RenderTranslucentPolygonalGeometry", header: "vtkTextActor3D.h".}
proc RenderOverlay*(this: var vtkTextActor3D; viewport: ptr vtkViewport): cint {.
    importcpp: "RenderOverlay", header: "vtkTextActor3D.h".}
proc HasTranslucentPolygonalGeometry*(this: var vtkTextActor3D): vtkTypeBool {.
    importcpp: "HasTranslucentPolygonalGeometry", header: "vtkTextActor3D.h".}