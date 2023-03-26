import vtkCommand, vtkObject
import vtkExecutive, vtkAlgorithm

# FIXME -----------
# From vtkCommand, to avoid 
proc Execute*(this: var vtkCommand; caller: ptr vtkObject; eventId: culong;
             callData: pointer) {.importcpp: "Execute", header: "vtkCommand.h".}

#....


proc GetAlgorithm*(this: var vtkExecutive): ptr vtkAlgorithm {.
    importcpp: "GetAlgorithm", header: "vtkExecutive.h".}