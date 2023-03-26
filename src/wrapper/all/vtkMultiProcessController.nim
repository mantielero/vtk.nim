## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMultiProcessController.h
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
##  @class   vtkMultiProcessController
##  @brief   Multiprocessing communication superclass
##
##  vtkMultiProcessController is used to control multiple processes
##  in a distributed computing environment. It has
##  methods for executing single/multiple method(s) on multiple processors,
##  triggering registered callbacks (Remote Methods) (AddRMI(), TriggerRMI())
##  and communication. Please note that the communication is done using
##  the communicator which is accessible to the user. Therefore it is
##  possible to get the communicator with GetCommunicator() and use
##  it to send and receive data. This is the encouraged communication method.
##  The internal (RMI) communications are done using a second internal
##  communicator (called RMICommunicator).
##
##  There are two modes for RMI communication: (1) Send/Receive mode and
##  (2) Broadcast (collective) mode. The Send/Receive mode arranges processes
##  in a binary tree using post-order traversal and propagates the RMI trigger
##  starting from the root (rank 0) to the children. It is commonly employed to
##  communicate between client/server over TCP. Although, the Send/Receive mode
##  can be employed transparently over TCP or MPI, it is not optimal for
##  triggering the RMIs on the satellite ranks. The Broadcast mode provides a
##  more desirable alternative, namely, it uses MPI_Broadcast for communication,
##  which is the nominal way of achieving this in an MPI context. The underlying
##  communication mode used for triggering RMIs is controlled by the
##  "BroadcastTriggerRMI" variable. Note, that mixing between the two modes
##  for RMI communication is not correct behavior. All processes within the
##  vtkMultiProcessController must use the same mode for triggering RMI.
##
##  @sa
##  vtkMPIController
##  vtkCommunicator vtkMPICommunicator
##

import
  vtkObject, vtkParallelCoreModule, vtkCommunicator

discard "forward decl of vtkBoundingBox"
discard "forward decl of vtkCollection"
discard "forward decl of vtkDataObject"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkImageData"
discard "forward decl of vtkMultiProcessController"
discard "forward decl of vtkMultiProcessStream"
discard "forward decl of vtkOutputWindow"
discard "forward decl of vtkProcessGroup"
discard "forward decl of vtkProcess"
discard "forward decl of vtkDataArraySelection"
type
  vtkProcessFunctionType* = proc (controller: ptr vtkMultiProcessController;
                               userData: pointer)

##  The type of function that gets called when an RMI is triggered.

type
  vtkRMIFunctionType* = proc (localArg: pointer; remoteArg: pointer;
                           remoteArgLength: cint; remoteProcessId: cint)
  vtkMultiProcessController* {.importcpp: "vtkMultiProcessController",
                              header: "vtkMultiProcessController.h", bycopy.} = object of vtkObject
    vtkMultiProcessController* {.importc: "vtkMultiProcessController".}: VTK_NEWINSTANCE
    ##  This flag can be used to indicate that an MPI Broadcast will be used
    ##  when calling TriggerRMIOnAllChildren(), instead of the binary tree
    ##  propagation of the data to the satellite ranks from rank 0.
    ##  Note that since the communicators can be created differently
    ##  depending on the type of controller, the subclasses are
    ##  responsible of deleting them.
    ##  Communicator which is a copy of the current user
    ##  level communicator except the context; i.e. even if the tags
    ##  are the same, the RMI messages will not interfere with user
    ##  level messages.
    ##  Note that since the communicators can be created differently
    ##  depending on the type of controller, the subclasses are
    ##  responsible of deleting them.

  vtkMultiProcessControllerSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkMultiProcessController::IsTypeOf(@)",
    header: "vtkMultiProcessController.h".}
