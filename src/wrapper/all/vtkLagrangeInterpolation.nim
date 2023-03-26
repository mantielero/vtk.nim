## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLagrangeInterpolation.h
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
##  .NAME vtkLagrangeInterpolation
##  .SECTION Description
##  .SECTION See Also

## !!!Ignored construct:  # vtkLagrangeInterpolation_h [NewLine] # vtkLagrangeInterpolation_h [NewLine] # vtkCommonDataModelModule.h  For export macro. # vtkHigherOrderInterpolation.h [NewLine] # vtkSmartPointer.h  For API. [NewLine] # < vector >  For scratch storage. [NewLine]  Define this to include support for a "complete" (21- vs 18-point) wedge. # VTK_21_POINT_WEDGE true [NewLine] class vtkPoints ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkVector2i"
discard "forward decl of vtkVector3d"
## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkLagrangeInterpolation : public vtkHigherOrderInterpolation { public : static vtkLagrangeInterpolation * New ( ) ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkHigherOrderInterpolation Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkHigherOrderInterpolation :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkLagrangeInterpolation :: IsTypeOf ( type ) ; } static vtkLagrangeInterpolation * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkLagrangeInterpolation * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkLagrangeInterpolation * NewInstance ( ) const { return vtkLagrangeInterpolation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHigherOrderInterpolation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLagrangeInterpolation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLagrangeInterpolation :: New ( ) ; } public : ; static void EvaluateShapeFunctions ( const int order , const double pcoord , double * shape ) ; static void EvaluateShapeAndGradient ( const int order , const double pcoord , double * shape , double * grad ) ; static int Tensor1ShapeFunctions ( const int order [ 1 ] , const double * pcoords , double * shape ) ; static int Tensor1ShapeDerivatives ( const int order [ 1 ] , const double * pcoords , double * derivs ) ; static int Tensor2ShapeFunctions ( const int order [ 2 ] , const double * pcoords , double * shape ) ; static int Tensor2ShapeDerivatives ( const int order [ 2 ] , const double * pcoords , double * derivs ) ; static int Tensor3ShapeFunctions ( const int order [ 3 ] , const double * pcoords , double * shape ) ; static int Tensor3ShapeDerivatives ( const int order [ 3 ] , const double * pcoords , double * derivs ) ; void Tensor3EvaluateDerivative ( const int order [ 3 ] , const double * pcoords , vtkPoints * points , const double * fieldVals , int fieldDim , double * fieldDerivs ) override ; static void WedgeShapeFunctions ( const int order [ 3 ] , const vtkIdType numberOfPoints , const double * pcoords , double * shape ) ; static void WedgeShapeDerivatives ( const int order [ 3 ] , const vtkIdType numberOfPoints , const double * pcoords , double * derivs ) ; void WedgeEvaluate ( const int order [ 3 ] , const vtkIdType numberOfPoints , const double * pcoords , double * fieldVals , int fieldDim , double * fieldAtPCoords ) override ; void WedgeEvaluateDerivative ( const int order [ 3 ] , const double * pcoords , vtkPoints * points , const double * fieldVals , int fieldDim , double * fieldDerivs ) override ; protected : vtkLagrangeInterpolation ( ) ; ~ vtkLagrangeInterpolation ( ) override ; private : vtkLagrangeInterpolation ( const vtkLagrangeInterpolation & ) = delete ; void operator = ( const vtkLagrangeInterpolation & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
