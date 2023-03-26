## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDemandDrivenPipeline.h
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
##  @class   vtkDemandDrivenPipeline
##  @brief   Executive supporting on-demand execution.
##
##  vtkDemandDrivenPipeline is an executive that will execute an
##  algorithm only when its outputs are out-of-date with respect to its
##  inputs.
##

import
  vtkCommonExecutionModelModule, vtkExecutive

discard "forward decl of vtkAbstractArray"
discard "forward decl of vtkDataArray"
discard "forward decl of vtkDataSetAttributes"
discard "forward decl of vtkDemandDrivenPipelineInternals"
discard "forward decl of vtkFieldData"
discard "forward decl of vtkInformation"
discard "forward decl of vtkInformationIntegerKey"
discard "forward decl of vtkInformationVector"
discard "forward decl of vtkInformationKeyVectorKey"
discard "forward decl of vtkInformationUnsignedLongKey"
type
  vtkDemandDrivenPipeline* {.importcpp: "vtkDemandDrivenPipeline",
                            header: "vtkDemandDrivenPipeline.h", bycopy.} = object of vtkExecutive
    vtkDemandDrivenPipeline* {.importc: "vtkDemandDrivenPipeline".}: VTK_NEWINSTANCE
    ##  Time when information or data were last generated.


proc New*(): ptr vtkDemandDrivenPipeline {.importcpp: "vtkDemandDrivenPipeline::New(@)",
                                       header: "vtkDemandDrivenPipeline.h".}
type
  vtkDemandDrivenPipelineSuperclass* = vtkExecutive

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkDemandDrivenPipeline::IsTypeOf(@)",
    header: "vtkDemandDrivenPipeline.h".}
proc IsA*(this: var vtkDemandDrivenPipeline; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkDemandDrivenPipeline.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkDemandDrivenPipeline {.
    importcpp: "vtkDemandDrivenPipeline::SafeDownCast(@)",
    header: "vtkDemandDrivenPipeline.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkDemandDrivenPipeline :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkExecutive :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDemandDrivenPipeline :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDemandDrivenPipeline :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkDemandDrivenPipeline; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkDemandDrivenPipeline.h".}
proc ProcessRequest*(this: var vtkDemandDrivenPipeline; request: ptr vtkInformation;
                    inInfo: ptr ptr vtkInformationVector;
                    outInfo: ptr vtkInformationVector): vtkTypeBool {.
    importcpp: "ProcessRequest", header: "vtkDemandDrivenPipeline.h".}
proc ComputePipelineMTime*(this: var vtkDemandDrivenPipeline;
                          request: ptr vtkInformation;
                          inInfoVec: ptr ptr vtkInformationVector;
                          outInfoVec: ptr vtkInformationVector;
                          requestFromOutputPort: cint; mtime: ptr vtkMTimeType): cint {.
    importcpp: "ComputePipelineMTime", header: "vtkDemandDrivenPipeline.h".}
proc Update*(this: var vtkDemandDrivenPipeline): vtkTypeBool {.importcpp: "Update",
    header: "vtkDemandDrivenPipeline.h".}
proc Update*(this: var vtkDemandDrivenPipeline; port: cint): vtkTypeBool {.
    importcpp: "Update", header: "vtkDemandDrivenPipeline.h".}
## !!!Ignored construct:  /@} /@{ *
##  Get the PipelineMTime for this exective.
##  virtual vtkMTimeType GetPipelineMTimePipelineMTime ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PipelineMTime  of  << this -> PipelineMTime ) ; return this -> PipelineMTime ; } ;
## Error: expected ';'!!!

proc SetReleaseDataFlag*(this: var vtkDemandDrivenPipeline; port: cint; n: cint): cint {.
    importcpp: "SetReleaseDataFlag", header: "vtkDemandDrivenPipeline.h".}
proc GetReleaseDataFlag*(this: var vtkDemandDrivenPipeline; port: cint): cint {.
    importcpp: "GetReleaseDataFlag", header: "vtkDemandDrivenPipeline.h".}
proc UpdatePipelineMTime*(this: var vtkDemandDrivenPipeline): cint {.
    importcpp: "UpdatePipelineMTime", header: "vtkDemandDrivenPipeline.h".}
proc UpdateDataObject*(this: var vtkDemandDrivenPipeline): cint {.
    importcpp: "UpdateDataObject", header: "vtkDemandDrivenPipeline.h".}
proc UpdateInformation*(this: var vtkDemandDrivenPipeline): cint {.
    importcpp: "UpdateInformation", header: "vtkDemandDrivenPipeline.h".}
proc UpdateData*(this: var vtkDemandDrivenPipeline; outputPort: cint): cint {.
    importcpp: "UpdateData", header: "vtkDemandDrivenPipeline.h".}
proc REQUEST_DATA_OBJECT*(): ptr vtkInformationRequestKey {.
    importcpp: "vtkDemandDrivenPipeline::REQUEST_DATA_OBJECT(@)",
    header: "vtkDemandDrivenPipeline.h".}
proc REQUEST_INFORMATION*(): ptr vtkInformationRequestKey {.
    importcpp: "vtkDemandDrivenPipeline::REQUEST_INFORMATION(@)",
    header: "vtkDemandDrivenPipeline.h".}
proc REQUEST_DATA*(): ptr vtkInformationRequestKey {.
    importcpp: "vtkDemandDrivenPipeline::REQUEST_DATA(@)",
    header: "vtkDemandDrivenPipeline.h".}
proc REQUEST_DATA_NOT_GENERATED*(): ptr vtkInformationRequestKey {.
    importcpp: "vtkDemandDrivenPipeline::REQUEST_DATA_NOT_GENERATED(@)",
    header: "vtkDemandDrivenPipeline.h".}
proc RELEASE_DATA*(): ptr vtkInformationIntegerKey {.
    importcpp: "vtkDemandDrivenPipeline::RELEASE_DATA(@)",
    header: "vtkDemandDrivenPipeline.h".}
proc DATA_NOT_GENERATED*(): ptr vtkInformationIntegerKey {.
    importcpp: "vtkDemandDrivenPipeline::DATA_NOT_GENERATED(@)",
    header: "vtkDemandDrivenPipeline.h".}
proc NewDataObject*(`type`: cstring): ptr vtkDataObject {.
    importcpp: "vtkDemandDrivenPipeline::NewDataObject(@)",
    header: "vtkDemandDrivenPipeline.h".}