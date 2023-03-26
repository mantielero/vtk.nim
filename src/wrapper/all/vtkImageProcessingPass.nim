## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageProcessingPass.h
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
##  @class   vtkImageProcessingPass
##  @brief   Convenient class for post-processing passes.
##  render pass.
##
##  Abstract class with some convenient methods frequently used in subclasses.
##
##
##  @sa
##  vtkOpenGLRenderPass vtkGaussianBlurPass vtkSobelGradientMagnitudePass
##

import
  vtkOpenGLRenderPass, vtkRenderingOpenGL2Module

discard "forward decl of vtkOpenGLRenderWindow"
discard "forward decl of vtkDepthPeelingPassLayerList"
discard "forward decl of vtkOpenGLFramebufferObject"
discard "forward decl of vtkTextureObject"
type
  vtkImageProcessingPass* {.importcpp: "vtkImageProcessingPass",
                           header: "vtkImageProcessingPass.h", bycopy.} = object of vtkOpenGLRenderPass ## *
                                                                                                 ##  Default constructor. DelegatePass is set to NULL.
                                                                                                 ##
    vtkImageProcessingPass* {.importc: "vtkImageProcessingPass".}: VTK_NEWINSTANCE

  vtkImageProcessingPassSuperclass* = vtkOpenGLRenderPass

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageProcessingPass::IsTypeOf(@)",
    header: "vtkImageProcessingPass.h".}
proc IsA*(this: var vtkImageProcessingPass; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageProcessingPass.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageProcessingPass {.
    importcpp: "vtkImageProcessingPass::SafeDownCast(@)",
    header: "vtkImageProcessingPass.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageProcessingPass :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkOpenGLRenderPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageProcessingPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageProcessingPass :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageProcessingPass; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageProcessingPass.h".}
proc ReleaseGraphicsResources*(this: var vtkImageProcessingPass; w: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkImageProcessingPass.h".}
proc GetnameDelegatePass*(this: var vtkImageProcessingPass): ptr vtkRenderPass {.
    importcpp: "GetnameDelegatePass", header: "vtkImageProcessingPass.h".}
proc SetDelegatePass*(this: var vtkImageProcessingPass;
                     delegatePass: ptr vtkRenderPass) {.
    importcpp: "SetDelegatePass", header: "vtkImageProcessingPass.h".}