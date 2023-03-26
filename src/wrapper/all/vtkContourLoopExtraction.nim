## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkContourLoopExtraction.h
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
##  @class   vtkContourLoopExtraction
##  @brief   extract closed loops (polygons) from lines and polylines
##
##  This filter takes an input consisting of lines and polylines and
##  constructs polygons (i.e., closed loops) from them. It combines some of
##  the capability of connectivity filters and the line stripper to produce
##  manifold loops that are suitable for geometric operations. For example,
##  the vtkCookieCutter works well with this filter.
##
##  Note that the input structure for this filter consists of points and line
##  or polyline cells. All other topological types (verts, polygons, triangle
##  strips) are ignored. The output of this filter is by default manifold
##  polygons. Note however, that optionally polyline loops may also be output
##  if requested.
##
##  @warning
##  Although the loops are constructed in 3-space, a normal vector must be
##  supplied to help choose a turn direction when multiple choices are
##  possible. By default the normal vector is n={0,0,1} but may be user
##  specified. Note also that some filters require that the loops are located
##  in the z=constant or z=0 plane. Hence a transform filter of some sort may
##  be necesssary to project the loops to a plane.
##
##  @warning
##  Note that lines that do not close in on themselves can be optionally
##  forced closed. This occurs when for example, 2D contours end and begin at
##  the boundaries of data. By forcing closure, the last point is joined to
##  the first point (with boundary points possibly added). Note that there are
##  different closure modes: 1) do not close (and hence reject the polygon);
##  2) close along the dataset boundaries (i.e., the bounding box of a dataset
##  used to generate the contour lines); and 3) close all open loops by
##  connectiong the first and last point. If Option #2 is chosen, only loops
##  that start and end on either a horizontal or vertical boundary are closed.
##
##  @warning
##  Scalar thresholding can be enabled. If enabled, then only those loops with
##  *any" scalar point data within the thresholded range are extracted.
##
##  @warning
##  Any detached lines forming degenerate loops of defined by two points or
##  less are discarded. Non-manifold junctions are broken into separate,
##  independent loops.
##
##  @warning
##  Boundary closure only works if the end points are both on a vertical
##  boundary or horizontal boundary. Otherwise new points would have to be
##  added which this filter does not (currently) do.
##
##  @sa
##  vtkCookieCutter vtkFlyingEdges2D vtkMarchingSquares vtkFeatureEdges
##  vtkConnectivityFilter vtkPolyDataConnectivityFilter
##  vtkDiscreteFlyingEdges2D vtkStripper vtkImprintFilter
##  vtkCleanPolyData vtkStaticCleanPolyData
##

import
  vtkFiltersModelingModule, vtkPolyDataAlgorithm

const
  VTK_LOOP_CLOSURE_OFF* = 0
  VTK_LOOP_CLOSURE_BOUNDARY* = 1
  VTK_LOOP_CLOSURE_ALL* = 2
  VTK_OUTPUT_POLYGONS* = 0
  VTK_OUTPUT_POLYLINES* = 1
  VTK_OUTPUT_BOTH* = 2

type
  vtkContourLoopExtraction* {.importcpp: "vtkContourLoopExtraction",
                             header: "vtkContourLoopExtraction.h", bycopy.} = object of vtkPolyDataAlgorithm ## /@{
                                                                                                      ## *
                                                                                                      ##  Standard methods to instantiate, print and provide type information.
                                                                                                      ##
    vtkContourLoopExtraction* {.importc: "vtkContourLoopExtraction".}: VTK_NEWINSTANCE


proc New*(): ptr vtkContourLoopExtraction {.importcpp: "vtkContourLoopExtraction::New(@)",
                                        header: "vtkContourLoopExtraction.h".}
type
  vtkContourLoopExtractionSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkContourLoopExtraction::IsTypeOf(@)",
    header: "vtkContourLoopExtraction.h".}
