import vtkCommand, vtkObject

# FIXME -----------
# From vtkCommand, to avoid 
proc Execute*(this: var vtkCommand; caller: ptr vtkObject; eventId: culong;
             callData: pointer) {.importcpp: "Execute", header: "vtkCommand.h".}

#....