## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLightActor.h
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
##  @class   vtkLightActor
##  @brief   a cone and a frustum to represent a spotlight.
##
##  vtkLightActor is a composite actor used to represent a spotlight. The cone
##  angle is equal to the spotlight angle, the cone apex is at the position of
##  the light, the direction of the light goes from the cone apex to the center
##  of the base of the cone. The square frustum position is the light position,
##  the frustum focal point is in the direction of the light direction. The
##  frustum vertical view angle (aperture) (this is also the horizontal view
##  angle as the frustum is square) is equal to twice the cone angle. The
##  clipping range of the frustum is arbitrary set by the user
##  (initially at 0.5,11.0).
##
##  @warning
##  Right now only spotlight are supported but directional light might be
##  supported in the future.
##
##  @sa
##  vtkLight vtkConeSource vtkFrustumSource vtkCameraActor
##

import
  vtkProp3D, vtkRenderingCoreModule

discard "forward decl of vtkLight"
discard "forward decl of vtkConeSource"
discard "forward decl of vtkPolyDataMapper"
discard "forward decl of vtkActor"
discard "forward decl of vtkCamera"
discard "forward decl of vtkCameraActor"
discard "forward decl of vtkBoundingBox"
discard "forward decl of vtkProperty"
type
  vtkLightActor* {.importcpp: "vtkLightActor", header: "vtkLightActor.h", bycopy.} = object of vtkProp3D
    vtkLightActor* {.importc: "vtkLightActor".}: VTK_NEWINSTANCE


proc New*(): ptr vtkLightActor {.importcpp: "vtkLightActor::New(@)",
                             header: "vtkLightActor.h".}
type
  vtkLightActorSuperclass* = vtkProp3D

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkLightActor::IsTypeOf(@)", header: "vtkLightActor.h".}
proc IsA*(this: var vtkLightActor; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkLightActor.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkLightActor {.
    importcpp: "vtkLightActor::SafeDownCast(@)", header: "vtkLightActor.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkLightActor :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkProp3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLightActor :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLightActor :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkLightActor; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkLightActor.h".}
proc SetLight*(this: var vtkLightActor; light: ptr vtkLight) {.importcpp: "SetLight",
    header: "vtkLightActor.h".}
proc GetnameLight*(this: var vtkLightActor): ptr vtkLight {.importcpp: "GetnameLight",
    header: "vtkLightActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the location of the near and far clipping planes along the
  ##  direction of projection.  Both of these values must be positive.
  ##  Initial values are  (0.5,11.0)
  ##
proc SetClippingRange*(this: var vtkLightActor; dNear: cdouble; dFar: cdouble) {.
    importcpp: "SetClippingRange", header: "vtkLightActor.h".}
proc SetClippingRange*(this: var vtkLightActor; a: array[2, cdouble]) {.
    importcpp: "SetClippingRange", header: "vtkLightActor.h".}
## !!!Ignored construct:  virtual double * GetClippingRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ClippingRange  pointer  << this -> ClippingRange ) ; return this -> ClippingRange ; } VTK_WRAPEXCLUDE virtual void GetClippingRange ( double & _arg1 , double & _arg2 ) { _arg1 = this -> ClippingRange [ 0 ] ; _arg2 = this -> ClippingRange [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << ClippingRange  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetClippingRange ( double _arg [ 2 ] ) { this -> GetClippingRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc GetConeProperty*(this: var vtkLightActor): ptr vtkProperty {.
    importcpp: "GetConeProperty", header: "vtkLightActor.h".}
proc GetFrustumProperty*(this: var vtkLightActor): ptr vtkProperty {.
    importcpp: "GetFrustumProperty", header: "vtkLightActor.h".}
proc RenderOpaqueGeometry*(this: var vtkLightActor; viewport: ptr vtkViewport): cint {.
    importcpp: "RenderOpaqueGeometry", header: "vtkLightActor.h".}
proc HasTranslucentPolygonalGeometry*(this: var vtkLightActor): vtkTypeBool {.
    importcpp: "HasTranslucentPolygonalGeometry", header: "vtkLightActor.h".}
proc ReleaseGraphicsResources*(this: var vtkLightActor; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkLightActor.h".}
proc GetBounds*(this: var vtkLightActor): ptr cdouble {.importcpp: "GetBounds",
    header: "vtkLightActor.h".}
proc GetMTime*(this: var vtkLightActor): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkLightActor.h".}