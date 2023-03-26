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
##  @class   vtkOpenGLUniforms
##  @brief   helper class to set custom uniform variables in GLSL shaders.
##
##  This class implements all SetUniform* functions supported by vtkShaderProgram but instead of
##  directly calling the underlying OpenGL functions, it caches the name and value of the variable
##  and provides a mechanism for client mappers to set all cached variables at once in a generic way.
##
##  The basic types of GLSL uniform variables supported by the class are the following: int, float,
##  vec2i, vec3, vec4, mat3, mat4, int[], float[], vec2i[], vec3[], vec4[], mat4[]. All other
##  types supported by Set* functions undergo the same type conversions implemented in
##  vtkShaderProgram.
##
##  @par Thanks:
##  Developed by Simon Drouin (sdrouin2@bwh.harvard.edu) at Brigham and Women's Hospital.
##

import
  vtkRenderingOpenGL2Module, vtkUniforms

discard "forward decl of vtkUniformInternals"
discard "forward decl of vtkShaderProgram"
type
  vtkOpenGLUniforms* {.importcpp: "vtkOpenGLUniforms",
                      header: "vtkOpenGLUniforms.h", bycopy.} = object of vtkUniforms
    vtkOpenGLUniforms* {.importc: "vtkOpenGLUniforms".}: VTK_NEWINSTANCE


proc New*(): ptr vtkOpenGLUniforms {.importcpp: "vtkOpenGLUniforms::New(@)",
                                 header: "vtkOpenGLUniforms.h".}
