## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMPICommunicator.h
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
##  @class   vtkMPICommunicator
##  @brief   Class for creating user defined MPI communicators.
##
##
##  This class can be used to create user defined MPI communicators.
##  The actual creation (with MPI_Comm_create) occurs in Initialize
##  which takes as arguments a super-communicator and a group of
##  process ids. The new communicator is created by including the
##  processes contained in the group. The global communicator
##  (equivalent to MPI_COMM_WORLD) can be obtained using the class
##  method GetWorldCommunicator. It is important to note that
##  this communicator should not be used on the processes not contained
##  in the group. For example, if the group contains processes 0 and 1,
##  controller->SetCommunicator(communicator) would cause an MPI error
##  on any other process.
##
##  @sa
##  vtkMPIController vtkProcessGroup
##

import
  vtkCommunicator, vtkParallelMPIModule

discard "forward decl of vtkMPIController"
discard "forward decl of vtkProcessGroup"
discard "forward decl of vtkMPICommunicatorOpaqueComm"
discard "forward decl of vtkMPICommunicatorOpaqueRequest"
discard "forward decl of vtkMPICommunicatorReceiveDataInfo"
type
  vtkMPICommunicator* {.importcpp: "vtkMPICommunicator",
                       header: "vtkMPICommunicator.h", bycopy.} = object of vtkCommunicator
    vtkMPICommunicator* {.importc: "vtkMPICommunicator".}: VTK_NEWINSTANCE

  vtkMPICommunicatorRequest* {.importcpp: "vtkMPICommunicator::Request",
                              header: "vtkMPICommunicator.h", bycopy.} = object
    Req* {.importc: "Req".}: ptr vtkMPICommunicatorOpaqueRequest


proc constructvtkMPICommunicatorRequest*(): vtkMPICommunicatorRequest {.
    constructor, importcpp: "vtkMPICommunicator::Request(@)",
    header: "vtkMPICommunicator.h".}
proc constructvtkMPICommunicatorRequest*(a1: vtkMPICommunicatorRequest): vtkMPICommunicatorRequest {.
    constructor, importcpp: "vtkMPICommunicator::Request(@)",
    header: "vtkMPICommunicator.h".}
proc destroyvtkMPICommunicatorRequest*(this: var vtkMPICommunicatorRequest) {.
    importcpp: "#.~Request()", header: "vtkMPICommunicator.h".}
proc Test*(this: var vtkMPICommunicatorRequest): cint {.importcpp: "Test",
    header: "vtkMPICommunicator.h".}
proc Cancel*(this: var vtkMPICommunicatorRequest) {.importcpp: "Cancel",
    header: "vtkMPICommunicator.h".}
proc Wait*(this: var vtkMPICommunicatorRequest) {.importcpp: "Wait",
    header: "vtkMPICommunicator.h".}
