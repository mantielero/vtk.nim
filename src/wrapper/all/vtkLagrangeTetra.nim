## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLagrangeTetra.h
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
##  @class   vtkLagrangeTetra
##  @brief   A 3D cell that represents an arbitrary order Lagrange tetrahedron
##
##  vtkLagrangeTetra is a concrete implementation of vtkCell to represent a
##  3D tetrahedron using Lagrange shape functions of user specified order.
##
##  The number of points in a Lagrange cell determines the order over which they
##  are iterated relative to the parametric coordinate system of the cell. The
##  first points that are reported are vertices. They appear in the same order in
##  which they would appear in linear cells. Mid-edge points are reported next.
##  They are reported in sequence. For two- and three-dimensional (3D) cells, the
##  following set of points to be reported are face points. Finally, 3D cells
##  report points interior to their volume.
##

import
  vtkCommonDataModelModule, vtkHigherOrderTetra

discard "forward decl of vtkTetra"
discard "forward decl of vtkLagrangeCurve"
discard "forward decl of vtkLagrangeTriangle"
discard "forward decl of vtkDoubleArray"
type
  vtkLagrangeTetra* {.importcpp: "vtkLagrangeTetra", header: "vtkLagrangeTetra.h",
                     bycopy.} = object of vtkHigherOrderTetra
    vtkLagrangeTetra* {.importc: "vtkLagrangeTetra".}: VTK_NEWINSTANCE


proc New*(): ptr vtkLagrangeTetra {.importcpp: "vtkLagrangeTetra::New(@)",
                                header: "vtkLagrangeTetra.h".}
type
  vtkLagrangeTetraSuperclass* = vtkHigherOrderTetra

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkLagrangeTetra::IsTypeOf(@)", header: "vtkLagrangeTetra.h".}
proc IsA*(this: var vtkLagrangeTetra; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkLagrangeTetra.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkLagrangeTetra {.
    importcpp: "vtkLagrangeTetra::SafeDownCast(@)", header: "vtkLagrangeTetra.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkLagrangeTetra :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHigherOrderTetra :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLagrangeTetra :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLagrangeTetra :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkLagrangeTetra; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkLagrangeTetra.h".}
proc GetCellType*(this: var vtkLagrangeTetra): cint {.importcpp: "GetCellType",
    header: "vtkLagrangeTetra.h".}
proc GetEdge*(this: var vtkLagrangeTetra; edgeId: cint): ptr vtkCell {.
    importcpp: "GetEdge", header: "vtkLagrangeTetra.h".}
proc GetFace*(this: var vtkLagrangeTetra; faceId: cint): ptr vtkCell {.
    importcpp: "GetFace", header: "vtkLagrangeTetra.h".}
proc InterpolateFunctions*(this: var vtkLagrangeTetra; pcoords: array[3, cdouble];
                          weights: ptr cdouble) {.
    importcpp: "InterpolateFunctions", header: "vtkLagrangeTetra.h".}
proc InterpolateDerivs*(this: var vtkLagrangeTetra; pcoords: array[3, cdouble];
                       derivs: ptr cdouble) {.importcpp: "InterpolateDerivs",
    header: "vtkLagrangeTetra.h".}
proc GetEdgeCell*(this: var vtkLagrangeTetra): ptr vtkHigherOrderCurve {.
    importcpp: "GetEdgeCell", header: "vtkLagrangeTetra.h".}
proc GetFaceCell*(this: var vtkLagrangeTetra): ptr vtkHigherOrderTriangle {.
    importcpp: "GetFaceCell", header: "vtkLagrangeTetra.h".}