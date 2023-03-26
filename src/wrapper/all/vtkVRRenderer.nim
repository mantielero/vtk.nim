## =========================================================================
##
## Program:   Visualization Toolkit
## Module:    vtkVRRenderer.h
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
##  @class   vtkVRRenderer
##  @brief   VR renderer
##
##  vtkVRRenderer is an abstract vtkRenderer class that is meant to be used in VR context.
##  It defines a floor actor with a grid fading with the distance.
##
##  Subclasses must define MakeCamera()
##

import
  vtkNew, vtkOpenGLRenderer, vtkRenderingVRModule

discard "forward decl of vtkActor"
type
  vtkVRRenderer* {.importcpp: "vtkVRRenderer", header: "vtkVRRenderer.h", bycopy.} = object of vtkOpenGLRenderer
    vtkVRRenderer* {.importc: "vtkVRRenderer".}: VTK_NEWINSTANCE
    vtkCamera* {.importc: "vtkCamera".}: VTK_NEWINSTANCE

  vtkVRRendererSuperclass* = vtkOpenGLRenderer

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkVRRenderer::IsTypeOf(@)", header: "vtkVRRenderer.h".}
proc IsA*(this: var vtkVRRenderer; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkVRRenderer.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkVRRenderer {.
    importcpp: "vtkVRRenderer::SafeDownCast(@)", header: "vtkVRRenderer.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkVRRenderer :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkOpenGLRenderer :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkVRRenderer :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkVRRenderer :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkVRRenderer; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkVRRenderer.h".}
## using statement

proc ResetCamera*(this: var vtkVRRenderer; bounds: array[6, cdouble]) {.
    importcpp: "ResetCamera", header: "vtkVRRenderer.h".}
## using statement

proc ResetCameraClippingRange*(this: var vtkVRRenderer) {.
    importcpp: "ResetCameraClippingRange", header: "vtkVRRenderer.h".}
proc ResetCameraClippingRange*(this: var vtkVRRenderer; bounds: array[6, cdouble]) {.
    importcpp: "ResetCameraClippingRange", header: "vtkVRRenderer.h".}
## !!!Ignored construct:  * MakeCamera ( ) override = 0 ;
## Error: identifier expected, but got: *!!!

proc GetFloorTransform*(this: var vtkVRRenderer; transform: ptr vtkTransform) {.
    importcpp: "GetFloorTransform", header: "vtkVRRenderer.h".}
proc DeviceRender*(this: var vtkVRRenderer) {.importcpp: "DeviceRender",
    header: "vtkVRRenderer.h".}
proc SetShowFloor*(this: var vtkVRRenderer; a2: bool) {.importcpp: "SetShowFloor",
    header: "vtkVRRenderer.h".}
proc GetShowFloor*(this: var vtkVRRenderer): bool {.importcpp: "GetShowFloor",
    header: "vtkVRRenderer.h".}