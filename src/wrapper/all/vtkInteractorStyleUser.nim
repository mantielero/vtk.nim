## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInteractorStyleUser.h
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
##  @class   vtkInteractorStyleUser
##  @brief   provides customizable interaction routines
##
##
##  The most common way to customize user interaction is to write a subclass
##  of vtkInteractorStyle: vtkInteractorStyleUser allows you to customize
##  the interaction to without subclassing vtkInteractorStyle.  This is
##  particularly useful for setting up custom interaction modes in
##  scripting languages such as Python.  This class allows you
##  to hook into the MouseMove, ButtonPress/Release, KeyPress/Release,
##  etc. events.  If you want to hook into just a single mouse button,
##  but leave the interaction modes for the others unchanged, you
##  must use e.g. SetMiddleButtonPressMethod() instead of the more
##  general SetButtonPressMethod().
##

import
  vtkInteractionStyleModule, vtkInteractorStyle

##  new motion flag

const
  VTKIS_USERINTERACTION* = 8

type
  vtkInteractorStyleUser* {.importcpp: "vtkInteractorStyleUser",
                           header: "vtkInteractorStyleUser.h", bycopy.} = object of vtkInteractorStyle
    vtkInteractorStyleUser* {.importc: "vtkInteractorStyleUser".}: VTK_NEWINSTANCE


proc New*(): ptr vtkInteractorStyleUser {.importcpp: "vtkInteractorStyleUser::New(@)",
                                      header: "vtkInteractorStyleUser.h".}
type
  vtkInteractorStyleUserSuperclass* = vtkInteractorStyle

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkInteractorStyleUser::IsTypeOf(@)",
    header: "vtkInteractorStyleUser.h".}
proc IsA*(this: var vtkInteractorStyleUser; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkInteractorStyleUser.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkInteractorStyleUser {.
    importcpp: "vtkInteractorStyleUser::SafeDownCast(@)",
    header: "vtkInteractorStyleUser.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkInteractorStyleUser :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInteractorStyle :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInteractorStyleUser :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInteractorStyleUser :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkInteractorStyleUser; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkInteractorStyleUser.h".}
## !!!Ignored construct:  /@{ *
##  Get the most recent mouse position during mouse motion.
##  In your user interaction method, you must use this to track
##  the mouse movement.  Do not use GetEventPosition(), which records
##  the last position where a mouse button was pressed.
##  virtual int * GetLastPosLastPos ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << LastPos  pointer  << this -> LastPos ) ; return this -> LastPos ; } VTK_WRAPEXCLUDE virtual void GetLastPosLastPos ( int & _arg1 , int & _arg2 ) { _arg1 = this -> LastPos [ 0 ] ; _arg2 = this -> LastPos [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << LastPos  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetLastPosLastPos ( int _arg [ 2 ] ) { this -> GetLastPosLastPos ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get the previous mouse position during mouse motion, or after
##  a key press.  This can be used to calculate the relative
##  displacement of the mouse.
##  virtual int * GetLastPosLastPosOldPosOldPos ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << OldPos  pointer  << this -> OldPos ) ; return this -> OldPos ; } VTK_WRAPEXCLUDE virtual void GetLastPosLastPosOldPosOldPos ( int & _arg1 , int & _arg2 ) { _arg1 = this -> OldPos [ 0 ] ; _arg2 = this -> OldPos [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << OldPos  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetLastPosLastPosOldPosOldPos ( int _arg [ 2 ] ) { this -> GetLastPosLastPosOldPosOldPos ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Test whether modifiers were held down when mouse button or key
##  was pressed.
##  virtual int GetShiftKeyShiftKey ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ShiftKey  of  << this -> ShiftKey ) ; return this -> ShiftKey ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual int GetShiftKeyShiftKeyCtrlKey ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CtrlKey  of  << this -> CtrlKey ) ; return this -> CtrlKey ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get the character for a Char event.
##  virtual int GetShiftKeyShiftKeyCtrlKeyCharChar ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Char  of  << this -> Char ) ; return this -> Char ; } ;
## Error: expected ';'!!!

proc GetKeySym*(this: var vtkInteractorStyleUser): cstring {.importcpp: "GetKeySym",
    header: "vtkInteractorStyleUser.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the mouse button that was last pressed inside the window
  ##  (returns zero when the button is released).
  ##
## !!!Ignored construct:  virtual int GetShiftKeyShiftKeyCtrlKeyCharCharButton ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Button  of  << this -> Button ) ; return this -> Button ; } ;
## Error: expected ';'!!!

proc OnMouseMove*(this: var vtkInteractorStyleUser) {.importcpp: "OnMouseMove",
    header: "vtkInteractorStyleUser.h".}
proc OnLeftButtonDown*(this: var vtkInteractorStyleUser) {.
    importcpp: "OnLeftButtonDown", header: "vtkInteractorStyleUser.h".}
proc OnLeftButtonUp*(this: var vtkInteractorStyleUser) {.
    importcpp: "OnLeftButtonUp", header: "vtkInteractorStyleUser.h".}
proc OnMiddleButtonDown*(this: var vtkInteractorStyleUser) {.
    importcpp: "OnMiddleButtonDown", header: "vtkInteractorStyleUser.h".}
proc OnMiddleButtonUp*(this: var vtkInteractorStyleUser) {.
    importcpp: "OnMiddleButtonUp", header: "vtkInteractorStyleUser.h".}
proc OnRightButtonDown*(this: var vtkInteractorStyleUser) {.
    importcpp: "OnRightButtonDown", header: "vtkInteractorStyleUser.h".}
proc OnRightButtonUp*(this: var vtkInteractorStyleUser) {.
    importcpp: "OnRightButtonUp", header: "vtkInteractorStyleUser.h".}
proc OnMouseWheelForward*(this: var vtkInteractorStyleUser) {.
    importcpp: "OnMouseWheelForward", header: "vtkInteractorStyleUser.h".}
proc OnMouseWheelBackward*(this: var vtkInteractorStyleUser) {.
    importcpp: "OnMouseWheelBackward", header: "vtkInteractorStyleUser.h".}
proc OnChar*(this: var vtkInteractorStyleUser) {.importcpp: "OnChar",
    header: "vtkInteractorStyleUser.h".}
proc OnKeyPress*(this: var vtkInteractorStyleUser) {.importcpp: "OnKeyPress",
    header: "vtkInteractorStyleUser.h".}
proc OnKeyRelease*(this: var vtkInteractorStyleUser) {.importcpp: "OnKeyRelease",
    header: "vtkInteractorStyleUser.h".}
proc OnExpose*(this: var vtkInteractorStyleUser) {.importcpp: "OnExpose",
    header: "vtkInteractorStyleUser.h".}
proc OnConfigure*(this: var vtkInteractorStyleUser) {.importcpp: "OnConfigure",
    header: "vtkInteractorStyleUser.h".}
proc OnEnter*(this: var vtkInteractorStyleUser) {.importcpp: "OnEnter",
    header: "vtkInteractorStyleUser.h".}
proc OnLeave*(this: var vtkInteractorStyleUser) {.importcpp: "OnLeave",
    header: "vtkInteractorStyleUser.h".}
proc OnTimer*(this: var vtkInteractorStyleUser) {.importcpp: "OnTimer",
    header: "vtkInteractorStyleUser.h".}