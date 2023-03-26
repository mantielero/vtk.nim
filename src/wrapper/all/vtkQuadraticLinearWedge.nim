## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkQuadraticLinearWedge.h
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
##  @class   vtkQuadraticLinearWedge
##  @brief   cell represents a, 12-node isoparametric wedge
##
##  vtkQuadraticLinearWedge is a concrete implementation of vtkNonLinearCell to
##  represent a three-dimensional, 12-node isoparametric linear quadratic
##  wedge. The interpolation is the standard finite element, quadratic
##  isoparametric shape function in xy - layer and the linear functions in z - direction.
##  The cell includes mid-edge node in the triangle edges. The
##  ordering of the 12 points defining the cell is point ids (0-5,6-12)
##  where point ids 0-5 are the six corner vertices of the wedge; followed by
##  six midedge nodes (6-12). Note that these midedge nodes correspond lie
##  on the edges defined by (0,1), (1,2), (2,0), (3,4), (4,5), (5,3).
##  The Edges (0,3), (1,4), (2,5) don't have midedge nodes.
##
##  @sa
##  vtkQuadraticEdge vtkQuadraticTriangle vtkQuadraticTetra
##  vtkQuadraticHexahedron vtkQuadraticQuad vtkQuadraticPyramid
##
##  @par Thanks:
##  Thanks to Soeren Gebbert who developed this class and
##  integrated it into VTK 5.0.
##

import
  vtkCommonDataModelModule, vtkNonLinearCell

discard "forward decl of vtkQuadraticEdge"
discard "forward decl of vtkLine"
discard "forward decl of vtkQuadraticLinearQuad"
discard "forward decl of vtkQuadraticTriangle"
discard "forward decl of vtkWedge"
discard "forward decl of vtkDoubleArray"
type
  vtkQuadraticLinearWedge* {.importcpp: "vtkQuadraticLinearWedge",
                            header: "vtkQuadraticLinearWedge.h", bycopy.} = object of vtkNonLinearCell
    vtkQuadraticLinearWedge* {.importc: "vtkQuadraticLinearWedge".}: VTK_NEWINSTANCE
    ##  used to avoid New/Delete in contouring/clipping


proc New*(): ptr vtkQuadraticLinearWedge {.importcpp: "vtkQuadraticLinearWedge::New(@)",
                                       header: "vtkQuadraticLinearWedge.h".}
type
  vtkQuadraticLinearWedgeSuperclass* = vtkNonLinearCell

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkQuadraticLinearWedge::IsTypeOf(@)",
    header: "vtkQuadraticLinearWedge.h".}
