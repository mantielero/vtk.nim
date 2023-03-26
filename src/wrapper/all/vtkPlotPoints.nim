## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPlotPoints.h
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
##  @class   vtkPlotPoints
##  @brief   Class for drawing an points given two columns from a
##  vtkTable.
##
##
##  This class draws points in a plot given two columns from a table. If you need
##  a line as well you should use vtkPlotLine which derives from vtkPlotPoints
##  and is capable of drawing both points and a line.
##
##  @sa
##  vtkPlotLine
##

import
  vtkChartsCoreModule, vtkNew, vtkPlot, vtkRenderingCoreEnums, vtkScalarsToColors,
  vtkStdString

discard "forward decl of vtkCharArray"
discard "forward decl of vtkContext2D"
discard "forward decl of vtkTable"
discard "forward decl of vtkPoints2D"
discard "forward decl of vtkFloatArray"
discard "forward decl of vtkStdString"
discard "forward decl of vtkImageData"
discard "forward decl of vtkScalarsToColors"
discard "forward decl of vtkUnsignedCharArray"
type
  vtkPlotPoints* {.importcpp: "vtkPlotPoints", header: "vtkPlotPoints.h", bycopy.} = object of vtkPlot
    vtkPlotPoints* {.importc: "vtkPlotPoints".}: VTK_NEWINSTANCE
    ## /@}
    ## /@{
    ## *
    ##  Sorted points, used when searching for the nearest point.
    ##
    ## /@}
    ## *
    ##  An array containing the indices of all the "bad points", meaning any x, y
    ##  pair that has an infinity, -infinity or not a number value.
    ##
    ## *
    ##  Array which marks valid points in the array. If nullptr (the default), all
    ##  points in the input array are considered valid.
    ##
    ## *
    ##  Name of the valid point mask array.
    ##
    ## /@{
    ## *
    ##  The marker style that should be used
    ##
    ## /@}
    ## /@{
    ## *
    ##  Lookup Table for coloring points by scalar value
    ##
    ## /@}
    ## *
    ##  Cached bounds on the plot input axes
    ##

  vtkPlotPointsSuperclass* = vtkPlot

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPlotPoints::IsTypeOf(@)", header: "vtkPlotPoints.h".}
proc IsA*(this: var vtkPlotPoints; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkPlotPoints.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPlotPoints {.
    importcpp: "vtkPlotPoints::SafeDownCast(@)", header: "vtkPlotPoints.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPlotPoints :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPlot :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPlotPoints :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPlotPoints :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPlotPoints; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPlotPoints.h".}
proc New*(): ptr vtkPlotPoints {.importcpp: "vtkPlotPoints::New(@)",
                             header: "vtkPlotPoints.h".}
proc Paint*(this: var vtkPlotPoints; painter: ptr vtkContext2D): bool {.
    importcpp: "Paint", header: "vtkPlotPoints.h".}
proc PaintLegend*(this: var vtkPlotPoints; painter: ptr vtkContext2D; rect: vtkRectf;
                 legendIndex: cint): bool {.importcpp: "PaintLegend",
    header: "vtkPlotPoints.h".}
proc GetBounds*(this: var vtkPlotPoints; bounds: array[4, cdouble]) {.
    importcpp: "GetBounds", header: "vtkPlotPoints.h".}
proc GetUnscaledInputBounds*(this: var vtkPlotPoints; bounds: array[4, cdouble]) {.
    importcpp: "GetUnscaledInputBounds", header: "vtkPlotPoints.h".}
proc SetLookupTable*(this: var vtkPlotPoints; lut: ptr vtkScalarsToColors) {.
    importcpp: "SetLookupTable", header: "vtkPlotPoints.h".}
proc GetLookupTable*(this: var vtkPlotPoints): ptr vtkScalarsToColors {.
    importcpp: "GetLookupTable", header: "vtkPlotPoints.h".}
proc CreateDefaultLookupTable*(this: var vtkPlotPoints) {.
    importcpp: "CreateDefaultLookupTable", header: "vtkPlotPoints.h".}
proc SetScalarVisibility*(this: var vtkPlotPoints; _arg: vtkTypeBool) {.
    importcpp: "SetScalarVisibility", header: "vtkPlotPoints.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetScalarVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarVisibility  of  << this -> ScalarVisibility ) ; return this -> ScalarVisibility ; } ;
## Error: expected ';'!!!

proc ScalarVisibilityOn*(this: var vtkPlotPoints) {.importcpp: "ScalarVisibilityOn",
    header: "vtkPlotPoints.h".}
proc ScalarVisibilityOff*(this: var vtkPlotPoints) {.
    importcpp: "ScalarVisibilityOff", header: "vtkPlotPoints.h".}
  ## /@}
  ## /@{
  ## *
  ##  When ScalarMode is set to UsePointFieldData or UseCellFieldData,
  ##  you can specify which array to use for coloring using these methods.
  ##  The lookup table will decide how to convert vectors to colors.
  ##
proc SelectColorArray*(this: var vtkPlotPoints; arrayNum: vtkIdType) {.
    importcpp: "SelectColorArray", header: "vtkPlotPoints.h".}
proc SelectColorArray*(this: var vtkPlotPoints; arrayName: vtkStdString) {.
    importcpp: "SelectColorArray", header: "vtkPlotPoints.h".}
proc GetColorArrayName*(this: var vtkPlotPoints): vtkStdString {.
    importcpp: "GetColorArrayName", header: "vtkPlotPoints.h".}
proc GetNearestPoint*(this: var vtkPlotPoints; point: vtkVector2f;
                     tolerance: vtkVector2f; location: ptr vtkVector2f;
                     segmentId: ptr vtkIdType): vtkIdType {.
    importcpp: "GetNearestPoint", header: "vtkPlotPoints.h".}
## using statement

proc SelectPoints*(this: var vtkPlotPoints; min: vtkVector2f; max: vtkVector2f): bool {.
    importcpp: "SelectPoints", header: "vtkPlotPoints.h".}
proc SelectPointsInPolygon*(this: var vtkPlotPoints; polygon: vtkContextPolygon): bool {.
    importcpp: "SelectPointsInPolygon", header: "vtkPlotPoints.h".}
const
  vtkPlotPointsNONE* = VTK_MARKER_NONE
  vtkPlotPointsCROSS* = VTK_MARKER_CROSS
  vtkPlotPointsPLUS* = VTK_MARKER_PLUS
  vtkPlotPointsSQUARE* = VTK_MARKER_SQUARE
  vtkPlotPointsCIRCLE* = VTK_MARKER_CIRCLE
  vtkPlotPointsDIAMOND* = VTK_MARKER_DIAMOND

## !!!Ignored construct:  /@{ *
##  Get/set the marker style that should be used. The default is none, the enum
##  in this class is used as a parameter.
##  virtual int GetScalarVisibilityMarkerStyleMarkerStyle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MarkerStyle  of  << this -> MarkerStyle ) ; return this -> MarkerStyle ; } ;
## Error: expected ';'!!!

proc SetScalarVisibilityMarkerStyle*(this: var vtkPlotPoints; _arg: cint) {.
    importcpp: "SetScalarVisibilityMarkerStyle", header: "vtkPlotPoints.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get/set the marker size that should be used. The default is negative, and
  ##  in that case it is 2.3 times the pen width, if less than 8 will be used.
  ##
## !!!Ignored construct:  virtual float GetScalarVisibilityMarkerStyleMarkerStyleMarkerSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MarkerSize  of  << this -> MarkerSize ) ; return this -> MarkerSize ; } ;
## Error: expected ';'!!!

proc SetScalarVisibilityMarkerStyleMarkerSize*(this: var vtkPlotPoints; _arg: cfloat) {.
    importcpp: "SetScalarVisibilityMarkerStyleMarkerSize",
    header: "vtkPlotPoints.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get/set the valid point mask array name.
  ##
## !!!Ignored construct:  virtual vtkStdString GetScalarVisibilityMarkerStyleMarkerStyleMarkerSizeValidPointMaskName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ValidPointMaskName  of  << this -> ValidPointMaskName ) ; return this -> ValidPointMaskName ; } ;
## Error: expected ';'!!!

proc SetScalarVisibilityMarkerStyleMarkerSizeValidPointMaskName*(
    this: var vtkPlotPoints; _arg: vtkStdString) {.
    importcpp: "SetScalarVisibilityMarkerStyleMarkerSizeValidPointMaskName",
    header: "vtkPlotPoints.h".}
  ## /@}
  ## *
  ##  Update the internal cache. Returns true if cache was successfully updated. Default does
  ##  nothing.
  ##  This method is called by Update() when either the plot's data has changed or
  ##  CacheRequiresUpdate() returns true. It is not necessary to call this method explicitly.
  ##
proc UpdateCache*(this: var vtkPlotPoints): bool {.importcpp: "UpdateCache",
    header: "vtkPlotPoints.h".}