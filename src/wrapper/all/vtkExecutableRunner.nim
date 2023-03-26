## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExecutableRunner.h
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

import
  vtkCommonSystemModule, vtkObject, vtksys/Process

## *
##  @class   vtkExecutableRunner
##  @brief   Launch a process on the current machine and get its output
##
##  Launch a process on the current machine and get its standard output and
##  standard error output.
##

type
  vtkExecutableRunner* {.importcpp: "vtkExecutableRunner",
                        header: "vtkExecutableRunner.h", bycopy.} = object of vtkObject
    vtkExecutableRunner* {.importc: "vtkExecutableRunner".}: VTK_NEWINSTANCE


proc New*(): ptr vtkExecutableRunner {.importcpp: "vtkExecutableRunner::New(@)",
                                   header: "vtkExecutableRunner.h".}
type
  vtkExecutableRunnerSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkExecutableRunner::IsTypeOf(@)", header: "vtkExecutableRunner.h".}
proc IsA*(this: var vtkExecutableRunner; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkExecutableRunner.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkExecutableRunner {.
    importcpp: "vtkExecutableRunner::SafeDownCast(@)",
    header: "vtkExecutableRunner.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkExecutableRunner :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExecutableRunner :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExecutableRunner :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkExecutableRunner; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkExecutableRunner.h".}
proc constructvtkExecutableRunner*(): vtkExecutableRunner {.constructor,
    importcpp: "vtkExecutableRunner(@)", header: "vtkExecutableRunner.h".}
proc destroyvtkExecutableRunner*(this: var vtkExecutableRunner) {.
    importcpp: "#.~vtkExecutableRunner()", header: "vtkExecutableRunner.h".}
proc Execute*(this: var vtkExecutableRunner) {.importcpp: "Execute",
    header: "vtkExecutableRunner.h".}
proc SetTimeout*(this: var vtkExecutableRunner; _arg: cdouble) {.
    importcpp: "SetTimeout", header: "vtkExecutableRunner.h".}
## !!!Ignored construct:  virtual double GetTimeout ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Timeout  of  << this -> Timeout ) ; return this -> Timeout ; } ;
## Error: expected ';'!!!

proc SetTimeoutRightTrimResult*(this: var vtkExecutableRunner; _arg: bool) {.
    importcpp: "SetTimeoutRightTrimResult", header: "vtkExecutableRunner.h".}
## !!!Ignored construct:  virtual bool GetTimeoutRightTrimResult ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RightTrimResult  of  << this -> RightTrimResult ) ; return this -> RightTrimResult ; } ;
## Error: expected ';'!!!

proc RightTrimResultOn*(this: var vtkExecutableRunner) {.
    importcpp: "RightTrimResultOn", header: "vtkExecutableRunner.h".}
proc RightTrimResultOff*(this: var vtkExecutableRunner) {.
    importcpp: "RightTrimResultOff", header: "vtkExecutableRunner.h".}
  ## @}
  ## @{
  ## *
  ##  Set/Get command to execute. An empty command will do nothing.
  ##
proc GetCommand*(this: var vtkExecutableRunner): cstring {.importcpp: "GetCommand",
    header: "vtkExecutableRunner.h".}
proc SetCommand*(this: var vtkExecutableRunner; arg: cstring) {.
    importcpp: "SetCommand", header: "vtkExecutableRunner.h".}
  ## @}
  ## @{
  ## *
  ##  Get output of the previously run command.
  ##
proc GetCommandStdOut*(this: var vtkExecutableRunner): cstring {.
    importcpp: "GetCommandStdOut", header: "vtkExecutableRunner.h".}
proc GetCommandStdOutStdErr*(this: var vtkExecutableRunner): cstring {.
    importcpp: "GetCommandStdOutStdErr", header: "vtkExecutableRunner.h".}
  ## @}
  ## *
  ##  Get return value of last command. If no command has been
  ##  executed or if the command has failed in some way value is != 0,
  ##  else return 0.
  ##
## !!!Ignored construct:  virtual int GetTimeoutRightTrimResultReturnValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReturnValue  of  << this -> ReturnValue ) ; return this -> ReturnValue ; } ;
## Error: expected ';'!!!
