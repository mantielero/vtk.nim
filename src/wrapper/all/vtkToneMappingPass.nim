## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkToneMappingPass.h
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
##  @class   vtkToneMappingPass
##  @brief   Implement a post-processing Tone Mapping.
##
##  Tone mapping is the process of mapping HDR colors to [0;1] range.
##  This render pass supports four different modes:
##  - Clamp: clamps the color to [0;1] range
##  - Reinhard: maps the color using formula: x/(x+1)
##  - Exponential: maps the colors using a coefficient and the formula: 1-exp(-a*x)
##  - GenericFilmic: maps the color using five parameters that allow to shape the
##                   tonemapping curve : Contrast adjust the toe (left part) of the curve;
##                   Shoulder adjusts the right part; MidIn and MidOut adjusts the middle gray
##                   level in percent of the curve for input and output (ie. the halfway point
##                   between white and black); and HdrMax is the maximum HDR input that is not
##                   clipped. A boolean UseACES allows to use the Academy Color Encoding System.
##
##  Advanced tone mapping like GenericFilmic, Reinhard or Exponential can be useful when several
##  lights are added to the renderer.
##
##  @sa
##  vtkRenderPass
##

import
  vtkImageProcessingPass, vtkRenderingOpenGL2Module

discard "forward decl of vtkOpenGLFramebufferObject"
discard "forward decl of vtkOpenGLQuadHelper"
discard "forward decl of vtkTextureObject"
type
  vtkToneMappingPass* {.importcpp: "vtkToneMappingPass",
                       header: "vtkToneMappingPass.h", bycopy.} = object of vtkImageProcessingPass
    vtkToneMappingPass* {.importc: "vtkToneMappingPass".}: VTK_NEWINSTANCE
    ## *
    ##  Parameters for Generic Filmic Tonemapping
    ##
    ## *
    ##  Used to recompile the shader if UseACES is modified
    ##
    ## *
    ##  Computed from previous parameters.
    ##  Allow to anchor the curve.
    ##  Default value are for GenericFilmic default preset
    ##
    ## *
    ##  Pre compute ClippingPoint and ToeSpeed.
    ##


proc New*(): ptr vtkToneMappingPass {.importcpp: "vtkToneMappingPass::New(@)",
                                  header: "vtkToneMappingPass.h".}
