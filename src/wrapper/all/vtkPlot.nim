## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPlot.h
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
##  @class   vtkPlot
##  @brief   Abstract class for 2D plots.
##
##
##  The base class for all plot types used in vtkChart derived charts.
##
##  @sa
##  vtkPlotPoints vtkPlotLine vtkPlotBar vtkChart vtkChartXY
##

import
  vtkChartsCoreModule, vtkContextItem, vtkContextPolygon, vtkRect, vtkSmartPointer,
  vtkStdString

discard "forward decl of vtkVariant"
discard "forward decl of vtkTable"
discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkContextMapper2D"
discard "forward decl of vtkPen"
discard "forward decl of vtkBrush"
discard "forward decl of vtkAxis"
discard "forward decl of vtkStringArray"
discard "forward decl of vtkAlgorithmOutput"
type
  vtkPlot* {.importcpp: "vtkPlot", header: "vtkPlot.h", bycopy.} = object of vtkContextItem
    vtkPlot* {.importc: "vtkPlot".}: VTK_NEWINSTANCE
    ## *
    ##  This object stores the vtkPen that controls how the plot is drawn.
    ##
    ## *
    ##  This object stores the vtkBrush that controls how the plot is drawn.
    ##
    ## *
    ##  This object stores the vtkPen that controls how the selected elements
    ##  of the plot are drawn.
    ##
    ## *
    ##  This object stores the vtkBrush that controls how the selected elements
    ##  of the plot are drawn.
    ##
    ## *
    ##  Plot labels, used by legend.
    ##
    ## *
    ##  Holds Labels when they're auto-created
    ##
    ## *
    ##  Holds Labels when they're auto-created
    ##
    ## *
    ##  Use the Y array index for the X value. If true any X column setting will be
    ##  ignored, and the X values will simply be the index of the Y column.
    ##
    ## *
    ##  This data member contains the data that will be plotted, it inherits
    ##  from vtkAlgorithm.
    ##
    ## *
    ##  Whether plot points can be selected or not.
    ##
    ## *
    ##  Selected indices for the table the plot is rendering
    ##
    ## *
    ##  The X axis associated with this plot.
    ##
    ## *
    ##  The X axis associated with this plot.
    ##
    ## *
    ##  A printf-style string to build custom tooltip labels from.
    ##  See the accessor/mutator functions for full documentation.
    ##
    ## *
    ##  The default printf-style string to build custom tooltip labels from.
    ##  See the accessor/mutator functions for full documentation.
    ##
    ## *
    ##  The current shift in origin and scaling factor applied to the plot.
    ##

  vtkPlotSuperclass* = vtkContextItem

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkPlot::IsTypeOf(@)",
    header: "vtkPlot.h".}
