## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBezierInterpolation.h
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
##  .NAME vtkBezierInterpolation
##  .SECTION Description
##  .SECTION See Also

import
  vtkCommonDataModelModule, vtkDeprecation, vtkHigherOrderInterpolation,
  vtkSmartPointer, vtkVector

##  Define this to include support for a "complete" (21- vs 18-point) wedge.

const
  VTK_21_POINT_WEDGE* = true

discard "forward decl of vtkPoints"
discard "forward decl of vtkVector2i"
discard "forward decl of vtkVector3d"
type
  vtkBezierInterpolation* {.importcpp: "vtkBezierInterpolation",
                           header: "vtkBezierInterpolation.h", bycopy.} = object of vtkHigherOrderInterpolation
    vtkBezierInterpolation* {.importc: "vtkBezierInterpolation".}: VTK_NEWINSTANCE


proc New*(): ptr vtkBezierInterpolation {.importcpp: "vtkBezierInterpolation::New(@)",
                                      header: "vtkBezierInterpolation.h".}
proc PrintSelf*(this: var vtkBezierInterpolation; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkBezierInterpolation.h".}
type
  vtkBezierInterpolationSuperclass* = vtkHigherOrderInterpolation

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkBezierInterpolation::IsTypeOf(@)",
    header: "vtkBezierInterpolation.h".}
