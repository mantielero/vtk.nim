## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkParametricDini.h
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
##  @class   vtkParametricDini
##  @brief   Generate Dini's surface.
##
##  vtkParametricDini generates Dini's surface.
##  Dini's surface is a surface that possesses constant negative
##  Gaussian curvature
##
##  For further information about this surface, please consult
##  https://en.wikipedia.org/wiki/Dini%27s_surface
##
##  @par Thanks:
##  Andrew Maclean andrew.amaclean@gmail.com for creating and contributing the
##  class.
##
##

## !!!Ignored construct:  # vtkParametricDini_h [NewLine] # vtkParametricDini_h [NewLine] # vtkCommonComputationalGeometryModule.h  For export macro # vtkParametricFunction.h [NewLine] class VTKCOMMONCOMPUTATIONALGEOMETRY_EXPORT vtkParametricDini : public vtkParametricFunction { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkParametricFunction Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkParametricFunction :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkParametricDini :: IsTypeOf ( type ) ; } static vtkParametricDini * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkParametricDini * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkParametricDini * NewInstance ( ) const { return vtkParametricDini :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkParametricFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkParametricDini :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkParametricDini :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct Dini's surface with the following parameters:
##  MinimumU = 0, MaximumU = 4*Pi,
##  MinimumV = 0.001, MaximumV = 2,
##  JoinU = 0, JoinV = 0,
##  TwistU = 0, TwistV = 0,
##  ClockwiseOrdering = 0,
##  DerivativesAvailable = 1
##  A = 1, B = 0.2
##  static vtkParametricDini * New ( ) ; *
##  Return the parametric dimension of the class.
##  int GetDimension ( ) override { return 2 ; } /@{ *
##  Set/Get the scale factor.
##  See the definition in Parametric surfaces referred to above.
##  Default is 1.
##  virtual void SetA ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  A  to  << _arg ) ; if ( this -> A != _arg ) { this -> A = _arg ; this -> Modified ( ) ; } } ; virtual double GetA ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << A  of  << this -> A ) ; return this -> A ; } ; /@} /@{ *
##  Set/Get the scale factor.
##  See the definition in Parametric surfaces referred to above.
##  Default is 0.2
##  virtual void SetAB ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  B  to  << _arg ) ; if ( this -> B != _arg ) { this -> B = _arg ; this -> Modified ( ) ; } } ; virtual double GetAB ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << B  of  << this -> B ) ; return this -> B ; } ; /@} *
##  Dini's surface.
##
##  This function performs the mapping \f$f(u,v) \rightarrow (x,y,x)\f$, returning it
##  as Pt. It also returns the partial derivatives Du and Dv.
##  \f$Pt = (x, y, z), Du = (dx/du, dy/du, dz/du), Dv = (dx/dv, dy/dv, dz/dv)\f$ .
##  Then the normal is \f$N = Du X Dv\f$ .
##  void Evaluate ( double uvw [ 3 ] , double Pt [ 3 ] , double Duvw [ 9 ] ) override ; *
##  Calculate a user defined scalar using one or all of uvw, Pt, Duvw.
##
##  uvw are the parameters with Pt being the cartesian point,
##  Duvw are the derivatives of this point with respect to u, v and w.
##  Pt, Duvw are obtained from Evaluate().
##
##  This function is only called if the ScalarMode has the value
##  vtkParametricFunctionSource::SCALAR_FUNCTION_DEFINED
##
##  If the user does not need to calculate a scalar, then the
##  instantiated function should return zero.
##  double EvaluateScalar ( double uvw [ 3 ] , double Pt [ 3 ] , double Duvw [ 9 ] ) override ; protected : vtkParametricDini ( ) ; ~ vtkParametricDini ( ) override ;  Variables double A ; double B ; private : vtkParametricDini ( const vtkParametricDini & ) = delete ; void operator = ( const vtkParametricDini & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
