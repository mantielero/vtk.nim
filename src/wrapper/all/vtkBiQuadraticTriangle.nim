## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBiQuadraticTriangle.h
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
##  @class   vtkBiQuadraticTriangle
##  @brief   cell represents a parabolic, isoparametric triangle
##
##  vtkBiQuadraticTriangle is a concrete implementation of vtkNonLinearCell to
##  represent a two-dimensional, 7-node, isoparametric parabolic triangle. The
##  interpolation is the standard finite element, bi-quadratic isoparametric
##  shape function. The cell includes three mid-edge nodes besides the three
##  triangle vertices and a center node. The ordering of the three points defining the cell is
##  point ids (0-2,3-6) where id #3 is the midedge node between points
##  (0,1); id #4 is the midedge node between points (1,2); and id #5 is the
##  midedge node between points (2,0). id #6 is the center node of the cell.
##
##  @sa
##  vtkTriangle vtkQuadraticTriangle
##  vtkBiQuadraticQuad vtkBiQuadraticQuadraticWedge vtkBiQuadraticQuadraticHexahedron
##  @par Thanks:
##  @verbatim
##  This file has been developed by Oxalya - www.oxalya.com
##  Copyright (c) EDF - www.edf.fr
##  @endverbatim
##

import
  vtkCommonDataModelModule, vtkNonLinearCell

discard "forward decl of vtkQuadraticEdge"
discard "forward decl of vtkTriangle"
discard "forward decl of vtkDoubleArray"
type
  vtkBiQuadraticTriangle* {.importcpp: "vtkBiQuadraticTriangle",
                           header: "vtkBiQuadraticTriangle.h", bycopy.} = object of vtkNonLinearCell
    vtkBiQuadraticTriangle* {.importc: "vtkBiQuadraticTriangle".}: VTK_NEWINSTANCE
    ##  used to avoid New/Delete in contouring/clipping


proc New*(): ptr vtkBiQuadraticTriangle {.importcpp: "vtkBiQuadraticTriangle::New(@)",
                                      header: "vtkBiQuadraticTriangle.h".}
type
  vtkBiQuadraticTriangleSuperclass* = vtkNonLinearCell

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkBiQuadraticTriangle::IsTypeOf(@)",
    header: "vtkBiQuadraticTriangle.h".}
