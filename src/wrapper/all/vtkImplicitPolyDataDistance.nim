## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImplicitPolyDataDistance.h
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
##  @class   vtkImplicitPolyDataDistance
##  @brief   Implicit function that computes the distance from a point x to the nearest point p on an
##  input vtkPolyData.
##
##  Implicit function that computes the distance from a point x to the
##  nearest point p on an input vtkPolyData. The sign of the function
##  is set to the sign of the dot product between the angle-weighted
##  pseudonormal at the nearest surface point and the vector x - p.
##  Points interior to the geometry have a negative distance, points on
##  the exterior have a positive distance, and points on the input
##  vtkPolyData have a distance of zero. The gradient of the function
##  is the angle-weighted pseudonormal at the nearest point.
##
##  Baerentzen, J. A. and Aanaes, H. (2005). Signed distance
##  computation using the angle weighted pseudonormal. IEEE
##  Transactions on Visualization and Computer Graphics, 11:243-253.
##
##  This code was contributed in the VTK Journal paper:
##  "Boolean Operations on Surfaces in VTK Without External Libraries"
##  by Cory Quammen, Chris Weigle C., Russ Taylor
##  http://hdl.handle.net/10380/3262
##  http://www.midasjournal.org/browse/publication/797
##

## !!!Ignored construct:  # vtkImplicitPolyDataDistance_h [NewLine] # vtkImplicitPolyDataDistance_h [NewLine] # vtkFiltersCoreModule.h  For export macro # vtkImplicitFunction.h [NewLine] class vtkCellLocator ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkPolyData"
## !!!Ignored construct:  class VTKFILTERSCORE_EXPORT vtkImplicitPolyDataDistance : public vtkImplicitFunction { public : static vtkImplicitPolyDataDistance * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImplicitFunction Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImplicitFunction :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImplicitPolyDataDistance :: IsTypeOf ( type ) ; } static vtkImplicitPolyDataDistance * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImplicitPolyDataDistance * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImplicitPolyDataDistance * NewInstance ( ) const { return vtkImplicitPolyDataDistance :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImplicitFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImplicitPolyDataDistance :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImplicitPolyDataDistance :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Return the MTime also considering the Input dependency.
##  vtkMTimeType GetMTime ( ) override ; *
##  Evaluate plane equation of nearest triangle to point x[3].
##  using vtkImplicitFunction :: EvaluateFunction ; double EvaluateFunction ( double x [ 3 ] ) override ; *
##  Evaluate function gradient of nearest triangle to point x[3].
##  void EvaluateGradient ( double x [ 3 ] , double g [ 3 ] ) override ; *
##  Evaluate plane equation of nearest triangle to point x[3] and provides closest point on an
##  input vtkPolyData.
##  double EvaluateFunctionAndGetClosestPoint ( double x [ 3 ] , double closestPoint [ 3 ] ) ; *
##  Set the input vtkPolyData used for the implicit function
##  evaluation.  Passes input through an internal instance of
##  vtkTriangleFilter to remove vertices and lines, leaving only
##  triangular polygons for evaluation as implicit planes.
##  void SetInput ( vtkPolyData * input ) ; /@{ *
##  Set/get the function value to use if no input vtkPolyData
##  specified.
##  virtual void SetNoValue ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NoValue  to  << _arg ) ; if ( this -> NoValue != _arg ) { this -> NoValue = _arg ; this -> Modified ( ) ; } } ; virtual double GetNoValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NoValue  of  << this -> NoValue ) ; return this -> NoValue ; } ; /@} /@{ *
##  Set/get the function gradient to use if no input vtkPolyData
##  specified.
##  virtual void SetNoGradient ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << NoGradient  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> NoGradient [ 0 ] != _arg1 ) || ( this -> NoGradient [ 1 ] != _arg2 ) || ( this -> NoGradient [ 2 ] != _arg3 ) ) { this -> NoGradient [ 0 ] = _arg1 ; this -> NoGradient [ 1 ] = _arg2 ; this -> NoGradient [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetNoGradient ( const double _arg [ 3 ] ) { this -> SetNoGradient ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetNoGradient ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << NoGradient  pointer  << this -> NoGradient ) ; return this -> NoGradient ; } VTK_WRAPEXCLUDE virtual void GetNoGradient ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> NoGradient [ 0 ] ; _arg2 = this -> NoGradient [ 1 ] ; _arg3 = this -> NoGradient [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << NoGradient  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetNoGradient ( double _arg [ 3 ] ) { this -> GetNoGradient ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  Set/get the closest point to use if no input vtkPolyData
##  specified.
##  virtual void SetNoGradientNoClosestPoint ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << NoClosestPoint  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> NoClosestPoint [ 0 ] != _arg1 ) || ( this -> NoClosestPoint [ 1 ] != _arg2 ) || ( this -> NoClosestPoint [ 2 ] != _arg3 ) ) { this -> NoClosestPoint [ 0 ] = _arg1 ; this -> NoClosestPoint [ 1 ] = _arg2 ; this -> NoClosestPoint [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetNoGradientNoClosestPoint ( const double _arg [ 3 ] ) { this -> SetNoGradientNoClosestPoint ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetNoGradientNoClosestPoint ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << NoClosestPoint  pointer  << this -> NoClosestPoint ) ; return this -> NoClosestPoint ; } VTK_WRAPEXCLUDE virtual void GetNoGradientNoClosestPoint ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> NoClosestPoint [ 0 ] ; _arg2 = this -> NoClosestPoint [ 1 ] ; _arg3 = this -> NoClosestPoint [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << NoClosestPoint  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetNoGradientNoClosestPoint ( double _arg [ 3 ] ) { this -> GetNoGradientNoClosestPoint ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  Set/get the tolerance usued for the locator.
##  virtual double GetNoValueTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tolerance  of  << this -> Tolerance ) ; return this -> Tolerance ; } ; virtual void SetNoValueTolerance ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Tolerance  to  << _arg ) ; if ( this -> Tolerance != _arg ) { this -> Tolerance = _arg ; this -> Modified ( ) ; } } ; /@} protected : vtkImplicitPolyDataDistance ( ) ; ~ vtkImplicitPolyDataDistance ( ) override ; *
##  Create default locator. Used to create one when none is specified.
##  void CreateDefaultLocator ( void ) ; double SharedEvaluate ( double x [ 3 ] , double g [ 3 ] , double closestPoint [ 3 ] ) ; double NoGradient [ 3 ] ; double NoClosestPoint [ 3 ] ; double NoValue ; double Tolerance ; vtkPolyData * Input ; vtkCellLocator * Locator ; private : vtkImplicitPolyDataDistance ( const vtkImplicitPolyDataDistance & ) = delete ; void operator = ( const vtkImplicitPolyDataDistance & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
