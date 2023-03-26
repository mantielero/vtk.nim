## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkScenePicker.h
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
##  @class   vtkScenePicker
##  @brief   Picks an entire viewport at one shot.
##
##  The Scene picker, unlike conventional pickers picks an entire viewport at
##  one shot and caches the result, which can be retrieved later.
##     The utility of the class arises during <b>Actor Selection</b>. Let's
##  say you have a couple of polygonal objects in your scene and you wish to
##  have a status bar that indicates the object your mouse is over. Picking
##  repeatedly every time your mouse moves would be very slow. The
##  scene picker automatically picks your viewport every time the camera is
##  changed and caches the information. Additionally, it observes the
##  vtkRenderWindowInteractor to avoid picking during interaction, so that
##  you still maintain your interactivity. In effect, the picker does an
##  additional pick-render of your scene every time you stop interacting with
##  your scene. As an example, see Rendering/TestScenePicker.
##
##  @warning
##  - Unlike a vtkHoverWidget, this class is not timer based. The hover widget
##    picks a scene when the mouse is over an actor for a specified duration.
##  - This class uses a vtkHardwareSelector under the hood. Hence, it will
##    work only for actors that have opaque geometry and are rendered by a
##    vtkPolyDataMapper.
##
##  @sa
##  vtkHoverWidget vtkHardwareSelector
##

import
  vtkObject, vtkRenderingCoreModule

discard "forward decl of vtkRenderer"
discard "forward decl of vtkProp"
discard "forward decl of vtkHardwareSelector"
discard "forward decl of vtkRenderWindowInteractor"
discard "forward decl of vtkScenePickerSelectionRenderCommand"
type
  vtkScenePicker* {.importcpp: "vtkScenePicker", header: "vtkScenePicker.h", bycopy.} = object of vtkObject
    vtkScenePicker* {.importc: "vtkScenePicker".}: VTK_NEWINSTANCE


proc New*(): ptr vtkScenePicker {.importcpp: "vtkScenePicker::New(@)",
                              header: "vtkScenePicker.h".}
type
  vtkScenePickerSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkScenePicker::IsTypeOf(@)", header: "vtkScenePicker.h".}
proc IsA*(this: var vtkScenePicker; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkScenePicker.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkScenePicker {.
    importcpp: "vtkScenePicker::SafeDownCast(@)", header: "vtkScenePicker.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkScenePicker :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkScenePicker :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkScenePicker :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkScenePicker; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkScenePicker.h".}
proc SetRenderer*(this: var vtkScenePicker; a2: ptr vtkRenderer) {.
    importcpp: "SetRenderer", header: "vtkScenePicker.h".}
proc GetnameRenderer*(this: var vtkScenePicker): ptr vtkRenderer {.
    importcpp: "GetnameRenderer", header: "vtkScenePicker.h".}
  ## /@}
  ## *
  ##  Get cell id at the pick position.
  ##  Returns -1 if no cell was picked.
  ##  Makes sense only after Pick has been called.
  ##
proc GetCellId*(this: var vtkScenePicker; displayPos: array[2, cint]): vtkIdType {.
    importcpp: "GetCellId", header: "vtkScenePicker.h".}
proc GetVertexId*(this: var vtkScenePicker; displayPos: array[2, cint]): vtkIdType {.
    importcpp: "GetVertexId", header: "vtkScenePicker.h".}
proc GetViewProp*(this: var vtkScenePicker; displayPos: array[2, cint]): ptr vtkProp {.
    importcpp: "GetViewProp", header: "vtkScenePicker.h".}
proc SetEnableVertexPicking*(this: var vtkScenePicker; _arg: vtkTypeBool) {.
    importcpp: "SetEnableVertexPicking", header: "vtkScenePicker.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetEnableVertexPicking ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EnableVertexPicking  of  << this -> EnableVertexPicking ) ; return this -> EnableVertexPicking ; } ;
## Error: expected ';'!!!

proc EnableVertexPickingOn*(this: var vtkScenePicker) {.
    importcpp: "EnableVertexPickingOn", header: "vtkScenePicker.h".}
proc EnableVertexPickingOff*(this: var vtkScenePicker) {.
    importcpp: "EnableVertexPickingOff", header: "vtkScenePicker.h".}
  ## /@}