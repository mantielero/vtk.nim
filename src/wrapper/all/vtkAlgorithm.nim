## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAlgorithm.h
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
##  @class   vtkAlgorithm
##  @brief   Superclass for all sources, filters, and sinks in VTK.
##
##  vtkAlgorithm is the superclass for all sources, filters, and sinks
##  in VTK.  It defines a generalized interface for executing data
##  processing algorithms.  Pipeline connections are associated with
##  input and output ports that are independent of the type of data
##  passing through the connections.
##
##  Instances may be used independently or within pipelines with a
##  variety of architectures and update mechanisms.  Pipelines are
##  controlled by instances of vtkExecutive.  Every vtkAlgorithm
##  instance has an associated vtkExecutive when it is used in a
##  pipeline.  The executive is responsible for data flow.
##

import
  vtkCommonExecutionModelModule, vtkObject, vtkType, vtkObjectBase, vtkIndent

import
  vtkExecutive

discard "forward decl of vtkAbstractArray"
discard "forward decl of vtkAlgorithmInternals"
discard "forward decl of vtkAlgorithmOutput"
discard "forward decl of vtkCollection"
discard "forward decl of vtkDataArray"
discard "forward decl of vtkDataObject"
discard "forward decl of vtkExecutive"
discard "forward decl of vtkInformation"
discard "forward decl of vtkInformationInformationVectorKey"
discard "forward decl of vtkInformationIntegerKey"
discard "forward decl of vtkInformationStringKey"
discard "forward decl of vtkInformationStringVectorKey"
discard "forward decl of vtkInformationVector"
discard "forward decl of vtkProgressObserver"
type
  vtkAlgorithm* {.importcpp: "vtkAlgorithm", header: "vtkAlgorithm.h", bycopy.} = object of vtkObject
    #vtkAlgorithm* {.importc: "vtkAlgorithm".}: VTK_NEWINSTANCE
    AbortExecute* {.importc: "AbortExecute".}: vtkTypeBool ## *
                                                       ##  Keys used to specify input port requirements.
                                                       ##  \ingroup InformationKeys
                                                       ##
    ## *
    ##  Fill the input port information objects for this algorithm.  This
    ##  is invoked by the first call to GetInputPortInformation for each
    ##  port so subclasses can specify what they can handle.
    ##
    ## /@}
    ##  Progress/Update handling
    ##  Garbage collection support.

type
    ostream* = object # FIXME

proc New*(): ptr vtkAlgorithm {.importcpp: "vtkAlgorithm::New(@)",
                            header: "vtkAlgorithm.h".}
type
  vtkAlgorithmSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAlgorithm::IsTypeOf(@)", header: "vtkAlgorithm.h".}