proc IsA*(this: var vtkBezierInterpolation; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkBezierInterpolation.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkBezierInterpolation {.
    importcpp: "vtkBezierInterpolation::SafeDownCast(@)",
    header: "vtkBezierInterpolation.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkBezierInterpolation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHigherOrderInterpolation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBezierInterpolation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBezierInterpolation :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

## !!!Ignored construct:   see Geometrically Exact and Analysis Suitable Mesh Generation Using Rational Bernstein–Bezier
##  Elements https://scholar.colorado.edu/cgi/viewcontent.cgi?article=1170&context=mcen_gradetds
##  Chapter 3, pg 25. given a dimension ( 2 triangle, 3 tetrahedron ) and the degree of the
##  simplex flatten a simplicial bezier function's coordinate to an integer VTK_DEPRECATED_IN_9_1_0 ( renamed to FlattenSimplex ) static int flattenSimplex ( const int dim , const int deg , const vtkVector3i coord ) ;
## Error: identifier expected, but got: renamed to FlattenSimplex!!!

proc FlattenSimplex*(dim: cint; deg: cint; coord: vtkVector3i): cint {.
    importcpp: "vtkBezierInterpolation::FlattenSimplex(@)",
    header: "vtkBezierInterpolation.h".}
## !!!Ignored construct:   given a dimension ( 2 triangle, 3 tetrahedron ) and the degree of the simplex,
##  unflatten a simplicial bezier function integer to a simplicial coordinate VTK_DEPRECATED_IN_9_1_0 ( renamed to UnFlattenSimplex ) static vtkVector3i unflattenSimplex ( const int dim , const int deg , const vtkIdType flat ) ;
## Error: identifier expected, but got: renamed to UnFlattenSimplex!!!

proc UnFlattenSimplex*(dim: cint; deg: cint; flat: vtkIdType): vtkVector3i {.
    importcpp: "vtkBezierInterpolation::UnFlattenSimplex(@)",
    header: "vtkBezierInterpolation.h".}
## !!!Ignored construct:   simplicial version of deCasteljau VTK_DEPRECATED_IN_9_1_0 ( renamed to DeCasteljauSimplex ) static void deCasteljauSimplex ( const int dim , const int deg , const double * pcoords , double * weights ) ;
## Error: identifier expected, but got: renamed to DeCasteljauSimplex!!!

proc DeCasteljauSimplex*(dim: cint; deg: cint; pcoords: ptr cdouble;
                        weights: ptr cdouble) {.
    importcpp: "vtkBezierInterpolation::DeCasteljauSimplex(@)",
    header: "vtkBezierInterpolation.h".}
## !!!Ignored construct:  VTK_DEPRECATED_IN_9_1_0 ( renamed to DeCasteljauSimplexDeriv ) static void deCasteljauSimplexDeriv ( const int dim , const int deg , const double * pcoords , double * weights ) ;
## Error: identifier expected, but got: renamed to DeCasteljauSimplexDeriv!!!

proc DeCasteljauSimplexDeriv*(dim: cint; deg: cint; pcoords: ptr cdouble;
                             weights: ptr cdouble) {.
    importcpp: "vtkBezierInterpolation::DeCasteljauSimplexDeriv(@)",
    header: "vtkBezierInterpolation.h".}
proc EvaluateShapeFunctions*(order: cint; pcoord: cdouble; shape: ptr cdouble) {.
    importcpp: "vtkBezierInterpolation::EvaluateShapeFunctions(@)",
    header: "vtkBezierInterpolation.h".}
proc EvaluateShapeAndGradient*(order: cint; pcoord: cdouble; shape: ptr cdouble;
                              grad: ptr cdouble) {.
    importcpp: "vtkBezierInterpolation::EvaluateShapeAndGradient(@)",
    header: "vtkBezierInterpolation.h".}
proc Tensor1ShapeFunctions*(order: array[1, cint]; pcoords: ptr cdouble;
                           shape: ptr cdouble): cint {.
    importcpp: "vtkBezierInterpolation::Tensor1ShapeFunctions(@)",
    header: "vtkBezierInterpolation.h".}
proc Tensor1ShapeDerivatives*(order: array[1, cint]; pcoords: ptr cdouble;
                             derivs: ptr cdouble): cint {.
    importcpp: "vtkBezierInterpolation::Tensor1ShapeDerivatives(@)",
    header: "vtkBezierInterpolation.h".}
proc Tensor2ShapeFunctions*(order: array[2, cint]; pcoords: ptr cdouble;
                           shape: ptr cdouble): cint {.
    importcpp: "vtkBezierInterpolation::Tensor2ShapeFunctions(@)",
    header: "vtkBezierInterpolation.h".}
proc Tensor2ShapeDerivatives*(order: array[2, cint]; pcoords: ptr cdouble;
                             derivs: ptr cdouble): cint {.
    importcpp: "vtkBezierInterpolation::Tensor2ShapeDerivatives(@)",
    header: "vtkBezierInterpolation.h".}
proc Tensor3ShapeFunctions*(order: array[3, cint]; pcoords: ptr cdouble;
                           shape: ptr cdouble): cint {.
    importcpp: "vtkBezierInterpolation::Tensor3ShapeFunctions(@)",
    header: "vtkBezierInterpolation.h".}
proc Tensor3ShapeDerivatives*(order: array[3, cint]; pcoords: ptr cdouble;
                             derivs: ptr cdouble): cint {.
    importcpp: "vtkBezierInterpolation::Tensor3ShapeDerivatives(@)",
    header: "vtkBezierInterpolation.h".}
proc Tensor3EvaluateDerivative*(this: var vtkBezierInterpolation;
                               order: array[3, cint]; pcoords: ptr cdouble;
                               points: ptr vtkPoints; fieldVals: ptr cdouble;
                               fieldDim: cint; fieldDerivs: ptr cdouble) {.
    importcpp: "Tensor3EvaluateDerivative", header: "vtkBezierInterpolation.h".}
proc WedgeShapeFunctions*(order: array[3, cint]; numberOfPoints: vtkIdType;
                         pcoords: ptr cdouble; shape: ptr cdouble) {.
    importcpp: "vtkBezierInterpolation::WedgeShapeFunctions(@)",
    header: "vtkBezierInterpolation.h".}
proc WedgeShapeDerivatives*(order: array[3, cint]; numberOfPoints: vtkIdType;
                           pcoords: ptr cdouble; derivs: ptr cdouble) {.
    importcpp: "vtkBezierInterpolation::WedgeShapeDerivatives(@)",
    header: "vtkBezierInterpolation.h".}
proc WedgeEvaluate*(this: var vtkBezierInterpolation; order: array[3, cint];
                   numberOfPoints: vtkIdType; pcoords: ptr cdouble;
                   fieldVals: ptr cdouble; fieldDim: cint;
                   fieldAtPCoords: ptr cdouble) {.importcpp: "WedgeEvaluate",
    header: "vtkBezierInterpolation.h".}
proc WedgeEvaluateDerivative*(this: var vtkBezierInterpolation;
                             order: array[3, cint]; pcoords: ptr cdouble;
                             points: ptr vtkPoints; fieldVals: ptr cdouble;
                             fieldDim: cint; fieldDerivs: ptr cdouble) {.
    importcpp: "WedgeEvaluateDerivative", header: "vtkBezierInterpolation.h".}