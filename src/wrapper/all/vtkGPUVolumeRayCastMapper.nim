## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGPUVolumeRayCastMapper.h
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
##  @class   vtkGPUVolumeRayCastMapper
##  @brief   Ray casting performed on the GPU.
##
##  vtkGPUVolumeRayCastMapper is a volume mapper that performs ray casting on
##  the GPU using fragment programs.
##
##  This mapper supports connections in multiple ports of input 0 (port 0 being
##  the only required connection). It is up to the concrete implementation
##  whether additional inputs will be used during rendering. This class maintains
##  a list of the currently active input ports (Ports) as well as a list of the
##  ports that have been disconnected (RemovedPorts). RemovedPorts is used the
##  the concrete implementation to clean up internal structures.
##
##

import
  vtkRenderingVolumeModule, vtkVolumeMapper

discard "forward decl of vtkContourValues"
discard "forward decl of vtkRenderWindow"
discard "forward decl of vtkVolumeProperty"
type
  vtkGPUVolumeRayCastMapper* {.importcpp: "vtkGPUVolumeRayCastMapper",
                              header: "vtkGPUVolumeRayCastMapper.h", bycopy.} = object of vtkVolumeMapper
    vtkGPUVolumeRayCastMapper* {.importc: "vtkGPUVolumeRayCastMapper".}: VTK_NEWINSTANCE
    ##  Render to texture mode flag
    ##  Depth image scalar type
    ##  Clamp depth values to the depth of the face at which the ray
    ##  exits the volume
    ##  Enable / disable stochastic jittering
    ##  Secondary rays ambient/global adjustment coefficient
    ##  Enable / disable two pass rendering
    ##  The distance between sample points along the ray
    ##  1 if we are generating the canonical image, 0 otherwise
    ## /@{
    ## *
    ##  Set the mapper in AMR Mode or not. Initial value is false.
    ##  Called only by the vtkKWAMRVolumeMapper
    ##
    ##  Transfer function range type
    ##  Point data or cell data (or field data, not handled) ?
    ## *
    ##  Compute the cropping planes clipped by the bounds of the volume.
    ##  The result is put into this->ClippedCroppingRegionPlanes.
    ##  NOTE: IT WILL BE MOVED UP TO vtkVolumeMapper after bullet proof usage
    ##  in this mapper. Other subclasses will use the ClippedCroppingRegionsPlanes
    ##  members instead of CroppingRegionPlanes.
    ##  \pre volume_exists: this->GetInput()!=0
    ##  \pre valid_cropping: this->Cropping &&
    ##  this->CroppingRegionPlanes[0]<this->CroppingRegionPlanes[1] &&
    ##  this->CroppingRegionPlanes[2]<this->CroppingRegionPlanes[3] &&
    ##  this->CroppingRegionPlanes[4]<this->CroppingRegionPlanes[5])
    ##
    ## *
    ##  This is needed only to check if the input data has been changed since the last
    ##  Render() call.
    ##
    ## *
    ##  Define the array used for the Y axis of transfer 2D.
    ##  This is used when the transfer function  mode is set to 2D. If unset, the
    ##  default is to use the gradient of the scalar.
    ##


proc New*(): ptr vtkGPUVolumeRayCastMapper {.
    importcpp: "vtkGPUVolumeRayCastMapper::New(@)",
    header: "vtkGPUVolumeRayCastMapper.h".}
type
  vtkGPUVolumeRayCastMapperSuperclass* = vtkVolumeMapper

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGPUVolumeRayCastMapper::IsTypeOf(@)",
    header: "vtkGPUVolumeRayCastMapper.h".}
