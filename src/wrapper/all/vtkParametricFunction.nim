## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkParametricFunction.h
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
##  @class   vtkParametricFunction
##  @brief   abstract interface for parametric functions
##
##  vtkParametricFunction is an abstract interface for functions
##  defined by parametric mapping i.e. f(u,v,w)->(x,y,z) where
##  u_min <= u < u_max, v_min <= v < v_max, w_min <= w < w_max. (For
##  notational convenience, we will write f(u)->x and assume that
##  u means (u,v,w) and x means (x,y,z).)
##
##  The interface contains the pure virtual function, Evaluate(), that
##  generates a point and the derivatives at that point which are then used to
##  construct the surface. A second pure virtual function, EvaluateScalar(),
##  can be used to generate a scalar for the surface. Finally, the
##  GetDimension() virtual function is used to differentiate 1D, 2D, and 3D
##  parametric functions. Since this abstract class defines a pure virtual
##  API, its subclasses must implement the pure virtual functions
##  GetDimension(), Evaluate() and EvaluateScalar().
##
##  This class has also methods for defining a range of parametric values (u,v,w).
##
##  @par Thanks:
##  Andrew Maclean andrew.amaclean@gmail.com for creating and contributing the
##  class.
##
##  @sa
##  vtkParametricFunctionSource - tessellates a parametric function
##
##  @sa
##  Implementations of derived classes implementing non-orentable surfaces:
##  vtkParametricBoy vtkParametricCrossCap vtkParametricFigure8Klein
##  vtkParametricKlein vtkParametricMobius vtkParametricRoman
##
##  @sa
##  Implementations of derived classes implementing orientable surfaces:
##  vtkParametricConicSpiral vtkParametricDini vtkParametricEllipsoid
##  vtkParametricEnneper vtkParametricRandomHills vtkParametricSuperEllipsoid
##  vtkParametricSuperToroid vtkParametricTorus
##
##

