## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOpenGLRenderer.h
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
##  @class   vtkOpenGLRenderer
##  @brief   OpenGL renderer
##
##  vtkOpenGLRenderer is a concrete implementation of the abstract class
##  vtkRenderer. vtkOpenGLRenderer interfaces to the OpenGL graphics library.
##

import
  vtkDeprecation, vtkRenderer, vtkRenderingOpenGL2Module, vtkSmartPointer

discard "forward decl of vtkFloatArray"
discard "forward decl of vtkOpenGLFXAAFilter"
discard "forward decl of vtkRenderPass"
discard "forward decl of vtkOpenGLState"
discard "forward decl of vtkOpenGLTexture"
discard "forward decl of vtkOrderIndependentTranslucentPass"
discard "forward decl of vtkTextureObject"
discard "forward decl of vtkDepthPeelingPass"
discard "forward decl of vtkPBRIrradianceTexture"
discard "forward decl of vtkPBRLUTTexture"
discard "forward decl of vtkPBRPrefilterTexture"
discard "forward decl of vtkShaderProgram"
discard "forward decl of vtkShadowMapPass"
discard "forward decl of vtkSSAOPass"
type
  vtkOpenGLRenderer* {.importcpp: "vtkOpenGLRenderer",
                      header: "vtkOpenGLRenderer.h", bycopy.} = object of vtkRenderer
    vtkOpenGLRenderer* {.importc: "vtkOpenGLRenderer".}: VTK_NEWINSTANCE
    ## *
    ##  Depth peeling is delegated to an instance of vtkDepthPeelingPass
    ##
    ## *
    ##  Fallback for transparency
    ##
    ## *
    ##  Shadows are delegated to an instance of vtkShadowMapPass
    ##
    ## *
    ##  SSAO is delegated to an instance of vtkSSAOPass
    ##
    ##  Is rendering at translucent geometry stage using depth peeling and
    ##  rendering a layer other than the first one? (Boolean value)
    ##  If so, the uniform variables UseTexture and Texture can be set.
    ##  (Used by vtkOpenGLProperty or vtkOpenGLTexture)
    ## *
    ##  Optional user transform for lights
    ##


proc New*(): ptr vtkOpenGLRenderer {.importcpp: "vtkOpenGLRenderer::New(@)",
                                 header: "vtkOpenGLRenderer.h".}
