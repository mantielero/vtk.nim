## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBillboardTextActor3D.h
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
##  @class vtkBillboardTextActor3D
##  @brief Renders pixel-aligned text, facing the camera, anchored at a 3D point.
##

import
  vtkNew, vtkProp3D, vtkRenderingCoreModule, vtkSmartPointer

discard "forward decl of vtkActor"
discard "forward decl of vtkImageData"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkPolyDataMapper"
discard "forward decl of vtkRenderer"
discard "forward decl of vtkTextProperty"
discard "forward decl of vtkTextRenderer"
discard "forward decl of vtkTexture"
type
  vtkBillboardTextActor3D* {.importcpp: "vtkBillboardTextActor3D",
                            header: "vtkBillboardTextActor3D.h", bycopy.} = object of vtkProp3D
    vtkBillboardTextActor3D* {.importc: "vtkBillboardTextActor3D".}: VTK_NEWINSTANCE
    ##  Offset in display coordinates.
    ##  Cached metadata to determine if things need rebuildin'
    ##  We cache this so we can recompute the bounds between renders, if needed.
    ##  Rendering stuffies
    ##  Display coordinate for anchor position. Z value is in NDC.
    ##  Cached for GL2PS export on OpenGL2:


proc New*(): ptr vtkBillboardTextActor3D {.importcpp: "vtkBillboardTextActor3D::New(@)",
                                       header: "vtkBillboardTextActor3D.h".}
type
  vtkBillboardTextActor3DSuperclass* = vtkProp3D

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkBillboardTextActor3D::IsTypeOf(@)",
    header: "vtkBillboardTextActor3D.h".}
proc IsA*(this: var vtkBillboardTextActor3D; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkBillboardTextActor3D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkBillboardTextActor3D {.
    importcpp: "vtkBillboardTextActor3D::SafeDownCast(@)",
    header: "vtkBillboardTextActor3D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkBillboardTextActor3D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkProp3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBillboardTextActor3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBillboardTextActor3D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkBillboardTextActor3D; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkBillboardTextActor3D.h".}
proc GetActors*(this: var vtkBillboardTextActor3D; a2: ptr vtkPropCollection) {.
    importcpp: "GetActors", header: "vtkBillboardTextActor3D.h".}
proc UpdateGeometry*(this: var vtkBillboardTextActor3D; vp: ptr vtkViewport) {.
    importcpp: "UpdateGeometry", header: "vtkBillboardTextActor3D.h".}
proc SetInput*(this: var vtkBillboardTextActor3D; `in`: cstring) {.
    importcpp: "SetInput", header: "vtkBillboardTextActor3D.h".}
proc GetInput*(this: var vtkBillboardTextActor3D): cstring {.importcpp: "GetInput",
    header: "vtkBillboardTextActor3D.h".}
  ## * @}
  ## *
  ##  Can be used to set a fixed offset from the anchor point.
  ##  Use display coordinates.
  ##  @{
  ##
## !!!Ignored construct:  virtual int * GetDisplayOffset ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << DisplayOffset  pointer  << this -> DisplayOffset ) ; return this -> DisplayOffset ; } VTK_WRAPEXCLUDE virtual void GetDisplayOffset ( int & _arg1 , int & _arg2 ) { _arg1 = this -> DisplayOffset [ 0 ] ; _arg2 = this -> DisplayOffset [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << DisplayOffset  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetDisplayOffset ( int _arg [ 2 ] ) { this -> GetDisplayOffset ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetDisplayOffset*(this: var vtkBillboardTextActor3D; _arg1: cint; _arg2: cint) {.
    importcpp: "SetDisplayOffset", header: "vtkBillboardTextActor3D.h".}
proc SetDisplayOffset*(this: var vtkBillboardTextActor3D; _arg: array[2, cint]) {.
    importcpp: "SetDisplayOffset", header: "vtkBillboardTextActor3D.h".}
  ## * @}
  ## *
  ##  The vtkTextProperty object that controls the rendered text.
  ##  @{
  ##
