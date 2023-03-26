## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPConvertToMultiBlockDataSet.h
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
##  @class vtkPConvertToMultiBlockDataSet
##  @brief parallel version of vtkConvertToMultiBlockDataSet
##
##  vtkPConvertToMultiBlockDataSet is the MPI-aware version of
##  vtkConvertToMultiBlockDataSet.
##
##  The extra work this filter does it to ensure that each `vtkPartitionedDataSet` instance
##  in the input when replaced by a `vtkMultiPieceDataSet in the output,
##  `vtkMultiPieceDataSet` has piece counts across ranks such the output
##  multiblock structure is identical on all ranks. `vtkPartitionedDataSet` /
##  `vtkPartitionedDataSetCollection` doesn't have this requirement and hence the
##  number of partitions in a `vtkPartitionedDataSet` in the input may not be
##  identical on all ranks. Hence, this extra check is needed.
##

import
  vtkConvertToMultiBlockDataSet, vtkFiltersParallelModule

discard "forward decl of vtkMultiProcessController"
type
  vtkPConvertToMultiBlockDataSet* {.importcpp: "vtkPConvertToMultiBlockDataSet",
                                   header: "vtkPConvertToMultiBlockDataSet.h",
                                   bycopy.} = object of vtkConvertToMultiBlockDataSet
    vtkPConvertToMultiBlockDataSet* {.importc: "vtkPConvertToMultiBlockDataSet".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPConvertToMultiBlockDataSet {.
    importcpp: "vtkPConvertToMultiBlockDataSet::New(@)",
    header: "vtkPConvertToMultiBlockDataSet.h".}
type
  vtkPConvertToMultiBlockDataSetSuperclass* = vtkConvertToMultiBlockDataSet

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPConvertToMultiBlockDataSet::IsTypeOf(@)",
    header: "vtkPConvertToMultiBlockDataSet.h".}
proc IsA*(this: var vtkPConvertToMultiBlockDataSet; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPConvertToMultiBlockDataSet.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPConvertToMultiBlockDataSet {.
    importcpp: "vtkPConvertToMultiBlockDataSet::SafeDownCast(@)",
    header: "vtkPConvertToMultiBlockDataSet.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPConvertToMultiBlockDataSet :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkConvertToMultiBlockDataSet :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPConvertToMultiBlockDataSet :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPConvertToMultiBlockDataSet :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPConvertToMultiBlockDataSet; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkPConvertToMultiBlockDataSet.h".}
proc SetController*(this: var vtkPConvertToMultiBlockDataSet;
                   a2: ptr vtkMultiProcessController) {.importcpp: "SetController",
    header: "vtkPConvertToMultiBlockDataSet.h".}
proc GetnameController*(this: var vtkPConvertToMultiBlockDataSet): ptr vtkMultiProcessController {.
    importcpp: "GetnameController", header: "vtkPConvertToMultiBlockDataSet.h".}
  ## /@}