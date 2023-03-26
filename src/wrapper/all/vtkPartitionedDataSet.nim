## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPartitionedDataSet.h
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
##  @class   vtkPartitionedDataSet
##  @brief   composite dataset to encapsulates a dataset consisting of
##  partitions.
##
##  A vtkPartitionedDataSet dataset groups multiple datasets together.
##  For example, say a simulation running in parallel on 16 processes
##  generated 16 datasets that when considering together form a whole
##  dataset. These are referred to as the partitions of the whole dataset.
##  Now imagine that we want to load a volume of 16 partitions in a
##  visualization cluster of 4 nodes. Each node could get 4 partitions,
##  not necessarily forming a whole rectangular region. In this case,
##  it is not possible to append the 4 partitions together into a vtkImageData.
##  We can then collect these 4 partitions together using a
##  vtkPartitionedDataSet.
##
##  It is required that all non-empty partitions have the same arrays
##  and that they can be processed together as a whole by the same kind of
##  filter. However, it is not required that they are of the same type.
##  For example, it is possible to have structured datasets together with
##  unstructured datasets as long as they are compatible meshes (i.e. can
##  be processed together for the same kind of filter).
##

import
  vtkCommonDataModelModule, vtkDataObjectTree

discard "forward decl of vtkDataSet"
type
  vtkPartitionedDataSet* {.importcpp: "vtkPartitionedDataSet",
                          header: "vtkPartitionedDataSet.h", bycopy.} = object of vtkDataObjectTree
    vtkPartitionedDataSet* {.importc: "vtkPartitionedDataSet".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPartitionedDataSet {.importcpp: "vtkPartitionedDataSet::New(@)",
                                     header: "vtkPartitionedDataSet.h".}
type
  vtkPartitionedDataSetSuperclass* = vtkDataObjectTree

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPartitionedDataSet::IsTypeOf(@)",
    header: "vtkPartitionedDataSet.h".}
proc IsA*(this: var vtkPartitionedDataSet; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPartitionedDataSet.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPartitionedDataSet {.
    importcpp: "vtkPartitionedDataSet::SafeDownCast(@)",
    header: "vtkPartitionedDataSet.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPartitionedDataSet :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataObjectTree :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPartitionedDataSet :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPartitionedDataSet :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPartitionedDataSet; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPartitionedDataSet.h".}
proc GetDataObjectType*(this: var vtkPartitionedDataSet): cint {.
    importcpp: "GetDataObjectType", header: "vtkPartitionedDataSet.h".}
proc SetNumberOfPartitions*(this: var vtkPartitionedDataSet; numPartitions: cuint) {.
    importcpp: "SetNumberOfPartitions", header: "vtkPartitionedDataSet.h".}
proc GetNumberOfPartitions*(this: var vtkPartitionedDataSet): cuint {.
    importcpp: "GetNumberOfPartitions", header: "vtkPartitionedDataSet.h".}
proc GetPartition*(this: var vtkPartitionedDataSet; idx: cuint): ptr vtkDataSet {.
    importcpp: "GetPartition", header: "vtkPartitionedDataSet.h".}
proc GetPartitionAsDataObject*(this: var vtkPartitionedDataSet; idx: cuint): ptr vtkDataObject {.
    importcpp: "GetPartitionAsDataObject", header: "vtkPartitionedDataSet.h".}
proc SetPartition*(this: var vtkPartitionedDataSet; idx: cuint;
                  partition: ptr vtkDataObject) {.importcpp: "SetPartition",
    header: "vtkPartitionedDataSet.h".}
proc HasMetaData*(this: var vtkPartitionedDataSet; idx: cuint): cint {.
    importcpp: "HasMetaData", header: "vtkPartitionedDataSet.h".}
proc GetMetaData*(this: var vtkPartitionedDataSet; idx: cuint): ptr vtkInformation {.
    importcpp: "GetMetaData", header: "vtkPartitionedDataSet.h".}
proc GetData*(info: ptr vtkInformation): ptr vtkPartitionedDataSet {.
    importcpp: "vtkPartitionedDataSet::GetData(@)",
    header: "vtkPartitionedDataSet.h".}
proc GetData*(v: ptr vtkInformationVector; i: cint = 0): ptr vtkPartitionedDataSet {.
    importcpp: "vtkPartitionedDataSet::GetData(@)",
    header: "vtkPartitionedDataSet.h".}
proc GetMetaData*(this: var vtkPartitionedDataSet;
                 iter: ptr vtkCompositeDataIterator): ptr vtkInformation {.
    importcpp: "GetMetaData", header: "vtkPartitionedDataSet.h".}
proc HasMetaData*(this: var vtkPartitionedDataSet;
                 iter: ptr vtkCompositeDataIterator): cint {.
    importcpp: "HasMetaData", header: "vtkPartitionedDataSet.h".}
proc RemoveNullPartitions*(this: var vtkPartitionedDataSet) {.
    importcpp: "RemoveNullPartitions", header: "vtkPartitionedDataSet.h".}