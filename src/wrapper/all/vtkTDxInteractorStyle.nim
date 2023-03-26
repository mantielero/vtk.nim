## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTDxInteractorStyle.h
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
##  @class   vtkTDxInteractorStyle
##  @brief   provide 3DConnexion device event-driven interface to the rendering window
##
##
##  vtkTDxInteractorStyle is an abstract class defining an event-driven
##  interface to support 3DConnexion device events send by
##  vtkRenderWindowInteractor.
##  vtkRenderWindowInteractor forwards events in a platform independent form to
##  vtkInteractorStyle which can then delegate some processing to
##  vtkTDxInteractorStyle.
##
##  @sa
##  vtkInteractorStyle vtkRenderWindowInteractor
##  vtkTDxInteractorStyleCamera
##

import
  vtkObject, vtkRenderingCoreModule

discard "forward decl of vtkTDxMotionEventInfo"
discard "forward decl of vtkRenderer"
discard "forward decl of vtkTDxInteractorStyleSettings"
type
  vtkTDxInteractorStyle* {.importcpp: "vtkTDxInteractorStyle",
                          header: "vtkTDxInteractorStyle.h", bycopy.} = object of vtkObject
    vtkTDxInteractorStyle* {.importc: "vtkTDxInteractorStyle".}: VTK_NEWINSTANCE

  vtkTDxInteractorStyleSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTDxInteractorStyle::IsTypeOf(@)",
    header: "vtkTDxInteractorStyle.h".}
proc IsA*(this: var vtkTDxInteractorStyle; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTDxInteractorStyle.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTDxInteractorStyle {.
    importcpp: "vtkTDxInteractorStyle::SafeDownCast(@)",
    header: "vtkTDxInteractorStyle.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTDxInteractorStyle :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTDxInteractorStyle :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTDxInteractorStyle :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTDxInteractorStyle; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTDxInteractorStyle.h".}
proc OnMotionEvent*(this: var vtkTDxInteractorStyle;
                   motionInfo: ptr vtkTDxMotionEventInfo) {.
    importcpp: "OnMotionEvent", header: "vtkTDxInteractorStyle.h".}
proc OnButtonPressedEvent*(this: var vtkTDxInteractorStyle; button: cint) {.
    importcpp: "OnButtonPressedEvent", header: "vtkTDxInteractorStyle.h".}
proc OnButtonReleasedEvent*(this: var vtkTDxInteractorStyle; button: cint) {.
    importcpp: "OnButtonReleasedEvent", header: "vtkTDxInteractorStyle.h".}
proc ProcessEvent*(this: var vtkTDxInteractorStyle; renderer: ptr vtkRenderer;
                  event: culong; calldata: pointer) {.importcpp: "ProcessEvent",
    header: "vtkTDxInteractorStyle.h".}
proc GetnameSettings*(this: var vtkTDxInteractorStyle): ptr vtkTDxInteractorStyleSettings {.
    importcpp: "GetnameSettings", header: "vtkTDxInteractorStyle.h".}
proc SetSettings*(this: var vtkTDxInteractorStyle;
                 settings: ptr vtkTDxInteractorStyleSettings) {.
    importcpp: "SetSettings", header: "vtkTDxInteractorStyle.h".}