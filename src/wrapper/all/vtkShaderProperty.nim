## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkShaderProperty.h
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
##  @class   vtkShaderProperty
##  @brief   represent GPU shader properties
##
##  vtkShaderProperty is used to hold user-defined modifications of a
##  GPU shader program used in a mapper.
##
##  @sa
##  vtkVolume vtkOpenGLUniform
##
##  @par Thanks:
##  Developed by Simon Drouin (sdrouin2@bwh.harvard.edu) at Brigham and Women's Hospital.
##
##

import
  vtkNew, vtkObject, vtkRenderingCoreModule

discard "forward decl of vtkUniforms"
type
  vtkShaderProperty* {.importcpp: "vtkShaderProperty",
                      header: "vtkShaderProperty.h", bycopy.} = object of vtkObject
    vtkShaderProperty* {.importc: "vtkShaderProperty".}: VTK_NEWINSTANCE

  vtkShaderPropertySuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkShaderProperty::IsTypeOf(@)", header: "vtkShaderProperty.h".}
proc IsA*(this: var vtkShaderProperty; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkShaderProperty.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkShaderProperty {.
    importcpp: "vtkShaderProperty::SafeDownCast(@)", header: "vtkShaderProperty.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkShaderProperty :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkShaderProperty :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkShaderProperty :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkShaderProperty; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkShaderProperty.h".}
proc New*(): ptr vtkShaderProperty {.importcpp: "vtkShaderProperty::New(@)",
                                 header: "vtkShaderProperty.h".}
proc DeepCopy*(this: var vtkShaderProperty; p: ptr vtkShaderProperty) {.
    importcpp: "DeepCopy", header: "vtkShaderProperty.h".}
proc GetShaderMTime*(this: var vtkShaderProperty): vtkMTimeType {.
    importcpp: "GetShaderMTime", header: "vtkShaderProperty.h".}
proc HasVertexShaderCode*(this: var vtkShaderProperty): bool {.
    importcpp: "HasVertexShaderCode", header: "vtkShaderProperty.h".}
proc HasFragmentShaderCode*(this: var vtkShaderProperty): bool {.
    importcpp: "HasFragmentShaderCode", header: "vtkShaderProperty.h".}
proc HasGeometryShaderCode*(this: var vtkShaderProperty): bool {.
    importcpp: "HasGeometryShaderCode", header: "vtkShaderProperty.h".}
proc SetVertexShaderCode*(this: var vtkShaderProperty; _arg: cstring) {.
    importcpp: "SetVertexShaderCode", header: "vtkShaderProperty.h".}
proc GetVertexShaderCode*(this: var vtkShaderProperty): cstring {.
    importcpp: "GetVertexShaderCode", header: "vtkShaderProperty.h".}
proc SetVertexShaderCodeFragmentShaderCode*(this: var vtkShaderProperty;
    _arg: cstring) {.importcpp: "SetVertexShaderCodeFragmentShaderCode",
                   header: "vtkShaderProperty.h".}
proc GetVertexShaderCodeFragmentShaderCode*(this: var vtkShaderProperty): cstring {.
    importcpp: "GetVertexShaderCodeFragmentShaderCode",
    header: "vtkShaderProperty.h".}
proc SetVertexShaderCodeFragmentShaderCodeGeometryShaderCode*(
    this: var vtkShaderProperty; _arg: cstring) {.
    importcpp: "SetVertexShaderCodeFragmentShaderCodeGeometryShaderCode",
    header: "vtkShaderProperty.h".}
proc GetVertexShaderCodeFragmentShaderCodeGeometryShaderCode*(
    this: var vtkShaderProperty): cstring {.importcpp: "GetVertexShaderCodeFragmentShaderCodeGeometryShaderCode",
                                        header: "vtkShaderProperty.h".}
  ## /@}
  ## /@{
  ## *
  ##  The Uniforms object allows to set custom uniform variables
  ##  that are used in replacement shader code.
  ##
proc GetnameFragmentCustomUniforms*(this: var vtkShaderProperty): ptr vtkUniforms {.
    importcpp: "GetnameFragmentCustomUniforms", header: "vtkShaderProperty.h".}
proc GetnameFragmentCustomUniformsVertexCustomUniforms*(
    this: var vtkShaderProperty): ptr vtkUniforms {.
    importcpp: "GetnameFragmentCustomUniformsVertexCustomUniforms",
    header: "vtkShaderProperty.h".}
proc GetnameFragmentCustomUniformsVertexCustomUniformsGeometryCustomUniforms*(
    this: var vtkShaderProperty): ptr vtkUniforms {.importcpp: "GetnameFragmentCustomUniformsVertexCustomUniformsGeometryCustomUniforms",
    header: "vtkShaderProperty.h".}
  ## /@}
  ## /@{
  ## *
  ##  This function enables you to apply your own substitutions
  ##  to the shader creation process. The shader code in this class
  ##  is created by applying a bunch of string replacements to a
  ##  shader template. Using this function you can apply your
  ##  own string replacements to add features you desire.
  ##
proc AddVertexShaderReplacement*(this: var vtkShaderProperty; originalValue: string;
                                replaceFirst: bool; replacementValue: string;
                                replaceAll: bool) {.
    importcpp: "AddVertexShaderReplacement", header: "vtkShaderProperty.h".}
  ##  do this replacement before the default
proc AddFragmentShaderReplacement*(this: var vtkShaderProperty;
                                  originalValue: string; replaceFirst: bool;
                                  replacementValue: string; replaceAll: bool) {.
    importcpp: "AddFragmentShaderReplacement", header: "vtkShaderProperty.h".}
  ##  do this replacement before the default
proc AddGeometryShaderReplacement*(this: var vtkShaderProperty;
                                  originalValue: string; replaceFirst: bool;
                                  replacementValue: string; replaceAll: bool) {.
    importcpp: "AddGeometryShaderReplacement", header: "vtkShaderProperty.h".}
  ##  do this replacement before the default
proc GetNumberOfShaderReplacements*(this: var vtkShaderProperty): cint {.
    importcpp: "GetNumberOfShaderReplacements", header: "vtkShaderProperty.h".}
proc GetNthShaderReplacementTypeAsString*(this: var vtkShaderProperty;
    index: vtkIdType): string {.importcpp: "GetNthShaderReplacementTypeAsString",
                             header: "vtkShaderProperty.h".}
proc GetNthShaderReplacement*(this: var vtkShaderProperty; index: vtkIdType;
                             name: var string; replaceFirst: var bool;
                             replacementValue: var string; replaceAll: var bool) {.
    importcpp: "GetNthShaderReplacement", header: "vtkShaderProperty.h".}
proc ClearVertexShaderReplacement*(this: var vtkShaderProperty;
                                  originalValue: string; replaceFirst: bool) {.
    importcpp: "ClearVertexShaderReplacement", header: "vtkShaderProperty.h".}
proc ClearFragmentShaderReplacement*(this: var vtkShaderProperty;
                                    originalValue: string; replaceFirst: bool) {.
    importcpp: "ClearFragmentShaderReplacement", header: "vtkShaderProperty.h".}
proc ClearGeometryShaderReplacement*(this: var vtkShaderProperty;
                                    originalValue: string; replaceFirst: bool) {.
    importcpp: "ClearGeometryShaderReplacement", header: "vtkShaderProperty.h".}
proc ClearAllVertexShaderReplacements*(this: var vtkShaderProperty) {.
    importcpp: "ClearAllVertexShaderReplacements", header: "vtkShaderProperty.h".}
proc ClearAllFragmentShaderReplacements*(this: var vtkShaderProperty) {.
    importcpp: "ClearAllFragmentShaderReplacements", header: "vtkShaderProperty.h".}
proc ClearAllGeometryShaderReplacements*(this: var vtkShaderProperty) {.
    importcpp: "ClearAllGeometryShaderReplacements", header: "vtkShaderProperty.h".}
proc ClearAllShaderReplacements*(this: var vtkShaderProperty) {.
    importcpp: "ClearAllShaderReplacements", header: "vtkShaderProperty.h".}