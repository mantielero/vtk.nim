## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCubicLine.h
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
##  @class   vtkCubicLine
##  @brief   cell represents a cubic , isoparametric 1D line
##
##  vtkCubicLine is a concrete implementation of vtkNonLinearCell to represent a 1D Cubic line.
##  The Cubic Line is the 4 nodes isoparametric parabolic line . The
##  interpolation is the standard finite element, cubic isoparametric
##  shape function. The cell includes two mid-edge nodes. The ordering of the
##  four points defining the cell is point ids (0,1,2,3) where id #2 and #3 are the
##  mid-edge nodes. Please note that the parametric coordinates lie between -1 and 1
##  in accordance with most standard documentations.
##  @par Thanks:
##  \verbatim
##  This file has been developed by Oxalya - www.oxalya.com
##  Copyright (c) EDF - www.edf.fr
##  \endverbatim
##

import
  vtkCommonDataModelModule, vtkNonLinearCell

discard "forward decl of vtkLine"
discard "forward decl of vtkDoubleArray"
type
  vtkCubicLine* {.importcpp: "vtkCubicLine", header: "vtkCubicLine.h", bycopy.} = object of vtkNonLinearCell
    vtkCubicLine* {.importc: "vtkCubicLine".}: VTK_NEWINSTANCE
    ##  used to avoid New/Delete in contouring/clipping


proc New*(): ptr vtkCubicLine {.importcpp: "vtkCubicLine::New(@)",
                            header: "vtkCubicLine.h".}
type
  vtkCubicLineSuperclass* = vtkNonLinearCell

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCubicLine::IsTypeOf(@)", header: "vtkCubicLine.h".}
proc IsA*(this: var vtkCubicLine; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkCubicLine.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCubicLine {.
    importcpp: "vtkCubicLine::SafeDownCast(@)", header: "vtkCubicLine.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCubicLine :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkNonLinearCell :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCubicLine :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCubicLine :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCubicLine; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCubicLine.h".}
proc GetCellType*(this: var vtkCubicLine): cint {.importcpp: "GetCellType",
    header: "vtkCubicLine.h".}
proc GetCellDimension*(this: var vtkCubicLine): cint {.importcpp: "GetCellDimension",
    header: "vtkCubicLine.h".}
proc GetNumberOfEdges*(this: var vtkCubicLine): cint {.importcpp: "GetNumberOfEdges",
    header: "vtkCubicLine.h".}
proc GetNumberOfFaces*(this: var vtkCubicLine): cint {.importcpp: "GetNumberOfFaces",
    header: "vtkCubicLine.h".}
proc GetEdge*(this: var vtkCubicLine; a2: cint): ptr vtkCell {.importcpp: "GetEdge",
    header: "vtkCubicLine.h".}
proc GetFace*(this: var vtkCubicLine; a2: cint): ptr vtkCell {.importcpp: "GetFace",
    header: "vtkCubicLine.h".}
proc CellBoundary*(this: var vtkCubicLine; subId: cint; pcoords: array[3, cdouble];
                  pts: ptr vtkIdList): cint {.importcpp: "CellBoundary",
    header: "vtkCubicLine.h".}
proc Contour*(this: var vtkCubicLine; value: cdouble; cellScalars: ptr vtkDataArray;
             locator: ptr vtkIncrementalPointLocator; verts: ptr vtkCellArray;
             lines: ptr vtkCellArray; polys: ptr vtkCellArray; inPd: ptr vtkPointData;
             outPd: ptr vtkPointData; inCd: ptr vtkCellData; cellId: vtkIdType;
             outCd: ptr vtkCellData) {.importcpp: "Contour", header: "vtkCubicLine.h".}
proc EvaluatePosition*(this: var vtkCubicLine; x: array[3, cdouble];
                      closestPoint: array[3, cdouble]; subId: var cint;
                      pcoords: array[3, cdouble]; dist2: var cdouble;
                      weights: ptr cdouble): cint {.importcpp: "EvaluatePosition",
    header: "vtkCubicLine.h".}
proc EvaluateLocation*(this: var vtkCubicLine; subId: var cint;
                      pcoords: array[3, cdouble]; x: array[3, cdouble];
                      weights: ptr cdouble) {.importcpp: "EvaluateLocation",
    header: "vtkCubicLine.h".}
proc Triangulate*(this: var vtkCubicLine; index: cint; ptIds: ptr vtkIdList;
                 pts: ptr vtkPoints): cint {.importcpp: "Triangulate",
    header: "vtkCubicLine.h".}
proc Derivatives*(this: var vtkCubicLine; subId: cint; pcoords: array[3, cdouble];
                 values: ptr cdouble; dim: cint; derivs: ptr cdouble) {.
    importcpp: "Derivatives", header: "vtkCubicLine.h".}
proc GetParametricCoords*(this: var vtkCubicLine): ptr cdouble {.
    importcpp: "GetParametricCoords", header: "vtkCubicLine.h".}
proc GetParametricDistance*(this: var vtkCubicLine; pcoords: array[3, cdouble]): cdouble {.
    importcpp: "GetParametricDistance", header: "vtkCubicLine.h".}
proc Clip*(this: var vtkCubicLine; value: cdouble; cellScalars: ptr vtkDataArray;
          locator: ptr vtkIncrementalPointLocator; lines: ptr vtkCellArray;
          inPd: ptr vtkPointData; outPd: ptr vtkPointData; inCd: ptr vtkCellData;
          cellId: vtkIdType; outCd: ptr vtkCellData; insideOut: cint) {.
    importcpp: "Clip", header: "vtkCubicLine.h".}
proc GetParametricCenter*(this: var vtkCubicLine; pcoords: array[3, cdouble]): cint {.
    importcpp: "GetParametricCenter", header: "vtkCubicLine.h".}
proc IntersectWithLine*(this: var vtkCubicLine; p1: array[3, cdouble];
                       p2: array[3, cdouble]; tol: cdouble; t: var cdouble;
                       x: array[3, cdouble]; pcoords: array[3, cdouble];
                       subId: var cint): cint {.importcpp: "IntersectWithLine",
    header: "vtkCubicLine.h".}
proc InterpolationFunctions*(pcoords: array[3, cdouble]; weights: array[4, cdouble]) {.
    importcpp: "vtkCubicLine::InterpolationFunctions(@)", header: "vtkCubicLine.h".}
proc InterpolationDerivs*(pcoords: array[3, cdouble]; derivs: array[4, cdouble]) {.
    importcpp: "vtkCubicLine::InterpolationDerivs(@)", header: "vtkCubicLine.h".}
proc InterpolateFunctions*(this: var vtkCubicLine; pcoords: array[3, cdouble];
                          weights: array[4, cdouble]) {.
    importcpp: "InterpolateFunctions", header: "vtkCubicLine.h".}
proc InterpolateDerivs*(this: var vtkCubicLine; pcoords: array[3, cdouble];
                       derivs: array[4, cdouble]) {.importcpp: "InterpolateDerivs",
    header: "vtkCubicLine.h".}
## ----------------------------------------------------------------------------

proc GetParametricCenter*(this: var vtkCubicLine; pcoords: array[3, cdouble]): cint {.
    importcpp: "GetParametricCenter", header: "vtkCubicLine.h".}