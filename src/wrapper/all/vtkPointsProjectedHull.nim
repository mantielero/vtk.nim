## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPointsProjectedHull.h
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
## ----------------------------------------------------------------------------
##  Copyright (c) Sandia Corporation
##  See Copyright.txt or http://www.paraview.org/HTML/Copyright.html for details.
## ----------------------------------------------------------------------------
## *
##  @class   vtkPointsProjectedHull
##  @brief   the convex hull of the orthogonal
##     projection of the vtkPoints in the 3 coordinate directions
##
##     a subclass of vtkPoints, it maintains the counter clockwise
##     convex hull of the points (projected orthogonally in the
##     three coordinate directions) and has a method to
##     test for intersection of that hull with an axis aligned
##     rectangle.  This is used for intersection tests of 3D volumes.
##

import
  vtkCommonDataModelModule, vtkPoints

type
  vtkPointsProjectedHull* {.importcpp: "vtkPointsProjectedHull",
                           header: "vtkPointsProjectedHull.h", bycopy.} = object of vtkPoints
    vtkPointsProjectedHull* {.importc: "vtkPointsProjectedHull".}: VTK_NEWINSTANCE

  vtkPointsProjectedHullSuperclass* = vtkPoints

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPointsProjectedHull::IsTypeOf(@)",
    header: "vtkPointsProjectedHull.h".}
proc IsA*(this: var vtkPointsProjectedHull; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPointsProjectedHull.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPointsProjectedHull {.
    importcpp: "vtkPointsProjectedHull::SafeDownCast(@)",
    header: "vtkPointsProjectedHull.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPointsProjectedHull :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPoints :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPointsProjectedHull :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPointsProjectedHull :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPointsProjectedHull; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPointsProjectedHull.h".}
proc New*(): ptr vtkPointsProjectedHull {.importcpp: "vtkPointsProjectedHull::New(@)",
                                      header: "vtkPointsProjectedHull.h".}
proc RectangleIntersectionX*(this: var vtkPointsProjectedHull; R: ptr vtkPoints): cint {.
    importcpp: "RectangleIntersectionX", header: "vtkPointsProjectedHull.h".}
proc RectangleIntersectionX*(this: var vtkPointsProjectedHull; ymin: cfloat;
                            ymax: cfloat; zmin: cfloat; zmax: cfloat): cint {.
    importcpp: "RectangleIntersectionX", header: "vtkPointsProjectedHull.h".}
proc RectangleIntersectionX*(this: var vtkPointsProjectedHull; ymin: cdouble;
                            ymax: cdouble; zmin: cdouble; zmax: cdouble): cint {.
    importcpp: "RectangleIntersectionX", header: "vtkPointsProjectedHull.h".}
proc RectangleIntersectionY*(this: var vtkPointsProjectedHull; R: ptr vtkPoints): cint {.
    importcpp: "RectangleIntersectionY", header: "vtkPointsProjectedHull.h".}
proc RectangleIntersectionY*(this: var vtkPointsProjectedHull; zmin: cfloat;
                            zmax: cfloat; xmin: cfloat; xmax: cfloat): cint {.
    importcpp: "RectangleIntersectionY", header: "vtkPointsProjectedHull.h".}
proc RectangleIntersectionY*(this: var vtkPointsProjectedHull; zmin: cdouble;
                            zmax: cdouble; xmin: cdouble; xmax: cdouble): cint {.
    importcpp: "RectangleIntersectionY", header: "vtkPointsProjectedHull.h".}
proc RectangleIntersectionZ*(this: var vtkPointsProjectedHull; R: ptr vtkPoints): cint {.
    importcpp: "RectangleIntersectionZ", header: "vtkPointsProjectedHull.h".}
proc RectangleIntersectionZ*(this: var vtkPointsProjectedHull; xmin: cfloat;
                            xmax: cfloat; ymin: cfloat; ymax: cfloat): cint {.
    importcpp: "RectangleIntersectionZ", header: "vtkPointsProjectedHull.h".}
proc RectangleIntersectionZ*(this: var vtkPointsProjectedHull; xmin: cdouble;
                            xmax: cdouble; ymin: cdouble; ymax: cdouble): cint {.
    importcpp: "RectangleIntersectionZ", header: "vtkPointsProjectedHull.h".}
proc GetCCWHullX*(this: var vtkPointsProjectedHull; pts: ptr cfloat; len: cint): cint {.
    importcpp: "GetCCWHullX", header: "vtkPointsProjectedHull.h".}
proc GetCCWHullX*(this: var vtkPointsProjectedHull; pts: ptr cdouble; len: cint): cint {.
    importcpp: "GetCCWHullX", header: "vtkPointsProjectedHull.h".}
proc GetCCWHullY*(this: var vtkPointsProjectedHull; pts: ptr cfloat; len: cint): cint {.
    importcpp: "GetCCWHullY", header: "vtkPointsProjectedHull.h".}
proc GetCCWHullY*(this: var vtkPointsProjectedHull; pts: ptr cdouble; len: cint): cint {.
    importcpp: "GetCCWHullY", header: "vtkPointsProjectedHull.h".}
proc GetCCWHullZ*(this: var vtkPointsProjectedHull; pts: ptr cfloat; len: cint): cint {.
    importcpp: "GetCCWHullZ", header: "vtkPointsProjectedHull.h".}
proc GetCCWHullZ*(this: var vtkPointsProjectedHull; pts: ptr cdouble; len: cint): cint {.
    importcpp: "GetCCWHullZ", header: "vtkPointsProjectedHull.h".}
proc GetSizeCCWHullX*(this: var vtkPointsProjectedHull): cint {.
    importcpp: "GetSizeCCWHullX", header: "vtkPointsProjectedHull.h".}
proc GetSizeCCWHullY*(this: var vtkPointsProjectedHull): cint {.
    importcpp: "GetSizeCCWHullY", header: "vtkPointsProjectedHull.h".}
proc GetSizeCCWHullZ*(this: var vtkPointsProjectedHull): cint {.
    importcpp: "GetSizeCCWHullZ", header: "vtkPointsProjectedHull.h".}
proc Initialize*(this: var vtkPointsProjectedHull) {.importcpp: "Initialize",
    header: "vtkPointsProjectedHull.h".}
proc Reset*(this: var vtkPointsProjectedHull) {.importcpp: "Reset",
    header: "vtkPointsProjectedHull.h".}
proc Update*(this: var vtkPointsProjectedHull) {.importcpp: "Update",
    header: "vtkPointsProjectedHull.h".}