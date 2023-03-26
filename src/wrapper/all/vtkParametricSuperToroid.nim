## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkParametricSuperToroid.h
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
##  @class   vtkParametricSuperToroid
##  @brief   Generate a supertoroid.
##
##  vtkParametricSuperToroid generates a supertoroid.  Essentially a
##  supertoroid is a torus with the sine and cosine terms raised to a power.
##  A supertoroid is a versatile primitive that is controlled by four
##  parameters r0, r1, n1 and n2. r0, r1 determine the type of torus whilst
##  the value of n1 determines the shape of the torus ring and n2 determines
##  the shape of the cross section of the ring. It is the different values of
##  these powers which give rise to a family of 3D shapes that are all
##  basically toroidal in shape.
##
##  For further information about this surface, please consult the
##  technical description "Parametric surfaces" in http://www.vtk.org/publications
##  in the "VTK Technical Documents" section in the VTk.org web pages.
##
##  Also see: http://paulbourke.net/geometry/torus/#super.
##
##  @warning
##  Care needs to be taken specifying the bounds correctly. You may need to
##  carefully adjust MinimumU, MinimumV, MaximumU, MaximumV.
##
##  @par Thanks:
##  Andrew Maclean andrew.amaclean@gmail.com for creating and contributing the
##  class.
##
##

## !!!Ignored construct:  # vtkParametricSuperToroid_h [NewLine] # vtkParametricSuperToroid_h [NewLine] # vtkCommonComputationalGeometryModule.h  For export macro # vtkParametricFunction.h [NewLine] class VTKCOMMONCOMPUTATIONALGEOMETRY_EXPORT vtkParametricSuperToroid : public vtkParametricFunction { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkParametricFunction Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkParametricFunction :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkParametricSuperToroid :: IsTypeOf ( type ) ; } static vtkParametricSuperToroid * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkParametricSuperToroid * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkParametricSuperToroid * NewInstance ( ) const { return vtkParametricSuperToroid :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkParametricFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkParametricSuperToroid :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkParametricSuperToroid :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct a supertoroid with the following parameters:
##  MinimumU = 0, MaximumU = 2*Pi,
##  MinimumV = 0, MaximumV = 2*Pi,
##  JoinU = 0, JoinV = 0,
##  TwistU = 0, TwistV = 0,
##  ClockwiseOrdering = 1,
##  DerivativesAvailable = 0,
##  RingRadius = 1, CrossSectionRadius = 0.5,
##  N1 = 1, N2 = 1, XRadius = 1,
##  YRadius = 1, ZRadius = 1, a torus in this case.
##  static vtkParametricSuperToroid * New ( ) ; *
##  Return the parametric dimension of the class.
##  int GetDimension ( ) override { return 2 ; } /@{ *
##  Set/Get the radius from the center to the middle of the ring of the
##  supertoroid. Default is 1.
##  virtual void SetRingRadius ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  RingRadius  to  << _arg ) ; if ( this -> RingRadius != _arg ) { this -> RingRadius = _arg ; this -> Modified ( ) ; } } ; virtual double GetRingRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RingRadius  of  << this -> RingRadius ) ; return this -> RingRadius ; } ; /@} /@{ *
##  Set/Get the radius of the cross section of ring of the supertoroid.
##  Default = 0.5.
##  virtual void SetRingRadiusCrossSectionRadius ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CrossSectionRadius  to  << _arg ) ; if ( this -> CrossSectionRadius != _arg ) { this -> CrossSectionRadius = _arg ; this -> Modified ( ) ; } } ; virtual double GetRingRadiusCrossSectionRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CrossSectionRadius  of  << this -> CrossSectionRadius ) ; return this -> CrossSectionRadius ; } ; /@} /@{ *
##  Set/Get the scaling factor for the x-axis. Default is 1.
##  virtual void SetRingRadiusCrossSectionRadiusXRadius ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  XRadius  to  << _arg ) ; if ( this -> XRadius != _arg ) { this -> XRadius = _arg ; this -> Modified ( ) ; } } ; virtual double GetRingRadiusCrossSectionRadiusXRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << XRadius  of  << this -> XRadius ) ; return this -> XRadius ; } ; /@} /@{ *
##  Set/Get the scaling factor for the y-axis. Default is 1.
##  virtual void SetRingRadiusCrossSectionRadiusXRadiusYRadius ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  YRadius  to  << _arg ) ; if ( this -> YRadius != _arg ) { this -> YRadius = _arg ; this -> Modified ( ) ; } } ; virtual double GetRingRadiusCrossSectionRadiusXRadiusYRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << YRadius  of  << this -> YRadius ) ; return this -> YRadius ; } ; /@} /@{ *
##  Set/Get the scaling factor for the z-axis. Default is 1.
##  virtual void SetRingRadiusCrossSectionRadiusXRadiusYRadiusZRadius ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ZRadius  to  << _arg ) ; if ( this -> ZRadius != _arg ) { this -> ZRadius = _arg ; this -> Modified ( ) ; } } ; virtual double GetRingRadiusCrossSectionRadiusXRadiusYRadiusZRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ZRadius  of  << this -> ZRadius ) ; return this -> ZRadius ; } ; /@} /@{ *
##  Set/Get the shape of the torus ring.  Default is 1.
##  virtual void SetRingRadiusCrossSectionRadiusXRadiusYRadiusZRadiusN1 ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  N1  to  << _arg ) ; if ( this -> N1 != _arg ) { this -> N1 = _arg ; this -> Modified ( ) ; } } ; virtual double GetRingRadiusCrossSectionRadiusXRadiusYRadiusZRadiusN1 ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << N1  of  << this -> N1 ) ; return this -> N1 ; } ; /@} /@{ *
##  Set/Get the shape of the cross section of the ring. Default is 1.
##  virtual void SetRingRadiusCrossSectionRadiusXRadiusYRadiusZRadiusN1N2 ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  N2  to  << _arg ) ; if ( this -> N2 != _arg ) { this -> N2 = _arg ; this -> Modified ( ) ; } } ; virtual double GetRingRadiusCrossSectionRadiusXRadiusYRadiusZRadiusN1N2 ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << N2  of  << this -> N2 ) ; return this -> N2 ; } ; /@} *
##  A supertoroid.
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
##  double EvaluateScalar ( double uvw [ 3 ] , double Pt [ 3 ] , double Duvw [ 9 ] ) override ; protected : vtkParametricSuperToroid ( ) ; ~ vtkParametricSuperToroid ( ) override ;  Variables double RingRadius ; double CrossSectionRadius ; double XRadius ; double YRadius ; double ZRadius ; double N1 ; double N2 ; private : vtkParametricSuperToroid ( const vtkParametricSuperToroid & ) = delete ; void operator = ( const vtkParametricSuperToroid & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
