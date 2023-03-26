## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPlotSurface.h
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
##  @class   vtkPlotSurface
##  @brief   3D surface plot.
##
##
##  3D surface plot.
##
##

import
  vtkChartsCoreModule, vtkNew, vtkPlot3D

discard "forward decl of vtkContext2D"
discard "forward decl of vtkLookupTable"
discard "forward decl of vtkTable"
type
  vtkPlotSurface* {.importcpp: "vtkPlotSurface", header: "vtkPlotSurface.h", bycopy.} = object of vtkPlot3D
    vtkPlotSurface* {.importc: "vtkPlotSurface".}: VTK_NEWINSTANCE
    ## *
    ##  The number of rows in the input table.
    ##
    ## *
    ##  The number of columns in the input table.
    ##
    ## *
    ##  The number of vertices in the surface.
    ##
    ## *
    ##  The number of components used to color the surface.
    ##
    ## *
    ##  The input table used to generate the surface.
    ##
    ## *
    ##  The lookup table used to color the surface by height (Z dimension).
    ##
    ## /@{
    ## *
    ##  user-defined data ranges
    ##
    ## /@}
    ## *
    ##  true if user-defined data scaling has already been applied,
    ##  false otherwise.
    ##

  vtkPlotSurfaceSuperclass* = vtkPlot3D

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPlotSurface::IsTypeOf(@)", header: "vtkPlotSurface.h".}
proc IsA*(this: var vtkPlotSurface; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkPlotSurface.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPlotSurface {.
    importcpp: "vtkPlotSurface::SafeDownCast(@)", header: "vtkPlotSurface.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPlotSurface :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPlot3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPlotSurface :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPlotSurface :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPlotSurface; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPlotSurface.h".}
proc New*(): ptr vtkPlotSurface {.importcpp: "vtkPlotSurface::New(@)",
                              header: "vtkPlotSurface.h".}
proc Paint*(this: var vtkPlotSurface; painter: ptr vtkContext2D): bool {.
    importcpp: "Paint", header: "vtkPlotSurface.h".}
proc SetInputData*(this: var vtkPlotSurface; input: ptr vtkTable) {.
    importcpp: "SetInputData", header: "vtkPlotSurface.h".}
proc SetInputData*(this: var vtkPlotSurface; input: ptr vtkTable; xName: vtkStdString;
                  yName: vtkStdString; zName: vtkStdString) {.
    importcpp: "SetInputData", header: "vtkPlotSurface.h".}
proc SetInputData*(this: var vtkPlotSurface; input: ptr vtkTable; xName: vtkStdString;
                  yName: vtkStdString; zName: vtkStdString; colorName: vtkStdString) {.
    importcpp: "SetInputData", header: "vtkPlotSurface.h".}
proc SetInputData*(this: var vtkPlotSurface; input: ptr vtkTable; xColumn: vtkIdType;
                  yColumn: vtkIdType; zColumn: vtkIdType) {.
    importcpp: "SetInputData", header: "vtkPlotSurface.h".}
proc SetXRange*(this: var vtkPlotSurface; min: cfloat; max: cfloat) {.
    importcpp: "SetXRange", header: "vtkPlotSurface.h".}
proc SetYRange*(this: var vtkPlotSurface; min: cfloat; max: cfloat) {.
    importcpp: "SetYRange", header: "vtkPlotSurface.h".}