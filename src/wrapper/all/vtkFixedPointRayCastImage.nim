## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFixedPointRayCastImage.h
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
##  @class   vtkFixedPointRayCastImage
##  @brief   helper class for a ray cast image
##
##  This is a helper class for storing the ray cast image including the
##  underlying data and the size of the image. This class is not intended
##  to be used directly - just as an internal class in the
##  vtkFixedPointVolumeRayCastMapper so that multiple mappers can share
##  the same image. This class also stored the ZBuffer (if necessary due
##  to intermixed geometry). Perhaps this class could be generalized
##  in the future to be used for other ray cast methods other than the
##  fixed point method.
##
##  @sa
##  vtkFixedPointVolumeRayCastMapper
##

## !!!Ignored construct:  # vtkFixedPointRayCastImage_h [NewLine] # vtkFixedPointRayCastImage_h [NewLine] # vtkObject.h [NewLine] # vtkRenderingVolumeModule.h  For export macro [NewLine] class VTKRENDERINGVOLUME_EXPORT vtkFixedPointRayCastImage : public vtkObject { public : static vtkFixedPointRayCastImage * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkFixedPointRayCastImage :: IsTypeOf ( type ) ; } static vtkFixedPointRayCastImage * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkFixedPointRayCastImage * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkFixedPointRayCastImage * NewInstance ( ) const { return vtkFixedPointRayCastImage :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFixedPointRayCastImage :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFixedPointRayCastImage :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Get the internal storage for the image. It is a pointer to
##  unsigned short with four components (RGBA) per pixel. This
##  memory is allocated when the AllocateImage method is called.
##  unsigned short * GetImage ( ) { return this -> Image ; } /@{ *
##  Set / Get the ImageViewportSize. This is the size of the
##  whole viewport in pixels.
##  virtual void SetImageViewportSize ( int _arg1 , int _arg2 ) { vtkDebugWithObjectMacro ( this , <<  setting  << ImageViewportSize  to ( << _arg1 << , << _arg2 << ) ) ; if ( ( this -> ImageViewportSize [ 0 ] != _arg1 ) || ( this -> ImageViewportSize [ 1 ] != _arg2 ) ) { this -> ImageViewportSize [ 0 ] = _arg1 ; this -> ImageViewportSize [ 1 ] = _arg2 ; this -> Modified ( ) ; } } void SetImageViewportSize ( const int _arg [ 2 ] ) { this -> SetImageViewportSize ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; virtual int * GetImageViewportSize ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ImageViewportSize  pointer  << this -> ImageViewportSize ) ; return this -> ImageViewportSize ; } VTK_WRAPEXCLUDE virtual void GetImageViewportSize ( int data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> ImageViewportSize [ i ] ; } } ; /@} /@{ *
##  Set / Get the ImageMemorySize. This is the size in pixels
##  of the Image ivar. This will be a power of two in order
##  to ensure that the texture can be rendered by graphics
##  hardware that requires power of two textures.
##  virtual void SetImageViewportSizeImageMemorySize ( int _arg1 , int _arg2 ) { vtkDebugWithObjectMacro ( this , <<  setting  << ImageMemorySize  to ( << _arg1 << , << _arg2 << ) ) ; if ( ( this -> ImageMemorySize [ 0 ] != _arg1 ) || ( this -> ImageMemorySize [ 1 ] != _arg2 ) ) { this -> ImageMemorySize [ 0 ] = _arg1 ; this -> ImageMemorySize [ 1 ] = _arg2 ; this -> Modified ( ) ; } } void SetImageViewportSizeImageMemorySize ( const int _arg [ 2 ] ) { this -> SetImageViewportSizeImageMemorySize ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; virtual int * GetImageViewportSizeImageMemorySize ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ImageMemorySize  pointer  << this -> ImageMemorySize ) ; return this -> ImageMemorySize ; } VTK_WRAPEXCLUDE virtual void GetImageViewportSizeImageMemorySize ( int data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> ImageMemorySize [ i ] ; } } ; /@} /@{ *
##  Set / Get the size of the image we are actually using. As
##  long as the memory size is big enough, but not too big,
##  we won't bother deleting and re-allocated, we'll just
##  continue to use the memory size we have. This size will
##  always be equal to or less than the ImageMemorySize.
##  virtual void SetImageViewportSizeImageMemorySizeImageInUseSize ( int _arg1 , int _arg2 ) { vtkDebugWithObjectMacro ( this , <<  setting  << ImageInUseSize  to ( << _arg1 << , << _arg2 << ) ) ; if ( ( this -> ImageInUseSize [ 0 ] != _arg1 ) || ( this -> ImageInUseSize [ 1 ] != _arg2 ) ) { this -> ImageInUseSize [ 0 ] = _arg1 ; this -> ImageInUseSize [ 1 ] = _arg2 ; this -> Modified ( ) ; } } void SetImageViewportSizeImageMemorySizeImageInUseSize ( const int _arg [ 2 ] ) { this -> SetImageViewportSizeImageMemorySizeImageInUseSize ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; virtual int * GetImageViewportSizeImageMemorySizeImageInUseSize ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ImageInUseSize  pointer  << this -> ImageInUseSize ) ; return this -> ImageInUseSize ; } VTK_WRAPEXCLUDE virtual void GetImageViewportSizeImageMemorySizeImageInUseSize ( int data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> ImageInUseSize [ i ] ; } } ; /@} /@{ *
##  Set / Get the origin of the image. This is the starting
##  pixel within the whole viewport that our Image starts on.
##  That is, we could be generating just a subregion of the
##  whole viewport due to the fact that our volume occupies
##  only a portion of the viewport. The Image pixels will
##  start from this location.
##  virtual void SetImageViewportSizeImageMemorySizeImageInUseSizeImageOrigin ( int _arg1 , int _arg2 ) { vtkDebugWithObjectMacro ( this , <<  setting  << ImageOrigin  to ( << _arg1 << , << _arg2 << ) ) ; if ( ( this -> ImageOrigin [ 0 ] != _arg1 ) || ( this -> ImageOrigin [ 1 ] != _arg2 ) ) { this -> ImageOrigin [ 0 ] = _arg1 ; this -> ImageOrigin [ 1 ] = _arg2 ; this -> Modified ( ) ; } } void SetImageViewportSizeImageMemorySizeImageInUseSizeImageOrigin ( const int _arg [ 2 ] ) { this -> SetImageViewportSizeImageMemorySizeImageInUseSizeImageOrigin ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; virtual int * GetImageViewportSizeImageMemorySizeImageInUseSizeImageOrigin ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ImageOrigin  pointer  << this -> ImageOrigin ) ; return this -> ImageOrigin ; } VTK_WRAPEXCLUDE virtual void GetImageViewportSizeImageMemorySizeImageInUseSizeImageOrigin ( int data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> ImageOrigin [ i ] ; } } ; /@} /@{ *
##  Set / Get the ImageSampleDistance that will be used for
##  rendering. This is a copy of the value stored in the
##  mapper. It is stored here for sharing between all mappers
##  that are participating in the creation of this image.
##  virtual void SetImageSampleDistance ( float _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ImageSampleDistance  to  << _arg ) ; if ( this -> ImageSampleDistance != _arg ) { this -> ImageSampleDistance = _arg ; this -> Modified ( ) ; } } ; virtual float GetImageSampleDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ImageSampleDistance  of  << this -> ImageSampleDistance ) ; return this -> ImageSampleDistance ; } ; /@} *
##  Call this method once the ImageMemorySize has been set
##  the allocate the image. If an image already exists,
##  it will be deleted first.
##  void AllocateImage ( ) ; *
##  Clear the image to (0,0,0,0) for each pixel.
##  void ClearImage ( ) ; /@{ *
##  Set / Get the size of the ZBuffer in pixels. The zbuffer will
##  be captured for the region of the screen covered by the
##  ImageInUseSize image. However, due to subsampling, the size
##  of the ImageInUseSize image may be smaller than this ZBuffer
##  image which will be captured at screen resolution.
##  virtual void SetImageViewportSizeImageMemorySizeImageInUseSizeImageOriginZBufferSize ( int _arg1 , int _arg2 ) { vtkDebugWithObjectMacro ( this , <<  setting  << ZBufferSize  to ( << _arg1 << , << _arg2 << ) ) ; if ( ( this -> ZBufferSize [ 0 ] != _arg1 ) || ( this -> ZBufferSize [ 1 ] != _arg2 ) ) { this -> ZBufferSize [ 0 ] = _arg1 ; this -> ZBufferSize [ 1 ] = _arg2 ; this -> Modified ( ) ; } } void SetImageViewportSizeImageMemorySizeImageInUseSizeImageOriginZBufferSize ( const int _arg [ 2 ] ) { this -> SetImageViewportSizeImageMemorySizeImageInUseSizeImageOriginZBufferSize ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; virtual int * GetImageViewportSizeImageMemorySizeImageInUseSizeImageOriginZBufferSize ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ZBufferSize  pointer  << this -> ZBufferSize ) ; return this -> ZBufferSize ; } VTK_WRAPEXCLUDE virtual void GetImageViewportSizeImageMemorySizeImageInUseSizeImageOriginZBufferSize ( int data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> ZBufferSize [ i ] ; } } ; /@} /@{ *
##  Set / Get the origin of the ZBuffer. This is the distance
##  from the lower left corner of the viewport where the ZBuffer
##  started (multiply the ImageOrigin by the ImageSampleDistance)
##  This is the pixel location on the full resolution viewport
##  where the ZBuffer capture will start. These values are used
##  to convert the (x,y) pixel location within the ImageInUseSize
##  image into a ZBuffer location.
##  virtual void SetImageViewportSizeImageMemorySizeImageInUseSizeImageOriginZBufferSizeZBufferOrigin ( int _arg1 , int _arg2 ) { vtkDebugWithObjectMacro ( this , <<  setting  << ZBufferOrigin  to ( << _arg1 << , << _arg2 << ) ) ; if ( ( this -> ZBufferOrigin [ 0 ] != _arg1 ) || ( this -> ZBufferOrigin [ 1 ] != _arg2 ) ) { this -> ZBufferOrigin [ 0 ] = _arg1 ; this -> ZBufferOrigin [ 1 ] = _arg2 ; this -> Modified ( ) ; } } void SetImageViewportSizeImageMemorySizeImageInUseSizeImageOriginZBufferSizeZBufferOrigin ( const int _arg [ 2 ] ) { this -> SetImageViewportSizeImageMemorySizeImageInUseSizeImageOriginZBufferSizeZBufferOrigin ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; virtual int * GetImageViewportSizeImageMemorySizeImageInUseSizeImageOriginZBufferSizeZBufferOrigin ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ZBufferOrigin  pointer  << this -> ZBufferOrigin ) ; return this -> ZBufferOrigin ; } VTK_WRAPEXCLUDE virtual void GetImageViewportSizeImageMemorySizeImageInUseSizeImageOriginZBufferSizeZBufferOrigin ( int data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> ZBufferOrigin [ i ] ; } } ; /@} /@{ *
##  The UseZBuffer flag indicates whether the ZBuffer is in use.
##  The ZBuffer is captured and used when IntermixIntersectingGeometry
##  is on in the mapper, and when there are props that have been
##  rendered before the current volume.
##  virtual void SetUseZBuffer ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << UseZBuffer  to  << _arg ) ; if ( this -> UseZBuffer != ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ) { this -> UseZBuffer = ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ; this -> Modified ( ) ; } } virtual vtkTypeBool GetUseZBufferMinValue ( ) { return 0 ; } virtual vtkTypeBool GetUseZBufferMaxValue ( ) { return 1 ; } ; virtual vtkTypeBool GetImageSampleDistanceUseZBuffer ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseZBuffer  of  << this -> UseZBuffer ) ; return this -> UseZBuffer ; } ; virtual void UseZBufferOn ( ) { this -> SetUseZBuffer ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void UseZBufferOff ( ) { this -> SetUseZBuffer ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} *
##  Get the ZBuffer value corresponding to location (x,y) where (x,y)
##  are indexing into the ImageInUse image. This must be converted to
##  the zbuffer image coordinates. Nearest neighbor value is returned.
##  If UseZBuffer is off, then 1.0 is always returned.
##  float GetZBufferValue ( int x , int y ) ; *
##  Get the ZBuffer. The size of the ZBuffer should be specific
##  with SetZBufferSize, and AllocateZBuffer method should be called
##  before getting the ZBuffer.
##  float * GetZBuffer ( ) { return this -> ZBuffer ; }  Descipriotn:
##  Allocate the space for the ZBuffer according to the size. void AllocateZBuffer ( ) ; protected : vtkFixedPointRayCastImage ( ) ; ~ vtkFixedPointRayCastImage ( ) override ;  This is how big the image would be if it covered the entire viewport int ImageViewportSize [ 2 ] ;  This is how big the allocated memory for image is. This may be bigger
##  or smaller than ImageFullSize - it will be bigger if necessary to
##  ensure a power of 2, it will be smaller if the volume only covers a
##  small region of the viewport int ImageMemorySize [ 2 ] ;  This is the size of subregion in ImageSize image that we are using for
##  the current image. Since ImageSize is a power of 2, there is likely
##  wasted space in it. This number will be used for things such as clearing
##  the image if necessary. int ImageInUseSize [ 2 ] ;  This is the location in ImageFullSize image where our ImageSize image
##  is located. int ImageOrigin [ 2 ] ;  This is a copy of the ImageSampleDistance from the mapper - copied here
##  in order to share among all mappers contributing to this image float ImageSampleDistance ;  This is the allocated image unsigned short * Image ;  This is the size of the zbuffer in pixels int ZBufferSize [ 2 ] ;  This is the size of the memory for the zbuffer - this can be
##  bigger than the size of the zbuffer since we will allocate enough
##  space for the whole viewport to avoid re-allocating over and over int ZBufferMemorySize ;  This is the distance from the lower left corner of the viewport
##  where the ZBuffer starts int ZBufferOrigin [ 2 ] ;  This is the flag that indicate whether the ZBuffer is in use vtkTypeBool UseZBuffer ;  This is the actual ZBuffer data in floats float * ZBuffer ; private : vtkFixedPointRayCastImage ( const vtkFixedPointRayCastImage & ) = delete ; void operator = ( const vtkFixedPointRayCastImage & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
