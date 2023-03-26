## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPointDensityFilter.h
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
##  @class   vtkPointDensityFilter
##  @brief   produce density field from input point cloud
##
##  vtkPointDensityFilter is a filter that generates a density field on a
##  volume from a point cloud. Basically the density is computed as number of
##  points in a local neighborhood per unit volume; or optionally, the number
##  of points in a local neighborhood surrounding each voxel. The local
##  neighborhood is specified as a radius around each sample position (i.e.,
##  each voxel) which can be of fixed value; or the radius can be relative to
##  the voxel size. The density computation may be further weighted by a
##  scalar value which is simply multiplied by each point's presumed density
##  of 1.0.
##
##  To use this filter, specify an input of type vtkPointSet (i.e., has an
##  explicit representation of points). Optionally a scalar weighting function
##  can be provided (part of the input to the filter). Then specify how the
##  local spherical neighborhood is to be defined, either by a fixed radius or
##  a radius relative to the voxel size. Finally, specify how the density is
##  specified, either as a points/volume, or as number of points. (The
##  weighting scalar array will affect both of these results if provided and
##  enabled.)
##
##  An optional capability of the filter is to compute the gradients of the
##  resulting density function (a 3-component vector), which also includes the
##  gradient magnitude (single component scalar) and classification (regions
##  of zero function, a scalar with single unsigned char value per voxel).
##
##  @warning
##  A point locator is used to speed up searches. By default a fast
##  vtkStaticPointLocator is used; however the user may specify an alternative
##  locator. In some situations adaptive locators may run faster depending on
##  the relative variation in point cloud density.
##
##  @warning
##  Note that the volume calculation can be affected by the boundary. The
##  local spherical neighborhood around a "near volume boundary" voxel may
##  extend beyond the volume extent, meaning that density computation may be
##  reduced. To counter this effect, the volume may be increased in size
##  and/or resolution so that the point cloud fits well within the volume.
##
##  @warning
##  While this class is very similar to many other of VTK's the point
##  splatting and interpolation classes, the algorithm density computation is
##  specialized to generate the density computation over a volume, does not
##  require (scalar weighting) data attributes to run, and does not require
##  multiple inputs. As an interesting side note: using the
##  vtkPointInterpolation class with a vtkLinearKernel, a (scalar) weighting
##  point attribute, a point cloud source, and an input volume produces the
##  same result as this filter does (assuming that the input volume is the
##  same).
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @sa
##  vtkCheckerboardSplatter vtkShepardMethod vtkGaussianSplatter
##  vtkPointInterpolator vtkSPHInterpolator
##

