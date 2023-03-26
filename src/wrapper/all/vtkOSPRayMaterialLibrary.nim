## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOSPRayMaterialLibrary.h
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
##  @class   vtkOSPRayMaterialLibrary
##  @brief   a collection of materials for vtk apps to draw from
##
##  A singleton instance of this class manages a collection of materials.
##  The materials can be read in from disk or created programmatically.
##
##  @sa vtkOSPRayMaterialHelpers
##

import
  vtkObject, vtkRenderingRayTracingModule

discard "forward decl of vtkOSPRayMaterialLibraryInternals"
discard "forward decl of vtkTexture"
discard "forward decl of TextureInfo"
type
  vtkOSPRayMaterialLibrary* {.importcpp: "vtkOSPRayMaterialLibrary",
                             header: "vtkOSPRayMaterialLibrary.h", bycopy.} = object of vtkObject
    vtkOSPRayMaterialLibrary* {.importc: "vtkOSPRayMaterialLibrary".}: VTK_NEWINSTANCE


proc New*(): ptr vtkOSPRayMaterialLibrary {.importcpp: "vtkOSPRayMaterialLibrary::New(@)",
                                        header: "vtkOSPRayMaterialLibrary.h".}
type
  vtkOSPRayMaterialLibrarySuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOSPRayMaterialLibrary::IsTypeOf(@)",
    header: "vtkOSPRayMaterialLibrary.h".}
