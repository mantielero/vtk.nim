## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkParametricSpline.h
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
##  @class   vtkParametricSpline
##  @brief   parametric function for 1D interpolating splines
##
##  vtkParametricSpline is a parametric function for 1D interpolating splines.
##  vtkParametricSpline maps the single parameter u into a 3D point (x,y,z)
##  using three instances of interpolating splines.  This family of 1D splines
##  is guaranteed to be parameterized in the interval [0,1].  Attempting to
##  evaluate outside this interval will cause the parameter u to be clamped in
##  the range [0,1].
##
##  When constructed, this class creates instances of vtkCardinalSpline for
##  each of the x-y-z coordinates. The user may choose to replace these with
##  their own instances of subclasses of vtkSpline.
##
##  @warning
##  If you wish to tessellate the spline, use the class
##  vtkParametricFunctionSource.
##
##  @sa
##  vtkSpline vtkKochanekSpline vtkCardinalSpline
##

discard "forward decl of vtkSpline"
discard "forward decl of vtkPoints"
import
  vtkCommonComputationalGeometryModule, vtkParametricFunction

type
  vtkParametricSpline* {.importcpp: "vtkParametricSpline",
                        header: "vtkParametricSpline.h", bycopy.} = object of vtkParametricFunction
    vtkParametricSpline* {.importc: "vtkParametricSpline".}: VTK_NEWINSTANCE
    ##  The interpolating splines for each of the x-y-z coordinates
    ##  Supplemental variables
    ##  Initializing the spline

  vtkParametricSplineSuperclass* = vtkParametricFunction

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkParametricSpline::IsTypeOf(@)", header: "vtkParametricSpline.h".}
proc IsA*(this: var vtkParametricSpline; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkParametricSpline.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkParametricSpline {.
    importcpp: "vtkParametricSpline::SafeDownCast(@)",
    header: "vtkParametricSpline.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkParametricSpline :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkParametricFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkParametricSpline :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkParametricSpline :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkParametricSpline; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkParametricSpline.h".}
proc New*(): ptr vtkParametricSpline {.importcpp: "vtkParametricSpline::New(@)",
                                   header: "vtkParametricSpline.h".}
proc GetDimension*(this: var vtkParametricSpline): cint {.importcpp: "GetDimension",
    header: "vtkParametricSpline.h".}
proc Evaluate*(this: var vtkParametricSpline; u: array[3, cdouble];
              Pt: array[3, cdouble]; Du: array[9, cdouble]) {.importcpp: "Evaluate",
    header: "vtkParametricSpline.h".}
proc EvaluateScalar*(this: var vtkParametricSpline; u: array[3, cdouble];
                    Pt: array[3, cdouble]; Du: array[9, cdouble]): cdouble {.
    importcpp: "EvaluateScalar", header: "vtkParametricSpline.h".}
proc SetXSpline*(this: var vtkParametricSpline; a2: ptr vtkSpline) {.
    importcpp: "SetXSpline", header: "vtkParametricSpline.h".}
proc SetYSpline*(this: var vtkParametricSpline; a2: ptr vtkSpline) {.
    importcpp: "SetYSpline", header: "vtkParametricSpline.h".}
proc SetZSpline*(this: var vtkParametricSpline; a2: ptr vtkSpline) {.
    importcpp: "SetZSpline", header: "vtkParametricSpline.h".}
proc GetnameXSpline*(this: var vtkParametricSpline): ptr vtkSpline {.
    importcpp: "GetnameXSpline", header: "vtkParametricSpline.h".}
proc GetnameXSplineYSpline*(this: var vtkParametricSpline): ptr vtkSpline {.
    importcpp: "GetnameXSplineYSpline", header: "vtkParametricSpline.h".}
proc GetnameXSplineYSplineZSpline*(this: var vtkParametricSpline): ptr vtkSpline {.
    importcpp: "GetnameXSplineYSplineZSpline", header: "vtkParametricSpline.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify the list of points defining the spline. Do this by
  ##  specifying a vtkPoints array containing the points. Note that
  ##  the order of the points in vtkPoints is the order that the
  ##  splines will be fit.
  ##
proc SetPoints*(this: var vtkParametricSpline; a2: ptr vtkPoints) {.
    importcpp: "SetPoints", header: "vtkParametricSpline.h".}
proc GetnameXSplineYSplineZSplinePoints*(this: var vtkParametricSpline): ptr vtkPoints {.
    importcpp: "GetnameXSplineYSplineZSplinePoints",
    header: "vtkParametricSpline.h".}
  ## /@}
  ## /@{
  ## *
  ##  Another API to set the points. Set the number of points and then set the
  ##  individual point coordinates.
  ##
proc SetNumberOfPoints*(this: var vtkParametricSpline; numPts: vtkIdType) {.
    importcpp: "SetNumberOfPoints", header: "vtkParametricSpline.h".}
proc SetPoint*(this: var vtkParametricSpline; index: vtkIdType; x: cdouble; y: cdouble;
              z: cdouble) {.importcpp: "SetPoint", header: "vtkParametricSpline.h".}
proc SetClosed*(this: var vtkParametricSpline; _arg: vtkTypeBool) {.
    importcpp: "SetClosed", header: "vtkParametricSpline.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetClosed ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Closed  of  << this -> Closed ) ; return this -> Closed ; } ;
## Error: expected ';'!!!

proc ClosedOn*(this: var vtkParametricSpline) {.importcpp: "ClosedOn",
    header: "vtkParametricSpline.h".}
proc ClosedOff*(this: var vtkParametricSpline) {.importcpp: "ClosedOff",
    header: "vtkParametricSpline.h".}
  ## /@}
  ## /@{
  ## *
  ##  Control whether the spline is parameterized by length or by point index.
  ##  Default is by length.
  ##
proc SetClosedParameterizeByLength*(this: var vtkParametricSpline; _arg: vtkTypeBool) {.
    importcpp: "SetClosedParameterizeByLength", header: "vtkParametricSpline.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetClosedParameterizeByLength ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ParameterizeByLength  of  << this -> ParameterizeByLength ) ; return this -> ParameterizeByLength ; } ;
## Error: expected ';'!!!

proc ParameterizeByLengthOn*(this: var vtkParametricSpline) {.
    importcpp: "ParameterizeByLengthOn", header: "vtkParametricSpline.h".}
proc ParameterizeByLengthOff*(this: var vtkParametricSpline) {.
    importcpp: "ParameterizeByLengthOff", header: "vtkParametricSpline.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set the type of constraint of the left(right) end points. Four
  ##  constraints are available:
  ##
  ##  0: the first derivative at left(right) most point is determined
  ##  from the line defined from the first(last) two points.
  ##
  ##  1: the first derivative at left(right) most point is set to
  ##  Left(Right)Value.
  ##
  ##  2: the second derivative at left(right) most point is set to
  ##  Left(Right)Value.
  ##
  ##  3: the second derivative at left(right)most points is Left(Right)Value
  ##  times second derivative at first interior point.
  ##
proc SetLeftConstraint*(this: var vtkParametricSpline; _arg: cint) {.
    importcpp: "SetLeftConstraint", header: "vtkParametricSpline.h".}
proc GetLeftConstraintMinValue*(this: var vtkParametricSpline): cint {.
    importcpp: "GetLeftConstraintMinValue", header: "vtkParametricSpline.h".}
proc GetLeftConstraintMaxValue*(this: var vtkParametricSpline): cint {.
    importcpp: "GetLeftConstraintMaxValue", header: "vtkParametricSpline.h".}
## !!!Ignored construct:  virtual int GetClosedParameterizeByLengthLeftConstraint ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LeftConstraint  of  << this -> LeftConstraint ) ; return this -> LeftConstraint ; } ;
## Error: expected ';'!!!

proc SetLeftConstraintRightConstraint*(this: var vtkParametricSpline; _arg: cint) {.
    importcpp: "SetLeftConstraintRightConstraint", header: "vtkParametricSpline.h".}
proc GetLeftConstraintMinValueRightConstraintMinValue*(
    this: var vtkParametricSpline): cint {.importcpp: "GetLeftConstraintMinValueRightConstraintMinValue",
                                       header: "vtkParametricSpline.h".}
proc GetLeftConstraintMaxValueRightConstraintMaxValue*(
    this: var vtkParametricSpline): cint {.importcpp: "GetLeftConstraintMaxValueRightConstraintMaxValue",
                                       header: "vtkParametricSpline.h".}
## !!!Ignored construct:  virtual int GetClosedParameterizeByLengthLeftConstraintRightConstraint ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RightConstraint  of  << this -> RightConstraint ) ; return this -> RightConstraint ; } ;
## Error: expected ';'!!!

proc SetClosedParameterizeByLengthLeftValue*(this: var vtkParametricSpline;
    _arg: cdouble) {.importcpp: "SetClosedParameterizeByLengthLeftValue",
                   header: "vtkParametricSpline.h".}
## !!!Ignored construct:  virtual double GetClosedParameterizeByLengthLeftConstraintRightConstraintLeftValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LeftValue  of  << this -> LeftValue ) ; return this -> LeftValue ; } ;
## Error: expected ';'!!!

proc SetClosedParameterizeByLengthLeftValueRightValue*(
    this: var vtkParametricSpline; _arg: cdouble) {.
    importcpp: "SetClosedParameterizeByLengthLeftValueRightValue",
    header: "vtkParametricSpline.h".}
## !!!Ignored construct:  virtual double GetClosedParameterizeByLengthLeftConstraintRightConstraintLeftValueRightValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RightValue  of  << this -> RightValue ) ; return this -> RightValue ; } ;
## Error: expected ';'!!!
