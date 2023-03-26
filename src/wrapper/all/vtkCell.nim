## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCell.h
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
##  @class   vtkCell
##  @brief   abstract class to specify cell behavior
##
##  vtkCell is an abstract class that specifies the interfaces for data cells.
##  Data cells are simple topological elements like points, lines, polygons,
##  and tetrahedra of which visualization datasets are composed. In some
##  cases visualization datasets may explicitly represent cells (e.g.,
##  vtkPolyData, vtkUnstructuredGrid), and in some cases, the datasets are
##  implicitly composed of cells (e.g., vtkStructuredPoints).
##
##  @warning
##  The \#define VTK_CELL_SIZE is a parameter used to construct cells and provide
##  a general guideline for controlling object execution. This parameter is
##  not a hard boundary: you can create cells with more points.
##
##  @sa
##  vtkHexahedron vtkLine vtkPixel vtkPolyLine vtkPolyVertex
##  vtkPolygon vtkQuad vtkTetra vtkTriangle
##  vtkTriangleStrip vtkVertex vtkVoxel vtkWedge vtkPyramid
##

const
  VTK_CELL_SIZE* = 512
  VTK_TOL* = 1.e-05

import
  vtkCommonDataModelModule, vtkObject, vtkBoundingBox, vtkCellType, vtkIdList

discard "forward decl of vtkCellArray"
discard "forward decl of vtkCellData"
discard "forward decl of vtkDataArray"
discard "forward decl of vtkPointData"
discard "forward decl of vtkIncrementalPointLocator"
discard "forward decl of vtkPoints"
type
  vtkCell* {.importcpp: "vtkCell", header: "vtkCell.h", bycopy.} = object of vtkObject
    vtkCell* {.importc: "vtkCell".}: VTK_NEWINSTANCE
    Points* {.importc: "Points".}: ptr vtkPoints
    PointIds* {.importc: "PointIds".}: ptr vtkIdList

  vtkCellSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkCell::IsTypeOf(@)",
    header: "vtkCell.h".}
