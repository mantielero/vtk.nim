## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSeedWidget.h
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
##  @class   vtkSeedWidget
##  @brief   place multiple seed points
##
##  The vtkSeedWidget is used to placed multiple seed points in the scene.
##  The seed points can be used for operations like connectivity, segmentation,
##  and region growing.
##
##  To use this widget, specify an instance of vtkSeedWidget and a
##  representation (a subclass of vtkSeedRepresentation). The widget is
##  implemented using multiple instances of vtkHandleWidget which can be used
##  to position the seed points (after they are initially placed). The
##  representations for these handle widgets are provided by the
##  vtkSeedRepresentation.
##
##  @par Event Bindings:
##  By default, the widget responds to the following VTK events (i.e., it
##  watches the vtkRenderWindowInteractor for these events):
##  <pre>
##    LeftButtonPressEvent - add a point or select a handle (i.e., seed)
##    RightButtonPressEvent - finish adding the seeds
##    MouseMoveEvent - move a handle (i.e., seed)
##    LeftButtonReleaseEvent - release the selected handle (seed)
##  </pre>
##
##  @par Event Bindings:
##  Note that the event bindings described above can be changed using this
##  class's vtkWidgetEventTranslator. This class translates VTK events
##  into the vtkSeedWidget's widget events:
##  <pre>
##    vtkWidgetEvent::AddPoint -- add one point; depending on the state
##                                it may the first or second point added. Or,
##                                if near handle, select handle.
##    vtkWidgetEvent::Completed -- finished adding seeds.
##    vtkWidgetEvent::Move -- move the second point or handle depending on the state.
##    vtkWidgetEvent::EndSelect -- the handle manipulation process has completed.
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
##    vtkCommand::DeletePointEvent (before point is deleted;
##                                 call data includes handle id (0,1))
##  </pre>
##
##  @sa
##  vtkHandleWidget vtkSeedRepresentation
##

import
  vtkAbstractWidget, vtkInteractionWidgetsModule

discard "forward decl of vtkHandleRepresentation"
discard "forward decl of vtkHandleWidget"
discard "forward decl of vtkSeedList"
discard "forward decl of vtkSeedRepresentation"
type
  vtkSeedWidget* {.importcpp: "vtkSeedWidget", header: "vtkSeedWidget.h", bycopy.} = object of vtkAbstractWidget ## *
                                                                                                       ##  Instantiate this class.
                                                                                                       ##
    vtkSeedWidget* {.importc: "vtkSeedWidget".}: VTK_NEWINSTANCE
    ##  Callback interface to capture events when
    ##  placing the widget.
    ##  Manipulating or defining ?


proc New*(): ptr vtkSeedWidget {.importcpp: "vtkSeedWidget::New(@)",
                             header: "vtkSeedWidget.h".}
type
  vtkSeedWidgetSuperclass* = vtkAbstractWidget

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSeedWidget::IsTypeOf(@)", header: "vtkSeedWidget.h".}
proc IsA*(this: var vtkSeedWidget; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkSeedWidget.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSeedWidget {.
    importcpp: "vtkSeedWidget::SafeDownCast(@)", header: "vtkSeedWidget.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSeedWidget :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSeedWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSeedWidget :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSeedWidget; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkSeedWidget.h".}
proc SetEnabled*(this: var vtkSeedWidget; a2: cint) {.importcpp: "SetEnabled",
    header: "vtkSeedWidget.h".}
proc SetCurrentRenderer*(this: var vtkSeedWidget; a2: ptr vtkRenderer) {.
    importcpp: "SetCurrentRenderer", header: "vtkSeedWidget.h".}
proc SetInteractor*(this: var vtkSeedWidget; a2: ptr vtkRenderWindowInteractor) {.
    importcpp: "SetInteractor", header: "vtkSeedWidget.h".}
proc SetRepresentation*(this: var vtkSeedWidget; rep: ptr vtkSeedRepresentation) {.
    importcpp: "SetRepresentation", header: "vtkSeedWidget.h".}
proc GetSeedRepresentation*(this: var vtkSeedWidget): ptr vtkSeedRepresentation {.
    importcpp: "GetSeedRepresentation", header: "vtkSeedWidget.h".}
proc CreateDefaultRepresentation*(this: var vtkSeedWidget) {.
    importcpp: "CreateDefaultRepresentation", header: "vtkSeedWidget.h".}
proc SetProcessEvents*(this: var vtkSeedWidget; a2: vtkTypeBool) {.
    importcpp: "SetProcessEvents", header: "vtkSeedWidget.h".}
proc CompleteInteraction*(this: var vtkSeedWidget) {.
    importcpp: "CompleteInteraction", header: "vtkSeedWidget.h".}
proc RestartInteraction*(this: var vtkSeedWidget) {.importcpp: "RestartInteraction",
    header: "vtkSeedWidget.h".}
proc CreateNewHandle*(this: var vtkSeedWidget): ptr vtkHandleWidget {.
    importcpp: "CreateNewHandle", header: "vtkSeedWidget.h".}
proc DeleteSeed*(this: var vtkSeedWidget; n: cint) {.importcpp: "DeleteSeed",
    header: "vtkSeedWidget.h".}
proc GetSeed*(this: var vtkSeedWidget; n: cint): ptr vtkHandleWidget {.
    importcpp: "GetSeed", header: "vtkSeedWidget.h".}
## !!!Ignored construct:  /@{ *
##  Get the widget state.
##  virtual int GetWidgetStateWidgetState ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WidgetState  of  << this -> WidgetState ) ; return this -> WidgetState ; } ;
## Error: expected ';'!!!

const
  vtkSeedWidgetStart* = 1
  vtkSeedWidgetPlacingSeeds* = 2
  vtkSeedWidgetPlacedSeeds* = 4
  vtkSeedWidgetMovingSeed* = 8
