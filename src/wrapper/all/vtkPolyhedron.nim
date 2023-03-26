## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPolyhedron.h
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
##  @class   vtkPolyhedron
##  @brief   a 3D cell defined by a set of polygonal faces
##
##  vtkPolyhedron is a concrete implementation that represents a 3D cell
##  defined by a set of polygonal faces. The polyhedron should be watertight,
##  non-self-intersecting and manifold (each edge is used twice).
##
##  Interpolation functions and weights are defined / computed using the
##  method of Mean Value Coordinates (MVC). See the VTK class
##  vtkMeanValueCoordinatesInterpolator for more information.
##
##  The class does not require the polyhedron to be convex. However, the
##  polygonal faces must be planar. Non-planar polygonal faces will
##  definitely cause problems, especially in severely warped situations.
##
##  @sa
##  vtkCell3D vtkConvexPointSet vtkMeanValueCoordinatesInterpolator
##

import
  vtkCell3D, vtkCommonDataModelModule

discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkCellArray"
discard "forward decl of vtkTriangle"
discard "forward decl of vtkQuad"
discard "forward decl of vtkTetra"
discard "forward decl of vtkPolygon"
discard "forward decl of vtkLine"
discard "forward decl of vtkPointIdMap"
discard "forward decl of vtkIdToIdVectorMapType"
discard "forward decl of vtkIdToIdMapType"
discard "forward decl of vtkEdgeTable"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkCellLocator"
discard "forward decl of vtkGenericCell"
discard "forward decl of vtkPointLocator"
type
  vtkPolyhedron* {.importcpp: "vtkPolyhedron", header: "vtkPolyhedron.h", bycopy.} = object of vtkCell3D ## /@{
                                                                                               ## *
                                                                                               ##  Standard new methods.
                                                                                               ##
    vtkPolyhedron* {.importc: "vtkPolyhedron".}: VTK_NEWINSTANCE
    ##  these are numbered in global id space
    ##  vtkCell has the data members Points (x,y,z coordinates) and PointIds
    ##  (global cell ids corresponding to cell canonical numbering (0,1,2,....)).
    ##  These data members are implicitly organized in canonical space, i.e., where
    ##  the cell point ids are (0,1,...,npts-1). The PointIdMap maps global point id
    ##  back to these canonoical point ids.
    ##  If edges are needed. Note that the edge numbering is in
    ##  canonical space.
    ##  true/false
    ##  keep track of all edges
    ##  edge pairs kept in this list, in canonical id space
    ##  face pairs that comprise each edge, with the
    ##  same ordering as EdgeTable
    ##  these are numbered in canonical id space
    ##  Members used in GetPointToIncidentFaces


proc New*(): ptr vtkPolyhedron {.importcpp: "vtkPolyhedron::New(@)",
                             header: "vtkPolyhedron.h".}
