## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCamera.h
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
##  @class   vtkCamera
##  @brief   a virtual camera for 3D rendering
##
##  vtkCamera is a virtual camera for 3D rendering. It provides methods
##  to position and orient the view point and focal point. Convenience
##  methods for moving about the focal point also are provided. More
##  complex methods allow the manipulation of the computer graphics
##  model including view up vector, clipping planes, and
##  camera perspective.
##  @sa
##  vtkPerspectiveTransform
##

import
  vtkObject, vtkRect, vtkRenderingCoreModule

discard "forward decl of vtkHomogeneousTransform"
discard "forward decl of vtkInformation"
discard "forward decl of vtkMatrix4x4"
discard "forward decl of vtkPerspectiveTransform"
discard "forward decl of vtkRenderer"
discard "forward decl of vtkTransform"
discard "forward decl of vtkCallbackCommand"
discard "forward decl of vtkCameraCallbackCommand"
type
  vtkCamera* {.importcpp: "vtkCamera", header: "vtkCamera.h", bycopy.} = object of vtkObject
    vtkCamera* {.importc: "vtkCamera".}: VTK_NEWINSTANCE
    ##  Arbitrary extra information associated with this camera.

  vtkCameraSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkCamera::IsTypeOf(@)",
    header: "vtkCamera.h".}
proc IsA*(this: var vtkCamera; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkCamera.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCamera {.
    importcpp: "vtkCamera::SafeDownCast(@)", header: "vtkCamera.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCamera :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCamera :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCamera :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCamera; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCamera.h".}
proc New*(): ptr vtkCamera {.importcpp: "vtkCamera::New(@)", header: "vtkCamera.h".}
proc SetPosition*(this: var vtkCamera; x: cdouble; y: cdouble; z: cdouble) {.
    importcpp: "SetPosition", header: "vtkCamera.h".}
proc SetPosition*(this: var vtkCamera; a: array[3, cdouble]) {.
    importcpp: "SetPosition", header: "vtkCamera.h".}
## !!!Ignored construct:  virtual double * GetPosition ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Position  pointer  << this -> Position ) ; return this -> Position ; } VTK_WRAPEXCLUDE virtual void GetPosition ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Position [ 0 ] ; _arg2 = this -> Position [ 1 ] ; _arg3 = this -> Position [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Position  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetPosition ( double _arg [ 3 ] ) { this -> GetPosition ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetFocalPoint*(this: var vtkCamera; x: cdouble; y: cdouble; z: cdouble) {.
    importcpp: "SetFocalPoint", header: "vtkCamera.h".}
proc SetFocalPoint*(this: var vtkCamera; a: array[3, cdouble]) {.
    importcpp: "SetFocalPoint", header: "vtkCamera.h".}
## !!!Ignored construct:  virtual double * GetPositionFocalPoint ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << FocalPoint  pointer  << this -> FocalPoint ) ; return this -> FocalPoint ; } VTK_WRAPEXCLUDE virtual void GetPositionFocalPoint ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> FocalPoint [ 0 ] ; _arg2 = this -> FocalPoint [ 1 ] ; _arg3 = this -> FocalPoint [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << FocalPoint  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetPositionFocalPoint ( double _arg [ 3 ] ) { this -> GetPositionFocalPoint ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetViewUp*(this: var vtkCamera; vx: cdouble; vy: cdouble; vz: cdouble) {.
    importcpp: "SetViewUp", header: "vtkCamera.h".}
proc SetViewUp*(this: var vtkCamera; a: array[3, cdouble]) {.importcpp: "SetViewUp",
    header: "vtkCamera.h".}
## !!!Ignored construct:  virtual double * GetPositionFocalPointViewUp ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ViewUp  pointer  << this -> ViewUp ) ; return this -> ViewUp ; } VTK_WRAPEXCLUDE virtual void GetPositionFocalPointViewUp ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> ViewUp [ 0 ] ; _arg2 = this -> ViewUp [ 1 ] ; _arg3 = this -> ViewUp [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << ViewUp  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetPositionFocalPointViewUp ( double _arg [ 3 ] ) { this -> GetPositionFocalPointViewUp ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc OrthogonalizeViewUp*(this: var vtkCamera) {.importcpp: "OrthogonalizeViewUp",
    header: "vtkCamera.h".}
proc SetDistance*(this: var vtkCamera; a2: cdouble) {.importcpp: "SetDistance",
    header: "vtkCamera.h".}
## !!!Ignored construct:  /@{ *
##  Return the distance from the camera position to the focal point.
##  This distance is positive.
##  virtual double GetDistanceDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Distance  of  << this -> Distance ) ; return this -> Distance ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get the vector in the direction from the camera position to the
##  focal point.  This is usually the opposite of the ViewPlaneNormal,
##  the vector perpendicular to the screen, unless the view is oblique.
##  virtual double * GetPositionFocalPointViewUpDirectionOfProjectionDirectionOfProjection ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << DirectionOfProjection  pointer  << this -> DirectionOfProjection ) ; return this -> DirectionOfProjection ; } VTK_WRAPEXCLUDE virtual void GetPositionFocalPointViewUpDirectionOfProjectionDirectionOfProjection ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> DirectionOfProjection [ 0 ] ; _arg2 = this -> DirectionOfProjection [ 1 ] ; _arg3 = this -> DirectionOfProjection [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << DirectionOfProjection  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetPositionFocalPointViewUpDirectionOfProjectionDirectionOfProjection ( double _arg [ 3 ] ) { this -> GetPositionFocalPointViewUpDirectionOfProjectionDirectionOfProjection ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc Dolly*(this: var vtkCamera; value: cdouble) {.importcpp: "Dolly",
    header: "vtkCamera.h".}
