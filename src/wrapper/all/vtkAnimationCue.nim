## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAnimationCue.h
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
##  @class   vtkAnimationCue
##  @brief   a seqin an animation.
##
##  vtkAnimationCue and vtkAnimationScene provide the framework to support
##  animations in VTK. vtkAnimationCue represents an entity that changes/
##  animates with time, while vtkAnimationScene represents scene or setup
##  for the animation, which consists on individual cues or other scenes.
##
##  A cue has three states: UNINITIALIZED, ACTIVE and INACTIVE.
##  UNINITIALIZED represents an point in time before the start time of the cue.
##  The cue is in ACTIVE state at a point in time between start time and end time
##  for the cue. While, beyond the end time, it is in INACTIVE state.
##  When the cue enters the ACTIVE state, StartAnimationCueEvent is fired. This
##  event may be handled to initialize the entity to be animated.
##  When the cue leaves the ACTIVE state, EndAnimationCueEvent is fired, which
##  can be handled to cleanup after having run the animation.
##  For every request to render during the ACTIVE state, AnimationCueTickEvent is
##  fired, which must be handled to perform the actual animation.
##  @sa
##  vtkAnimationScene
##

import
  vtkCommonCoreModule, vtkObject

type
  vtkAnimationCue* {.importcpp: "vtkAnimationCue", header: "vtkAnimationCue.h",
                    bycopy.} = object of vtkObject
    vtkAnimationCue* {.importc: "vtkAnimationCue".}: VTK_NEWINSTANCE
    ##  These are set when the AnimationCueTickEvent event
    ##  is fired. Thus giving access to the information in
    ##  the AnimationCueInfo struct in wrapped languages.
    ## *
    ##  Current state of the Cue.
    ##
    ## /@{
    ## *
    ##  These are the internal methods that actually trigger they
    ##  corresponding events. Subclasses can override these to
    ##  do extra processing at start/end or on tick.
    ##

  vtkAnimationCueSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAnimationCue::IsTypeOf(@)", header: "vtkAnimationCue.h".}
proc IsA*(this: var vtkAnimationCue; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkAnimationCue.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAnimationCue {.
    importcpp: "vtkAnimationCue::SafeDownCast(@)", header: "vtkAnimationCue.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAnimationCue :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAnimationCue :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAnimationCue :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAnimationCue; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkAnimationCue.h".}
proc New*(): ptr vtkAnimationCue {.importcpp: "vtkAnimationCue::New(@)",
                               header: "vtkAnimationCue.h".}
type
  vtkAnimationCueAnimationCueInfo* {.importcpp: "vtkAnimationCue::AnimationCueInfo",
                                    header: "vtkAnimationCue.h", bycopy.} = object
    StartTime* {.importc: "StartTime".}: cdouble
    EndTime* {.importc: "EndTime".}: cdouble
    AnimationTime* {.importc: "AnimationTime".}: cdouble ##  valid only in AnimationCueTickEvent handler
    DeltaTime* {.importc: "DeltaTime".}: cdouble ##  valid only in AnimationCueTickEvent handler
    ClockTime* {.importc: "ClockTime".}: cdouble ##  valid only in AnimationCueTickEvent handler


proc SetTimeMode*(this: var vtkAnimationCue; mode: cint) {.importcpp: "SetTimeMode",
    header: "vtkAnimationCue.h".}
## !!!Ignored construct:  virtual int GetTimeMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TimeMode  of  << this -> TimeMode ) ; return this -> TimeMode ; } ;
## Error: expected ';'!!!

proc SetTimeModeToRelative*(this: var vtkAnimationCue) {.
    importcpp: "SetTimeModeToRelative", header: "vtkAnimationCue.h".}
proc SetTimeModeToNormalized*(this: var vtkAnimationCue) {.
    importcpp: "SetTimeModeToNormalized", header: "vtkAnimationCue.h".}
proc SetStartTime*(this: var vtkAnimationCue; _arg: cdouble) {.
    importcpp: "SetStartTime", header: "vtkAnimationCue.h".}
## !!!Ignored construct:  virtual double GetTimeModeStartTime ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << StartTime  of  << this -> StartTime ) ; return this -> StartTime ; } ;
## Error: expected ';'!!!

proc SetStartTimeEndTime*(this: var vtkAnimationCue; _arg: cdouble) {.
    importcpp: "SetStartTimeEndTime", header: "vtkAnimationCue.h".}
## !!!Ignored construct:  virtual double GetTimeModeStartTimeEndTime ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EndTime  of  << this -> EndTime ) ; return this -> EndTime ; } ;
## Error: expected ';'!!!

proc Tick*(this: var vtkAnimationCue; currenttime: cdouble; deltatime: cdouble;
          clocktime: cdouble) {.importcpp: "Tick", header: "vtkAnimationCue.h".}
proc Initialize*(this: var vtkAnimationCue) {.importcpp: "Initialize",
    header: "vtkAnimationCue.h".}
proc Finalize*(this: var vtkAnimationCue) {.importcpp: "Finalize",
                                        header: "vtkAnimationCue.h".}
## !!!Ignored construct:  /@{ *
##  This is valid only in a AnimationCueTickEvent handler.
##  Before firing the event the animation cue sets the AnimationTime to
##  the time of the tick.
##  virtual double GetTimeModeStartTimeEndTimeAnimationTimeAnimationTime ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AnimationTime  of  << this -> AnimationTime ) ; return this -> AnimationTime ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  This is valid only in a AnimationCueTickEvent handler.
##  Before firing the event the animation cue sets the DeltaTime
##  to the difference in time between the current tick and the last tick.
##  virtual double GetTimeModeStartTimeEndTimeAnimationTimeAnimationTimeDeltaTimeDeltaTime ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DeltaTime  of  << this -> DeltaTime ) ; return this -> DeltaTime ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  This is valid only in a AnimationCueTickEvent handler.
##  Before firing the event the animation cue sets the ClockTime to
##  the time of the tick. ClockTime is directly the time from the animation
##  scene neither normalized nor offsetted to the start of the scene.
##  virtual double GetTimeModeStartTimeEndTimeAnimationTimeAnimationTimeDeltaTimeDeltaTimeClockTimeClockTime ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ClockTime  of  << this -> ClockTime ) ; return this -> ClockTime ; } ;
## Error: expected ';'!!!

type
  vtkAnimationCueTimeCodes* {.size: sizeof(cint),
                             importcpp: "vtkAnimationCue::TimeCodes",
                             header: "vtkAnimationCue.h".} = enum
    TIMEMODE_NORMALIZED = 0, TIMEMODE_RELATIVE = 1


type
  vtkAnimationCuePlayDirection* {.size: sizeof(cint),
                                 importcpp: "vtkAnimationCue::PlayDirection",
                                 header: "vtkAnimationCue.h".} = enum
    BACKWARD, FORWARD


proc SetDirection*(this: var vtkAnimationCue; _arg: vtkAnimationCuePlayDirection) {.
    importcpp: "SetDirection", header: "vtkAnimationCue.h".}
proc GetDirection*(this: vtkAnimationCue): vtkAnimationCuePlayDirection {.
    noSideEffect, importcpp: "GetDirection", header: "vtkAnimationCue.h".}
  ## /@}