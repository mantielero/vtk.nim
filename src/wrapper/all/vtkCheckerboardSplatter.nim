## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCheckerboardSplatter.h
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
##  @class   vtkCheckerboardSplatter
##  @brief   splat points into a volume with an elliptical, Gaussian distribution
##
##  vtkCheckerboardSplatter is a filter that injects input points into a
##  structured points (volume) dataset using a multithreaded 8-way
##  checkerboard approach. It produces a scalar field of a specified type. As
##  each point is injected, it "splats" or distributes values to nearby
##  voxels. Data is distributed using an elliptical, Gaussian distribution
##  function. The distribution function is modified using scalar values
##  (expands distribution) or normals (creates ellipsoidal distribution rather
##  than spherical). This algorithm is designed for scalability through
##  multithreading.
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
##  If point normals are present (and NormalWarping is on), then the splat
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
##  This class makes use of vtkSMPTools to implement a parallel, shared-memory
##  implementation. Hence performance will be significantly improved if VTK is
##  built with VTK_SMP_IMPLEMENTATION_TYPE set to something other than
##  "Sequential" (typically TBB). For example, on a standard laptop with four
##  threads it is common to see a >10x speedup as compared to the serial
##  version of vtkGaussianSplatter.
##
##  In summary, the algorithm operates by dividing the volume into a 3D
##  checkerboard, where the squares of the checkerboard overlay voxels in the
##  volume. The checkerboard overlay is designed as a function of the splat
##  footprint, so that when splatting occurs in a group (or color) of
##  checkerboard squares, the splat operation will not cause write contention
##  as the splatting proceeds in parallel. There are eight colors in this
##  checkerboard (like an octree) and parallel splatting occurs simultaneously
##  in one of the eight colors (e.g., octants). A single splat operation
##  (across the given 3D footprint) may also be parallelized if the splat is
##  large enough.
##
##  @warning
##  The input to this filter is of type vtkPointSet. Currently only real types
##  (e.g., float, double) are supported as input, but this could easily be
##  extended to other types. The output type is limited to real types as well.
##
##  @warning
##  Some voxels may never receive a contribution during the splatting process.
##  The final value of these points can be specified with the "NullValue"
##  instance variable. Note that NullValue is also the initial value of the
##  output voxel values and will affect the accumulation process.
##
##  @warning
##  While this class is very similar to vtkGaussianSplatter, it does produce
##  slightly different output in most cases (due to the way the footprint is
##  computed).
##
##  @sa
##  vtkShepardMethod vtkGaussianSplatter
##

