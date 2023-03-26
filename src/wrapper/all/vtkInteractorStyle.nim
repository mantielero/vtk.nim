## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInteractorStyle.h
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
##  @class   vtkInteractorStyle
##  @brief   provide event-driven interface to the rendering window (defines trackball mode)
##
##  vtkInteractorStyle is a base class implementing the majority of motion
##  control routines and defines an event driven interface to support
##  vtkRenderWindowInteractor. vtkRenderWindowInteractor implements
##  platform dependent key/mouse routing and timer control, which forwards
##  events in a neutral form to vtkInteractorStyle.
##
##  vtkInteractorStyle implements the "joystick" style of interaction. That
##  is, holding down the mouse keys generates a stream of events that cause
##  continuous actions (e.g., rotate, translate, pan, zoom). (The class
##  vtkInteractorStyleTrackball implements a grab and move style.) The event
##  bindings for this class include the following:
##  - Keypress j / Keypress t: toggle between joystick (position sensitive) and
##  trackball (motion sensitive) styles. In joystick style, motion occurs
##  continuously as long as a mouse button is pressed. In trackball style,
##  motion occurs when the mouse button is pressed and the mouse pointer
##  moves.
##  - Keypress c / Keypress a: toggle between camera and actor modes. In
##  camera mode, mouse events affect the camera position and focal point. In
##  actor mode, mouse events affect the actor that is under the mouse pointer.
##  - Button 1: rotate the camera around its focal point (if camera mode) or
##  rotate the actor around its origin (if actor mode). The rotation is in the
##  direction defined from the center of the renderer's viewport towards
##  the mouse position. In joystick mode, the magnitude of the rotation is
##  determined by the distance the mouse is from the center of the render
##  window.
##  - Button 2: pan the camera (if camera mode) or translate the actor (if
##  actor mode). In joystick mode, the direction of pan or translation is
##  from the center of the viewport towards the mouse position. In trackball
##  mode, the direction of motion is the direction the mouse moves. (Note:
##  with 2-button mice, pan is defined as \<Shift\>-Button 1.)
##  - Button 3: zoom the camera (if camera mode) or scale the actor (if
##  actor mode). Zoom in/increase scale if the mouse position is in the top
##  half of the viewport; zoom out/decrease scale if the mouse position is in
##  the bottom half. In joystick mode, the amount of zoom is controlled by the
##  distance of the mouse pointer from the horizontal centerline of the
##  window.
##  - Keypress 3: toggle the render window into and out of stereo mode. By
##  default, red-blue stereo pairs are created. Some systems support Crystal
##  Eyes LCD stereo glasses; you have to invoke SetStereoTypeToCrystalEyes()
##  on the rendering window.
##  - Keypress e: exit the application.
##  - Keypress f: fly to the picked point
##  - Keypress p: perform a pick operation. The render window interactor has
##  an internal instance of vtkCellPicker that it uses to pick.
##  - Keypress r: reset the camera view along the current view
##  direction. Centers the actors and moves the camera so that all actors are
##  visible.
##  - Keypress s: modify the representation of all actors so that they are
##  surfaces.
##  - Keypress u: invoke the user-defined function. Typically,
##  this keypress will bring up an interactor that you can type commands in.
##  Typing u calls UserCallBack() on the vtkRenderWindowInteractor, which
##  invokes a vtkCommand::UserEvent. In other words, to define a user-defined
##  callback, just add an observer to the vtkCommand::UserEvent on the
##  vtkRenderWindowInteractor object.
##  - Keypress w: modify the representation of all actors so that they are
##  wireframe.
##
##  vtkInteractorStyle can be subclassed to provide new interaction styles and
##  a facility to override any of the default mouse/key operations which
##  currently handle trackball or joystick styles is provided. Note that this
##  class will fire a variety of events that can be watched using an observer,
##  such as LeftButtonPressEvent, LeftButtonReleaseEvent,
##  MiddleButtonPressEvent, MiddleButtonReleaseEvent, RightButtonPressEvent,
##  RightButtonReleaseEvent, EnterEvent, LeaveEvent, KeyPressEvent,
##  KeyReleaseEvent, CharEvent, ExposeEvent, ConfigureEvent, TimerEvent,
##  MouseMoveEvent,
##
##
##  @sa
##  vtkInteractorStyleTrackball
##

