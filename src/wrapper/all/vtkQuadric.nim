## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkQuadric.h
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
##  @class   vtkQuadric
##  @brief   evaluate implicit quadric function
##
##  vtkQuadric evaluates the quadric function F(x,y,z) = a0*x^2 + a1*y^2 +
##  a2*z^2 + a3*x*y + a4*y*z + a5*x*z + a6*x + a7*y + a8*z + a9. vtkQuadric is
##  a concrete implementation of vtkImplicitFunction.
##

## !!!Ignored construct:  # vtkQuadric_h [NewLine] # vtkQuadric_h [NewLine] # vtkCommonDataModelModule.h  For export macro # vtkImplicitFunction.h [NewLine] class VTKCOMMONDATAMODEL_EXPORT vtkQuadric : public vtkImplicitFunction { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImplicitFunction Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImplicitFunction :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkQuadric :: IsTypeOf ( type ) ; } static vtkQuadric * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkQuadric * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkQuadric * NewInstance ( ) const { return vtkQuadric :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImplicitFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkQuadric :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkQuadric :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct quadric with all coefficients = 1.
##  static vtkQuadric * New ( ) ; /@{ *
##  Evaluate quadric equation.
##  using vtkImplicitFunction :: EvaluateFunction ; double EvaluateFunction ( double x [ 3 ] ) override ; /@} *
##  Evaluate the gradient to the quadric equation.
##  void EvaluateGradient ( double x [ 3 ] , double g [ 3 ] ) override ; /@{ *
##  Set / get the 10 coefficients of the quadric equation.
##  void SetCoefficients ( double a [ 10 ] ) ; void SetCoefficients ( double a0 , double a1 , double a2 , double a3 , double a4 , double a5 , double a6 , double a7 , double a8 , double a9 ) ; virtual double * GetCoefficients ( ) VTK_SIZEHINT ( 10 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Coefficients  pointer  << this -> Coefficients ) ; return this -> Coefficients ; } VTK_WRAPEXCLUDE virtual void GetCoefficients ( double data [ 10 ] ) { for ( int i = 0 ; i < 10 ; i ++ ) { data [ i ] = this -> Coefficients [ i ] ; } } ; /@} protected : vtkQuadric ( ) ; ~ vtkQuadric ( ) override = default ; double Coefficients [ 10 ] ; private : vtkQuadric ( const vtkQuadric & ) = delete ; void operator = ( const vtkQuadric & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