## !!!Ignored construct:  # vtkCheckerboardSplatter_h [NewLine] # vtkCheckerboardSplatter_h [NewLine] # vtkImageAlgorithm.h [NewLine] # vtkImagingHybridModule.h  For export macro [NewLine] # VTK_ACCUMULATION_MODE_MIN 0 [NewLine] # VTK_ACCUMULATION_MODE_MAX 1 [NewLine] # VTK_ACCUMULATION_MODE_SUM 2 [NewLine] class vtkDoubleArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkCompositeDataSet"
## !!!Ignored construct:  class VTKIMAGINGHYBRID_EXPORT vtkCheckerboardSplatter : public vtkImageAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkCheckerboardSplatter :: IsTypeOf ( type ) ; } static vtkCheckerboardSplatter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkCheckerboardSplatter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkCheckerboardSplatter * NewInstance ( ) const { return vtkCheckerboardSplatter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCheckerboardSplatter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCheckerboardSplatter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct object with dimensions=(50,50,50); automatic computation of
##  bounds; a Footprint of 2; a Radius of 0; an exponent factor of -5; and normal and
##  scalar warping enabled; and Capping enabled.
##  static vtkCheckerboardSplatter * New ( ) ; /@{ *
##  Set / get the dimensions of the sampling structured point set. Higher
##  values produce better results but may be much slower.
##  void SetSampleDimensions ( int i , int j , int k ) ; void SetSampleDimensions ( int dim [ 3 ] ) ; virtual int * GetSampleDimensions ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << SampleDimensions  pointer  << this -> SampleDimensions ) ; return this -> SampleDimensions ; } VTK_WRAPEXCLUDE virtual void GetSampleDimensions ( int data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> SampleDimensions [ i ] ; } } ; /@} /@{ *
##  Set / get the (xmin,xmax, ymin,ymax, zmin,zmax) bounding box in which
##  the sampling is performed. If any of the (min,max) bounds values are
##  min >= max, then the bounds will be computed automatically from the input
##  data. Otherwise, the user-specified bounds will be used.
##  virtual void SetModelBounds ( double _arg1 , double _arg2 , double _arg3 , double _arg4 , double _arg5 , double _arg6 ) { vtkDebugWithObjectMacro ( this , <<  setting  << ModelBounds  to ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; if ( ( this -> ModelBounds [ 0 ] != _arg1 ) || ( this -> ModelBounds [ 1 ] != _arg2 ) || ( this -> ModelBounds [ 2 ] != _arg3 ) || ( this -> ModelBounds [ 3 ] != _arg4 ) || ( this -> ModelBounds [ 4 ] != _arg5 ) || ( this -> ModelBounds [ 5 ] != _arg6 ) ) { this -> ModelBounds [ 0 ] = _arg1 ; this -> ModelBounds [ 1 ] = _arg2 ; this -> ModelBounds [ 2 ] = _arg3 ; this -> ModelBounds [ 3 ] = _arg4 ; this -> ModelBounds [ 4 ] = _arg5 ; this -> ModelBounds [ 5 ] = _arg6 ; this -> Modified ( ) ; } } virtual void SetModelBounds ( const double _arg [ 6 ] ) { this -> SetModelBounds ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; virtual double * GetSampleDimensionsModelBounds ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ModelBounds  pointer  << this -> ModelBounds ) ; return this -> ModelBounds ; } VTK_WRAPEXCLUDE virtual void GetSampleDimensionsModelBounds ( double data [ 6 ] ) { for ( int i = 0 ; i < 6 ; i ++ ) { data [ i ] = this -> ModelBounds [ i ] ; } } ; /@} /@{ *
##  Control the footprint size of the splat in terms of propagation across a
##  voxel neighborhood. The Footprint value simply indicates the number of
##  neighboring voxels in the i-j-k directions to extend the splat. A value
##  of zero means that only the voxel containing the splat point is
##  affected. A value of one means the immediate neighbors touching the
##  affected voxel are affected as well. Larger numbers increase the splat
##  footprint and significantly increase processing time. Note that the
##  footprint is always 3D rectangular.
##  virtual void SetFootprint ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Footprint  to  << _arg ) ; if ( this -> Footprint != ( _arg < 0 ? 0 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> Footprint = ( _arg < 0 ? 0 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetFootprintMinValue ( ) { return 0 ; } virtual int GetFootprintMaxValue ( ) { return VTK_INT_MAX ; } ; virtual int GetFootprint ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Footprint  of  << this -> Footprint ) ; return this -> Footprint ; } ; /@} /@{ *
##  Set / get the radius variable that controls the Gaussian exponential
##  function (see equation above). If set to zero, it is automatically set
##  to the radius of the circumsphere bounding a single voxel. (By default,
##  the Radius is set to zero and is automatically computed.)
##  virtual void SetFootprintRadius ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Radius  to  << _arg ) ; if ( this -> Radius != ( _arg < 0.0 ? 0.0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ) { this -> Radius = ( _arg < 0.0 ? 0.0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetFootprintMinValueRadiusMinValue ( ) { return 0.0 ; } virtual double GetFootprintMaxValueRadiusMaxValue ( ) { return VTK_DOUBLE_MAX ; } ; virtual double GetFootprintRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Radius  of  << this -> Radius ) ; return this -> Radius ; } ; /@} /@{ *
##  Multiply Gaussian splat distribution by this value. If ScalarWarping
##  is on, then the Scalar value will be multiplied by the ScaleFactor
##  times the Gaussian function.
##  virtual void SetFootprintRadiusScaleFactor ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ScaleFactor  to  << _arg ) ; if ( this -> ScaleFactor != ( _arg < 0.0 ? 0.0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ) { this -> ScaleFactor = ( _arg < 0.0 ? 0.0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetFootprintMinValueRadiusMinValueScaleFactorMinValue ( ) { return 0.0 ; } virtual double GetFootprintMaxValueRadiusMaxValueScaleFactorMaxValue ( ) { return VTK_DOUBLE_MAX ; } ; virtual double GetFootprintRadiusScaleFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScaleFactor  of  << this -> ScaleFactor ) ; return this -> ScaleFactor ; } ; /@} /@{ *
##  Set / get the sharpness of decay of the splats. This is the exponent
##  constant in the Gaussian equation described above. Normally this is a
##  negative value.
##  virtual void SetExponentFactor ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ExponentFactor  to  << _arg ) ; if ( this -> ExponentFactor != _arg ) { this -> ExponentFactor = _arg ; this -> Modified ( ) ; } } ; virtual double GetFootprintRadiusScaleFactorExponentFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ExponentFactor  of  << this -> ExponentFactor ) ; return this -> ExponentFactor ; } ; /@} /@{ *
##  Turn on/off the scaling of splats by scalar value.
##  virtual void SetExponentFactorScalarWarping ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ScalarWarping  to  << _arg ) ; if ( this -> ScalarWarping != _arg ) { this -> ScalarWarping = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetFootprintRadiusScaleFactorExponentFactorScalarWarping ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarWarping  of  << this -> ScalarWarping ) ; return this -> ScalarWarping ; } ; virtual void ScalarWarpingOn ( ) { this -> SetScalarWarping ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ScalarWarpingOff ( ) { this -> SetScalarWarping ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off the generation of elliptical splats. If normal warping is
##  on, then the input normals affect the distribution of the splat. This
##  boolean is used in combination with the Eccentricity ivar.
##  virtual void SetExponentFactorScalarWarpingNormalWarping ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NormalWarping  to  << _arg ) ; if ( this -> NormalWarping != _arg ) { this -> NormalWarping = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetFootprintRadiusScaleFactorExponentFactorScalarWarpingNormalWarping ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NormalWarping  of  << this -> NormalWarping ) ; return this -> NormalWarping ; } ; virtual void NormalWarpingOn ( ) { this -> SetScalarWarpingNormalWarping ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void NormalWarpingOff ( ) { this -> SetScalarWarpingNormalWarping ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Control the shape of elliptical splatting. Eccentricity is the ratio
##  of the major axis (aligned along normal) to the minor (axes) aligned
##  along other two axes. So Eccentricity > 1 creates needles with the
##  long axis in the direction of the normal; Eccentricity<1 creates
##  pancakes perpendicular to the normal vector.
##  virtual void SetFootprintRadiusScaleFactorEccentricity ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Eccentricity  to  << _arg ) ; if ( this -> Eccentricity != ( _arg < 0.001 ? 0.001 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ) { this -> Eccentricity = ( _arg < 0.001 ? 0.001 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetFootprintMinValueRadiusMinValueScaleFactorMinValueEccentricityMinValue ( ) { return 0.001 ; } virtual double GetFootprintMaxValueRadiusMaxValueScaleFactorMaxValueEccentricityMaxValue ( ) { return VTK_DOUBLE_MAX ; } ; virtual double GetFootprintRadiusScaleFactorExponentFactorScalarWarpingNormalWarpingEccentricity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Eccentricity  of  << this -> Eccentricity ) ; return this -> Eccentricity ; } ; /@} /@{ *
##  Specify the scalar accumulation mode. This mode expresses how scalar
##  values are combined when splats overlap one another. The Max mode acts
##  like a set union operation and is the most commonly used; the Min mode
##  acts like a set intersection, and the sum is just weird (and can
##  potentially cause accumulation overflow in extreme cases). Note that the
##  NullValue must be set consistent with the accumulation operation.
##  virtual void SetFootprintRadiusScaleFactorEccentricityAccumulationMode ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << AccumulationMode  to  << _arg ) ; if ( this -> AccumulationMode != ( _arg < VTK_ACCUMULATION_MODE_MIN ? VTK_ACCUMULATION_MODE_MIN : ( _arg > VTK_ACCUMULATION_MODE_SUM ? VTK_ACCUMULATION_MODE_SUM : _arg ) ) ) { this -> AccumulationMode = ( _arg < VTK_ACCUMULATION_MODE_MIN ? VTK_ACCUMULATION_MODE_MIN : ( _arg > VTK_ACCUMULATION_MODE_SUM ? VTK_ACCUMULATION_MODE_SUM : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetFootprintMinValueRadiusMinValueScaleFactorMinValueEccentricityMinValueAccumulationModeMinValue ( ) { return VTK_ACCUMULATION_MODE_MIN ; } virtual int GetFootprintMaxValueRadiusMaxValueScaleFactorMaxValueEccentricityMaxValueAccumulationModeMaxValue ( ) { return VTK_ACCUMULATION_MODE_SUM ; } ; virtual int GetFootprintRadiusScaleFactorExponentFactorScalarWarpingNormalWarpingEccentricityAccumulationMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AccumulationMode  of  << this -> AccumulationMode ) ; return this -> AccumulationMode ; } ; void SetAccumulationModeToMin ( ) { this -> SetAccumulationMode ( VTK_ACCUMULATION_MODE_MIN ) ; } void SetAccumulationModeToMax ( ) { this -> SetAccumulationMode ( VTK_ACCUMULATION_MODE_MAX ) ; } void SetAccumulationModeToSum ( ) { this -> SetAccumulationMode ( VTK_ACCUMULATION_MODE_SUM ) ; } const char * GetAccumulationModeAsString ( ) ; /@} /@{ *
##  Set what type of scalar data this source should generate. Only double
##  and float types are supported currently due to precision requirements
##  during accumulation. By default, float scalars are produced.
##  virtual void SetExponentFactorScalarWarpingNormalWarpingOutputScalarType ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutputScalarType  to  << _arg ) ; if ( this -> OutputScalarType != _arg ) { this -> OutputScalarType = _arg ; this -> Modified ( ) ; } } ; virtual int GetFootprintRadiusScaleFactorExponentFactorScalarWarpingNormalWarpingEccentricityAccumulationModeOutputScalarType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputScalarType  of  << this -> OutputScalarType ) ; return this -> OutputScalarType ; } ; void SetOutputScalarTypeToDouble ( ) { this -> SetOutputScalarType ( VTK_DOUBLE ) ; } void SetOutputScalarTypeToFloat ( ) { this -> SetOutputScalarType ( VTK_FLOAT ) ; } /@} /@{ *
##  Turn on/off the capping of the outer boundary of the volume
##  to a specified cap value. This can be used to close surfaces
##  (after iso-surfacing) and create other effects.
##  virtual void SetExponentFactorScalarWarpingNormalWarpingOutputScalarTypeCapping ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Capping  to  << _arg ) ; if ( this -> Capping != _arg ) { this -> Capping = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetFootprintRadiusScaleFactorExponentFactorScalarWarpingNormalWarpingEccentricityAccumulationModeOutputScalarTypeCapping ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Capping  of  << this -> Capping ) ; return this -> Capping ; } ; virtual void CappingOn ( ) { this -> SetScalarWarpingNormalWarpingCapping ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void CappingOff ( ) { this -> SetScalarWarpingNormalWarpingCapping ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify the cap value to use. (This instance variable only has effect
##  if the ivar Capping is on.)
##  virtual void SetExponentFactorScalarWarpingNormalWarpingOutputScalarTypeCappingCapValue ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CapValue  to  << _arg ) ; if ( this -> CapValue != _arg ) { this -> CapValue = _arg ; this -> Modified ( ) ; } } ; virtual double GetFootprintRadiusScaleFactorExponentFactorScalarWarpingNormalWarpingEccentricityAccumulationModeOutputScalarTypeCappingCapValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CapValue  of  << this -> CapValue ) ; return this -> CapValue ; } ; /@} /@{ *
##  Set the Null value for output points not receiving a contribution from
##  the input points. (This is the initial value of the voxel samples, by
##  default it is set to zero.) Note that the value should be consistent
##  with the output dataset type. The NullValue also provides the initial
##  value on which the accumulations process operates.
##  virtual void SetExponentFactorScalarWarpingNormalWarpingOutputScalarTypeCappingCapValueNullValue ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NullValue  to  << _arg ) ; if ( this -> NullValue != _arg ) { this -> NullValue = _arg ; this -> Modified ( ) ; } } ; virtual double GetFootprintRadiusScaleFactorExponentFactorScalarWarpingNormalWarpingEccentricityAccumulationModeOutputScalarTypeCappingCapValueNullValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NullValue  of  << this -> NullValue ) ; return this -> NullValue ; } ; /@} /@{ *
##  Set/Get the maximum dimension of the checkerboard (i.e., the number of
##  squares in any of the i, j, or k directions). This number also impacts
##  the granularity of the parallel threading (since each checker square is
##  processed separaely). Because of the internal addressing, the maximum
##  dimension is limited to 255 (maximum value of an unsigned char).
##  virtual void SetFootprintRadiusScaleFactorEccentricityAccumulationModeMaximumDimension ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << MaximumDimension  to  << _arg ) ; if ( this -> MaximumDimension != ( _arg < 0 ? 0 : ( _arg > 255 ? 255 : _arg ) ) ) { this -> MaximumDimension = ( _arg < 0 ? 0 : ( _arg > 255 ? 255 : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetFootprintMinValueRadiusMinValueScaleFactorMinValueEccentricityMinValueAccumulationModeMinValueMaximumDimensionMinValue ( ) { return 0 ; } virtual int GetFootprintMaxValueRadiusMaxValueScaleFactorMaxValueEccentricityMaxValueAccumulationModeMaxValueMaximumDimensionMaxValue ( ) { return 255 ; } ; virtual int GetFootprintRadiusScaleFactorExponentFactorScalarWarpingNormalWarpingEccentricityAccumulationModeOutputScalarTypeCappingCapValueNullValueMaximumDimension ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumDimension  of  << this -> MaximumDimension ) ; return this -> MaximumDimension ; } ; /@} /@{ *
##  Set/get the crossover point expressed in footprint size where the
##  splatting operation is parallelized (through vtkSMPTools). By default
##  the parallel crossover point is for splat footprints of size two or
##  greater (i.e., at footprint=2 then splat is 5x5x5 and parallel splatting
##  occurs). This is really meant for experimental purposes.
##  virtual void SetFootprintRadiusScaleFactorEccentricityAccumulationModeMaximumDimensionParallelSplatCrossover ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ParallelSplatCrossover  to  << _arg ) ; if ( this -> ParallelSplatCrossover != ( _arg < 0 ? 0 : ( _arg > 255 ? 255 : _arg ) ) ) { this -> ParallelSplatCrossover = ( _arg < 0 ? 0 : ( _arg > 255 ? 255 : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetFootprintMinValueRadiusMinValueScaleFactorMinValueEccentricityMinValueAccumulationModeMinValueMaximumDimensionMinValueParallelSplatCrossoverMinValue ( ) { return 0 ; } virtual int GetFootprintMaxValueRadiusMaxValueScaleFactorMaxValueEccentricityMaxValueAccumulationModeMaxValueMaximumDimensionMaxValueParallelSplatCrossoverMaxValue ( ) { return 255 ; } ; virtual int GetFootprintRadiusScaleFactorExponentFactorScalarWarpingNormalWarpingEccentricityAccumulationModeOutputScalarTypeCappingCapValueNullValueMaximumDimensionParallelSplatCrossover ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ParallelSplatCrossover  of  << this -> ParallelSplatCrossover ) ; return this -> ParallelSplatCrossover ; } ; /@} *
##  Compute the size of the sample bounding box automatically from the
##  input data. This is an internal helper function.
##  void ComputeModelBounds ( vtkDataSet * input , vtkImageData * output , vtkInformation * outInfo ) ; protected : vtkCheckerboardSplatter ( ) ; ~ vtkCheckerboardSplatter ( ) override = default ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int OutputScalarType ;  the type of output scalars int SampleDimensions [ 3 ] ;  dimensions of volume to splat into double Radius ;  Radius factor in the Gaussian exponential function int Footprint ;  maximum distance splat propagates (in voxels 0->Dim) double ExponentFactor ;  scale exponent of gaussian function double ModelBounds [ 6 ] ;  bounding box of splatting dimensions double Origin [ 3 ] , Spacing [ 3 ] ;  output geometry vtkTypeBool NormalWarping ;  on/off warping of splat via normal double Eccentricity ;  elliptic distortion due to normals vtkTypeBool ScalarWarping ;  on/off warping of splat via scalar double ScaleFactor ;  splat size influenced by scale factor vtkTypeBool Capping ;  Cap side of volume to close surfaces double CapValue ;  value to use for capping int AccumulationMode ;  how to combine scalar values double NullValue ;  initial value of voxels unsigned char MaximumDimension ;  max resolution of checkerboard int ParallelSplatCrossover ;  the point at which parallel splatting occurs private : vtkCheckerboardSplatter ( const vtkCheckerboardSplatter & ) = delete ; void operator = ( const vtkCheckerboardSplatter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
