## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGenericCell.h
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
##  @class   vtkGenericCell
##  @brief   provides thread-safe access to cells
##
##  vtkGenericCell is a class that provides access to concrete types of cells.
##  It's main purpose is to allow thread-safe access to cells, supporting
##  the vtkDataSet::GetCell(vtkGenericCell *) method. vtkGenericCell acts
##  like any type of cell, it just dereferences an internal representation.
##  The SetCellType() methods use \#define constants; these are defined in
##  the file vtkCellType.h.
##
##  @sa
##  vtkCell vtkDataSet
##

import
  vtkCell, vtkCommonDataModelModule

type
  vtkGenericCell* {.importcpp: "vtkGenericCell", header: "vtkGenericCell.h", bycopy.} = object of vtkCell ## *
                                                                                                ##  Create handle to any type of cell; by default a vtkEmptyCell.
                                                                                                ##
    vtkGenericCell* {.importc: "vtkGenericCell".}: VTK_NEWINSTANCE


proc New*(): ptr vtkGenericCell {.importcpp: "vtkGenericCell::New(@)",
                              header: "vtkGenericCell.h".}
type
  vtkGenericCellSuperclass* = vtkCell

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGenericCell::IsTypeOf(@)", header: "vtkGenericCell.h".}
proc IsA*(this: var vtkGenericCell; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkGenericCell.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGenericCell {.
    importcpp: "vtkGenericCell::SafeDownCast(@)", header: "vtkGenericCell.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGenericCell :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCell :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGenericCell :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGenericCell :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGenericCell; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGenericCell.h".}
proc SetPoints*(this: var vtkGenericCell; points: ptr vtkPoints) {.
    importcpp: "SetPoints", header: "vtkGenericCell.h".}
proc SetPointIds*(this: var vtkGenericCell; pointIds: ptr vtkIdList) {.
    importcpp: "SetPointIds", header: "vtkGenericCell.h".}
proc ShallowCopy*(this: var vtkGenericCell; c: ptr vtkCell) {.importcpp: "ShallowCopy",
    header: "vtkGenericCell.h".}
proc DeepCopy*(this: var vtkGenericCell; c: ptr vtkCell) {.importcpp: "DeepCopy",
    header: "vtkGenericCell.h".}
proc GetCellType*(this: var vtkGenericCell): cint {.importcpp: "GetCellType",
    header: "vtkGenericCell.h".}
proc GetCellDimension*(this: var vtkGenericCell): cint {.
    importcpp: "GetCellDimension", header: "vtkGenericCell.h".}
proc IsLinear*(this: var vtkGenericCell): cint {.importcpp: "IsLinear",
    header: "vtkGenericCell.h".}
proc RequiresInitialization*(this: var vtkGenericCell): cint {.
    importcpp: "RequiresInitialization", header: "vtkGenericCell.h".}
proc Initialize*(this: var vtkGenericCell) {.importcpp: "Initialize",
    header: "vtkGenericCell.h".}
proc RequiresExplicitFaceRepresentation*(this: var vtkGenericCell): cint {.
    importcpp: "RequiresExplicitFaceRepresentation", header: "vtkGenericCell.h".}
proc SetFaces*(this: var vtkGenericCell; faces: ptr vtkIdType) {.importcpp: "SetFaces",
    header: "vtkGenericCell.h".}
proc GetFaces*(this: var vtkGenericCell): ptr vtkIdType {.importcpp: "GetFaces",
    header: "vtkGenericCell.h".}
proc GetNumberOfEdges*(this: var vtkGenericCell): cint {.
    importcpp: "GetNumberOfEdges", header: "vtkGenericCell.h".}
proc GetNumberOfFaces*(this: var vtkGenericCell): cint {.
    importcpp: "GetNumberOfFaces", header: "vtkGenericCell.h".}
proc GetEdge*(this: var vtkGenericCell; edgeId: cint): ptr vtkCell {.
    importcpp: "GetEdge", header: "vtkGenericCell.h".}
proc GetFace*(this: var vtkGenericCell; faceId: cint): ptr vtkCell {.
    importcpp: "GetFace", header: "vtkGenericCell.h".}
proc CellBoundary*(this: var vtkGenericCell; subId: cint; pcoords: array[3, cdouble];
                  pts: ptr vtkIdList): cint {.importcpp: "CellBoundary",
    header: "vtkGenericCell.h".}
proc EvaluatePosition*(this: var vtkGenericCell; x: array[3, cdouble];
                      closestPoint: array[3, cdouble]; subId: var cint;
                      pcoords: array[3, cdouble]; dist2: var cdouble;
                      weights: ptr cdouble): cint {.importcpp: "EvaluatePosition",
    header: "vtkGenericCell.h".}
proc EvaluateLocation*(this: var vtkGenericCell; subId: var cint;
                      pcoords: array[3, cdouble]; x: array[3, cdouble];
                      weights: ptr cdouble) {.importcpp: "EvaluateLocation",
    header: "vtkGenericCell.h".}
proc Contour*(this: var vtkGenericCell; value: cdouble; cellScalars: ptr vtkDataArray;
             locator: ptr vtkIncrementalPointLocator; verts: ptr vtkCellArray;
             lines: ptr vtkCellArray; polys: ptr vtkCellArray; inPd: ptr vtkPointData;
             outPd: ptr vtkPointData; inCd: ptr vtkCellData; cellId: vtkIdType;
             outCd: ptr vtkCellData) {.importcpp: "Contour",
                                    header: "vtkGenericCell.h".}
proc Clip*(this: var vtkGenericCell; value: cdouble; cellScalars: ptr vtkDataArray;
          locator: ptr vtkIncrementalPointLocator; connectivity: ptr vtkCellArray;
          inPd: ptr vtkPointData; outPd: ptr vtkPointData; inCd: ptr vtkCellData;
          cellId: vtkIdType; outCd: ptr vtkCellData; insideOut: cint) {.
    importcpp: "Clip", header: "vtkGenericCell.h".}
proc IntersectWithLine*(this: var vtkGenericCell; p1: array[3, cdouble];
                       p2: array[3, cdouble]; tol: cdouble; t: var cdouble;
                       x: array[3, cdouble]; pcoords: array[3, cdouble];
                       subId: var cint): cint {.importcpp: "IntersectWithLine",
    header: "vtkGenericCell.h".}
proc Triangulate*(this: var vtkGenericCell; index: cint; ptIds: ptr vtkIdList;
                 pts: ptr vtkPoints): cint {.importcpp: "Triangulate",
    header: "vtkGenericCell.h".}
proc Derivatives*(this: var vtkGenericCell; subId: cint; pcoords: array[3, cdouble];
                 values: ptr cdouble; dim: cint; derivs: ptr cdouble) {.
    importcpp: "Derivatives", header: "vtkGenericCell.h".}
proc GetParametricCenter*(this: var vtkGenericCell; pcoords: array[3, cdouble]): cint {.
    importcpp: "GetParametricCenter", header: "vtkGenericCell.h".}
proc GetParametricCoords*(this: var vtkGenericCell): ptr cdouble {.
    importcpp: "GetParametricCoords", header: "vtkGenericCell.h".}
proc IsPrimaryCell*(this: var vtkGenericCell): cint {.importcpp: "IsPrimaryCell",
    header: "vtkGenericCell.h".}
proc InterpolateFunctions*(this: var vtkGenericCell; pcoords: array[3, cdouble];
                          weights: ptr cdouble) {.
    importcpp: "InterpolateFunctions", header: "vtkGenericCell.h".}
proc InterpolateDerivs*(this: var vtkGenericCell; pcoords: array[3, cdouble];
                       derivs: ptr cdouble) {.importcpp: "InterpolateDerivs",
    header: "vtkGenericCell.h".}
proc SetCellType*(this: var vtkGenericCell; cellType: cint) {.
    importcpp: "SetCellType", header: "vtkGenericCell.h".}
proc SetCellTypeToEmptyCell*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToEmptyCell", header: "vtkGenericCell.h".}
proc SetCellTypeToVertex*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToVertex", header: "vtkGenericCell.h".}
proc SetCellTypeToPolyVertex*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToPolyVertex", header: "vtkGenericCell.h".}
proc SetCellTypeToLine*(this: var vtkGenericCell) {.importcpp: "SetCellTypeToLine",
    header: "vtkGenericCell.h".}
proc SetCellTypeToPolyLine*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToPolyLine", header: "vtkGenericCell.h".}
proc SetCellTypeToTriangle*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToTriangle", header: "vtkGenericCell.h".}
proc SetCellTypeToTriangleStrip*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToTriangleStrip", header: "vtkGenericCell.h".}
proc SetCellTypeToPolygon*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToPolygon", header: "vtkGenericCell.h".}
proc SetCellTypeToPixel*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToPixel", header: "vtkGenericCell.h".}
proc SetCellTypeToQuad*(this: var vtkGenericCell) {.importcpp: "SetCellTypeToQuad",
    header: "vtkGenericCell.h".}
proc SetCellTypeToTetra*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToTetra", header: "vtkGenericCell.h".}
proc SetCellTypeToVoxel*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToVoxel", header: "vtkGenericCell.h".}
proc SetCellTypeToHexahedron*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToHexahedron", header: "vtkGenericCell.h".}
proc SetCellTypeToWedge*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToWedge", header: "vtkGenericCell.h".}
proc SetCellTypeToPyramid*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToPyramid", header: "vtkGenericCell.h".}
proc SetCellTypeToPentagonalPrism*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToPentagonalPrism", header: "vtkGenericCell.h".}
proc SetCellTypeToHexagonalPrism*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToHexagonalPrism", header: "vtkGenericCell.h".}
proc SetCellTypeToPolyhedron*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToPolyhedron", header: "vtkGenericCell.h".}
proc SetCellTypeToConvexPointSet*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToConvexPointSet", header: "vtkGenericCell.h".}
proc SetCellTypeToQuadraticEdge*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToQuadraticEdge", header: "vtkGenericCell.h".}
proc SetCellTypeToCubicLine*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToCubicLine", header: "vtkGenericCell.h".}
proc SetCellTypeToQuadraticTriangle*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToQuadraticTriangle", header: "vtkGenericCell.h".}
proc SetCellTypeToBiQuadraticTriangle*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToBiQuadraticTriangle", header: "vtkGenericCell.h".}
proc SetCellTypeToQuadraticQuad*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToQuadraticQuad", header: "vtkGenericCell.h".}
proc SetCellTypeToQuadraticPolygon*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToQuadraticPolygon", header: "vtkGenericCell.h".}
proc SetCellTypeToQuadraticTetra*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToQuadraticTetra", header: "vtkGenericCell.h".}
proc SetCellTypeToQuadraticHexahedron*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToQuadraticHexahedron", header: "vtkGenericCell.h".}
proc SetCellTypeToQuadraticWedge*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToQuadraticWedge", header: "vtkGenericCell.h".}
proc SetCellTypeToQuadraticPyramid*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToQuadraticPyramid", header: "vtkGenericCell.h".}
proc SetCellTypeToQuadraticLinearQuad*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToQuadraticLinearQuad", header: "vtkGenericCell.h".}
proc SetCellTypeToBiQuadraticQuad*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToBiQuadraticQuad", header: "vtkGenericCell.h".}
proc SetCellTypeToQuadraticLinearWedge*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToQuadraticLinearWedge", header: "vtkGenericCell.h".}
proc SetCellTypeToBiQuadraticQuadraticWedge*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToBiQuadraticQuadraticWedge",
    header: "vtkGenericCell.h".}
