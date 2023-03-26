## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkEllipsoidalGaussianKernel.h
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
##  @class   vtkEllipsoidalGaussianKernel
##  @brief   an ellipsoidal Gaussian interpolation kernel
##
##
##  vtkEllipsoidalGaussianKernel is an interpolation kernel that returns the
##  weights for all points found in the ellipsoid defined by radius R in
##  combination with local data (normals and/or scalars). For example, "pancake"
##  weightings (the local normal parallel to the minimum ellisoidal axis); or
##  "needle" weightings (the local normal parallel to the maximum ellipsoidal
##  axis) are possible. (Note that spherical Gaussian weightings are more
##  efficiently computed using vtkGaussianKernel.)
##
##  The ellipsoidal Gaussian can be described by:
##
##      W(x) = S * exp( -( Sharpness^2 * ((rxy/E)**2 + z**2)/R**2) )
##
##  where S is the local scalar value; E is a user-defined eccentricity factor
##  that controls the elliptical shape of the splat; z is the distance of the
##  current voxel sample point along the local normal N; and rxy is the
##  distance to neighbor point x in the direction prependicular to N.
##
##  @warning
##  The weights are normalized so that SUM(Wi) = 1. If a neighbor point p
##  precisely lies on the point to be interpolated, then the interpolated
##  point takes on the values associated with p.
##
##  @sa
##  vtkPointInterpolator vtkInterpolationKernel vtkGeneralizedKernel
##  vtkGaussianKernel vtkVoronoiKernel vtkSPHKernel vtkShepardKernel
##

