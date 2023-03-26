## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkContourWidget.h
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
##  @class   vtkContourWidget
##  @brief   create a contour with a set of points
##
##  The vtkContourWidget is used to select a set of points, and draw lines
##  between these points. The contour may be opened or closed, depending on
##  how the last point is added. The widget handles all processing of widget
##  events (that are triggered by VTK events). The vtkContourRepresentation is
##  responsible for all placement of the points, calculation of the lines, and
##  contour manipulation. This is done through two main helper classes:
##  vtkPointPlacer and vtkContourLineInterpolator. The representation is also
##  responsible for drawing the points and lines.
##
##  @par Event Bindings:
##  By default, the widget responds to the following VTK events (i.e., it
##  watches the vtkRenderWindowInteractor for these events):
##  <pre>
##    LeftButtonPressEvent - triggers a Select event
##    RightButtonPressEvent - triggers a AddFinalPoint event
##    MouseMoveEvent - triggers a Move event
##    LeftButtonReleaseEvent - triggers an EndSelect event
##    Delete key event - triggers a Delete event
##    Shift + Delete key event - triggers a Reset event
##  </pre>
##
##  @par Event Bindings:
##  Note that the event bindings described above can be changed using this
##  class's vtkWidgetEventTranslator. This class translates VTK events
##  into the vtkContourWidget's widget events:
##  <pre>
##    vtkWidgetEvent::Select
##         widget state is:
##             Start or
##             Define: If we already have at least 2 nodes, test
##                  whether the current (X,Y) location is near an existing
##                  node. If so, close the contour and change to Manipulate
##                  state. Otherwise, attempt to add a node at this (X,Y)
##                  location.
##             Manipulate: If this (X,Y) location activates a node, then
##                  set the current operation to Translate. Otherwise, if
##                  this location is near the contour, attempt to add a
##                  new node on the contour at this (X,Y) location.
##
##  @par Event Bindings:
##    vtkWidgetEvent::AddFinalPoint
##         widget state is:
##             Start: Do nothing.
##             Define: If we already have at least 2 nodes, test
##                  whether the current (X,Y) location is near an existing
##                  node. If so, close the contour and change to Manipulate
##                  state. Otherwise, attempt to add a node at this (X,Y)
##                  location. If we do, then leave the contour open and
##                  change to Manipulate state.
##             Manipulate: Do nothing.
##
##  @par Event Bindings:
##    vtkWidgetEvent::Move
##         widget state is:
##             Start or
##             Define: Do nothing.
##             Manipulate: If our operation is Translate, then invoke
##                   WidgetInteraction() on the representation. If our
##                   operation is Inactive, then just attempt to activate
##                   a node at this (X,Y) location.
##
##  @par Event Bindings:
##    vtkWidgetEvent::EndSelect
##         widget state is:
##             Start or
##             Define: Do nothing.
##             Manipulate: If our operation is not Inactive, set it to
##                   Inactive.
##
##  @par Event Bindings:
##    vtkWidgetEvent::Delete
##         widget state is:
##             Start: Do nothing.
##             Define: Remove the last point on the contour.
##             Manipulate: Attempt to activate a node at (X,Y). If
##                    we do activate a node, delete it. If we now
##                    have less than 3 nodes, go back to Define state.
##
##  @par Event Bindings:
##    vtkWidgetEvent::Reset
##         widget state is:
##             Start: Do nothing.
##             Define: Remove all points and line segments of the contour.
##                  Essentially calls Initialize(nullptr)
##             Manipulate: Do nothing.
##  </pre>
##
##  @par Event Bindings:
##  This widget invokes the following VTK events on itself (which observers
##  can listen for):
##  <pre>
##    vtkCommand::StartInteractionEvent (beginning to interact)
##    vtkCommand::EndInteractionEvent (completing interaction)
##    vtkCommand::InteractionEvent (moving after selecting something)
##    vtkCommand::PlacePointEvent (after point is positioned;
##                                 call data includes handle id (0,1))
##    vtkCommand::WidgetValueChangedEvent (Invoked when the contour is closed
##                                         for the first time. )
##  </pre>
##
##  @sa
##  vtkHandleWidget
##

import
  vtkAbstractWidget, vtkInteractionWidgetsModule

discard "forward decl of vtkContourRepresentation"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkIdList"
type
  vtkContourWidget* {.importcpp: "vtkContourWidget", header: "vtkContourWidget.h",
                     bycopy.} = object of vtkAbstractWidget ## *
                                                       ##  Instantiate this class.
                                                       ##
    vtkContourWidget* {.importc: "vtkContourWidget".}: VTK_NEWINSTANCE
    ##  Callback interface to capture events when
    ##  placing the widget.


proc New*(): ptr vtkContourWidget {.importcpp: "vtkContourWidget::New(@)",
                                header: "vtkContourWidget.h".}
