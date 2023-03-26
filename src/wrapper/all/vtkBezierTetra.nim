## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBezierTetra.h
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
##  @class   vtkBezierTetra
##  @brief   A 3D cell that represents an arbitrary order Bezier tetrahedron
##
##  vtkBezierTetra is a concrete implementation of vtkCell to represent a
##  3D tetrahedron using Bezier shape functions of user specified order.
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
  vtkCommonDataModelModule, vtkDeprecation, vtkHigherOrderTetra

discard "forward decl of vtkTetra"
discard "forward decl of vtkBezierCurve"
discard "forward decl of vtkBezierTriangle"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkDataSet"
type
  vtkBezierTetra* {.importcpp: "vtkBezierTetra", header: "vtkBezierTetra.h", bycopy.} = object of vtkHigherOrderTetra
    vtkBezierTetra* {.importc: "vtkBezierTetra".}: VTK_NEWINSTANCE


proc New*(): ptr vtkBezierTetra {.importcpp: "vtkBezierTetra::New(@)",
                              header: "vtkBezierTetra.h".}
type
  vtkBezierTetraSuperclass* = vtkHigherOrderTetra

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkBezierTetra::IsTypeOf(@)", header: "vtkBezierTetra.h".}
proc IsA*(this: var vtkBezierTetra; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkBezierTetra.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkBezierTetra {.
    importcpp: "vtkBezierTetra::SafeDownCast(@)", header: "vtkBezierTetra.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkBezierTetra :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHigherOrderTetra :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBezierTetra :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBezierTetra :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkBezierTetra; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkBezierTetra.h".}
proc GetCellType*(this: var vtkBezierTetra): cint {.importcpp: "GetCellType",
    header: "vtkBezierTetra.h".}
proc GetEdge*(this: var vtkBezierTetra; edgeId: cint): ptr vtkCell {.
    importcpp: "GetEdge", header: "vtkBezierTetra.h".}
proc GetFace*(this: var vtkBezierTetra; faceId: cint): ptr vtkCell {.
    importcpp: "GetFace", header: "vtkBezierTetra.h".}
## !!!Ignored construct:  VTK_DEPRECATED_IN_9_1_0 ( EvaluateLocationProjectedNode is deprecated, use instead EvaluateLocation. ) void EvaluateLocationProjectedNode ( int & subId , const vtkIdType point_id , double x [ 3 ] , double * weights ) ;
## Error: identifier expected, but got: EvaluateLocationProjectedNode is deprecated, use instead EvaluateLocation.!!!

proc SetRationalWeightsFromPointData*(this: var vtkBezierTetra;
                                     point_data: ptr vtkPointData;
                                     numPts: vtkIdType) {.
    importcpp: "SetRationalWeightsFromPointData", header: "vtkBezierTetra.h".}
proc InterpolateFunctions*(this: var vtkBezierTetra; pcoords: array[3, cdouble];
                          weights: ptr cdouble) {.
    importcpp: "InterpolateFunctions", header: "vtkBezierTetra.h".}
proc InterpolateDerivs*(this: var vtkBezierTetra; pcoords: array[3, cdouble];
                       derivs: ptr cdouble) {.importcpp: "InterpolateDerivs",
    header: "vtkBezierTetra.h".}
proc GetEdgeCell*(this: var vtkBezierTetra): ptr vtkHigherOrderCurve {.
    importcpp: "GetEdgeCell", header: "vtkBezierTetra.h".}
proc GetFaceCell*(this: var vtkBezierTetra): ptr vtkHigherOrderTriangle {.
    importcpp: "GetFaceCell", header: "vtkBezierTetra.h".}
proc GetRationalWeights*(this: var vtkBezierTetra): ptr vtkDoubleArray {.
    importcpp: "GetRationalWeights", header: "vtkBezierTetra.h".}