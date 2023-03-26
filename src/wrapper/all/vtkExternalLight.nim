## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExternalLight.h
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
##  @class   vtkExternalLight
##  @brief   a virtual light object for tweaking existing lights
##  in an external 3D rendering context
##
##
##  vtkExternalLight is a virtual light object for tweaking existing lights in
##  an external 3D rendering context. It provides a mechanism to adjust and
##  control parameters of existing lights in an external OpenGL context.
##
##  It provides methods to locate and point the light,
##  and set its brightness and color. In addition to the
##  basic infinite distance point light source attributes, you can also specify
##  the light attenuation values and cone angle. These attributes are only used
##  if the light is a positional light.
##
##  By default, vtkExternalLight overrides specific light parameters as set by
##  the user. Setting the #ReplaceMode to ALL_PARAMS, will set all
##  the light parameter values to the ones set in vtkExternalLight.
##
##  @warning
##  Use the vtkExternalLight object to tweak parameters of lights created in the
##  external context. This class does NOT create new lights in the scene.
##
##  @par Example:
##  Usage example for vtkExternalLight in conjunction with
##  vtkExternalOpenGLRenderer and \ref ExternalVTKWidget
##  \code{.cpp}
##     vtkNew<vtkExternalLight> exLight;
##     exLight->SetLightIndex(GL_LIGHT0); // GL_LIGHT0 identifies the external light
##     exLight->SetDiffuseColor(1.0, 0.0, 0.0); // Changing diffuse color
##     vtkNew<ExternalVTKWidget> exWidget;
##     vtkExternalOpenGLRenderer* ren =
##  vtkExternalOpenGLRenderer::SafeDownCast(exWidget->AddRenderer());
##     ren->AddExternalLight(exLight.GetPointer());
##  \endcode
##
##  @sa
##  vtkExternalOpenGLRenderer \ref ExternalVTKWidget
##

import
  vtkLight, vtkRenderingExternalModule

