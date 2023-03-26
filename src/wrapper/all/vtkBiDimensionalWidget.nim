## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBiDimensionalWidget.h,v
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
##  @class   vtkBiDimensionalWidget
##  @brief   measure the bi-dimensional lengths of an object
##
##  The vtkBiDimensionalWidget is used to measure the bi-dimensional length of
##  an object. The bi-dimensional measure is defined by two finite, orthogonal
##  lines that intersect within the finite extent of both lines.
##  The lengths of these two lines gives the bi-dimensional measure. Each line
##  is defined by two handle widgets at the end points of each line.
##
##  The orthogonal constraint on the two lines limits how the four end points
##  can be positioned. The first two points can be placed arbitrarily to define
##  the first line (similar to vtkDistanceWidget). The placement of the third
##  point is limited by the finite extent of the first line. As the third point
##  is placed, the fourth point is placed on the opposite side of the first
##  line. Once the third point is placed, the second line is defined since the
##  fourth point is defined at the same time, but the fourth point can be moved
##  along the second line (i.e., maintaining the orthogonal relationship between
##  the two lines). Once defined, any of the four points can be moved along
##  their constraint lines. Also, each line can be translated along the other
##  line (in an orthogonal direction), and the whole bi-dimensional widget can
##  be rotated about its center point (see the description of the event
##  bindings). Finally, selecting the point where the two orthogonal axes
##  intersect, the entire widget can be translated in any direction.
##
##  Placement of any point results in a special PlacePointEvent invocation so
##  that special operations may be performed to reposition the point. Motion of
##  any point, moving the lines, or rotating the widget cause InteractionEvents
##  to be invoked. Note that the widget has two fundamental modes: a define mode
##  (when initially placing the points) and a manipulate mode (after the points
##  are placed). Line translation and rotation are only possible in manipulate
##  mode.
##
##  To use this widget, specify an instance of vtkBiDimensionalWidget and a
##  representation (e.g., vtkBiDimensionalRepresentation2D). The widget is
##  implemented using four instances of vtkHandleWidget which are used to
##  position the end points of the two intersecting lines. The representations
##  for these handle widgets are provided by the vtkBiDimensionalRepresentation
##  class.
##
##  @par Event Bindings:
##  By default, the widget responds to the following VTK events (i.e., it
##  watches the vtkRenderWindowInteractor for these events):
##  <pre>
##    LeftButtonPressEvent - define a point or manipulate a handle, line,
##                           perform rotation or translate the widget.
##    MouseMoveEvent - position the points, move a line, rotate or translate the widget
##    LeftButtonReleaseEvent - release the selected handle and end interaction
##  </pre>
##
##  @par Event Bindings:
##  Note that the event bindings described above can be changed using this
##  class's vtkWidgetEventTranslator. This class translates VTK events
##  into the vtkBiDimensionalWidget's widget events:
##  <pre>
##    vtkWidgetEvent::AddPoint -- (In Define mode:) Add one point; depending on the
##                                state it may the first, second, third or fourth
##                                point added. (In Manipulate mode:) If near a handle,
##                                select the handle. Or if near a line, select the line.
##    vtkWidgetEvent::Move -- (In Define mode:) Position the second, third or fourth
##                            point. (In Manipulate mode:) Move the handle, line or widget.
##    vtkWidgetEvent::EndSelect -- the manipulation process has completed.
##  </pre>
##
##  @par Event Bindings:
##  This widget invokes the following VTK events on itself (which observers
##  can listen for):
##  <pre>
##    vtkCommand::StartInteractionEvent (beginning to interact)
##    vtkCommand::EndInteractionEvent (completing interaction)
##    vtkCommand::InteractionEvent (moving a handle, line or performing rotation)
##    vtkCommand::PlacePointEvent (after a point is positioned;
##                                 call data includes handle id (0,1,2,4))
##  </pre>
##
##  @sa
##  vtkHandleWidget vtkDistanceWidget
##

import
  vtkAbstractWidget, vtkInteractionWidgetsModule

discard "forward decl of vtkBiDimensionalRepresentation"
discard "forward decl of vtkHandleWidget"
discard "forward decl of vtkBiDimensionalWidgetCallback"
type
  vtkBiDimensionalWidget* {.importcpp: "vtkBiDimensionalWidget",
                           header: "vtkBiDimensionalWidget.h", bycopy.} = object of vtkAbstractWidget ## *
                                                                                               ##  Instantiate this class.
                                                                                               ##
    vtkBiDimensionalWidget* {.importc: "vtkBiDimensionalWidget".}: VTK_NEWINSTANCE
    ##  Callback interface to capture events when
    ##  placing the widget.
    ##  Methods invoked when the handles at the
    ##  end points of the widget are manipulated


proc New*(): ptr vtkBiDimensionalWidget {.importcpp: "vtkBiDimensionalWidget::New(@)",
                                      header: "vtkBiDimensionalWidget.h".}
type
  vtkBiDimensionalWidgetSuperclass* = vtkAbstractWidget

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkBiDimensionalWidget::IsTypeOf(@)",
    header: "vtkBiDimensionalWidget.h".}
proc IsA*(this: var vtkBiDimensionalWidget; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkBiDimensionalWidget.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkBiDimensionalWidget {.
    importcpp: "vtkBiDimensionalWidget::SafeDownCast(@)",
    header: "vtkBiDimensionalWidget.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkBiDimensionalWidget :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBiDimensionalWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBiDimensionalWidget :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkBiDimensionalWidget; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkBiDimensionalWidget.h".}
proc SetEnabled*(this: var vtkBiDimensionalWidget; a2: cint) {.
    importcpp: "SetEnabled", header: "vtkBiDimensionalWidget.h".}
proc SetRepresentation*(this: var vtkBiDimensionalWidget;
                       r: ptr vtkBiDimensionalRepresentation) {.
    importcpp: "SetRepresentation", header: "vtkBiDimensionalWidget.h".}
proc GetBiDimensionalRepresentation*(this: var vtkBiDimensionalWidget): ptr vtkBiDimensionalRepresentation {.
    importcpp: "GetBiDimensionalRepresentation",
    header: "vtkBiDimensionalWidget.h".}
proc CreateDefaultRepresentation*(this: var vtkBiDimensionalWidget) {.
    importcpp: "CreateDefaultRepresentation", header: "vtkBiDimensionalWidget.h".}
proc IsMeasureValid*(this: var vtkBiDimensionalWidget): cint {.
    importcpp: "IsMeasureValid", header: "vtkBiDimensionalWidget.h".}
const
  vtkBiDimensionalWidgetEndWidgetSelectEvent* = 10050

proc SetProcessEvents*(this: var vtkBiDimensionalWidget; a2: vtkTypeBool) {.
    importcpp: "SetProcessEvents", header: "vtkBiDimensionalWidget.h".}
const
  vtkBiDimensionalWidgetStart* = 0
  vtkBiDimensionalWidgetDefine* = 1
  vtkBiDimensionalWidgetManipulate* = 2

proc SetWidgetStateToStart*(this: var vtkBiDimensionalWidget) {.
    importcpp: "SetWidgetStateToStart", header: "vtkBiDimensionalWidget.h".}
proc SetWidgetStateToManipulate*(this: var vtkBiDimensionalWidget) {.
    importcpp: "SetWidgetStateToManipulate", header: "vtkBiDimensionalWidget.h".}
proc GetWidgetState*(this: var vtkBiDimensionalWidget): cint {.
    importcpp: "GetWidgetState", header: "vtkBiDimensionalWidget.h".}