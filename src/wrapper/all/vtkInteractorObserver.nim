## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInteractorObserver.h
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
##  @class   vtkInteractorObserver
##  @brief   an abstract superclass for classes observing events invoked by vtkRenderWindowInteractor
##
##  vtkInteractorObserver is an abstract superclass for subclasses that observe
##  events invoked by vtkRenderWindowInteractor. These subclasses are
##  typically things like 3D widgets; objects that interact with actors
##  in the scene, or interactively probe the scene for information.
##
##  vtkInteractorObserver defines the method SetInteractor() and enables and
##  disables the processing of events by the vtkInteractorObserver. Use the
##  methods EnabledOn() or SetEnabled(1) to turn on the interactor observer,
##  and the methods EnabledOff() or SetEnabled(0) to turn off the interactor.
##  Initial value is 0.
##
##  To support interactive manipulation of objects, this class (and
##  subclasses) invoke the events StartInteractionEvent, InteractionEvent, and
##  EndInteractionEvent.  These events are invoked when the
##  vtkInteractorObserver enters a state where rapid response is desired:
##  mouse motion, etc. The events can be used, for example, to set the desired
##  update frame rate (StartInteractionEvent), operate on data or update a
##  pipeline (InteractionEvent), and set the desired frame rate back to normal
##  values (EndInteractionEvent). Two other events, EnableEvent and
##  DisableEvent, are invoked when the interactor observer is enabled or
##  disabled.
##
##  @sa
##  vtk3DWidget vtkBoxWidget vtkLineWidget
##

import
  vtkObject, vtkRenderingCoreModule

discard "forward decl of vtkAbstractPropPicker"
discard "forward decl of vtkAssemblyPath"
discard "forward decl of vtkRenderWindowInteractor"
discard "forward decl of vtkRenderer"
discard "forward decl of vtkCallbackCommand"
discard "forward decl of vtkObserverMediator"
discard "forward decl of vtkPickingManager"
type
  vtkInteractorObserver* {.importcpp: "vtkInteractorObserver",
                          header: "vtkInteractorObserver.h", bycopy.} = object of vtkObject
    vtkInteractorObserver* {.importc: "vtkInteractorObserver".}: VTK_NEWINSTANCE
    ##  Used to process events
    ##  subclasses use one
    ##  listens to key activation
    ##  Priority at which events are processed
    ##  This variable controls whether the picking is managed by the Picking
    ##  Manager process or not. True by default.
    ## *
    ##  Register internal Pickers in the Picking Manager.
    ##  Must be reimplemented by concrete widgets to register
    ##  their pickers.
    ##
    ##  Used to associate observers with the interactor
    ##  Internal ivars for processing events
    ##  The mediator used to request resources from the interactor.

  vtkInteractorObserverSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkInteractorObserver::IsTypeOf(@)",
    header: "vtkInteractorObserver.h".}