proc SetRoll*(this: var vtkCamera; angle: cdouble) {.importcpp: "SetRoll",
    header: "vtkCamera.h".}
proc GetRoll*(this: var vtkCamera): cdouble {.importcpp: "GetRoll",
    header: "vtkCamera.h".}
proc Roll*(this: var vtkCamera; angle: cdouble) {.importcpp: "Roll",
    header: "vtkCamera.h".}
proc Azimuth*(this: var vtkCamera; angle: cdouble) {.importcpp: "Azimuth",
    header: "vtkCamera.h".}
proc Yaw*(this: var vtkCamera; angle: cdouble) {.importcpp: "Yaw", header: "vtkCamera.h".}
proc Elevation*(this: var vtkCamera; angle: cdouble) {.importcpp: "Elevation",
    header: "vtkCamera.h".}
proc Pitch*(this: var vtkCamera; angle: cdouble) {.importcpp: "Pitch",
    header: "vtkCamera.h".}
proc SetParallelProjection*(this: var vtkCamera; flag: vtkTypeBool) {.
    importcpp: "SetParallelProjection", header: "vtkCamera.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetDistanceDistanceParallelProjection ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ParallelProjection  of  << this -> ParallelProjection ) ; return this -> ParallelProjection ; } ;
## Error: expected ';'!!!

proc ParallelProjectionOn*(this: var vtkCamera) {.importcpp: "ParallelProjectionOn",
    header: "vtkCamera.h".}
proc ParallelProjectionOff*(this: var vtkCamera) {.
    importcpp: "ParallelProjectionOff", header: "vtkCamera.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the value of the UseHorizontalViewAngle instance variable. If
  ##  set, the camera's view angle represents a horizontal view angle, rather
  ##  than the default vertical view angle. This is useful if the application
  ##  uses a display device which whose specs indicate a particular horizontal
  ##  view angle, or if the application varies the window height but wants to
  ##  keep the perspective transform unchanges.
  ##  @note This setting is ignored when UseExplicitProjectionTransformMatrix
  ##  is true.
  ##
proc SetUseHorizontalViewAngle*(this: var vtkCamera; flag: vtkTypeBool) {.
    importcpp: "SetUseHorizontalViewAngle", header: "vtkCamera.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetDistanceDistanceParallelProjectionUseHorizontalViewAngle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseHorizontalViewAngle  of  << this -> UseHorizontalViewAngle ) ; return this -> UseHorizontalViewAngle ; } ;
## Error: expected ';'!!!

proc UseHorizontalViewAngleOn*(this: var vtkCamera) {.
    importcpp: "UseHorizontalViewAngleOn", header: "vtkCamera.h".}
proc UseHorizontalViewAngleOff*(this: var vtkCamera) {.
    importcpp: "UseHorizontalViewAngleOff", header: "vtkCamera.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the camera view angle, which is the angular height of the
  ##  camera view measured in degrees.  The default angle is 30 degrees.
  ##  This method has no effect in parallel projection mode.
  ##  The formula for setting the angle up for perfect perspective viewing
  ##  is: angle = 2*atan((h/2)/d) where h is the height of the RenderWindow
  ##  (measured by holding a ruler up to your screen) and d is the
  ##  distance from your eyes to the screen.
  ##  @note This setting is ignored when UseExplicitProjectionTransformMatrix
  ##  is true.
  ##
proc SetViewAngle*(this: var vtkCamera; angle: cdouble) {.importcpp: "SetViewAngle",
    header: "vtkCamera.h".}
## !!!Ignored construct:  virtual double GetDistanceDistanceParallelProjectionUseHorizontalViewAngleViewAngle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ViewAngle  of  << this -> ViewAngle ) ; return this -> ViewAngle ; } ;
## Error: expected ';'!!!

proc SetParallelScale*(this: var vtkCamera; scale: cdouble) {.
    importcpp: "SetParallelScale", header: "vtkCamera.h".}
## !!!Ignored construct:  virtual double GetDistanceDistanceParallelProjectionUseHorizontalViewAngleViewAngleParallelScale ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ParallelScale  of  << this -> ParallelScale ) ; return this -> ParallelScale ; } ;
## Error: expected ';'!!!

proc Zoom*(this: var vtkCamera; factor: cdouble) {.importcpp: "Zoom",
    header: "vtkCamera.h".}
proc SetClippingRange*(this: var vtkCamera; dNear: cdouble; dFar: cdouble) {.
    importcpp: "SetClippingRange", header: "vtkCamera.h".}
proc SetClippingRange*(this: var vtkCamera; a: array[2, cdouble]) {.
    importcpp: "SetClippingRange", header: "vtkCamera.h".}
## !!!Ignored construct:  virtual double * GetClippingRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ClippingRange  pointer  << this -> ClippingRange ) ; return this -> ClippingRange ; } VTK_WRAPEXCLUDE virtual void GetClippingRange ( double & _arg1 , double & _arg2 ) { _arg1 = this -> ClippingRange [ 0 ] ; _arg2 = this -> ClippingRange [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << ClippingRange  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetClippingRange ( double _arg [ 2 ] ) { this -> GetClippingRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetThickness*(this: var vtkCamera; a2: cdouble) {.importcpp: "SetThickness",
    header: "vtkCamera.h".}
## !!!Ignored construct:  virtual double GetDistanceDistanceParallelProjectionUseHorizontalViewAngleViewAngleParallelScaleThickness ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Thickness  of  << this -> Thickness ) ; return this -> Thickness ; } ;
## Error: expected ';'!!!

proc SetWindowCenter*(this: var vtkCamera; x: cdouble; y: cdouble) {.
    importcpp: "SetWindowCenter", header: "vtkCamera.h".}
## !!!Ignored construct:  virtual double * GetClippingRangeWindowCenter ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << WindowCenter  pointer  << this -> WindowCenter ) ; return this -> WindowCenter ; } VTK_WRAPEXCLUDE virtual void GetClippingRangeWindowCenter ( double & _arg1 , double & _arg2 ) { _arg1 = this -> WindowCenter [ 0 ] ; _arg2 = this -> WindowCenter [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << WindowCenter  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetClippingRangeWindowCenter ( double _arg [ 2 ] ) { this -> GetClippingRangeWindowCenter ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetObliqueAngles*(this: var vtkCamera; alpha: cdouble; beta: cdouble) {.
    importcpp: "SetObliqueAngles", header: "vtkCamera.h".}
proc ApplyTransform*(this: var vtkCamera; t: ptr vtkTransform) {.
    importcpp: "ApplyTransform", header: "vtkCamera.h".}
## !!!Ignored construct:  /@{ *
##  Get the ViewPlaneNormal.  This vector will point opposite to
##  the direction of projection, unless you have created a sheared output
##  view using SetViewShear/SetObliqueAngles.
##  virtual double * GetPositionFocalPointViewUpDirectionOfProjectionDirectionOfProjectionViewPlaneNormalViewPlaneNormal ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ViewPlaneNormal  pointer  << this -> ViewPlaneNormal ) ; return this -> ViewPlaneNormal ; } VTK_WRAPEXCLUDE virtual void GetPositionFocalPointViewUpDirectionOfProjectionDirectionOfProjectionViewPlaneNormalViewPlaneNormal ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> ViewPlaneNormal [ 0 ] ; _arg2 = this -> ViewPlaneNormal [ 1 ] ; _arg3 = this -> ViewPlaneNormal [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << ViewPlaneNormal  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetPositionFocalPointViewUpDirectionOfProjectionDirectionOfProjectionViewPlaneNormalViewPlaneNormal ( double _arg [ 3 ] ) { this -> GetPositionFocalPointViewUpDirectionOfProjectionDirectionOfProjectionViewPlaneNormalViewPlaneNormal ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetViewShear*(this: var vtkCamera; dxdz: cdouble; dydz: cdouble; center: cdouble) {.
    importcpp: "SetViewShear", header: "vtkCamera.h".}
proc SetViewShear*(this: var vtkCamera; d: array[3, cdouble]) {.
    importcpp: "SetViewShear", header: "vtkCamera.h".}
## !!!Ignored construct:  virtual double * GetPositionFocalPointViewUpDirectionOfProjectionDirectionOfProjectionViewPlaneNormalViewPlaneNormalViewShear ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ViewShear  pointer  << this -> ViewShear ) ; return this -> ViewShear ; } VTK_WRAPEXCLUDE virtual void GetPositionFocalPointViewUpDirectionOfProjectionDirectionOfProjectionViewPlaneNormalViewPlaneNormalViewShear ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> ViewShear [ 0 ] ; _arg2 = this -> ViewShear [ 1 ] ; _arg3 = this -> ViewShear [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << ViewShear  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetPositionFocalPointViewUpDirectionOfProjectionDirectionOfProjectionViewPlaneNormalViewPlaneNormalViewShear ( double _arg [ 3 ] ) { this -> GetPositionFocalPointViewUpDirectionOfProjectionDirectionOfProjectionViewPlaneNormalViewPlaneNormalViewShear ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetEyeAngle*(this: var vtkCamera; _arg: cdouble) {.importcpp: "SetEyeAngle",
    header: "vtkCamera.h".}
