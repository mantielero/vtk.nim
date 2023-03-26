## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPiecewiseFunction.h
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
##  @class   vtkPiecewiseFunction
##  @brief   Defines a 1D piecewise function.
##
##
##  Defines a piecewise function mapping. This mapping allows the addition
##  of control points, and allows the user to control the function between
##  the control points. A piecewise hermite curve is used between control
##  points, based on the sharpness and midpoint parameters. A sharpness of
##  0 yields a piecewise linear function and a sharpness of 1 yields a
##  piecewise constant function. The midpoint is the normalized distance
##  between control points at which the curve reaches the median Y value.
##  The midpoint and sharpness values specified when adding a node are used
##  to control the transition to the next node (the last node's values are
##  ignored) Outside the range of nodes, the values are 0 if Clamping is off,
##  or the nearest node point if Clamping is on. Using the legacy methods for
##  adding points  (which do not have Sharpness and Midpoint parameters)
##  will default to Midpoint = 0.5 (halfway between the control points) and
##  Sharpness = 0.0 (linear).
##

import
  vtkCommonDataModelModule, vtkDataObject

discard "forward decl of vtkPiecewiseFunctionInternals"
type
  vtkPiecewiseFunction* {.importcpp: "vtkPiecewiseFunction",
                         header: "vtkPiecewiseFunction.h", bycopy.} = object of vtkDataObject
    vtkPiecewiseFunction* {.importc: "vtkPiecewiseFunction".}: VTK_NEWINSTANCE
    ##  Determines the function value outside of defined points
    ##  Zero = always return 0.0 outside of defined points
    ##  One  = clamp to the lowest value below defined points and
    ##         highest value above defined points
    ##  Array of points ((X,Y) pairs)
    ##  Min and max range of function point locations


proc New*(): ptr vtkPiecewiseFunction {.importcpp: "vtkPiecewiseFunction::New(@)",
                                    header: "vtkPiecewiseFunction.h".}
type
  vtkPiecewiseFunctionSuperclass* = vtkDataObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPiecewiseFunction::IsTypeOf(@)",
    header: "vtkPiecewiseFunction.h".}
proc IsA*(this: var vtkPiecewiseFunction; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPiecewiseFunction.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPiecewiseFunction {.
    importcpp: "vtkPiecewiseFunction::SafeDownCast(@)",
    header: "vtkPiecewiseFunction.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPiecewiseFunction :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPiecewiseFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPiecewiseFunction :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPiecewiseFunction; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPiecewiseFunction.h".}
proc DeepCopy*(this: var vtkPiecewiseFunction; f: ptr vtkDataObject) {.
    importcpp: "DeepCopy", header: "vtkPiecewiseFunction.h".}
proc ShallowCopy*(this: var vtkPiecewiseFunction; f: ptr vtkDataObject) {.
    importcpp: "ShallowCopy", header: "vtkPiecewiseFunction.h".}
proc GetDataObjectType*(this: var vtkPiecewiseFunction): cint {.
    importcpp: "GetDataObjectType", header: "vtkPiecewiseFunction.h".}
proc GetSize*(this: var vtkPiecewiseFunction): cint {.importcpp: "GetSize",
    header: "vtkPiecewiseFunction.h".}
proc AddPoint*(this: var vtkPiecewiseFunction; x: cdouble; y: cdouble): cint {.
    importcpp: "AddPoint", header: "vtkPiecewiseFunction.h".}
proc AddPoint*(this: var vtkPiecewiseFunction; x: cdouble; y: cdouble;
              midpoint: cdouble; sharpness: cdouble): cint {.importcpp: "AddPoint",
    header: "vtkPiecewiseFunction.h".}
proc RemovePointByIndex*(this: var vtkPiecewiseFunction; id: csize_t): bool {.
    importcpp: "RemovePointByIndex", header: "vtkPiecewiseFunction.h".}
proc RemovePoint*(this: var vtkPiecewiseFunction; x: cdouble): cint {.
    importcpp: "RemovePoint", header: "vtkPiecewiseFunction.h".}
proc RemovePoint*(this: var vtkPiecewiseFunction; x: cdouble; y: cdouble): cint {.
    importcpp: "RemovePoint", header: "vtkPiecewiseFunction.h".}
proc RemoveAllPoints*(this: var vtkPiecewiseFunction) {.
    importcpp: "RemoveAllPoints", header: "vtkPiecewiseFunction.h".}
proc AddSegment*(this: var vtkPiecewiseFunction; x1: cdouble; y1: cdouble; x2: cdouble;
                y2: cdouble) {.importcpp: "AddSegment",
                             header: "vtkPiecewiseFunction.h".}
proc GetValue*(this: var vtkPiecewiseFunction; x: cdouble): cdouble {.
    importcpp: "GetValue", header: "vtkPiecewiseFunction.h".}
proc GetNodeValue*(this: var vtkPiecewiseFunction; index: cint; val: array[4, cdouble]): cint {.
    importcpp: "GetNodeValue", header: "vtkPiecewiseFunction.h".}
proc SetNodeValue*(this: var vtkPiecewiseFunction; index: cint; val: array[4, cdouble]): cint {.
    importcpp: "SetNodeValue", header: "vtkPiecewiseFunction.h".}
proc GetDataPointer*(this: var vtkPiecewiseFunction): ptr cdouble {.
    importcpp: "GetDataPointer", header: "vtkPiecewiseFunction.h".}
proc FillFromDataPointer*(this: var vtkPiecewiseFunction; a2: cint; a3: ptr cdouble) {.
    importcpp: "FillFromDataPointer", header: "vtkPiecewiseFunction.h".}
## !!!Ignored construct:  /@} /@{ *
##  Returns the min and max node locations of the function.
##  virtual double * GetRangeRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Range  pointer  << this -> Range ) ; return this -> Range ; } VTK_WRAPEXCLUDE virtual void GetRangeRange ( double & _arg1 , double & _arg2 ) { _arg1 = this -> Range [ 0 ] ; _arg2 = this -> Range [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Range  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetRangeRange ( double _arg [ 2 ] ) { this -> GetRangeRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc AdjustRange*(this: var vtkPiecewiseFunction; range: array[2, cdouble]): cint {.
    importcpp: "AdjustRange", header: "vtkPiecewiseFunction.h".}
