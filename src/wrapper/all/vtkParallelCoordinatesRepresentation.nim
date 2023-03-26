## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkParallelCoordinatesRepresentation.h
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
## -------------------------------------------------------------------------
##   Copyright 2009 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkParallelCoordinatesRepresentation
##  @brief   Data representation that
##   takes generic multivariate data and produces a parallel coordinates plot.
##
##
##   A parallel coordinates plot represents each variable in a multivariate
##   data set as a separate axis.  Individual samples of that data set are
##   represented as a polyline that pass through each variable axis at
##   positions that correspond to data values.  vtkParallelCoordinatesRepresentation
##   generates this plot when added to a vtkParallelCoordinatesView, which handles
##   interaction and highlighting.  Sample polylines can alternatively
##   be represented as s-curves by enabling the UseCurves flag.
##
##   There are three selection modes: lasso, angle, and function. Lasso selection
##   picks sample lines that pass through a polyline.  Angle selection picks sample
##   lines that have similar slope to a line segment.  Function selection picks
##   sample lines that are near a linear function defined on two variables.  This
##   function specified by passing two (x,y) variable value pairs.
##
##   All primitives are plotted in normalized view coordinates [0,1].
##
##  @sa
##   vtkParallelCoordinatesView vtkParallelCoordinatesHistogramRepresentation
##   vtkSCurveSpline
##
##  @par Thanks:
##   Developed by David Feng at Sandia National Laboratories
##

import
  vtkRenderedRepresentation, vtkViewsInfovisModule

discard "forward decl of vtkActor"
discard "forward decl of vtkActor2D"
discard "forward decl of vtkArrayData"
discard "forward decl of vtkAxisActor2D"
discard "forward decl of vtkBivariateLinearTableThreshold"
discard "forward decl of vtkCollection"
discard "forward decl of vtkCoordinate"
discard "forward decl of vtkFieldData"
discard "forward decl of vtkDataArray"
discard "forward decl of vtkDataObject"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkIdList"
discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkIntArray"
discard "forward decl of vtkLookupTable"
discard "forward decl of vtkOutlineCornerSource"
discard "forward decl of vtkPoints"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkPolyDataMapper2D"
discard "forward decl of vtkPropCollection"
discard "forward decl of vtkSelection"
discard "forward decl of vtkSelectionNode"
discard "forward decl of vtkTextMapper"
discard "forward decl of vtkTimeStamp"
discard "forward decl of vtkUnsignedIntArray"
discard "forward decl of vtkViewport"
discard "forward decl of vtkWindow"
type
  vtkParallelCoordinatesRepresentation* {.
      importcpp: "vtkParallelCoordinatesRepresentation",
      header: "vtkParallelCoordinatesRepresentation.h", bycopy.} = object of vtkRenderedRepresentation
    vtkParallelCoordinatesRepresentation*
        {.importc: "vtkParallelCoordinatesRepresentation".}: VTK_NEWINSTANCE
    ##  Indexed by screen position


proc New*(): ptr vtkParallelCoordinatesRepresentation {.
    importcpp: "vtkParallelCoordinatesRepresentation::New(@)",
    header: "vtkParallelCoordinatesRepresentation.h".}
type
  vtkParallelCoordinatesRepresentationSuperclass* = vtkRenderedRepresentation

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkParallelCoordinatesRepresentation::IsTypeOf(@)",
    header: "vtkParallelCoordinatesRepresentation.h".}
