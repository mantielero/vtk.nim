## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPolygon.h
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
##  @class   vtkPolygon
##  @brief   a cell that represents an n-sided polygon
##
##  vtkPolygon is a concrete implementation of vtkCell to represent a 2D
##  n-sided polygon. The polygons cannot have any internal holes, and cannot
##  self-intersect. Define the polygon with n-points ordered in the counter-
##  clockwise direction; do not repeat the last point.
##

import
  vtkCell, vtkCommonDataModelModule

discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkLine"
discard "forward decl of vtkPoints"
discard "forward decl of vtkQuad"
discard "forward decl of vtkTriangle"
discard "forward decl of vtkIncrementalPointLocator"
type
  vtkPolygon* {.importcpp: "vtkPolygon", header: "vtkPolygon.h", bycopy.} = object of vtkCell ##  Ear cut triangulation options. The order in which vertices are
                                                                                    ##  removed are controlled by different measures. Changing this can
                                                                                    ##  make subtle differences in some cases. Historically the
                                                                                    ##  PERIMETER2_TO_AREA_RATIO has been used.
    vtkPolygon* {.importc: "vtkPolygon".}: VTK_NEWINSTANCE
    ##  Intersection tolerance set by public API
    ##  Internal tolerance set by ComputeBounds()
    ##  Stops recursive triangulation if necessary
    ##  Output triangulation placed here
    ##  These are used for internal computation.
    ##  Parameter indicating whether to use Mean Value Coordinate algorithm
    ##  for interpolation. The parameter is false by default.
    ##  Helper methods for triangulation------------------------------
    ##  Made public for external access


proc New*(): ptr vtkPolygon {.importcpp: "vtkPolygon::New(@)", header: "vtkPolygon.h".}
type
  vtkPolygonSuperclass* = vtkCell

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkPolygon::IsTypeOf(@)",
    header: "vtkPolygon.h".}