proc IsA*(this: var vtkPlot; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkPlot.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPlot {.
    importcpp: "vtkPlot::SafeDownCast(@)", header: "vtkPlot.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPlot :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkContextItem :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPlot :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPlot :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPlot; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPlot.h".}
proc Update*(this: var vtkPlot) {.importcpp: "Update", header: "vtkPlot.h".}
proc SetLegendVisibility*(this: var vtkPlot; _arg: bool) {.
    importcpp: "SetLegendVisibility", header: "vtkPlot.h".}
## !!!Ignored construct:  virtual bool GetLegendVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LegendVisibility  of  << this -> LegendVisibility ) ; return this -> LegendVisibility ; } ;
## Error: expected ';'!!!

proc LegendVisibilityOn*(this: var vtkPlot) {.importcpp: "LegendVisibilityOn",
    header: "vtkPlot.h".}
proc LegendVisibilityOff*(this: var vtkPlot) {.importcpp: "LegendVisibilityOff",
    header: "vtkPlot.h".}
  ## /@}
  ## *
  ##  Paint legend event for the plot, called whenever the legend needs the
  ##  plot items symbol/mark/line drawn. A rect is supplied with the lower left
  ##  corner of the rect (elements 0 and 1) and with width x height (elements 2
  ##  and 3). The plot can choose how to fill the space supplied. The index is used
  ##  by Plots that return more than one label.
  ##
proc PaintLegend*(this: var vtkPlot; painter: ptr vtkContext2D; rect: vtkRectf;
                 legendIndex: cint): bool {.importcpp: "PaintLegend",
    header: "vtkPlot.h".}
proc SetTooltipLabelFormat*(this: var vtkPlot; label: vtkStdString) {.
    importcpp: "SetTooltipLabelFormat", header: "vtkPlot.h".}
proc GetTooltipLabelFormat*(this: var vtkPlot): vtkStdString {.
    importcpp: "GetTooltipLabelFormat", header: "vtkPlot.h".}
proc SetTooltipNotation*(this: var vtkPlot; notation: cint) {.
    importcpp: "SetTooltipNotation", header: "vtkPlot.h".}
proc GetTooltipNotation*(this: var vtkPlot): cint {.importcpp: "GetTooltipNotation",
    header: "vtkPlot.h".}
proc SetTooltipPrecision*(this: var vtkPlot; precision: cint) {.
    importcpp: "SetTooltipPrecision", header: "vtkPlot.h".}
proc GetTooltipPrecision*(this: var vtkPlot): cint {.
    importcpp: "GetTooltipPrecision", header: "vtkPlot.h".}
proc GetTooltipLabel*(this: var vtkPlot; plotPos: vtkVector2d; seriesIndex: vtkIdType;
                     segmentIndex: vtkIdType): vtkStdString {.
    importcpp: "GetTooltipLabel", header: "vtkPlot.h".}
proc GetNearestPoint*(this: var vtkPlot; point: vtkVector2f; tolerance: vtkVector2f;
                     location: ptr vtkVector2f; segmentId: ptr vtkIdType): vtkIdType {.
    importcpp: "GetNearestPoint", header: "vtkPlot.h".}
proc SelectPoints*(this: var vtkPlot; min: vtkVector2f; max: vtkVector2f): bool {.
    importcpp: "SelectPoints", header: "vtkPlot.h".}
proc SelectPointsInPolygon*(this: var vtkPlot; polygon: vtkContextPolygon): bool {.
    importcpp: "SelectPointsInPolygon", header: "vtkPlot.h".}
proc SetColor*(this: var vtkPlot; r: cuchar; g: cuchar; b: cuchar; a: cuchar) {.
    importcpp: "SetColor", header: "vtkPlot.h".}
proc SetColor*(this: var vtkPlot; r: cdouble; g: cdouble; b: cdouble) {.
    importcpp: "SetColor", header: "vtkPlot.h".}
proc GetColor*(this: var vtkPlot; rgb: array[3, cdouble]) {.importcpp: "GetColor",
    header: "vtkPlot.h".}
proc GetColor*(this: var vtkPlot; rgb: array[3, cuchar]) {.importcpp: "GetColor",
    header: "vtkPlot.h".}
proc SetWidth*(this: var vtkPlot; width: cfloat) {.importcpp: "SetWidth",
    header: "vtkPlot.h".}
proc GetWidth*(this: var vtkPlot): cfloat {.importcpp: "GetWidth", header: "vtkPlot.h".}
proc SetPen*(this: var vtkPlot; pen: ptr vtkPen) {.importcpp: "SetPen",
    header: "vtkPlot.h".}
proc GetPen*(this: var vtkPlot): ptr vtkPen {.importcpp: "GetPen", header: "vtkPlot.h".}
proc SetBrush*(this: var vtkPlot; brush: ptr vtkBrush) {.importcpp: "SetBrush",
    header: "vtkPlot.h".}
proc GetBrush*(this: var vtkPlot): ptr vtkBrush {.importcpp: "GetBrush",
    header: "vtkPlot.h".}
proc SetSelectionPen*(this: var vtkPlot; pen: ptr vtkPen) {.
    importcpp: "SetSelectionPen", header: "vtkPlot.h".}
proc GetSelectionPen*(this: var vtkPlot): ptr vtkPen {.importcpp: "GetSelectionPen",
    header: "vtkPlot.h".}
proc SetSelectionBrush*(this: var vtkPlot; brush: ptr vtkBrush) {.
    importcpp: "SetSelectionBrush", header: "vtkPlot.h".}
proc GetSelectionBrush*(this: var vtkPlot): ptr vtkBrush {.
    importcpp: "GetSelectionBrush", header: "vtkPlot.h".}
proc SetLabel*(this: var vtkPlot; label: vtkStdString) {.importcpp: "SetLabel",
    header: "vtkPlot.h".}
proc GetLabel*(this: var vtkPlot): vtkStdString {.importcpp: "GetLabel",
    header: "vtkPlot.h".}
proc SetLabels*(this: var vtkPlot; labels: ptr vtkStringArray) {.
    importcpp: "SetLabels", header: "vtkPlot.h".}
proc GetLabels*(this: var vtkPlot): ptr vtkStringArray {.importcpp: "GetLabels",
    header: "vtkPlot.h".}
proc GetNumberOfLabels*(this: var vtkPlot): cint {.importcpp: "GetNumberOfLabels",
    header: "vtkPlot.h".}
proc GetLabel*(this: var vtkPlot; index: vtkIdType): vtkStdString {.
    importcpp: "GetLabel", header: "vtkPlot.h".}
proc SetIndexedLabels*(this: var vtkPlot; labels: ptr vtkStringArray) {.
    importcpp: "SetIndexedLabels", header: "vtkPlot.h".}
proc GetIndexedLabels*(this: var vtkPlot): ptr vtkStringArray {.
    importcpp: "GetIndexedLabels", header: "vtkPlot.h".}
proc GetData*(this: var vtkPlot): ptr vtkContextMapper2D {.importcpp: "GetData",
    header: "vtkPlot.h".}
## !!!Ignored construct:  /@{ *
##  Use the Y array index for the X value. If true any X column setting will be
##  ignored, and the X values will simply be the index of the Y column.
##  virtual bool GetLegendVisibilityUseIndexForXSeriesUseIndexForXSeries ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseIndexForXSeries  of  << this -> UseIndexForXSeries ) ; return this -> UseIndexForXSeries ; } ;
## Error: expected ';'!!!

proc SetLegendVisibilityUseIndexForXSeries*(this: var vtkPlot; _arg: bool) {.
    importcpp: "SetLegendVisibilityUseIndexForXSeries", header: "vtkPlot.h".}
  ## /@}
  ## /@{
  ## *
  ##  This is a convenience function to set the input table and the x, y column
  ##  for the plot.
  ##
proc SetInputData*(this: var vtkPlot; table: ptr vtkTable) {.importcpp: "SetInputData",
    header: "vtkPlot.h".}
proc SetInputData*(this: var vtkPlot; table: ptr vtkTable; xColumn: vtkStdString;
                  yColumn: vtkStdString) {.importcpp: "SetInputData",
    header: "vtkPlot.h".}
proc SetInputData*(this: var vtkPlot; table: ptr vtkTable; xColumn: vtkIdType;
                  yColumn: vtkIdType) {.importcpp: "SetInputData",
                                      header: "vtkPlot.h".}
proc SetInputConnection*(this: var vtkPlot; input: ptr vtkAlgorithmOutput) {.
    importcpp: "SetInputConnection", header: "vtkPlot.h".}
proc GetInput*(this: var vtkPlot): ptr vtkTable {.importcpp: "GetInput",
    header: "vtkPlot.h".}
proc GetInputConnection*(this: var vtkPlot): ptr vtkAlgorithmOutput {.
    importcpp: "GetInputConnection", header: "vtkPlot.h".}
proc SetInputArray*(this: var vtkPlot; index: cint; name: vtkStdString) {.
    importcpp: "SetInputArray", header: "vtkPlot.h".}
proc SetLegendVisibilityUseIndexForXSeriesSelectable*(this: var vtkPlot; _arg: bool) {.
    importcpp: "SetLegendVisibilityUseIndexForXSeriesSelectable",
    header: "vtkPlot.h".}
## !!!Ignored construct:  virtual bool GetLegendVisibilityUseIndexForXSeriesUseIndexForXSeriesSelectable ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Selectable  of  << this -> Selectable ) ; return this -> Selectable ; } ;
## Error: expected ';'!!!

proc SelectableOn*(this: var vtkPlot) {.importcpp: "SelectableOn", header: "vtkPlot.h".}
proc SelectableOff*(this: var vtkPlot) {.importcpp: "SelectableOff",
                                     header: "vtkPlot.h".}
  ## /@}
  ## /@{
  ## *
  ##  Sets the list of points that must be selected.
  ##  If Selectable is false, then this method does nothing.
  ##  \sa SetSelectable()
  ##
proc SetSelection*(this: var vtkPlot; id: ptr vtkIdTypeArray) {.
    importcpp: "SetSelection", header: "vtkPlot.h".}
proc GetnameSelection*(this: var vtkPlot): ptr vtkIdTypeArray {.
    importcpp: "GetnameSelection", header: "vtkPlot.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get/set the X axis associated with this plot.
  ##
proc GetnameSelectionXAxis*(this: var vtkPlot): ptr vtkAxis {.
    importcpp: "GetnameSelectionXAxis", header: "vtkPlot.h".}
proc SetXAxis*(this: var vtkPlot; axis: ptr vtkAxis) {.importcpp: "SetXAxis",
    header: "vtkPlot.h".}
proc GetnameSelectionXAxisYAxis*(this: var vtkPlot): ptr vtkAxis {.
    importcpp: "GetnameSelectionXAxisYAxis", header: "vtkPlot.h".}
proc SetYAxis*(this: var vtkPlot; axis: ptr vtkAxis) {.importcpp: "SetYAxis",
    header: "vtkPlot.h".}
proc SetShiftScale*(this: var vtkPlot; shiftScale: vtkRectd) {.
    importcpp: "SetShiftScale", header: "vtkPlot.h".}
proc GetShiftScale*(this: var vtkPlot): vtkRectd {.importcpp: "GetShiftScale",
    header: "vtkPlot.h".}
proc GetBounds*(this: var vtkPlot; bounds: array[4, cdouble]) {.importcpp: "GetBounds",
    header: "vtkPlot.h".}
proc GetUnscaledInputBounds*(this: var vtkPlot; bounds: array[4, cdouble]) {.
    importcpp: "GetUnscaledInputBounds", header: "vtkPlot.h".}
proc SetProperty*(this: var vtkPlot; property: vtkStdString; `var`: vtkVariant) {.
    importcpp: "SetProperty", header: "vtkPlot.h".}
proc GetProperty*(this: var vtkPlot; property: vtkStdString): vtkVariant {.
    importcpp: "GetProperty", header: "vtkPlot.h".}
proc ClampPos*(pos: array[2, cdouble]; bounds: array[4, cdouble]): bool {.
    importcpp: "vtkPlot::ClampPos(@)", header: "vtkPlot.h".}
proc ClampPos*(this: var vtkPlot; pos: array[2, cdouble]): bool {.importcpp: "ClampPos",
    header: "vtkPlot.h".}
proc Hit*(this: var vtkPlot; mouse: vtkContextMouseEvent): bool {.importcpp: "Hit",
    header: "vtkPlot.h".}
proc UpdateCache*(this: var vtkPlot): bool {.importcpp: "UpdateCache",
                                        header: "vtkPlot.h".}