## !!!Ignored construct:  # vtkEllipsoidalGaussianKernel_h [NewLine] # vtkEllipsoidalGaussianKernel_h [NewLine] # vtkFiltersPointsModule.h  For export macro # vtkGeneralizedKernel.h [NewLine] # vtkStdString.h  For vtkStdString ivars [NewLine] class vtkIdList ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDataArray"
discard "forward decl of vtkDoubleArray"
## !!!Ignored construct:  class VTKFILTERSPOINTS_EXPORT vtkEllipsoidalGaussianKernel : public vtkGeneralizedKernel { public : /@{ *
##  Standard methods for instantiation, obtaining type information, and printing.
##  static vtkEllipsoidalGaussianKernel * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkGeneralizedKernel Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkGeneralizedKernel :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkEllipsoidalGaussianKernel :: IsTypeOf ( type ) ; } static vtkEllipsoidalGaussianKernel * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkEllipsoidalGaussianKernel * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkEllipsoidalGaussianKernel * NewInstance ( ) const { return vtkEllipsoidalGaussianKernel :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGeneralizedKernel :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkEllipsoidalGaussianKernel :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkEllipsoidalGaussianKernel :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  Initialize the kernel. Overload the superclass to set up scalars and
##  vectors.
##  void Initialize ( vtkAbstractPointLocator * loc , vtkDataSet * ds , vtkPointData * pd ) override ;  Re-use any superclass signatures that we don't override. using vtkGeneralizedKernel :: ComputeWeights ; *
##  Given a point x, a list of basis points pIds, and a probability
##  weighting function prob, compute interpolation weights associated with
##  these basis points.  Note that basis points list pIds, the probability
##  weighting prob, and the weights array are provided by the caller of the
##  method, and may be dynamically resized as necessary. The method returns
##  the number of weights (pIds may be resized in some cases). Typically
##  this method is called after ComputeBasis(), although advanced users can
##  invoke ComputeWeights() and provide the interpolation basis points pIds
##  directly. The probably weighting prob are numbers 0<=prob<=1 which are
##  multiplied against the interpolation weights before normalization. They
##  are estimates of local confidence of weights. The prob may be nullptr in
##  which all probabilities are considered =1.
##  vtkIdType ComputeWeights ( double x [ 3 ] , vtkIdList * pIds , vtkDoubleArray * prob , vtkDoubleArray * weights ) override ; /@{ *
##  Specify whether vector values should be used to affect the shape
##  of the Gaussian distribution. By default this is on.
##  virtual void SetUseNormals ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseNormals  to  << _arg ) ; if ( this -> UseNormals != _arg ) { this -> UseNormals = _arg ; this -> Modified ( ) ; } } ; virtual bool GetUseNormals ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseNormals  of  << this -> UseNormals ) ; return this -> UseNormals ; } ; virtual void UseNormalsOn ( ) { this -> SetUseNormals ( static_cast < bool > ( 1 ) ) ; } virtual void UseNormalsOff ( ) { this -> SetUseNormals ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify the normals array name. Used to orient the ellipsoid. Note that
##  by default the input normals are used (i.e. the input to
##  vtkPointInterpolator). If no input normals are available, then the named
##  NormalsArrayName is used.
##  virtual void SetUseNormalsNormalsArrayName ( vtkStdString _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NormalsArrayName  to  << _arg ) ; if ( this -> NormalsArrayName != _arg ) { this -> NormalsArrayName = _arg ; this -> Modified ( ) ; } } ; virtual vtkStdString GetUseNormalsNormalsArrayName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NormalsArrayName  of  << this -> NormalsArrayName ) ; return this -> NormalsArrayName ; } ; /@} /@{ *
##  Specify whether scalar values should be used to scale the weights.
##  By default this is off.
##  virtual void SetUseNormalsNormalsArrayNameUseScalars ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseScalars  to  << _arg ) ; if ( this -> UseScalars != _arg ) { this -> UseScalars = _arg ; this -> Modified ( ) ; } } ; virtual bool GetUseNormalsNormalsArrayNameUseScalars ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseScalars  of  << this -> UseScalars ) ; return this -> UseScalars ; } ; virtual void UseScalarsOn ( ) { this -> SetUseNormalsUseScalars ( static_cast < bool > ( 1 ) ) ; } virtual void UseScalarsOff ( ) { this -> SetUseNormalsUseScalars ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify the scalars array name. Used to scale the ellipsoid. Note that
##  by default the input scalars are used (i.e. the input to
##  vtkPointInterpolator). If no input scalars are available, then the named
##  ScalarsArrayName is used.
##  virtual void SetUseNormalsNormalsArrayNameUseScalarsScalarsArrayName ( vtkStdString _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ScalarsArrayName  to  << _arg ) ; if ( this -> ScalarsArrayName != _arg ) { this -> ScalarsArrayName = _arg ; this -> Modified ( ) ; } } ; virtual vtkStdString GetUseNormalsNormalsArrayNameUseScalarsScalarsArrayName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarsArrayName  of  << this -> ScalarsArrayName ) ; return this -> ScalarsArrayName ; } ; /@} /@{ *
##  Multiply the Gaussian splat distribution by this value. If UseScalars is
##  on and a scalar array is provided, then the scalar value will be
##  multiplied by the ScaleFactor times the Gaussian function.
##  virtual void SetScaleFactor ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ScaleFactor  to  << _arg ) ; if ( this -> ScaleFactor != ( _arg < 0.0 ? 0.0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ) { this -> ScaleFactor = ( _arg < 0.0 ? 0.0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetScaleFactorMinValue ( ) { return 0.0 ; } virtual double GetScaleFactorMaxValue ( ) { return VTK_DOUBLE_MAX ; } ; virtual double GetUseNormalsNormalsArrayNameUseScalarsScalarsArrayNameScaleFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScaleFactor  of  << this -> ScaleFactor ) ; return this -> ScaleFactor ; } ; /@} /@{ *
##  Set / Get the sharpness (i.e., falloff) of the Gaussian. By default
##  Sharpness=2. As the sharpness increases the effects of distant points
##  are reduced.
##  virtual void SetScaleFactorSharpness ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Sharpness  to  << _arg ) ; if ( this -> Sharpness != ( _arg < 1 ? 1 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ) { this -> Sharpness = ( _arg < 1 ? 1 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetScaleFactorMinValueSharpnessMinValue ( ) { return 1 ; } virtual double GetScaleFactorMaxValueSharpnessMaxValue ( ) { return VTK_FLOAT_MAX ; } ; virtual double GetUseNormalsNormalsArrayNameUseScalarsScalarsArrayNameScaleFactorSharpness ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Sharpness  of  << this -> Sharpness ) ; return this -> Sharpness ; } ; /@} /@{ *
##  Set / Get the eccentricity of the ellipsoidal Gaussian. A value=1.0
##  produces a spherical distribution. Values < 1 produce a needle like
##  distribution (in the direction of the normal); values > 1 produce a
##  pancake like distribution (orthogonal to the normal).
##  virtual void SetScaleFactorSharpnessEccentricity ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Eccentricity  to  << _arg ) ; if ( this -> Eccentricity != ( _arg < 0.000001 ? 0.000001 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ) { this -> Eccentricity = ( _arg < 0.000001 ? 0.000001 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetScaleFactorMinValueSharpnessMinValueEccentricityMinValue ( ) { return 0.000001 ; } virtual double GetScaleFactorMaxValueSharpnessMaxValueEccentricityMaxValue ( ) { return VTK_FLOAT_MAX ; } ; virtual double GetUseNormalsNormalsArrayNameUseScalarsScalarsArrayNameScaleFactorSharpnessEccentricity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Eccentricity  of  << this -> Eccentricity ) ; return this -> Eccentricity ; } ; /@} protected : vtkEllipsoidalGaussianKernel ( ) ; ~ vtkEllipsoidalGaussianKernel ( ) override ; bool UseNormals ; bool UseScalars ; vtkStdString NormalsArrayName ; vtkStdString ScalarsArrayName ; double ScaleFactor ; double Sharpness ; double Eccentricity ;  Internal structure to reduce computation double F2 , E2 ; vtkDataArray * NormalsArray ; vtkDataArray * ScalarsArray ; void FreeStructures ( ) override ; private : vtkEllipsoidalGaussianKernel ( const vtkEllipsoidalGaussianKernel & ) = delete ; void operator = ( const vtkEllipsoidalGaussianKernel & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
