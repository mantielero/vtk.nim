## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkUnstructuredGridVolumeZSweepMapper.h
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
##  @class   vtkUnstructuredGridVolumeZSweepMapper
##  @brief   Unstructured grid volume mapper based the ZSweep Algorithm
##
##
##  This is a volume mapper for unstructured grid implemented with the ZSweep
##  algorithm. This is a software projective method.
##
##  @sa
##  vtkVolumetMapper
##
##  @par Background:
##  The algorithm is described in the following paper:
##  Ricardo Farias, Joseph S. B. Mitchell and Claudio T. Silva.
##  ZSWEEP: An Efficient and Exact Projection Algorithm for Unstructured Volume
##  Rendering. In 2000 Volume Visualization Symposium, pages 91--99.
##  October 2000.
##  http://www.cse.ogi.edu/~csilva/papers/volvis2000.pdf
##

## !!!Ignored construct:  # vtkUnstructuredGridVolumeZSweepMapper_h [NewLine] # vtkUnstructuredGridVolumeZSweepMapper_h [NewLine] # vtkRenderingVolumeModule.h  For export macro # vtkUnstructuredGridVolumeMapper.h [NewLine] class vtkRenderer ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkVolume"
discard "forward decl of vtkRayCastImageDisplayHelper"
discard "forward decl of vtkCell"
discard "forward decl of vtkGenericCell"
discard "forward decl of vtkIdList"
discard "forward decl of vtkPriorityQueue"
discard "forward decl of vtkTransform"
discard "forward decl of vtkMatrix4x4"
discard "forward decl of vtkVolumeProperty"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkUnstructuredGridVolumeRayIntegrator"
discard "forward decl of vtkRenderWindow"
discard "forward decl of vtkScreenEdge"
discard "forward decl of vtkSpan"
discard "forward decl of vtkPixelListFrame"
discard "forward decl of vtkUseSet"
discard "forward decl of vtkVertices"
discard "forward decl of vtkSimpleScreenEdge"
discard "forward decl of vtkDoubleScreenEdge"
discard "forward decl of vtkVertexEntry"
discard "forward decl of vtkPixelListEntryMemory"
## ignored statement

