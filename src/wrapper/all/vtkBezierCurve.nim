## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBezierCurve.h
##
##   Copyright (c) Kevin Tew
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
##  .NAME vtkBezierCurve
##  .SECTION Description
##  .SECTION See Also

import
  vtkCellType, vtkCommonDataModelModule, vtkDeprecation, vtkHigherOrderCurve,
  vtkNew, vtkSmartPointer

discard "forward decl of vtkCellData"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkIdList"
discard "forward decl of vtkLine"
discard "forward decl of vtkPointData"
discard "forward decl of vtkPoints"
discard "forward decl of vtkVector3d"
discard "forward decl of vtkVector3i"
discard "forward decl of vtkDataSet"
type
  vtkBezierCurve* {.importcpp: "vtkBezierCurve", header: "vtkBezierCurve.h", bycopy.} = object of vtkHigherOrderCurve
    vtkBezierCurve* {.importc: "vtkBezierCurve".}: VTK_NEWINSTANCE


proc New*(): ptr vtkBezierCurve {.importcpp: "vtkBezierCurve::New(@)",
                              header: "vtkBezierCurve.h".}
type
  vtkBezierCurveSuperclass* = vtkHigherOrderCurve

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkBezierCurve::IsTypeOf(@)", header: "vtkBezierCurve.h".}
proc IsA*(this: var vtkBezierCurve; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkBezierCurve.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkBezierCurve {.
    importcpp: "vtkBezierCurve::SafeDownCast(@)", header: "vtkBezierCurve.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkBezierCurve :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHigherOrderCurve :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBezierCurve :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBezierCurve :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkBezierCurve; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkBezierCurve.h".}
proc GetCellType*(this: var vtkBezierCurve): cint {.importcpp: "GetCellType",
    header: "vtkBezierCurve.h".}
## !!!Ignored construct:  VTK_DEPRECATED_IN_9_1_0 ( EvaluateLocationProjectedNode is deprecated, use instead EvaluateLocation. ) void EvaluateLocationProjectedNode ( int & subId , const vtkIdType point_id , double x [ 3 ] , double * weights ) ;
## Error: identifier expected, but got: EvaluateLocationProjectedNode is deprecated, use instead EvaluateLocation.!!!

proc SetRationalWeightsFromPointData*(this: var vtkBezierCurve;
                                     point_data: ptr vtkPointData;
                                     numPts: vtkIdType) {.
    importcpp: "SetRationalWeightsFromPointData", header: "vtkBezierCurve.h".}
proc InterpolateFunctions*(this: var vtkBezierCurve; pcoords: array[3, cdouble];
                          weights: ptr cdouble) {.
    importcpp: "InterpolateFunctions", header: "vtkBezierCurve.h".}
proc InterpolateDerivs*(this: var vtkBezierCurve; pcoords: array[3, cdouble];
                       derivs: ptr cdouble) {.importcpp: "InterpolateDerivs",
    header: "vtkBezierCurve.h".}
proc GetRationalWeights*(this: var vtkBezierCurve): ptr vtkDoubleArray {.
    importcpp: "GetRationalWeights", header: "vtkBezierCurve.h".}