proc SetTextProperty*(this: var vtkBillboardTextActor3D; tprop: ptr vtkTextProperty) {.
    importcpp: "SetTextProperty", header: "vtkBillboardTextActor3D.h".}
proc GetnameTextProperty*(this: var vtkBillboardTextActor3D): ptr vtkTextProperty {.
    importcpp: "GetnameTextProperty", header: "vtkBillboardTextActor3D.h".}
  ## * @}
  ## *
  ##  Force the actor to render during the opaque or translucent pass.
  ##  @{
  ##
proc SetForceOpaque*(this: var vtkBillboardTextActor3D; opaque: bool) {.
    importcpp: "SetForceOpaque", header: "vtkBillboardTextActor3D.h".}
proc GetForceOpaque*(this: var vtkBillboardTextActor3D): bool {.
    importcpp: "GetForceOpaque", header: "vtkBillboardTextActor3D.h".}
proc ForceOpaqueOn*(this: var vtkBillboardTextActor3D) {.importcpp: "ForceOpaqueOn",
    header: "vtkBillboardTextActor3D.h".}
proc ForceOpaqueOff*(this: var vtkBillboardTextActor3D) {.
    importcpp: "ForceOpaqueOff", header: "vtkBillboardTextActor3D.h".}
proc SetForceTranslucent*(this: var vtkBillboardTextActor3D; trans: bool) {.
    importcpp: "SetForceTranslucent", header: "vtkBillboardTextActor3D.h".}
proc GetForceTranslucent*(this: var vtkBillboardTextActor3D): bool {.
    importcpp: "GetForceTranslucent", header: "vtkBillboardTextActor3D.h".}
proc ForceTranslucentOn*(this: var vtkBillboardTextActor3D) {.
    importcpp: "ForceTranslucentOn", header: "vtkBillboardTextActor3D.h".}
proc ForceTranslucentOff*(this: var vtkBillboardTextActor3D) {.
    importcpp: "ForceTranslucentOff", header: "vtkBillboardTextActor3D.h".}
proc HasTranslucentPolygonalGeometry*(this: var vtkBillboardTextActor3D): vtkTypeBool {.
    importcpp: "HasTranslucentPolygonalGeometry",
    header: "vtkBillboardTextActor3D.h".}
proc RenderOpaqueGeometry*(this: var vtkBillboardTextActor3D; vp: ptr vtkViewport): cint {.
    importcpp: "RenderOpaqueGeometry", header: "vtkBillboardTextActor3D.h".}
proc RenderTranslucentPolygonalGeometry*(this: var vtkBillboardTextActor3D;
                                        vp: ptr vtkViewport): cint {.
    importcpp: "RenderTranslucentPolygonalGeometry",
    header: "vtkBillboardTextActor3D.h".}
proc ReleaseGraphicsResources*(this: var vtkBillboardTextActor3D; win: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkBillboardTextActor3D.h".}
proc GetBounds*(this: var vtkBillboardTextActor3D): ptr cdouble {.
    importcpp: "GetBounds", header: "vtkBillboardTextActor3D.h".}
## using statement

## !!!Ignored construct:  *
##  Returns the anchor position in display coordinates, with depth in NDC.
##  Valid after calling RenderOpaqueGeometry.
##  virtual double * GetAnchorDCAnchorDC ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << AnchorDC  pointer  << this -> AnchorDC ) ; return this -> AnchorDC ; } VTK_WRAPEXCLUDE virtual void GetAnchorDCAnchorDC ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> AnchorDC [ 0 ] ; _arg2 = this -> AnchorDC [ 1 ] ; _arg3 = this -> AnchorDC [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << AnchorDC  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetAnchorDCAnchorDC ( double _arg [ 3 ] ) { this -> GetAnchorDCAnchorDC ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!
