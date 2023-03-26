## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLagrangeWedge.h
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
##  @class   vtkLagrangeWedge
##  @brief   A 3D cell that represents an arbitrary order Lagrange wedge
##
##  vtkLagrangeWedge is a concrete implementation of vtkCell to represent a
##  3D wedge using Lagrange shape functions of user specified order.
##  A wedge consists of two triangular and three quadrilateral faces.
##  The first six points of the wedge (0-5) are the "corner" points
##  where the first three points are the base of the wedge. This wedge
##  point ordering is opposite the vtkWedge ordering though in that
##  the base of the wedge defined by the first three points (0,1,2) form
##  a triangle whose normal points inward (toward the triangular face (3,4,5)).
##  While this is opposite the vtkWedge convention it is consistent with
##  every other cell type in VTK. The first 2 parametric coordinates of the
##  Lagrange wedge or for the triangular base and vary between 0 and 1. The
##  third parametric coordinate is between the two triangular faces and goes
##  from 0 to 1 as well.
##

import
  vtkCellType, vtkCommonDataModelModule, vtkHigherOrderWedge, vtkNew,
  vtkSmartPointer

discard "forward decl of vtkCellData"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkWedge"
discard "forward decl of vtkIdList"
discard "forward decl of vtkPointData"
discard "forward decl of vtkPoints"
discard "forward decl of vtkVector3d"
discard "forward decl of vtkVector3i"
discard "forward decl of vtkLagrangeCurve"
discard "forward decl of vtkLagrangeInterpolation"
discard "forward decl of vtkLagrangeQuadrilateral"
discard "forward decl of vtkLagrangeTriangle"
type
  vtkLagrangeWedge* {.importcpp: "vtkLagrangeWedge", header: "vtkLagrangeWedge.h",
                     bycopy.} = object of vtkHigherOrderWedge
    vtkLagrangeWedge* {.importc: "vtkLagrangeWedge".}: VTK_NEWINSTANCE


proc New*(): ptr vtkLagrangeWedge {.importcpp: "vtkLagrangeWedge::New(@)",
                                header: "vtkLagrangeWedge.h".}
type
  vtkLagrangeWedgeSuperclass* = vtkHigherOrderWedge

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkLagrangeWedge::IsTypeOf(@)", header: "vtkLagrangeWedge.h".}
proc IsA*(this: var vtkLagrangeWedge; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkLagrangeWedge.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkLagrangeWedge {.
    importcpp: "vtkLagrangeWedge::SafeDownCast(@)", header: "vtkLagrangeWedge.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkLagrangeWedge :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHigherOrderWedge :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLagrangeWedge :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLagrangeWedge :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkLagrangeWedge; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkLagrangeWedge.h".}
proc GetCellType*(this: var vtkLagrangeWedge): cint {.importcpp: "GetCellType",
    header: "vtkLagrangeWedge.h".}
proc GetEdge*(this: var vtkLagrangeWedge; edgeId: cint): ptr vtkCell {.
    importcpp: "GetEdge", header: "vtkLagrangeWedge.h".}
proc GetFace*(this: var vtkLagrangeWedge; faceId: cint): ptr vtkCell {.
    importcpp: "GetFace", header: "vtkLagrangeWedge.h".}
proc InterpolateFunctions*(this: var vtkLagrangeWedge; pcoords: array[3, cdouble];
                          weights: ptr cdouble) {.
    importcpp: "InterpolateFunctions", header: "vtkLagrangeWedge.h".}
proc InterpolateDerivs*(this: var vtkLagrangeWedge; pcoords: array[3, cdouble];
                       derivs: ptr cdouble) {.importcpp: "InterpolateDerivs",
    header: "vtkLagrangeWedge.h".}
proc GetBoundaryQuad*(this: var vtkLagrangeWedge): ptr vtkHigherOrderQuadrilateral {.
    importcpp: "GetBoundaryQuad", header: "vtkLagrangeWedge.h".}
proc GetBoundaryTri*(this: var vtkLagrangeWedge): ptr vtkHigherOrderTriangle {.
    importcpp: "GetBoundaryTri", header: "vtkLagrangeWedge.h".}
proc GetEdgeCell*(this: var vtkLagrangeWedge): ptr vtkHigherOrderCurve {.
    importcpp: "GetEdgeCell", header: "vtkLagrangeWedge.h".}
proc GetInterpolation*(this: var vtkLagrangeWedge): ptr vtkHigherOrderInterpolation {.
    importcpp: "GetInterpolation", header: "vtkLagrangeWedge.h".}