## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkParametricConicSpiral.h
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
##  @class   vtkParametricConicSpiral
##  @brief   Generate conic spiral surfaces that resemble sea-shells.
##
##  vtkParametricConicSpiral generates conic spiral surfaces. These can resemble sea shells, or
##  may look like a torus "eating" its own tail.
##
##  For further information about this surface, please consult the
##  technical description "Parametric surfaces" in http://www.vtk.org/publications
##  in the "VTK Technical Documents" section in the VTk.org web pages.
##
##  @par Thanks:
##  Andrew Maclean andrew.amaclean@gmail.com for creating and contributing the
##  class.
##
##

## !!!Ignored construct:  # vtkParametricConicSpiral_h [NewLine] # vtkParametricConicSpiral_h [NewLine] # vtkCommonComputationalGeometryModule.h  For export macro # vtkParametricFunction.h [NewLine] class VTKCOMMONCOMPUTATIONALGEOMETRY_EXPORT vtkParametricConicSpiral : public vtkParametricFunction { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkParametricFunction Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkParametricFunction :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkParametricConicSpiral :: IsTypeOf ( type ) ; } static vtkParametricConicSpiral * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkParametricConicSpiral * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkParametricConicSpiral * NewInstance ( ) const { return vtkParametricConicSpiral :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkParametricFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkParametricConicSpiral :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkParametricConicSpiral :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct a conic spiral surface with the following parameters:
##  MinimumU = 0, MaximumU = 2Pi,
##  MinimumV = 0, MaximumV = 2Pi,
##  JoinU = 0, JoinV = 0,
##  TwistU = 0, TwistV = 0,
##  ClockwiseOrdering = 0,
##  DerivativesAvailable = 1,
##  A = 0.2, B = 1.0, C = 0.1, N = 2.
##  static vtkParametricConicSpiral * New ( ) ; *
##  Return the parametric dimension of the class.
##  int GetDimension ( ) override { return 2 ; } /@{ *
##  Set/Get the scale factor.
##  Default = 0.2
##  virtual void SetA ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  A  to  << _arg ) ; if ( this -> A != _arg ) { this -> A = _arg ; this -> Modified ( ) ; } } ; virtual double GetA ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << A  of  << this -> A ) ; return this -> A ; } ; /@} /@{ *
##  Set/Get the A function coefficient.
##  See the definition in Parametric surfaces referred to above.
##  Default is 1.
##  virtual void SetAB ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  B  to  << _arg ) ; if ( this -> B != _arg ) { this -> B = _arg ; this -> Modified ( ) ; } } ; virtual double GetAB ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << B  of  << this -> B ) ; return this -> B ; } ; /@} /@{ *
##  Set/Get the B function coefficient.
##  See the definition in Parametric surfaces referred to above.
##  Default is 0.1.
##  virtual void SetABC ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  C  to  << _arg ) ; if ( this -> C != _arg ) { this -> C = _arg ; this -> Modified ( ) ; } } ; virtual double GetABC ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << C  of  << this -> C ) ; return this -> C ; } ; /@} /@{ *
##  Set/Get the C function coefficient.
##  See the definition in Parametric surfaces referred to above.
##  Default is 2.
##  virtual void SetABCN ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  N  to  << _arg ) ; if ( this -> N != _arg ) { this -> N = _arg ; this -> Modified ( ) ; } } ; virtual double GetABCN ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << N  of  << this -> N ) ; return this -> N ; } ; /@} *
##  A conic spiral surface.
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
##  double EvaluateScalar ( double uvw [ 3 ] , double Pt [ 3 ] , double Duvw [ 9 ] ) override ; protected : vtkParametricConicSpiral ( ) ; ~ vtkParametricConicSpiral ( ) override ;  Variables double A ; double B ; double C ; double N ; private : vtkParametricConicSpiral ( const vtkParametricConicSpiral & ) = delete ; void operator = ( const vtkParametricConicSpiral & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
