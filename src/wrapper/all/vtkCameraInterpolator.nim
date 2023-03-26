## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCameraInterpolator.h
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
##  @class   vtkCameraInterpolator
##  @brief   interpolate a series of cameras to update a new camera
##
##  This class is used to interpolate a series of cameras to update a
##  specified camera. Either linear interpolation or spline interpolation may
##  be used. The instance variables currently interpolated include position,
##  focal point, view up, view angle, parallel scale, and clipping range.
##
##  To use this class, specify the type of interpolation to use, and add a
##  series of cameras at various times "t" to the list of cameras from which to
##  interpolate. Then to interpolate in between cameras, simply invoke the
##  function InterpolateCamera(t,camera) where "camera" is the camera to be
##  updated with interpolated values. Note that "t" should be in the range
##  (min,max) times specified with the AddCamera() method. If outside this
##  range, the interpolation is clamped. This class copies the camera information
##  (as compared to referencing the cameras) so you do not need to keep separate
##  instances of the camera around for each camera added to the list of cameras
##  to interpolate.
##
##  @warning
##  The interpolator classes are initialized the first time InterpolateCamera()
##  is called. Any later changes to the interpolators, or additions to the list of
##  cameras to be interpolated, causes a reinitialization of the
##  interpolators the next time InterpolateCamera() is invoked. Thus the
##  best performance is obtained by 1) configuring the interpolators, 2) adding
##  all the cameras, and 3) finally performing interpolation.
##
##  @warning
##  Currently position, focal point and view up are interpolated to define
##  the orientation of the camera. Quaternion interpolation may be added in the
##  future as an alternative interpolation method for camera orientation.
##

import
  vtkObject, vtkRenderingCoreModule

discard "forward decl of vtkCamera"
discard "forward decl of vtkCameraList"
discard "forward decl of vtkTupleInterpolator"
discard "forward decl of vtkCameraList"
type
  vtkCameraInterpolator* {.importcpp: "vtkCameraInterpolator",
                          header: "vtkCameraInterpolator.h", bycopy.} = object of vtkObject
    vtkCameraInterpolator* {.importc: "vtkCameraInterpolator".}: VTK_NEWINSTANCE
    ##  These perform the interpolation
    ##  Initialize the interpolating splines

  vtkCameraInterpolatorSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCameraInterpolator::IsTypeOf(@)",
    header: "vtkCameraInterpolator.h".}
