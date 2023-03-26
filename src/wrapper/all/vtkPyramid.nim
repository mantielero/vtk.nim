## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPyramid.h
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
##  @class   vtkPyramid
##  @brief   a 3D cell that represents a linear pyramid
##
##  vtkPyramid is a concrete implementation of vtkCell to represent a 3D
##  pyramid. A pyramid consists of a rectangular base with four triangular
##  faces. vtkPyramid uses the standard isoparametric shape functions for
##  a linear pyramid. The pyramid is defined by the five points (0-4) where
##  (0,1,2,3) is the base of the pyramid which, using the right hand rule,
##  forms a quadrilaterial whose normal points in the direction of the
##  pyramid apex at vertex #4. The parametric location of vertex #4 is [0, 0, 1].
##
##  @sa
##  vtkConvexPointSet vtkHexahedron vtkTetra vtkVoxel vtkWedge
##

import
  vtkCell3D, vtkCommonDataModelModule

discard "forward decl of vtkLine"
discard "forward decl of vtkQuad"
discard "forward decl of vtkTriangle"
discard "forward decl of vtkUnstructuredGrid"
discard "forward decl of vtkIncrementalPointLocator"
type
  vtkPyramid* {.importcpp: "vtkPyramid", header: "vtkPyramid.h", bycopy.} = object of vtkCell3D
    vtkPyramid* {.importc: "vtkPyramid".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPyramid {.importcpp: "vtkPyramid::New(@)", header: "vtkPyramid.h".}
type
  vtkPyramidSuperclass* = vtkCell3D

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkPyramid::IsTypeOf(@)",
    header: "vtkPyramid.h".}