## !!!Ignored construct:  # vtkPointDensityFilter_h [NewLine] # vtkPointDensityFilter_h [NewLine] # vtkFiltersPointsModule.h  For export macro # vtkImageAlgorithm.h [NewLine] # VTK_DENSITY_ESTIMATE_FIXED_RADIUS 0 [NewLine] # VTK_DENSITY_ESTIMATE_RELATIVE_RADIUS 1 [NewLine] # VTK_DENSITY_FORM_VOLUME_NORM 0 [NewLine] # VTK_DENSITY_FORM_NPTS 1 [NewLine] class vtkAbstractPointLocator ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSPOINTS_EXPORT vtkPointDensityFilter : public vtkImageAlgorithm { public : /@{ *
##  Standard methods for instantiating, obtaining type information, and
##  printing information.
##  static vtkPointDensityFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPointDensityFilter :: IsTypeOf ( type ) ; } static vtkPointDensityFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPointDensityFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPointDensityFilter * NewInstance ( ) const { return vtkPointDensityFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPointDensityFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPointDensityFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Set / get the dimensions of the sampling volume. Higher values generally
##  produce better results but may be much slower. Note however that too
##  high a resolution can generate excessive noise; too low and data can be
##  excessively smoothed.
##  void SetSampleDimensions ( int i , int j , int k ) ; void SetSampleDimensions ( int dim [ 3 ] ) ; virtual int * GetSampleDimensions ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << SampleDimensions  pointer  << this -> SampleDimensions ) ; return this -> SampleDimensions ; } VTK_WRAPEXCLUDE virtual void GetSampleDimensions ( int data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> SampleDimensions [ i ] ; } } ; /@} /@{ *
##  Set / get the (xmin,xmax, ymin,ymax, zmin,zmax) bounding box in which
##  the sampling is performed. If any of the (min,max) bounds values are
##  min >= max, then the bounds will be computed automatically from the input
##  data. Otherwise, the user-specified bounds will be used.
##  virtual void SetModelBounds ( double _arg1 , double _arg2 , double _arg3 , double _arg4 , double _arg5 , double _arg6 ) { vtkDebugWithObjectMacro ( this , <<  setting  << ModelBounds  to ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; if ( ( this -> ModelBounds [ 0 ] != _arg1 ) || ( this -> ModelBounds [ 1 ] != _arg2 ) || ( this -> ModelBounds [ 2 ] != _arg3 ) || ( this -> ModelBounds [ 3 ] != _arg4 ) || ( this -> ModelBounds [ 4 ] != _arg5 ) || ( this -> ModelBounds [ 5 ] != _arg6 ) ) { this -> ModelBounds [ 0 ] = _arg1 ; this -> ModelBounds [ 1 ] = _arg2 ; this -> ModelBounds [ 2 ] = _arg3 ; this -> ModelBounds [ 3 ] = _arg4 ; this -> ModelBounds [ 4 ] = _arg5 ; this -> ModelBounds [ 5 ] = _arg6 ; this -> Modified ( ) ; } } virtual void SetModelBounds ( const double _arg [ 6 ] ) { this -> SetModelBounds ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; virtual double * GetSampleDimensionsModelBounds ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ModelBounds  pointer  << this -> ModelBounds ) ; return this -> ModelBounds ; } VTK_WRAPEXCLUDE virtual void GetSampleDimensionsModelBounds ( double data [ 6 ] ) { for ( int i = 0 ; i < 6 ; i ++ ) { data [ i ] = this -> ModelBounds [ i ] ; } } ; /@} /@{ *
##  Set / get the relative amount to pad the model bounds if automatic
##  computation is performed. The padding is the fraction to scale
##  the model bounds in each of the x-y-z directions. By default the
##  padding is 0.10 (i.e., 10% larger in each direction).
##  virtual void SetAdjustDistance ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << AdjustDistance  to  << _arg ) ; if ( this -> AdjustDistance != ( _arg < - 1.0 ? - 1.0 : ( _arg > 1.0 ? 1.0 : _arg ) ) ) { this -> AdjustDistance = ( _arg < - 1.0 ? - 1.0 : ( _arg > 1.0 ? 1.0 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetAdjustDistanceMinValue ( ) { return - 1.0 ; } virtual double GetAdjustDistanceMaxValue ( ) { return 1.0 ; } ; virtual double GetAdjustDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AdjustDistance  of  << this -> AdjustDistance ) ; return this -> AdjustDistance ; } ; /@} /@{ *
##  Specify the method to estimate point density. The density can be
##  calculated using a fixed sphere radius; or a sphere radius that is
##  relative to voxel size.
##  virtual void SetAdjustDistanceDensityEstimate ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << DensityEstimate  to  << _arg ) ; if ( this -> DensityEstimate != ( _arg < VTK_DENSITY_ESTIMATE_FIXED_RADIUS ? VTK_DENSITY_ESTIMATE_FIXED_RADIUS : ( _arg > VTK_DENSITY_ESTIMATE_RELATIVE_RADIUS ? VTK_DENSITY_ESTIMATE_RELATIVE_RADIUS : _arg ) ) ) { this -> DensityEstimate = ( _arg < VTK_DENSITY_ESTIMATE_FIXED_RADIUS ? VTK_DENSITY_ESTIMATE_FIXED_RADIUS : ( _arg > VTK_DENSITY_ESTIMATE_RELATIVE_RADIUS ? VTK_DENSITY_ESTIMATE_RELATIVE_RADIUS : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetAdjustDistanceMinValueDensityEstimateMinValue ( ) { return VTK_DENSITY_ESTIMATE_FIXED_RADIUS ; } virtual int GetAdjustDistanceMaxValueDensityEstimateMaxValue ( ) { return VTK_DENSITY_ESTIMATE_RELATIVE_RADIUS ; } ; virtual int GetAdjustDistanceDensityEstimate ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DensityEstimate  of  << this -> DensityEstimate ) ; return this -> DensityEstimate ; } ; void SetDensityEstimateToFixedRadius ( ) { this -> SetDensityEstimate ( VTK_DENSITY_ESTIMATE_FIXED_RADIUS ) ; } void SetDensityEstimateToRelativeRadius ( ) { this -> SetDensityEstimate ( VTK_DENSITY_ESTIMATE_RELATIVE_RADIUS ) ; } const char * GetDensityEstimateAsString ( ) ; /@} /@{ *
##  Specify the form by which the density is expressed. Either the density is
##  expressed as (number of points/local sphere volume), or as simply the
##  (number of points) within the local sphere.
##  virtual void SetAdjustDistanceDensityEstimateDensityForm ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << DensityForm  to  << _arg ) ; if ( this -> DensityForm != ( _arg < VTK_DENSITY_FORM_VOLUME_NORM ? VTK_DENSITY_FORM_VOLUME_NORM : ( _arg > VTK_DENSITY_FORM_NPTS ? VTK_DENSITY_FORM_NPTS : _arg ) ) ) { this -> DensityForm = ( _arg < VTK_DENSITY_FORM_VOLUME_NORM ? VTK_DENSITY_FORM_VOLUME_NORM : ( _arg > VTK_DENSITY_FORM_NPTS ? VTK_DENSITY_FORM_NPTS : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetAdjustDistanceMinValueDensityEstimateMinValueDensityFormMinValue ( ) { return VTK_DENSITY_FORM_VOLUME_NORM ; } virtual int GetAdjustDistanceMaxValueDensityEstimateMaxValueDensityFormMaxValue ( ) { return VTK_DENSITY_FORM_NPTS ; } ; virtual int GetAdjustDistanceDensityEstimateDensityForm ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DensityForm  of  << this -> DensityForm ) ; return this -> DensityForm ; } ; void SetDensityFormToVolumeNormalized ( ) { this -> SetDensityForm ( VTK_DENSITY_FORM_VOLUME_NORM ) ; } void SetDensityFormToNumberOfPoints ( ) { this -> SetDensityForm ( VTK_DENSITY_FORM_NPTS ) ; } const char * GetDensityFormAsString ( ) ; /@} /@{ *
##  Set / get the radius variable defining the local sphere used to estimate
##  the density function. The Radius is used when the density estimate is
##    ^ set to a fixed radius (i.e., the radius doesn't change).
##  virtual void SetAdjustDistanceDensityEstimateDensityFormRadius ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Radius  to  << _arg ) ; if ( this -> Radius != ( _arg < 0.0 ? 0.0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ) { this -> Radius = ( _arg < 0.0 ? 0.0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetAdjustDistanceMinValueDensityEstimateMinValueDensityFormMinValueRadiusMinValue ( ) { return 0.0 ; } virtual double GetAdjustDistanceMaxValueDensityEstimateMaxValueDensityFormMaxValueRadiusMaxValue ( ) { return VTK_DOUBLE_MAX ; } ; virtual double GetAdjustDistanceDensityEstimateDensityFormRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Radius  of  << this -> Radius ) ; return this -> Radius ; } ; /@} /@{ *
##  Set / get the relative radius factor defining the local sphere used to
##  estimate the density function. The relative sphere radius is equal to
##  the diagonal length of a voxel times the radius factor. The RelativeRadius
##  is used when the density estimate is set to relative radius (i.e.,
##  relative to voxel size).
##  virtual void SetAdjustDistanceDensityEstimateDensityFormRadiusRelativeRadius ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << RelativeRadius  to  << _arg ) ; if ( this -> RelativeRadius != ( _arg < 0.0 ? 0.0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ) { this -> RelativeRadius = ( _arg < 0.0 ? 0.0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetAdjustDistanceMinValueDensityEstimateMinValueDensityFormMinValueRadiusMinValueRelativeRadiusMinValue ( ) { return 0.0 ; } virtual double GetAdjustDistanceMaxValueDensityEstimateMaxValueDensityFormMaxValueRadiusMaxValueRelativeRadiusMaxValue ( ) { return VTK_DOUBLE_MAX ; } ; virtual double GetAdjustDistanceDensityEstimateDensityFormRadiusRelativeRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RelativeRadius  of  << this -> RelativeRadius ) ; return this -> RelativeRadius ; } ; /@} /@{ *
##  Turn on/off the weighting of point density by a scalar array. By default
##  scalar weighting is off.
##  virtual void SetScalarWeighting ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ScalarWeighting  to  << _arg ) ; if ( this -> ScalarWeighting != _arg ) { this -> ScalarWeighting = _arg ; this -> Modified ( ) ; } } ; virtual bool GetAdjustDistanceDensityEstimateDensityFormRadiusRelativeRadiusScalarWeighting ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarWeighting  of  << this -> ScalarWeighting ) ; return this -> ScalarWeighting ; } ; virtual void ScalarWeightingOn ( ) { this -> SetScalarWeighting ( static_cast < bool > ( 1 ) ) ; } virtual void ScalarWeightingOff ( ) { this -> SetScalarWeighting ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off the generation of the gradient vector, gradient magnitude
##  scalar, and function classification scalar. By default this is off. Note
##  that this will increase execution time and the size of the output. (The
##  names of these point data arrays are: "Gradient", "Gradient Magnitude",
##  and "Classification".)
##  virtual void SetScalarWeightingComputeGradient ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeGradient  to  << _arg ) ; if ( this -> ComputeGradient != _arg ) { this -> ComputeGradient = _arg ; this -> Modified ( ) ; } } ; virtual bool GetAdjustDistanceDensityEstimateDensityFormRadiusRelativeRadiusScalarWeightingComputeGradient ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeGradient  of  << this -> ComputeGradient ) ; return this -> ComputeGradient ; } ; virtual void ComputeGradientOn ( ) { this -> SetScalarWeightingComputeGradient ( static_cast < bool > ( 1 ) ) ; } virtual void ComputeGradientOff ( ) { this -> SetScalarWeightingComputeGradient ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify a point locator. By default a vtkStaticPointLocator is
##  used. The locator performs efficient searches to locate near a
##  specified interpolation position.
##  void SetLocator ( vtkAbstractPointLocator * locator ) ; virtual vtkAbstractPointLocator * GetnameLocator ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Locator  address  << static_cast < vtkAbstractPointLocator * > ( this -> Locator ) ) ; return this -> Locator ; } ; /@} *
##  This enum is used to classify the behavior of the function gradient. Regions
##  where all density values used in the calculation of the gradient are zero
##  are referred to as ZERO regions. Otherwise NON_ZERO. This can be used to
##  differentiate between regions where data is available and where it is not.
##  enum FunctionClass { ZERO = 0 , NON_ZERO = 1 } ; protected : vtkPointDensityFilter ( ) ; ~ vtkPointDensityFilter ( ) override ; int SampleDimensions [ 3 ] ;  dimensions of volume over which to estimate density double ModelBounds [ 6 ] ;  bounding box of splatting dimensions double AdjustDistance ;  how much to pad the model bounds if automatically computed double Origin [ 3 ] , Spacing [ 3 ] ;  output geometry int DensityEstimate ;  how to compute the density int DensityForm ;  how to represent density value double RelativeRadius ;  Radius factor for estimating density double Radius ;  Actually radius used bool ScalarWeighting ;  Are point densities weighted or not? bool ComputeGradient ;  Compute the gradient vector and magnitude vtkAbstractPointLocator * Locator ;  accelerate point searches int FillInputPortInformation ( int port , vtkInformation * info ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; void ComputeModelBounds ( vtkDataSet * input , vtkImageData * output , vtkInformation * outInfo ) ; private : vtkPointDensityFilter ( const vtkPointDensityFilter & ) = delete ; void operator = ( const vtkPointDensityFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
