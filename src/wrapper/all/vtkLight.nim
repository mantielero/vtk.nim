## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLight.h
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
##  @class   vtkLight
##  @brief   a virtual light for 3D rendering
##
##  vtkLight is a virtual light for 3D rendering. It provides methods to locate
##  and point the light, turn it on and off, and set its brightness and color.
##  In addition to the basic infinite distance point light source attributes,
##  you also can specify the light attenuation values and cone angle.
##  These attributes are only used if the light is a positional light.
##  The default is a directional light (e.g. infinite point light source).
##
##  Lights have a type that describes how the light should move with respect
##  to the camera.  A Headlight is always located at the current camera position
##  and shines on the camera's focal point.  A CameraLight also moves with
##  the camera, but may not be coincident to it.  CameraLights are defined
##  in a normalized coordinate space where the camera is located at (0, 0, 1),
##  the camera is looking at (0, 0, 0), and up is (0, 1, 0).  Finally, a
##  SceneLight is part of the scene itself and does not move with the camera.
##  (Renderers are responsible for moving the light based on its type.)
##
##  Lights have a transformation matrix that describes the space in which
##  they are positioned.  A light's world space position and focal point
##  are defined by their local position and focal point, transformed by
##  their transformation matrix (if it exists).
##

import
  vtkObject, vtkRenderingCoreModule

##  need for virtual function

discard "forward decl of vtkInformation"
discard "forward decl of vtkRenderer"
discard "forward decl of vtkMatrix4x4"
const
  VTK_LIGHT_TYPE_HEADLIGHT* = 1
  VTK_LIGHT_TYPE_CAMERA_LIGHT* = 2
  VTK_LIGHT_TYPE_SCENE_LIGHT* = 3

type
  vtkLight* {.importcpp: "vtkLight", header: "vtkLight.h", bycopy.} = object of vtkObject
    vtkLight* {.importc: "vtkLight".}: VTK_NEWINSTANCE
    ##  Arbitrary extra information associated with this light.

  vtkLightSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkLight::IsTypeOf(@)",
    header: "vtkLight.h".}
