## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBezierQuadrilateral.h
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
##  .NAME vtkBezierQuadrilateral
##  .SECTION Description
##  .SECTION See Also

import
  vtkCellType, vtkCommonDataModelModule, vtkDeprecation,
  vtkHigherOrderQuadrilateral, vtkNew, vtkSmartPointer

discard "forward decl of vtkCellData"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkIdList"
discard "forward decl of vtkBezierCurve"
discard "forward decl of vtkPointData"
discard "forward decl of vtkPoints"
discard "forward decl of vtkQuad"
discard "forward decl of vtkVector3d"
discard "forward decl of vtkVector3i"
discard "forward decl of vtkDataSet"
type
  vtkBezierQuadrilateral* {.importcpp: "vtkBezierQuadrilateral",
                           header: "vtkBezierQuadrilateral.h", bycopy.} = object of vtkHigherOrderQuadrilateral ##  The version of GetApproximateQuad between Lagrange and Bezier is different because Bezier is
                                                                                                         ##  non-interpolatory
    vtkBezierQuadrilateral* {.importc: "vtkBezierQuadrilateral".}: VTK_NEWINSTANCE


proc New*(): ptr vtkBezierQuadrilateral {.importcpp: "vtkBezierQuadrilateral::New(@)",
                                      header: "vtkBezierQuadrilateral.h".}
type
  vtkBezierQuadrilateralSuperclass* = vtkHigherOrderQuadrilateral

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkBezierQuadrilateral::IsTypeOf(@)",
    header: "vtkBezierQuadrilateral.h".}
proc IsA*(this: var vtkBezierQuadrilateral; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkBezierQuadrilateral.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkBezierQuadrilateral {.
    importcpp: "vtkBezierQuadrilateral::SafeDownCast(@)",
    header: "vtkBezierQuadrilateral.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkBezierQuadrilateral :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHigherOrderQuadrilateral :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBezierQuadrilateral :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBezierQuadrilateral :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkBezierQuadrilateral; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkBezierQuadrilateral.h".}
proc GetCellType*(this: var vtkBezierQuadrilateral): cint {.importcpp: "GetCellType",
    header: "vtkBezierQuadrilateral.h".}
proc GetEdge*(this: var vtkBezierQuadrilateral; edgeId: cint): ptr vtkCell {.
    importcpp: "GetEdge", header: "vtkBezierQuadrilateral.h".}
## !!!Ignored construct:  VTK_DEPRECATED_IN_9_1_0 ( EvaluateLocationProjectedNode is deprecated, use instead EvaluateLocation. ) void EvaluateLocationProjectedNode ( int & subId , const vtkIdType point_id , double x [ 3 ] , double * weights ) ;
## Error: identifier expected, but got: EvaluateLocationProjectedNode is deprecated, use instead EvaluateLocation.!!!

proc InterpolateFunctions*(this: var vtkBezierQuadrilateral;
                          pcoords: array[3, cdouble]; weights: ptr cdouble) {.
    importcpp: "InterpolateFunctions", header: "vtkBezierQuadrilateral.h".}
proc InterpolateDerivs*(this: var vtkBezierQuadrilateral;
                       pcoords: array[3, cdouble]; derivs: ptr cdouble) {.
    importcpp: "InterpolateDerivs", header: "vtkBezierQuadrilateral.h".}
proc SetRationalWeightsFromPointData*(this: var vtkBezierQuadrilateral;
                                     point_data: ptr vtkPointData;
                                     numPts: vtkIdType) {.
    importcpp: "SetRationalWeightsFromPointData",
    header: "vtkBezierQuadrilateral.h".}
proc GetRationalWeights*(this: var vtkBezierQuadrilateral): ptr vtkDoubleArray {.
    importcpp: "GetRationalWeights", header: "vtkBezierQuadrilateral.h".}
proc GetEdgeCell*(this: var vtkBezierQuadrilateral): ptr vtkHigherOrderCurve {.
    importcpp: "GetEdgeCell", header: "vtkBezierQuadrilateral.h".}