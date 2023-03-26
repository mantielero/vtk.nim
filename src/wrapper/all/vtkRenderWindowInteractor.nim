## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRenderWindowInteractor.h
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
##  @class   vtkRenderWindowInteractor
##  @brief   platform-independent render window
##  interaction including picking and frame rate control.
##
##
##  vtkRenderWindowInteractor provides a platform-independent interaction
##  mechanism for mouse/key/time events. It serves as a base class for
##  platform-dependent implementations that handle routing of mouse/key/timer
##  messages to vtkInteractorObserver and its subclasses. vtkRenderWindowInteractor
##  also provides controls for picking, rendering frame rate, and headlights.
##
##  vtkRenderWindowInteractor has changed from previous implementations and
##  now serves only as a shell to hold user preferences and route messages to
##  vtkInteractorStyle. Callbacks are available for many events.  Platform
##  specific subclasses should provide methods for manipulating timers,
##  TerminateApp, and an event loop if required via
##  Initialize/Start/Enable/Disable.
##
##  @warning
##  vtkRenderWindowInteractor routes events through VTK's command/observer
##  design pattern. That is, when vtkRenderWindowInteractor (actually, one of
##  its subclasses) sees a platform-dependent event, it translates this into
##  a VTK event using the InvokeEvent() method. Then any vtkInteractorObservers
##  registered for that event are expected to respond as appropriate.
##
##  @sa
##  vtkInteractorObserver
##

import
  vtkCommand, vtkObject, vtkRenderingCoreModule, vtkSmartPointer

discard "forward decl of vtkTimerIdMap"
const
  VTKI_TIMER_FIRST* = 0
  VTKI_TIMER_UPDATE* = 1

##  maximum pointers active at once
##  for example in multitouch

const
  VTKI_MAX_POINTERS* = 5

discard "forward decl of vtkAbstractPicker"
discard "forward decl of vtkAbstractPropPicker"
discard "forward decl of vtkAssemblyPath"
discard "forward decl of vtkHardwareWindow"
discard "forward decl of vtkInteractorObserver"
discard "forward decl of vtkRenderWindow"
discard "forward decl of vtkRenderer"
discard "forward decl of vtkObserverMediator"
discard "forward decl of vtkInteractorEventRecorder"
discard "forward decl of vtkPickingManager"
type
  vtkRenderWindowInteractor* {.importcpp: "vtkRenderWindowInteractor",
                              header: "vtkRenderWindowInteractor.h", bycopy.} = object of vtkObject
    vtkRenderWindowInteractor* {.importc: "vtkRenderWindowInteractor".}: VTK_NEWINSTANCE
    ##  Used as a helper object to pick instances of vtkProp
    ##  is the event loop done running
    ## *
    ##  Create default pickingManager. Used to create one when none is specified.
    ##  Default is an instance of vtkPickingManager.
    ##
    ##  Event information
    ##  control the fly to
    ## *
    ##  These methods allow the interactor to control which events are
    ##  processed.  When the GrabFocus() method is called, then only events that
    ##  the supplied vtkCommands have registered are invoked. (This method is
    ##  typically used by widgets, i.e., subclasses of vtkInteractorObserver, to
    ##  grab events once an event sequence begins.) Note that the friend
    ##  declaration is done here to avoid doing so in the superclass vtkObject.
    ##
    ##  Timer related members
    ##  An internal, PIMPLd map of timers and associated attributes
    ##  in milliseconds
    ## /@{
    ## *
    ##  Internal methods for creating and destroying timers that must be
    ##  implemented by subclasses. InternalCreateTimer() returns a
    ##  platform-specific timerId and InternalDestroyTimer() returns
    ##  non-zero value on success.
    ##
    ## *
    ##  Run the event loop (does not return until TerminateApp is called).
    ##
    ##  3DConnexion device.
    ##  when recognizing gestures VTK will take multitouch events
    ##  if it receives them and convert them to gestures


proc New*(): ptr vtkRenderWindowInteractor {.
    importcpp: "vtkRenderWindowInteractor::New(@)",
    header: "vtkRenderWindowInteractor.h".}
type
  vtkRenderWindowInteractorSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkRenderWindowInteractor::IsTypeOf(@)",
    header: "vtkRenderWindowInteractor.h".}
