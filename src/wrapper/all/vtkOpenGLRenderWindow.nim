## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOpenGLRenderWindow.h
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
##  @class   vtkOpenGLRenderWindow
##  @brief   OpenGL rendering window
##
##  vtkOpenGLRenderWindow is a concrete implementation of the abstract class
##  vtkRenderWindow. vtkOpenGLRenderer interfaces to the OpenGL graphics
##  library. Application programmers should normally use vtkRenderWindow
##  instead of the OpenGL specific version.
##

import
  vtkDeprecation, vtkRect, vtkRenderWindow, vtkRenderingOpenGL2Module, vtkType

discard "forward decl of vtkIdList"
discard "forward decl of vtkOpenGLBufferObject"
discard "forward decl of vtkOpenGLFramebufferObject"
discard "forward decl of vtkOpenGLHardwareSupport"
discard "forward decl of vtkOpenGLQuadHelper"
discard "forward decl of vtkOpenGLShaderCache"
discard "forward decl of vtkOpenGLVertexBufferObjectCache"
discard "forward decl of vtkOpenGLVertexArrayObject"
discard "forward decl of vtkShaderProgram"
discard "forward decl of vtkStdString"
discard "forward decl of vtkTexture"
discard "forward decl of vtkTextureObject"
discard "forward decl of vtkTextureUnitManager"
discard "forward decl of vtkGenericOpenGLResourceFreeCallback"
discard "forward decl of vtkOpenGLState"
type
  vtkOpenGLRenderWindow* {.importcpp: "vtkOpenGLRenderWindow",
                          header: "vtkOpenGLRenderWindow.h", bycopy.} = object of vtkRenderWindow
    vtkOpenGLRenderWindow* {.importc: "vtkOpenGLRenderWindow".}: VTK_NEWINSTANCE
    Resources* {.importc: "Resources".}: set[
        ptr vtkGenericOpenGLResourceFreeCallback]
    ##  a FSQ we use to resolve MSAA that handles gamma
    ##  a FSQ we use to blit depth values
    ##  a FSQ we use to flip framebuffer texture
    ##  flip quad helpers Y tcoord
    ##  resolve and flip renderframebuffer as needed
    ##  when copying to displayframebuffer. Returns
    ##  true if the color buffer was copied.
    ##  used when we need to resolve a multisampled
    ##  framebuffer
    ## *
    ##  Create a not-off-screen window.
    ##
    ## *
    ##  Flag telling if the context has been created here or was inherited.
    ##
    ##  ensure glewinit has been called
    ##  Did glewInit initialize with a valid state?
    ##  used for fast quad rendering
    ##  noise texture
    ##  keep track of in case we need to recreate the framebuffer

  vtkOpenGLRenderWindowSuperclass* = vtkRenderWindow

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOpenGLRenderWindow::IsTypeOf(@)",
    header: "vtkOpenGLRenderWindow.h".}
