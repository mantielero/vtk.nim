## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSMPProgressObserver.h
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
##  @class   vtkSMPProgressObserver
##  @brief   Progress observer that is thread safe
##
##  vtkSMPProgressObserver is designed to handle progress events coming
##  from an algorithm in a thread safe way. It does this by using
##  thread local objects that it updates. To receive the progress
##  information, one has to listen to the local observer in the same
##  thread. Since the execution will be somewhat load balanced,
##  it may be enough to do this only on the main thread.
##

import
  vtkCommonExecutionModelModule, vtkProgressObserver, vtkSMPThreadLocalObject

type
  vtkSMPProgressObserver* {.importcpp: "vtkSMPProgressObserver",
                           header: "vtkSMPProgressObserver.h", bycopy.} = object of vtkProgressObserver
    vtkSMPProgressObserver* {.importc: "vtkSMPProgressObserver".}: VTK_NEWINSTANCE


proc New*(): ptr vtkSMPProgressObserver {.importcpp: "vtkSMPProgressObserver::New(@)",
                                      header: "vtkSMPProgressObserver.h".}
type
  vtkSMPProgressObserverSuperclass* = vtkProgressObserver

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSMPProgressObserver::IsTypeOf(@)",
    header: "vtkSMPProgressObserver.h".}
proc IsA*(this: var vtkSMPProgressObserver; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkSMPProgressObserver.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSMPProgressObserver {.
    importcpp: "vtkSMPProgressObserver::SafeDownCast(@)",
    header: "vtkSMPProgressObserver.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSMPProgressObserver :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkProgressObserver :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSMPProgressObserver :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSMPProgressObserver :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSMPProgressObserver; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkSMPProgressObserver.h".}
proc UpdateProgress*(this: var vtkSMPProgressObserver; progress: cdouble) {.
    importcpp: "UpdateProgress", header: "vtkSMPProgressObserver.h".}
proc GetLocalObserver*(this: var vtkSMPProgressObserver): ptr vtkProgressObserver {.
    importcpp: "GetLocalObserver", header: "vtkSMPProgressObserver.h".}