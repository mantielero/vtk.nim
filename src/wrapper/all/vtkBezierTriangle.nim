## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBezierTriangle.h
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
##  @class   vtkBezierTriangle
##  @brief   A 2D cell that represents an arbitrary order Bezier triangle
##
##  vtkBezierTriangle is a concrete implementation of vtkCell to represent a
##  2D triangle using Bezier shape functions of user specified order.
##
##  The number of points in a Bezier cell determines the order over which they
##  are iterated relative to the parametric coordinate system of the cell. The
##  first points that are reported are vertices. They appear in the same order in
##  which they would appear in linear cells. Mid-edge points are reported next.
##  They are reported in sequence. For two- and three-dimensional (3D) cells, the
##  following set of points to be reported are face points. Finally, 3D cells
##  report points interior to their volume.
##

import
  vtkCommonDataModelModule, vtkDeprecation, vtkHigherOrderTriangle

discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkBezierCurve"
discard "forward decl of vtkTriangle"
discard "forward decl of vtkDataSet"
type
  vtkBezierTriangle* {.importcpp: "vtkBezierTriangle",
                      header: "vtkBezierTriangle.h", bycopy.} = object of vtkHigherOrderTriangle
    vtkBezierTriangle* {.importc: "vtkBezierTriangle".}: VTK_NEWINSTANCE


proc New*(): ptr vtkBezierTriangle {.importcpp: "vtkBezierTriangle::New(@)",
                                 header: "vtkBezierTriangle.h".}
type
  vtkBezierTriangleSuperclass* = vtkHigherOrderTriangle

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkBezierTriangle::IsTypeOf(@)", header: "vtkBezierTriangle.h".}
proc IsA*(this: var vtkBezierTriangle; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkBezierTriangle.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkBezierTriangle {.
    importcpp: "vtkBezierTriangle::SafeDownCast(@)", header: "vtkBezierTriangle.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkBezierTriangle :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHigherOrderTriangle :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBezierTriangle :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBezierTriangle :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkBezierTriangle; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkBezierTriangle.h".}
proc GetCellType*(this: var vtkBezierTriangle): cint {.importcpp: "GetCellType",
    header: "vtkBezierTriangle.h".}
proc GetEdge*(this: var vtkBezierTriangle; edgeId: cint): ptr vtkCell {.
    importcpp: "GetEdge", header: "vtkBezierTriangle.h".}
## !!!Ignored construct:  VTK_DEPRECATED_IN_9_1_0 ( EvaluateLocationProjectedNode is deprecated, use instead EvaluateLocation. ) void EvaluateLocationProjectedNode ( int & subId , const vtkIdType point_id , double x [ 3 ] , double * weights ) ;
## Error: identifier expected, but got: EvaluateLocationProjectedNode is deprecated, use instead EvaluateLocation.!!!

proc SetRationalWeightsFromPointData*(this: var vtkBezierTriangle;
                                     point_data: ptr vtkPointData;
                                     numPts: vtkIdType) {.
    importcpp: "SetRationalWeightsFromPointData", header: "vtkBezierTriangle.h".}
proc InterpolateFunctions*(this: var vtkBezierTriangle; pcoords: array[3, cdouble];
                          weights: ptr cdouble) {.
    importcpp: "InterpolateFunctions", header: "vtkBezierTriangle.h".}
proc InterpolateDerivs*(this: var vtkBezierTriangle; pcoords: array[3, cdouble];
                       derivs: ptr cdouble) {.importcpp: "InterpolateDerivs",
    header: "vtkBezierTriangle.h".}
proc GetEdgeCell*(this: var vtkBezierTriangle): ptr vtkHigherOrderCurve {.
    importcpp: "GetEdgeCell", header: "vtkBezierTriangle.h".}
proc GetRationalWeights*(this: var vtkBezierTriangle): ptr vtkDoubleArray {.
    importcpp: "GetRationalWeights", header: "vtkBezierTriangle.h".}