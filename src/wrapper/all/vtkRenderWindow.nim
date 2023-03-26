## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRenderWindow.h
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
##  @class   vtkRenderWindow
##  @brief   create a window for renderers to draw into
##
##  vtkRenderWindow is an abstract object to specify the behavior of a
##  rendering window. A rendering window is a window in a graphical user
##  interface where renderers draw their images. Methods are provided to
##  synchronize the rendering process, set window size, and control double
##  buffering.  The window also allows rendering in stereo.  The interlaced
##  render stereo type is for output to a VRex stereo projector.  All of the
##  odd horizontal lines are from the left eye, and the even lines are from
##  the right eye.  The user has to make the render window aligned with the
##  VRex projector, or the eye will be swapped.
##
##  @warning
##  In VTK versions 4 and later, the vtkWindowToImageFilter class is
##  part of the canonical way to output an image of a window to a file
##  (replacing the obsolete SaveImageAsPPM method for vtkRenderWindows
##  that existed in 3.2 and earlier).  Connect one of these filters to
##  the output of the window, and filter's output to a writer such as
##  vtkPNGWriter.
##
##  @sa
##  vtkRenderer vtkRenderWindowInteractor vtkWindowToImageFilter
##

import
  vtkDeprecation, vtkEventData, vtkNew, vtkRenderingCoreModule, vtkSmartPointer,
  vtkWindow

discard "forward decl of vtkFloatArray"
discard "forward decl of vtkProp"
discard "forward decl of vtkCollection"
discard "forward decl of vtkMatrix4x4"
discard "forward decl of vtkRenderTimerLog"
discard "forward decl of vtkRenderWindowInteractor"
discard "forward decl of vtkRenderer"
discard "forward decl of vtkRendererCollection"
discard "forward decl of vtkStereoCompositor"
discard "forward decl of vtkUnsignedCharArray"
const
  VTK_STEREO_CRYSTAL_EYES* = 1
  VTK_STEREO_RED_BLUE* = 2
  VTK_STEREO_INTERLACED* = 3
  VTK_STEREO_LEFT* = 4
  VTK_STEREO_RIGHT* = 5
  VTK_STEREO_DRESDEN* = 6
  VTK_STEREO_ANAGLYPH* = 7
  VTK_STEREO_CHECKERBOARD* = 8
  VTK_STEREO_SPLITVIEWPORT_HORIZONTAL* = 9
  VTK_STEREO_FAKE* = 10
  VTK_STEREO_EMULATE* = 11
  VTK_CURSOR_DEFAULT* = 0
  VTK_CURSOR_ARROW* = 1
  VTK_CURSOR_SIZENE* = 2
  VTK_CURSOR_SIZENW* = 3
  VTK_CURSOR_SIZESW* = 4
  VTK_CURSOR_SIZESE* = 5
  VTK_CURSOR_SIZENS* = 6
  VTK_CURSOR_SIZEWE* = 7
  VTK_CURSOR_SIZEALL* = 8
  VTK_CURSOR_HAND* = 9
  VTK_CURSOR_CROSSHAIR* = 10
  VTK_CURSOR_CUSTOM* = 11

