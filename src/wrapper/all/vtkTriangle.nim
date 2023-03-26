## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTriangle.h
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
##  @class   vtkTriangle
##  @brief   a cell that represents a triangle
##
##  vtkTriangle is a concrete implementation of vtkCell to represent a triangle
##  located in 3-space.
##

import
  vtkCell, vtkCommonDataModelModule, vtkMath

discard "forward decl of vtkLine"
discard "forward decl of vtkQuadric"
discard "forward decl of vtkIncrementalPointLocator"
type
  vtkTriangle* {.importcpp: "vtkTriangle", header: "vtkTriangle.h", bycopy.} = object of vtkCell
    vtkTriangle* {.importc: "vtkTriangle".}: VTK_NEWINSTANCE


proc New*(): ptr vtkTriangle {.importcpp: "vtkTriangle::New(@)",
                           header: "vtkTriangle.h".}
type
  vtkTriangleSuperclass* = vtkCell

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTriangle::IsTypeOf(@)", header: "vtkTriangle.h".}
proc IsA*(this: var vtkTriangle; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkTriangle.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTriangle {.
    importcpp: "vtkTriangle::SafeDownCast(@)", header: "vtkTriangle.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTriangle :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCell :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTriangle :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTriangle :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTriangle; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTriangle.h".}
proc GetEdge*(this: var vtkTriangle; edgeId: cint): ptr vtkCell {.importcpp: "GetEdge",
    header: "vtkTriangle.h".}
proc GetCellType*(this: var vtkTriangle): cint {.importcpp: "GetCellType",
    header: "vtkTriangle.h".}
proc GetCellDimension*(this: var vtkTriangle): cint {.importcpp: "GetCellDimension",
    header: "vtkTriangle.h".}
proc GetNumberOfEdges*(this: var vtkTriangle): cint {.importcpp: "GetNumberOfEdges",
    header: "vtkTriangle.h".}
proc GetNumberOfFaces*(this: var vtkTriangle): cint {.importcpp: "GetNumberOfFaces",
    header: "vtkTriangle.h".}
proc GetFace*(this: var vtkTriangle; a2: cint): ptr vtkCell {.importcpp: "GetFace",
    header: "vtkTriangle.h".}
proc CellBoundary*(this: var vtkTriangle; subId: cint; pcoords: array[3, cdouble];
                  pts: ptr vtkIdList): cint {.importcpp: "CellBoundary",
    header: "vtkTriangle.h".}
proc Contour*(this: var vtkTriangle; value: cdouble; cellScalars: ptr vtkDataArray;
             locator: ptr vtkIncrementalPointLocator; verts: ptr vtkCellArray;
             lines: ptr vtkCellArray; polys: ptr vtkCellArray; inPd: ptr vtkPointData;
             outPd: ptr vtkPointData; inCd: ptr vtkCellData; cellId: vtkIdType;
             outCd: ptr vtkCellData) {.importcpp: "Contour", header: "vtkTriangle.h".}
proc EvaluatePosition*(this: var vtkTriangle; x: array[3, cdouble];
                      closestPoint: array[3, cdouble]; subId: var cint;
                      pcoords: array[3, cdouble]; dist2: var cdouble;
                      weights: ptr cdouble): cint {.importcpp: "EvaluatePosition",
    header: "vtkTriangle.h".}
proc EvaluateLocation*(this: var vtkTriangle; subId: var cint;
                      pcoords: array[3, cdouble]; x: array[3, cdouble];
                      weights: ptr cdouble) {.importcpp: "EvaluateLocation",
    header: "vtkTriangle.h".}
proc Triangulate*(this: var vtkTriangle; index: cint; ptIds: ptr vtkIdList;
                 pts: ptr vtkPoints): cint {.importcpp: "Triangulate",
    header: "vtkTriangle.h".}
proc Derivatives*(this: var vtkTriangle; subId: cint; pcoords: array[3, cdouble];
                 values: ptr cdouble; dim: cint; derivs: ptr cdouble) {.
    importcpp: "Derivatives", header: "vtkTriangle.h".}
proc GetParametricCoords*(this: var vtkTriangle): ptr cdouble {.
    importcpp: "GetParametricCoords", header: "vtkTriangle.h".}
proc ComputeArea*(this: var vtkTriangle): cdouble {.importcpp: "ComputeArea",
    header: "vtkTriangle.h".}
proc Clip*(this: var vtkTriangle; value: cdouble; cellScalars: ptr vtkDataArray;
          locator: ptr vtkIncrementalPointLocator; polys: ptr vtkCellArray;
          inPd: ptr vtkPointData; outPd: ptr vtkPointData; inCd: ptr vtkCellData;
          cellId: vtkIdType; outCd: ptr vtkCellData; insideOut: cint) {.
    importcpp: "Clip", header: "vtkTriangle.h".}
proc InterpolationFunctions*(pcoords: array[3, cdouble]; sf: array[3, cdouble]) {.
    importcpp: "vtkTriangle::InterpolationFunctions(@)", header: "vtkTriangle.h".}
proc InterpolationDerivs*(pcoords: array[3, cdouble]; derivs: array[6, cdouble]) {.
    importcpp: "vtkTriangle::InterpolationDerivs(@)", header: "vtkTriangle.h".}
proc InterpolateFunctions*(this: var vtkTriangle; pcoords: array[3, cdouble];
                          sf: array[3, cdouble]) {.
    importcpp: "InterpolateFunctions", header: "vtkTriangle.h".}
proc InterpolateDerivs*(this: var vtkTriangle; pcoords: array[3, cdouble];
                       derivs: array[6, cdouble]) {.importcpp: "InterpolateDerivs",
    header: "vtkTriangle.h".}
proc GetEdgeArray*(this: var vtkTriangle; edgeId: vtkIdType): ptr vtkIdType {.
    importcpp: "GetEdgeArray", header: "vtkTriangle.h".}
proc IntersectWithLine*(this: var vtkTriangle; p1: array[3, cdouble];
                       p2: array[3, cdouble]; tol: cdouble; t: var cdouble;
                       x: array[3, cdouble]; pcoords: array[3, cdouble];
                       subId: var cint): cint {.importcpp: "IntersectWithLine",
    header: "vtkTriangle.h".}
proc GetParametricCenter*(this: var vtkTriangle; pcoords: array[3, cdouble]): cint {.
    importcpp: "GetParametricCenter", header: "vtkTriangle.h".}
proc GetParametricDistance*(this: var vtkTriangle; pcoords: array[3, cdouble]): cdouble {.
    importcpp: "GetParametricDistance", header: "vtkTriangle.h".}
proc TriangleCenter*(p1: array[3, cdouble]; p2: array[3, cdouble];
                    p3: array[3, cdouble]; center: array[3, cdouble]) {.
    importcpp: "vtkTriangle::TriangleCenter(@)", header: "vtkTriangle.h".}
proc TriangleArea*(p1: array[3, cdouble]; p2: array[3, cdouble]; p3: array[3, cdouble]): cdouble {.
    importcpp: "vtkTriangle::TriangleArea(@)", header: "vtkTriangle.h".}
proc Circumcircle*(p1: array[2, cdouble]; p2: array[2, cdouble]; p3: array[2, cdouble];
                  center: array[2, cdouble]): cdouble {.
    importcpp: "vtkTriangle::Circumcircle(@)", header: "vtkTriangle.h".}
proc BarycentricCoords*(x: array[2, cdouble]; x1: array[2, cdouble];
                       x2: array[2, cdouble]; x3: array[2, cdouble];
                       bcoords: array[3, cdouble]): cint {.
    importcpp: "vtkTriangle::BarycentricCoords(@)", header: "vtkTriangle.h".}
proc ProjectTo2D*(x1: array[3, cdouble]; x2: array[3, cdouble]; x3: array[3, cdouble];
                 v1: array[2, cdouble]; v2: array[2, cdouble]; v3: array[2, cdouble]): cint {.
    importcpp: "vtkTriangle::ProjectTo2D(@)", header: "vtkTriangle.h".}
proc ComputeNormal*(p: ptr vtkPoints; numPts: cint; pts: ptr vtkIdType;
                   n: array[3, cdouble]) {.importcpp: "vtkTriangle::ComputeNormal(@)",
                                        header: "vtkTriangle.h".}
proc ComputeNormal*(v1: array[3, cdouble]; v2: array[3, cdouble];
                   v3: array[3, cdouble]; n: array[3, cdouble]) {.
    importcpp: "vtkTriangle::ComputeNormal(@)", header: "vtkTriangle.h".}
proc ComputeNormalDirection*(v1: array[3, cdouble]; v2: array[3, cdouble];
                            v3: array[3, cdouble]; n: array[3, cdouble]) {.
    importcpp: "vtkTriangle::ComputeNormalDirection(@)", header: "vtkTriangle.h".}
proc TrianglesIntersect*(p1: array[3, cdouble]; q1: array[3, cdouble];
                        r1: array[3, cdouble]; p2: array[3, cdouble];
                        q2: array[3, cdouble]; r2: array[3, cdouble]): cint {.
    importcpp: "vtkTriangle::TrianglesIntersect(@)", header: "vtkTriangle.h".}
proc PointInTriangle*(x: array[3, cdouble]; x1: array[3, cdouble];
                     x2: array[3, cdouble]; x3: array[3, cdouble]; tol2: cdouble): cint {.
    importcpp: "vtkTriangle::PointInTriangle(@)", header: "vtkTriangle.h".}
proc ComputeQuadric*(x1: array[3, cdouble]; x2: array[3, cdouble];
                    x3: array[3, cdouble]; quadric: array[4, array[4, cdouble]]) {.
    importcpp: "vtkTriangle::ComputeQuadric(@)", header: "vtkTriangle.h".}
proc ComputeQuadric*(x1: array[3, cdouble]; x2: array[3, cdouble];
                    x3: array[3, cdouble]; quadric: ptr vtkQuadric) {.
    importcpp: "vtkTriangle::ComputeQuadric(@)", header: "vtkTriangle.h".}
proc ComputeCentroid*(points: ptr vtkPoints; pointIds: ptr vtkIdType;
                     centroid: array[3, cdouble]): bool {.
    importcpp: "vtkTriangle::ComputeCentroid(@)", header: "vtkTriangle.h".}
## ----------------------------------------------------------------------------

proc GetParametricCenter*(this: var vtkTriangle; pcoords: array[3, cdouble]): cint {.
    importcpp: "GetParametricCenter", header: "vtkTriangle.h".}
## ----------------------------------------------------------------------------

proc ComputeNormalDirection*(this: var vtkTriangle; v1: array[3, cdouble];
                            v2: array[3, cdouble]; v3: array[3, cdouble];
                            n: array[3, cdouble]) {.
    importcpp: "ComputeNormalDirection", header: "vtkTriangle.h".}
## ----------------------------------------------------------------------------

proc ComputeNormal*(this: var vtkTriangle; v1: array[3, cdouble];
                   v2: array[3, cdouble]; v3: array[3, cdouble]; n: array[3, cdouble]) {.
    importcpp: "ComputeNormal", header: "vtkTriangle.h".}
## ----------------------------------------------------------------------------

proc TriangleCenter*(this: var vtkTriangle; p1: array[3, cdouble];
                    p2: array[3, cdouble]; p3: array[3, cdouble];
                    center: array[3, cdouble]) {.importcpp: "TriangleCenter",
    header: "vtkTriangle.h".}
## ----------------------------------------------------------------------------

proc TriangleArea*(this: var vtkTriangle; p1: array[3, cdouble]; p2: array[3, cdouble];
                  p3: array[3, cdouble]): cdouble {.importcpp: "TriangleArea",
    header: "vtkTriangle.h".}