proc IsA*(this: var vtkAlgorithm; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkAlgorithm.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAlgorithm {.
    importcpp: "vtkAlgorithm::SafeDownCast(@)", header: "vtkAlgorithm.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAlgorithm :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAlgorithm :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAlgorithm; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkAlgorithm.h".}
type
  vtkAlgorithmDesiredOutputPrecision* {.size: sizeof(cint), importcpp: "vtkAlgorithm::DesiredOutputPrecision",
                                       header: "vtkAlgorithm.h".} = enum
    SINGLE_PRECISION, DOUBLE_PRECISION, DEFAULT_PRECISION


proc HasExecutive*(this: var vtkAlgorithm): cint {.importcpp: "HasExecutive",
    header: "vtkAlgorithm.h".}
proc GetExecutive*(this: var vtkAlgorithm): ptr vtkExecutive {.
    importcpp: "GetExecutive", header: "vtkAlgorithm.h".}
proc SetExecutive*(this: var vtkAlgorithm; executive: ptr vtkExecutive) {.
    importcpp: "SetExecutive", header: "vtkAlgorithm.h".}
proc ProcessRequest*(this: var vtkAlgorithm; request: ptr vtkInformation;
                    inInfo: ptr ptr vtkInformationVector;
                    outInfo: ptr vtkInformationVector): vtkTypeBool {.
    importcpp: "ProcessRequest", header: "vtkAlgorithm.h".}
proc ProcessRequest*(this: var vtkAlgorithm; request: ptr vtkInformation;
                    inInfo: ptr vtkCollection; outInfo: ptr vtkInformationVector): vtkTypeBool {.
    importcpp: "ProcessRequest", header: "vtkAlgorithm.h".}
proc ComputePipelineMTime*(this: var vtkAlgorithm; request: ptr vtkInformation;
                          inInfoVec: ptr ptr vtkInformationVector;
                          outInfoVec: ptr vtkInformationVector;
                          requestFromOutputPort: cint; mtime: ptr vtkMTimeType): cint {.
    importcpp: "ComputePipelineMTime", header: "vtkAlgorithm.h".}
proc ModifyRequest*(this: var vtkAlgorithm; request: ptr vtkInformation; `when`: cint): cint {.
    importcpp: "ModifyRequest", header: "vtkAlgorithm.h".}
proc GetInputPortInformation*(this: var vtkAlgorithm; port: cint): ptr vtkInformation {.
    importcpp: "GetInputPortInformation", header: "vtkAlgorithm.h".}
proc GetOutputPortInformation*(this: var vtkAlgorithm; port: cint): ptr vtkInformation {.
    importcpp: "GetOutputPortInformation", header: "vtkAlgorithm.h".}
proc GetnameInformation*(this: var vtkAlgorithm): ptr vtkInformation {.
    importcpp: "GetnameInformation", header: "vtkAlgorithm.h".}
proc SetInformation*(this: var vtkAlgorithm; a2: ptr vtkInformation) {.
    importcpp: "SetInformation", header: "vtkAlgorithm.h".}
proc GetNumberOfInputPorts*(this: var vtkAlgorithm): cint {.
    importcpp: "GetNumberOfInputPorts", header: "vtkAlgorithm.h".}
proc GetNumberOfOutputPorts*(this: var vtkAlgorithm): cint {.
    importcpp: "GetNumberOfOutputPorts", header: "vtkAlgorithm.h".}
proc UsesGarbageCollector*(this: vtkAlgorithm): bool {.noSideEffect,
    importcpp: "UsesGarbageCollector", header: "vtkAlgorithm.h".}
proc SetAbortExecute*(this: var vtkAlgorithm; _arg: vtkTypeBool) {.
    importcpp: "SetAbortExecute", header: "vtkAlgorithm.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetAbortExecute ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AbortExecute  of  << this -> AbortExecute ) ; return this -> AbortExecute ; } ;
## Error: expected ';'!!!

proc AbortExecuteOn*(this: var vtkAlgorithm) {.importcpp: "AbortExecuteOn",
    header: "vtkAlgorithm.h".}
proc AbortExecuteOff*(this: var vtkAlgorithm) {.importcpp: "AbortExecuteOff",
    header: "vtkAlgorithm.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the execution progress of a process object.
  ##
## !!!Ignored construct:  virtual double GetAbortExecuteProgress ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Progress  of  << this -> Progress ) ; return this -> Progress ; } ;
## Error: expected ';'!!!

proc UpdateProgress*(this: var vtkAlgorithm; amount: cdouble) {.
    importcpp: "UpdateProgress", header: "vtkAlgorithm.h".}
proc SetProgressShiftScale*(this: var vtkAlgorithm; shift: cdouble; scale: cdouble) {.
    importcpp: "SetProgressShiftScale", header: "vtkAlgorithm.h".}
## !!!Ignored construct:  virtual double GetAbortExecuteProgressProgressShift ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ProgressShift  of  << this -> ProgressShift ) ; return this -> ProgressShift ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual double GetAbortExecuteProgressProgressShiftProgressScale ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ProgressScale  of  << this -> ProgressScale ) ; return this -> ProgressScale ; } ;
## Error: expected ';'!!!

proc SetProgressText*(this: var vtkAlgorithm; ptext: cstring) {.
    importcpp: "SetProgressText", header: "vtkAlgorithm.h".}
proc GetProgressText*(this: var vtkAlgorithm): cstring {.
    importcpp: "GetProgressText", header: "vtkAlgorithm.h".}
  ## /@}
  ## /@{
  ## *
  ##  The error code contains a possible error that occurred while
  ##  reading or writing the file.
  ##
## !!!Ignored construct:  virtual unsigned long GetAbortExecuteProgressProgressShiftProgressScaleErrorCode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ErrorCode  of  << this -> ErrorCode ) ; return this -> ErrorCode ; } ;
## Error: expected ';'!!!

proc INPUT_IS_OPTIONAL*(): ptr vtkInformationIntegerKey {.
    importcpp: "vtkAlgorithm::INPUT_IS_OPTIONAL(@)", header: "vtkAlgorithm.h".}
proc INPUT_IS_REPEATABLE*(): ptr vtkInformationIntegerKey {.
    importcpp: "vtkAlgorithm::INPUT_IS_REPEATABLE(@)", header: "vtkAlgorithm.h".}
proc INPUT_REQUIRED_FIELDS*(): ptr vtkInformationInformationVectorKey {.
    importcpp: "vtkAlgorithm::INPUT_REQUIRED_FIELDS(@)", header: "vtkAlgorithm.h".}
proc INPUT_REQUIRED_DATA_TYPE*(): ptr vtkInformationStringVectorKey {.
    importcpp: "vtkAlgorithm::INPUT_REQUIRED_DATA_TYPE(@)",
    header: "vtkAlgorithm.h".}
proc INPUT_ARRAYS_TO_PROCESS*(): ptr vtkInformationInformationVectorKey {.
    importcpp: "vtkAlgorithm::INPUT_ARRAYS_TO_PROCESS(@)",
    header: "vtkAlgorithm.h".}
proc INPUT_PORT*(): ptr vtkInformationIntegerKey {.
    importcpp: "vtkAlgorithm::INPUT_PORT(@)", header: "vtkAlgorithm.h".}
proc INPUT_CONNECTION*(): ptr vtkInformationIntegerKey {.
    importcpp: "vtkAlgorithm::INPUT_CONNECTION(@)", header: "vtkAlgorithm.h".}
proc CAN_PRODUCE_SUB_EXTENT*(): ptr vtkInformationIntegerKey {.
    importcpp: "vtkAlgorithm::CAN_PRODUCE_SUB_EXTENT(@)", header: "vtkAlgorithm.h".}
proc CAN_HANDLE_PIECE_REQUEST*(): ptr vtkInformationIntegerKey {.
    importcpp: "vtkAlgorithm::CAN_HANDLE_PIECE_REQUEST(@)",
    header: "vtkAlgorithm.h".}
proc SetInputArrayToProcess*(this: var vtkAlgorithm; idx: cint; port: cint;
                            connection: cint; fieldAssociation: cint; name: cstring) {.
    importcpp: "SetInputArrayToProcess", header: "vtkAlgorithm.h".}
proc SetInputArrayToProcess*(this: var vtkAlgorithm; idx: cint; port: cint;
                            connection: cint; fieldAssociation: cint;
                            fieldAttributeType: cint) {.
    importcpp: "SetInputArrayToProcess", header: "vtkAlgorithm.h".}
proc SetInputArrayToProcess*(this: var vtkAlgorithm; idx: cint;
                            info: ptr vtkInformation) {.
    importcpp: "SetInputArrayToProcess", header: "vtkAlgorithm.h".}
proc SetInputArrayToProcess*(this: var vtkAlgorithm; idx: cint; port: cint;
                            connection: cint; fieldAssociation: cstring;
                            attributeTypeorName: cstring) {.
    importcpp: "SetInputArrayToProcess", header: "vtkAlgorithm.h".}
proc GetInputArrayInformation*(this: var vtkAlgorithm; idx: cint): ptr vtkInformation {.
    importcpp: "GetInputArrayInformation", header: "vtkAlgorithm.h".}
proc RemoveAllInputs*(this: var vtkAlgorithm) {.importcpp: "RemoveAllInputs",
    header: "vtkAlgorithm.h".}
proc GetOutputDataObject*(this: var vtkAlgorithm; port: cint): ptr vtkDataObject {.
    importcpp: "GetOutputDataObject", header: "vtkAlgorithm.h".}
proc GetInputDataObject*(this: var vtkAlgorithm; port: cint; connection: cint): ptr vtkDataObject {.
    importcpp: "GetInputDataObject", header: "vtkAlgorithm.h".}
proc SetInputConnection*(this: var vtkAlgorithm; port: cint;
                        input: ptr vtkAlgorithmOutput) {.
    importcpp: "SetInputConnection", header: "vtkAlgorithm.h".}
proc SetInputConnection*(this: var vtkAlgorithm; input: ptr vtkAlgorithmOutput) {.
    importcpp: "SetInputConnection", header: "vtkAlgorithm.h".}
proc AddInputConnection*(this: var vtkAlgorithm; port: cint;
                        input: ptr vtkAlgorithmOutput) {.
    importcpp: "AddInputConnection", header: "vtkAlgorithm.h".}
proc AddInputConnection*(this: var vtkAlgorithm; input: ptr vtkAlgorithmOutput) {.
    importcpp: "AddInputConnection", header: "vtkAlgorithm.h".}
proc RemoveInputConnection*(this: var vtkAlgorithm; port: cint;
                           input: ptr vtkAlgorithmOutput) {.
    importcpp: "RemoveInputConnection", header: "vtkAlgorithm.h".}
proc RemoveInputConnection*(this: var vtkAlgorithm; port: cint; idx: cint) {.
    importcpp: "RemoveInputConnection", header: "vtkAlgorithm.h".}
proc RemoveAllInputConnections*(this: var vtkAlgorithm; port: cint) {.
    importcpp: "RemoveAllInputConnections", header: "vtkAlgorithm.h".}
proc SetInputDataObject*(this: var vtkAlgorithm; port: cint; data: ptr vtkDataObject) {.
    importcpp: "SetInputDataObject", header: "vtkAlgorithm.h".}
proc SetInputDataObject*(this: var vtkAlgorithm; data: ptr vtkDataObject) {.
    importcpp: "SetInputDataObject", header: "vtkAlgorithm.h".}
proc AddInputDataObject*(this: var vtkAlgorithm; port: cint; data: ptr vtkDataObject) {.
    importcpp: "AddInputDataObject", header: "vtkAlgorithm.h".}
proc AddInputDataObject*(this: var vtkAlgorithm; data: ptr vtkDataObject) {.
    importcpp: "AddInputDataObject", header: "vtkAlgorithm.h".}
proc GetOutputPort*(this: var vtkAlgorithm; index: cint): ptr vtkAlgorithmOutput {.
    importcpp: "GetOutputPort", header: "vtkAlgorithm.h".}
proc GetOutputPort*(this: var vtkAlgorithm): ptr vtkAlgorithmOutput {.
    importcpp: "GetOutputPort", header: "vtkAlgorithm.h".}
proc GetNumberOfInputConnections*(this: var vtkAlgorithm; port: cint): cint {.
    importcpp: "GetNumberOfInputConnections", header: "vtkAlgorithm.h".}
proc GetTotalNumberOfInputConnections*(this: var vtkAlgorithm): cint {.
    importcpp: "GetTotalNumberOfInputConnections", header: "vtkAlgorithm.h".}
proc GetInputConnection*(this: var vtkAlgorithm; port: cint; index: cint): ptr vtkAlgorithmOutput {.
    importcpp: "GetInputConnection", header: "vtkAlgorithm.h".}
proc GetInputAlgorithm*(this: var vtkAlgorithm; port: cint; index: cint;
                       algPort: var cint): ptr vtkAlgorithm {.
    importcpp: "GetInputAlgorithm", header: "vtkAlgorithm.h".}
proc GetInputAlgorithm*(this: var vtkAlgorithm; port: cint; index: cint): ptr vtkAlgorithm {.
    importcpp: "GetInputAlgorithm", header: "vtkAlgorithm.h".}
proc GetInputAlgorithm*(this: var vtkAlgorithm): ptr vtkAlgorithm {.
    importcpp: "GetInputAlgorithm", header: "vtkAlgorithm.h".}
proc GetInputExecutive*(this: var vtkAlgorithm; port: cint; index: cint): ptr vtkExecutive {.
    importcpp: "GetInputExecutive", header: "vtkAlgorithm.h".}
proc GetInputExecutive*(this: var vtkAlgorithm): ptr vtkExecutive {.
    importcpp: "GetInputExecutive", header: "vtkAlgorithm.h".}
proc GetInputInformation*(this: var vtkAlgorithm; port: cint; index: cint): ptr vtkInformation {.
    importcpp: "GetInputInformation", header: "vtkAlgorithm.h".}
proc GetInputInformation*(this: var vtkAlgorithm): ptr vtkInformation {.
    importcpp: "GetInputInformation", header: "vtkAlgorithm.h".}
proc GetOutputInformation*(this: var vtkAlgorithm; port: cint): ptr vtkInformation {.
    importcpp: "GetOutputInformation", header: "vtkAlgorithm.h".}
proc Update*(this: var vtkAlgorithm; port: cint) {.importcpp: "Update",
    header: "vtkAlgorithm.h".}
proc Update*(this: var vtkAlgorithm) {.importcpp: "Update", header: "vtkAlgorithm.h".}
proc Update*(this: var vtkAlgorithm; port: cint; requests: ptr vtkInformationVector): vtkTypeBool {.
    importcpp: "Update", header: "vtkAlgorithm.h".}
proc Update*(this: var vtkAlgorithm; requests: ptr vtkInformation): vtkTypeBool {.
    importcpp: "Update", header: "vtkAlgorithm.h".}
proc UpdatePiece*(this: var vtkAlgorithm; piece: cint; numPieces: cint;
                 ghostLevels: cint; extents: array[6, cint] = nil): cint {.
    importcpp: "UpdatePiece", header: "vtkAlgorithm.h".}
proc UpdateExtent*(this: var vtkAlgorithm; extents: array[6, cint]): cint {.
    importcpp: "UpdateExtent", header: "vtkAlgorithm.h".}
proc UpdateTimeStep*(this: var vtkAlgorithm; time: cdouble; piece: cint = -1;
                    numPieces: cint = 1; ghostLevels: cint = 0;
                    extents: array[6, cint] = nil): cint {.
    importcpp: "UpdateTimeStep", header: "vtkAlgorithm.h".}
proc UpdateInformation*(this: var vtkAlgorithm) {.importcpp: "UpdateInformation",
    header: "vtkAlgorithm.h".}
proc UpdateDataObject*(this: var vtkAlgorithm) {.importcpp: "UpdateDataObject",
    header: "vtkAlgorithm.h".}
proc PropagateUpdateExtent*(this: var vtkAlgorithm) {.
    importcpp: "PropagateUpdateExtent", header: "vtkAlgorithm.h".}
proc UpdateWholeExtent*(this: var vtkAlgorithm) {.importcpp: "UpdateWholeExtent",
    header: "vtkAlgorithm.h".}
proc ConvertTotalInputToPortConnection*(this: var vtkAlgorithm; ind: cint;
                                       port: var cint; conn: var cint) {.
    importcpp: "ConvertTotalInputToPortConnection", header: "vtkAlgorithm.h".}
proc SetReleaseDataFlag*(this: var vtkAlgorithm; a2: cint) {.
    importcpp: "SetReleaseDataFlag", header: "vtkAlgorithm.h".}
proc GetReleaseDataFlag*(this: var vtkAlgorithm): cint {.
    importcpp: "GetReleaseDataFlag", header: "vtkAlgorithm.h".}
proc ReleaseDataFlagOn*(this: var vtkAlgorithm) {.importcpp: "ReleaseDataFlagOn",
    header: "vtkAlgorithm.h".}
proc ReleaseDataFlagOff*(this: var vtkAlgorithm) {.importcpp: "ReleaseDataFlagOff",
    header: "vtkAlgorithm.h".}
proc UpdateExtentIsEmpty*(this: var vtkAlgorithm; pinfo: ptr vtkInformation;
                         output: ptr vtkDataObject): cint {.
    importcpp: "UpdateExtentIsEmpty", header: "vtkAlgorithm.h".}
proc UpdateExtentIsEmpty*(this: var vtkAlgorithm; pinfo: ptr vtkInformation;
                         extentType: cint): cint {.
    importcpp: "UpdateExtentIsEmpty", header: "vtkAlgorithm.h".}
proc SetDefaultExecutivePrototype*(proto: ptr vtkExecutive) {.
    importcpp: "vtkAlgorithm::SetDefaultExecutivePrototype(@)",
    header: "vtkAlgorithm.h".}
## !!!Ignored construct:  /@{ *
##  These functions return the update extent for output ports that
##  use 3D extents. Where port is not specified, it is assumed to
##  be 0.
##  int * GetUpdateExtent ( ) VTK_SIZEHINT ( 6 ) { return this -> GetUpdateExtent ( 0 ) ; } int * GetUpdateExtent ( int port ) VTK_SIZEHINT ( 6 ) ;
## Error: expected ';'!!!

proc GetUpdateExtent*(this: var vtkAlgorithm; x0: var cint; x1: var cint; y0: var cint;
                     y1: var cint; z0: var cint; z1: var cint) {.
    importcpp: "GetUpdateExtent", header: "vtkAlgorithm.h".}
proc GetUpdateExtent*(this: var vtkAlgorithm; port: cint; x0: var cint; x1: var cint;
                     y0: var cint; y1: var cint; z0: var cint; z1: var cint) {.
    importcpp: "GetUpdateExtent", header: "vtkAlgorithm.h".}
proc GetUpdateExtent*(this: var vtkAlgorithm; extent: array[6, cint]) {.
    importcpp: "GetUpdateExtent", header: "vtkAlgorithm.h".}
proc GetUpdateExtent*(this: var vtkAlgorithm; port: cint; extent: array[6, cint]) {.
    importcpp: "GetUpdateExtent", header: "vtkAlgorithm.h".}
proc GetUpdatePiece*(this: var vtkAlgorithm): cint {.importcpp: "GetUpdatePiece",
    header: "vtkAlgorithm.h".}
proc GetUpdatePiece*(this: var vtkAlgorithm; port: cint): cint {.
    importcpp: "GetUpdatePiece", header: "vtkAlgorithm.h".}
proc GetUpdateNumberOfPieces*(this: var vtkAlgorithm): cint {.
    importcpp: "GetUpdateNumberOfPieces", header: "vtkAlgorithm.h".}
proc GetUpdateNumberOfPieces*(this: var vtkAlgorithm; port: cint): cint {.
    importcpp: "GetUpdateNumberOfPieces", header: "vtkAlgorithm.h".}
proc GetUpdateGhostLevel*(this: var vtkAlgorithm): cint {.
    importcpp: "GetUpdateGhostLevel", header: "vtkAlgorithm.h".}
proc GetUpdateGhostLevel*(this: var vtkAlgorithm; port: cint): cint {.
    importcpp: "GetUpdateGhostLevel", header: "vtkAlgorithm.h".}
proc SetProgressObserver*(this: var vtkAlgorithm; a2: ptr vtkProgressObserver) {.
    importcpp: "SetProgressObserver", header: "vtkAlgorithm.h".}
proc GetnameInformationProgressObserver*(this: var vtkAlgorithm): ptr vtkProgressObserver {.
    importcpp: "GetnameInformationProgressObserver", header: "vtkAlgorithm.h".}
  ## /@}