proc IsA*(this: var vtkCameraInterpolator; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkCameraInterpolator.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCameraInterpolator {.
    importcpp: "vtkCameraInterpolator::SafeDownCast(@)",
    header: "vtkCameraInterpolator.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCameraInterpolator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCameraInterpolator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCameraInterpolator :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCameraInterpolator; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCameraInterpolator.h".}
proc New*(): ptr vtkCameraInterpolator {.importcpp: "vtkCameraInterpolator::New(@)",
                                     header: "vtkCameraInterpolator.h".}
proc GetNumberOfCameras*(this: var vtkCameraInterpolator): cint {.
    importcpp: "GetNumberOfCameras", header: "vtkCameraInterpolator.h".}
proc GetMinimumT*(this: var vtkCameraInterpolator): cdouble {.
    importcpp: "GetMinimumT", header: "vtkCameraInterpolator.h".}
proc GetMaximumT*(this: var vtkCameraInterpolator): cdouble {.
    importcpp: "GetMaximumT", header: "vtkCameraInterpolator.h".}
proc Initialize*(this: var vtkCameraInterpolator) {.importcpp: "Initialize",
    header: "vtkCameraInterpolator.h".}
proc AddCamera*(this: var vtkCameraInterpolator; t: cdouble; camera: ptr vtkCamera) {.
    importcpp: "AddCamera", header: "vtkCameraInterpolator.h".}
proc RemoveCamera*(this: var vtkCameraInterpolator; t: cdouble) {.
    importcpp: "RemoveCamera", header: "vtkCameraInterpolator.h".}
proc InterpolateCamera*(this: var vtkCameraInterpolator; t: cdouble;
                       camera: ptr vtkCamera) {.importcpp: "InterpolateCamera",
    header: "vtkCameraInterpolator.h".}
const
  vtkCameraInterpolatorINTERPOLATION_TYPE_LINEAR* = 0
  vtkCameraInterpolatorINTERPOLATION_TYPE_SPLINE* = 1
  vtkCameraInterpolatorINTERPOLATION_TYPE_MANUAL* = 2

proc SetInterpolationType*(this: var vtkCameraInterpolator; _arg: cint) {.
    importcpp: "SetInterpolationType", header: "vtkCameraInterpolator.h".}
proc GetInterpolationTypeMinValue*(this: var vtkCameraInterpolator): cint {.
    importcpp: "GetInterpolationTypeMinValue", header: "vtkCameraInterpolator.h".}
proc GetInterpolationTypeMaxValue*(this: var vtkCameraInterpolator): cint {.
    importcpp: "GetInterpolationTypeMaxValue", header: "vtkCameraInterpolator.h".}
## !!!Ignored construct:  virtual int GetInterpolationType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InterpolationType  of  << this -> InterpolationType ) ; return this -> InterpolationType ; } ;
## Error: expected ';'!!!

proc SetInterpolationTypeToLinear*(this: var vtkCameraInterpolator) {.
    importcpp: "SetInterpolationTypeToLinear", header: "vtkCameraInterpolator.h".}
proc SetInterpolationTypeToSpline*(this: var vtkCameraInterpolator) {.
    importcpp: "SetInterpolationTypeToSpline", header: "vtkCameraInterpolator.h".}
proc SetInterpolationTypeToManual*(this: var vtkCameraInterpolator) {.
    importcpp: "SetInterpolationTypeToManual", header: "vtkCameraInterpolator.h".}
proc SetPositionInterpolator*(this: var vtkCameraInterpolator;
                             a2: ptr vtkTupleInterpolator) {.
    importcpp: "SetPositionInterpolator", header: "vtkCameraInterpolator.h".}
proc GetnamePositionInterpolator*(this: var vtkCameraInterpolator): ptr vtkTupleInterpolator {.
    importcpp: "GetnamePositionInterpolator", header: "vtkCameraInterpolator.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the tuple interpolator used to interpolate the focal point portion
  ##  of the camera. Note that you can modify the behavior of the interpolator
  ##  (linear vs spline interpolation; change spline basis) by manipulating
  ##  the interpolator instances directly.
  ##
proc SetFocalPointInterpolator*(this: var vtkCameraInterpolator;
                               a2: ptr vtkTupleInterpolator) {.
    importcpp: "SetFocalPointInterpolator", header: "vtkCameraInterpolator.h".}
proc GetnamePositionInterpolatorFocalPointInterpolator*(
    this: var vtkCameraInterpolator): ptr vtkTupleInterpolator {.
    importcpp: "GetnamePositionInterpolatorFocalPointInterpolator",
    header: "vtkCameraInterpolator.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the tuple interpolator used to interpolate the view up portion
  ##  of the camera. Note that you can modify the behavior of the interpolator
  ##  (linear vs spline interpolation; change spline basis) by manipulating
  ##  the interpolator instances directly.
  ##
proc SetViewUpInterpolator*(this: var vtkCameraInterpolator;
                           a2: ptr vtkTupleInterpolator) {.
    importcpp: "SetViewUpInterpolator", header: "vtkCameraInterpolator.h".}
proc GetnamePositionInterpolatorFocalPointInterpolatorViewUpInterpolator*(
    this: var vtkCameraInterpolator): ptr vtkTupleInterpolator {.importcpp: "GetnamePositionInterpolatorFocalPointInterpolatorViewUpInterpolator",
    header: "vtkCameraInterpolator.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the tuple interpolator used to interpolate the view angle portion
  ##  of the camera. Note that you can modify the behavior of the interpolator
  ##  (linear vs spline interpolation; change spline basis) by manipulating
  ##  the interpolator instances directly.
  ##
proc SetViewAngleInterpolator*(this: var vtkCameraInterpolator;
                              a2: ptr vtkTupleInterpolator) {.
    importcpp: "SetViewAngleInterpolator", header: "vtkCameraInterpolator.h".}
proc GetnamePositionInterpolatorFocalPointInterpolatorViewUpInterpolatorViewAngleInterpolator*(
    this: var vtkCameraInterpolator): ptr vtkTupleInterpolator {.importcpp: "GetnamePositionInterpolatorFocalPointInterpolatorViewUpInterpolatorViewAngleInterpolator",
    header: "vtkCameraInterpolator.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the tuple interpolator used to interpolate the parallel scale portion
  ##  of the camera. Note that you can modify the behavior of the interpolator
  ##  (linear vs spline interpolation; change spline basis) by manipulating
  ##  the interpolator instances directly.
  ##
proc SetParallelScaleInterpolator*(this: var vtkCameraInterpolator;
                                  a2: ptr vtkTupleInterpolator) {.
    importcpp: "SetParallelScaleInterpolator", header: "vtkCameraInterpolator.h".}
proc GetnamePositionInterpolatorFocalPointInterpolatorViewUpInterpolatorViewAngleInterpolatorParallelScaleInterpolator*(
    this: var vtkCameraInterpolator): ptr vtkTupleInterpolator {.importcpp: "GetnamePositionInterpolatorFocalPointInterpolatorViewUpInterpolatorViewAngleInterpolatorParallelScaleInterpolator",
    header: "vtkCameraInterpolator.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the tuple interpolator used to interpolate the clipping range portion
  ##  of the camera. Note that you can modify the behavior of the interpolator
  ##  (linear vs spline interpolation; change spline basis) by manipulating
  ##  the interpolator instances directly.
  ##
proc SetClippingRangeInterpolator*(this: var vtkCameraInterpolator;
                                  a2: ptr vtkTupleInterpolator) {.
    importcpp: "SetClippingRangeInterpolator", header: "vtkCameraInterpolator.h".}
proc GetnamePositionInterpolatorFocalPointInterpolatorViewUpInterpolatorViewAngleInterpolatorParallelScaleInterpolatorClippingRangeInterpolator*(
    this: var vtkCameraInterpolator): ptr vtkTupleInterpolator {.importcpp: "GetnamePositionInterpolatorFocalPointInterpolatorViewUpInterpolatorViewAngleInterpolatorParallelScaleInterpolatorClippingRangeInterpolator",
    header: "vtkCameraInterpolator.h".}
  ## /@}
  ## *
  ##  Override GetMTime() because we depend on the interpolators which may be
  ##  modified outside of this class.
  ##
proc GetMTime*(this: var vtkCameraInterpolator): vtkMTimeType {.
    importcpp: "GetMTime", header: "vtkCameraInterpolator.h".}