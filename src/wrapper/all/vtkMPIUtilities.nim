## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMPIUtilities.h
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

import
  vtkParallelMPIModule

##  Forward declarations

discard "forward decl of vtkMPIController"
##  Description:
##  Rank 0 prints the user-supplied formatted message to stdout.
##  This method works just like printf, but, requires an additional
##  argument to specify the MPI controller for the application.
##  NOTE: This is a collective operation, all ranks in the given communicator
##  must call this method.

proc Printf*(comm: ptr vtkMPIController; format: cstring) {.varargs,
    importcpp: "vtkMPIUtilities::Printf(@)", header: "vtkMPIUtilities.h".}
##  Description:
##  Each rank, r_0 to r_{N-1}, prints the formatted message to stdout in
##  rank order. That is, r_i prints the supplied message right after r_{i-1}.
##  NOTE: This is a collective operation, all ranks in the given communicator
##  must call this method.

proc SynchronizedPrintf*(comm: ptr vtkMPIController; format: cstring) {.varargs,
    importcpp: "vtkMPIUtilities::SynchronizedPrintf(@)",
    header: "vtkMPIUtilities.h".}
##  END namespace vtkMPIUtilities
