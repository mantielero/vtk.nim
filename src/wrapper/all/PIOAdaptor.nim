## =========================================================================
##
##   Program:   ParaView
##   Module:    PIOAdaptor.h
##
##   Copyright (c) Kitware, Inc.
##   All rights reserved.
##   See Copyright.txt or http://www.paraview.org/HTML/Copyright.html for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================

import
  vtkDataArraySelection, vtkHyperTreeGridNonOrientedCursor, vtkMultiBlockDataSet,
  PIOData

discard "forward decl of vtkMultiProcessController"
type
  PIOMaterialVariable* {.importcpp: "PIOMaterialVariable", header: "PIOAdaptor.h",
                        bycopy.} = object
    prefix* {.importc: "prefix".}: string
    `var`* {.importc: "var".}: string
    material_name* {.importc: "material_name".}: string ##  full name of the material
    material_number* {.importc: "material_number".}: uint32_t ##  whether the variable should be scaled. scaled means the variable
                                                          ##  needs to be divided by volume (vcell)
    scale* {.importc: "scale".}: bool

  PIOAdaptor* {.importcpp: "PIOAdaptor", header: "PIOAdaptor.h", bycopy.} = object ##  Collect the metadata
    ##  Structure to access the dump file data
    ##  Time series of dumps
    ##  name.pio
    ##  base name to use for dumps
    ##  directories holding dumps
    ##  all dump files
    ##  Time step information
    ##  Times as cycle index
    ##  Times as simulation time
    ##  Index into dump files
    ##  Type of block structures to create within multiblock dataset
    ##  Cell variable data and initially enabled variables
    ##  total number of cells in the mesh. needed when loading material variables.
    ##  obtained by summing all values in pio field global_numcells
    ##  Record the ordering of the cells when building the hypertree grid
    ##  Needed so that the data will line up correctly
    ##  list of material variables


proc constructPIOAdaptor*(ctrl: ptr vtkMultiProcessController): PIOAdaptor {.
    constructor, importcpp: "PIOAdaptor(@)", header: "PIOAdaptor.h".}
proc destroyPIOAdaptor*(this: var PIOAdaptor) {.importcpp: "#.~PIOAdaptor()",
    header: "PIOAdaptor.h".}
proc initializeGlobal*(this: var PIOAdaptor; DumpDescFile: cstring): cint {.
    importcpp: "initializeGlobal", header: "PIOAdaptor.h".}
proc initializeDump*(this: var PIOAdaptor; timeStep: cint): cint {.
    importcpp: "initializeDump", header: "PIOAdaptor.h".}
proc create_geometry*(this: var PIOAdaptor; grid: ptr vtkMultiBlockDataSet) {.
    importcpp: "create_geometry", header: "PIOAdaptor.h".}
proc load_variable_data*(this: var PIOAdaptor; grid: ptr vtkMultiBlockDataSet;
                        cellSelection: ptr vtkDataArraySelection) {.
    importcpp: "load_variable_data", header: "PIOAdaptor.h".}
proc GetNumberOfTimeSteps*(this: var PIOAdaptor): cint {.
    importcpp: "GetNumberOfTimeSteps", header: "PIOAdaptor.h".}
proc GetSimulationTime*(this: var PIOAdaptor; step: cint): cdouble {.
    importcpp: "GetSimulationTime", header: "PIOAdaptor.h".}
proc GetCycleIndex*(this: var PIOAdaptor; step: cint): cdouble {.
    importcpp: "GetCycleIndex", header: "PIOAdaptor.h".}
proc GetPIOFileIndex*(this: var PIOAdaptor; step: cint): cdouble {.
    importcpp: "GetPIOFileIndex", header: "PIOAdaptor.h".}
proc GetNumberOfVariables*(this: var PIOAdaptor): cint {.
    importcpp: "GetNumberOfVariables", header: "PIOAdaptor.h".}
proc GetVariableName*(this: var PIOAdaptor; indx: cint): cstring {.
    importcpp: "GetVariableName", header: "PIOAdaptor.h".}
proc GetNumberOfDefaultVariables*(this: var PIOAdaptor): cint {.
    importcpp: "GetNumberOfDefaultVariables", header: "PIOAdaptor.h".}
proc GetVariableDefault*(this: var PIOAdaptor; indx: cint): cstring {.
    importcpp: "GetVariableDefault", header: "PIOAdaptor.h".}
proc GetHyperTreeGrid*(this: var PIOAdaptor): bool {.importcpp: "GetHyperTreeGrid",
    header: "PIOAdaptor.h".}
proc SetHyperTreeGrid*(this: var PIOAdaptor; val: bool) {.
    importcpp: "SetHyperTreeGrid", header: "PIOAdaptor.h".}
proc GetTracers*(this: var PIOAdaptor): bool {.importcpp: "GetTracers",
    header: "PIOAdaptor.h".}
proc SetTracers*(this: var PIOAdaptor; val: bool) {.importcpp: "SetTracers",
    header: "PIOAdaptor.h".}
proc GetFloat64*(this: var PIOAdaptor): bool {.importcpp: "GetFloat64",
    header: "PIOAdaptor.h".}
proc SetFloat64*(this: var PIOAdaptor; val: bool) {.importcpp: "SetFloat64",
    header: "PIOAdaptor.h".}