proc IsA*(this: var vtkInteractorObserver; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkInteractorObserver.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkInteractorObserver {.
    importcpp: "vtkInteractorObserver::SafeDownCast(@)",
    header: "vtkInteractorObserver.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkInteractorObserver :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInteractorObserver :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInteractorObserver :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkInteractorObserver; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkInteractorObserver.h".}
proc SetEnabled*(this: var vtkInteractorObserver; a2: cint) {.importcpp: "SetEnabled",
    header: "vtkInteractorObserver.h".}
proc GetEnabled*(this: var vtkInteractorObserver): cint {.importcpp: "GetEnabled",
    header: "vtkInteractorObserver.h".}
proc EnabledOn*(this: var vtkInteractorObserver) {.importcpp: "EnabledOn",
    header: "vtkInteractorObserver.h".}
proc EnabledOff*(this: var vtkInteractorObserver) {.importcpp: "EnabledOff",
    header: "vtkInteractorObserver.h".}
proc On*(this: var vtkInteractorObserver) {.importcpp: "On",
                                        header: "vtkInteractorObserver.h".}
proc Off*(this: var vtkInteractorObserver) {.importcpp: "Off",
    header: "vtkInteractorObserver.h".}
proc SetInteractor*(this: var vtkInteractorObserver;
                   iren: ptr vtkRenderWindowInteractor) {.
    importcpp: "SetInteractor", header: "vtkInteractorObserver.h".}
proc GetnameInteractor*(this: var vtkInteractorObserver): ptr vtkRenderWindowInteractor {.
    importcpp: "GetnameInteractor", header: "vtkInteractorObserver.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the priority at which events are processed. This is used when
  ##  multiple interactor observers are used simultaneously. The default value
  ##  is 0.0 (lowest priority.) Note that when multiple interactor observer
  ##  have the same priority, then the last observer added will process the
  ##  event first. (Note: once the SetInteractor() method has been called,
  ##  changing the priority does not effect event processing. You will have
  ##  to SetInteractor(NULL), change priority, and then SetInteractor(iren)
  ##  to have the priority take effect.)
  ##
proc SetPriority*(this: var vtkInteractorObserver; _arg: cfloat) {.
    importcpp: "SetPriority", header: "vtkInteractorObserver.h".}
proc GetPriorityMinValue*(this: var vtkInteractorObserver): cfloat {.
    importcpp: "GetPriorityMinValue", header: "vtkInteractorObserver.h".}
proc GetPriorityMaxValue*(this: var vtkInteractorObserver): cfloat {.
    importcpp: "GetPriorityMaxValue", header: "vtkInteractorObserver.h".}
## !!!Ignored construct:  virtual float GetPriority ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Priority  of  << this -> Priority ) ; return this -> Priority ; } ;
## Error: expected ';'!!!

proc PickingManagedOn*(this: var vtkInteractorObserver) {.
    importcpp: "PickingManagedOn", header: "vtkInteractorObserver.h".}
proc PickingManagedOff*(this: var vtkInteractorObserver) {.
    importcpp: "PickingManagedOff", header: "vtkInteractorObserver.h".}
proc SetPickingManaged*(this: var vtkInteractorObserver; managed: bool) {.
    importcpp: "SetPickingManaged", header: "vtkInteractorObserver.h".}
## !!!Ignored construct:  virtual bool GetPriorityPickingManaged ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PickingManaged  of  << this -> PickingManaged ) ; return this -> PickingManaged ; } ;
## Error: expected ';'!!!

proc SetKeyPressActivation*(this: var vtkInteractorObserver; _arg: vtkTypeBool) {.
    importcpp: "SetKeyPressActivation", header: "vtkInteractorObserver.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetPriorityPickingManagedKeyPressActivation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << KeyPressActivation  of  << this -> KeyPressActivation ) ; return this -> KeyPressActivation ; } ;
## Error: expected ';'!!!

proc KeyPressActivationOn*(this: var vtkInteractorObserver) {.
    importcpp: "KeyPressActivationOn", header: "vtkInteractorObserver.h".}
proc KeyPressActivationOff*(this: var vtkInteractorObserver) {.
    importcpp: "KeyPressActivationOff", header: "vtkInteractorObserver.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify which key press value to use to activate the interactor observer
  ##  (if key press activation is enabled). By default, the key press
  ##  activation value is 'i'. Note: once the SetInteractor() method is
  ##  invoked, changing the key press activation value will not affect the key
  ##  press until SetInteractor(NULL)/SetInteractor(iren) is called.
  ##
proc SetKeyPressActivationKeyPressActivationValue*(
    this: var vtkInteractorObserver; _arg: char) {.
    importcpp: "SetKeyPressActivationKeyPressActivationValue",
    header: "vtkInteractorObserver.h".}
## !!!Ignored construct:  virtual char GetPriorityPickingManagedKeyPressActivationKeyPressActivationValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << KeyPressActivationValue  of  << this -> KeyPressActivationValue ) ; return this -> KeyPressActivationValue ; } ;
## Error: expected ';'!!!

proc GetnameInteractorDefaultRenderer*(this: var vtkInteractorObserver): ptr vtkRenderer {.
    importcpp: "GetnameInteractorDefaultRenderer",
    header: "vtkInteractorObserver.h".}
proc SetDefaultRenderer*(this: var vtkInteractorObserver; a2: ptr vtkRenderer) {.
    importcpp: "SetDefaultRenderer", header: "vtkInteractorObserver.h".}
proc GetnameInteractorDefaultRendererCurrentRenderer*(
    this: var vtkInteractorObserver): ptr vtkRenderer {.
    importcpp: "GetnameInteractorDefaultRendererCurrentRenderer",
    header: "vtkInteractorObserver.h".}
proc SetCurrentRenderer*(this: var vtkInteractorObserver; a2: ptr vtkRenderer) {.
    importcpp: "SetCurrentRenderer", header: "vtkInteractorObserver.h".}
proc OnChar*(this: var vtkInteractorObserver) {.importcpp: "OnChar",
    header: "vtkInteractorObserver.h".}
proc ComputeDisplayToWorld*(ren: ptr vtkRenderer; x: cdouble; y: cdouble; z: cdouble;
                           worldPt: array[4, cdouble]) {.
    importcpp: "vtkInteractorObserver::ComputeDisplayToWorld(@)",
    header: "vtkInteractorObserver.h".}
proc ComputeWorldToDisplay*(ren: ptr vtkRenderer; x: cdouble; y: cdouble; z: cdouble;
                           displayPt: array[3, cdouble]) {.
    importcpp: "vtkInteractorObserver::ComputeWorldToDisplay(@)",
    header: "vtkInteractorObserver.h".}
proc GrabFocus*(this: var vtkInteractorObserver; mouseEvents: ptr vtkCommand;
               keypressEvents: ptr vtkCommand = nil) {.importcpp: "GrabFocus",
    header: "vtkInteractorObserver.h".}
proc ReleaseFocus*(this: var vtkInteractorObserver) {.importcpp: "ReleaseFocus",
    header: "vtkInteractorObserver.h".}