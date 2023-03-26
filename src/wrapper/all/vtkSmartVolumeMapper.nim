## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSmartVolumeMapper.h
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
##  @class   vtkSmartVolumeMapper
##  @brief   Adaptive volume mapper
##
##  vtkSmartVolumeMapper is a volume mapper that will delegate to a specific
##  volume mapper based on rendering parameters and available hardware. Use the
##  SetRequestedRenderMode() method to control the behavior of the selection.
##  The following options are available:
##
##  @par vtkSmartVolumeMapper::DefaultRenderMode:
##           Allow the vtkSmartVolumeMapper to select the best mapper based on
##           rendering parameters and hardware support. If GPU ray casting is
##           supported, the vtkGPUVolumeRayCastMapper mapper will be used for
##           all rendering. If not, then the vtkFixedPointVolumeRayCastMapper
##           will be used exclusively. This is the default requested render
##           mode, and is generally the best option. When you use this option,
##           your volume will always be rendered, but the method used to render
##           it may vary based on parameters and platform.
##
##  @par vtkSmartVolumeMapper::RayCastRenderMode:
##           Use the vtkFixedPointVolumeRayCastMapper for both interactive and
##           still rendering. When you use this option your volume will always
##           be rendered with the vtkFixedPointVolumeRayCastMapper.
##
##  @par vtkSmartVolumeMapper::GPURenderMode:
##           Use the vtkGPUVolumeRayCastMapper, if supported, for both
##           interactive and still rendering. If the GPU ray caster is not
##           supported (due to hardware limitations or rendering parameters)
##           then no image will be rendered. Use this option only if you have
##           already checked for supported based on the current hardware,
##           number of scalar components, and rendering parameters in the
##           vtkVolumeProperty.
##
##  @par vtkSmartVolumeMapper::GPURenderMode:
##   You can adjust the contrast and brightness in the rendered image using the
##   FinalColorWindow and FinalColorLevel ivars. By default the
##   FinalColorWindow is set to 1.0, and the FinalColorLevel is set to 0.5,
##   which applies no correction to the computed image. To apply the window /
##   level operation to the computer image color, first a Scale and Bias
##   value are computed:
##   <pre>
##   scale = 1.0 / this->FinalColorWindow
##   bias  = 0.5 - this->FinalColorLevel / this->FinalColorWindow
##   </pre>
##   To compute a new color (R', G', B', A') from an existing color (R,G,B,A)
##   for a pixel, the following equation is used:
##   <pre>
##   R' = R*scale + bias*A
##   G' = G*scale + bias*A
##   B' = B*scale + bias*A
##   A' = A
##   </pre>
##  Note that bias is multiplied by the alpha component before adding because
##  the red, green, and blue component of the color are already pre-multiplied
##  by alpha. Also note that the window / level operation leaves the alpha
##  component unchanged - it only adjusts the RGB values.
##

import
  vtkImageReslice, vtkRenderingVolumeOpenGL2Module, vtkVolumeMapper

