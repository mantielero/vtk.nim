## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPlotFunctionalBag.h
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
##  @class   vtkPlotFunctionalBag
##  @brief   Class for drawing an XY line plot or bag
##  given two columns from a vtkTable.
##
##
##  Depending on the number of components, this class will draw either
##  a line plot (for 1 component column) or, for two components columns,
##  a filled polygonal band (the bag) going from the first to the second
##  component on the Y-axis along the X-axis. The filter
##  vtkExtractFunctionalBagPlot is intended to create such "bag" columns.
##
##  @sa
##  vtkExtractFunctionalBagPlot
##

import
  vtkChartsCoreModule, vtkNew, vtkPlot

discard "forward decl of vtkDataArray"
discard "forward decl of vtkPlotFuntionalBagInternal"
discard "forward decl of vtkPlotLine"
discard "forward decl of vtkPoints2D"
discard "forward decl of vtkScalarsToColors"
type
  vtkPlotFunctionalBag* {.importcpp: "vtkPlotFunctionalBag",
                         header: "vtkPlotFunctionalBag.h", bycopy.} = object of vtkPlot
    vtkPlotFunctionalBag* {.importc: "vtkPlotFunctionalBag".}: VTK_NEWINSTANCE
    ## *
    ##  The plot line delegate for line series
    ##
    ## *
    ##  The bag points ordered in quadstrip fashion
    ##

  vtkPlotFunctionalBagSuperclass* = vtkPlot

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPlotFunctionalBag::IsTypeOf(@)",
    header: "vtkPlotFunctionalBag.h".}
proc IsA*(this: var vtkPlotFunctionalBag; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPlotFunctionalBag.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPlotFunctionalBag {.
    importcpp: "vtkPlotFunctionalBag::SafeDownCast(@)",
    header: "vtkPlotFunctionalBag.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPlotFunctionalBag :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPlot :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPlotFunctionalBag :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPlotFunctionalBag :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPlotFunctionalBag; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPlotFunctionalBag.h".}
proc New*(): ptr vtkPlotFunctionalBag {.importcpp: "vtkPlotFunctionalBag::New(@)",
                                    header: "vtkPlotFunctionalBag.h".}
proc IsBag*(this: var vtkPlotFunctionalBag): bool {.importcpp: "IsBag",
    header: "vtkPlotFunctionalBag.h".}
proc GetVisible*(this: var vtkPlotFunctionalBag): bool {.importcpp: "GetVisible",
    header: "vtkPlotFunctionalBag.h".}
proc Paint*(this: var vtkPlotFunctionalBag; painter: ptr vtkContext2D): bool {.
    importcpp: "Paint", header: "vtkPlotFunctionalBag.h".}
proc PaintLegend*(this: var vtkPlotFunctionalBag; painter: ptr vtkContext2D;
                 rect: vtkRectf; legendIndex: cint): bool {.importcpp: "PaintLegend",
    header: "vtkPlotFunctionalBag.h".}
proc GetBounds*(this: var vtkPlotFunctionalBag; bounds: array[4, cdouble]) {.
    importcpp: "GetBounds", header: "vtkPlotFunctionalBag.h".}
proc GetUnscaledInputBounds*(this: var vtkPlotFunctionalBag;
                            bounds: array[4, cdouble]) {.
    importcpp: "GetUnscaledInputBounds", header: "vtkPlotFunctionalBag.h".}
proc SetLookupTable*(this: var vtkPlotFunctionalBag; lut: ptr vtkScalarsToColors) {.
    importcpp: "SetLookupTable", header: "vtkPlotFunctionalBag.h".}
proc GetLookupTable*(this: var vtkPlotFunctionalBag): ptr vtkScalarsToColors {.
    importcpp: "GetLookupTable", header: "vtkPlotFunctionalBag.h".}
proc CreateDefaultLookupTable*(this: var vtkPlotFunctionalBag) {.
    importcpp: "CreateDefaultLookupTable", header: "vtkPlotFunctionalBag.h".}
proc GetNearestPoint*(this: var vtkPlotFunctionalBag; point: vtkVector2f;
                     tolerance: vtkVector2f; location: ptr vtkVector2f;
                     segmentId: ptr vtkIdType): vtkIdType {.
    importcpp: "GetNearestPoint", header: "vtkPlotFunctionalBag.h".}
## using statement

proc SelectPoints*(this: var vtkPlotFunctionalBag; min: vtkVector2f; max: vtkVector2f): bool {.
    importcpp: "SelectPoints", header: "vtkPlotFunctionalBag.h".}
proc SelectPointsInPolygon*(this: var vtkPlotFunctionalBag;
                           polygon: vtkContextPolygon): bool {.
    importcpp: "SelectPointsInPolygon", header: "vtkPlotFunctionalBag.h".}
proc UpdateCache*(this: var vtkPlotFunctionalBag): bool {.importcpp: "UpdateCache",
    header: "vtkPlotFunctionalBag.h".}