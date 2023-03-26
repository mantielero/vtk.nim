## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkQuaternionInterpolator.h
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
##  @class   vtkQuaternionInterpolator
##  @brief   interpolate a quaternion
##
##  This class is used to interpolate a series of quaternions representing
##  the rotations of a 3D object.  The interpolation may be linear in form
##  (using spherical linear interpolation SLERP), or via spline interpolation
##  (using SQUAD). In either case the interpolation is specialized to
##  quaternions since the interpolation occurs on the surface of the unit
##  quaternion sphere.
##
##  To use this class, specify at least two pairs of (t,q[4]) with the
##  AddQuaternion() method.  Next interpolate the tuples with the
##  InterpolateQuaternion(t,q[4]) method, where "t" must be in the range of
##  (t_min,t_max) parameter values specified by the AddQuaternion() method (t
##  is clamped otherwise), and q[4] is filled in by the method.
##
##  There are several important background references. Ken Shoemake described
##  the practical application of quaternions for the interpolation of rotation
##  (K. Shoemake, "Animating rotation with quaternion curves", Computer
##  Graphics (Siggraph '85) 19(3):245--254, 1985). Another fine reference
##  (available on-line) is E. B. Dam, M. Koch, and M. Lillholm, Technical
##  Report DIKU-TR-98/5, Dept. of Computer Science, University of Copenhagen,
##  Denmark.
##
##  @warning
##  Note that for two or less quaternions, Slerp (linear) interpolation is
##  performed even if spline interpolation is requested. Also, the tangents to
##  the first and last segments of spline interpolation are (arbitrarily)
##  defined by repeating the first and last quaternions.
##
##  @warning
##  There are several methods particular to quaternions (norms, products,
##  etc.) implemented interior to this class. These may be moved to a separate
##  quaternion class at some point.
##
##  @sa
##  vtkQuaternion
##

import
  vtkCommonMathModule, vtkObject

discard "forward decl of vtkQuaterniond"
discard "forward decl of vtkQuaternionList"
type
  vtkQuaternionInterpolator* {.importcpp: "vtkQuaternionInterpolator",
                              header: "vtkQuaternionInterpolator.h", bycopy.} = object of vtkObject
    vtkQuaternionInterpolator* {.importc: "vtkQuaternionInterpolator".}: VTK_NEWINSTANCE
    ##  Internal variables for interpolation functions
    ##  used for linear quaternion interpolation

  vtkQuaternionInterpolatorSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkQuaternionInterpolator::IsTypeOf(@)",
    header: "vtkQuaternionInterpolator.h".}
proc IsA*(this: var vtkQuaternionInterpolator; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkQuaternionInterpolator.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkQuaternionInterpolator {.
    importcpp: "vtkQuaternionInterpolator::SafeDownCast(@)",
    header: "vtkQuaternionInterpolator.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkQuaternionInterpolator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkQuaternionInterpolator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkQuaternionInterpolator :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkQuaternionInterpolator; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkQuaternionInterpolator.h".}
proc New*(): ptr vtkQuaternionInterpolator {.
    importcpp: "vtkQuaternionInterpolator::New(@)",
    header: "vtkQuaternionInterpolator.h".}
type
  vtkQuaternionInterpolatorvtkQuaternionInterpolationSearchMethod* {.
      size: sizeof(cint), importcpp: "vtkQuaternionInterpolator::vtkQuaternionInterpolationSearchMethod",
      header: "vtkQuaternionInterpolator.h".} = enum
    BinarySearch = 0, LinearSearch = 1, MaxEnum


proc GetNumberOfQuaternions*(this: var vtkQuaternionInterpolator): cint {.
    importcpp: "GetNumberOfQuaternions", header: "vtkQuaternionInterpolator.h".}
proc GetMinimumT*(this: var vtkQuaternionInterpolator): cdouble {.
    importcpp: "GetMinimumT", header: "vtkQuaternionInterpolator.h".}
proc GetMaximumT*(this: var vtkQuaternionInterpolator): cdouble {.
    importcpp: "GetMaximumT", header: "vtkQuaternionInterpolator.h".}
proc Initialize*(this: var vtkQuaternionInterpolator) {.importcpp: "Initialize",
    header: "vtkQuaternionInterpolator.h".}
proc AddQuaternion*(this: var vtkQuaternionInterpolator; t: cdouble; q: vtkQuaterniond) {.
    importcpp: "AddQuaternion", header: "vtkQuaternionInterpolator.h".}
proc AddQuaternion*(this: var vtkQuaternionInterpolator; t: cdouble;
                   q: array[4, cdouble]) {.importcpp: "AddQuaternion",
                                        header: "vtkQuaternionInterpolator.h".}
proc RemoveQuaternion*(this: var vtkQuaternionInterpolator; t: cdouble) {.
    importcpp: "RemoveQuaternion", header: "vtkQuaternionInterpolator.h".}
proc InterpolateQuaternion*(this: var vtkQuaternionInterpolator; t: cdouble;
                           q: var vtkQuaterniond) {.
    importcpp: "InterpolateQuaternion", header: "vtkQuaternionInterpolator.h".}
proc InterpolateQuaternion*(this: var vtkQuaternionInterpolator; t: cdouble;
                           q: array[4, cdouble]) {.
    importcpp: "InterpolateQuaternion", header: "vtkQuaternionInterpolator.h".}
proc GetSearchMethod*(this: var vtkQuaternionInterpolator): cint {.
    importcpp: "GetSearchMethod", header: "vtkQuaternionInterpolator.h".}
proc SetSearchMethod*(this: var vtkQuaternionInterpolator; `type`: cint) {.
    importcpp: "SetSearchMethod", header: "vtkQuaternionInterpolator.h".}
const
  vtkQuaternionInterpolatorINTERPOLATION_TYPE_LINEAR* = 0
  vtkQuaternionInterpolatorINTERPOLATION_TYPE_SPLINE* = 1

proc SetInterpolationType*(this: var vtkQuaternionInterpolator; _arg: cint) {.
    importcpp: "SetInterpolationType", header: "vtkQuaternionInterpolator.h".}
proc GetInterpolationTypeMinValue*(this: var vtkQuaternionInterpolator): cint {.
    importcpp: "GetInterpolationTypeMinValue",
    header: "vtkQuaternionInterpolator.h".}
proc GetInterpolationTypeMaxValue*(this: var vtkQuaternionInterpolator): cint {.
    importcpp: "GetInterpolationTypeMaxValue",
    header: "vtkQuaternionInterpolator.h".}
## !!!Ignored construct:  virtual int GetInterpolationType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InterpolationType  of  << this -> InterpolationType ) ; return this -> InterpolationType ; } ;
## Error: expected ';'!!!

proc SetInterpolationTypeToLinear*(this: var vtkQuaternionInterpolator) {.
    importcpp: "SetInterpolationTypeToLinear",
    header: "vtkQuaternionInterpolator.h".}
proc SetInterpolationTypeToSpline*(this: var vtkQuaternionInterpolator) {.
    importcpp: "SetInterpolationTypeToSpline",
    header: "vtkQuaternionInterpolator.h".}