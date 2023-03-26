## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCameraActor.h
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
##  @class   vtkCameraActor
##  @brief   a frustum to represent a camera.
##
##  vtkCameraActor is an actor used to represent a camera by its wireframe
##  frustum.
##
##  @sa
##  vtkLight vtkConeSource vtkFrustumSource vtkCameraActor
##

import
  vtkProp3D, vtkRenderingCoreModule

discard "forward decl of vtkCamera"
discard "forward decl of vtkFrustumSource"
discard "forward decl of vtkPolyDataMapper"
discard "forward decl of vtkActor"
discard "forward decl of vtkProperty"
type
  vtkCameraActor* {.importcpp: "vtkCameraActor", header: "vtkCameraActor.h", bycopy.} = object of vtkProp3D
    vtkCameraActor* {.importc: "vtkCameraActor".}: VTK_NEWINSTANCE


proc New*(): ptr vtkCameraActor {.importcpp: "vtkCameraActor::New(@)",
                              header: "vtkCameraActor.h".}
type
  vtkCameraActorSuperclass* = vtkProp3D

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCameraActor::IsTypeOf(@)", header: "vtkCameraActor.h".}
proc IsA*(this: var vtkCameraActor; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkCameraActor.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCameraActor {.
    importcpp: "vtkCameraActor::SafeDownCast(@)", header: "vtkCameraActor.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCameraActor :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkProp3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCameraActor :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCameraActor :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCameraActor; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCameraActor.h".}
proc SetCamera*(this: var vtkCameraActor; camera: ptr vtkCamera) {.
    importcpp: "SetCamera", header: "vtkCameraActor.h".}
proc GetnameCamera*(this: var vtkCameraActor): ptr vtkCamera {.
    importcpp: "GetnameCamera", header: "vtkCameraActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Ratio between the width and the height of the frustum. Initial value is
  ##  1.0 (square)
  ##
proc SetWidthByHeightRatio*(this: var vtkCameraActor; _arg: cdouble) {.
    importcpp: "SetWidthByHeightRatio", header: "vtkCameraActor.h".}
## !!!Ignored construct:  virtual double GetWidthByHeightRatio ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WidthByHeightRatio  of  << this -> WidthByHeightRatio ) ; return this -> WidthByHeightRatio ; } ;
## Error: expected ';'!!!

proc RenderOpaqueGeometry*(this: var vtkCameraActor; viewport: ptr vtkViewport): cint {.
    importcpp: "RenderOpaqueGeometry", header: "vtkCameraActor.h".}
proc HasTranslucentPolygonalGeometry*(this: var vtkCameraActor): vtkTypeBool {.
    importcpp: "HasTranslucentPolygonalGeometry", header: "vtkCameraActor.h".}
proc ReleaseGraphicsResources*(this: var vtkCameraActor; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkCameraActor.h".}
proc GetBounds*(this: var vtkCameraActor): ptr cdouble {.importcpp: "GetBounds",
    header: "vtkCameraActor.h".}
proc GetMTime*(this: var vtkCameraActor): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkCameraActor.h".}
proc GetProperty*(this: var vtkCameraActor): ptr vtkProperty {.
    importcpp: "GetProperty", header: "vtkCameraActor.h".}
proc SetProperty*(this: var vtkCameraActor; p: ptr vtkProperty) {.
    importcpp: "SetProperty", header: "vtkCameraActor.h".}