proc SetCellTypeToTriQuadraticHexahedron*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToTriQuadraticHexahedron", header: "vtkGenericCell.h".}
proc SetCellTypeToTriQuadraticPyramid*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToTriQuadraticPyramid", header: "vtkGenericCell.h".}
proc SetCellTypeToBiQuadraticQuadraticHexahedron*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToBiQuadraticQuadraticHexahedron",
    header: "vtkGenericCell.h".}
proc SetCellTypeToLagrangeTriangle*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToLagrangeTriangle", header: "vtkGenericCell.h".}
proc SetCellTypeToLagrangeTetra*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToLagrangeTetra", header: "vtkGenericCell.h".}
proc SetCellTypeToLagrangeCurve*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToLagrangeCurve", header: "vtkGenericCell.h".}
proc SetCellTypeToLagrangeQuadrilateral*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToLagrangeQuadrilateral", header: "vtkGenericCell.h".}
proc SetCellTypeToLagrangeHexahedron*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToLagrangeHexahedron", header: "vtkGenericCell.h".}
proc SetCellTypeToLagrangeWedge*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToLagrangeWedge", header: "vtkGenericCell.h".}
proc SetCellTypeToBezierTriangle*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToBezierTriangle", header: "vtkGenericCell.h".}
proc SetCellTypeToBezierTetra*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToBezierTetra", header: "vtkGenericCell.h".}
proc SetCellTypeToBezierCurve*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToBezierCurve", header: "vtkGenericCell.h".}
proc SetCellTypeToBezierQuadrilateral*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToBezierQuadrilateral", header: "vtkGenericCell.h".}
proc SetCellTypeToBezierHexahedron*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToBezierHexahedron", header: "vtkGenericCell.h".}
proc SetCellTypeToBezierWedge*(this: var vtkGenericCell) {.
    importcpp: "SetCellTypeToBezierWedge", header: "vtkGenericCell.h".}
proc InstantiateCell*(cellType: cint): ptr vtkCell {.
    importcpp: "vtkGenericCell::InstantiateCell(@)", header: "vtkGenericCell.h".}
proc GetRepresentativeCell*(this: var vtkGenericCell): ptr vtkCell {.
    importcpp: "GetRepresentativeCell", header: "vtkGenericCell.h".}