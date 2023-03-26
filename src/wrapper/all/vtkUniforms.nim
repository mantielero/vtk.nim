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
##  @class   vtkUniforms
##  @brief   helper class to set custom uniform variables in GPU shaders.
##
##  This class implements a generic mechanism to declare and set the value of custom uniform
##  variables to be used in GPU shader programs used by mappers. It allows users who specify
##  custom shader code for mappers to change the value of the variable they define without
##  triggering a costly rebuild of the shader. This class is used mostly as an interface and
##  the implementation is found in graphics api specific derived classes (e.g.: vtkOpenGLUniforms).
##
##  @sa
##  vtkOpenGLUniforms vtkShaderProperty
##
##  @par Thanks:
##  Developed by Simon Drouin (sdrouin2@bwh.harvard.edu) at Brigham and Women's Hospital.
##

import
  vtkObject, vtkRenderingCoreModule

discard "forward decl of vtkMatrix3x3"
discard "forward decl of vtkMatrix4x4"
type
  vtkUniforms* {.importcpp: "vtkUniforms", header: "vtkUniforms.h", bycopy.} = object of vtkObject
    vtkUniforms* {.importc: "vtkUniforms".}: VTK_NEWINSTANCE


proc New*(): ptr vtkUniforms {.importcpp: "vtkUniforms::New(@)",
                           header: "vtkUniforms.h".}
type
  vtkUniformsSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkUniforms::IsTypeOf(@)", header: "vtkUniforms.h".}