import
  vtkInteractorObserver, vtkRenderingCoreModule

##  Motion flags

const
  VTKIS_START* = 0
  VTKIS_NONE* = 0
  VTKIS_ROTATE* = 1
  VTKIS_PAN* = 2
  VTKIS_SPIN* = 3
  VTKIS_DOLLY* = 4
  VTKIS_ZOOM* = 5
  VTKIS_USCALE* = 6
  VTKIS_TIMER* = 7
  VTKIS_FORWARDFLY* = 8
  VTKIS_REVERSEFLY* = 9
  VTKIS_TWO_POINTER* = 10
  VTKIS_CLIP* = 11
  VTKIS_PICK* = 12
  VTKIS_LOAD_CAMERA_POSE* = 13
  VTKIS_POSITION_PROP* = 14
  VTKIS_EXIT* = 15
  VTKIS_TOGGLE_DRAW_CONTROLS* = 16
  VTKIS_MENU* = 17
  VTKIS_GESTURE* = 18
  VTKIS_ENV_ROTATE* = 19
  VTKIS_GROUNDMOVEMENT* = 20
  VTKIS_ELEVATION* = 21
  VTKIS_ANIM_OFF* = 0
  VTKIS_ANIM_ON* = 1

discard "forward decl of vtkActor2D"
discard "forward decl of vtkActor"
discard "forward decl of vtkCallbackCommand"
discard "forward decl of vtkEventData"
discard "forward decl of vtkEventForwarderCommand"
discard "forward decl of vtkOutlineSource"
discard "forward decl of vtkPolyDataMapper"
discard "forward decl of vtkProp3D"
discard "forward decl of vtkProp"
discard "forward decl of vtkStringArray"
discard "forward decl of vtkTDxInteractorStyle"
type
  vtkInteractorStyle* {.importcpp: "vtkInteractorStyle",
                       header: "vtkInteractorStyle.h", bycopy.} = object of vtkInteractorObserver ## *
                                                                                           ##  This class must be supplied with a vtkRenderWindowInteractor wrapper or
                                                                                           ##  parent. This class should not normally be instantiated by application
                                                                                           ##  programmers.
                                                                                           ##
    vtkInteractorStyle* {.importc: "vtkInteractorStyle".}: VTK_NEWINSTANCE
    ##  Should observers be handled here, should we fire timers
    ##  keep track of the timers that are created/destroyed
    ##  For picking and highlighting props
    ##  bool: prop picked?
    ##  support 2D picking
    ##  Control the timer duration
    ##  in milliseconds
    ##  Forward events to the RenderWindowInteractor


proc New*(): ptr vtkInteractorStyle {.importcpp: "vtkInteractorStyle::New(@)",
                                  header: "vtkInteractorStyle.h".}
