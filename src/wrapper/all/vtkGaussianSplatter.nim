## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGaussianSplatter.h
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
##  @class   vtkGaussianSplatter
##  @brief   splat points into a volume with an elliptical, Gaussian distribution
##
##  vtkGaussianSplatter is a filter that injects input points into a
##  structured points (volume) dataset. As each point is injected, it "splats"
##  or distributes values to nearby voxels. Data is distributed using an
##  elliptical, Gaussian distribution function. The distribution function is
##  modified using scalar values (expands distribution) or normals
##  (creates ellipsoidal distribution rather than spherical).
##
##  In general, the Gaussian distribution function f(x) around a given
##  splat point p is given by
##
##      f(x) = ScaleFactor * exp( ExponentFactor*((r/Radius)**2) )
##
##  where x is the current voxel sample point; r is the distance |x-p|
##  ExponentFactor <= 0.0, and ScaleFactor can be multiplied by the scalar
##  value of the point p that is currently being splatted.
##
##  If points normals are present (and NormalWarping is on), then the splat
##  function becomes elliptical (as compared to the spherical one described
##  by the previous equation). The Gaussian distribution function then
##  becomes:
##
##      f(x) = ScaleFactor *
##                exp( ExponentFactor*( ((rxy/E)**2 + z**2)/R**2) )
##
##  where E is a user-defined eccentricity factor that controls the elliptical
##  shape of the splat; z is the distance of the current voxel sample point
##  along normal N; and rxy is the distance of x in the direction
##  prependicular to N.
##
##  This class is typically used to convert point-valued distributions into
##  a volume representation. The volume is then usually iso-surfaced or
##  volume rendered to generate a visualization. It can be used to create
##  surfaces from point distributions, or to create structure (i.e.,
##  topology) when none exists.
##
##  @warning
##  The input to this filter is any dataset type. This filter can be used
##  to resample any form of data, i.e., the input data need not be
##  unstructured.
##
##  @warning
##  Some voxels may never receive a contribution during the splatting process.
##  The final value of these points can be specified with the "NullValue"
##  instance variable.
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @sa
##  vtkShepardMethod vtkCheckerboardSplatter
##

