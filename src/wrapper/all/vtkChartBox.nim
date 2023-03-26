## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkChartBox.h
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
##  @class   vtkChartBox
##  @brief   Factory class for drawing box plot charts
##
##
##  This defines the interface for a box plot chart.
##

import
  vtkChart, vtkChartsCoreModule

discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkPlotBox"
discard "forward decl of vtkStdString"
discard "forward decl of vtkStringArray"
discard "forward decl of vtkTooltipItem"
type
  vtkChartBox* {.importcpp: "vtkChartBox", header: "vtkChartBox.h", bycopy.} = object of vtkChart
    vtkChartBox* {.importc: "vtkChartBox".}: VTK_NEWINSTANCE
    ## /@}
    ## *
    ##  Selected indices for the table the plot is rendering
    ##
    ## *
    ##  A list of the visible columns in the chart.
    ##
    ## /@{
    ## *
    ##  Index of the selected column in the visible columns list.
    ##
    ## /@}
    ## *
    ##  The point cache is marked dirty until it has been initialized.
    ##
    ## *
    ##  The tooltip item for the chart - can be used to display extra information.
    ##

  vtkChartBoxSuperclass* = vtkChart

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkChartBox::IsTypeOf(@)", header: "vtkChartBox.h".}
proc IsA*(this: var vtkChartBox; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkChartBox.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkChartBox {.
    importcpp: "vtkChartBox::SafeDownCast(@)", header: "vtkChartBox.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkChartBox :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkChart :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkChartBox :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkChartBox :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkChartBox; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkChartBox.h".}
proc New*(): ptr vtkChartBox {.importcpp: "vtkChartBox::New(@)",
                           header: "vtkChartBox.h".}
proc Update*(this: var vtkChartBox) {.importcpp: "Update", header: "vtkChartBox.h".}
proc Paint*(this: var vtkChartBox; painter: ptr vtkContext2D): bool {.
    importcpp: "Paint", header: "vtkChartBox.h".}
proc SetColumnVisibility*(this: var vtkChartBox; name: vtkStdString; visible: bool) {.
    importcpp: "SetColumnVisibility", header: "vtkChartBox.h".}
proc SetColumnVisibility*(this: var vtkChartBox; column: vtkIdType; visible: bool) {.
    importcpp: "SetColumnVisibility", header: "vtkChartBox.h".}
proc SetColumnVisibilityAll*(this: var vtkChartBox; visible: bool) {.
    importcpp: "SetColumnVisibilityAll", header: "vtkChartBox.h".}
proc GetColumnVisibility*(this: var vtkChartBox; name: vtkStdString): bool {.
    importcpp: "GetColumnVisibility", header: "vtkChartBox.h".}
proc GetColumnVisibility*(this: var vtkChartBox; column: vtkIdType): bool {.
    importcpp: "GetColumnVisibility", header: "vtkChartBox.h".}
proc GetColumnId*(this: var vtkChartBox; name: vtkStdString): vtkIdType {.
    importcpp: "GetColumnId", header: "vtkChartBox.h".}
proc GetnameVisibleColumns*(this: var vtkChartBox): ptr vtkStringArray {.
    importcpp: "GetnameVisibleColumns", header: "vtkChartBox.h".}
  ## /@}
  ##  Index of the selected column in the visible columns list.
## !!!Ignored construct:  virtual int GetSelectedColumn ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SelectedColumn  of  << this -> SelectedColumn ) ; return this -> SelectedColumn ; } ;
## Error: expected ';'!!!

proc SetSelectedColumn*(this: var vtkChartBox; _arg: cint) {.
    importcpp: "SetSelectedColumn", header: "vtkChartBox.h".}
  ## *
  ##  Get the plot at the specified index, returns null if the index is invalid.
  ##
proc GetPlot*(this: var vtkChartBox; index: vtkIdType): ptr vtkPlot {.
    importcpp: "GetPlot", header: "vtkChartBox.h".}
proc GetNumberOfPlots*(this: var vtkChartBox): vtkIdType {.
    importcpp: "GetNumberOfPlots", header: "vtkChartBox.h".}
proc GetYAxis*(this: var vtkChartBox): ptr vtkAxis {.importcpp: "GetYAxis",
    header: "vtkChartBox.h".}
proc GetXPosition*(this: var vtkChartBox; index: cint): cfloat {.
    importcpp: "GetXPosition", header: "vtkChartBox.h".}
proc GetNumberOfVisibleColumns*(this: var vtkChartBox): vtkIdType {.
    importcpp: "GetNumberOfVisibleColumns", header: "vtkChartBox.h".}
proc SetPlot*(this: var vtkChartBox; plot: ptr vtkPlotBox) {.importcpp: "SetPlot",
    header: "vtkChartBox.h".}
proc Hit*(this: var vtkChartBox; mouse: vtkContextMouseEvent): bool {.importcpp: "Hit",
    header: "vtkChartBox.h".}
proc MouseMoveEvent*(this: var vtkChartBox; mouse: vtkContextMouseEvent): bool {.
    importcpp: "MouseMoveEvent", header: "vtkChartBox.h".}
proc MouseButtonPressEvent*(this: var vtkChartBox; mouse: vtkContextMouseEvent): bool {.
    importcpp: "MouseButtonPressEvent", header: "vtkChartBox.h".}
proc MouseButtonReleaseEvent*(this: var vtkChartBox; mouse: vtkContextMouseEvent): bool {.
    importcpp: "MouseButtonReleaseEvent", header: "vtkChartBox.h".}
proc SetTooltip*(this: var vtkChartBox; tooltip: ptr vtkTooltipItem) {.
    importcpp: "SetTooltip", header: "vtkChartBox.h".}
proc GetTooltip*(this: var vtkChartBox): ptr vtkTooltipItem {.importcpp: "GetTooltip",
    header: "vtkChartBox.h".}
proc SetTooltipInfo*(this: var vtkChartBox; a2: vtkContextMouseEvent; a3: vtkVector2d;
                    a4: vtkIdType; a5: ptr vtkPlot; segmentIndex: vtkIdType = -1) {.
    importcpp: "SetTooltipInfo", header: "vtkChartBox.h".}
proc SetSize*(this: var vtkChartBox; rect: vtkRectf) {.importcpp: "SetSize",
    header: "vtkChartBox.h".}
proc SetGeometry*(this: var vtkChartBox; arg1: cint; arg2: cint) {.
    importcpp: "SetGeometry", header: "vtkChartBox.h".}
proc SetLayoutStrategy*(this: var vtkChartBox; strategy: cint) {.
    importcpp: "SetLayoutStrategy", header: "vtkChartBox.h".}
## /@{
## *
##  Small struct used by InvokeEvent to send some information about the point
##  that was clicked on. This is an experimental part of the API, subject to
##  change.
##

type
  vtkChartBoxData* {.importcpp: "vtkChartBoxData", header: "vtkChartBox.h", bycopy.} = object
    SeriesName* {.importc: "SeriesName".}: vtkStdString
    Position* {.importc: "Position".}: vtkVector2f
    ScreenPosition* {.importc: "ScreenPosition".}: vtkVector2i
    Index* {.importc: "Index".}: cint


## /@}
