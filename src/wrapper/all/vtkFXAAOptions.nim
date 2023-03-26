## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFXAAOptions.h
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
##  @class   vtkFXAAOptions
##  @brief   Configuration for FXAA implementations.
##
##
##  This class encapsulates the settings for vtkOpenGLFXAAFilter.
##

import
  vtkObject, vtkRenderingCoreModule

type
  vtkFXAAOptions* {.importcpp: "vtkFXAAOptions", header: "vtkFXAAOptions.h", bycopy.} = object of vtkObject ## *
                                                                                                  ##  Debugging options that affect the output color buffer. See
                                                                                                  ##  vtkFXAAFilterFS.glsl for details.
                                                                                                  ##
    vtkFXAAOptions* {.importc: "vtkFXAAOptions".}: VTK_NEWINSTANCE

  vtkFXAAOptionsDebugOption* {.size: sizeof(cint),
                              importcpp: "vtkFXAAOptions::DebugOption",
                              header: "vtkFXAAOptions.h".} = enum
    FXAA_NO_DEBUG = 0, FXAA_DEBUG_SUBPIXEL_ALIASING, FXAA_DEBUG_EDGE_DIRECTION,
    FXAA_DEBUG_EDGE_NUM_STEPS, FXAA_DEBUG_EDGE_DISTANCE,
    FXAA_DEBUG_EDGE_SAMPLE_OFFSET, FXAA_DEBUG_ONLY_SUBPIX_AA,
    FXAA_DEBUG_ONLY_EDGE_AA


proc New*(): ptr vtkFXAAOptions {.importcpp: "vtkFXAAOptions::New(@)",
                              header: "vtkFXAAOptions.h".}
type
  vtkFXAAOptionsSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkFXAAOptions::IsTypeOf(@)", header: "vtkFXAAOptions.h".}
