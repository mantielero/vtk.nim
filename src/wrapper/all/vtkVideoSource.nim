## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkVideoSource.h
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
##  @class   vtkVideoSource
##  @brief   Superclass of video input devices for VTK
##
##  vtkVideoSource is a superclass for video input interfaces for VTK.
##  The goal is to provide an interface which is very similar to the
##  interface of a VCR, where the 'tape' is an internal frame buffer
##  capable of holding a preset number of video frames.  Specialized
##  versions of this class record input from various video input sources.
##  This base class records input from a noise source.
##  @warning
##  You must call the ReleaseSystemResources() method before the application
##  exits.  Otherwise the application might hang while trying to exit.
##  @sa
##  vtkWin32VideoSource vtkMILVideoSource
##

## !!!Ignored construct:  # vtkVideoSource_h [NewLine] # vtkVideoSource_h [NewLine] # vtkIOVideoModule.h  For export macro # vtkImageAlgorithm.h [NewLine] # < mutex >  for std::mutex [NewLine] class vtkTimerLog ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkMultiThreader"
discard "forward decl of vtkScalarsToColors"
## !!!Ignored construct:  class VTKIOVIDEO_EXPORT vtkVideoSource : public vtkImageAlgorithm { public : static vtkVideoSource * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkVideoSource :: IsTypeOf ( type ) ; } static vtkVideoSource * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkVideoSource * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkVideoSource * NewInstance ( ) const { return vtkVideoSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkVideoSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkVideoSource :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Record incoming video at the specified FrameRate.  The recording
##  continues indefinitely until Stop() is called.
##  virtual void Record ( ) ; *
##  Play through the 'tape' sequentially at the specified frame rate.
##  If you have just finished Recoding, you should call Rewind() first.
##  virtual void Play ( ) ; *
##  Stop recording or playing.
##  virtual void Stop ( ) ; *
##  Rewind to the frame with the earliest timestamp.  Record operations
##  will start on the following frame, therefore if you want to re-record
##  over this frame you must call Seek(-1) before calling Grab() or Record().
##  virtual void Rewind ( ) ; *
##  FastForward to the last frame that was recorded (i.e. to the frame
##  that has the most recent timestamp).
##  virtual void FastForward ( ) ; *
##  Seek forwards or backwards by the specified number of frames
##  (positive is forward, negative is backward).
##  virtual void Seek ( int n ) ; *
##  Grab a single video frame.
##  virtual void Grab ( ) ; /@{ *
##  Are we in record mode? (record mode and play mode are mutually
##  exclusive).
##  virtual int GetRecording ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Recording  of  << this -> Recording ) ; return this -> Recording ; } ; /@} /@{ *
##  Are we in play mode? (record mode and play mode are mutually
##  exclusive).
##  virtual int GetRecordingPlaying ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Playing  of  << this -> Playing ) ; return this -> Playing ; } ; /@} /@{ *
##  Set the full-frame size.  This must be an allowed size for the device,
##  the device may either refuse a request for an illegal frame size or
##  automatically choose a new frame size.
##  The default is usually 320x240x1, but can be device specific.
##  The 'depth' should always be 1 (unless you have a device that
##  can handle 3D acquisition).
##  virtual void SetFrameSize ( int x , int y , int z ) ; virtual void SetFrameSize ( int dim [ 3 ] ) { this -> SetFrameSize ( dim [ 0 ] , dim [ 1 ] , dim [ 2 ] ) ; } virtual int * GetFrameSize ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << FrameSize  pointer  << this -> FrameSize ) ; return this -> FrameSize ; } VTK_WRAPEXCLUDE virtual void GetFrameSize ( int & _arg1 , int & _arg2 , int & _arg3 ) { _arg1 = this -> FrameSize [ 0 ] ; _arg2 = this -> FrameSize [ 1 ] ; _arg3 = this -> FrameSize [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << FrameSize  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetFrameSize ( int _arg [ 3 ] ) { this -> GetFrameSize ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  Request a particular frame rate (default 30 frames per second).
##  virtual void SetFrameRate ( float rate ) ; virtual float GetRecordingPlayingFrameRate ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FrameRate  of  << this -> FrameRate ) ; return this -> FrameRate ; } ; /@} /@{ *
##  Set the output format.  This must be appropriate for device,
##  usually only VTK_LUMINANCE, VTK_RGB, and VTK_RGBA are supported.
##  virtual void SetOutputFormat ( int format ) ; void SetOutputFormatToLuminance ( ) { this -> SetOutputFormat ( VTK_LUMINANCE ) ; } void SetOutputFormatToRGB ( ) { this -> SetOutputFormat ( VTK_RGB ) ; } void SetOutputFormatToRGBA ( ) { this -> SetOutputFormat ( VTK_RGBA ) ; } virtual int GetRecordingPlayingFrameRateOutputFormat ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputFormat  of  << this -> OutputFormat ) ; return this -> OutputFormat ; } ; /@} /@{ *
##  Set size of the frame buffer, i.e. the number of frames that
##  the 'tape' can store.
##  virtual void SetFrameBufferSize ( int FrameBufferSize ) ; virtual int GetRecordingPlayingFrameRateOutputFormatFrameBufferSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FrameBufferSize  of  << this -> FrameBufferSize ) ; return this -> FrameBufferSize ; } ; /@} /@{ *
##  Set the number of frames to copy to the output on each execute.
##  The frames will be concatenated along the Z dimension, with the
##  most recent frame first.
##  Default: 1
##  virtual void SetNumberOfOutputFrames ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NumberOfOutputFrames  to  << _arg ) ; if ( this -> NumberOfOutputFrames != _arg ) { this -> NumberOfOutputFrames = _arg ; this -> Modified ( ) ; } } ; virtual int GetRecordingPlayingFrameRateOutputFormatFrameBufferSizeNumberOfOutputFrames ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfOutputFrames  of  << this -> NumberOfOutputFrames ) ; return this -> NumberOfOutputFrames ; } ; /@} /@{ *
##  Set whether to automatically advance the buffer before each grab.
##  Default: on
##  virtual void AutoAdvanceOn ( ) { this -> SetAutoAdvance ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void AutoAdvanceOff ( ) { this -> SetAutoAdvance ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual void SetNumberOfOutputFramesAutoAdvance ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  AutoAdvance  to  << _arg ) ; if ( this -> AutoAdvance != _arg ) { this -> AutoAdvance = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetRecordingPlayingFrameRateOutputFormatFrameBufferSizeNumberOfOutputFramesAutoAdvance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AutoAdvance  of  << this -> AutoAdvance ) ; return this -> AutoAdvance ; } ; /@} /@{ *
##  Set the clip rectangle for the frames.  The video will be clipped
##  before it is copied into the framebuffer.  Changing the ClipRegion
##  will destroy the current contents of the framebuffer.
##  The default ClipRegion is (0,VTK_INT_MAX,0,VTK_INT_MAX,0,VTK_INT_MAX).
##  virtual void SetClipRegion ( int r [ 6 ] ) { this -> SetClipRegion ( r [ 0 ] , r [ 1 ] , r [ 2 ] , r [ 3 ] , r [ 4 ] , r [ 5 ] ) ; } virtual void SetClipRegion ( int x0 , int x1 , int y0 , int y1 , int z0 , int z1 ) ; virtual int * GetClipRegion ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ClipRegion  pointer  << this -> ClipRegion ) ; return this -> ClipRegion ; } VTK_WRAPEXCLUDE virtual void GetClipRegion ( int & _arg1 , int & _arg2 , int & _arg3 , int & _arg4 , int & _arg5 , int & _arg6 ) { _arg1 = this -> ClipRegion [ 0 ] ; _arg2 = this -> ClipRegion [ 1 ] ; _arg3 = this -> ClipRegion [ 2 ] ; _arg4 = this -> ClipRegion [ 3 ] ; _arg5 = this -> ClipRegion [ 4 ] ; _arg6 = this -> ClipRegion [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << ClipRegion  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetClipRegion ( int _arg [ 6 ] ) { this -> GetClipRegion ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; /@} /@{ *
##  Get/Set the WholeExtent of the output.  This can be used to either
##  clip or pad the video frame.  This clipping/padding is done when
##  the frame is copied to the output, and does not change the contents
##  of the framebuffer.  This is useful e.g. for expanding
##  the output size to a power of two for texture mapping.  The
##  default is (0,-1,0,-1,0,-1) which causes the entire frame to be
##  copied to the output.
##  virtual void SetOutputWholeExtent ( int _arg1 , int _arg2 , int _arg3 , int _arg4 , int _arg5 , int _arg6 ) { vtkDebugWithObjectMacro ( this , <<  setting  << OutputWholeExtent  to ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; if ( ( this -> OutputWholeExtent [ 0 ] != _arg1 ) || ( this -> OutputWholeExtent [ 1 ] != _arg2 ) || ( this -> OutputWholeExtent [ 2 ] != _arg3 ) || ( this -> OutputWholeExtent [ 3 ] != _arg4 ) || ( this -> OutputWholeExtent [ 4 ] != _arg5 ) || ( this -> OutputWholeExtent [ 5 ] != _arg6 ) ) { this -> OutputWholeExtent [ 0 ] = _arg1 ; this -> OutputWholeExtent [ 1 ] = _arg2 ; this -> OutputWholeExtent [ 2 ] = _arg3 ; this -> OutputWholeExtent [ 3 ] = _arg4 ; this -> OutputWholeExtent [ 4 ] = _arg5 ; this -> OutputWholeExtent [ 5 ] = _arg6 ; this -> Modified ( ) ; } } virtual void SetOutputWholeExtent ( const int _arg [ 6 ] ) { this -> SetOutputWholeExtent ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; virtual int * GetClipRegionOutputWholeExtent ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << OutputWholeExtent  pointer  << this -> OutputWholeExtent ) ; return this -> OutputWholeExtent ; } VTK_WRAPEXCLUDE virtual void GetClipRegionOutputWholeExtent ( int & _arg1 , int & _arg2 , int & _arg3 , int & _arg4 , int & _arg5 , int & _arg6 ) { _arg1 = this -> OutputWholeExtent [ 0 ] ; _arg2 = this -> OutputWholeExtent [ 1 ] ; _arg3 = this -> OutputWholeExtent [ 2 ] ; _arg4 = this -> OutputWholeExtent [ 3 ] ; _arg5 = this -> OutputWholeExtent [ 4 ] ; _arg6 = this -> OutputWholeExtent [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << OutputWholeExtent  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetClipRegionOutputWholeExtent ( int _arg [ 6 ] ) { this -> GetClipRegionOutputWholeExtent ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; /@} /@{ *
##  Set/Get the pixel spacing.
##  Default: (1.0,1.0,1.0)
##  virtual void SetDataSpacing ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << DataSpacing  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> DataSpacing [ 0 ] != _arg1 ) || ( this -> DataSpacing [ 1 ] != _arg2 ) || ( this -> DataSpacing [ 2 ] != _arg3 ) ) { this -> DataSpacing [ 0 ] = _arg1 ; this -> DataSpacing [ 1 ] = _arg2 ; this -> DataSpacing [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetDataSpacing ( const double _arg [ 3 ] ) { this -> SetDataSpacing ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetFrameSizeDataSpacing ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << DataSpacing  pointer  << this -> DataSpacing ) ; return this -> DataSpacing ; } VTK_WRAPEXCLUDE virtual void GetFrameSizeDataSpacing ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> DataSpacing [ 0 ] ; _arg2 = this -> DataSpacing [ 1 ] ; _arg3 = this -> DataSpacing [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << DataSpacing  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetFrameSizeDataSpacing ( double _arg [ 3 ] ) { this -> GetFrameSizeDataSpacing ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  Set/Get the coordinates of the lower, left corner of the frame.
##  Default: (0.0,0.0,0.0)
##  virtual void SetDataSpacingDataOrigin ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << DataOrigin  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> DataOrigin [ 0 ] != _arg1 ) || ( this -> DataOrigin [ 1 ] != _arg2 ) || ( this -> DataOrigin [ 2 ] != _arg3 ) ) { this -> DataOrigin [ 0 ] = _arg1 ; this -> DataOrigin [ 1 ] = _arg2 ; this -> DataOrigin [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetDataSpacingDataOrigin ( const double _arg [ 3 ] ) { this -> SetDataSpacingDataOrigin ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetFrameSizeDataSpacingDataOrigin ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << DataOrigin  pointer  << this -> DataOrigin ) ; return this -> DataOrigin ; } VTK_WRAPEXCLUDE virtual void GetFrameSizeDataSpacingDataOrigin ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> DataOrigin [ 0 ] ; _arg2 = this -> DataOrigin [ 1 ] ; _arg3 = this -> DataOrigin [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << DataOrigin  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetFrameSizeDataSpacingDataOrigin ( double _arg [ 3 ] ) { this -> GetFrameSizeDataSpacingDataOrigin ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  For RGBA output only (4 scalar components), set the opacity.  This
##  will not modify the existing contents of the framebuffer, only
##  subsequently grabbed frames.
##  virtual void SetNumberOfOutputFramesAutoAdvanceOpacity ( float _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Opacity  to  << _arg ) ; if ( this -> Opacity != _arg ) { this -> Opacity = _arg ; this -> Modified ( ) ; } } ; virtual float GetRecordingPlayingFrameRateOutputFormatFrameBufferSizeNumberOfOutputFramesAutoAdvanceOpacity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Opacity  of  << this -> Opacity ) ; return this -> Opacity ; } ; /@} /@{ *
##  This value is incremented each time a frame is grabbed.
##  reset it to zero (or any other value) at any time.
##  virtual int GetRecordingPlayingFrameRateOutputFormatFrameBufferSizeNumberOfOutputFramesAutoAdvanceOpacityFrameCount ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FrameCount  of  << this -> FrameCount ) ; return this -> FrameCount ; } ; virtual void SetNumberOfOutputFramesAutoAdvanceOpacityFrameCount ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  FrameCount  to  << _arg ) ; if ( this -> FrameCount != _arg ) { this -> FrameCount = _arg ; this -> Modified ( ) ; } } ; /@} /@{ *
##  Get the frame index relative to the 'beginning of the tape'.  This
##  value wraps back to zero if it increases past the FrameBufferSize.
##  virtual int GetRecordingPlayingFrameRateOutputFormatFrameBufferSizeNumberOfOutputFramesAutoAdvanceOpacityFrameCountFrameIndex ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FrameIndex  of  << this -> FrameIndex ) ; return this -> FrameIndex ; } ; /@} *
##  Get a time stamp in seconds (resolution of milliseconds) for
##  a video frame.   Time began on Jan 1, 1970.  You can specify
##  a number (negative or positive) to specify the position of the
##  video frame relative to the current frame.
##  virtual double GetFrameTimeStamp ( int frame ) ; *
##  Get a time stamp in seconds (resolution of milliseconds) for
##  the Output.  Time began on Jan 1, 1970.  This timestamp is only
##  valid after the Output has been Updated.
##  double GetFrameTimeStamp ( ) { return this -> FrameTimeStamp ; } /@{ *
##  Initialize the hardware.  This is called automatically
##  on the first Update or Grab.
##  virtual void Initialize ( ) ; virtual int GetInitialized ( ) { return this -> Initialized ; } /@} *
##  Release the video driver.  This method must be called before
##  application exit, or else the application might hang during
##  exit.
##  virtual void ReleaseSystemResources ( ) ; *
##  The internal function which actually does the grab.  You will
##  definitely want to override this if you develop a vtkVideoSource
##  subclass.
##  virtual void InternalGrab ( ) ; /@{ *
##  And internal variable which marks the beginning of a Record session.
##  These methods are for internal use only.
##  void SetStartTimeStamp ( double t ) { this -> StartTimeStamp = t ; } double GetStartTimeStamp ( ) { return this -> StartTimeStamp ; } /@} protected : vtkVideoSource ( ) ; ~ vtkVideoSource ( ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int Initialized ; int FrameSize [ 3 ] ; int ClipRegion [ 6 ] ; int OutputWholeExtent [ 6 ] ; double DataSpacing [ 3 ] ; double DataOrigin [ 3 ] ; int OutputFormat ;  set according to the OutputFormat int NumberOfScalarComponents ;  The FrameOutputExtent is the WholeExtent for a single output frame.
##  It is initialized in ExecuteInformation. int FrameOutputExtent [ 6 ] ;  save this information from the output so that we can see if the
##  output scalars have changed int LastNumberOfScalarComponents ; int LastOutputExtent [ 6 ] ; int Recording ; int Playing ; float FrameRate ; int FrameCount ; double StartTimeStamp ; double FrameTimeStamp ; vtkTypeBool AutoAdvance ; int NumberOfOutputFrames ; float Opacity ;  true if Execute() must apply a vertical flip to each frame int FlipFrames ;  set if output needs to be cleared to be cleared before being written int OutputNeedsInitialization ;  An example of asynchrony vtkMultiThreader * PlayerThreader ; int PlayerThreadId ;  A mutex for the frame buffer: must be applied when any of the
##  below data is modified. std :: mutex FrameBufferMutex ;  set according to the needs of the hardware:
##  number of bits per framebuffer pixel int FrameBufferBitsPerPixel ;  byte alignment of each row in the framebuffer int FrameBufferRowAlignment ;  FrameBufferExtent is the extent of frame after it has been clipped
##  with ClipRegion.  It is initialized in CheckBuffer(). int FrameBufferExtent [ 6 ] ; int FrameBufferSize ;  where the current frame is, note this decreases in time
##  increasing values are older frames int FrameBufferIndex ;  number of frames from the beginning sort of,
##  it does wrap, sometimes int FrameIndex ; void * * FrameBuffer ; double * FrameBufferTimeStamps ; /@{ *
##  These methods can be overridden in subclasses
##  virtual void UpdateFrameBuffer ( ) ; virtual void AdvanceFrameBuffer ( int n ) ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ;  if some component conversion is required, it is done here: virtual void UnpackRasterLine ( char * outPtr , char * rowPtr , int start , int count ) ; /@} private : vtkVideoSource ( const vtkVideoSource & ) = delete ; void operator = ( const vtkVideoSource & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