type
  vtkRenderWindow* {.importcpp: "vtkRenderWindow", header: "vtkRenderWindow.h",
                    bycopy.} = object of vtkWindow
    vtkRenderWindow* {.importc: "vtkRenderWindow".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    ##  used for red blue stereo
    ## *
    ##  The universal time since the last abort check occurred.
    ##

  vtkRenderWindowSuperclass* = vtkWindow

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkRenderWindow::IsTypeOf(@)", header: "vtkRenderWindow.h".}
proc IsA*(this: var vtkRenderWindow; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkRenderWindow.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkRenderWindow {.
    importcpp: "vtkRenderWindow::SafeDownCast(@)", header: "vtkRenderWindow.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkRenderWindow :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWindow :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRenderWindow :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRenderWindow :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkRenderWindow; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkRenderWindow.h".}
proc New*(): ptr vtkRenderWindow {.importcpp: "vtkRenderWindow::New(@)",
                               header: "vtkRenderWindow.h".}
proc AddRenderer*(this: var vtkRenderWindow; a2: ptr vtkRenderer) {.
    importcpp: "AddRenderer", header: "vtkRenderWindow.h".}
proc RemoveRenderer*(this: var vtkRenderWindow; a2: ptr vtkRenderer) {.
    importcpp: "RemoveRenderer", header: "vtkRenderWindow.h".}
proc HasRenderer*(this: var vtkRenderWindow; a2: ptr vtkRenderer): cint {.
    importcpp: "HasRenderer", header: "vtkRenderWindow.h".}
proc GetRenderLibrary*(): cstring {.importcpp: "vtkRenderWindow::GetRenderLibrary(@)",
                                 header: "vtkRenderWindow.h".}
proc GetRenderingBackend*(this: var vtkRenderWindow): cstring {.
    importcpp: "GetRenderingBackend", header: "vtkRenderWindow.h".}
proc GetRenderTimer*(this: var vtkRenderWindow): ptr vtkRenderTimerLog {.
    importcpp: "GetRenderTimer", header: "vtkRenderWindow.h".}
  ## *
  ##  Return the collection of renderers in the render window.
  ##
proc GetRenderers*(this: var vtkRenderWindow): ptr vtkRendererCollection {.
    importcpp: "GetRenderers", header: "vtkRenderWindow.h".}
proc CaptureGL2PSSpecialProps*(this: var vtkRenderWindow;
                              specialProps: ptr vtkCollection) {.
    importcpp: "CaptureGL2PSSpecialProps", header: "vtkRenderWindow.h".}
## !!!Ignored construct:  /@{ *
##  Returns true if the render process is capturing text actors.
##  virtual int GetCapturingGL2PSSpecialPropsCapturingGL2PSSpecialProps ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CapturingGL2PSSpecialProps  of  << this -> CapturingGL2PSSpecialProps ) ; return this -> CapturingGL2PSSpecialProps ; } ;
## Error: expected ';'!!!

proc Render*(this: var vtkRenderWindow) {.importcpp: "Render",
                                      header: "vtkRenderWindow.h".}
proc Start*(this: var vtkRenderWindow) {.importcpp: "Start",
                                     header: "vtkRenderWindow.h".}
proc End*(this: var vtkRenderWindow) {.importcpp: "End", header: "vtkRenderWindow.h".}
  ## *
  ##  Finalize the rendering process.
  ##
proc Finalize*(this: var vtkRenderWindow) {.importcpp: "Finalize",
                                        header: "vtkRenderWindow.h".}
proc Frame*(this: var vtkRenderWindow) {.importcpp: "Frame",
                                     header: "vtkRenderWindow.h".}
proc WaitForCompletion*(this: var vtkRenderWindow) {.importcpp: "WaitForCompletion",
    header: "vtkRenderWindow.h".}
proc CopyResultFrame*(this: var vtkRenderWindow) {.importcpp: "CopyResultFrame",
    header: "vtkRenderWindow.h".}
proc MakeRenderWindowInteractor*(this: var vtkRenderWindow): ptr vtkRenderWindowInteractor {.
    importcpp: "MakeRenderWindowInteractor", header: "vtkRenderWindow.h".}
proc HideCursor*(this: var vtkRenderWindow) {.importcpp: "HideCursor",
    header: "vtkRenderWindow.h".}
proc ShowCursor*(this: var vtkRenderWindow) {.importcpp: "ShowCursor",
    header: "vtkRenderWindow.h".}
proc SetCursorPosition*(this: var vtkRenderWindow; a2: cint; a3: cint) {.
    importcpp: "SetCursorPosition", header: "vtkRenderWindow.h".}
proc SetCurrentCursor*(this: var vtkRenderWindow; _arg: cint) {.
    importcpp: "SetCurrentCursor", header: "vtkRenderWindow.h".}
## !!!Ignored construct:  virtual int GetCapturingGL2PSSpecialPropsCapturingGL2PSSpecialPropsCurrentCursor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CurrentCursor  of  << this -> CurrentCursor ) ; return this -> CurrentCursor ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Set/Get the full path to the custom cursor.
##  This is used when the current cursor is set to VTK_CURSOR_CUSTOM.
##  virtual void SetCursorFileNameCursorFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << CursorFileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> CursorFileName == nullptr && _arg == nullptr ) { return ; } if ( this -> CursorFileName && _arg && ( ! strcmp ( this -> CursorFileName , _arg ) ) ) { return ; } delete [ ] this -> CursorFileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> CursorFileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> CursorFileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetCursorFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CursorFileName  of  << ( this -> CursorFileName ? this -> CursorFileName : (null) ) ) ; return this -> CursorFileName ; } ;
## Error: expected ';'!!!

proc SetFullScreen*(this: var vtkRenderWindow; a2: vtkTypeBool) {.
    importcpp: "SetFullScreen", header: "vtkRenderWindow.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetCapturingGL2PSSpecialPropsCapturingGL2PSSpecialPropsCurrentCursorFullScreen ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FullScreen  of  << this -> FullScreen ) ; return this -> FullScreen ; } ;
## Error: expected ';'!!!

proc FullScreenOn*(this: var vtkRenderWindow) {.importcpp: "FullScreenOn",
    header: "vtkRenderWindow.h".}
proc FullScreenOff*(this: var vtkRenderWindow) {.importcpp: "FullScreenOff",
    header: "vtkRenderWindow.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off window manager borders. Typically, you shouldn't turn the
  ##  borders off, because that bypasses the window manager and can cause
  ##  undesirable behavior.
  ##
proc SetCurrentCursorBorders*(this: var vtkRenderWindow; _arg: vtkTypeBool) {.
    importcpp: "SetCurrentCursorBorders", header: "vtkRenderWindow.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetCapturingGL2PSSpecialPropsCapturingGL2PSSpecialPropsCurrentCursorFullScreenBorders ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Borders  of  << this -> Borders ) ; return this -> Borders ; } ;
## Error: expected ';'!!!

proc BordersOn*(this: var vtkRenderWindow) {.importcpp: "BordersOn",
    header: "vtkRenderWindow.h".}
proc BordersOff*(this: var vtkRenderWindow) {.importcpp: "BordersOff",
    header: "vtkRenderWindow.h".}
  ## /@}
  ## /@{
  ## *
  ##  Prescribe that the window be created in a stereo-capable mode. This
  ##  method must be called before the window is realized. Default is off.
  ##
## !!!Ignored construct:  virtual vtkTypeBool GetCapturingGL2PSSpecialPropsCapturingGL2PSSpecialPropsCurrentCursorFullScreenBordersStereoCapableWindow ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << StereoCapableWindow  of  << this -> StereoCapableWindow ) ; return this -> StereoCapableWindow ; } ;
## Error: expected ';'!!!

proc StereoCapableWindowOn*(this: var vtkRenderWindow) {.
    importcpp: "StereoCapableWindowOn", header: "vtkRenderWindow.h".}
proc StereoCapableWindowOff*(this: var vtkRenderWindow) {.
    importcpp: "StereoCapableWindowOff", header: "vtkRenderWindow.h".}
proc SetStereoCapableWindow*(this: var vtkRenderWindow; capable: vtkTypeBool) {.
    importcpp: "SetStereoCapableWindow", header: "vtkRenderWindow.h".}
## !!!Ignored construct:  /@} /@{ *
##  Turn on/off stereo rendering.
##  virtual vtkTypeBool GetCapturingGL2PSSpecialPropsCapturingGL2PSSpecialPropsCurrentCursorFullScreenBordersStereoCapableWindowStereoRenderStereoRender ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << StereoRender  of  << this -> StereoRender ) ; return this -> StereoRender ; } ;
## Error: expected ';'!!!

proc SetStereoRender*(this: var vtkRenderWindow; stereo: vtkTypeBool) {.
    importcpp: "SetStereoRender", header: "vtkRenderWindow.h".}
proc StereoRenderOn*(this: var vtkRenderWindow) {.importcpp: "StereoRenderOn",
    header: "vtkRenderWindow.h".}
proc StereoRenderOff*(this: var vtkRenderWindow) {.importcpp: "StereoRenderOff",
    header: "vtkRenderWindow.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off the use of alpha bitplanes.
  ##
proc SetCurrentCursorBordersAlphaBitPlanes*(this: var vtkRenderWindow;
    _arg: vtkTypeBool) {.importcpp: "SetCurrentCursorBordersAlphaBitPlanes",
                       header: "vtkRenderWindow.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetCapturingGL2PSSpecialPropsCapturingGL2PSSpecialPropsCurrentCursorFullScreenBordersStereoCapableWindowStereoRenderStereoRenderAlphaBitPlanes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AlphaBitPlanes  of  << this -> AlphaBitPlanes ) ; return this -> AlphaBitPlanes ; } ;
## Error: expected ';'!!!

proc AlphaBitPlanesOn*(this: var vtkRenderWindow) {.importcpp: "AlphaBitPlanesOn",
    header: "vtkRenderWindow.h".}
proc AlphaBitPlanesOff*(this: var vtkRenderWindow) {.importcpp: "AlphaBitPlanesOff",
    header: "vtkRenderWindow.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off point smoothing. Default is off.
  ##  This must be applied before the first Render.
  ##
proc SetCurrentCursorBordersAlphaBitPlanesPointSmoothing*(
    this: var vtkRenderWindow; _arg: vtkTypeBool) {.
    importcpp: "SetCurrentCursorBordersAlphaBitPlanesPointSmoothing",
    header: "vtkRenderWindow.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetCapturingGL2PSSpecialPropsCapturingGL2PSSpecialPropsCurrentCursorFullScreenBordersStereoCapableWindowStereoRenderStereoRenderAlphaBitPlanesPointSmoothing ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PointSmoothing  of  << this -> PointSmoothing ) ; return this -> PointSmoothing ; } ;
## Error: expected ';'!!!

proc PointSmoothingOn*(this: var vtkRenderWindow) {.importcpp: "PointSmoothingOn",
    header: "vtkRenderWindow.h".}
proc PointSmoothingOff*(this: var vtkRenderWindow) {.importcpp: "PointSmoothingOff",
    header: "vtkRenderWindow.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off line smoothing. Default is off.
  ##  This must be applied before the first Render.
  ##
proc SetCurrentCursorBordersAlphaBitPlanesPointSmoothingLineSmoothing*(
    this: var vtkRenderWindow; _arg: vtkTypeBool) {.importcpp: "SetCurrentCursorBordersAlphaBitPlanesPointSmoothingLineSmoothing",
    header: "vtkRenderWindow.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetCapturingGL2PSSpecialPropsCapturingGL2PSSpecialPropsCurrentCursorFullScreenBordersStereoCapableWindowStereoRenderStereoRenderAlphaBitPlanesPointSmoothingLineSmoothing ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LineSmoothing  of  << this -> LineSmoothing ) ; return this -> LineSmoothing ; } ;
## Error: expected ';'!!!

proc LineSmoothingOn*(this: var vtkRenderWindow) {.importcpp: "LineSmoothingOn",
    header: "vtkRenderWindow.h".}
proc LineSmoothingOff*(this: var vtkRenderWindow) {.importcpp: "LineSmoothingOff",
    header: "vtkRenderWindow.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off polygon smoothing. Default is off.
  ##  This must be applied before the first Render.
  ##
proc SetCurrentCursorBordersAlphaBitPlanesPointSmoothingLineSmoothingPolygonSmoothing*(
    this: var vtkRenderWindow; _arg: vtkTypeBool) {.importcpp: "SetCurrentCursorBordersAlphaBitPlanesPointSmoothingLineSmoothingPolygonSmoothing",
    header: "vtkRenderWindow.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetCapturingGL2PSSpecialPropsCapturingGL2PSSpecialPropsCurrentCursorFullScreenBordersStereoCapableWindowStereoRenderStereoRenderAlphaBitPlanesPointSmoothingLineSmoothingPolygonSmoothing ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PolygonSmoothing  of  << this -> PolygonSmoothing ) ; return this -> PolygonSmoothing ; } ;
## Error: expected ';'!!!

proc PolygonSmoothingOn*(this: var vtkRenderWindow) {.
    importcpp: "PolygonSmoothingOn", header: "vtkRenderWindow.h".}
proc PolygonSmoothingOff*(this: var vtkRenderWindow) {.
    importcpp: "PolygonSmoothingOff", header: "vtkRenderWindow.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get what type of stereo rendering to use.  CrystalEyes
  ##  mode uses frame-sequential capabilities available in OpenGL
  ##  to drive LCD shutter glasses and stereo projectors.  RedBlue
  ##  mode is a simple type of stereo for use with red-blue glasses.
  ##  Anaglyph mode is a superset of RedBlue mode, but the color
  ##  output channels can be configured using the AnaglyphColorMask
  ##  and the color of the original image can be (somewhat) maintained
  ##  using AnaglyphColorSaturation;  the default colors for Anaglyph
  ##  mode is red-cyan.  Interlaced stereo mode produces a composite
  ##  image where horizontal lines alternate between left and right
  ##  views.  StereoLeft and StereoRight modes choose one or the other
  ##  stereo view.  Dresden mode is yet another stereoscopic
  ##  interleaving. Fake simply causes the window to render twice without
  ##  actually swapping the camera from left eye to right eye. This is useful in
  ##  certain applications that want to emulate the rendering passes without
  ##  actually rendering in stereo mode. Emulate is similar to Fake, except that
  ##  it does render left and right eye. There is no compositing of the resulting
  ##  images from the two eyes at the end of each render in this mode, hence the
  ##  result onscreen will be the right eye.
  ##
## !!!Ignored construct:  virtual int GetCapturingGL2PSSpecialPropsCapturingGL2PSSpecialPropsCurrentCursorFullScreenBordersStereoCapableWindowStereoRenderStereoRenderAlphaBitPlanesPointSmoothingLineSmoothingPolygonSmoothingStereoType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << StereoType  of  << this -> StereoType ) ; return this -> StereoType ; } ;
## Error: expected ';'!!!

proc SetStereoType*(this: var vtkRenderWindow; a2: cint) {.importcpp: "SetStereoType",
    header: "vtkRenderWindow.h".}
proc SetStereoTypeToCrystalEyes*(this: var vtkRenderWindow) {.
    importcpp: "SetStereoTypeToCrystalEyes", header: "vtkRenderWindow.h".}
proc SetStereoTypeToRedBlue*(this: var vtkRenderWindow) {.
    importcpp: "SetStereoTypeToRedBlue", header: "vtkRenderWindow.h".}
proc SetStereoTypeToInterlaced*(this: var vtkRenderWindow) {.
    importcpp: "SetStereoTypeToInterlaced", header: "vtkRenderWindow.h".}
proc SetStereoTypeToLeft*(this: var vtkRenderWindow) {.
    importcpp: "SetStereoTypeToLeft", header: "vtkRenderWindow.h".}
proc SetStereoTypeToRight*(this: var vtkRenderWindow) {.
    importcpp: "SetStereoTypeToRight", header: "vtkRenderWindow.h".}
proc SetStereoTypeToDresden*(this: var vtkRenderWindow) {.
    importcpp: "SetStereoTypeToDresden", header: "vtkRenderWindow.h".}
proc SetStereoTypeToAnaglyph*(this: var vtkRenderWindow) {.
    importcpp: "SetStereoTypeToAnaglyph", header: "vtkRenderWindow.h".}
proc SetStereoTypeToCheckerboard*(this: var vtkRenderWindow) {.
    importcpp: "SetStereoTypeToCheckerboard", header: "vtkRenderWindow.h".}
proc SetStereoTypeToSplitViewportHorizontal*(this: var vtkRenderWindow) {.
    importcpp: "SetStereoTypeToSplitViewportHorizontal",
    header: "vtkRenderWindow.h".}
proc SetStereoTypeToFake*(this: var vtkRenderWindow) {.
    importcpp: "SetStereoTypeToFake", header: "vtkRenderWindow.h".}
proc SetStereoTypeToEmulate*(this: var vtkRenderWindow) {.
    importcpp: "SetStereoTypeToEmulate", header: "vtkRenderWindow.h".}
proc GetStereoTypeAsString*(this: var vtkRenderWindow): cstring {.
    importcpp: "GetStereoTypeAsString", header: "vtkRenderWindow.h".}
proc GetStereoTypeAsString*(`type`: cint): cstring {.
    importcpp: "vtkRenderWindow::GetStereoTypeAsString(@)",
    header: "vtkRenderWindow.h".}
proc StereoUpdate*(this: var vtkRenderWindow) {.importcpp: "StereoUpdate",
    header: "vtkRenderWindow.h".}
proc StereoMidpoint*(this: var vtkRenderWindow) {.importcpp: "StereoMidpoint",
    header: "vtkRenderWindow.h".}
proc StereoRenderComplete*(this: var vtkRenderWindow) {.
    importcpp: "StereoRenderComplete", header: "vtkRenderWindow.h".}
proc SetAnaglyphColorSaturation*(this: var vtkRenderWindow; _arg: cfloat) {.
    importcpp: "SetAnaglyphColorSaturation", header: "vtkRenderWindow.h".}
proc GetAnaglyphColorSaturationMinValue*(this: var vtkRenderWindow): cfloat {.
    importcpp: "GetAnaglyphColorSaturationMinValue", header: "vtkRenderWindow.h".}
proc GetAnaglyphColorSaturationMaxValue*(this: var vtkRenderWindow): cfloat {.
    importcpp: "GetAnaglyphColorSaturationMaxValue", header: "vtkRenderWindow.h".}
## !!!Ignored construct:  virtual float GetCapturingGL2PSSpecialPropsCapturingGL2PSSpecialPropsCurrentCursorFullScreenBordersStereoCapableWindowStereoRenderStereoRenderAlphaBitPlanesPointSmoothingLineSmoothingPolygonSmoothingStereoTypeAnaglyphColorSaturation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AnaglyphColorSaturation  of  << this -> AnaglyphColorSaturation ) ; return this -> AnaglyphColorSaturation ; } ;
## Error: expected ';'!!!

proc SetAnaglyphColorMask*(this: var vtkRenderWindow; _arg1: cint; _arg2: cint) {.
    importcpp: "SetAnaglyphColorMask", header: "vtkRenderWindow.h".}
proc SetAnaglyphColorMask*(this: var vtkRenderWindow; _arg: array[2, cint]) {.
    importcpp: "SetAnaglyphColorMask", header: "vtkRenderWindow.h".}
## !!!Ignored construct:  virtual int * GetAnaglyphColorMask ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << AnaglyphColorMask  pointer  << this -> AnaglyphColorMask ) ; return this -> AnaglyphColorMask ; } VTK_WRAPEXCLUDE virtual void GetAnaglyphColorMask ( int data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> AnaglyphColorMask [ i ] ; } } ;
## Error: expected ';'!!!

proc WindowRemap*(this: var vtkRenderWindow) {.importcpp: "WindowRemap",
    header: "vtkRenderWindow.h".}
proc SetCurrentCursorBordersAlphaBitPlanesPointSmoothingLineSmoothingPolygonSmoothingSwapBuffers*(
    this: var vtkRenderWindow; _arg: vtkTypeBool) {.importcpp: "SetCurrentCursorBordersAlphaBitPlanesPointSmoothingLineSmoothingPolygonSmoothingSwapBuffers",
    header: "vtkRenderWindow.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetCapturingGL2PSSpecialPropsCapturingGL2PSSpecialPropsCurrentCursorFullScreenBordersStereoCapableWindowStereoRenderStereoRenderAlphaBitPlanesPointSmoothingLineSmoothingPolygonSmoothingStereoTypeAnaglyphColorSaturationSwapBuffers ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SwapBuffers  of  << this -> SwapBuffers ) ; return this -> SwapBuffers ; } ;
## Error: expected ';'!!!

proc SwapBuffersOn*(this: var vtkRenderWindow) {.importcpp: "SwapBuffersOn",
    header: "vtkRenderWindow.h".}
proc SwapBuffersOff*(this: var vtkRenderWindow) {.importcpp: "SwapBuffersOff",
    header: "vtkRenderWindow.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the pixel data of an image, transmitted as RGBRGBRGB. The
  ##  front argument indicates if the front buffer should be used or the back
  ##  buffer. It is the caller's responsibility to delete the resulting
  ##  array. It is very important to realize that the memory in this array
  ##  is organized from the bottom of the window to the top. The origin
  ##  of the screen is in the lower left corner. The y axis increases as
  ##  you go up the screen. So the storage of pixels is from left to right
  ##  and from bottom to top.
  ##  (x,y) is any corner of the rectangle. (x2,y2) is its opposite corner on
  ##  the diagonal.
  ##
proc SetPixelData*(this: var vtkRenderWindow; a2: cint; a3: cint; a4: cint; a5: cint; a6: ptr cuchar; ## data
                  a7: cint; a8: cint = 0): cint {.importcpp: "SetPixelData",
    header: "vtkRenderWindow.h".}
proc SetPixelData*(this: var vtkRenderWindow; a2: cint; a3: cint; a4: cint; a5: cint; a6: ptr vtkUnsignedCharArray; ## data
                  a7: cint; a8: cint = 0): cint {.importcpp: "SetPixelData",
    header: "vtkRenderWindow.h".}
proc GetRGBAPixelData*(this: var vtkRenderWindow; a2: cint; a3: cint; a4: cint; a5: cint;
                      a6: cint; a7: cint = 0): ptr cfloat {.
    importcpp: "GetRGBAPixelData", header: "vtkRenderWindow.h".}
proc GetRGBAPixelData*(this: var vtkRenderWindow; a2: cint; a3: cint; a4: cint; a5: cint;
                      a6: cint; a7: ptr vtkFloatArray; ## data
                      a8: cint = 0): cint {.importcpp: "GetRGBAPixelData",
                                       header: "vtkRenderWindow.h".}
proc SetRGBAPixelData*(this: var vtkRenderWindow; a2: cint; a3: cint; a4: cint; a5: cint;
                      a6: ptr cfloat; a7: cint; a8: cint = 0; a9: cint = 0): cint {.
    importcpp: "SetRGBAPixelData", header: "vtkRenderWindow.h".}
proc SetRGBAPixelData*(this: var vtkRenderWindow; a2: cint; a3: cint; a4: cint; a5: cint;
                      a6: ptr vtkFloatArray; a7: cint; a8: cint = 0; a9: cint = 0): cint {.
    importcpp: "SetRGBAPixelData", header: "vtkRenderWindow.h".}
proc ReleaseRGBAPixelData*(this: var vtkRenderWindow; a2: ptr cfloat) {.
    importcpp: "ReleaseRGBAPixelData", header: "vtkRenderWindow.h".}
  ## data
proc GetRGBACharPixelData*(this: var vtkRenderWindow; a2: cint; a3: cint; a4: cint;
                          a5: cint; a6: cint; a7: cint = 0): ptr cuchar {.
    importcpp: "GetRGBACharPixelData", header: "vtkRenderWindow.h".}
proc GetRGBACharPixelData*(this: var vtkRenderWindow; a2: cint; a3: cint; a4: cint;
                          a5: cint; a6: cint; a7: ptr vtkUnsignedCharArray; ## data
                          a8: cint = 0): cint {.importcpp: "GetRGBACharPixelData",
    header: "vtkRenderWindow.h".}
proc SetRGBACharPixelData*(this: var vtkRenderWindow; a2: cint; a3: cint; a4: cint;
                          a5: cint; a6: ptr cuchar; ## data
                          a7: cint; a8: cint = 0; a9: cint = 0): cint {.
    importcpp: "SetRGBACharPixelData", header: "vtkRenderWindow.h".}
proc SetRGBACharPixelData*(this: var vtkRenderWindow; a2: cint; a3: cint; a4: cint;
                          a5: cint; a6: ptr vtkUnsignedCharArray; ## data
                          a7: cint; a8: cint = 0; a9: cint = 0): cint {.
    importcpp: "SetRGBACharPixelData", header: "vtkRenderWindow.h".}
proc GetZbufferData*(this: var vtkRenderWindow; a2: cint; a3: cint; a4: cint; a5: cint): ptr cfloat {.
    importcpp: "GetZbufferData", header: "vtkRenderWindow.h".}
proc GetZbufferData*(this: var vtkRenderWindow; a2: cint; a3: cint; a4: cint; a5: cint; a6: ptr cfloat): cint {.
    importcpp: "GetZbufferData", header: "vtkRenderWindow.h".}
  ## z
proc GetZbufferData*(this: var vtkRenderWindow; a2: cint; a3: cint; a4: cint; a5: cint; a6: ptr vtkFloatArray): cint {.
    importcpp: "GetZbufferData", header: "vtkRenderWindow.h".}
  ## z
proc SetZbufferData*(this: var vtkRenderWindow; a2: cint; a3: cint; a4: cint; a5: cint; a6: ptr cfloat): cint {.
    importcpp: "SetZbufferData", header: "vtkRenderWindow.h".}
  ## z
proc SetZbufferData*(this: var vtkRenderWindow; a2: cint; a3: cint; a4: cint; a5: cint; a6: ptr vtkFloatArray): cint {.
    importcpp: "SetZbufferData", header: "vtkRenderWindow.h".}
  ## z
proc GetZbufferDataAtPoint*(this: var vtkRenderWindow; x: cint; y: cint): cfloat {.
    importcpp: "GetZbufferDataAtPoint", header: "vtkRenderWindow.h".}
## !!!Ignored construct:  /@} /@{ *
##  This flag is set if the window hasn't rendered since it was created
##  virtual int GetCapturingGL2PSSpecialPropsCapturingGL2PSSpecialPropsCurrentCursorFullScreenBordersStereoCapableWindowStereoRenderStereoRenderAlphaBitPlanesPointSmoothingLineSmoothingPolygonSmoothingStereoTypeAnaglyphColorSaturationSwapBuffersNeverRenderedNeverRendered ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NeverRendered  of  << this -> NeverRendered ) ; return this -> NeverRendered ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  This is a flag that can be set to interrupt a rendering that is in
##  progress.
##  virtual int GetCapturingGL2PSSpecialPropsCapturingGL2PSSpecialPropsCurrentCursorFullScreenBordersStereoCapableWindowStereoRenderStereoRenderAlphaBitPlanesPointSmoothingLineSmoothingPolygonSmoothingStereoTypeAnaglyphColorSaturationSwapBuffersNeverRenderedNeverRenderedAbortRenderAbortRender ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AbortRender  of  << this -> AbortRender ) ; return this -> AbortRender ; } ;
## Error: expected ';'!!!

proc SetCurrentCursorBordersAlphaBitPlanesPointSmoothingLineSmoothingPolygonSmoothingSwapBuffersAbortRender*(
    this: var vtkRenderWindow; _arg: cint) {.importcpp: "SetCurrentCursorBordersAlphaBitPlanesPointSmoothingLineSmoothingPolygonSmoothingSwapBuffersAbortRender",
                                        header: "vtkRenderWindow.h".}
## !!!Ignored construct:  virtual int GetCapturingGL2PSSpecialPropsCapturingGL2PSSpecialPropsCurrentCursorFullScreenBordersStereoCapableWindowStereoRenderStereoRenderAlphaBitPlanesPointSmoothingLineSmoothingPolygonSmoothingStereoTypeAnaglyphColorSaturationSwapBuffersNeverRenderedNeverRenderedAbortRenderAbortRenderInAbortCheck ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InAbortCheck  of  << this -> InAbortCheck ) ; return this -> InAbortCheck ; } ;
## Error: expected ';'!!!

proc SetCurrentCursorBordersAlphaBitPlanesPointSmoothingLineSmoothingPolygonSmoothingSwapBuffersAbortRenderInAbortCheck*(
    this: var vtkRenderWindow; _arg: cint) {.importcpp: "SetCurrentCursorBordersAlphaBitPlanesPointSmoothingLineSmoothingPolygonSmoothingSwapBuffersAbortRenderInAbortCheck",
                                        header: "vtkRenderWindow.h".}
proc CheckAbortStatus*(this: var vtkRenderWindow): cint {.
    importcpp: "CheckAbortStatus", header: "vtkRenderWindow.h".}
proc GetEventPending*(this: var vtkRenderWindow): vtkTypeBool {.
    importcpp: "GetEventPending", header: "vtkRenderWindow.h".}
proc CheckInRenderStatus*(this: var vtkRenderWindow): cint {.
    importcpp: "CheckInRenderStatus", header: "vtkRenderWindow.h".}
proc ClearInRenderStatus*(this: var vtkRenderWindow) {.
    importcpp: "ClearInRenderStatus", header: "vtkRenderWindow.h".}
proc SetDesiredUpdateRate*(this: var vtkRenderWindow; a2: cdouble) {.
    importcpp: "SetDesiredUpdateRate", header: "vtkRenderWindow.h".}
## !!!Ignored construct:  virtual double GetCapturingGL2PSSpecialPropsCapturingGL2PSSpecialPropsCurrentCursorFullScreenBordersStereoCapableWindowStereoRenderStereoRenderAlphaBitPlanesPointSmoothingLineSmoothingPolygonSmoothingStereoTypeAnaglyphColorSaturationSwapBuffersNeverRenderedNeverRenderedAbortRenderAbortRenderInAbortCheckDesiredUpdateRate ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DesiredUpdateRate  of  << this -> DesiredUpdateRate ) ; return this -> DesiredUpdateRate ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get the number of layers for renderers.  Each renderer should have
##  its layer set individually.  Some algorithms iterate through all layers,
##  so it is not wise to set the number of layers to be exorbitantly large
##  (say bigger than 100).
##  virtual int GetCapturingGL2PSSpecialPropsCapturingGL2PSSpecialPropsCurrentCursorFullScreenBordersStereoCapableWindowStereoRenderStereoRenderAlphaBitPlanesPointSmoothingLineSmoothingPolygonSmoothingStereoTypeAnaglyphColorSaturationSwapBuffersNeverRenderedNeverRenderedAbortRenderAbortRenderInAbortCheckDesiredUpdateRateNumberOfLayersNumberOfLayers ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfLayers  of  << this -> NumberOfLayers ) ; return this -> NumberOfLayers ; } ;
## Error: expected ';'!!!

proc SetAnaglyphColorSaturationNumberOfLayers*(this: var vtkRenderWindow; _arg: cint) {.
    importcpp: "SetAnaglyphColorSaturationNumberOfLayers",
    header: "vtkRenderWindow.h".}
proc GetAnaglyphColorSaturationMinValueNumberOfLayersMinValue*(
    this: var vtkRenderWindow): cint {.importcpp: "GetAnaglyphColorSaturationMinValueNumberOfLayersMinValue",
                                   header: "vtkRenderWindow.h".}
proc GetAnaglyphColorSaturationMaxValueNumberOfLayersMaxValue*(
    this: var vtkRenderWindow): cint {.importcpp: "GetAnaglyphColorSaturationMaxValueNumberOfLayersMaxValue",
                                   header: "vtkRenderWindow.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the interactor associated with this render window
  ##
proc GetnameInteractor*(this: var vtkRenderWindow): ptr vtkRenderWindowInteractor {.
    importcpp: "GetnameInteractor", header: "vtkRenderWindow.h".}
  ## /@}
  ## *
  ##  Set the interactor to the render window
  ##
proc SetInteractor*(this: var vtkRenderWindow; a2: ptr vtkRenderWindowInteractor) {.
    importcpp: "SetInteractor", header: "vtkRenderWindow.h".}
proc UnRegister*(this: var vtkRenderWindow; o: ptr vtkObjectBase) {.
    importcpp: "UnRegister", header: "vtkRenderWindow.h".}
proc SetDisplayId*(this: var vtkRenderWindow; a2: pointer) {.
    importcpp: "SetDisplayId", header: "vtkRenderWindow.h".}
proc SetWindowId*(this: var vtkRenderWindow; a2: pointer) {.importcpp: "SetWindowId",
    header: "vtkRenderWindow.h".}
proc SetNextWindowId*(this: var vtkRenderWindow; a2: pointer) {.
    importcpp: "SetNextWindowId", header: "vtkRenderWindow.h".}
proc SetParentId*(this: var vtkRenderWindow; a2: pointer) {.importcpp: "SetParentId",
    header: "vtkRenderWindow.h".}
proc GetGenericDisplayId*(this: var vtkRenderWindow): pointer {.
    importcpp: "GetGenericDisplayId", header: "vtkRenderWindow.h".}
proc GetGenericWindowId*(this: var vtkRenderWindow): pointer {.
    importcpp: "GetGenericWindowId", header: "vtkRenderWindow.h".}
proc GetGenericParentId*(this: var vtkRenderWindow): pointer {.
    importcpp: "GetGenericParentId", header: "vtkRenderWindow.h".}
proc GetGenericContext*(this: var vtkRenderWindow): pointer {.
    importcpp: "GetGenericContext", header: "vtkRenderWindow.h".}
proc GetGenericDrawable*(this: var vtkRenderWindow): pointer {.
    importcpp: "GetGenericDrawable", header: "vtkRenderWindow.h".}
proc SetWindowInfo*(this: var vtkRenderWindow; a2: cstring) {.
    importcpp: "SetWindowInfo", header: "vtkRenderWindow.h".}
proc SetNextWindowInfo*(this: var vtkRenderWindow; a2: cstring) {.
    importcpp: "SetNextWindowInfo", header: "vtkRenderWindow.h".}
proc SetParentInfo*(this: var vtkRenderWindow; a2: cstring) {.
    importcpp: "SetParentInfo", header: "vtkRenderWindow.h".}
proc InitializeFromCurrentContext*(this: var vtkRenderWindow): bool {.
    importcpp: "InitializeFromCurrentContext", header: "vtkRenderWindow.h".}
proc SetSharedRenderWindow*(this: var vtkRenderWindow; a2: ptr vtkRenderWindow) {.
    importcpp: "SetSharedRenderWindow", header: "vtkRenderWindow.h".}
proc GetnameInteractorSharedRenderWindow*(this: var vtkRenderWindow): ptr vtkRenderWindow {.
    importcpp: "GetnameInteractorSharedRenderWindow", header: "vtkRenderWindow.h".}
proc GetPlatformSupportsRenderWindowSharing*(this: var vtkRenderWindow): bool {.
    importcpp: "GetPlatformSupportsRenderWindowSharing",
    header: "vtkRenderWindow.h".}
proc IsCurrent*(this: var vtkRenderWindow): bool {.importcpp: "IsCurrent",
    header: "vtkRenderWindow.h".}
## !!!Ignored construct:  *
##  Test if the window has a valid drawable. This is
##  currently only an issue on Mac OS X Cocoa where rendering
##  to an invalid drawable results in all OpenGL calls to fail
##  with "invalid framebuffer operation".
##  VTK_DEPRECATED_IN_9_1_0 ( Deprecated in 9.1 because no one knows what it's for and nothing uses it ) virtual bool IsDrawable ( ) ;
## Error: identifier expected, but got: Deprecated in 9.1 because no one knows what it's for and nothing uses it!!!

proc SetForceMakeCurrent*(this: var vtkRenderWindow) {.
    importcpp: "SetForceMakeCurrent", header: "vtkRenderWindow.h".}
proc ReportCapabilities*(this: var vtkRenderWindow): cstring {.
    importcpp: "ReportCapabilities", header: "vtkRenderWindow.h".}
proc SupportsOpenGL*(this: var vtkRenderWindow): cint {.importcpp: "SupportsOpenGL",
    header: "vtkRenderWindow.h".}
proc IsDirect*(this: var vtkRenderWindow): vtkTypeBool {.importcpp: "IsDirect",
    header: "vtkRenderWindow.h".}
proc GetDepthBufferSize*(this: var vtkRenderWindow): cint {.
    importcpp: "GetDepthBufferSize", header: "vtkRenderWindow.h".}
proc GetColorBufferSizes*(this: var vtkRenderWindow; a2: ptr cint): cint {.
    importcpp: "GetColorBufferSizes", header: "vtkRenderWindow.h".}
  ## rgba
proc SetMultiSamples*(this: var vtkRenderWindow; a2: cint) {.
    importcpp: "SetMultiSamples", header: "vtkRenderWindow.h".}
## !!!Ignored construct:  virtual int GetCapturingGL2PSSpecialPropsCapturingGL2PSSpecialPropsCurrentCursorFullScreenBordersStereoCapableWindowStereoRenderStereoRenderAlphaBitPlanesPointSmoothingLineSmoothingPolygonSmoothingStereoTypeAnaglyphColorSaturationSwapBuffersNeverRenderedNeverRenderedAbortRenderAbortRenderInAbortCheckDesiredUpdateRateNumberOfLayersNumberOfLayersMultiSamples ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MultiSamples  of  << this -> MultiSamples ) ; return this -> MultiSamples ; } ;
## Error: expected ';'!!!

proc SetCurrentCursorBordersAlphaBitPlanesPointSmoothingLineSmoothingPolygonSmoothingSwapBuffersAbortRenderInAbortCheckStencilCapable*(
    this: var vtkRenderWindow; _arg: vtkTypeBool) {.importcpp: "SetCurrentCursorBordersAlphaBitPlanesPointSmoothingLineSmoothingPolygonSmoothingSwapBuffersAbortRenderInAbortCheckStencilCapable",
    header: "vtkRenderWindow.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetCapturingGL2PSSpecialPropsCapturingGL2PSSpecialPropsCurrentCursorFullScreenBordersStereoCapableWindowStereoRenderStereoRenderAlphaBitPlanesPointSmoothingLineSmoothingPolygonSmoothingStereoTypeAnaglyphColorSaturationSwapBuffersNeverRenderedNeverRenderedAbortRenderAbortRenderInAbortCheckDesiredUpdateRateNumberOfLayersNumberOfLayersMultiSamplesStencilCapable ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << StencilCapable  of  << this -> StencilCapable ) ; return this -> StencilCapable ; } ;
## Error: expected ';'!!!

proc StencilCapableOn*(this: var vtkRenderWindow) {.importcpp: "StencilCapableOn",
    header: "vtkRenderWindow.h".}
proc StencilCapableOff*(this: var vtkRenderWindow) {.importcpp: "StencilCapableOff",
    header: "vtkRenderWindow.h".}
  ## /@}
  ## /@{
  ## *
  ##  If there are several graphics card installed on a system,
  ##  this index can be used to specify which card you want to render to.
  ##  the default is 0. This may not work on all derived render window and
  ##  it may need to be set before the first render.
  ##
proc SetCurrentCursorBordersAlphaBitPlanesPointSmoothingLineSmoothingPolygonSmoothingSwapBuffersAbortRenderInAbortCheckStencilCapableDeviceIndex*(
    this: var vtkRenderWindow; _arg: cint) {.importcpp: "SetCurrentCursorBordersAlphaBitPlanesPointSmoothingLineSmoothingPolygonSmoothingSwapBuffersAbortRenderInAbortCheckStencilCapableDeviceIndex",
                                        header: "vtkRenderWindow.h".}
## !!!Ignored construct:  virtual int GetCapturingGL2PSSpecialPropsCapturingGL2PSSpecialPropsCurrentCursorFullScreenBordersStereoCapableWindowStereoRenderStereoRenderAlphaBitPlanesPointSmoothingLineSmoothingPolygonSmoothingStereoTypeAnaglyphColorSaturationSwapBuffersNeverRenderedNeverRenderedAbortRenderAbortRenderInAbortCheckDesiredUpdateRateNumberOfLayersNumberOfLayersMultiSamplesStencilCapableDeviceIndex ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DeviceIndex  of  << this -> DeviceIndex ) ; return this -> DeviceIndex ; } ;
## Error: expected ';'!!!

proc GetNumberOfDevices*(this: var vtkRenderWindow): cint {.
    importcpp: "GetNumberOfDevices", header: "vtkRenderWindow.h".}
## !!!Ignored construct:  /@{ *
##  Set/Get if we want this window to use the sRGB color space.
##  Some hardware/drivers do not fully support this.
##  virtual bool GetCapturingGL2PSSpecialPropsCapturingGL2PSSpecialPropsCurrentCursorFullScreenBordersStereoCapableWindowStereoRenderStereoRenderAlphaBitPlanesPointSmoothingLineSmoothingPolygonSmoothingStereoTypeAnaglyphColorSaturationSwapBuffersNeverRenderedNeverRenderedAbortRenderAbortRenderInAbortCheckDesiredUpdateRateNumberOfLayersNumberOfLayersMultiSamplesStencilCapableDeviceIndexUseSRGBColorSpaceUseSRGBColorSpace ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseSRGBColorSpace  of  << this -> UseSRGBColorSpace ) ; return this -> UseSRGBColorSpace ; } ;
## Error: expected ';'!!!

proc SetCurrentCursorBordersAlphaBitPlanesPointSmoothingLineSmoothingPolygonSmoothingSwapBuffersAbortRenderInAbortCheckStencilCapableDeviceIndexUseSRGBColorSpace*(
    this: var vtkRenderWindow; _arg: bool) {.importcpp: "SetCurrentCursorBordersAlphaBitPlanesPointSmoothingLineSmoothingPolygonSmoothingSwapBuffersAbortRenderInAbortCheckStencilCapableDeviceIndexUseSRGBColorSpace",
                                        header: "vtkRenderWindow.h".}
proc UseSRGBColorSpaceOn*(this: var vtkRenderWindow) {.
    importcpp: "UseSRGBColorSpaceOn", header: "vtkRenderWindow.h".}
proc UseSRGBColorSpaceOff*(this: var vtkRenderWindow) {.
    importcpp: "UseSRGBColorSpaceOff", header: "vtkRenderWindow.h".}
  ## /@}
  ## *
  ##  Get physical to world transform matrix. Some subclasses may define a
  ##  Physical coordinate system such as in VR. This method provides access
  ##  to the matrix mapping that space to world coordinates.
  ##
proc GetPhysicalToWorldMatrix*(this: var vtkRenderWindow; matrix: ptr vtkMatrix4x4) {.
    importcpp: "GetPhysicalToWorldMatrix", header: "vtkRenderWindow.h".}
proc GetDeviceToWorldMatrixForDevice*(this: var vtkRenderWindow;
                                     device: vtkEventDataDevice;
                                     deviceToWorldMatrix: ptr vtkMatrix4x4): bool {.
    importcpp: "GetDeviceToWorldMatrixForDevice", header: "vtkRenderWindow.h".}