type
  vtkExternalLight* {.importcpp: "vtkExternalLight", header: "vtkExternalLight.h",
                     bycopy.} = object of vtkLight
    vtkExternalLight* {.importc: "vtkExternalLight".}: VTK_NEWINSTANCE

  vtkExternalLightSuperclass* = vtkLight

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkExternalLight::IsTypeOf(@)", header: "vtkExternalLight.h".}
proc IsA*(this: var vtkExternalLight; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkExternalLight.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkExternalLight {.
    importcpp: "vtkExternalLight::SafeDownCast(@)", header: "vtkExternalLight.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkExternalLight :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkLight :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExternalLight :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExternalLight :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkExternalLight; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkExternalLight.h".}
proc New*(): ptr vtkExternalLight {.importcpp: "vtkExternalLight::New(@)",
                                header: "vtkExternalLight.h".}
type
  vtkExternalLightReplaceModes* {.size: sizeof(cint),
                                 importcpp: "vtkExternalLight::ReplaceModes",
                                 header: "vtkExternalLight.h".} = enum
    INDIVIDUAL_PARAMS = 0,      ##  default
    ALL_PARAMS = 1


proc SetLightIndex*(this: var vtkExternalLight; _arg: cint) {.
    importcpp: "SetLightIndex", header: "vtkExternalLight.h".}
## !!!Ignored construct:  virtual int GetLightIndex ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LightIndex  of  << this -> LightIndex ) ; return this -> LightIndex ; } ;
## Error: expected ';'!!!

proc SetLightIndexReplaceMode*(this: var vtkExternalLight; _arg: cint) {.
    importcpp: "SetLightIndexReplaceMode", header: "vtkExternalLight.h".}
## !!!Ignored construct:  virtual int GetLightIndexReplaceMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReplaceMode  of  << this -> ReplaceMode ) ; return this -> ReplaceMode ; } ;
## Error: expected ';'!!!

proc SetPosition*(this: var vtkExternalLight; a2: cdouble; a3: cdouble; a4: cdouble) {.
    importcpp: "SetPosition", header: "vtkExternalLight.h".}
## using statement

proc SetFocalPoint*(this: var vtkExternalLight; a2: cdouble; a3: cdouble; a4: cdouble) {.
    importcpp: "SetFocalPoint", header: "vtkExternalLight.h".}
## using statement

proc SetAmbientColor*(this: var vtkExternalLight; a2: cdouble; a3: cdouble; a4: cdouble) {.
    importcpp: "SetAmbientColor", header: "vtkExternalLight.h".}
## using statement

proc SetDiffuseColor*(this: var vtkExternalLight; a2: cdouble; a3: cdouble; a4: cdouble) {.
    importcpp: "SetDiffuseColor", header: "vtkExternalLight.h".}
## using statement

proc SetSpecularColor*(this: var vtkExternalLight; a2: cdouble; a3: cdouble; a4: cdouble) {.
    importcpp: "SetSpecularColor", header: "vtkExternalLight.h".}
## using statement

proc SetIntensity*(this: var vtkExternalLight; a2: cdouble) {.
    importcpp: "SetIntensity", header: "vtkExternalLight.h".}
proc SetConeAngle*(this: var vtkExternalLight; a2: cdouble) {.
    importcpp: "SetConeAngle", header: "vtkExternalLight.h".}
proc SetAttenuationValues*(this: var vtkExternalLight; a2: cdouble; a3: cdouble;
                          a4: cdouble) {.importcpp: "SetAttenuationValues",
                                       header: "vtkExternalLight.h".}
## using statement

proc SetExponent*(this: var vtkExternalLight; a2: cdouble) {.importcpp: "SetExponent",
    header: "vtkExternalLight.h".}
proc SetPositional*(this: var vtkExternalLight; a2: vtkTypeBool) {.
    importcpp: "SetPositional", header: "vtkExternalLight.h".}
## !!!Ignored construct:  /@{ *
##  Check whether value set by user
##  virtual bool GetLightIndexReplaceModePositionSetPositionSet ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PositionSet  of  << this -> PositionSet ) ; return this -> PositionSet ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Check whether value set by user
##  virtual bool GetLightIndexReplaceModePositionSetPositionSetFocalPointSetFocalPointSet ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FocalPointSet  of  << this -> FocalPointSet ) ; return this -> FocalPointSet ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Check whether value set by user
##  virtual bool GetLightIndexReplaceModePositionSetPositionSetFocalPointSetFocalPointSetAmbientColorSetAmbientColorSet ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AmbientColorSet  of  << this -> AmbientColorSet ) ; return this -> AmbientColorSet ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Check whether value set by user
##  virtual bool GetLightIndexReplaceModePositionSetPositionSetFocalPointSetFocalPointSetAmbientColorSetAmbientColorSetDiffuseColorSetDiffuseColorSet ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DiffuseColorSet  of  << this -> DiffuseColorSet ) ; return this -> DiffuseColorSet ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Check whether value set by user
##  virtual bool GetLightIndexReplaceModePositionSetPositionSetFocalPointSetFocalPointSetAmbientColorSetAmbientColorSetDiffuseColorSetDiffuseColorSetSpecularColorSetSpecularColorSet ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SpecularColorSet  of  << this -> SpecularColorSet ) ; return this -> SpecularColorSet ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Check whether value set by user
##  virtual bool GetLightIndexReplaceModePositionSetPositionSetFocalPointSetFocalPointSetAmbientColorSetAmbientColorSetDiffuseColorSetDiffuseColorSetSpecularColorSetSpecularColorSetIntensitySetIntensitySet ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IntensitySet  of  << this -> IntensitySet ) ; return this -> IntensitySet ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Check whether value set by user
##  virtual bool GetLightIndexReplaceModePositionSetPositionSetFocalPointSetFocalPointSetAmbientColorSetAmbientColorSetDiffuseColorSetDiffuseColorSetSpecularColorSetSpecularColorSetIntensitySetIntensitySetConeAngleSetConeAngleSet ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ConeAngleSet  of  << this -> ConeAngleSet ) ; return this -> ConeAngleSet ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Check whether value set by user
##  virtual bool GetLightIndexReplaceModePositionSetPositionSetFocalPointSetFocalPointSetAmbientColorSetAmbientColorSetDiffuseColorSetDiffuseColorSetSpecularColorSetSpecularColorSetIntensitySetIntensitySetConeAngleSetConeAngleSetAttenuationValuesSetAttenuationValuesSet ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AttenuationValuesSet  of  << this -> AttenuationValuesSet ) ; return this -> AttenuationValuesSet ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Check whether value set by user
##  virtual bool GetLightIndexReplaceModePositionSetPositionSetFocalPointSetFocalPointSetAmbientColorSetAmbientColorSetDiffuseColorSetDiffuseColorSetSpecularColorSetSpecularColorSetIntensitySetIntensitySetConeAngleSetConeAngleSetAttenuationValuesSetAttenuationValuesSetExponentSetExponentSet ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ExponentSet  of  << this -> ExponentSet ) ; return this -> ExponentSet ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Check whether value set by user
##  virtual bool GetLightIndexReplaceModePositionSetPositionSetFocalPointSetFocalPointSetAmbientColorSetAmbientColorSetDiffuseColorSetDiffuseColorSetSpecularColorSetSpecularColorSetIntensitySetIntensitySetConeAngleSetConeAngleSetAttenuationValuesSetAttenuationValuesSetExponentSetExponentSetPositionalSetPositionalSet ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PositionalSet  of  << this -> PositionalSet ) ; return this -> PositionalSet ; } ;
## Error: expected ';'!!!
