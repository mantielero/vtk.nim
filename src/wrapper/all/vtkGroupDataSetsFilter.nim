## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGroupDataSetsFilter.h
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
##  @class vtkGroupDataSetsFilter
##  @brief groups inputs into a chosen composite dataset.
##
##  vtkGroupDataSetsFilter is a filter that can combine multiple input datasets
##  into a vtkMultBlockDataSet, vtkPartitionedDataSet, or a
##  vtkPartitionedDataSetCollection.
##
##  The inputs are added a individual blocks in the output and can be named
##  assigned block-names using `SetInputName`.
##
##  This is a more generic version of `vtkMultiBlockDataGroupFilter` and should
##  be preferred.
##

import
  vtkDataObjectAlgorithm, vtkFiltersGeneralModule

type
  vtkGroupDataSetsFilter* {.importcpp: "vtkGroupDataSetsFilter",
                           header: "vtkGroupDataSetsFilter.h", bycopy.} = object of vtkDataObjectAlgorithm
    vtkGroupDataSetsFilter* {.importc: "vtkGroupDataSetsFilter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkGroupDataSetsFilter {.importcpp: "vtkGroupDataSetsFilter::New(@)",
                                      header: "vtkGroupDataSetsFilter.h".}
type
  vtkGroupDataSetsFilterSuperclass* = vtkDataObjectAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGroupDataSetsFilter::IsTypeOf(@)",
    header: "vtkGroupDataSetsFilter.h".}
proc IsA*(this: var vtkGroupDataSetsFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkGroupDataSetsFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGroupDataSetsFilter {.
    importcpp: "vtkGroupDataSetsFilter::SafeDownCast(@)",
    header: "vtkGroupDataSetsFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGroupDataSetsFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataObjectAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGroupDataSetsFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGroupDataSetsFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGroupDataSetsFilter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGroupDataSetsFilter.h".}
proc SetOutputType*(this: var vtkGroupDataSetsFilter; _arg: cint) {.
    importcpp: "SetOutputType", header: "vtkGroupDataSetsFilter.h".}
## !!!Ignored construct:  virtual int GetOutputType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputType  of  << this -> OutputType ) ; return this -> OutputType ; } ;
## Error: expected ';'!!!

proc SetOutputTypeToPartitionedDataSet*(this: var vtkGroupDataSetsFilter) {.
    importcpp: "SetOutputTypeToPartitionedDataSet",
    header: "vtkGroupDataSetsFilter.h".}
proc SetOutputTypeToPartitionedDataSetCollection*(
    this: var vtkGroupDataSetsFilter) {.importcpp: "SetOutputTypeToPartitionedDataSetCollection",
                                     header: "vtkGroupDataSetsFilter.h".}
proc SetOutputTypeToMultiBlockDataSet*(this: var vtkGroupDataSetsFilter) {.
    importcpp: "SetOutputTypeToMultiBlockDataSet",
    header: "vtkGroupDataSetsFilter.h".}
proc SetInputName*(this: var vtkGroupDataSetsFilter; index: cint; name: cstring) {.
    importcpp: "SetInputName", header: "vtkGroupDataSetsFilter.h".}
proc GetInputName*(this: vtkGroupDataSetsFilter; index: cint): cstring {.noSideEffect,
    importcpp: "GetInputName", header: "vtkGroupDataSetsFilter.h".}
proc ClearInputNames*(this: var vtkGroupDataSetsFilter) {.
    importcpp: "ClearInputNames", header: "vtkGroupDataSetsFilter.h".}