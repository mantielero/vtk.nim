## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTransformInterpolator.h
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
##  @class   vtkTransformInterpolator
##  @brief   interpolate a series of transformation matrices
##
##  This class is used to interpolate a series of 4x4 transformation
##  matrices. Position, scale and orientation (i.e., rotations) are
##  interpolated separately, and can be interpolated linearly or with a spline
##  function. Note that orientation is interpolated using quaternions via
##  SLERP (spherical linear interpolation) or the special vtkQuaternionSpline
##  class.
##
##  To use this class, specify at least two pairs of (t,transformation matrix)
##  with the AddTransform() method.  Then interpolated the transforms with the
##  InterpolateTransform(t,transform) method, where "t" must be in the range
##  of (min,max) times specified by the AddTransform() method.
##
##  By default, spline interpolation is used for the interpolation of the
##  transformation matrices. The position, scale and orientation of the
##  matrices are interpolated with instances of the classes
##  vtkTupleInterpolator (position,scale) and vtkQuaternionInterpolator
##  (rotation). The user can override the interpolation behavior by gaining
##  access to these separate interpolation classes.  These interpolator
##  classes (vtkTupleInterpolator and vtkQuaternionInterpolator) can be
##  modified to perform linear versus spline interpolation, and/or different
##  spline basis functions can be specified.
##
##  @warning
##  The interpolator classes are initialized when the InterpolateTransform()
##  is called. Any changes to the interpolators, or additions to the list of
##  transforms to be interpolated, causes a reinitialization of the
##  interpolators the next time InterpolateTransform() is invoked. Thus the
##  best performance is obtained by 1) configuring the interpolators, 2) adding
##  all the transforms, and 3) finally performing interpolation.
##

import
  vtkObject, vtkRenderingCoreModule

discard "forward decl of vtkTransform"
discard "forward decl of vtkMatrix4x4"
discard "forward decl of vtkProp3D"
discard "forward decl of vtkTupleInterpolator"
discard "forward decl of vtkQuaternionInterpolator"
discard "forward decl of vtkTransformList"
type
  vtkTransformInterpolator* {.importcpp: "vtkTransformInterpolator",
                             header: "vtkTransformInterpolator.h", bycopy.} = object of vtkObject
    vtkTransformInterpolator* {.importc: "vtkTransformInterpolator".}: VTK_NEWINSTANCE
    ##  Interpolators
    ##  Initialize the interpolating splines

  vtkTransformInterpolatorSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTransformInterpolator::IsTypeOf(@)",
    header: "vtkTransformInterpolator.h".}
