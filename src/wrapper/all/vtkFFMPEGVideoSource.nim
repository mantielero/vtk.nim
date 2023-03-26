## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFFMPEGVideoSource.h
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
##  @class   vtkFFMPEGVideoSource
##  @brief   Reader for ffmpeg supported formats
##
##  Note this this class make use of multiple threads when decoding files. It has
##  a feed thread, a video drain thread, and an audio drain thread. The decoding
##  may use multiple threads as well as specified by DecodingThreads ivar.
##
##  @sa
##  vtkVideoSource
##

## !!!Ignored construct:  # vtkFFMPEGVideoSource_h [NewLine] # vtkFFMPEGVideoSource_h [NewLine] # vtkIOFFMPEGModule.h  For export macro # vtkMultiThreader.h  for ivar # vtkNew.h  for ivar # vtkVideoSource.h [NewLine] # < condition_variable >  for std::condition_variable_any # < functional >  for audio callback # < mutex >  for std::mutex [NewLine] class vtkFFMPEGVideoSourceInternal ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkFFMPEGVideoSource"
type
  VTKIOFFMPEG_EXPORTvtkFFMPEGVideoSourceAudioCallbackData* {.
      importcpp: "VTKIOFFMPEG_EXPORT::vtkFFMPEGVideoSourceAudioCallbackData",
      header: "vtkFFMPEGVideoSource.h", bycopy.} = object
    NumberOfSamples* {.importc: "NumberOfSamples".}: cint
    BytesPerSample* {.importc: "BytesPerSample".}: cint
    NumberOfChannels* {.importc: "NumberOfChannels".}: cint
    SampleRate* {.importc: "SampleRate".}: cint
    DataType* {.importc: "DataType".}: cint
    Packed* {.importc: "Packed".}: bool
    Data* {.importc: "Data".}: ptr ptr cuchar
    Caller* {.importc: "Caller".}: ptr VTKIOFFMPEG_EXPORTvtkFFMPEGVideoSource
    ClientData* {.importc: "ClientData".}: pointer


##  video callback struct, outside the class so that we
##  can forward ref it

type
  VTKIOFFMPEG_EXPORTvtkFFMPEGVideoSourceVideoCallbackData* {.
      importcpp: "VTKIOFFMPEG_EXPORT::vtkFFMPEGVideoSourceVideoCallbackData",
      header: "vtkFFMPEGVideoSource.h", bycopy.} = object
    Height* {.importc: "Height".}: cint
    LineSize* {.importc: "LineSize".}: array[8, cint]
    Data* {.importc: "Data".}: array[8, ptr cuchar] ##  nullptr for empty planes
    Caller* {.importc: "Caller".}: ptr VTKIOFFMPEG_EXPORTvtkFFMPEGVideoSource
    ClientData* {.importc: "ClientData".}: pointer