discard "forward decl of vtkFixedPointVolumeRayCastMapper"
discard "forward decl of vtkGPUVolumeRayCastMapper"
discard "forward decl of vtkImageResample"
discard "forward decl of vtkMultiBlockVolumeMapper"
discard "forward decl of vtkOSPRayVolumeInterface"
discard "forward decl of vtkRenderWindow"
discard "forward decl of vtkVolume"
discard "forward decl of vtkVolumeProperty"
discard "forward decl of vtkImageMagnitude"
type
  vtkSmartVolumeMapper* {.importcpp: "vtkSmartVolumeMapper",
                         header: "vtkSmartVolumeMapper.h", bycopy.} = object of vtkVolumeMapper ## /@{
                                                                                         ## *
                                                                                         ##  Adjust the GPUMapper's parameters (ColorTable, Weights, etc.) to render
                                                                                         ##  a single component of a dataset.
                                                                                         ##
    vtkSmartVolumeMapper* {.importc: "vtkSmartVolumeMapper".}: VTK_NEWINSTANCE
    ## /@}
    ## /@{
    ## *
    ##  GPU mapper-specific memory ivars.
    ##
    ## /@}
    ## *
    ##  Used for downsampling.
    ##
    ## /@{
    ## *
    ##  The requested render mode is used to compute the current render mode. Note
    ##  that the current render mode can be invalid if the requested mode is not
    ##  supported.
    ##
    ## /@}
    ## /@{
    ## *
    ##  Initialization variables.
    ##
    ## /@}
    ## *
    ##  This is the resample filter that may be used if we need to
    ##  create a low resolution version of the volume for GPU rendering
    ##
    ## /@{
    ## *
    ##  This filter is used to compute the magnitude of 3-component data. MAGNITUDE
    ##  is one of the supported modes when rendering separately a single independent
    ##  component.
    ##
    ##  \note
    ##  This feature was added specifically for ParaView so it might eventually be
    ##  moved into a derived mapper in ParaView.
    ##
    ## /@}
    ## *
    ##  The initialize method. Called from ComputeRenderMode whenever something
    ##  relevant has changed.
    ##
    ## /@}
    ## *
    ##  We need to keep track of the blend mode we had when we initialized
    ##  because we need to reinitialize (and recheck hardware support) if
    ##  it changes
    ##
    ## *
    ##  The distance between sample points along the ray
    ##
    ## *
    ##  Secondary rays ambient/global adjustment coefficient
    ##
    ## *
    ##  Blending coefficient between surfacic and volumetric models in GPU Mapper
    ##
    ## *
    ##  Set whether or not the sample distance should be automatically calculated
    ##  within the internal volume mapper
    ##
    ## *
    ##  If the DesiredUpdateRate of the vtkRenderWindow causing the Render is at
    ##  or above this value, the render is considered interactive. Otherwise it is
    ##  considered still.
    ##
    ## *
    ##  If the InteractiveAdjustSampleDistances flag is enabled,
    ##  vtkSmartVolumeMapper interactively sets and resets the
    ##  AutoAdjustSampleDistances flag on the internal volume mapper. This flag
    ##  along with InteractiveUpdateRate is useful to adjust volume mapper sample
    ##  distance based on whether the render is interactive or still.
    ##
    ## /@{
    ## *
    ##  VectorMode is a special rendering mode for 3-component vectors which makes
    ##  use of GPURayCastMapper's independent-component capabilities. In this mode,
    ##  a single component in the vector can be selected for rendering. In addition,
    ##  the mapper can compute a scalar field representing the magnitude of this vector
    ##  using a vtkImageMagnitude object (MAGNITUDE mode).
    ##
    ## /@}
    ## /@{
    ## *
    ##  Keep a cache of the last input to the mapper so that input data changes can be propagated to
    ##  the resample filter and internal mappers.
    ##
    ## /@}
    ## *
    ##  Define the array used for the Y axis of transfer 2D.
    ##  This is used when the transfer function  mode is set to 2D. If unset, the
    ##  default is to use the gradient of the scalar.
    ##


proc New*(): ptr vtkSmartVolumeMapper {.importcpp: "vtkSmartVolumeMapper::New(@)",
                                    header: "vtkSmartVolumeMapper.h".}
type
  vtkSmartVolumeMapperSuperclass* = vtkVolumeMapper

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSmartVolumeMapper::IsTypeOf(@)",
    header: "vtkSmartVolumeMapper.h".}
