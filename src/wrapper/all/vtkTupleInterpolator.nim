## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTupleInterpolator.h
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
##  @class   vtkTupleInterpolator
##  @brief   interpolate a tuple of arbitrary size
##
##  This class is used to interpolate a tuple which may have an arbitrary
##  number of components (but at least one component). The interpolation may
##  be linear in form, or via a subclasses of vtkSpline.
##
##  To use this class, begin by specifying the number of components of the
##  tuple and the interpolation function to use. Then specify at least one
##  pair of (t,tuple) with the AddTuple() method.  Next interpolate the
##  tuples with the InterpolateTuple(t,tuple) method, where "t" must be in the
##  range of (t_min,t_max) parameter values specified by the AddTuple() method
##  (if not then t is clamped), and tuple[] is filled in by the method (make
##  sure that tuple [] is long enough to hold the interpolated data).
##
##  You can control the type of interpolation to use. By default, the
##  interpolation is based on a Kochanek spline. However, other types of
##  splines can be specified. You can also set the interpolation method
##  to linear, in which case the specified spline has no effect on the
##  interpolation.
##
##  @warning
##  Setting the number of components or changing the type of interpolation
##  causes the list of tuples to be reset, so any data inserted up to that
##  point is lost. Bisection methods are used to speed up the search for the
##  interpolation interval.
##

import
  vtkObject, vtkRenderingCoreModule

discard "forward decl of vtkSpline"
discard "forward decl of vtkPiecewiseFunction"
type
  vtkTupleInterpolator* {.importcpp: "vtkTupleInterpolator",
                         header: "vtkTupleInterpolator.h", bycopy.} = object of vtkObject
    vtkTupleInterpolator* {.importc: "vtkTupleInterpolator".}: VTK_NEWINSTANCE
    ##  Specify the type of interpolation to use
    ##  This is the default 1D spline to use
    ##  Internal variables for interpolation functions

  vtkTupleInterpolatorSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTupleInterpolator::IsTypeOf(@)",
    header: "vtkTupleInterpolator.h".}
proc IsA*(this: var vtkTupleInterpolator; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTupleInterpolator.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTupleInterpolator {.
    importcpp: "vtkTupleInterpolator::SafeDownCast(@)",
    header: "vtkTupleInterpolator.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTupleInterpolator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTupleInterpolator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTupleInterpolator :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTupleInterpolator; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTupleInterpolator.h".}
proc New*(): ptr vtkTupleInterpolator {.importcpp: "vtkTupleInterpolator::New(@)",
                                    header: "vtkTupleInterpolator.h".}
proc SetNumberOfComponents*(this: var vtkTupleInterpolator; numComp: cint) {.
    importcpp: "SetNumberOfComponents", header: "vtkTupleInterpolator.h".}
## !!!Ignored construct:  virtual int GetNumberOfComponents ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfComponents  of  << this -> NumberOfComponents ) ; return this -> NumberOfComponents ; } ;
## Error: expected ';'!!!

proc GetNumberOfTuples*(this: var vtkTupleInterpolator): cint {.
    importcpp: "GetNumberOfTuples", header: "vtkTupleInterpolator.h".}
proc GetMinimumT*(this: var vtkTupleInterpolator): cdouble {.
    importcpp: "GetMinimumT", header: "vtkTupleInterpolator.h".}
proc GetMaximumT*(this: var vtkTupleInterpolator): cdouble {.
    importcpp: "GetMaximumT", header: "vtkTupleInterpolator.h".}
proc Initialize*(this: var vtkTupleInterpolator) {.importcpp: "Initialize",
    header: "vtkTupleInterpolator.h".}
proc AddTuple*(this: var vtkTupleInterpolator; t: cdouble; `tuple`: ptr cdouble) {.
    importcpp: "AddTuple", header: "vtkTupleInterpolator.h".}
proc RemoveTuple*(this: var vtkTupleInterpolator; t: cdouble) {.
    importcpp: "RemoveTuple", header: "vtkTupleInterpolator.h".}
proc InterpolateTuple*(this: var vtkTupleInterpolator; t: cdouble;
                      `tuple`: ptr cdouble) {.importcpp: "InterpolateTuple",
    header: "vtkTupleInterpolator.h".}
const
  vtkTupleInterpolatorINTERPOLATION_TYPE_LINEAR* = 0
  vtkTupleInterpolatorINTERPOLATION_TYPE_SPLINE* = 1

proc SetInterpolationType*(this: var vtkTupleInterpolator; `type`: cint) {.
    importcpp: "SetInterpolationType", header: "vtkTupleInterpolator.h".}
## !!!Ignored construct:  virtual int GetNumberOfComponentsInterpolationType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InterpolationType  of  << this -> InterpolationType ) ; return this -> InterpolationType ; } ;
## Error: expected ';'!!!

proc SetInterpolationTypeToLinear*(this: var vtkTupleInterpolator) {.
    importcpp: "SetInterpolationTypeToLinear", header: "vtkTupleInterpolator.h".}
proc SetInterpolationTypeToSpline*(this: var vtkTupleInterpolator) {.
    importcpp: "SetInterpolationTypeToSpline", header: "vtkTupleInterpolator.h".}
proc SetInterpolatingSpline*(this: var vtkTupleInterpolator; a2: ptr vtkSpline) {.
    importcpp: "SetInterpolatingSpline", header: "vtkTupleInterpolator.h".}
proc GetnameInterpolatingSpline*(this: var vtkTupleInterpolator): ptr vtkSpline {.
    importcpp: "GetnameInterpolatingSpline", header: "vtkTupleInterpolator.h".}
  ## /@}