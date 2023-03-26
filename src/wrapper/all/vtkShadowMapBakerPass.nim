## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkShadowMapBakerPass.h
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
##  @class   vtkShadowMapBakerPass
##  @brief   Implement a builder of shadow map pass.
##
##  Bake a list of shadow maps, once per spot light.
##  It work in conjunction with the vtkShadowMapPass, which uses the
##  shadow maps for rendering the opaque geometry (a technique to render hard
##  shadows in hardware).
##
##  This pass expects an initialized depth buffer and color buffer.
##  Initialized buffers means they have been cleared with farest z-value and
##  background color/gradient/transparent color.
##  An opaque pass may have been performed right after the initialization.
##
##
##
##  Its delegate is usually set to a vtkOpaquePass.
##
##  @par Implementation:
##  The first pass of the algorithm is to generate a shadow map per light
##  (depth map from the light point of view) by rendering the opaque objects
##
##  @sa
##  vtkRenderPass, vtkOpaquePass, vtkShadowMapPass
##

import
  vtkOpenGLRenderPass, vtkRenderingOpenGL2Module, vtkSmartPointer

discard "forward decl of vtkOpenGLRenderWindow"
discard "forward decl of vtkInformationIntegerKey"
discard "forward decl of vtkCamera"
discard "forward decl of vtkLight"
discard "forward decl of vtkOpenGLFramebufferObject"
discard "forward decl of vtkTextureObject"
type
  vtkShadowMapBakerPass* {.importcpp: "vtkShadowMapBakerPass",
                          header: "vtkShadowMapBakerPass.h", bycopy.} = object of vtkOpenGLRenderPass ## *
                                                                                               ##  Default constructor. DelegatetPass is set to NULL.
                                                                                               ##
    vtkShadowMapBakerPass* {.importc: "vtkShadowMapBakerPass".}: VTK_NEWINSTANCE
    ## *
    ##  Graphics resources.
    ##


proc New*(): ptr vtkShadowMapBakerPass {.importcpp: "vtkShadowMapBakerPass::New(@)",
                                     header: "vtkShadowMapBakerPass.h".}
type
  vtkShadowMapBakerPassSuperclass* = vtkOpenGLRenderPass

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkShadowMapBakerPass::IsTypeOf(@)",
    header: "vtkShadowMapBakerPass.h".}
proc IsA*(this: var vtkShadowMapBakerPass; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkShadowMapBakerPass.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkShadowMapBakerPass {.
    importcpp: "vtkShadowMapBakerPass::SafeDownCast(@)",
    header: "vtkShadowMapBakerPass.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkShadowMapBakerPass :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkOpenGLRenderPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkShadowMapBakerPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkShadowMapBakerPass :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkShadowMapBakerPass; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkShadowMapBakerPass.h".}
proc Render*(this: var vtkShadowMapBakerPass; s: ptr vtkRenderState) {.
    importcpp: "Render", header: "vtkShadowMapBakerPass.h".}
proc ReleaseGraphicsResources*(this: var vtkShadowMapBakerPass; w: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkShadowMapBakerPass.h".}
proc GetnameOpaqueSequence*(this: var vtkShadowMapBakerPass): ptr vtkRenderPass {.
    importcpp: "GetnameOpaqueSequence", header: "vtkShadowMapBakerPass.h".}
proc SetOpaqueSequence*(this: var vtkShadowMapBakerPass;
                       opaqueSequence: ptr vtkRenderPass) {.
    importcpp: "SetOpaqueSequence", header: "vtkShadowMapBakerPass.h".}
proc GetnameOpaqueSequenceCompositeZPass*(this: var vtkShadowMapBakerPass): ptr vtkRenderPass {.
    importcpp: "GetnameOpaqueSequenceCompositeZPass",
    header: "vtkShadowMapBakerPass.h".}
proc SetCompositeZPass*(this: var vtkShadowMapBakerPass;
                       compositeZPass: ptr vtkRenderPass) {.
    importcpp: "SetCompositeZPass", header: "vtkShadowMapBakerPass.h".}
proc SetResolution*(this: var vtkShadowMapBakerPass; _arg: cuint) {.
    importcpp: "SetResolution", header: "vtkShadowMapBakerPass.h".}
## !!!Ignored construct:  virtual unsigned int GetResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Resolution  of  << this -> Resolution ) ; return this -> Resolution ; } ;
## Error: expected ';'!!!

proc GetHasShadows*(this: var vtkShadowMapBakerPass): bool {.
    importcpp: "GetHasShadows", header: "vtkShadowMapBakerPass.h".}
proc LightCreatesShadow*(this: var vtkShadowMapBakerPass; l: ptr vtkLight): bool {.
    importcpp: "LightCreatesShadow", header: "vtkShadowMapBakerPass.h".}
proc GetShadowMaps*(this: var vtkShadowMapBakerPass): ptr vector[
    vtkSmartPointer[vtkTextureObject]] {.importcpp: "GetShadowMaps",
                                        header: "vtkShadowMapBakerPass.h".}
proc GetLightCameras*(this: var vtkShadowMapBakerPass): ptr vector[
    vtkSmartPointer[vtkCamera]] {.importcpp: "GetLightCameras",
                                 header: "vtkShadowMapBakerPass.h".}
proc GetNeedUpdate*(this: var vtkShadowMapBakerPass): bool {.
    importcpp: "GetNeedUpdate", header: "vtkShadowMapBakerPass.h".}
proc SetUpToDate*(this: var vtkShadowMapBakerPass) {.importcpp: "SetUpToDate",
    header: "vtkShadowMapBakerPass.h".}