proc IsA*(this: var vtkUniforms; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkUniforms.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkUniforms {.
    importcpp: "vtkUniforms::SafeDownCast(@)", header: "vtkUniforms.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkUniforms :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkUniforms :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkUniforms :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkUniforms; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkUniforms.h".}
proc GetUniformListMTime*(this: var vtkUniforms): vtkMTimeType {.
    importcpp: "GetUniformListMTime", header: "vtkUniforms.h".}
type
  vtkUniformsTupleType* {.size: sizeof(cint), importcpp: "vtkUniforms::TupleType",
                         header: "vtkUniforms.h".} = enum
    TupleTypeInvalid = 0, TupleTypeScalar, TupleTypeVector, TupleTypeMatrix,
    NumberOfTupleTypes


proc TupleTypeToString*(tt: vtkUniformsTupleType): string {.
    importcpp: "vtkUniforms::TupleTypeToString(@)", header: "vtkUniforms.h".}
proc StringToTupleType*(s: string): vtkUniformsTupleType {.
    importcpp: "vtkUniforms::StringToTupleType(@)", header: "vtkUniforms.h".}
proc ScalarTypeToString*(scalarType: cint): string {.
    importcpp: "vtkUniforms::ScalarTypeToString(@)", header: "vtkUniforms.h".}
proc StringToScalarType*(s: string): cint {.importcpp: "vtkUniforms::StringToScalarType(@)",
                                        header: "vtkUniforms.h".}
proc RemoveUniform*(this: var vtkUniforms; name: cstring) {.
    importcpp: "RemoveUniform", header: "vtkUniforms.h".}
proc RemoveAllUniforms*(this: var vtkUniforms) {.importcpp: "RemoveAllUniforms",
    header: "vtkUniforms.h".}
proc SetUniform*(this: var vtkUniforms; name: cstring; tt: vtkUniformsTupleType;
                nbComponents: cint; value: vector[cint]) {.importcpp: "SetUniform",
    header: "vtkUniforms.h".}
proc SetUniform*(this: var vtkUniforms; name: cstring; tt: vtkUniformsTupleType;
                nbComponents: cint; value: vector[cfloat]) {.
    importcpp: "SetUniform", header: "vtkUniforms.h".}
proc GetUniform*(this: var vtkUniforms; name: cstring; value: var vector[cint]): bool {.
    importcpp: "GetUniform", header: "vtkUniforms.h".}
proc GetUniform*(this: var vtkUniforms; name: cstring; value: var vector[cfloat]): bool {.
    importcpp: "GetUniform", header: "vtkUniforms.h".}
proc SetUniformi*(this: var vtkUniforms; name: cstring; v: cint) {.
    importcpp: "SetUniformi", header: "vtkUniforms.h".}
proc SetUniformf*(this: var vtkUniforms; name: cstring; v: cfloat) {.
    importcpp: "SetUniformf", header: "vtkUniforms.h".}
proc SetUniform2i*(this: var vtkUniforms; name: cstring; v: array[2, cint]) {.
    importcpp: "SetUniform2i", header: "vtkUniforms.h".}
proc SetUniform2f*(this: var vtkUniforms; name: cstring; v: array[2, cfloat]) {.
    importcpp: "SetUniform2f", header: "vtkUniforms.h".}
proc SetUniform3f*(this: var vtkUniforms; name: cstring; v: array[3, cfloat]) {.
    importcpp: "SetUniform3f", header: "vtkUniforms.h".}
proc SetUniform4f*(this: var vtkUniforms; name: cstring; v: array[4, cfloat]) {.
    importcpp: "SetUniform4f", header: "vtkUniforms.h".}
proc SetUniformMatrix3x3*(this: var vtkUniforms; name: cstring; v: ptr cfloat) {.
    importcpp: "SetUniformMatrix3x3", header: "vtkUniforms.h".}
proc SetUniformMatrix4x4*(this: var vtkUniforms; name: cstring; v: ptr cfloat) {.
    importcpp: "SetUniformMatrix4x4", header: "vtkUniforms.h".}
proc SetUniform1iv*(this: var vtkUniforms; name: cstring; count: cint; f: ptr cint) {.
    importcpp: "SetUniform1iv", header: "vtkUniforms.h".}
proc SetUniform1fv*(this: var vtkUniforms; name: cstring; count: cint; f: ptr cfloat) {.
    importcpp: "SetUniform1fv", header: "vtkUniforms.h".}
proc SetUniform2fv*(this: var vtkUniforms; name: cstring; count: cint;
                   f: array[2, cfloat]) {.importcpp: "SetUniform2fv",
                                       header: "vtkUniforms.h".}
proc SetUniform3fv*(this: var vtkUniforms; name: cstring; count: cint;
                   f: array[3, cfloat]) {.importcpp: "SetUniform3fv",
                                       header: "vtkUniforms.h".}
proc SetUniform4fv*(this: var vtkUniforms; name: cstring; count: cint;
                   f: array[4, cfloat]) {.importcpp: "SetUniform4fv",
                                       header: "vtkUniforms.h".}
proc SetUniformMatrix4x4v*(this: var vtkUniforms; name: cstring; count: cint;
                          v: ptr cfloat) {.importcpp: "SetUniformMatrix4x4v",
                                        header: "vtkUniforms.h".}
proc SetUniform3f*(this: var vtkUniforms; name: cstring; v: array[3, cdouble]) {.
    importcpp: "SetUniform3f", header: "vtkUniforms.h".}
proc SetUniform3uc*(this: var vtkUniforms; name: cstring; v: array[3, cuchar]) {.
    importcpp: "SetUniform3uc", header: "vtkUniforms.h".}
proc SetUniform4uc*(this: var vtkUniforms; name: cstring; v: array[4, cuchar]) {.
    importcpp: "SetUniform4uc", header: "vtkUniforms.h".}
proc SetUniformMatrix*(this: var vtkUniforms; name: cstring; v: ptr vtkMatrix3x3) {.
    importcpp: "SetUniformMatrix", header: "vtkUniforms.h".}
proc SetUniformMatrix*(this: var vtkUniforms; name: cstring; v: ptr vtkMatrix4x4) {.
    importcpp: "SetUniformMatrix", header: "vtkUniforms.h".}
proc GetUniformi*(this: var vtkUniforms; name: cstring; v: var cint): bool {.
    importcpp: "GetUniformi", header: "vtkUniforms.h".}
proc GetUniformf*(this: var vtkUniforms; name: cstring; v: var cfloat): bool {.
    importcpp: "GetUniformf", header: "vtkUniforms.h".}
proc GetUniform2i*(this: var vtkUniforms; name: cstring; v: array[2, cint]): bool {.
    importcpp: "GetUniform2i", header: "vtkUniforms.h".}
proc GetUniform2f*(this: var vtkUniforms; name: cstring; v: array[2, cfloat]): bool {.
    importcpp: "GetUniform2f", header: "vtkUniforms.h".}
proc GetUniform3f*(this: var vtkUniforms; name: cstring; v: array[3, cfloat]): bool {.
    importcpp: "GetUniform3f", header: "vtkUniforms.h".}
proc GetUniform4f*(this: var vtkUniforms; name: cstring; v: array[4, cfloat]): bool {.
    importcpp: "GetUniform4f", header: "vtkUniforms.h".}
proc GetUniformMatrix3x3*(this: var vtkUniforms; name: cstring; v: ptr cfloat): bool {.
    importcpp: "GetUniformMatrix3x3", header: "vtkUniforms.h".}
proc GetUniformMatrix4x4*(this: var vtkUniforms; name: cstring; v: ptr cfloat): bool {.
    importcpp: "GetUniformMatrix4x4", header: "vtkUniforms.h".}
proc GetUniform3f*(this: var vtkUniforms; name: cstring; v: array[3, cdouble]): bool {.
    importcpp: "GetUniform3f", header: "vtkUniforms.h".}
proc GetUniform3uc*(this: var vtkUniforms; name: cstring; v: array[3, cuchar]): bool {.
    importcpp: "GetUniform3uc", header: "vtkUniforms.h".}
proc GetUniform4uc*(this: var vtkUniforms; name: cstring; v: array[4, cuchar]): bool {.
    importcpp: "GetUniform4uc", header: "vtkUniforms.h".}
proc GetUniformMatrix*(this: var vtkUniforms; name: cstring; v: ptr vtkMatrix3x3): bool {.
    importcpp: "GetUniformMatrix", header: "vtkUniforms.h".}
proc GetUniformMatrix*(this: var vtkUniforms; name: cstring; v: ptr vtkMatrix4x4): bool {.
    importcpp: "GetUniformMatrix", header: "vtkUniforms.h".}
proc GetUniform1iv*(this: var vtkUniforms; name: cstring; f: var vector[cint]): bool {.
    importcpp: "GetUniform1iv", header: "vtkUniforms.h".}
proc GetUniform1fv*(this: var vtkUniforms; name: cstring; f: var vector[cfloat]): bool {.
    importcpp: "GetUniform1fv", header: "vtkUniforms.h".}
proc GetUniform2fv*(this: var vtkUniforms; name: cstring; f: var vector[cfloat]): bool {.
    importcpp: "GetUniform2fv", header: "vtkUniforms.h".}
proc GetUniform3fv*(this: var vtkUniforms; name: cstring; f: var vector[cfloat]): bool {.
    importcpp: "GetUniform3fv", header: "vtkUniforms.h".}
proc GetUniform4fv*(this: var vtkUniforms; name: cstring; f: var vector[cfloat]): bool {.
    importcpp: "GetUniform4fv", header: "vtkUniforms.h".}
proc GetUniformMatrix4x4v*(this: var vtkUniforms; name: cstring; f: var vector[cfloat]): bool {.
    importcpp: "GetUniformMatrix4x4v", header: "vtkUniforms.h".}
proc GetNumberOfUniforms*(this: var vtkUniforms): cint {.
    importcpp: "GetNumberOfUniforms", header: "vtkUniforms.h".}
proc GetNthUniformName*(this: var vtkUniforms; uniformIndex: vtkIdType): cstring {.
    importcpp: "GetNthUniformName", header: "vtkUniforms.h".}
proc GetUniformScalarType*(this: var vtkUniforms; name: cstring): cint {.
    importcpp: "GetUniformScalarType", header: "vtkUniforms.h".}
proc GetUniformTupleType*(this: var vtkUniforms; name: cstring): vtkUniformsTupleType {.
    importcpp: "GetUniformTupleType", header: "vtkUniforms.h".}
proc GetUniformNumberOfComponents*(this: var vtkUniforms; name: cstring): cint {.
    importcpp: "GetUniformNumberOfComponents", header: "vtkUniforms.h".}
proc GetUniformNumberOfTuples*(this: var vtkUniforms; name: cstring): cint {.
    importcpp: "GetUniformNumberOfTuples", header: "vtkUniforms.h".}