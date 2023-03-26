## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBezierContourLineInterpolator.h
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
##  @class   vtkBezierContourLineInterpolator
##  @brief   Interpolates supplied nodes with bezier line segments
##
##  The line interpolator interpolates supplied nodes (see InterpolateLine)
##  with Bezier line segments. The fitness of the curve may be controlled using
##  SetMaximumCurveError and SetMaximumNumberOfLineSegments.
##
##  @sa
##  vtkContourLineInterpolator
##

import
  vtkContourLineInterpolator, vtkInteractionWidgetsModule

type
  vtkBezierContourLineInterpolator* {.importcpp: "vtkBezierContourLineInterpolator", header: "vtkBezierContourLineInterpolator.h",
                                     bycopy.} = object of vtkContourLineInterpolator ## *
                                                                                ##  Instantiate this class.
                                                                                ##
    vtkBezierContourLineInterpolator* {.importc: "vtkBezierContourLineInterpolator".}: VTK_NEWINSTANCE


proc New*(): ptr vtkBezierContourLineInterpolator {.
    importcpp: "vtkBezierContourLineInterpolator::New(@)",
    header: "vtkBezierContourLineInterpolator.h".}
type
  vtkBezierContourLineInterpolatorSuperclass* = vtkContourLineInterpolator

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkBezierContourLineInterpolator::IsTypeOf(@)",
    header: "vtkBezierContourLineInterpolator.h".}
proc IsA*(this: var vtkBezierContourLineInterpolator; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkBezierContourLineInterpolator.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkBezierContourLineInterpolator {.
    importcpp: "vtkBezierContourLineInterpolator::SafeDownCast(@)",
    header: "vtkBezierContourLineInterpolator.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkBezierContourLineInterpolator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkContourLineInterpolator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBezierContourLineInterpolator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBezierContourLineInterpolator :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkBezierContourLineInterpolator; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkBezierContourLineInterpolator.h".}
proc InterpolateLine*(this: var vtkBezierContourLineInterpolator;
                     ren: ptr vtkRenderer; rep: ptr vtkContourRepresentation;
                     idx1: cint; idx2: cint): cint {.importcpp: "InterpolateLine",
    header: "vtkBezierContourLineInterpolator.h".}
proc SetMaximumCurveError*(this: var vtkBezierContourLineInterpolator; _arg: cdouble) {.
    importcpp: "SetMaximumCurveError",
    header: "vtkBezierContourLineInterpolator.h".}
proc GetMaximumCurveErrorMinValue*(this: var vtkBezierContourLineInterpolator): cdouble {.
    importcpp: "GetMaximumCurveErrorMinValue",
    header: "vtkBezierContourLineInterpolator.h".}
proc GetMaximumCurveErrorMaxValue*(this: var vtkBezierContourLineInterpolator): cdouble {.
    importcpp: "GetMaximumCurveErrorMaxValue",
    header: "vtkBezierContourLineInterpolator.h".}
## !!!Ignored construct:  virtual double GetMaximumCurveError ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumCurveError  of  << this -> MaximumCurveError ) ; return this -> MaximumCurveError ; } ;
## Error: expected ';'!!!

proc SetMaximumCurveErrorMaximumCurveLineSegments*(
    this: var vtkBezierContourLineInterpolator; _arg: cint) {.
    importcpp: "SetMaximumCurveErrorMaximumCurveLineSegments",
    header: "vtkBezierContourLineInterpolator.h".}
proc GetMaximumCurveErrorMinValueMaximumCurveLineSegmentsMinValue*(
    this: var vtkBezierContourLineInterpolator): cint {.
    importcpp: "GetMaximumCurveErrorMinValueMaximumCurveLineSegmentsMinValue",
    header: "vtkBezierContourLineInterpolator.h".}
proc GetMaximumCurveErrorMaxValueMaximumCurveLineSegmentsMaxValue*(
    this: var vtkBezierContourLineInterpolator): cint {.
    importcpp: "GetMaximumCurveErrorMaxValueMaximumCurveLineSegmentsMaxValue",
    header: "vtkBezierContourLineInterpolator.h".}
## !!!Ignored construct:  virtual int GetMaximumCurveErrorMaximumCurveLineSegments ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumCurveLineSegments  of  << this -> MaximumCurveLineSegments ) ; return this -> MaximumCurveLineSegments ; } ;
## Error: expected ';'!!!

proc GetSpan*(this: var vtkBezierContourLineInterpolator; nodeIndex: cint;
             nodeIndices: ptr vtkIntArray; rep: ptr vtkContourRepresentation) {.
    importcpp: "GetSpan", header: "vtkBezierContourLineInterpolator.h".}