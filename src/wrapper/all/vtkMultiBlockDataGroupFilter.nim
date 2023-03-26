## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMultiBlockDataGroupFilter.h
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
##  @class   vtkMultiBlockDataGroupFilter
##  @brief   collects multiple inputs into one multi-group dataset
##
##  vtkMultiBlockDataGroupFilter is an M to 1 filter that merges multiple
##  input into one multi-group dataset. It will assign each input to
##  one group of the multi-group dataset and will assign each update piece
##  as a sub-block. For example, if there are two inputs and four update
##  pieces, the output contains two groups with four datasets each.
##
##  `vtkGroupDataSetsFilter` is a newer filter that can be used for similar
##  use-cases and is more flexible. It is recommended that new code uses
##  vtkGroupDataSetsFilter instead of this one.
##

import
  vtkFiltersGeneralModule, vtkMultiBlockDataSetAlgorithm

type
  vtkMultiBlockDataGroupFilter* {.importcpp: "vtkMultiBlockDataGroupFilter",
                                 header: "vtkMultiBlockDataGroupFilter.h", bycopy.} = object of vtkMultiBlockDataSetAlgorithm
    vtkMultiBlockDataGroupFilter* {.importc: "vtkMultiBlockDataGroupFilter".}: VTK_NEWINSTANCE

  vtkMultiBlockDataGroupFilterSuperclass* = vtkMultiBlockDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkMultiBlockDataGroupFilter::IsTypeOf(@)",
    header: "vtkMultiBlockDataGroupFilter.h".}
proc IsA*(this: var vtkMultiBlockDataGroupFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkMultiBlockDataGroupFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkMultiBlockDataGroupFilter {.
    importcpp: "vtkMultiBlockDataGroupFilter::SafeDownCast(@)",
    header: "vtkMultiBlockDataGroupFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkMultiBlockDataGroupFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMultiBlockDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMultiBlockDataGroupFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMultiBlockDataGroupFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkMultiBlockDataGroupFilter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkMultiBlockDataGroupFilter.h".}
proc New*(): ptr vtkMultiBlockDataGroupFilter {.
    importcpp: "vtkMultiBlockDataGroupFilter::New(@)",
    header: "vtkMultiBlockDataGroupFilter.h".}
proc AddInputData*(this: var vtkMultiBlockDataGroupFilter; a2: ptr vtkDataObject) {.
    importcpp: "AddInputData", header: "vtkMultiBlockDataGroupFilter.h".}
proc AddInputData*(this: var vtkMultiBlockDataGroupFilter; a2: cint;
                  a3: ptr vtkDataObject) {.importcpp: "AddInputData", header: "vtkMultiBlockDataGroupFilter.h".}