## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBorderWidget.h
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
##  @class   vtkBorderWidget
##  @brief   place a border around a 2D rectangular region
##
##  This class is a superclass for 2D widgets that may require a rectangular
##  border. Besides drawing a border, the widget provides methods for resizing
##  and moving the rectangular region (and associated border). The widget
##  provides methods and internal data members so that subclasses can take
##  advantage of this widgets capabilities, requiring only that the subclass
##  defines a "representation", i.e., some combination of props or actors
##  that can be managed in the 2D rectangular region.
##
##  The class defines basic positioning functionality, including the ability
##  to size the widget with locked x/y proportions. The area within the border
##  may be made "selectable" as well, meaning that a selection event interior
##  to the widget invokes a virtual SelectRegion() method, which can be used
##  to pick objects or otherwise manipulate data interior to the widget.
##
##  @par Event Bindings:
##  By default, the widget responds to the following VTK events (i.e., it
##  watches the vtkRenderWindowInteractor for these events):
##  <pre>
##  On the boundary of the widget:
##    LeftButtonPressEvent - select boundary
##    LeftButtonReleaseEvent - deselect boundary
##    MouseMoveEvent - move/resize widget depending on which portion of the
##                     boundary was selected.
##  On the interior of the widget:
##    LeftButtonPressEvent - invoke SelectButton() callback (if the ivar
##                           Selectable is on)
##  Anywhere on the widget:
##    MiddleButtonPressEvent - move the widget
##  </pre>
##
##  @par Event Bindings:
##  Note that the event bindings described above can be changed using this
##  class's vtkWidgetEventTranslator. This class translates VTK events
##  into the vtkBorderWidget's widget events:
##  <pre>
##    vtkWidgetEvent::Select -- some part of the widget has been selected
##    vtkWidgetEvent::EndSelect -- the selection process has completed
##    vtkWidgetEvent::Translate -- the widget is to be translated
##    vtkWidgetEvent::Move -- a request for slider motion has been invoked
##  </pre>
##
##  @par Event Bindings:
##  In turn, when these widget events are processed, this widget invokes the
##  following VTK events on itself (which observers can listen for):
##  <pre>
##    vtkCommand::StartInteractionEvent (on vtkWidgetEvent::Select)
##    vtkCommand::EndInteractionEvent (on vtkWidgetEvent::EndSelect)
##    vtkCommand::InteractionEvent (on vtkWidgetEvent::Move)
##  </pre>
##
##  @sa
##  vtkInteractorObserver vtkCameraInterpolator
##

import
  vtkAbstractWidget, vtkDeprecation, vtkInteractionWidgetsModule

discard "forward decl of vtkBorderRepresentation"
type
  vtkBorderWidget* {.importcpp: "vtkBorderWidget", header: "vtkBorderWidget.h",
                    bycopy.} = object of vtkAbstractWidget ## *
                                                      ##  Method to instantiate class.
                                                      ##
    vtkBorderWidget* {.importc: "vtkBorderWidget".}: VTK_NEWINSTANCE
    ##  processes the registered events


proc New*(): ptr vtkBorderWidget {.importcpp: "vtkBorderWidget::New(@)",
                               header: "vtkBorderWidget.h".}
type
  vtkBorderWidgetSuperclass* = vtkAbstractWidget

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkBorderWidget::IsTypeOf(@)", header: "vtkBorderWidget.h".}
proc IsA*(this: var vtkBorderWidget; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkBorderWidget.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkBorderWidget {.
    importcpp: "vtkBorderWidget::SafeDownCast(@)", header: "vtkBorderWidget.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkBorderWidget :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBorderWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBorderWidget :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkBorderWidget; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkBorderWidget.h".}
proc SetSelectable*(this: var vtkBorderWidget; _arg: vtkTypeBool) {.
    importcpp: "SetSelectable", header: "vtkBorderWidget.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetSelectable ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Selectable  of  << this -> Selectable ) ; return this -> Selectable ; } ;
## Error: expected ';'!!!

proc SelectableOn*(this: var vtkBorderWidget) {.importcpp: "SelectableOn",
    header: "vtkBorderWidget.h".}
proc SelectableOff*(this: var vtkBorderWidget) {.importcpp: "SelectableOff",
    header: "vtkBorderWidget.h".}
  ## /@}
  ## /@{
  ## *
  ##  Indicate whether the boundary of the widget can be resized.
  ##  If not, the cursor will not change to "resize" type when mouse
  ##  over the boundary.
  ##
proc SetSelectableResizable*(this: var vtkBorderWidget; _arg: vtkTypeBool) {.
    importcpp: "SetSelectableResizable", header: "vtkBorderWidget.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetSelectableResizable ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Resizable  of  << this -> Resizable ) ; return this -> Resizable ; } ;
## Error: expected ';'!!!

proc ResizableOn*(this: var vtkBorderWidget) {.importcpp: "ResizableOn",
    header: "vtkBorderWidget.h".}
proc ResizableOff*(this: var vtkBorderWidget) {.importcpp: "ResizableOff",
    header: "vtkBorderWidget.h".}
  ## /@}
  ## *
  ##  Specify an instance of vtkWidgetRepresentation used to represent this
  ##  widget in the scene. Note that the representation is a subclass of vtkProp
  ##  so it can be added to the renderer independent of the widget.
  ##
proc SetRepresentation*(this: var vtkBorderWidget; r: ptr vtkBorderRepresentation) {.
    importcpp: "SetRepresentation", header: "vtkBorderWidget.h".}
proc GetBorderRepresentation*(this: var vtkBorderWidget): ptr vtkBorderRepresentation {.
    importcpp: "GetBorderRepresentation", header: "vtkBorderWidget.h".}
proc CreateDefaultRepresentation*(this: var vtkBorderWidget) {.
    importcpp: "CreateDefaultRepresentation", header: "vtkBorderWidget.h".}
proc GetProcessEvents*(this: var vtkBorderWidget): vtkTypeBool {.
    importcpp: "GetProcessEvents", header: "vtkBorderWidget.h".}
## !!!Ignored construct:  # ! defined ( VTK_LEGACY_REMOVE ) [NewLine] VTK_DEPRECATED_IN_9_2_0 ( because leading underscore is reserved ) typedef WidgetStateType _WidgetState ;
## Error: identifier expected, but got: because leading underscore is reserved!!!