proc IsA*(this: var vtkOpenGLRenderWindow; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkOpenGLRenderWindow.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOpenGLRenderWindow {.
    importcpp: "vtkOpenGLRenderWindow::SafeDownCast(@)",
    header: "vtkOpenGLRenderWindow.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOpenGLRenderWindow :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkRenderWindow :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOpenGLRenderWindow :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOpenGLRenderWindow :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkOpenGLRenderWindow; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkOpenGLRenderWindow.h".}
proc Start*(this: var vtkOpenGLRenderWindow) {.importcpp: "Start",
    header: "vtkOpenGLRenderWindow.h".}
proc Frame*(this: var vtkOpenGLRenderWindow) {.importcpp: "Frame",
    header: "vtkOpenGLRenderWindow.h".}
proc GetRenderingBackend*(this: var vtkOpenGLRenderWindow): cstring {.
    importcpp: "GetRenderingBackend", header: "vtkOpenGLRenderWindow.h".}
proc SetGlobalMaximumNumberOfMultiSamples*(val: cint) {.importcpp: "vtkOpenGLRenderWindow::SetGlobalMaximumNumberOfMultiSamples(@)",
    header: "vtkOpenGLRenderWindow.h".}
proc GetGlobalMaximumNumberOfMultiSamples*(): cint {.importcpp: "vtkOpenGLRenderWindow::GetGlobalMaximumNumberOfMultiSamples(@)",
    header: "vtkOpenGLRenderWindow.h".}
proc GetPixelData*(this: var vtkOpenGLRenderWindow; x: cint; y: cint; x2: cint; y2: cint;
                  front: cint; right: cint): ptr cuchar {.importcpp: "GetPixelData",
    header: "vtkOpenGLRenderWindow.h".}
proc GetPixelData*(this: var vtkOpenGLRenderWindow; x: cint; y: cint; x2: cint; y2: cint;
                  front: cint; data: ptr vtkUnsignedCharArray; right: cint): cint {.
    importcpp: "GetPixelData", header: "vtkOpenGLRenderWindow.h".}
proc SetPixelData*(this: var vtkOpenGLRenderWindow; x: cint; y: cint; x2: cint; y2: cint;
                  data: ptr cuchar; front: cint; right: cint): cint {.
    importcpp: "SetPixelData", header: "vtkOpenGLRenderWindow.h".}
proc SetPixelData*(this: var vtkOpenGLRenderWindow; x: cint; y: cint; x2: cint; y2: cint;
                  data: ptr vtkUnsignedCharArray; front: cint; right: cint): cint {.
    importcpp: "SetPixelData", header: "vtkOpenGLRenderWindow.h".}
proc GetRGBAPixelData*(this: var vtkOpenGLRenderWindow; x: cint; y: cint; x2: cint;
                      y2: cint; front: cint; right: cint = 0): ptr cfloat {.
    importcpp: "GetRGBAPixelData", header: "vtkOpenGLRenderWindow.h".}
proc GetRGBAPixelData*(this: var vtkOpenGLRenderWindow; x: cint; y: cint; x2: cint;
                      y2: cint; front: cint; data: ptr vtkFloatArray; right: cint = 0): cint {.
    importcpp: "GetRGBAPixelData", header: "vtkOpenGLRenderWindow.h".}
proc SetRGBAPixelData*(this: var vtkOpenGLRenderWindow; x: cint; y: cint; x2: cint;
                      y2: cint; data: ptr cfloat; front: cint; blend: cint = 0;
                      right: cint = 0): cint {.importcpp: "SetRGBAPixelData",
    header: "vtkOpenGLRenderWindow.h".}
proc SetRGBAPixelData*(this: var vtkOpenGLRenderWindow; x: cint; y: cint; x2: cint;
                      y2: cint; data: ptr vtkFloatArray; front: cint; blend: cint = 0;
                      right: cint = 0): cint {.importcpp: "SetRGBAPixelData",
    header: "vtkOpenGLRenderWindow.h".}
proc ReleaseRGBAPixelData*(this: var vtkOpenGLRenderWindow; data: ptr cfloat) {.
    importcpp: "ReleaseRGBAPixelData", header: "vtkOpenGLRenderWindow.h".}
proc GetRGBACharPixelData*(this: var vtkOpenGLRenderWindow; x: cint; y: cint; x2: cint;
                          y2: cint; front: cint; right: cint = 0): ptr cuchar {.
    importcpp: "GetRGBACharPixelData", header: "vtkOpenGLRenderWindow.h".}
proc GetRGBACharPixelData*(this: var vtkOpenGLRenderWindow; x: cint; y: cint; x2: cint;
                          y2: cint; front: cint; data: ptr vtkUnsignedCharArray;
                          right: cint = 0): cint {.importcpp: "GetRGBACharPixelData",
    header: "vtkOpenGLRenderWindow.h".}
proc SetRGBACharPixelData*(this: var vtkOpenGLRenderWindow; x: cint; y: cint; x2: cint;
                          y2: cint; data: ptr cuchar; front: cint; blend: cint = 0;
                          right: cint = 0): cint {.importcpp: "SetRGBACharPixelData",
    header: "vtkOpenGLRenderWindow.h".}
proc SetRGBACharPixelData*(this: var vtkOpenGLRenderWindow; x: cint; y: cint; x2: cint;
                          y2: cint; data: ptr vtkUnsignedCharArray; front: cint;
                          blend: cint = 0; right: cint = 0): cint {.
    importcpp: "SetRGBACharPixelData", header: "vtkOpenGLRenderWindow.h".}
proc GetZbufferData*(this: var vtkOpenGLRenderWindow; x1: cint; y1: cint; x2: cint;
                    y2: cint): ptr cfloat {.importcpp: "GetZbufferData",
                                        header: "vtkOpenGLRenderWindow.h".}
proc GetZbufferData*(this: var vtkOpenGLRenderWindow; x1: cint; y1: cint; x2: cint;
                    y2: cint; z: ptr cfloat): cint {.importcpp: "GetZbufferData",
    header: "vtkOpenGLRenderWindow.h".}
proc GetZbufferData*(this: var vtkOpenGLRenderWindow; x1: cint; y1: cint; x2: cint;
                    y2: cint; buffer: ptr vtkFloatArray): cint {.
    importcpp: "GetZbufferData", header: "vtkOpenGLRenderWindow.h".}
proc SetZbufferData*(this: var vtkOpenGLRenderWindow; x1: cint; y1: cint; x2: cint;
                    y2: cint; buffer: ptr cfloat): cint {.importcpp: "SetZbufferData",
    header: "vtkOpenGLRenderWindow.h".}
proc SetZbufferData*(this: var vtkOpenGLRenderWindow; x1: cint; y1: cint; x2: cint;
                    y2: cint; buffer: ptr vtkFloatArray): cint {.
    importcpp: "SetZbufferData", header: "vtkOpenGLRenderWindow.h".}
proc ActivateTexture*(this: var vtkOpenGLRenderWindow; a2: ptr vtkTextureObject) {.
    importcpp: "ActivateTexture", header: "vtkOpenGLRenderWindow.h".}
proc DeactivateTexture*(this: var vtkOpenGLRenderWindow; a2: ptr vtkTextureObject) {.
    importcpp: "DeactivateTexture", header: "vtkOpenGLRenderWindow.h".}
proc GetTextureUnitForTexture*(this: var vtkOpenGLRenderWindow;
                              a2: ptr vtkTextureObject): cint {.
    importcpp: "GetTextureUnitForTexture", header: "vtkOpenGLRenderWindow.h".}
proc GetDepthBufferSize*(this: var vtkOpenGLRenderWindow): cint {.
    importcpp: "GetDepthBufferSize", header: "vtkOpenGLRenderWindow.h".}
proc GetUsingSRGBColorSpace*(this: var vtkOpenGLRenderWindow): bool {.
    importcpp: "GetUsingSRGBColorSpace", header: "vtkOpenGLRenderWindow.h".}
proc GetColorBufferSizes*(this: var vtkOpenGLRenderWindow; rgba: ptr cint): cint {.
    importcpp: "GetColorBufferSizes", header: "vtkOpenGLRenderWindow.h".}
proc GetColorBufferInternalFormat*(this: var vtkOpenGLRenderWindow;
                                  attachmentPoint: cint): cint {.
    importcpp: "GetColorBufferInternalFormat", header: "vtkOpenGLRenderWindow.h".}
proc OpenGLInit*(this: var vtkOpenGLRenderWindow) {.importcpp: "OpenGLInit",
    header: "vtkOpenGLRenderWindow.h".}
proc OpenGLInitState*(this: var vtkOpenGLRenderWindow) {.
    importcpp: "OpenGLInitState", header: "vtkOpenGLRenderWindow.h".}
proc OpenGLInitContext*(this: var vtkOpenGLRenderWindow) {.
    importcpp: "OpenGLInitContext", header: "vtkOpenGLRenderWindow.h".}
proc GetOpenGLVersion*(this: var vtkOpenGLRenderWindow; major: var cint;
                      minor: var cint) {.importcpp: "GetOpenGLVersion",
                                      header: "vtkOpenGLRenderWindow.h".}
## !!!Ignored construct:  /@{ VTK_DEPRECATED_IN_9_1_0 ( Removed in 9.1, now always returns 0 ) unsigned int GetBackLeftBuffer ( ) ;
## Error: identifier expected, but got: Removed in 9.1, now always returns 0!!!

## !!!Ignored construct:  VTK_DEPRECATED_IN_9_1_0 ( Removed in 9.1, now always returns 0 ) unsigned int GetBackRightBuffer ( ) ;
## Error: identifier expected, but got: Removed in 9.1, now always returns 0!!!

## !!!Ignored construct:  VTK_DEPRECATED_IN_9_1_0 ( Removed in 9.1, now always returns 0 ) unsigned int GetFrontLeftBuffer ( ) ;
## Error: identifier expected, but got: Removed in 9.1, now always returns 0!!!

## !!!Ignored construct:  VTK_DEPRECATED_IN_9_1_0 ( Removed in 9.1, now always returns 0 ) unsigned int GetFrontRightBuffer ( ) ;
## Error: identifier expected, but got: Removed in 9.1, now always returns 0!!!

## !!!Ignored construct:  VTK_DEPRECATED_IN_9_1_0 ( Removed in 9.1, now always returns 0 ) unsigned int GetBackBuffer ( ) ;
## Error: identifier expected, but got: Removed in 9.1, now always returns 0!!!

## !!!Ignored construct:  VTK_DEPRECATED_IN_9_1_0 ( Removed in 9.1, now always returns 0 ) unsigned int GetFrontBuffer ( ) ;
## Error: identifier expected, but got: Removed in 9.1, now always returns 0!!!

proc GetContextCreationTime*(this: var vtkOpenGLRenderWindow): vtkMTimeType {.
    importcpp: "GetContextCreationTime", header: "vtkOpenGLRenderWindow.h".}
proc GetShaderCache*(this: var vtkOpenGLRenderWindow): ptr vtkOpenGLShaderCache {.
    importcpp: "GetShaderCache", header: "vtkOpenGLRenderWindow.h".}
proc GetVBOCache*(this: var vtkOpenGLRenderWindow): ptr vtkOpenGLVertexBufferObjectCache {.
    importcpp: "GetVBOCache", header: "vtkOpenGLRenderWindow.h".}
proc GetnameRenderFramebuffer*(this: var vtkOpenGLRenderWindow): ptr vtkOpenGLFramebufferObject {.
    importcpp: "GetnameRenderFramebuffer", header: "vtkOpenGLRenderWindow.h".}
## !!!Ignored construct:  VTK_DEPRECATED_IN_9_1_0 ( Removed in 9.1 ) vtkOpenGLFramebufferObject * GetOffScreenFramebuffer ( ) { return this -> RenderFramebuffer ; } /@} *
##  Returns the display framebuffer object.
##  virtual vtkOpenGLFramebufferObject * GetnameRenderFramebufferDisplayFramebuffer ( ) { vtkDebugWithObjectMacro ( this , <<  returning  DisplayFramebuffer  address  << static_cast < vtkOpenGLFramebufferObject * > ( this -> DisplayFramebuffer ) ) ; return this -> DisplayFramebuffer ; } ;
## Error: identifier expected, but got: Removed in 9.1!!!

proc GetTextureUnitManager*(this: var vtkOpenGLRenderWindow): ptr vtkTextureUnitManager {.
    importcpp: "GetTextureUnitManager", header: "vtkOpenGLRenderWindow.h".}
proc WaitForCompletion*(this: var vtkOpenGLRenderWindow) {.
    importcpp: "WaitForCompletion", header: "vtkOpenGLRenderWindow.h".}
proc DrawPixels*(this: var vtkOpenGLRenderWindow; x1: cint; y1: cint; x2: cint; y2: cint;
                numComponents: cint; dataType: cint; data: pointer) {.
    importcpp: "DrawPixels", header: "vtkOpenGLRenderWindow.h".}
proc DrawPixels*(this: var vtkOpenGLRenderWindow; dstXmin: cint; dstYmin: cint;
                dstXmax: cint; dstYmax: cint; srcXmin: cint; srcYmin: cint;
                srcXmax: cint; srcYmax: cint; srcWidth: cint; srcHeight: cint;
                numComponents: cint; dataType: cint; data: pointer) {.
    importcpp: "DrawPixels", header: "vtkOpenGLRenderWindow.h".}
proc DrawPixels*(this: var vtkOpenGLRenderWindow; srcWidth: cint; srcHeight: cint;
                numComponents: cint; dataType: cint; data: pointer) {.
    importcpp: "DrawPixels", header: "vtkOpenGLRenderWindow.h".}
proc GetMaximumHardwareLineWidth*(this: var vtkOpenGLRenderWindow): cfloat {.
    importcpp: "GetMaximumHardwareLineWidth", header: "vtkOpenGLRenderWindow.h".}
proc IsPointSpriteBugPresent*(this: var vtkOpenGLRenderWindow): bool {.
    importcpp: "IsPointSpriteBugPresent", header: "vtkOpenGLRenderWindow.h".}
proc GetDefaultTextureInternalFormat*(this: var vtkOpenGLRenderWindow;
                                     vtktype: cint; numComponents: cint;
                                     needInteger: bool; needFloat: bool;
                                     needSRGB: bool): cint {.
    importcpp: "GetDefaultTextureInternalFormat",
    header: "vtkOpenGLRenderWindow.h".}
proc GetOpenGLSupportMessage*(this: var vtkOpenGLRenderWindow): string {.
    importcpp: "GetOpenGLSupportMessage", header: "vtkOpenGLRenderWindow.h".}
proc SupportsOpenGL*(this: var vtkOpenGLRenderWindow): cint {.
    importcpp: "SupportsOpenGL", header: "vtkOpenGLRenderWindow.h".}
proc ReportCapabilities*(this: var vtkOpenGLRenderWindow): cstring {.
    importcpp: "ReportCapabilities", header: "vtkOpenGLRenderWindow.h".}
proc Initialize*(this: var vtkOpenGLRenderWindow) {.importcpp: "Initialize",
    header: "vtkOpenGLRenderWindow.h".}
proc RegisterGraphicsResources*(this: var vtkOpenGLRenderWindow;
                               cb: ptr vtkGenericOpenGLResourceFreeCallback) {.
    importcpp: "RegisterGraphicsResources", header: "vtkOpenGLRenderWindow.h".}
proc UnregisterGraphicsResources*(this: var vtkOpenGLRenderWindow;
                                 cb: ptr vtkGenericOpenGLResourceFreeCallback) {.
    importcpp: "UnregisterGraphicsResources", header: "vtkOpenGLRenderWindow.h".}
proc PushContext*(this: var vtkOpenGLRenderWindow) {.importcpp: "PushContext",
    header: "vtkOpenGLRenderWindow.h".}
proc PopContext*(this: var vtkOpenGLRenderWindow) {.importcpp: "PopContext",
    header: "vtkOpenGLRenderWindow.h".}
proc InitializeFromCurrentContext*(this: var vtkOpenGLRenderWindow): bool {.
    importcpp: "InitializeFromCurrentContext", header: "vtkOpenGLRenderWindow.h".}
proc SetSwapControl*(this: var vtkOpenGLRenderWindow; a2: cint): bool {.
    importcpp: "SetSwapControl", header: "vtkOpenGLRenderWindow.h".}
proc GetState*(this: var vtkOpenGLRenderWindow): ptr vtkOpenGLState {.
    importcpp: "GetState", header: "vtkOpenGLRenderWindow.h".}
proc GetTQuad2DVBO*(this: var vtkOpenGLRenderWindow): ptr vtkOpenGLBufferObject {.
    importcpp: "GetTQuad2DVBO", header: "vtkOpenGLRenderWindow.h".}
proc GetNoiseTextureUnit*(this: var vtkOpenGLRenderWindow): cint {.
    importcpp: "GetNoiseTextureUnit", header: "vtkOpenGLRenderWindow.h".}
proc End*(this: var vtkOpenGLRenderWindow) {.importcpp: "End",
    header: "vtkOpenGLRenderWindow.h".}
proc Render*(this: var vtkOpenGLRenderWindow) {.importcpp: "Render",
    header: "vtkOpenGLRenderWindow.h".}
proc StereoMidpoint*(this: var vtkOpenGLRenderWindow) {.importcpp: "StereoMidpoint",
    header: "vtkOpenGLRenderWindow.h".}
proc GetBufferNeedsResolving*(this: var vtkOpenGLRenderWindow): bool {.
    importcpp: "GetBufferNeedsResolving", header: "vtkOpenGLRenderWindow.h".}
proc ReleaseGraphicsResources*(this: var vtkOpenGLRenderWindow; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkOpenGLRenderWindow.h".}
proc BlitDisplayFramebuffer*(this: var vtkOpenGLRenderWindow) {.
    importcpp: "BlitDisplayFramebuffer", header: "vtkOpenGLRenderWindow.h".}
proc BlitDisplayFramebuffer*(this: var vtkOpenGLRenderWindow; right: cint; srcX: cint;
                            srcY: cint; srcWidth: cint; srcHeight: cint; destX: cint;
                            destY: cint; destWidth: cint; destHeight: cint;
                            bufferMode: cint; interpolation: cint) {.
    importcpp: "BlitDisplayFramebuffer", header: "vtkOpenGLRenderWindow.h".}
proc BlitToRenderFramebuffer*(this: var vtkOpenGLRenderWindow; includeDepth: bool) {.
    importcpp: "BlitToRenderFramebuffer", header: "vtkOpenGLRenderWindow.h".}
proc BlitToRenderFramebuffer*(this: var vtkOpenGLRenderWindow; srcX: cint; srcY: cint;
                             srcWidth: cint; srcHeight: cint; destX: cint;
                             destY: cint; destWidth: cint; destHeight: cint;
                             bufferMode: cint; interpolation: cint) {.
    importcpp: "BlitToRenderFramebuffer", header: "vtkOpenGLRenderWindow.h".}
type
  vtkOpenGLRenderWindowFrameBlitModes* {.size: sizeof(cint), importcpp: "vtkOpenGLRenderWindow::FrameBlitModes",
                                        header: "vtkOpenGLRenderWindow.h".} = enum
    BlitToHardware,           ##  hardware buffers
    BlitToCurrent,            ##  currently bound draw framebuffer
    NoBlit                    ##  no blit, GUI or external code will handle the blit


proc SetFrameBlitMode*(this: var vtkOpenGLRenderWindow;
                      _arg: vtkOpenGLRenderWindowFrameBlitModes) {.
    importcpp: "SetFrameBlitMode", header: "vtkOpenGLRenderWindow.h".}
proc GetFrameBlitModeMinValue*(this: var vtkOpenGLRenderWindow): vtkOpenGLRenderWindowFrameBlitModes {.
    importcpp: "GetFrameBlitModeMinValue", header: "vtkOpenGLRenderWindow.h".}
proc GetFrameBlitModeMaxValue*(this: var vtkOpenGLRenderWindow): vtkOpenGLRenderWindowFrameBlitModes {.
    importcpp: "GetFrameBlitModeMaxValue", header: "vtkOpenGLRenderWindow.h".}
## !!!Ignored construct:  virtual FrameBlitModes GetFrameBlitMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FrameBlitMode  of  << this -> FrameBlitMode ) ; return this -> FrameBlitMode ; } ;
## Error: expected ';'!!!

proc SetFrameBlitModeToBlitToHardware*(this: var vtkOpenGLRenderWindow) {.
    importcpp: "SetFrameBlitModeToBlitToHardware",
    header: "vtkOpenGLRenderWindow.h".}
proc SetFrameBlitModeToBlitToCurrent*(this: var vtkOpenGLRenderWindow) {.
    importcpp: "SetFrameBlitModeToBlitToCurrent",
    header: "vtkOpenGLRenderWindow.h".}
proc SetFrameBlitModeToNoBlit*(this: var vtkOpenGLRenderWindow) {.
    importcpp: "SetFrameBlitModeToNoBlit", header: "vtkOpenGLRenderWindow.h".}
proc SetFramebufferFlipY*(this: var vtkOpenGLRenderWindow; _arg: bool) {.
    importcpp: "SetFramebufferFlipY", header: "vtkOpenGLRenderWindow.h".}
## !!!Ignored construct:  virtual bool GetFrameBlitModeFramebufferFlipY ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FramebufferFlipY  of  << this -> FramebufferFlipY ) ; return this -> FramebufferFlipY ; } ;
## Error: expected ';'!!!

proc FramebufferFlipYOn*(this: var vtkOpenGLRenderWindow) {.
    importcpp: "FramebufferFlipYOn", header: "vtkOpenGLRenderWindow.h".}
proc FramebufferFlipYOff*(this: var vtkOpenGLRenderWindow) {.
    importcpp: "FramebufferFlipYOff", header: "vtkOpenGLRenderWindow.h".}
  ## /@}
  ## /@{
  ##  copy depth values from a source framebuffer to a destination framebuffer
  ##  using texture maps to do the copy. The source framebufferobject must be texture
  ##  backed. This method is designed to work around issues with trying to blit depth
  ##  values between framebuffers that have different depth formats.
  ##  blit entire source texture to active viewport
proc TextureDepthBlit*(this: var vtkOpenGLRenderWindow; source: ptr vtkTextureObject) {.
    importcpp: "TextureDepthBlit", header: "vtkOpenGLRenderWindow.h".}
proc TextureDepthBlit*(this: var vtkOpenGLRenderWindow;
                      source: ptr vtkTextureObject; srcX: cint; srcY: cint;
                      srcX2: cint; srcY2: cint) {.importcpp: "TextureDepthBlit",
    header: "vtkOpenGLRenderWindow.h".}
proc TextureDepthBlit*(this: var vtkOpenGLRenderWindow;
                      source: ptr vtkTextureObject; srcX: cint; srcY: cint;
                      srcX2: cint; srcY2: cint; destX: cint; destY: cint; destX2: cint;
                      destY2: cint) {.importcpp: "TextureDepthBlit",
                                    header: "vtkOpenGLRenderWindow.h".}