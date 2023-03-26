## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkProp3DFollower.h
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
##  @class   vtkProp3DFollower
##  @brief   a vtkProp3D that always faces the camera
##
##  vtkProp3DFollower is a type of vtkProp3D that always faces the camera.
##  More specifically it will not change its position or scale,
##  but it will continually update its orientation so that it is right side
##  up and facing the camera. This is typically used for complex billboards
##  or props that need to face the viewer at all times.
##
##  Note: All of the transformations that can be made to a vtkProp3D will take
##  effect with the follower. Thus, if you change the orientation of the
##  follower by 90 degrees, then it will follow the camera, but be off by 90
##  degrees.
##
##  @sa
##  vtkFollower vtkProp3D vtkCamera vtkProp3DAxisFollower
##

import
  vtkProp3D, vtkRenderingCoreModule

discard "forward decl of vtkCamera"
discard "forward decl of vtkMapper"
type
  vtkProp3DFollower* {.importcpp: "vtkProp3DFollower",
                      header: "vtkProp3DFollower.h", bycopy.} = object of vtkProp3D ## *
                                                                             ##  Creates a follower with no camera set.
                                                                             ##
    vtkProp3DFollower* {.importc: "vtkProp3DFollower".}: VTK_NEWINSTANCE
    ##  Internal matrices to avoid New/Delete for performance reasons


proc New*(): ptr vtkProp3DFollower {.importcpp: "vtkProp3DFollower::New(@)",
                                 header: "vtkProp3DFollower.h".}
type
  vtkProp3DFollowerSuperclass* = vtkProp3D

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkProp3DFollower::IsTypeOf(@)", header: "vtkProp3DFollower.h".}
proc IsA*(this: var vtkProp3DFollower; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkProp3DFollower.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkProp3DFollower {.
    importcpp: "vtkProp3DFollower::SafeDownCast(@)", header: "vtkProp3DFollower.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkProp3DFollower :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkProp3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkProp3DFollower :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkProp3DFollower :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkProp3DFollower; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkProp3DFollower.h".}
proc SetProp3D*(this: var vtkProp3DFollower; prop: ptr vtkProp3D) {.
    importcpp: "SetProp3D", header: "vtkProp3DFollower.h".}
proc GetProp3D*(this: var vtkProp3DFollower): ptr vtkProp3D {.importcpp: "GetProp3D",
    header: "vtkProp3DFollower.h".}
proc SetCamera*(this: var vtkProp3DFollower; a2: ptr vtkCamera) {.
    importcpp: "SetCamera", header: "vtkProp3DFollower.h".}
proc GetnameCamera*(this: var vtkProp3DFollower): ptr vtkCamera {.
    importcpp: "GetnameCamera", header: "vtkProp3DFollower.h".}
  ## /@}
  ## /@{
  ## *
  ##  This causes the actor to be rendered. It in turn will render the actor's
  ##  property, texture map and then mapper. If a property hasn't been
  ##  assigned, then the actor will create one automatically.
  ##
proc RenderOpaqueGeometry*(this: var vtkProp3DFollower; viewport: ptr vtkViewport): cint {.
    importcpp: "RenderOpaqueGeometry", header: "vtkProp3DFollower.h".}
proc RenderTranslucentPolygonalGeometry*(this: var vtkProp3DFollower;
                                        viewport: ptr vtkViewport): cint {.
    importcpp: "RenderTranslucentPolygonalGeometry", header: "vtkProp3DFollower.h".}
proc RenderVolumetricGeometry*(this: var vtkProp3DFollower;
                              viewport: ptr vtkViewport): cint {.
    importcpp: "RenderVolumetricGeometry", header: "vtkProp3DFollower.h".}
proc HasTranslucentPolygonalGeometry*(this: var vtkProp3DFollower): vtkTypeBool {.
    importcpp: "HasTranslucentPolygonalGeometry", header: "vtkProp3DFollower.h".}
proc ReleaseGraphicsResources*(this: var vtkProp3DFollower; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkProp3DFollower.h".}
proc ComputeMatrix*(this: var vtkProp3DFollower) {.importcpp: "ComputeMatrix",
    header: "vtkProp3DFollower.h".}
proc ShallowCopy*(this: var vtkProp3DFollower; prop: ptr vtkProp) {.
    importcpp: "ShallowCopy", header: "vtkProp3DFollower.h".}
proc GetBounds*(this: var vtkProp3DFollower): ptr cdouble {.importcpp: "GetBounds",
    header: "vtkProp3DFollower.h".}
proc InitPathTraversal*(this: var vtkProp3DFollower) {.
    importcpp: "InitPathTraversal", header: "vtkProp3DFollower.h".}
proc GetNextPath*(this: var vtkProp3DFollower): ptr vtkAssemblyPath {.
    importcpp: "GetNextPath", header: "vtkProp3DFollower.h".}