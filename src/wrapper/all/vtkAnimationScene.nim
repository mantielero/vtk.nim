## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAnimationScene.h
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
##  @class   vtkAnimationScene
##  @brief   the animation scene manager.
##
##  vtkAnimationCue and vtkAnimationScene provide the framework to support
##  animations in VTK. vtkAnimationCue represents an entity that changes/
##  animates with time, while vtkAnimationScene represents scene or setup
##  for the animation, which consists of individual cues or other scenes.
##
##  A scene can be played in real time mode, or as a sequence of frames
##  1/frame rate apart in time.
##  @sa
##  vtkAnimationCue
##

import
  vtkAnimationCue, vtkCommonDataModelModule

discard "forward decl of vtkAnimationCue"
discard "forward decl of vtkCollection"
discard "forward decl of vtkCollectionIterator"
discard "forward decl of vtkTimerLog"
type
  vtkAnimationScene* {.importcpp: "vtkAnimationScene",
                      header: "vtkAnimationScene.h", bycopy.} = object of vtkAnimationCue
    vtkAnimationScene* {.importc: "vtkAnimationScene".}: VTK_NEWINSTANCE

  vtkAnimationSceneSuperclass* = vtkAnimationCue

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAnimationScene::IsTypeOf(@)", header: "vtkAnimationScene.h".}
proc IsA*(this: var vtkAnimationScene; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkAnimationScene.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAnimationScene {.
    importcpp: "vtkAnimationScene::SafeDownCast(@)", header: "vtkAnimationScene.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAnimationScene :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAnimationCue :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAnimationScene :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAnimationScene :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAnimationScene; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkAnimationScene.h".}
proc New*(): ptr vtkAnimationScene {.importcpp: "vtkAnimationScene::New(@)",
                                 header: "vtkAnimationScene.h".}
proc SetPlayMode*(this: var vtkAnimationScene; _arg: cint) {.importcpp: "SetPlayMode",
    header: "vtkAnimationScene.h".}
proc SetModeToSequence*(this: var vtkAnimationScene) {.
    importcpp: "SetModeToSequence", header: "vtkAnimationScene.h".}
proc SetModeToRealTime*(this: var vtkAnimationScene) {.
    importcpp: "SetModeToRealTime", header: "vtkAnimationScene.h".}
## !!!Ignored construct:  virtual int GetPlayMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PlayMode  of  << this -> PlayMode ) ; return this -> PlayMode ; } ;
## Error: expected ';'!!!

proc SetPlayModeFrameRate*(this: var vtkAnimationScene; _arg: cdouble) {.
    importcpp: "SetPlayModeFrameRate", header: "vtkAnimationScene.h".}
## !!!Ignored construct:  virtual double GetPlayModeFrameRate ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FrameRate  of  << this -> FrameRate ) ; return this -> FrameRate ; } ;
## Error: expected ';'!!!

proc AddCue*(this: var vtkAnimationScene; cue: ptr vtkAnimationCue) {.
    importcpp: "AddCue", header: "vtkAnimationScene.h".}
proc RemoveCue*(this: var vtkAnimationScene; cue: ptr vtkAnimationCue) {.
    importcpp: "RemoveCue", header: "vtkAnimationScene.h".}
proc RemoveAllCues*(this: var vtkAnimationScene) {.importcpp: "RemoveAllCues",
    header: "vtkAnimationScene.h".}
proc GetNumberOfCues*(this: var vtkAnimationScene): cint {.
    importcpp: "GetNumberOfCues", header: "vtkAnimationScene.h".}
proc Play*(this: var vtkAnimationScene) {.importcpp: "Play",
                                      header: "vtkAnimationScene.h".}
proc Stop*(this: var vtkAnimationScene) {.importcpp: "Stop",
                                      header: "vtkAnimationScene.h".}
proc SetPlayModeFrameRateLoop*(this: var vtkAnimationScene; _arg: cint) {.
    importcpp: "SetPlayModeFrameRateLoop", header: "vtkAnimationScene.h".}
## !!!Ignored construct:  virtual int GetPlayModeFrameRateLoop ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Loop  of  << this -> Loop ) ; return this -> Loop ; } ;
## Error: expected ';'!!!

proc SetAnimationTime*(this: var vtkAnimationScene; time: cdouble) {.
    importcpp: "SetAnimationTime", header: "vtkAnimationScene.h".}
proc SetTimeMode*(this: var vtkAnimationScene; mode: cint) {.importcpp: "SetTimeMode",
    header: "vtkAnimationScene.h".}
proc IsInPlay*(this: var vtkAnimationScene): cint {.importcpp: "IsInPlay",
    header: "vtkAnimationScene.h".}
type
  vtkAnimationScenePlayModes* {.size: sizeof(cint),
                               importcpp: "vtkAnimationScene::PlayModes",
                               header: "vtkAnimationScene.h".} = enum
    PLAYMODE_SEQUENCE = 0, PLAYMODE_REALTIME = 1

