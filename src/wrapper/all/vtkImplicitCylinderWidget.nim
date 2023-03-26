## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImplicitCylinderWidget.h
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
##  @class   vtkImplicitCylinderWidget
##  @brief   3D widget for manipulating an infinite cylinder
##
##  This 3D widget defines an infinite cylinder that can be
##  interactively placed in a scene. The widget is assumed to consist
##  of four parts: 1) a cylinder contained in a 2) bounding box, with a
##  3) cylinder axis, which is rooted at a 4) center point in the bounding
##  box. (The representation paired with this widget determines the
##  actual geometry of the widget.)
##
##  To use this widget, you generally pair it with a vtkImplicitCylinderRepresentation
##  (or a subclass). Various options are available for controlling how the
##  representation appears, and how the widget functions.
##
##  @par Event Bindings:
##  By default, the widget responds to the following VTK events (i.e., it
##  watches the vtkRenderWindowInteractor for these events):
##  <pre>
##  If the cylinder axis is selected:
##    LeftButtonPressEvent - select normal
##    LeftButtonReleaseEvent - release (end select) normal
##    MouseMoveEvent - orient the normal vector
##  If the center point (handle) is selected:
##    LeftButtonPressEvent - select handle (if on slider)
##    LeftButtonReleaseEvent - release handle (if selected)
##    MouseMoveEvent - move the center point (constrained to plane or on the
##                     axis if CTRL key is pressed)
##  If the cylinder is selected:
##    LeftButtonPressEvent - select cylinder
##    LeftButtonReleaseEvent - release cylinder
##    MouseMoveEvent - increase/decrease cylinder radius
##  If the outline is selected:
##    LeftButtonPressEvent - select outline
##    LeftButtonReleaseEvent - release outline
##    MouseMoveEvent - move the outline
##  If the keypress characters are used
##    'Down/Left' Move cylinder away from viewer
##    'Up/Right' Move cylinder towards viewer
##  In all the cases, independent of what is picked, the widget responds to the
##  following VTK events:
##    MiddleButtonPressEvent - move the cylinder
##    MiddleButtonReleaseEvent - release the cylinder
##    RightButtonPressEvent - scale the widget's representation
##    RightButtonReleaseEvent - stop scaling the widget
##    MouseMoveEvent - scale (if right button) or move (if middle button) the widget
##  </pre>
##
##  @par Event Bindings:
##  Note that the event bindings described above can be changed using this
##  class's vtkWidgetEventTranslator. This class translates VTK events
##  into the vtkImplicitCylinderWidget's widget events:
##  <pre>
##    vtkWidgetEvent::Select -- some part of the widget has been selected
##    vtkWidgetEvent::EndSelect -- the selection process has completed
##    vtkWidgetEvent::Move -- a request for widget motion has been invoked
##    vtkWidgetEvent::Up and vtkWidgetEvent::Down -- MoveCylinderAction
##  </pre>
##
##  @par Event Bindings:
##  In turn, when these widget events are processed, the vtkImplicitCylinderWidget
##  invokes the following VTK events on itself (which observers can listen for):
##  <pre>
##    vtkCommand::StartInteractionEvent (on vtkWidgetEvent::Select)
##    vtkCommand::EndInteractionEvent (on vtkWidgetEvent::EndSelect)
##    vtkCommand::InteractionEvent (on vtkWidgetEvent::Move)
##  </pre>
##
##
##  @sa
##  vtk3DWidget vtkImplicitPlaneWidget
##

import
  vtkAbstractWidget, vtkDeprecation, vtkInteractionWidgetsModule

discard "forward decl of vtkImplicitCylinderRepresentation"
type
  vtkImplicitCylinderWidget* {.importcpp: "vtkImplicitCylinderWidget",
                              header: "vtkImplicitCylinderWidget.h", bycopy.} = object of vtkAbstractWidget ## *
                                                                                                     ##  Instantiate the object.
                                                                                                     ##
    vtkImplicitCylinderWidget* {.importc: "vtkImplicitCylinderWidget".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImplicitCylinderWidget {.
    importcpp: "vtkImplicitCylinderWidget::New(@)",
    header: "vtkImplicitCylinderWidget.h".}
type
  vtkImplicitCylinderWidgetSuperclass* = vtkAbstractWidget

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImplicitCylinderWidget::IsTypeOf(@)",
    header: "vtkImplicitCylinderWidget.h".}
proc IsA*(this: var vtkImplicitCylinderWidget; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImplicitCylinderWidget.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImplicitCylinderWidget {.
    importcpp: "vtkImplicitCylinderWidget::SafeDownCast(@)",
    header: "vtkImplicitCylinderWidget.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImplicitCylinderWidget :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImplicitCylinderWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImplicitCylinderWidget :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImplicitCylinderWidget; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImplicitCylinderWidget.h".}
proc SetRepresentation*(this: var vtkImplicitCylinderWidget;
                       rep: ptr vtkImplicitCylinderRepresentation) {.
    importcpp: "SetRepresentation", header: "vtkImplicitCylinderWidget.h".}
proc GetCylinderRepresentation*(this: var vtkImplicitCylinderWidget): ptr vtkImplicitCylinderRepresentation {.
    importcpp: "GetCylinderRepresentation", header: "vtkImplicitCylinderWidget.h".}
proc CreateDefaultRepresentation*(this: var vtkImplicitCylinderWidget) {.
    importcpp: "CreateDefaultRepresentation",
    header: "vtkImplicitCylinderWidget.h".}
## !!!Ignored construct:  # ! defined ( VTK_LEGACY_REMOVE ) [NewLine] VTK_DEPRECATED_IN_9_2_0 ( because leading underscore is reserved ) typedef WidgetStateType _WidgetState ;
## Error: identifier expected, but got: because leading underscore is reserved!!!
