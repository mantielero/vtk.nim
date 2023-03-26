## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPolyLine.h
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
##  @class   vtkPolyLine
##  @brief   cell represents a set of 1D lines
##
##  vtkPolyLine is a concrete implementation of vtkCell to represent a set
##  of 1D lines.
##

import
  vtkCell, vtkCommonDataModelModule

discard "forward decl of vtkPoints"
discard "forward decl of vtkCellArray"
discard "forward decl of vtkLine"
discard "forward decl of vtkDataArray"
discard "forward decl of vtkIncrementalPointLocator"
discard "forward decl of vtkCellData"
type
  vtkPolyLine* {.importcpp: "vtkPolyLine", header: "vtkPolyLine.h", bycopy.} = object of vtkCell
    vtkPolyLine* {.importc: "vtkPolyLine".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPolyLine {.importcpp: "vtkPolyLine::New(@)",
                           header: "vtkPolyLine.h".}
type
  vtkPolyLineSuperclass* = vtkCell

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPolyLine::IsTypeOf(@)", header: "vtkPolyLine.h".}
proc IsA*(this: var vtkPolyLine; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkPolyLine.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPolyLine {.
    importcpp: "vtkPolyLine::SafeDownCast(@)", header: "vtkPolyLine.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPolyLine :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCell :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPolyLine :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPolyLine :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPolyLine; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPolyLine.h".}
proc GenerateSlidingNormals*(pts: ptr vtkPoints; lines: ptr vtkCellArray;
                            normals: ptr vtkDataArray): cint {.
    importcpp: "vtkPolyLine::GenerateSlidingNormals(@)", header: "vtkPolyLine.h".}
proc GenerateSlidingNormals*(pts: ptr vtkPoints; lines: ptr vtkCellArray;
                            normals: ptr vtkDataArray; firstNormal: ptr cdouble;
                            threading: bool = false): cint {.
    importcpp: "vtkPolyLine::GenerateSlidingNormals(@)", header: "vtkPolyLine.h".}
proc GetCellType*(this: var vtkPolyLine): cint {.importcpp: "GetCellType",
    header: "vtkPolyLine.h".}
proc GetCellDimension*(this: var vtkPolyLine): cint {.importcpp: "GetCellDimension",
    header: "vtkPolyLine.h".}
proc GetNumberOfEdges*(this: var vtkPolyLine): cint {.importcpp: "GetNumberOfEdges",
    header: "vtkPolyLine.h".}
proc GetNumberOfFaces*(this: var vtkPolyLine): cint {.importcpp: "GetNumberOfFaces",
    header: "vtkPolyLine.h".}
proc GetEdge*(this: var vtkPolyLine; vtkNotUsed: proc (a1: edgeId): cint): ptr vtkCell {.
    importcpp: "GetEdge", header: "vtkPolyLine.h".}
proc GetFace*(this: var vtkPolyLine; vtkNotUsed: proc (a1: faceId): cint): ptr vtkCell {.
    importcpp: "GetFace", header: "vtkPolyLine.h".}
proc CellBoundary*(this: var vtkPolyLine; subId: cint; pcoords: array[3, cdouble];
                  pts: ptr vtkIdList): cint {.importcpp: "CellBoundary",
    header: "vtkPolyLine.h".}
proc Contour*(this: var vtkPolyLine; value: cdouble; cellScalars: ptr vtkDataArray;
             locator: ptr vtkIncrementalPointLocator; verts: ptr vtkCellArray;
             lines: ptr vtkCellArray; polys: ptr vtkCellArray; inPd: ptr vtkPointData;
             outPd: ptr vtkPointData; inCd: ptr vtkCellData; cellId: vtkIdType;
             outCd: ptr vtkCellData) {.importcpp: "Contour", header: "vtkPolyLine.h".}
proc Clip*(this: var vtkPolyLine; value: cdouble; cellScalars: ptr vtkDataArray;
          locator: ptr vtkIncrementalPointLocator; lines: ptr vtkCellArray;
          inPd: ptr vtkPointData; outPd: ptr vtkPointData; inCd: ptr vtkCellData;
          cellId: vtkIdType; outCd: ptr vtkCellData; insideOut: cint) {.
    importcpp: "Clip", header: "vtkPolyLine.h".}
proc EvaluatePosition*(this: var vtkPolyLine; x: array[3, cdouble];
                      closestPoint: array[3, cdouble]; subId: var cint;
                      pcoords: array[3, cdouble]; dist2: var cdouble;
                      weights: ptr cdouble): cint {.importcpp: "EvaluatePosition",
    header: "vtkPolyLine.h".}
proc EvaluateLocation*(this: var vtkPolyLine; subId: var cint;
                      pcoords: array[3, cdouble]; x: array[3, cdouble];
                      weights: ptr cdouble) {.importcpp: "EvaluateLocation",
    header: "vtkPolyLine.h".}
proc IntersectWithLine*(this: var vtkPolyLine; p1: array[3, cdouble];
                       p2: array[3, cdouble]; tol: cdouble; t: var cdouble;
                       x: array[3, cdouble]; pcoords: array[3, cdouble];
                       subId: var cint): cint {.importcpp: "IntersectWithLine",
    header: "vtkPolyLine.h".}
proc Triangulate*(this: var vtkPolyLine; index: cint; ptIds: ptr vtkIdList;
                 pts: ptr vtkPoints): cint {.importcpp: "Triangulate",
    header: "vtkPolyLine.h".}
proc Derivatives*(this: var vtkPolyLine; subId: cint; pcoords: array[3, cdouble];
                 values: ptr cdouble; dim: cint; derivs: ptr cdouble) {.
    importcpp: "Derivatives", header: "vtkPolyLine.h".}
proc IsPrimaryCell*(this: var vtkPolyLine): cint {.importcpp: "IsPrimaryCell",
    header: "vtkPolyLine.h".}
proc GetParametricCenter*(this: var vtkPolyLine; pcoords: array[3, cdouble]): cint {.
    importcpp: "GetParametricCenter", header: "vtkPolyLine.h".}