## !!!Ignored construct:  # vtkGaussianSplatter_h [NewLine] # vtkGaussianSplatter_h [NewLine] # vtkImageAlgorithm.h [NewLine] # vtkImagingHybridModule.h  For export macro [NewLine] # < cmath >  for std::exp [NewLine] # VTK_ACCUMULATION_MODE_MIN 0 [NewLine] # VTK_ACCUMULATION_MODE_MAX 1 [NewLine] # VTK_ACCUMULATION_MODE_SUM 2 [NewLine] class vtkDoubleArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkCompositeDataSet"
discard "forward decl of vtkGaussianSplatterAlgorithm"
## !!!Ignored construct:  class VTKIMAGINGHYBRID_EXPORT vtkGaussianSplatter : public vtkImageAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkGaussianSplatter :: IsTypeOf ( type ) ; } static vtkGaussianSplatter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkGaussianSplatter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkGaussianSplatter * NewInstance ( ) const { return vtkGaussianSplatter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGaussianSplatter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGaussianSplatter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct object with dimensions=(50,50,50); automatic computation of
##  bounds; a splat radius of 0.1; an exponent factor of -5; and normal and
##  scalar warping turned on.
##  static vtkGaussianSplatter * New ( ) ; /@{ *
##  Set / get the dimensions of the sampling structured point set. Higher
##  values produce better results but are much slower.
##  void SetSampleDimensions ( int i , int j , int k ) ; void SetSampleDimensions ( int dim [ 3 ] ) ; virtual int * GetSampleDimensions ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << SampleDimensions  pointer  << this -> SampleDimensions ) ; return this -> SampleDimensions ; } VTK_WRAPEXCLUDE virtual void GetSampleDimensions ( int data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> SampleDimensions [ i ] ; } } ; /@} /@{ *
##  Set / get the (xmin,xmax, ymin,ymax, zmin,zmax) bounding box in which
##  the sampling is performed. If any of the (min,max) bounds values are
##  min >= max, then the bounds will be computed automatically from the input
##  data. Otherwise, the user-specified bounds will be used.
##  virtual void SetModelBounds ( double _arg1 , double _arg2 , double _arg3 , double _arg4 , double _arg5 , double _arg6 ) { vtkDebugWithObjectMacro ( this , <<  setting  << ModelBounds  to ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; if ( ( this -> ModelBounds [ 0 ] != _arg1 ) || ( this -> ModelBounds [ 1 ] != _arg2 ) || ( this -> ModelBounds [ 2 ] != _arg3 ) || ( this -> ModelBounds [ 3 ] != _arg4 ) || ( this -> ModelBounds [ 4 ] != _arg5 ) || ( this -> ModelBounds [ 5 ] != _arg6 ) ) { this -> ModelBounds [ 0 ] = _arg1 ; this -> ModelBounds [ 1 ] = _arg2 ; this -> ModelBounds [ 2 ] = _arg3 ; this -> ModelBounds [ 3 ] = _arg4 ; this -> ModelBounds [ 4 ] = _arg5 ; this -> ModelBounds [ 5 ] = _arg6 ; this -> Modified ( ) ; } } virtual void SetModelBounds ( const double _arg [ 6 ] ) { this -> SetModelBounds ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; virtual double * GetSampleDimensionsModelBounds ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ModelBounds  pointer  << this -> ModelBounds ) ; return this -> ModelBounds ; } VTK_WRAPEXCLUDE virtual void GetSampleDimensionsModelBounds ( double data [ 6 ] ) { for ( int i = 0 ; i < 6 ; i ++ ) { data [ i ] = this -> ModelBounds [ i ] ; } } ; /@} /@{ *
##  Set / get the radius of propagation of the splat. This value is expressed
##  as a percentage of the length of the longest side of the sampling
##  volume. Smaller numbers greatly reduce execution time.
##  virtual void SetRadius ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Radius  to  << _arg ) ; if ( this -> Radius != ( _arg < 0.0 ? 0.0 : ( _arg > 1.0 ? 1.0 : _arg ) ) ) { this -> Radius = ( _arg < 0.0 ? 0.0 : ( _arg > 1.0 ? 1.0 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetRadiusMinValue ( ) { return 0.0 ; } virtual double GetRadiusMaxValue ( ) { return 1.0 ; } ; virtual double GetRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Radius  of  << this -> Radius ) ; return this -> Radius ; } ; /@} /@{ *
##  Multiply Gaussian splat distribution by this value. If ScalarWarping
##  is on, then the Scalar value will be multiplied by the ScaleFactor
##  times the Gaussian function.
##  virtual void SetRadiusScaleFactor ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ScaleFactor  to  << _arg ) ; if ( this -> ScaleFactor != ( _arg < 0.0 ? 0.0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ) { this -> ScaleFactor = ( _arg < 0.0 ? 0.0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetRadiusMinValueScaleFactorMinValue ( ) { return 0.0 ; } virtual double GetRadiusMaxValueScaleFactorMaxValue ( ) { return VTK_DOUBLE_MAX ; } ; virtual double GetRadiusScaleFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScaleFactor  of  << this -> ScaleFactor ) ; return this -> ScaleFactor ; } ; /@} /@{ *
##  Set / get the sharpness of decay of the splats. This is the
##  exponent constant in the Gaussian equation. Normally this is
##  a negative value.
##  virtual void SetExponentFactor ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ExponentFactor  to  << _arg ) ; if ( this -> ExponentFactor != _arg ) { this -> ExponentFactor = _arg ; this -> Modified ( ) ; } } ; virtual double GetRadiusScaleFactorExponentFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ExponentFactor  of  << this -> ExponentFactor ) ; return this -> ExponentFactor ; } ; /@} /@{ *
##  Turn on/off the generation of elliptical splats. If normal warping is
##  on, then the input normals affect the distribution of the splat. This
##  boolean is used in combination with the Eccentricity ivar.
##  virtual void SetExponentFactorNormalWarping ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NormalWarping  to  << _arg ) ; if ( this -> NormalWarping != _arg ) { this -> NormalWarping = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetRadiusScaleFactorExponentFactorNormalWarping ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NormalWarping  of  << this -> NormalWarping ) ; return this -> NormalWarping ; } ; virtual void NormalWarpingOn ( ) { this -> SetNormalWarping ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void NormalWarpingOff ( ) { this -> SetNormalWarping ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Control the shape of elliptical splatting. Eccentricity is the ratio
##  of the major axis (aligned along normal) to the minor (axes) aligned
##  along other two axes. So Eccentricity > 1 creates needles with the
##  long axis in the direction of the normal; Eccentricity<1 creates
##  pancakes perpendicular to the normal vector.
##  virtual void SetRadiusScaleFactorEccentricity ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Eccentricity  to  << _arg ) ; if ( this -> Eccentricity != ( _arg < 0.001 ? 0.001 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ) { this -> Eccentricity = ( _arg < 0.001 ? 0.001 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetRadiusMinValueScaleFactorMinValueEccentricityMinValue ( ) { return 0.001 ; } virtual double GetRadiusMaxValueScaleFactorMaxValueEccentricityMaxValue ( ) { return VTK_DOUBLE_MAX ; } ; virtual double GetRadiusScaleFactorExponentFactorNormalWarpingEccentricity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Eccentricity  of  << this -> Eccentricity ) ; return this -> Eccentricity ; } ; /@} /@{ *
##  Turn on/off the scaling of splats by scalar value.
##  virtual void SetExponentFactorNormalWarpingScalarWarping ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ScalarWarping  to  << _arg ) ; if ( this -> ScalarWarping != _arg ) { this -> ScalarWarping = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetRadiusScaleFactorExponentFactorNormalWarpingEccentricityScalarWarping ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarWarping  of  << this -> ScalarWarping ) ; return this -> ScalarWarping ; } ; virtual void ScalarWarpingOn ( ) { this -> SetNormalWarpingScalarWarping ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ScalarWarpingOff ( ) { this -> SetNormalWarpingScalarWarping ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off the capping of the outer boundary of the volume
##  to a specified cap value. This can be used to close surfaces
##  (after iso-surfacing) and create other effects.
##  virtual void SetExponentFactorNormalWarpingScalarWarpingCapping ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Capping  to  << _arg ) ; if ( this -> Capping != _arg ) { this -> Capping = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetRadiusScaleFactorExponentFactorNormalWarpingEccentricityScalarWarpingCapping ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Capping  of  << this -> Capping ) ; return this -> Capping ; } ; virtual void CappingOn ( ) { this -> SetNormalWarpingScalarWarpingCapping ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void CappingOff ( ) { this -> SetNormalWarpingScalarWarpingCapping ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify the cap value to use. (This instance variable only has effect
##  if the ivar Capping is on.)
##  virtual void SetExponentFactorNormalWarpingScalarWarpingCappingCapValue ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CapValue  to  << _arg ) ; if ( this -> CapValue != _arg ) { this -> CapValue = _arg ; this -> Modified ( ) ; } } ; virtual double GetRadiusScaleFactorExponentFactorNormalWarpingEccentricityScalarWarpingCappingCapValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CapValue  of  << this -> CapValue ) ; return this -> CapValue ; } ; /@} /@{ *
##  Specify the scalar accumulation mode. This mode expresses how scalar
##  values are combined when splats are overlapped. The Max mode acts
##  like a set union operation and is the most commonly used; the Min
##  mode acts like a set intersection, and the sum is just weird.
##  virtual void SetRadiusScaleFactorEccentricityAccumulationMode ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << AccumulationMode  to  << _arg ) ; if ( this -> AccumulationMode != ( _arg < VTK_ACCUMULATION_MODE_MIN ? VTK_ACCUMULATION_MODE_MIN : ( _arg > VTK_ACCUMULATION_MODE_SUM ? VTK_ACCUMULATION_MODE_SUM : _arg ) ) ) { this -> AccumulationMode = ( _arg < VTK_ACCUMULATION_MODE_MIN ? VTK_ACCUMULATION_MODE_MIN : ( _arg > VTK_ACCUMULATION_MODE_SUM ? VTK_ACCUMULATION_MODE_SUM : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetRadiusMinValueScaleFactorMinValueEccentricityMinValueAccumulationModeMinValue ( ) { return VTK_ACCUMULATION_MODE_MIN ; } virtual int GetRadiusMaxValueScaleFactorMaxValueEccentricityMaxValueAccumulationModeMaxValue ( ) { return VTK_ACCUMULATION_MODE_SUM ; } ; virtual int GetRadiusScaleFactorExponentFactorNormalWarpingEccentricityScalarWarpingCappingCapValueAccumulationMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AccumulationMode  of  << this -> AccumulationMode ) ; return this -> AccumulationMode ; } ; void SetAccumulationModeToMin ( ) { this -> SetAccumulationMode ( VTK_ACCUMULATION_MODE_MIN ) ; } void SetAccumulationModeToMax ( ) { this -> SetAccumulationMode ( VTK_ACCUMULATION_MODE_MAX ) ; } void SetAccumulationModeToSum ( ) { this -> SetAccumulationMode ( VTK_ACCUMULATION_MODE_SUM ) ; } const char * GetAccumulationModeAsString ( ) ; /@} /@{ *
##  Set the Null value for output points not receiving a contribution from the
##  input points. (This is the initial value of the voxel samples.)
##  virtual void SetExponentFactorNormalWarpingScalarWarpingCappingCapValueNullValue ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NullValue  to  << _arg ) ; if ( this -> NullValue != _arg ) { this -> NullValue = _arg ; this -> Modified ( ) ; } } ; virtual double GetRadiusScaleFactorExponentFactorNormalWarpingEccentricityScalarWarpingCappingCapValueAccumulationModeNullValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NullValue  of  << this -> NullValue ) ; return this -> NullValue ; } ; /@} /@{ *
##  Compute the size of the sample bounding box automatically from the
##  input data. This is an internal helper function.
##  void ComputeModelBounds ( vtkDataSet * input , vtkImageData * output , vtkInformation * outInfo ) ; void ComputeModelBounds ( vtkCompositeDataSet * input , vtkImageData * output , vtkInformation * outInfo ) ; /@} /@{ *
##  Provide access to templated helper class. Note that SamplePoint() method
##  is public here because some compilers don't handle friend functions
##  properly.
##  friend class vtkGaussianSplatterAlgorithm ; double SamplePoint ( double x [ 3 ] )  for compilers who can't handle this { return ( this ->* Sample ) ( x ) ; } void SetScalar ( vtkIdType idx , double dist2 , double * sPtr ) { double v = ( this ->* SampleFactor ) ( this -> S ) * std :: exp ( static_cast < double > ( this -> ExponentFactor * ( dist2 ) / ( this -> Radius2 ) ) ) ; /@} if ( ! this -> Visited [ idx ] ) { this -> Visited [ idx ] = 1 ; * sPtr = v ; } else { switch ( this -> AccumulationMode ) { case VTK_ACCUMULATION_MODE_MIN : if ( * sPtr > v ) { * sPtr = v ; } break ; case VTK_ACCUMULATION_MODE_MAX : if ( * sPtr < v ) { * sPtr = v ; } break ; case VTK_ACCUMULATION_MODE_SUM : * sPtr += v ; break ; } }  not first visit } protected : vtkGaussianSplatter ( ) ; ~ vtkGaussianSplatter ( ) override = default ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; void Cap ( vtkDoubleArray * s ) ; int SampleDimensions [ 3 ] ;  dimensions of volume to splat into double Radius ;  maximum distance splat propagates (as fraction 0->1) double ExponentFactor ;  scale exponent of gaussian function double ModelBounds [ 6 ] ;  bounding box of splatting dimensions vtkTypeBool NormalWarping ;  on/off warping of splat via normal double Eccentricity ;  elliptic distortion due to normals vtkTypeBool ScalarWarping ;  on/off warping of splat via scalar double ScaleFactor ;  splat size influenced by scale factor vtkTypeBool Capping ;  Cap side of volume to close surfaces double CapValue ;  value to use for capping int AccumulationMode ;  how to combine scalar values double Gaussian ( double x [ 3 ] ) ; double EccentricGaussian ( double x [ 3 ] ) ; double ScalarSampling ( double s ) { return this -> ScaleFactor * s ; } double PositionSampling ( double ) { return this -> ScaleFactor ; } private : double Radius2 ; double ( vtkGaussianSplatter :: * Sample ) ( double x [ 3 ] ) ; double ( vtkGaussianSplatter :: * SampleFactor ) ( double s ) ; char * Visited ; double Eccentricity2 ; double * P ; double * N ; double S ; double Origin [ 3 ] ; double Spacing [ 3 ] ; double SplatDistance [ 3 ] ; double NullValue ; private : vtkGaussianSplatter ( const vtkGaussianSplatter & ) = delete ; void operator = ( const vtkGaussianSplatter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