## !!!Ignored construct:  virtual double GetDistanceDistanceParallelProjectionUseHorizontalViewAngleViewAngleParallelScaleThicknessEyeAngle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EyeAngle  of  << this -> EyeAngle ) ; return this -> EyeAngle ; } ;
## Error: expected ';'!!!

proc SetEyeAngleFocalDisk*(this: var vtkCamera; _arg: cdouble) {.
    importcpp: "SetEyeAngleFocalDisk", header: "vtkCamera.h".}
## !!!Ignored construct:  virtual double GetDistanceDistanceParallelProjectionUseHorizontalViewAngleViewAngleParallelScaleThicknessEyeAngleFocalDisk ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FocalDisk  of  << this -> FocalDisk ) ; return this -> FocalDisk ; } ;
## Error: expected ';'!!!

proc SetEyeAngleFocalDiskFocalDistance*(this: var vtkCamera; _arg: cdouble) {.
    importcpp: "SetEyeAngleFocalDiskFocalDistance", header: "vtkCamera.h".}
## !!!Ignored construct:  virtual double GetDistanceDistanceParallelProjectionUseHorizontalViewAngleViewAngleParallelScaleThicknessEyeAngleFocalDiskFocalDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FocalDistance  of  << this -> FocalDistance ) ; return this -> FocalDistance ; } ;
## Error: expected ';'!!!