proc IsA*(this: var vtkFXAAOptions; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkFXAAOptions.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkFXAAOptions {.
    importcpp: "vtkFXAAOptions::SafeDownCast(@)", header: "vtkFXAAOptions.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkFXAAOptions :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFXAAOptions :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFXAAOptions :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkFXAAOptions; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkFXAAOptions.h".}
proc SetRelativeContrastThreshold*(this: var vtkFXAAOptions; _arg: cfloat) {.
    importcpp: "SetRelativeContrastThreshold", header: "vtkFXAAOptions.h".}
proc GetRelativeContrastThresholdMinValue*(this: var vtkFXAAOptions): cfloat {.
    importcpp: "GetRelativeContrastThresholdMinValue", header: "vtkFXAAOptions.h".}
proc GetRelativeContrastThresholdMaxValue*(this: var vtkFXAAOptions): cfloat {.
    importcpp: "GetRelativeContrastThresholdMaxValue", header: "vtkFXAAOptions.h".}
## !!!Ignored construct:  virtual float GetRelativeContrastThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RelativeContrastThreshold  of  << this -> RelativeContrastThreshold ) ; return this -> RelativeContrastThreshold ; } ;
## Error: expected ';'!!!

proc SetRelativeContrastThresholdHardContrastThreshold*(this: var vtkFXAAOptions;
    _arg: cfloat) {.importcpp: "SetRelativeContrastThresholdHardContrastThreshold",
                  header: "vtkFXAAOptions.h".}
proc GetRelativeContrastThresholdMinValueHardContrastThresholdMinValue*(
    this: var vtkFXAAOptions): cfloat {.importcpp: "GetRelativeContrastThresholdMinValueHardContrastThresholdMinValue",
                                    header: "vtkFXAAOptions.h".}
proc GetRelativeContrastThresholdMaxValueHardContrastThresholdMaxValue*(
    this: var vtkFXAAOptions): cfloat {.importcpp: "GetRelativeContrastThresholdMaxValueHardContrastThresholdMaxValue",
                                    header: "vtkFXAAOptions.h".}
## !!!Ignored construct:  virtual float GetRelativeContrastThresholdHardContrastThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HardContrastThreshold  of  << this -> HardContrastThreshold ) ; return this -> HardContrastThreshold ; } ;
## Error: expected ';'!!!

proc SetRelativeContrastThresholdHardContrastThresholdSubpixelBlendLimit*(
    this: var vtkFXAAOptions; _arg: cfloat) {.importcpp: "SetRelativeContrastThresholdHardContrastThresholdSubpixelBlendLimit",
    header: "vtkFXAAOptions.h".}
proc GetRelativeContrastThresholdMinValueHardContrastThresholdMinValueSubpixelBlendLimitMinValue*(
    this: var vtkFXAAOptions): cfloat {.importcpp: "GetRelativeContrastThresholdMinValueHardContrastThresholdMinValueSubpixelBlendLimitMinValue",
                                    header: "vtkFXAAOptions.h".}
proc GetRelativeContrastThresholdMaxValueHardContrastThresholdMaxValueSubpixelBlendLimitMaxValue*(
    this: var vtkFXAAOptions): cfloat {.importcpp: "GetRelativeContrastThresholdMaxValueHardContrastThresholdMaxValueSubpixelBlendLimitMaxValue",
                                    header: "vtkFXAAOptions.h".}
## !!!Ignored construct:  virtual float GetRelativeContrastThresholdHardContrastThresholdSubpixelBlendLimit ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SubpixelBlendLimit  of  << this -> SubpixelBlendLimit ) ; return this -> SubpixelBlendLimit ; } ;
## Error: expected ';'!!!

proc SetRelativeContrastThresholdHardContrastThresholdSubpixelBlendLimitSubpixelContrastThreshold*(
    this: var vtkFXAAOptions; _arg: cfloat) {.importcpp: "SetRelativeContrastThresholdHardContrastThresholdSubpixelBlendLimitSubpixelContrastThreshold",
    header: "vtkFXAAOptions.h".}
proc GetRelativeContrastThresholdMinValueHardContrastThresholdMinValueSubpixelBlendLimitMinValueSubpixelContrastThresholdMinValue*(
    this: var vtkFXAAOptions): cfloat {.importcpp: "GetRelativeContrastThresholdMinValueHardContrastThresholdMinValueSubpixelBlendLimitMinValueSubpixelContrastThresholdMinValue",
                                    header: "vtkFXAAOptions.h".}
proc GetRelativeContrastThresholdMaxValueHardContrastThresholdMaxValueSubpixelBlendLimitMaxValueSubpixelContrastThresholdMaxValue*(
    this: var vtkFXAAOptions): cfloat {.importcpp: "GetRelativeContrastThresholdMaxValueHardContrastThresholdMaxValueSubpixelBlendLimitMaxValueSubpixelContrastThresholdMaxValue",
                                    header: "vtkFXAAOptions.h".}
## !!!Ignored construct:  virtual float GetRelativeContrastThresholdHardContrastThresholdSubpixelBlendLimitSubpixelContrastThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SubpixelContrastThreshold  of  << this -> SubpixelContrastThreshold ) ; return this -> SubpixelContrastThreshold ; } ;
## Error: expected ';'!!!

proc SetUseHighQualityEndpoints*(this: var vtkFXAAOptions; _arg: bool) {.
    importcpp: "SetUseHighQualityEndpoints", header: "vtkFXAAOptions.h".}
## !!!Ignored construct:  virtual bool GetRelativeContrastThresholdHardContrastThresholdSubpixelBlendLimitSubpixelContrastThresholdUseHighQualityEndpoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseHighQualityEndpoints  of  << this -> UseHighQualityEndpoints ) ; return this -> UseHighQualityEndpoints ; } ;
## Error: expected ';'!!!

proc UseHighQualityEndpointsOn*(this: var vtkFXAAOptions) {.
    importcpp: "UseHighQualityEndpointsOn", header: "vtkFXAAOptions.h".}
proc UseHighQualityEndpointsOff*(this: var vtkFXAAOptions) {.
    importcpp: "UseHighQualityEndpointsOff", header: "vtkFXAAOptions.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set the number of iterations for the endpoint search algorithm. Increasing
  ##  this value will increase runtime, but also properly detect longer edges.
  ##  The current implementation steps one pixel in both the positive and
  ##  negative directions per iteration. The default value is 12, which will
  ##  resolve endpoints of edges < 25 pixels long (2 * 12 + 1).
  ##
proc SetRelativeContrastThresholdHardContrastThresholdSubpixelBlendLimitSubpixelContrastThresholdEndpointSearchIterations*(
    this: var vtkFXAAOptions; _arg: cint) {.importcpp: "SetRelativeContrastThresholdHardContrastThresholdSubpixelBlendLimitSubpixelContrastThresholdEndpointSearchIterations",
                                       header: "vtkFXAAOptions.h".}
proc GetRelativeContrastThresholdMinValueHardContrastThresholdMinValueSubpixelBlendLimitMinValueSubpixelContrastThresholdMinValueEndpointSearchIterationsMinValue*(
    this: var vtkFXAAOptions): cint {.importcpp: "GetRelativeContrastThresholdMinValueHardContrastThresholdMinValueSubpixelBlendLimitMinValueSubpixelContrastThresholdMinValueEndpointSearchIterationsMinValue",
                                  header: "vtkFXAAOptions.h".}
proc GetRelativeContrastThresholdMaxValueHardContrastThresholdMaxValueSubpixelBlendLimitMaxValueSubpixelContrastThresholdMaxValueEndpointSearchIterationsMaxValue*(
    this: var vtkFXAAOptions): cint {.importcpp: "GetRelativeContrastThresholdMaxValueHardContrastThresholdMaxValueSubpixelBlendLimitMaxValueSubpixelContrastThresholdMaxValueEndpointSearchIterationsMaxValue",
                                  header: "vtkFXAAOptions.h".}
## !!!Ignored construct:  virtual int GetRelativeContrastThresholdHardContrastThresholdSubpixelBlendLimitSubpixelContrastThresholdUseHighQualityEndpointsEndpointSearchIterations ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EndpointSearchIterations  of  << this -> EndpointSearchIterations ) ; return this -> EndpointSearchIterations ; } ;
## Error: expected ';'!!!

proc SetUseHighQualityEndpointsDebugOptionValue*(this: var vtkFXAAOptions;
    _arg: vtkFXAAOptionsDebugOption) {.importcpp: "SetUseHighQualityEndpointsDebugOptionValue",
                                     header: "vtkFXAAOptions.h".}
## !!!Ignored construct:  virtual DebugOption GetRelativeContrastThresholdHardContrastThresholdSubpixelBlendLimitSubpixelContrastThresholdUseHighQualityEndpointsEndpointSearchIterationsDebugOptionValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DebugOptionValue  of  << this -> DebugOptionValue ) ; return this -> DebugOptionValue ; } ;
## Error: expected ';'!!!
