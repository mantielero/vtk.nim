## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkContextPolygon.h
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

import
  vtkChartsCoreModule, vtkType, vtkVector

discard "forward decl of vtkTransform2D"
discard "forward decl of vtkContextPolygonPrivate"
type
  vtkContextPolygon* {.importcpp: "vtkContextPolygon",
                      header: "vtkContextPolygon.h", bycopy.} = object ##  Description:
                                                                  ##  Creates a new, empty polygon.


proc constructvtkContextPolygon*(): vtkContextPolygon {.constructor,
    importcpp: "vtkContextPolygon(@)", header: "vtkContextPolygon.h".}
proc constructvtkContextPolygon*(polygon: vtkContextPolygon): vtkContextPolygon {.
    constructor, importcpp: "vtkContextPolygon(@)", header: "vtkContextPolygon.h".}
proc destroyvtkContextPolygon*(this: var vtkContextPolygon) {.
    importcpp: "#.~vtkContextPolygon()", header: "vtkContextPolygon.h".}
proc AddPoint*(this: var vtkContextPolygon; point: vtkVector2f) {.
    importcpp: "AddPoint", header: "vtkContextPolygon.h".}
proc AddPoint*(this: var vtkContextPolygon; x: cfloat; y: cfloat) {.
    importcpp: "AddPoint", header: "vtkContextPolygon.h".}
proc GetPoint*(this: vtkContextPolygon; index: vtkIdType): vtkVector2f {.noSideEffect,
    importcpp: "GetPoint", header: "vtkContextPolygon.h".}
proc GetNumberOfPoints*(this: vtkContextPolygon): vtkIdType {.noSideEffect,
    importcpp: "GetNumberOfPoints", header: "vtkContextPolygon.h".}
proc Clear*(this: var vtkContextPolygon) {.importcpp: "Clear",
                                       header: "vtkContextPolygon.h".}
proc Contains*(this: vtkContextPolygon; point: vtkVector2f): bool {.noSideEffect,
    importcpp: "Contains", header: "vtkContextPolygon.h".}
proc Transformed*(this: vtkContextPolygon; transform: ptr vtkTransform2D): vtkContextPolygon {.
    noSideEffect, importcpp: "Transformed", header: "vtkContextPolygon.h".}