proc SetEyeAngleFocalDiskFocalDistanceUseOffAxisProjection*(this: var vtkCamera;
    _arg: vtkTypeBool) {.importcpp: "SetEyeAngleFocalDiskFocalDistanceUseOffAxisProjection",
                       header: "vtkCamera.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetDistanceDistanceParallelProjectionUseHorizontalViewAngleViewAngleParallelScaleThicknessEyeAngleFocalDiskFocalDistanceUseOffAxisProjection ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseOffAxisProjection  of  << this -> UseOffAxisProjection ) ; return this -> UseOffAxisProjection ; } ;
## Error: expected ';'!!!

proc UseOffAxisProjectionOn*(this: var vtkCamera) {.
    importcpp: "UseOffAxisProjectionOn", header: "vtkCamera.h".}
proc UseOffAxisProjectionOff*(this: var vtkCamera) {.
    importcpp: "UseOffAxisProjectionOff", header: "vtkCamera.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get top left corner point of the screen.
  ##  This will be used only for offaxis frustum calculation.
  ##  Default is (-1.0, -1.0, -1.0).
  ##
proc SetScreenBottomLeft*(this: var vtkCamera; _arg1: cdouble; _arg2: cdouble;
                         _arg3: cdouble) {.importcpp: "SetScreenBottomLeft",
    header: "vtkCamera.h".}
proc SetScreenBottomLeft*(this: var vtkCamera; _arg: array[3, cdouble]) {.
    importcpp: "SetScreenBottomLeft", header: "vtkCamera.h".}
## !!!Ignored construct:  virtual double * GetPositionFocalPointViewUpDirectionOfProjectionDirectionOfProjectionViewPlaneNormalViewPlaneNormalViewShearScreenBottomLeft ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ScreenBottomLeft  pointer  << this -> ScreenBottomLeft ) ; return this -> ScreenBottomLeft ; } VTK_WRAPEXCLUDE virtual void GetPositionFocalPointViewUpDirectionOfProjectionDirectionOfProjectionViewPlaneNormalViewPlaneNormalViewShearScreenBottomLeft ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> ScreenBottomLeft [ 0 ] ; _arg2 = this -> ScreenBottomLeft [ 1 ] ; _arg3 = this -> ScreenBottomLeft [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << ScreenBottomLeft  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetPositionFocalPointViewUpDirectionOfProjectionDirectionOfProjectionViewPlaneNormalViewPlaneNormalViewShearScreenBottomLeft ( double _arg [ 3 ] ) { this -> GetPositionFocalPointViewUpDirectionOfProjectionDirectionOfProjectionViewPlaneNormalViewPlaneNormalViewShearScreenBottomLeft ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetScreenBottomLeftScreenBottomRight*(this: var vtkCamera; _arg1: cdouble;
    _arg2: cdouble; _arg3: cdouble) {.importcpp: "SetScreenBottomLeftScreenBottomRight",
                                  header: "vtkCamera.h".}
proc SetScreenBottomLeftScreenBottomRight*(this: var vtkCamera;
    _arg: array[3, cdouble]) {.importcpp: "SetScreenBottomLeftScreenBottomRight",
                            header: "vtkCamera.h".}
## !!!Ignored construct:  virtual double * GetPositionFocalPointViewUpDirectionOfProjectionDirectionOfProjectionViewPlaneNormalViewPlaneNormalViewShearScreenBottomLeftScreenBottomRight ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ScreenBottomRight  pointer  << this -> ScreenBottomRight ) ; return this -> ScreenBottomRight ; } VTK_WRAPEXCLUDE virtual void GetPositionFocalPointViewUpDirectionOfProjectionDirectionOfProjectionViewPlaneNormalViewPlaneNormalViewShearScreenBottomLeftScreenBottomRight ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> ScreenBottomRight [ 0 ] ; _arg2 = this -> ScreenBottomRight [ 1 ] ; _arg3 = this -> ScreenBottomRight [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << ScreenBottomRight  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetPositionFocalPointViewUpDirectionOfProjectionDirectionOfProjectionViewPlaneNormalViewPlaneNormalViewShearScreenBottomLeftScreenBottomRight ( double _arg [ 3 ] ) { this -> GetPositionFocalPointViewUpDirectionOfProjectionDirectionOfProjectionViewPlaneNormalViewPlaneNormalViewShearScreenBottomLeftScreenBottomRight ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetScreenBottomLeftScreenBottomRightScreenTopRight*(this: var vtkCamera;
    _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetScreenBottomLeftScreenBottomRightScreenTopRight",
    header: "vtkCamera.h".}
proc SetScreenBottomLeftScreenBottomRightScreenTopRight*(this: var vtkCamera;
    _arg: array[3, cdouble]) {.importcpp: "SetScreenBottomLeftScreenBottomRightScreenTopRight",
                            header: "vtkCamera.h".}
## !!!Ignored construct:  virtual double * GetPositionFocalPointViewUpDirectionOfProjectionDirectionOfProjectionViewPlaneNormalViewPlaneNormalViewShearScreenBottomLeftScreenBottomRightScreenTopRight ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ScreenTopRight  pointer  << this -> ScreenTopRight ) ; return this -> ScreenTopRight ; } VTK_WRAPEXCLUDE virtual void GetPositionFocalPointViewUpDirectionOfProjectionDirectionOfProjectionViewPlaneNormalViewPlaneNormalViewShearScreenBottomLeftScreenBottomRightScreenTopRight ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> ScreenTopRight [ 0 ] ; _arg2 = this -> ScreenTopRight [ 1 ] ; _arg3 = this -> ScreenTopRight [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << ScreenTopRight  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetPositionFocalPointViewUpDirectionOfProjectionDirectionOfProjectionViewPlaneNormalViewPlaneNormalViewShearScreenBottomLeftScreenBottomRightScreenTopRight ( double _arg [ 3 ] ) { this -> GetPositionFocalPointViewUpDirectionOfProjectionDirectionOfProjectionViewPlaneNormalViewPlaneNormalViewShearScreenBottomLeftScreenBottomRightScreenTopRight ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetEyeAngleFocalDiskFocalDistanceUseOffAxisProjectionEyeSeparation*(
    this: var vtkCamera; _arg: cdouble) {.importcpp: "SetEyeAngleFocalDiskFocalDistanceUseOffAxisProjectionEyeSeparation",
                                     header: "vtkCamera.h".}
