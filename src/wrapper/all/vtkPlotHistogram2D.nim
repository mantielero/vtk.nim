## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtk2DHistogramItem.h
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
##  @class   vtk2DHistogramItem
##  @brief   2D histogram item.
##
##
##
##

import
  vtkChartsCoreModule, vtkPlot, vtkRect, vtkSmartPointer

discard "forward decl of vtkImageData"
discard "forward decl of vtkScalarsToColors"
type
  vtkPlotHistogram2D* {.importcpp: "vtkPlotHistogram2D",
                       header: "vtkPlotHistogram2D.h", bycopy.} = object of vtkPlot
    vtkPlotHistogram2D* {.importc: "vtkPlotHistogram2D".}: VTK_NEWINSTANCE

  vtkPlotHistogram2DSuperclass* = vtkPlot

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPlotHistogram2D::IsTypeOf(@)", header: "vtkPlotHistogram2D.h".}
proc IsA*(this: var vtkPlotHistogram2D; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPlotHistogram2D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPlotHistogram2D {.
    importcpp: "vtkPlotHistogram2D::SafeDownCast(@)",
    header: "vtkPlotHistogram2D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPlotHistogram2D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPlot :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPlotHistogram2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPlotHistogram2D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPlotHistogram2D; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPlotHistogram2D.h".}
proc New*(): ptr vtkPlotHistogram2D {.importcpp: "vtkPlotHistogram2D::New(@)",
                                  header: "vtkPlotHistogram2D.h".}
proc Update*(this: var vtkPlotHistogram2D) {.importcpp: "Update",
    header: "vtkPlotHistogram2D.h".}
proc Paint*(this: var vtkPlotHistogram2D; painter: ptr vtkContext2D): bool {.
    importcpp: "Paint", header: "vtkPlotHistogram2D.h".}
proc SetInputData*(this: var vtkPlotHistogram2D; data: ptr vtkImageData;
                  z: vtkIdType = 0) {.importcpp: "SetInputData",
                                  header: "vtkPlotHistogram2D.h".}
proc SetInputData*(this: var vtkPlotHistogram2D; a2: ptr vtkTable) {.
    importcpp: "SetInputData", header: "vtkPlotHistogram2D.h".}
proc SetInputData*(this: var vtkPlotHistogram2D; a2: ptr vtkTable; a3: vtkStdString;
                  a4: vtkStdString) {.importcpp: "SetInputData",
                                    header: "vtkPlotHistogram2D.h".}
proc GetInputImageData*(this: var vtkPlotHistogram2D): ptr vtkImageData {.
    importcpp: "GetInputImageData", header: "vtkPlotHistogram2D.h".}
proc SetTransferFunction*(this: var vtkPlotHistogram2D;
                         transfer: ptr vtkScalarsToColors) {.
    importcpp: "SetTransferFunction", header: "vtkPlotHistogram2D.h".}
proc GetTransferFunction*(this: var vtkPlotHistogram2D): ptr vtkScalarsToColors {.
    importcpp: "GetTransferFunction", header: "vtkPlotHistogram2D.h".}
proc GetBounds*(this: var vtkPlotHistogram2D; bounds: array[4, cdouble]) {.
    importcpp: "GetBounds", header: "vtkPlotHistogram2D.h".}
proc SetPosition*(this: var vtkPlotHistogram2D; pos: vtkRectf) {.
    importcpp: "SetPosition", header: "vtkPlotHistogram2D.h".}
proc GetPosition*(this: var vtkPlotHistogram2D): vtkRectf {.importcpp: "GetPosition",
    header: "vtkPlotHistogram2D.h".}
proc GetTooltipLabel*(this: var vtkPlotHistogram2D; plotPos: vtkVector2d;
                     seriesIndex: vtkIdType; segmentIndex: vtkIdType): vtkStdString {.
    importcpp: "GetTooltipLabel", header: "vtkPlotHistogram2D.h".}
proc GetNearestPoint*(this: var vtkPlotHistogram2D; point: vtkVector2f;
                     tolerance: vtkVector2f; location: ptr vtkVector2f;
                     segmentId: ptr vtkIdType): vtkIdType {.
    importcpp: "GetNearestPoint", header: "vtkPlotHistogram2D.h".}
## using statement

proc UpdateCache*(this: var vtkPlotHistogram2D): bool {.importcpp: "UpdateCache",
    header: "vtkPlotHistogram2D.h".}