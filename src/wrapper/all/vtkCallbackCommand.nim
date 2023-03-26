## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCallbackCommand.h
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
##  @class   vtkCallbackCommand
##  @brief   supports function callbacks
##
##  Use vtkCallbackCommand for generic function callbacks. That is, this class
##  can be used when you wish to execute a function (of the signature
##  described below) using the Command/Observer design pattern in VTK.
##  The callback function should have the form
##  <pre>
##  void func(vtkObject*, unsigned long eid, void* clientdata, void *calldata)
##  </pre>
##  where the parameter vtkObject* is the object invoking the event; eid is
##  the event id (see vtkCommand.h); clientdata is special data that should
##  is associated with this instance of vtkCallbackCommand; and calldata is
##  data that the vtkObject::InvokeEvent() may send with the callback. For
##  example, the invocation of the ProgressEvent sends along the progress
##  value as calldata.
##
##
##  @sa
##  vtkCommand vtkOldStyleCallbackCommand
##

import
  vtkCommand, vtkCommonCoreModule

type
  vtkCallbackCommand* {.importcpp: "vtkCallbackCommand",
                       header: "vtkCallbackCommand.h", bycopy.} = object of vtkCommand
    vtkCallbackCommand* {.importc: "vtkCallbackCommand".}: VTK_NEWINSTANCE
    Callback* {.importc: "Callback".}: proc (a1: ptr vtkObject; a2: culong; a3: pointer;
        a4: pointer)
    ClientDataDeleteCallback* {.importc: "ClientDataDeleteCallback".}: proc (
        a1: pointer)

  vtkCallbackCommandSuperclass* = vtkCommand

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCallbackCommand::IsTypeOf(@)", header: "vtkCallbackCommand.h".}
proc IsA*(this: var vtkCallbackCommand; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkCallbackCommand.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCallbackCommand {.
    importcpp: "vtkCallbackCommand::SafeDownCast(@)",
    header: "vtkCallbackCommand.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCallbackCommand :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCommand :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCallbackCommand :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCallbackCommand :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc New*(): ptr vtkCallbackCommand {.importcpp: "vtkCallbackCommand::New(@)",
                                  header: "vtkCallbackCommand.h".}
proc Execute*(this: var vtkCallbackCommand; caller: ptr vtkObject; eid: culong;
             callData: pointer) {.importcpp: "Execute",
                                header: "vtkCallbackCommand.h".}
proc SetClientData*(this: var vtkCallbackCommand; cd: pointer) {.
    importcpp: "SetClientData", header: "vtkCallbackCommand.h".}
proc GetClientData*(this: var vtkCallbackCommand): pointer {.
    importcpp: "GetClientData", header: "vtkCallbackCommand.h".}
proc SetCallback*(this: var vtkCallbackCommand; f: proc (caller: ptr vtkObject;
    eid: culong; clientdata: pointer; calldata: pointer)) {.importcpp: "SetCallback",
    header: "vtkCallbackCommand.h".}
proc SetClientDataDeleteCallback*(this: var vtkCallbackCommand;
                                 f: proc (a1: pointer)) {.
    importcpp: "SetClientDataDeleteCallback", header: "vtkCallbackCommand.h".}
proc SetAbortFlagOnExecute*(this: var vtkCallbackCommand; f: cint) {.
    importcpp: "SetAbortFlagOnExecute", header: "vtkCallbackCommand.h".}
proc GetAbortFlagOnExecute*(this: var vtkCallbackCommand): cint {.
    importcpp: "GetAbortFlagOnExecute", header: "vtkCallbackCommand.h".}
proc AbortFlagOnExecuteOn*(this: var vtkCallbackCommand) {.
    importcpp: "AbortFlagOnExecuteOn", header: "vtkCallbackCommand.h".}
proc AbortFlagOnExecuteOff*(this: var vtkCallbackCommand) {.
    importcpp: "AbortFlagOnExecuteOff", header: "vtkCallbackCommand.h".}
##  VTK-HeaderTest-Exclude: vtkCallbackCommand.h
