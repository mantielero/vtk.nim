## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkWindow.h
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
##  @class   vtkWindow
##  @brief   window superclass for vtkRenderWindow
##
##  vtkWindow is an abstract object to specify the behavior of a
##  rendering window.  It contains vtkViewports.
##
##  @sa
##  vtkRenderWindow vtkViewport
##

## !!!Ignored construct:  # vtkWindow_h [NewLine] # vtkWindow_h [NewLine] # vtkCommonCoreModule.h  For export macro # vtkObject.h [NewLine] class vtkImageData ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkUnsignedCharArray"
## !!!Ignored construct:  class VTKCOMMONCORE_EXPORT vtkWindow : public vtkObject { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkWindow :: IsTypeOf ( type ) ; } static vtkWindow * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkWindow * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkWindow * NewInstance ( ) const { return vtkWindow :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkWindow :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkWindow :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  These are window system independent methods that are used
##  to help interface vtkWindow to native windowing systems.
##  virtual void SetDisplayId ( void * ) { } virtual void SetWindowId ( void * ) { } virtual void SetParentId ( void * ) { } virtual void * GetGenericDisplayId ( ) { return nullptr ; } virtual void * GetGenericWindowId ( ) { return nullptr ; } virtual void * GetGenericParentId ( ) { return nullptr ; } virtual void * GetGenericContext ( ) { return nullptr ; } virtual void * GetGenericDrawable ( ) { return nullptr ; } virtual void SetWindowInfo ( const char * ) { } virtual void SetParentInfo ( const char * ) { } /@} /@{ *
##  Get the position (x and y) of the rendering window in
##  screen coordinates (in pixels).
##  virtual int * GetPosition ( ) VTK_SIZEHINT ( 2 ) ; *
##  Set the position (x and y) of the rendering window in
##  screen coordinates (in pixels). This resizes the operating
##  system's view/window and redraws it.
##  virtual void SetPosition ( int x , int y ) ; virtual void SetPosition ( int a [ 2 ] ) ; /@} /@{ *
##  Get the size (width and height) of the rendering window in
##  screen coordinates (in pixels).
##  virtual int * GetSize ( ) VTK_SIZEHINT ( 2 ) ; *
##  Set the size (width and height) of the rendering window in
##  screen coordinates (in pixels). This resizes the operating
##  system's view/window and redraws it.
##
##  If the size has changed, this method will fire
##  vtkCommand::WindowResizeEvent.
##  virtual void SetSize ( int width , int height ) ; virtual void SetSize ( int a [ 2 ] ) ; /@} *
##  GetSize() returns the size * this->TileScale, whereas this method returns
##  the size without multiplying with the tile scale. Measured in pixels.
##  int * GetActualSize ( ) VTK_SIZEHINT ( 2 ) ; *
##  Get the current size of the screen in pixels.
##  virtual int * GetScreenSize ( ) VTK_SIZEHINT ( 2 ) { return nullptr ; } /@{ *
##  Keep track of whether the rendering window has been mapped to screen.
##  virtual vtkTypeBool GetMapped ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Mapped  of  << this -> Mapped ) ; return this -> Mapped ; } ; /@} /@{ *
##  Show or not Show the window
##  virtual bool GetMappedShowWindow ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ShowWindow  of  << this -> ShowWindow ) ; return this -> ShowWindow ; } ; virtual void SetShowWindow ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ShowWindow  to  << _arg ) ; if ( this -> ShowWindow != _arg ) { this -> ShowWindow = _arg ; this -> Modified ( ) ; } } ; virtual void ShowWindowOn ( ) { this -> SetShowWindow ( static_cast < bool > ( 1 ) ) ; } virtual void ShowWindowOff ( ) { this -> SetShowWindow ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Render to an offscreen destination such as a framebuffer.
##  All four combinations of ShowWindow and UseOffScreenBuffers
##  should work for most rendering backends.
##  virtual void SetShowWindowUseOffScreenBuffers ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseOffScreenBuffers  to  << _arg ) ; if ( this -> UseOffScreenBuffers != _arg ) { this -> UseOffScreenBuffers = _arg ; this -> Modified ( ) ; } } ; virtual bool GetMappedShowWindowUseOffScreenBuffers ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseOffScreenBuffers  of  << this -> UseOffScreenBuffers ) ; return this -> UseOffScreenBuffers ; } ; virtual void UseOffScreenBuffersOn ( ) { this -> SetShowWindowUseOffScreenBuffers ( static_cast < bool > ( 1 ) ) ; } virtual void UseOffScreenBuffersOff ( ) { this -> SetShowWindowUseOffScreenBuffers ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off erasing the screen between images. This allows multiple
##  exposure sequences if turned on. You will need to turn double
##  buffering off or make use of the SwapBuffers methods to prevent
##  you from swapping buffers between exposures.
##  virtual void SetShowWindowUseOffScreenBuffersErase ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Erase  to  << _arg ) ; if ( this -> Erase != _arg ) { this -> Erase = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetMappedShowWindowUseOffScreenBuffersErase ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Erase  of  << this -> Erase ) ; return this -> Erase ; } ; virtual void EraseOn ( ) { this -> SetShowWindowUseOffScreenBuffersErase ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void EraseOff ( ) { this -> SetShowWindowUseOffScreenBuffersErase ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Keep track of whether double buffering is on or off
##  virtual void SetShowWindowUseOffScreenBuffersEraseDoubleBuffer ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  DoubleBuffer  to  << _arg ) ; if ( this -> DoubleBuffer != _arg ) { this -> DoubleBuffer = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetMappedShowWindowUseOffScreenBuffersEraseDoubleBuffer ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DoubleBuffer  of  << this -> DoubleBuffer ) ; return this -> DoubleBuffer ; } ; virtual void DoubleBufferOn ( ) { this -> SetShowWindowUseOffScreenBuffersEraseDoubleBuffer ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void DoubleBufferOff ( ) { this -> SetShowWindowUseOffScreenBuffersEraseDoubleBuffer ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Get name of rendering window
##  virtual char * GetWindowName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << WindowName  of  << ( this -> WindowName ? this -> WindowName : (null) ) ) ; return this -> WindowName ; } ; virtual void SetWindowName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << WindowName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> WindowName == nullptr && _arg == nullptr ) { return ; } if ( this -> WindowName && _arg && ( ! strcmp ( this -> WindowName , _arg ) ) ) { return ; } delete [ ] this -> WindowName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> WindowName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> WindowName = nullptr ; } this -> Modified ( ) ; } ; /@} *
##  Set the icon used in title bar and task bar.
##  Currently implemented for OpenGL windows on Windows and Linux.
##  virtual void SetIcon ( vtkImageData * ) { } *
##  Ask each viewport owned by this Window to render its image and
##  synchronize this process.
##  virtual void Render ( ) { } *
##  Release any graphics resources that are being consumed by this texture.
##  The parameter window could be used to determine which graphic
##  resources to release.
##  virtual void ReleaseGraphicsResources ( vtkWindow * ) { } /@{ *
##  Get the pixel data of an image, transmitted as RGBRGBRGB. The
##  front argument indicates if the front buffer should be used or the back
##  buffer. It is the caller's responsibility to delete the resulting
##  array. It is very important to realize that the memory in this array
##  is organized from the bottom of the window to the top. The origin
##  of the screen is in the lower left corner. The y axis increases as
##  you go up the screen. So the storage of pixels is from left to right
##  and from bottom to top.
##  (x,y) is any corner of the rectangle. (x2,y2) is its opposite corner on
##  the diagonal.
##  virtual unsigned char * GetPixelData ( int x , int y , int x2 , int y2 , int front , int right = 0 ) { return nullptr ; } virtual int GetPixelData ( int x , int y , int x2 , int y2 , int front , vtkUnsignedCharArray * data , int right = 0 ) { return 0 ; } /@} /@{ *
##  Return a best estimate to the dots per inch of the display
##  device being rendered (or printed).
##  virtual int GetMappedShowWindowUseOffScreenBuffersEraseDoubleBufferDPI ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DPI  of  << this -> DPI ) ; return this -> DPI ; } ; virtual void SetDPI ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << DPI  to  << _arg ) ; if ( this -> DPI != ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> DPI = ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetDPIMinValue ( ) { return 1 ; } virtual int GetDPIMaxValue ( ) { return VTK_INT_MAX ; } ; /@} *
##  Attempt to detect and set the DPI of the display device by querying the
##  system. Note that this is not supported on most backends, and this method
##  will return false if the DPI could not be detected. Use GetDPI() to
##  inspect the detected value.
##  virtual bool DetectDPI ( ) { return false ; } /@{ *
##  Convenience to set SHowWindow and UseOffScreenBuffers in one call
##  void SetOffScreenRendering ( vtkTypeBool val ) { this -> SetShowWindow ( val == 0 ) ; this -> SetUseOffScreenBuffers ( val != 0 ) ; } virtual void OffScreenRenderingOn ( ) { this -> SetShowWindowUseOffScreenBuffersEraseDoubleBufferOffScreenRendering ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void OffScreenRenderingOff ( ) { this -> SetShowWindowUseOffScreenBuffersEraseDoubleBufferOffScreenRendering ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} *
##  Deprecated, directly use GetShowWindow and GetOffScreenBuffers
##  instead.
##  vtkTypeBool GetOffScreenRendering ( ) { return this -> GetShowWindow ( ) ? 0 : 1 ; } *
##  Make the window current. May be overridden in subclasses to do
##  for example a glXMakeCurrent or a wglMakeCurrent.
##  virtual void MakeCurrent ( ) { } *
##  Release the current context. May be overridden in subclasses to do
##  for example a glXMakeCurrent or a wglMakeCurrent.
##  virtual void ReleaseCurrent ( ) { } /@{ *
##  These methods are used by vtkWindowToImageFilter to tell a VTK window
##  to simulate a larger window by tiling. For 3D geometry these methods
##  have no impact. It is just in handling annotation that this information
##  must be available to the mappers and the coordinate calculations.
##  virtual void SetTileScale ( int _arg1 , int _arg2 ) { vtkDebugWithObjectMacro ( this , <<  setting  << TileScale  to ( << _arg1 << , << _arg2 << ) ) ; if ( ( this -> TileScale [ 0 ] != _arg1 ) || ( this -> TileScale [ 1 ] != _arg2 ) ) { this -> TileScale [ 0 ] = _arg1 ; this -> TileScale [ 1 ] = _arg2 ; this -> Modified ( ) ; } } void SetTileScale ( const int _arg [ 2 ] ) { this -> SetTileScale ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; virtual int * GetTileScale ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << TileScale  pointer  << this -> TileScale ) ; return this -> TileScale ; } VTK_WRAPEXCLUDE virtual void GetTileScale ( int & _arg1 , int & _arg2 ) { _arg1 = this -> TileScale [ 0 ] ; _arg2 = this -> TileScale [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << TileScale  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetTileScale ( int _arg [ 2 ] ) { this -> GetTileScale ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; void SetTileScale ( int s ) { this -> SetTileScale ( s , s ) ; } virtual void SetTileViewport ( double _arg1 , double _arg2 , double _arg3 , double _arg4 ) { vtkDebugWithObjectMacro ( this , <<  setting  << TileViewport  to ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << ) ) ; if ( ( this -> TileViewport [ 0 ] != _arg1 ) || ( this -> TileViewport [ 1 ] != _arg2 ) || ( this -> TileViewport [ 2 ] != _arg3 ) || ( this -> TileViewport [ 3 ] != _arg4 ) ) { this -> TileViewport [ 0 ] = _arg1 ; this -> TileViewport [ 1 ] = _arg2 ; this -> TileViewport [ 2 ] = _arg3 ; this -> TileViewport [ 3 ] = _arg4 ; this -> Modified ( ) ; } } virtual void SetTileViewport ( const double _arg [ 4 ] ) { this -> SetTileViewport ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] ) ; } ; virtual double * GetTileViewport ( ) VTK_SIZEHINT ( 4 ) { vtkDebugWithObjectMacro ( this , <<  returning  << TileViewport  pointer  << this -> TileViewport ) ; return this -> TileViewport ; } VTK_WRAPEXCLUDE virtual void GetTileViewport ( double & _arg1 , double & _arg2 , double & _arg3 , double & _arg4 ) { _arg1 = this -> TileViewport [ 0 ] ; _arg2 = this -> TileViewport [ 1 ] ; _arg3 = this -> TileViewport [ 2 ] ; _arg4 = this -> TileViewport [ 3 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << TileViewport  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetTileViewport ( double _arg [ 4 ] ) { this -> GetTileViewport ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] ) ; } ; /@} protected : vtkWindow ( ) ; ~ vtkWindow ( ) override ; char * WindowName ; int Size [ 2 ] ; int Position [ 2 ] ; vtkTypeBool Mapped ; bool ShowWindow ; bool UseOffScreenBuffers ; vtkTypeBool Erase ; vtkTypeBool DoubleBuffer ; int DPI ; double TileViewport [ 4 ] ; int TileSize [ 2 ] ; int TileScale [ 2 ] ; private : vtkWindow ( const vtkWindow & ) = delete ; void operator = ( const vtkWindow & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
