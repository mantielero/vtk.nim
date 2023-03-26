## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkKochanekSpline.h
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
##  @class   vtkKochanekSpline
##  @brief   computes an interpolating spline using a Kochanek basis.
##
##  Implements the Kochanek interpolating spline described in: Kochanek, D.,
##  Bartels, R., "Interpolating Splines with Local Tension, Continuity, and
##  Bias Control," Computer Graphics, vol. 18, no. 3, pp. 33-41, July 1984.
##  These splines give the user more control over the shape of the curve than
##  the cardinal splines implemented in vtkCardinalSpline. Three parameters
##  can be specified. All have a range from -1 to 1.
##
##  Tension controls how sharply the curve bends at an input point. A
##  value of -1 produces more slack in the curve. A value of 1 tightens
##  the curve.
##
##  Continuity controls the continuity of the first derivative at input
##  points.
##
##  Bias controls the direction of the curve at it passes through an input
##  point. A value of -1 undershoots the point while a value of 1
##  overshoots the point.
##
##  These three parameters give the user broad control over the shape of
##  the interpolating spline. The original Kochanek paper describes the
##  effects nicely and is recommended reading.
##
##  @sa
##  vtkSpline vtkCardinalSpline
##

import
  vtkCommonComputationalGeometryModule, vtkSpline

type
  vtkKochanekSpline* {.importcpp: "vtkKochanekSpline",
                      header: "vtkKochanekSpline.h", bycopy.} = object of vtkSpline
    vtkKochanekSpline* {.importc: "vtkKochanekSpline".}: VTK_NEWINSTANCE

  vtkKochanekSplineSuperclass* = vtkSpline

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkKochanekSpline::IsTypeOf(@)", header: "vtkKochanekSpline.h".}
proc IsA*(this: var vtkKochanekSpline; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkKochanekSpline.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkKochanekSpline {.
    importcpp: "vtkKochanekSpline::SafeDownCast(@)", header: "vtkKochanekSpline.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkKochanekSpline :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkSpline :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkKochanekSpline :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkKochanekSpline :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkKochanekSpline; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkKochanekSpline.h".}
proc New*(): ptr vtkKochanekSpline {.importcpp: "vtkKochanekSpline::New(@)",
                                 header: "vtkKochanekSpline.h".}
proc Compute*(this: var vtkKochanekSpline) {.importcpp: "Compute",
    header: "vtkKochanekSpline.h".}
proc Evaluate*(this: var vtkKochanekSpline; t: cdouble): cdouble {.
    importcpp: "Evaluate", header: "vtkKochanekSpline.h".}
proc SetDefaultBias*(this: var vtkKochanekSpline; _arg: cdouble) {.
    importcpp: "SetDefaultBias", header: "vtkKochanekSpline.h".}
## !!!Ignored construct:  virtual double GetDefaultBias ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DefaultBias  of  << this -> DefaultBias ) ; return this -> DefaultBias ; } ;
## Error: expected ';'!!!

proc SetDefaultBiasDefaultTension*(this: var vtkKochanekSpline; _arg: cdouble) {.
    importcpp: "SetDefaultBiasDefaultTension", header: "vtkKochanekSpline.h".}
## !!!Ignored construct:  virtual double GetDefaultBiasDefaultTension ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DefaultTension  of  << this -> DefaultTension ) ; return this -> DefaultTension ; } ;
## Error: expected ';'!!!

proc SetDefaultBiasDefaultTensionDefaultContinuity*(this: var vtkKochanekSpline;
    _arg: cdouble) {.importcpp: "SetDefaultBiasDefaultTensionDefaultContinuity",
                   header: "vtkKochanekSpline.h".}
## !!!Ignored construct:  virtual double GetDefaultBiasDefaultTensionDefaultContinuity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DefaultContinuity  of  << this -> DefaultContinuity ) ; return this -> DefaultContinuity ; } ;
## Error: expected ';'!!!

proc DeepCopy*(this: var vtkKochanekSpline; s: ptr vtkSpline) {.importcpp: "DeepCopy",
    header: "vtkKochanekSpline.h".}