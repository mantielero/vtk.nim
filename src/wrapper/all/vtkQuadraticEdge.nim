## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkQuadraticEdge.h
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
##  @class   vtkQuadraticEdge
##  @brief   cell represents a parabolic, isoparametric edge
##
##  vtkQuadraticEdge is a concrete implementation of vtkNonLinearCell to
##  represent a one-dimensional, 3-nodes, isoparametric parabolic line. The
##  interpolation is the standard finite element, quadratic isoparametric
##  shape function. The cell includes a mid-edge node. The ordering of the
##  three points defining the cell is point ids (0,1,2) where id #2 is the
##  midedge node.
##
##  @sa
##  vtkQuadraticTriangle vtkQuadraticTetra vtkQuadraticWedge
##  vtkQuadraticQuad vtkQuadraticHexahedron vtkQuadraticPyramid
##

import
  vtkCommonDataModelModule, vtkNonLinearCell

discard "forward decl of vtkLine"
discard "forward decl of vtkDoubleArray"
type
  vtkQuadraticEdge* {.importcpp: "vtkQuadraticEdge", header: "vtkQuadraticEdge.h",
                     bycopy.} = object of vtkNonLinearCell
    vtkQuadraticEdge* {.importc: "vtkQuadraticEdge".}: VTK_NEWINSTANCE
    ##  used to avoid New/Delete in contouring/clipping


proc New*(): ptr vtkQuadraticEdge {.importcpp: "vtkQuadraticEdge::New(@)",
                                header: "vtkQuadraticEdge.h".}
type
  vtkQuadraticEdgeSuperclass* = vtkNonLinearCell

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkQuadraticEdge::IsTypeOf(@)", header: "vtkQuadraticEdge.h".}
proc IsA*(this: var vtkQuadraticEdge; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkQuadraticEdge.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkQuadraticEdge {.
    importcpp: "vtkQuadraticEdge::SafeDownCast(@)", header: "vtkQuadraticEdge.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkQuadraticEdge :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkNonLinearCell :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkQuadraticEdge :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkQuadraticEdge :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkQuadraticEdge; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkQuadraticEdge.h".}
proc GetCellType*(this: var vtkQuadraticEdge): cint {.importcpp: "GetCellType",
    header: "vtkQuadraticEdge.h".}
proc GetCellDimension*(this: var vtkQuadraticEdge): cint {.
    importcpp: "GetCellDimension", header: "vtkQuadraticEdge.h".}
proc GetNumberOfEdges*(this: var vtkQuadraticEdge): cint {.
    importcpp: "GetNumberOfEdges", header: "vtkQuadraticEdge.h".}
proc GetNumberOfFaces*(this: var vtkQuadraticEdge): cint {.
    importcpp: "GetNumberOfFaces", header: "vtkQuadraticEdge.h".}
proc GetEdge*(this: var vtkQuadraticEdge; a2: cint): ptr vtkCell {.importcpp: "GetEdge",
    header: "vtkQuadraticEdge.h".}
proc GetFace*(this: var vtkQuadraticEdge; a2: cint): ptr vtkCell {.importcpp: "GetFace",
    header: "vtkQuadraticEdge.h".}
proc CellBoundary*(this: var vtkQuadraticEdge; subId: cint;
                  pcoords: array[3, cdouble]; pts: ptr vtkIdList): cint {.
    importcpp: "CellBoundary", header: "vtkQuadraticEdge.h".}
proc Contour*(this: var vtkQuadraticEdge; value: cdouble;
             cellScalars: ptr vtkDataArray;
             locator: ptr vtkIncrementalPointLocator; verts: ptr vtkCellArray;
             lines: ptr vtkCellArray; polys: ptr vtkCellArray; inPd: ptr vtkPointData;
             outPd: ptr vtkPointData; inCd: ptr vtkCellData; cellId: vtkIdType;
             outCd: ptr vtkCellData) {.importcpp: "Contour",
                                    header: "vtkQuadraticEdge.h".}
proc EvaluatePosition*(this: var vtkQuadraticEdge; x: array[3, cdouble];
                      closestPoint: array[3, cdouble]; subId: var cint;
                      pcoords: array[3, cdouble]; dist2: var cdouble;
                      weights: ptr cdouble): cint {.importcpp: "EvaluatePosition",
    header: "vtkQuadraticEdge.h".}
proc EvaluateLocation*(this: var vtkQuadraticEdge; subId: var cint;
                      pcoords: array[3, cdouble]; x: array[3, cdouble];
                      weights: ptr cdouble) {.importcpp: "EvaluateLocation",
    header: "vtkQuadraticEdge.h".}
proc Triangulate*(this: var vtkQuadraticEdge; index: cint; ptIds: ptr vtkIdList;
                 pts: ptr vtkPoints): cint {.importcpp: "Triangulate",
    header: "vtkQuadraticEdge.h".}
proc Derivatives*(this: var vtkQuadraticEdge; subId: cint; pcoords: array[3, cdouble];
                 values: ptr cdouble; dim: cint; derivs: ptr cdouble) {.
    importcpp: "Derivatives", header: "vtkQuadraticEdge.h".}
proc GetParametricCoords*(this: var vtkQuadraticEdge): ptr cdouble {.
    importcpp: "GetParametricCoords", header: "vtkQuadraticEdge.h".}
proc Clip*(this: var vtkQuadraticEdge; value: cdouble; cellScalars: ptr vtkDataArray;
          locator: ptr vtkIncrementalPointLocator; lines: ptr vtkCellArray;
          inPd: ptr vtkPointData; outPd: ptr vtkPointData; inCd: ptr vtkCellData;
          cellId: vtkIdType; outCd: ptr vtkCellData; insideOut: cint) {.
    importcpp: "Clip", header: "vtkQuadraticEdge.h".}
proc IntersectWithLine*(this: var vtkQuadraticEdge; p1: array[3, cdouble];
                       p2: array[3, cdouble]; tol: cdouble; t: var cdouble;
                       x: array[3, cdouble]; pcoords: array[3, cdouble];
                       subId: var cint): cint {.importcpp: "IntersectWithLine",
    header: "vtkQuadraticEdge.h".}
proc GetParametricCenter*(this: var vtkQuadraticEdge; pcoords: array[3, cdouble]): cint {.
    importcpp: "GetParametricCenter", header: "vtkQuadraticEdge.h".}
proc InterpolationFunctions*(pcoords: array[3, cdouble]; weights: array[3, cdouble]) {.
    importcpp: "vtkQuadraticEdge::InterpolationFunctions(@)",
    header: "vtkQuadraticEdge.h".}
proc InterpolationDerivs*(pcoords: array[3, cdouble]; derivs: array[3, cdouble]) {.
    importcpp: "vtkQuadraticEdge::InterpolationDerivs(@)",
    header: "vtkQuadraticEdge.h".}
proc InterpolateFunctions*(this: var vtkQuadraticEdge; pcoords: array[3, cdouble];
                          weights: array[3, cdouble]) {.
    importcpp: "InterpolateFunctions", header: "vtkQuadraticEdge.h".}
proc InterpolateDerivs*(this: var vtkQuadraticEdge; pcoords: array[3, cdouble];
                       derivs: array[3, cdouble]) {.importcpp: "InterpolateDerivs",
    header: "vtkQuadraticEdge.h".}
## ----------------------------------------------------------------------------

proc GetParametricCenter*(this: var vtkQuadraticEdge; pcoords: array[3, cdouble]): cint {.
    importcpp: "GetParametricCenter", header: "vtkQuadraticEdge.h".}