type
  vtkInteractorStyleSuperclass* = vtkInteractorObserver

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkInteractorStyle::IsTypeOf(@)", header: "vtkInteractorStyle.h".}
proc IsA*(this: var vtkInteractorStyle; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkInteractorStyle.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkInteractorStyle {.
    importcpp: "vtkInteractorStyle::SafeDownCast(@)",
    header: "vtkInteractorStyle.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkInteractorStyle :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInteractorObserver :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInteractorStyle :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInteractorStyle :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkInteractorStyle; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkInteractorStyle.h".}
proc SetInteractor*(this: var vtkInteractorStyle;
                   interactor: ptr vtkRenderWindowInteractor) {.
    importcpp: "SetInteractor", header: "vtkInteractorStyle.h".}
proc SetEnabled*(this: var vtkInteractorStyle; a2: cint) {.importcpp: "SetEnabled",
    header: "vtkInteractorStyle.h".}
proc SetAutoAdjustCameraClippingRange*(this: var vtkInteractorStyle;
                                      _arg: vtkTypeBool) {.
    importcpp: "SetAutoAdjustCameraClippingRange", header: "vtkInteractorStyle.h".}
proc GetAutoAdjustCameraClippingRangeMinValue*(this: var vtkInteractorStyle): vtkTypeBool {.
    importcpp: "GetAutoAdjustCameraClippingRangeMinValue",
    header: "vtkInteractorStyle.h".}
proc GetAutoAdjustCameraClippingRangeMaxValue*(this: var vtkInteractorStyle): vtkTypeBool {.
    importcpp: "GetAutoAdjustCameraClippingRangeMaxValue",
    header: "vtkInteractorStyle.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetAutoAdjustCameraClippingRange ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AutoAdjustCameraClippingRange  of  << this -> AutoAdjustCameraClippingRange ) ; return this -> AutoAdjustCameraClippingRange ; } ;
## Error: expected ';'!!!

proc AutoAdjustCameraClippingRangeOn*(this: var vtkInteractorStyle) {.
    importcpp: "AutoAdjustCameraClippingRangeOn", header: "vtkInteractorStyle.h".}
proc AutoAdjustCameraClippingRangeOff*(this: var vtkInteractorStyle) {.
    importcpp: "AutoAdjustCameraClippingRangeOff", header: "vtkInteractorStyle.h".}
  ## /@}
  ## *
  ##  When an event occurs, we must determine which Renderer the event
  ##  occurred within, since one RenderWindow may contain multiple
  ##  renderers.
  ##
proc FindPokedRenderer*(this: var vtkInteractorStyle; a2: cint; a3: cint) {.
    importcpp: "FindPokedRenderer", header: "vtkInteractorStyle.h".}
## !!!Ignored construct:  /@{ *
##  Some useful information for interaction
##  virtual int GetAutoAdjustCameraClippingRangeStateState ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << State  of  << this -> State ) ; return this -> State ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Set/Get timer hint
##  virtual vtkTypeBool GetAutoAdjustCameraClippingRangeStateStateUseTimersUseTimers ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseTimers  of  << this -> UseTimers ) ; return this -> UseTimers ; } ;
## Error: expected ';'!!!

proc SetUseTimers*(this: var vtkInteractorStyle; _arg: vtkTypeBool) {.
    importcpp: "SetUseTimers", header: "vtkInteractorStyle.h".}
proc UseTimersOn*(this: var vtkInteractorStyle) {.importcpp: "UseTimersOn",
    header: "vtkInteractorStyle.h".}
proc UseTimersOff*(this: var vtkInteractorStyle) {.importcpp: "UseTimersOff",
    header: "vtkInteractorStyle.h".}
  ## /@}
  ## /@{
  ## *
  ##  If using timers, specify the default timer interval (in
  ##  milliseconds). Care must be taken when adjusting the timer interval from
  ##  the default value of 10 milliseconds--it may adversely affect the
  ##  interactors.
  ##
proc SetAutoAdjustCameraClippingRangeTimerDuration*(this: var vtkInteractorStyle;
    _arg: culong) {.importcpp: "SetAutoAdjustCameraClippingRangeTimerDuration",
                  header: "vtkInteractorStyle.h".}
proc GetAutoAdjustCameraClippingRangeMinValueTimerDurationMinValue*(
    this: var vtkInteractorStyle): culong {.importcpp: "GetAutoAdjustCameraClippingRangeMinValueTimerDurationMinValue",
                                        header: "vtkInteractorStyle.h".}
proc GetAutoAdjustCameraClippingRangeMaxValueTimerDurationMaxValue*(
    this: var vtkInteractorStyle): culong {.importcpp: "GetAutoAdjustCameraClippingRangeMaxValueTimerDurationMaxValue",
                                        header: "vtkInteractorStyle.h".}
## !!!Ignored construct:  virtual unsigned long GetAutoAdjustCameraClippingRangeStateStateUseTimersUseTimersTimerDuration ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TimerDuration  of  << this -> TimerDuration ) ; return this -> TimerDuration ; } ;
## Error: expected ';'!!!

proc SetUseTimersHandleObservers*(this: var vtkInteractorStyle; _arg: vtkTypeBool) {.
    importcpp: "SetUseTimersHandleObservers", header: "vtkInteractorStyle.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetAutoAdjustCameraClippingRangeStateStateUseTimersUseTimersTimerDurationHandleObservers ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HandleObservers  of  << this -> HandleObservers ) ; return this -> HandleObservers ; } ;
## Error: expected ';'!!!

proc HandleObserversOn*(this: var vtkInteractorStyle) {.
    importcpp: "HandleObserversOn", header: "vtkInteractorStyle.h".}
proc HandleObserversOff*(this: var vtkInteractorStyle) {.
    importcpp: "HandleObserversOff", header: "vtkInteractorStyle.h".}
  ## /@}
  ## *
  ##  Generic event bindings can be overridden in subclasses
  ##
proc OnMouseMove*(this: var vtkInteractorStyle) {.importcpp: "OnMouseMove",
    header: "vtkInteractorStyle.h".}
proc OnLeftButtonDown*(this: var vtkInteractorStyle) {.
    importcpp: "OnLeftButtonDown", header: "vtkInteractorStyle.h".}
proc OnLeftButtonUp*(this: var vtkInteractorStyle) {.importcpp: "OnLeftButtonUp",
    header: "vtkInteractorStyle.h".}
proc OnMiddleButtonDown*(this: var vtkInteractorStyle) {.
    importcpp: "OnMiddleButtonDown", header: "vtkInteractorStyle.h".}
proc OnMiddleButtonUp*(this: var vtkInteractorStyle) {.
    importcpp: "OnMiddleButtonUp", header: "vtkInteractorStyle.h".}
proc OnRightButtonDown*(this: var vtkInteractorStyle) {.
    importcpp: "OnRightButtonDown", header: "vtkInteractorStyle.h".}
proc OnRightButtonUp*(this: var vtkInteractorStyle) {.importcpp: "OnRightButtonUp",
    header: "vtkInteractorStyle.h".}
proc OnLeftButtonDoubleClick*(this: var vtkInteractorStyle) {.
    importcpp: "OnLeftButtonDoubleClick", header: "vtkInteractorStyle.h".}
proc OnMiddleButtonDoubleClick*(this: var vtkInteractorStyle) {.
    importcpp: "OnMiddleButtonDoubleClick", header: "vtkInteractorStyle.h".}
proc OnRightButtonDoubleClick*(this: var vtkInteractorStyle) {.
    importcpp: "OnRightButtonDoubleClick", header: "vtkInteractorStyle.h".}
proc OnMouseWheelForward*(this: var vtkInteractorStyle) {.
    importcpp: "OnMouseWheelForward", header: "vtkInteractorStyle.h".}
proc OnMouseWheelBackward*(this: var vtkInteractorStyle) {.
    importcpp: "OnMouseWheelBackward", header: "vtkInteractorStyle.h".}
proc OnMouseWheelLeft*(this: var vtkInteractorStyle) {.
    importcpp: "OnMouseWheelLeft", header: "vtkInteractorStyle.h".}
proc OnMouseWheelRight*(this: var vtkInteractorStyle) {.
    importcpp: "OnMouseWheelRight", header: "vtkInteractorStyle.h".}
proc OnFourthButtonDown*(this: var vtkInteractorStyle) {.
    importcpp: "OnFourthButtonDown", header: "vtkInteractorStyle.h".}
proc OnFourthButtonUp*(this: var vtkInteractorStyle) {.
    importcpp: "OnFourthButtonUp", header: "vtkInteractorStyle.h".}
proc OnFifthButtonDown*(this: var vtkInteractorStyle) {.
    importcpp: "OnFifthButtonDown", header: "vtkInteractorStyle.h".}
proc OnFifthButtonUp*(this: var vtkInteractorStyle) {.importcpp: "OnFifthButtonUp",
    header: "vtkInteractorStyle.h".}
proc OnMove3D*(this: var vtkInteractorStyle; a2: ptr vtkEventData) {.
    importcpp: "OnMove3D", header: "vtkInteractorStyle.h".}
proc OnButton3D*(this: var vtkInteractorStyle; a2: ptr vtkEventData) {.
    importcpp: "OnButton3D", header: "vtkInteractorStyle.h".}
proc OnPick3D*(this: var vtkInteractorStyle; a2: ptr vtkEventData) {.
    importcpp: "OnPick3D", header: "vtkInteractorStyle.h".}
proc OnClip3D*(this: var vtkInteractorStyle; a2: ptr vtkEventData) {.
    importcpp: "OnClip3D", header: "vtkInteractorStyle.h".}
proc OnSelect3D*(this: var vtkInteractorStyle; a2: ptr vtkEventData) {.
    importcpp: "OnSelect3D", header: "vtkInteractorStyle.h".}
proc OnMenu3D*(this: var vtkInteractorStyle; a2: ptr vtkEventData) {.
    importcpp: "OnMenu3D", header: "vtkInteractorStyle.h".}
proc OnNextPose3D*(this: var vtkInteractorStyle; a2: ptr vtkEventData) {.
    importcpp: "OnNextPose3D", header: "vtkInteractorStyle.h".}
proc OnPositionProp3D*(this: var vtkInteractorStyle; a2: ptr vtkEventData) {.
    importcpp: "OnPositionProp3D", header: "vtkInteractorStyle.h".}
proc OnViewerMovement3D*(this: var vtkInteractorStyle; a2: ptr vtkEventData) {.
    importcpp: "OnViewerMovement3D", header: "vtkInteractorStyle.h".}
proc OnElevation3D*(this: var vtkInteractorStyle; a2: ptr vtkEventData) {.
    importcpp: "OnElevation3D", header: "vtkInteractorStyle.h".}
proc OnChar*(this: var vtkInteractorStyle) {.importcpp: "OnChar",
    header: "vtkInteractorStyle.h".}
proc OnKeyDown*(this: var vtkInteractorStyle) {.importcpp: "OnKeyDown",
    header: "vtkInteractorStyle.h".}
proc OnKeyUp*(this: var vtkInteractorStyle) {.importcpp: "OnKeyUp",
    header: "vtkInteractorStyle.h".}
proc OnKeyPress*(this: var vtkInteractorStyle) {.importcpp: "OnKeyPress",
    header: "vtkInteractorStyle.h".}
proc OnKeyRelease*(this: var vtkInteractorStyle) {.importcpp: "OnKeyRelease",
    header: "vtkInteractorStyle.h".}
proc OnExpose*(this: var vtkInteractorStyle) {.importcpp: "OnExpose",
    header: "vtkInteractorStyle.h".}
proc OnConfigure*(this: var vtkInteractorStyle) {.importcpp: "OnConfigure",
    header: "vtkInteractorStyle.h".}
proc OnEnter*(this: var vtkInteractorStyle) {.importcpp: "OnEnter",
    header: "vtkInteractorStyle.h".}
proc OnLeave*(this: var vtkInteractorStyle) {.importcpp: "OnLeave",
    header: "vtkInteractorStyle.h".}
proc OnTimer*(this: var vtkInteractorStyle) {.importcpp: "OnTimer",
    header: "vtkInteractorStyle.h".}
proc Rotate*(this: var vtkInteractorStyle) {.importcpp: "Rotate",
    header: "vtkInteractorStyle.h".}
proc Spin*(this: var vtkInteractorStyle) {.importcpp: "Spin",
                                       header: "vtkInteractorStyle.h".}
proc Pan*(this: var vtkInteractorStyle) {.importcpp: "Pan",
                                      header: "vtkInteractorStyle.h".}
proc Dolly*(this: var vtkInteractorStyle) {.importcpp: "Dolly",
                                        header: "vtkInteractorStyle.h".}
proc Zoom*(this: var vtkInteractorStyle) {.importcpp: "Zoom",
                                       header: "vtkInteractorStyle.h".}
proc UniformScale*(this: var vtkInteractorStyle) {.importcpp: "UniformScale",
    header: "vtkInteractorStyle.h".}
proc EnvironmentRotate*(this: var vtkInteractorStyle) {.
    importcpp: "EnvironmentRotate", header: "vtkInteractorStyle.h".}
proc OnStartSwipe*(this: var vtkInteractorStyle) {.importcpp: "OnStartSwipe",
    header: "vtkInteractorStyle.h".}
proc OnSwipe*(this: var vtkInteractorStyle) {.importcpp: "OnSwipe",
    header: "vtkInteractorStyle.h".}
proc OnEndSwipe*(this: var vtkInteractorStyle) {.importcpp: "OnEndSwipe",
    header: "vtkInteractorStyle.h".}
proc OnStartPinch*(this: var vtkInteractorStyle) {.importcpp: "OnStartPinch",
    header: "vtkInteractorStyle.h".}
proc OnPinch*(this: var vtkInteractorStyle) {.importcpp: "OnPinch",
    header: "vtkInteractorStyle.h".}
proc OnEndPinch*(this: var vtkInteractorStyle) {.importcpp: "OnEndPinch",
    header: "vtkInteractorStyle.h".}
proc OnStartRotate*(this: var vtkInteractorStyle) {.importcpp: "OnStartRotate",
    header: "vtkInteractorStyle.h".}
proc OnRotate*(this: var vtkInteractorStyle) {.importcpp: "OnRotate",
    header: "vtkInteractorStyle.h".}
proc OnEndRotate*(this: var vtkInteractorStyle) {.importcpp: "OnEndRotate",
    header: "vtkInteractorStyle.h".}
proc OnStartPan*(this: var vtkInteractorStyle) {.importcpp: "OnStartPan",
    header: "vtkInteractorStyle.h".}
proc OnPan*(this: var vtkInteractorStyle) {.importcpp: "OnPan",
                                        header: "vtkInteractorStyle.h".}
proc OnEndPan*(this: var vtkInteractorStyle) {.importcpp: "OnEndPan",
    header: "vtkInteractorStyle.h".}
proc OnTap*(this: var vtkInteractorStyle) {.importcpp: "OnTap",
                                        header: "vtkInteractorStyle.h".}
proc OnLongTap*(this: var vtkInteractorStyle) {.importcpp: "OnLongTap",
    header: "vtkInteractorStyle.h".}
proc StartState*(this: var vtkInteractorStyle; newstate: cint) {.
    importcpp: "StartState", header: "vtkInteractorStyle.h".}
proc StopState*(this: var vtkInteractorStyle) {.importcpp: "StopState",
    header: "vtkInteractorStyle.h".}
proc StartAnimate*(this: var vtkInteractorStyle) {.importcpp: "StartAnimate",
    header: "vtkInteractorStyle.h".}
proc StopAnimate*(this: var vtkInteractorStyle) {.importcpp: "StopAnimate",
    header: "vtkInteractorStyle.h".}
proc StartRotate*(this: var vtkInteractorStyle) {.importcpp: "StartRotate",
    header: "vtkInteractorStyle.h".}
proc EndRotate*(this: var vtkInteractorStyle) {.importcpp: "EndRotate",
    header: "vtkInteractorStyle.h".}
proc StartZoom*(this: var vtkInteractorStyle) {.importcpp: "StartZoom",
    header: "vtkInteractorStyle.h".}
proc EndZoom*(this: var vtkInteractorStyle) {.importcpp: "EndZoom",
    header: "vtkInteractorStyle.h".}
proc StartPan*(this: var vtkInteractorStyle) {.importcpp: "StartPan",
    header: "vtkInteractorStyle.h".}
proc EndPan*(this: var vtkInteractorStyle) {.importcpp: "EndPan",
    header: "vtkInteractorStyle.h".}
proc StartSpin*(this: var vtkInteractorStyle) {.importcpp: "StartSpin",
    header: "vtkInteractorStyle.h".}
proc EndSpin*(this: var vtkInteractorStyle) {.importcpp: "EndSpin",
    header: "vtkInteractorStyle.h".}
proc StartDolly*(this: var vtkInteractorStyle) {.importcpp: "StartDolly",
    header: "vtkInteractorStyle.h".}
proc EndDolly*(this: var vtkInteractorStyle) {.importcpp: "EndDolly",
    header: "vtkInteractorStyle.h".}
proc StartUniformScale*(this: var vtkInteractorStyle) {.
    importcpp: "StartUniformScale", header: "vtkInteractorStyle.h".}
proc EndUniformScale*(this: var vtkInteractorStyle) {.importcpp: "EndUniformScale",
    header: "vtkInteractorStyle.h".}
proc StartTimer*(this: var vtkInteractorStyle) {.importcpp: "StartTimer",
    header: "vtkInteractorStyle.h".}
proc EndTimer*(this: var vtkInteractorStyle) {.importcpp: "EndTimer",
    header: "vtkInteractorStyle.h".}
proc StartTwoPointer*(this: var vtkInteractorStyle) {.importcpp: "StartTwoPointer",
    header: "vtkInteractorStyle.h".}
proc EndTwoPointer*(this: var vtkInteractorStyle) {.importcpp: "EndTwoPointer",
    header: "vtkInteractorStyle.h".}
proc StartGesture*(this: var vtkInteractorStyle) {.importcpp: "StartGesture",
    header: "vtkInteractorStyle.h".}
proc EndGesture*(this: var vtkInteractorStyle) {.importcpp: "EndGesture",
    header: "vtkInteractorStyle.h".}
proc StartEnvRotate*(this: var vtkInteractorStyle) {.importcpp: "StartEnvRotate",
    header: "vtkInteractorStyle.h".}
proc EndEnvRotate*(this: var vtkInteractorStyle) {.importcpp: "EndEnvRotate",
    header: "vtkInteractorStyle.h".}
proc OnDropLocation*(this: var vtkInteractorStyle;
                    vtkNotUsed: proc (a1: position): ptr cdouble) {.
    importcpp: "OnDropLocation", header: "vtkInteractorStyle.h".}
proc OnDropFiles*(this: var vtkInteractorStyle;
                 vtkNotUsed: proc (a1: filePaths): ptr vtkStringArray) {.
    importcpp: "OnDropFiles", header: "vtkInteractorStyle.h".}
proc HighlightProp*(this: var vtkInteractorStyle; prop: ptr vtkProp) {.
    importcpp: "HighlightProp", header: "vtkInteractorStyle.h".}
proc HighlightActor2D*(this: var vtkInteractorStyle; actor2D: ptr vtkActor2D) {.
    importcpp: "HighlightActor2D", header: "vtkInteractorStyle.h".}
proc HighlightProp3D*(this: var vtkInteractorStyle; prop3D: ptr vtkProp3D) {.
    importcpp: "HighlightProp3D", header: "vtkInteractorStyle.h".}
proc SetPickColor*(this: var vtkInteractorStyle; _arg1: cdouble; _arg2: cdouble;
                  _arg3: cdouble) {.importcpp: "SetPickColor",
                                  header: "vtkInteractorStyle.h".}
proc SetPickColor*(this: var vtkInteractorStyle; _arg: array[3, cdouble]) {.
    importcpp: "SetPickColor", header: "vtkInteractorStyle.h".}
## !!!Ignored construct:  virtual double * GetPickColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << PickColor  pointer  << this -> PickColor ) ; return this -> PickColor ; } VTK_WRAPEXCLUDE virtual void GetPickColor ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> PickColor [ i ] ; } } ;
## Error: expected ';'!!!

proc SetUseTimersHandleObserversMouseWheelMotionFactor*(
    this: var vtkInteractorStyle; _arg: cdouble) {.
    importcpp: "SetUseTimersHandleObserversMouseWheelMotionFactor",
    header: "vtkInteractorStyle.h".}
## !!!Ignored construct:  virtual double GetAutoAdjustCameraClippingRangeStateStateUseTimersUseTimersTimerDurationHandleObserversMouseWheelMotionFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MouseWheelMotionFactor  of  << this -> MouseWheelMotionFactor ) ; return this -> MouseWheelMotionFactor ; } ;
## Error: expected ';'!!!

proc GetnameTDxStyle*(this: var vtkInteractorStyle): ptr vtkTDxInteractorStyle {.
    importcpp: "GetnameTDxStyle", header: "vtkInteractorStyle.h".}
proc SetTDxStyle*(this: var vtkInteractorStyle; tdxStyle: ptr vtkTDxInteractorStyle) {.
    importcpp: "SetTDxStyle", header: "vtkInteractorStyle.h".}
proc DelegateTDxEvent*(this: var vtkInteractorStyle; event: culong; calldata: pointer) {.
    importcpp: "DelegateTDxEvent", header: "vtkInteractorStyle.h".}