## !!!Ignored construct:  virtual double GetDistanceDistanceParallelProjectionUseHorizontalViewAngleViewAngleParallelScaleThicknessEyeAngleFocalDiskFocalDistanceUseOffAxisProjectionEyeSeparation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EyeSeparation  of  << this -> EyeSeparation ) ; return this -> EyeSeparation ; } ;
## Error: expected ';'!!!

proc SetEyePosition*(this: var vtkCamera; eyePosition: array[3, cdouble]) {.
    importcpp: "SetEyePosition", header: "vtkCamera.h".}
proc GetEyePosition*(this: var vtkCamera; eyePosition: array[3, cdouble]) {.
    importcpp: "GetEyePosition", header: "vtkCamera.h".}
proc GetEyePlaneNormal*(this: var vtkCamera; normal: array[3, cdouble]) {.
    importcpp: "GetEyePlaneNormal", header: "vtkCamera.h".}
proc SetEyeTransformMatrix*(this: var vtkCamera; matrix: ptr vtkMatrix4x4) {.
    importcpp: "SetEyeTransformMatrix", header: "vtkCamera.h".}
proc GetnameEyeTransformMatrix*(this: var vtkCamera): ptr vtkMatrix4x4 {.
    importcpp: "GetnameEyeTransformMatrix", header: "vtkCamera.h".}
  ## /@}
  ## *
  ##  Set the eye transform matrix.
  ##  This is the transformation matrix for the point between eyes.
  ##  This will be used only for offaxis frustum calculation.
  ##  Default is identity.
  ##
proc SetEyeTransformMatrix*(this: var vtkCamera; elements: array[16, cdouble]) {.
    importcpp: "SetEyeTransformMatrix", header: "vtkCamera.h".}
proc SetModelTransformMatrix*(this: var vtkCamera; matrix: ptr vtkMatrix4x4) {.
    importcpp: "SetModelTransformMatrix", header: "vtkCamera.h".}
proc GetnameEyeTransformMatrixModelTransformMatrix*(this: var vtkCamera): ptr vtkMatrix4x4 {.
    importcpp: "GetnameEyeTransformMatrixModelTransformMatrix",
    header: "vtkCamera.h".}
  ## /@}
  ## *
  ##  Set model transformation matrix.
  ##  This matrix could be used for model related transformations
  ##  such as scale, shear, rotations and translations.
  ##
proc SetModelTransformMatrix*(this: var vtkCamera; elements: array[16, cdouble]) {.
    importcpp: "SetModelTransformMatrix", header: "vtkCamera.h".}
proc GetModelViewTransformMatrix*(this: var vtkCamera): ptr vtkMatrix4x4 {.
    importcpp: "GetModelViewTransformMatrix", header: "vtkCamera.h".}
proc GetModelViewTransformObject*(this: var vtkCamera): ptr vtkTransform {.
    importcpp: "GetModelViewTransformObject", header: "vtkCamera.h".}
proc GetViewTransformMatrix*(this: var vtkCamera): ptr vtkMatrix4x4 {.
    importcpp: "GetViewTransformMatrix", header: "vtkCamera.h".}
proc GetViewTransformObject*(this: var vtkCamera): ptr vtkTransform {.
    importcpp: "GetViewTransformObject", header: "vtkCamera.h".}
proc SetExplicitProjectionTransformMatrix*(this: var vtkCamera; a2: ptr vtkMatrix4x4) {.
    importcpp: "SetExplicitProjectionTransformMatrix", header: "vtkCamera.h".}
proc GetnameEyeTransformMatrixModelTransformMatrixExplicitProjectionTransformMatrix*(
    this: var vtkCamera): ptr vtkMatrix4x4 {.importcpp: "GetnameEyeTransformMatrixModelTransformMatrixExplicitProjectionTransformMatrix",
                                        header: "vtkCamera.h".}
  ## *@}
  ## *
  ##  If true, the ExplicitProjectionTransformMatrix is used for the projection
  ##  transformation, rather than computing a transform from internal state.
  ##  @{
  ##
proc SetEyeAngleFocalDiskFocalDistanceUseOffAxisProjectionEyeSeparationUseExplicitProjectionTransformMatrix*(
    this: var vtkCamera; _arg: bool) {.importcpp: "SetEyeAngleFocalDiskFocalDistanceUseOffAxisProjectionEyeSeparationUseExplicitProjectionTransformMatrix",
                                  header: "vtkCamera.h".}
## !!!Ignored construct:  virtual bool GetDistanceDistanceParallelProjectionUseHorizontalViewAngleViewAngleParallelScaleThicknessEyeAngleFocalDiskFocalDistanceUseOffAxisProjectionEyeSeparationUseExplicitProjectionTransformMatrix ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseExplicitProjectionTransformMatrix  of  << this -> UseExplicitProjectionTransformMatrix ) ; return this -> UseExplicitProjectionTransformMatrix ; } ;
## Error: expected ';'!!!

proc UseExplicitProjectionTransformMatrixOn*(this: var vtkCamera) {.
    importcpp: "UseExplicitProjectionTransformMatrixOn", header: "vtkCamera.h".}
proc UseExplicitProjectionTransformMatrixOff*(this: var vtkCamera) {.
    importcpp: "UseExplicitProjectionTransformMatrixOff", header: "vtkCamera.h".}
  ## *@}
  ## *
  ##  Set/get an explicit aspect to use, rather than computing it from the renderer.
  ##  Only used when UseExplicitAspect is true.
  ##  @{
  ##
proc SetEyeAngleFocalDiskFocalDistanceUseOffAxisProjectionEyeSeparationUseExplicitProjectionTransformMatrixExplicitAspectRatio*(
    this: var vtkCamera; _arg: cdouble) {.importcpp: "SetEyeAngleFocalDiskFocalDistanceUseOffAxisProjectionEyeSeparationUseExplicitProjectionTransformMatrixExplicitAspectRatio",
                                     header: "vtkCamera.h".}
