## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFinitePlaneWidget.h
##
##   Copyright (c)
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkFinitePlaneWidget
##  @brief   3D widget for manipulating a finite plane
##
##  This 3D widget interacts with a vtkFinitePlaneRepresentation class (i.e., it
##  handles the events that drive its corresponding representation). This 3D
##  widget defines a finite plane that can be interactively placed in a scene.
##  The widget is assumed to consist of four parts: 1) a plane with 2) a normal
##  and 3) three handles that can be moused on and manipulated.
##  The green and red handles represent the semi finite plane definition,
##  the third is in the center of the plane.
##  Operation like rotation of the plane (using normal), origin translation and
##  geometry plane modification using green and red handles are availables.
##
##  To use this widget, you generally pair it with a vtkFinitePlaneRepresentation
##  (or a subclass). Various options are available in the representation for
##  controlling how the widget appears, and how the widget reacts.
##
##  @par Event Bindings:
##  By default, the widget responds to the following VTK events (i.e., it
##  watches the vtkRenderWindowInteractor for these events):
##  <pre>
##  If one of the 3 handles are selected:
##    LeftButtonPressEvent - select the appropriate handle
##    LeftButtonReleaseEvent - release the currently selected handle
##    MouseMoveEvent - move the handle
##  In all the cases, independent of what is picked, the widget responds to the
##  following VTK events:
##    LeftButtonPressEvent - start select action
##    LeftButtonReleaseEvent - stop select action
##  </pre>
##
##  @par Event Bindings:
##  Note that the event bindings described above can be changed using this
##  class's vtkWidgetEventTranslator. This class translates VTK events
##  into the vtkFinitePlaneWidget's widget events:
##  <pre>
##    vtkWidgetEvent::Select -- some part of the widget has been selected
##    vtkWidgetEvent::EndSelect -- the selection process has completed
##    vtkWidgetEvent::Move -- a request for motion has been invoked
##  </pre>
##
##  @par Event Bindings:
##  In turn, when these widget events are processed, the vtkFinitePlaneWidget
##  invokes the following VTK events on itself (which observers can listen for):
##  <pre>
##    vtkCommand::StartInteractionEvent (on vtkWidgetEvent::Select)
##    vtkCommand::EndInteractionEvent (on vtkWidgetEvent::EndSelect)
##    vtkCommand::InteractionEvent (on vtkWidgetEvent::Move)
##  </pre>
##  @sa
##  vtkFinitePlaneRepresentation
##

import
  vtkAbstractWidget, vtkDeprecation, vtkInteractionWidgetsModule

discard "forward decl of vtkFinitePlaneRepresentation"
discard "forward decl of vtkHandleWidget"
type
  vtkFinitePlaneWidget* {.importcpp: "vtkFinitePlaneWidget",
                         header: "vtkFinitePlaneWidget.h", bycopy.} = object of vtkAbstractWidget ## *
                                                                                           ##  Instantiate the object.
                                                                                           ##
    vtkFinitePlaneWidget* {.importc: "vtkFinitePlaneWidget".}: VTK_NEWINSTANCE


proc New*(): ptr vtkFinitePlaneWidget {.importcpp: "vtkFinitePlaneWidget::New(@)",
                                    header: "vtkFinitePlaneWidget.h".}
type
  vtkFinitePlaneWidgetSuperclass* = vtkAbstractWidget

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkFinitePlaneWidget::IsTypeOf(@)",
    header: "vtkFinitePlaneWidget.h".}
proc IsA*(this: var vtkFinitePlaneWidget; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkFinitePlaneWidget.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkFinitePlaneWidget {.
    importcpp: "vtkFinitePlaneWidget::SafeDownCast(@)",
    header: "vtkFinitePlaneWidget.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkFinitePlaneWidget :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFinitePlaneWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFinitePlaneWidget :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkFinitePlaneWidget; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkFinitePlaneWidget.h".}
proc SetRepresentation*(this: var vtkFinitePlaneWidget;
                       r: ptr vtkFinitePlaneRepresentation) {.
    importcpp: "SetRepresentation", header: "vtkFinitePlaneWidget.h".}
proc CreateDefaultRepresentation*(this: var vtkFinitePlaneWidget) {.
    importcpp: "CreateDefaultRepresentation", header: "vtkFinitePlaneWidget.h".}
## !!!Ignored construct:  # ! defined ( VTK_LEGACY_REMOVE ) [NewLine] VTK_DEPRECATED_IN_9_2_0 ( because leading underscore is reserved ) typedef WidgetStateType _WidgetState ;
## Error: identifier expected, but got: because leading underscore is reserved!!!