proc IsA*(this: var vtkQuadraticLinearWedge; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkQuadraticLinearWedge.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkQuadraticLinearWedge {.
    importcpp: "vtkQuadraticLinearWedge::SafeDownCast(@)",
    header: "vtkQuadraticLinearWedge.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkQuadraticLinearWedge :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkNonLinearCell :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkQuadraticLinearWedge :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkQuadraticLinearWedge :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkQuadraticLinearWedge; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkQuadraticLinearWedge.h".}
proc GetCellType*(this: var vtkQuadraticLinearWedge): cint {.
    importcpp: "GetCellType", header: "vtkQuadraticLinearWedge.h".}
proc GetCellDimension*(this: var vtkQuadraticLinearWedge): cint {.
    importcpp: "GetCellDimension", header: "vtkQuadraticLinearWedge.h".}
proc GetNumberOfEdges*(this: var vtkQuadraticLinearWedge): cint {.
    importcpp: "GetNumberOfEdges", header: "vtkQuadraticLinearWedge.h".}
proc GetNumberOfFaces*(this: var vtkQuadraticLinearWedge): cint {.
    importcpp: "GetNumberOfFaces", header: "vtkQuadraticLinearWedge.h".}
proc GetEdge*(this: var vtkQuadraticLinearWedge; edgeId: cint): ptr vtkCell {.
    importcpp: "GetEdge", header: "vtkQuadraticLinearWedge.h".}
proc GetFace*(this: var vtkQuadraticLinearWedge; faceId: cint): ptr vtkCell {.
    importcpp: "GetFace", header: "vtkQuadraticLinearWedge.h".}
proc CellBoundary*(this: var vtkQuadraticLinearWedge; subId: cint;
                  pcoords: array[3, cdouble]; pts: ptr vtkIdList): cint {.
    importcpp: "CellBoundary", header: "vtkQuadraticLinearWedge.h".}
proc Contour*(this: var vtkQuadraticLinearWedge; value: cdouble;
             cellScalars: ptr vtkDataArray;
             locator: ptr vtkIncrementalPointLocator; verts: ptr vtkCellArray;
             lines: ptr vtkCellArray; polys: ptr vtkCellArray; inPd: ptr vtkPointData;
             outPd: ptr vtkPointData; inCd: ptr vtkCellData; cellId: vtkIdType;
             outCd: ptr vtkCellData) {.importcpp: "Contour",
                                    header: "vtkQuadraticLinearWedge.h".}
proc EvaluatePosition*(this: var vtkQuadraticLinearWedge; x: array[3, cdouble];
                      closestPoint: ptr cdouble; subId: var cint;
                      pcoords: array[3, cdouble]; dist2: var cdouble;
                      weights: ptr cdouble): cint {.importcpp: "EvaluatePosition",
    header: "vtkQuadraticLinearWedge.h".}
proc EvaluateLocation*(this: var vtkQuadraticLinearWedge; subId: var cint;
                      pcoords: array[3, cdouble]; x: array[3, cdouble];
                      weights: ptr cdouble) {.importcpp: "EvaluateLocation",
    header: "vtkQuadraticLinearWedge.h".}
proc Triangulate*(this: var vtkQuadraticLinearWedge; index: cint;
                 ptIds: ptr vtkIdList; pts: ptr vtkPoints): cint {.
    importcpp: "Triangulate", header: "vtkQuadraticLinearWedge.h".}
proc Derivatives*(this: var vtkQuadraticLinearWedge; subId: cint;
                 pcoords: array[3, cdouble]; values: ptr cdouble; dim: cint;
                 derivs: ptr cdouble) {.importcpp: "Derivatives",
                                     header: "vtkQuadraticLinearWedge.h".}
proc GetParametricCoords*(this: var vtkQuadraticLinearWedge): ptr cdouble {.
    importcpp: "GetParametricCoords", header: "vtkQuadraticLinearWedge.h".}
proc Clip*(this: var vtkQuadraticLinearWedge; value: cdouble;
          cellScalars: ptr vtkDataArray; locator: ptr vtkIncrementalPointLocator;
          tetras: ptr vtkCellArray; inPd: ptr vtkPointData; outPd: ptr vtkPointData;
          inCd: ptr vtkCellData; cellId: vtkIdType; outCd: ptr vtkCellData;
          insideOut: cint) {.importcpp: "Clip", header: "vtkQuadraticLinearWedge.h".}
proc IntersectWithLine*(this: var vtkQuadraticLinearWedge; p1: array[3, cdouble];
                       p2: array[3, cdouble]; tol: cdouble; t: var cdouble;
                       x: array[3, cdouble]; pcoords: array[3, cdouble];
                       subId: var cint): cint {.importcpp: "IntersectWithLine",
    header: "vtkQuadraticLinearWedge.h".}
proc GetParametricCenter*(this: var vtkQuadraticLinearWedge;
                         pcoords: array[3, cdouble]): cint {.
    importcpp: "GetParametricCenter", header: "vtkQuadraticLinearWedge.h".}
proc InterpolationFunctions*(pcoords: array[3, cdouble]; weights: array[15, cdouble]) {.
    importcpp: "vtkQuadraticLinearWedge::InterpolationFunctions(@)",
    header: "vtkQuadraticLinearWedge.h".}
proc InterpolationDerivs*(pcoords: array[3, cdouble]; derivs: array[45, cdouble]) {.
    importcpp: "vtkQuadraticLinearWedge::InterpolationDerivs(@)",
    header: "vtkQuadraticLinearWedge.h".}
proc InterpolateFunctions*(this: var vtkQuadraticLinearWedge;
                          pcoords: array[3, cdouble]; weights: array[15, cdouble]) {.
    importcpp: "InterpolateFunctions", header: "vtkQuadraticLinearWedge.h".}
proc InterpolateDerivs*(this: var vtkQuadraticLinearWedge;
                       pcoords: array[3, cdouble]; derivs: array[45, cdouble]) {.
    importcpp: "InterpolateDerivs", header: "vtkQuadraticLinearWedge.h".}
proc GetEdgeArray*(edgeId: vtkIdType): ptr vtkIdType {.
    importcpp: "vtkQuadraticLinearWedge::GetEdgeArray(@)",
    header: "vtkQuadraticLinearWedge.h".}
proc GetFaceArray*(faceId: vtkIdType): ptr vtkIdType {.
    importcpp: "vtkQuadraticLinearWedge::GetFaceArray(@)",
    header: "vtkQuadraticLinearWedge.h".}
proc JacobianInverse*(this: var vtkQuadraticLinearWedge; pcoords: array[3, cdouble];
                     inverse: ptr ptr cdouble; derivs: array[45, cdouble]) {.
    importcpp: "JacobianInverse", header: "vtkQuadraticLinearWedge.h".}
## ----------------------------------------------------------------------------
##  Return the center of the quadratic wedge in parametric coordinates.

proc GetParametricCenter*(this: var vtkQuadraticLinearWedge;
                         pcoords: array[3, cdouble]): cint {.
    importcpp: "GetParametricCenter", header: "vtkQuadraticLinearWedge.h".}