type
  vtkToneMappingPassSuperclass* = vtkImageProcessingPass

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkToneMappingPass::IsTypeOf(@)", header: "vtkToneMappingPass.h".}
proc IsA*(this: var vtkToneMappingPass; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkToneMappingPass.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkToneMappingPass {.
    importcpp: "vtkToneMappingPass::SafeDownCast(@)",
    header: "vtkToneMappingPass.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkToneMappingPass :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageProcessingPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkToneMappingPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkToneMappingPass :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkToneMappingPass; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkToneMappingPass.h".}
proc Render*(this: var vtkToneMappingPass; s: ptr vtkRenderState) {.
    importcpp: "Render", header: "vtkToneMappingPass.h".}
proc ReleaseGraphicsResources*(this: var vtkToneMappingPass; w: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkToneMappingPass.h".}
proc SetGenericFilmicDefaultPresets*(this: var vtkToneMappingPass) {.
    importcpp: "SetGenericFilmicDefaultPresets", header: "vtkToneMappingPass.h".}
proc SetGenericFilmicUncharted2Presets*(this: var vtkToneMappingPass) {.
    importcpp: "SetGenericFilmicUncharted2Presets", header: "vtkToneMappingPass.h".}
const
  vtkToneMappingPassClamp* = 0
  vtkToneMappingPassReinhard* = 1
  vtkToneMappingPassExponential* = 2
  vtkToneMappingPassGenericFilmic* = 3

proc SetToneMappingType*(this: var vtkToneMappingPass; _arg: cint) {.
    importcpp: "SetToneMappingType", header: "vtkToneMappingPass.h".}
proc GetToneMappingTypeMinValue*(this: var vtkToneMappingPass): cint {.
    importcpp: "GetToneMappingTypeMinValue", header: "vtkToneMappingPass.h".}
proc GetToneMappingTypeMaxValue*(this: var vtkToneMappingPass): cint {.
    importcpp: "GetToneMappingTypeMaxValue", header: "vtkToneMappingPass.h".}
## !!!Ignored construct:  virtual int GetToneMappingType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ToneMappingType  of  << this -> ToneMappingType ) ; return this -> ToneMappingType ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get/Set Exposure coefficient used for exponential and Generic Filmic tone mapping.
##  Default is 1.0
##  virtual float GetToneMappingTypeExposureExposure ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Exposure  of  << this -> Exposure ) ; return this -> Exposure ; } ;
## Error: expected ';'!!!

proc SetExposure*(this: var vtkToneMappingPass; _arg: cfloat) {.
    importcpp: "SetExposure", header: "vtkToneMappingPass.h".}
  ## /@}
  ## /@{
  ## *
  ##  Contrast adjust the toe of the curve. Typically in [1-2].
  ##  Default is 1.6773
  ##
proc SetToneMappingTypeContrast*(this: var vtkToneMappingPass; _arg: cfloat) {.
    importcpp: "SetToneMappingTypeContrast", header: "vtkToneMappingPass.h".}
proc GetToneMappingTypeMinValueContrastMinValue*(this: var vtkToneMappingPass): cfloat {.
    importcpp: "GetToneMappingTypeMinValueContrastMinValue",
    header: "vtkToneMappingPass.h".}
proc GetToneMappingTypeMaxValueContrastMaxValue*(this: var vtkToneMappingPass): cfloat {.
    importcpp: "GetToneMappingTypeMaxValueContrastMaxValue",
    header: "vtkToneMappingPass.h".}
## !!!Ignored construct:  virtual float GetToneMappingTypeExposureExposureContrast ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Contrast  of  << this -> Contrast ) ; return this -> Contrast ; } ;
## Error: expected ';'!!!

proc SetToneMappingTypeContrastShoulder*(this: var vtkToneMappingPass; _arg: cfloat) {.
    importcpp: "SetToneMappingTypeContrastShoulder",
    header: "vtkToneMappingPass.h".}
proc GetToneMappingTypeMinValueContrastMinValueShoulderMinValue*(
    this: var vtkToneMappingPass): cfloat {.importcpp: "GetToneMappingTypeMinValueContrastMinValueShoulderMinValue",
                                        header: "vtkToneMappingPass.h".}
proc GetToneMappingTypeMaxValueContrastMaxValueShoulderMaxValue*(
    this: var vtkToneMappingPass): cfloat {.importcpp: "GetToneMappingTypeMaxValueContrastMaxValueShoulderMaxValue",
                                        header: "vtkToneMappingPass.h".}
## !!!Ignored construct:  virtual float GetToneMappingTypeExposureExposureContrastShoulder ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Shoulder  of  << this -> Shoulder ) ; return this -> Shoulder ; } ;
## Error: expected ';'!!!

proc SetToneMappingTypeContrastShoulderMidIn*(this: var vtkToneMappingPass;
    _arg: cfloat) {.importcpp: "SetToneMappingTypeContrastShoulderMidIn",
                  header: "vtkToneMappingPass.h".}
proc GetToneMappingTypeMinValueContrastMinValueShoulderMinValueMidInMinValue*(
    this: var vtkToneMappingPass): cfloat {.importcpp: "GetToneMappingTypeMinValueContrastMinValueShoulderMinValueMidInMinValue",
                                        header: "vtkToneMappingPass.h".}
proc GetToneMappingTypeMaxValueContrastMaxValueShoulderMaxValueMidInMaxValue*(
    this: var vtkToneMappingPass): cfloat {.importcpp: "GetToneMappingTypeMaxValueContrastMaxValueShoulderMaxValueMidInMaxValue",
                                        header: "vtkToneMappingPass.h".}
## !!!Ignored construct:  virtual float GetToneMappingTypeExposureExposureContrastShoulderMidIn ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MidIn  of  << this -> MidIn ) ; return this -> MidIn ; } ;
## Error: expected ';'!!!

proc SetToneMappingTypeContrastShoulderMidInMidOut*(this: var vtkToneMappingPass;
    _arg: cfloat) {.importcpp: "SetToneMappingTypeContrastShoulderMidInMidOut",
                  header: "vtkToneMappingPass.h".}
proc GetToneMappingTypeMinValueContrastMinValueShoulderMinValueMidInMinValueMidOutMinValue*(
    this: var vtkToneMappingPass): cfloat {.importcpp: "GetToneMappingTypeMinValueContrastMinValueShoulderMinValueMidInMinValueMidOutMinValue",
                                        header: "vtkToneMappingPass.h".}
proc GetToneMappingTypeMaxValueContrastMaxValueShoulderMaxValueMidInMaxValueMidOutMaxValue*(
    this: var vtkToneMappingPass): cfloat {.importcpp: "GetToneMappingTypeMaxValueContrastMaxValueShoulderMaxValueMidInMaxValueMidOutMaxValue",
                                        header: "vtkToneMappingPass.h".}
## !!!Ignored construct:  virtual float GetToneMappingTypeExposureExposureContrastShoulderMidInMidOut ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MidOut  of  << this -> MidOut ) ; return this -> MidOut ; } ;
## Error: expected ';'!!!

proc SetToneMappingTypeContrastShoulderMidInMidOutHdrMax*(
    this: var vtkToneMappingPass; _arg: cfloat) {.
    importcpp: "SetToneMappingTypeContrastShoulderMidInMidOutHdrMax",
    header: "vtkToneMappingPass.h".}
proc GetToneMappingTypeMinValueContrastMinValueShoulderMinValueMidInMinValueMidOutMinValueHdrMaxMinValue*(
    this: var vtkToneMappingPass): cfloat {.importcpp: "GetToneMappingTypeMinValueContrastMinValueShoulderMinValueMidInMinValueMidOutMinValueHdrMaxMinValue",
                                        header: "vtkToneMappingPass.h".}
proc GetToneMappingTypeMaxValueContrastMaxValueShoulderMaxValueMidInMaxValueMidOutMaxValueHdrMaxMaxValue*(
    this: var vtkToneMappingPass): cfloat {.importcpp: "GetToneMappingTypeMaxValueContrastMaxValueShoulderMaxValueMidInMaxValueMidOutMaxValueHdrMaxMaxValue",
                                        header: "vtkToneMappingPass.h".}
## !!!Ignored construct:  virtual float GetToneMappingTypeExposureExposureContrastShoulderMidInMidOutHdrMax ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HdrMax  of  << this -> HdrMax ) ; return this -> HdrMax ; } ;
## Error: expected ';'!!!

proc SetExposureUseACES*(this: var vtkToneMappingPass; _arg: bool) {.
    importcpp: "SetExposureUseACES", header: "vtkToneMappingPass.h".}
## !!!Ignored construct:  virtual bool GetToneMappingTypeExposureExposureContrastShoulderMidInMidOutHdrMaxUseACES ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseACES  of  << this -> UseACES ) ; return this -> UseACES ; } ;
## Error: expected ';'!!!
