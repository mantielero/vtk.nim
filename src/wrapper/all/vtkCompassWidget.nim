## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCompassWidget.h
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
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkCompassWidget
##  @brief   set a value by manipulating something
##
##  The vtkCompassWidget is used to adjust a scalar value in an
##  application. Note that the actual appearance of the widget depends on
##  the specific representation for the widget.
##
##  To use this widget, set the widget representation. (the details may
##  vary depending on the particulars of the representation).
##
##
##  @par Event Bindings:
##  By default, the widget responds to the following VTK events (i.e., it
##  watches the vtkRenderWindowInteractor for these events):
##  <pre>
##  If the slider bead is selected:
##    LeftButtonPressEvent - select slider
##    LeftButtonReleaseEvent - release slider
##    MouseMoveEvent - move slider
##  </pre>
##
##  @par Event Bindings:
##  Note that the event bindings described above can be changed using this
##  class's vtkWidgetEventTranslator. This class translates VTK events
##  into the vtkCompassWidget's widget events:
##  <pre>
##    vtkWidgetEvent::Select -- some part of the widget has been selected
##    vtkWidgetEvent::EndSelect -- the selection process has completed
##    vtkWidgetEvent::Move -- a request for slider motion has been invoked
##  </pre>
##
##  @par Event Bindings:
##  In turn, when these widget events are processed, the vtkCompassWidget
##  invokes the following VTK events on itself (which observers can listen for):
##  <pre>
##    vtkCommand::StartInteractionEvent (on vtkWidgetEvent::Select)
##    vtkCommand::EndInteractionEvent (on vtkWidgetEvent::EndSelect)
##    vtkCommand::InteractionEvent (on vtkWidgetEvent::Move)
##  </pre>
##
##

import
  vtkAbstractWidget, vtkDeprecation, vtkGeovisCoreModule

discard "forward decl of vtkCompassRepresentation"
type
  vtkCompassWidget* {.importcpp: "vtkCompassWidget", header: "vtkCompassWidget.h",
                     bycopy.} = object of vtkAbstractWidget ## *
                                                       ##  Instantiate the class.
                                                       ##
    vtkCompassWidget* {.importc: "vtkCompassWidget".}: VTK_NEWINSTANCE


proc New*(): ptr vtkCompassWidget {.importcpp: "vtkCompassWidget::New(@)",
                                header: "vtkCompassWidget.h".}
type
  vtkCompassWidgetSuperclass* = vtkAbstractWidget

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCompassWidget::IsTypeOf(@)", header: "vtkCompassWidget.h".}
proc IsA*(this: var vtkCompassWidget; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkCompassWidget.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCompassWidget {.
    importcpp: "vtkCompassWidget::SafeDownCast(@)", header: "vtkCompassWidget.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCompassWidget :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCompassWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCompassWidget :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCompassWidget; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCompassWidget.h".}
proc SetRepresentation*(this: var vtkCompassWidget; r: ptr vtkCompassRepresentation) {.
    importcpp: "SetRepresentation", header: "vtkCompassWidget.h".}
proc CreateDefaultRepresentation*(this: var vtkCompassWidget) {.
    importcpp: "CreateDefaultRepresentation", header: "vtkCompassWidget.h".}
proc GetHeading*(this: var vtkCompassWidget): cdouble {.importcpp: "GetHeading",
    header: "vtkCompassWidget.h".}
proc SetHeading*(this: var vtkCompassWidget; v: cdouble) {.importcpp: "SetHeading",
    header: "vtkCompassWidget.h".}
proc GetTilt*(this: var vtkCompassWidget): cdouble {.importcpp: "GetTilt",
    header: "vtkCompassWidget.h".}
proc SetTilt*(this: var vtkCompassWidget; value: cdouble) {.importcpp: "SetTilt",
    header: "vtkCompassWidget.h".}
proc GetDistance*(this: var vtkCompassWidget): cdouble {.importcpp: "GetDistance",
    header: "vtkCompassWidget.h".}
proc SetDistance*(this: var vtkCompassWidget; value: cdouble) {.
    importcpp: "SetDistance", header: "vtkCompassWidget.h".}
## !!!Ignored construct:  # ! defined ( VTK_LEGACY_REMOVE ) [NewLine] VTK_DEPRECATED_IN_9_2_0 ( because leading underscore is reserved ) typedef WidgetStateType _WidgetState ;
## Error: identifier expected, but got: because leading underscore is reserved!!!