type
  vtkMPICommunicatorSuperclass* = vtkCommunicator

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkMPICommunicator::IsTypeOf(@)", header: "vtkMPICommunicator.h".}
proc IsA*(this: var vtkMPICommunicator; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkMPICommunicator.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkMPICommunicator {.
    importcpp: "vtkMPICommunicator::SafeDownCast(@)",
    header: "vtkMPICommunicator.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkMPICommunicator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCommunicator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMPICommunicator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMPICommunicator :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkMPICommunicator; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkMPICommunicator.h".}
proc New*(): ptr vtkMPICommunicator {.importcpp: "vtkMPICommunicator::New(@)",
                                  header: "vtkMPICommunicator.h".}
proc GetWorldCommunicator*(): ptr vtkMPICommunicator {.
    importcpp: "vtkMPICommunicator::GetWorldCommunicator(@)",
    header: "vtkMPICommunicator.h".}
proc Initialize*(this: var vtkMPICommunicator; group: ptr vtkProcessGroup): cint {.
    importcpp: "Initialize", header: "vtkMPICommunicator.h".}
proc SplitInitialize*(this: var vtkMPICommunicator; oldcomm: ptr vtkCommunicator;
                     color: cint; key: cint): cint {.importcpp: "SplitInitialize",
    header: "vtkMPICommunicator.h".}
proc SendVoidArray*(this: var vtkMPICommunicator; data: pointer; length: vtkIdType;
                   `type`: cint; remoteProcessId: cint; tag: cint): cint {.
    importcpp: "SendVoidArray", header: "vtkMPICommunicator.h".}
proc ReceiveVoidArray*(this: var vtkMPICommunicator; data: pointer; length: vtkIdType;
                      `type`: cint; remoteProcessId: cint; tag: cint): cint {.
    importcpp: "ReceiveVoidArray", header: "vtkMPICommunicator.h".}
proc NoBlockSend*(this: var vtkMPICommunicator; data: ptr cint; length: cint;
                 remoteProcessId: cint; tag: cint;
                 req: var vtkMPICommunicatorRequest): cint {.
    importcpp: "NoBlockSend", header: "vtkMPICommunicator.h".}
proc NoBlockSend*(this: var vtkMPICommunicator; data: ptr culong; length: cint;
                 remoteProcessId: cint; tag: cint;
                 req: var vtkMPICommunicatorRequest): cint {.
    importcpp: "NoBlockSend", header: "vtkMPICommunicator.h".}
proc NoBlockSend*(this: var vtkMPICommunicator; data: cstring; length: cint;
                 remoteProcessId: cint; tag: cint;
                 req: var vtkMPICommunicatorRequest): cint {.
    importcpp: "NoBlockSend", header: "vtkMPICommunicator.h".}
proc NoBlockSend*(this: var vtkMPICommunicator; data: ptr cuchar; length: cint;
                 remoteProcessId: cint; tag: cint;
                 req: var vtkMPICommunicatorRequest): cint {.
    importcpp: "NoBlockSend", header: "vtkMPICommunicator.h".}
proc NoBlockSend*(this: var vtkMPICommunicator; data: ptr cfloat; length: cint;
                 remoteProcessId: cint; tag: cint;
                 req: var vtkMPICommunicatorRequest): cint {.
    importcpp: "NoBlockSend", header: "vtkMPICommunicator.h".}
proc NoBlockSend*(this: var vtkMPICommunicator; data: ptr cdouble; length: cint;
                 remoteProcessId: cint; tag: cint;
                 req: var vtkMPICommunicatorRequest): cint {.
    importcpp: "NoBlockSend", header: "vtkMPICommunicator.h".}
when defined(VTK_USE_64BIT_IDS):
  proc NoBlockSend*(this: var vtkMPICommunicator; data: ptr vtkIdType; length: cint;
                   remoteProcessId: cint; tag: cint;
                   req: var vtkMPICommunicatorRequest): cint {.
      importcpp: "NoBlockSend", header: "vtkMPICommunicator.h".}
proc NoBlockReceive*(this: var vtkMPICommunicator; data: ptr cint; length: cint;
                    remoteProcessId: cint; tag: cint;
                    req: var vtkMPICommunicatorRequest): cint {.
    importcpp: "NoBlockReceive", header: "vtkMPICommunicator.h".}
proc NoBlockReceive*(this: var vtkMPICommunicator; data: ptr culong; length: cint;
                    remoteProcessId: cint; tag: cint;
                    req: var vtkMPICommunicatorRequest): cint {.
    importcpp: "NoBlockReceive", header: "vtkMPICommunicator.h".}
proc NoBlockReceive*(this: var vtkMPICommunicator; data: cstring; length: cint;
                    remoteProcessId: cint; tag: cint;
                    req: var vtkMPICommunicatorRequest): cint {.
    importcpp: "NoBlockReceive", header: "vtkMPICommunicator.h".}
proc NoBlockReceive*(this: var vtkMPICommunicator; data: ptr cuchar; length: cint;
                    remoteProcessId: cint; tag: cint;
                    req: var vtkMPICommunicatorRequest): cint {.
    importcpp: "NoBlockReceive", header: "vtkMPICommunicator.h".}
proc NoBlockReceive*(this: var vtkMPICommunicator; data: ptr cfloat; length: cint;
                    remoteProcessId: cint; tag: cint;
                    req: var vtkMPICommunicatorRequest): cint {.
    importcpp: "NoBlockReceive", header: "vtkMPICommunicator.h".}
proc NoBlockReceive*(this: var vtkMPICommunicator; data: ptr cdouble; length: cint;
                    remoteProcessId: cint; tag: cint;
                    req: var vtkMPICommunicatorRequest): cint {.
    importcpp: "NoBlockReceive", header: "vtkMPICommunicator.h".}
when defined(VTK_USE_64BIT_IDS):
  proc NoBlockReceive*(this: var vtkMPICommunicator; data: ptr vtkIdType; length: cint;
                      remoteProcessId: cint; tag: cint;
                      req: var vtkMPICommunicatorRequest): cint {.
      importcpp: "NoBlockReceive", header: "vtkMPICommunicator.h".}
proc Barrier*(this: var vtkMPICommunicator) {.importcpp: "Barrier",
    header: "vtkMPICommunicator.h".}
proc BroadcastVoidArray*(this: var vtkMPICommunicator; data: pointer;
                        length: vtkIdType; `type`: cint; srcProcessId: cint): cint {.
    importcpp: "BroadcastVoidArray", header: "vtkMPICommunicator.h".}
proc GatherVoidArray*(this: var vtkMPICommunicator; sendBuffer: pointer;
                     recvBuffer: pointer; length: vtkIdType; `type`: cint;
                     destProcessId: cint): cint {.importcpp: "GatherVoidArray",
    header: "vtkMPICommunicator.h".}
proc GatherVVoidArray*(this: var vtkMPICommunicator; sendBuffer: pointer;
                      recvBuffer: pointer; sendLength: vtkIdType;
                      recvLengths: ptr vtkIdType; offsets: ptr vtkIdType;
                      `type`: cint; destProcessId: cint): cint {.
    importcpp: "GatherVVoidArray", header: "vtkMPICommunicator.h".}
proc ScatterVoidArray*(this: var vtkMPICommunicator; sendBuffer: pointer;
                      recvBuffer: pointer; length: vtkIdType; `type`: cint;
                      srcProcessId: cint): cint {.importcpp: "ScatterVoidArray",
    header: "vtkMPICommunicator.h".}
proc ScatterVVoidArray*(this: var vtkMPICommunicator; sendBuffer: pointer;
                       recvBuffer: pointer; sendLengths: ptr vtkIdType;
                       offsets: ptr vtkIdType; recvLength: vtkIdType; `type`: cint;
                       srcProcessId: cint): cint {.importcpp: "ScatterVVoidArray",
    header: "vtkMPICommunicator.h".}
proc AllGatherVoidArray*(this: var vtkMPICommunicator; sendBuffer: pointer;
                        recvBuffer: pointer; length: vtkIdType; `type`: cint): cint {.
    importcpp: "AllGatherVoidArray", header: "vtkMPICommunicator.h".}
proc AllGatherVVoidArray*(this: var vtkMPICommunicator; sendBuffer: pointer;
                         recvBuffer: pointer; sendLength: vtkIdType;
                         recvLengths: ptr vtkIdType; offsets: ptr vtkIdType;
                         `type`: cint): cint {.importcpp: "AllGatherVVoidArray",
    header: "vtkMPICommunicator.h".}
proc ReduceVoidArray*(this: var vtkMPICommunicator; sendBuffer: pointer;
                     recvBuffer: pointer; length: vtkIdType; `type`: cint;
                     operation: cint; destProcessId: cint): cint {.
    importcpp: "ReduceVoidArray", header: "vtkMPICommunicator.h".}
proc ReduceVoidArray*(this: var vtkMPICommunicator; sendBuffer: pointer;
                     recvBuffer: pointer; length: vtkIdType; `type`: cint;
                     operation: ptr Operation; destProcessId: cint): cint {.
    importcpp: "ReduceVoidArray", header: "vtkMPICommunicator.h".}
proc AllReduceVoidArray*(this: var vtkMPICommunicator; sendBuffer: pointer;
                        recvBuffer: pointer; length: vtkIdType; `type`: cint;
                        operation: cint): cint {.importcpp: "AllReduceVoidArray",
    header: "vtkMPICommunicator.h".}
proc AllReduceVoidArray*(this: var vtkMPICommunicator; sendBuffer: pointer;
                        recvBuffer: pointer; length: vtkIdType; `type`: cint;
                        operation: ptr Operation): cint {.
    importcpp: "AllReduceVoidArray", header: "vtkMPICommunicator.h".}
proc Iprobe*(this: var vtkMPICommunicator; source: cint; tag: cint; flag: ptr cint;
            actualSource: ptr cint): cint {.importcpp: "Iprobe",
                                        header: "vtkMPICommunicator.h".}
proc Iprobe*(this: var vtkMPICommunicator; source: cint; tag: cint; flag: ptr cint;
            actualSource: ptr cint; `type`: ptr cint; size: ptr cint): cint {.
    importcpp: "Iprobe", header: "vtkMPICommunicator.h".}
proc Iprobe*(this: var vtkMPICommunicator; source: cint; tag: cint; flag: ptr cint;
            actualSource: ptr cint; `type`: ptr culong; size: ptr cint): cint {.
    importcpp: "Iprobe", header: "vtkMPICommunicator.h".}
proc Iprobe*(this: var vtkMPICommunicator; source: cint; tag: cint; flag: ptr cint;
            actualSource: ptr cint; `type`: cstring; size: ptr cint): cint {.
    importcpp: "Iprobe", header: "vtkMPICommunicator.h".}
proc Iprobe*(this: var vtkMPICommunicator; source: cint; tag: cint; flag: ptr cint;
            actualSource: ptr cint; `type`: ptr cfloat; size: ptr cint): cint {.
    importcpp: "Iprobe", header: "vtkMPICommunicator.h".}
proc Iprobe*(this: var vtkMPICommunicator; source: cint; tag: cint; flag: ptr cint;
            actualSource: ptr cint; `type`: ptr cdouble; size: ptr cint): cint {.
    importcpp: "Iprobe", header: "vtkMPICommunicator.h".}
proc WaitAll*(this: var vtkMPICommunicator; count: cint;
             requests: ptr vtkMPICommunicatorRequest): cint {.importcpp: "WaitAll",
    header: "vtkMPICommunicator.h".}
## !!!Ignored construct:  *
##  Blocks until *one* of the specified requests in the given request array
##  completes. Upon return, the index in the array of the completed request
##  object is returned through the argument list.
##  int WaitAny ( const int count , Request requests [ ] , int & idx ) VTK_SIZEHINT ( requests , count ) ;
## Error: expected ';'!!!

## !!!Ignored construct:  *
##  Blocks until *one or more* of the specified requests in the given request
##  request array completes. Upon return, the list of handles that have
##  completed is stored in the completed vtkIntArray.
##  int WaitSome ( const int count , Request requests [ ] , int & NCompleted , int * completed ) VTK_SIZEHINT ( requests , count ) ;
## Error: expected ';'!!!

## !!!Ignored construct:  *
##  Checks if the given communication request objects are complete. Upon
##  return, flag evaluates to true iff *all* of the communication request
##  objects are complete.
##  int TestAll ( const int count , Request requests [ ] , int & flag ) VTK_SIZEHINT ( requests , count ) ;
## Error: expected ';'!!!

## !!!Ignored construct:  *
##  Check if at least *one* of the specified requests has completed.
##  int TestAny ( const int count , Request requests [ ] , int & idx , int & flag ) VTK_SIZEHINT ( requests , count ) ;
## Error: expected ';'!!!

## !!!Ignored construct:  *
##  Checks the status of *all* the given request communication object handles.
##  Upon return, NCompleted holds the count of requests that have completed
##  and the indices of the completed requests, w.r.t. the requests array is
##  given the by the pre-allocated completed array.
##  int TestSome ( const int count , Request requests [ ] , int & NCompleted , int * completed ) VTK_SIZEHINT ( requests , count ) ;
## Error: expected ';'!!!

proc GetMPIComm*(this: var vtkMPICommunicator): ptr vtkMPICommunicatorOpaqueComm {.
    importcpp: "GetMPIComm", header: "vtkMPICommunicator.h".}
proc InitializeExternal*(this: var vtkMPICommunicator;
                        comm: ptr vtkMPICommunicatorOpaqueComm): cint {.
    importcpp: "InitializeExternal", header: "vtkMPICommunicator.h".}
proc Allocate*(size: csize_t): cstring {.importcpp: "vtkMPICommunicator::Allocate(@)",
                                     header: "vtkMPICommunicator.h".}
proc Free*(`ptr`: cstring) {.importcpp: "vtkMPICommunicator::Free(@)",
                          header: "vtkMPICommunicator.h".}
proc SetUseSsend*(this: var vtkMPICommunicator; _arg: cint) {.
    importcpp: "SetUseSsend", header: "vtkMPICommunicator.h".}
proc GetUseSsendMinValue*(this: var vtkMPICommunicator): cint {.
    importcpp: "GetUseSsendMinValue", header: "vtkMPICommunicator.h".}
proc GetUseSsendMaxValue*(this: var vtkMPICommunicator): cint {.
    importcpp: "GetUseSsendMaxValue", header: "vtkMPICommunicator.h".}
## !!!Ignored construct:  virtual int GetUseSsend ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseSsend  of  << this -> UseSsend ) ; return this -> UseSsend ; } ;
## Error: expected ';'!!!

proc UseSsendOn*(this: var vtkMPICommunicator) {.importcpp: "UseSsendOn",
    header: "vtkMPICommunicator.h".}
proc UseSsendOff*(this: var vtkMPICommunicator) {.importcpp: "UseSsendOff",
    header: "vtkMPICommunicator.h".}
  ## /@}
  ## *
  ##  Copies all the attributes of source, deleting previously
  ##  stored data. The MPI communicator handle is also copied.
  ##  Normally, this should not be needed. It is used during
  ##  the construction of a new communicator for copying the
  ##  world communicator, keeping the same context.
  ##
proc CopyFrom*(this: var vtkMPICommunicator; source: ptr vtkMPICommunicator) {.
    importcpp: "CopyFrom", header: "vtkMPICommunicator.h".}