## !!!Ignored construct:  virtual double GetDistanceDistanceParallelProjectionUseHorizontalViewAngleViewAngleParallelScaleThicknessEyeAngleFocalDiskFocalDistanceUseOffAxisProjectionEyeSeparationUseExplicitProjectionTransformMatrixExplicitAspectRatio ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ExplicitAspectRatio  of  << this -> ExplicitAspectRatio ) ; return this -> ExplicitAspectRatio ; } ;
## Error: expected ';'!!!

proc SetEyeAngleFocalDiskFocalDistanceUseOffAxisProjectionEyeSeparationUseExplicitProjectionTransformMatrixExplicitAspectRatioUseExplicitAspectRatio*(
    this: var vtkCamera; _arg: bool) {.importcpp: "SetEyeAngleFocalDiskFocalDistanceUseOffAxisProjectionEyeSeparationUseExplicitProjectionTransformMatrixExplicitAspectRatioUseExplicitAspectRatio",
                                  header: "vtkCamera.h".}
## !!!Ignored construct:  virtual bool GetDistanceDistanceParallelProjectionUseHorizontalViewAngleViewAngleParallelScaleThicknessEyeAngleFocalDiskFocalDistanceUseOffAxisProjectionEyeSeparationUseExplicitProjectionTransformMatrixExplicitAspectRatioUseExplicitAspectRatio ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseExplicitAspectRatio  of  << this -> UseExplicitAspectRatio ) ; return this -> UseExplicitAspectRatio ; } ;
## Error: expected ';'!!!

proc UseExplicitAspectRatioOn*(this: var vtkCamera) {.
    importcpp: "UseExplicitAspectRatioOn", header: "vtkCamera.h".}
proc UseExplicitAspectRatioOff*(this: var vtkCamera) {.
    importcpp: "UseExplicitAspectRatioOff", header: "vtkCamera.h".}
  ## *@}
  ## *
  ##  Return the projection transform matrix, which converts from camera
  ##  coordinates to viewport coordinates.  The 'aspect' is the
  ##  width/height for the viewport, and the nearz and farz are the
  ##  Z-buffer values that map to the near and far clipping planes.
  ##  The viewport coordinates of a point located inside the frustum are in the
  ##  range ([-1,+1],[-1,+1],[nearz,farz]).
  ##  aspect is ignored if UseExplicitAspectRatio is true.
  ##  @sa ExplicitProjectionTransformMatrix
  ##
proc GetProjectionTransformMatrix*(this: var vtkCamera; aspect: cdouble;
                                  nearz: cdouble; farz: cdouble): ptr vtkMatrix4x4 {.
    importcpp: "GetProjectionTransformMatrix", header: "vtkCamera.h".}
proc GetProjectionTransformObject*(this: var vtkCamera; aspect: cdouble;
                                  nearz: cdouble; farz: cdouble): ptr vtkPerspectiveTransform {.
    importcpp: "GetProjectionTransformObject", header: "vtkCamera.h".}
proc GetCompositeProjectionTransformMatrix*(this: var vtkCamera; aspect: cdouble;
    nearz: cdouble; farz: cdouble): ptr vtkMatrix4x4 {.
    importcpp: "GetCompositeProjectionTransformMatrix", header: "vtkCamera.h".}
proc GetProjectionTransformMatrix*(this: var vtkCamera; ren: ptr vtkRenderer): ptr vtkMatrix4x4 {.
    importcpp: "GetProjectionTransformMatrix", header: "vtkCamera.h".}
proc SetUserViewTransform*(this: var vtkCamera;
                          transform: ptr vtkHomogeneousTransform) {.
    importcpp: "SetUserViewTransform", header: "vtkCamera.h".}
proc GetnameEyeTransformMatrixModelTransformMatrixExplicitProjectionTransformMatrixUserViewTransform*(
    this: var vtkCamera): ptr vtkHomogeneousTransform {.importcpp: "GetnameEyeTransformMatrixModelTransformMatrixExplicitProjectionTransformMatrixUserViewTransform",
    header: "vtkCamera.h".}
  ## /@}
  ## /@{
  ## *
  ##  In addition to the instance variables such as position and orientation,
  ##  you can add an additional transformation for your own use. This
  ##  transformation is concatenated to the camera's ProjectionTransform
  ##
proc SetUserTransform*(this: var vtkCamera; transform: ptr vtkHomogeneousTransform) {.
    importcpp: "SetUserTransform", header: "vtkCamera.h".}
proc GetnameEyeTransformMatrixModelTransformMatrixExplicitProjectionTransformMatrixUserViewTransformUserTransform*(
    this: var vtkCamera): ptr vtkHomogeneousTransform {.importcpp: "GetnameEyeTransformMatrixModelTransformMatrixExplicitProjectionTransformMatrixUserViewTransformUserTransform",
    header: "vtkCamera.h".}
  ## /@}
  ## *
  ##  This method causes the camera to set up whatever is required for
  ##  viewing the scene. This is actually handled by an subclass of
  ##  vtkCamera, which is created through New()
  ##
proc Render*(this: var vtkCamera; a2: ptr vtkRenderer) {.importcpp: "Render",
    header: "vtkCamera.h".}
proc GetViewingRaysMTime*(this: var vtkCamera): vtkMTimeType {.
    importcpp: "GetViewingRaysMTime", header: "vtkCamera.h".}
proc ViewingRaysModified*(this: var vtkCamera) {.importcpp: "ViewingRaysModified",
    header: "vtkCamera.h".}
