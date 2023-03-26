## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSocketCommunicator.h
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
##  @class   vtkSocketCommunicator
##  @brief   Process communication using Sockets
##
##  This is a concrete implementation of vtkCommunicator which supports
##  interprocess communication using BSD style sockets.
##  It supports byte swapping for the communication of machines
##  with different endianness.
##
##  @warning
##  Communication between 32 bit and 64 bit systems is not fully
##  supported. If a type does not have the same length on both
##  systems, this communicator can not be used to transfer data
##  of that type.
##
##  @sa
##  vtkCommunicator vtkSocketController
##

import
  vtkCommunicator, vtkEndian, vtkParallelCoreModule, vtkByteSwap

when defined(VTK_WORDS_BIGENDIAN):
  const
    vtkSwap4* = Swap4LE
    vtkSwap4Range* = Swap4LERange
    vtkSwap8* = Swap8LE
    vtkSwap8Range* = Swap8LERange
else:
  const
    vtkSwap4* = Swap4BE
    vtkSwap4Range* = Swap4BERange
    vtkSwap8* = Swap8BE
    vtkSwap8Range* = Swap8BERange
discard "forward decl of vtkClientSocket"
discard "forward decl of vtkServerSocket"
type
  vtkSocketCommunicator* {.importcpp: "vtkSocketCommunicator",
                          header: "vtkSocketCommunicator.h", bycopy.} = object of vtkCommunicator
    vtkSocketCommunicator* {.importc: "vtkSocketCommunicator".}: VTK_NEWINSTANCE
    ##   Buffer to save messages received with different tag than requested.


proc New*(): ptr vtkSocketCommunicator {.importcpp: "vtkSocketCommunicator::New(@)",
                                     header: "vtkSocketCommunicator.h".}
type
  vtkSocketCommunicatorSuperclass* = vtkCommunicator

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSocketCommunicator::IsTypeOf(@)",
    header: "vtkSocketCommunicator.h".}
