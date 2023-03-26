## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkVolumeMapper.h
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
##  @class   vtkVolumeMapper
##  @brief   Abstract class for a volume mapper
##
##
##  vtkVolumeMapper is the abstract definition of a volume mapper for regular
##  rectilinear data (vtkImageData). Several basic types of volume mappers
##  are supported.
##

## !!!Ignored construct:  # vtkVolumeMapper_h [NewLine] # vtkVolumeMapper_h [NewLine] # vtkAbstractVolumeMapper.h [NewLine] # vtkRenderingVolumeModule.h  For export macro [NewLine] class vtkImageData ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkRectilinearGrid"
discard "forward decl of vtkRenderer"
discard "forward decl of vtkVolume"
const
  VTK_CROP_SUBVOLUME* = 0x0002000
  VTK_CROP_FENCE* = 0x2ebfeba
  VTK_CROP_INVERTED_FENCE* = 0x5140145
  VTK_CROP_CROSS* = 0x0417410
  VTK_CROP_INVERTED_CROSS* = 0x7be8bef

discard "forward decl of vtkWindow"
## !!!Ignored construct:  class VTKRENDERINGVOLUME_EXPORT vtkVolumeMapper : public vtkAbstractVolumeMapper { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkAbstractVolumeMapper Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkAbstractVolumeMapper :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkVolumeMapper :: IsTypeOf ( type ) ; } static vtkVolumeMapper * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkVolumeMapper * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkVolumeMapper * NewInstance ( ) const { return vtkVolumeMapper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractVolumeMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkVolumeMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkVolumeMapper :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set/Get the input data
##  virtual void SetInputData ( vtkImageData * ) ; virtual void SetInputData ( vtkDataSet * ) ; virtual void SetInputData ( vtkRectilinearGrid * ) ; virtual vtkDataSet * GetInput ( ) ; virtual vtkDataSet * GetInput ( const int port ) ; /@} /@{ *
##  Set/Get the blend mode.
##  The default mode is Composite where the scalar values are sampled through
##  the volume and composited in a front-to-back scheme through alpha blending.
##  The final color and opacity is determined using the color and opacity
##  transfer functions.
##
##  Maximum and minimum intensity blend modes use the maximum and minimum
##  scalar values, respectively, along the sampling ray. The final color and
##  opacity is determined by passing the resultant value through the color and
##  opacity transfer functions.
##
##  Additive blend mode accumulates scalar values by passing each value through
##  the opacity transfer function and then adding up the product of the value
##  and its opacity. In other words, the scalar values are scaled using the
##  opacity transfer function and summed to derive the final color. Note that
##  the resulting image is always grayscale i.e. aggregated values are not
##  passed through the color transfer function. This is because the final
##  value is a derived value and not a real data value along the sampling ray.
##
##  Average intensity blend mode works similar to the additive blend mode where
##  the scalar values are multiplied by opacity calculated from the opacity
##  transfer function and then added. The additional step here is to
##  divide the sum by the number of samples taken through the volume.
##  One can control the scalar range by setting the AverageIPScalarRange ivar
##  to disregard scalar values, not in the range of interest, from the average
##  computation.
##  As is the case with the additive intensity projection, the final
##  image will always be grayscale i.e. the aggregated values are not
##  passed through the color transfer function. This is because the
##  resultant value is a derived value and not a real data value along
##  the sampling ray.
##
##  IsoSurface blend mode uses contour values defined by the user in order
##  to display scalar values only when the ray crosses the contour. It supports
##  opacity the same way composite blend mode does.
##
##  \note vtkVolumeMapper::AVERAGE_INTENSITY_BLEND and ISOSURFACE_BLEND are
##  only supported by the vtkGPUVolumeRayCastMapper with the OpenGL2 backend.
##  \sa SetAverageIPScalarRange()
##  \sa GetIsosurfaceValues()
##  virtual void SetBlendMode ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  BlendMode  to  << _arg ) ; if ( this -> BlendMode != _arg ) { this -> BlendMode = _arg ; this -> Modified ( ) ; } } ; void SetBlendModeToComposite ( ) { this -> SetBlendMode ( vtkVolumeMapper :: COMPOSITE_BLEND ) ; } void SetBlendModeToMaximumIntensity ( ) { this -> SetBlendMode ( vtkVolumeMapper :: MAXIMUM_INTENSITY_BLEND ) ; } void SetBlendModeToMinimumIntensity ( ) { this -> SetBlendMode ( vtkVolumeMapper :: MINIMUM_INTENSITY_BLEND ) ; } void SetBlendModeToAverageIntensity ( ) { this -> SetBlendMode ( vtkVolumeMapper :: AVERAGE_INTENSITY_BLEND ) ; } void SetBlendModeToAdditive ( ) { this -> SetBlendMode ( vtkVolumeMapper :: ADDITIVE_BLEND ) ; } void SetBlendModeToIsoSurface ( ) { this -> SetBlendMode ( vtkVolumeMapper :: ISOSURFACE_BLEND ) ; } void SetBlendModeToSlice ( ) { this -> SetBlendMode ( vtkVolumeMapper :: SLICE_BLEND ) ; } virtual int GetBlendMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BlendMode  of  << this -> BlendMode ) ; return this -> BlendMode ; } ; /@} /@{ *
##  Set/Get the scalar range to be considered for average intensity projection
##  blend mode. Only scalar values between this range will be averaged during
##  ray casting. This can be useful when volume rendering CT datasets where the
##  areas occupied by air would deviate the final rendering. By default, the
##  range is set to (VTK_FLOAT_MIN, VTK_FLOAT_MAX).
##  \sa SetBlendModeToAverageIntensity()
##  virtual void SetAverageIPScalarRange ( double _arg1 , double _arg2 ) { vtkDebugWithObjectMacro ( this , <<  setting  << AverageIPScalarRange  to ( << _arg1 << , << _arg2 << ) ) ; if ( ( this -> AverageIPScalarRange [ 0 ] != _arg1 ) || ( this -> AverageIPScalarRange [ 1 ] != _arg2 ) ) { this -> AverageIPScalarRange [ 0 ] = _arg1 ; this -> AverageIPScalarRange [ 1 ] = _arg2 ; this -> Modified ( ) ; } } void SetAverageIPScalarRange ( const double _arg [ 2 ] ) { this -> SetAverageIPScalarRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; virtual double * GetAverageIPScalarRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << AverageIPScalarRange  pointer  << this -> AverageIPScalarRange ) ; return this -> AverageIPScalarRange ; } VTK_WRAPEXCLUDE virtual void GetAverageIPScalarRange ( double data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> AverageIPScalarRange [ i ] ; } } ; /@} /@{ *
##  Turn On/Off orthogonal cropping. (Clipping planes are
##  perpendicular to the coordinate axes.)
##  virtual void SetCropping ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Cropping  to  << _arg ) ; if ( this -> Cropping != ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ) { this -> Cropping = ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ; this -> Modified ( ) ; } } virtual vtkTypeBool GetCroppingMinValue ( ) { return 0 ; } virtual vtkTypeBool GetCroppingMaxValue ( ) { return 1 ; } ; virtual vtkTypeBool GetBlendModeCropping ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Cropping  of  << this -> Cropping ) ; return this -> Cropping ; } ; virtual void CroppingOn ( ) { this -> SetCropping ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void CroppingOff ( ) { this -> SetCropping ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the Cropping Region Planes ( xmin, xmax, ymin, ymax, zmin, zmax )
##  These planes are defined in volume coordinates - spacing and origin are
##  considered.
##  virtual void SetCroppingRegionPlanes ( double _arg1 , double _arg2 , double _arg3 , double _arg4 , double _arg5 , double _arg6 ) { vtkDebugWithObjectMacro ( this , <<  setting  << CroppingRegionPlanes  to ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; if ( ( this -> CroppingRegionPlanes [ 0 ] != _arg1 ) || ( this -> CroppingRegionPlanes [ 1 ] != _arg2 ) || ( this -> CroppingRegionPlanes [ 2 ] != _arg3 ) || ( this -> CroppingRegionPlanes [ 3 ] != _arg4 ) || ( this -> CroppingRegionPlanes [ 4 ] != _arg5 ) || ( this -> CroppingRegionPlanes [ 5 ] != _arg6 ) ) { this -> CroppingRegionPlanes [ 0 ] = _arg1 ; this -> CroppingRegionPlanes [ 1 ] = _arg2 ; this -> CroppingRegionPlanes [ 2 ] = _arg3 ; this -> CroppingRegionPlanes [ 3 ] = _arg4 ; this -> CroppingRegionPlanes [ 4 ] = _arg5 ; this -> CroppingRegionPlanes [ 5 ] = _arg6 ; this -> Modified ( ) ; } } virtual void SetCroppingRegionPlanes ( const double _arg [ 6 ] ) { this -> SetCroppingRegionPlanes ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; virtual double * GetAverageIPScalarRangeCroppingRegionPlanes ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << CroppingRegionPlanes  pointer  << this -> CroppingRegionPlanes ) ; return this -> CroppingRegionPlanes ; } VTK_WRAPEXCLUDE virtual void GetAverageIPScalarRangeCroppingRegionPlanes ( double data [ 6 ] ) { for ( int i = 0 ; i < 6 ; i ++ ) { data [ i ] = this -> CroppingRegionPlanes [ i ] ; } } ; /@} /@{ *
##  Get the cropping region planes in voxels. Only valid during the
##  rendering process
##  virtual double * GetAverageIPScalarRangeCroppingRegionPlanesVoxelCroppingRegionPlanes ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << VoxelCroppingRegionPlanes  pointer  << this -> VoxelCroppingRegionPlanes ) ; return this -> VoxelCroppingRegionPlanes ; } VTK_WRAPEXCLUDE virtual void GetAverageIPScalarRangeCroppingRegionPlanesVoxelCroppingRegionPlanes ( double data [ 6 ] ) { for ( int i = 0 ; i < 6 ; i ++ ) { data [ i ] = this -> VoxelCroppingRegionPlanes [ i ] ; } } ; /@} /@{ *
##  If enabled, the volume(s) whose shading is enabled will use the gradient
##  of opacity instead of the scalar gradient to estimate the surface's normal
##  when applying the shading model. The opacity considered for the gradient
##  is then the scalars converted to opacity by the transfer function(s).
##  For now it is only supported in vtkGPUVolumeRayCastMapper.
##  In vtkSmartVolumeMapper and in vtkMultiBlockVolumeMapper, this parameter
##  is used when the GPU mapper is effectively used.
##  Note that enabling it might affect performances, especially when
##  using a 2D TF or a gradient opacity. It is disabled by default.
##  virtual void SetBlendModeComputeNormalFromOpacity ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeNormalFromOpacity  to  << _arg ) ; if ( this -> ComputeNormalFromOpacity != _arg ) { this -> ComputeNormalFromOpacity = _arg ; this -> Modified ( ) ; } } ; virtual bool GetBlendModeCroppingComputeNormalFromOpacity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeNormalFromOpacity  of  << this -> ComputeNormalFromOpacity ) ; return this -> ComputeNormalFromOpacity ; } ; virtual void ComputeNormalFromOpacityOn ( ) { this -> SetCroppingComputeNormalFromOpacity ( static_cast < bool > ( 1 ) ) ; } virtual void ComputeNormalFromOpacityOff ( ) { this -> SetCroppingComputeNormalFromOpacity ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Set the flags for the cropping regions. The clipping planes divide the
##  volume into 27 regions - there is one bit for each region. The regions
##  start from the one containing voxel (0,0,0), moving along the x axis
##  fastest, the y axis next, and the z axis slowest. These are represented
##  from the lowest bit to bit number 27 in the integer containing the
##  flags. There are several convenience functions to set some common
##  configurations - subvolume (the default), fence (between any of the
##  clip plane pairs), inverted fence, cross (between any two of the
##  clip plane pairs) and inverted cross.
##  virtual void SetCroppingCroppingRegionFlags ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << CroppingRegionFlags  to  << _arg ) ; if ( this -> CroppingRegionFlags != ( _arg < 0x0 ? 0x0 : ( _arg > 0x7ffffff ? 0x7ffffff : _arg ) ) ) { this -> CroppingRegionFlags = ( _arg < 0x0 ? 0x0 : ( _arg > 0x7ffffff ? 0x7ffffff : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetCroppingMinValueCroppingRegionFlagsMinValue ( ) { return 0x0 ; } virtual int GetCroppingMaxValueCroppingRegionFlagsMaxValue ( ) { return 0x7ffffff ; } ; virtual int GetBlendModeCroppingComputeNormalFromOpacityCroppingRegionFlags ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CroppingRegionFlags  of  << this -> CroppingRegionFlags ) ; return this -> CroppingRegionFlags ; } ; void SetCroppingRegionFlagsToSubVolume ( ) { this -> SetCroppingRegionFlags ( VTK_CROP_SUBVOLUME ) ; } void SetCroppingRegionFlagsToFence ( ) { this -> SetCroppingRegionFlags ( VTK_CROP_FENCE ) ; } void SetCroppingRegionFlagsToInvertedFence ( ) { this -> SetCroppingRegionFlags ( VTK_CROP_INVERTED_FENCE ) ; } void SetCroppingRegionFlagsToCross ( ) { this -> SetCroppingRegionFlags ( VTK_CROP_CROSS ) ; } void SetCroppingRegionFlagsToInvertedCross ( ) { this -> SetCroppingRegionFlags ( VTK_CROP_INVERTED_CROSS ) ; } /@} *
##  WARNING: INTERNAL METHOD - NOT INTENDED FOR GENERAL USE
##  DO NOT USE THIS METHOD OUTSIDE OF THE RENDERING PROCESS
##  Render the volume
##  void Render ( vtkRenderer * ren , vtkVolume * vol ) override = 0 ; *
##  WARNING: INTERNAL METHOD - NOT INTENDED FOR GENERAL USE
##  Release any graphics resources that are being consumed by this mapper.
##  The parameter window could be used to determine which graphic
##  resources to release.
##  void ReleaseGraphicsResources ( vtkWindow * ) override { } *
##  Blend modes.
##  The default mode is Composite where the scalar values are sampled through
##  the volume and composited in a front-to-back scheme through alpha blending.
##  The final color and opacity is determined using the color and opacity
##  transfer functions.
##
##  Maximum and minimum intensity blend modes use the maximum and minimum
##  scalar values, respectively,  along the sampling ray. The final color and
##  opacity is determined by passing the resultant value through the color and
##  opacity transfer functions.
##
##  Additive blend mode accumulates scalar values by passing each value through
##  the opacity transfer function and then adding up the product of the value
##  and its opacity. In other words, the scalar values are scaled using the
##  opacity transfer function and summed to derive the final color. Note that
##  the resulting image is always grayscale i.e. aggregated values are not
##  passed through the color transfer function. This is because the final
##  value is a derived value and not a real data value along the sampling ray.
##
##  Average intensity blend mode works similar to the additive blend mode where
##  the scalar values are multiplied by opacity calculated from the opacity
##  transfer function and then added. The additional step here is to
##  divide the sum by the number of samples taken through the volume.
##  One can control the scalar range by setting the AverageIPScalarRange ivar
##  to disregard scalar values, not in the range of interest, from the average
##  computation.
##  As is the case with the additive intensity projection, the final
##  image will always be grayscale i.e. the aggregated values are not
##  passed through the color transfer function. This is because the
##  resultant value is a derived value and not a real data value along
##  the sampling ray.
##
##  IsoSurface blend mode uses contour values defined by the user in order
##  to display scalar values only when the ray crosses the contour. It supports
##  opacity the same way composite blend mode does.
##
##  \note vtkVolumeMapper::AVERAGE_INTENSITY_BLEND and ISOSURFACE_BLEND are
##  only supported by the vtkGPUVolumeRayCastMapper with the OpenGL2 backend.
##  \sa SetAverageIPScalarRange()
##  \sa GetIsoSurfaceValues()
##  enum BlendModes { COMPOSITE_BLEND , MAXIMUM_INTENSITY_BLEND , MINIMUM_INTENSITY_BLEND , AVERAGE_INTENSITY_BLEND , ADDITIVE_BLEND , ISOSURFACE_BLEND , SLICE_BLEND } ; protected : vtkVolumeMapper ( ) ; ~ vtkVolumeMapper ( ) override ; *
##  Compute a sample distance from the data spacing. When the number of
##  voxels is 8, the sample distance will be roughly 1/200 the average voxel
##  size. The distance will grow proportionally to numVoxels^(1/3).
##  double SpacingAdjustedSampleDistance ( double inputSpacing [ 3 ] , int inputExtent [ 6 ] ) ; int BlendMode ; *
##  Is the normal for volume shading computed from opacity or from scalars
##  bool ComputeNormalFromOpacity = false ; *
##  Threshold range for average intensity projection
##  double AverageIPScalarRange [ 2 ] ; /@{ *
##  Cropping variables, and a method for converting the world
##  coordinate cropping region planes to voxel coordinates
##  vtkTypeBool Cropping ; double CroppingRegionPlanes [ 6 ] ; double VoxelCroppingRegionPlanes [ 6 ] ; int CroppingRegionFlags ; void ConvertCroppingRegionPlanesToVoxels ( ) ; /@} int FillInputPortInformation ( int , vtkInformation * ) override ; private : vtkVolumeMapper ( const vtkVolumeMapper & ) = delete ; void operator = ( const vtkVolumeMapper & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