proc GetFrustumPlanes*(this: var vtkCamera; aspect: cdouble;
                      planes: array[24, cdouble]) {.importcpp: "GetFrustumPlanes",
    header: "vtkCamera.h".}
proc UpdateIdealShiftScale*(this: var vtkCamera; aspect: cdouble) {.
    importcpp: "UpdateIdealShiftScale", header: "vtkCamera.h".}
## !!!Ignored construct:  virtual double * GetPositionFocalPointViewUpDirectionOfProjectionDirectionOfProjectionViewPlaneNormalViewPlaneNormalViewShearScreenBottomLeftScreenBottomRightScreenTopRightFocalPointShift ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << FocalPointShift  pointer  << this -> FocalPointShift ) ; return this -> FocalPointShift ; } VTK_WRAPEXCLUDE virtual void GetPositionFocalPointViewUpDirectionOfProjectionDirectionOfProjectionViewPlaneNormalViewPlaneNormalViewShearScreenBottomLeftScreenBottomRightScreenTopRightFocalPointShift ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> FocalPointShift [ 0 ] ; _arg2 = this -> FocalPointShift [ 1 ] ; _arg3 = this -> FocalPointShift [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << FocalPointShift  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetPositionFocalPointViewUpDirectionOfProjectionDirectionOfProjectionViewPlaneNormalViewPlaneNormalViewShearScreenBottomLeftScreenBottomRightScreenTopRightFocalPointShift ( double _arg [ 3 ] ) { this -> GetPositionFocalPointViewUpDirectionOfProjectionDirectionOfProjectionViewPlaneNormalViewPlaneNormalViewShearScreenBottomLeftScreenBottomRightScreenTopRightFocalPointShift ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual double GetDistanceDistanceParallelProjectionUseHorizontalViewAngleViewAngleParallelScaleThicknessEyeAngleFocalDiskFocalDistanceUseOffAxisProjectionEyeSeparationUseExplicitProjectionTransformMatrixExplicitAspectRatioUseExplicitAspectRatioFocalPointScale ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FocalPointScale  of  << this -> FocalPointScale ) ; return this -> FocalPointScale ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual double * GetPositionFocalPointViewUpDirectionOfProjectionDirectionOfProjectionViewPlaneNormalViewPlaneNormalViewShearScreenBottomLeftScreenBottomRightScreenTopRightFocalPointShiftNearPlaneShift ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << NearPlaneShift  pointer  << this -> NearPlaneShift ) ; return this -> NearPlaneShift ; } VTK_WRAPEXCLUDE virtual void GetPositionFocalPointViewUpDirectionOfProjectionDirectionOfProjectionViewPlaneNormalViewPlaneNormalViewShearScreenBottomLeftScreenBottomRightScreenTopRightFocalPointShiftNearPlaneShift ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> NearPlaneShift [ 0 ] ; _arg2 = this -> NearPlaneShift [ 1 ] ; _arg3 = this -> NearPlaneShift [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << NearPlaneShift  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetPositionFocalPointViewUpDirectionOfProjectionDirectionOfProjectionViewPlaneNormalViewPlaneNormalViewShearScreenBottomLeftScreenBottomRightScreenTopRightFocalPointShiftNearPlaneShift ( double _arg [ 3 ] ) { this -> GetPositionFocalPointViewUpDirectionOfProjectionDirectionOfProjectionViewPlaneNormalViewPlaneNormalViewShearScreenBottomLeftScreenBottomRightScreenTopRightFocalPointShiftNearPlaneShift ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual double GetDistanceDistanceParallelProjectionUseHorizontalViewAngleViewAngleParallelScaleThicknessEyeAngleFocalDiskFocalDistanceUseOffAxisProjectionEyeSeparationUseExplicitProjectionTransformMatrixExplicitAspectRatioUseExplicitAspectRatioFocalPointScaleNearPlaneScale ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NearPlaneScale  of  << this -> NearPlaneScale ) ; return this -> NearPlaneScale ; } ;
## Error: expected ';'!!!

proc SetEyeAngleFocalDiskFocalDistanceUseOffAxisProjectionEyeSeparationUseExplicitProjectionTransformMatrixExplicitAspectRatioUseExplicitAspectRatioShiftScaleThreshold*(
    this: var vtkCamera; _arg: cdouble) {.importcpp: "SetEyeAngleFocalDiskFocalDistanceUseOffAxisProjectionEyeSeparationUseExplicitProjectionTransformMatrixExplicitAspectRatioUseExplicitAspectRatioShiftScaleThreshold",
                                     header: "vtkCamera.h".}
## !!!Ignored construct:  virtual double GetDistanceDistanceParallelProjectionUseHorizontalViewAngleViewAngleParallelScaleThicknessEyeAngleFocalDiskFocalDistanceUseOffAxisProjectionEyeSeparationUseExplicitProjectionTransformMatrixExplicitAspectRatioUseExplicitAspectRatioFocalPointScaleNearPlaneScaleShiftScaleThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ShiftScaleThreshold  of  << this -> ShiftScaleThreshold ) ; return this -> ShiftScaleThreshold ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get the orientation of the camera.
##  double * GetOrientation ( ) VTK_SIZEHINT ( 3 ) ;
## Error: expected ';'!!!

## !!!Ignored construct:  double * GetOrientationWXYZ ( ) VTK_SIZEHINT ( 4 ) ;
## Error: expected ';'!!!

proc ComputeViewPlaneNormal*(this: var vtkCamera) {.
    importcpp: "ComputeViewPlaneNormal", header: "vtkCamera.h".}
proc GetCameraLightTransformMatrix*(this: var vtkCamera): ptr vtkMatrix4x4 {.
    importcpp: "GetCameraLightTransformMatrix", header: "vtkCamera.h".}
