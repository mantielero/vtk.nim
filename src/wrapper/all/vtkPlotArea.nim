## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPlotArea.h
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
##  @class   vtkPlotArea
##  @brief   draws an area plot.
##
##  vtkPlotArea is used to render an area plot. An area plot (sometimes called a
##  range plot) renders a filled region between the selected ymin and ymax
##  arrays.
##  To specify the x array and ymin/ymax arrays, use the SetInputArray method
##  with array index as 0, 1, or 2, respectively.
##

import
  vtkPlot

type
  vtkPlotArea* {.importcpp: "vtkPlotArea", header: "vtkPlotArea.h", bycopy.} = object of vtkPlot
    vtkPlotArea* {.importc: "vtkPlotArea".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPlotArea {.importcpp: "vtkPlotArea::New(@)",
                           header: "vtkPlotArea.h".}
type
  vtkPlotAreaSuperclass* = vtkPlot

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPlotArea::IsTypeOf(@)", header: "vtkPlotArea.h".}
proc IsA*(this: var vtkPlotArea; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkPlotArea.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPlotArea {.
    importcpp: "vtkPlotArea::SafeDownCast(@)", header: "vtkPlotArea.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPlotArea :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPlot :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPlotArea :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPlotArea :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPlotArea; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPlotArea.h".}
## using statement

proc SetColor*(this: var vtkPlotArea; r: cuchar; g: cuchar; b: cuchar; a: cuchar) {.
    importcpp: "SetColor", header: "vtkPlotArea.h".}
proc SetColor*(this: var vtkPlotArea; r: cdouble; g: cdouble; b: cdouble) {.
    importcpp: "SetColor", header: "vtkPlotArea.h".}
## !!!Ignored construct:  /@} /@{ *
##  Get/set the valid point mask array name.
##  virtual vtkStdString GetValidPointMaskNameValidPointMaskName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ValidPointMaskName  of  << this -> ValidPointMaskName ) ; return this -> ValidPointMaskName ; } ;
## Error: expected ';'!!!

proc SetValidPointMaskName*(this: var vtkPlotArea; _arg: vtkStdString) {.
    importcpp: "SetValidPointMaskName", header: "vtkPlotArea.h".}
  ## /@}
  ## *
  ##  Get the bounds for this plot as (Xmin, Xmax, Ymin, Ymax).
  ##
proc GetBounds*(this: var vtkPlotArea; bounds: array[4, cdouble]) {.
    importcpp: "GetBounds", header: "vtkPlotArea.h".}
proc Paint*(this: var vtkPlotArea; painter: ptr vtkContext2D): bool {.
    importcpp: "Paint", header: "vtkPlotArea.h".}
proc PaintLegend*(this: var vtkPlotArea; painter: ptr vtkContext2D; rect: vtkRectf;
                 legendIndex: cint): bool {.importcpp: "PaintLegend",
    header: "vtkPlotArea.h".}
proc GetNearestPoint*(this: var vtkPlotArea; point: vtkVector2f;
                     tolerance: vtkVector2f; location: ptr vtkVector2f;
                     segmentId: ptr vtkIdType): vtkIdType {.
    importcpp: "GetNearestPoint", header: "vtkPlotArea.h".}
## using statement

proc GetTooltipLabel*(this: var vtkPlotArea; plotPos: vtkVector2d;
                     seriesIndex: vtkIdType; segmentIndex: vtkIdType): vtkStdString {.
    importcpp: "GetTooltipLabel", header: "vtkPlotArea.h".}
proc UpdateCache*(this: var vtkPlotArea): bool {.importcpp: "UpdateCache",
    header: "vtkPlotArea.h".}