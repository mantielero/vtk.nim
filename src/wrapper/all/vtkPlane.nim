## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPlane.h
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
##  @class   vtkPlane
##  @brief   perform various plane computations
##
##  vtkPlane provides methods for various plane computations. These include
##  projecting points onto a plane, evaluating the plane equation, and
##  returning plane normal. vtkPlane is a concrete implementation of the
##  abstract class vtkImplicitFunction.
##

## !!!Ignored construct:  # vtkPlane_h [NewLine] # vtkPlane_h [NewLine] # vtkCommonDataModelModule.h  For export macro # vtkImplicitFunction.h [NewLine] class vtkPoints ;
## Error: token expected: ; but got: [identifier]!!!

##  forward declaration

## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkPlane : public vtkImplicitFunction { public : *
##  Construct plane passing through origin and normal to z-axis.
##  static vtkPlane * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImplicitFunction Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImplicitFunction :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPlane :: IsTypeOf ( type ) ; } static vtkPlane * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPlane * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPlane * NewInstance ( ) const { return vtkPlane :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImplicitFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPlane :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPlane :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Evaluate plane equation for point x[3].
##  using vtkImplicitFunction :: EvaluateFunction ; void EvaluateFunction ( vtkDataArray * input , vtkDataArray * output ) override ; double EvaluateFunction ( double x [ 3 ] ) override ; /@} *
##  Evaluate function gradient at point x[3].
##  void EvaluateGradient ( double x [ 3 ] , double g [ 3 ] ) override ; /@{ *
##  Set/get plane normal. Plane is defined by point and normal.
##  virtual void SetNormal ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Normal  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> Normal [ 0 ] != _arg1 ) || ( this -> Normal [ 1 ] != _arg2 ) || ( this -> Normal [ 2 ] != _arg3 ) ) { this -> Normal [ 0 ] = _arg1 ; this -> Normal [ 1 ] = _arg2 ; this -> Normal [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetNormal ( const double _arg [ 3 ] ) { this -> SetNormal ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetNormal ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Normal  pointer  << this -> Normal ) ; return this -> Normal ; } VTK_WRAPEXCLUDE virtual void GetNormal ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Normal [ i ] ; } } ; /@} /@{ *
##  Set/get point through which plane passes. Plane is defined by point
##  and normal.
##  virtual void SetNormalOrigin ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Origin  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> Origin [ 0 ] != _arg1 ) || ( this -> Origin [ 1 ] != _arg2 ) || ( this -> Origin [ 2 ] != _arg3 ) ) { this -> Origin [ 0 ] = _arg1 ; this -> Origin [ 1 ] = _arg2 ; this -> Origin [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetNormalOrigin ( const double _arg [ 3 ] ) { this -> SetNormalOrigin ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetNormalOrigin ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Origin  pointer  << this -> Origin ) ; return this -> Origin ; } VTK_WRAPEXCLUDE virtual void GetNormalOrigin ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Origin [ i ] ; } } ; /@} *
##  Translate the plane in the direction of the normal by the
##  distance specified.  Negative values move the plane in the
##  opposite direction.
##  void Push ( double distance ) ; /@{ *
##  Project a point x onto plane defined by origin and normal. The
##  projected point is returned in xproj. NOTE : normal assumed to
##  have magnitude 1.
##  static void ProjectPoint ( const double x [ 3 ] , const double origin [ 3 ] , const double normal [ 3 ] , double xproj [ 3 ] ) ; void ProjectPoint ( const double x [ 3 ] , double xproj [ 3 ] ) ; /@} /@{ *
##  Project a vector v onto plane defined by origin and normal. The
##  projected vector is returned in vproj.
##  static void ProjectVector ( const double v [ 3 ] , const double origin [ 3 ] , const double normal [ 3 ] , double vproj [ 3 ] ) ; void ProjectVector ( const double v [ 3 ] , double vproj [ 3 ] ) ; /@} /@{ *
##  Project a point x onto plane defined by origin and normal. The
##  projected point is returned in xproj. NOTE : normal does NOT have to
##  have magnitude 1.
##  static void GeneralizedProjectPoint ( const double x [ 3 ] , const double origin [ 3 ] , const double normal [ 3 ] , double xproj [ 3 ] ) ; void GeneralizedProjectPoint ( const double x [ 3 ] , double xproj [ 3 ] ) ; /@} *
##  Quick evaluation of plane equation n(x-origin)=0.
##  static double Evaluate ( double normal [ 3 ] , double origin [ 3 ] , double x [ 3 ] ) ; /@{ *
##  Return the distance of a point x to a plane defined by n(x-p0) = 0. The
##  normal n[3] must be magnitude=1.
##  static double DistanceToPlane ( double x [ 3 ] , double n [ 3 ] , double p0 [ 3 ] ) ; double DistanceToPlane ( double x [ 3 ] ) ; /@} /@{ *
##  Given a line defined by the two points p1,p2; and a plane defined by the
##  normal n and point p0, compute an intersection. The parametric
##  coordinate along the line is returned in t, and the coordinates of
##  intersection are returned in x. A zero is returned if the plane and line
##  do not intersect between (0<=t<=1). If the plane and line are parallel,
##  zero is returned and t is set to VTK_LARGE_DOUBLE.
##  static int IntersectWithLine ( const double p1 [ 3 ] , const double p2 [ 3 ] , double n [ 3 ] , double p0 [ 3 ] , double & t , double x [ 3 ] ) ; int IntersectWithLine ( const double p1 [ 3 ] , const double p2 [ 3 ] , double & t , double x [ 3 ] ) ; /@} /@{ *
##  Given two planes, one infinite and one finite, defined by the normal n
##  and point o (infinite plane), and the second finite plane1 defined by
##  the three points (pOrigin,px,py), compute a line of intersection (if
##  any). The line of intersection is defined by the return values
##  (x0,x1). If there is no intersection, then zero is returned; otherwise
##  non-zero. There are two variants of this method. The static function
##  operates on the supplied function parameters; the non-static operates on
##  this instance of vtkPlane (and its associated origin and normal).
##  static int IntersectWithFinitePlane ( double n [ 3 ] , double o [ 3 ] , double pOrigin [ 3 ] , double px [ 3 ] , double py [ 3 ] , double x0 [ 3 ] , double x1 [ 3 ] ) ; int IntersectWithFinitePlane ( double pOrigin [ 3 ] , double px [ 3 ] , double py [ 3 ] , double x0 [ 3 ] , double x1 [ 3 ] ) ; /@} /@{ *
##  Given a set of points calculate the best-fitting origin and normal for the plane.
##  The origin will be the centroid of the points. The normal is determined
##  by using the covariance matrix of the points relative to the centroid.
##  Returns true if successful. If not successful the origin will still contain
##  the centroid and the normal will point into z-direction.
##  static bool ComputeBestFittingPlane ( vtkPoints * pts , double * origin , double * normal ) ; /@} protected : vtkPlane ( ) ; ~ vtkPlane ( ) override = default ; double Normal [ 3 ] ; double Origin [ 3 ] ; private : vtkPlane ( const vtkPlane & ) = delete ; void operator = ( const vtkPlane & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

##  Generally the normal should be normalized

proc Evaluate*(normal: array[3, cdouble]; origin: array[3, cdouble];
              x: array[3, cdouble]): cdouble {.
    importcpp: "VTKCOMMONDATAMODEL_EXPORT::Evaluate(@)", header: "vtkPlane.h".}
##  Assumes normal is normalized

proc DistanceToPlane*(x: array[3, cdouble]; n: array[3, cdouble]; p0: array[3, cdouble]): cdouble {.
    importcpp: "VTKCOMMONDATAMODEL_EXPORT::DistanceToPlane(@)",
    header: "vtkPlane.h".}