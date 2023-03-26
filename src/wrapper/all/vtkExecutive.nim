## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExecutive.h
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
##  @class   vtkExecutive
##  @brief   Superclass for all pipeline executives in VTK.
##
##  vtkExecutive is the superclass for all pipeline executives in VTK.
##  A VTK executive is responsible for controlling one instance of
##  vtkAlgorithm.  A pipeline consists of one or more executives that
##  control data flow.  Every reader, source, writer, or data
##  processing algorithm in the pipeline is implemented in an instance
##  of vtkAlgorithm.
##

import
  vtkCommonExecutionModelModule, vtkObject, vtkType, vtkObjectBase, vtkIndent

import
  vtkInformation

type
  ostream* = object # FIXME

discard "forward decl of vtkAlgorithm"
discard "forward decl of vtkAlgorithmOutput"
discard "forward decl of vtkAlgorithmToExecutiveFriendship"
discard "forward decl of vtkDataObject"
discard "forward decl of vtkExecutiveInternals"
discard "forward decl of vtkInformation"
discard "forward decl of vtkInformationExecutivePortKey"
discard "forward decl of vtkInformationExecutivePortVectorKey"
discard "forward decl of vtkInformationIntegerKey"
discard "forward decl of vtkInformationRequestKey"
discard "forward decl of vtkInformationKeyVectorKey"
discard "forward decl of vtkInformationVector"
type
  vtkExecutive* {.importcpp: "vtkExecutive", header: "vtkExecutive.h", bycopy.} = object of vtkObject ##  Store an information object for each output port of the algorithm.
    #vtkExecutive* {.importc: "vtkExecutive".}: VTK_NEWINSTANCE
    ##  Flag set when the algorithm is processing a request.
    ##  Pointers to an outside instance of input or output information.
    ##  No references are held.  These are used to implement internal
    ##  pipelines.
    ##  Internal implementation details.

  vtkExecutiveSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkExecutive::IsTypeOf(@)", header: "vtkExecutive.h".}
