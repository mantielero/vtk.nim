## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPlotBox.h
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
##  @class   vtkPlotBox
##  @brief   Class for drawing box plots.
##
##
##  Plots to draw box plots given columns from a vtkTable that may contain
##  5 lines with quartiles and median.
##

import
  vtkChartsCoreModule, vtkPlot, vtkStdString

discard "forward decl of vtkBrush"
discard "forward decl of vtkTextProperty"
discard "forward decl of vtkTable"
discard "forward decl of vtkStdString"
discard "forward decl of vtkScalarsToColors"
type
  vtkPlotBox* {.importcpp: "vtkPlotBox", header: "vtkPlotBox.h", bycopy.} = object of vtkPlot
    vtkPlotBox* {.importc: "vtkPlotBox".}: VTK_NEWINSTANCE
    ## /@}
    ## *
    ##  Width of boxes.
    ##
    ## *
    ##  Lookup Table for coloring points by scalar value
    ##
    ## *
    ##  Text properties for the plot title
    ##

  vtkPlotBoxSuperclass* = vtkPlot

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkPlotBox::IsTypeOf(@)",
    header: "vtkPlotBox.h".}
proc IsA*(this: var vtkPlotBox; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkPlotBox.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPlotBox {.
    importcpp: "vtkPlotBox::SafeDownCast(@)", header: "vtkPlotBox.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPlotBox :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPlot :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPlotBox :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPlotBox :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPlotBox; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPlotBox.h".}
proc New*(): ptr vtkPlotBox {.importcpp: "vtkPlotBox::New(@)", header: "vtkPlotBox.h".}
proc Paint*(this: var vtkPlotBox; painter: ptr vtkContext2D): bool {.importcpp: "Paint",
    header: "vtkPlotBox.h".}
proc PaintLegend*(this: var vtkPlotBox; painter: ptr vtkContext2D; rect: vtkRectf;
                 legendIndex: cint): bool {.importcpp: "PaintLegend",
    header: "vtkPlotBox.h".}
proc SetInputData*(this: var vtkPlotBox; table: ptr vtkTable) {.
    importcpp: "SetInputData", header: "vtkPlotBox.h".}
proc SetInputData*(this: var vtkPlotBox; table: ptr vtkTable; a3: vtkStdString;
                  a4: vtkStdString) {.importcpp: "SetInputData",
                                    header: "vtkPlotBox.h".}
proc GetLabels*(this: var vtkPlotBox): ptr vtkStringArray {.importcpp: "GetLabels",
    header: "vtkPlotBox.h".}
proc GetNearestPoint*(this: var vtkPlotBox; point: vtkVector2f;
                     tolerance: vtkVector2f; location: ptr vtkVector2f;
                     segmentId: ptr vtkIdType): vtkIdType {.
    importcpp: "GetNearestPoint", header: "vtkPlotBox.h".}
## using statement

proc SetLookupTable*(this: var vtkPlotBox; lut: ptr vtkScalarsToColors) {.
    importcpp: "SetLookupTable", header: "vtkPlotBox.h".}
proc GetLookupTable*(this: var vtkPlotBox): ptr vtkScalarsToColors {.
    importcpp: "GetLookupTable", header: "vtkPlotBox.h".}
proc SetColumnColor*(this: var vtkPlotBox; colName: vtkStdString; rgb: ptr cdouble) {.
    importcpp: "SetColumnColor", header: "vtkPlotBox.h".}
proc CreateDefaultLookupTable*(this: var vtkPlotBox) {.
    importcpp: "CreateDefaultLookupTable", header: "vtkPlotBox.h".}
## !!!Ignored construct:  /@{ *
##  Get/Set the width of boxes.
##  virtual float GetBoxWidthBoxWidth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BoxWidth  of  << this -> BoxWidth ) ; return this -> BoxWidth ; } ;
## Error: expected ';'!!!

proc SetBoxWidth*(this: var vtkPlotBox; _arg: cfloat) {.importcpp: "SetBoxWidth",
    header: "vtkPlotBox.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the vtkTextProperty that governs how the plot title is displayed.
  ##
proc GetnameTitleProperties*(this: var vtkPlotBox): ptr vtkTextProperty {.
    importcpp: "GetnameTitleProperties", header: "vtkPlotBox.h".}
  ## /@}
  ## *
  ##  Update the internal cache. Returns true if cache was successfully updated. Default does
  ##  nothing.
  ##  This method is called by Update() when either the plot's data has changed or
  ##  CacheRequiresUpdate() returns true. It is not necessary to call this method explicitly.
  ##
proc UpdateCache*(this: var vtkPlotBox): bool {.importcpp: "UpdateCache",
    header: "vtkPlotBox.h".}