## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLagrangeQuadrilateral.h
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
##  .NAME vtkLagrangeQuadrilateral
##  .SECTION Description
##  .SECTION See Also

import
  vtkCellType, vtkCommonDataModelModule, vtkHigherOrderQuadrilateral, vtkNew,
  vtkSmartPointer

discard "forward decl of vtkCellData"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkIdList"
discard "forward decl of vtkLagrangeCurve"
discard "forward decl of vtkPointData"
discard "forward decl of vtkPoints"
discard "forward decl of vtkQuad"
discard "forward decl of vtkVector3d"
discard "forward decl of vtkVector3i"
type
  vtkLagrangeQuadrilateral* {.importcpp: "vtkLagrangeQuadrilateral",
                             header: "vtkLagrangeQuadrilateral.h", bycopy.} = object of vtkHigherOrderQuadrilateral ##  The version of GetApproximateQuad between Lagrange and Bezier is different because Bezier is
                                                                                                             ##  non-interpolatory
    vtkLagrangeQuadrilateral* {.importc: "vtkLagrangeQuadrilateral".}: VTK_NEWINSTANCE


proc New*(): ptr vtkLagrangeQuadrilateral {.importcpp: "vtkLagrangeQuadrilateral::New(@)",
                                        header: "vtkLagrangeQuadrilateral.h".}
type
  vtkLagrangeQuadrilateralSuperclass* = vtkHigherOrderQuadrilateral

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkLagrangeQuadrilateral::IsTypeOf(@)",
    header: "vtkLagrangeQuadrilateral.h".}
proc IsA*(this: var vtkLagrangeQuadrilateral; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkLagrangeQuadrilateral.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkLagrangeQuadrilateral {.
    importcpp: "vtkLagrangeQuadrilateral::SafeDownCast(@)",
    header: "vtkLagrangeQuadrilateral.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkLagrangeQuadrilateral :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHigherOrderQuadrilateral :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLagrangeQuadrilateral :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLagrangeQuadrilateral :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkLagrangeQuadrilateral; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkLagrangeQuadrilateral.h".}
proc GetCellType*(this: var vtkLagrangeQuadrilateral): cint {.
    importcpp: "GetCellType", header: "vtkLagrangeQuadrilateral.h".}
proc GetEdge*(this: var vtkLagrangeQuadrilateral; edgeId: cint): ptr vtkCell {.
    importcpp: "GetEdge", header: "vtkLagrangeQuadrilateral.h".}
proc InterpolateFunctions*(this: var vtkLagrangeQuadrilateral;
                          pcoords: array[3, cdouble]; weights: ptr cdouble) {.
    importcpp: "InterpolateFunctions", header: "vtkLagrangeQuadrilateral.h".}
proc InterpolateDerivs*(this: var vtkLagrangeQuadrilateral;
                       pcoords: array[3, cdouble]; derivs: ptr cdouble) {.
    importcpp: "InterpolateDerivs", header: "vtkLagrangeQuadrilateral.h".}
proc GetEdgeCell*(this: var vtkLagrangeQuadrilateral): ptr vtkHigherOrderCurve {.
    importcpp: "GetEdgeCell", header: "vtkLagrangeQuadrilateral.h".}