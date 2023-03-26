## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOutlineGlowPass.h
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
##  @class   vtkOutlineGlowPass
##  @brief   Renders a glowing outline using a image processing pass
##
##  Create a glowing outline of the image rendered by the delegate.
##
##  This render pass was designed to highlight parts of a scene by applying the render pass to a
##  layered renderer on top of the main scene. For optimal results, actors that form the outline
##  should be brightly colored with lighting disabled. The outline will have the color of the actors.
##  There is only one outline around all objects rendered by the delegate.
##
##  This pass expects an initialized depth buffer and color buffer.
##  Initialized buffers means they have been cleared with farthest z-value and
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
##  The image is first rendered to a full size offscreen render target, then blurred twice on a half
##  sized render target using Gaussian blur with an offset. The offset and the smaller render target
##  increase the size of the outline without incurring the cost of a big Gaussian blur kernel. The
##  implementation of the gaussian blur is similar to vtkGaussianBlurPass with the alterations
##  described above.
##
##  @sa
##  vtkRenderPass vtkGaussianBlurPass
##

import
  vtkImageProcessingPass, vtkRenderingOpenGL2Module

discard "forward decl of vtkOpenGLFramebufferObject"
discard "forward decl of vtkOpenGLHelper"
discard "forward decl of vtkTextureObject"
type
  vtkOutlineGlowPass* {.importcpp: "vtkOutlineGlowPass",
                       header: "vtkOutlineGlowPass.h", bycopy.} = object of vtkImageProcessingPass ## *
                                                                                            ##  Default constructor. DelegatePass is set to NULL.
                                                                                            ##
    vtkOutlineGlowPass* {.importc: "vtkOutlineGlowPass".}: VTK_NEWINSTANCE
    ##  render target for the original scene
    ##  render target for vertical blur
    ##  render target for horizontal blur
    ##  Shader programs
    ##  Default value of 3.0 gives a bright outline with a fading edge


proc New*(): ptr vtkOutlineGlowPass {.importcpp: "vtkOutlineGlowPass::New(@)",
                                  header: "vtkOutlineGlowPass.h".}
type
  vtkOutlineGlowPassSuperclass* = vtkImageProcessingPass

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOutlineGlowPass::IsTypeOf(@)", header: "vtkOutlineGlowPass.h".}
proc IsA*(this: var vtkOutlineGlowPass; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkOutlineGlowPass.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOutlineGlowPass {.
    importcpp: "vtkOutlineGlowPass::SafeDownCast(@)",
    header: "vtkOutlineGlowPass.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOutlineGlowPass :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageProcessingPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOutlineGlowPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOutlineGlowPass :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkOutlineGlowPass; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkOutlineGlowPass.h".}
proc Render*(this: var vtkOutlineGlowPass; s: ptr vtkRenderState) {.
    importcpp: "Render", header: "vtkOutlineGlowPass.h".}
proc ReleaseGraphicsResources*(this: var vtkOutlineGlowPass; w: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkOutlineGlowPass.h".}
## !!!Ignored construct:  *
##  Get/Set the intensity of the outline.
##  Default value is 3.0 which gives a bright outline with a fading edge
##  virtual float GetOutlineIntensityOutlineIntensity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutlineIntensity  of  << this -> OutlineIntensity ) ; return this -> OutlineIntensity ; } ;
## Error: expected ';'!!!

proc SetOutlineIntensity*(this: var vtkOutlineGlowPass; _arg: cfloat) {.
    importcpp: "SetOutlineIntensity", header: "vtkOutlineGlowPass.h".}