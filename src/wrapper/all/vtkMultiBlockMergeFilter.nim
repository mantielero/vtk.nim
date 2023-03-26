## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMultiBlockMergeFilter.h
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
##  @class   vtkMultiBlockMergeFilter
##  @brief   merges multiblock inputs into a single multiblock output
##
##  vtkMultiBlockMergeFilter is an M to 1 filter similar to
##  vtkMultiBlockDataGroupFilter. However where as that class creates N groups
##  in the output for N inputs, this creates 1 group in the output with N
##  datasets inside it. In actuality if the inputs have M blocks, this will
##  produce M blocks, each of which has N datasets. Inside the merged group,
##  the i'th data set comes from the i'th data set in the i'th input.
##

import
  vtkFiltersGeneralModule, vtkMultiBlockDataSetAlgorithm

type
  vtkMultiBlockMergeFilter* {.importcpp: "vtkMultiBlockMergeFilter",
                             header: "vtkMultiBlockMergeFilter.h", bycopy.} = object of vtkMultiBlockDataSetAlgorithm
    vtkMultiBlockMergeFilter* {.importc: "vtkMultiBlockMergeFilter".}: VTK_NEWINSTANCE

  vtkMultiBlockMergeFilterSuperclass* = vtkMultiBlockDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkMultiBlockMergeFilter::IsTypeOf(@)",
    header: "vtkMultiBlockMergeFilter.h".}
proc IsA*(this: var vtkMultiBlockMergeFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkMultiBlockMergeFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkMultiBlockMergeFilter {.
    importcpp: "vtkMultiBlockMergeFilter::SafeDownCast(@)",
    header: "vtkMultiBlockMergeFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkMultiBlockMergeFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMultiBlockDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMultiBlockMergeFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMultiBlockMergeFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkMultiBlockMergeFilter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkMultiBlockMergeFilter.h".}
proc New*(): ptr vtkMultiBlockMergeFilter {.importcpp: "vtkMultiBlockMergeFilter::New(@)",
                                        header: "vtkMultiBlockMergeFilter.h".}
proc AddInputData*(this: var vtkMultiBlockMergeFilter; a2: ptr vtkDataObject) {.
    importcpp: "AddInputData", header: "vtkMultiBlockMergeFilter.h".}
proc AddInputData*(this: var vtkMultiBlockMergeFilter; a2: cint; a3: ptr vtkDataObject) {.
    importcpp: "AddInputData", header: "vtkMultiBlockMergeFilter.h".}