proc IsA*(this: var vtkRenderWindowInteractor; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkRenderWindowInteractor.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkRenderWindowInteractor {.
    importcpp: "vtkRenderWindowInteractor::SafeDownCast(@)",
    header: "vtkRenderWindowInteractor.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkRenderWindowInteractor :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRenderWindowInteractor :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRenderWindowInteractor :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkRenderWindowInteractor; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkRenderWindowInteractor.h".}
proc Initialize*(this: var vtkRenderWindowInteractor) {.importcpp: "Initialize",
    header: "vtkRenderWindowInteractor.h".}
proc ReInitialize*(this: var vtkRenderWindowInteractor) {.importcpp: "ReInitialize",
    header: "vtkRenderWindowInteractor.h".}
proc UnRegister*(this: var vtkRenderWindowInteractor; o: ptr vtkObjectBase) {.
    importcpp: "UnRegister", header: "vtkRenderWindowInteractor.h".}
proc Start*(this: var vtkRenderWindowInteractor) {.importcpp: "Start",
    header: "vtkRenderWindowInteractor.h".}
proc ProcessEvents*(this: var vtkRenderWindowInteractor) {.
    importcpp: "ProcessEvents", header: "vtkRenderWindowInteractor.h".}
## !!!Ignored construct:  *
##  Is the interactor loop done
##  virtual bool GetDoneDone ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Done  of  << this -> Done ) ; return this -> Done ; } ;
## Error: expected ';'!!!

proc SetDone*(this: var vtkRenderWindowInteractor; _arg: bool) {.importcpp: "SetDone",
    header: "vtkRenderWindowInteractor.h".}
  ## *
  ##  Enable/Disable interactions.  By default interactors are enabled when
  ##  initialized.  Initialize() must be called prior to enabling/disabling
  ##  interaction. These methods are used when a window/widget is being
  ##  shared by multiple renderers and interactors.  This allows a "modal"
  ##  display where one interactor is active when its data is to be displayed
  ##  and all other interactors associated with the widget are disabled
  ##  when their data is not displayed.
  ##
proc Enable*(this: var vtkRenderWindowInteractor) {.importcpp: "Enable",
    header: "vtkRenderWindowInteractor.h".}
proc Disable*(this: var vtkRenderWindowInteractor) {.importcpp: "Disable",
    header: "vtkRenderWindowInteractor.h".}
## !!!Ignored construct:  virtual int GetDoneDoneEnabled ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Enabled  of  << this -> Enabled ) ; return this -> Enabled ; } ;
## Error: expected ';'!!!

proc EnableRenderOn*(this: var vtkRenderWindowInteractor) {.
    importcpp: "EnableRenderOn", header: "vtkRenderWindowInteractor.h".}
proc EnableRenderOff*(this: var vtkRenderWindowInteractor) {.
    importcpp: "EnableRenderOff", header: "vtkRenderWindowInteractor.h".}
proc SetDoneEnableRender*(this: var vtkRenderWindowInteractor; _arg: bool) {.
    importcpp: "SetDoneEnableRender", header: "vtkRenderWindowInteractor.h".}
## !!!Ignored construct:  virtual bool GetDoneDoneEnabledEnableRender ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EnableRender  of  << this -> EnableRender ) ; return this -> EnableRender ; } ;
## Error: expected ';'!!!

proc SetRenderWindow*(this: var vtkRenderWindowInteractor; aren: ptr vtkRenderWindow) {.
    importcpp: "SetRenderWindow", header: "vtkRenderWindowInteractor.h".}
proc GetnameRenderWindow*(this: var vtkRenderWindowInteractor): ptr vtkRenderWindow {.
    importcpp: "GetnameRenderWindow", header: "vtkRenderWindowInteractor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the hardware window being controlled by this object.
  ##  For opengl the hardware window is not used as the opengl
  ##  subclasses of RenderWindow provide the functionality.
  ##
proc SetHardwareWindow*(this: var vtkRenderWindowInteractor;
                       aren: ptr vtkHardwareWindow) {.
    importcpp: "SetHardwareWindow", header: "vtkRenderWindowInteractor.h".}
proc GetnameRenderWindowHardwareWindow*(this: var vtkRenderWindowInteractor): ptr vtkHardwareWindow {.
    importcpp: "GetnameRenderWindowHardwareWindow",
    header: "vtkRenderWindowInteractor.h".}
  ## /@}
  ## *
  ##  Event loop notification member for window size change.
  ##  Window size is measured in pixels.
  ##
  ##  If the size has changed, this method will fire
  ##  vtkCommand::WindowResizeEvent.
  ##
proc UpdateSize*(this: var vtkRenderWindowInteractor; x: cint; y: cint) {.
    importcpp: "UpdateSize", header: "vtkRenderWindowInteractor.h".}
proc CreateTimer*(this: var vtkRenderWindowInteractor; timerType: cint): cint {.
    importcpp: "CreateTimer", header: "vtkRenderWindowInteractor.h".}
proc DestroyTimer*(this: var vtkRenderWindowInteractor): cint {.
    importcpp: "DestroyTimer", header: "vtkRenderWindowInteractor.h".}
proc CreateRepeatingTimer*(this: var vtkRenderWindowInteractor; duration: culong): cint {.
    importcpp: "CreateRepeatingTimer", header: "vtkRenderWindowInteractor.h".}
proc CreateOneShotTimer*(this: var vtkRenderWindowInteractor; duration: culong): cint {.
    importcpp: "CreateOneShotTimer", header: "vtkRenderWindowInteractor.h".}
proc IsOneShotTimer*(this: var vtkRenderWindowInteractor; timerId: cint): cint {.
    importcpp: "IsOneShotTimer", header: "vtkRenderWindowInteractor.h".}
proc GetTimerDuration*(this: var vtkRenderWindowInteractor; timerId: cint): culong {.
    importcpp: "GetTimerDuration", header: "vtkRenderWindowInteractor.h".}
proc ResetTimer*(this: var vtkRenderWindowInteractor; timerId: cint): cint {.
    importcpp: "ResetTimer", header: "vtkRenderWindowInteractor.h".}
proc DestroyTimer*(this: var vtkRenderWindowInteractor; timerId: cint): cint {.
    importcpp: "DestroyTimer", header: "vtkRenderWindowInteractor.h".}
proc GetVTKTimerId*(this: var vtkRenderWindowInteractor; platformTimerId: cint): cint {.
    importcpp: "GetVTKTimerId", header: "vtkRenderWindowInteractor.h".}
const
  vtkRenderWindowInteractorOneShotTimer* = 1
  vtkRenderWindowInteractorRepeatingTimer* = 2

proc SetTimerDuration*(this: var vtkRenderWindowInteractor; _arg: culong) {.
    importcpp: "SetTimerDuration", header: "vtkRenderWindowInteractor.h".}
proc GetTimerDurationMinValue*(this: var vtkRenderWindowInteractor): culong {.
    importcpp: "GetTimerDurationMinValue", header: "vtkRenderWindowInteractor.h".}
proc GetTimerDurationMaxValue*(this: var vtkRenderWindowInteractor): culong {.
    importcpp: "GetTimerDurationMaxValue", header: "vtkRenderWindowInteractor.h".}
## !!!Ignored construct:  virtual unsigned long GetDoneDoneEnabledEnableRenderTimerDuration ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TimerDuration  of  << this -> TimerDuration ) ; return this -> TimerDuration ; } ;
## Error: expected ';'!!!

proc SetDoneEnableRenderTimerEventId*(this: var vtkRenderWindowInteractor;
                                     _arg: cint) {.
    importcpp: "SetDoneEnableRenderTimerEventId",
    header: "vtkRenderWindowInteractor.h".}
## !!!Ignored construct:  virtual int GetDoneDoneEnabledEnableRenderTimerDurationTimerEventId ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TimerEventId  of  << this -> TimerEventId ) ; return this -> TimerEventId ; } ;
## Error: expected ';'!!!

proc SetDoneEnableRenderTimerEventIdTimerEventType*(
    this: var vtkRenderWindowInteractor; _arg: cint) {.
    importcpp: "SetDoneEnableRenderTimerEventIdTimerEventType",
    header: "vtkRenderWindowInteractor.h".}
## !!!Ignored construct:  virtual int GetDoneDoneEnabledEnableRenderTimerDurationTimerEventIdTimerEventType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TimerEventType  of  << this -> TimerEventType ) ; return this -> TimerEventType ; } ;
## Error: expected ';'!!!

proc SetDoneEnableRenderTimerEventIdTimerEventTypeTimerEventDuration*(
    this: var vtkRenderWindowInteractor; _arg: cint) {.importcpp: "SetDoneEnableRenderTimerEventIdTimerEventTypeTimerEventDuration",
    header: "vtkRenderWindowInteractor.h".}
## !!!Ignored construct:  virtual int GetDoneDoneEnabledEnableRenderTimerDurationTimerEventIdTimerEventTypeTimerEventDuration ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TimerEventDuration  of  << this -> TimerEventDuration ) ; return this -> TimerEventDuration ; } ;
## Error: expected ';'!!!

proc SetDoneEnableRenderTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformId*(
    this: var vtkRenderWindowInteractor; _arg: cint) {.importcpp: "SetDoneEnableRenderTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformId",
    header: "vtkRenderWindowInteractor.h".}
## !!!Ignored construct:  virtual int GetDoneDoneEnabledEnableRenderTimerDurationTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformId ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TimerEventPlatformId  of  << this -> TimerEventPlatformId ) ; return this -> TimerEventPlatformId ; } ;
## Error: expected ';'!!!

proc TerminateApp*(this: var vtkRenderWindowInteractor) {.importcpp: "TerminateApp",
    header: "vtkRenderWindowInteractor.h".}
proc SetInteractorStyle*(this: var vtkRenderWindowInteractor;
                        a2: ptr vtkInteractorObserver) {.
    importcpp: "SetInteractorStyle", header: "vtkRenderWindowInteractor.h".}
proc GetInteractorStyle*(this: var vtkRenderWindowInteractor): ptr vtkInteractorObserver {.
    importcpp: "GetInteractorStyle", header: "vtkRenderWindowInteractor.h".}
proc SetDoneEnableRenderTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformIdLightFollowCamera*(
    this: var vtkRenderWindowInteractor; _arg: vtkTypeBool) {.importcpp: "SetDoneEnableRenderTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformIdLightFollowCamera",
    header: "vtkRenderWindowInteractor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetDoneDoneEnabledEnableRenderTimerDurationTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformIdLightFollowCamera ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LightFollowCamera  of  << this -> LightFollowCamera ) ; return this -> LightFollowCamera ; } ;
## Error: expected ';'!!!

proc LightFollowCameraOn*(this: var vtkRenderWindowInteractor) {.
    importcpp: "LightFollowCameraOn", header: "vtkRenderWindowInteractor.h".}
proc LightFollowCameraOff*(this: var vtkRenderWindowInteractor) {.
    importcpp: "LightFollowCameraOff", header: "vtkRenderWindowInteractor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the desired update rate. This is used by vtkLODActor's to tell
  ##  them how quickly they need to render.  This update is in effect only
  ##  when the camera is being rotated, or zoomed.  When the interactor is
  ##  still, the StillUpdateRate is used instead.
  ##  The default is 15.
  ##
proc SetTimerDurationDesiredUpdateRate*(this: var vtkRenderWindowInteractor;
                                       _arg: cdouble) {.
    importcpp: "SetTimerDurationDesiredUpdateRate",
    header: "vtkRenderWindowInteractor.h".}
proc GetTimerDurationMinValueDesiredUpdateRateMinValue*(
    this: var vtkRenderWindowInteractor): cdouble {.
    importcpp: "GetTimerDurationMinValueDesiredUpdateRateMinValue",
    header: "vtkRenderWindowInteractor.h".}
proc GetTimerDurationMaxValueDesiredUpdateRateMaxValue*(
    this: var vtkRenderWindowInteractor): cdouble {.
    importcpp: "GetTimerDurationMaxValueDesiredUpdateRateMaxValue",
    header: "vtkRenderWindowInteractor.h".}
## !!!Ignored construct:  virtual double GetDoneDoneEnabledEnableRenderTimerDurationTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformIdLightFollowCameraDesiredUpdateRate ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DesiredUpdateRate  of  << this -> DesiredUpdateRate ) ; return this -> DesiredUpdateRate ; } ;
## Error: expected ';'!!!

proc SetTimerDurationDesiredUpdateRateStillUpdateRate*(
    this: var vtkRenderWindowInteractor; _arg: cdouble) {.
    importcpp: "SetTimerDurationDesiredUpdateRateStillUpdateRate",
    header: "vtkRenderWindowInteractor.h".}
proc GetTimerDurationMinValueDesiredUpdateRateMinValueStillUpdateRateMinValue*(
    this: var vtkRenderWindowInteractor): cdouble {.importcpp: "GetTimerDurationMinValueDesiredUpdateRateMinValueStillUpdateRateMinValue",
    header: "vtkRenderWindowInteractor.h".}
proc GetTimerDurationMaxValueDesiredUpdateRateMaxValueStillUpdateRateMaxValue*(
    this: var vtkRenderWindowInteractor): cdouble {.importcpp: "GetTimerDurationMaxValueDesiredUpdateRateMaxValueStillUpdateRateMaxValue",
    header: "vtkRenderWindowInteractor.h".}
## !!!Ignored construct:  virtual double GetDoneDoneEnabledEnableRenderTimerDurationTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformIdLightFollowCameraDesiredUpdateRateStillUpdateRate ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << StillUpdateRate  of  << this -> StillUpdateRate ) ; return this -> StillUpdateRate ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  See whether interactor has been initialized yet.
##  Default is 0.
##  virtual int GetDoneDoneEnabledEnableRenderTimerDurationTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformIdLightFollowCameraDesiredUpdateRateStillUpdateRateInitializedInitialized ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Initialized  of  << this -> Initialized ) ; return this -> Initialized ; } ;
## Error: expected ';'!!!

proc SetPicker*(this: var vtkRenderWindowInteractor; a2: ptr vtkAbstractPicker) {.
    importcpp: "SetPicker", header: "vtkRenderWindowInteractor.h".}
proc GetnameRenderWindowHardwareWindowPicker*(this: var vtkRenderWindowInteractor): ptr vtkAbstractPicker {.
    importcpp: "GetnameRenderWindowHardwareWindowPicker",
    header: "vtkRenderWindowInteractor.h".}
  ## /@}
  ## *
  ##  Create default picker. Used to create one when none is specified.
  ##  Default is an instance of vtkPropPicker.
  ##
proc CreateDefaultPicker*(this: var vtkRenderWindowInteractor): ptr vtkAbstractPropPicker {.
    importcpp: "CreateDefaultPicker", header: "vtkRenderWindowInteractor.h".}
proc SetPickingManager*(this: var vtkRenderWindowInteractor;
                       a2: ptr vtkPickingManager) {.importcpp: "SetPickingManager",
    header: "vtkRenderWindowInteractor.h".}
proc GetnameRenderWindowHardwareWindowPickerPickingManager*(
    this: var vtkRenderWindowInteractor): ptr vtkPickingManager {.
    importcpp: "GetnameRenderWindowHardwareWindowPickerPickingManager",
    header: "vtkRenderWindowInteractor.h".}
  ## /@}
  ## /@{
  ## *
  ##  These methods correspond to the Exit, User and Pick
  ##  callbacks. They allow for the Style to invoke them.
  ##
proc ExitCallback*(this: var vtkRenderWindowInteractor) {.importcpp: "ExitCallback",
    header: "vtkRenderWindowInteractor.h".}
proc UserCallback*(this: var vtkRenderWindowInteractor) {.importcpp: "UserCallback",
    header: "vtkRenderWindowInteractor.h".}
proc StartPickCallback*(this: var vtkRenderWindowInteractor) {.
    importcpp: "StartPickCallback", header: "vtkRenderWindowInteractor.h".}
proc EndPickCallback*(this: var vtkRenderWindowInteractor) {.
    importcpp: "EndPickCallback", header: "vtkRenderWindowInteractor.h".}
proc GetMousePosition*(this: var vtkRenderWindowInteractor; x: ptr cint; y: ptr cint) {.
    importcpp: "GetMousePosition", header: "vtkRenderWindowInteractor.h".}
proc HideCursor*(this: var vtkRenderWindowInteractor) {.importcpp: "HideCursor",
    header: "vtkRenderWindowInteractor.h".}
proc ShowCursor*(this: var vtkRenderWindowInteractor) {.importcpp: "ShowCursor",
    header: "vtkRenderWindowInteractor.h".}
proc Render*(this: var vtkRenderWindowInteractor) {.importcpp: "Render",
    header: "vtkRenderWindowInteractor.h".}
proc FlyTo*(this: var vtkRenderWindowInteractor; ren: ptr vtkRenderer; x: cdouble;
           y: cdouble; z: cdouble) {.importcpp: "FlyTo",
                                 header: "vtkRenderWindowInteractor.h".}
proc FlyTo*(this: var vtkRenderWindowInteractor; ren: ptr vtkRenderer; x: ptr cdouble) {.
    importcpp: "FlyTo", header: "vtkRenderWindowInteractor.h".}
proc FlyToImage*(this: var vtkRenderWindowInteractor; ren: ptr vtkRenderer; x: cdouble;
                y: cdouble) {.importcpp: "FlyToImage",
                            header: "vtkRenderWindowInteractor.h".}
proc FlyToImage*(this: var vtkRenderWindowInteractor; ren: ptr vtkRenderer;
                x: ptr cdouble) {.importcpp: "FlyToImage",
                               header: "vtkRenderWindowInteractor.h".}
proc SetTimerDurationDesiredUpdateRateStillUpdateRateNumberOfFlyFrames*(
    this: var vtkRenderWindowInteractor; _arg: cint) {.importcpp: "SetTimerDurationDesiredUpdateRateStillUpdateRateNumberOfFlyFrames",
    header: "vtkRenderWindowInteractor.h".}
proc GetTimerDurationMinValueDesiredUpdateRateMinValueStillUpdateRateMinValueNumberOfFlyFramesMinValue*(
    this: var vtkRenderWindowInteractor): cint {.importcpp: "GetTimerDurationMinValueDesiredUpdateRateMinValueStillUpdateRateMinValueNumberOfFlyFramesMinValue",
    header: "vtkRenderWindowInteractor.h".}
proc GetTimerDurationMaxValueDesiredUpdateRateMaxValueStillUpdateRateMaxValueNumberOfFlyFramesMaxValue*(
    this: var vtkRenderWindowInteractor): cint {.importcpp: "GetTimerDurationMaxValueDesiredUpdateRateMaxValueStillUpdateRateMaxValueNumberOfFlyFramesMaxValue",
    header: "vtkRenderWindowInteractor.h".}
## !!!Ignored construct:  virtual int GetDoneDoneEnabledEnableRenderTimerDurationTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformIdLightFollowCameraDesiredUpdateRateStillUpdateRateInitializedInitializedNumberOfFlyFrames ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfFlyFrames  of  << this -> NumberOfFlyFrames ) ; return this -> NumberOfFlyFrames ; } ;
## Error: expected ';'!!!

proc SetDoneEnableRenderTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformIdLightFollowCameraDolly*(
    this: var vtkRenderWindowInteractor; _arg: cdouble) {.importcpp: "SetDoneEnableRenderTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformIdLightFollowCameraDolly",
    header: "vtkRenderWindowInteractor.h".}
## !!!Ignored construct:  virtual double GetDoneDoneEnabledEnableRenderTimerDurationTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformIdLightFollowCameraDesiredUpdateRateStillUpdateRateInitializedInitializedNumberOfFlyFramesDolly ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Dolly  of  << this -> Dolly ) ; return this -> Dolly ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Set/Get information about the current event.
##  The current x,y position is in the EventPosition, and the previous
##  event position is in LastEventPosition, updated automatically each
##  time EventPosition is set using its Set() method. Mouse positions
##  are measured in pixels.
##  The other information is about key board input.
##  virtual int * GetEventPositionEventPosition ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << EventPosition  pointer  << this -> EventPosition ) ; return this -> EventPosition ; } VTK_WRAPEXCLUDE virtual void GetEventPositionEventPosition ( int & _arg1 , int & _arg2 ) { _arg1 = this -> EventPosition [ 0 ] ; _arg2 = this -> EventPosition [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << EventPosition  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetEventPositionEventPosition ( int _arg [ 2 ] ) { this -> GetEventPositionEventPosition ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual int * GetEventPositionEventPositionLastEventPosition ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << LastEventPosition  pointer  << this -> LastEventPosition ) ; return this -> LastEventPosition ; } VTK_WRAPEXCLUDE virtual void GetEventPositionEventPositionLastEventPosition ( int & _arg1 , int & _arg2 ) { _arg1 = this -> LastEventPosition [ 0 ] ; _arg2 = this -> LastEventPosition [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << LastEventPosition  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetEventPositionEventPositionLastEventPosition ( int _arg [ 2 ] ) { this -> GetEventPositionEventPositionLastEventPosition ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetLastEventPosition*(this: var vtkRenderWindowInteractor; _arg1: cint;
                          _arg2: cint) {.importcpp: "SetLastEventPosition",
                                       header: "vtkRenderWindowInteractor.h".}
proc SetLastEventPosition*(this: var vtkRenderWindowInteractor; _arg: array[2, cint]) {.
    importcpp: "SetLastEventPosition", header: "vtkRenderWindowInteractor.h".}
proc SetEventPosition*(this: var vtkRenderWindowInteractor; x: cint; y: cint) {.
    importcpp: "SetEventPosition", header: "vtkRenderWindowInteractor.h".}
proc SetEventPosition*(this: var vtkRenderWindowInteractor; pos: array[2, cint]) {.
    importcpp: "SetEventPosition", header: "vtkRenderWindowInteractor.h".}
proc SetEventPositionFlipY*(this: var vtkRenderWindowInteractor; x: cint; y: cint) {.
    importcpp: "SetEventPositionFlipY", header: "vtkRenderWindowInteractor.h".}
proc SetEventPositionFlipY*(this: var vtkRenderWindowInteractor; pos: array[2, cint]) {.
    importcpp: "SetEventPositionFlipY", header: "vtkRenderWindowInteractor.h".}
proc GetEventPositions*(this: var vtkRenderWindowInteractor; pointerIndex: cint): ptr cint {.
    importcpp: "GetEventPositions", header: "vtkRenderWindowInteractor.h".}
proc GetLastEventPositions*(this: var vtkRenderWindowInteractor; pointerIndex: cint): ptr cint {.
    importcpp: "GetLastEventPositions", header: "vtkRenderWindowInteractor.h".}
proc SetEventPosition*(this: var vtkRenderWindowInteractor; x: cint; y: cint;
                      pointerIndex: cint) {.importcpp: "SetEventPosition",
    header: "vtkRenderWindowInteractor.h".}
proc SetEventPosition*(this: var vtkRenderWindowInteractor; pos: array[2, cint];
                      pointerIndex: cint) {.importcpp: "SetEventPosition",
    header: "vtkRenderWindowInteractor.h".}
proc SetEventPositionFlipY*(this: var vtkRenderWindowInteractor; x: cint; y: cint;
                           pointerIndex: cint) {.
    importcpp: "SetEventPositionFlipY", header: "vtkRenderWindowInteractor.h".}
proc SetEventPositionFlipY*(this: var vtkRenderWindowInteractor;
                           pos: array[2, cint]; pointerIndex: cint) {.
    importcpp: "SetEventPositionFlipY", header: "vtkRenderWindowInteractor.h".}
proc SetDoneEnableRenderTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformIdLightFollowCameraDollyAltKey*(
    this: var vtkRenderWindowInteractor; _arg: cint) {.importcpp: "SetDoneEnableRenderTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformIdLightFollowCameraDollyAltKey",
    header: "vtkRenderWindowInteractor.h".}
## !!!Ignored construct:  virtual int GetDoneDoneEnabledEnableRenderTimerDurationTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformIdLightFollowCameraDesiredUpdateRateStillUpdateRateInitializedInitializedNumberOfFlyFramesDollyAltKey ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AltKey  of  << this -> AltKey ) ; return this -> AltKey ; } ;
## Error: expected ';'!!!

proc SetDoneEnableRenderTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformIdLightFollowCameraDollyAltKeyControlKey*(
    this: var vtkRenderWindowInteractor; _arg: cint) {.importcpp: "SetDoneEnableRenderTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformIdLightFollowCameraDollyAltKeyControlKey",
    header: "vtkRenderWindowInteractor.h".}
## !!!Ignored construct:  virtual int GetDoneDoneEnabledEnableRenderTimerDurationTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformIdLightFollowCameraDesiredUpdateRateStillUpdateRateInitializedInitializedNumberOfFlyFramesDollyAltKeyControlKey ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ControlKey  of  << this -> ControlKey ) ; return this -> ControlKey ; } ;
## Error: expected ';'!!!

proc SetDoneEnableRenderTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformIdLightFollowCameraDollyAltKeyControlKeyShiftKey*(
    this: var vtkRenderWindowInteractor; _arg: cint) {.importcpp: "SetDoneEnableRenderTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformIdLightFollowCameraDollyAltKeyControlKeyShiftKey",
    header: "vtkRenderWindowInteractor.h".}
## !!!Ignored construct:  virtual int GetDoneDoneEnabledEnableRenderTimerDurationTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformIdLightFollowCameraDesiredUpdateRateStillUpdateRateInitializedInitializedNumberOfFlyFramesDollyAltKeyControlKeyShiftKey ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ShiftKey  of  << this -> ShiftKey ) ; return this -> ShiftKey ; } ;
## Error: expected ';'!!!

proc SetDoneEnableRenderTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformIdLightFollowCameraDollyAltKeyControlKeyShiftKeyKeyCode*(
    this: var vtkRenderWindowInteractor; _arg: char) {.importcpp: "SetDoneEnableRenderTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformIdLightFollowCameraDollyAltKeyControlKeyShiftKeyKeyCode",
    header: "vtkRenderWindowInteractor.h".}
## !!!Ignored construct:  virtual char GetDoneDoneEnabledEnableRenderTimerDurationTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformIdLightFollowCameraDesiredUpdateRateStillUpdateRateInitializedInitializedNumberOfFlyFramesDollyAltKeyControlKeyShiftKeyKeyCode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << KeyCode  of  << this -> KeyCode ) ; return this -> KeyCode ; } ;
## Error: expected ';'!!!

proc SetDoneEnableRenderTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformIdLightFollowCameraDollyAltKeyControlKeyShiftKeyKeyCodeRepeatCount*(
    this: var vtkRenderWindowInteractor; _arg: cint) {.importcpp: "SetDoneEnableRenderTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformIdLightFollowCameraDollyAltKeyControlKeyShiftKeyKeyCodeRepeatCount",
    header: "vtkRenderWindowInteractor.h".}
## !!!Ignored construct:  virtual int GetDoneDoneEnabledEnableRenderTimerDurationTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformIdLightFollowCameraDesiredUpdateRateStillUpdateRateInitializedInitializedNumberOfFlyFramesDollyAltKeyControlKeyShiftKeyKeyCodeRepeatCount ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RepeatCount  of  << this -> RepeatCount ) ; return this -> RepeatCount ; } ;
## Error: expected ';'!!!

proc SetKeySym*(this: var vtkRenderWindowInteractor; _arg: cstring) {.
    importcpp: "SetKeySym", header: "vtkRenderWindowInteractor.h".}
proc GetKeySym*(this: var vtkRenderWindowInteractor): cstring {.
    importcpp: "GetKeySym", header: "vtkRenderWindowInteractor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get the index of the most recent pointer to have an event
  ##
proc SetDoneEnableRenderTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformIdLightFollowCameraDollyAltKeyControlKeyShiftKeyKeyCodeRepeatCountPointerIndex*(
    this: var vtkRenderWindowInteractor; _arg: cint) {.importcpp: "SetDoneEnableRenderTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformIdLightFollowCameraDollyAltKeyControlKeyShiftKeyKeyCodeRepeatCountPointerIndex",
    header: "vtkRenderWindowInteractor.h".}
## !!!Ignored construct:  virtual int GetDoneDoneEnabledEnableRenderTimerDurationTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformIdLightFollowCameraDesiredUpdateRateStillUpdateRateInitializedInitializedNumberOfFlyFramesDollyAltKeyControlKeyShiftKeyKeyCodeRepeatCountPointerIndex ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PointerIndex  of  << this -> PointerIndex ) ; return this -> PointerIndex ; } ;
## Error: expected ';'!!!

proc SetRotation*(this: var vtkRenderWindowInteractor; rotation: cdouble) {.
    importcpp: "SetRotation", header: "vtkRenderWindowInteractor.h".}
## !!!Ignored construct:  virtual double GetDoneDoneEnabledEnableRenderTimerDurationTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformIdLightFollowCameraDesiredUpdateRateStillUpdateRateInitializedInitializedNumberOfFlyFramesDollyAltKeyControlKeyShiftKeyKeyCodeRepeatCountPointerIndexRotation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Rotation  of  << this -> Rotation ) ; return this -> Rotation ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual double GetDoneDoneEnabledEnableRenderTimerDurationTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformIdLightFollowCameraDesiredUpdateRateStillUpdateRateInitializedInitializedNumberOfFlyFramesDollyAltKeyControlKeyShiftKeyKeyCodeRepeatCountPointerIndexRotationLastRotation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LastRotation  of  << this -> LastRotation ) ; return this -> LastRotation ; } ;
## Error: expected ';'!!!

proc SetScale*(this: var vtkRenderWindowInteractor; scale: cdouble) {.
    importcpp: "SetScale", header: "vtkRenderWindowInteractor.h".}
## !!!Ignored construct:  virtual double GetDoneDoneEnabledEnableRenderTimerDurationTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformIdLightFollowCameraDesiredUpdateRateStillUpdateRateInitializedInitializedNumberOfFlyFramesDollyAltKeyControlKeyShiftKeyKeyCodeRepeatCountPointerIndexRotationLastRotationScale ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Scale  of  << this -> Scale ) ; return this -> Scale ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual double GetDoneDoneEnabledEnableRenderTimerDurationTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformIdLightFollowCameraDesiredUpdateRateStillUpdateRateInitializedInitializedNumberOfFlyFramesDollyAltKeyControlKeyShiftKeyKeyCodeRepeatCountPointerIndexRotationLastRotationScaleLastScale ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LastScale  of  << this -> LastScale ) ; return this -> LastScale ; } ;
## Error: expected ';'!!!

proc SetTranslation*(this: var vtkRenderWindowInteractor; val: array[2, cdouble]) {.
    importcpp: "SetTranslation", header: "vtkRenderWindowInteractor.h".}
## !!!Ignored construct:  virtual double * GetEventPositionEventPositionLastEventPositionTranslation ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Translation  pointer  << this -> Translation ) ; return this -> Translation ; } VTK_WRAPEXCLUDE virtual void GetEventPositionEventPositionLastEventPositionTranslation ( double & _arg1 , double & _arg2 ) { _arg1 = this -> Translation [ 0 ] ; _arg2 = this -> Translation [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Translation  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetEventPositionEventPositionLastEventPositionTranslation ( double _arg [ 2 ] ) { this -> GetEventPositionEventPositionLastEventPositionTranslation ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual double * GetEventPositionEventPositionLastEventPositionTranslationLastTranslation ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << LastTranslation  pointer  << this -> LastTranslation ) ; return this -> LastTranslation ; } VTK_WRAPEXCLUDE virtual void GetEventPositionEventPositionLastEventPositionTranslationLastTranslation ( double & _arg1 , double & _arg2 ) { _arg1 = this -> LastTranslation [ 0 ] ; _arg2 = this -> LastTranslation [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << LastTranslation  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetEventPositionEventPositionLastEventPositionTranslationLastTranslation ( double _arg [ 2 ] ) { this -> GetEventPositionEventPositionLastEventPositionTranslationLastTranslation ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetEventInformation*(this: var vtkRenderWindowInteractor; x: cint; y: cint;
                         ctrl: cint; shift: cint; keycode: char; repeatcount: cint;
                         keysym: cstring; pointerIndex: cint) {.
    importcpp: "SetEventInformation", header: "vtkRenderWindowInteractor.h".}
proc SetEventInformation*(this: var vtkRenderWindowInteractor; x: cint; y: cint;
                         ctrl: cint = 0; shift: cint = 0; keycode: char = 0;
                         repeatcount: cint = 0; keysym: cstring = nil) {.
    importcpp: "SetEventInformation", header: "vtkRenderWindowInteractor.h".}
proc SetEventInformationFlipY*(this: var vtkRenderWindowInteractor; x: cint; y: cint;
                              ctrl: cint; shift: cint; keycode: char;
                              repeatcount: cint; keysym: cstring; pointerIndex: cint) {.
    importcpp: "SetEventInformationFlipY", header: "vtkRenderWindowInteractor.h".}
proc SetEventInformationFlipY*(this: var vtkRenderWindowInteractor; x: cint; y: cint;
                              ctrl: cint = 0; shift: cint = 0; keycode: char = 0;
                              repeatcount: cint = 0; keysym: cstring = nil) {.
    importcpp: "SetEventInformationFlipY", header: "vtkRenderWindowInteractor.h".}
proc SetKeyEventInformation*(this: var vtkRenderWindowInteractor; ctrl: cint = 0;
                            shift: cint = 0; keycode: char = 0; repeatcount: cint = 0;
                            keysym: cstring = nil) {.
    importcpp: "SetKeyEventInformation", header: "vtkRenderWindowInteractor.h".}
proc SetLastEventPositionSize*(this: var vtkRenderWindowInteractor; _arg1: cint;
                              _arg2: cint) {.
    importcpp: "SetLastEventPositionSize", header: "vtkRenderWindowInteractor.h".}
proc SetLastEventPositionSize*(this: var vtkRenderWindowInteractor;
                              _arg: array[2, cint]) {.
    importcpp: "SetLastEventPositionSize", header: "vtkRenderWindowInteractor.h".}
## !!!Ignored construct:  virtual int * GetEventPositionEventPositionLastEventPositionTranslationLastTranslationSize ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Size  pointer  << this -> Size ) ; return this -> Size ; } VTK_WRAPEXCLUDE virtual void GetEventPositionEventPositionLastEventPositionTranslationLastTranslationSize ( int & _arg1 , int & _arg2 ) { _arg1 = this -> Size [ 0 ] ; _arg2 = this -> Size [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Size  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetEventPositionEventPositionLastEventPositionTranslationLastTranslationSize ( int _arg [ 2 ] ) { this -> GetEventPositionEventPositionLastEventPositionTranslationLastTranslationSize ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetLastEventPositionSizeEventSize*(this: var vtkRenderWindowInteractor;
                                       _arg1: cint; _arg2: cint) {.
    importcpp: "SetLastEventPositionSizeEventSize",
    header: "vtkRenderWindowInteractor.h".}
proc SetLastEventPositionSizeEventSize*(this: var vtkRenderWindowInteractor;
                                       _arg: array[2, cint]) {.
    importcpp: "SetLastEventPositionSizeEventSize",
    header: "vtkRenderWindowInteractor.h".}
## !!!Ignored construct:  virtual int * GetEventPositionEventPositionLastEventPositionTranslationLastTranslationSizeEventSize ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << EventSize  pointer  << this -> EventSize ) ; return this -> EventSize ; } VTK_WRAPEXCLUDE virtual void GetEventPositionEventPositionLastEventPositionTranslationLastTranslationSizeEventSize ( int & _arg1 , int & _arg2 ) { _arg1 = this -> EventSize [ 0 ] ; _arg2 = this -> EventSize [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << EventSize  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetEventPositionEventPositionLastEventPositionTranslationLastTranslationSizeEventSize ( int _arg [ 2 ] ) { this -> GetEventPositionEventPositionLastEventPositionTranslationLastTranslationSizeEventSize ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc FindPokedRenderer*(this: var vtkRenderWindowInteractor; a2: cint; a3: cint): ptr vtkRenderer {.
    importcpp: "FindPokedRenderer", header: "vtkRenderWindowInteractor.h".}
proc GetObserverMediator*(this: var vtkRenderWindowInteractor): ptr vtkObserverMediator {.
    importcpp: "GetObserverMediator", header: "vtkRenderWindowInteractor.h".}
proc SetDoneEnableRenderTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformIdLightFollowCameraDollyAltKeyControlKeyShiftKeyKeyCodeRepeatCountPointerIndexUseTDx*(
    this: var vtkRenderWindowInteractor; _arg: bool) {.importcpp: "SetDoneEnableRenderTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformIdLightFollowCameraDollyAltKeyControlKeyShiftKeyKeyCodeRepeatCountPointerIndexUseTDx",
    header: "vtkRenderWindowInteractor.h".}
## !!!Ignored construct:  virtual bool GetDoneDoneEnabledEnableRenderTimerDurationTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformIdLightFollowCameraDesiredUpdateRateStillUpdateRateInitializedInitializedNumberOfFlyFramesDollyAltKeyControlKeyShiftKeyKeyCodeRepeatCountPointerIndexRotationLastRotationScaleLastScaleUseTDx ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseTDx  of  << this -> UseTDx ) ; return this -> UseTDx ; } ;
## Error: expected ';'!!!

proc MouseMoveEvent*(this: var vtkRenderWindowInteractor) {.
    importcpp: "MouseMoveEvent", header: "vtkRenderWindowInteractor.h".}
proc RightButtonPressEvent*(this: var vtkRenderWindowInteractor) {.
    importcpp: "RightButtonPressEvent", header: "vtkRenderWindowInteractor.h".}
proc RightButtonReleaseEvent*(this: var vtkRenderWindowInteractor) {.
    importcpp: "RightButtonReleaseEvent", header: "vtkRenderWindowInteractor.h".}
proc LeftButtonPressEvent*(this: var vtkRenderWindowInteractor) {.
    importcpp: "LeftButtonPressEvent", header: "vtkRenderWindowInteractor.h".}
proc LeftButtonReleaseEvent*(this: var vtkRenderWindowInteractor) {.
    importcpp: "LeftButtonReleaseEvent", header: "vtkRenderWindowInteractor.h".}
proc MiddleButtonPressEvent*(this: var vtkRenderWindowInteractor) {.
    importcpp: "MiddleButtonPressEvent", header: "vtkRenderWindowInteractor.h".}
proc MiddleButtonReleaseEvent*(this: var vtkRenderWindowInteractor) {.
    importcpp: "MiddleButtonReleaseEvent", header: "vtkRenderWindowInteractor.h".}
proc MouseWheelForwardEvent*(this: var vtkRenderWindowInteractor) {.
    importcpp: "MouseWheelForwardEvent", header: "vtkRenderWindowInteractor.h".}
proc MouseWheelBackwardEvent*(this: var vtkRenderWindowInteractor) {.
    importcpp: "MouseWheelBackwardEvent", header: "vtkRenderWindowInteractor.h".}
proc MouseWheelLeftEvent*(this: var vtkRenderWindowInteractor) {.
    importcpp: "MouseWheelLeftEvent", header: "vtkRenderWindowInteractor.h".}
proc MouseWheelRightEvent*(this: var vtkRenderWindowInteractor) {.
    importcpp: "MouseWheelRightEvent", header: "vtkRenderWindowInteractor.h".}
proc ExposeEvent*(this: var vtkRenderWindowInteractor) {.importcpp: "ExposeEvent",
    header: "vtkRenderWindowInteractor.h".}
proc ConfigureEvent*(this: var vtkRenderWindowInteractor) {.
    importcpp: "ConfigureEvent", header: "vtkRenderWindowInteractor.h".}
proc EnterEvent*(this: var vtkRenderWindowInteractor) {.importcpp: "EnterEvent",
    header: "vtkRenderWindowInteractor.h".}
proc LeaveEvent*(this: var vtkRenderWindowInteractor) {.importcpp: "LeaveEvent",
    header: "vtkRenderWindowInteractor.h".}
proc KeyPressEvent*(this: var vtkRenderWindowInteractor) {.
    importcpp: "KeyPressEvent", header: "vtkRenderWindowInteractor.h".}
proc KeyReleaseEvent*(this: var vtkRenderWindowInteractor) {.
    importcpp: "KeyReleaseEvent", header: "vtkRenderWindowInteractor.h".}
proc CharEvent*(this: var vtkRenderWindowInteractor) {.importcpp: "CharEvent",
    header: "vtkRenderWindowInteractor.h".}
proc ExitEvent*(this: var vtkRenderWindowInteractor) {.importcpp: "ExitEvent",
    header: "vtkRenderWindowInteractor.h".}
proc FourthButtonPressEvent*(this: var vtkRenderWindowInteractor) {.
    importcpp: "FourthButtonPressEvent", header: "vtkRenderWindowInteractor.h".}
proc FourthButtonReleaseEvent*(this: var vtkRenderWindowInteractor) {.
    importcpp: "FourthButtonReleaseEvent", header: "vtkRenderWindowInteractor.h".}
proc FifthButtonPressEvent*(this: var vtkRenderWindowInteractor) {.
    importcpp: "FifthButtonPressEvent", header: "vtkRenderWindowInteractor.h".}
proc FifthButtonReleaseEvent*(this: var vtkRenderWindowInteractor) {.
    importcpp: "FifthButtonReleaseEvent", header: "vtkRenderWindowInteractor.h".}
proc StartPinchEvent*(this: var vtkRenderWindowInteractor) {.
    importcpp: "StartPinchEvent", header: "vtkRenderWindowInteractor.h".}
proc PinchEvent*(this: var vtkRenderWindowInteractor) {.importcpp: "PinchEvent",
    header: "vtkRenderWindowInteractor.h".}
proc EndPinchEvent*(this: var vtkRenderWindowInteractor) {.
    importcpp: "EndPinchEvent", header: "vtkRenderWindowInteractor.h".}
proc StartRotateEvent*(this: var vtkRenderWindowInteractor) {.
    importcpp: "StartRotateEvent", header: "vtkRenderWindowInteractor.h".}
proc RotateEvent*(this: var vtkRenderWindowInteractor) {.importcpp: "RotateEvent",
    header: "vtkRenderWindowInteractor.h".}
proc EndRotateEvent*(this: var vtkRenderWindowInteractor) {.
    importcpp: "EndRotateEvent", header: "vtkRenderWindowInteractor.h".}
proc StartPanEvent*(this: var vtkRenderWindowInteractor) {.
    importcpp: "StartPanEvent", header: "vtkRenderWindowInteractor.h".}
proc PanEvent*(this: var vtkRenderWindowInteractor) {.importcpp: "PanEvent",
    header: "vtkRenderWindowInteractor.h".}
proc EndPanEvent*(this: var vtkRenderWindowInteractor) {.importcpp: "EndPanEvent",
    header: "vtkRenderWindowInteractor.h".}
proc TapEvent*(this: var vtkRenderWindowInteractor) {.importcpp: "TapEvent",
    header: "vtkRenderWindowInteractor.h".}
proc LongTapEvent*(this: var vtkRenderWindowInteractor) {.importcpp: "LongTapEvent",
    header: "vtkRenderWindowInteractor.h".}
proc SwipeEvent*(this: var vtkRenderWindowInteractor) {.importcpp: "SwipeEvent",
    header: "vtkRenderWindowInteractor.h".}
proc SetDoneEnableRenderTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformIdLightFollowCameraDollyAltKeyControlKeyShiftKeyKeyCodeRepeatCountPointerIndexUseTDxRecognizeGestures*(
    this: var vtkRenderWindowInteractor; _arg: bool) {.importcpp: "SetDoneEnableRenderTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformIdLightFollowCameraDollyAltKeyControlKeyShiftKeyKeyCodeRepeatCountPointerIndexUseTDxRecognizeGestures",
    header: "vtkRenderWindowInteractor.h".}
## !!!Ignored construct:  virtual bool GetDoneDoneEnabledEnableRenderTimerDurationTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformIdLightFollowCameraDesiredUpdateRateStillUpdateRateInitializedInitializedNumberOfFlyFramesDollyAltKeyControlKeyShiftKeyKeyCodeRepeatCountPointerIndexRotationLastRotationScaleLastScaleUseTDxRecognizeGestures ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RecognizeGestures  of  << this -> RecognizeGestures ) ; return this -> RecognizeGestures ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  When handling gestures you can query this value to
##  determine how many pointers are down for the gesture
##  this is useful for pan gestures for example
##  virtual int GetDoneDoneEnabledEnableRenderTimerDurationTimerEventIdTimerEventTypeTimerEventDurationTimerEventPlatformIdLightFollowCameraDesiredUpdateRateStillUpdateRateInitializedInitializedNumberOfFlyFramesDollyAltKeyControlKeyShiftKeyKeyCodeRepeatCountPointerIndexRotationLastRotationScaleLastScaleUseTDxRecognizeGesturesPointersDownCountPointersDownCount ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PointersDownCount  of  << this -> PointersDownCount ) ; return this -> PointersDownCount ; } ;
## Error: expected ';'!!!

proc ClearContact*(this: var vtkRenderWindowInteractor; contactID: csize_t) {.
    importcpp: "ClearContact", header: "vtkRenderWindowInteractor.h".}
proc GetPointerIndexForContact*(this: var vtkRenderWindowInteractor;
                               contactID: csize_t): cint {.
    importcpp: "GetPointerIndexForContact", header: "vtkRenderWindowInteractor.h".}
proc GetPointerIndexForExistingContact*(this: var vtkRenderWindowInteractor;
                                       contactID: csize_t): cint {.
    importcpp: "GetPointerIndexForExistingContact",
    header: "vtkRenderWindowInteractor.h".}
proc IsPointerIndexSet*(this: var vtkRenderWindowInteractor; i: cint): bool {.
    importcpp: "IsPointerIndexSet", header: "vtkRenderWindowInteractor.h".}
proc ClearPointerIndex*(this: var vtkRenderWindowInteractor; i: cint) {.
    importcpp: "ClearPointerIndex", header: "vtkRenderWindowInteractor.h".}