proc IsA*(this: var vtkPyramid; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkPyramid.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPyramid {.
    importcpp: "vtkPyramid::SafeDownCast(@)", header: "vtkPyramid.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPyramid :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCell3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPyramid :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPyramid :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPyramid; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPyramid.h".}
proc GetEdgePoints*(this: var vtkPyramid; edgeId: vtkIdType; pts: ptr vtkIdType) {.
    importcpp: "GetEdgePoints", header: "vtkPyramid.h".}
proc GetFacePoints*(this: var vtkPyramid; faceId: vtkIdType; pts: ptr vtkIdType): vtkIdType {.
    importcpp: "GetFacePoints", header: "vtkPyramid.h".}
proc GetEdgeToAdjacentFaces*(this: var vtkPyramid; edgeId: vtkIdType;
                            pts: ptr vtkIdType) {.
    importcpp: "GetEdgeToAdjacentFaces", header: "vtkPyramid.h".}
proc GetFaceToAdjacentFaces*(this: var vtkPyramid; faceId: vtkIdType;
                            faceIds: ptr vtkIdType): vtkIdType {.
    importcpp: "GetFaceToAdjacentFaces", header: "vtkPyramid.h".}
proc GetPointToIncidentEdges*(this: var vtkPyramid; pointId: vtkIdType;
                             edgeIds: ptr vtkIdType): vtkIdType {.
    importcpp: "GetPointToIncidentEdges", header: "vtkPyramid.h".}
proc GetPointToIncidentFaces*(this: var vtkPyramid; pointId: vtkIdType;
                             faceIds: ptr vtkIdType): vtkIdType {.
    importcpp: "GetPointToIncidentFaces", header: "vtkPyramid.h".}
proc GetPointToOneRingPoints*(this: var vtkPyramid; pointId: vtkIdType;
                             pts: ptr vtkIdType): vtkIdType {.
    importcpp: "GetPointToOneRingPoints", header: "vtkPyramid.h".}
proc GetCentroid*(this: vtkPyramid; centroid: array[3, cdouble]): bool {.noSideEffect,
    importcpp: "GetCentroid", header: "vtkPyramid.h".}
proc IsInsideOut*(this: var vtkPyramid): bool {.importcpp: "IsInsideOut",
    header: "vtkPyramid.h".}
proc GetCellType*(this: var vtkPyramid): cint {.importcpp: "GetCellType",
    header: "vtkPyramid.h".}
proc GetCellDimension*(this: var vtkPyramid): cint {.importcpp: "GetCellDimension",
    header: "vtkPyramid.h".}
proc GetNumberOfEdges*(this: var vtkPyramid): cint {.importcpp: "GetNumberOfEdges",
    header: "vtkPyramid.h".}
proc GetNumberOfFaces*(this: var vtkPyramid): cint {.importcpp: "GetNumberOfFaces",
    header: "vtkPyramid.h".}
proc GetEdge*(this: var vtkPyramid; edgeId: cint): ptr vtkCell {.importcpp: "GetEdge",
    header: "vtkPyramid.h".}
proc GetFace*(this: var vtkPyramid; faceId: cint): ptr vtkCell {.importcpp: "GetFace",
    header: "vtkPyramid.h".}
proc CellBoundary*(this: var vtkPyramid; subId: cint; pcoords: array[3, cdouble];
                  pts: ptr vtkIdList): cint {.importcpp: "CellBoundary",
    header: "vtkPyramid.h".}
proc Contour*(this: var vtkPyramid; value: cdouble; cellScalars: ptr vtkDataArray;
             locator: ptr vtkIncrementalPointLocator; verts: ptr vtkCellArray;
             lines: ptr vtkCellArray; polys: ptr vtkCellArray; inPd: ptr vtkPointData;
             outPd: ptr vtkPointData; inCd: ptr vtkCellData; cellId: vtkIdType;
             outCd: ptr vtkCellData) {.importcpp: "Contour", header: "vtkPyramid.h".}
proc EvaluatePosition*(this: var vtkPyramid; x: array[3, cdouble];
                      closestPoint: array[3, cdouble]; subId: var cint;
                      pcoords: array[3, cdouble]; dist2: var cdouble;
                      weights: ptr cdouble): cint {.importcpp: "EvaluatePosition",
    header: "vtkPyramid.h".}
proc EvaluateLocation*(this: var vtkPyramid; subId: var cint;
                      pcoords: array[3, cdouble]; x: array[3, cdouble];
                      weights: ptr cdouble) {.importcpp: "EvaluateLocation",
    header: "vtkPyramid.h".}
proc IntersectWithLine*(this: var vtkPyramid; p1: array[3, cdouble];
                       p2: array[3, cdouble]; tol: cdouble; t: var cdouble;
                       x: array[3, cdouble]; pcoords: array[3, cdouble];
                       subId: var cint): cint {.importcpp: "IntersectWithLine",
    header: "vtkPyramid.h".}
proc Triangulate*(this: var vtkPyramid; index: cint; ptIds: ptr vtkIdList;
                 pts: ptr vtkPoints): cint {.importcpp: "Triangulate",
    header: "vtkPyramid.h".}
proc Derivatives*(this: var vtkPyramid; subId: cint; pcoords: array[3, cdouble];
                 values: ptr cdouble; dim: cint; derivs: ptr cdouble) {.
    importcpp: "Derivatives", header: "vtkPyramid.h".}
proc GetParametricCoords*(this: var vtkPyramid): ptr cdouble {.
    importcpp: "GetParametricCoords", header: "vtkPyramid.h".}
proc GetTriangleCases*(caseId: cint): ptr cint {.
    importcpp: "vtkPyramid::GetTriangleCases(@)", header: "vtkPyramid.h".}
proc GetParametricCenter*(this: var vtkPyramid; pcoords: array[3, cdouble]): cint {.
    importcpp: "GetParametricCenter", header: "vtkPyramid.h".}
proc InterpolationFunctions*(pcoords: array[3, cdouble]; weights: array[5, cdouble]) {.
    importcpp: "vtkPyramid::InterpolationFunctions(@)", header: "vtkPyramid.h".}
proc InterpolationDerivs*(pcoords: array[3, cdouble]; derivs: array[15, cdouble]) {.
    importcpp: "vtkPyramid::InterpolationDerivs(@)", header: "vtkPyramid.h".}
proc InterpolateFunctions*(this: var vtkPyramid; pcoords: array[3, cdouble];
                          weights: array[5, cdouble]) {.
    importcpp: "InterpolateFunctions", header: "vtkPyramid.h".}
proc InterpolateDerivs*(this: var vtkPyramid; pcoords: array[3, cdouble];
                       derivs: array[15, cdouble]) {.
    importcpp: "InterpolateDerivs", header: "vtkPyramid.h".}
proc JacobianInverse*(this: var vtkPyramid; pcoords: array[3, cdouble];
                     inverse: ptr ptr cdouble; derivs: array[15, cdouble]): cint {.
    importcpp: "JacobianInverse", header: "vtkPyramid.h".}
## !!!Ignored construct:  /@{ *
##  Return the ids of the vertices defining edge/face (`edgeId`/`faceId').
##  Ids are related to the cell, not to the dataset.
##
##  @note The return type changed. It used to be int*, it is now const vtkIdType*.
##  This is so ids are unified between vtkCell and vtkPoints, and so vtkCell ids
##  can be used as inputs in algorithms such as vtkPolygon::ComputeNormal.
##  static const vtkIdType * GetEdgeArray ( vtkIdType edgeId ) VTK_SIZEHINT ( 2 ) ;
## Error: expected ';'!!!

## !!!Ignored construct:  static const vtkIdType * GetFaceArray ( vtkIdType faceId ) VTK_SIZEHINT ( 4 ) ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} *
##  Static method version of GetEdgeToAdjacentFaces.
##  static const vtkIdType * GetEdgeToAdjacentFacesArray ( vtkIdType edgeId ) VTK_SIZEHINT ( 2 ) ;
## Error: expected ';'!!!

## !!!Ignored construct:  *
##  Static method version of GetFaceToAdjacentFaces.
##  static const vtkIdType * GetFaceToAdjacentFacesArray ( vtkIdType faceId ) VTK_SIZEHINT ( 4 ) ;
## Error: expected ';'!!!

## !!!Ignored construct:  *
##  Static method version of GetPointToIncidentEdgesArray.
##  static const vtkIdType * GetPointToIncidentEdgesArray ( vtkIdType pointId ) VTK_SIZEHINT ( 4 ) ;
## Error: expected ';'!!!

## !!!Ignored construct:  *
##  Static method version of GetPointToIncidentFacesArray.
##  static const vtkIdType * GetPointToIncidentFacesArray ( vtkIdType pointId ) VTK_SIZEHINT ( 4 ) ;
## Error: expected ';'!!!

## !!!Ignored construct:  *
##  Static method version of GetPointToOneRingPoints.
##  static const vtkIdType * GetPointToOneRingPointsArray ( vtkIdType pointId ) VTK_SIZEHINT ( 4 ) ;
## Error: expected ';'!!!

proc ComputeCentroid*(points: ptr vtkPoints; pointIds: ptr vtkIdType;
                     centroid: array[3, cdouble]): bool {.
    importcpp: "vtkPyramid::ComputeCentroid(@)", header: "vtkPyramid.h".}
## ----------------------------------------------------------------------------

proc GetParametricCenter*(this: var vtkPyramid; pcoords: array[3, cdouble]): cint {.
    importcpp: "GetParametricCenter", header: "vtkPyramid.h".}