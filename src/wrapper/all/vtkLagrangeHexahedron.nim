## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLagrangeHexahedron.h
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
##  @class   vtkLagrangeHexahedron
##  @brief   A 3D cell that represents an arbitrary order Lagrange hex
##
##  vtkLagrangeHexahedron is a concrete implementation of vtkCell to represent a
##  3D hexahedron using Lagrange shape functions of user specified order.
##
##  @sa
##  vtkHexahedron
##

import
  vtkCellType, vtkCommonDataModelModule, vtkHigherOrderHexahedron, vtkNew,
  vtkSmartPointer

discard "forward decl of vtkCellData"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkHexahedron"
discard "forward decl of vtkIdList"
discard "forward decl of vtkLagrangeCurve"
discard "forward decl of vtkLagrangeInterpolation"
discard "forward decl of vtkLagrangeQuadrilateral"
discard "forward decl of vtkPointData"
discard "forward decl of vtkPoints"
discard "forward decl of vtkVector3d"
discard "forward decl of vtkVector3i"
type
  vtkLagrangeHexahedron* {.importcpp: "vtkLagrangeHexahedron",
                          header: "vtkLagrangeHexahedron.h", bycopy.} = object of vtkHigherOrderHexahedron
    vtkLagrangeHexahedron* {.importc: "vtkLagrangeHexahedron".}: VTK_NEWINSTANCE


proc New*(): ptr vtkLagrangeHexahedron {.importcpp: "vtkLagrangeHexahedron::New(@)",
                                     header: "vtkLagrangeHexahedron.h".}
type
  vtkLagrangeHexahedronSuperclass* = vtkHigherOrderHexahedron

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkLagrangeHexahedron::IsTypeOf(@)",
    header: "vtkLagrangeHexahedron.h".}
proc IsA*(this: var vtkLagrangeHexahedron; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkLagrangeHexahedron.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkLagrangeHexahedron {.
    importcpp: "vtkLagrangeHexahedron::SafeDownCast(@)",
    header: "vtkLagrangeHexahedron.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkLagrangeHexahedron :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHigherOrderHexahedron :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLagrangeHexahedron :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLagrangeHexahedron :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkLagrangeHexahedron; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkLagrangeHexahedron.h".}
proc GetCellType*(this: var vtkLagrangeHexahedron): cint {.importcpp: "GetCellType",
    header: "vtkLagrangeHexahedron.h".}
proc GetEdge*(this: var vtkLagrangeHexahedron; edgeId: cint): ptr vtkCell {.
    importcpp: "GetEdge", header: "vtkLagrangeHexahedron.h".}
proc GetFace*(this: var vtkLagrangeHexahedron; faceId: cint): ptr vtkCell {.
    importcpp: "GetFace", header: "vtkLagrangeHexahedron.h".}
proc InterpolateFunctions*(this: var vtkLagrangeHexahedron;
                          pcoords: array[3, cdouble]; weights: ptr cdouble) {.
    importcpp: "InterpolateFunctions", header: "vtkLagrangeHexahedron.h".}
proc InterpolateDerivs*(this: var vtkLagrangeHexahedron; pcoords: array[3, cdouble];
                       derivs: ptr cdouble) {.importcpp: "InterpolateDerivs",
    header: "vtkLagrangeHexahedron.h".}
proc GetEdgeCell*(this: var vtkLagrangeHexahedron): ptr vtkHigherOrderCurve {.
    importcpp: "GetEdgeCell", header: "vtkLagrangeHexahedron.h".}
proc GetFaceCell*(this: var vtkLagrangeHexahedron): ptr vtkHigherOrderQuadrilateral {.
    importcpp: "GetFaceCell", header: "vtkLagrangeHexahedron.h".}
proc GetInterpolation*(this: var vtkLagrangeHexahedron): ptr vtkHigherOrderInterpolation {.
    importcpp: "GetInterpolation", header: "vtkLagrangeHexahedron.h".}