## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPythonInteractiveInterpreter.h
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
##  @class   vtkPythonInteractiveInterpreter
##  @brief   interpreter for interactive shells.
##
##  vtkPythonInteractiveInterpreter provides an interpreter that can be used in
##  interactive shells. It mimics the behaviour of the interactive
##  console (much like the default Python shell) providing the "read-eval-print"
##  loops. It also handles incomplete statements correctly. It uses "code"
##  module provided by Python standard library to achieve this.
##  It uses vtkPythonInterpreter to ensure that the global
##  Python environment is setup correctly. Note that any time the
##  vtkPythonInterpreter::Finalize() is called, the interactive interpreter will
##  be destroyed as well. Subsequent calls to vtkPythonInterpreter::Push() will
##  reinitialize Python as start a new interactive interpreter shell.
##
##  This class also observers and forwards all events invoked by a
##  vtkPythonInterpreter instance include vtkCommand::EnterEvent,
##  vtkCommand::ExitEvent, vtkCommand::UpdateEvent, vtkCommand::ErrorEvent and
##  vtkCommand::SetOutputEvent.
##

import
  vtkObject, vtkPythonInterpreterModule

discard "forward decl of vtkPythonInterpreter"
type
  vtkPythonInteractiveInterpreter* {.importcpp: "vtkPythonInteractiveInterpreter", header: "vtkPythonInteractiveInterpreter.h",
                                    bycopy.} = object of vtkObject
    vtkPythonInteractiveInterpreter* {.importc: "vtkPythonInteractiveInterpreter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPythonInteractiveInterpreter {.
    importcpp: "vtkPythonInteractiveInterpreter::New(@)",
    header: "vtkPythonInteractiveInterpreter.h".}
type
  vtkPythonInteractiveInterpreterSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPythonInteractiveInterpreter::IsTypeOf(@)",
    header: "vtkPythonInteractiveInterpreter.h".}
proc IsA*(this: var vtkPythonInteractiveInterpreter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPythonInteractiveInterpreter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPythonInteractiveInterpreter {.
    importcpp: "vtkPythonInteractiveInterpreter::SafeDownCast(@)",
    header: "vtkPythonInteractiveInterpreter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPythonInteractiveInterpreter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPythonInteractiveInterpreter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPythonInteractiveInterpreter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPythonInteractiveInterpreter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkPythonInteractiveInterpreter.h".}
proc Push*(this: var vtkPythonInteractiveInterpreter; code: cstring): bool {.
    importcpp: "Push", header: "vtkPythonInteractiveInterpreter.h".}
proc Reset*(this: var vtkPythonInteractiveInterpreter) {.importcpp: "Reset",
    header: "vtkPythonInteractiveInterpreter.h".}
proc RunStringWithConsoleLocals*(this: var vtkPythonInteractiveInterpreter;
                                script: cstring): cint {.
    importcpp: "RunStringWithConsoleLocals",
    header: "vtkPythonInteractiveInterpreter.h".}
proc GetInteractiveConsolePyObject*(this: var vtkPythonInteractiveInterpreter): pointer {.
    importcpp: "GetInteractiveConsolePyObject",
    header: "vtkPythonInteractiveInterpreter.h".}
proc GetInteractiveConsoleLocalsPyObject*(
    this: var vtkPythonInteractiveInterpreter): pointer {.
    importcpp: "GetInteractiveConsoleLocalsPyObject",
    header: "vtkPythonInteractiveInterpreter.h".}