type
  vtkOpenGLRendererSuperclass* = vtkRenderer

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOpenGLRenderer::IsTypeOf(@)", header: "vtkOpenGLRenderer.h".}
proc IsA*(this: var vtkOpenGLRenderer; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkOpenGLRenderer.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOpenGLRenderer {.
    importcpp: "vtkOpenGLRenderer::SafeDownCast(@)", header: "vtkOpenGLRenderer.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOpenGLRenderer :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkRenderer :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOpenGLRenderer :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOpenGLRenderer :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkOpenGLRenderer; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkOpenGLRenderer.h".}
proc DeviceRender*(this: var vtkOpenGLRenderer) {.importcpp: "DeviceRender",
    header: "vtkOpenGLRenderer.h".}
proc DeviceRenderOpaqueGeometry*(this: var vtkOpenGLRenderer;
                                fbo: ptr vtkFrameBufferObjectBase = nil) {.
    importcpp: "DeviceRenderOpaqueGeometry", header: "vtkOpenGLRenderer.h".}
proc DeviceRenderTranslucentPolygonalGeometry*(this: var vtkOpenGLRenderer;
    fbo: ptr vtkFrameBufferObjectBase = nil) {.
    importcpp: "DeviceRenderTranslucentPolygonalGeometry",
    header: "vtkOpenGLRenderer.h".}
proc Clear*(this: var vtkOpenGLRenderer) {.importcpp: "Clear",
                                       header: "vtkOpenGLRenderer.h".}
proc UpdateLights*(this: var vtkOpenGLRenderer): cint {.importcpp: "UpdateLights",
    header: "vtkOpenGLRenderer.h".}
proc GetDepthPeelingHigherLayer*(this: var vtkOpenGLRenderer): cint {.
    importcpp: "GetDepthPeelingHigherLayer", header: "vtkOpenGLRenderer.h".}
## !!!Ignored construct:  *
##  Indicate if this system is subject to the Apple/AMD bug
##  of not having a working glPrimitiveId <rdar://20747550>.
##  The bug is fixed on macOS 10.11 and later, and this method
##  will return false when the OS is new enough.
##  VTK_DEPRECATED_IN_9_1_0 ( Removed in 9.1.0 as this bug does not affect any macOS release that VTK supports ) bool HaveApplePrimitiveIdBug ( ) ;
## Error: identifier expected, but got: Removed in 9.1.0 as this bug does not affect any macOS release that VTK supports!!!

proc HaveAppleQueryAllocationBug*(): bool {.
    importcpp: "vtkOpenGLRenderer::HaveAppleQueryAllocationBug(@)",
    header: "vtkOpenGLRenderer.h".}
proc IsDualDepthPeelingSupported*(this: var vtkOpenGLRenderer): bool {.
    importcpp: "IsDualDepthPeelingSupported", header: "vtkOpenGLRenderer.h".}
proc GetState*(this: var vtkOpenGLRenderer): ptr vtkOpenGLState {.
    importcpp: "GetState", header: "vtkOpenGLRenderer.h".}
proc GetLightingUniforms*(this: var vtkOpenGLRenderer): cstring {.
    importcpp: "GetLightingUniforms", header: "vtkOpenGLRenderer.h".}
proc UpdateLightingUniforms*(this: var vtkOpenGLRenderer; prog: ptr vtkShaderProgram) {.
    importcpp: "UpdateLightingUniforms", header: "vtkOpenGLRenderer.h".}
type
  vtkOpenGLRendererLightingComplexityEnum* {.size: sizeof(cint),
      importcpp: "vtkOpenGLRenderer::LightingComplexityEnum",
      header: "vtkOpenGLRenderer.h".} = enum
    NoLighting = 0, Headlight = 1, Directional = 2, Positional = 3


## !!!Ignored construct:  virtual int GetLightingComplexity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LightingComplexity  of  << this -> LightingComplexity ) ; return this -> LightingComplexity ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:   get the number of lights turned on virtual int GetLightingComplexityLightingCountLightingCount ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LightingCount  of  << this -> LightingCount ) ; return this -> LightingCount ; } ;
## Error: expected ';'!!!

proc SetUserLightTransform*(this: var vtkOpenGLRenderer; transform: ptr vtkTransform) {.
    importcpp: "SetUserLightTransform", header: "vtkOpenGLRenderer.h".}
proc GetUserLightTransform*(this: var vtkOpenGLRenderer): ptr vtkTransform {.
    importcpp: "GetUserLightTransform", header: "vtkOpenGLRenderer.h".}
proc GetEnvMapLookupTable*(this: var vtkOpenGLRenderer): ptr vtkPBRLUTTexture {.
    importcpp: "GetEnvMapLookupTable", header: "vtkOpenGLRenderer.h".}
proc GetEnvMapIrradiance*(this: var vtkOpenGLRenderer): ptr vtkPBRIrradianceTexture {.
    importcpp: "GetEnvMapIrradiance", header: "vtkOpenGLRenderer.h".}
proc GetEnvMapPrefiltered*(this: var vtkOpenGLRenderer): ptr vtkPBRPrefilterTexture {.
    importcpp: "GetEnvMapPrefiltered", header: "vtkOpenGLRenderer.h".}
proc GetSphericalHarmonics*(this: var vtkOpenGLRenderer): ptr vtkFloatArray {.
    importcpp: "GetSphericalHarmonics", header: "vtkOpenGLRenderer.h".}
proc SetUseSphericalHarmonics*(this: var vtkOpenGLRenderer; _arg: bool) {.
    importcpp: "SetUseSphericalHarmonics", header: "vtkOpenGLRenderer.h".}
## !!!Ignored construct:  virtual bool GetLightingComplexityLightingCountLightingCountUseSphericalHarmonics ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseSphericalHarmonics  of  << this -> UseSphericalHarmonics ) ; return this -> UseSphericalHarmonics ; } ;
## Error: expected ';'!!!

proc UseSphericalHarmonicsOn*(this: var vtkOpenGLRenderer) {.
    importcpp: "UseSphericalHarmonicsOn", header: "vtkOpenGLRenderer.h".}
proc UseSphericalHarmonicsOff*(this: var vtkOpenGLRenderer) {.
    importcpp: "UseSphericalHarmonicsOff", header: "vtkOpenGLRenderer.h".}
  ## /@}
  ## *
  ##  Overridden in order to connect the texture to the environment map textures.
  ##
proc SetEnvironmentTexture*(this: var vtkOpenGLRenderer; texture: ptr vtkTexture;
                           isSRGB: bool = false) {.
    importcpp: "SetEnvironmentTexture", header: "vtkOpenGLRenderer.h".}
proc ReleaseGraphicsResources*(this: var vtkOpenGLRenderer; w: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkOpenGLRenderer.h".}