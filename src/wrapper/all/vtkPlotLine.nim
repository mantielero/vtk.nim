## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPlotLine.h
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
##  @class   vtkPlotLine
##  @brief   Class for drawing an XY line plot given two columns from
##  a vtkTable.
##
##
##
##

import
  vtkChartsCoreModule, vtkPlotPoints

type
  vtkPlotLine* {.importcpp: "vtkPlotLine", header: "vtkPlotLine.h", bycopy.} = object of vtkPlotPoints
    vtkPlotLine* {.importc: "vtkPlotLine".}: VTK_NEWINSTANCE

  vtkPlotLineSuperclass* = vtkPlotPoints

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPlotLine::IsTypeOf(@)", header: "vtkPlotLine.h".}
proc IsA*(this: var vtkPlotLine; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkPlotLine.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPlotLine {.
    importcpp: "vtkPlotLine::SafeDownCast(@)", header: "vtkPlotLine.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPlotLine :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPlotPoints :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPlotLine :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPlotLine :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPlotLine; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPlotLine.h".}
proc New*(): ptr vtkPlotLine {.importcpp: "vtkPlotLine::New(@)",
                           header: "vtkPlotLine.h".}
proc Paint*(this: var vtkPlotLine; painter: ptr vtkContext2D): bool {.
    importcpp: "Paint", header: "vtkPlotLine.h".}
proc PaintLegend*(this: var vtkPlotLine; painter: ptr vtkContext2D; rect: vtkRectf;
                 legendIndex: cint): bool {.importcpp: "PaintLegend",
    header: "vtkPlotLine.h".}
proc SetPolyLine*(this: var vtkPlotLine; _arg: bool) {.importcpp: "SetPolyLine",
    header: "vtkPlotLine.h".}
## !!!Ignored construct:  virtual bool GetPolyLine ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PolyLine  of  << this -> PolyLine ) ; return this -> PolyLine ; } ;
## Error: expected ';'!!!

proc PolyLineOn*(this: var vtkPlotLine) {.importcpp: "PolyLineOn",
                                      header: "vtkPlotLine.h".}
proc PolyLineOff*(this: var vtkPlotLine) {.importcpp: "PolyLineOff",
                                       header: "vtkPlotLine.h".}
  ## /@}