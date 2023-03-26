## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFollower.h
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
##  @class   vtkFollower
##  @brief   a subclass of actor that always faces the camera
##
##  vtkFollower is a subclass of vtkActor that always follows its specified
##  camera. More specifically it will not change its position or scale,
##  but it will continually update its orientation so that it is right side
##  up and facing the camera. This is typically used for text labels in a
##  scene. All of the adjustments that can be made to an actor also will
##  take effect with a follower.  So, if you change the orientation of the
##  follower by 90 degrees, then it will follow the camera, but be off by
##  90 degrees.
##
##  @sa
##  vtkActor vtkCamera vtkAxisFollower vtkProp3DFollower
##

import
  vtkActor, vtkRenderingCoreModule

discard "forward decl of vtkCamera"
type
  vtkFollower* {.importcpp: "vtkFollower", header: "vtkFollower.h", bycopy.} = object of vtkActor
    vtkFollower* {.importc: "vtkFollower".}: VTK_NEWINSTANCE
    ##  Internal matrices to avoid New/Delete for performance reasons

  vtkFollowerSuperclass* = vtkActor

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkFollower::IsTypeOf(@)", header: "vtkFollower.h".}
proc IsA*(this: var vtkFollower; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkFollower.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkFollower {.
    importcpp: "vtkFollower::SafeDownCast(@)", header: "vtkFollower.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkFollower :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkActor :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFollower :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFollower :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkFollower; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkFollower.h".}
proc New*(): ptr vtkFollower {.importcpp: "vtkFollower::New(@)",
                           header: "vtkFollower.h".}
proc SetCamera*(this: var vtkFollower; a2: ptr vtkCamera) {.importcpp: "SetCamera",
    header: "vtkFollower.h".}
proc GetnameCamera*(this: var vtkFollower): ptr vtkCamera {.
    importcpp: "GetnameCamera", header: "vtkFollower.h".}
  ## /@}
  ## /@{
  ## *
  ##  This causes the actor to be rendered. It in turn will render the actor's
  ##  property, texture map and then mapper. If a property hasn't been
  ##  assigned, then the actor will create one automatically.
  ##
proc RenderOpaqueGeometry*(this: var vtkFollower; viewport: ptr vtkViewport): cint {.
    importcpp: "RenderOpaqueGeometry", header: "vtkFollower.h".}
proc RenderTranslucentPolygonalGeometry*(this: var vtkFollower;
                                        viewport: ptr vtkViewport): cint {.
    importcpp: "RenderTranslucentPolygonalGeometry", header: "vtkFollower.h".}
proc Render*(this: var vtkFollower; ren: ptr vtkRenderer) {.importcpp: "Render",
    header: "vtkFollower.h".}
proc ReleaseGraphicsResources*(this: var vtkFollower; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkFollower.h".}
proc ComputeMatrix*(this: var vtkFollower) {.importcpp: "ComputeMatrix",
    header: "vtkFollower.h".}
proc ShallowCopy*(this: var vtkFollower; prop: ptr vtkProp) {.importcpp: "ShallowCopy",
    header: "vtkFollower.h".}