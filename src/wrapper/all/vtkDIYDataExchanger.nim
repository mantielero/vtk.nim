## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDIYDataExchanger.h
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
##  @class vtkDIYDataExchanger
##  @brief exchange data-object among ranks.
##
##  vtkDIYDataExchanger is a utility to exchange data-objects across multiple
##  ranks. The design is based on `MPI_Alltoall` enabling algorithms to exchange
##  data-objects between each other. The implementation uses DIY.
##
##  Note, current implementation only supports exchanging vtkDataSet and
##  subclasses. That may change in the future.
##

import
  vtkObject, vtkParallelDIYModule, vtkSmartPointer

discard "forward decl of vtkDataSet"
discard "forward decl of vtkMultiProcessController"
type
  vtkDIYDataExchanger* {.importcpp: "vtkDIYDataExchanger",
                        header: "vtkDIYDataExchanger.h", bycopy.} = object of vtkObject
    vtkDIYDataExchanger* {.importc: "vtkDIYDataExchanger".}: VTK_NEWINSTANCE


proc New*(): ptr vtkDIYDataExchanger {.importcpp: "vtkDIYDataExchanger::New(@)",
                                   header: "vtkDIYDataExchanger.h".}
type
  vtkDIYDataExchangerSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkDIYDataExchanger::IsTypeOf(@)", header: "vtkDIYDataExchanger.h".}
proc IsA*(this: var vtkDIYDataExchanger; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkDIYDataExchanger.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkDIYDataExchanger {.
    importcpp: "vtkDIYDataExchanger::SafeDownCast(@)",
    header: "vtkDIYDataExchanger.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkDIYDataExchanger :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDIYDataExchanger :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDIYDataExchanger :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkDIYDataExchanger; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkDIYDataExchanger.h".}
proc SetController*(this: var vtkDIYDataExchanger; a2: ptr vtkMultiProcessController) {.
    importcpp: "SetController", header: "vtkDIYDataExchanger.h".}
proc GetnameController*(this: var vtkDIYDataExchanger): ptr vtkMultiProcessController {.
    importcpp: "GetnameController", header: "vtkDIYDataExchanger.h".}
  ## /@}
  ## *
  ##  Exchange data between all ranks in the process group defined by the
  ##  `Controller`.
  ##
  ##  Every rank builds a vector of datasets to send to other ranks. This is
  ##  `sendBuffer`. `sendCounts` lets the current rank specify which dataset is
  ##  targeted for which rank. For example, if an MPI group has 3 ranks and the
  ##  current process wants to send 2 datasets to rank 0, none to rank 1, and 3
  ##  datasets to rank 2, then the `sendBuffer` should be filled with 5 (2 + 3)
  ##  datasets and `sendCounts` should be of size 3 filled with `[2, 0, 3]`. The
  ##  first 2 datasets in sendBuffer will be sent to rank 0 while the following 3
  ##  datasets will be send to rank 2.
  ##
  ##  This is a collective operation which must be called on all ranks in the MPI
  ##  group irrespective of whether any rank is sending or receiving data.
  ##
  ##  The `recvBuffer` is filled with datasets received from other ranks.
  ##  `recvCounts` is similar to `sendCounts` in that it helps determine how many
  ##  datasets were received from each rank and their offset in the `recvBuffer`.
  ##
  ##  @param[in] sendBuffer  collection of datasets to exchange
  ##  @param[in] sendCounts  array of counts for number of datasets to send to
  ##                         each rank.
  ##  @param[out] recvBuffer datasets received from other ranks
  ##  @param[out] recvCounts array of counts for number of datasets received from
  ##                         each rank.
  ##
  ##  @returns true on success, else false
  ##
proc AllToAll*(this: var vtkDIYDataExchanger;
              sendBuffer: vector[vtkSmartPointer[vtkDataSet]];
              sendCounts: vector[cint];
              recvBuffer: var vector[vtkSmartPointer[vtkDataSet]];
              recvCounts: var vector[cint]): bool {.importcpp: "AllToAll",
    header: "vtkDIYDataExchanger.h".}