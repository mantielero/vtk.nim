## =========================================================================
##
##   Program:   Visualization Toolkit
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
##  @class   vtkShader
##  @brief   encapsulate a glsl shader
##
##  vtkShader represents a shader, vertex, fragment, geometry etc
##

import
  vtkObject, vtkRenderingOpenGL2Module

## *
##  @brief Vertex or Fragment shader, combined into a ShaderProgram.
##
##  This class creates a Vertex, Fragment or Geometry shader, that can be
##  attached to a ShaderProgram in order to render geometry etc.
##

type
  vtkShader* {.importcpp: "vtkShader", header: "vtkShader.h", bycopy.} = object of vtkObject
    vtkShader* {.importc: "vtkShader".}: VTK_NEWINSTANCE


proc New*(): ptr vtkShader {.importcpp: "vtkShader::New(@)", header: "vtkShader.h".}
type
  vtkShaderSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkShader::IsTypeOf(@)",
    header: "vtkShader.h".}
proc IsA*(this: var vtkShader; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkShader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkShader {.
    importcpp: "vtkShader::SafeDownCast(@)", header: "vtkShader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkShader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkShader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkShader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkShader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkShader.h".}
type
  vtkShaderType* {.size: sizeof(cint), importcpp: "vtkShader::Type",
                  header: "vtkShader.h".} = enum
    Vertex,                   ## *< Vertex shader
    Fragment,                 ## *< Fragment shader
    Geometry,                 ## *< Geometry shader
    Unknown                   ## *< Unknown (default)


proc SetType*(this: var vtkShader; `type`: vtkShaderType) {.importcpp: "SetType",
    header: "vtkShader.h".}
proc GetType*(this: vtkShader): vtkShaderType {.noSideEffect, importcpp: "GetType",
    header: "vtkShader.h".}
proc SetSource*(this: var vtkShader; source: string) {.importcpp: "SetSource",
    header: "vtkShader.h".}
proc GetSource*(this: vtkShader): string {.noSideEffect, importcpp: "GetSource",
                                       header: "vtkShader.h".}
proc GetError*(this: vtkShader): string {.noSideEffect, importcpp: "GetError",
                                      header: "vtkShader.h".}
proc GetHandle*(this: vtkShader): cint {.noSideEffect, importcpp: "GetHandle",
                                     header: "vtkShader.h".}
proc Compile*(this: var vtkShader): bool {.importcpp: "Compile", header: "vtkShader.h".}
proc Cleanup*(this: var vtkShader) {.importcpp: "Cleanup", header: "vtkShader.h".}
type
  vtkShaderReplacementSpec* {.importcpp: "vtkShader::ReplacementSpec",
                             header: "vtkShader.h", bycopy.} = object
    OriginalValue* {.importc: "OriginalValue".}: string
    ShaderType* {.importc: "ShaderType".}: vtkShaderType
    ReplaceFirst* {.importc: "ReplaceFirst".}: bool


proc `<`*(this: vtkShaderReplacementSpec; v1: vtkShaderReplacementSpec): bool {.
    noSideEffect, importcpp: "(# < #)", header: "vtkShader.h".}
type
  vtkShaderReplacementValue* {.importcpp: "vtkShader::ReplacementValue",
                              header: "vtkShader.h", bycopy.} = object
    Replacement* {.importc: "Replacement".}: string
    ReplaceAll* {.importc: "ReplaceAll".}: bool