proc GetTable*(this: var vtkPiecewiseFunction; x1: cdouble; x2: cdouble; size: cint;
              table: ptr cfloat; stride: cint = 1; logIncrements: cint = 0) {.
    importcpp: "GetTable", header: "vtkPiecewiseFunction.h".}
proc GetTable*(this: var vtkPiecewiseFunction; x1: cdouble; x2: cdouble; size: cint;
              table: ptr cdouble; stride: cint = 1; logIncrements: cint = 0) {.
    importcpp: "GetTable", header: "vtkPiecewiseFunction.h".}
proc BuildFunctionFromTable*(this: var vtkPiecewiseFunction; x1: cdouble; x2: cdouble;
                            size: cint; table: ptr cdouble; stride: cint = 1) {.
    importcpp: "BuildFunctionFromTable", header: "vtkPiecewiseFunction.h".}
proc SetClamping*(this: var vtkPiecewiseFunction; _arg: vtkTypeBool) {.
    importcpp: "SetClamping", header: "vtkPiecewiseFunction.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetClamping ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Clamping  of  << this -> Clamping ) ; return this -> Clamping ; } ;
## Error: expected ';'!!!

proc ClampingOn*(this: var vtkPiecewiseFunction) {.importcpp: "ClampingOn",
    header: "vtkPiecewiseFunction.h".}
proc ClampingOff*(this: var vtkPiecewiseFunction) {.importcpp: "ClampingOff",
    header: "vtkPiecewiseFunction.h".}
  ## /@}
  ## *
  ##  Interpolate between the control points in base-10 logrithmic space.
  ##  Default is false.
  ##  @{
  ##
proc SetClampingUseLogScale*(this: var vtkPiecewiseFunction; _arg: bool) {.
    importcpp: "SetClampingUseLogScale", header: "vtkPiecewiseFunction.h".}
## !!!Ignored construct:  virtual bool GetClampingUseLogScale ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseLogScale  of  << this -> UseLogScale ) ; return this -> UseLogScale ; } ;
## Error: expected ';'!!!

proc UseLogScaleOn*(this: var vtkPiecewiseFunction) {.importcpp: "UseLogScaleOn",
    header: "vtkPiecewiseFunction.h".}
proc UseLogScaleOff*(this: var vtkPiecewiseFunction) {.importcpp: "UseLogScaleOff",
    header: "vtkPiecewiseFunction.h".}
  ## *@}
  ## *
  ##  Return the type of function:
  ##  Function Types:
  ##  0 : Constant        (No change in slope between end points)
  ##  1 : NonDecreasing   (Always increasing or zero slope)
  ##  2 : NonIncreasing   (Always decreasing or zero slope)
  ##  3 : Varied          (Contains both decreasing and increasing slopes)
  ##
proc GetType*(this: var vtkPiecewiseFunction): cstring {.importcpp: "GetType",
    header: "vtkPiecewiseFunction.h".}
proc GetFirstNonZeroValue*(this: var vtkPiecewiseFunction): cdouble {.
    importcpp: "GetFirstNonZeroValue", header: "vtkPiecewiseFunction.h".}
proc Initialize*(this: var vtkPiecewiseFunction) {.importcpp: "Initialize",
    header: "vtkPiecewiseFunction.h".}
proc GetData*(info: ptr vtkInformation): ptr vtkPiecewiseFunction {.
    importcpp: "vtkPiecewiseFunction::GetData(@)",
    header: "vtkPiecewiseFunction.h".}
proc GetData*(v: ptr vtkInformationVector; i: cint = 0): ptr vtkPiecewiseFunction {.
    importcpp: "vtkPiecewiseFunction::GetData(@)",
    header: "vtkPiecewiseFunction.h".}
proc SetClampingUseLogScaleAllowDuplicateScalars*(this: var vtkPiecewiseFunction;
    _arg: vtkTypeBool) {.importcpp: "SetClampingUseLogScaleAllowDuplicateScalars",
                       header: "vtkPiecewiseFunction.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetClampingUseLogScaleAllowDuplicateScalars ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AllowDuplicateScalars  of  << this -> AllowDuplicateScalars ) ; return this -> AllowDuplicateScalars ; } ;
## Error: expected ';'!!!

proc AllowDuplicateScalarsOn*(this: var vtkPiecewiseFunction) {.
    importcpp: "AllowDuplicateScalarsOn", header: "vtkPiecewiseFunction.h".}
proc AllowDuplicateScalarsOff*(this: var vtkPiecewiseFunction) {.
    importcpp: "AllowDuplicateScalarsOff", header: "vtkPiecewiseFunction.h".}
  ## /@}
  ## *
  ##  Estimates the minimum size of a table such that it would correctly sample this function.
  ##  The returned value should be passed as parameter 'n' when calling GetTable().
  ##
proc EstimateMinNumberOfSamples*(this: var vtkPiecewiseFunction; x1: cdouble;
                                x2: cdouble): cint {.
    importcpp: "EstimateMinNumberOfSamples", header: "vtkPiecewiseFunction.h".}