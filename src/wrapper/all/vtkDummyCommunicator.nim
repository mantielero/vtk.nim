## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDummyCommunicator.h
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
##  @class   vtkDummyCommunicator
##  @brief   Dummy controller for single process applications.
##
##
##
##  This is a dummy communicator, which can be used by applications that always
##  require a controller but are also compiled on systems without threads or MPI.
##  Because there is always only one process, no real communication takes place.
##
##

import
  vtkCommunicator, vtkParallelCoreModule

type
  vtkDummyCommunicator* {.importcpp: "vtkDummyCommunicator",
                         header: "vtkDummyCommunicator.h", bycopy.} = object of vtkCommunicator
    vtkDummyCommunicator* {.importc: "vtkDummyCommunicator".}: VTK_NEWINSTANCE

  vtkDummyCommunicatorSuperclass* = vtkCommunicator

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkDummyCommunicator::IsTypeOf(@)",
    header: "vtkDummyCommunicator.h".}
proc IsA*(this: var vtkDummyCommunicator; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkDummyCommunicator.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkDummyCommunicator {.
    importcpp: "vtkDummyCommunicator::SafeDownCast(@)",
    header: "vtkDummyCommunicator.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkDummyCommunicator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCommunicator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDummyCommunicator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDummyCommunicator :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc New*(): ptr vtkDummyCommunicator {.importcpp: "vtkDummyCommunicator::New(@)",
                                    header: "vtkDummyCommunicator.h".}
proc PrintSelf*(this: var vtkDummyCommunicator; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkDummyCommunicator.h".}
proc SendVoidArray*(this: var vtkDummyCommunicator; a2: pointer; a3: vtkIdType;
                   a4: cint; a5: cint; a6: cint): cint {.importcpp: "SendVoidArray",
    header: "vtkDummyCommunicator.h".}
proc ReceiveVoidArray*(this: var vtkDummyCommunicator; a2: pointer; a3: vtkIdType;
                      a4: cint; a5: cint; a6: cint): cint {.
    importcpp: "ReceiveVoidArray", header: "vtkDummyCommunicator.h".}