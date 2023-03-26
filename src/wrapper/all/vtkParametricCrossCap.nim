## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkParametricCrossCap.h
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
##  @class   vtkParametricCrossCap
##  @brief   Generate a cross-cap.
##
##  vtkParametricCrossCap generates a cross-cap which is a
##  non-orientable self-intersecting single-sided surface.
##  This is one possible image of a projective plane in three-space.
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

## !!!Ignored construct:  # vtkParametricCrossCap_h [NewLine] # vtkParametricCrossCap_h [NewLine] # vtkCommonComputationalGeometryModule.h  For export macro # vtkParametricFunction.h [NewLine] class VTKCOMMONCOMPUTATIONALGEOMETRY_EXPORT vtkParametricCrossCap : public vtkParametricFunction { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkParametricFunction Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkParametricFunction :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkParametricCrossCap :: IsTypeOf ( type ) ; } static vtkParametricCrossCap * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkParametricCrossCap * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkParametricCrossCap * NewInstance ( ) const { return vtkParametricCrossCap :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkParametricFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkParametricCrossCap :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkParametricCrossCap :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct a cross-cap with the following parameters:
##  MinimumU = 0, MaximumU = Pi,
##  MinimumV = 0, MaximumV = Pi,
##  JoinU = 1, JoinV = 1,
##  TwistU = 1, TwistV = 1;
##  ClockwiseOrdering = 0,
##  DerivativesAvailable = 1
##  static vtkParametricCrossCap * New ( ) ; *
##  Return the parametric dimension of the class.
##  int GetDimension ( ) override { return 2 ; } *
##  A cross-cap.
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
##  double EvaluateScalar ( double uvw [ 3 ] , double Pt [ 3 ] , double Duvw [ 9 ] ) override ; protected : vtkParametricCrossCap ( ) ; ~ vtkParametricCrossCap ( ) override ; private : vtkParametricCrossCap ( const vtkParametricCrossCap & ) = delete ; void operator = ( const vtkParametricCrossCap & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
