## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPPainterCommunicator.h
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
##  @class   vtkPainterCommunicator
##  ranks that will execute a painter chain.
##
##
##  A communicator that can safely be used inside a painter.
##  A simple container holding an MPI communicator. The simple API
##  is sufficient to allow serial code (no MPI available) to steer
##  execution.
##

import
  vtkPainterCommunicator, vtkRenderingParallelLICModule

discard "forward decl of vtkPPainterCommunicatorInternals"
discard "forward decl of vtkMPICommunicatorOpaqueComm"
type
  vtkPPainterCommunicator* {.importcpp: "vtkPPainterCommunicator",
                            header: "vtkPPainterCommunicator.h", bycopy.} = object of vtkPainterCommunicator ##  PImpl for MPI datatypes


proc constructvtkPPainterCommunicator*(): vtkPPainterCommunicator {.constructor,
    importcpp: "vtkPPainterCommunicator(@)", header: "vtkPPainterCommunicator.h".}
proc destroyvtkPPainterCommunicator*(this: var vtkPPainterCommunicator) {.
    importcpp: "#.~vtkPPainterCommunicator()", header: "vtkPPainterCommunicator.h".}
proc constructvtkPPainterCommunicator*(other: vtkPPainterCommunicator): vtkPPainterCommunicator {.
    constructor, importcpp: "vtkPPainterCommunicator(@)",
    header: "vtkPPainterCommunicator.h".}
proc Copy*(this: var vtkPPainterCommunicator; other: ptr vtkPainterCommunicator;
          ownership: bool) {.importcpp: "Copy", header: "vtkPPainterCommunicator.h".}
proc Duplicate*(this: var vtkPPainterCommunicator; other: ptr vtkPainterCommunicator) {.
    importcpp: "Duplicate", header: "vtkPPainterCommunicator.h".}
proc GetRank*(this: var vtkPPainterCommunicator): cint {.importcpp: "GetRank",
    header: "vtkPPainterCommunicator.h".}
proc GetSize*(this: var vtkPPainterCommunicator): cint {.importcpp: "GetSize",
    header: "vtkPPainterCommunicator.h".}
proc GetIsNull*(this: var vtkPPainterCommunicator): bool {.importcpp: "GetIsNull",
    header: "vtkPPainterCommunicator.h".}
proc GetWorldRank*(this: var vtkPPainterCommunicator): cint {.
    importcpp: "GetWorldRank", header: "vtkPPainterCommunicator.h".}
proc GetWorldSize*(this: var vtkPPainterCommunicator): cint {.
    importcpp: "GetWorldSize", header: "vtkPPainterCommunicator.h".}
proc GetMPIInitialized*(this: var vtkPPainterCommunicator): bool {.
    importcpp: "GetMPIInitialized", header: "vtkPPainterCommunicator.h".}
proc GetMPIFinalized*(this: var vtkPPainterCommunicator): bool {.
    importcpp: "GetMPIFinalized", header: "vtkPPainterCommunicator.h".}
proc MPIInitialized*(): bool {.importcpp: "vtkPPainterCommunicator::MPIInitialized(@)",
                            header: "vtkPPainterCommunicator.h".}
proc MPIFinalized*(): bool {.importcpp: "vtkPPainterCommunicator::MPIFinalized(@)",
                          header: "vtkPPainterCommunicator.h".}
proc SetCommunicator*(this: var vtkPPainterCommunicator;
                     comm: ptr vtkMPICommunicatorOpaqueComm) {.
    importcpp: "SetCommunicator", header: "vtkPPainterCommunicator.h".}
proc GetCommunicator*(this: var vtkPPainterCommunicator;
                     comm: ptr vtkMPICommunicatorOpaqueComm) {.
    importcpp: "GetCommunicator", header: "vtkPPainterCommunicator.h".}
proc GetCommunicator*(this: var vtkPPainterCommunicator): pointer {.
    importcpp: "GetCommunicator", header: "vtkPPainterCommunicator.h".}
proc SubsetCommunicator*(this: var vtkPPainterCommunicator;
                        comm: ptr vtkMPICommunicatorOpaqueComm; `include`: cint) {.
    importcpp: "SubsetCommunicator", header: "vtkPPainterCommunicator.h".}
proc GetGlobalCommunicator*(): ptr vtkMPICommunicatorOpaqueComm {.
    importcpp: "vtkPPainterCommunicator::GetGlobalCommunicator(@)",
    header: "vtkPPainterCommunicator.h".}
##  VTK-HeaderTest-Exclude: vtkPPainterCommunicator.h
