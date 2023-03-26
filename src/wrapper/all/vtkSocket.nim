## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSocket.h
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
##  @class   vtkSocket
##  @brief   BSD socket encapsulation.
##
##  This abstract class encapsulates a BSD socket. It provides an API for
##  basic socket operations.
##

import
  vtkCommonSystemModule, vtkObject

discard "forward decl of vtkSocketCollection"
type
  vtkSocket* {.importcpp: "vtkSocket", header: "vtkSocket.h", bycopy.} = object of vtkObject
    vtkSocket* {.importc: "vtkSocket".}: VTK_NEWINSTANCE

  vtkSocketSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkSocket::IsTypeOf(@)",
    header: "vtkSocket.h".}
proc IsA*(this: var vtkSocket; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkSocket.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSocket {.
    importcpp: "vtkSocket::SafeDownCast(@)", header: "vtkSocket.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSocket :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSocket :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSocket :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSocket; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkSocket.h".}
proc GetConnected*(this: var vtkSocket): cint {.importcpp: "GetConnected",
    header: "vtkSocket.h".}
proc CloseSocket*(this: var vtkSocket) {.importcpp: "CloseSocket",
                                     header: "vtkSocket.h".}
proc Send*(this: var vtkSocket; data: pointer; length: cint): cint {.importcpp: "Send",
    header: "vtkSocket.h".}
proc Receive*(this: var vtkSocket; data: pointer; length: cint; readFully: cint = 1): cint {.
    importcpp: "Receive", header: "vtkSocket.h".}
## !!!Ignored construct:  *
##  Provides access to the internal socket descriptor. This is valid only when
##  GetConnected() returns true.
##  virtual int GetSocketDescriptorSocketDescriptor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SocketDescriptor  of  << this -> SocketDescriptor ) ; return this -> SocketDescriptor ; } ;
## Error: expected ';'!!!

proc SelectSockets*(sockets_to_select: ptr cint; size: cint; msec: culong;
                   selected_index: ptr cint): cint {.
    importcpp: "vtkSocket::SelectSockets(@)", header: "vtkSocket.h".}