proc IsA*(this: var vtkExecutive; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkExecutive.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkExecutive {.
    importcpp: "vtkExecutive::SafeDownCast(@)", header: "vtkExecutive.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkExecutive :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExecutive :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExecutive :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkExecutive; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkExecutive.h".}

proc ProcessRequest*(this: var vtkExecutive; request: ptr vtkInformation;
                    inInfo: ptr ptr vtkInformationVector;
                    outInfo: ptr vtkInformationVector): vtkTypeBool {.
    importcpp: "ProcessRequest", header: "vtkExecutive.h".}
proc ComputePipelineMTime*(this: var vtkExecutive; request: ptr vtkInformation;
                          inInfoVec: ptr ptr vtkInformationVector;
                          outInfoVec: ptr vtkInformationVector;
                          requestFromOutputPort: cint; mtime: ptr vtkMTimeType): cint {.
    importcpp: "ComputePipelineMTime", header: "vtkExecutive.h".}
proc UpdateInformation*(this: var vtkExecutive): cint {.
    importcpp: "UpdateInformation", header: "vtkExecutive.h".}
proc Update*(this: var vtkExecutive): vtkTypeBool {.importcpp: "Update",
    header: "vtkExecutive.h".}
proc Update*(this: var vtkExecutive; port: cint): vtkTypeBool {.importcpp: "Update",
    header: "vtkExecutive.h".}
proc GetNumberOfInputPorts*(this: var vtkExecutive): cint {.
    importcpp: "GetNumberOfInputPorts", header: "vtkExecutive.h".}
proc GetNumberOfOutputPorts*(this: var vtkExecutive): cint {.
    importcpp: "GetNumberOfOutputPorts", header: "vtkExecutive.h".}
proc GetNumberOfInputConnections*(this: var vtkExecutive; port: cint): cint {.
    importcpp: "GetNumberOfInputConnections", header: "vtkExecutive.h".}
proc GetOutputInformation*(this: var vtkExecutive; port: cint): ptr vtkInformation {.
    importcpp: "GetOutputInformation", header: "vtkExecutive.h".}
proc GetOutputInformation*(this: var vtkExecutive): ptr vtkInformationVector {.
    importcpp: "GetOutputInformation", header: "vtkExecutive.h".}
proc GetInputInformation*(this: var vtkExecutive; port: cint; connection: cint): ptr vtkInformation {.
    importcpp: "GetInputInformation", header: "vtkExecutive.h".}
proc GetInputInformation*(this: var vtkExecutive; port: cint): ptr vtkInformationVector {.
    importcpp: "GetInputInformation", header: "vtkExecutive.h".}
proc GetInputInformation*(this: var vtkExecutive): ptr ptr vtkInformationVector {.
    importcpp: "GetInputInformation", header: "vtkExecutive.h".}
proc GetInputExecutive*(this: var vtkExecutive; port: cint; connection: cint): ptr vtkExecutive {.
    importcpp: "GetInputExecutive", header: "vtkExecutive.h".}
proc GetOutputData*(this: var vtkExecutive; port: cint): ptr vtkDataObject {.
    importcpp: "GetOutputData", header: "vtkExecutive.h".}
proc SetOutputData*(this: var vtkExecutive; port: cint; a3: ptr vtkDataObject;
                   info: ptr vtkInformation) {.importcpp: "SetOutputData",
    header: "vtkExecutive.h".}
proc SetOutputData*(this: var vtkExecutive; port: cint; a3: ptr vtkDataObject) {.
    importcpp: "SetOutputData", header: "vtkExecutive.h".}
proc GetInputData*(this: var vtkExecutive; port: cint; connection: cint): ptr vtkDataObject {.
    importcpp: "GetInputData", header: "vtkExecutive.h".}
proc GetInputData*(this: var vtkExecutive; port: cint; connection: cint;
                  inInfoVec: ptr ptr vtkInformationVector): ptr vtkDataObject {.
    importcpp: "GetInputData", header: "vtkExecutive.h".}
proc SetSharedInputInformation*(this: var vtkExecutive;
                               inInfoVec: ptr ptr vtkInformationVector) {.
    importcpp: "SetSharedInputInformation", header: "vtkExecutive.h".}
proc SetSharedOutputInformation*(this: var vtkExecutive;
                                outInfoVec: ptr vtkInformationVector) {.
    importcpp: "SetSharedOutputInformation", header: "vtkExecutive.h".}
proc UsesGarbageCollector*(this: vtkExecutive): bool {.noSideEffect,
    importcpp: "UsesGarbageCollector", header: "vtkExecutive.h".}
proc PRODUCER*(): ptr vtkInformationExecutivePortKey {.
    importcpp: "vtkExecutive::PRODUCER(@)", header: "vtkExecutive.h".}
proc CONSUMERS*(): ptr vtkInformationExecutivePortVectorKey {.
    importcpp: "vtkExecutive::CONSUMERS(@)", header: "vtkExecutive.h".}
proc FROM_OUTPUT_PORT*(): ptr vtkInformationIntegerKey {.
    importcpp: "vtkExecutive::FROM_OUTPUT_PORT(@)", header: "vtkExecutive.h".}
proc ALGORITHM_BEFORE_FORWARD*(): ptr vtkInformationIntegerKey {.
    importcpp: "vtkExecutive::ALGORITHM_BEFORE_FORWARD(@)",
    header: "vtkExecutive.h".}
proc ALGORITHM_AFTER_FORWARD*(): ptr vtkInformationIntegerKey {.
    importcpp: "vtkExecutive::ALGORITHM_AFTER_FORWARD(@)",
    header: "vtkExecutive.h".}
proc ALGORITHM_DIRECTION*(): ptr vtkInformationIntegerKey {.
    importcpp: "vtkExecutive::ALGORITHM_DIRECTION(@)", header: "vtkExecutive.h".}
proc FORWARD_DIRECTION*(): ptr vtkInformationIntegerKey {.
    importcpp: "vtkExecutive::FORWARD_DIRECTION(@)", header: "vtkExecutive.h".}
proc KEYS_TO_COPY*(): ptr vtkInformationKeyVectorKey {.
    importcpp: "vtkExecutive::KEYS_TO_COPY(@)", header: "vtkExecutive.h".}
const
  vtkExecutiveRequestUpstream* = 0
  vtkExecutiveRequestDownstream* = 1

const
  vtkExecutiveBeforeForward* = 0
  vtkExecutiveAfterForward* = 1

proc CallAlgorithm*(this: var vtkExecutive; request: ptr vtkInformation;
                   direction: cint; inInfo: ptr ptr vtkInformationVector;
                   outInfo: ptr vtkInformationVector): cint {.
    importcpp: "CallAlgorithm", header: "vtkExecutive.h".}