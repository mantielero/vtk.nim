## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCoordinateFrame.h
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
##  @class   vtkCoordinateFrame
##  @brief   implicit function for a right-handed coordinate system
##
##  vtkCoordinateFrame computes an implicit function and function gradient
##  for a set of 3 orthogonal planes.
##
##  The function evaluates to a combination of quartic spherical harmonic
##  basis functions:
##  \f$\sqrt(\frac{7}{12})*Y_{4,0} + \sqrt(\frac{5}{12})*Y_{4,4}\f$
##  that – when evaluated on a unit sphere centered at the coordinate frame's
##  origin – form a 6-lobed function with a maximum along each of the
##  6 axes (3 positive, 3 negative).
##  This function is frequently used in frame-field design.
##
##  See the paper "On Smooth Frame Field Design" by Nicolas Ray and
##  Dmitry Sokolov (2016, hal-01245657,
##  https://hal.inria.fr/hal-01245657/file/framefield.pdf ) for more
##  information.
##

## !!!Ignored construct:  # vtkCoordinateFrame_h [NewLine] # vtkCoordinateFrame_h [NewLine] # vtkCommonDataModelModule.h  For export macro # vtkImplicitFunction.h [NewLine] class vtkPlane ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDataArray"
## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkCoordinateFrame : public vtkImplicitFunction { public : /@{ *
##  Standard methods for instantiation, type information, and printing.
##  static vtkCoordinateFrame * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImplicitFunction Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImplicitFunction :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkCoordinateFrame :: IsTypeOf ( type ) ; } static vtkCoordinateFrame * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkCoordinateFrame * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkCoordinateFrame * NewInstance ( ) const { return vtkCoordinateFrame :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImplicitFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCoordinateFrame :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCoordinateFrame :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Evaluate plane equations. Return largest value (i.e., an intersection
##  operation between all planes).
##  using vtkImplicitFunction :: EvaluateFunction ; double EvaluateFunction ( double x [ 3 ] ) override ; /@} *
##  Evaluate coordinate frame gradient.
##
##  \a n is the output gradient evaluated at point \a x.
##  void EvaluateGradient ( double x [ 3 ] , double n [ 3 ] ) override ; /@{ *
##  Specify the point through which all 3 planes pass.
##  virtual void SetOrigin ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Origin  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> Origin [ 0 ] != _arg1 ) || ( this -> Origin [ 1 ] != _arg2 ) || ( this -> Origin [ 2 ] != _arg3 ) ) { this -> Origin [ 0 ] = _arg1 ; this -> Origin [ 1 ] = _arg2 ; this -> Origin [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetOrigin ( const double _arg [ 3 ] ) { this -> SetOrigin ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetOrigin ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Origin  pointer  << this -> Origin ) ; return this -> Origin ; } VTK_WRAPEXCLUDE virtual void GetOrigin ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Origin [ 0 ] ; _arg2 = this -> Origin [ 1 ] ; _arg3 = this -> Origin [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Origin  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetOrigin ( double _arg [ 3 ] ) { this -> GetOrigin ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  Specify a list of unit-length normal vectors for each plane.
##  virtual void SetOriginXAxis ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << XAxis  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> XAxis [ 0 ] != _arg1 ) || ( this -> XAxis [ 1 ] != _arg2 ) || ( this -> XAxis [ 2 ] != _arg3 ) ) { this -> XAxis [ 0 ] = _arg1 ; this -> XAxis [ 1 ] = _arg2 ; this -> XAxis [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetOriginXAxis ( const double _arg [ 3 ] ) { this -> SetOriginXAxis ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetOriginXAxis ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << XAxis  pointer  << this -> XAxis ) ; return this -> XAxis ; } VTK_WRAPEXCLUDE virtual void GetOriginXAxis ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> XAxis [ 0 ] ; _arg2 = this -> XAxis [ 1 ] ; _arg3 = this -> XAxis [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << XAxis  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetOriginXAxis ( double _arg [ 3 ] ) { this -> GetOriginXAxis ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual void SetOriginXAxisYAxis ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << YAxis  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> YAxis [ 0 ] != _arg1 ) || ( this -> YAxis [ 1 ] != _arg2 ) || ( this -> YAxis [ 2 ] != _arg3 ) ) { this -> YAxis [ 0 ] = _arg1 ; this -> YAxis [ 1 ] = _arg2 ; this -> YAxis [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetOriginXAxisYAxis ( const double _arg [ 3 ] ) { this -> SetOriginXAxisYAxis ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetOriginXAxisYAxis ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << YAxis  pointer  << this -> YAxis ) ; return this -> YAxis ; } VTK_WRAPEXCLUDE virtual void GetOriginXAxisYAxis ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> YAxis [ 0 ] ; _arg2 = this -> YAxis [ 1 ] ; _arg3 = this -> YAxis [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << YAxis  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetOriginXAxisYAxis ( double _arg [ 3 ] ) { this -> GetOriginXAxisYAxis ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual void SetOriginXAxisYAxisZAxis ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << ZAxis  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> ZAxis [ 0 ] != _arg1 ) || ( this -> ZAxis [ 1 ] != _arg2 ) || ( this -> ZAxis [ 2 ] != _arg3 ) ) { this -> ZAxis [ 0 ] = _arg1 ; this -> ZAxis [ 1 ] = _arg2 ; this -> ZAxis [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetOriginXAxisYAxisZAxis ( const double _arg [ 3 ] ) { this -> SetOriginXAxisYAxisZAxis ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetOriginXAxisYAxisZAxis ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ZAxis  pointer  << this -> ZAxis ) ; return this -> ZAxis ; } VTK_WRAPEXCLUDE virtual void GetOriginXAxisYAxisZAxis ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> ZAxis [ 0 ] ; _arg2 = this -> ZAxis [ 1 ] ; _arg3 = this -> ZAxis [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << ZAxis  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetOriginXAxisYAxisZAxis ( double _arg [ 3 ] ) { this -> GetOriginXAxisYAxisZAxis ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} protected : vtkCoordinateFrame ( ) = default ; ~ vtkCoordinateFrame ( ) override = default ; double Origin [ 3 ] = { 0 , 0 , 0 } ; double XAxis [ 3 ] = { 1 , 0 , 0 } ; double YAxis [ 3 ] = { 0 , 1 , 0 } ; double ZAxis [ 3 ] = { 0 , 0 , 1 } ; private : vtkCoordinateFrame ( const vtkCoordinateFrame & ) = delete ; void operator = ( const vtkCoordinateFrame & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
