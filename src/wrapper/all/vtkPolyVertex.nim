## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPolyVertex.h
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
##  @class   vtkPolyVertex
##  @brief   cell represents a set of 0D vertices
##
##  vtkPolyVertex is a concrete implementation of vtkCell to represent a
##  set of 3D vertices.
##

import
  vtkCell, vtkCommonDataModelModule

discard "forward decl of vtkVertex"
discard "forward decl of vtkIncrementalPointLocator"
type
  vtkPolyVertex* {.importcpp: "vtkPolyVertex", header: "vtkPolyVertex.h", bycopy.} = object of vtkCell
    vtkPolyVertex* {.importc: "vtkPolyVertex".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPolyVertex {.importcpp: "vtkPolyVertex::New(@)",
                             header: "vtkPolyVertex.h".}
type
  vtkPolyVertexSuperclass* = vtkCell

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPolyVertex::IsTypeOf(@)", header: "vtkPolyVertex.h".}
proc IsA*(this: var vtkPolyVertex; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkPolyVertex.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPolyVertex {.
    importcpp: "vtkPolyVertex::SafeDownCast(@)", header: "vtkPolyVertex.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPolyVertex :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCell :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPolyVertex :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPolyVertex :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPolyVertex; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPolyVertex.h".}
proc GetCellType*(this: var vtkPolyVertex): cint {.importcpp: "GetCellType",
    header: "vtkPolyVertex.h".}
proc GetCellDimension*(this: var vtkPolyVertex): cint {.
    importcpp: "GetCellDimension", header: "vtkPolyVertex.h".}
proc GetNumberOfEdges*(this: var vtkPolyVertex): cint {.
    importcpp: "GetNumberOfEdges", header: "vtkPolyVertex.h".}
proc GetNumberOfFaces*(this: var vtkPolyVertex): cint {.
    importcpp: "GetNumberOfFaces", header: "vtkPolyVertex.h".}
proc GetEdge*(this: var vtkPolyVertex; vtkNotUsed: proc (a1: edgeId): cint): ptr vtkCell {.
    importcpp: "GetEdge", header: "vtkPolyVertex.h".}
proc GetFace*(this: var vtkPolyVertex; vtkNotUsed: proc (a1: faceId): cint): ptr vtkCell {.
    importcpp: "GetFace", header: "vtkPolyVertex.h".}
proc CellBoundary*(this: var vtkPolyVertex; subId: cint; pcoords: array[3, cdouble];
                  pts: ptr vtkIdList): cint {.importcpp: "CellBoundary",
    header: "vtkPolyVertex.h".}
proc Contour*(this: var vtkPolyVertex; value: cdouble; cellScalars: ptr vtkDataArray;
             locator: ptr vtkIncrementalPointLocator; verts: ptr vtkCellArray;
             lines: ptr vtkCellArray; polys: ptr vtkCellArray; inPd: ptr vtkPointData;
             outPd: ptr vtkPointData; inCd: ptr vtkCellData; cellId: vtkIdType;
             outCd: ptr vtkCellData) {.importcpp: "Contour",
                                    header: "vtkPolyVertex.h".}
proc Clip*(this: var vtkPolyVertex; value: cdouble; cellScalars: ptr vtkDataArray;
          locator: ptr vtkIncrementalPointLocator; verts: ptr vtkCellArray;
          inPd: ptr vtkPointData; outPd: ptr vtkPointData; inCd: ptr vtkCellData;
          cellId: vtkIdType; outCd: ptr vtkCellData; insideOut: cint) {.
    importcpp: "Clip", header: "vtkPolyVertex.h".}
proc EvaluatePosition*(this: var vtkPolyVertex; x: array[3, cdouble];
                      closestPoint: array[3, cdouble]; subId: var cint;
                      pcoords: array[3, cdouble]; dist2: var cdouble;
                      weights: ptr cdouble): cint {.importcpp: "EvaluatePosition",
    header: "vtkPolyVertex.h".}
proc EvaluateLocation*(this: var vtkPolyVertex; subId: var cint;
                      pcoords: array[3, cdouble]; x: array[3, cdouble];
                      weights: ptr cdouble) {.importcpp: "EvaluateLocation",
    header: "vtkPolyVertex.h".}
proc IntersectWithLine*(this: var vtkPolyVertex; p1: array[3, cdouble];
                       p2: array[3, cdouble]; tol: cdouble; t: var cdouble;
                       x: array[3, cdouble]; pcoords: array[3, cdouble];
                       subId: var cint): cint {.importcpp: "IntersectWithLine",
    header: "vtkPolyVertex.h".}
proc Triangulate*(this: var vtkPolyVertex; index: cint; ptIds: ptr vtkIdList;
                 pts: ptr vtkPoints): cint {.importcpp: "Triangulate",
    header: "vtkPolyVertex.h".}
proc Derivatives*(this: var vtkPolyVertex; subId: cint; pcoords: array[3, cdouble];
                 values: ptr cdouble; dim: cint; derivs: ptr cdouble) {.
    importcpp: "Derivatives", header: "vtkPolyVertex.h".}
proc IsPrimaryCell*(this: var vtkPolyVertex): cint {.importcpp: "IsPrimaryCell",
    header: "vtkPolyVertex.h".}
proc GetParametricCenter*(this: var vtkPolyVertex; pcoords: array[3, cdouble]): cint {.
    importcpp: "GetParametricCenter", header: "vtkPolyVertex.h".}