## !!!Ignored construct:  class VTKIOFFMPEG_EXPORT vtkFFMPEGVideoSource : public vtkVideoSource { public : static vtkFFMPEGVideoSource * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkVideoSource Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkVideoSource :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkFFMPEGVideoSource :: IsTypeOf ( type ) ; } static vtkFFMPEGVideoSource * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkFFMPEGVideoSource * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkFFMPEGVideoSource * NewInstance ( ) const { return vtkFFMPEGVideoSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkVideoSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFFMPEGVideoSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFFMPEGVideoSource :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Standard VCR functionality: Record incoming video.
##  void Record ( ) override ; *
##  Standard VCR functionality: Play recorded video.
##  void Play ( ) override ; *
##  Standard VCR functionality: Stop recording or playing.
##  void Stop ( ) override ; *
##  Grab a single video frame.
##  void Grab ( ) override ; /@{ *
##  Request a particular frame size (set the third value to 1).
##  void SetFrameSize ( int x , int y , int z ) override ; void SetFrameSize ( int dim [ 3 ] ) override { this -> SetFrameSize ( dim [ 0 ] , dim [ 1 ] , dim [ 2 ] ) ; } /@} *
##  Request a particular frame rate (default 30 frames per second).
##  void SetFrameRate ( float rate ) override ; *
##  Request a particular output format (default: VTK_RGB).
##  void SetOutputFormat ( int format ) override ; *
##  Initialize the driver (this is called automatically when the
##  first grab is done).
##  void Initialize ( ) override ; *
##  Free the driver (this is called automatically inside the
##  destructor).
##  void ReleaseSystemResources ( ) override ; /@{ *
##  Specify file name of the video
##  virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ; /@} *
##  The internal function which actually does the grab.  You will
##  definitely want to override this if you develop a vtkVideoSource
##  subclass.
##  void InternalGrab ( ) override ;  is the video at the end of file?
##  Useful for while loops virtual bool GetEndOfFile ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EndOfFile  of  << this -> EndOfFile ) ; return this -> EndOfFile ; } ;  Is the video stream stereo 3d virtual bool GetEndOfFileStereo3D ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Stereo3D  of  << this -> Stereo3D ) ; return this -> Stereo3D ; } ;  we do not use Invoke Observers here because this callback
##  will happen in a different thread that could conflict
##  with events from other threads. In this function you should
##  not block the thread (for example waiting for audio to play)
##  instead you should have enough buffering that you can consume
##  the provided data and return. Typically even 1 second of
##  buffer storage is enough to prevent blocking. typedef std :: function < void ( vtkFFMPEGVideoSourceAudioCallbackData const & data ) > AudioCallbackType ; void SetAudioCallback ( AudioCallbackType cb , void * clientData ) { this -> AudioCallback = cb ; this -> AudioCallbackClientData = clientData ; }  we do not use Invoke Observers here because this callback
##  will happen in a different thread that could conflict
##  with events from other threads. In this function you should
##  not block the thread (for example waiting for video to play)
##  instead you should have enough buffering that you can consume
##  the provided data and return. typedef std :: function < void ( vtkFFMPEGVideoSourceVideoCallbackData const & data ) > VideoCallbackType ; void SetVideoCallback ( VideoCallbackType cb , void * clientData ) { this -> VideoCallback = cb ; this -> VideoCallbackClientData = clientData ; } /@{ *
##  How many threads to use for the decoding codec
##  this will be in addition to the feed and drain threads.
##  the default value is 4.
##  virtual void SetDecodingThreads ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  DecodingThreads  to  << _arg ) ; if ( this -> DecodingThreads != _arg ) { this -> DecodingThreads = _arg ; this -> Modified ( ) ; } } ; virtual int GetEndOfFileStereo3DDecodingThreads ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DecodingThreads  of  << this -> DecodingThreads ) ; return this -> DecodingThreads ; } ; /@} protected : vtkFFMPEGVideoSource ( ) ; ~ vtkFFMPEGVideoSource ( ) override ; AudioCallbackType AudioCallback ; void * AudioCallbackClientData ; int DecodingThreads ; static void * DrainAudioThread ( vtkMultiThreader :: ThreadInfo * data ) ; void * DrainAudio ( vtkMultiThreader :: ThreadInfo * data ) ; int DrainAudioThreadId ; static void * DrainThread ( vtkMultiThreader :: ThreadInfo * data ) ; void * Drain ( vtkMultiThreader :: ThreadInfo * data ) ; int DrainThreadId ; bool EndOfFile ; std :: condition_variable_any FeedCondition ; std :: mutex FeedMutex ; std :: condition_variable_any FeedAudioCondition ; std :: mutex FeedAudioMutex ; static void * FeedThread ( vtkMultiThreader :: ThreadInfo * data ) ; void * Feed ( vtkMultiThreader :: ThreadInfo * data ) ; int FeedThreadId ; char * FileName ; vtkFFMPEGVideoSourceInternal * Internal ; void ReadFrame ( ) ; bool Stereo3D ; VideoCallbackType VideoCallback ; void * VideoCallbackClientData ; private : vtkFFMPEGVideoSource ( const vtkFFMPEGVideoSource & ) = delete ; void operator = ( const vtkFFMPEGVideoSource & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
