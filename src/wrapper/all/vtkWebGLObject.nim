## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkWebGLObject.h
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
##  @class   vtkWebGLObject
##  @brief   vtkWebGLObject represent and manipulate an WebGL object and its data.
##

import
  vtkObject, vtkWebGLExporterModule

discard "forward decl of vtkMatrix4x4"
discard "forward decl of vtkUnsignedCharArray"
type
  WebGLObjectTypes* {.size: sizeof(cint), importcpp: "WebGLObjectTypes",
                     header: "vtkWebGLObject.h".} = enum
    wPOINTS = 0, wLINES = 1, wTRIANGLES = 2


type
  vtkWebGLObject* {.importcpp: "vtkWebGLObject", header: "vtkWebGLObject.h", bycopy.} = object of vtkObject
    vtkWebGLObject* {.importc: "vtkWebGLObject".}: VTK_NEWINSTANCE
    ##  Renderer Layer
    ##  Id of the object


proc New*(): ptr vtkWebGLObject {.importcpp: "vtkWebGLObject::New(@)",
                              header: "vtkWebGLObject.h".}
type
  vtkWebGLObjectSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkWebGLObject::IsTypeOf(@)", header: "vtkWebGLObject.h".}
proc IsA*(this: var vtkWebGLObject; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkWebGLObject.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkWebGLObject {.
    importcpp: "vtkWebGLObject::SafeDownCast(@)", header: "vtkWebGLObject.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkWebGLObject :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkWebGLObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkWebGLObject :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkWebGLObject; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkWebGLObject.h".}
proc GenerateBinaryData*(this: var vtkWebGLObject) {.
    importcpp: "GenerateBinaryData", header: "vtkWebGLObject.h".}
proc GetBinaryData*(this: var vtkWebGLObject; part: cint): ptr cuchar {.
    importcpp: "GetBinaryData", header: "vtkWebGLObject.h".}
proc GetBinarySize*(this: var vtkWebGLObject; part: cint): cint {.
    importcpp: "GetBinarySize", header: "vtkWebGLObject.h".}
proc GetNumberOfParts*(this: var vtkWebGLObject): cint {.
    importcpp: "GetNumberOfParts", header: "vtkWebGLObject.h".}
proc GetBinaryData*(this: var vtkWebGLObject; part: cint;
                   buffer: ptr vtkUnsignedCharArray) {.importcpp: "GetBinaryData",
    header: "vtkWebGLObject.h".}
proc SetLayer*(this: var vtkWebGLObject; l: cint) {.importcpp: "SetLayer",
    header: "vtkWebGLObject.h".}
proc SetRendererId*(this: var vtkWebGLObject; i: csize_t) {.
    importcpp: "SetRendererId", header: "vtkWebGLObject.h".}
proc SetId*(this: var vtkWebGLObject; i: string) {.importcpp: "SetId",
    header: "vtkWebGLObject.h".}
proc SetWireframeMode*(this: var vtkWebGLObject; wireframe: bool) {.
    importcpp: "SetWireframeMode", header: "vtkWebGLObject.h".}
proc SetVisibility*(this: var vtkWebGLObject; vis: bool) {.importcpp: "SetVisibility",
    header: "vtkWebGLObject.h".}
proc SetTransformationMatrix*(this: var vtkWebGLObject; m: ptr vtkMatrix4x4) {.
    importcpp: "SetTransformationMatrix", header: "vtkWebGLObject.h".}
proc SetIsWidget*(this: var vtkWebGLObject; w: bool) {.importcpp: "SetIsWidget",
    header: "vtkWebGLObject.h".}
proc SetHasTransparency*(this: var vtkWebGLObject; t: bool) {.
    importcpp: "SetHasTransparency", header: "vtkWebGLObject.h".}
proc SetInteractAtServer*(this: var vtkWebGLObject; i: bool) {.
    importcpp: "SetInteractAtServer", header: "vtkWebGLObject.h".}
proc SetType*(this: var vtkWebGLObject; t: WebGLObjectTypes) {.importcpp: "SetType",
    header: "vtkWebGLObject.h".}
proc isWireframeMode*(this: var vtkWebGLObject): bool {.importcpp: "isWireframeMode",
    header: "vtkWebGLObject.h".}
proc isVisible*(this: var vtkWebGLObject): bool {.importcpp: "isVisible",
    header: "vtkWebGLObject.h".}
proc HasChanged*(this: var vtkWebGLObject): bool {.importcpp: "HasChanged",
    header: "vtkWebGLObject.h".}
proc isWidget*(this: var vtkWebGLObject): bool {.importcpp: "isWidget",
    header: "vtkWebGLObject.h".}
proc HasTransparency*(this: var vtkWebGLObject): bool {.importcpp: "HasTransparency",
    header: "vtkWebGLObject.h".}
proc InteractAtServer*(this: var vtkWebGLObject): bool {.
    importcpp: "InteractAtServer", header: "vtkWebGLObject.h".}
proc GetMD5*(this: var vtkWebGLObject): string {.importcpp: "GetMD5",
    header: "vtkWebGLObject.h".}
proc GetId*(this: var vtkWebGLObject): string {.importcpp: "GetId",
    header: "vtkWebGLObject.h".}
proc GetRendererId*(this: var vtkWebGLObject): csize_t {.importcpp: "GetRendererId",
    header: "vtkWebGLObject.h".}
proc GetLayer*(this: var vtkWebGLObject): cint {.importcpp: "GetLayer",
    header: "vtkWebGLObject.h".}