proc IsA*(this: var vtkLight; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkLight.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkLight {.
    importcpp: "vtkLight::SafeDownCast(@)", header: "vtkLight.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkLight :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLight :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLight :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkLight; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkLight.h".}
proc New*(): ptr vtkLight {.importcpp: "vtkLight::New(@)", header: "vtkLight.h".}
proc ShallowClone*(this: var vtkLight): ptr vtkLight {.importcpp: "ShallowClone",
    header: "vtkLight.h".}
proc Render*(this: var vtkLight; a2: ptr vtkRenderer; a3: cint) {.importcpp: "Render",
    header: "vtkLight.h".}
proc SetAmbientColor*(this: var vtkLight; _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetAmbientColor", header: "vtkLight.h".}
proc SetAmbientColor*(this: var vtkLight; _arg: array[3, cdouble]) {.
    importcpp: "SetAmbientColor", header: "vtkLight.h".}
## !!!Ignored construct:  virtual double * GetAmbientColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << AmbientColor  pointer  << this -> AmbientColor ) ; return this -> AmbientColor ; } VTK_WRAPEXCLUDE virtual void GetAmbientColor ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> AmbientColor [ i ] ; } } ;
## Error: expected ';'!!!

proc SetAmbientColorDiffuseColor*(this: var vtkLight; _arg1: cdouble; _arg2: cdouble;
                                 _arg3: cdouble) {.
    importcpp: "SetAmbientColorDiffuseColor", header: "vtkLight.h".}
proc SetAmbientColorDiffuseColor*(this: var vtkLight; _arg: array[3, cdouble]) {.
    importcpp: "SetAmbientColorDiffuseColor", header: "vtkLight.h".}
## !!!Ignored construct:  virtual double * GetAmbientColorDiffuseColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << DiffuseColor  pointer  << this -> DiffuseColor ) ; return this -> DiffuseColor ; } VTK_WRAPEXCLUDE virtual void GetAmbientColorDiffuseColor ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> DiffuseColor [ i ] ; } } ;
## Error: expected ';'!!!

proc SetAmbientColorDiffuseColorSpecularColor*(this: var vtkLight; _arg1: cdouble;
    _arg2: cdouble; _arg3: cdouble) {.importcpp: "SetAmbientColorDiffuseColorSpecularColor",
                                  header: "vtkLight.h".}
proc SetAmbientColorDiffuseColorSpecularColor*(this: var vtkLight;
    _arg: array[3, cdouble]) {.importcpp: "SetAmbientColorDiffuseColorSpecularColor",
                            header: "vtkLight.h".}
## !!!Ignored construct:  virtual double * GetAmbientColorDiffuseColorSpecularColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << SpecularColor  pointer  << this -> SpecularColor ) ; return this -> SpecularColor ; } VTK_WRAPEXCLUDE virtual void GetAmbientColorDiffuseColorSpecularColor ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> SpecularColor [ i ] ; } } ;
## Error: expected ';'!!!

proc SetColor*(this: var vtkLight; a2: cdouble; a3: cdouble; a4: cdouble) {.
    importcpp: "SetColor", header: "vtkLight.h".}
proc SetColor*(this: var vtkLight; a: array[3, cdouble]) {.importcpp: "SetColor",
    header: "vtkLight.h".}
proc SetAmbientColorDiffuseColorSpecularColorPosition*(this: var vtkLight;
    _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetAmbientColorDiffuseColorSpecularColorPosition",
    header: "vtkLight.h".}
proc SetAmbientColorDiffuseColorSpecularColorPosition*(this: var vtkLight;
    _arg: array[3, cdouble]) {.importcpp: "SetAmbientColorDiffuseColorSpecularColorPosition",
                            header: "vtkLight.h".}
## !!!Ignored construct:  virtual double * GetAmbientColorDiffuseColorSpecularColorPosition ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Position  pointer  << this -> Position ) ; return this -> Position ; } VTK_WRAPEXCLUDE virtual void GetAmbientColorDiffuseColorSpecularColorPosition ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Position [ i ] ; } } ;
## Error: expected ';'!!!

proc SetPosition*(this: var vtkLight; a: ptr cfloat) {.importcpp: "SetPosition",
    header: "vtkLight.h".}
proc SetAmbientColorDiffuseColorSpecularColorPositionFocalPoint*(
    this: var vtkLight; _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetAmbientColorDiffuseColorSpecularColorPositionFocalPoint",
    header: "vtkLight.h".}
proc SetAmbientColorDiffuseColorSpecularColorPositionFocalPoint*(
    this: var vtkLight; _arg: array[3, cdouble]) {.
    importcpp: "SetAmbientColorDiffuseColorSpecularColorPositionFocalPoint",
    header: "vtkLight.h".}
## !!!Ignored construct:  virtual double * GetAmbientColorDiffuseColorSpecularColorPositionFocalPoint ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << FocalPoint  pointer  << this -> FocalPoint ) ; return this -> FocalPoint ; } VTK_WRAPEXCLUDE virtual void GetAmbientColorDiffuseColorSpecularColorPositionFocalPoint ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> FocalPoint [ i ] ; } } ;
## Error: expected ';'!!!

proc SetFocalPoint*(this: var vtkLight; a: ptr cfloat) {.importcpp: "SetFocalPoint",
    header: "vtkLight.h".}
proc SetIntensity*(this: var vtkLight; _arg: cdouble) {.importcpp: "SetIntensity",
    header: "vtkLight.h".}
## !!!Ignored construct:  virtual double GetIntensity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Intensity  of  << this -> Intensity ) ; return this -> Intensity ; } ;
## Error: expected ';'!!!

proc SetIntensitySwitch*(this: var vtkLight; _arg: vtkTypeBool) {.
    importcpp: "SetIntensitySwitch", header: "vtkLight.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetIntensitySwitch ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Switch  of  << this -> Switch ) ; return this -> Switch ; } ;
## Error: expected ';'!!!

proc SwitchOn*(this: var vtkLight) {.importcpp: "SwitchOn", header: "vtkLight.h".}
proc SwitchOff*(this: var vtkLight) {.importcpp: "SwitchOff", header: "vtkLight.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn positional lighting on or off.
  ##
proc SetIntensitySwitchPositional*(this: var vtkLight; _arg: vtkTypeBool) {.
    importcpp: "SetIntensitySwitchPositional", header: "vtkLight.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetIntensitySwitchPositional ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Positional  of  << this -> Positional ) ; return this -> Positional ; } ;
## Error: expected ';'!!!

proc PositionalOn*(this: var vtkLight) {.importcpp: "PositionalOn",
                                     header: "vtkLight.h".}
proc PositionalOff*(this: var vtkLight) {.importcpp: "PositionalOff",
                                      header: "vtkLight.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the exponent of the cosine used in positional lighting.
  ##
proc SetExponent*(this: var vtkLight; _arg: cdouble) {.importcpp: "SetExponent",
    header: "vtkLight.h".}
proc GetExponentMinValue*(this: var vtkLight): cdouble {.
    importcpp: "GetExponentMinValue", header: "vtkLight.h".}
proc GetExponentMaxValue*(this: var vtkLight): cdouble {.
    importcpp: "GetExponentMaxValue", header: "vtkLight.h".}
## !!!Ignored construct:  virtual double GetIntensitySwitchPositionalExponent ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Exponent  of  << this -> Exponent ) ; return this -> Exponent ; } ;
## Error: expected ';'!!!

proc SetIntensitySwitchPositionalConeAngle*(this: var vtkLight; _arg: cdouble) {.
    importcpp: "SetIntensitySwitchPositionalConeAngle", header: "vtkLight.h".}
## !!!Ignored construct:  virtual double GetIntensitySwitchPositionalExponentConeAngle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ConeAngle  of  << this -> ConeAngle ) ; return this -> ConeAngle ; } ;
## Error: expected ';'!!!

proc SetAmbientColorDiffuseColorSpecularColorPositionFocalPointAttenuationValues*(
    this: var vtkLight; _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.importcpp: "SetAmbientColorDiffuseColorSpecularColorPositionFocalPointAttenuationValues",
    header: "vtkLight.h".}
proc SetAmbientColorDiffuseColorSpecularColorPositionFocalPointAttenuationValues*(
    this: var vtkLight; _arg: array[3, cdouble]) {.importcpp: "SetAmbientColorDiffuseColorSpecularColorPositionFocalPointAttenuationValues",
    header: "vtkLight.h".}
## !!!Ignored construct:  virtual double * GetAmbientColorDiffuseColorSpecularColorPositionFocalPointAttenuationValues ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << AttenuationValues  pointer  << this -> AttenuationValues ) ; return this -> AttenuationValues ; } VTK_WRAPEXCLUDE virtual void GetAmbientColorDiffuseColorSpecularColorPositionFocalPointAttenuationValues ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> AttenuationValues [ i ] ; } } ;
## Error: expected ';'!!!

proc SetTransformMatrix*(this: var vtkLight; a2: ptr vtkMatrix4x4) {.
    importcpp: "SetTransformMatrix", header: "vtkLight.h".}
proc GetnameTransformMatrix*(this: var vtkLight): ptr vtkMatrix4x4 {.
    importcpp: "GetnameTransformMatrix", header: "vtkLight.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the position of the light, modified by the transformation matrix
  ##  (if it exists).
  ##
proc GetTransformedPosition*(this: var vtkLight; x: var cdouble; y: var cdouble;
                            z: var cdouble) {.importcpp: "GetTransformedPosition",
    header: "vtkLight.h".}
proc GetTransformedPosition*(this: var vtkLight; a: array[3, cdouble]) {.
    importcpp: "GetTransformedPosition", header: "vtkLight.h".}
## !!!Ignored construct:  double * GetTransformedPosition ( ) VTK_SIZEHINT ( 3 ) ;
## Error: expected ';'!!!

proc GetTransformedFocalPoint*(this: var vtkLight; x: var cdouble; y: var cdouble;
                              z: var cdouble) {.
    importcpp: "GetTransformedFocalPoint", header: "vtkLight.h".}
proc GetTransformedFocalPoint*(this: var vtkLight; a: array[3, cdouble]) {.
    importcpp: "GetTransformedFocalPoint", header: "vtkLight.h".}
## !!!Ignored construct:  double * GetTransformedFocalPoint ( ) VTK_SIZEHINT ( 3 ) ;
## Error: expected ';'!!!

proc TransformPoint*(this: var vtkLight; a: array[3, cdouble]; b: array[3, cdouble]) {.
    importcpp: "TransformPoint", header: "vtkLight.h".}
proc TransformVector*(this: var vtkLight; a: array[3, cdouble]; b: array[3, cdouble]) {.
    importcpp: "TransformVector", header: "vtkLight.h".}
proc SetDirectionAngle*(this: var vtkLight; elevation: cdouble; azimuth: cdouble) {.
    importcpp: "SetDirectionAngle", header: "vtkLight.h".}
proc SetDirectionAngle*(this: var vtkLight; ang: array[2, cdouble]) {.
    importcpp: "SetDirectionAngle", header: "vtkLight.h".}
proc DeepCopy*(this: var vtkLight; light: ptr vtkLight) {.importcpp: "DeepCopy",
    header: "vtkLight.h".}
proc SetLightType*(this: var vtkLight; a2: cint) {.importcpp: "SetLightType",
    header: "vtkLight.h".}
## !!!Ignored construct:  virtual int GetIntensitySwitchPositionalExponentConeAngleLightType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LightType  of  << this -> LightType ) ; return this -> LightType ; } ;
## Error: expected ';'!!!

proc SetLightTypeToHeadlight*(this: var vtkLight) {.
    importcpp: "SetLightTypeToHeadlight", header: "vtkLight.h".}
proc SetLightTypeToSceneLight*(this: var vtkLight) {.
    importcpp: "SetLightTypeToSceneLight", header: "vtkLight.h".}
proc SetLightTypeToCameraLight*(this: var vtkLight) {.
    importcpp: "SetLightTypeToCameraLight", header: "vtkLight.h".}
proc LightTypeIsHeadlight*(this: var vtkLight): cint {.
    importcpp: "LightTypeIsHeadlight", header: "vtkLight.h".}
proc LightTypeIsSceneLight*(this: var vtkLight): cint {.
    importcpp: "LightTypeIsSceneLight", header: "vtkLight.h".}
proc LightTypeIsCameraLight*(this: var vtkLight): cint {.
    importcpp: "LightTypeIsCameraLight", header: "vtkLight.h".}
proc SetIntensitySwitchPositionalConeAngleShadowAttenuation*(this: var vtkLight;
    _arg: cfloat) {.importcpp: "SetIntensitySwitchPositionalConeAngleShadowAttenuation",
                  header: "vtkLight.h".}
## !!!Ignored construct:  virtual float GetIntensitySwitchPositionalExponentConeAngleLightTypeShadowAttenuation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ShadowAttenuation  of  << this -> ShadowAttenuation ) ; return this -> ShadowAttenuation ; } ;
## Error: expected ';'!!!

proc GetnameTransformMatrixInformation*(this: var vtkLight): ptr vtkInformation {.
    importcpp: "GetnameTransformMatrixInformation", header: "vtkLight.h".}
proc SetInformation*(this: var vtkLight; a2: ptr vtkInformation) {.
    importcpp: "SetInformation", header: "vtkLight.h".}