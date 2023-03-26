## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPlotBar.h
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
##  @class   vtkPlotBar
##  @brief   Class for drawing an XY plot given two columns from a
##  vtkTable.
##
##
##
##

import
  vtkChartsCoreModule, vtkPlot, vtkSmartPointer

discard "forward decl of vtkContext2D"
discard "forward decl of vtkTable"
discard "forward decl of vtkPoints2D"
discard "forward decl of vtkStdString"
discard "forward decl of vtkColorSeries"
discard "forward decl of vtkUnsignedCharArray"
discard "forward decl of vtkScalarsToColors"
discard "forward decl of vtkPlotBarPrivate"
type
  vtkPlotBar* {.importcpp: "vtkPlotBar", header: "vtkPlotBar.h", bycopy.} = object of vtkPlot
    vtkPlotBar* {.importc: "vtkPlotBar".}: VTK_NEWINSTANCE
    ## *
    ##  The color series to use if this becomes a stacked bar
    ##
    ## /@{
    ## *
    ##  Lookup Table for coloring bars by scalar value
    ##
    ## /@}

  vtkPlotBarSuperclass* = vtkPlot

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkPlotBar::IsTypeOf(@)",
    header: "vtkPlotBar.h".}
proc IsA*(this: var vtkPlotBar; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkPlotBar.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPlotBar {.
    importcpp: "vtkPlotBar::SafeDownCast(@)", header: "vtkPlotBar.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPlotBar :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPlot :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPlotBar :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPlotBar :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPlotBar; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPlotBar.h".}
const
  vtkPlotBarVERTICAL* = 0
  vtkPlotBarHORIZONTAL* = 1

proc New*(): ptr vtkPlotBar {.importcpp: "vtkPlotBar::New(@)", header: "vtkPlotBar.h".}
proc Paint*(this: var vtkPlotBar; painter: ptr vtkContext2D): bool {.importcpp: "Paint",
    header: "vtkPlotBar.h".}
proc PaintLegend*(this: var vtkPlotBar; painter: ptr vtkContext2D; rect: vtkRectf;
                 legendIndex: cint): bool {.importcpp: "PaintLegend",
    header: "vtkPlotBar.h".}
proc SetColor*(this: var vtkPlotBar; r: cuchar; g: cuchar; b: cuchar; a: cuchar) {.
    importcpp: "SetColor", header: "vtkPlotBar.h".}
proc SetColor*(this: var vtkPlotBar; r: cdouble; g: cdouble; b: cdouble) {.
    importcpp: "SetColor", header: "vtkPlotBar.h".}
proc GetColor*(this: var vtkPlotBar; rgb: array[3, cdouble]) {.importcpp: "GetColor",
    header: "vtkPlotBar.h".}
proc SetWidth*(this: var vtkPlotBar; _arg: cfloat) {.importcpp: "SetWidth",
    header: "vtkPlotBar.h".}
proc GetWidth*(this: var vtkPlotBar): cfloat {.importcpp: "GetWidth",
    header: "vtkPlotBar.h".}
proc SetOffset*(this: var vtkPlotBar; _arg: cfloat) {.importcpp: "SetOffset",
    header: "vtkPlotBar.h".}
## !!!Ignored construct:  virtual float GetOffset ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Offset  of  << this -> Offset ) ; return this -> Offset ; } ;
## Error: expected ';'!!!

proc SetOrientation*(this: var vtkPlotBar; orientation: cint) {.
    importcpp: "SetOrientation", header: "vtkPlotBar.h".}
## !!!Ignored construct:  virtual int GetOffsetOrientation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Orientation  of  << this -> Orientation ) ; return this -> Orientation ; } ;
## Error: expected ';'!!!

proc GetBounds*(this: var vtkPlotBar; bounds: array[4, cdouble]; unscaled: bool) {.
    importcpp: "GetBounds", header: "vtkPlotBar.h".}
proc GetBounds*(this: var vtkPlotBar; bounds: array[4, cdouble]) {.
    importcpp: "GetBounds", header: "vtkPlotBar.h".}
proc GetUnscaledInputBounds*(this: var vtkPlotBar; bounds: array[4, cdouble]) {.
    importcpp: "GetUnscaledInputBounds", header: "vtkPlotBar.h".}
proc SetInputArray*(this: var vtkPlotBar; index: cint; name: vtkStdString) {.
    importcpp: "SetInputArray", header: "vtkPlotBar.h".}
proc SetColorSeries*(this: var vtkPlotBar; colorSeries: ptr vtkColorSeries) {.
    importcpp: "SetColorSeries", header: "vtkPlotBar.h".}
proc GetColorSeries*(this: var vtkPlotBar): ptr vtkColorSeries {.
    importcpp: "GetColorSeries", header: "vtkPlotBar.h".}
proc SetLookupTable*(this: var vtkPlotBar; lut: ptr vtkScalarsToColors) {.
    importcpp: "SetLookupTable", header: "vtkPlotBar.h".}
proc GetLookupTable*(this: var vtkPlotBar): ptr vtkScalarsToColors {.
    importcpp: "GetLookupTable", header: "vtkPlotBar.h".}
proc CreateDefaultLookupTable*(this: var vtkPlotBar) {.
    importcpp: "CreateDefaultLookupTable", header: "vtkPlotBar.h".}
proc SetOffsetScalarVisibility*(this: var vtkPlotBar; _arg: bool) {.
    importcpp: "SetOffsetScalarVisibility", header: "vtkPlotBar.h".}
## !!!Ignored construct:  virtual bool GetOffsetOrientationScalarVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarVisibility  of  << this -> ScalarVisibility ) ; return this -> ScalarVisibility ; } ;
## Error: expected ';'!!!

proc ScalarVisibilityOn*(this: var vtkPlotBar) {.importcpp: "ScalarVisibilityOn",
    header: "vtkPlotBar.h".}
proc ScalarVisibilityOff*(this: var vtkPlotBar) {.importcpp: "ScalarVisibilityOff",
    header: "vtkPlotBar.h".}
  ## /@}
  ## /@{
  ## *
  ##  Enable/disable mapping of the opacity values. Default is set to true.
  ##
proc SetOffsetScalarVisibilityEnableOpacityMapping*(this: var vtkPlotBar; _arg: bool) {.
    importcpp: "SetOffsetScalarVisibilityEnableOpacityMapping",
    header: "vtkPlotBar.h".}
## !!!Ignored construct:  virtual bool GetOffsetOrientationScalarVisibilityEnableOpacityMapping ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EnableOpacityMapping  of  << this -> EnableOpacityMapping ) ; return this -> EnableOpacityMapping ; } ;
## Error: expected ';'!!!

proc EnableOpacityMappingOn*(this: var vtkPlotBar) {.
    importcpp: "EnableOpacityMappingOn", header: "vtkPlotBar.h".}
proc EnableOpacityMappingOff*(this: var vtkPlotBar) {.
    importcpp: "EnableOpacityMappingOff", header: "vtkPlotBar.h".}
  ## /@}
  ## /@{
  ## *
  ##  When ScalarMode is set to UsePointFieldData or UseCellFieldData,
  ##  you can specify which array to use for coloring using these methods.
  ##  The lookup table will decide how to convert vectors to colors.
  ##
proc SelectColorArray*(this: var vtkPlotBar; arrayNum: vtkIdType) {.
    importcpp: "SelectColorArray", header: "vtkPlotBar.h".}
proc SelectColorArray*(this: var vtkPlotBar; arrayName: vtkStdString) {.
    importcpp: "SelectColorArray", header: "vtkPlotBar.h".}
proc GetColorArrayName*(this: var vtkPlotBar): vtkStdString {.
    importcpp: "GetColorArrayName", header: "vtkPlotBar.h".}
proc GetLabels*(this: var vtkPlotBar): ptr vtkStringArray {.importcpp: "GetLabels",
    header: "vtkPlotBar.h".}
proc SetGroupName*(this: var vtkPlotBar; name: vtkStdString) {.
    importcpp: "SetGroupName", header: "vtkPlotBar.h".}
proc GetGroupName*(this: var vtkPlotBar): vtkStdString {.importcpp: "GetGroupName",
    header: "vtkPlotBar.h".}
proc GetTooltipLabel*(this: var vtkPlotBar; plotPos: vtkVector2d;
                     seriesIndex: vtkIdType; segmentIndex: vtkIdType): vtkStdString {.
    importcpp: "GetTooltipLabel", header: "vtkPlotBar.h".}
proc SelectPoints*(this: var vtkPlotBar; min: vtkVector2f; max: vtkVector2f): bool {.
    importcpp: "SelectPoints", header: "vtkPlotBar.h".}
proc GetNearestPoint*(this: var vtkPlotBar; point: vtkVector2f; a3: vtkVector2f;
                     location: ptr vtkVector2f; segmentIndex: ptr vtkIdType): vtkIdType {.
    importcpp: "GetNearestPoint", header: "vtkPlotBar.h".}
## using statement

proc GetBarsCount*(this: var vtkPlotBar): cint {.importcpp: "GetBarsCount",
    header: "vtkPlotBar.h".}
proc GetDataBounds*(this: var vtkPlotBar; bounds: array[2, cdouble]) {.
    importcpp: "GetDataBounds", header: "vtkPlotBar.h".}
proc UpdateCache*(this: var vtkPlotBar): bool {.importcpp: "UpdateCache",
    header: "vtkPlotBar.h".}