## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkParallelRenderManager.h
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##   Copyright 2003 Sandia Corporation. Under the terms of Contract
##   DE-AC04-94AL85000, there is a non-exclusive license for use of this work by
##   or on behalf of the U.S. Government. Redistribution and use in source and
##   binary forms, with or without modification, are permitted provided that this
##   Notice and any statement of authorship are reproduced on all copies.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkParallelRenderManager
##  @brief   An object to control parallel rendering.
##
##
##  vtkParallelRenderManager operates in multiple processes.  It provides
##  proper renderers and render windows for performing the parallel
##  rendering correctly.  It can also attach itself to render windows and
##  propagate rendering events and camera views.
##
##  @attention
##  Many parallel rendering schemes do not correctly handle transparency.
##  Unless otherwise documented, assume a sub class does not.
##
##  @todo
##  Synchronization/barrier primitives.
##
##  @todo
##  Query ranges of scalar values of objects in addition to the boundary in
##  three-space
##
##

## !!!Ignored construct:  # vtkParallelRenderManager_h [NewLine] # vtkParallelRenderManager_h [NewLine] # vtkObject.h [NewLine] # vtkRenderingParallelModule.h  For export macro [NewLine] class vtkDoubleArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkMultiProcessController"
discard "forward decl of vtkMultiProcessStream"
discard "forward decl of vtkRenderer"
discard "forward decl of vtkRendererCollection"
discard "forward decl of vtkRenderWindow"
discard "forward decl of vtkTimerLog"
discard "forward decl of vtkUnsignedCharArray"
## !!!Ignored construct:  class VTKRENDERINGPARALLEL_EXPORT vtkParallelRenderManager : public vtkObject { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkParallelRenderManager :: IsTypeOf ( type ) ; } static vtkParallelRenderManager * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkParallelRenderManager * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkParallelRenderManager * NewInstance ( ) const { return vtkParallelRenderManager :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkParallelRenderManager :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkParallelRenderManager :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Builds a vtkRenderWindow compatible with this render manager.  The
##  user program is responsible for registering the render window with the
##  SetRenderWindow method and calling Delete.  It is not advisable to use
##  a parallel render manager with a render window that was not built with
##  this method.
##  virtual vtkRenderWindow * MakeRenderWindow ( ) ; *
##  Builds a vtkRenderer compatible with this render manager.  (Should we
##  also register it?)  The user program is responsible for calling
##  Delete.  It is not advisable to use a parallel render manager with a
##  renderer that was not built with this method.
##  virtual vtkRenderer * MakeRenderer ( ) ; /@{ *
##  Set/Get the RenderWindow to use for compositing.
##  We add a start and end observer to the window.
##  virtual vtkRenderWindow * GetnameRenderWindow ( ) { vtkDebugWithObjectMacro ( this , <<  returning  RenderWindow  address  << static_cast < vtkRenderWindow * > ( this -> RenderWindow ) ) ; return this -> RenderWindow ; } ; virtual void SetRenderWindow ( vtkRenderWindow * renWin ) ; /@} /@{ *
##  Set/Get the vtkMultiProcessController which will handle communications
##  for the parallel rendering.
##  virtual vtkMultiProcessController * GetnameRenderWindowController ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Controller  address  << static_cast < vtkMultiProcessController * > ( this -> Controller ) ) ; return this -> Controller ; } ; virtual void SetController ( vtkMultiProcessController * controller ) ; /@} *
##  This method sets the piece and number of pieces for each
##  actor with a polydata mapper.
##  virtual void InitializePieces ( ) ; *
##  Make all rendering windows not viewable set as off screen rendering.
##  To make all renderwindows on screen rendering again, call
##  OffScreenRenderingOff on all the render windows.  This class assumes
##  the window on root node is the only one viewable.  Subclasses should
##  change this as necessary.
##  virtual void InitializeOffScreen ( ) ; *
##  Initializes the RMIs and then, if on root node, starts the interactor
##  on the attached render window.  Otherwise, starts processing RMIs.
##  When the interactor returns, it breaks the RMI listening on all other
##  processors.
##  virtual void StartInteractor ( ) ; *
##  If on node other than root, starts serving RMI requests for parallel
##  renders.
##  virtual void StartServices ( ) ; *
##  If on root node, stops the RMI processing on all service nodes.
##  virtual void StopServices ( ) ; /@{ *
##  Callbacks that initialize and finish rendering and other tasks.
##  virtual void StartRender ( ) ; virtual void EndRender ( ) ; virtual void SatelliteStartRender ( ) ; virtual void SatelliteEndRender ( ) ; virtual void RenderRMI ( ) ; virtual void ResetCamera ( vtkRenderer * ren ) ; virtual void ResetCameraClippingRange ( vtkRenderer * ren ) ; virtual void ComputeVisiblePropBoundsRMI ( int renderId ) ; /@} virtual void InitializeRMIs ( ) ; *
##  Resets the camera of each renderer contained in the RenderWindow.
##  Should only be called in the "root" process, and all remote processes
##  must be processing RMIs for this method to complete.
##  virtual void ResetAllCameras ( ) ; *
##  Calculates the bounds by gathering information from all processes.
##  virtual void ComputeVisiblePropBounds ( vtkRenderer * ren , double bounds [ 6 ] ) ; /@{ *
##  Turns on/off parallel rendering.  When on (the default) the object
##  responds to render events of the attached window, propagates the
##  render event to other processors, and otherwise enables the parallel
##  rendering process.
##  virtual void SetParallelRendering ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ParallelRendering  to  << _arg ) ; if ( this -> ParallelRendering != _arg ) { this -> ParallelRendering = _arg ; this -> Modified ( ) ; } } ; virtual int GetParallelRendering ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ParallelRendering  of  << this -> ParallelRendering ) ; return this -> ParallelRendering ; } ; virtual void ParallelRenderingOn ( ) { this -> SetParallelRendering ( static_cast < int > ( 1 ) ) ; } virtual void ParallelRenderingOff ( ) { this -> SetParallelRendering ( static_cast < int > ( 0 ) ) ; } ; /@} /@{ *
##  Turns on/off render event propagation.  When on (the default) and
##  ParallelRendering is on, process 0 will send an RMI call to all remote
##  processes to perform a synchronized render.  When off, render must be
##  manually called on each process.
##  virtual void SetParallelRenderingRenderEventPropagation ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  RenderEventPropagation  to  << _arg ) ; if ( this -> RenderEventPropagation != _arg ) { this -> RenderEventPropagation = _arg ; this -> Modified ( ) ; } } ; virtual int GetParallelRenderingRenderEventPropagation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RenderEventPropagation  of  << this -> RenderEventPropagation ) ; return this -> RenderEventPropagation ; } ; virtual void RenderEventPropagationOn ( ) { this -> SetParallelRenderingRenderEventPropagation ( static_cast < int > ( 1 ) ) ; } virtual void RenderEventPropagationOff ( ) { this -> SetParallelRenderingRenderEventPropagation ( static_cast < int > ( 0 ) ) ; } ; /@} *
##  Get/Set the default value used for RenderEventPropagation when a new
##  instance of vtkParallelRenderManager is created.
##  Set to true by default.
##  static void SetDefaultRenderEventPropagation ( bool val ) { vtkParallelRenderManager :: DefaultRenderEventPropagation = val ; } static bool GetDefaultRenderEventPropagation ( ) { return vtkParallelRenderManager :: DefaultRenderEventPropagation ; } /@{ *
##  This is used for tiled display rendering.  When data has been
##  duplicated on all processes, then we do not need to compositing.
##  Cameras and renders are still propagated though.
##  virtual void SetParallelRenderingRenderEventPropagationUseCompositing ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseCompositing  to  << _arg ) ; if ( this -> UseCompositing != _arg ) { this -> UseCompositing = _arg ; this -> Modified ( ) ; } } ; virtual int GetParallelRenderingRenderEventPropagationUseCompositing ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseCompositing  of  << this -> UseCompositing ) ; return this -> UseCompositing ; } ; virtual void UseCompositingOn ( ) { this -> SetParallelRenderingRenderEventPropagationUseCompositing ( static_cast < int > ( 1 ) ) ; } virtual void UseCompositingOff ( ) { this -> SetParallelRenderingRenderEventPropagationUseCompositing ( static_cast < int > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the reduction factor (for sort-last based parallel renderers).
##  The size of rendered image is divided by the reduction factor and then
##  is blown up to the size of the current vtkRenderWindow.  Setting
##  higher reduction factors enables shorter image transfer times (which
##  is often the bottleneck) but will greatly reduce image quality.  A
##  reduction factor of 2 or greater should only be used for intermediate
##  images in interactive applications.  A reduction factor of 1 (or less)
##  will result in no change in image quality.  A parallel render manager
##  may ignore the image reduction factor if it will result in little or
##  no performance enhancements (eg. it does not do image space
##  manipulations).
##  virtual void SetImageReductionFactor ( double factor ) ; virtual double GetParallelRenderingRenderEventPropagationUseCompositingImageReductionFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ImageReductionFactor  of  << this -> ImageReductionFactor ) ; return this -> ImageReductionFactor ; } ; /@} virtual void SetParallelRenderingRenderEventPropagationUseCompositingMaxImageReductionFactor ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MaxImageReductionFactor  to  << _arg ) ; if ( this -> MaxImageReductionFactor != _arg ) { this -> MaxImageReductionFactor = _arg ; this -> Modified ( ) ; } } ; virtual double GetParallelRenderingRenderEventPropagationUseCompositingImageReductionFactorMaxImageReductionFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaxImageReductionFactor  of  << this -> MaxImageReductionFactor ) ; return this -> MaxImageReductionFactor ; } ; *
##  Sets the ReductionFactor based on the given desired update rate and
##  the rendering metrics taken from the last time UpdateServerInfo was
##  called.  Note that if AutoReductionFactor is on, this function is called
##  with the desired update rate of the render window automatically.
##  virtual void SetImageReductionFactorForUpdateRate ( double DesiredUpdateRate ) ; /@{ *
##  If on, the ReductionFactor is automatically adjusted to best meet the
##  the DesiredUpdateRate in the current RenderWindow based on metrics
##  from the last render.
##  virtual void SetParallelRenderingRenderEventPropagationUseCompositingMaxImageReductionFactorAutoImageReductionFactor ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  AutoImageReductionFactor  to  << _arg ) ; if ( this -> AutoImageReductionFactor != _arg ) { this -> AutoImageReductionFactor = _arg ; this -> Modified ( ) ; } } ; virtual int GetParallelRenderingRenderEventPropagationUseCompositingImageReductionFactorMaxImageReductionFactorAutoImageReductionFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AutoImageReductionFactor  of  << this -> AutoImageReductionFactor ) ; return this -> AutoImageReductionFactor ; } ; virtual void AutoImageReductionFactorOn ( ) { this -> SetParallelRenderingRenderEventPropagationUseCompositingAutoImageReductionFactor ( static_cast < int > ( 1 ) ) ; } virtual void AutoImageReductionFactorOff ( ) { this -> SetParallelRenderingRenderEventPropagationUseCompositingAutoImageReductionFactor ( static_cast < int > ( 0 ) ) ; } ; /@} /@{ *
##  Get rendering metrics.
##  virtual double GetParallelRenderingRenderEventPropagationUseCompositingImageReductionFactorMaxImageReductionFactorAutoImageReductionFactorRenderTime ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RenderTime  of  << this -> RenderTime ) ; return this -> RenderTime ; } ; virtual double GetParallelRenderingRenderEventPropagationUseCompositingImageReductionFactorMaxImageReductionFactorAutoImageReductionFactorRenderTimeImageProcessingTime ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ImageProcessingTime  of  << this -> ImageProcessingTime ) ; return this -> ImageProcessingTime ; } ; /@} /@{ *
##  By default, the state of all renderers in the root's render window is
##  propagated to the rest of the processes.  In order for this to work, all
##  render windows must have the same renderers in the same order.  If this is
##  not the case, you can turn off the SyncRenderWindowRenderers.  When this
##  flag is off, the list of renderers held by this parallel render manager
##  (initially empty) is synced.  You can modify the list of renderers with the
##  AddRenderer, RemoveRenderer, and RemoveAllRenderers methods.
##  virtual int GetParallelRenderingRenderEventPropagationUseCompositingImageReductionFactorMaxImageReductionFactorAutoImageReductionFactorRenderTimeImageProcessingTimeSyncRenderWindowRenderers ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SyncRenderWindowRenderers  of  << this -> SyncRenderWindowRenderers ) ; return this -> SyncRenderWindowRenderers ; } ; virtual void SetParallelRenderingRenderEventPropagationUseCompositingMaxImageReductionFactorAutoImageReductionFactorSyncRenderWindowRenderers ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SyncRenderWindowRenderers  to  << _arg ) ; if ( this -> SyncRenderWindowRenderers != _arg ) { this -> SyncRenderWindowRenderers = _arg ; this -> Modified ( ) ; } } ; virtual void SyncRenderWindowRenderersOn ( ) { this -> SetParallelRenderingRenderEventPropagationUseCompositingAutoImageReductionFactorSyncRenderWindowRenderers ( static_cast < int > ( 1 ) ) ; } virtual void SyncRenderWindowRenderersOff ( ) { this -> SetParallelRenderingRenderEventPropagationUseCompositingAutoImageReductionFactorSyncRenderWindowRenderers ( static_cast < int > ( 0 ) ) ; } ; virtual void AddRenderer ( vtkRenderer * ) ; virtual void RemoveRenderer ( vtkRenderer * ) ; virtual void RemoveAllRenderers ( ) ; /@} /@{ *
##  If on (the default), the result of any image space manipulations are
##  written back to the render window frame buffer.  If off, the image
##  stored in the frame buffer may not be correct.  Either way, the
##  correct frame buffer images may be read with
##  vtkParallelRenderManager::GetPixelData.  Turning WriteBackImages off
##  may result in a speedup if the render window is not visible to the user
##  and images are read back for further processing or transit.
##  virtual void SetParallelRenderingRenderEventPropagationUseCompositingMaxImageReductionFactorAutoImageReductionFactorSyncRenderWindowRenderersWriteBackImages ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  WriteBackImages  to  << _arg ) ; if ( this -> WriteBackImages != _arg ) { this -> WriteBackImages = _arg ; this -> Modified ( ) ; } } ; virtual int GetParallelRenderingRenderEventPropagationUseCompositingImageReductionFactorMaxImageReductionFactorAutoImageReductionFactorRenderTimeImageProcessingTimeSyncRenderWindowRenderersWriteBackImages ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WriteBackImages  of  << this -> WriteBackImages ) ; return this -> WriteBackImages ; } ; virtual void WriteBackImagesOn ( ) { this -> SetParallelRenderingRenderEventPropagationUseCompositingAutoImageReductionFactorSyncRenderWindowRenderersWriteBackImages ( static_cast < int > ( 1 ) ) ; } virtual void WriteBackImagesOff ( ) { this -> SetParallelRenderingRenderEventPropagationUseCompositingAutoImageReductionFactorSyncRenderWindowRenderersWriteBackImages ( static_cast < int > ( 0 ) ) ; } ; /@} /@{ *
##  If on (the default), when the ImageReductionFactor is greater than 1
##  and WriteBackImages is on, the image will be magnified to fill the
##  entire render window.
##  virtual void SetParallelRenderingRenderEventPropagationUseCompositingMaxImageReductionFactorAutoImageReductionFactorSyncRenderWindowRenderersWriteBackImagesMagnifyImages ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MagnifyImages  to  << _arg ) ; if ( this -> MagnifyImages != _arg ) { this -> MagnifyImages = _arg ; this -> Modified ( ) ; } } ; virtual int GetParallelRenderingRenderEventPropagationUseCompositingImageReductionFactorMaxImageReductionFactorAutoImageReductionFactorRenderTimeImageProcessingTimeSyncRenderWindowRenderersWriteBackImagesMagnifyImages ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MagnifyImages  of  << this -> MagnifyImages ) ; return this -> MagnifyImages ; } ; virtual void MagnifyImagesOn ( ) { this -> SetParallelRenderingRenderEventPropagationUseCompositingAutoImageReductionFactorSyncRenderWindowRenderersWriteBackImagesMagnifyImages ( static_cast < int > ( 1 ) ) ; } virtual void MagnifyImagesOff ( ) { this -> SetParallelRenderingRenderEventPropagationUseCompositingAutoImageReductionFactorSyncRenderWindowRenderersWriteBackImagesMagnifyImages ( static_cast < int > ( 0 ) ) ; } ; /@} enum { NEAREST , LINEAR } ; /@{ *
##  Sets the method used to magnify images.  Nearest simply replicates
##  each pixel enough times to fill the image.  Linear performs linear
##  interpolation between the pixels.
##  virtual void SetMagnifyImageMethod ( int method ) ; virtual int GetParallelRenderingRenderEventPropagationUseCompositingImageReductionFactorMaxImageReductionFactorAutoImageReductionFactorRenderTimeImageProcessingTimeSyncRenderWindowRenderersWriteBackImagesMagnifyImagesMagnifyImageMethod ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MagnifyImageMethod  of  << this -> MagnifyImageMethod ) ; return this -> MagnifyImageMethod ; } ; void SetMagnifyImageMethodToNearest ( ) { this -> SetMagnifyImageMethod ( NEAREST ) ; } void SetMagnifyImageMethodToLinear ( ) { this -> SetMagnifyImageMethod ( LINEAR ) ; } /@} /@{ *
##  Convenience functions for magnifying images.
##  virtual void MagnifyImage ( vtkUnsignedCharArray * fullImage , const int fullImageSize [ 2 ] , vtkUnsignedCharArray * reducedImage , const int reducedImageSize [ 2 ] , const int fullImageViewport [ 4 ] = nullptr , const int reducedImageViewport [ 4 ] = nullptr ) ; static void MagnifyImageNearest ( vtkUnsignedCharArray * fullImage , const int fullImageSize [ 2 ] , vtkUnsignedCharArray * reducedImage , const int reducedImageSize [ 2 ] , const int fullImageViewport [ 4 ] = nullptr , const int reducedImageViewport [ 4 ] = nullptr ) ; static void MagnifyImageLinear ( vtkUnsignedCharArray * fullImage , const int fullImageSize [ 2 ] , vtkUnsignedCharArray * reducedImage , const int reducedImageSize [ 2 ] , const int fullImageViewport [ 4 ] = nullptr , const int reducedImageViewport [ 4 ] = nullptr ) ; /@} /@{ *
##  The most appropriate way to retrieve full size image data after a
##  render.  Will work regardless of whether WriteBackImages or
##  MagnifyImage is on or off.  The data returned may be a shallow copy of
##  an internal array.  Therefore, the data may be invalid after the next
##  render or if the ParallelRenderManager is destroyed.
##  virtual void GetPixelData ( vtkUnsignedCharArray * data ) ; virtual void GetPixelData ( int x1 , int y1 , int x2 , int y2 , vtkUnsignedCharArray * data ) ; /@} /@{ *
##  The most appropriate way to retrieve reduced size image data after a
##  render.  Will work regardless of whether WriteBackImages or
##  MagnifyImage is on or off.  The data returned may be a shallow copy of
##  an internal array.  Therefore, the data may be invalid after the next
##  render or if the ParallelRenderManager is destroyed.
##  virtual void GetReducedPixelData ( vtkUnsignedCharArray * data ) ; virtual void GetReducedPixelData ( int x1 , int y1 , int x2 , int y2 , vtkUnsignedCharArray * data ) ; /@} /@{ *
##  Returns the full image size calculated at the last render.
##  virtual int * GetFullImageSize ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << FullImageSize  pointer  << this -> FullImageSize ) ; return this -> FullImageSize ; } VTK_WRAPEXCLUDE virtual void GetFullImageSize ( int & _arg1 , int & _arg2 ) { _arg1 = this -> FullImageSize [ 0 ] ; _arg2 = this -> FullImageSize [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << FullImageSize  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetFullImageSize ( int _arg [ 2 ] ) { this -> GetFullImageSize ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; /@}
## /@{ *
##  Returns the reduced image size calculated at the last render.
##  virtual int * GetFullImageSizeReducedImageSize ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ReducedImageSize  pointer  << this -> ReducedImageSize ) ; return this -> ReducedImageSize ; } VTK_WRAPEXCLUDE virtual void GetFullImageSizeReducedImageSize ( int & _arg1 , int & _arg2 ) { _arg1 = this -> ReducedImageSize [ 0 ] ; _arg2 = this -> ReducedImageSize [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << ReducedImageSize  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetFullImageSizeReducedImageSize ( int _arg [ 2 ] ) { this -> GetFullImageSizeReducedImageSize ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; /@} *
##  Given the x and y size of the render windows, reposition them
##  in a tile of n columns.
##  void TileWindows ( int xsize , int ysize , int nColumns ) ; /@{ *
##  Get/Set if all Images must use RGBA instead of RGB. By default,
##  this flag is on.
##  virtual void SetParallelRenderingRenderEventPropagationUseCompositingMaxImageReductionFactorAutoImageReductionFactorSyncRenderWindowRenderersWriteBackImagesMagnifyImagesUseRGBA ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseRGBA  to  << _arg ) ; if ( this -> UseRGBA != _arg ) { this -> UseRGBA = _arg ; this -> Modified ( ) ; } } ; virtual int GetParallelRenderingRenderEventPropagationUseCompositingImageReductionFactorMaxImageReductionFactorAutoImageReductionFactorRenderTimeImageProcessingTimeSyncRenderWindowRenderersWriteBackImagesMagnifyImagesMagnifyImageMethodUseRGBA ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseRGBA  of  << this -> UseRGBA ) ; return this -> UseRGBA ; } ; /@} /@{ *
##  If ForceRenderWindowSize is set to true, the render manager will use
##  the RenderWindowSize ivar instead of getting the size from the render window.
##  virtual void SetParallelRenderingRenderEventPropagationUseCompositingMaxImageReductionFactorAutoImageReductionFactorSyncRenderWindowRenderersWriteBackImagesMagnifyImagesUseRGBAForceRenderWindowSize ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ForceRenderWindowSize  to  << _arg ) ; if ( this -> ForceRenderWindowSize != _arg ) { this -> ForceRenderWindowSize = _arg ; this -> Modified ( ) ; } } ; virtual int GetParallelRenderingRenderEventPropagationUseCompositingImageReductionFactorMaxImageReductionFactorAutoImageReductionFactorRenderTimeImageProcessingTimeSyncRenderWindowRenderersWriteBackImagesMagnifyImagesMagnifyImageMethodUseRGBAForceRenderWindowSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ForceRenderWindowSize  of  << this -> ForceRenderWindowSize ) ; return this -> ForceRenderWindowSize ; } ; /@} /@{ *
##  If ForceRenderWindowSize is set to true, the render manager will use
##  the Size ivar instead of getting the size from the render window.
##  virtual void SetForcedRenderWindowSize ( int _arg1 , int _arg2 ) { vtkDebugWithObjectMacro ( this , <<  setting  << ForcedRenderWindowSize  to ( << _arg1 << , << _arg2 << ) ) ; if ( ( this -> ForcedRenderWindowSize [ 0 ] != _arg1 ) || ( this -> ForcedRenderWindowSize [ 1 ] != _arg2 ) ) { this -> ForcedRenderWindowSize [ 0 ] = _arg1 ; this -> ForcedRenderWindowSize [ 1 ] = _arg2 ; this -> Modified ( ) ; } } void SetForcedRenderWindowSize ( const int _arg [ 2 ] ) { this -> SetForcedRenderWindowSize ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; virtual int * GetFullImageSizeReducedImageSizeForcedRenderWindowSize ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ForcedRenderWindowSize  pointer  << this -> ForcedRenderWindowSize ) ; return this -> ForcedRenderWindowSize ; } VTK_WRAPEXCLUDE virtual void GetFullImageSizeReducedImageSizeForcedRenderWindowSize ( int & _arg1 , int & _arg2 ) { _arg1 = this -> ForcedRenderWindowSize [ 0 ] ; _arg2 = this -> ForcedRenderWindowSize [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << ForcedRenderWindowSize  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetFullImageSizeReducedImageSizeForcedRenderWindowSize ( int _arg [ 2 ] ) { this -> GetFullImageSizeReducedImageSizeForcedRenderWindowSize ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; /@} enum Tags { RENDER_RMI_TAG = 34532 , COMPUTE_VISIBLE_PROP_BOUNDS_RMI_TAG = 54636 , WIN_INFO_TAG = 87834 , REN_INFO_TAG = 87836 , LIGHT_INFO_TAG = 87838 , REN_ID_TAG = 58794 , BOUNDS_TAG = 23543 } ; virtual void CheckForAbortRender ( ) { } virtual int CheckForAbortComposite ( ) { return 0 ; } /@{ *
##  The default is to allow the use of the back buffer for compositing.
##  If set to false, this will prevent to manager from swapping buffers.
##  This allows something else (for instance VisibleCellSelection) to
##  control front/back buffer swapping.
##  virtual void SetParallelRenderingRenderEventPropagationUseCompositingMaxImageReductionFactorAutoImageReductionFactorSyncRenderWindowRenderersWriteBackImagesMagnifyImagesUseRGBAForceRenderWindowSizeUseBackBuffer ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseBackBuffer  to  << _arg ) ; if ( this -> UseBackBuffer != _arg ) { this -> UseBackBuffer = _arg ; this -> Modified ( ) ; } } ; virtual int GetParallelRenderingRenderEventPropagationUseCompositingImageReductionFactorMaxImageReductionFactorAutoImageReductionFactorRenderTimeImageProcessingTimeSyncRenderWindowRenderersWriteBackImagesMagnifyImagesMagnifyImageMethodUseRGBAForceRenderWindowSizeUseBackBuffer ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseBackBuffer  of  << this -> UseBackBuffer ) ; return this -> UseBackBuffer ; } ; virtual void UseBackBufferOn ( ) { this -> SetParallelRenderingRenderEventPropagationUseCompositingAutoImageReductionFactorSyncRenderWindowRenderersWriteBackImagesMagnifyImagesUseBackBuffer ( static_cast < int > ( 1 ) ) ; } virtual void UseBackBufferOff ( ) { this -> SetParallelRenderingRenderEventPropagationUseCompositingAutoImageReductionFactorSyncRenderWindowRenderersWriteBackImagesMagnifyImagesUseBackBuffer ( static_cast < int > ( 0 ) ) ; } ; /@} /@{ *
##  When set the render manager will synchronize the TileViewport and TileScale
##  properties. This may not be desirable in cases where there's some other
##  mechanism to set the tile dimensions eg. Tile displays.
##  virtual void SetParallelRenderingRenderEventPropagationUseCompositingMaxImageReductionFactorAutoImageReductionFactorSyncRenderWindowRenderersWriteBackImagesMagnifyImagesUseRGBAForceRenderWindowSizeUseBackBufferSynchronizeTileProperties ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SynchronizeTileProperties  to  << _arg ) ; if ( this -> SynchronizeTileProperties != _arg ) { this -> SynchronizeTileProperties = _arg ; this -> Modified ( ) ; } } ; virtual int GetParallelRenderingRenderEventPropagationUseCompositingImageReductionFactorMaxImageReductionFactorAutoImageReductionFactorRenderTimeImageProcessingTimeSyncRenderWindowRenderersWriteBackImagesMagnifyImagesMagnifyImageMethodUseRGBAForceRenderWindowSizeUseBackBufferSynchronizeTileProperties ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SynchronizeTileProperties  of  << this -> SynchronizeTileProperties ) ; return this -> SynchronizeTileProperties ; } ; virtual void SynchronizeTilePropertiesOn ( ) { this -> SetParallelRenderingRenderEventPropagationUseCompositingAutoImageReductionFactorSyncRenderWindowRenderersWriteBackImagesMagnifyImagesUseBackBufferSynchronizeTileProperties ( static_cast < int > ( 1 ) ) ; } virtual void SynchronizeTilePropertiesOff ( ) { this -> SetParallelRenderingRenderEventPropagationUseCompositingAutoImageReductionFactorSyncRenderWindowRenderersWriteBackImagesMagnifyImagesUseBackBufferSynchronizeTileProperties ( static_cast < int > ( 0 ) ) ; } ; /@} /@{ *
##  INTERNAL METHODS (DON NOT USE).
##  There are internal methods made public so that they can be called from
##  callback functions.
##  virtual void GenericStartRenderCallback ( ) ; virtual void GenericEndRenderCallback ( ) ; /@} protected : vtkParallelRenderManager ( ) ; ~ vtkParallelRenderManager ( ) override ; /@{ *
##  Add/Remove event handlers for the render window.
##  void AddRenderWindowEventHandlers ( ) ; void RemoveRenderWindowEventHandlers ( ) ; /@} vtkRenderWindow * RenderWindow ; vtkMultiProcessController * Controller ; vtkRendererCollection * Renderers ; virtual vtkRendererCollection * GetRenderers ( ) ; int ForceRenderWindowSize ; int ForcedRenderWindowSize [ 2 ] ; *
##  The "root" node's process id.  This is the node which is listening for
##  and propagating new render events from the RenderWindow.  All
##  processes on the controller must have the same value.  This value must
##  be set before SetRenderWindow method is called.  In the constructor or
##  the SetController methods are good places.  By default this is set to
##  0.
##  int RootProcessId ; int ObservingRenderWindow ; int ObservingAbort ; unsigned long StartRenderTag ; unsigned long EndRenderTag ; unsigned long ResetCameraTag ; unsigned long ResetCameraClippingRangeTag ; unsigned long AbortRenderCheckTag ; double ImageReductionFactor ; double MaxImageReductionFactor ; int AutoImageReductionFactor ; int WriteBackImages ; int MagnifyImages ; int MagnifyImageMethod ; int UseRGBA ; int SynchronizeTileProperties ; int FullImageSize [ 2 ] ; int ReducedImageSize [ 2 ] ; vtkUnsignedCharArray * FullImage ; vtkUnsignedCharArray * ReducedImage ; int FullImageUpToDate ; int ReducedImageUpToDate ; int RenderWindowImageUpToDate ; vtkDoubleArray * Viewports ; int Lock ; int ParallelRendering ; int RenderEventPropagation ; int UseCompositing ; int SyncRenderWindowRenderers ; vtkTimerLog * Timer ; double RenderTime ; double ImageProcessingTime ; *
##  Used by SetImageReductionFactorForUpdateRate to smooth transitions
##  transitions between image reduction factors.
##  double AverageTimePerPixel ; *
##  Used to synchronize rendering information per frame.
##  These are old methods provided for backward compatibility. One should look
##  at using CollectWindowInformation(), ProcessWindowInformation() etc. for
##  buffered sending of information over.
##  virtual void SendWindowInformation ( ) { } virtual void ReceiveWindowInformation ( ) { } virtual void SendRendererInformation ( vtkRenderer * ) { } virtual void ReceiveRendererInformation ( vtkRenderer * ) { } *
##  Subclass should override these methods (instead of
##  SendWindowInformation/ReceiveWindowInformation or
##  SendRendererInformation/ReceiveRendererInformation) to collect or process
##  meta-data to synchronize rendering information per frame.
##  Subclass should not use the Controller directly to send receive messages
##  in any of these methods otherwise deadlocks may ensue.
##  virtual void CollectWindowInformation ( vtkMultiProcessStream & ) { } virtual bool ProcessWindowInformation ( vtkMultiProcessStream & ) { return true ; } virtual void CollectRendererInformation ( vtkRenderer * , vtkMultiProcessStream & ) { } virtual bool ProcessRendererInformation ( vtkRenderer * , vtkMultiProcessStream & ) { return true ; } /@{ *
##  Here is a good place to handle processing of data before and after
##  render.
##  virtual void PreRenderProcessing ( ) = 0 ; virtual void PostRenderProcessing ( ) = 0 ; /@} *
##  Called in satellites to set the render window size to the current
##  FullImageSize and ReducedImageSize (or vice versa).
##  virtual void SetRenderWindowSize ( ) ; *
##  Called by ComputeVisiblePropBoundsRMI to get the bounds of a local
##  renderer.  Override this method if the true bounds are different than
##  those reported by the renderer.
##  virtual void LocalComputeVisiblePropBounds ( vtkRenderer * ren , double bounds [ 6 ] ) ; *
##  When called, fills FullImage.
##  virtual void MagnifyReducedImage ( ) ; *
##  Write the full image back to the RenderWindow.
##  virtual void WriteFullImage ( ) ; *
##  Reads in the reduced image from the RenderWindow.
##  virtual void ReadReducedImage ( ) ; *
##  Returns 1 if the RenderWindow's last image is in the front buffer, 0
##  if it is in the back.
##  virtual int LastRenderInFrontBuffer ( ) ; *
##  Select buffer to read from / render into.
##  virtual int ChooseBuffer ( ) ; *
##  Sets the current render window's pixel data.
##  virtual void SetRenderWindowPixelData ( vtkUnsignedCharArray * pixels , const int pixelDimensions [ 2 ] ) ; *
##  Returns true if the image for the given renderer should be rendered at a
##  reduced size to be magnified later.  This method always returns true, but
##  subclasses may render some renderers at a reduced size, magnify them, and
##  then render the other renderers at full resolution.
##  virtual int ImageReduceRenderer ( vtkRenderer * ) { return 1 ; } struct RenderWindowInfo { int FullSize [ 2 ] ; int ReducedSize [ 2 ] ; int NumberOfRenderers ; int UseCompositing ; int TileScale [ 2 ] ; double ImageReductionFactor ; double DesiredUpdateRate ; double TileViewport [ 4 ] ;  Initialize members RenderWindowInfo ( ) = default ;  Save/restore the struct to/from a stream. void Save ( vtkMultiProcessStream & stream ) ; bool Restore ( vtkMultiProcessStream & stream ) ; } ; struct RendererInfo { int Draw = 0 ; int NumberOfLights = 0 ; double Viewport [ 4 ] = { 0.0 , 0.0 , 0.0 , 0.0 } ; double CameraPosition [ 3 ] = { 0.0 , 0.0 , 0.0 } ; double CameraFocalPoint [ 3 ] = { 0.0 , 0.0 , 0.0 } ; double CameraViewUp [ 3 ] = { 0.0 , 0.0 , 0.0 } ; double WindowCenter [ 2 ] = { 0.0 , 0.0 } ; double CameraClippingRange [ 2 ] = { 0.0 , 0.0 } ; double CameraViewAngle = 0.0 ; double Background [ 3 ] = { 0.0 , 0.0 , 0.0 } ; double Background2 [ 3 ] = { 0.0 , 0.0 , 0.0 } ; bool GradientBackground = false ; double ParallelScale = 0.0 ;  Initialize members RendererInfo ( ) = default ;  Save/restore the struct to/from a stream. void Save ( vtkMultiProcessStream & stream ) ; bool Restore ( vtkMultiProcessStream & stream ) ; } ; struct LightInfo { double Position [ 3 ] ; double FocalPoint [ 3 ] ; double Type ;  Initialize members LightInfo ( ) = default ;  Save/restore the struct to/from a stream. void Save ( vtkMultiProcessStream & stream ) ; bool Restore ( vtkMultiProcessStream & stream ) ; } ; int AddedRMIs ; unsigned long RenderRMIId ; unsigned long BoundsRMIId ; int UseBackBuffer ; static bool DefaultRenderEventPropagation ; private : vtkParallelRenderManager ( const vtkParallelRenderManager & ) = delete ; void operator = ( const vtkParallelRenderManager & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
