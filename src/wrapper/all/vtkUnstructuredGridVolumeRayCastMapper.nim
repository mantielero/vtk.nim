## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkUnstructuredGridVolumeRayCastMapper.h
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
##  @class   vtkUnstructuredGridVolumeRayCastMapper
##  @brief   A software mapper for unstructured volumes
##
##  This is a software ray caster for rendering volumes in vtkUnstructuredGrid.
##
##  @sa
##  vtkVolumeMapper
##

## !!!Ignored construct:  # vtkUnstructuredGridVolumeRayCastMapper_h [NewLine] # vtkUnstructuredGridVolumeRayCastMapper_h [NewLine] # vtkRenderingVolumeModule.h  For export macro # vtkUnstructuredGridVolumeMapper.h [NewLine] class vtkDoubleArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkIdList"
discard "forward decl of vtkMultiThreader"
discard "forward decl of vtkRayCastImageDisplayHelper"
discard "forward decl of vtkRenderer"
discard "forward decl of vtkTimerLog"
discard "forward decl of vtkUnstructuredGridVolumeRayCastFunction"
discard "forward decl of vtkUnstructuredGridVolumeRayCastIterator"
discard "forward decl of vtkUnstructuredGridVolumeRayIntegrator"
discard "forward decl of vtkVolume"
## !!!Ignored construct:  class VTKRENDERINGVOLUME_EXPORT vtkUnstructuredGridVolumeRayCastMapper : public vtkUnstructuredGridVolumeMapper { public : static vtkUnstructuredGridVolumeRayCastMapper * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkUnstructuredGridVolumeMapper Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkUnstructuredGridVolumeMapper :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkUnstructuredGridVolumeRayCastMapper :: IsTypeOf ( type ) ; } static vtkUnstructuredGridVolumeRayCastMapper * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkUnstructuredGridVolumeRayCastMapper * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkUnstructuredGridVolumeRayCastMapper * NewInstance ( ) const { return vtkUnstructuredGridVolumeRayCastMapper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridVolumeMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkUnstructuredGridVolumeRayCastMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkUnstructuredGridVolumeRayCastMapper :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Sampling distance in the XY image dimensions. Default value of 1 meaning
##  1 ray cast per pixel. If set to 0.5, 4 rays will be cast per pixel. If
##  set to 2.0, 1 ray will be cast for every 4 (2 by 2) pixels.
##  virtual void SetImageSampleDistance ( float _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ImageSampleDistance  to  << _arg ) ; if ( this -> ImageSampleDistance != ( _arg < 0.1f ? 0.1f : ( _arg > 100.0f ? 100.0f : _arg ) ) ) { this -> ImageSampleDistance = ( _arg < 0.1f ? 0.1f : ( _arg > 100.0f ? 100.0f : _arg ) ) ; this -> Modified ( ) ; } } virtual float GetImageSampleDistanceMinValue ( ) { return 0.1f ; } virtual float GetImageSampleDistanceMaxValue ( ) { return 100.0f ; } ; virtual float GetImageSampleDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ImageSampleDistance  of  << this -> ImageSampleDistance ) ; return this -> ImageSampleDistance ; } ; /@} /@{ *
##  This is the minimum image sample distance allow when the image
##  sample distance is being automatically adjusted
##  virtual void SetImageSampleDistanceMinimumImageSampleDistance ( float _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << MinimumImageSampleDistance  to  << _arg ) ; if ( this -> MinimumImageSampleDistance != ( _arg < 0.1f ? 0.1f : ( _arg > 100.0f ? 100.0f : _arg ) ) ) { this -> MinimumImageSampleDistance = ( _arg < 0.1f ? 0.1f : ( _arg > 100.0f ? 100.0f : _arg ) ) ; this -> Modified ( ) ; } } virtual float GetImageSampleDistanceMinValueMinimumImageSampleDistanceMinValue ( ) { return 0.1f ; } virtual float GetImageSampleDistanceMaxValueMinimumImageSampleDistanceMaxValue ( ) { return 100.0f ; } ; virtual float GetImageSampleDistanceMinimumImageSampleDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MinimumImageSampleDistance  of  << this -> MinimumImageSampleDistance ) ; return this -> MinimumImageSampleDistance ; } ; /@} /@{ *
##  This is the maximum image sample distance allow when the image
##  sample distance is being automatically adjusted
##  virtual void SetImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistance ( float _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << MaximumImageSampleDistance  to  << _arg ) ; if ( this -> MaximumImageSampleDistance != ( _arg < 0.1f ? 0.1f : ( _arg > 100.0f ? 100.0f : _arg ) ) ) { this -> MaximumImageSampleDistance = ( _arg < 0.1f ? 0.1f : ( _arg > 100.0f ? 100.0f : _arg ) ) ; this -> Modified ( ) ; } } virtual float GetImageSampleDistanceMinValueMinimumImageSampleDistanceMinValueMaximumImageSampleDistanceMinValue ( ) { return 0.1f ; } virtual float GetImageSampleDistanceMaxValueMinimumImageSampleDistanceMaxValueMaximumImageSampleDistanceMaxValue ( ) { return 100.0f ; } ; virtual float GetImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumImageSampleDistance  of  << this -> MaximumImageSampleDistance ) ; return this -> MaximumImageSampleDistance ; } ; /@} /@{ *
##  If AutoAdjustSampleDistances is on, the ImageSampleDistance
##  will be varied to achieve the allocated render time of this
##  prop (controlled by the desired update rate and any culling in
##  use).
##  virtual void SetImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceAutoAdjustSampleDistances ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << AutoAdjustSampleDistances  to  << _arg ) ; if ( this -> AutoAdjustSampleDistances != ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ) { this -> AutoAdjustSampleDistances = ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ; this -> Modified ( ) ; } } virtual vtkTypeBool GetImageSampleDistanceMinValueMinimumImageSampleDistanceMinValueMaximumImageSampleDistanceMinValueAutoAdjustSampleDistancesMinValue ( ) { return 0 ; } virtual vtkTypeBool GetImageSampleDistanceMaxValueMinimumImageSampleDistanceMaxValueMaximumImageSampleDistanceMaxValueAutoAdjustSampleDistancesMaxValue ( ) { return 1 ; } ; virtual vtkTypeBool GetImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceAutoAdjustSampleDistances ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AutoAdjustSampleDistances  of  << this -> AutoAdjustSampleDistances ) ; return this -> AutoAdjustSampleDistances ; } ; virtual void AutoAdjustSampleDistancesOn ( ) { this -> SetAutoAdjustSampleDistances ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void AutoAdjustSampleDistancesOff ( ) { this -> SetAutoAdjustSampleDistances ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the number of threads to use. This by default is equal to
##  the number of available processors detected.
##  virtual void SetNumberOfThreads ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NumberOfThreads  to  << _arg ) ; if ( this -> NumberOfThreads != _arg ) { this -> NumberOfThreads = _arg ; this -> Modified ( ) ; } } ; virtual int GetImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceAutoAdjustSampleDistancesNumberOfThreads ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfThreads  of  << this -> NumberOfThreads ) ; return this -> NumberOfThreads ; } ; /@} /@{ *
##  If IntermixIntersectingGeometry is turned on, the zbuffer will be
##  captured and used to limit the traversal of the rays.
##  virtual void SetImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceAutoAdjustSampleDistancesIntermixIntersectingGeometry ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << IntermixIntersectingGeometry  to  << _arg ) ; if ( this -> IntermixIntersectingGeometry != ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ) { this -> IntermixIntersectingGeometry = ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ; this -> Modified ( ) ; } } virtual vtkTypeBool GetImageSampleDistanceMinValueMinimumImageSampleDistanceMinValueMaximumImageSampleDistanceMinValueAutoAdjustSampleDistancesMinValueIntermixIntersectingGeometryMinValue ( ) { return 0 ; } virtual vtkTypeBool GetImageSampleDistanceMaxValueMinimumImageSampleDistanceMaxValueMaximumImageSampleDistanceMaxValueAutoAdjustSampleDistancesMaxValueIntermixIntersectingGeometryMaxValue ( ) { return 1 ; } ; virtual vtkTypeBool GetImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceAutoAdjustSampleDistancesNumberOfThreadsIntermixIntersectingGeometry ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IntermixIntersectingGeometry  of  << this -> IntermixIntersectingGeometry ) ; return this -> IntermixIntersectingGeometry ; } ; virtual void IntermixIntersectingGeometryOn ( ) { this -> SetAutoAdjustSampleDistancesIntermixIntersectingGeometry ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void IntermixIntersectingGeometryOff ( ) { this -> SetAutoAdjustSampleDistancesIntermixIntersectingGeometry ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the helper class for casting rays.
##  virtual void SetRayCastFunction ( vtkUnstructuredGridVolumeRayCastFunction * f ) ; virtual vtkUnstructuredGridVolumeRayCastFunction * GetnameRayCastFunction ( ) { vtkDebugWithObjectMacro ( this , <<  returning  RayCastFunction  address  << static_cast < vtkUnstructuredGridVolumeRayCastFunction * > ( this -> RayCastFunction ) ) ; return this -> RayCastFunction ; } ; /@} /@{ *
##  Set/Get the helper class for integrating rays.  If set to NULL, a
##  default integrator will be assigned.
##  virtual void SetRayIntegrator ( vtkUnstructuredGridVolumeRayIntegrator * ri ) ; virtual vtkUnstructuredGridVolumeRayIntegrator * GetnameRayCastFunctionRayIntegrator ( ) { vtkDebugWithObjectMacro ( this , <<  returning  RayIntegrator  address  << static_cast < vtkUnstructuredGridVolumeRayIntegrator * > ( this -> RayIntegrator ) ) ; return this -> RayIntegrator ; } ; /@} *
##  WARNING: INTERNAL METHOD - NOT INTENDED FOR GENERAL USE
##  Initialize rendering for this volume.
##  void Render ( vtkRenderer * , vtkVolume * ) override ; *
##  WARNING: INTERNAL METHOD - NOT INTENDED FOR GENERAL USE
##  Release any graphics resources that are being consumed by this mapper.
##  The parameter window could be used to determine which graphic
##  resources to release.
##  void ReleaseGraphicsResources ( vtkWindow * ) override ; virtual int * GetImageInUseSize ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ImageInUseSize  pointer  << this -> ImageInUseSize ) ; return this -> ImageInUseSize ; } VTK_WRAPEXCLUDE virtual void GetImageInUseSize ( int data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> ImageInUseSize [ i ] ; } } ; virtual int * GetImageInUseSizeImageOrigin ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ImageOrigin  pointer  << this -> ImageOrigin ) ; return this -> ImageOrigin ; } VTK_WRAPEXCLUDE virtual void GetImageInUseSizeImageOrigin ( int data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> ImageOrigin [ i ] ; } } ; virtual int * GetImageInUseSizeImageOriginImageViewportSize ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ImageViewportSize  pointer  << this -> ImageViewportSize ) ; return this -> ImageViewportSize ; } VTK_WRAPEXCLUDE virtual void GetImageInUseSizeImageOriginImageViewportSize ( int data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> ImageViewportSize [ i ] ; } } ; void CastRays ( int threadID , int threadCount ) ; protected : vtkUnstructuredGridVolumeRayCastMapper ( ) ; ~ vtkUnstructuredGridVolumeRayCastMapper ( ) override ; float ImageSampleDistance ; float MinimumImageSampleDistance ; float MaximumImageSampleDistance ; vtkTypeBool AutoAdjustSampleDistances ; vtkMultiThreader * Threader ; int NumberOfThreads ; vtkRayCastImageDisplayHelper * ImageDisplayHelper ;  This is how big the image would be if it covered the entire viewport int ImageViewportSize [ 2 ] ;  This is how big the allocated memory for image is. This may be bigger
##  or smaller than ImageFullSize - it will be bigger if necessary to
##  ensure a power of 2, it will be smaller if the volume only covers a
##  small region of the viewport int ImageMemorySize [ 2 ] ;  This is the size of subregion in ImageSize image that we are using for
##  the current image. Since ImageSize is a power of 2, there is likely
##  wasted space in it. This number will be used for things such as clearing
##  the image if necessary. int ImageInUseSize [ 2 ] ;  This is the location in ImageFullSize image where our ImageSize image
##  is located. int ImageOrigin [ 2 ] ;  This is the allocated image unsigned char * Image ; float * RenderTimeTable ; vtkVolume * * RenderVolumeTable ; vtkRenderer * * RenderRendererTable ; int RenderTableSize ; int RenderTableEntries ; void StoreRenderTime ( vtkRenderer * ren , vtkVolume * vol , float t ) ; float RetrieveRenderTime ( vtkRenderer * ren , vtkVolume * vol ) ; vtkTypeBool IntermixIntersectingGeometry ; float * ZBuffer ; int ZBufferSize [ 2 ] ; int ZBufferOrigin [ 2 ] ;  Get the ZBuffer value corresponding to location (x,y) where (x,y)
##  are indexing into the ImageInUse image. This must be converted to
##  the zbuffer image coordinates. Nearest neighbor value is returned. double GetZBufferValue ( int x , int y ) ; double GetMinimumBoundsDepth ( vtkRenderer * ren , vtkVolume * vol ) ; vtkUnstructuredGridVolumeRayCastFunction * RayCastFunction ; vtkUnstructuredGridVolumeRayCastIterator * * RayCastIterators ; vtkUnstructuredGridVolumeRayIntegrator * RayIntegrator ; vtkUnstructuredGridVolumeRayIntegrator * RealRayIntegrator ; vtkIdList * * IntersectedCellsBuffer ; vtkDoubleArray * * IntersectionLengthsBuffer ; vtkDataArray * * NearIntersectionsBuffer ; vtkDataArray * * FarIntersectionsBuffer ; vtkVolume * CurrentVolume ; vtkRenderer * CurrentRenderer ; vtkDataArray * Scalars ; int CellScalars ; private : vtkUnstructuredGridVolumeRayCastMapper ( const vtkUnstructuredGridVolumeRayCastMapper & ) = delete ; void operator = ( const vtkUnstructuredGridVolumeRayCastMapper & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
