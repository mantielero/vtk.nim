## =========================================================================
##
## Program:   Visualization Toolkit
## Module:    vtkVRModel.h
##
## Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
## All rights reserved.
## See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
## This software is distributed WITHOUT ANY WARRANTY; without even
## the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
## PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkVRModel
##  @brief   VR device model
##
##  Abstract class used to load models
##  such as for the trackers and controllers and to
##  render them in the scene
##
##

import
  vtkNew, vtkObject, vtkOpenGLHelper, vtkRenderingVRModule

discard "forward decl of vtkMatrix4x4"
discard "forward decl of vtkOpenGLRenderWindow"
discard "forward decl of vtkOpenGLVertexBufferObject"
discard "forward decl of vtkTextureObject"
discard "forward decl of vtkVRRay"
type
  vtkVRModel* {.importcpp: "vtkVRModel", header: "vtkVRModel.h", bycopy.} = object of vtkObject
    vtkVRModel* {.importc: "vtkVRModel".}: VTK_NEWINSTANCE
    ##  Controller ray

  vtkVRModelSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkVRModel::IsTypeOf(@)",
    header: "vtkVRModel.h".}
proc IsA*(this: var vtkVRModel; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkVRModel.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkVRModel {.
    importcpp: "vtkVRModel::SafeDownCast(@)", header: "vtkVRModel.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkVRModel :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkVRModel :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkVRModel :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkVRModel; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkVRModel.h".}
proc Build*(this: var vtkVRModel; win: ptr vtkOpenGLRenderWindow): bool {.
    importcpp: "Build", header: "vtkVRModel.h".}
proc Render*(this: var vtkVRModel; win: ptr vtkOpenGLRenderWindow;
            poseInTrackingCoordinates: ptr vtkMatrix4x4) {.importcpp: "Render",
    header: "vtkVRModel.h".}
proc GetName*(this: vtkVRModel): string {.noSideEffect, importcpp: "GetName",
                                      header: "vtkVRModel.h".}
proc SetName*(this: var vtkVRModel; modelName: string) {.importcpp: "SetName",
    header: "vtkVRModel.h".}
proc SetVisibility*(this: var vtkVRModel; v: bool) {.importcpp: "SetVisibility",
    header: "vtkVRModel.h".}
proc GetVisibility*(this: var vtkVRModel): bool {.importcpp: "GetVisibility",
    header: "vtkVRModel.h".}
proc SetShowRay*(this: var vtkVRModel; v: bool) {.importcpp: "SetShowRay",
    header: "vtkVRModel.h".}
proc SetRayLength*(this: var vtkVRModel; length: cdouble) {.importcpp: "SetRayLength",
    header: "vtkVRModel.h".}
proc SetRayColor*(this: var vtkVRModel; r: cdouble; g: cdouble; b: cdouble) {.
    importcpp: "SetRayColor", header: "vtkVRModel.h".}
proc GetRay*(this: var vtkVRModel): ptr vtkVRRay {.importcpp: "GetRay",
    header: "vtkVRModel.h".}
proc ReleaseGraphicsResources*(this: var vtkVRModel; win: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkVRModel.h".}