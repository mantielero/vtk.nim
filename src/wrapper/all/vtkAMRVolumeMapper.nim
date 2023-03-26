## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAMRVolumeMapper.h
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
##  @class   vtkAMRVolumeMapper
##  @brief   AMR class for a volume mapper
##
##
##  vtkAMRVolumeMapper is the definition of a volume mapper.
##  for AMR Structured Data
##
##
##

## !!!Ignored construct:  # vtkAMRVolumeMapper_h [NewLine] # vtkAMRVolumeMapper_h [NewLine] # vtkImageReslice.h  for VTK_RESLICE_NEAREST, VTK_RESLICE_CUBIC # vtkRenderingVolumeAMRModule.h  For export macro # vtkVolumeMapper.h [NewLine] class vtkAMRResampleFilter ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkCamera"
discard "forward decl of vtkImageData"
discard "forward decl of vtkOverlappingAMR"
discard "forward decl of vtkSmartVolumeMapper"
discard "forward decl of vtkUniformGrid"
## !!!Ignored construct:  class VTKRENDERINGVOLUMEAMR_EXPORT vtkAMRVolumeMapper : public vtkVolumeMapper { public : static vtkAMRVolumeMapper * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkVolumeMapper Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkVolumeMapper :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkAMRVolumeMapper :: IsTypeOf ( type ) ; } static vtkAMRVolumeMapper * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkAMRVolumeMapper * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkAMRVolumeMapper * NewInstance ( ) const { return vtkAMRVolumeMapper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkVolumeMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAMRVolumeMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAMRVolumeMapper :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set the input data
##  void SetInputData ( vtkImageData * ) override ; void SetInputData ( vtkDataSet * ) override ; void SetInputData ( vtkRectilinearGrid * ) override ; virtual void SetInputData ( vtkOverlappingAMR * ) ; void SetInputConnection ( int port , vtkAlgorithmOutput * input ) override ; void SetInputConnection ( vtkAlgorithmOutput * input ) override { this -> SetInputConnection ( 0 , input ) ; } /@} /@{ *
##  Return bounding box (array of six doubles) of data expressed as
##  (xmin,xmax, ymin,ymax, zmin,zmax).
##  double * GetBounds ( ) override ; void GetBounds ( double bounds [ 6 ] ) override { this -> vtkVolumeMapper :: GetBounds ( bounds ) ; } /@} *
##  Control how the mapper works with scalar point data and cell attribute
##  data.  By default (ScalarModeToDefault), the mapper will use point data,
##  and if no point data is available, then cell data is used. Alternatively
##  you can explicitly set the mapper to use point data
##  (ScalarModeToUsePointData) or cell data (ScalarModeToUseCellData).
##  You can also choose to get the scalars from an array in point field
##  data (ScalarModeToUsePointFieldData) or cell field data
##  (ScalarModeToUseCellFieldData).  If scalars are coming from a field
##  data array, you must call SelectScalarArray.
##  void SetScalarMode ( int mode ) override ; /@{ *
##  Set/Get the blend mode.
##  Additive blend mode adds scalars along the ray and multiply them by
##  their opacity mapping value.
##  void SetBlendMode ( int mode ) override ; int GetBlendMode ( ) override ; /@} /@{ *
##  When ScalarMode is set to UsePointFieldData or UseCellFieldData,
##  you can specify which scalar array to use during rendering.
##  The transfer function in the vtkVolumeProperty (attached to the calling
##  vtkVolume) will decide how to convert vectors to colors.
##  void SelectScalarArray ( int arrayNum ) override ; void SelectScalarArray ( const char * arrayName ) override ; /@} /@{ *
##  Get the array name or number and component to use for rendering.
##  char * GetArrayName ( ) override ; int GetArrayId ( ) override ; int GetArrayAccessMode ( ) override ; /@} *
##  Return the method for obtaining scalar data.
##  const char * GetScalarModeAsString ( ) ; /@{ *
##  Turn On/Off orthogonal cropping. (Clipping planes are
##  perpendicular to the coordinate axes.)
##  void SetCropping ( vtkTypeBool ) override ; vtkTypeBool GetCropping ( ) override ; /@} /@{ *
##  Set/Get the Cropping Region Planes ( xmin, xmax, ymin, ymax, zmin, zmax )
##  These planes are defined in volume coordinates - spacing and origin are
##  considered.
##  void SetCroppingRegionPlanes ( double arg1 , double arg2 , double arg3 , double arg4 , double arg5 , double arg6 ) override ; void SetCroppingRegionPlanes ( const double * planes ) override { this -> SetCroppingRegionPlanes ( planes [ 0 ] , planes [ 1 ] , planes [ 2 ] , planes [ 3 ] , planes [ 4 ] , planes [ 5 ] ) ; } void GetCroppingRegionPlanes ( double * planes ) override ; double * GetCroppingRegionPlanes ( ) VTK_SIZEHINT ( 6 ) override ; /@}
## /@{ *
##  Set the flags for the cropping regions. The clipping planes divide the
##  volume into 27 regions - there is one bit for each region. The regions
##  start from the one containing voxel (0,0,0), moving along the x axis
##  fastest, the y axis next, and the z axis slowest. These are represented
##  from the lowest bit to bit number 27 in the integer containing the
##  flags. There are several convenience functions to set some common
##  configurations - subvolume (the default), fence (between any of the
##  clip plane pairs), inverted fence, cross (between any two of the
##  clip plane pairs) and inverted cross.
##  void SetCroppingRegionFlags ( int mode ) override ; int GetCroppingRegionFlags ( ) override ; /@}  The possible values for the default and current render mode ivars enum { DefaultRenderMode = 0 , RayCastAndTextureRenderMode , RayCastRenderMode , TextureRenderMode , GPURenderMode , UndefinedRenderMode , InvalidRenderMode } ; /@{ *
##  Set the requested render mode. The default is
##  vtkSmartVolumeMapper::DefaultRenderMode.
##  void SetRequestedRenderMode ( int mode ) ; int GetRequestedRenderMode ( ) ; /@} *
##  Set the requested render mode to vtkAMRVolumeMapper::DefaultRenderMode.
##  This is the best option for an application that must adapt to different
##  data types, hardware, and rendering parameters.
##  void SetRequestedRenderModeToDefault ( ) { this -> SetRequestedRenderMode ( vtkAMRVolumeMapper :: DefaultRenderMode ) ; } *
##  Set the requested render mode to
##  vtkAMRVolumeMapper::RayCastAndTextureRenderMode.
##  This is a good option if you want to avoid using advanced OpenGL
##  functionality, but would still like to used 3D texture mapping, if
##  available, for interactive rendering.
##  void SetRequestedRenderModeToRayCastAndTexture ( ) { this -> SetRequestedRenderMode ( vtkAMRVolumeMapper :: RayCastAndTextureRenderMode ) ; } *
##  Set the requested render mode to vtkAMRVolumeMapper::RayCastRenderMode.
##  This option will use software rendering exclusively. This is a good option
##  if you know there is no hardware acceleration.
##  void SetRequestedRenderModeToRayCast ( ) { this -> SetRequestedRenderMode ( vtkAMRVolumeMapper :: RayCastRenderMode ) ; } *
##  Set the requested render mode to
##  vtkAMRVolumeMapper::TextureRenderMode.
##  This is a good option if you want to use 3D texture mapping, if
##  available, for interactive rendering.
##  void SetRequestedRenderModeToTexture ( ) { this -> SetRequestedRenderMode ( vtkAMRVolumeMapper :: TextureRenderMode ) ; } *
##  Set the requested render mode to
##  vtkAMRVolumeMapper::GPURenderMode.
##  This will do the volume rendering on the GPU
##  void SetRequestedRenderModeToGPU ( ) { this -> SetRequestedRenderMode ( vtkAMRVolumeMapper :: GPURenderMode ) ; } /@{ *
##  Set interpolation mode for downsampling (lowres GPU)
##  (initial value: cubic).
##  void SetInterpolationMode ( int mode ) ; int GetInterpolationMode ( ) ; /@} void SetInterpolationModeToNearestNeighbor ( ) { this -> SetInterpolationMode ( VTK_RESLICE_NEAREST ) ; } void SetInterpolationModeToLinear ( ) { this -> SetInterpolationMode ( VTK_RESLICE_LINEAR ) ; } void SetInterpolationModeToCubic ( ) { this -> SetInterpolationMode ( VTK_RESLICE_CUBIC ) ; } /@{ *
##  Set/Get the number of samples/cells along the i/j/k directions.
##  The default is 128x128x128
##  virtual void SetNumberOfSamples ( int _arg1 , int _arg2 , int _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << NumberOfSamples  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> NumberOfSamples [ 0 ] != _arg1 ) || ( this -> NumberOfSamples [ 1 ] != _arg2 ) || ( this -> NumberOfSamples [ 2 ] != _arg3 ) ) { this -> NumberOfSamples [ 0 ] = _arg1 ; this -> NumberOfSamples [ 1 ] = _arg2 ; this -> NumberOfSamples [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetNumberOfSamples ( const int _arg [ 3 ] ) { this -> SetNumberOfSamples ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual int * GetNumberOfSamples ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfSamples  pointer  << this -> NumberOfSamples ) ; return this -> NumberOfSamples ; } VTK_WRAPEXCLUDE virtual void GetNumberOfSamples ( int & _arg1 , int & _arg2 , int & _arg3 ) { _arg1 = this -> NumberOfSamples [ 0 ] ; _arg2 = this -> NumberOfSamples [ 1 ] ; _arg3 = this -> NumberOfSamples [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfSamples  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetNumberOfSamples ( int _arg [ 3 ] ) { this -> GetNumberOfSamples ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} *
##  WARNING: INTERNAL METHOD - NOT INTENDED FOR GENERAL USE
##  DO NOT USE THIS METHOD OUTSIDE OF THE RENDERING PROCESS
##  Render the volume
##  void Render ( vtkRenderer * ren , vtkVolume * vol ) override ; *
##  WARNING: INTERNAL METHOD - NOT INTENDED FOR GENERAL USE
##  Release any graphics resources that are being consumed by this mapper.
##  The parameter window could be used to determine which graphic
##  resources to release.
##  void ReleaseGraphicsResources ( vtkWindow * ) override ; void ProcessUpdateExtentRequest ( vtkRenderer * renderer , vtkInformation * info , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) ; void ProcessInformationRequest ( vtkRenderer * renderer , vtkInformation * info , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) ; void UpdateResampler ( vtkRenderer * ren , vtkOverlappingAMR * amr ) ; void UpdateResamplerFrustrumMethod ( vtkRenderer * ren , vtkOverlappingAMR * amr ) ; /@{ *
##  Select the type of resampling technique approach to use.
##  virtual void SetRequestedResamplingMode ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  RequestedResamplingMode  to  << _arg ) ; if ( this -> RequestedResamplingMode != _arg ) { this -> RequestedResamplingMode = _arg ; this -> Modified ( ) ; } } ; virtual int GetRequestedResamplingMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RequestedResamplingMode  of  << this -> RequestedResamplingMode ) ; return this -> RequestedResamplingMode ; } ; virtual void SetRequestedResamplingModeFreezeFocalPoint ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  FreezeFocalPoint  to  << _arg ) ; if ( this -> FreezeFocalPoint != _arg ) { this -> FreezeFocalPoint = _arg ; this -> Modified ( ) ; } } ; virtual bool GetRequestedResamplingModeFreezeFocalPoint ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FreezeFocalPoint  of  << this -> FreezeFocalPoint ) ; return this -> FreezeFocalPoint ; } ; /@} /@{ *
##  Sets/Gets the tolerance used to determine if the resampler needs
##  to be updated. Default is 10e-8
##  virtual void SetRequestedResamplingModeFreezeFocalPointResamplerUpdateTolerance ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ResamplerUpdateTolerance  to  << _arg ) ; if ( this -> ResamplerUpdateTolerance != _arg ) { this -> ResamplerUpdateTolerance = _arg ; this -> Modified ( ) ; } } ; virtual double GetRequestedResamplingModeFreezeFocalPointResamplerUpdateTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ResamplerUpdateTolerance  of  << this -> ResamplerUpdateTolerance ) ; return this -> ResamplerUpdateTolerance ; } ; /@} /@{ *
##  Sets/Gets a flag that indicates the internal volume mapper
##  should use the  default number of threads.  This is useful in applications
##  such as ParaView that will turn off multiple threads by default. Default is false
##  virtual void SetRequestedResamplingModeFreezeFocalPointResamplerUpdateToleranceUseDefaultThreading ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseDefaultThreading  to  << _arg ) ; if ( this -> UseDefaultThreading != _arg ) { this -> UseDefaultThreading = _arg ; this -> Modified ( ) ; } } ; virtual bool GetRequestedResamplingModeFreezeFocalPointResamplerUpdateToleranceUseDefaultThreading ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseDefaultThreading  of  << this -> UseDefaultThreading ) ; return this -> UseDefaultThreading ; } ; /@} *
##  Utility method used by UpdateResamplerFrustrumMethod() to compute the
##  bounds.
##  static bool ComputeResamplerBoundsFrustumMethod ( vtkCamera * camera , vtkRenderer * renderer , const double data_bounds [ 6 ] , double out_bounds [ 6 ] ) ; protected : vtkAMRVolumeMapper ( ) ; ~ vtkAMRVolumeMapper ( ) override ;  see algorithm for more info int FillInputPortInformation ( int port , vtkInformation * info ) override ; void UpdateGrid ( ) ; vtkSmartVolumeMapper * InternalMapper ; vtkAMRResampleFilter * Resampler ; vtkUniformGrid * Grid ; int NumberOfSamples [ 3 ] ;  This indicates that the input has meta data for
##  doing demand driven operations. bool HasMetaData ; int RequestedResamplingMode ; bool FreezeFocalPoint ;  Cached values for camera focal point and
##  the distance between the camera position and
##  focal point double LastFocalPointPosition [ 3 ] ; double LastPostionFPDistance ;  This is used when determining if
##  either the camera or focal point has
##  move enough to cause the resampler to update double ResamplerUpdateTolerance ; bool GridNeedsToBeUpdated ; bool UseDefaultThreading ; private : vtkAMRVolumeMapper ( const vtkAMRVolumeMapper & ) = delete ; void operator = ( const vtkAMRVolumeMapper & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