proc IsA*(this: var vtkPolygon; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkPolygon.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPolygon {.
    importcpp: "vtkPolygon::SafeDownCast(@)", header: "vtkPolygon.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPolygon :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCell :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPolygon :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPolygon :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPolygon; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPolygon.h".}
proc GetCellType*(this: var vtkPolygon): cint {.importcpp: "GetCellType",
    header: "vtkPolygon.h".}
proc GetCellDimension*(this: var vtkPolygon): cint {.importcpp: "GetCellDimension",
    header: "vtkPolygon.h".}
proc GetNumberOfEdges*(this: var vtkPolygon): cint {.importcpp: "GetNumberOfEdges",
    header: "vtkPolygon.h".}
proc GetNumberOfFaces*(this: var vtkPolygon): cint {.importcpp: "GetNumberOfFaces",
    header: "vtkPolygon.h".}
proc GetEdge*(this: var vtkPolygon; edgeId: cint): ptr vtkCell {.importcpp: "GetEdge",
    header: "vtkPolygon.h".}
proc GetFace*(this: var vtkPolygon; a2: cint): ptr vtkCell {.importcpp: "GetFace",
    header: "vtkPolygon.h".}
proc CellBoundary*(this: var vtkPolygon; subId: cint; pcoords: array[3, cdouble];
                  pts: ptr vtkIdList): cint {.importcpp: "CellBoundary",
    header: "vtkPolygon.h".}
proc Contour*(this: var vtkPolygon; value: cdouble; cellScalars: ptr vtkDataArray;
             locator: ptr vtkIncrementalPointLocator; verts: ptr vtkCellArray;
             lines: ptr vtkCellArray; polys: ptr vtkCellArray; inPd: ptr vtkPointData;
             outPd: ptr vtkPointData; inCd: ptr vtkCellData; cellId: vtkIdType;
             outCd: ptr vtkCellData) {.importcpp: "Contour", header: "vtkPolygon.h".}
proc Clip*(this: var vtkPolygon; value: cdouble; cellScalars: ptr vtkDataArray;
          locator: ptr vtkIncrementalPointLocator; tris: ptr vtkCellArray;
          inPd: ptr vtkPointData; outPd: ptr vtkPointData; inCd: ptr vtkCellData;
          cellId: vtkIdType; outCd: ptr vtkCellData; insideOut: cint) {.
    importcpp: "Clip", header: "vtkPolygon.h".}
proc EvaluatePosition*(this: var vtkPolygon; x: array[3, cdouble];
                      closestPoint: array[3, cdouble]; subId: var cint;
                      pcoords: array[3, cdouble]; dist2: var cdouble;
                      weights: ptr cdouble): cint {.importcpp: "EvaluatePosition",
    header: "vtkPolygon.h".}
proc EvaluateLocation*(this: var vtkPolygon; subId: var cint;
                      pcoords: array[3, cdouble]; x: array[3, cdouble];
                      weights: ptr cdouble) {.importcpp: "EvaluateLocation",
    header: "vtkPolygon.h".}
proc IntersectWithLine*(this: var vtkPolygon; p1: array[3, cdouble];
                       p2: array[3, cdouble]; tol: cdouble; t: var cdouble;
                       x: array[3, cdouble]; pcoords: array[3, cdouble];
                       subId: var cint): cint {.importcpp: "IntersectWithLine",
    header: "vtkPolygon.h".}
proc Triangulate*(this: var vtkPolygon; index: cint; ptIds: ptr vtkIdList;
                 pts: ptr vtkPoints): cint {.importcpp: "Triangulate",
    header: "vtkPolygon.h".}
proc Derivatives*(this: var vtkPolygon; subId: cint; pcoords: array[3, cdouble];
                 values: ptr cdouble; dim: cint; derivs: ptr cdouble) {.
    importcpp: "Derivatives", header: "vtkPolygon.h".}
proc IsPrimaryCell*(this: var vtkPolygon): cint {.importcpp: "IsPrimaryCell",
    header: "vtkPolygon.h".}
proc ComputeArea*(this: var vtkPolygon): cdouble {.importcpp: "ComputeArea",
    header: "vtkPolygon.h".}
proc InterpolateFunctions*(this: var vtkPolygon; x: array[3, cdouble]; sf: ptr cdouble) {.
    importcpp: "InterpolateFunctions", header: "vtkPolygon.h".}
proc ComputeNormal*(p: ptr vtkPoints; numPts: cint; pts: ptr vtkIdType;
                   n: array[3, cdouble]) {.importcpp: "vtkPolygon::ComputeNormal(@)",
                                        header: "vtkPolygon.h".}
proc ComputeNormal*(p: ptr vtkPoints; n: array[3, cdouble]) {.
    importcpp: "vtkPolygon::ComputeNormal(@)", header: "vtkPolygon.h".}
proc ComputeNormal*(ids: ptr vtkIdTypeArray; pts: ptr vtkPoints; n: array[3, cdouble]) {.
    importcpp: "vtkPolygon::ComputeNormal(@)", header: "vtkPolygon.h".}
proc ComputeNormal*(numPts: cint; pts: ptr cdouble; n: array[3, cdouble]) {.
    importcpp: "vtkPolygon::ComputeNormal(@)", header: "vtkPolygon.h".}
proc IsConvex*(this: var vtkPolygon): bool {.importcpp: "IsConvex",
                                        header: "vtkPolygon.h".}
proc IsConvex*(p: ptr vtkPoints; numPts: cint; pts: ptr vtkIdType): bool {.
    importcpp: "vtkPolygon::IsConvex(@)", header: "vtkPolygon.h".}
proc IsConvex*(ids: ptr vtkIdTypeArray; p: ptr vtkPoints): bool {.
    importcpp: "vtkPolygon::IsConvex(@)", header: "vtkPolygon.h".}
proc IsConvex*(p: ptr vtkPoints): bool {.importcpp: "vtkPolygon::IsConvex(@)",
                                    header: "vtkPolygon.h".}
proc ComputeCentroid*(p: ptr vtkPoints; numPts: cint; pts: ptr vtkIdType;
                     centroid: array[3, cdouble]): bool {.
    importcpp: "vtkPolygon::ComputeCentroid(@)", header: "vtkPolygon.h".}
proc ComputeCentroid*(ids: ptr vtkIdTypeArray; pts: ptr vtkPoints;
                     centroid: array[3, cdouble]): bool {.
    importcpp: "vtkPolygon::ComputeCentroid(@)", header: "vtkPolygon.h".}
proc ComputeArea*(p: ptr vtkPoints; numPts: vtkIdType; pts: ptr vtkIdType;
                 normal: array[3, cdouble]): cdouble {.
    importcpp: "vtkPolygon::ComputeArea(@)", header: "vtkPolygon.h".}
proc ParameterizePolygon*(this: var vtkPolygon; p0: array[3, cdouble];
                         p10: array[3, cdouble]; l10: var cdouble;
                         p20: array[3, cdouble]; l20: var cdouble;
                         n: array[3, cdouble]): cint {.
    importcpp: "ParameterizePolygon", header: "vtkPolygon.h".}
proc PointInPolygon*(x: array[3, cdouble]; numPts: cint; pts: ptr cdouble;
                    bounds: array[6, cdouble]; n: array[3, cdouble]): cint {.
    importcpp: "vtkPolygon::PointInPolygon(@)", header: "vtkPolygon.h".}
proc Triangulate*(this: var vtkPolygon; outTris: ptr vtkIdList): cint {.
    importcpp: "Triangulate", header: "vtkPolygon.h".}
proc NonDegenerateTriangulate*(this: var vtkPolygon; outTris: ptr vtkIdList): cint {.
    importcpp: "NonDegenerateTriangulate", header: "vtkPolygon.h".}
proc BoundedTriangulate*(this: var vtkPolygon; outTris: ptr vtkIdList; tol: cdouble): cint {.
    importcpp: "BoundedTriangulate", header: "vtkPolygon.h".}
proc DistanceToPolygon*(x: array[3, cdouble]; numPts: cint; pts: ptr cdouble;
                       bounds: array[6, cdouble]; closest: array[3, cdouble]): cdouble {.
    importcpp: "vtkPolygon::DistanceToPolygon(@)", header: "vtkPolygon.h".}
proc IntersectPolygonWithPolygon*(npts: cint; pts: ptr cdouble;
                                 bounds: array[6, cdouble]; npts2: cint;
                                 pts2: ptr cdouble; bounds2: array[3, cdouble];
                                 tol: cdouble; x: array[3, cdouble]): cint {.
    importcpp: "vtkPolygon::IntersectPolygonWithPolygon(@)",
    header: "vtkPolygon.h".}
proc IntersectConvex2DCells*(cell1: ptr vtkCell; cell2: ptr vtkCell; tol: cdouble;
                            p0: array[3, cdouble]; p1: array[3, cdouble]): cint {.
    importcpp: "vtkPolygon::IntersectConvex2DCells(@)", header: "vtkPolygon.h".}
## !!!Ignored construct:  /@{ *
##  Set/Get the flag indicating whether to use Mean Value Coordinate for the
##  interpolation. If true, InterpolateFunctions() uses the Mean Value
##  Coordinate to compute weights. Otherwise, the conventional 1/r^2 method
##  is used. The UseMVCInterpolation parameter is set to false by default.
##  virtual bool GetUseMVCInterpolationUseMVCInterpolation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseMVCInterpolation  of  << this -> UseMVCInterpolation ) ; return this -> UseMVCInterpolation ; } ;
## Error: expected ';'!!!

proc SetUseMVCInterpolation*(this: var vtkPolygon; _arg: bool) {.
    importcpp: "SetUseMVCInterpolation", header: "vtkPolygon.h".}
  ## /@}
  ## @{
  ## *
  ##  Specify an internal tolerance for operations requiring polygon
  ##  triangulation.  (For example, clipping and contouring operations proceed
  ##  by first triangulating the polygon, and then clipping/contouring the
  ##  resulting triangles.)  This is a normalized tolerance value multiplied
  ##  by the diagonal length of the polygon bounding box. Is it used to
  ##  determine whether potential triangulation edges intersect one another.
  ##
proc SetTolerance*(this: var vtkPolygon; _arg: cdouble) {.importcpp: "SetTolerance",
    header: "vtkPolygon.h".}
proc GetToleranceMinValue*(this: var vtkPolygon): cdouble {.
    importcpp: "GetToleranceMinValue", header: "vtkPolygon.h".}
proc GetToleranceMaxValue*(this: var vtkPolygon): cdouble {.
    importcpp: "GetToleranceMaxValue", header: "vtkPolygon.h".}
## !!!Ignored construct:  virtual double GetUseMVCInterpolationUseMVCInterpolationTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tolerance  of  << this -> Tolerance ) ; return this -> Tolerance ; } ;
## Error: expected ';'!!!

type
  vtkPolygonEarCutMeasureTypes* {.size: sizeof(cint),
                                 importcpp: "vtkPolygon::EarCutMeasureTypes",
                                 header: "vtkPolygon.h".} = enum
    PERIMETER2_TO_AREA_RATIO = 0, DOT_PRODUCT = 1, BEST_QUALITY = 2


proc EarCutTriangulation*(this: var vtkPolygon;
                         measure: cint = PERIMETER2_TO_AREA_RATIO): cint {.
    importcpp: "EarCutTriangulation", header: "vtkPolygon.h".}
proc EarCutTriangulation*(this: var vtkPolygon; outTris: ptr vtkIdList;
                         measure: cint = PERIMETER2_TO_AREA_RATIO): cint {.
    importcpp: "EarCutTriangulation", header: "vtkPolygon.h".}
proc UnbiasedEarCutTriangulation*(this: var vtkPolygon; seed: cint;
                                 measure: cint = PERIMETER2_TO_AREA_RATIO): cint {.
    importcpp: "UnbiasedEarCutTriangulation", header: "vtkPolygon.h".}
proc UnbiasedEarCutTriangulation*(this: var vtkPolygon; seed: cint;
                                 outTris: ptr vtkIdList;
                                 measure: cint = PERIMETER2_TO_AREA_RATIO): cint {.
    importcpp: "UnbiasedEarCutTriangulation", header: "vtkPolygon.h".}