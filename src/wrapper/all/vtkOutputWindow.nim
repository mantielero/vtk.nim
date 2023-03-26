## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOutputWindow.h
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
##  @class   vtkOutputWindow
##  @brief   base class for writing debug output to a console
##
##  This class is used to encapsulate all text output, so that it will work
##  with operating systems that have a stdout and stderr, and ones that
##  do not.  (i.e windows does not).  Sub-classes can be provided which can
##  redirect the output to a window.
##

import
  vtkCommonCoreModule, vtkDebugLeaksManager, vtkObject

type
  vtkOutputWindowCleanup* {.importcpp: "vtkOutputWindowCleanup",
                           header: "vtkOutputWindow.h", bycopy.} = object


proc constructvtkOutputWindowCleanup*(): vtkOutputWindowCleanup {.constructor,
    importcpp: "vtkOutputWindowCleanup(@)", header: "vtkOutputWindow.h".}
proc destroyvtkOutputWindowCleanup*(this: var vtkOutputWindowCleanup) {.
    importcpp: "#.~vtkOutputWindowCleanup()", header: "vtkOutputWindow.h".}
discard "forward decl of vtkOutputWindowPrivateAccessor"
type
  vtkOutputWindow* {.importcpp: "vtkOutputWindow", header: "vtkOutputWindow.h",
                    bycopy.} = object of vtkObject ##  Methods from vtkObject
    vtkOutputWindow* {.importc: "vtkOutputWindow".}: VTK_NEWINSTANCE
    ##  used to suppress display to output streams from standard macros when
    ##  logging is enabled.

  vtkOutputWindowSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOutputWindow::IsTypeOf(@)", header: "vtkOutputWindow.h".}
proc IsA*(this: var vtkOutputWindow; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkOutputWindow.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOutputWindow {.
    importcpp: "vtkOutputWindow::SafeDownCast(@)", header: "vtkOutputWindow.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOutputWindow :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOutputWindow :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOutputWindow :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkOutputWindow; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkOutputWindow.h".}
proc New*(): ptr vtkOutputWindow {.importcpp: "vtkOutputWindow::New(@)",
                               header: "vtkOutputWindow.h".}
proc GetInstance*(): ptr vtkOutputWindow {.importcpp: "vtkOutputWindow::GetInstance(@)",
                                       header: "vtkOutputWindow.h".}
proc SetInstance*(instance: ptr vtkOutputWindow) {.
    importcpp: "vtkOutputWindow::SetInstance(@)", header: "vtkOutputWindow.h".}
proc DisplayText*(this: var vtkOutputWindow; a2: cstring) {.importcpp: "DisplayText",
    header: "vtkOutputWindow.h".}
proc DisplayErrorText*(this: var vtkOutputWindow; a2: cstring) {.
    importcpp: "DisplayErrorText", header: "vtkOutputWindow.h".}
proc DisplayWarningText*(this: var vtkOutputWindow; a2: cstring) {.
    importcpp: "DisplayWarningText", header: "vtkOutputWindow.h".}
proc DisplayGenericWarningText*(this: var vtkOutputWindow; a2: cstring) {.
    importcpp: "DisplayGenericWarningText", header: "vtkOutputWindow.h".}
proc DisplayDebugText*(this: var vtkOutputWindow; a2: cstring) {.
    importcpp: "DisplayDebugText", header: "vtkOutputWindow.h".}
proc PromptUserOn*(this: var vtkOutputWindow) {.importcpp: "PromptUserOn",
    header: "vtkOutputWindow.h".}
proc PromptUserOff*(this: var vtkOutputWindow) {.importcpp: "PromptUserOff",
    header: "vtkOutputWindow.h".}
proc SetPromptUser*(this: var vtkOutputWindow; _arg: bool) {.
    importcpp: "SetPromptUser", header: "vtkOutputWindow.h".}
  ## /@}
  ## /@{
  ## *
  ##  Flag indicates how the vtkOutputWindow handles displaying of text to
  ##  `stderr` / `stdout`. Default is `DEFAULT` except in
  ##  `vtkWin32OutputWindow` where on non dashboard runs, the default is
  ##  `NEVER`.
  ##
  ##  `NEVER` indicates that the messages should never be forwarded to the
  ##  standard output/error streams.
  ##
  ##  `ALWAYS` will result in error/warning/debug messages being posted to the
  ##  standard error stream, while text messages to standard output stream.
  ##
  ##  `ALWAYS_STDERR` will result in all messages being posted to the standard
  ##  error stream (this was default behavior in VTK 8.1 and earlier).
  ##
  ##  `DEFAULT` is similar to `ALWAYS` except when logging is enabled. If
  ##  logging is enabled, messages posted to the output window using VTK error/warning macros such as
  ##  `vtkErrorMacro`, `vtkWarningMacro` etc. will not posted on any of the output streams. This is
  ##  done to avoid duplicate messages on these streams since these macros also result in add items
  ##  to the log.
  ##
  ##  @note vtkStringOutputWindow does not result this flag as is never forwards
  ##  any text to the output streams.
  ##
type
  vtkOutputWindowDisplayModes* {.size: sizeof(cint),
                                importcpp: "vtkOutputWindow::DisplayModes",
                                header: "vtkOutputWindow.h".} = enum
    DEFAULT = -1, NEVER = 0, ALWAYS = 1, ALWAYS_STDERR = 2


proc SetDisplayMode*(this: var vtkOutputWindow; _arg: cint) {.
    importcpp: "SetDisplayMode", header: "vtkOutputWindow.h".}
proc GetDisplayModeMinValue*(this: var vtkOutputWindow): cint {.
    importcpp: "GetDisplayModeMinValue", header: "vtkOutputWindow.h".}
proc GetDisplayModeMaxValue*(this: var vtkOutputWindow): cint {.
    importcpp: "GetDisplayModeMaxValue", header: "vtkOutputWindow.h".}
## !!!Ignored construct:  virtual int GetDisplayMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DisplayMode  of  << this -> DisplayMode ) ; return this -> DisplayMode ; } ;
## Error: expected ';'!!!

proc SetDisplayModeToDefault*(this: var vtkOutputWindow) {.
    importcpp: "SetDisplayModeToDefault", header: "vtkOutputWindow.h".}
proc SetDisplayModeToNever*(this: var vtkOutputWindow) {.
    importcpp: "SetDisplayModeToNever", header: "vtkOutputWindow.h".}
proc SetDisplayModeToAlways*(this: var vtkOutputWindow) {.
    importcpp: "SetDisplayModeToAlways", header: "vtkOutputWindow.h".}
proc SetDisplayModeToAlwaysStdErr*(this: var vtkOutputWindow) {.
    importcpp: "SetDisplayModeToAlwaysStdErr", header: "vtkOutputWindow.h".}
## !!!Ignored construct:  *
##  Returns the current message type. Useful in subclasses that simply want to
##  override `DisplayText` and also know what type of message is being
##  processed.
##  virtual MessageTypes GetDisplayModeCurrentMessageTypeCurrentMessageType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CurrentMessageType  of  << this -> CurrentMessageType ) ; return this -> CurrentMessageType ; } ;
## Error: expected ';'!!!

##  Uses schwartz counter idiom for singleton management

var vtkOutputWindowCleanupInstance* {.importcpp: "vtkOutputWindowCleanupInstance",
                                    header: "vtkOutputWindow.h".}: vtkOutputWindowCleanup