proc IsA*(this: var vtkGPUVolumeRayCastMapper; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkGPUVolumeRayCastMapper.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGPUVolumeRayCastMapper {.
    importcpp: "vtkGPUVolumeRayCastMapper::SafeDownCast(@)",
    header: "vtkGPUVolumeRayCastMapper.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGPUVolumeRayCastMapper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkVolumeMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGPUVolumeRayCastMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGPUVolumeRayCastMapper :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGPUVolumeRayCastMapper; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGPUVolumeRayCastMapper.h".}
proc SetAutoAdjustSampleDistances*(this: var vtkGPUVolumeRayCastMapper;
                                  _arg: vtkTypeBool) {.
    importcpp: "SetAutoAdjustSampleDistances",
    header: "vtkGPUVolumeRayCastMapper.h".}
proc GetAutoAdjustSampleDistancesMinValue*(this: var vtkGPUVolumeRayCastMapper): vtkTypeBool {.
    importcpp: "GetAutoAdjustSampleDistancesMinValue",
    header: "vtkGPUVolumeRayCastMapper.h".}
proc GetAutoAdjustSampleDistancesMaxValue*(this: var vtkGPUVolumeRayCastMapper): vtkTypeBool {.
    importcpp: "GetAutoAdjustSampleDistancesMaxValue",
    header: "vtkGPUVolumeRayCastMapper.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetAutoAdjustSampleDistances ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AutoAdjustSampleDistances  of  << this -> AutoAdjustSampleDistances ) ; return this -> AutoAdjustSampleDistances ; } ;
## Error: expected ';'!!!

proc AutoAdjustSampleDistancesOn*(this: var vtkGPUVolumeRayCastMapper) {.
    importcpp: "AutoAdjustSampleDistancesOn",
    header: "vtkGPUVolumeRayCastMapper.h".}
proc AutoAdjustSampleDistancesOff*(this: var vtkGPUVolumeRayCastMapper) {.
    importcpp: "AutoAdjustSampleDistancesOff",
    header: "vtkGPUVolumeRayCastMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  Compute the sample distance from the data spacing.  When the number of
  ##  voxels is 8, the sample distance will be roughly 1/200 the average voxel
  ##  size. The distance will grow proportionally to numVoxels^(1/3). Off by default.
  ##
proc SetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacing*(
    this: var vtkGPUVolumeRayCastMapper; _arg: vtkTypeBool) {.
    importcpp: "SetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacing",
    header: "vtkGPUVolumeRayCastMapper.h".}
proc GetAutoAdjustSampleDistancesMinValueLockSampleDistanceToInputSpacingMinValue*(
    this: var vtkGPUVolumeRayCastMapper): vtkTypeBool {.importcpp: "GetAutoAdjustSampleDistancesMinValueLockSampleDistanceToInputSpacingMinValue",
    header: "vtkGPUVolumeRayCastMapper.h".}
proc GetAutoAdjustSampleDistancesMaxValueLockSampleDistanceToInputSpacingMaxValue*(
    this: var vtkGPUVolumeRayCastMapper): vtkTypeBool {.importcpp: "GetAutoAdjustSampleDistancesMaxValueLockSampleDistanceToInputSpacingMaxValue",
    header: "vtkGPUVolumeRayCastMapper.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacing ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LockSampleDistanceToInputSpacing  of  << this -> LockSampleDistanceToInputSpacing ) ; return this -> LockSampleDistanceToInputSpacing ; } ;
## Error: expected ';'!!!

proc LockSampleDistanceToInputSpacingOn*(this: var vtkGPUVolumeRayCastMapper) {.
    importcpp: "LockSampleDistanceToInputSpacingOn",
    header: "vtkGPUVolumeRayCastMapper.h".}
proc LockSampleDistanceToInputSpacingOff*(this: var vtkGPUVolumeRayCastMapper) {.
    importcpp: "LockSampleDistanceToInputSpacingOff",
    header: "vtkGPUVolumeRayCastMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  If UseJittering is on, each ray traversal direction will be
  ##  perturbed slightly using a noise-texture to get rid of wood-grain
  ##  effect.
  ##
proc SetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingUseJittering*(
    this: var vtkGPUVolumeRayCastMapper; _arg: vtkTypeBool) {.importcpp: "SetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingUseJittering",
    header: "vtkGPUVolumeRayCastMapper.h".}
proc GetAutoAdjustSampleDistancesMinValueLockSampleDistanceToInputSpacingMinValueUseJitteringMinValue*(
    this: var vtkGPUVolumeRayCastMapper): vtkTypeBool {.importcpp: "GetAutoAdjustSampleDistancesMinValueLockSampleDistanceToInputSpacingMinValueUseJitteringMinValue",
    header: "vtkGPUVolumeRayCastMapper.h".}
proc GetAutoAdjustSampleDistancesMaxValueLockSampleDistanceToInputSpacingMaxValueUseJitteringMaxValue*(
    this: var vtkGPUVolumeRayCastMapper): vtkTypeBool {.importcpp: "GetAutoAdjustSampleDistancesMaxValueLockSampleDistanceToInputSpacingMaxValueUseJitteringMaxValue",
    header: "vtkGPUVolumeRayCastMapper.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingUseJittering ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseJittering  of  << this -> UseJittering ) ; return this -> UseJittering ; } ;
## Error: expected ';'!!!

proc UseJitteringOn*(this: var vtkGPUVolumeRayCastMapper) {.
    importcpp: "UseJitteringOn", header: "vtkGPUVolumeRayCastMapper.h".}
proc UseJitteringOff*(this: var vtkGPUVolumeRayCastMapper) {.
    importcpp: "UseJitteringOff", header: "vtkGPUVolumeRayCastMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  If UseDepthPass is on, the mapper will use two passes. In the first
  ##  pass, an isocontour depth buffer will be utilized as starting point
  ##  for ray-casting hence eliminating traversal on voxels that are
  ##  not going to participate in final rendering. UseDepthPass requires
  ##  reasonable contour values to be set which can be set by calling
  ##  GetDepthPassContourValues() method and using vtkControurValues API.
  ##
proc SetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingUseJitteringUseDepthPass*(
    this: var vtkGPUVolumeRayCastMapper; _arg: vtkTypeBool) {.importcpp: "SetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingUseJitteringUseDepthPass",
    header: "vtkGPUVolumeRayCastMapper.h".}
proc GetAutoAdjustSampleDistancesMinValueLockSampleDistanceToInputSpacingMinValueUseJitteringMinValueUseDepthPassMinValue*(
    this: var vtkGPUVolumeRayCastMapper): vtkTypeBool {.importcpp: "GetAutoAdjustSampleDistancesMinValueLockSampleDistanceToInputSpacingMinValueUseJitteringMinValueUseDepthPassMinValue",
    header: "vtkGPUVolumeRayCastMapper.h".}
proc GetAutoAdjustSampleDistancesMaxValueLockSampleDistanceToInputSpacingMaxValueUseJitteringMaxValueUseDepthPassMaxValue*(
    this: var vtkGPUVolumeRayCastMapper): vtkTypeBool {.importcpp: "GetAutoAdjustSampleDistancesMaxValueLockSampleDistanceToInputSpacingMaxValueUseJitteringMaxValueUseDepthPassMaxValue",
    header: "vtkGPUVolumeRayCastMapper.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingUseJitteringUseDepthPass ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseDepthPass  of  << this -> UseDepthPass ) ; return this -> UseDepthPass ; } ;
## Error: expected ';'!!!

proc UseDepthPassOn*(this: var vtkGPUVolumeRayCastMapper) {.
    importcpp: "UseDepthPassOn", header: "vtkGPUVolumeRayCastMapper.h".}
proc UseDepthPassOff*(this: var vtkGPUVolumeRayCastMapper) {.
    importcpp: "UseDepthPassOff", header: "vtkGPUVolumeRayCastMapper.h".}
  ## /@}
  ## *
  ##  Return handle to contour values container so
  ##  that values can be set by the application. Contour values
  ##  will be used only when UseDepthPass is on.
  ##
proc GetDepthPassContourValues*(this: var vtkGPUVolumeRayCastMapper): ptr vtkContourValues {.
    importcpp: "GetDepthPassContourValues", header: "vtkGPUVolumeRayCastMapper.h".}
proc SetSampleDistance*(this: var vtkGPUVolumeRayCastMapper; _arg: cfloat) {.
    importcpp: "SetSampleDistance", header: "vtkGPUVolumeRayCastMapper.h".}
## !!!Ignored construct:  virtual float GetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingUseJitteringUseDepthPassSampleDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SampleDistance  of  << this -> SampleDistance ) ; return this -> SampleDistance ; } ;
## Error: expected ';'!!!

proc SetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingUseJitteringUseDepthPassImageSampleDistance*(
    this: var vtkGPUVolumeRayCastMapper; _arg: cfloat) {.importcpp: "SetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingUseJitteringUseDepthPassImageSampleDistance",
    header: "vtkGPUVolumeRayCastMapper.h".}
proc GetAutoAdjustSampleDistancesMinValueLockSampleDistanceToInputSpacingMinValueUseJitteringMinValueUseDepthPassMinValueImageSampleDistanceMinValue*(
    this: var vtkGPUVolumeRayCastMapper): cfloat {.importcpp: "GetAutoAdjustSampleDistancesMinValueLockSampleDistanceToInputSpacingMinValueUseJitteringMinValueUseDepthPassMinValueImageSampleDistanceMinValue",
    header: "vtkGPUVolumeRayCastMapper.h".}
proc GetAutoAdjustSampleDistancesMaxValueLockSampleDistanceToInputSpacingMaxValueUseJitteringMaxValueUseDepthPassMaxValueImageSampleDistanceMaxValue*(
    this: var vtkGPUVolumeRayCastMapper): cfloat {.importcpp: "GetAutoAdjustSampleDistancesMaxValueLockSampleDistanceToInputSpacingMaxValueUseJitteringMaxValueUseDepthPassMaxValueImageSampleDistanceMaxValue",
    header: "vtkGPUVolumeRayCastMapper.h".}
## !!!Ignored construct:  virtual float GetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingUseJitteringUseDepthPassSampleDistanceImageSampleDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ImageSampleDistance  of  << this -> ImageSampleDistance ) ; return this -> ImageSampleDistance ; } ;
## Error: expected ';'!!!

proc SetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingUseJitteringUseDepthPassImageSampleDistanceMinimumImageSampleDistance*(
    this: var vtkGPUVolumeRayCastMapper; _arg: cfloat) {.importcpp: "SetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingUseJitteringUseDepthPassImageSampleDistanceMinimumImageSampleDistance",
    header: "vtkGPUVolumeRayCastMapper.h".}
proc GetAutoAdjustSampleDistancesMinValueLockSampleDistanceToInputSpacingMinValueUseJitteringMinValueUseDepthPassMinValueImageSampleDistanceMinValueMinimumImageSampleDistanceMinValue*(
    this: var vtkGPUVolumeRayCastMapper): cfloat {.importcpp: "GetAutoAdjustSampleDistancesMinValueLockSampleDistanceToInputSpacingMinValueUseJitteringMinValueUseDepthPassMinValueImageSampleDistanceMinValueMinimumImageSampleDistanceMinValue",
    header: "vtkGPUVolumeRayCastMapper.h".}
proc GetAutoAdjustSampleDistancesMaxValueLockSampleDistanceToInputSpacingMaxValueUseJitteringMaxValueUseDepthPassMaxValueImageSampleDistanceMaxValueMinimumImageSampleDistanceMaxValue*(
    this: var vtkGPUVolumeRayCastMapper): cfloat {.importcpp: "GetAutoAdjustSampleDistancesMaxValueLockSampleDistanceToInputSpacingMaxValueUseJitteringMaxValueUseDepthPassMaxValueImageSampleDistanceMaxValueMinimumImageSampleDistanceMaxValue",
    header: "vtkGPUVolumeRayCastMapper.h".}
## !!!Ignored construct:  virtual float GetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingUseJitteringUseDepthPassSampleDistanceImageSampleDistanceMinimumImageSampleDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MinimumImageSampleDistance  of  << this -> MinimumImageSampleDistance ) ; return this -> MinimumImageSampleDistance ; } ;
## Error: expected ';'!!!

proc SetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingUseJitteringUseDepthPassImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistance*(
    this: var vtkGPUVolumeRayCastMapper; _arg: cfloat) {.importcpp: "SetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingUseJitteringUseDepthPassImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistance",
    header: "vtkGPUVolumeRayCastMapper.h".}
proc GetAutoAdjustSampleDistancesMinValueLockSampleDistanceToInputSpacingMinValueUseJitteringMinValueUseDepthPassMinValueImageSampleDistanceMinValueMinimumImageSampleDistanceMinValueMaximumImageSampleDistanceMinValue*(
    this: var vtkGPUVolumeRayCastMapper): cfloat {.importcpp: "GetAutoAdjustSampleDistancesMinValueLockSampleDistanceToInputSpacingMinValueUseJitteringMinValueUseDepthPassMinValueImageSampleDistanceMinValueMinimumImageSampleDistanceMinValueMaximumImageSampleDistanceMinValue",
    header: "vtkGPUVolumeRayCastMapper.h".}
proc GetAutoAdjustSampleDistancesMaxValueLockSampleDistanceToInputSpacingMaxValueUseJitteringMaxValueUseDepthPassMaxValueImageSampleDistanceMaxValueMinimumImageSampleDistanceMaxValueMaximumImageSampleDistanceMaxValue*(
    this: var vtkGPUVolumeRayCastMapper): cfloat {.importcpp: "GetAutoAdjustSampleDistancesMaxValueLockSampleDistanceToInputSpacingMaxValueUseJitteringMaxValueUseDepthPassMaxValueImageSampleDistanceMaxValueMinimumImageSampleDistanceMaxValueMaximumImageSampleDistanceMaxValue",
    header: "vtkGPUVolumeRayCastMapper.h".}
## !!!Ignored construct:  virtual float GetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingUseJitteringUseDepthPassSampleDistanceImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumImageSampleDistance  of  << this -> MaximumImageSampleDistance ) ; return this -> MaximumImageSampleDistance ; } ;
## Error: expected ';'!!!

proc SetSampleDistanceFinalColorWindow*(this: var vtkGPUVolumeRayCastMapper;
                                       _arg: cfloat) {.
    importcpp: "SetSampleDistanceFinalColorWindow",
    header: "vtkGPUVolumeRayCastMapper.h".}
## !!!Ignored construct:  virtual float GetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingUseJitteringUseDepthPassSampleDistanceImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceFinalColorWindow ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FinalColorWindow  of  << this -> FinalColorWindow ) ; return this -> FinalColorWindow ; } ;
## Error: expected ';'!!!

proc SetSampleDistanceFinalColorWindowFinalColorLevel*(
    this: var vtkGPUVolumeRayCastMapper; _arg: cfloat) {.
    importcpp: "SetSampleDistanceFinalColorWindowFinalColorLevel",
    header: "vtkGPUVolumeRayCastMapper.h".}
## !!!Ignored construct:  virtual float GetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingUseJitteringUseDepthPassSampleDistanceImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceFinalColorWindowFinalColorLevel ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FinalColorLevel  of  << this -> FinalColorLevel ) ; return this -> FinalColorLevel ; } ;
## Error: expected ';'!!!

proc SetSampleDistanceFinalColorWindowFinalColorLevelMaxMemoryInBytes*(
    this: var vtkGPUVolumeRayCastMapper; _arg: vtkIdType) {.importcpp: "SetSampleDistanceFinalColorWindowFinalColorLevelMaxMemoryInBytes",
    header: "vtkGPUVolumeRayCastMapper.h".}
## !!!Ignored construct:  virtual vtkIdType GetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingUseJitteringUseDepthPassSampleDistanceImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceFinalColorWindowFinalColorLevelMaxMemoryInBytes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaxMemoryInBytes  of  << this -> MaxMemoryInBytes ) ; return this -> MaxMemoryInBytes ; } ;
## Error: expected ';'!!!

proc SetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingUseJitteringUseDepthPassImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceMaxMemoryFraction*(
    this: var vtkGPUVolumeRayCastMapper; _arg: cfloat) {.importcpp: "SetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingUseJitteringUseDepthPassImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceMaxMemoryFraction",
    header: "vtkGPUVolumeRayCastMapper.h".}
proc GetAutoAdjustSampleDistancesMinValueLockSampleDistanceToInputSpacingMinValueUseJitteringMinValueUseDepthPassMinValueImageSampleDistanceMinValueMinimumImageSampleDistanceMinValueMaximumImageSampleDistanceMinValueMaxMemoryFractionMinValue*(
    this: var vtkGPUVolumeRayCastMapper): cfloat {.importcpp: "GetAutoAdjustSampleDistancesMinValueLockSampleDistanceToInputSpacingMinValueUseJitteringMinValueUseDepthPassMinValueImageSampleDistanceMinValueMinimumImageSampleDistanceMinValueMaximumImageSampleDistanceMinValueMaxMemoryFractionMinValue",
    header: "vtkGPUVolumeRayCastMapper.h".}
proc GetAutoAdjustSampleDistancesMaxValueLockSampleDistanceToInputSpacingMaxValueUseJitteringMaxValueUseDepthPassMaxValueImageSampleDistanceMaxValueMinimumImageSampleDistanceMaxValueMaximumImageSampleDistanceMaxValueMaxMemoryFractionMaxValue*(
    this: var vtkGPUVolumeRayCastMapper): cfloat {.importcpp: "GetAutoAdjustSampleDistancesMaxValueLockSampleDistanceToInputSpacingMaxValueUseJitteringMaxValueUseDepthPassMaxValueImageSampleDistanceMaxValueMinimumImageSampleDistanceMaxValueMaximumImageSampleDistanceMaxValueMaxMemoryFractionMaxValue",
    header: "vtkGPUVolumeRayCastMapper.h".}
## !!!Ignored construct:  virtual float GetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingUseJitteringUseDepthPassSampleDistanceImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceFinalColorWindowFinalColorLevelMaxMemoryInBytesMaxMemoryFraction ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaxMemoryFraction  of  << this -> MaxMemoryFraction ) ; return this -> MaxMemoryFraction ; } ;
## Error: expected ';'!!!

proc SetSampleDistanceFinalColorWindowFinalColorLevelMaxMemoryInBytesReportProgress*(
    this: var vtkGPUVolumeRayCastMapper; _arg: bool) {.importcpp: "SetSampleDistanceFinalColorWindowFinalColorLevelMaxMemoryInBytesReportProgress",
    header: "vtkGPUVolumeRayCastMapper.h".}
## !!!Ignored construct:  virtual bool GetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingUseJitteringUseDepthPassSampleDistanceImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceFinalColorWindowFinalColorLevelMaxMemoryInBytesMaxMemoryFractionReportProgress ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReportProgress  of  << this -> ReportProgress ) ; return this -> ReportProgress ; } ;
## Error: expected ';'!!!

proc IsRenderSupported*(this: var vtkGPUVolumeRayCastMapper;
                       vtkNotUsed: proc (a1: window): ptr vtkRenderWindow;
                       vtkNotUsed: proc (a1: property): ptr vtkVolumeProperty): cint {.
    importcpp: "IsRenderSupported", header: "vtkGPUVolumeRayCastMapper.h".}
proc CreateCanonicalView*(this: var vtkGPUVolumeRayCastMapper; ren: ptr vtkRenderer;
                         volume: ptr vtkVolume; image: ptr vtkImageData;
                         blend_mode: cint; viewDirection: array[3, cdouble];
                         viewUp: array[3, cdouble]) {.
    importcpp: "CreateCanonicalView", header: "vtkGPUVolumeRayCastMapper.h".}
proc SetMaskInput*(this: var vtkGPUVolumeRayCastMapper; mask: ptr vtkImageData) {.
    importcpp: "SetMaskInput", header: "vtkGPUVolumeRayCastMapper.h".}
proc GetnameMaskInput*(this: var vtkGPUVolumeRayCastMapper): ptr vtkImageData {.
    importcpp: "GetnameMaskInput", header: "vtkGPUVolumeRayCastMapper.h".}
  ## /@}
const
  vtkGPUVolumeRayCastMapperBinaryMaskType* = 0
  vtkGPUVolumeRayCastMapperLabelMapMaskType* = 1

proc SetSampleDistanceFinalColorWindowFinalColorLevelMaxMemoryInBytesReportProgressMaskType*(
    this: var vtkGPUVolumeRayCastMapper; _arg: cint) {.importcpp: "SetSampleDistanceFinalColorWindowFinalColorLevelMaxMemoryInBytesReportProgressMaskType",
    header: "vtkGPUVolumeRayCastMapper.h".}
## !!!Ignored construct:  virtual int GetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingUseJitteringUseDepthPassSampleDistanceImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceFinalColorWindowFinalColorLevelMaxMemoryInBytesMaxMemoryFractionReportProgressMaskType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaskType  of  << this -> MaskType ) ; return this -> MaskType ; } ;
## Error: expected ';'!!!

proc SetMaskTypeToBinary*(this: var vtkGPUVolumeRayCastMapper) {.
    importcpp: "SetMaskTypeToBinary", header: "vtkGPUVolumeRayCastMapper.h".}
proc SetMaskTypeToLabelMap*(this: var vtkGPUVolumeRayCastMapper) {.
    importcpp: "SetMaskTypeToLabelMap", header: "vtkGPUVolumeRayCastMapper.h".}
proc SetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingUseJitteringUseDepthPassImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceMaxMemoryFractionMaskBlendFactor*(
    this: var vtkGPUVolumeRayCastMapper; _arg: cfloat) {.importcpp: "SetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingUseJitteringUseDepthPassImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceMaxMemoryFractionMaskBlendFactor",
    header: "vtkGPUVolumeRayCastMapper.h".}
proc GetAutoAdjustSampleDistancesMinValueLockSampleDistanceToInputSpacingMinValueUseJitteringMinValueUseDepthPassMinValueImageSampleDistanceMinValueMinimumImageSampleDistanceMinValueMaximumImageSampleDistanceMinValueMaxMemoryFractionMinValueMaskBlendFactorMinValue*(
    this: var vtkGPUVolumeRayCastMapper): cfloat {.importcpp: "GetAutoAdjustSampleDistancesMinValueLockSampleDistanceToInputSpacingMinValueUseJitteringMinValueUseDepthPassMinValueImageSampleDistanceMinValueMinimumImageSampleDistanceMinValueMaximumImageSampleDistanceMinValueMaxMemoryFractionMinValueMaskBlendFactorMinValue",
    header: "vtkGPUVolumeRayCastMapper.h".}
proc GetAutoAdjustSampleDistancesMaxValueLockSampleDistanceToInputSpacingMaxValueUseJitteringMaxValueUseDepthPassMaxValueImageSampleDistanceMaxValueMinimumImageSampleDistanceMaxValueMaximumImageSampleDistanceMaxValueMaxMemoryFractionMaxValueMaskBlendFactorMaxValue*(
    this: var vtkGPUVolumeRayCastMapper): cfloat {.importcpp: "GetAutoAdjustSampleDistancesMaxValueLockSampleDistanceToInputSpacingMaxValueUseJitteringMaxValueUseDepthPassMaxValueImageSampleDistanceMaxValueMinimumImageSampleDistanceMaxValueMaximumImageSampleDistanceMaxValueMaxMemoryFractionMaxValueMaskBlendFactorMaxValue",
    header: "vtkGPUVolumeRayCastMapper.h".}
## !!!Ignored construct:  virtual float GetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingUseJitteringUseDepthPassSampleDistanceImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceFinalColorWindowFinalColorLevelMaxMemoryInBytesMaxMemoryFractionReportProgressMaskTypeMaskBlendFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaskBlendFactor  of  << this -> MaskBlendFactor ) ; return this -> MaskBlendFactor ; } ;
## Error: expected ';'!!!

proc SetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingUseJitteringUseDepthPassImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceMaxMemoryFractionMaskBlendFactorGlobalIlluminationReach*(
    this: var vtkGPUVolumeRayCastMapper; _arg: cfloat) {.importcpp: "SetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingUseJitteringUseDepthPassImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceMaxMemoryFractionMaskBlendFactorGlobalIlluminationReach",
    header: "vtkGPUVolumeRayCastMapper.h".}
proc GetAutoAdjustSampleDistancesMinValueLockSampleDistanceToInputSpacingMinValueUseJitteringMinValueUseDepthPassMinValueImageSampleDistanceMinValueMinimumImageSampleDistanceMinValueMaximumImageSampleDistanceMinValueMaxMemoryFractionMinValueMaskBlendFactorMinValueGlobalIlluminationReachMinValue*(
    this: var vtkGPUVolumeRayCastMapper): cfloat {.importcpp: "GetAutoAdjustSampleDistancesMinValueLockSampleDistanceToInputSpacingMinValueUseJitteringMinValueUseDepthPassMinValueImageSampleDistanceMinValueMinimumImageSampleDistanceMinValueMaximumImageSampleDistanceMinValueMaxMemoryFractionMinValueMaskBlendFactorMinValueGlobalIlluminationReachMinValue",
    header: "vtkGPUVolumeRayCastMapper.h".}
proc GetAutoAdjustSampleDistancesMaxValueLockSampleDistanceToInputSpacingMaxValueUseJitteringMaxValueUseDepthPassMaxValueImageSampleDistanceMaxValueMinimumImageSampleDistanceMaxValueMaximumImageSampleDistanceMaxValueMaxMemoryFractionMaxValueMaskBlendFactorMaxValueGlobalIlluminationReachMaxValue*(
    this: var vtkGPUVolumeRayCastMapper): cfloat {.importcpp: "GetAutoAdjustSampleDistancesMaxValueLockSampleDistanceToInputSpacingMaxValueUseJitteringMaxValueUseDepthPassMaxValueImageSampleDistanceMaxValueMinimumImageSampleDistanceMaxValueMaximumImageSampleDistanceMaxValueMaxMemoryFractionMaxValueMaskBlendFactorMaxValueGlobalIlluminationReachMaxValue",
    header: "vtkGPUVolumeRayCastMapper.h".}
## !!!Ignored construct:  virtual float GetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingUseJitteringUseDepthPassSampleDistanceImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceFinalColorWindowFinalColorLevelMaxMemoryInBytesMaxMemoryFractionReportProgressMaskTypeMaskBlendFactorGlobalIlluminationReach ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GlobalIlluminationReach  of  << this -> GlobalIlluminationReach ) ; return this -> GlobalIlluminationReach ; } ;
## Error: expected ';'!!!

proc SetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingUseJitteringUseDepthPassImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceMaxMemoryFractionMaskBlendFactorGlobalIlluminationReachVolumetricScatteringBlending*(
    this: var vtkGPUVolumeRayCastMapper; _arg: cfloat) {.importcpp: "SetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingUseJitteringUseDepthPassImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceMaxMemoryFractionMaskBlendFactorGlobalIlluminationReachVolumetricScatteringBlending",
    header: "vtkGPUVolumeRayCastMapper.h".}
proc GetAutoAdjustSampleDistancesMinValueLockSampleDistanceToInputSpacingMinValueUseJitteringMinValueUseDepthPassMinValueImageSampleDistanceMinValueMinimumImageSampleDistanceMinValueMaximumImageSampleDistanceMinValueMaxMemoryFractionMinValueMaskBlendFactorMinValueGlobalIlluminationReachMinValueVolumetricScatteringBlendingMinValue*(
    this: var vtkGPUVolumeRayCastMapper): cfloat {.importcpp: "GetAutoAdjustSampleDistancesMinValueLockSampleDistanceToInputSpacingMinValueUseJitteringMinValueUseDepthPassMinValueImageSampleDistanceMinValueMinimumImageSampleDistanceMinValueMaximumImageSampleDistanceMinValueMaxMemoryFractionMinValueMaskBlendFactorMinValueGlobalIlluminationReachMinValueVolumetricScatteringBlendingMinValue",
    header: "vtkGPUVolumeRayCastMapper.h".}
proc GetAutoAdjustSampleDistancesMaxValueLockSampleDistanceToInputSpacingMaxValueUseJitteringMaxValueUseDepthPassMaxValueImageSampleDistanceMaxValueMinimumImageSampleDistanceMaxValueMaximumImageSampleDistanceMaxValueMaxMemoryFractionMaxValueMaskBlendFactorMaxValueGlobalIlluminationReachMaxValueVolumetricScatteringBlendingMaxValue*(
    this: var vtkGPUVolumeRayCastMapper): cfloat {.importcpp: "GetAutoAdjustSampleDistancesMaxValueLockSampleDistanceToInputSpacingMaxValueUseJitteringMaxValueUseDepthPassMaxValueImageSampleDistanceMaxValueMinimumImageSampleDistanceMaxValueMaximumImageSampleDistanceMaxValueMaxMemoryFractionMaxValueMaskBlendFactorMaxValueGlobalIlluminationReachMaxValueVolumetricScatteringBlendingMaxValue",
    header: "vtkGPUVolumeRayCastMapper.h".}
## !!!Ignored construct:  virtual float GetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingUseJitteringUseDepthPassSampleDistanceImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceFinalColorWindowFinalColorLevelMaxMemoryInBytesMaxMemoryFractionReportProgressMaskTypeMaskBlendFactorGlobalIlluminationReachVolumetricScatteringBlending ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << VolumetricScatteringBlending  of  << this -> VolumetricScatteringBlending ) ; return this -> VolumetricScatteringBlending ; } ;
## Error: expected ';'!!!

proc SetSampleDistanceFinalColorWindowFinalColorLevelMaxMemoryInBytesReportProgressMaskTypeRenderToImage*(
    this: var vtkGPUVolumeRayCastMapper; _arg: vtkTypeBool) {.importcpp: "SetSampleDistanceFinalColorWindowFinalColorLevelMaxMemoryInBytesReportProgressMaskTypeRenderToImage",
    header: "vtkGPUVolumeRayCastMapper.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingUseJitteringUseDepthPassSampleDistanceImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceFinalColorWindowFinalColorLevelMaxMemoryInBytesMaxMemoryFractionReportProgressMaskTypeMaskBlendFactorGlobalIlluminationReachVolumetricScatteringBlendingRenderToImage ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RenderToImage  of  << this -> RenderToImage ) ; return this -> RenderToImage ; } ;
## Error: expected ';'!!!

proc RenderToImageOn*(this: var vtkGPUVolumeRayCastMapper) {.
    importcpp: "RenderToImageOn", header: "vtkGPUVolumeRayCastMapper.h".}
proc RenderToImageOff*(this: var vtkGPUVolumeRayCastMapper) {.
    importcpp: "RenderToImageOff", header: "vtkGPUVolumeRayCastMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the scalar type of the depth texture in RenderToImage mode.
  ##  By default, the type if VTK_FLOAT.
  ##  \sa SetRenderToImage()
  ##
proc SetSampleDistanceFinalColorWindowFinalColorLevelMaxMemoryInBytesReportProgressMaskTypeRenderToImageDepthImageScalarType*(
    this: var vtkGPUVolumeRayCastMapper; _arg: cint) {.importcpp: "SetSampleDistanceFinalColorWindowFinalColorLevelMaxMemoryInBytesReportProgressMaskTypeRenderToImageDepthImageScalarType",
    header: "vtkGPUVolumeRayCastMapper.h".}
## !!!Ignored construct:  virtual int GetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingUseJitteringUseDepthPassSampleDistanceImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceFinalColorWindowFinalColorLevelMaxMemoryInBytesMaxMemoryFractionReportProgressMaskTypeMaskBlendFactorGlobalIlluminationReachVolumetricScatteringBlendingRenderToImageDepthImageScalarType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DepthImageScalarType  of  << this -> DepthImageScalarType ) ; return this -> DepthImageScalarType ; } ;
## Error: expected ';'!!!

proc SetDepthImageScalarTypeToUnsignedChar*(this: var vtkGPUVolumeRayCastMapper) {.
    importcpp: "SetDepthImageScalarTypeToUnsignedChar",
    header: "vtkGPUVolumeRayCastMapper.h".}
proc SetDepthImageScalarTypeToUnsignedShort*(this: var vtkGPUVolumeRayCastMapper) {.
    importcpp: "SetDepthImageScalarTypeToUnsignedShort",
    header: "vtkGPUVolumeRayCastMapper.h".}
proc SetDepthImageScalarTypeToFloat*(this: var vtkGPUVolumeRayCastMapper) {.
    importcpp: "SetDepthImageScalarTypeToFloat",
    header: "vtkGPUVolumeRayCastMapper.h".}
proc SetSampleDistanceFinalColorWindowFinalColorLevelMaxMemoryInBytesReportProgressMaskTypeRenderToImageDepthImageScalarTypeClampDepthToBackface*(
    this: var vtkGPUVolumeRayCastMapper; _arg: vtkTypeBool) {.importcpp: "SetSampleDistanceFinalColorWindowFinalColorLevelMaxMemoryInBytesReportProgressMaskTypeRenderToImageDepthImageScalarTypeClampDepthToBackface",
    header: "vtkGPUVolumeRayCastMapper.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingUseJitteringUseDepthPassSampleDistanceImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceFinalColorWindowFinalColorLevelMaxMemoryInBytesMaxMemoryFractionReportProgressMaskTypeMaskBlendFactorGlobalIlluminationReachVolumetricScatteringBlendingRenderToImageDepthImageScalarTypeClampDepthToBackface ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ClampDepthToBackface  of  << this -> ClampDepthToBackface ) ; return this -> ClampDepthToBackface ; } ;
## Error: expected ';'!!!

proc ClampDepthToBackfaceOn*(this: var vtkGPUVolumeRayCastMapper) {.
    importcpp: "ClampDepthToBackfaceOn", header: "vtkGPUVolumeRayCastMapper.h".}
proc ClampDepthToBackfaceOff*(this: var vtkGPUVolumeRayCastMapper) {.
    importcpp: "ClampDepthToBackfaceOff", header: "vtkGPUVolumeRayCastMapper.h".}
  ## /@}
  ## *
  ##  Low level API to export the depth texture as vtkImageData in
  ##  RenderToImage mode.
  ##  Should be implemented by the graphics API specific mapper (GL or other).
  ##  \sa SetRenderToImage()
  ##
proc GetDepthImage*(this: var vtkGPUVolumeRayCastMapper; a2: ptr vtkImageData) {.
    importcpp: "GetDepthImage", header: "vtkGPUVolumeRayCastMapper.h".}
proc GetColorImage*(this: var vtkGPUVolumeRayCastMapper; a2: ptr vtkImageData) {.
    importcpp: "GetColorImage", header: "vtkGPUVolumeRayCastMapper.h".}
proc Render*(this: var vtkGPUVolumeRayCastMapper; a2: ptr vtkRenderer;
            a3: ptr vtkVolume) {.importcpp: "Render",
                              header: "vtkGPUVolumeRayCastMapper.h".}
proc GPURender*(this: var vtkGPUVolumeRayCastMapper; a2: ptr vtkRenderer;
               a3: ptr vtkVolume) {.importcpp: "GPURender",
                                 header: "vtkGPUVolumeRayCastMapper.h".}
proc ReleaseGraphicsResources*(this: var vtkGPUVolumeRayCastMapper;
                              a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkGPUVolumeRayCastMapper.h".}
proc GetReductionRatio*(this: var vtkGPUVolumeRayCastMapper;
                       ratio: array[3, cdouble]) {.importcpp: "GetReductionRatio",
    header: "vtkGPUVolumeRayCastMapper.h".}
type
  vtkGPUVolumeRayCastMapperTFRangeType* {.size: sizeof(cint),
      importcpp: "vtkGPUVolumeRayCastMapper::TFRangeType",
      header: "vtkGPUVolumeRayCastMapper.h".} = enum
    SCALAR = 0,                 ##  default
    NATIVE


proc SetSampleDistanceFinalColorWindowFinalColorLevelMaxMemoryInBytesReportProgressMaskTypeRenderToImageDepthImageScalarTypeClampDepthToBackfaceColorRangeType*(
    this: var vtkGPUVolumeRayCastMapper; _arg: cint) {.importcpp: "SetSampleDistanceFinalColorWindowFinalColorLevelMaxMemoryInBytesReportProgressMaskTypeRenderToImageDepthImageScalarTypeClampDepthToBackfaceColorRangeType",
    header: "vtkGPUVolumeRayCastMapper.h".}
## !!!Ignored construct:  virtual int GetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingUseJitteringUseDepthPassSampleDistanceImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceFinalColorWindowFinalColorLevelMaxMemoryInBytesMaxMemoryFractionReportProgressMaskTypeMaskBlendFactorGlobalIlluminationReachVolumetricScatteringBlendingRenderToImageDepthImageScalarTypeClampDepthToBackfaceColorRangeType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ColorRangeType  of  << this -> ColorRangeType ) ; return this -> ColorRangeType ; } ;
## Error: expected ';'!!!

proc SetSampleDistanceFinalColorWindowFinalColorLevelMaxMemoryInBytesReportProgressMaskTypeRenderToImageDepthImageScalarTypeClampDepthToBackfaceColorRangeTypeScalarOpacityRangeType*(
    this: var vtkGPUVolumeRayCastMapper; _arg: cint) {.importcpp: "SetSampleDistanceFinalColorWindowFinalColorLevelMaxMemoryInBytesReportProgressMaskTypeRenderToImageDepthImageScalarTypeClampDepthToBackfaceColorRangeTypeScalarOpacityRangeType",
    header: "vtkGPUVolumeRayCastMapper.h".}
## !!!Ignored construct:  virtual int GetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingUseJitteringUseDepthPassSampleDistanceImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceFinalColorWindowFinalColorLevelMaxMemoryInBytesMaxMemoryFractionReportProgressMaskTypeMaskBlendFactorGlobalIlluminationReachVolumetricScatteringBlendingRenderToImageDepthImageScalarTypeClampDepthToBackfaceColorRangeTypeScalarOpacityRangeType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarOpacityRangeType  of  << this -> ScalarOpacityRangeType ) ; return this -> ScalarOpacityRangeType ; } ;
## Error: expected ';'!!!

proc SetSampleDistanceFinalColorWindowFinalColorLevelMaxMemoryInBytesReportProgressMaskTypeRenderToImageDepthImageScalarTypeClampDepthToBackfaceColorRangeTypeScalarOpacityRangeTypeGradientOpacityRangeType*(
    this: var vtkGPUVolumeRayCastMapper; _arg: cint) {.importcpp: "SetSampleDistanceFinalColorWindowFinalColorLevelMaxMemoryInBytesReportProgressMaskTypeRenderToImageDepthImageScalarTypeClampDepthToBackfaceColorRangeTypeScalarOpacityRangeTypeGradientOpacityRangeType",
    header: "vtkGPUVolumeRayCastMapper.h".}
## !!!Ignored construct:  virtual int GetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingUseJitteringUseDepthPassSampleDistanceImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceFinalColorWindowFinalColorLevelMaxMemoryInBytesMaxMemoryFractionReportProgressMaskTypeMaskBlendFactorGlobalIlluminationReachVolumetricScatteringBlendingRenderToImageDepthImageScalarTypeClampDepthToBackfaceColorRangeTypeScalarOpacityRangeTypeGradientOpacityRangeType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GradientOpacityRangeType  of  << this -> GradientOpacityRangeType ) ; return this -> GradientOpacityRangeType ; } ;
## Error: expected ';'!!!

proc GetInput*(this: var vtkGPUVolumeRayCastMapper): ptr vtkDataSet {.
    importcpp: "GetInput", header: "vtkGPUVolumeRayCastMapper.h".}
  ## /@{
  ## *
  ##  Add/Remove input connections. Active and removed ports are cached in
  ##  Ports and RemovedPorts respectively.
  ##
proc RemoveInputConnection*(this: var vtkGPUVolumeRayCastMapper; port: cint;
                           input: ptr vtkAlgorithmOutput) {.
    importcpp: "RemoveInputConnection", header: "vtkGPUVolumeRayCastMapper.h".}
proc RemoveInputConnection*(this: var vtkGPUVolumeRayCastMapper; port: cint; idx: cint) {.
    importcpp: "RemoveInputConnection", header: "vtkGPUVolumeRayCastMapper.h".}
proc SetInputConnection*(this: var vtkGPUVolumeRayCastMapper; port: cint;
                        input: ptr vtkAlgorithmOutput) {.
    importcpp: "SetInputConnection", header: "vtkGPUVolumeRayCastMapper.h".}
proc SetInputConnection*(this: var vtkGPUVolumeRayCastMapper;
                        input: ptr vtkAlgorithmOutput) {.
    importcpp: "SetInputConnection", header: "vtkGPUVolumeRayCastMapper.h".}
proc GetInputCount*(this: var vtkGPUVolumeRayCastMapper): cint {.
    importcpp: "GetInputCount", header: "vtkGPUVolumeRayCastMapper.h".}
proc GetTransformedInput*(this: var vtkGPUVolumeRayCastMapper; port: cint = 0): ptr vtkDataSet {.
    importcpp: "GetTransformedInput", header: "vtkGPUVolumeRayCastMapper.h".}
## !!!Ignored construct:  double * GetBoundsFromPort ( const int port ) VTK_SIZEHINT ( 6 ) ;
## Error: expected ';'!!!

proc SetTransfer2DYAxisArray*(this: var vtkGPUVolumeRayCastMapper; _arg: cstring) {.
    importcpp: "SetTransfer2DYAxisArray", header: "vtkGPUVolumeRayCastMapper.h".}
proc GetTransfer2DYAxisArray*(this: var vtkGPUVolumeRayCastMapper): cstring {.
    importcpp: "GetTransfer2DYAxisArray", header: "vtkGPUVolumeRayCastMapper.h".}
  ## @}
## !!!Ignored construct:  virtual vtkTypeBool GetAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingUseJitteringUseDepthPassSampleDistanceImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceFinalColorWindowFinalColorLevelMaxMemoryInBytesMaxMemoryFractionReportProgressMaskTypeMaskBlendFactorGlobalIlluminationReachVolumetricScatteringBlendingRenderToImageDepthImageScalarTypeClampDepthToBackfaceColorRangeTypeScalarOpacityRangeTypeGradientOpacityRangeTypeAMRMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AMRMode  of  << this -> AMRMode ) ; return this -> AMRMode ; } ;
## Error: expected ';'!!!

type
  DataMap* = unordered_map[cint, ptr vtkDataSet]
