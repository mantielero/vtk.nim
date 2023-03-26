## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCoordinateFrameWidget.h
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
##  @class   vtkCoordinateFrameWidget
##  @brief   3D widget for manipulating a display sized coordinate frame widget
##
##  This 3D widget defines a display sized coordinate frame
##  that can be interactively placed in a scene. The widget is assumed
##  to consist of three parts: 1) an origin, 2) 3 axis normals which are rooted at the origin
##  and 3 axis lockers. (The representation paired with this widget determines the actual
##  geometry of the widget.)
##
##  To use this widget, you generally pair it with a vtkCoordinateFrameRepresentation
##  (or a subclass). Various options are available for controlling how the
##  representation appears, and how the widget functions.
##
##  @par Event Bindings:
##  By default, the widget responds to the following VTK events (i.e., it
##  watches the vtkRenderWindowInteractor for these events):
##  <pre>
##  If the mouse is over the one of the axis normals:
##    LeftButtonPressEvent - select normal
##    LeftButtonReleaseEvent - release normal
##    MouseMoveEvent - orient the axis normal vectors (possibly constrained to
##    one of the axis' planes)
##  If the mouse is over the origin point (handle):
##    LeftButtonPressEvent - select handle
##    LeftButtonReleaseEvent - release handle (if selected)
##    MouseMoveEvent - move the origin point (possibly constrained to one of the axis' planes)
##  If the mouse is over one of the axis lockers:
##    LeftButtonPressEvent - select axis locker
##    LeftButtonReleaseEvent - unlock/lock and axis locker (and unlock all the other lockers)
##  If the keypress characters are used
##    'Down/Left' Move plane down
##    'Up/Right' Move plane up
##    'P/p' Pick a new origin from the intersection with a mesh cell rendered by the renderer
##    'Ctrl' + 'P/p' Snap to a new origin from the closest mesh point rendered by the renderer
##    'N/n' Pick a new normal from the intersection with a mesh cell rendered by the renderer
##    'Ctrl' + 'N/n' Snap to a new normal from the closest mesh point rendered by the renderer
##    'D/d' Pick a new point to define the direction normal which will be the new normal
##    'Ctrl' + 'D/d' Snap to a new point to define the direction normal which will be the new normal
##  </pre>
##
##  @par Event Bindings:
##  Note that the event bindings described above can be changed using this
##  class's vtkWidgetEventTranslator. This class translates VTK events
##  into the vtkCoordinateFrameWidget's widget events:
##  <pre>
##    vtkWidgetEvent::Select -- some part of the widget has been selected
##    vtkWidgetEvent::EndSelect -- the selection process has completed
##    vtkWidgetEvent::Move -- a request for widget motion has been invoked
##    vtkWidgetEvent::PickPoint -- PickOriginAction
##    vtkWidgetEvent::PickNormal -- PickNormalAction
##    vtkWidgetEvent::PickDirectionPoint -- PickDirectionPointAction
##  </pre>
##
##  @par Event Bindings:
##  In turn, when these widget events are processed, the vtkCoordinateFrameWidget
##  invokes the following VTK events on itself (which observers can listen for):
##  <pre>
##    vtkCommand::StartInteractionEvent (on vtkWidgetEvent::Select)
##    vtkCommand::EndInteractionEvent (on vtkWidgetEvent::EndSelect)
##    vtkCommand::InteractionEvent (on vtkWidgetEvent::Move)
##  </pre>
##
##
##  @par Event Bindings:
##  This class, and vtkCoordinateFrameRepresentation, are next generation VTK
##  widgets.
##
##  @sa
##  vtk3DWidget vtkBoxWidget vtkPlaneWidget vtkLineWidget vtkPointWidget
##  vtkSphereWidget vtkImagePlaneWidget vtkImplicitCylinderWidget, vtkImplicitPlaneWidget2
##  vtkDisplaySizedImplicitPlaneWidget
##

import
  vtkAbstractWidget, vtkDeprecation, vtkInteractionWidgetsModule

discard "forward decl of vtkCoordinateFrameRepresentation"
discard "forward decl of vtkCoordinateFrameWidgetInteractionCallback"
type
  vtkCoordinateFrameWidget* {.importcpp: "vtkCoordinateFrameWidget",
                             header: "vtkCoordinateFrameWidget.h", bycopy.} = object of vtkAbstractWidget ## *
                                                                                                   ##  Instantiate the object.
                                                                                                   ##
    vtkCoordinateFrameWidget* {.importc: "vtkCoordinateFrameWidget".}: VTK_NEWINSTANCE


proc New*(): ptr vtkCoordinateFrameWidget {.importcpp: "vtkCoordinateFrameWidget::New(@)",
                                        header: "vtkCoordinateFrameWidget.h".}
type
  vtkCoordinateFrameWidgetSuperclass* = vtkAbstractWidget

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCoordinateFrameWidget::IsTypeOf(@)",
    header: "vtkCoordinateFrameWidget.h".}
proc IsA*(this: var vtkCoordinateFrameWidget; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkCoordinateFrameWidget.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCoordinateFrameWidget {.
    importcpp: "vtkCoordinateFrameWidget::SafeDownCast(@)",
    header: "vtkCoordinateFrameWidget.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCoordinateFrameWidget :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCoordinateFrameWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCoordinateFrameWidget :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCoordinateFrameWidget; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCoordinateFrameWidget.h".}
proc SetRepresentation*(this: var vtkCoordinateFrameWidget;
                       rep: ptr vtkCoordinateFrameRepresentation) {.
    importcpp: "SetRepresentation", header: "vtkCoordinateFrameWidget.h".}
proc SetEnabled*(this: var vtkCoordinateFrameWidget; enabling: cint) {.
    importcpp: "SetEnabled", header: "vtkCoordinateFrameWidget.h".}
proc GetCoordinateFrameRepresentation*(this: var vtkCoordinateFrameWidget): ptr vtkCoordinateFrameRepresentation {.
    importcpp: "GetCoordinateFrameRepresentation",
    header: "vtkCoordinateFrameWidget.h".}
proc CreateDefaultRepresentation*(this: var vtkCoordinateFrameWidget) {.
    importcpp: "CreateDefaultRepresentation", header: "vtkCoordinateFrameWidget.h".}
## !!!Ignored construct:  # ! defined ( VTK_LEGACY_REMOVE ) [NewLine] VTK_DEPRECATED_IN_9_2_0 ( because leading underscore is reserved ) typedef WidgetStateType _WidgetState ;
## Error: identifier expected, but got: because leading underscore is reserved!!!
