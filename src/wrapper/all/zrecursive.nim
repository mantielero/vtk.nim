import vtkCommand, vtkObject
import vtkExecutive, vtkAlgorithm
import vtkInformation, vtkInformationKey

#----
# vtkCommand.nim
proc Execute*(this: var vtkCommand; caller: ptr vtkObject; eventId: culong;
             callData: pointer) {.importcpp: "Execute", header: "vtkCommand.h".}

#----
# vtkExecutive.nim
proc GetAlgorithm*(this: var vtkExecutive): ptr vtkAlgorithm {.
    importcpp: "GetAlgorithm", header: "vtkExecutive.h".}


#----
# vtkInformationKey.nim
proc ShallowCopy*(this: var vtkInformationKey; `from`: ptr vtkInformation;
                 to: ptr vtkInformation) {.importcpp: "ShallowCopy",
                                        header: "vtkInformationKey.h".}
proc DeepCopy*(this: var vtkInformationKey; `from`: ptr vtkInformation;
              to: ptr vtkInformation) {.importcpp: "DeepCopy",
                                     header: "vtkInformationKey.h".}
proc Has*(this: var vtkInformationKey; info: ptr vtkInformation): cint {.
    importcpp: "Has", header: "vtkInformationKey.h".}
proc Remove*(this: var vtkInformationKey; info: ptr vtkInformation) {.
    importcpp: "Remove", header: "vtkInformationKey.h".}
proc Report*(this: var vtkInformationKey; info: ptr vtkInformation;
            collector: ptr vtkGarbageCollector) {.importcpp: "Report",
    header: "vtkInformationKey.h".}
proc Print*(this: var vtkInformationKey; info: ptr vtkInformation) {.
    importcpp: "Print", header: "vtkInformationKey.h".}
proc Print*(this: var vtkInformationKey; os: var ostream; info: ptr vtkInformation) {.
    importcpp: "Print", header: "vtkInformationKey.h".}
proc NeedToExecute*(this: var vtkInformationKey;
                   vtkNotUsed: proc (a1: pipelineInfo): ptr vtkInformation;
                   vtkNotUsed: proc (a1: dobjInfo): ptr vtkInformation): bool {.
    importcpp: "NeedToExecute", header: "vtkInformationKey.h".}
proc StoreMetaData*(this: var vtkInformationKey;
                   vtkNotUsed: proc (a1: request): ptr vtkInformation;
                   vtkNotUsed: proc (a1: pipelineInfo): ptr vtkInformation;
                   vtkNotUsed: proc (a1: dobjInfo): ptr vtkInformation) {.
    importcpp: "StoreMetaData", header: "vtkInformationKey.h".}
proc CopyDefaultInformation*(this: var vtkInformationKey;
                            vtkNotUsed: proc (a1: request): ptr vtkInformation;
    vtkNotUsed: proc (a1: fromInfo): ptr vtkInformation;
                            vtkNotUsed: proc (a1: toInfo): ptr vtkInformation) {.
    importcpp: "CopyDefaultInformation", header: "vtkInformationKey.h".}

#----
# vtkInformationDataObjectKey.nim
proc Get*(this: var vtkInformationDataObjectKey; info: ptr vtkInformation): ptr vtkDataObject {.
    importcpp: "Get", header: "vtkInformationDataObjectKey.h".}
proc ShallowCopy*(this: var vtkInformationDataObjectKey; `from`: ptr vtkInformation;
                 to: ptr vtkInformation) {.importcpp: "ShallowCopy",
                                        header: "vtkInformationDataObjectKey.h".}
proc Report*(this: var vtkInformationDataObjectKey; info: ptr vtkInformation;
            collector: ptr vtkGarbageCollector) {.importcpp: "Report",
    header: "vtkInformationDataObjectKey.h".}