proc IsA*(this: var vtkMultiProcessController; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkMultiProcessController.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkMultiProcessController {.
    importcpp: "vtkMultiProcessController::SafeDownCast(@)",
    header: "vtkMultiProcessController.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkMultiProcessController :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMultiProcessController :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMultiProcessController :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkMultiProcessController; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkMultiProcessController.h".}
proc Initialize*(this: var vtkMultiProcessController;
                vtkNotUsed: proc (a1: argc): ptr cint;
                vtkNotUsed: proc (a1: argv): ptr cstringArray) {.
    importcpp: "Initialize", header: "vtkMultiProcessController.h".}
proc Initialize*(this: var vtkMultiProcessController;
                vtkNotUsed: proc (a1: argc): ptr cint;
                vtkNotUsed: proc (a1: argv): ptr cstringArray;
                initializedExternally: cint) {.importcpp: "Initialize",
    header: "vtkMultiProcessController.h".}
proc Finalize*(this: var vtkMultiProcessController) {.importcpp: "Finalize",
    header: "vtkMultiProcessController.h".}
proc Finalize*(this: var vtkMultiProcessController; finalizedExternally: cint) {.
    importcpp: "Finalize", header: "vtkMultiProcessController.h".}
proc SetNumberOfProcesses*(this: var vtkMultiProcessController; num: cint) {.
    importcpp: "SetNumberOfProcesses", header: "vtkMultiProcessController.h".}
proc GetNumberOfProcesses*(this: var vtkMultiProcessController): cint {.
    importcpp: "GetNumberOfProcesses", header: "vtkMultiProcessController.h".}
proc SetSingleMethod*(this: var vtkMultiProcessController;
                     a2: vtkProcessFunctionType; data: pointer) {.
    importcpp: "SetSingleMethod", header: "vtkMultiProcessController.h".}
proc SetSingleProcessObject*(this: var vtkMultiProcessController; p: ptr vtkProcess) {.
    importcpp: "SetSingleProcessObject", header: "vtkMultiProcessController.h".}
proc SingleMethodExecute*(this: var vtkMultiProcessController) {.
    importcpp: "SingleMethodExecute", header: "vtkMultiProcessController.h".}
proc SetMultipleMethod*(this: var vtkMultiProcessController; index: cint;
                       a3: vtkProcessFunctionType; data: pointer) {.
    importcpp: "SetMultipleMethod", header: "vtkMultiProcessController.h".}
proc MultipleMethodExecute*(this: var vtkMultiProcessController) {.
    importcpp: "MultipleMethodExecute", header: "vtkMultiProcessController.h".}
proc GetLocalProcessId*(this: var vtkMultiProcessController): cint {.
    importcpp: "GetLocalProcessId", header: "vtkMultiProcessController.h".}
proc GetGlobalController*(): ptr vtkMultiProcessController {.
    importcpp: "vtkMultiProcessController::GetGlobalController(@)",
    header: "vtkMultiProcessController.h".}
proc CreateOutputWindow*(this: var vtkMultiProcessController) {.
    importcpp: "CreateOutputWindow", header: "vtkMultiProcessController.h".}
proc CreateSubController*(this: var vtkMultiProcessController;
                         group: ptr vtkProcessGroup): ptr vtkMultiProcessController {.
    importcpp: "CreateSubController", header: "vtkMultiProcessController.h".}
proc PartitionController*(this: var vtkMultiProcessController; localColor: cint;
                         localKey: cint): ptr vtkMultiProcessController {.
    importcpp: "PartitionController", header: "vtkMultiProcessController.h".}
proc AddRMI*(this: var vtkMultiProcessController; a2: vtkRMIFunctionType;
            localArg: pointer; tag: cint): culong {.importcpp: "AddRMI",
    header: "vtkMultiProcessController.h".}
proc RemoveFirstRMI*(this: var vtkMultiProcessController; tag: cint): cint {.
    importcpp: "RemoveFirstRMI", header: "vtkMultiProcessController.h".}
proc RemoveRMI*(this: var vtkMultiProcessController; id: culong): cint {.
    importcpp: "RemoveRMI", header: "vtkMultiProcessController.h".}
proc RemoveRMI*(this: var vtkMultiProcessController; f: vtkRMIFunctionType;
               arg: pointer; tag: cint) {.importcpp: "RemoveRMI",
                                      header: "vtkMultiProcessController.h".}
proc AddRMICallback*(this: var vtkMultiProcessController; a2: vtkRMIFunctionType;
                    localArg: pointer; tag: cint): culong {.
    importcpp: "AddRMICallback", header: "vtkMultiProcessController.h".}
proc RemoveAllRMICallbacks*(this: var vtkMultiProcessController; tag: cint) {.
    importcpp: "RemoveAllRMICallbacks", header: "vtkMultiProcessController.h".}
proc RemoveRMICallback*(this: var vtkMultiProcessController; id: culong): bool {.
    importcpp: "RemoveRMICallback", header: "vtkMultiProcessController.h".}
proc TriggerRMI*(this: var vtkMultiProcessController; remoteProcessId: cint;
                arg: pointer; argLength: cint; tag: cint) {.importcpp: "TriggerRMI",
    header: "vtkMultiProcessController.h".}
proc TriggerBreakRMIs*(this: var vtkMultiProcessController) {.
    importcpp: "TriggerBreakRMIs", header: "vtkMultiProcessController.h".}
proc TriggerRMI*(this: var vtkMultiProcessController; remoteProcessId: cint;
                arg: cstring; tag: cint) {.importcpp: "TriggerRMI",
                                       header: "vtkMultiProcessController.h".}
proc TriggerRMI*(this: var vtkMultiProcessController; remoteProcessId: cint; tag: cint) {.
    importcpp: "TriggerRMI", header: "vtkMultiProcessController.h".}
proc TriggerRMIOnAllChildren*(this: var vtkMultiProcessController; arg: pointer;
                             argLength: cint; tag: cint) {.
    importcpp: "TriggerRMIOnAllChildren", header: "vtkMultiProcessController.h".}
proc TriggerRMIOnAllChildren*(this: var vtkMultiProcessController; arg: cstring;
                             tag: cint) {.importcpp: "TriggerRMIOnAllChildren",
                                        header: "vtkMultiProcessController.h".}
proc TriggerRMIOnAllChildren*(this: var vtkMultiProcessController; tag: cint) {.
    importcpp: "TriggerRMIOnAllChildren", header: "vtkMultiProcessController.h".}
proc BroadcastTriggerRMIOnAllChildren*(this: var vtkMultiProcessController;
                                      arg: pointer; argLength: cint; tag: cint) {.
    importcpp: "BroadcastTriggerRMIOnAllChildren",
    header: "vtkMultiProcessController.h".}
proc ProcessRMIs*(this: var vtkMultiProcessController; reportErrors: cint;
                 dont_loop: cint = 0): cint {.importcpp: "ProcessRMIs",
    header: "vtkMultiProcessController.h".}
proc ProcessRMIs*(this: var vtkMultiProcessController): cint {.
    importcpp: "ProcessRMIs", header: "vtkMultiProcessController.h".}
proc BroadcastProcessRMIs*(this: var vtkMultiProcessController; reportErrors: cint;
                          dont_loop: cint = 0): cint {.
    importcpp: "BroadcastProcessRMIs", header: "vtkMultiProcessController.h".}
proc SetBreakFlag*(this: var vtkMultiProcessController; _arg: cint) {.
    importcpp: "SetBreakFlag", header: "vtkMultiProcessController.h".}
## !!!Ignored construct:  virtual int GetBreakFlag ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BreakFlag  of  << this -> BreakFlag ) ; return this -> BreakFlag ; } ;
## Error: expected ';'!!!

proc SetBreakFlagBroadcastTriggerRMI*(this: var vtkMultiProcessController;
                                     _arg: bool) {.
    importcpp: "SetBreakFlagBroadcastTriggerRMI",
    header: "vtkMultiProcessController.h".}
## !!!Ignored construct:  virtual bool GetBreakFlagBroadcastTriggerRMI ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BroadcastTriggerRMI  of  << this -> BroadcastTriggerRMI ) ; return this -> BroadcastTriggerRMI ; } ;
## Error: expected ';'!!!

proc BroadcastTriggerRMIOn*(this: var vtkMultiProcessController) {.
    importcpp: "BroadcastTriggerRMIOn", header: "vtkMultiProcessController.h".}
proc BroadcastTriggerRMIOff*(this: var vtkMultiProcessController) {.
    importcpp: "BroadcastTriggerRMIOff", header: "vtkMultiProcessController.h".}
  ## /@}
  ## /@{
  ## *
  ##  Returns the communicator associated with this controller.
  ##  A default communicator is created in constructor.
  ##
proc GetnameCommunicator*(this: var vtkMultiProcessController): ptr vtkCommunicator {.
    importcpp: "GetnameCommunicator", header: "vtkMultiProcessController.h".}
  ## /@}
  ## *
  ##  Accessor to some default tags.
  ##
proc GetBreakRMITag*(): cint {.importcpp: "vtkMultiProcessController::GetBreakRMITag(@)",
                            header: "vtkMultiProcessController.h".}
proc GetRMITag*(): cint {.importcpp: "vtkMultiProcessController::GetRMITag(@)",
                       header: "vtkMultiProcessController.h".}
proc GetRMIArgTag*(): cint {.importcpp: "vtkMultiProcessController::GetRMIArgTag(@)",
                          header: "vtkMultiProcessController.h".}
type
  vtkMultiProcessControllerErrors* {.size: sizeof(cint), importcpp: "vtkMultiProcessController::Errors",
                                    header: "vtkMultiProcessController.h".} = enum
    RMI_NO_ERROR, RMI_TAG_ERROR, RMI_ARG_ERROR


type
  vtkMultiProcessControllerConsts* {.size: sizeof(cint), importcpp: "vtkMultiProcessController::Consts",
                                    header: "vtkMultiProcessController.h".} = enum
    INVALID_SOURCE = -2, ANY_SOURCE = -1


type
  vtkMultiProcessControllerTags* {.size: sizeof(cint),
                                  importcpp: "vtkMultiProcessController::Tags",
                                  header: "vtkMultiProcessController.h".} = enum
    RMI_TAG = 1, RMI_ARG_TAG = 2, BREAK_RMI_TAG = 3, XML_WRITER_DATA_INFO = 4


proc Barrier*(this: var vtkMultiProcessController) {.importcpp: "Barrier",
    header: "vtkMultiProcessController.h".}
proc SetGlobalController*(controller: ptr vtkMultiProcessController) {.
    importcpp: "vtkMultiProcessController::SetGlobalController(@)",
    header: "vtkMultiProcessController.h".}
proc Send*(this: var vtkMultiProcessController; data: ptr cint; length: vtkIdType;
          remoteProcessId: cint; tag: cint): cint {.importcpp: "Send",
    header: "vtkMultiProcessController.h".}
proc Send*(this: var vtkMultiProcessController; data: ptr cshort; length: vtkIdType;
          remoteProcessId: cint; tag: cint): cint {.importcpp: "Send",
    header: "vtkMultiProcessController.h".}
proc Send*(this: var vtkMultiProcessController; data: ptr cushort; length: vtkIdType;
          remoteProcessId: cint; tag: cint): cint {.importcpp: "Send",
    header: "vtkMultiProcessController.h".}
proc Send*(this: var vtkMultiProcessController; data: ptr cuint; length: vtkIdType;
          remoteProcessId: cint; tag: cint): cint {.importcpp: "Send",
    header: "vtkMultiProcessController.h".}
proc Send*(this: var vtkMultiProcessController; data: ptr culong; length: vtkIdType;
          remoteProcessId: cint; tag: cint): cint {.importcpp: "Send",
    header: "vtkMultiProcessController.h".}
proc Send*(this: var vtkMultiProcessController; data: ptr clong; length: vtkIdType;
          remoteProcessId: cint; tag: cint): cint {.importcpp: "Send",
    header: "vtkMultiProcessController.h".}
proc Send*(this: var vtkMultiProcessController; data: ptr cchar; length: vtkIdType;
          remoteProcessId: cint; tag: cint): cint {.importcpp: "Send",
    header: "vtkMultiProcessController.h".}
proc Send*(this: var vtkMultiProcessController; data: cstring; length: vtkIdType;
          remoteProcessId: cint; tag: cint): cint {.importcpp: "Send",
    header: "vtkMultiProcessController.h".}
proc Send*(this: var vtkMultiProcessController; data: ptr cuchar; length: vtkIdType;
          remoteProcessId: cint; tag: cint): cint {.importcpp: "Send",
    header: "vtkMultiProcessController.h".}
proc Send*(this: var vtkMultiProcessController; data: ptr cfloat; length: vtkIdType;
          remoteProcessId: cint; tag: cint): cint {.importcpp: "Send",
    header: "vtkMultiProcessController.h".}
proc Send*(this: var vtkMultiProcessController; data: ptr cdouble; length: vtkIdType;
          remoteProcessId: cint; tag: cint): cint {.importcpp: "Send",
    header: "vtkMultiProcessController.h".}
proc Send*(this: var vtkMultiProcessController; data: ptr clonglong; length: vtkIdType;
          remoteProcessId: cint; tag: cint): cint {.importcpp: "Send",
    header: "vtkMultiProcessController.h".}
proc Send*(this: var vtkMultiProcessController; data: ptr culonglong;
          length: vtkIdType; remoteProcessId: cint; tag: cint): cint {.
    importcpp: "Send", header: "vtkMultiProcessController.h".}
proc Send*(this: var vtkMultiProcessController; data: ptr vtkDataObject;
          remoteId: cint; tag: cint): cint {.importcpp: "Send",
                                        header: "vtkMultiProcessController.h".}
proc Send*(this: var vtkMultiProcessController; data: ptr vtkDataArray; remoteId: cint;
          tag: cint): cint {.importcpp: "Send", header: "vtkMultiProcessController.h".}
proc Send*(this: var vtkMultiProcessController; stream: vtkMultiProcessStream;
          remoteId: cint; tag: cint): cint {.importcpp: "Send",
                                        header: "vtkMultiProcessController.h".}
proc Receive*(this: var vtkMultiProcessController; data: ptr cint;
             maxlength: vtkIdType; remoteProcessId: cint; tag: cint): cint {.
    importcpp: "Receive", header: "vtkMultiProcessController.h".}
proc Receive*(this: var vtkMultiProcessController; data: ptr cuint;
             maxlength: vtkIdType; remoteProcessId: cint; tag: cint): cint {.
    importcpp: "Receive", header: "vtkMultiProcessController.h".}
proc Receive*(this: var vtkMultiProcessController; data: ptr cshort;
             maxlength: vtkIdType; remoteProcessId: cint; tag: cint): cint {.
    importcpp: "Receive", header: "vtkMultiProcessController.h".}
proc Receive*(this: var vtkMultiProcessController; data: ptr cushort;
             maxlength: vtkIdType; remoteProcessId: cint; tag: cint): cint {.
    importcpp: "Receive", header: "vtkMultiProcessController.h".}
proc Receive*(this: var vtkMultiProcessController; data: ptr clong;
             maxlength: vtkIdType; remoteProcessId: cint; tag: cint): cint {.
    importcpp: "Receive", header: "vtkMultiProcessController.h".}
proc Receive*(this: var vtkMultiProcessController; data: ptr culong;
             maxlength: vtkIdType; remoteProcessId: cint; tag: cint): cint {.
    importcpp: "Receive", header: "vtkMultiProcessController.h".}
proc Receive*(this: var vtkMultiProcessController; data: cstring;
             maxlength: vtkIdType; remoteProcessId: cint; tag: cint): cint {.
    importcpp: "Receive", header: "vtkMultiProcessController.h".}
proc Receive*(this: var vtkMultiProcessController; data: ptr cuchar;
             maxlength: vtkIdType; remoteProcessId: cint; tag: cint): cint {.
    importcpp: "Receive", header: "vtkMultiProcessController.h".}
proc Receive*(this: var vtkMultiProcessController; data: ptr cchar;
             maxlength: vtkIdType; remoteProcessId: cint; tag: cint): cint {.
    importcpp: "Receive", header: "vtkMultiProcessController.h".}
proc Receive*(this: var vtkMultiProcessController; data: ptr cfloat;
             maxlength: vtkIdType; remoteProcessId: cint; tag: cint): cint {.
    importcpp: "Receive", header: "vtkMultiProcessController.h".}
proc Receive*(this: var vtkMultiProcessController; data: ptr cdouble;
             maxlength: vtkIdType; remoteProcessId: cint; tag: cint): cint {.
    importcpp: "Receive", header: "vtkMultiProcessController.h".}
proc Receive*(this: var vtkMultiProcessController; data: ptr clonglong;
             maxLength: vtkIdType; remoteProcessId: cint; tag: cint): cint {.
    importcpp: "Receive", header: "vtkMultiProcessController.h".}
proc Receive*(this: var vtkMultiProcessController; data: ptr culonglong;
             maxLength: vtkIdType; remoteProcessId: cint; tag: cint): cint {.
    importcpp: "Receive", header: "vtkMultiProcessController.h".}
proc Receive*(this: var vtkMultiProcessController; data: ptr vtkDataObject;
             remoteId: cint; tag: cint): cint {.importcpp: "Receive",
    header: "vtkMultiProcessController.h".}
proc Receive*(this: var vtkMultiProcessController; data: ptr vtkDataArray;
             remoteId: cint; tag: cint): cint {.importcpp: "Receive",
    header: "vtkMultiProcessController.h".}
proc Receive*(this: var vtkMultiProcessController;
             stream: var vtkMultiProcessStream; remoteId: cint; tag: cint): cint {.
    importcpp: "Receive", header: "vtkMultiProcessController.h".}
proc ReceiveDataObject*(this: var vtkMultiProcessController; remoteId: cint; tag: cint): ptr vtkDataObject {.
    importcpp: "ReceiveDataObject", header: "vtkMultiProcessController.h".}
proc GetCount*(this: var vtkMultiProcessController): vtkIdType {.
    importcpp: "GetCount", header: "vtkMultiProcessController.h".}
proc Broadcast*(this: var vtkMultiProcessController; data: ptr cint; length: vtkIdType;
               srcProcessId: cint): cint {.importcpp: "Broadcast",
                                        header: "vtkMultiProcessController.h".}
proc Broadcast*(this: var vtkMultiProcessController; data: ptr cuint;
               length: vtkIdType; srcProcessId: cint): cint {.importcpp: "Broadcast",
    header: "vtkMultiProcessController.h".}
proc Broadcast*(this: var vtkMultiProcessController; data: ptr cshort;
               length: vtkIdType; srcProcessId: cint): cint {.importcpp: "Broadcast",
    header: "vtkMultiProcessController.h".}
proc Broadcast*(this: var vtkMultiProcessController; data: ptr cushort;
               length: vtkIdType; srcProcessId: cint): cint {.importcpp: "Broadcast",
    header: "vtkMultiProcessController.h".}
proc Broadcast*(this: var vtkMultiProcessController; data: ptr clong;
               length: vtkIdType; srcProcessId: cint): cint {.importcpp: "Broadcast",
    header: "vtkMultiProcessController.h".}
proc Broadcast*(this: var vtkMultiProcessController; data: ptr culong;
               length: vtkIdType; srcProcessId: cint): cint {.importcpp: "Broadcast",
    header: "vtkMultiProcessController.h".}
proc Broadcast*(this: var vtkMultiProcessController; data: ptr cuchar;
               length: vtkIdType; srcProcessId: cint): cint {.importcpp: "Broadcast",
    header: "vtkMultiProcessController.h".}
proc Broadcast*(this: var vtkMultiProcessController; data: cstring; length: vtkIdType;
               srcProcessId: cint): cint {.importcpp: "Broadcast",
                                        header: "vtkMultiProcessController.h".}
proc Broadcast*(this: var vtkMultiProcessController; data: ptr cchar;
               length: vtkIdType; srcProcessId: cint): cint {.importcpp: "Broadcast",
    header: "vtkMultiProcessController.h".}
proc Broadcast*(this: var vtkMultiProcessController; data: ptr cfloat;
               length: vtkIdType; srcProcessId: cint): cint {.importcpp: "Broadcast",
    header: "vtkMultiProcessController.h".}
proc Broadcast*(this: var vtkMultiProcessController; data: ptr cdouble;
               length: vtkIdType; srcProcessId: cint): cint {.importcpp: "Broadcast",
    header: "vtkMultiProcessController.h".}
proc Broadcast*(this: var vtkMultiProcessController; data: ptr clonglong;
               length: vtkIdType; srcProcessId: cint): cint {.importcpp: "Broadcast",
    header: "vtkMultiProcessController.h".}
proc Broadcast*(this: var vtkMultiProcessController; data: ptr culonglong;
               length: vtkIdType; srcProcessId: cint): cint {.importcpp: "Broadcast",
    header: "vtkMultiProcessController.h".}
proc Broadcast*(this: var vtkMultiProcessController; data: ptr vtkDataObject;
               srcProcessId: cint): cint {.importcpp: "Broadcast",
                                        header: "vtkMultiProcessController.h".}
proc Broadcast*(this: var vtkMultiProcessController; data: ptr vtkDataArray;
               srcProcessId: cint): cint {.importcpp: "Broadcast",
                                        header: "vtkMultiProcessController.h".}
proc Broadcast*(this: var vtkMultiProcessController;
               stream: var vtkMultiProcessStream; srcProcessId: cint): cint {.
    importcpp: "Broadcast", header: "vtkMultiProcessController.h".}
proc Gather*(this: var vtkMultiProcessController; sendBuffer: ptr cint;
            recvBuffer: ptr cint; length: vtkIdType; destProcessId: cint): cint {.
    importcpp: "Gather", header: "vtkMultiProcessController.h".}
proc Gather*(this: var vtkMultiProcessController; sendBuffer: ptr cuint;
            recvBuffer: ptr cuint; length: vtkIdType; destProcessId: cint): cint {.
    importcpp: "Gather", header: "vtkMultiProcessController.h".}
proc Gather*(this: var vtkMultiProcessController; sendBuffer: ptr cshort;
            recvBuffer: ptr cshort; length: vtkIdType; destProcessId: cint): cint {.
    importcpp: "Gather", header: "vtkMultiProcessController.h".}
proc Gather*(this: var vtkMultiProcessController; sendBuffer: ptr cushort;
            recvBuffer: ptr cushort; length: vtkIdType; destProcessId: cint): cint {.
    importcpp: "Gather", header: "vtkMultiProcessController.h".}
proc Gather*(this: var vtkMultiProcessController; sendBuffer: ptr clong;
            recvBuffer: ptr clong; length: vtkIdType; destProcessId: cint): cint {.
    importcpp: "Gather", header: "vtkMultiProcessController.h".}
proc Gather*(this: var vtkMultiProcessController; sendBuffer: ptr culong;
            recvBuffer: ptr culong; length: vtkIdType; destProcessId: cint): cint {.
    importcpp: "Gather", header: "vtkMultiProcessController.h".}
proc Gather*(this: var vtkMultiProcessController; sendBuffer: ptr cuchar;
            recvBuffer: ptr cuchar; length: vtkIdType; destProcessId: cint): cint {.
    importcpp: "Gather", header: "vtkMultiProcessController.h".}
proc Gather*(this: var vtkMultiProcessController; sendBuffer: cstring;
            recvBuffer: cstring; length: vtkIdType; destProcessId: cint): cint {.
    importcpp: "Gather", header: "vtkMultiProcessController.h".}
proc Gather*(this: var vtkMultiProcessController; sendBuffer: ptr cchar;
            recvBuffer: ptr cchar; length: vtkIdType; destProcessId: cint): cint {.
    importcpp: "Gather", header: "vtkMultiProcessController.h".}
proc Gather*(this: var vtkMultiProcessController; sendBuffer: ptr cfloat;
            recvBuffer: ptr cfloat; length: vtkIdType; destProcessId: cint): cint {.
    importcpp: "Gather", header: "vtkMultiProcessController.h".}
proc Gather*(this: var vtkMultiProcessController; sendBuffer: ptr cdouble;
            recvBuffer: ptr cdouble; length: vtkIdType; destProcessId: cint): cint {.
    importcpp: "Gather", header: "vtkMultiProcessController.h".}
proc Gather*(this: var vtkMultiProcessController; sendBuffer: ptr clonglong;
            recvBuffer: ptr clonglong; length: vtkIdType; destProcessId: cint): cint {.
    importcpp: "Gather", header: "vtkMultiProcessController.h".}
proc Gather*(this: var vtkMultiProcessController; sendBuffer: ptr culonglong;
            recvBuffer: ptr culonglong; length: vtkIdType; destProcessId: cint): cint {.
    importcpp: "Gather", header: "vtkMultiProcessController.h".}
proc Gather*(this: var vtkMultiProcessController; sendBuffer: ptr vtkDataArray;
            recvBuffer: ptr vtkDataArray; destProcessId: cint): cint {.
    importcpp: "Gather", header: "vtkMultiProcessController.h".}
proc Gather*(this: var vtkMultiProcessController; sendBuffer: ptr vtkDataObject;
            recvBuffer: var vector[vtkSmartPointer[vtkDataObject]];
            destProcessId: cint): cint {.importcpp: "Gather",
                                      header: "vtkMultiProcessController.h".}
proc Gather*(this: var vtkMultiProcessController; sendBuffer: vtkMultiProcessStream;
            recvBuffer: var vector[vtkMultiProcessStream]; destProcessId: cint): cint {.
    importcpp: "Gather", header: "vtkMultiProcessController.h".}
proc GatherV*(this: var vtkMultiProcessController; sendBuffer: ptr cint;
             recvBuffer: ptr cint; sendLength: vtkIdType; recvLengths: ptr vtkIdType;
             offsets: ptr vtkIdType; destProcessId: cint): cint {.
    importcpp: "GatherV", header: "vtkMultiProcessController.h".}
proc GatherV*(this: var vtkMultiProcessController; sendBuffer: ptr cuint;
             recvBuffer: ptr cuint; sendLength: vtkIdType;
             recvLengths: ptr vtkIdType; offsets: ptr vtkIdType; destProcessId: cint): cint {.
    importcpp: "GatherV", header: "vtkMultiProcessController.h".}
proc GatherV*(this: var vtkMultiProcessController; sendBuffer: ptr cshort;
             recvBuffer: ptr cshort; sendLength: vtkIdType;
             recvLengths: ptr vtkIdType; offsets: ptr vtkIdType; destProcessId: cint): cint {.
    importcpp: "GatherV", header: "vtkMultiProcessController.h".}
proc GatherV*(this: var vtkMultiProcessController; sendBuffer: ptr cushort;
             recvBuffer: ptr cushort; sendLength: vtkIdType;
             recvLengths: ptr vtkIdType; offsets: ptr vtkIdType; destProcessId: cint): cint {.
    importcpp: "GatherV", header: "vtkMultiProcessController.h".}
proc GatherV*(this: var vtkMultiProcessController; sendBuffer: ptr clong;
             recvBuffer: ptr clong; sendLength: vtkIdType;
             recvLengths: ptr vtkIdType; offsets: ptr vtkIdType; destProcessId: cint): cint {.
    importcpp: "GatherV", header: "vtkMultiProcessController.h".}
proc GatherV*(this: var vtkMultiProcessController; sendBuffer: ptr culong;
             recvBuffer: ptr culong; sendLength: vtkIdType;
             recvLengths: ptr vtkIdType; offsets: ptr vtkIdType; destProcessId: cint): cint {.
    importcpp: "GatherV", header: "vtkMultiProcessController.h".}
proc GatherV*(this: var vtkMultiProcessController; sendBuffer: ptr cuchar;
             recvBuffer: ptr cuchar; sendLength: vtkIdType;
             recvLengths: ptr vtkIdType; offsets: ptr vtkIdType; destProcessId: cint): cint {.
    importcpp: "GatherV", header: "vtkMultiProcessController.h".}
proc GatherV*(this: var vtkMultiProcessController; sendBuffer: cstring;
             recvBuffer: cstring; sendLength: vtkIdType; recvLengths: ptr vtkIdType;
             offsets: ptr vtkIdType; destProcessId: cint): cint {.
    importcpp: "GatherV", header: "vtkMultiProcessController.h".}
proc GatherV*(this: var vtkMultiProcessController; sendBuffer: ptr cchar;
             recvBuffer: ptr cchar; sendLength: vtkIdType;
             recvLengths: ptr vtkIdType; offsets: ptr vtkIdType; destProcessId: cint): cint {.
    importcpp: "GatherV", header: "vtkMultiProcessController.h".}
proc GatherV*(this: var vtkMultiProcessController; sendBuffer: ptr cfloat;
             recvBuffer: ptr cfloat; sendLength: vtkIdType;
             recvLengths: ptr vtkIdType; offsets: ptr vtkIdType; destProcessId: cint): cint {.
    importcpp: "GatherV", header: "vtkMultiProcessController.h".}
proc GatherV*(this: var vtkMultiProcessController; sendBuffer: ptr cdouble;
             recvBuffer: ptr cdouble; sendLength: vtkIdType;
             recvLengths: ptr vtkIdType; offsets: ptr vtkIdType; destProcessId: cint): cint {.
    importcpp: "GatherV", header: "vtkMultiProcessController.h".}
proc GatherV*(this: var vtkMultiProcessController; sendBuffer: ptr clonglong;
             recvBuffer: ptr clonglong; sendLength: vtkIdType;
             recvLengths: ptr vtkIdType; offsets: ptr vtkIdType; destProcessId: cint): cint {.
    importcpp: "GatherV", header: "vtkMultiProcessController.h".}
proc GatherV*(this: var vtkMultiProcessController; sendBuffer: ptr culonglong;
             recvBuffer: ptr culonglong; sendLength: vtkIdType;
             recvLengths: ptr vtkIdType; offsets: ptr vtkIdType; destProcessId: cint): cint {.
    importcpp: "GatherV", header: "vtkMultiProcessController.h".}
proc GatherV*(this: var vtkMultiProcessController; sendBuffer: ptr vtkDataArray;
             recvBuffer: ptr vtkDataArray; recvLengths: ptr vtkIdType;
             offsets: ptr vtkIdType; destProcessId: cint): cint {.
    importcpp: "GatherV", header: "vtkMultiProcessController.h".}
proc GatherV*(this: var vtkMultiProcessController; sendBuffer: ptr vtkDataArray;
             recvBuffer: ptr vtkDataArray; recvLengths: ptr vtkIdTypeArray;
             offsets: ptr vtkIdTypeArray; destProcessId: cint): cint {.
    importcpp: "GatherV", header: "vtkMultiProcessController.h".}
proc GatherV*(this: var vtkMultiProcessController; sendBuffer: ptr vtkDataArray;
             recvBuffer: ptr vtkDataArray; destProcessId: cint): cint {.
    importcpp: "GatherV", header: "vtkMultiProcessController.h".}
proc GatherV*(this: var vtkMultiProcessController; sendData: ptr vtkDataObject;
             recvData: ptr vtkSmartPointer[vtkDataObject]; destProcessId: cint): cint {.
    importcpp: "GatherV", header: "vtkMultiProcessController.h".}
proc Scatter*(this: var vtkMultiProcessController; sendBuffer: ptr cint;
             recvBuffer: ptr cint; length: vtkIdType; srcProcessId: cint): cint {.
    importcpp: "Scatter", header: "vtkMultiProcessController.h".}
proc Scatter*(this: var vtkMultiProcessController; sendBuffer: ptr cuint;
             recvBuffer: ptr cuint; length: vtkIdType; srcProcessId: cint): cint {.
    importcpp: "Scatter", header: "vtkMultiProcessController.h".}
proc Scatter*(this: var vtkMultiProcessController; sendBuffer: ptr cshort;
             recvBuffer: ptr cshort; length: vtkIdType; srcProcessId: cint): cint {.
    importcpp: "Scatter", header: "vtkMultiProcessController.h".}
proc Scatter*(this: var vtkMultiProcessController; sendBuffer: ptr cushort;
             recvBuffer: ptr cushort; length: vtkIdType; srcProcessId: cint): cint {.
    importcpp: "Scatter", header: "vtkMultiProcessController.h".}
proc Scatter*(this: var vtkMultiProcessController; sendBuffer: ptr clong;
             recvBuffer: ptr clong; length: vtkIdType; srcProcessId: cint): cint {.
    importcpp: "Scatter", header: "vtkMultiProcessController.h".}
proc Scatter*(this: var vtkMultiProcessController; sendBuffer: ptr culong;
             recvBuffer: ptr culong; length: vtkIdType; srcProcessId: cint): cint {.
    importcpp: "Scatter", header: "vtkMultiProcessController.h".}
proc Scatter*(this: var vtkMultiProcessController; sendBuffer: ptr cuchar;
             recvBuffer: ptr cuchar; length: vtkIdType; srcProcessId: cint): cint {.
    importcpp: "Scatter", header: "vtkMultiProcessController.h".}
proc Scatter*(this: var vtkMultiProcessController; sendBuffer: cstring;
             recvBuffer: cstring; length: vtkIdType; srcProcessId: cint): cint {.
    importcpp: "Scatter", header: "vtkMultiProcessController.h".}
proc Scatter*(this: var vtkMultiProcessController; sendBuffer: ptr cchar;
             recvBuffer: ptr cchar; length: vtkIdType; srcProcessId: cint): cint {.
    importcpp: "Scatter", header: "vtkMultiProcessController.h".}
proc Scatter*(this: var vtkMultiProcessController; sendBuffer: ptr cfloat;
             recvBuffer: ptr cfloat; length: vtkIdType; srcProcessId: cint): cint {.
    importcpp: "Scatter", header: "vtkMultiProcessController.h".}
proc Scatter*(this: var vtkMultiProcessController; sendBuffer: ptr cdouble;
             recvBuffer: ptr cdouble; length: vtkIdType; srcProcessId: cint): cint {.
    importcpp: "Scatter", header: "vtkMultiProcessController.h".}
proc Scatter*(this: var vtkMultiProcessController; sendBuffer: ptr clonglong;
             recvBuffer: ptr clonglong; length: vtkIdType; srcProcessId: cint): cint {.
    importcpp: "Scatter", header: "vtkMultiProcessController.h".}
proc Scatter*(this: var vtkMultiProcessController; sendBuffer: ptr culonglong;
             recvBuffer: ptr culonglong; length: vtkIdType; srcProcessId: cint): cint {.
    importcpp: "Scatter", header: "vtkMultiProcessController.h".}
proc Scatter*(this: var vtkMultiProcessController; sendBuffer: ptr vtkDataArray;
             recvBuffer: ptr vtkDataArray; srcProcessId: cint): cint {.
    importcpp: "Scatter", header: "vtkMultiProcessController.h".}
proc ScatterV*(this: var vtkMultiProcessController; sendBuffer: ptr cint;
              recvBuffer: ptr cint; sendLengths: ptr vtkIdType;
              offsets: ptr vtkIdType; recvLength: vtkIdType; srcProcessId: cint): cint {.
    importcpp: "ScatterV", header: "vtkMultiProcessController.h".}
proc ScatterV*(this: var vtkMultiProcessController; sendBuffer: ptr cuint;
              recvBuffer: ptr cuint; sendLengths: ptr vtkIdType;
              offsets: ptr vtkIdType; recvLength: vtkIdType; srcProcessId: cint): cint {.
    importcpp: "ScatterV", header: "vtkMultiProcessController.h".}
proc ScatterV*(this: var vtkMultiProcessController; sendBuffer: ptr cshort;
              recvBuffer: ptr cshort; sendLengths: ptr vtkIdType;
              offsets: ptr vtkIdType; recvLength: vtkIdType; srcProcessId: cint): cint {.
    importcpp: "ScatterV", header: "vtkMultiProcessController.h".}
proc ScatterV*(this: var vtkMultiProcessController; sendBuffer: ptr cushort;
              recvBuffer: ptr cushort; sendLengths: ptr vtkIdType;
              offsets: ptr vtkIdType; recvLength: vtkIdType; srcProcessId: cint): cint {.
    importcpp: "ScatterV", header: "vtkMultiProcessController.h".}
proc ScatterV*(this: var vtkMultiProcessController; sendBuffer: ptr clong;
              recvBuffer: ptr clong; sendLengths: ptr vtkIdType;
              offsets: ptr vtkIdType; recvLength: vtkIdType; srcProcessId: cint): cint {.
    importcpp: "ScatterV", header: "vtkMultiProcessController.h".}
proc ScatterV*(this: var vtkMultiProcessController; sendBuffer: ptr culong;
              recvBuffer: ptr culong; sendLengths: ptr vtkIdType;
              offsets: ptr vtkIdType; recvLength: vtkIdType; srcProcessId: cint): cint {.
    importcpp: "ScatterV", header: "vtkMultiProcessController.h".}
proc ScatterV*(this: var vtkMultiProcessController; sendBuffer: ptr cuchar;
              recvBuffer: ptr cuchar; sendLengths: ptr vtkIdType;
              offsets: ptr vtkIdType; recvLength: vtkIdType; srcProcessId: cint): cint {.
    importcpp: "ScatterV", header: "vtkMultiProcessController.h".}
proc ScatterV*(this: var vtkMultiProcessController; sendBuffer: cstring;
              recvBuffer: cstring; sendLengths: ptr vtkIdType;
              offsets: ptr vtkIdType; recvLength: vtkIdType; srcProcessId: cint): cint {.
    importcpp: "ScatterV", header: "vtkMultiProcessController.h".}
proc ScatterV*(this: var vtkMultiProcessController; sendBuffer: ptr cchar;
              recvBuffer: ptr cchar; sendLengths: ptr vtkIdType;
              offsets: ptr vtkIdType; recvLength: vtkIdType; srcProcessId: cint): cint {.
    importcpp: "ScatterV", header: "vtkMultiProcessController.h".}
proc ScatterV*(this: var vtkMultiProcessController; sendBuffer: ptr cfloat;
              recvBuffer: ptr cfloat; sendLengths: ptr vtkIdType;
              offsets: ptr vtkIdType; recvLength: vtkIdType; srcProcessId: cint): cint {.
    importcpp: "ScatterV", header: "vtkMultiProcessController.h".}
proc ScatterV*(this: var vtkMultiProcessController; sendBuffer: ptr cdouble;
              recvBuffer: ptr cdouble; sendLengths: ptr vtkIdType;
              offsets: ptr vtkIdType; recvLength: vtkIdType; srcProcessId: cint): cint {.
    importcpp: "ScatterV", header: "vtkMultiProcessController.h".}
proc ScatterV*(this: var vtkMultiProcessController; sendBuffer: ptr clonglong;
              recvBuffer: ptr clonglong; sendLengths: ptr vtkIdType;
              offsets: ptr vtkIdType; recvLength: vtkIdType; srcProcessId: cint): cint {.
    importcpp: "ScatterV", header: "vtkMultiProcessController.h".}
proc ScatterV*(this: var vtkMultiProcessController; sendBuffer: ptr culonglong;
              recvBuffer: ptr culonglong; sendLengths: ptr vtkIdType;
              offsets: ptr vtkIdType; recvLength: vtkIdType; srcProcessId: cint): cint {.
    importcpp: "ScatterV", header: "vtkMultiProcessController.h".}
proc AllGather*(this: var vtkMultiProcessController; sendBuffer: ptr cint;
               recvBuffer: ptr cint; length: vtkIdType): cint {.
    importcpp: "AllGather", header: "vtkMultiProcessController.h".}
proc AllGather*(this: var vtkMultiProcessController; sendBuffer: ptr cuint;
               recvBuffer: ptr cuint; length: vtkIdType): cint {.
    importcpp: "AllGather", header: "vtkMultiProcessController.h".}
proc AllGather*(this: var vtkMultiProcessController; sendBuffer: ptr cshort;
               recvBuffer: ptr cshort; length: vtkIdType): cint {.
    importcpp: "AllGather", header: "vtkMultiProcessController.h".}
proc AllGather*(this: var vtkMultiProcessController; sendBuffer: ptr cushort;
               recvBuffer: ptr cushort; length: vtkIdType): cint {.
    importcpp: "AllGather", header: "vtkMultiProcessController.h".}
proc AllGather*(this: var vtkMultiProcessController; sendBuffer: ptr clong;
               recvBuffer: ptr clong; length: vtkIdType): cint {.
    importcpp: "AllGather", header: "vtkMultiProcessController.h".}
proc AllGather*(this: var vtkMultiProcessController; sendBuffer: ptr culong;
               recvBuffer: ptr culong; length: vtkIdType): cint {.
    importcpp: "AllGather", header: "vtkMultiProcessController.h".}
proc AllGather*(this: var vtkMultiProcessController; sendBuffer: ptr cuchar;
               recvBuffer: ptr cuchar; length: vtkIdType): cint {.
    importcpp: "AllGather", header: "vtkMultiProcessController.h".}
proc AllGather*(this: var vtkMultiProcessController; sendBuffer: cstring;
               recvBuffer: cstring; length: vtkIdType): cint {.
    importcpp: "AllGather", header: "vtkMultiProcessController.h".}
proc AllGather*(this: var vtkMultiProcessController; sendBuffer: ptr cchar;
               recvBuffer: ptr cchar; length: vtkIdType): cint {.
    importcpp: "AllGather", header: "vtkMultiProcessController.h".}
proc AllGather*(this: var vtkMultiProcessController; sendBuffer: ptr cfloat;
               recvBuffer: ptr cfloat; length: vtkIdType): cint {.
    importcpp: "AllGather", header: "vtkMultiProcessController.h".}
proc AllGather*(this: var vtkMultiProcessController; sendBuffer: ptr cdouble;
               recvBuffer: ptr cdouble; length: vtkIdType): cint {.
    importcpp: "AllGather", header: "vtkMultiProcessController.h".}
proc AllGather*(this: var vtkMultiProcessController; sendBuffer: ptr clonglong;
               recvBuffer: ptr clonglong; length: vtkIdType): cint {.
    importcpp: "AllGather", header: "vtkMultiProcessController.h".}
proc AllGather*(this: var vtkMultiProcessController; sendBuffer: ptr culonglong;
               recvBuffer: ptr culonglong; length: vtkIdType): cint {.
    importcpp: "AllGather", header: "vtkMultiProcessController.h".}
proc AllGather*(this: var vtkMultiProcessController; sendBuffer: ptr vtkDataArray;
               recvBuffer: ptr vtkDataArray): cint {.importcpp: "AllGather",
    header: "vtkMultiProcessController.h".}
proc AllGather*(this: var vtkMultiProcessController; sendBuffer: ptr vtkDataObject;
               recvBuffer: var vector[vtkSmartPointer[vtkDataObject]]): cint {.
    importcpp: "AllGather", header: "vtkMultiProcessController.h".}
proc AllGather*(this: var vtkMultiProcessController;
               sendBuffer: vtkMultiProcessStream;
               recvBuffer: var vector[vtkMultiProcessStream]): cint {.
    importcpp: "AllGather", header: "vtkMultiProcessController.h".}
proc AllGatherV*(this: var vtkMultiProcessController; sendBuffer: ptr cint;
                recvBuffer: ptr cint; sendLength: vtkIdType;
                recvLengths: ptr vtkIdType; offsets: ptr vtkIdType): cint {.
    importcpp: "AllGatherV", header: "vtkMultiProcessController.h".}
proc AllGatherV*(this: var vtkMultiProcessController; sendBuffer: ptr cuint;
                recvBuffer: ptr cuint; sendLength: vtkIdType;
                recvLengths: ptr vtkIdType; offsets: ptr vtkIdType): cint {.
    importcpp: "AllGatherV", header: "vtkMultiProcessController.h".}
proc AllGatherV*(this: var vtkMultiProcessController; sendBuffer: ptr cshort;
                recvBuffer: ptr cshort; sendLength: vtkIdType;
                recvLengths: ptr vtkIdType; offsets: ptr vtkIdType): cint {.
    importcpp: "AllGatherV", header: "vtkMultiProcessController.h".}
proc AllGatherV*(this: var vtkMultiProcessController; sendBuffer: ptr cushort;
                recvBuffer: ptr cushort; sendLength: vtkIdType;
                recvLengths: ptr vtkIdType; offsets: ptr vtkIdType): cint {.
    importcpp: "AllGatherV", header: "vtkMultiProcessController.h".}
proc AllGatherV*(this: var vtkMultiProcessController; sendBuffer: ptr clong;
                recvBuffer: ptr clong; sendLength: vtkIdType;
                recvLengths: ptr vtkIdType; offsets: ptr vtkIdType): cint {.
    importcpp: "AllGatherV", header: "vtkMultiProcessController.h".}
proc AllGatherV*(this: var vtkMultiProcessController; sendBuffer: ptr culong;
                recvBuffer: ptr culong; sendLength: vtkIdType;
                recvLengths: ptr vtkIdType; offsets: ptr vtkIdType): cint {.
    importcpp: "AllGatherV", header: "vtkMultiProcessController.h".}
proc AllGatherV*(this: var vtkMultiProcessController; sendBuffer: ptr cuchar;
                recvBuffer: ptr cuchar; sendLength: vtkIdType;
                recvLengths: ptr vtkIdType; offsets: ptr vtkIdType): cint {.
    importcpp: "AllGatherV", header: "vtkMultiProcessController.h".}
proc AllGatherV*(this: var vtkMultiProcessController; sendBuffer: cstring;
                recvBuffer: cstring; sendLength: vtkIdType;
                recvLengths: ptr vtkIdType; offsets: ptr vtkIdType): cint {.
    importcpp: "AllGatherV", header: "vtkMultiProcessController.h".}
proc AllGatherV*(this: var vtkMultiProcessController; sendBuffer: ptr cchar;
                recvBuffer: ptr cchar; sendLength: vtkIdType;
                recvLengths: ptr vtkIdType; offsets: ptr vtkIdType): cint {.
    importcpp: "AllGatherV", header: "vtkMultiProcessController.h".}
proc AllGatherV*(this: var vtkMultiProcessController; sendBuffer: ptr cfloat;
                recvBuffer: ptr cfloat; sendLength: vtkIdType;
                recvLengths: ptr vtkIdType; offsets: ptr vtkIdType): cint {.
    importcpp: "AllGatherV", header: "vtkMultiProcessController.h".}
proc AllGatherV*(this: var vtkMultiProcessController; sendBuffer: ptr cdouble;
                recvBuffer: ptr cdouble; sendLength: vtkIdType;
                recvLengths: ptr vtkIdType; offsets: ptr vtkIdType): cint {.
    importcpp: "AllGatherV", header: "vtkMultiProcessController.h".}
proc AllGatherV*(this: var vtkMultiProcessController; sendBuffer: ptr clonglong;
                recvBuffer: ptr clonglong; sendLength: vtkIdType;
                recvLengths: ptr vtkIdType; offsets: ptr vtkIdType): cint {.
    importcpp: "AllGatherV", header: "vtkMultiProcessController.h".}
proc AllGatherV*(this: var vtkMultiProcessController; sendBuffer: ptr culonglong;
                recvBuffer: ptr culonglong; sendLength: vtkIdType;
                recvLengths: ptr vtkIdType; offsets: ptr vtkIdType): cint {.
    importcpp: "AllGatherV", header: "vtkMultiProcessController.h".}
proc AllGatherV*(this: var vtkMultiProcessController; sendBuffer: ptr vtkDataArray;
                recvBuffer: ptr vtkDataArray; recvLengths: ptr vtkIdType;
                offsets: ptr vtkIdType): cint {.importcpp: "AllGatherV",
    header: "vtkMultiProcessController.h".}
proc AllGatherV*(this: var vtkMultiProcessController; sendBuffer: ptr vtkDataArray;
                recvBuffer: ptr vtkDataArray): cint {.importcpp: "AllGatherV",
    header: "vtkMultiProcessController.h".}
proc Reduce*(this: var vtkMultiProcessController; sendBuffer: ptr cint;
            recvBuffer: ptr cint; length: vtkIdType; operation: cint;
            destProcessId: cint): cint {.importcpp: "Reduce",
                                      header: "vtkMultiProcessController.h".}
proc Reduce*(this: var vtkMultiProcessController; sendBuffer: ptr cuint;
            recvBuffer: ptr cuint; length: vtkIdType; operation: cint;
            destProcessId: cint): cint {.importcpp: "Reduce",
                                      header: "vtkMultiProcessController.h".}
proc Reduce*(this: var vtkMultiProcessController; sendBuffer: ptr cshort;
            recvBuffer: ptr cshort; length: vtkIdType; operation: cint;
            destProcessId: cint): cint {.importcpp: "Reduce",
                                      header: "vtkMultiProcessController.h".}
proc Reduce*(this: var vtkMultiProcessController; sendBuffer: ptr cushort;
            recvBuffer: ptr cushort; length: vtkIdType; operation: cint;
            destProcessId: cint): cint {.importcpp: "Reduce",
                                      header: "vtkMultiProcessController.h".}
proc Reduce*(this: var vtkMultiProcessController; sendBuffer: ptr clong;
            recvBuffer: ptr clong; length: vtkIdType; operation: cint;
            destProcessId: cint): cint {.importcpp: "Reduce",
                                      header: "vtkMultiProcessController.h".}
proc Reduce*(this: var vtkMultiProcessController; sendBuffer: ptr culong;
            recvBuffer: ptr culong; length: vtkIdType; operation: cint;
            destProcessId: cint): cint {.importcpp: "Reduce",
                                      header: "vtkMultiProcessController.h".}
proc Reduce*(this: var vtkMultiProcessController; sendBuffer: ptr cuchar;
            recvBuffer: ptr cuchar; length: vtkIdType; operation: cint;
            destProcessId: cint): cint {.importcpp: "Reduce",
                                      header: "vtkMultiProcessController.h".}
proc Reduce*(this: var vtkMultiProcessController; sendBuffer: cstring;
            recvBuffer: cstring; length: vtkIdType; operation: cint;
            destProcessId: cint): cint {.importcpp: "Reduce",
                                      header: "vtkMultiProcessController.h".}
proc Reduce*(this: var vtkMultiProcessController; sendBuffer: ptr cchar;
            recvBuffer: ptr cchar; length: vtkIdType; operation: cint;
            destProcessId: cint): cint {.importcpp: "Reduce",
                                      header: "vtkMultiProcessController.h".}
proc Reduce*(this: var vtkMultiProcessController; sendBuffer: ptr cfloat;
            recvBuffer: ptr cfloat; length: vtkIdType; operation: cint;
            destProcessId: cint): cint {.importcpp: "Reduce",
                                      header: "vtkMultiProcessController.h".}
proc Reduce*(this: var vtkMultiProcessController; sendBuffer: ptr cdouble;
            recvBuffer: ptr cdouble; length: vtkIdType; operation: cint;
            destProcessId: cint): cint {.importcpp: "Reduce",
                                      header: "vtkMultiProcessController.h".}
proc Reduce*(this: var vtkMultiProcessController; sendBuffer: ptr clonglong;
            recvBuffer: ptr clonglong; length: vtkIdType; operation: cint;
            destProcessId: cint): cint {.importcpp: "Reduce",
                                      header: "vtkMultiProcessController.h".}
proc Reduce*(this: var vtkMultiProcessController; sendBuffer: ptr culonglong;
            recvBuffer: ptr culonglong; length: vtkIdType; operation: cint;
            destProcessId: cint): cint {.importcpp: "Reduce",
                                      header: "vtkMultiProcessController.h".}
proc Reduce*(this: var vtkMultiProcessController; sendBuffer: ptr vtkDataArray;
            recvBuffer: ptr vtkDataArray; operation: cint; destProcessId: cint): cint {.
    importcpp: "Reduce", header: "vtkMultiProcessController.h".}
proc Reduce*(this: var vtkMultiProcessController; sendBuffer: ptr cint;
            recvBuffer: ptr cint; length: vtkIdType; operation: ptr Operation;
            destProcessId: cint): cint {.importcpp: "Reduce",
                                      header: "vtkMultiProcessController.h".}
proc Reduce*(this: var vtkMultiProcessController; sendBuffer: ptr cuint;
            recvBuffer: ptr cuint; length: vtkIdType; operation: ptr Operation;
            destProcessId: cint): cint {.importcpp: "Reduce",
                                      header: "vtkMultiProcessController.h".}
proc Reduce*(this: var vtkMultiProcessController; sendBuffer: ptr cshort;
            recvBuffer: ptr cshort; length: vtkIdType; operation: ptr Operation;
            destProcessId: cint): cint {.importcpp: "Reduce",
                                      header: "vtkMultiProcessController.h".}
proc Reduce*(this: var vtkMultiProcessController; sendBuffer: ptr cushort;
            recvBuffer: ptr cushort; length: vtkIdType; operation: ptr Operation;
            destProcessId: cint): cint {.importcpp: "Reduce",
                                      header: "vtkMultiProcessController.h".}
proc Reduce*(this: var vtkMultiProcessController; sendBuffer: ptr clong;
            recvBuffer: ptr clong; length: vtkIdType; operation: ptr Operation;
            destProcessId: cint): cint {.importcpp: "Reduce",
                                      header: "vtkMultiProcessController.h".}
proc Reduce*(this: var vtkMultiProcessController; sendBuffer: ptr culong;
            recvBuffer: ptr culong; length: vtkIdType; operation: ptr Operation;
            destProcessId: cint): cint {.importcpp: "Reduce",
                                      header: "vtkMultiProcessController.h".}
proc Reduce*(this: var vtkMultiProcessController; sendBuffer: ptr cuchar;
            recvBuffer: ptr cuchar; length: vtkIdType; operation: ptr Operation;
            destProcessId: cint): cint {.importcpp: "Reduce",
                                      header: "vtkMultiProcessController.h".}
proc Reduce*(this: var vtkMultiProcessController; sendBuffer: cstring;
            recvBuffer: cstring; length: vtkIdType; operation: ptr Operation;
            destProcessId: cint): cint {.importcpp: "Reduce",
                                      header: "vtkMultiProcessController.h".}
proc Reduce*(this: var vtkMultiProcessController; sendBuffer: ptr cchar;
            recvBuffer: ptr cchar; length: vtkIdType; operation: ptr Operation;
            destProcessId: cint): cint {.importcpp: "Reduce",
                                      header: "vtkMultiProcessController.h".}
proc Reduce*(this: var vtkMultiProcessController; sendBuffer: ptr cfloat;
            recvBuffer: ptr cfloat; length: vtkIdType; operation: ptr Operation;
            destProcessId: cint): cint {.importcpp: "Reduce",
                                      header: "vtkMultiProcessController.h".}
proc Reduce*(this: var vtkMultiProcessController; sendBuffer: ptr cdouble;
            recvBuffer: ptr cdouble; length: vtkIdType; operation: ptr Operation;
            destProcessId: cint): cint {.importcpp: "Reduce",
                                      header: "vtkMultiProcessController.h".}
proc Reduce*(this: var vtkMultiProcessController; sendBuffer: ptr clonglong;
            recvBuffer: ptr clonglong; length: vtkIdType; operation: ptr Operation;
            destProcessId: cint): cint {.importcpp: "Reduce",
                                      header: "vtkMultiProcessController.h".}
proc Reduce*(this: var vtkMultiProcessController; sendBuffer: ptr culonglong;
            recvBuffer: ptr culonglong; length: vtkIdType; operation: ptr Operation;
            destProcessId: cint): cint {.importcpp: "Reduce",
                                      header: "vtkMultiProcessController.h".}
proc Reduce*(this: var vtkMultiProcessController; sendBuffer: ptr vtkDataArray;
            recvBuffer: ptr vtkDataArray; operation: ptr Operation;
            destProcessId: cint): cint {.importcpp: "Reduce",
                                      header: "vtkMultiProcessController.h".}
proc AllReduce*(this: var vtkMultiProcessController; sendBuffer: ptr cint;
               recvBuffer: ptr cint; length: vtkIdType; operation: cint): cint {.
    importcpp: "AllReduce", header: "vtkMultiProcessController.h".}
proc AllReduce*(this: var vtkMultiProcessController; sendBuffer: ptr cuint;
               recvBuffer: ptr cuint; length: vtkIdType; operation: cint): cint {.
    importcpp: "AllReduce", header: "vtkMultiProcessController.h".}
proc AllReduce*(this: var vtkMultiProcessController; sendBuffer: ptr cshort;
               recvBuffer: ptr cshort; length: vtkIdType; operation: cint): cint {.
    importcpp: "AllReduce", header: "vtkMultiProcessController.h".}
proc AllReduce*(this: var vtkMultiProcessController; sendBuffer: ptr cushort;
               recvBuffer: ptr cushort; length: vtkIdType; operation: cint): cint {.
    importcpp: "AllReduce", header: "vtkMultiProcessController.h".}
proc AllReduce*(this: var vtkMultiProcessController; sendBuffer: ptr clong;
               recvBuffer: ptr clong; length: vtkIdType; operation: cint): cint {.
    importcpp: "AllReduce", header: "vtkMultiProcessController.h".}
proc AllReduce*(this: var vtkMultiProcessController; sendBuffer: ptr culong;
               recvBuffer: ptr culong; length: vtkIdType; operation: cint): cint {.
    importcpp: "AllReduce", header: "vtkMultiProcessController.h".}
proc AllReduce*(this: var vtkMultiProcessController; sendBuffer: ptr cuchar;
               recvBuffer: ptr cuchar; length: vtkIdType; operation: cint): cint {.
    importcpp: "AllReduce", header: "vtkMultiProcessController.h".}
proc AllReduce*(this: var vtkMultiProcessController; sendBuffer: cstring;
               recvBuffer: cstring; length: vtkIdType; operation: cint): cint {.
    importcpp: "AllReduce", header: "vtkMultiProcessController.h".}
proc AllReduce*(this: var vtkMultiProcessController; sendBuffer: ptr cchar;
               recvBuffer: ptr cchar; length: vtkIdType; operation: cint): cint {.
    importcpp: "AllReduce", header: "vtkMultiProcessController.h".}
proc AllReduce*(this: var vtkMultiProcessController; sendBuffer: ptr cfloat;
               recvBuffer: ptr cfloat; length: vtkIdType; operation: cint): cint {.
    importcpp: "AllReduce", header: "vtkMultiProcessController.h".}
proc AllReduce*(this: var vtkMultiProcessController; sendBuffer: ptr cdouble;
               recvBuffer: ptr cdouble; length: vtkIdType; operation: cint): cint {.
    importcpp: "AllReduce", header: "vtkMultiProcessController.h".}
proc AllReduce*(this: var vtkMultiProcessController; sendBuffer: ptr clonglong;
               recvBuffer: ptr clonglong; length: vtkIdType; operation: cint): cint {.
    importcpp: "AllReduce", header: "vtkMultiProcessController.h".}
proc AllReduce*(this: var vtkMultiProcessController; sendBuffer: ptr culonglong;
               recvBuffer: ptr culonglong; length: vtkIdType; operation: cint): cint {.
    importcpp: "AllReduce", header: "vtkMultiProcessController.h".}
proc AllReduce*(this: var vtkMultiProcessController; sendBuffer: ptr vtkDataArray;
               recvBuffer: ptr vtkDataArray; operation: cint): cint {.
    importcpp: "AllReduce", header: "vtkMultiProcessController.h".}
proc AllReduce*(this: var vtkMultiProcessController; sendBuffer: ptr cint;
               recvBuffer: ptr cint; length: vtkIdType; operation: ptr Operation): cint {.
    importcpp: "AllReduce", header: "vtkMultiProcessController.h".}
proc AllReduce*(this: var vtkMultiProcessController; sendBuffer: ptr cuint;
               recvBuffer: ptr cuint; length: vtkIdType; operation: ptr Operation): cint {.
    importcpp: "AllReduce", header: "vtkMultiProcessController.h".}
proc AllReduce*(this: var vtkMultiProcessController; sendBuffer: ptr cshort;
               recvBuffer: ptr cshort; length: vtkIdType; operation: ptr Operation): cint {.
    importcpp: "AllReduce", header: "vtkMultiProcessController.h".}
proc AllReduce*(this: var vtkMultiProcessController; sendBuffer: ptr cushort;
               recvBuffer: ptr cushort; length: vtkIdType; operation: ptr Operation): cint {.
    importcpp: "AllReduce", header: "vtkMultiProcessController.h".}
proc AllReduce*(this: var vtkMultiProcessController; sendBuffer: ptr clong;
               recvBuffer: ptr clong; length: vtkIdType; operation: ptr Operation): cint {.
    importcpp: "AllReduce", header: "vtkMultiProcessController.h".}
proc AllReduce*(this: var vtkMultiProcessController; sendBuffer: ptr culong;
               recvBuffer: ptr culong; length: vtkIdType; operation: ptr Operation): cint {.
    importcpp: "AllReduce", header: "vtkMultiProcessController.h".}
proc AllReduce*(this: var vtkMultiProcessController; sendBuffer: ptr cuchar;
               recvBuffer: ptr cuchar; length: vtkIdType; operation: ptr Operation): cint {.
    importcpp: "AllReduce", header: "vtkMultiProcessController.h".}
proc AllReduce*(this: var vtkMultiProcessController; sendBuffer: cstring;
               recvBuffer: cstring; length: vtkIdType; operation: ptr Operation): cint {.
    importcpp: "AllReduce", header: "vtkMultiProcessController.h".}
proc AllReduce*(this: var vtkMultiProcessController; sendBuffer: ptr cchar;
               recvBuffer: ptr cchar; length: vtkIdType; operation: ptr Operation): cint {.
    importcpp: "AllReduce", header: "vtkMultiProcessController.h".}
proc AllReduce*(this: var vtkMultiProcessController; sendBuffer: ptr cfloat;
               recvBuffer: ptr cfloat; length: vtkIdType; operation: ptr Operation): cint {.
    importcpp: "AllReduce", header: "vtkMultiProcessController.h".}
proc AllReduce*(this: var vtkMultiProcessController; sendBuffer: ptr cdouble;
               recvBuffer: ptr cdouble; length: vtkIdType; operation: ptr Operation): cint {.
    importcpp: "AllReduce", header: "vtkMultiProcessController.h".}
proc AllReduce*(this: var vtkMultiProcessController; sendBuffer: ptr clonglong;
               recvBuffer: ptr clonglong; length: vtkIdType; operation: ptr Operation): cint {.
    importcpp: "AllReduce", header: "vtkMultiProcessController.h".}
proc AllReduce*(this: var vtkMultiProcessController; sendBuffer: ptr culonglong;
               recvBuffer: ptr culonglong; length: vtkIdType;
               operation: ptr Operation): cint {.importcpp: "AllReduce",
    header: "vtkMultiProcessController.h".}
proc AllReduce*(this: var vtkMultiProcessController; sendBuffer: ptr vtkDataArray;
               recvBuffer: ptr vtkDataArray; operation: ptr Operation): cint {.
    importcpp: "AllReduce", header: "vtkMultiProcessController.h".}
proc Reduce*(this: var vtkMultiProcessController; sendBuffer: vtkBoundingBox;
            recvBuffer: var vtkBoundingBox; destProcessId: cint): cint {.
    importcpp: "Reduce", header: "vtkMultiProcessController.h".}
proc AllReduce*(this: var vtkMultiProcessController; sendBuffer: vtkBoundingBox;
               recvBuffer: var vtkBoundingBox): cint {.importcpp: "AllReduce",
    header: "vtkMultiProcessController.h".}
proc Reduce*(this: var vtkMultiProcessController;
            sendBuffer: ptr vtkDataArraySelection;
            recvBuffer: ptr vtkDataArraySelection; destProcessId: cint): cint {.
    importcpp: "Reduce", header: "vtkMultiProcessController.h".}
proc AllReduce*(this: var vtkMultiProcessController;
               sendBuffer: ptr vtkDataArraySelection;
               recvBuffer: ptr vtkDataArraySelection): cint {.
    importcpp: "AllReduce", header: "vtkMultiProcessController.h".}
proc Send*(this: var vtkMultiProcessController; data: ptr vtkDataObject;
          remoteProcessId: cint; tag: cint): cint {.importcpp: "Send",
    header: "vtkMultiProcessController.h".}
proc Send*(this: var vtkMultiProcessController; data: ptr vtkDataArray;
          remoteProcessId: cint; tag: cint): cint {.importcpp: "Send",
    header: "vtkMultiProcessController.h".}
proc Send*(this: var vtkMultiProcessController; data: ptr cint; length: vtkIdType;
          remoteProcessId: cint; tag: cint): cint {.importcpp: "Send",
    header: "vtkMultiProcessController.h".}
proc Send*(this: var vtkMultiProcessController; data: ptr cshort; length: vtkIdType;
          remoteProcessId: cint; tag: cint): cint {.importcpp: "Send",
    header: "vtkMultiProcessController.h".}
proc Send*(this: var vtkMultiProcessController; data: ptr cushort; length: vtkIdType;
          remoteProcessId: cint; tag: cint): cint {.importcpp: "Send",
    header: "vtkMultiProcessController.h".}
proc Send*(this: var vtkMultiProcessController; data: ptr cuint; length: vtkIdType;
          remoteProcessId: cint; tag: cint): cint {.importcpp: "Send",
    header: "vtkMultiProcessController.h".}
proc Send*(this: var vtkMultiProcessController; data: ptr culong; length: vtkIdType;
          remoteProcessId: cint; tag: cint): cint {.importcpp: "Send",
    header: "vtkMultiProcessController.h".}
proc Send*(this: var vtkMultiProcessController; data: ptr clong; length: vtkIdType;
          remoteProcessId: cint; tag: cint): cint {.importcpp: "Send",
    header: "vtkMultiProcessController.h".}
proc Send*(this: var vtkMultiProcessController; data: ptr cchar; length: vtkIdType;
          remoteProcessId: cint; tag: cint): cint {.importcpp: "Send",
    header: "vtkMultiProcessController.h".}
proc Send*(this: var vtkMultiProcessController; data: cstring; length: vtkIdType;
          remoteProcessId: cint; tag: cint): cint {.importcpp: "Send",
    header: "vtkMultiProcessController.h".}
proc Send*(this: var vtkMultiProcessController; data: ptr cuchar; length: vtkIdType;
          remoteProcessId: cint; tag: cint): cint {.importcpp: "Send",
    header: "vtkMultiProcessController.h".}
proc Send*(this: var vtkMultiProcessController; data: ptr cfloat; length: vtkIdType;
          remoteProcessId: cint; tag: cint): cint {.importcpp: "Send",
    header: "vtkMultiProcessController.h".}
proc Send*(this: var vtkMultiProcessController; data: ptr cdouble; length: vtkIdType;
          remoteProcessId: cint; tag: cint): cint {.importcpp: "Send",
    header: "vtkMultiProcessController.h".}
proc Send*(this: var vtkMultiProcessController; data: ptr clonglong; length: vtkIdType;
          remoteProcessId: cint; tag: cint): cint {.importcpp: "Send",
    header: "vtkMultiProcessController.h".}
proc Send*(this: var vtkMultiProcessController; data: ptr culonglong;
          length: vtkIdType; remoteProcessId: cint; tag: cint): cint {.
    importcpp: "Send", header: "vtkMultiProcessController.h".}
proc Send*(this: var vtkMultiProcessController; stream: vtkMultiProcessStream;
          remoteId: cint; tag: cint): cint {.importcpp: "Send",
                                        header: "vtkMultiProcessController.h".}
proc Receive*(this: var vtkMultiProcessController; data: ptr vtkDataObject;
             remoteProcessId: cint; tag: cint): cint {.importcpp: "Receive",
    header: "vtkMultiProcessController.h".}
proc ReceiveDataObject*(this: var vtkMultiProcessController; remoteProcessId: cint;
                       tag: cint): ptr vtkDataObject {.
    importcpp: "ReceiveDataObject", header: "vtkMultiProcessController.h".}
proc Receive*(this: var vtkMultiProcessController; data: ptr vtkDataArray;
             remoteProcessId: cint; tag: cint): cint {.importcpp: "Receive",
    header: "vtkMultiProcessController.h".}
proc Receive*(this: var vtkMultiProcessController; data: ptr cint; length: vtkIdType;
             remoteProcessId: cint; tag: cint): cint {.importcpp: "Receive",
    header: "vtkMultiProcessController.h".}
proc Receive*(this: var vtkMultiProcessController; data: ptr cuint; length: vtkIdType;
             remoteProcessId: cint; tag: cint): cint {.importcpp: "Receive",
    header: "vtkMultiProcessController.h".}
proc Receive*(this: var vtkMultiProcessController; data: ptr cshort; length: vtkIdType;
             remoteProcessId: cint; tag: cint): cint {.importcpp: "Receive",
    header: "vtkMultiProcessController.h".}
proc Receive*(this: var vtkMultiProcessController; data: ptr cushort;
             length: vtkIdType; remoteProcessId: cint; tag: cint): cint {.
    importcpp: "Receive", header: "vtkMultiProcessController.h".}
proc Receive*(this: var vtkMultiProcessController; data: ptr clong; length: vtkIdType;
             remoteProcessId: cint; tag: cint): cint {.importcpp: "Receive",
    header: "vtkMultiProcessController.h".}
proc Receive*(this: var vtkMultiProcessController; data: ptr culong; length: vtkIdType;
             remoteProcessId: cint; tag: cint): cint {.importcpp: "Receive",
    header: "vtkMultiProcessController.h".}
proc Receive*(this: var vtkMultiProcessController; data: cstring; length: vtkIdType;
             remoteProcessId: cint; tag: cint): cint {.importcpp: "Receive",
    header: "vtkMultiProcessController.h".}
proc Receive*(this: var vtkMultiProcessController; data: ptr cuchar; length: vtkIdType;
             remoteProcessId: cint; tag: cint): cint {.importcpp: "Receive",
    header: "vtkMultiProcessController.h".}
proc Receive*(this: var vtkMultiProcessController; data: ptr cchar; length: vtkIdType;
             remoteProcessId: cint; tag: cint): cint {.importcpp: "Receive",
    header: "vtkMultiProcessController.h".}
proc Receive*(this: var vtkMultiProcessController; data: ptr cfloat; length: vtkIdType;
             remoteProcessId: cint; tag: cint): cint {.importcpp: "Receive",
    header: "vtkMultiProcessController.h".}
proc Receive*(this: var vtkMultiProcessController; data: ptr cdouble;
             length: vtkIdType; remoteProcessId: cint; tag: cint): cint {.
    importcpp: "Receive", header: "vtkMultiProcessController.h".}
proc Receive*(this: var vtkMultiProcessController; data: ptr clonglong;
             length: vtkIdType; remoteProcessId: cint; tag: cint): cint {.
    importcpp: "Receive", header: "vtkMultiProcessController.h".}
proc Receive*(this: var vtkMultiProcessController; data: ptr culonglong;
             length: vtkIdType; remoteProcessId: cint; tag: cint): cint {.
    importcpp: "Receive", header: "vtkMultiProcessController.h".}
proc Receive*(this: var vtkMultiProcessController;
             stream: var vtkMultiProcessStream; remoteId: cint; tag: cint): cint {.
    importcpp: "Receive", header: "vtkMultiProcessController.h".}
proc Barrier*(this: var vtkMultiProcessController) {.importcpp: "Barrier",
    header: "vtkMultiProcessController.h".}
proc GetCount*(this: var vtkMultiProcessController): vtkIdType {.
    importcpp: "GetCount", header: "vtkMultiProcessController.h".}