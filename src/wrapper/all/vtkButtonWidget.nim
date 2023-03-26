## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkButtonWidget.h
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
##  @class   vtkButtonWidget
##  @brief   activate an n-state button
##
##  The vtkButtonWidget is used to interface with an n-state button. That is
##  each selection moves to the next button state (e.g., moves from "on" to
##  "off"). The widget uses modulo list traversal to transition through one or
##  more states. (A single state is simply a "selection" event; traversal
##  through the list can be in the forward or backward direction.)
##
##  Depending on the nature of the representation the appearance of the button
##  can change dramatically, the specifics of appearance changes are a
##  function of the associated vtkButtonRepresentation (or subclass).
##
##  @par Event Bindings:
##  By default, the widget responds to the following VTK events (i.e., it
##  watches the vtkRenderWindowInteractor for these events):
##  <pre>
##    LeftButtonPressEvent - select button
##    LeftButtonReleaseEvent - end the button selection process
##  </pre>
##
##  @par Event Bindings:
##  Note that the event bindings described above can be changed using this
##  class's vtkWidgetEventTranslator. This class translates VTK events
##  into the vtkButtonWidget's widget events:
##  <pre>
##    vtkWidgetEvent::Select -- some part of the widget has been selected
##    vtkWidgetEvent::EndSelect -- the selection process has completed
##  </pre>
##
##  @par Event Bindings:
##  In turn, when these widget events are processed, the vtkButtonWidget
##  invokes the following VTK events on itself (which observers can listen for):
##  <pre>
##    vtkCommand::StateChangedEvent (on vtkWidgetEvent::EndSelect)
##  </pre>
##
##

import
  vtkAbstractWidget, vtkDeprecation, vtkInteractionWidgetsModule

discard "forward decl of vtkButtonRepresentation"
type
  vtkButtonWidget* {.importcpp: "vtkButtonWidget", header: "vtkButtonWidget.h",
                    bycopy.} = object of vtkAbstractWidget ## *
                                                      ##  Instantiate the class.
                                                      ##
    vtkButtonWidget* {.importc: "vtkButtonWidget".}: VTK_NEWINSTANCE


proc New*(): ptr vtkButtonWidget {.importcpp: "vtkButtonWidget::New(@)",
                               header: "vtkButtonWidget.h".}
type
  vtkButtonWidgetSuperclass* = vtkAbstractWidget

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkButtonWidget::IsTypeOf(@)", header: "vtkButtonWidget.h".}
proc IsA*(this: var vtkButtonWidget; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkButtonWidget.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkButtonWidget {.
    importcpp: "vtkButtonWidget::SafeDownCast(@)", header: "vtkButtonWidget.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkButtonWidget :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkButtonWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkButtonWidget :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkButtonWidget; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkButtonWidget.h".}
proc SetRepresentation*(this: var vtkButtonWidget; r: ptr vtkButtonRepresentation) {.
    importcpp: "SetRepresentation", header: "vtkButtonWidget.h".}
proc GetSliderRepresentation*(this: var vtkButtonWidget): ptr vtkButtonRepresentation {.
    importcpp: "GetSliderRepresentation", header: "vtkButtonWidget.h".}
proc CreateDefaultRepresentation*(this: var vtkButtonWidget) {.
    importcpp: "CreateDefaultRepresentation", header: "vtkButtonWidget.h".}
proc SetEnabled*(this: var vtkButtonWidget; a2: cint) {.importcpp: "SetEnabled",
    header: "vtkButtonWidget.h".}
## !!!Ignored construct:  # ! defined ( VTK_LEGACY_REMOVE ) [NewLine] VTK_DEPRECATED_IN_9_2_0 ( because leading underscore is reserved ) typedef WidgetStateType _WidgetState ;
## Error: identifier expected, but got: because leading underscore is reserved!!!
