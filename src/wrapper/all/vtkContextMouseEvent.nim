## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkContextMouseEvent.h
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
##  @class   vtkContextMouseEvent
##  @brief   data structure to represent mouse events.
##
##
##  Provides a convenient data structure to represent mouse events in the
##  vtkContextScene. Passed to vtkAbstractContextItem objects.
##

import
  vtkRenderingContext2DModule, vtkVector, vtkWin32Header

discard "forward decl of vtkRenderWindowInteractor"
type
  vtkContextMouseEvent* {.importcpp: "vtkContextMouseEvent",
                         header: "vtkContextMouseEvent.h", bycopy.} = object ## *
                                                                        ##  Enumeration of mouse buttons.
                                                                        ##
                                                                        ## *
                                                                        ##  Position of the mouse in item coordinate system.
                                                                        ##
    ## *
    ##  Position of the mouse the scene coordinate system.
    ##
    ## *
    ##  Position of the mouse in screen coordinates
    ##
    ## *
    ##  `Pos' at the previous mouse event.
    ##
    ## *
    ##  `ScenePos'at the previous mouse event.
    ##
    ## *
    ##  `ScreenPos' at the previous mouse event.
    ##
    ## *
    ##  Mouse button that caused the event, using the anonymous enumeration.
    ##


const
  vtkContextMouseEventNO_BUTTON* = 0
  vtkContextMouseEventLEFT_BUTTON* = 1
  vtkContextMouseEventMIDDLE_BUTTON* = 2
  vtkContextMouseEventRIGHT_BUTTON* = 4

const
  vtkContextMouseEventNO_MODIFIER* = 0
  vtkContextMouseEventALT_MODIFIER* = 1
  vtkContextMouseEventSHIFT_MODIFIER* = 2
  vtkContextMouseEventCONTROL_MODIFIER* = 4

proc constructvtkContextMouseEvent*(): vtkContextMouseEvent {.constructor,
    importcpp: "vtkContextMouseEvent(@)", header: "vtkContextMouseEvent.h".}
proc SetInteractor*(this: var vtkContextMouseEvent;
                   interactor: ptr vtkRenderWindowInteractor) {.
    importcpp: "SetInteractor", header: "vtkContextMouseEvent.h".}
proc GetInteractor*(this: vtkContextMouseEvent): ptr vtkRenderWindowInteractor {.
    noSideEffect, importcpp: "GetInteractor", header: "vtkContextMouseEvent.h".}
proc SetPos*(this: var vtkContextMouseEvent; pos: vtkVector2f) {.importcpp: "SetPos",
    header: "vtkContextMouseEvent.h".}
proc GetPos*(this: vtkContextMouseEvent): vtkVector2f {.noSideEffect,
    importcpp: "GetPos", header: "vtkContextMouseEvent.h".}
proc SetScenePos*(this: var vtkContextMouseEvent; pos: vtkVector2f) {.
    importcpp: "SetScenePos", header: "vtkContextMouseEvent.h".}
proc GetScenePos*(this: vtkContextMouseEvent): vtkVector2f {.noSideEffect,
    importcpp: "GetScenePos", header: "vtkContextMouseEvent.h".}
proc SetScreenPos*(this: var vtkContextMouseEvent; pos: vtkVector2i) {.
    importcpp: "SetScreenPos", header: "vtkContextMouseEvent.h".}
proc GetScreenPos*(this: vtkContextMouseEvent): vtkVector2i {.noSideEffect,
    importcpp: "GetScreenPos", header: "vtkContextMouseEvent.h".}
proc SetLastPos*(this: var vtkContextMouseEvent; pos: vtkVector2f) {.
    importcpp: "SetLastPos", header: "vtkContextMouseEvent.h".}
proc GetLastPos*(this: vtkContextMouseEvent): vtkVector2f {.noSideEffect,
    importcpp: "GetLastPos", header: "vtkContextMouseEvent.h".}
proc SetLastScenePos*(this: var vtkContextMouseEvent; pos: vtkVector2f) {.
    importcpp: "SetLastScenePos", header: "vtkContextMouseEvent.h".}
proc GetLastScenePos*(this: vtkContextMouseEvent): vtkVector2f {.noSideEffect,
    importcpp: "GetLastScenePos", header: "vtkContextMouseEvent.h".}
proc SetLastScreenPos*(this: var vtkContextMouseEvent; pos: vtkVector2i) {.
    importcpp: "SetLastScreenPos", header: "vtkContextMouseEvent.h".}
proc GetLastScreenPos*(this: vtkContextMouseEvent): vtkVector2i {.noSideEffect,
    importcpp: "GetLastScreenPos", header: "vtkContextMouseEvent.h".}
proc SetButton*(this: var vtkContextMouseEvent; button: cint) {.
    importcpp: "SetButton", header: "vtkContextMouseEvent.h".}
proc GetButton*(this: vtkContextMouseEvent): cint {.noSideEffect,
    importcpp: "GetButton", header: "vtkContextMouseEvent.h".}
proc GetModifiers*(this: vtkContextMouseEvent): cint {.noSideEffect,
    importcpp: "GetModifiers", header: "vtkContextMouseEvent.h".}