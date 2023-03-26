## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPPixelTransfer.h
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
##  @class   vtkPPixelTransfer
##
##  class to handle inter-process communication of pixel data from
##  non-contiguous regions of a shared index space. For example copying
##  a subset of one image to a subset of another. The class can be used
##  for purely local(no MPI) non-contigious data transfers by setting
##  the source and destination ranks to the same id. In that case
##  memcpy is used.
##
##  @sa
##  vtkPixelExtent
##

import
  vtkMPI, vtkMPIPixelTT, vtkMPIPixelView, vtkPixelExtent, vtkPixelTransfer,
  vtkRenderingParallelLICModule, vtkSetGet

##  included vtkSystemIncludes.h in the base class.

##  #define vtkPPixelTransferDEBUG

type
  vtkPPixelTransfer* {.importcpp: "vtkPPixelTransfer",
                      header: "vtkPPixelTransfer.h", bycopy.} = object of vtkPixelTransfer ##  distpatch helper for vtk data type enum
    ##  transaction id
    ##  rank who owns source memory
    ##  source extent
    ##  source subset to transfer
    ##  rank who owns destination memory
    ##  destination extent
    ##  destination subset
    ##  controls for non-blocking comm


proc constructvtkPPixelTransfer*(): vtkPPixelTransfer {.constructor,
    importcpp: "vtkPPixelTransfer(@)", header: "vtkPPixelTransfer.h".}
proc constructvtkPPixelTransfer*(srcRank: cint; srcWholeExt: vtkPixelExtent;
                                srcExt: vtkPixelExtent; destRank: cint;
                                destWholeExt: vtkPixelExtent;
                                destExt: vtkPixelExtent; id: cint = 0): vtkPPixelTransfer {.
    constructor, importcpp: "vtkPPixelTransfer(@)", header: "vtkPPixelTransfer.h".}
proc constructvtkPPixelTransfer*(srcRank: cint; srcWholeExt: vtkPixelExtent;
                                targetExt: vtkPixelExtent; destRank: cint;
                                destWholeExt: vtkPixelExtent; id: cint): vtkPPixelTransfer {.
    constructor, importcpp: "vtkPPixelTransfer(@)", header: "vtkPPixelTransfer.h".}
proc constructvtkPPixelTransfer*(srcRank: cint; destRank: cint;
                                wholeExt: vtkPixelExtent;
                                targetExt: vtkPixelExtent; id: cint = 0): vtkPPixelTransfer {.
    constructor, importcpp: "vtkPPixelTransfer(@)", header: "vtkPPixelTransfer.h".}
proc constructvtkPPixelTransfer*(srcRank: cint; destRank: cint; ext: vtkPixelExtent;
                                id: cint = 0): vtkPPixelTransfer {.constructor,
    importcpp: "vtkPPixelTransfer(@)", header: "vtkPPixelTransfer.h".}
proc constructvtkPPixelTransfer*(srcRank: cint; srcWholeExt: vtkPixelExtent;
                                destRank: cint; destWholeExt: vtkPixelExtent;
                                id: cint = 0): vtkPPixelTransfer {.constructor,
    importcpp: "vtkPPixelTransfer(@)", header: "vtkPPixelTransfer.h".}
proc constructvtkPPixelTransfer*(srcWholeExt: vtkPixelExtent;
                                srcExt: vtkPixelExtent;
                                destWholeExt: vtkPixelExtent;
                                destExt: vtkPixelExtent): vtkPPixelTransfer {.
    constructor, importcpp: "vtkPPixelTransfer(@)", header: "vtkPPixelTransfer.h".}
proc destroyvtkPPixelTransfer*(this: var vtkPPixelTransfer) {.
    importcpp: "#.~vtkPPixelTransfer()", header: "vtkPPixelTransfer.h".}
proc SetSourceRank*(this: var vtkPPixelTransfer; rank: cint) {.
    importcpp: "SetSourceRank", header: "vtkPPixelTransfer.h".}
proc GetSourceRank*(this: vtkPPixelTransfer): cint {.noSideEffect,
    importcpp: "GetSourceRank", header: "vtkPPixelTransfer.h".}
proc SetDestinationRank*(this: var vtkPPixelTransfer; rank: cint) {.
    importcpp: "SetDestinationRank", header: "vtkPPixelTransfer.h".}
proc GetDestinationRank*(this: vtkPPixelTransfer): cint {.noSideEffect,
    importcpp: "GetDestinationRank", header: "vtkPPixelTransfer.h".}
proc Sender*(this: vtkPPixelTransfer; rank: cint): bool {.noSideEffect,
    importcpp: "Sender", header: "vtkPPixelTransfer.h".}
proc Receiver*(this: vtkPPixelTransfer; rank: cint): bool {.noSideEffect,
    importcpp: "Receiver", header: "vtkPPixelTransfer.h".}
proc Local*(this: vtkPPixelTransfer; rank: cint): bool {.noSideEffect,
    importcpp: "Local", header: "vtkPPixelTransfer.h".}
proc SetSourceWholeExtent*(this: var vtkPPixelTransfer; srcExt: var vtkPixelExtent) {.
    importcpp: "SetSourceWholeExtent", header: "vtkPPixelTransfer.h".}
proc GetSourceWholeExtent*(this: var vtkPPixelTransfer): var vtkPixelExtent {.
    importcpp: "GetSourceWholeExtent", header: "vtkPPixelTransfer.h".}
