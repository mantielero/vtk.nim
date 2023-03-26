## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPainterCommunicator.h
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
##  @class vtkPainterCommunicator
##  @brief A communicator that can safely be used inside a painter.
##
##  A simple container holding a handle to an MPI communicator.
##  This API is sufficient to allow for control flow with/without
##  MPI. The parallel parts of the code should use the derived
##  class vtkPPainterCommunicator.
##

import
  vtkRenderingLICOpenGL2Module

type
  vtkPainterCommunicator* {.importcpp: "vtkPainterCommunicator",
                           header: "vtkPainterCommunicator.h", bycopy.} = object


proc constructvtkPainterCommunicator*(): vtkPainterCommunicator {.constructor,
    importcpp: "vtkPainterCommunicator(@)", header: "vtkPainterCommunicator.h".}
proc destroyvtkPainterCommunicator*(this: var vtkPainterCommunicator) {.
    importcpp: "#.~vtkPainterCommunicator()", header: "vtkPainterCommunicator.h".}
proc constructvtkPainterCommunicator*(other: vtkPainterCommunicator): vtkPainterCommunicator {.
    constructor, importcpp: "vtkPainterCommunicator(@)",
    header: "vtkPainterCommunicator.h".}
proc Copy*(this: var vtkPainterCommunicator; a2: ptr vtkPainterCommunicator; a3: bool) {.
    importcpp: "Copy", header: "vtkPainterCommunicator.h".}
proc Duplicate*(this: var vtkPainterCommunicator; a2: ptr vtkPainterCommunicator) {.
    importcpp: "Duplicate", header: "vtkPainterCommunicator.h".}
proc GetRank*(this: var vtkPainterCommunicator): cint {.importcpp: "GetRank",
    header: "vtkPainterCommunicator.h".}
proc GetSize*(this: var vtkPainterCommunicator): cint {.importcpp: "GetSize",
    header: "vtkPainterCommunicator.h".}
proc GetIsNull*(this: var vtkPainterCommunicator): bool {.importcpp: "GetIsNull",
    header: "vtkPainterCommunicator.h".}
proc GetWorldRank*(this: var vtkPainterCommunicator): cint {.
    importcpp: "GetWorldRank", header: "vtkPainterCommunicator.h".}
proc GetWorldSize*(this: var vtkPainterCommunicator): cint {.
    importcpp: "GetWorldSize", header: "vtkPainterCommunicator.h".}
proc GetMPIInitialized*(this: var vtkPainterCommunicator): bool {.
    importcpp: "GetMPIInitialized", header: "vtkPainterCommunicator.h".}
proc GetMPIFinalized*(this: var vtkPainterCommunicator): bool {.
    importcpp: "GetMPIFinalized", header: "vtkPainterCommunicator.h".}
##  VTK-HeaderTest-Exclude: vtkPainterCommunicator.h
