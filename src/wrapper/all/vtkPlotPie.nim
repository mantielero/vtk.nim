## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPlotPie.h
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
##  @class   vtkPlotPie
##  @brief   Class for drawing a Pie diagram.
##
##
##

import
  vtkChartsCoreModule, vtkPlot, vtkSmartPointer

discard "forward decl of vtkContext2D"
discard "forward decl of vtkColorSeries"
discard "forward decl of vtkPoints2D"
discard "forward decl of vtkPlotPiePrivate"
type
  vtkPlotPie* {.importcpp: "vtkPlotPie", header: "vtkPlotPie.h", bycopy.} = object of vtkPlot
    vtkPlotPie* {.importc: "vtkPlotPie".}: VTK_NEWINSTANCE
    ## *
    ##  The color series to use for the pie.
    ##
    ## *
    ##  Store a well packed set of angles for the wedges of the pie.
    ##

  vtkPlotPieSuperclass* = vtkPlot

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkPlotPie::IsTypeOf(@)",
    header: "vtkPlotPie.h".}
proc IsA*(this: var vtkPlotPie; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkPlotPie.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPlotPie {.
    importcpp: "vtkPlotPie::SafeDownCast(@)", header: "vtkPlotPie.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPlotPie :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPlot :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPlotPie :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPlotPie :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPlotPie; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPlotPie.h".}
proc New*(): ptr vtkPlotPie {.importcpp: "vtkPlotPie::New(@)", header: "vtkPlotPie.h".}
proc Paint*(this: var vtkPlotPie; painter: ptr vtkContext2D): bool {.importcpp: "Paint",
    header: "vtkPlotPie.h".}
proc PaintLegend*(this: var vtkPlotPie; painter: ptr vtkContext2D; rect: vtkRectf;
                 legendIndex: cint): bool {.importcpp: "PaintLegend",
    header: "vtkPlotPie.h".}
proc SetDimensions*(this: var vtkPlotPie; arg1: cint; arg2: cint; arg3: cint; arg4: cint) {.
    importcpp: "SetDimensions", header: "vtkPlotPie.h".}
proc SetDimensions*(this: var vtkPlotPie; arg: array[4, cint]) {.
    importcpp: "SetDimensions", header: "vtkPlotPie.h".}
## !!!Ignored construct:  /@{ *
##  Get the dimensions of the pie, elements 0 and 1 are the x and y coordinate
##  of the bottom corner. Elements 2 and 3 are the width and height.
##  virtual int * GetDimensionsDimensions ( ) VTK_SIZEHINT ( 4 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Dimensions  pointer  << this -> Dimensions ) ; return this -> Dimensions ; } VTK_WRAPEXCLUDE virtual void GetDimensionsDimensions ( int & _arg1 , int & _arg2 , int & _arg3 , int & _arg4 ) { _arg1 = this -> Dimensions [ 0 ] ; _arg2 = this -> Dimensions [ 1 ] ; _arg3 = this -> Dimensions [ 2 ] ; _arg4 = this -> Dimensions [ 3 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Dimensions  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetDimensionsDimensions ( int _arg [ 4 ] ) { this -> GetDimensionsDimensions ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] ) ; } ;
## Error: expected ';'!!!

proc SetColorSeries*(this: var vtkPlotPie; colorSeries: ptr vtkColorSeries) {.
    importcpp: "SetColorSeries", header: "vtkPlotPie.h".}
proc GetColorSeries*(this: var vtkPlotPie): ptr vtkColorSeries {.
    importcpp: "GetColorSeries", header: "vtkPlotPie.h".}
proc GetNearestPoint*(this: var vtkPlotPie; point: vtkVector2f;
                     tolerance: vtkVector2f; location: ptr vtkVector2f;
                     segmentId: ptr vtkIdType): vtkIdType {.
    importcpp: "GetNearestPoint", header: "vtkPlotPie.h".}
## using statement

proc UpdateCache*(this: var vtkPlotPie): bool {.importcpp: "UpdateCache",
    header: "vtkPlotPie.h".}