proc IsA*(this: var vtkBiQuadraticTriangle; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkBiQuadraticTriangle.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkBiQuadraticTriangle {.
    importcpp: "vtkBiQuadraticTriangle::SafeDownCast(@)",
    header: "vtkBiQuadraticTriangle.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkBiQuadraticTriangle :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkNonLinearCell :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBiQuadraticTriangle :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBiQuadraticTriangle :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkBiQuadraticTriangle; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkBiQuadraticTriangle.h".}
proc GetCellType*(this: var vtkBiQuadraticTriangle): cint {.importcpp: "GetCellType",
    header: "vtkBiQuadraticTriangle.h".}
proc GetCellDimension*(this: var vtkBiQuadraticTriangle): cint {.
    importcpp: "GetCellDimension", header: "vtkBiQuadraticTriangle.h".}
proc GetNumberOfEdges*(this: var vtkBiQuadraticTriangle): cint {.
    importcpp: "GetNumberOfEdges", header: "vtkBiQuadraticTriangle.h".}
proc GetNumberOfFaces*(this: var vtkBiQuadraticTriangle): cint {.
    importcpp: "GetNumberOfFaces", header: "vtkBiQuadraticTriangle.h".}
proc GetEdge*(this: var vtkBiQuadraticTriangle; edgeId: cint): ptr vtkCell {.
    importcpp: "GetEdge", header: "vtkBiQuadraticTriangle.h".}
proc GetFace*(this: var vtkBiQuadraticTriangle; a2: cint): ptr vtkCell {.
    importcpp: "GetFace", header: "vtkBiQuadraticTriangle.h".}
proc CellBoundary*(this: var vtkBiQuadraticTriangle; subId: cint;
                  pcoords: array[3, cdouble]; pts: ptr vtkIdList): cint {.
    importcpp: "CellBoundary", header: "vtkBiQuadraticTriangle.h".}
proc Contour*(this: var vtkBiQuadraticTriangle; value: cdouble;
             cellScalars: ptr vtkDataArray;
             locator: ptr vtkIncrementalPointLocator; verts: ptr vtkCellArray;
             lines: ptr vtkCellArray; polys: ptr vtkCellArray; inPd: ptr vtkPointData;
             outPd: ptr vtkPointData; inCd: ptr vtkCellData; cellId: vtkIdType;
             outCd: ptr vtkCellData) {.importcpp: "Contour",
                                    header: "vtkBiQuadraticTriangle.h".}
proc EvaluatePosition*(this: var vtkBiQuadraticTriangle; x: array[3, cdouble];
                      closestPoint: array[3, cdouble]; subId: var cint;
                      pcoords: array[3, cdouble]; dist2: var cdouble;
                      weights: ptr cdouble): cint {.importcpp: "EvaluatePosition",
    header: "vtkBiQuadraticTriangle.h".}
proc EvaluateLocation*(this: var vtkBiQuadraticTriangle; subId: var cint;
                      pcoords: array[3, cdouble]; x: array[3, cdouble];
                      weights: ptr cdouble) {.importcpp: "EvaluateLocation",
    header: "vtkBiQuadraticTriangle.h".}
proc Triangulate*(this: var vtkBiQuadraticTriangle; index: cint; ptIds: ptr vtkIdList;
                 pts: ptr vtkPoints): cint {.importcpp: "Triangulate",
    header: "vtkBiQuadraticTriangle.h".}
proc Derivatives*(this: var vtkBiQuadraticTriangle; subId: cint;
                 pcoords: array[3, cdouble]; values: ptr cdouble; dim: cint;
                 derivs: ptr cdouble) {.importcpp: "Derivatives",
                                     header: "vtkBiQuadraticTriangle.h".}
proc GetParametricCoords*(this: var vtkBiQuadraticTriangle): ptr cdouble {.
    importcpp: "GetParametricCoords", header: "vtkBiQuadraticTriangle.h".}
proc Clip*(this: var vtkBiQuadraticTriangle; value: cdouble;
          cellScalars: ptr vtkDataArray; locator: ptr vtkIncrementalPointLocator;
          polys: ptr vtkCellArray; inPd: ptr vtkPointData; outPd: ptr vtkPointData;
          inCd: ptr vtkCellData; cellId: vtkIdType; outCd: ptr vtkCellData;
          insideOut: cint) {.importcpp: "Clip", header: "vtkBiQuadraticTriangle.h".}
proc IntersectWithLine*(this: var vtkBiQuadraticTriangle; p1: array[3, cdouble];
                       p2: array[3, cdouble]; tol: cdouble; t: var cdouble;
                       x: array[3, cdouble]; pcoords: array[3, cdouble];
                       subId: var cint): cint {.importcpp: "IntersectWithLine",
    header: "vtkBiQuadraticTriangle.h".}
proc GetParametricCenter*(this: var vtkBiQuadraticTriangle;
                         pcoords: array[3, cdouble]): cint {.
    importcpp: "GetParametricCenter", header: "vtkBiQuadraticTriangle.h".}
proc GetParametricDistance*(this: var vtkBiQuadraticTriangle;
                           pcoords: array[3, cdouble]): cdouble {.
    importcpp: "GetParametricDistance", header: "vtkBiQuadraticTriangle.h".}
proc InterpolationFunctions*(pcoords: array[3, cdouble]; weights: array[7, cdouble]) {.
    importcpp: "vtkBiQuadraticTriangle::InterpolationFunctions(@)",
    header: "vtkBiQuadraticTriangle.h".}
proc InterpolationDerivs*(pcoords: array[3, cdouble]; derivs: array[14, cdouble]) {.
    importcpp: "vtkBiQuadraticTriangle::InterpolationDerivs(@)",
    header: "vtkBiQuadraticTriangle.h".}
proc InterpolateFunctions*(this: var vtkBiQuadraticTriangle;
                          pcoords: array[3, cdouble]; weights: array[7, cdouble]) {.
    importcpp: "InterpolateFunctions", header: "vtkBiQuadraticTriangle.h".}
proc InterpolateDerivs*(this: var vtkBiQuadraticTriangle;
                       pcoords: array[3, cdouble]; derivs: array[14, cdouble]) {.
    importcpp: "InterpolateDerivs", header: "vtkBiQuadraticTriangle.h".}
## ----------------------------------------------------------------------------

proc GetParametricCenter*(this: var vtkBiQuadraticTriangle;
                         pcoords: array[3, cdouble]): cint {.
    importcpp: "GetParametricCenter", header: "vtkBiQuadraticTriangle.h".}