## !!!Ignored construct:  # vtkParametricFunction_h [NewLine] # vtkParametricFunction_h [NewLine] # vtkCommonComputationalGeometryModule.h  For export macro # vtkObject.h [NewLine] class VTKCOMMONCOMPUTATIONALGEOMETRY_EXPORT vtkParametricFunction : public vtkObject { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkParametricFunction :: IsTypeOf ( type ) ; } static vtkParametricFunction * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkParametricFunction * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkParametricFunction * NewInstance ( ) const { return vtkParametricFunction :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkParametricFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkParametricFunction :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Return the dimension of parametric space. Depending on the dimension,
##  then the (u,v,w) parameters and associated information (e.g., derivates)
##  have meaning. For example, if the dimension of the function is one, then
##  u[0] and Duvw[0...2] have meaning.
##  This is a pure virtual function that must be instantiated in
##  a derived class.
##  virtual int GetDimension ( ) = 0 ; *
##  Performs the mapping \$f(uvw)->(Pt,Duvw)\$f.
##  This is a pure virtual function that must be instantiated in
##  a derived class.
##
##  uvw are the parameters, with u corresponding to uvw[0],
##  v to uvw[1] and w to uvw[2] respectively. Pt is the returned Cartesian point,
##  Duvw are the derivatives of this point with respect to u, v and w.
##  Note that the first three values in Duvw are Du, the next three are Dv,
##  and the final three are Dw. Du Dv Dw are the partial derivatives of the
##  function at the point Pt with respect to u, v and w respectively.
##  virtual void Evaluate ( double uvw [ 3 ] , double Pt [ 3 ] , double Duvw [ 9 ] ) = 0 ; *
##  Calculate a user defined scalar using one or all of uvw, Pt, Duvw.
##  This is a pure virtual function that must be instantiated in
##  a derived class.
##
##  uvw are the parameters with Pt being the cartesian point,
##  Duvw are the derivatives of this point with respect to u, v, and w.
##  Pt, Duvw are obtained from Evaluate().
##  virtual double EvaluateScalar ( double uvw [ 3 ] , double Pt [ 3 ] , double Duvw [ 9 ] ) = 0 ; /@{ *
##  Set/Get the minimum u-value.
##  virtual void SetMinimumU ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MinimumU  to  << _arg ) ; if ( this -> MinimumU != _arg ) { this -> MinimumU = _arg ; this -> Modified ( ) ; } } ; virtual double GetMinimumU ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MinimumU  of  << this -> MinimumU ) ; return this -> MinimumU ; } ; /@} /@{ *
##  Set/Get the maximum u-value.
##  virtual void SetMinimumUMaximumU ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MaximumU  to  << _arg ) ; if ( this -> MaximumU != _arg ) { this -> MaximumU = _arg ; this -> Modified ( ) ; } } ; virtual double GetMinimumUMaximumU ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumU  of  << this -> MaximumU ) ; return this -> MaximumU ; } ; /@} /@{ *
##  Set/Get the minimum v-value.
##  virtual void SetMinimumUMaximumUMinimumV ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MinimumV  to  << _arg ) ; if ( this -> MinimumV != _arg ) { this -> MinimumV = _arg ; this -> Modified ( ) ; } } ; virtual double GetMinimumUMaximumUMinimumV ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MinimumV  of  << this -> MinimumV ) ; return this -> MinimumV ; } ; /@} /@{ *
##  Set/Get the maximum v-value.
##  virtual void SetMinimumUMaximumUMinimumVMaximumV ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MaximumV  to  << _arg ) ; if ( this -> MaximumV != _arg ) { this -> MaximumV = _arg ; this -> Modified ( ) ; } } ; virtual double GetMinimumUMaximumUMinimumVMaximumV ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumV  of  << this -> MaximumV ) ; return this -> MaximumV ; } ; /@} /@{ *
##  Set/Get the minimum w-value.
##  virtual void SetMinimumUMaximumUMinimumVMaximumVMinimumW ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MinimumW  to  << _arg ) ; if ( this -> MinimumW != _arg ) { this -> MinimumW = _arg ; this -> Modified ( ) ; } } ; virtual double GetMinimumUMaximumUMinimumVMaximumVMinimumW ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MinimumW  of  << this -> MinimumW ) ; return this -> MinimumW ; } ; /@} /@{ *
##  Set/Get the maximum w-value.
##  virtual void SetMinimumUMaximumUMinimumVMaximumVMinimumWMaximumW ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MaximumW  to  << _arg ) ; if ( this -> MaximumW != _arg ) { this -> MaximumW = _arg ; this -> Modified ( ) ; } } ; virtual double GetMinimumUMaximumUMinimumVMaximumVMinimumWMaximumW ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumW  of  << this -> MaximumW ) ; return this -> MaximumW ; } ; /@} /@{ *
##  Set/Get the flag which joins the first triangle strip to the last one.
##  virtual void SetJoinU ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << JoinU  to  << _arg ) ; if ( this -> JoinU != ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ) { this -> JoinU = ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ; this -> Modified ( ) ; } } virtual vtkTypeBool GetJoinUMinValue ( ) { return 0 ; } virtual vtkTypeBool GetJoinUMaxValue ( ) { return 1 ; } ; virtual vtkTypeBool GetMinimumUMaximumUMinimumVMaximumVMinimumWMaximumWJoinU ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << JoinU  of  << this -> JoinU ) ; return this -> JoinU ; } ; virtual void JoinUOn ( ) { this -> SetJoinU ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void JoinUOff ( ) { this -> SetJoinU ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the flag which joins the ends of the triangle strips.
##  virtual void SetJoinUJoinV ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << JoinV  to  << _arg ) ; if ( this -> JoinV != ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ) { this -> JoinV = ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ; this -> Modified ( ) ; } } virtual vtkTypeBool GetJoinUMinValueJoinVMinValue ( ) { return 0 ; } virtual vtkTypeBool GetJoinUMaxValueJoinVMaxValue ( ) { return 1 ; } ; virtual vtkTypeBool GetMinimumUMaximumUMinimumVMaximumVMinimumWMaximumWJoinUJoinV ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << JoinV  of  << this -> JoinV ) ; return this -> JoinV ; } ; virtual void JoinVOn ( ) { this -> SetJoinUJoinV ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void JoinVOff ( ) { this -> SetJoinUJoinV ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the flag which joins the ends of the triangle strips.
##  virtual void SetJoinUJoinVJoinW ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << JoinW  to  << _arg ) ; if ( this -> JoinW != ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ) { this -> JoinW = ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ; this -> Modified ( ) ; } } virtual vtkTypeBool GetJoinUMinValueJoinVMinValueJoinWMinValue ( ) { return 0 ; } virtual vtkTypeBool GetJoinUMaxValueJoinVMaxValueJoinWMaxValue ( ) { return 1 ; } ; virtual vtkTypeBool GetMinimumUMaximumUMinimumVMaximumVMinimumWMaximumWJoinUJoinVJoinW ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << JoinW  of  << this -> JoinW ) ; return this -> JoinW ; } ; virtual void JoinWOn ( ) { this -> SetJoinUJoinVJoinW ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void JoinWOff ( ) { this -> SetJoinUJoinVJoinW ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the flag which joins the first triangle strip to
##  the last one with a twist.
##  JoinU must also be set if this is set.
##  Used when building some non-orientable surfaces.
##  virtual void SetJoinUJoinVJoinWTwistU ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << TwistU  to  << _arg ) ; if ( this -> TwistU != ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ) { this -> TwistU = ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ; this -> Modified ( ) ; } } virtual vtkTypeBool GetJoinUMinValueJoinVMinValueJoinWMinValueTwistUMinValue ( ) { return 0 ; } virtual vtkTypeBool GetJoinUMaxValueJoinVMaxValueJoinWMaxValueTwistUMaxValue ( ) { return 1 ; } ; virtual vtkTypeBool GetMinimumUMaximumUMinimumVMaximumVMinimumWMaximumWJoinUJoinVJoinWTwistU ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TwistU  of  << this -> TwistU ) ; return this -> TwistU ; } ; virtual void TwistUOn ( ) { this -> SetJoinUJoinVJoinWTwistU ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void TwistUOff ( ) { this -> SetJoinUJoinVJoinWTwistU ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the flag which joins the ends of the
##  triangle strips with a twist.
##  JoinV must also be set if this is set.
##  Used when building some non-orientable surfaces.
##  virtual void SetJoinUJoinVJoinWTwistUTwistV ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << TwistV  to  << _arg ) ; if ( this -> TwistV != ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ) { this -> TwistV = ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ; this -> Modified ( ) ; } } virtual vtkTypeBool GetJoinUMinValueJoinVMinValueJoinWMinValueTwistUMinValueTwistVMinValue ( ) { return 0 ; } virtual vtkTypeBool GetJoinUMaxValueJoinVMaxValueJoinWMaxValueTwistUMaxValueTwistVMaxValue ( ) { return 1 ; } ; virtual vtkTypeBool GetMinimumUMaximumUMinimumVMaximumVMinimumWMaximumWJoinUJoinVJoinWTwistUTwistV ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TwistV  of  << this -> TwistV ) ; return this -> TwistV ; } ; virtual void TwistVOn ( ) { this -> SetJoinUJoinVJoinWTwistUTwistV ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void TwistVOff ( ) { this -> SetJoinUJoinVJoinWTwistUTwistV ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the flag which joins the ends of the
##  triangle strips with a twist.
##  JoinW must also be set if this is set.
##  Used when building some non-orientable surfaces.
##  virtual void SetJoinUJoinVJoinWTwistUTwistVTwistW ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << TwistW  to  << _arg ) ; if ( this -> TwistW != ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ) { this -> TwistW = ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ; this -> Modified ( ) ; } } virtual vtkTypeBool GetJoinUMinValueJoinVMinValueJoinWMinValueTwistUMinValueTwistVMinValueTwistWMinValue ( ) { return 0 ; } virtual vtkTypeBool GetJoinUMaxValueJoinVMaxValueJoinWMaxValueTwistUMaxValueTwistVMaxValueTwistWMaxValue ( ) { return 1 ; } ; virtual vtkTypeBool GetMinimumUMaximumUMinimumVMaximumVMinimumWMaximumWJoinUJoinVJoinWTwistUTwistVTwistW ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TwistW  of  << this -> TwistW ) ; return this -> TwistW ; } ; virtual void TwistWOn ( ) { this -> SetJoinUJoinVJoinWTwistUTwistVTwistW ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void TwistWOff ( ) { this -> SetJoinUJoinVJoinWTwistUTwistVTwistW ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the flag which determines the ordering of the
##  vertices forming the triangle strips. The ordering of the
##  points being inserted into the triangle strip is important
##  because it determines the direction of the normals for the
##  lighting. If set, the ordering is clockwise, otherwise the
##  ordering is anti-clockwise. Default is true (i.e. clockwise
##  ordering).
##  virtual void SetJoinUJoinVJoinWTwistUTwistVTwistWClockwiseOrdering ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ClockwiseOrdering  to  << _arg ) ; if ( this -> ClockwiseOrdering != ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ) { this -> ClockwiseOrdering = ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ; this -> Modified ( ) ; } } virtual vtkTypeBool GetJoinUMinValueJoinVMinValueJoinWMinValueTwistUMinValueTwistVMinValueTwistWMinValueClockwiseOrderingMinValue ( ) { return 0 ; } virtual vtkTypeBool GetJoinUMaxValueJoinVMaxValueJoinWMaxValueTwistUMaxValueTwistVMaxValueTwistWMaxValueClockwiseOrderingMaxValue ( ) { return 1 ; } ; virtual vtkTypeBool GetMinimumUMaximumUMinimumVMaximumVMinimumWMaximumWJoinUJoinVJoinWTwistUTwistVTwistWClockwiseOrdering ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ClockwiseOrdering  of  << this -> ClockwiseOrdering ) ; return this -> ClockwiseOrdering ; } ; virtual void ClockwiseOrderingOn ( ) { this -> SetJoinUJoinVJoinWTwistUTwistVTwistWClockwiseOrdering ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ClockwiseOrderingOff ( ) { this -> SetJoinUJoinVJoinWTwistUTwistVTwistWClockwiseOrdering ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the flag which determines whether derivatives are available
##  from the parametric function (i.e., whether the Evaluate() method
##  returns valid derivatives).
##  virtual void SetJoinUJoinVJoinWTwistUTwistVTwistWClockwiseOrderingDerivativesAvailable ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << DerivativesAvailable  to  << _arg ) ; if ( this -> DerivativesAvailable != ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ) { this -> DerivativesAvailable = ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ; this -> Modified ( ) ; } } virtual vtkTypeBool GetJoinUMinValueJoinVMinValueJoinWMinValueTwistUMinValueTwistVMinValueTwistWMinValueClockwiseOrderingMinValueDerivativesAvailableMinValue ( ) { return 0 ; } virtual vtkTypeBool GetJoinUMaxValueJoinVMaxValueJoinWMaxValueTwistUMaxValueTwistVMaxValueTwistWMaxValueClockwiseOrderingMaxValueDerivativesAvailableMaxValue ( ) { return 1 ; } ; virtual vtkTypeBool GetMinimumUMaximumUMinimumVMaximumVMinimumWMaximumWJoinUJoinVJoinWTwistUTwistVTwistWClockwiseOrderingDerivativesAvailable ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DerivativesAvailable  of  << this -> DerivativesAvailable ) ; return this -> DerivativesAvailable ; } ; virtual void DerivativesAvailableOn ( ) { this -> SetJoinUJoinVJoinWTwistUTwistVTwistWClockwiseOrderingDerivativesAvailable ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void DerivativesAvailableOff ( ) { this -> SetJoinUJoinVJoinWTwistUTwistVTwistWClockwiseOrderingDerivativesAvailable ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkParametricFunction ( ) ; ~ vtkParametricFunction ( ) override ;  Variables double MinimumU ; double MaximumU ; double MinimumV ; double MaximumV ; double MinimumW ; double MaximumW ; vtkTypeBool JoinU ; vtkTypeBool JoinV ; vtkTypeBool JoinW ; vtkTypeBool TwistU ; vtkTypeBool TwistV ; vtkTypeBool TwistW ; vtkTypeBool ClockwiseOrdering ; vtkTypeBool DerivativesAvailable ; private : vtkParametricFunction ( const vtkParametricFunction & ) = delete ; void operator = ( const vtkParametricFunction & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