type
  vtkContourWidgetSuperclass* = vtkAbstractWidget

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkContourWidget::IsTypeOf(@)", header: "vtkContourWidget.h".}
proc IsA*(this: var vtkContourWidget; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkContourWidget.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkContourWidget {.
    importcpp: "vtkContourWidget::SafeDownCast(@)", header: "vtkContourWidget.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkContourWidget :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkContourWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkContourWidget :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkContourWidget; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkContourWidget.h".}
proc SetEnabled*(this: var vtkContourWidget; a2: cint) {.importcpp: "SetEnabled",
    header: "vtkContourWidget.h".}
proc SetRepresentation*(this: var vtkContourWidget; r: ptr vtkContourRepresentation) {.
    importcpp: "SetRepresentation", header: "vtkContourWidget.h".}
proc GetContourRepresentation*(this: var vtkContourWidget): ptr vtkContourRepresentation {.
    importcpp: "GetContourRepresentation", header: "vtkContourWidget.h".}
proc CreateDefaultRepresentation*(this: var vtkContourWidget) {.
    importcpp: "CreateDefaultRepresentation", header: "vtkContourWidget.h".}
proc CloseLoop*(this: var vtkContourWidget) {.importcpp: "CloseLoop",
    header: "vtkContourWidget.h".}
proc SetWidgetState*(this: var vtkContourWidget; _arg: cint) {.
    importcpp: "SetWidgetState", header: "vtkContourWidget.h".}
  ## /@}
  ## /@{
  ## *
  ##  Convenient method to determine the state of the method
  ##
## !!!Ignored construct:  virtual int GetWidgetState ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WidgetState  of  << this -> WidgetState ) ; return this -> WidgetState ; } ;
## Error: expected ';'!!!

proc SetAllowNodePicking*(this: var vtkContourWidget; a2: vtkTypeBool) {.
    importcpp: "SetAllowNodePicking", header: "vtkContourWidget.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetWidgetStateAllowNodePicking ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AllowNodePicking  of  << this -> AllowNodePicking ) ; return this -> AllowNodePicking ; } ;
## Error: expected ';'!!!

proc AllowNodePickingOn*(this: var vtkContourWidget) {.
    importcpp: "AllowNodePickingOn", header: "vtkContourWidget.h".}
proc AllowNodePickingOff*(this: var vtkContourWidget) {.
    importcpp: "AllowNodePickingOff", header: "vtkContourWidget.h".}
  ## /@}
  ## /@{
  ## *
  ##  Follow the cursor ? If this is ON, during definition, the last node of the
  ##  contour will automatically follow the cursor, without waiting for the
  ##  point to be dropped. This may be useful for some interpolators, such as the
  ##  live-wire interpolator to see the shape of the contour that will be placed
  ##  as you move the mouse cursor.
  ##
proc SetWidgetStateFollowCursor*(this: var vtkContourWidget; _arg: vtkTypeBool) {.
    importcpp: "SetWidgetStateFollowCursor", header: "vtkContourWidget.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetWidgetStateAllowNodePickingFollowCursor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FollowCursor  of  << this -> FollowCursor ) ; return this -> FollowCursor ; } ;
## Error: expected ';'!!!

proc FollowCursorOn*(this: var vtkContourWidget) {.importcpp: "FollowCursorOn",
    header: "vtkContourWidget.h".}
proc FollowCursorOff*(this: var vtkContourWidget) {.importcpp: "FollowCursorOff",
    header: "vtkContourWidget.h".}
  ## /@}
  ## /@{
  ## *
  ##  Define a contour by continuously drawing with the mouse cursor.
  ##  Press and hold the left mouse button down to continuously draw.
  ##  Releasing the left mouse button switches into a snap drawing mode.
  ##  Terminate the contour by pressing the right mouse button.  If you
  ##  do not want to see the nodes as they are added to the contour, set the
  ##  opacity to 0 of the representation's property.  If you do not want to
  ##  see the last active node as it is being added, set the opacity to 0
  ##  of the representation's active property.
  ##
proc SetWidgetStateFollowCursorContinuousDraw*(this: var vtkContourWidget;
    _arg: vtkTypeBool) {.importcpp: "SetWidgetStateFollowCursorContinuousDraw",
                       header: "vtkContourWidget.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetWidgetStateAllowNodePickingFollowCursorContinuousDraw ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ContinuousDraw  of  << this -> ContinuousDraw ) ; return this -> ContinuousDraw ; } ;
## Error: expected ';'!!!

proc ContinuousDrawOn*(this: var vtkContourWidget) {.importcpp: "ContinuousDrawOn",
    header: "vtkContourWidget.h".}
proc ContinuousDrawOff*(this: var vtkContourWidget) {.
    importcpp: "ContinuousDrawOff", header: "vtkContourWidget.h".}
  ## /@}
  ## *
  ##  Initialize the contour widget from a user supplied set of points. The
  ##  state of the widget decides if you are still defining the widget, or
  ##  if you've finished defining (added the last point) are manipulating
  ##  it. Note that if the polydata supplied is closed, the state will be
  ##  set to manipulate.
  ##  State: Define = 0, Manipulate = 1.
  ##
proc Initialize*(this: var vtkContourWidget; poly: ptr vtkPolyData; state: cint = 1;
                idList: ptr vtkIdList = nil) {.importcpp: "Initialize",
    header: "vtkContourWidget.h".}
proc Initialize*(this: var vtkContourWidget) {.importcpp: "Initialize",
    header: "vtkContourWidget.h".}
const
  vtkContourWidgetStart* = 0
  vtkContourWidgetDefine* = 1
  vtkContourWidgetManipulate* = 2
