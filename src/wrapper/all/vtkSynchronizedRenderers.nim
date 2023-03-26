## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSynchronizedRenderers.h
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
##  @class   vtkSynchronizedRenderers
##  @brief   synchronizes renderers across processes.
##
##  vtkSynchronizedRenderers is used to synchronize renderers (vtkRenderer and
##  subclasses) across processes for parallel rendering. It's designed to be used
##  in conjunction with vtkSynchronizedRenderWindows to synchronize the render
##  windows among those processes.
##  This class handles synchronization of certain render parameters among the
##  renderers such as viewport, camera parameters. It doesn't support compositing
##  of rendered images across processes on its own. You typically either subclass
##  to implement a compositing algorithm or use a renderer capable of compositing
##  eg. IceT based renderer.
##

## !!!Ignored construct:  # vtkSynchronizedRenderers_h [NewLine] # vtkSynchronizedRenderers_h [NewLine] # vtkObject.h [NewLine] # vtkRenderingParallelModule.h  For export macro # vtkSmartPointer.h  needed for vtkSmartPointer. # vtkUnsignedCharArray.h  needed for vtkUnsignedCharArray. [NewLine] class vtkFXAAOptions ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkRenderer"
discard "forward decl of vtkMultiProcessController"
discard "forward decl of vtkMultiProcessStream"
discard "forward decl of vtkOpenGLFXAAFilter"
discard "forward decl of vtkOpenGLRenderer"
## !!!Ignored construct:  class VTKRENDERINGPARALLEL_EXPORT vtkSynchronizedRenderers : public vtkObject { public : static vtkSynchronizedRenderers * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkSynchronizedRenderers :: IsTypeOf ( type ) ; } static vtkSynchronizedRenderers * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkSynchronizedRenderers * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkSynchronizedRenderers * NewInstance ( ) const { return vtkSynchronizedRenderers :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSynchronizedRenderers :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSynchronizedRenderers :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set the renderer to be synchronized by this instance. A
##  vtkSynchronizedRenderers instance can be used to synchronize exactly 1
##  renderer on each processes. You can create multiple instances on
##  vtkSynchronizedRenderers to synchronize multiple renderers.
##  virtual void SetRenderer ( vtkRenderer * ) ; virtual vtkRenderer * GetRenderer ( ) ; /@} /@{ *
##  Set the parallel message communicator. This is used to communicate among
##  processes.
##  virtual void SetParallelController ( vtkMultiProcessController * ) ; virtual vtkMultiProcessController * GetnameParallelController ( ) { vtkDebugWithObjectMacro ( this , <<  returning  ParallelController  address  << static_cast < vtkMultiProcessController * > ( this -> ParallelController ) ) ; return this -> ParallelController ; } ; /@} /@{ *
##  Enable/Disable parallel rendering. Unless Parallel rendering is on, the
##  cameras won't be synchronized across processes.
##  virtual void SetParallelRendering ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ParallelRendering  to  << _arg ) ; if ( this -> ParallelRendering != _arg ) { this -> ParallelRendering = _arg ; this -> Modified ( ) ; } } ; virtual bool GetParallelRendering ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ParallelRendering  of  << this -> ParallelRendering ) ; return this -> ParallelRendering ; } ; virtual void ParallelRenderingOn ( ) { this -> SetParallelRendering ( static_cast < bool > ( 1 ) ) ; } virtual void ParallelRenderingOff ( ) { this -> SetParallelRendering ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Get/Set the image reduction factor.
##  virtual void SetImageReductionFactor ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ImageReductionFactor  to  << _arg ) ; if ( this -> ImageReductionFactor != ( _arg < 1 ? 1 : ( _arg > 50 ? 50 : _arg ) ) ) { this -> ImageReductionFactor = ( _arg < 1 ? 1 : ( _arg > 50 ? 50 : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetImageReductionFactorMinValue ( ) { return 1 ; } virtual int GetImageReductionFactorMaxValue ( ) { return 50 ; } ; virtual int GetParallelRenderingImageReductionFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ImageReductionFactor  of  << this -> ImageReductionFactor ) ; return this -> ImageReductionFactor ; } ; /@} /@{ *
##  If on (default), the rendered images are pasted back on to the screen. You
##  should turn this flag off on processes that are not meant to be visible to
##  the user.
##  virtual void SetParallelRenderingWriteBackImages ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  WriteBackImages  to  << _arg ) ; if ( this -> WriteBackImages != _arg ) { this -> WriteBackImages = _arg ; this -> Modified ( ) ; } } ; virtual bool GetParallelRenderingImageReductionFactorWriteBackImages ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WriteBackImages  of  << this -> WriteBackImages ) ; return this -> WriteBackImages ; } ; virtual void WriteBackImagesOn ( ) { this -> SetParallelRenderingWriteBackImages ( static_cast < bool > ( 1 ) ) ; } virtual void WriteBackImagesOff ( ) { this -> SetParallelRenderingWriteBackImages ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Get/Set the root-process id. This is required when the ParallelController
##  is a vtkSocketController. Set to 0 by default (which will not work when
##  using a vtkSocketController but will work for vtkMPIController).
##  virtual void SetParallelRenderingWriteBackImagesRootProcessId ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  RootProcessId  to  << _arg ) ; if ( this -> RootProcessId != _arg ) { this -> RootProcessId = _arg ; this -> Modified ( ) ; } } ; virtual int GetParallelRenderingImageReductionFactorWriteBackImagesRootProcessId ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RootProcessId  of  << this -> RootProcessId ) ; return this -> RootProcessId ; } ; /@} *
##  Computes visible prob bounds. This must be called on all processes at the
##  same time. The collective result is made available on all processes once
##  this method returns.
##  Note that this method requires that bounds is initialized to some value.
##  This expands the bounds to include the prop bounds.
##  void CollectiveExpandForVisiblePropBounds ( double bounds [ 6 ] ) ; /@{ *
##  When set, this->CaptureRenderedImage() does not capture image from the
##  screen instead passes the call to the delegate.
##  virtual void SetCaptureDelegate ( vtkSynchronizedRenderers * ) ; virtual vtkSynchronizedRenderers * GetnameParallelControllerCaptureDelegate ( ) { vtkDebugWithObjectMacro ( this , <<  returning  CaptureDelegate  address  << static_cast < vtkSynchronizedRenderers * > ( this -> CaptureDelegate ) ) ; return this -> CaptureDelegate ; } ; /@} /@{ *
##  When multiple groups of processes are synchronized together using different
##  controllers, one needs to specify the order in which the various
##  synchronizers execute. In such cases one starts with the outer most
##  vtkSynchronizedRenderers, sets the dependent one as a CaptureDelegate on it
##  and the turn off AutomaticEventHandling on the delegate.
##  virtual void SetParallelRenderingWriteBackImagesRootProcessIdAutomaticEventHandling ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  AutomaticEventHandling  to  << _arg ) ; if ( this -> AutomaticEventHandling != _arg ) { this -> AutomaticEventHandling = _arg ; this -> Modified ( ) ; } } ; virtual bool GetParallelRenderingImageReductionFactorWriteBackImagesRootProcessIdAutomaticEventHandling ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AutomaticEventHandling  of  << this -> AutomaticEventHandling ) ; return this -> AutomaticEventHandling ; } ; virtual void AutomaticEventHandlingOn ( ) { this -> SetParallelRenderingWriteBackImagesAutomaticEventHandling ( static_cast < bool > ( 1 ) ) ; } virtual void AutomaticEventHandlingOff ( ) { this -> SetParallelRenderingWriteBackImagesAutomaticEventHandling ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  When doing rendering between multiple processes, it is often easier to have
##  all ranks do the rendering on a black background. This helps avoid issues
##  where the background gets over blended as the images are composted
##  together. If  set to true (default is false), before the rendering begins,
##  vtkSynchronizedRenderers will change the renderer's background color and
##  other flags to make it render on a black background and then restore then
##  on end render. If WriteBackImages is true, then the background will indeed
##  be restored before the write-back happens, thus ensuring the result
##  displayed to the user is on correct background.
##  virtual void SetParallelRenderingWriteBackImagesRootProcessIdAutomaticEventHandlingFixBackground ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  FixBackground  to  << _arg ) ; if ( this -> FixBackground != _arg ) { this -> FixBackground = _arg ; this -> Modified ( ) ; } } ; virtual bool GetParallelRenderingImageReductionFactorWriteBackImagesRootProcessIdAutomaticEventHandlingFixBackground ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FixBackground  of  << this -> FixBackground ) ; return this -> FixBackground ; } ; virtual void FixBackgroundOn ( ) { this -> SetParallelRenderingWriteBackImagesAutomaticEventHandlingFixBackground ( static_cast < bool > ( 1 ) ) ; } virtual void FixBackgroundOff ( ) { this -> SetParallelRenderingWriteBackImagesAutomaticEventHandlingFixBackground ( static_cast < bool > ( 0 ) ) ; } ; /@} enum { SYNC_RENDERER_TAG = 15101 , RESET_CAMERA_TAG = 15102 , COMPUTE_BOUNDS_TAG = 15103 } ; / vtkRawImage can be used to make it easier to deal with images for
## / compositing/communicating over client-server etc. struct VTKRENDERINGPARALLEL_EXPORT vtkRawImage { public : vtkRawImage ( ) { this -> Valid = false ; this -> Size [ 0 ] = this -> Size [ 1 ] = 0 ; this -> Data = vtkSmartPointer < vtkUnsignedCharArray > :: New ( ) ; } void Resize ( int dx , int dy , int numcomps ) { this -> Valid = false ; this -> Allocate ( dx , dy , numcomps ) ; } *
##  Create the buffer from an image data.
##  void Initialize ( int dx , int dy , vtkUnsignedCharArray * data ) ; void MarkValid ( ) { this -> Valid = true ; } void MarkInValid ( ) { this -> Valid = false ; } bool IsValid ( ) { return this -> Valid ; } int GetWidth ( ) { return this -> Size [ 0 ] ; } int GetHeight ( ) { return this -> Size [ 1 ] ; } vtkUnsignedCharArray * GetRawPtr ( ) { return this -> Data ; } *
##  Pushes the image to the viewport. The OpenGL viewport  and scissor region
##  is setup using the viewport defined by the renderer.
##
##  If blend is true (default), the image will be blended onto to the existing
##  background, else it will replace it.
##  bool PushToViewport ( vtkRenderer * renderer , bool blend = true ) ; *
##  This is a raw version of PushToViewport() that assumes that the
##  glViewport() has already been setup externally.
##
##  If blend is true (default), the image will be blended onto to the existing
##  background, else it will replace it.
##  bool PushToFrameBuffer ( vtkRenderer * ren , bool blend = true ) ;  Captures the image from the viewport.
##  This doesn't trigger a render, just captures what's currently there in
##  the active buffer. bool Capture ( vtkRenderer * ) ;  Save the image as a png. Useful for debugging. void SaveAsPNG ( VTK_FILEPATH const char * filename ) ; private : bool Valid ; int Size [ 2 ] ; vtkSmartPointer < vtkUnsignedCharArray > Data ; void Allocate ( int dx , int dy , int numcomps ) ; } ; protected : vtkSynchronizedRenderers ( ) ; ~ vtkSynchronizedRenderers ( ) override ; struct RendererInfo { int ImageReductionFactor ; int Draw ; int CameraParallelProjection ; double Viewport [ 4 ] ; double CameraPosition [ 3 ] ; double CameraFocalPoint [ 3 ] ; double CameraViewUp [ 3 ] ; double CameraWindowCenter [ 2 ] ; double CameraClippingRange [ 2 ] ; double CameraViewAngle ; double CameraParallelScale ; double EyeTransformMatrix [ 16 ] ; double ModelTransformMatrix [ 16 ] ;  Save/restore the struct to/from a stream. void Save ( vtkMultiProcessStream & stream ) ; bool Restore ( vtkMultiProcessStream & stream ) ; void CopyFrom ( vtkRenderer * ) ; void CopyTo ( vtkRenderer * ) ; } ;  These methods are called on all processes as a consequence of corresponding
##  events being called on the renderer. virtual void HandleStartRender ( ) ; virtual void HandleEndRender ( ) ; virtual void HandleAbortRender ( ) { } virtual void MasterStartRender ( ) ; virtual void SlaveStartRender ( ) ; virtual void MasterEndRender ( ) ; virtual void SlaveEndRender ( ) ; vtkMultiProcessController * ParallelController ; vtkOpenGLRenderer * Renderer ; *
##  Can be used in HandleEndRender(), MasterEndRender() or SlaveEndRender()
##  calls to capture the rendered image. The captured image is stored in
##  `this->Image`.
##  virtual vtkRawImage & CaptureRenderedImage ( ) ; *
##  Can be used in HandleEndRender(), MasterEndRender() or SlaveEndRender()
##  calls to paste back the image from this->Image to the viewport.
##  virtual void PushImageToScreen ( ) ; vtkSynchronizedRenderers * CaptureDelegate ; vtkRawImage Image ; bool ParallelRendering ; int ImageReductionFactor ; bool WriteBackImages ; int RootProcessId ; bool AutomaticEventHandling ; private : vtkSynchronizedRenderers ( const vtkSynchronizedRenderers & ) = delete ; void operator = ( const vtkSynchronizedRenderers & ) = delete ; class vtkObserver ; vtkObserver * Observer ; friend class vtkObserver ; bool UseFXAA ; vtkOpenGLFXAAFilter * FXAAFilter ; double LastViewport [ 4 ] ; double LastBackground [ 3 ] ; double LastBackgroundAlpha ; bool LastTexturedBackground ; bool LastGradientBackground ; bool FixBackground ; } ;
## Error: token expected: ; but got: [identifier]!!!
