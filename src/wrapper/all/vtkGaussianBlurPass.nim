## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGaussianBlurPass.h
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
##  @class   vtkGaussianBlurPass
##  @brief   Implement a post-processing Gaussian blur
##  render pass.
##
##  Blur the image rendered by its delegate. Blurring uses a Gaussian low-pass
##  filter with a 5x5 kernel.
##
##  This pass expects an initialized depth buffer and color buffer.
##  Initialized buffers means they have been cleared with farest z-value and
##  background color/gradient/transparent color.
##  An opaque pass may have been performed right after the initialization.
##
##  The delegate is used once.
##
##  Its delegate is usually set to a vtkCameraPass or to a post-processing pass.
##
##  This pass requires a OpenGL context that supports texture objects (TO),
##  framebuffer objects (FBO) and GLSL. If not, it will emit an error message
##  and will render its delegate and return.
##
##  @par Implementation:
##  As the filter is separable, it first blurs the image horizontally and then
##  vertically. This reduces the number of texture sampling to 5 per pass.
##  In addition, as texture sampling can already blend texel values in linear
##  mode, by adjusting the texture coordinate accordingly, only 3 texture
##  sampling are actually necessary.
##  Reference: OpenGL Bloom Toturial by Philip Rideout, section
##  Exploit Hardware Filtering  http://prideout.net/bloom/index.php#Sneaky
##
##  @sa
##  vtkRenderPass
##

import
  vtkImageProcessingPass, vtkRenderingOpenGL2Module

discard "forward decl of vtkDepthPeelingPassLayerList"
discard "forward decl of vtkOpenGLFramebufferObject"
discard "forward decl of vtkOpenGLHelper"
discard "forward decl of vtkOpenGLRenderWindow"
discard "forward decl of vtkTextureObject"
type
  vtkGaussianBlurPass* {.importcpp: "vtkGaussianBlurPass",
                        header: "vtkGaussianBlurPass.h", bycopy.} = object of vtkImageProcessingPass ## *
                                                                                              ##  Default constructor. DelegatePass is set to NULL.
                                                                                              ##
    vtkGaussianBlurPass* {.importc: "vtkGaussianBlurPass".}: VTK_NEWINSTANCE
    ##  render target for the scene
    ##  render target for the horizontal pass
    ##  Structures for the various cell types we render.


proc New*(): ptr vtkGaussianBlurPass {.importcpp: "vtkGaussianBlurPass::New(@)",
                                   header: "vtkGaussianBlurPass.h".}
type
  vtkGaussianBlurPassSuperclass* = vtkImageProcessingPass

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGaussianBlurPass::IsTypeOf(@)", header: "vtkGaussianBlurPass.h".}
proc IsA*(this: var vtkGaussianBlurPass; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkGaussianBlurPass.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGaussianBlurPass {.
    importcpp: "vtkGaussianBlurPass::SafeDownCast(@)",
    header: "vtkGaussianBlurPass.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGaussianBlurPass :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageProcessingPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGaussianBlurPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGaussianBlurPass :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGaussianBlurPass; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGaussianBlurPass.h".}
proc Render*(this: var vtkGaussianBlurPass; s: ptr vtkRenderState) {.
    importcpp: "Render", header: "vtkGaussianBlurPass.h".}
proc ReleaseGraphicsResources*(this: var vtkGaussianBlurPass; w: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkGaussianBlurPass.h".}