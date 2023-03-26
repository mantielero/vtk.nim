## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLineWidget2.h
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
##  @class   vtkLineWidget2
##  @brief   3D widget for manipulating a finite, straight line
##
##  This 3D widget defines a straight line that can be interactively placed in
##  a scene. The widget is assumed to consist of two parts: 1) two end points
##  and 2) a straight line connecting the two points. (The representation
##  paired with this widget determines the actual geometry of the widget.) The
##  positioning of the two end points is facilitated by using vtkHandleWidgets
##  to position the points.
##
##  To use this widget, you generally pair it with a vtkLineRepresentation
##  (or a subclass). Various options are available in the representation for
##  controlling how the widget appears, and how the widget functions.
##
##  @par Event Bindings:
##  By default, the widget responds to the following VTK events (i.e., it
##  watches the vtkRenderWindowInteractor for these events):
##  <pre>
##  If one of the two end points are selected:
##    LeftButtonPressEvent - activate the associated handle widget
##    LeftButtonReleaseEvent - release the handle widget associated with the point
##    MouseMoveEvent - move the point
##  If the line is selected:
##    LeftButtonPressEvent - activate a handle widget accociated with the line
##    LeftButtonReleaseEvent - release the handle widget associated with the line
##    MouseMoveEvent - translate the line
##  In all the cases, independent of what is picked, the widget responds to the
##  following VTK events:
##    MiddleButtonPressEvent - translate the widget
##    MiddleButtonReleaseEvent - release the widget
##    RightButtonPressEvent - scale the widget's representation
##    RightButtonReleaseEvent - stop scaling the widget
##    MouseMoveEvent - scale (if right button) or move (if middle button) the widget
##  </pre>
##
##  @par Event Bindings:
##  Note that the event bindings described above can be changed using this
##  class's vtkWidgetEventTranslator. This class translates VTK events
##  into the vtkLineWidget2's widget events:
##  <pre>
##    vtkWidgetEvent::Select -- some part of the widget has been selected
##    vtkWidgetEvent::EndSelect -- the selection process has completed
##    vtkWidgetEvent::Move -- a request for slider motion has been invoked
##  </pre>
##
##  @par Event Bindings:
##  In turn, when these widget events are processed, the vtkLineWidget2
##  invokes the following VTK events on itself (which observers can listen for):
##  <pre>
##    vtkCommand::StartInteractionEvent (on vtkWidgetEvent::Select)
##    vtkCommand::EndInteractionEvent (on vtkWidgetEvent::EndSelect)
##    vtkCommand::InteractionEvent (on vtkWidgetEvent::Move)
##  </pre>
##
##
##
##  @par Event Bindings:
##  This class, and vtkLineRepresentation, are next generation VTK widgets. An
##  earlier version of this functionality was defined in the class
##  vtkLineWidget.
##
##  @sa
##  vtkLineRepresentation vtkLineWidget vtk3DWidget vtkImplicitPlaneWidget
##  vtkImplicitPlaneWidget2
##

import
  vtkAbstractWidget, vtkDeprecation, vtkInteractionWidgetsModule

discard "forward decl of vtkLineRepresentation"
discard "forward decl of vtkHandleWidget"
type
  vtkLineWidget2* {.importcpp: "vtkLineWidget2", header: "vtkLineWidget2.h", bycopy.} = object of vtkAbstractWidget ## *
                                                                                                          ##  Instantiate the object.
                                                                                                          ##
    vtkLineWidget2* {.importc: "vtkLineWidget2".}: VTK_NEWINSTANCE
    ##  These methods handle events
    ##  first end point
    ##  second end point
    ##  used when selecting the line


proc New*(): ptr vtkLineWidget2 {.importcpp: "vtkLineWidget2::New(@)",
                              header: "vtkLineWidget2.h".}
type
  vtkLineWidget2Superclass* = vtkAbstractWidget

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkLineWidget2::IsTypeOf(@)", header: "vtkLineWidget2.h".}
proc IsA*(this: var vtkLineWidget2; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkLineWidget2.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkLineWidget2 {.
    importcpp: "vtkLineWidget2::SafeDownCast(@)", header: "vtkLineWidget2.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkLineWidget2 :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLineWidget2 :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLineWidget2 :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkLineWidget2; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkLineWidget2.h".}
proc SetEnabled*(this: var vtkLineWidget2; enabling: cint) {.importcpp: "SetEnabled",
    header: "vtkLineWidget2.h".}
proc SetRepresentation*(this: var vtkLineWidget2; r: ptr vtkLineRepresentation) {.
    importcpp: "SetRepresentation", header: "vtkLineWidget2.h".}
proc GetLineRepresentation*(this: var vtkLineWidget2): ptr vtkLineRepresentation {.
    importcpp: "GetLineRepresentation", header: "vtkLineWidget2.h".}
proc CreateDefaultRepresentation*(this: var vtkLineWidget2) {.
    importcpp: "CreateDefaultRepresentation", header: "vtkLineWidget2.h".}
proc SetProcessEvents*(this: var vtkLineWidget2; a2: vtkTypeBool) {.
    importcpp: "SetProcessEvents", header: "vtkLineWidget2.h".}
## !!!Ignored construct:  # ! defined ( VTK_LEGACY_REMOVE ) [NewLine] VTK_DEPRECATED_IN_9_2_0 ( because leading underscore is reserved ) typedef WidgetStateType _WidgetState ;
## Error: identifier expected, but got: because leading underscore is reserved!!!
