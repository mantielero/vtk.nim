## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkContextInteractorStyle.h
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
##  @class   vtkContextInteractorStyle
##  @brief   An interactor for chart views.
##
##
##  It observes the user events (mouse events) and propagates them
##  to the scene. If the scene doesn't eat the event, it is propagated
##  to the interactor style superclass.
##

import
  vtkInteractorStyle, vtkNew, vtkViewsContext2DModule, vtkWeakPointer

discard "forward decl of vtkContextMouseEvent"
discard "forward decl of vtkContextScene"
type
  vtkContextInteractorStyle* {.importcpp: "vtkContextInteractorStyle",
                              header: "vtkContextInteractorStyle.h", bycopy.} = object of vtkInteractorStyle
    vtkContextInteractorStyle* {.importc: "vtkContextInteractorStyle".}: VTK_NEWINSTANCE


proc New*(): ptr vtkContextInteractorStyle {.
    importcpp: "vtkContextInteractorStyle::New(@)",
    header: "vtkContextInteractorStyle.h".}
type
  vtkContextInteractorStyleSuperclass* = vtkInteractorStyle

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkContextInteractorStyle::IsTypeOf(@)",
    header: "vtkContextInteractorStyle.h".}
proc IsA*(this: var vtkContextInteractorStyle; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkContextInteractorStyle.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkContextInteractorStyle {.
    importcpp: "vtkContextInteractorStyle::SafeDownCast(@)",
    header: "vtkContextInteractorStyle.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkContextInteractorStyle :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInteractorStyle :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkContextInteractorStyle :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkContextInteractorStyle :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkContextInteractorStyle; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkContextInteractorStyle.h".}
proc SetScene*(this: var vtkContextInteractorStyle; scene: ptr vtkContextScene) {.
    importcpp: "SetScene", header: "vtkContextInteractorStyle.h".}
proc GetScene*(this: var vtkContextInteractorStyle): ptr vtkContextScene {.
    importcpp: "GetScene", header: "vtkContextInteractorStyle.h".}
proc OnSceneModified*(this: var vtkContextInteractorStyle) {.
    importcpp: "OnSceneModified", header: "vtkContextInteractorStyle.h".}
proc OnMouseMove*(this: var vtkContextInteractorStyle) {.importcpp: "OnMouseMove",
    header: "vtkContextInteractorStyle.h".}
proc OnLeftButtonDown*(this: var vtkContextInteractorStyle) {.
    importcpp: "OnLeftButtonDown", header: "vtkContextInteractorStyle.h".}
proc OnLeftButtonUp*(this: var vtkContextInteractorStyle) {.
    importcpp: "OnLeftButtonUp", header: "vtkContextInteractorStyle.h".}
proc OnLeftButtonDoubleClick*(this: var vtkContextInteractorStyle) {.
    importcpp: "OnLeftButtonDoubleClick", header: "vtkContextInteractorStyle.h".}
proc OnMiddleButtonDown*(this: var vtkContextInteractorStyle) {.
    importcpp: "OnMiddleButtonDown", header: "vtkContextInteractorStyle.h".}
proc OnMiddleButtonUp*(this: var vtkContextInteractorStyle) {.
    importcpp: "OnMiddleButtonUp", header: "vtkContextInteractorStyle.h".}
proc OnMiddleButtonDoubleClick*(this: var vtkContextInteractorStyle) {.
    importcpp: "OnMiddleButtonDoubleClick", header: "vtkContextInteractorStyle.h".}
proc OnRightButtonDown*(this: var vtkContextInteractorStyle) {.
    importcpp: "OnRightButtonDown", header: "vtkContextInteractorStyle.h".}
proc OnRightButtonUp*(this: var vtkContextInteractorStyle) {.
    importcpp: "OnRightButtonUp", header: "vtkContextInteractorStyle.h".}
proc OnRightButtonDoubleClick*(this: var vtkContextInteractorStyle) {.
    importcpp: "OnRightButtonDoubleClick", header: "vtkContextInteractorStyle.h".}
proc OnMouseWheelForward*(this: var vtkContextInteractorStyle) {.
    importcpp: "OnMouseWheelForward", header: "vtkContextInteractorStyle.h".}
proc OnMouseWheelBackward*(this: var vtkContextInteractorStyle) {.
    importcpp: "OnMouseWheelBackward", header: "vtkContextInteractorStyle.h".}
proc OnSelection*(this: var vtkContextInteractorStyle; rect: array[5, cuint]) {.
    importcpp: "OnSelection", header: "vtkContextInteractorStyle.h".}
proc OnChar*(this: var vtkContextInteractorStyle) {.importcpp: "OnChar",
    header: "vtkContextInteractorStyle.h".}
proc OnKeyPress*(this: var vtkContextInteractorStyle) {.importcpp: "OnKeyPress",
    header: "vtkContextInteractorStyle.h".}
proc OnKeyRelease*(this: var vtkContextInteractorStyle) {.importcpp: "OnKeyRelease",
    header: "vtkContextInteractorStyle.h".}