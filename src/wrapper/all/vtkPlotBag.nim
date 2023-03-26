## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPlotBag.h
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
##  @class   vtkPlotBag
##  @brief   Class for drawing an a bagplot.
##
##
##  This class allows to draw a bagplot given three columns from
##  a vtkTable. The first two columns will represent X,Y as it is for
##  vtkPlotPoints. The third one will have to specify if the density
##  assigned to each point (generally obtained by the
##  vtkHighestDensityRegionsStatistics filter).
##  Points are drawn in a plot points fashion and 2 convex hull polygons
##  are drawn around the median and the 3 quartile of the density field.
##
##  @sa
##  vtkHighestDensityRegionsStatistics
##

import
  vtkChartsCoreModule, vtkPlotPoints

discard "forward decl of vtkPen"
type
  vtkPlotBag* {.importcpp: "vtkPlotBag", header: "vtkPlotBag.h", bycopy.} = object of vtkPlotPoints
    vtkPlotBag* {.importc: "vtkPlotBag".}: VTK_NEWINSTANCE

  vtkPlotBagSuperclass* = vtkPlotPoints

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkPlotBag::IsTypeOf(@)",
    header: "vtkPlotBag.h".}
proc IsA*(this: var vtkPlotBag; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkPlotBag.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPlotBag {.
    importcpp: "vtkPlotBag::SafeDownCast(@)", header: "vtkPlotBag.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPlotBag :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPlotPoints :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPlotBag :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPlotBag :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPlotBag; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPlotBag.h".}
proc New*(): ptr vtkPlotBag {.importcpp: "vtkPlotBag::New(@)", header: "vtkPlotBag.h".}
proc Paint*(this: var vtkPlotBag; painter: ptr vtkContext2D): bool {.importcpp: "Paint",
    header: "vtkPlotBag.h".}
proc PaintLegend*(this: var vtkPlotBag; painter: ptr vtkContext2D; rect: vtkRectf;
                 legendIndex: cint): bool {.importcpp: "PaintLegend",
    header: "vtkPlotBag.h".}
proc GetLabels*(this: var vtkPlotBag): ptr vtkStringArray {.importcpp: "GetLabels",
    header: "vtkPlotBag.h".}
proc GetTooltipLabel*(this: var vtkPlotBag; plotPos: vtkVector2d;
                     seriesIndex: vtkIdType; segmentIndex: vtkIdType): vtkStdString {.
    importcpp: "GetTooltipLabel", header: "vtkPlotBag.h".}
proc SetInputData*(this: var vtkPlotBag; table: ptr vtkTable) {.
    importcpp: "SetInputData", header: "vtkPlotBag.h".}
proc SetInputData*(this: var vtkPlotBag; table: ptr vtkTable; yColumn: vtkStdString;
                  densityColumn: vtkStdString) {.importcpp: "SetInputData",
    header: "vtkPlotBag.h".}
proc SetInputData*(this: var vtkPlotBag; table: ptr vtkTable; xColumn: vtkStdString;
                  yColumn: vtkStdString; densityColumn: vtkStdString) {.
    importcpp: "SetInputData", header: "vtkPlotBag.h".}
proc SetInputData*(this: var vtkPlotBag; table: ptr vtkTable; xColumn: vtkIdType;
                  yColumn: vtkIdType; densityColumn: vtkIdType) {.
    importcpp: "SetInputData", header: "vtkPlotBag.h".}
proc SetBagVisible*(this: var vtkPlotBag; _arg: bool) {.importcpp: "SetBagVisible",
    header: "vtkPlotBag.h".}
## !!!Ignored construct:  virtual bool GetBagVisible ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BagVisible  of  << this -> BagVisible ) ; return this -> BagVisible ; } ;
## Error: expected ';'!!!

proc SetLinePen*(this: var vtkPlotBag; pen: ptr vtkPen) {.importcpp: "SetLinePen",
    header: "vtkPlotBag.h".}
proc GetnameLinePen*(this: var vtkPlotBag): ptr vtkPen {.importcpp: "GetnameLinePen",
    header: "vtkPlotBag.h".}
  ## /@}
  ## *
  ##  Set/get the vtkPen object that controls how this plot draws points.
  ##  Those are just helpers functions:
  ##  this pen is actually the default Plot pen.
  ##
proc SetPointPen*(this: var vtkPlotBag; pen: ptr vtkPen) {.importcpp: "SetPointPen",
    header: "vtkPlotBag.h".}
proc GetPointPen*(this: var vtkPlotBag): ptr vtkPen {.importcpp: "GetPointPen",
    header: "vtkPlotBag.h".}
proc UpdateCache*(this: var vtkPlotBag): bool {.importcpp: "UpdateCache",
    header: "vtkPlotBag.h".}