proc IsA*(this: var vtkContourLoopExtraction; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkContourLoopExtraction.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkContourLoopExtraction {.
    importcpp: "vtkContourLoopExtraction::SafeDownCast(@)",
    header: "vtkContourLoopExtraction.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkContourLoopExtraction :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkContourLoopExtraction :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkContourLoopExtraction :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkContourLoopExtraction; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkContourLoopExtraction.h".}
proc SetLoopClosure*(this: var vtkContourLoopExtraction; _arg: cint) {.
    importcpp: "SetLoopClosure", header: "vtkContourLoopExtraction.h".}
proc GetLoopClosureMinValue*(this: var vtkContourLoopExtraction): cint {.
    importcpp: "GetLoopClosureMinValue", header: "vtkContourLoopExtraction.h".}
proc GetLoopClosureMaxValue*(this: var vtkContourLoopExtraction): cint {.
    importcpp: "GetLoopClosureMaxValue", header: "vtkContourLoopExtraction.h".}
## !!!Ignored construct:  virtual int GetLoopClosure ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LoopClosure  of  << this -> LoopClosure ) ; return this -> LoopClosure ; } ;
## Error: expected ';'!!!

proc SetLoopClosureToOff*(this: var vtkContourLoopExtraction) {.
    importcpp: "SetLoopClosureToOff", header: "vtkContourLoopExtraction.h".}
proc SetLoopClosureToBoundary*(this: var vtkContourLoopExtraction) {.
    importcpp: "SetLoopClosureToBoundary", header: "vtkContourLoopExtraction.h".}
proc SetLoopClosureToAll*(this: var vtkContourLoopExtraction) {.
    importcpp: "SetLoopClosureToAll", header: "vtkContourLoopExtraction.h".}
proc GetLoopClosureAsString*(this: var vtkContourLoopExtraction): cstring {.
    importcpp: "GetLoopClosureAsString", header: "vtkContourLoopExtraction.h".}
proc SetScalarThresholding*(this: var vtkContourLoopExtraction; _arg: bool) {.
    importcpp: "SetScalarThresholding", header: "vtkContourLoopExtraction.h".}
## !!!Ignored construct:  virtual bool GetLoopClosureScalarThresholding ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarThresholding  of  << this -> ScalarThresholding ) ; return this -> ScalarThresholding ; } ;
## Error: expected ';'!!!

proc ScalarThresholdingOn*(this: var vtkContourLoopExtraction) {.
    importcpp: "ScalarThresholdingOn", header: "vtkContourLoopExtraction.h".}
proc ScalarThresholdingOff*(this: var vtkContourLoopExtraction) {.
    importcpp: "ScalarThresholdingOff", header: "vtkContourLoopExtraction.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set the scalar range to use to extract loop based on scalar
  ##  thresholding.  If any scalar, point data, in the loop falls into the
  ##  scalar range given, then the loop is extracted.
  ##
proc SetScalarRange*(this: var vtkContourLoopExtraction; _arg1: cdouble;
                    _arg2: cdouble) {.importcpp: "SetScalarRange",
                                    header: "vtkContourLoopExtraction.h".}
proc SetScalarRange*(this: var vtkContourLoopExtraction; _arg: array[2, cdouble]) {.
    importcpp: "SetScalarRange", header: "vtkContourLoopExtraction.h".}
## !!!Ignored construct:  virtual double * GetScalarRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarRange  pointer  << this -> ScalarRange ) ; return this -> ScalarRange ; } VTK_WRAPEXCLUDE virtual void GetScalarRange ( double & _arg1 , double & _arg2 ) { _arg1 = this -> ScalarRange [ 0 ] ; _arg2 = this -> ScalarRange [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << ScalarRange  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetScalarRange ( double _arg [ 2 ] ) { this -> GetScalarRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetNormal*(this: var vtkContourLoopExtraction; _arg1: cdouble; _arg2: cdouble;
               _arg3: cdouble) {.importcpp: "SetNormal",
                               header: "vtkContourLoopExtraction.h".}
proc SetNormal*(this: var vtkContourLoopExtraction; _arg: array[3, cdouble]) {.
    importcpp: "SetNormal", header: "vtkContourLoopExtraction.h".}
## !!!Ignored construct:  virtual double * GetNormal ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Normal  pointer  << this -> Normal ) ; return this -> Normal ; } VTK_WRAPEXCLUDE virtual void GetNormal ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Normal [ 0 ] ; _arg2 = this -> Normal [ 1 ] ; _arg3 = this -> Normal [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Normal  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetNormal ( double _arg [ 3 ] ) { this -> GetNormal ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetLoopClosureOutputMode*(this: var vtkContourLoopExtraction; _arg: cint) {.
    importcpp: "SetLoopClosureOutputMode", header: "vtkContourLoopExtraction.h".}
proc GetLoopClosureMinValueOutputModeMinValue*(this: var vtkContourLoopExtraction): cint {.
    importcpp: "GetLoopClosureMinValueOutputModeMinValue",
    header: "vtkContourLoopExtraction.h".}
proc GetLoopClosureMaxValueOutputModeMaxValue*(this: var vtkContourLoopExtraction): cint {.
    importcpp: "GetLoopClosureMaxValueOutputModeMaxValue",
    header: "vtkContourLoopExtraction.h".}
## !!!Ignored construct:  virtual int GetLoopClosureScalarThresholdingOutputMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputMode  of  << this -> OutputMode ) ; return this -> OutputMode ; } ;
## Error: expected ';'!!!

proc SetOutputModeToPolygons*(this: var vtkContourLoopExtraction) {.
    importcpp: "SetOutputModeToPolygons", header: "vtkContourLoopExtraction.h".}
proc SetOutputModeToPolylines*(this: var vtkContourLoopExtraction) {.
    importcpp: "SetOutputModeToPolylines", header: "vtkContourLoopExtraction.h".}
proc SetOutputModeToBoth*(this: var vtkContourLoopExtraction) {.
    importcpp: "SetOutputModeToBoth", header: "vtkContourLoopExtraction.h".}
proc GetOutputModeAsString*(this: var vtkContourLoopExtraction): cstring {.
    importcpp: "GetOutputModeAsString", header: "vtkContourLoopExtraction.h".}
proc SetScalarThresholdingCleanPoints*(this: var vtkContourLoopExtraction;
                                      _arg: bool) {.
    importcpp: "SetScalarThresholdingCleanPoints",
    header: "vtkContourLoopExtraction.h".}
## !!!Ignored construct:  virtual bool GetLoopClosureScalarThresholdingOutputModeCleanPoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CleanPoints  of  << this -> CleanPoints ) ; return this -> CleanPoints ; } ;
## Error: expected ';'!!!

proc CleanPointsOn*(this: var vtkContourLoopExtraction) {.
    importcpp: "CleanPointsOn", header: "vtkContourLoopExtraction.h".}
proc CleanPointsOff*(this: var vtkContourLoopExtraction) {.
    importcpp: "CleanPointsOff", header: "vtkContourLoopExtraction.h".}
  ## /@}