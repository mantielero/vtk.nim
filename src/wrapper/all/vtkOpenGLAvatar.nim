## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOpenGLAvatar.h
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
##  @class   vtkOpenGLAvatar
##  @brief   OpenGL Avatar
##
##  vtkOpenGLAvatar is a concrete implementation of the abstract class vtkAvatar.
##  vtkOpenGLAvatar interfaces to the OpenGL rendering library.
##

import
  vtkAvatar, vtkNew, vtkRenderingVRModule

discard "forward decl of vtkOpenGLActor"
discard "forward decl of vtkOpenGLPolyDataMapper"
discard "forward decl of vtkOpenGLRenderer"
discard "forward decl of vtkVRRay"
discard "forward decl of vtkFlagpoleLabel"
discard "forward decl of vtkTextProperty"
type
  vtkOpenGLAvatar* {.importcpp: "vtkOpenGLAvatar", header: "vtkOpenGLAvatar.h",
                    bycopy.} = object of vtkAvatar
    vtkOpenGLAvatar* {.importc: "vtkOpenGLAvatar".}: VTK_NEWINSTANCE


proc New*(): ptr vtkOpenGLAvatar {.importcpp: "vtkOpenGLAvatar::New(@)",
                               header: "vtkOpenGLAvatar.h".}
type
  vtkOpenGLAvatarSuperclass* = vtkAvatar

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOpenGLAvatar::IsTypeOf(@)", header: "vtkOpenGLAvatar.h".}
proc IsA*(this: var vtkOpenGLAvatar; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkOpenGLAvatar.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOpenGLAvatar {.
    importcpp: "vtkOpenGLAvatar::SafeDownCast(@)", header: "vtkOpenGLAvatar.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOpenGLAvatar :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAvatar :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOpenGLAvatar :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOpenGLAvatar :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkOpenGLAvatar; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkOpenGLAvatar.h".}
proc RenderOpaqueGeometry*(this: var vtkOpenGLAvatar; vp: ptr vtkViewport): cint {.
    importcpp: "RenderOpaqueGeometry", header: "vtkOpenGLAvatar.h".}
proc RenderTranslucentPolygonalGeometry*(this: var vtkOpenGLAvatar;
                                        vp: ptr vtkViewport): cint {.
    importcpp: "RenderTranslucentPolygonalGeometry", header: "vtkOpenGLAvatar.h".}
## !!!Ignored construct:  double * GetBounds ( ) VTK_SIZEHINT ( 6 ) override ;
## Error: expected ';'!!!

proc SetUseLeftHand*(this: var vtkOpenGLAvatar; val: bool) {.
    importcpp: "SetUseLeftHand", header: "vtkOpenGLAvatar.h".}
proc SetUseRightHand*(this: var vtkOpenGLAvatar; val: bool) {.
    importcpp: "SetUseRightHand", header: "vtkOpenGLAvatar.h".}
proc SetShowHandsOnly*(this: var vtkOpenGLAvatar; val: bool) {.
    importcpp: "SetShowHandsOnly", header: "vtkOpenGLAvatar.h".}
proc SetLeftShowRay*(this: var vtkOpenGLAvatar; v: bool) {.
    importcpp: "SetLeftShowRay", header: "vtkOpenGLAvatar.h".}
proc SetRightShowRay*(this: var vtkOpenGLAvatar; v: bool) {.
    importcpp: "SetRightShowRay", header: "vtkOpenGLAvatar.h".}
proc SetRayLength*(this: var vtkOpenGLAvatar; length: cdouble) {.
    importcpp: "SetRayLength", header: "vtkOpenGLAvatar.h".}
proc SetLabel*(this: var vtkOpenGLAvatar; label: cstring) {.importcpp: "SetLabel",
    header: "vtkOpenGLAvatar.h".}
proc GetLabelTextProperty*(this: var vtkOpenGLAvatar): ptr vtkTextProperty {.
    importcpp: "GetLabelTextProperty", header: "vtkOpenGLAvatar.h".}