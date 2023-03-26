## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPartitionedDataSetSource.h
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
##  @class vtkPartitionedDataSetSource
##  @brief a source that produces a vtkPartitionedDataSet.
##
##  vtkPartitionedDataSetSource generates a vtkPartitionedDataSet which is
##  composed of partitions of a given vtkParametricFunction.
##  The resulting partitioned dataset is split among ranks in an even fashion
##  by default.
##
##  The user can pass the parametric function to be used using SetParametricFunction.
##  Otherwise it will default to vtkParametricKlein as its Parametric function.
##
##  The partitioning scheme for the produced vtkPartitionedDataSet can be controlled
##  with the methods: SetNumberOfPartitiones, EnableRank, DisableRank, EnableAllRanks,
##  DisableAllRanks.
##
##  @see vtkParametricFunction
##  @see vtkPartitionedDataSet
##

import
  vtkFiltersSourcesModule, vtkPartitionedDataSetAlgorithm

discard "forward decl of vtkParametricFunction"
discard "forward decl of vtkPartitionedDataSet"
type
  vtkPartitionedDataSetSource* {.importcpp: "vtkPartitionedDataSetSource",
                                header: "vtkPartitionedDataSetSource.h", bycopy.} = object of vtkPartitionedDataSetAlgorithm
    vtkPartitionedDataSetSource* {.importc: "vtkPartitionedDataSetSource".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPartitionedDataSetSource {.
    importcpp: "vtkPartitionedDataSetSource::New(@)",
    header: "vtkPartitionedDataSetSource.h".}
type
  vtkPartitionedDataSetSourceSuperclass* = vtkPartitionedDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPartitionedDataSetSource::IsTypeOf(@)",
    header: "vtkPartitionedDataSetSource.h".}
proc IsA*(this: var vtkPartitionedDataSetSource; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPartitionedDataSetSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPartitionedDataSetSource {.
    importcpp: "vtkPartitionedDataSetSource::SafeDownCast(@)",
    header: "vtkPartitionedDataSetSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPartitionedDataSetSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPartitionedDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPartitionedDataSetSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPartitionedDataSetSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPartitionedDataSetSource; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkPartitionedDataSetSource.h".}
proc EnableRank*(this: var vtkPartitionedDataSetSource; rank: cint) {.
    importcpp: "EnableRank", header: "vtkPartitionedDataSetSource.h".}
proc EnableAllRanks*(this: var vtkPartitionedDataSetSource) {.
    importcpp: "EnableAllRanks", header: "vtkPartitionedDataSetSource.h".}
proc DisableRank*(this: var vtkPartitionedDataSetSource; rank: cint) {.
    importcpp: "DisableRank", header: "vtkPartitionedDataSetSource.h".}
proc DisableAllRanks*(this: var vtkPartitionedDataSetSource) {.
    importcpp: "DisableAllRanks", header: "vtkPartitionedDataSetSource.h".}
proc IsEnabledRank*(this: var vtkPartitionedDataSetSource; rank: cint): bool {.
    importcpp: "IsEnabledRank", header: "vtkPartitionedDataSetSource.h".}
proc SetNumberOfPartitions*(this: var vtkPartitionedDataSetSource; _arg: cint) {.
    importcpp: "SetNumberOfPartitions", header: "vtkPartitionedDataSetSource.h".}
proc GetNumberOfPartitionsMinValue*(this: var vtkPartitionedDataSetSource): cint {.
    importcpp: "GetNumberOfPartitionsMinValue",
    header: "vtkPartitionedDataSetSource.h".}
proc GetNumberOfPartitionsMaxValue*(this: var vtkPartitionedDataSetSource): cint {.
    importcpp: "GetNumberOfPartitionsMaxValue",
    header: "vtkPartitionedDataSetSource.h".}
## !!!Ignored construct:  virtual int GetNumberOfPartitions ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfPartitions  of  << this -> NumberOfPartitions ) ; return this -> NumberOfPartitions ; } ;
## Error: expected ';'!!!

proc SetParametricFunction*(this: var vtkPartitionedDataSetSource;
                           a2: ptr vtkParametricFunction) {.
    importcpp: "SetParametricFunction", header: "vtkPartitionedDataSetSource.h".}
proc GetnameParametricFunction*(this: var vtkPartitionedDataSetSource): ptr vtkParametricFunction {.
    importcpp: "GetnameParametricFunction",
    header: "vtkPartitionedDataSetSource.h".}
  ## /@}