proc IsA*(this: var vtkCell; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkCell.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCell {.
    importcpp: "vtkCell::SafeDownCast(@)", header: "vtkCell.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCell :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCell :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCell :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCell; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCell.h".}
proc Initialize*(this: var vtkCell; npts: cint; pts: ptr vtkIdType; p: ptr vtkPoints) {.
    importcpp: "Initialize", header: "vtkCell.h".}
proc Initialize*(this: var vtkCell; npts: cint; p: ptr vtkPoints) {.
    importcpp: "Initialize", header: "vtkCell.h".}
proc ShallowCopy*(this: var vtkCell; c: ptr vtkCell) {.importcpp: "ShallowCopy",
    header: "vtkCell.h".}
proc DeepCopy*(this: var vtkCell; c: ptr vtkCell) {.importcpp: "DeepCopy",
    header: "vtkCell.h".}
proc GetCellType*(this: var vtkCell): cint {.importcpp: "GetCellType",
                                        header: "vtkCell.h".}
proc GetCellDimension*(this: var vtkCell): cint {.importcpp: "GetCellDimension",
    header: "vtkCell.h".}
proc IsLinear*(this: var vtkCell): cint {.importcpp: "IsLinear", header: "vtkCell.h".}
proc RequiresInitialization*(this: var vtkCell): cint {.
    importcpp: "RequiresInitialization", header: "vtkCell.h".}
proc Initialize*(this: var vtkCell) {.importcpp: "Initialize", header: "vtkCell.h".}
proc IsExplicitCell*(this: var vtkCell): cint {.importcpp: "IsExplicitCell",
    header: "vtkCell.h".}
proc RequiresExplicitFaceRepresentation*(this: var vtkCell): cint {.
    importcpp: "RequiresExplicitFaceRepresentation", header: "vtkCell.h".}
proc SetFaces*(this: var vtkCell; vtkNotUsed: proc (a1: faces): ptr vtkIdType) {.
    importcpp: "SetFaces", header: "vtkCell.h".}
proc GetFaces*(this: var vtkCell): ptr vtkIdType {.importcpp: "GetFaces",
    header: "vtkCell.h".}
proc GetPoints*(this: var vtkCell): ptr vtkPoints {.importcpp: "GetPoints",
    header: "vtkCell.h".}
proc GetNumberOfPoints*(this: vtkCell): vtkIdType {.noSideEffect,
    importcpp: "GetNumberOfPoints", header: "vtkCell.h".}
proc GetNumberOfEdges*(this: var vtkCell): cint {.importcpp: "GetNumberOfEdges",
    header: "vtkCell.h".}
proc GetNumberOfFaces*(this: var vtkCell): cint {.importcpp: "GetNumberOfFaces",
    header: "vtkCell.h".}
proc GetPointIds*(this: var vtkCell): ptr vtkIdList {.importcpp: "GetPointIds",
    header: "vtkCell.h".}
## !!!Ignored construct:  *
##  For cell point i, return the actual point id.
##  vtkIdType GetPointId ( int ptId ) VTK_EXPECTS ( 0 <= ptId && ptId < GetPointIds ( ) -> GetNumberOfIds ( ) ) { return this -> PointIds -> GetId ( ptId ) ; } *
##  Return the edge cell from the edgeId of the cell.
##  virtual vtkCell * GetEdge ( int edgeId ) = 0 ;
## Error: expected ';'!!!

proc GetFace*(this: var vtkCell; faceId: cint): ptr vtkCell {.importcpp: "GetFace",
    header: "vtkCell.h".}
proc CellBoundary*(this: var vtkCell; subId: cint; pcoords: array[3, cdouble];
                  pts: ptr vtkIdList): cint {.importcpp: "CellBoundary",
    header: "vtkCell.h".}
proc EvaluatePosition*(this: var vtkCell; x: array[3, cdouble];
                      closestPoint: array[3, cdouble]; subId: var cint;
                      pcoords: array[3, cdouble]; dist2: var cdouble;
                      weights: ptr cdouble): cint {.importcpp: "EvaluatePosition",
    header: "vtkCell.h".}
proc EvaluateLocation*(this: var vtkCell; subId: var cint; pcoords: array[3, cdouble];
                      x: array[3, cdouble]; weights: ptr cdouble) {.
    importcpp: "EvaluateLocation", header: "vtkCell.h".}
proc Contour*(this: var vtkCell; value: cdouble; cellScalars: ptr vtkDataArray;
             locator: ptr vtkIncrementalPointLocator; verts: ptr vtkCellArray;
             lines: ptr vtkCellArray; polys: ptr vtkCellArray; inPd: ptr vtkPointData;
             outPd: ptr vtkPointData; inCd: ptr vtkCellData; cellId: vtkIdType;
             outCd: ptr vtkCellData) {.importcpp: "Contour", header: "vtkCell.h".}
proc Clip*(this: var vtkCell; value: cdouble; cellScalars: ptr vtkDataArray;
          locator: ptr vtkIncrementalPointLocator; connectivity: ptr vtkCellArray;
          inPd: ptr vtkPointData; outPd: ptr vtkPointData; inCd: ptr vtkCellData;
          cellId: vtkIdType; outCd: ptr vtkCellData; insideOut: cint) {.
    importcpp: "Clip", header: "vtkCell.h".}
proc Inflate*(this: var vtkCell; dist: cdouble): cint {.importcpp: "Inflate",
    header: "vtkCell.h".}
proc ComputeBoundingSphere*(this: vtkCell; center: array[3, cdouble]): cdouble {.
    noSideEffect, importcpp: "ComputeBoundingSphere", header: "vtkCell.h".}
proc IntersectWithLine*(this: var vtkCell; p1: array[3, cdouble];
                       p2: array[3, cdouble]; tol: cdouble; t: var cdouble;
                       x: array[3, cdouble]; pcoords: array[3, cdouble];
                       subId: var cint): cint {.importcpp: "IntersectWithLine",
    header: "vtkCell.h".}
proc IntersectWithCell*(this: var vtkCell; other: ptr vtkCell; tol: cdouble = 0.0): cint {.
    importcpp: "IntersectWithCell", header: "vtkCell.h".}
proc IntersectWithCell*(this: var vtkCell; other: ptr vtkCell;
                       boudingBox: vtkBoundingBox;
                       otherBoundingBox: vtkBoundingBox; tol: cdouble = 0.0): cint {.
    importcpp: "IntersectWithCell", header: "vtkCell.h".}
proc Triangulate*(this: var vtkCell; index: cint; ptIds: ptr vtkIdList;
                 pts: ptr vtkPoints): cint {.importcpp: "Triangulate",
    header: "vtkCell.h".}
proc Derivatives*(this: var vtkCell; subId: cint; pcoords: array[3, cdouble];
                 values: ptr cdouble; dim: cint; derivs: ptr cdouble) {.
    importcpp: "Derivatives", header: "vtkCell.h".}
proc GetBounds*(this: var vtkCell; bounds: array[6, cdouble]) {.importcpp: "GetBounds",
    header: "vtkCell.h".}
## !!!Ignored construct:  *
##  Compute cell bounding box (xmin,xmax,ymin,ymax,zmin,zmax). Return pointer
##  to array of six double values.
##  double * GetBounds ( ) VTK_SIZEHINT ( 6 ) ;
## Error: expected ';'!!!

proc GetLength2*(this: var vtkCell): cdouble {.importcpp: "GetLength2",
    header: "vtkCell.h".}
proc GetParametricCenter*(this: var vtkCell; pcoords: array[3, cdouble]): cint {.
    importcpp: "GetParametricCenter", header: "vtkCell.h".}
proc GetParametricDistance*(this: var vtkCell; pcoords: array[3, cdouble]): cdouble {.
    importcpp: "GetParametricDistance", header: "vtkCell.h".}
proc IsPrimaryCell*(this: var vtkCell): cint {.importcpp: "IsPrimaryCell",
    header: "vtkCell.h".}
## !!!Ignored construct:  *
##  Return a contiguous array of parametric coordinates of the points
##  defining this cell. In other words, (px,py,pz, px,py,pz, etc..)  The
##  coordinates are ordered consistent with the definition of the point
##  ordering for the cell. This method returns a non-nullptr pointer when
##  the cell is a primary type (i.e., IsPrimaryCell() is true). Note that
##  3D parametric coordinates are returned no matter what the topological
##  dimension of the cell.
##  virtual double * GetParametricCoords ( ) VTK_SIZEHINT ( 3 * GetNumberOfPoints ( ) ) ;
## Error: expected ';'!!!

proc InterpolateFunctions*(this: var vtkCell;
                          vtkNotUsed: array[3, proc (a1: pcoords): cdouble];
                          vtkNotUsed: proc (a1: weight): ptr cdouble) {.
    importcpp: "InterpolateFunctions", header: "vtkCell.h".}
proc InterpolateDerivs*(this: var vtkCell;
                       vtkNotUsed: array[3, proc (a1: pcoords): cdouble];
                       vtkNotUsed: proc (a1: derivs): ptr cdouble) {.
    importcpp: "InterpolateDerivs", header: "vtkCell.h".}