proc GetSourceWholeExtent*(this: vtkPPixelTransfer): vtkPixelExtent {.noSideEffect,
    importcpp: "GetSourceWholeExtent", header: "vtkPPixelTransfer.h".}
proc SetSourceExtent*(this: var vtkPPixelTransfer; srcExt: var vtkPixelExtent) {.
    importcpp: "SetSourceExtent", header: "vtkPPixelTransfer.h".}
proc GetSourceExtent*(this: var vtkPPixelTransfer): var vtkPixelExtent {.
    importcpp: "GetSourceExtent", header: "vtkPPixelTransfer.h".}
proc GetSourceExtent*(this: vtkPPixelTransfer): vtkPixelExtent {.noSideEffect,
    importcpp: "GetSourceExtent", header: "vtkPPixelTransfer.h".}
proc SetDestinationWholeExtent*(this: var vtkPPixelTransfer;
                               destExt: var vtkPixelExtent) {.
    importcpp: "SetDestinationWholeExtent", header: "vtkPPixelTransfer.h".}
proc GetDestinationWholeExtent*(this: var vtkPPixelTransfer): var vtkPixelExtent {.
    importcpp: "GetDestinationWholeExtent", header: "vtkPPixelTransfer.h".}
proc GetDestinationWholeExtent*(this: vtkPPixelTransfer): vtkPixelExtent {.
    noSideEffect, importcpp: "GetDestinationWholeExtent",
    header: "vtkPPixelTransfer.h".}
proc SetDestinationExtent*(this: var vtkPPixelTransfer; destExt: var vtkPixelExtent) {.
    importcpp: "SetDestinationExtent", header: "vtkPPixelTransfer.h".}
proc GetDestinationExtent*(this: var vtkPPixelTransfer): var vtkPixelExtent {.
    importcpp: "GetDestinationExtent", header: "vtkPPixelTransfer.h".}
proc GetDestinationExtent*(this: vtkPPixelTransfer): vtkPixelExtent {.noSideEffect,
    importcpp: "GetDestinationExtent", header: "vtkPPixelTransfer.h".}
proc SetTransactionId*(this: var vtkPPixelTransfer; id: cint) {.
    importcpp: "SetTransactionId", header: "vtkPPixelTransfer.h".}
proc GetTransactionId*(this: vtkPPixelTransfer): cint {.noSideEffect,
    importcpp: "GetTransactionId", header: "vtkPPixelTransfer.h".}
proc SetUseBlockingSend*(this: var vtkPPixelTransfer; val: cint) {.
    importcpp: "SetUseBlockingSend", header: "vtkPPixelTransfer.h".}
proc GetUseBlockingSend*(this: vtkPPixelTransfer): cint {.noSideEffect,
    importcpp: "GetUseBlockingSend", header: "vtkPPixelTransfer.h".}
proc SetUseBlockingRecv*(this: var vtkPPixelTransfer; val: cint) {.
    importcpp: "SetUseBlockingRecv", header: "vtkPPixelTransfer.h".}
proc GetUseBlockingRecv*(this: vtkPPixelTransfer): cint {.noSideEffect,
    importcpp: "GetUseBlockingRecv", header: "vtkPPixelTransfer.h".}
proc Execute*[SOURCE_TYPE; DEST_TYPE](this: var vtkPPixelTransfer; comm: MPI_Comm;
                                    rank: cint; nComps: cint;
                                    srcData: ptr SOURCE_TYPE;
                                    destData: ptr DEST_TYPE;
                                    reqs: var vector[MPI_Request];
                                    types: var deque[MPI_Datatype]; tag: cint): cint {.
    importcpp: "Execute", header: "vtkPPixelTransfer.h".}
proc Execute*(this: var vtkPPixelTransfer; comm: MPI_Comm; rank: cint; nComps: cint;
             srcType: cint; srcData: pointer; destType: cint; destData: pointer;
             reqs: var vector[MPI_Request]; types: var deque[MPI_Datatype]; tag: cint): cint {.
    importcpp: "Execute", header: "vtkPPixelTransfer.h".}
proc Blit*(this: var vtkPPixelTransfer; nComps: cint; srcType: cint; srcData: pointer;
          destType: cint; destData: pointer): cint {.importcpp: "Blit",
    header: "vtkPPixelTransfer.h".}
## -----------------------------------------------------------------------------

proc Execute*(this: var vtkPPixelTransfer; comm: MPI_Comm; rank: cint; nComps: cint;
             srcData: ptr SOURCE_TYPE; destType: cint; destData: pointer;
             reqs: var vector[MPI_Request]; types: var deque[MPI_Datatype]; tag: cint): cint {.
    importcpp: "Execute", header: "vtkPPixelTransfer.h".}
## -----------------------------------------------------------------------------

proc Execute*(this: var vtkPPixelTransfer; comm: MPI_Comm; rank: cint; nComps: cint;
             srcData: ptr SOURCE_TYPE; destData: ptr DEST_TYPE;
             reqs: var vector[MPI_Request]; types: var deque[MPI_Datatype]; tag: cint): cint {.
    importcpp: "Execute", header: "vtkPPixelTransfer.h".}
proc `<<`*(os: var ostream; gt: vtkPPixelTransfer): var ostream {.importcpp: "(# << #)",
    header: "vtkPPixelTransfer.h".}
##  VTK-HeaderTest-Exclude: vtkPPixelTransfer.h