proc IsA*(this: var vtkSocketCommunicator; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkSocketCommunicator.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSocketCommunicator {.
    importcpp: "vtkSocketCommunicator::SafeDownCast(@)",
    header: "vtkSocketCommunicator.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSocketCommunicator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCommunicator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSocketCommunicator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSocketCommunicator :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSocketCommunicator; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkSocketCommunicator.h".}
proc WaitForConnection*(this: var vtkSocketCommunicator; port: cint): cint {.
    importcpp: "WaitForConnection", header: "vtkSocketCommunicator.h".}
proc WaitForConnection*(this: var vtkSocketCommunicator;
                       socket: ptr vtkServerSocket; msec: culong = 0): cint {.
    importcpp: "WaitForConnection", header: "vtkSocketCommunicator.h".}
proc CloseConnection*(this: var vtkSocketCommunicator) {.
    importcpp: "CloseConnection", header: "vtkSocketCommunicator.h".}
proc ConnectTo*(this: var vtkSocketCommunicator; hostName: cstring; port: cint): cint {.
    importcpp: "ConnectTo", header: "vtkSocketCommunicator.h".}
## !!!Ignored construct:  /@{ *
##  Returns 1 if bytes must be swapped in received ints, floats, etc
##  virtual int GetSwapBytesInReceivedDataSwapBytesInReceivedData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SwapBytesInReceivedData  of  << this -> SwapBytesInReceivedData ) ; return this -> SwapBytesInReceivedData ; } ;
## Error: expected ';'!!!

proc GetIsConnected*(this: var vtkSocketCommunicator): cint {.
    importcpp: "GetIsConnected", header: "vtkSocketCommunicator.h".}
proc SetNumberOfProcesses*(this: var vtkSocketCommunicator; num: cint) {.
    importcpp: "SetNumberOfProcesses", header: "vtkSocketCommunicator.h".}
proc SendVoidArray*(this: var vtkSocketCommunicator; data: pointer; length: vtkIdType;
                   `type`: cint; remoteHandle: cint; tag: cint): cint {.
    importcpp: "SendVoidArray", header: "vtkSocketCommunicator.h".}
proc ReceiveVoidArray*(this: var vtkSocketCommunicator; data: pointer;
                      length: vtkIdType; `type`: cint; remoteHandle: cint; tag: cint): cint {.
    importcpp: "ReceiveVoidArray", header: "vtkSocketCommunicator.h".}
proc Barrier*(this: var vtkSocketCommunicator) {.importcpp: "Barrier",
    header: "vtkSocketCommunicator.h".}
proc BroadcastVoidArray*(this: var vtkSocketCommunicator; data: pointer;
                        length: vtkIdType; `type`: cint; srcProcessId: cint): cint {.
    importcpp: "BroadcastVoidArray", header: "vtkSocketCommunicator.h".}
proc GatherVoidArray*(this: var vtkSocketCommunicator; sendBuffer: pointer;
                     recvBuffer: pointer; length: vtkIdType; `type`: cint;
                     destProcessId: cint): cint {.importcpp: "GatherVoidArray",
    header: "vtkSocketCommunicator.h".}
proc GatherVVoidArray*(this: var vtkSocketCommunicator; sendBuffer: pointer;
                      recvBuffer: pointer; sendLength: vtkIdType;
                      recvLengths: ptr vtkIdType; offsets: ptr vtkIdType;
                      `type`: cint; destProcessId: cint): cint {.
    importcpp: "GatherVVoidArray", header: "vtkSocketCommunicator.h".}
proc ScatterVoidArray*(this: var vtkSocketCommunicator; sendBuffer: pointer;
                      recvBuffer: pointer; length: vtkIdType; `type`: cint;
                      srcProcessId: cint): cint {.importcpp: "ScatterVoidArray",
    header: "vtkSocketCommunicator.h".}
proc ScatterVVoidArray*(this: var vtkSocketCommunicator; sendBuffer: pointer;
                       recvBuffer: pointer; sendLengths: ptr vtkIdType;
                       offsets: ptr vtkIdType; recvLength: vtkIdType; `type`: cint;
                       srcProcessId: cint): cint {.importcpp: "ScatterVVoidArray",
    header: "vtkSocketCommunicator.h".}
proc AllGatherVoidArray*(this: var vtkSocketCommunicator; sendBuffer: pointer;
                        recvBuffer: pointer; length: vtkIdType; `type`: cint): cint {.
    importcpp: "AllGatherVoidArray", header: "vtkSocketCommunicator.h".}
proc AllGatherVVoidArray*(this: var vtkSocketCommunicator; sendBuffer: pointer;
                         recvBuffer: pointer; sendLength: vtkIdType;
                         recvLengths: ptr vtkIdType; offsets: ptr vtkIdType;
                         `type`: cint): cint {.importcpp: "AllGatherVVoidArray",
    header: "vtkSocketCommunicator.h".}
proc ReduceVoidArray*(this: var vtkSocketCommunicator; sendBuffer: pointer;
                     recvBuffer: pointer; length: vtkIdType; `type`: cint;
                     operation: cint; destProcessId: cint): cint {.
    importcpp: "ReduceVoidArray", header: "vtkSocketCommunicator.h".}
proc ReduceVoidArray*(this: var vtkSocketCommunicator; sendBuffer: pointer;
                     recvBuffer: pointer; length: vtkIdType; `type`: cint;
                     operation: ptr Operation; destProcessId: cint): cint {.
    importcpp: "ReduceVoidArray", header: "vtkSocketCommunicator.h".}
proc AllReduceVoidArray*(this: var vtkSocketCommunicator; sendBuffer: pointer;
                        recvBuffer: pointer; length: vtkIdType; `type`: cint;
                        operation: cint): cint {.importcpp: "AllReduceVoidArray",
    header: "vtkSocketCommunicator.h".}
proc AllReduceVoidArray*(this: var vtkSocketCommunicator; sendBuffer: pointer;
                        recvBuffer: pointer; length: vtkIdType; `type`: cint;
                        operation: ptr Operation): cint {.
    importcpp: "AllReduceVoidArray", header: "vtkSocketCommunicator.h".}
proc SetPerformHandshake*(this: var vtkSocketCommunicator; _arg: vtkTypeBool) {.
    importcpp: "SetPerformHandshake", header: "vtkSocketCommunicator.h".}
proc GetPerformHandshakeMinValue*(this: var vtkSocketCommunicator): vtkTypeBool {.
    importcpp: "GetPerformHandshakeMinValue", header: "vtkSocketCommunicator.h".}
proc GetPerformHandshakeMaxValue*(this: var vtkSocketCommunicator): vtkTypeBool {.
    importcpp: "GetPerformHandshakeMaxValue", header: "vtkSocketCommunicator.h".}
proc PerformHandshakeOn*(this: var vtkSocketCommunicator) {.
    importcpp: "PerformHandshakeOn", header: "vtkSocketCommunicator.h".}
proc PerformHandshakeOff*(this: var vtkSocketCommunicator) {.
    importcpp: "PerformHandshakeOff", header: "vtkSocketCommunicator.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetSwapBytesInReceivedDataSwapBytesInReceivedDataPerformHandshake ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PerformHandshake  of  << this -> PerformHandshake ) ; return this -> PerformHandshake ; } ;
## Error: expected ';'!!!

proc SetLogStream*(this: var vtkSocketCommunicator; stream: ptr ostream) {.
    importcpp: "SetLogStream", header: "vtkSocketCommunicator.h".}
proc GetLogStream*(this: var vtkSocketCommunicator): ptr ostream {.
    importcpp: "GetLogStream", header: "vtkSocketCommunicator.h".}
proc LogToFile*(this: var vtkSocketCommunicator; name: cstring): cint {.
    importcpp: "LogToFile", header: "vtkSocketCommunicator.h".}
proc LogToFile*(this: var vtkSocketCommunicator; name: cstring; append: cint): cint {.
    importcpp: "LogToFile", header: "vtkSocketCommunicator.h".}
proc SetReportErrors*(this: var vtkSocketCommunicator; _arg: cint) {.
    importcpp: "SetReportErrors", header: "vtkSocketCommunicator.h".}
## !!!Ignored construct:  virtual int GetSwapBytesInReceivedDataSwapBytesInReceivedDataPerformHandshakeReportErrors ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReportErrors  of  << this -> ReportErrors ) ; return this -> ReportErrors ; } ;
## Error: expected ';'!!!

proc GetnameSocket*(this: var vtkSocketCommunicator): ptr vtkClientSocket {.
    importcpp: "GetnameSocket", header: "vtkSocketCommunicator.h".}
proc SetSocket*(this: var vtkSocketCommunicator; a2: ptr vtkClientSocket) {.
    importcpp: "SetSocket", header: "vtkSocketCommunicator.h".}
proc Handshake*(this: var vtkSocketCommunicator): cint {.importcpp: "Handshake",
    header: "vtkSocketCommunicator.h".}
proc ServerSideHandshake*(this: var vtkSocketCommunicator): cint {.
    importcpp: "ServerSideHandshake", header: "vtkSocketCommunicator.h".}
proc ClientSideHandshake*(this: var vtkSocketCommunicator): cint {.
    importcpp: "ClientSideHandshake", header: "vtkSocketCommunicator.h".}
## !!!Ignored construct:  /@{ *
##  Returns true if this side of the socket is the server.  The result
##  is invalid if the socket is not connected.
##  virtual int GetSwapBytesInReceivedDataSwapBytesInReceivedDataPerformHandshakeReportErrorsIsServerIsServer ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IsServer  of  << this -> IsServer ) ; return this -> IsServer ; } ;
## Error: expected ';'!!!

proc GetVersion*(): cint {.importcpp: "vtkSocketCommunicator::GetVersion(@)",
                        header: "vtkSocketCommunicator.h".}
proc BufferCurrentMessage*(this: var vtkSocketCommunicator) {.
    importcpp: "BufferCurrentMessage", header: "vtkSocketCommunicator.h".}
proc HasBufferredMessages*(this: var vtkSocketCommunicator): bool {.
    importcpp: "HasBufferredMessages", header: "vtkSocketCommunicator.h".}