proc IsA*(this: var vtkSmartVolumeMapper; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkSmartVolumeMapper.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSmartVolumeMapper {.
    importcpp: "vtkSmartVolumeMapper::SafeDownCast(@)",
    header: "vtkSmartVolumeMapper.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSmartVolumeMapper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkVolumeMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSmartVolumeMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSmartVolumeMapper :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSmartVolumeMapper; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkSmartVolumeMapper.h".}
proc SetFinalColorWindow*(this: var vtkSmartVolumeMapper; _arg: cfloat) {.
    importcpp: "SetFinalColorWindow", header: "vtkSmartVolumeMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the final color window. Initial value is 1.0.
  ##
## !!!Ignored construct:  virtual float GetFinalColorWindow ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FinalColorWindow  of  << this -> FinalColorWindow ) ; return this -> FinalColorWindow ; } ;
## Error: expected ';'!!!

proc SetFinalColorWindowFinalColorLevel*(this: var vtkSmartVolumeMapper;
                                        _arg: cfloat) {.
    importcpp: "SetFinalColorWindowFinalColorLevel",
    header: "vtkSmartVolumeMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the final color level.
  ##
## !!!Ignored construct:  virtual float GetFinalColorWindowFinalColorLevel ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FinalColorLevel  of  << this -> FinalColorLevel ) ; return this -> FinalColorLevel ; } ;
## Error: expected ';'!!!

const
  vtkSmartVolumeMapperDefaultRenderMode* = 0
  vtkSmartVolumeMapperRayCastRenderMode* = 1
  vtkSmartVolumeMapperGPURenderMode* = 2
  vtkSmartVolumeMapperOSPRayRenderMode* = 3
  vtkSmartVolumeMapperUndefinedRenderMode* = 4
  vtkSmartVolumeMapperInvalidRenderMode* = 5

proc SetRequestedRenderMode*(this: var vtkSmartVolumeMapper; mode: cint) {.
    importcpp: "SetRequestedRenderMode", header: "vtkSmartVolumeMapper.h".}
proc SetRequestedRenderModeToDefault*(this: var vtkSmartVolumeMapper) {.
    importcpp: "SetRequestedRenderModeToDefault", header: "vtkSmartVolumeMapper.h".}
proc SetRequestedRenderModeToRayCast*(this: var vtkSmartVolumeMapper) {.
    importcpp: "SetRequestedRenderModeToRayCast", header: "vtkSmartVolumeMapper.h".}
proc SetRequestedRenderModeToGPU*(this: var vtkSmartVolumeMapper) {.
    importcpp: "SetRequestedRenderModeToGPU", header: "vtkSmartVolumeMapper.h".}
proc SetRequestedRenderModeToOSPRay*(this: var vtkSmartVolumeMapper) {.
    importcpp: "SetRequestedRenderModeToOSPRay", header: "vtkSmartVolumeMapper.h".}
## !!!Ignored construct:  /@{ *
##  Get the requested render mode.
##  virtual int GetFinalColorWindowFinalColorLevelRequestedRenderModeRequestedRenderMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RequestedRenderMode  of  << this -> RequestedRenderMode ) ; return this -> RequestedRenderMode ; } ;
## Error: expected ';'!!!

proc GetLastUsedRenderMode*(this: var vtkSmartVolumeMapper): cint {.
    importcpp: "GetLastUsedRenderMode", header: "vtkSmartVolumeMapper.h".}
proc SetFinalColorWindowFinalColorLevelMaxMemoryInBytes*(
    this: var vtkSmartVolumeMapper; _arg: vtkIdType) {.
    importcpp: "SetFinalColorWindowFinalColorLevelMaxMemoryInBytes",
    header: "vtkSmartVolumeMapper.h".}
## !!!Ignored construct:  virtual vtkIdType GetFinalColorWindowFinalColorLevelRequestedRenderModeRequestedRenderModeMaxMemoryInBytes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaxMemoryInBytes  of  << this -> MaxMemoryInBytes ) ; return this -> MaxMemoryInBytes ; } ;
## Error: expected ';'!!!

proc SetMaxMemoryFraction*(this: var vtkSmartVolumeMapper; _arg: cfloat) {.
    importcpp: "SetMaxMemoryFraction", header: "vtkSmartVolumeMapper.h".}
proc GetMaxMemoryFractionMinValue*(this: var vtkSmartVolumeMapper): cfloat {.
    importcpp: "GetMaxMemoryFractionMinValue", header: "vtkSmartVolumeMapper.h".}
proc GetMaxMemoryFractionMaxValue*(this: var vtkSmartVolumeMapper): cfloat {.
    importcpp: "GetMaxMemoryFractionMaxValue", header: "vtkSmartVolumeMapper.h".}
## !!!Ignored construct:  virtual float GetFinalColorWindowFinalColorLevelRequestedRenderModeRequestedRenderModeMaxMemoryInBytesMaxMemoryFraction ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaxMemoryFraction  of  << this -> MaxMemoryFraction ) ; return this -> MaxMemoryFraction ; } ;
## Error: expected ';'!!!

proc SetMaxMemoryFractionInterpolationMode*(this: var vtkSmartVolumeMapper;
    _arg: cint) {.importcpp: "SetMaxMemoryFractionInterpolationMode",
                header: "vtkSmartVolumeMapper.h".}
proc GetMaxMemoryFractionMinValueInterpolationModeMinValue*(
    this: var vtkSmartVolumeMapper): cint {.importcpp: "GetMaxMemoryFractionMinValueInterpolationModeMinValue",
                                        header: "vtkSmartVolumeMapper.h".}
proc GetMaxMemoryFractionMaxValueInterpolationModeMaxValue*(
    this: var vtkSmartVolumeMapper): cint {.importcpp: "GetMaxMemoryFractionMaxValueInterpolationModeMaxValue",
                                        header: "vtkSmartVolumeMapper.h".}
## !!!Ignored construct:  virtual int GetFinalColorWindowFinalColorLevelRequestedRenderModeRequestedRenderModeMaxMemoryInBytesMaxMemoryFractionInterpolationMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InterpolationMode  of  << this -> InterpolationMode ) ; return this -> InterpolationMode ; } ;
## Error: expected ';'!!!

proc SetInterpolationModeToNearestNeighbor*(this: var vtkSmartVolumeMapper) {.
    importcpp: "SetInterpolationModeToNearestNeighbor",
    header: "vtkSmartVolumeMapper.h".}
proc SetInterpolationModeToLinear*(this: var vtkSmartVolumeMapper) {.
    importcpp: "SetInterpolationModeToLinear", header: "vtkSmartVolumeMapper.h".}
proc SetInterpolationModeToCubic*(this: var vtkSmartVolumeMapper) {.
    importcpp: "SetInterpolationModeToCubic", header: "vtkSmartVolumeMapper.h".}
proc CreateCanonicalView*(this: var vtkSmartVolumeMapper; ren: ptr vtkRenderer;
                         volume: ptr vtkVolume; volume2: ptr vtkVolume;
                         image: ptr vtkImageData; blend_mode: cint;
                         viewDirection: array[3, cdouble];
                         viewUp: array[3, cdouble]) {.
    importcpp: "CreateCanonicalView", header: "vtkSmartVolumeMapper.h".}
proc SetMaxMemoryFractionInterpolationModeInteractiveUpdateRate*(
    this: var vtkSmartVolumeMapper; _arg: cdouble) {.
    importcpp: "SetMaxMemoryFractionInterpolationModeInteractiveUpdateRate",
    header: "vtkSmartVolumeMapper.h".}
proc GetMaxMemoryFractionMinValueInterpolationModeMinValueInteractiveUpdateRateMinValue*(
    this: var vtkSmartVolumeMapper): cdouble {.importcpp: "GetMaxMemoryFractionMinValueInterpolationModeMinValueInteractiveUpdateRateMinValue",
    header: "vtkSmartVolumeMapper.h".}
proc GetMaxMemoryFractionMaxValueInterpolationModeMaxValueInteractiveUpdateRateMaxValue*(
    this: var vtkSmartVolumeMapper): cdouble {.importcpp: "GetMaxMemoryFractionMaxValueInterpolationModeMaxValueInteractiveUpdateRateMaxValue",
    header: "vtkSmartVolumeMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the update rate at or above which this is considered an
  ##  interactive render.
  ##  Initial value is 1.0.
  ##
## !!!Ignored construct:  virtual double GetFinalColorWindowFinalColorLevelRequestedRenderModeRequestedRenderModeMaxMemoryInBytesMaxMemoryFractionInterpolationModeInteractiveUpdateRate ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InteractiveUpdateRate  of  << this -> InteractiveUpdateRate ) ; return this -> InteractiveUpdateRate ; } ;
## Error: expected ';'!!!

proc SetMaxMemoryFractionInterpolationModeInteractiveUpdateRateInteractiveAdjustSampleDistances*(
    this: var vtkSmartVolumeMapper; _arg: vtkTypeBool) {.importcpp: "SetMaxMemoryFractionInterpolationModeInteractiveUpdateRateInteractiveAdjustSampleDistances",
    header: "vtkSmartVolumeMapper.h".}
proc GetMaxMemoryFractionMinValueInterpolationModeMinValueInteractiveUpdateRateMinValueInteractiveAdjustSampleDistancesMinValue*(
    this: var vtkSmartVolumeMapper): vtkTypeBool {.importcpp: "GetMaxMemoryFractionMinValueInterpolationModeMinValueInteractiveUpdateRateMinValueInteractiveAdjustSampleDistancesMinValue",
    header: "vtkSmartVolumeMapper.h".}
proc GetMaxMemoryFractionMaxValueInterpolationModeMaxValueInteractiveUpdateRateMaxValueInteractiveAdjustSampleDistancesMaxValue*(
    this: var vtkSmartVolumeMapper): vtkTypeBool {.importcpp: "GetMaxMemoryFractionMaxValueInterpolationModeMaxValueInteractiveUpdateRateMaxValueInteractiveAdjustSampleDistancesMaxValue",
    header: "vtkSmartVolumeMapper.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetFinalColorWindowFinalColorLevelRequestedRenderModeRequestedRenderModeMaxMemoryInBytesMaxMemoryFractionInterpolationModeInteractiveUpdateRateInteractiveAdjustSampleDistances ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InteractiveAdjustSampleDistances  of  << this -> InteractiveAdjustSampleDistances ) ; return this -> InteractiveAdjustSampleDistances ; } ;
## Error: expected ';'!!!

proc InteractiveAdjustSampleDistancesOn*(this: var vtkSmartVolumeMapper) {.
    importcpp: "InteractiveAdjustSampleDistancesOn",
    header: "vtkSmartVolumeMapper.h".}
proc InteractiveAdjustSampleDistancesOff*(this: var vtkSmartVolumeMapper) {.
    importcpp: "InteractiveAdjustSampleDistancesOff",
    header: "vtkSmartVolumeMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  If AutoAdjustSampleDistances is on, the ImageSampleDistance
  ##  will be varied to achieve the allocated render time of this
  ##  prop (controlled by the desired update rate and any culling in
  ##  use).
  ##  Note that, this flag is ignored when InteractiveAdjustSampleDistances is
  ##  enabled. To explicitly set and use this flag, one must disable
  ##  InteractiveAdjustSampleDistances.
  ##
proc SetMaxMemoryFractionInterpolationModeInteractiveUpdateRateInteractiveAdjustSampleDistancesAutoAdjustSampleDistances*(
    this: var vtkSmartVolumeMapper; _arg: vtkTypeBool) {.importcpp: "SetMaxMemoryFractionInterpolationModeInteractiveUpdateRateInteractiveAdjustSampleDistancesAutoAdjustSampleDistances",
    header: "vtkSmartVolumeMapper.h".}
proc GetMaxMemoryFractionMinValueInterpolationModeMinValueInteractiveUpdateRateMinValueInteractiveAdjustSampleDistancesMinValueAutoAdjustSampleDistancesMinValue*(
    this: var vtkSmartVolumeMapper): vtkTypeBool {.importcpp: "GetMaxMemoryFractionMinValueInterpolationModeMinValueInteractiveUpdateRateMinValueInteractiveAdjustSampleDistancesMinValueAutoAdjustSampleDistancesMinValue",
    header: "vtkSmartVolumeMapper.h".}
proc GetMaxMemoryFractionMaxValueInterpolationModeMaxValueInteractiveUpdateRateMaxValueInteractiveAdjustSampleDistancesMaxValueAutoAdjustSampleDistancesMaxValue*(
    this: var vtkSmartVolumeMapper): vtkTypeBool {.importcpp: "GetMaxMemoryFractionMaxValueInterpolationModeMaxValueInteractiveUpdateRateMaxValueInteractiveAdjustSampleDistancesMaxValueAutoAdjustSampleDistancesMaxValue",
    header: "vtkSmartVolumeMapper.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetFinalColorWindowFinalColorLevelRequestedRenderModeRequestedRenderModeMaxMemoryInBytesMaxMemoryFractionInterpolationModeInteractiveUpdateRateInteractiveAdjustSampleDistancesAutoAdjustSampleDistances ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AutoAdjustSampleDistances  of  << this -> AutoAdjustSampleDistances ) ; return this -> AutoAdjustSampleDistances ; } ;
## Error: expected ';'!!!

proc AutoAdjustSampleDistancesOn*(this: var vtkSmartVolumeMapper) {.
    importcpp: "AutoAdjustSampleDistancesOn", header: "vtkSmartVolumeMapper.h".}
proc AutoAdjustSampleDistancesOff*(this: var vtkSmartVolumeMapper) {.
    importcpp: "AutoAdjustSampleDistancesOff", header: "vtkSmartVolumeMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the distance between samples used for rendering
  ##  when AutoAdjustSampleDistances is off, or when this mapper
  ##  has more than 1 second allocated to it for rendering.
  ##  If SampleDistance is negative, it will be computed based on the dataset
  ##  spacing. Initial value is -1.0.
  ##
proc SetFinalColorWindowFinalColorLevelMaxMemoryInBytesSampleDistance*(
    this: var vtkSmartVolumeMapper; _arg: cfloat) {.importcpp: "SetFinalColorWindowFinalColorLevelMaxMemoryInBytesSampleDistance",
    header: "vtkSmartVolumeMapper.h".}
## !!!Ignored construct:  virtual float GetFinalColorWindowFinalColorLevelRequestedRenderModeRequestedRenderModeMaxMemoryInBytesMaxMemoryFractionInterpolationModeInteractiveUpdateRateInteractiveAdjustSampleDistancesAutoAdjustSampleDistancesSampleDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SampleDistance  of  << this -> SampleDistance ) ; return this -> SampleDistance ; } ;
## Error: expected ';'!!!

proc SetMaxMemoryFractionInterpolationModeInteractiveUpdateRateInteractiveAdjustSampleDistancesAutoAdjustSampleDistancesGlobalIlluminationReach*(
    this: var vtkSmartVolumeMapper; _arg: cfloat) {.importcpp: "SetMaxMemoryFractionInterpolationModeInteractiveUpdateRateInteractiveAdjustSampleDistancesAutoAdjustSampleDistancesGlobalIlluminationReach",
    header: "vtkSmartVolumeMapper.h".}
proc GetMaxMemoryFractionMinValueInterpolationModeMinValueInteractiveUpdateRateMinValueInteractiveAdjustSampleDistancesMinValueAutoAdjustSampleDistancesMinValueGlobalIlluminationReachMinValue*(
    this: var vtkSmartVolumeMapper): cfloat {.importcpp: "GetMaxMemoryFractionMinValueInterpolationModeMinValueInteractiveUpdateRateMinValueInteractiveAdjustSampleDistancesMinValueAutoAdjustSampleDistancesMinValueGlobalIlluminationReachMinValue",
    header: "vtkSmartVolumeMapper.h".}
proc GetMaxMemoryFractionMaxValueInterpolationModeMaxValueInteractiveUpdateRateMaxValueInteractiveAdjustSampleDistancesMaxValueAutoAdjustSampleDistancesMaxValueGlobalIlluminationReachMaxValue*(
    this: var vtkSmartVolumeMapper): cfloat {.importcpp: "GetMaxMemoryFractionMaxValueInterpolationModeMaxValueInteractiveUpdateRateMaxValueInteractiveAdjustSampleDistancesMaxValueAutoAdjustSampleDistancesMaxValueGlobalIlluminationReachMaxValue",
    header: "vtkSmartVolumeMapper.h".}
## !!!Ignored construct:  virtual float GetFinalColorWindowFinalColorLevelRequestedRenderModeRequestedRenderModeMaxMemoryInBytesMaxMemoryFractionInterpolationModeInteractiveUpdateRateInteractiveAdjustSampleDistancesAutoAdjustSampleDistancesSampleDistanceGlobalIlluminationReach ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GlobalIlluminationReach  of  << this -> GlobalIlluminationReach ) ; return this -> GlobalIlluminationReach ; } ;
## Error: expected ';'!!!

proc SetMaxMemoryFractionInterpolationModeInteractiveUpdateRateInteractiveAdjustSampleDistancesAutoAdjustSampleDistancesGlobalIlluminationReachVolumetricScatteringBlending*(
    this: var vtkSmartVolumeMapper; _arg: cfloat) {.importcpp: "SetMaxMemoryFractionInterpolationModeInteractiveUpdateRateInteractiveAdjustSampleDistancesAutoAdjustSampleDistancesGlobalIlluminationReachVolumetricScatteringBlending",
    header: "vtkSmartVolumeMapper.h".}
proc GetMaxMemoryFractionMinValueInterpolationModeMinValueInteractiveUpdateRateMinValueInteractiveAdjustSampleDistancesMinValueAutoAdjustSampleDistancesMinValueGlobalIlluminationReachMinValueVolumetricScatteringBlendingMinValue*(
    this: var vtkSmartVolumeMapper): cfloat {.importcpp: "GetMaxMemoryFractionMinValueInterpolationModeMinValueInteractiveUpdateRateMinValueInteractiveAdjustSampleDistancesMinValueAutoAdjustSampleDistancesMinValueGlobalIlluminationReachMinValueVolumetricScatteringBlendingMinValue",
    header: "vtkSmartVolumeMapper.h".}
proc GetMaxMemoryFractionMaxValueInterpolationModeMaxValueInteractiveUpdateRateMaxValueInteractiveAdjustSampleDistancesMaxValueAutoAdjustSampleDistancesMaxValueGlobalIlluminationReachMaxValueVolumetricScatteringBlendingMaxValue*(
    this: var vtkSmartVolumeMapper): cfloat {.importcpp: "GetMaxMemoryFractionMaxValueInterpolationModeMaxValueInteractiveUpdateRateMaxValueInteractiveAdjustSampleDistancesMaxValueAutoAdjustSampleDistancesMaxValueGlobalIlluminationReachMaxValueVolumetricScatteringBlendingMaxValue",
    header: "vtkSmartVolumeMapper.h".}
## !!!Ignored construct:  virtual float GetFinalColorWindowFinalColorLevelRequestedRenderModeRequestedRenderModeMaxMemoryInBytesMaxMemoryFractionInterpolationModeInteractiveUpdateRateInteractiveAdjustSampleDistancesAutoAdjustSampleDistancesSampleDistanceGlobalIlluminationReachVolumetricScatteringBlending ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << VolumetricScatteringBlending  of  << this -> VolumetricScatteringBlending ) ; return this -> VolumetricScatteringBlending ; } ;
## Error: expected ';'!!!

proc Render*(this: var vtkSmartVolumeMapper; a2: ptr vtkRenderer; a3: ptr vtkVolume) {.
    importcpp: "Render", header: "vtkSmartVolumeMapper.h".}
proc ReleaseGraphicsResources*(this: var vtkSmartVolumeMapper; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkSmartVolumeMapper.h".}
type
  vtkSmartVolumeMapperVectorModeType* {.size: sizeof(cint), importcpp: "vtkSmartVolumeMapper::VectorModeType",
                                       header: "vtkSmartVolumeMapper.h".} = enum
    DISABLED = -1, MAGNITUDE = 0, COMPONENT = 1


proc SetVectorMode*(this: var vtkSmartVolumeMapper; mode: cint) {.
    importcpp: "SetVectorMode", header: "vtkSmartVolumeMapper.h".}
## !!!Ignored construct:  virtual int GetFinalColorWindowFinalColorLevelRequestedRenderModeRequestedRenderModeMaxMemoryInBytesMaxMemoryFractionInterpolationModeInteractiveUpdateRateInteractiveAdjustSampleDistancesAutoAdjustSampleDistancesSampleDistanceGlobalIlluminationReachVolumetricScatteringBlendingVectorMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << VectorMode  of  << this -> VectorMode ) ; return this -> VectorMode ; } ;
## Error: expected ';'!!!

proc SetMaxMemoryFractionInterpolationModeInteractiveUpdateRateInteractiveAdjustSampleDistancesAutoAdjustSampleDistancesGlobalIlluminationReachVolumetricScatteringBlendingVectorComponent*(
    this: var vtkSmartVolumeMapper; _arg: cint) {.importcpp: "SetMaxMemoryFractionInterpolationModeInteractiveUpdateRateInteractiveAdjustSampleDistancesAutoAdjustSampleDistancesGlobalIlluminationReachVolumetricScatteringBlendingVectorComponent",
    header: "vtkSmartVolumeMapper.h".}
proc GetMaxMemoryFractionMinValueInterpolationModeMinValueInteractiveUpdateRateMinValueInteractiveAdjustSampleDistancesMinValueAutoAdjustSampleDistancesMinValueGlobalIlluminationReachMinValueVolumetricScatteringBlendingMinValueVectorComponentMinValue*(
    this: var vtkSmartVolumeMapper): cint {.importcpp: "GetMaxMemoryFractionMinValueInterpolationModeMinValueInteractiveUpdateRateMinValueInteractiveAdjustSampleDistancesMinValueAutoAdjustSampleDistancesMinValueGlobalIlluminationReachMinValueVolumetricScatteringBlendingMinValueVectorComponentMinValue",
                                        header: "vtkSmartVolumeMapper.h".}
proc GetMaxMemoryFractionMaxValueInterpolationModeMaxValueInteractiveUpdateRateMaxValueInteractiveAdjustSampleDistancesMaxValueAutoAdjustSampleDistancesMaxValueGlobalIlluminationReachMaxValueVolumetricScatteringBlendingMaxValueVectorComponentMaxValue*(
    this: var vtkSmartVolumeMapper): cint {.importcpp: "GetMaxMemoryFractionMaxValueInterpolationModeMaxValueInteractiveUpdateRateMaxValueInteractiveAdjustSampleDistancesMaxValueAutoAdjustSampleDistancesMaxValueGlobalIlluminationReachMaxValueVolumetricScatteringBlendingMaxValueVectorComponentMaxValue",
                                        header: "vtkSmartVolumeMapper.h".}
## !!!Ignored construct:  virtual int GetFinalColorWindowFinalColorLevelRequestedRenderModeRequestedRenderModeMaxMemoryInBytesMaxMemoryFractionInterpolationModeInteractiveUpdateRateInteractiveAdjustSampleDistancesAutoAdjustSampleDistancesSampleDistanceGlobalIlluminationReachVolumetricScatteringBlendingVectorModeVectorComponent ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << VectorComponent  of  << this -> VectorComponent ) ; return this -> VectorComponent ; } ;
## Error: expected ';'!!!

proc SetTransfer2DYAxisArray*(this: var vtkSmartVolumeMapper; _arg: cstring) {.
    importcpp: "SetTransfer2DYAxisArray", header: "vtkSmartVolumeMapper.h".}
proc GetTransfer2DYAxisArray*(this: var vtkSmartVolumeMapper): cstring {.
    importcpp: "GetTransfer2DYAxisArray", header: "vtkSmartVolumeMapper.h".}
  ## @}