proc IsA*(this: var vtkOSPRayMaterialLibrary; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkOSPRayMaterialLibrary.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOSPRayMaterialLibrary {.
    importcpp: "vtkOSPRayMaterialLibrary::SafeDownCast(@)",
    header: "vtkOSPRayMaterialLibrary.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOSPRayMaterialLibrary :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOSPRayMaterialLibrary :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOSPRayMaterialLibrary :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkOSPRayMaterialLibrary; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkOSPRayMaterialLibrary.h".}
proc Fire*(this: var vtkOSPRayMaterialLibrary) {.importcpp: "Fire",
    header: "vtkOSPRayMaterialLibrary.h".}
proc ReadFile*(this: var vtkOSPRayMaterialLibrary; FileName: cstring): bool {.
    importcpp: "ReadFile", header: "vtkOSPRayMaterialLibrary.h".}
proc WriteBuffer*(this: var vtkOSPRayMaterialLibrary; writeImageInline: bool = true): cstring {.
    importcpp: "WriteBuffer", header: "vtkOSPRayMaterialLibrary.h".}
proc WriteFile*(this: var vtkOSPRayMaterialLibrary; filename: string;
               writeImageInline: bool = false) {.importcpp: "WriteFile",
    header: "vtkOSPRayMaterialLibrary.h".}
proc ReadBuffer*(this: var vtkOSPRayMaterialLibrary; Buffer: cstring): bool {.
    importcpp: "ReadBuffer", header: "vtkOSPRayMaterialLibrary.h".}
proc GetMaterialNames*(this: var vtkOSPRayMaterialLibrary): set[string] {.
    importcpp: "GetMaterialNames", header: "vtkOSPRayMaterialLibrary.h".}
proc LookupImplName*(this: var vtkOSPRayMaterialLibrary; nickname: string): string {.
    importcpp: "LookupImplName", header: "vtkOSPRayMaterialLibrary.h".}
proc GetDoubleShaderVariableList*(this: var vtkOSPRayMaterialLibrary;
                                 nickname: string): vector[string] {.
    importcpp: "GetDoubleShaderVariableList", header: "vtkOSPRayMaterialLibrary.h".}
proc GetDoubleShaderVariable*(this: var vtkOSPRayMaterialLibrary; nickname: string;
                             varname: string): vector[cdouble] {.
    importcpp: "GetDoubleShaderVariable", header: "vtkOSPRayMaterialLibrary.h".}
proc GetTextureList*(this: var vtkOSPRayMaterialLibrary; nickname: string): vector[
    string] {.importcpp: "GetTextureList", header: "vtkOSPRayMaterialLibrary.h".}
proc GetTexture*(this: var vtkOSPRayMaterialLibrary; nickname: string; varname: string): ptr vtkTexture {.
    importcpp: "GetTexture", header: "vtkOSPRayMaterialLibrary.h".}
proc GetTextureInfo*(this: var vtkOSPRayMaterialLibrary; nickname: string;
                    varname: string): ptr TextureInfo {.importcpp: "GetTextureInfo",
    header: "vtkOSPRayMaterialLibrary.h".}
proc GetTextureName*(this: var vtkOSPRayMaterialLibrary; nickname: string;
                    varname: string): string {.importcpp: "GetTextureName",
    header: "vtkOSPRayMaterialLibrary.h".}
proc GetTextureFilename*(this: var vtkOSPRayMaterialLibrary; nickname: string;
                        varname: string): string {.importcpp: "GetTextureFilename",
    header: "vtkOSPRayMaterialLibrary.h".}
proc AddMaterial*(this: var vtkOSPRayMaterialLibrary; nickname: string;
                 implname: string) {.importcpp: "AddMaterial",
                                   header: "vtkOSPRayMaterialLibrary.h".}
proc RemoveMaterial*(this: var vtkOSPRayMaterialLibrary; nickname: string) {.
    importcpp: "RemoveMaterial", header: "vtkOSPRayMaterialLibrary.h".}
proc AddTexture*(this: var vtkOSPRayMaterialLibrary; nickname: string;
                varname: string; tex: ptr vtkTexture;
                texturename: string = "unnamedTexture"; filename: string = "") {.
    importcpp: "AddTexture", header: "vtkOSPRayMaterialLibrary.h".}
proc RemoveTexture*(this: var vtkOSPRayMaterialLibrary; nickname: string;
                   varname: string) {.importcpp: "RemoveTexture",
                                    header: "vtkOSPRayMaterialLibrary.h".}
proc RemoveAllTextures*(this: var vtkOSPRayMaterialLibrary; nickname: string) {.
    importcpp: "RemoveAllTextures", header: "vtkOSPRayMaterialLibrary.h".}
proc AddShaderVariable*(this: var vtkOSPRayMaterialLibrary; nickname: string;
                       variablename: string; numVars: cint; x: ptr cdouble) {.
    importcpp: "AddShaderVariable", header: "vtkOSPRayMaterialLibrary.h".}
proc AddShaderVariable*(this: var vtkOSPRayMaterialLibrary; nickname: string;
                       variablename: string; data: initializer_list[cdouble]) {.
    importcpp: "AddShaderVariable", header: "vtkOSPRayMaterialLibrary.h".}
proc RemoveShaderVariable*(this: var vtkOSPRayMaterialLibrary; nickname: string;
                          variablename: string) {.
    importcpp: "RemoveShaderVariable", header: "vtkOSPRayMaterialLibrary.h".}
proc RemoveAllShaderVariables*(this: var vtkOSPRayMaterialLibrary; nickname: string) {.
    importcpp: "RemoveAllShaderVariables", header: "vtkOSPRayMaterialLibrary.h".}
## !!!Ignored construct:  *
##  Lists all different parameter types
##  enum class ParameterType : unsigned char { FLOAT , NORMALIZED_FLOAT , FLOAT_DATA , VEC3 , COLOR_RGB , BOOLEAN , TEXTURE , VEC2 , VEC4 } ;
## Error: token expected: ; but got: :!!!

type
  ParametersMap* = map[string, vtkOSPRayMaterialLibraryParameterType]

proc GetParametersDictionary*(): map[string, ParametersMap] {.
    importcpp: "vtkOSPRayMaterialLibrary::GetParametersDictionary(@)",
    header: "vtkOSPRayMaterialLibrary.h".}