## !!!Ignored construct:  class VTKRENDERINGVOLUME_EXPORT vtkUnstructuredGridVolumeZSweepMapper : public vtkUnstructuredGridVolumeMapper { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkUnstructuredGridVolumeMapper Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkUnstructuredGridVolumeMapper :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkUnstructuredGridVolumeZSweepMapper :: IsTypeOf ( type ) ; } static vtkUnstructuredGridVolumeZSweepMapper * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkUnstructuredGridVolumeZSweepMapper * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkUnstructuredGridVolumeZSweepMapper * NewInstance ( ) const { return vtkUnstructuredGridVolumeZSweepMapper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridVolumeMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkUnstructuredGridVolumeZSweepMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkUnstructuredGridVolumeZSweepMapper :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Set MaxPixelListSize to 32.
##  static vtkUnstructuredGridVolumeZSweepMapper * New ( ) ; /@{ *
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
##  If IntermixIntersectingGeometry is turned on, the zbuffer will be
##  captured and used to limit the traversal of the rays.
##  virtual void SetImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceAutoAdjustSampleDistancesIntermixIntersectingGeometry ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << IntermixIntersectingGeometry  to  << _arg ) ; if ( this -> IntermixIntersectingGeometry != ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ) { this -> IntermixIntersectingGeometry = ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ; this -> Modified ( ) ; } } virtual vtkTypeBool GetImageSampleDistanceMinValueMinimumImageSampleDistanceMinValueMaximumImageSampleDistanceMinValueAutoAdjustSampleDistancesMinValueIntermixIntersectingGeometryMinValue ( ) { return 0 ; } virtual vtkTypeBool GetImageSampleDistanceMaxValueMinimumImageSampleDistanceMaxValueMaximumImageSampleDistanceMaxValueAutoAdjustSampleDistancesMaxValueIntermixIntersectingGeometryMaxValue ( ) { return 1 ; } ; virtual vtkTypeBool GetImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceAutoAdjustSampleDistancesIntermixIntersectingGeometry ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IntermixIntersectingGeometry  of  << this -> IntermixIntersectingGeometry ) ; return this -> IntermixIntersectingGeometry ; } ; virtual void IntermixIntersectingGeometryOn ( ) { this -> SetAutoAdjustSampleDistancesIntermixIntersectingGeometry ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void IntermixIntersectingGeometryOff ( ) { this -> SetAutoAdjustSampleDistancesIntermixIntersectingGeometry ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} *
##  Maximum size allowed for a pixel list. Default is 32.
##  During the rendering, if a list of pixel is full, incremental compositing
##  is performed. Even if it is a user setting, it is an advanced parameter.
##  You have to understand how the algorithm works to change this value.
##  int GetMaxPixelListSize ( ) ; *
##  Change the maximum size allowed for a pixel list. It is an advanced
##  parameter.
##  \pre positive_size: size>1
##  void SetMaxPixelListSize ( int size ) ; /@{ *
##  Set/Get the helper class for integrating rays.  If set to NULL, a
##  default integrator will be assigned.
##  virtual void SetRayIntegrator ( vtkUnstructuredGridVolumeRayIntegrator * ri ) ; virtual vtkUnstructuredGridVolumeRayIntegrator * GetnameRayIntegrator ( ) { vtkDebugWithObjectMacro ( this , <<  returning  RayIntegrator  address  << static_cast < vtkUnstructuredGridVolumeRayIntegrator * > ( this -> RayIntegrator ) ) ; return this -> RayIntegrator ; } ; /@} *
##  WARNING: INTERNAL METHOD - NOT INTENDED FOR GENERAL USE
##  DO NOT USE THIS METHOD OUTSIDE OF THE RENDERING PROCESS
##  Render the volume
##  void Render ( vtkRenderer * ren , vtkVolume * vol ) override ; virtual int * GetImageInUseSize ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ImageInUseSize  pointer  << this -> ImageInUseSize ) ; return this -> ImageInUseSize ; } VTK_WRAPEXCLUDE virtual void GetImageInUseSize ( int data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> ImageInUseSize [ i ] ; } } ; virtual int * GetImageInUseSizeImageOrigin ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ImageOrigin  pointer  << this -> ImageOrigin ) ; return this -> ImageOrigin ; } VTK_WRAPEXCLUDE virtual void GetImageInUseSizeImageOrigin ( int data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> ImageOrigin [ i ] ; } } ; virtual int * GetImageInUseSizeImageOriginImageViewportSize ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ImageViewportSize  pointer  << this -> ImageViewportSize ) ; return this -> ImageViewportSize ; } VTK_WRAPEXCLUDE virtual void GetImageInUseSizeImageOriginImageViewportSize ( int data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> ImageViewportSize [ i ] ; } } ; protected : vtkUnstructuredGridVolumeZSweepMapper ( ) ; ~ vtkUnstructuredGridVolumeZSweepMapper ( ) override ; *
##  For each vertex, find the list of incident faces.
##  void BuildUseSets ( ) ; *
##  Reorder vertices `v' in increasing order in `w'. Return if the orientation
##  has changed.
##  int ReorderTriangle ( vtkIdType v [ 3 ] , vtkIdType w [ 3 ] ) ; *
##  Project and sort the vertices by z-coordinates in view space in the
##  "event list" (an heap).
##  \pre empty_list: this->EventList->GetNumberOfItems()==0
##  void ProjectAndSortVertices ( vtkRenderer * ren , vtkVolume * vol ) ; *
##  Create an empty "pixel list" for each pixel of the screen.
##  void CreateAndCleanPixelList ( ) ; *
##  MainLoop of the Zsweep algorithm.
##  \post empty_list: this->EventList->GetNumberOfItems()==0
##  void MainLoop ( vtkRenderWindow * renWin ) ; *
##  Do delayed compositing from back to front, stopping at zTarget for each
##  pixel inside the bounding box.
##  void CompositeFunction ( double zTarget ) ; *
##  Convert and clamp a float color component into a unsigned char.
##  unsigned char ColorComponentRealToByte ( float color ) ; *
##  Perform scan conversion of a triangle face.
##  void RasterizeFace ( vtkIdType faceIds [ 3 ] , int externalSide ) ; *
##  Perform scan conversion of a triangle defined by its vertices.
##  \pre ve0_exists: ve0!=0
##  \pre ve1_exists: ve1!=0
##  \pre ve2_exists: ve2!=0
##  void RasterizeTriangle ( vtkUnstructuredGridVolumeZSweepMapperNamespace :: vtkVertexEntry * ve0 , vtkUnstructuredGridVolumeZSweepMapperNamespace :: vtkVertexEntry * ve1 , vtkUnstructuredGridVolumeZSweepMapperNamespace :: vtkVertexEntry * ve2 , bool externalFace ) ; *
##  Perform scan conversion of an horizontal span from left ro right at line
##  y.
##  \pre left_exists: left!=0
##  \pre right_exists: right!=0
##  void RasterizeSpan ( int y , vtkUnstructuredGridVolumeZSweepMapperNamespace :: vtkScreenEdge * left , vtkUnstructuredGridVolumeZSweepMapperNamespace :: vtkScreenEdge * right , bool exitFace ) ; *
##  Scan conversion of a straight line defined by endpoints v0 and v1.
##  \pre v0_exists: v0!=0
##  \pre v1_exists: v1!=0
##  \pre y_ordered v0->GetScreenY()<=v1->GetScreenY()
##  void RasterizeLine ( vtkUnstructuredGridVolumeZSweepMapperNamespace :: vtkVertexEntry * v0 , vtkUnstructuredGridVolumeZSweepMapperNamespace :: vtkVertexEntry * v1 , bool exitFace ) ; void StoreRenderTime ( vtkRenderer * ren , vtkVolume * vol , float t ) ; float RetrieveRenderTime ( vtkRenderer * ren , vtkVolume * vol ) ; *
##  Return the value of the z-buffer at screen coordinates (x,y).
##  double GetZBufferValue ( int x , int y ) ; double GetMinimumBoundsDepth ( vtkRenderer * ren , vtkVolume * vol ) ; *
##  Allocate an array of usesets of size `size' only if the current one is not
##  large enough. Otherwise clear each use set of each vertex.
##  void AllocateUseSet ( vtkIdType size ) ; *
##  Allocate a vertex array of size `size' only if the current one is not
##  large enough.
##  void AllocateVertices ( vtkIdType size ) ; *
##  For debugging purpose, save the pixel list frame as a dataset.
##  void SavePixelListFrame ( ) ; int MaxPixelListSize ; float ImageSampleDistance ; float MinimumImageSampleDistance ; float MaximumImageSampleDistance ; vtkTypeBool AutoAdjustSampleDistances ; vtkRayCastImageDisplayHelper * ImageDisplayHelper ;  This is how big the image would be if it covered the entire viewport int ImageViewportSize [ 2 ] ;  This is how big the allocated memory for image is. This may be bigger
##  or smaller than ImageFullSize - it will be bigger if necessary to
##  ensure a power of 2, it will be smaller if the volume only covers a
##  small region of the viewport int ImageMemorySize [ 2 ] ;  This is the size of subregion in ImageSize image that we are using for
##  the current image. Since ImageSize is a power of 2, there is likely
##  wasted space in it. This number will be used for things such as clearing
##  the image if necessary. int ImageInUseSize [ 2 ] ;  This is the location in ImageFullSize image where our ImageSize image
##  is located. int ImageOrigin [ 2 ] ;  This is the allocated image unsigned char * Image ;  This is the accumulating double RGBA image float * RealRGBAImage ; float * RenderTimeTable ; vtkVolume * * RenderVolumeTable ; vtkRenderer * * RenderRendererTable ; int RenderTableSize ; int RenderTableEntries ; vtkTypeBool IntermixIntersectingGeometry ; float * ZBuffer ; int ZBufferSize [ 2 ] ; int ZBufferOrigin [ 2 ] ; vtkDataArray * Scalars ; int CellScalars ;  if use CellScalars, we need to keep track of the
##  values on each side of the face and figure out
##  if the face is used by two cells (twosided) or one cell. double FaceScalars [ 2 ] ; int FaceSide ; vtkUnstructuredGridVolumeZSweepMapperNamespace :: vtkSpan * Span ; vtkUnstructuredGridVolumeZSweepMapperNamespace :: vtkPixelListFrame * PixelListFrame ;  Used by BuildUseSets(). vtkGenericCell * Cell ; vtkUnstructuredGridVolumeZSweepMapperNamespace :: vtkUseSet * UseSet ; vtkPriorityQueue * EventList ; vtkUnstructuredGridVolumeZSweepMapperNamespace :: vtkVertices * Vertices ; vtkTransform * PerspectiveTransform ; vtkMatrix4x4 * PerspectiveMatrix ;  Used by the main loop int MaxPixelListSizeReached ; int XBounds [ 2 ] ; int YBounds [ 2 ] ; vtkUnstructuredGridVolumeZSweepMapperNamespace :: vtkSimpleScreenEdge * SimpleEdge ; vtkUnstructuredGridVolumeZSweepMapperNamespace :: vtkDoubleScreenEdge * DoubleEdge ; vtkUnstructuredGridVolumeRayIntegrator * RayIntegrator ; vtkUnstructuredGridVolumeRayIntegrator * RealRayIntegrator ; vtkTimeStamp SavedTriangleListMTime ;  Used during compositing vtkDoubleArray * IntersectionLengths ; vtkDoubleArray * NearIntersections ; vtkDoubleArray * FarIntersections ;  Benchmark vtkIdType MaxRecordedPixelListSize ; vtkUnstructuredGridVolumeZSweepMapperNamespace :: vtkPixelListEntryMemory * MemoryManager ; private : vtkUnstructuredGridVolumeZSweepMapper ( const vtkUnstructuredGridVolumeZSweepMapper & ) = delete ; void operator = ( const vtkUnstructuredGridVolumeZSweepMapper & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
