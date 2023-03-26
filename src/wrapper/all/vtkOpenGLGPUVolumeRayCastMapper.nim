## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOpenGLGPUVolumeRayCastMapper.h
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
##  @class vtkOpenGLGPUVolumeRayCastMapper
##  @brief OpenGL implementation of volume rendering through ray-casting.
##
##  @section multi Multiple Inputs
##
##  When multiple inputs are rendered simultaneously, it is possible to
##  composite overlapping areas correctly. Inputs are connected directly to
##  the mapper and their parameters (transfer functions, transformations, etc.)
##  are specified through standard vtkVolume instances. These vtkVolume
##  instances are to be registered in a special vtkProp3D, vtkMultiVolume.
##
##  Structures related to a particular active input are stored in a helper
##  class (vtkVolumeInputHelper) and helper structures are kept in a
##  port-referenced map (VolumeInputMap). The order of the inputs in the
##  map is important as it defines the order in which parameters are
##  bound to uniform variables (transformation matrices, bias, scale and every
##  other required rendering parameter).
##
##  A separate code path is used when rendering multiple-inputs in order to
##  facilitate the co-existance of these two modes (single/multiple), due to
##  current feature incompatibilities with multiple inputs (e.g. texture-streaming,
##  cropping, etc.).
##
##  @note A limited set of the mapper features are currently supported for
##  multiple inputs:
##
##  - Blending
##    - Composite (front-to-back)
##
##  - Transfer functions (defined separately for per input)
##    - 1D color
##    - 1D scalar opacity
##    - 1D gradient magnitude opacity
##    - 2D scalar-gradient magnitude
##
##  - Point and cell data
##    - With the limitation that all of the inputs are assumed to share the same
##      name/id.
##
##  @sa vtkGPUVolumeRayCastMapper vtkVolumeInputHelper vtkVolumeTexture
##  vtkMultiVolume
##
##

import
  vtkGPUVolumeRayCastMapper, vtkNew, vtkRenderingVolumeOpenGL2Module, vtkShader,
  vtkSmartPointer

discard "forward decl of vtkGenericOpenGLResourceFreeCallback"
discard "forward decl of vtkImplicitFunction"
discard "forward decl of vtkOpenGLCamera"
discard "forward decl of vtkOpenGLTransferFunctions2D"
discard "forward decl of vtkOpenGLVolumeGradientOpacityTables"
discard "forward decl of vtkOpenGLVolumeOpacityTables"
discard "forward decl of vtkOpenGLVolumeRGBTables"
discard "forward decl of vtkShaderProgram"
discard "forward decl of vtkTextureObject"
discard "forward decl of vtkVolume"
discard "forward decl of vtkVolumeInputHelper"
discard "forward decl of vtkVolumeTexture"
discard "forward decl of vtkOpenGLShaderProperty"
type
  vtkOpenGLGPUVolumeRayCastMapper* {.importcpp: "vtkOpenGLGPUVolumeRayCastMapper", header: "vtkOpenGLGPUVolumeRayCastMapper.h",
                                    bycopy.} = object of vtkGPUVolumeRayCastMapper
    vtkOpenGLGPUVolumeRayCastMapper* {.importc: "vtkOpenGLGPUVolumeRayCastMapper".}: VTK_NEWINSTANCE
    ##  Description:
    ##  Build vertex and fragment shader for the volume rendering
    ## /@}
    AssembledInputs* {.importc: "AssembledInputs".}: VolumeInputMap


proc New*(): ptr vtkOpenGLGPUVolumeRayCastMapper {.
    importcpp: "vtkOpenGLGPUVolumeRayCastMapper::New(@)",
    header: "vtkOpenGLGPUVolumeRayCastMapper.h".}
type
  vtkOpenGLGPUVolumeRayCastMapperPasses* {.size: sizeof(cint),
      importcpp: "vtkOpenGLGPUVolumeRayCastMapper::Passes",
      header: "vtkOpenGLGPUVolumeRayCastMapper.h".} = enum
    RenderPass

const
  DepthPass = RenderPass

type
  vtkOpenGLGPUVolumeRayCastMapperSuperclass* = vtkGPUVolumeRayCastMapper

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOpenGLGPUVolumeRayCastMapper::IsTypeOf(@)",
    header: "vtkOpenGLGPUVolumeRayCastMapper.h".}
proc IsA*(this: var vtkOpenGLGPUVolumeRayCastMapper; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkOpenGLGPUVolumeRayCastMapper.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOpenGLGPUVolumeRayCastMapper {.
    importcpp: "vtkOpenGLGPUVolumeRayCastMapper::SafeDownCast(@)",
    header: "vtkOpenGLGPUVolumeRayCastMapper.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOpenGLGPUVolumeRayCastMapper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGPUVolumeRayCastMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOpenGLGPUVolumeRayCastMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOpenGLGPUVolumeRayCastMapper :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkOpenGLGPUVolumeRayCastMapper; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkOpenGLGPUVolumeRayCastMapper.h".}
proc GetDepthTexture*(this: var vtkOpenGLGPUVolumeRayCastMapper): ptr vtkTextureObject {.
    importcpp: "GetDepthTexture", header: "vtkOpenGLGPUVolumeRayCastMapper.h".}
proc GetColorTexture*(this: var vtkOpenGLGPUVolumeRayCastMapper): ptr vtkTextureObject {.
    importcpp: "GetColorTexture", header: "vtkOpenGLGPUVolumeRayCastMapper.h".}
proc GetDepthImage*(this: var vtkOpenGLGPUVolumeRayCastMapper; im: ptr vtkImageData) {.
    importcpp: "GetDepthImage", header: "vtkOpenGLGPUVolumeRayCastMapper.h".}
proc GetColorImage*(this: var vtkOpenGLGPUVolumeRayCastMapper; im: ptr vtkImageData) {.
    importcpp: "GetColorImage", header: "vtkOpenGLGPUVolumeRayCastMapper.h".}
## !!!Ignored construct:   Description:
##  Mapper can have multiple passes and internally it will set
##  the state. The state can not be set externally explicitly
##  but can be set indirectly depending on the options set by
##  the user. virtual int GetCurrentPassCurrentPass ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CurrentPass  of  << this -> CurrentPass ) ; return this -> CurrentPass ; } ;
## Error: expected ';'!!!

proc SetSharedDepthTexture*(this: var vtkOpenGLGPUVolumeRayCastMapper;
                           nt: ptr vtkTextureObject) {.
    importcpp: "SetSharedDepthTexture",
    header: "vtkOpenGLGPUVolumeRayCastMapper.h".}
proc SetPartitions*(this: var vtkOpenGLGPUVolumeRayCastMapper; x: cushort; y: cushort;
                   z: cushort) {.importcpp: "SetPartitions",
                               header: "vtkOpenGLGPUVolumeRayCastMapper.h".}
proc PreLoadData*(this: var vtkOpenGLGPUVolumeRayCastMapper; ren: ptr vtkRenderer;
                 vol: ptr vtkVolume): bool {.importcpp: "PreLoadData",
    header: "vtkOpenGLGPUVolumeRayCastMapper.h".}
proc ReleaseGraphicsResources*(this: var vtkOpenGLGPUVolumeRayCastMapper;
                              window: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources",
    header: "vtkOpenGLGPUVolumeRayCastMapper.h".}
type
  VolumeInput* = vtkVolumeInputHelper
  VolumeInputMap* = map[cint, vtkVolumeInputHelper]
