## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPlotParallelCoordinates.h
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
##  @class   vtkPlotParallelCoordinates
##  @brief   Class for drawing a parallel coordinate
##  plot given columns from a vtkTable.
##
##
##
##

import
  vtkChartsCoreModule, vtkPlot, vtkScalarsToColors, vtkStdString

discard "forward decl of vtkChartParallelCoordinates"
discard "forward decl of vtkScalarsToColors"
discard "forward decl of vtkStdString"
discard "forward decl of vtkTable"
discard "forward decl of vtkUnsignedCharArray"
type
  vtkPlotParallelCoordinates* {.importcpp: "vtkPlotParallelCoordinates",
                               header: "vtkPlotParallelCoordinates.h", bycopy.} = object of vtkPlot
    vtkPlotParallelCoordinates* {.importc: "vtkPlotParallelCoordinates".}: VTK_NEWINSTANCE
    ## /@}
    ## /@{
    ## *
    ##  Lookup Table for coloring points by scalar value
    ##
    ## /@}

  vtkPlotParallelCoordinatesSuperclass* = vtkPlot

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPlotParallelCoordinates::IsTypeOf(@)",
    header: "vtkPlotParallelCoordinates.h".}
proc IsA*(this: var vtkPlotParallelCoordinates; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPlotParallelCoordinates.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPlotParallelCoordinates {.
    importcpp: "vtkPlotParallelCoordinates::SafeDownCast(@)",
    header: "vtkPlotParallelCoordinates.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPlotParallelCoordinates :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPlot :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPlotParallelCoordinates :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPlotParallelCoordinates :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPlotParallelCoordinates; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkPlotParallelCoordinates.h".}
proc New*(): ptr vtkPlotParallelCoordinates {.
    importcpp: "vtkPlotParallelCoordinates::New(@)",
    header: "vtkPlotParallelCoordinates.h".}
proc Paint*(this: var vtkPlotParallelCoordinates; painter: ptr vtkContext2D): bool {.
    importcpp: "Paint", header: "vtkPlotParallelCoordinates.h".}
proc PaintLegend*(this: var vtkPlotParallelCoordinates; painter: ptr vtkContext2D;
                 rect: vtkRectf; legendIndex: cint): bool {.importcpp: "PaintLegend",
    header: "vtkPlotParallelCoordinates.h".}
proc GetBounds*(this: var vtkPlotParallelCoordinates; bounds: array[4, cdouble]) {.
    importcpp: "GetBounds", header: "vtkPlotParallelCoordinates.h".}
proc SetSelectionRange*(this: var vtkPlotParallelCoordinates; axis: cint; low: cfloat;
                       high: cfloat): bool {.importcpp: "SetSelectionRange",
    header: "vtkPlotParallelCoordinates.h".}
proc SetSelectionRange*(this: var vtkPlotParallelCoordinates; axis: cint;
                       axisSelection: vector[cfloat]): bool {.
    importcpp: "SetSelectionRange", header: "vtkPlotParallelCoordinates.h".}
proc ResetSelectionRange*(this: var vtkPlotParallelCoordinates): bool {.
    importcpp: "ResetSelectionRange", header: "vtkPlotParallelCoordinates.h".}
proc SetInputData*(this: var vtkPlotParallelCoordinates; table: ptr vtkTable) {.
    importcpp: "SetInputData", header: "vtkPlotParallelCoordinates.h".}
proc SetInputData*(this: var vtkPlotParallelCoordinates; table: ptr vtkTable;
                  a3: vtkStdString; a4: vtkStdString) {.importcpp: "SetInputData",
    header: "vtkPlotParallelCoordinates.h".}
proc SetLookupTable*(this: var vtkPlotParallelCoordinates;
                    lut: ptr vtkScalarsToColors) {.importcpp: "SetLookupTable",
    header: "vtkPlotParallelCoordinates.h".}
proc GetLookupTable*(this: var vtkPlotParallelCoordinates): ptr vtkScalarsToColors {.
    importcpp: "GetLookupTable", header: "vtkPlotParallelCoordinates.h".}
proc CreateDefaultLookupTable*(this: var vtkPlotParallelCoordinates) {.
    importcpp: "CreateDefaultLookupTable", header: "vtkPlotParallelCoordinates.h".}
proc SetScalarVisibility*(this: var vtkPlotParallelCoordinates; _arg: vtkTypeBool) {.
    importcpp: "SetScalarVisibility", header: "vtkPlotParallelCoordinates.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetScalarVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarVisibility  of  << this -> ScalarVisibility ) ; return this -> ScalarVisibility ; } ;
## Error: expected ';'!!!

proc ScalarVisibilityOn*(this: var vtkPlotParallelCoordinates) {.
    importcpp: "ScalarVisibilityOn", header: "vtkPlotParallelCoordinates.h".}
proc ScalarVisibilityOff*(this: var vtkPlotParallelCoordinates) {.
    importcpp: "ScalarVisibilityOff", header: "vtkPlotParallelCoordinates.h".}
  ## /@}
  ## /@{
  ## *
  ##  When ScalarMode is set to UsePointFieldData or UseCellFieldData,
  ##  you can specify which array to use for coloring using these methods.
  ##  The lookup table will decide how to convert vectors to colors.
  ##
proc SelectColorArray*(this: var vtkPlotParallelCoordinates; arrayNum: vtkIdType) {.
    importcpp: "SelectColorArray", header: "vtkPlotParallelCoordinates.h".}
proc SelectColorArray*(this: var vtkPlotParallelCoordinates; arrayName: vtkStdString) {.
    importcpp: "SelectColorArray", header: "vtkPlotParallelCoordinates.h".}
proc GetColorArrayName*(this: var vtkPlotParallelCoordinates): vtkStdString {.
    importcpp: "GetColorArrayName", header: "vtkPlotParallelCoordinates.h".}
proc UpdateCache*(this: var vtkPlotParallelCoordinates): bool {.
    importcpp: "UpdateCache", header: "vtkPlotParallelCoordinates.h".}