proc IsA*(this: var vtkTransformInterpolator; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTransformInterpolator.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTransformInterpolator {.
    importcpp: "vtkTransformInterpolator::SafeDownCast(@)",
    header: "vtkTransformInterpolator.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTransformInterpolator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTransformInterpolator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTransformInterpolator :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTransformInterpolator; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTransformInterpolator.h".}
proc New*(): ptr vtkTransformInterpolator {.importcpp: "vtkTransformInterpolator::New(@)",
                                        header: "vtkTransformInterpolator.h".}
proc GetNumberOfTransforms*(this: var vtkTransformInterpolator): cint {.
    importcpp: "GetNumberOfTransforms", header: "vtkTransformInterpolator.h".}
proc GetMinimumT*(this: var vtkTransformInterpolator): cdouble {.
    importcpp: "GetMinimumT", header: "vtkTransformInterpolator.h".}
proc GetMaximumT*(this: var vtkTransformInterpolator): cdouble {.
    importcpp: "GetMaximumT", header: "vtkTransformInterpolator.h".}
proc Initialize*(this: var vtkTransformInterpolator) {.importcpp: "Initialize",
    header: "vtkTransformInterpolator.h".}
proc AddTransform*(this: var vtkTransformInterpolator; t: cdouble;
                  xform: ptr vtkTransform) {.importcpp: "AddTransform",
    header: "vtkTransformInterpolator.h".}
proc AddTransform*(this: var vtkTransformInterpolator; t: cdouble;
                  matrix: ptr vtkMatrix4x4) {.importcpp: "AddTransform",
    header: "vtkTransformInterpolator.h".}
proc AddTransform*(this: var vtkTransformInterpolator; t: cdouble;
                  prop3D: ptr vtkProp3D) {.importcpp: "AddTransform",
                                        header: "vtkTransformInterpolator.h".}
proc RemoveTransform*(this: var vtkTransformInterpolator; t: cdouble) {.
    importcpp: "RemoveTransform", header: "vtkTransformInterpolator.h".}
proc InterpolateTransform*(this: var vtkTransformInterpolator; t: cdouble;
                          xform: ptr vtkTransform) {.
    importcpp: "InterpolateTransform", header: "vtkTransformInterpolator.h".}
const
  vtkTransformInterpolatorINTERPOLATION_TYPE_LINEAR* = 0
  vtkTransformInterpolatorINTERPOLATION_TYPE_SPLINE* = 1
  vtkTransformInterpolatorINTERPOLATION_TYPE_MANUAL* = 2

proc SetInterpolationType*(this: var vtkTransformInterpolator; _arg: cint) {.
    importcpp: "SetInterpolationType", header: "vtkTransformInterpolator.h".}
proc GetInterpolationTypeMinValue*(this: var vtkTransformInterpolator): cint {.
    importcpp: "GetInterpolationTypeMinValue",
    header: "vtkTransformInterpolator.h".}
proc GetInterpolationTypeMaxValue*(this: var vtkTransformInterpolator): cint {.
    importcpp: "GetInterpolationTypeMaxValue",
    header: "vtkTransformInterpolator.h".}
## !!!Ignored construct:  virtual int GetInterpolationType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InterpolationType  of  << this -> InterpolationType ) ; return this -> InterpolationType ; } ;
## Error: expected ';'!!!

proc SetInterpolationTypeToLinear*(this: var vtkTransformInterpolator) {.
    importcpp: "SetInterpolationTypeToLinear",
    header: "vtkTransformInterpolator.h".}
proc SetInterpolationTypeToSpline*(this: var vtkTransformInterpolator) {.
    importcpp: "SetInterpolationTypeToSpline",
    header: "vtkTransformInterpolator.h".}
proc SetInterpolationTypeToManual*(this: var vtkTransformInterpolator) {.
    importcpp: "SetInterpolationTypeToManual",
    header: "vtkTransformInterpolator.h".}
proc SetPositionInterpolator*(this: var vtkTransformInterpolator;
                             a2: ptr vtkTupleInterpolator) {.
    importcpp: "SetPositionInterpolator", header: "vtkTransformInterpolator.h".}
proc GetnamePositionInterpolator*(this: var vtkTransformInterpolator): ptr vtkTupleInterpolator {.
    importcpp: "GetnamePositionInterpolator", header: "vtkTransformInterpolator.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the tuple interpolator used to interpolate the scale portion
  ##  of the transformation matrix. Note that you can modify the behavior of
  ##  the interpolator (linear vs spline interpolation; change spline basis)
  ##  by manipulating the interpolator instances.
  ##
proc SetScaleInterpolator*(this: var vtkTransformInterpolator;
                          a2: ptr vtkTupleInterpolator) {.
    importcpp: "SetScaleInterpolator", header: "vtkTransformInterpolator.h".}
proc GetnamePositionInterpolatorScaleInterpolator*(
    this: var vtkTransformInterpolator): ptr vtkTupleInterpolator {.
    importcpp: "GetnamePositionInterpolatorScaleInterpolator",
    header: "vtkTransformInterpolator.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the tuple interpolator used to interpolate the orientation portion
  ##  of the transformation matrix. Note that you can modify the behavior of
  ##  the interpolator (linear vs spline interpolation; change spline basis)
  ##  by manipulating the interpolator instances.
  ##
proc SetRotationInterpolator*(this: var vtkTransformInterpolator;
                             a2: ptr vtkQuaternionInterpolator) {.
    importcpp: "SetRotationInterpolator", header: "vtkTransformInterpolator.h".}
proc GetnamePositionInterpolatorScaleInterpolatorRotationInterpolator*(
    this: var vtkTransformInterpolator): ptr vtkQuaternionInterpolator {.importcpp: "GetnamePositionInterpolatorScaleInterpolatorRotationInterpolator",
    header: "vtkTransformInterpolator.h".}
  ## /@}
  ## *
  ##  Override GetMTime() because we depend on the interpolators which may be
  ##  modified outside of this class.
  ##
proc GetMTime*(this: var vtkTransformInterpolator): vtkMTimeType {.
    importcpp: "GetMTime", header: "vtkTransformInterpolator.h".}