proc UpdateViewport*(this: var vtkCamera;
                    vtkNotUsed: proc (a1: ren): ptr vtkRenderer) {.
    importcpp: "UpdateViewport", header: "vtkCamera.h".}
## !!!Ignored construct:  /@{ *
##  Get the stereo setting
##  virtual int GetDistanceDistanceParallelProjectionUseHorizontalViewAngleViewAngleParallelScaleThicknessEyeAngleFocalDiskFocalDistanceUseOffAxisProjectionEyeSeparationUseExplicitProjectionTransformMatrixExplicitAspectRatioUseExplicitAspectRatioFocalPointScaleNearPlaneScaleShiftScaleThresholdStereoStereo ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Stereo  of  << this -> Stereo ) ; return this -> Stereo ; } ;
## Error: expected ';'!!!

proc SetEyeAngleFocalDiskFocalDistanceUseOffAxisProjectionEyeSeparationUseExplicitProjectionTransformMatrixExplicitAspectRatioUseExplicitAspectRatioShiftScaleThresholdLeftEye*(
    this: var vtkCamera; _arg: cint) {.importcpp: "SetEyeAngleFocalDiskFocalDistanceUseOffAxisProjectionEyeSeparationUseExplicitProjectionTransformMatrixExplicitAspectRatioUseExplicitAspectRatioShiftScaleThresholdLeftEye",
                                  header: "vtkCamera.h".}
## !!!Ignored construct:  virtual int GetDistanceDistanceParallelProjectionUseHorizontalViewAngleViewAngleParallelScaleThicknessEyeAngleFocalDiskFocalDistanceUseOffAxisProjectionEyeSeparationUseExplicitProjectionTransformMatrixExplicitAspectRatioUseExplicitAspectRatioFocalPointScaleNearPlaneScaleShiftScaleThresholdStereoStereoLeftEye ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LeftEye  of  << this -> LeftEye ) ; return this -> LeftEye ; } ;
## Error: expected ';'!!!

proc ShallowCopy*(this: var vtkCamera; source: ptr vtkCamera) {.
    importcpp: "ShallowCopy", header: "vtkCamera.h".}
proc DeepCopy*(this: var vtkCamera; source: ptr vtkCamera) {.importcpp: "DeepCopy",
    header: "vtkCamera.h".}
proc SetEyeAngleFocalDiskFocalDistanceUseOffAxisProjectionEyeSeparationUseExplicitProjectionTransformMatrixExplicitAspectRatioUseExplicitAspectRatioShiftScaleThresholdLeftEyeFreezeFocalPoint*(
    this: var vtkCamera; _arg: bool) {.importcpp: "SetEyeAngleFocalDiskFocalDistanceUseOffAxisProjectionEyeSeparationUseExplicitProjectionTransformMatrixExplicitAspectRatioUseExplicitAspectRatioShiftScaleThresholdLeftEyeFreezeFocalPoint",
                                  header: "vtkCamera.h".}
## !!!Ignored construct:  virtual bool GetDistanceDistanceParallelProjectionUseHorizontalViewAngleViewAngleParallelScaleThicknessEyeAngleFocalDiskFocalDistanceUseOffAxisProjectionEyeSeparationUseExplicitProjectionTransformMatrixExplicitAspectRatioUseExplicitAspectRatioFocalPointScaleNearPlaneScaleShiftScaleThresholdStereoStereoLeftEyeFreezeFocalPoint ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FreezeFocalPoint  of  << this -> FreezeFocalPoint ) ; return this -> FreezeFocalPoint ; } ;
## Error: expected ';'!!!

proc SetEyeAngleFocalDiskFocalDistanceUseOffAxisProjectionEyeSeparationUseExplicitProjectionTransformMatrixExplicitAspectRatioUseExplicitAspectRatioShiftScaleThresholdLeftEyeFreezeFocalPointUseScissor*(
    this: var vtkCamera; _arg: bool) {.importcpp: "SetEyeAngleFocalDiskFocalDistanceUseOffAxisProjectionEyeSeparationUseExplicitProjectionTransformMatrixExplicitAspectRatioUseExplicitAspectRatioShiftScaleThresholdLeftEyeFreezeFocalPointUseScissor",
                                  header: "vtkCamera.h".}
## !!!Ignored construct:  virtual bool GetDistanceDistanceParallelProjectionUseHorizontalViewAngleViewAngleParallelScaleThicknessEyeAngleFocalDiskFocalDistanceUseOffAxisProjectionEyeSeparationUseExplicitProjectionTransformMatrixExplicitAspectRatioUseExplicitAspectRatioFocalPointScaleNearPlaneScaleShiftScaleThresholdStereoStereoLeftEyeFreezeFocalPointUseScissor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseScissor  of  << this -> UseScissor ) ; return this -> UseScissor ; } ;
## Error: expected ';'!!!

proc SetScissorRect*(this: var vtkCamera; scissorRect: vtkRecti) {.
    importcpp: "SetScissorRect", header: "vtkCamera.h".}
proc GetScissorRect*(this: var vtkCamera; scissorRect: var vtkRecti) {.
    importcpp: "GetScissorRect", header: "vtkCamera.h".}
proc GetnameEyeTransformMatrixModelTransformMatrixExplicitProjectionTransformMatrixUserViewTransformUserTransformInformation*(
    this: var vtkCamera): ptr vtkInformation {.importcpp: "GetnameEyeTransformMatrixModelTransformMatrixExplicitProjectionTransformMatrixUserViewTransformUserTransformInformation",
    header: "vtkCamera.h".}
proc SetInformation*(this: var vtkCamera; a2: ptr vtkInformation) {.
    importcpp: "SetInformation", header: "vtkCamera.h".}