proc IsA*(this: var vtkParallelCoordinatesRepresentation; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkParallelCoordinatesRepresentation.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkParallelCoordinatesRepresentation {.
    importcpp: "vtkParallelCoordinatesRepresentation::SafeDownCast(@)",
    header: "vtkParallelCoordinatesRepresentation.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkParallelCoordinatesRepresentation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkRenderedRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkParallelCoordinatesRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkParallelCoordinatesRepresentation :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkParallelCoordinatesRepresentation; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf", header: "vtkParallelCoordinatesRepresentation.h".}
proc ApplyViewTheme*(this: var vtkParallelCoordinatesRepresentation;
                    theme: ptr vtkViewTheme) {.importcpp: "ApplyViewTheme",
    header: "vtkParallelCoordinatesRepresentation.h".}
proc GetHoverString*(this: var vtkParallelCoordinatesRepresentation;
                    view: ptr vtkView; x: cint; y: cint): string {.
    importcpp: "GetHoverString", header: "vtkParallelCoordinatesRepresentation.h".}
proc SetPositionAndSize*(this: var vtkParallelCoordinatesRepresentation;
                        position: ptr cdouble; size: ptr cdouble): cint {.
    importcpp: "SetPositionAndSize",
    header: "vtkParallelCoordinatesRepresentation.h".}
proc GetPositionAndSize*(this: var vtkParallelCoordinatesRepresentation;
                        position: ptr cdouble; size: ptr cdouble): cint {.
    importcpp: "GetPositionAndSize",
    header: "vtkParallelCoordinatesRepresentation.h".}
proc SetAxisTitles*(this: var vtkParallelCoordinatesRepresentation;
                   a2: ptr vtkStringArray) {.importcpp: "SetAxisTitles",
    header: "vtkParallelCoordinatesRepresentation.h".}
proc SetAxisTitles*(this: var vtkParallelCoordinatesRepresentation;
                   a2: ptr vtkAlgorithmOutput) {.importcpp: "SetAxisTitles",
    header: "vtkParallelCoordinatesRepresentation.h".}
proc SetPlotTitle*(this: var vtkParallelCoordinatesRepresentation; a2: cstring) {.
    importcpp: "SetPlotTitle", header: "vtkParallelCoordinatesRepresentation.h".}
## !!!Ignored construct:  /@{ *
##  Get the number of axes in the plot
##  virtual int GetNumberOfAxesNumberOfAxes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfAxes  of  << this -> NumberOfAxes ) ; return this -> NumberOfAxes ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get the number of samples in the plot
##  virtual int GetNumberOfAxesNumberOfAxesNumberOfSamplesNumberOfSamples ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfSamples  of  << this -> NumberOfSamples ) ; return this -> NumberOfSamples ; } ;
## Error: expected ';'!!!

proc SetNumberOfAxisLabels*(this: var vtkParallelCoordinatesRepresentation;
                           num: cint) {.importcpp: "SetNumberOfAxisLabels", header: "vtkParallelCoordinatesRepresentation.h".}
## !!!Ignored construct:  virtual int GetNumberOfAxesNumberOfAxesNumberOfSamplesNumberOfSamplesNumberOfAxisLabels ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfAxisLabels  of  << this -> NumberOfAxisLabels ) ; return this -> NumberOfAxisLabels ; } ;
## Error: expected ';'!!!

proc SwapAxisPositions*(this: var vtkParallelCoordinatesRepresentation;
                       position1: cint; position2: cint): cint {.
    importcpp: "SwapAxisPositions",
    header: "vtkParallelCoordinatesRepresentation.h".}
proc SetXCoordinateOfPosition*(this: var vtkParallelCoordinatesRepresentation;
                              position: cint; xcoord: cdouble): cint {.
    importcpp: "SetXCoordinateOfPosition",
    header: "vtkParallelCoordinatesRepresentation.h".}
proc GetXCoordinateOfPosition*(this: var vtkParallelCoordinatesRepresentation;
                              axis: cint): cdouble {.
    importcpp: "GetXCoordinateOfPosition",
    header: "vtkParallelCoordinatesRepresentation.h".}
proc GetXCoordinatesOfPositions*(this: var vtkParallelCoordinatesRepresentation;
                                coords: ptr cdouble) {.
    importcpp: "GetXCoordinatesOfPositions",
    header: "vtkParallelCoordinatesRepresentation.h".}
proc GetPositionNearXCoordinate*(this: var vtkParallelCoordinatesRepresentation;
                                xcoord: cdouble): cint {.
    importcpp: "GetPositionNearXCoordinate",
    header: "vtkParallelCoordinatesRepresentation.h".}
proc SetUseCurves*(this: var vtkParallelCoordinatesRepresentation; _arg: vtkTypeBool) {.
    importcpp: "SetUseCurves", header: "vtkParallelCoordinatesRepresentation.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetNumberOfAxesNumberOfAxesNumberOfSamplesNumberOfSamplesNumberOfAxisLabelsUseCurves ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseCurves  of  << this -> UseCurves ) ; return this -> UseCurves ; } ;
## Error: expected ';'!!!

proc UseCurvesOn*(this: var vtkParallelCoordinatesRepresentation) {.
    importcpp: "UseCurvesOn", header: "vtkParallelCoordinatesRepresentation.h".}
proc UseCurvesOff*(this: var vtkParallelCoordinatesRepresentation) {.
    importcpp: "UseCurvesOff", header: "vtkParallelCoordinatesRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Resolution of the curves displayed, enabled by setting UseCurves
  ##
proc SetUseCurvesCurveResolution*(this: var vtkParallelCoordinatesRepresentation;
                                 _arg: cint) {.
    importcpp: "SetUseCurvesCurveResolution",
    header: "vtkParallelCoordinatesRepresentation.h".}
## !!!Ignored construct:  virtual int GetNumberOfAxesNumberOfAxesNumberOfSamplesNumberOfSamplesNumberOfAxisLabelsUseCurvesCurveResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CurveResolution  of  << this -> CurveResolution ) ; return this -> CurveResolution ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Access plot properties
##  virtual double GetNumberOfAxesNumberOfAxesNumberOfSamplesNumberOfSamplesNumberOfAxisLabelsUseCurvesCurveResolutionLineOpacityLineOpacity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LineOpacity  of  << this -> LineOpacity ) ; return this -> LineOpacity ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual double GetNumberOfAxesNumberOfAxesNumberOfSamplesNumberOfSamplesNumberOfAxisLabelsUseCurvesCurveResolutionLineOpacityLineOpacityFontSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FontSize  of  << this -> FontSize ) ; return this -> FontSize ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual double * GetLineColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << LineColor  pointer  << this -> LineColor ) ; return this -> LineColor ; } VTK_WRAPEXCLUDE virtual void GetLineColor ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> LineColor [ 0 ] ; _arg2 = this -> LineColor [ 1 ] ; _arg3 = this -> LineColor [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << LineColor  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetLineColor ( double _arg [ 3 ] ) { this -> GetLineColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual double * GetLineColorAxisColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << AxisColor  pointer  << this -> AxisColor ) ; return this -> AxisColor ; } VTK_WRAPEXCLUDE virtual void GetLineColorAxisColor ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> AxisColor [ 0 ] ; _arg2 = this -> AxisColor [ 1 ] ; _arg3 = this -> AxisColor [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << AxisColor  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetLineColorAxisColor ( double _arg [ 3 ] ) { this -> GetLineColorAxisColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual double * GetLineColorAxisColorAxisLabelColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << AxisLabelColor  pointer  << this -> AxisLabelColor ) ; return this -> AxisLabelColor ; } VTK_WRAPEXCLUDE virtual void GetLineColorAxisColorAxisLabelColor ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> AxisLabelColor [ 0 ] ; _arg2 = this -> AxisLabelColor [ 1 ] ; _arg3 = this -> AxisLabelColor [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << AxisLabelColor  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetLineColorAxisColorAxisLabelColor ( double _arg [ 3 ] ) { this -> GetLineColorAxisColorAxisLabelColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetUseCurvesCurveResolutionLineOpacity*(
    this: var vtkParallelCoordinatesRepresentation; _arg: cdouble) {.
    importcpp: "SetUseCurvesCurveResolutionLineOpacity",
    header: "vtkParallelCoordinatesRepresentation.h".}
proc SetUseCurvesCurveResolutionLineOpacityFontSize*(
    this: var vtkParallelCoordinatesRepresentation; _arg: cdouble) {.
    importcpp: "SetUseCurvesCurveResolutionLineOpacityFontSize",
    header: "vtkParallelCoordinatesRepresentation.h".}
proc SetLineColor*(this: var vtkParallelCoordinatesRepresentation; _arg1: cdouble;
                  _arg2: cdouble; _arg3: cdouble) {.importcpp: "SetLineColor",
    header: "vtkParallelCoordinatesRepresentation.h".}
proc SetLineColor*(this: var vtkParallelCoordinatesRepresentation;
                  _arg: array[3, cdouble]) {.importcpp: "SetLineColor",
    header: "vtkParallelCoordinatesRepresentation.h".}
proc SetLineColorAxisColor*(this: var vtkParallelCoordinatesRepresentation;
                           _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetLineColorAxisColor",
    header: "vtkParallelCoordinatesRepresentation.h".}
proc SetLineColorAxisColor*(this: var vtkParallelCoordinatesRepresentation;
                           _arg: array[3, cdouble]) {.
    importcpp: "SetLineColorAxisColor",
    header: "vtkParallelCoordinatesRepresentation.h".}
proc SetLineColorAxisColorAxisLabelColor*(
    this: var vtkParallelCoordinatesRepresentation; _arg1: cdouble; _arg2: cdouble;
    _arg3: cdouble) {.importcpp: "SetLineColorAxisColorAxisLabelColor",
                    header: "vtkParallelCoordinatesRepresentation.h".}
proc SetLineColorAxisColorAxisLabelColor*(
    this: var vtkParallelCoordinatesRepresentation; _arg: array[3, cdouble]) {.
    importcpp: "SetLineColorAxisColorAxisLabelColor",
    header: "vtkParallelCoordinatesRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Maximum angle difference (in degrees) of selection using angle/function brushes
  ##
proc SetUseCurvesCurveResolutionLineOpacityFontSizeAngleBrushThreshold*(
    this: var vtkParallelCoordinatesRepresentation; _arg: cdouble) {.importcpp: "SetUseCurvesCurveResolutionLineOpacityFontSizeAngleBrushThreshold",
    header: "vtkParallelCoordinatesRepresentation.h".}
## !!!Ignored construct:  virtual double GetNumberOfAxesNumberOfAxesNumberOfSamplesNumberOfSamplesNumberOfAxisLabelsUseCurvesCurveResolutionLineOpacityLineOpacityFontSizeAngleBrushThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AngleBrushThreshold  of  << this -> AngleBrushThreshold ) ; return this -> AngleBrushThreshold ; } ;
## Error: expected ';'!!!

proc SetUseCurvesCurveResolutionLineOpacityFontSizeAngleBrushThresholdFunctionBrushThreshold*(
    this: var vtkParallelCoordinatesRepresentation; _arg: cdouble) {.importcpp: "SetUseCurvesCurveResolutionLineOpacityFontSizeAngleBrushThresholdFunctionBrushThreshold",
    header: "vtkParallelCoordinatesRepresentation.h".}
## !!!Ignored construct:  virtual double GetNumberOfAxesNumberOfAxesNumberOfSamplesNumberOfSamplesNumberOfAxisLabelsUseCurvesCurveResolutionLineOpacityLineOpacityFontSizeAngleBrushThresholdFunctionBrushThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FunctionBrushThreshold  of  << this -> FunctionBrushThreshold ) ; return this -> FunctionBrushThreshold ; } ;
## Error: expected ';'!!!

proc GetRangeAtPosition*(this: var vtkParallelCoordinatesRepresentation;
                        position: cint; range: array[2, cdouble]): cint {.
    importcpp: "GetRangeAtPosition",
    header: "vtkParallelCoordinatesRepresentation.h".}
proc SetRangeAtPosition*(this: var vtkParallelCoordinatesRepresentation;
                        position: cint; range: array[2, cdouble]): cint {.
    importcpp: "SetRangeAtPosition",
    header: "vtkParallelCoordinatesRepresentation.h".}
proc ResetAxes*(this: var vtkParallelCoordinatesRepresentation) {.
    importcpp: "ResetAxes", header: "vtkParallelCoordinatesRepresentation.h".}
proc LassoSelect*(this: var vtkParallelCoordinatesRepresentation; brushClass: cint;
                 brushOperator: cint; brushPoints: ptr vtkPoints) {.
    importcpp: "LassoSelect", header: "vtkParallelCoordinatesRepresentation.h".}
proc AngleSelect*(this: var vtkParallelCoordinatesRepresentation; brushClass: cint;
                 brushOperator: cint; p1: ptr cdouble; p2: ptr cdouble) {.
    importcpp: "AngleSelect", header: "vtkParallelCoordinatesRepresentation.h".}
proc FunctionSelect*(this: var vtkParallelCoordinatesRepresentation;
                    brushClass: cint; brushOperator: cint; p1: ptr cdouble;
                    p2: ptr cdouble; q1: ptr cdouble; q2: ptr cdouble) {.
    importcpp: "FunctionSelect", header: "vtkParallelCoordinatesRepresentation.h".}
proc RangeSelect*(this: var vtkParallelCoordinatesRepresentation; brushClass: cint;
                 brushOperator: cint; p1: ptr cdouble; p2: ptr cdouble) {.
    importcpp: "RangeSelect", header: "vtkParallelCoordinatesRepresentation.h".}
type
  vtkParallelCoordinatesRepresentationInputPorts* {.size: sizeof(cint),
      importcpp: "vtkParallelCoordinatesRepresentation::InputPorts",
      header: "vtkParallelCoordinatesRepresentation.h".} = enum
    INPUT_DATA = 0, INPUT_TITLES, NUM_INPUT_PORTS