type
  vtkPolyhedronSuperclass* = vtkCell3D

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPolyhedron::IsTypeOf(@)", header: "vtkPolyhedron.h".}
proc IsA*(this: var vtkPolyhedron; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkPolyhedron.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPolyhedron {.
    importcpp: "vtkPolyhedron::SafeDownCast(@)", header: "vtkPolyhedron.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPolyhedron :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCell3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPolyhedron :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPolyhedron :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPolyhedron; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPolyhedron.h".}
proc GetEdgePoints*(this: var vtkPolyhedron;
                   vtkNotUsed: proc (a1: edgeId): vtkIdType;
                   vtkNotUsed: proc (a1: pts): ptr vtkIdType) {.
    importcpp: "GetEdgePoints", header: "vtkPolyhedron.h".}
proc GetFacePoints*(this: var vtkPolyhedron;
                   vtkNotUsed: proc (a1: faceId): vtkIdType;
                   vtkNotUsed: proc (a1: pts): ptr vtkIdType): vtkIdType {.
    importcpp: "GetFacePoints", header: "vtkPolyhedron.h".}
proc GetEdgeToAdjacentFaces*(this: var vtkPolyhedron;
                            vtkNotUsed: proc (a1: edgeId): vtkIdType;
                            vtkNotUsed: proc (a1: pts): ptr vtkIdType) {.
    importcpp: "GetEdgeToAdjacentFaces", header: "vtkPolyhedron.h".}
proc GetFaceToAdjacentFaces*(this: var vtkPolyhedron;
                            vtkNotUsed: proc (a1: faceId): vtkIdType;
                            vtkNotUsed: proc (a1: faceIds): ptr vtkIdType): vtkIdType {.
    importcpp: "GetFaceToAdjacentFaces", header: "vtkPolyhedron.h".}
proc GetPointToIncidentEdges*(this: var vtkPolyhedron;
                             vtkNotUsed: proc (a1: pointId): vtkIdType;
                             vtkNotUsed: proc (a1: edgeIds): ptr vtkIdType): vtkIdType {.
    importcpp: "GetPointToIncidentEdges", header: "vtkPolyhedron.h".}
proc GetPointToIncidentFaces*(this: var vtkPolyhedron; pointId: vtkIdType;
                             faceIds: ptr vtkIdType): vtkIdType {.
    importcpp: "GetPointToIncidentFaces", header: "vtkPolyhedron.h".}
proc GetPointToOneRingPoints*(this: var vtkPolyhedron;
                             vtkNotUsed: proc (a1: pointId): vtkIdType;
                             vtkNotUsed: proc (a1: pts): ptr vtkIdType): vtkIdType {.
    importcpp: "GetPointToOneRingPoints", header: "vtkPolyhedron.h".}
proc GetCentroid*(this: vtkPolyhedron;
                 vtkNotUsed: array[3, proc (a1: centroid): cdouble]): bool {.
    noSideEffect, importcpp: "GetCentroid", header: "vtkPolyhedron.h".}
proc GetParametricCoords*(this: var vtkPolyhedron): ptr cdouble {.
    importcpp: "GetParametricCoords", header: "vtkPolyhedron.h".}
proc GetCellType*(this: var vtkPolyhedron): cint {.importcpp: "GetCellType",
    header: "vtkPolyhedron.h".}
proc RequiresInitialization*(this: var vtkPolyhedron): cint {.
    importcpp: "RequiresInitialization", header: "vtkPolyhedron.h".}
proc Initialize*(this: var vtkPolyhedron) {.importcpp: "Initialize",
                                        header: "vtkPolyhedron.h".}
proc GetNumberOfEdges*(this: var vtkPolyhedron): cint {.
    importcpp: "GetNumberOfEdges", header: "vtkPolyhedron.h".}
proc GetEdge*(this: var vtkPolyhedron; a2: cint): ptr vtkCell {.importcpp: "GetEdge",
    header: "vtkPolyhedron.h".}
proc GetNumberOfFaces*(this: var vtkPolyhedron): cint {.
    importcpp: "GetNumberOfFaces", header: "vtkPolyhedron.h".}
proc GetFace*(this: var vtkPolyhedron; faceId: cint): ptr vtkCell {.
    importcpp: "GetFace", header: "vtkPolyhedron.h".}
proc Contour*(this: var vtkPolyhedron; value: cdouble; scalars: ptr vtkDataArray;
             locator: ptr vtkIncrementalPointLocator; verts: ptr vtkCellArray;
             lines: ptr vtkCellArray; polys: ptr vtkCellArray; inPd: ptr vtkPointData;
             outPd: ptr vtkPointData; inCd: ptr vtkCellData; cellId: vtkIdType;
             outCd: ptr vtkCellData) {.importcpp: "Contour",
                                    header: "vtkPolyhedron.h".}
proc Clip*(this: var vtkPolyhedron; value: cdouble; scalars: ptr vtkDataArray;
          locator: ptr vtkIncrementalPointLocator; connectivity: ptr vtkCellArray;
          inPd: ptr vtkPointData; outPd: ptr vtkPointData; inCd: ptr vtkCellData;
          cellId: vtkIdType; outCd: ptr vtkCellData; insideOut: cint) {.
    importcpp: "Clip", header: "vtkPolyhedron.h".}
proc EvaluatePosition*(this: var vtkPolyhedron; x: array[3, cdouble];
                      closestPoint: array[3, cdouble]; subId: var cint;
                      pcoords: array[3, cdouble]; dist2: var cdouble;
                      weights: ptr cdouble): cint {.importcpp: "EvaluatePosition",
    header: "vtkPolyhedron.h".}
proc EvaluateLocation*(this: var vtkPolyhedron; subId: var cint;
                      pcoords: array[3, cdouble]; x: array[3, cdouble];
                      weights: ptr cdouble) {.importcpp: "EvaluateLocation",
    header: "vtkPolyhedron.h".}
proc IntersectWithLine*(this: var vtkPolyhedron; p1: array[3, cdouble];
                       p2: array[3, cdouble]; tol: cdouble; t: var cdouble;
                       x: array[3, cdouble]; pcoords: array[3, cdouble];
                       subId: var cint): cint {.importcpp: "IntersectWithLine",
    header: "vtkPolyhedron.h".}
proc Triangulate*(this: var vtkPolyhedron; index: cint; ptIds: ptr vtkIdList;
                 pts: ptr vtkPoints): cint {.importcpp: "Triangulate",
    header: "vtkPolyhedron.h".}
proc Derivatives*(this: var vtkPolyhedron; subId: cint; pcoords: array[3, cdouble];
                 values: ptr cdouble; dim: cint; derivs: ptr cdouble) {.
    importcpp: "Derivatives", header: "vtkPolyhedron.h".}
proc CellBoundary*(this: var vtkPolyhedron; subId: cint; pcoords: array[3, cdouble];
                  pts: ptr vtkIdList): cint {.importcpp: "CellBoundary",
    header: "vtkPolyhedron.h".}
proc GetParametricCenter*(this: var vtkPolyhedron; pcoords: array[3, cdouble]): cint {.
    importcpp: "GetParametricCenter", header: "vtkPolyhedron.h".}
proc IsPrimaryCell*(this: var vtkPolyhedron): cint {.importcpp: "IsPrimaryCell",
    header: "vtkPolyhedron.h".}
proc InterpolateFunctions*(this: var vtkPolyhedron; x: array[3, cdouble];
                          sf: ptr cdouble) {.importcpp: "InterpolateFunctions",
    header: "vtkPolyhedron.h".}
proc InterpolateDerivs*(this: var vtkPolyhedron; x: array[3, cdouble];
                       derivs: ptr cdouble) {.importcpp: "InterpolateDerivs",
    header: "vtkPolyhedron.h".}
proc RequiresExplicitFaceRepresentation*(this: var vtkPolyhedron): cint {.
    importcpp: "RequiresExplicitFaceRepresentation", header: "vtkPolyhedron.h".}
proc SetFaces*(this: var vtkPolyhedron; faces: ptr vtkIdType) {.importcpp: "SetFaces",
    header: "vtkPolyhedron.h".}
proc GetFaces*(this: var vtkPolyhedron): ptr vtkIdType {.importcpp: "GetFaces",
    header: "vtkPolyhedron.h".}
proc IsInside*(this: var vtkPolyhedron; x: array[3, cdouble]; tolerance: cdouble): cint {.
    importcpp: "IsInside", header: "vtkPolyhedron.h".}
proc IsConvex*(this: var vtkPolyhedron): bool {.importcpp: "IsConvex",
    header: "vtkPolyhedron.h".}
proc GetPolyData*(this: var vtkPolyhedron): ptr vtkPolyData {.
    importcpp: "GetPolyData", header: "vtkPolyhedron.h".}
## ----------------------------------------------------------------------------

proc GetParametricCenter*(this: var vtkPolyhedron; pcoords: array[3, cdouble]): cint {.
    importcpp: "GetParametricCenter", header: "vtkPolyhedron.h".}