type
  vtkOpenGLUniformsSuperclass* = vtkUniforms

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOpenGLUniforms::IsTypeOf(@)", header: "vtkOpenGLUniforms.h".}
proc IsA*(this: var vtkOpenGLUniforms; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkOpenGLUniforms.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOpenGLUniforms {.
    importcpp: "vtkOpenGLUniforms::SafeDownCast(@)", header: "vtkOpenGLUniforms.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOpenGLUniforms :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUniforms :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOpenGLUniforms :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOpenGLUniforms :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkOpenGLUniforms; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkOpenGLUniforms.h".}
proc GetDeclarations*(this: var vtkOpenGLUniforms): string {.
    importcpp: "GetDeclarations", header: "vtkOpenGLUniforms.h".}
proc SetUniforms*(this: var vtkOpenGLUniforms; p: ptr vtkShaderProgram): bool {.
    importcpp: "SetUniforms", header: "vtkOpenGLUniforms.h".}
proc GetUniformListMTime*(this: var vtkOpenGLUniforms): vtkMTimeType {.
    importcpp: "GetUniformListMTime", header: "vtkOpenGLUniforms.h".}
proc RemoveUniform*(this: var vtkOpenGLUniforms; name: cstring) {.
    importcpp: "RemoveUniform", header: "vtkOpenGLUniforms.h".}
proc RemoveAllUniforms*(this: var vtkOpenGLUniforms) {.
    importcpp: "RemoveAllUniforms", header: "vtkOpenGLUniforms.h".}
proc SetUniform*(this: var vtkOpenGLUniforms; name: cstring; tt: TupleType;
                nbComponents: cint; value: vector[cint]) {.importcpp: "SetUniform",
    header: "vtkOpenGLUniforms.h".}
proc SetUniform*(this: var vtkOpenGLUniforms; name: cstring; tt: TupleType;
                nbComponents: cint; value: vector[cfloat]) {.
    importcpp: "SetUniform", header: "vtkOpenGLUniforms.h".}
proc GetUniform*(this: var vtkOpenGLUniforms; name: cstring; value: var vector[cint]): bool {.
    importcpp: "GetUniform", header: "vtkOpenGLUniforms.h".}
proc GetUniform*(this: var vtkOpenGLUniforms; name: cstring; value: var vector[cfloat]): bool {.
    importcpp: "GetUniform", header: "vtkOpenGLUniforms.h".}
proc SetUniformi*(this: var vtkOpenGLUniforms; name: cstring; v: cint) {.
    importcpp: "SetUniformi", header: "vtkOpenGLUniforms.h".}
proc SetUniformf*(this: var vtkOpenGLUniforms; name: cstring; v: cfloat) {.
    importcpp: "SetUniformf", header: "vtkOpenGLUniforms.h".}
proc SetUniform2i*(this: var vtkOpenGLUniforms; name: cstring; v: array[2, cint]) {.
    importcpp: "SetUniform2i", header: "vtkOpenGLUniforms.h".}
proc SetUniform2f*(this: var vtkOpenGLUniforms; name: cstring; v: array[2, cfloat]) {.
    importcpp: "SetUniform2f", header: "vtkOpenGLUniforms.h".}
proc SetUniform3f*(this: var vtkOpenGLUniforms; name: cstring; v: array[3, cfloat]) {.
    importcpp: "SetUniform3f", header: "vtkOpenGLUniforms.h".}
proc SetUniform4f*(this: var vtkOpenGLUniforms; name: cstring; v: array[4, cfloat]) {.
    importcpp: "SetUniform4f", header: "vtkOpenGLUniforms.h".}
proc SetUniformMatrix3x3*(this: var vtkOpenGLUniforms; name: cstring; v: ptr cfloat) {.
    importcpp: "SetUniformMatrix3x3", header: "vtkOpenGLUniforms.h".}
proc SetUniformMatrix4x4*(this: var vtkOpenGLUniforms; name: cstring; v: ptr cfloat) {.
    importcpp: "SetUniformMatrix4x4", header: "vtkOpenGLUniforms.h".}
proc SetUniform1iv*(this: var vtkOpenGLUniforms; name: cstring; count: cint; f: ptr cint) {.
    importcpp: "SetUniform1iv", header: "vtkOpenGLUniforms.h".}
proc SetUniform1fv*(this: var vtkOpenGLUniforms; name: cstring; count: cint;
                   f: ptr cfloat) {.importcpp: "SetUniform1fv",
                                 header: "vtkOpenGLUniforms.h".}
proc SetUniform2fv*(this: var vtkOpenGLUniforms; name: cstring; count: cint;
                   f: array[2, cfloat]) {.importcpp: "SetUniform2fv",
                                       header: "vtkOpenGLUniforms.h".}
proc SetUniform3fv*(this: var vtkOpenGLUniforms; name: cstring; count: cint;
                   f: array[3, cfloat]) {.importcpp: "SetUniform3fv",
                                       header: "vtkOpenGLUniforms.h".}
proc SetUniform4fv*(this: var vtkOpenGLUniforms; name: cstring; count: cint;
                   f: array[4, cfloat]) {.importcpp: "SetUniform4fv",
                                       header: "vtkOpenGLUniforms.h".}
proc SetUniformMatrix4x4v*(this: var vtkOpenGLUniforms; name: cstring; count: cint;
                          v: ptr cfloat) {.importcpp: "SetUniformMatrix4x4v",
                                        header: "vtkOpenGLUniforms.h".}
proc SetUniform3f*(this: var vtkOpenGLUniforms; name: cstring; v: array[3, cdouble]) {.
    importcpp: "SetUniform3f", header: "vtkOpenGLUniforms.h".}
proc SetUniform3uc*(this: var vtkOpenGLUniforms; name: cstring; v: array[3, cuchar]) {.
    importcpp: "SetUniform3uc", header: "vtkOpenGLUniforms.h".}
proc SetUniform4uc*(this: var vtkOpenGLUniforms; name: cstring; v: array[4, cuchar]) {.
    importcpp: "SetUniform4uc", header: "vtkOpenGLUniforms.h".}
proc SetUniformMatrix*(this: var vtkOpenGLUniforms; name: cstring; v: ptr vtkMatrix3x3) {.
    importcpp: "SetUniformMatrix", header: "vtkOpenGLUniforms.h".}
proc SetUniformMatrix*(this: var vtkOpenGLUniforms; name: cstring; v: ptr vtkMatrix4x4) {.
    importcpp: "SetUniformMatrix", header: "vtkOpenGLUniforms.h".}
proc GetUniformi*(this: var vtkOpenGLUniforms; name: cstring; v: var cint): bool {.
    importcpp: "GetUniformi", header: "vtkOpenGLUniforms.h".}
proc GetUniformf*(this: var vtkOpenGLUniforms; name: cstring; v: var cfloat): bool {.
    importcpp: "GetUniformf", header: "vtkOpenGLUniforms.h".}
proc GetUniform2i*(this: var vtkOpenGLUniforms; name: cstring; v: array[2, cint]): bool {.
    importcpp: "GetUniform2i", header: "vtkOpenGLUniforms.h".}
proc GetUniform2f*(this: var vtkOpenGLUniforms; name: cstring; v: array[2, cfloat]): bool {.
    importcpp: "GetUniform2f", header: "vtkOpenGLUniforms.h".}
proc GetUniform3f*(this: var vtkOpenGLUniforms; name: cstring; v: array[3, cfloat]): bool {.
    importcpp: "GetUniform3f", header: "vtkOpenGLUniforms.h".}
proc GetUniform4f*(this: var vtkOpenGLUniforms; name: cstring; v: array[4, cfloat]): bool {.
    importcpp: "GetUniform4f", header: "vtkOpenGLUniforms.h".}
proc GetUniformMatrix3x3*(this: var vtkOpenGLUniforms; name: cstring; v: ptr cfloat): bool {.
    importcpp: "GetUniformMatrix3x3", header: "vtkOpenGLUniforms.h".}
proc GetUniformMatrix4x4*(this: var vtkOpenGLUniforms; name: cstring; v: ptr cfloat): bool {.
    importcpp: "GetUniformMatrix4x4", header: "vtkOpenGLUniforms.h".}
proc GetUniform3f*(this: var vtkOpenGLUniforms; name: cstring; v: array[3, cdouble]): bool {.
    importcpp: "GetUniform3f", header: "vtkOpenGLUniforms.h".}
proc GetUniform3uc*(this: var vtkOpenGLUniforms; name: cstring; v: array[3, cuchar]): bool {.
    importcpp: "GetUniform3uc", header: "vtkOpenGLUniforms.h".}
proc GetUniform4uc*(this: var vtkOpenGLUniforms; name: cstring; v: array[4, cuchar]): bool {.
    importcpp: "GetUniform4uc", header: "vtkOpenGLUniforms.h".}
proc GetUniformMatrix*(this: var vtkOpenGLUniforms; name: cstring; v: ptr vtkMatrix3x3): bool {.
    importcpp: "GetUniformMatrix", header: "vtkOpenGLUniforms.h".}
proc GetUniformMatrix*(this: var vtkOpenGLUniforms; name: cstring; v: ptr vtkMatrix4x4): bool {.
    importcpp: "GetUniformMatrix", header: "vtkOpenGLUniforms.h".}
proc GetUniform1iv*(this: var vtkOpenGLUniforms; name: cstring; f: var vector[cint]): bool {.
    importcpp: "GetUniform1iv", header: "vtkOpenGLUniforms.h".}
proc GetUniform1fv*(this: var vtkOpenGLUniforms; name: cstring; f: var vector[cfloat]): bool {.
    importcpp: "GetUniform1fv", header: "vtkOpenGLUniforms.h".}
proc GetUniform2fv*(this: var vtkOpenGLUniforms; name: cstring; f: var vector[cfloat]): bool {.
    importcpp: "GetUniform2fv", header: "vtkOpenGLUniforms.h".}
proc GetUniform3fv*(this: var vtkOpenGLUniforms; name: cstring; f: var vector[cfloat]): bool {.
    importcpp: "GetUniform3fv", header: "vtkOpenGLUniforms.h".}
proc GetUniform4fv*(this: var vtkOpenGLUniforms; name: cstring; f: var vector[cfloat]): bool {.
    importcpp: "GetUniform4fv", header: "vtkOpenGLUniforms.h".}
proc GetUniformMatrix4x4v*(this: var vtkOpenGLUniforms; name: cstring;
                          f: var vector[cfloat]): bool {.
    importcpp: "GetUniformMatrix4x4v", header: "vtkOpenGLUniforms.h".}
proc GetNumberOfUniforms*(this: var vtkOpenGLUniforms): cint {.
    importcpp: "GetNumberOfUniforms", header: "vtkOpenGLUniforms.h".}
proc GetNthUniformName*(this: var vtkOpenGLUniforms; uniformIndex: vtkIdType): cstring {.
    importcpp: "GetNthUniformName", header: "vtkOpenGLUniforms.h".}
proc GetUniformScalarType*(this: var vtkOpenGLUniforms; name: cstring): cint {.
    importcpp: "GetUniformScalarType", header: "vtkOpenGLUniforms.h".}
proc GetUniformTupleType*(this: var vtkOpenGLUniforms; name: cstring): TupleType {.
    importcpp: "GetUniformTupleType", header: "vtkOpenGLUniforms.h".}
proc GetUniformNumberOfComponents*(this: var vtkOpenGLUniforms; name: cstring): cint {.
    importcpp: "GetUniformNumberOfComponents", header: "vtkOpenGLUniforms.h".}
proc GetUniformNumberOfTuples*(this: var vtkOpenGLUniforms; name: cstring): cint {.
    importcpp: "GetUniformNumberOfTuples", header: "vtkOpenGLUniforms.h".}