## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAngleWidget.h,v
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
##  @class   vtkAngleWidget
##  @brief   measure the angle between two rays (defined by three points)
##
##  The vtkAngleWidget is used to measure the angle between two rays (defined
##  by three points). The three points (two end points and a center)
##  can be positioned independently, and when they are released, a special
##  PlacePointEvent is invoked so that special operations may be take to
##  reposition the point (snap to grid, etc.) The widget has two different
##  modes of interaction: when initially defined (i.e., placing the three
##  points) and then a manipulate mode (adjusting the position of the
##  three points).
##
##  To use this widget, specify an instance of vtkAngleWidget and a
##  representation (a subclass of vtkAngleRepresentation). The widget is
##  implemented using three instances of vtkHandleWidget which are used to
##  position the three points. The representations for these handle widgets
##  are provided by the vtkAngleRepresentation.
##
##  @par Event Bindings:
##  By default, the widget responds to the following VTK events (i.e., it
##  watches the vtkRenderWindowInteractor for these events):
##  <pre>
##    LeftButtonPressEvent - add a point or select a handle
##    MouseMoveEvent - position the second or third point, or move a handle
##    LeftButtonReleaseEvent - release the selected handle
##  </pre>
##
##  @par Event Bindings:
##  Note that the event bindings described above can be changed using this
##  class's vtkWidgetEventTranslator. This class translates VTK events
##  into the vtkAngleWidget's widget events:
##  <pre>
##    vtkWidgetEvent::AddPoint -- add one point; depending on the state
##                                it may the first, second or third point
##                                added. Or, if near a handle, select the handle.
##    vtkWidgetEvent::Move -- position the second or third point, or move the
##                            handle depending on the state.
##    vtkWidgetEvent::EndSelect -- the handle manipulation process has completed.
##  </pre>
##
##  @par Event Bindings:
##  This widget invokes the following VTK events on itself (which observers
##  can listen for):
##  <pre>
##    vtkCommand::StartInteractionEvent (beginning to interact)
##    vtkCommand::EndInteractionEvent (completing interaction)
##    vtkCommand::InteractionEvent (moving a handle)
##    vtkCommand::PlacePointEvent (after a point is positioned;
##                                 call data includes handle id (0,1,2))
##  </pre>
##
##  @sa
##  vtkHandleWidget vtkDistanceWidget
##

import
  vtkAbstractWidget, vtkInteractionWidgetsModule

discard "forward decl of vtkAngleRepresentation"
discard "forward decl of vtkHandleWidget"
discard "forward decl of vtkAngleWidgetCallback"
type
  vtkAngleWidget* {.importcpp: "vtkAngleWidget", header: "vtkAngleWidget.h", bycopy.} = object of vtkAbstractWidget ## *
                                                                                                          ##  Instantiate this class.
                                                                                                          ##
    vtkAngleWidget* {.importc: "vtkAngleWidget".}: VTK_NEWINSTANCE
    ##  Callback interface to capture events when
    ##  placing the widget.
    ##  Methods invoked when the handles at the
    ##  end points of the widget are manipulated


proc New*(): ptr vtkAngleWidget {.importcpp: "vtkAngleWidget::New(@)",
                              header: "vtkAngleWidget.h".}
type
  vtkAngleWidgetSuperclass* = vtkAbstractWidget

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAngleWidget::IsTypeOf(@)", header: "vtkAngleWidget.h".}
proc IsA*(this: var vtkAngleWidget; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkAngleWidget.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAngleWidget {.
    importcpp: "vtkAngleWidget::SafeDownCast(@)", header: "vtkAngleWidget.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAngleWidget :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAngleWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAngleWidget :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAngleWidget; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkAngleWidget.h".}
proc SetEnabled*(this: var vtkAngleWidget; a2: cint) {.importcpp: "SetEnabled",
    header: "vtkAngleWidget.h".}
proc SetRepresentation*(this: var vtkAngleWidget; r: ptr vtkAngleRepresentation) {.
    importcpp: "SetRepresentation", header: "vtkAngleWidget.h".}
proc CreateDefaultRepresentation*(this: var vtkAngleWidget) {.
    importcpp: "CreateDefaultRepresentation", header: "vtkAngleWidget.h".}
proc GetAngleRepresentation*(this: var vtkAngleWidget): ptr vtkAngleRepresentation {.
    importcpp: "GetAngleRepresentation", header: "vtkAngleWidget.h".}
proc IsAngleValid*(this: var vtkAngleWidget): vtkTypeBool {.
    importcpp: "IsAngleValid", header: "vtkAngleWidget.h".}
proc SetProcessEvents*(this: var vtkAngleWidget; a2: vtkTypeBool) {.
    importcpp: "SetProcessEvents", header: "vtkAngleWidget.h".}
const
  vtkAngleWidgetStart* = 0
  vtkAngleWidgetDefine* = 1
  vtkAngleWidgetManipulate* = 2

proc SetWidgetStateToStart*(this: var vtkAngleWidget) {.
    importcpp: "SetWidgetStateToStart", header: "vtkAngleWidget.h".}
proc SetWidgetStateToManipulate*(this: var vtkAngleWidget) {.
    importcpp: "SetWidgetStateToManipulate", header: "vtkAngleWidget.h".}
proc GetWidgetState*(this: var vtkAngleWidget): cint {.importcpp: "GetWidgetState",
    header: "vtkAngleWidget.h".}