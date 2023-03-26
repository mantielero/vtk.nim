## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMergeDataObjectFilter.h
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
##  @class   vtkMergeDataObjectFilter
##  @brief   merge dataset and data object field to create dataset with attribute data
##
##  vtkMergeDataObjectFilter is a filter that merges the field from a
##  vtkDataObject with a vtkDataSet. The resulting combined dataset can
##  then be processed by other filters (e.g.,
##  vtkFieldDataToAttributeDataFilter) to create attribute data like
##  scalars, vectors, etc.
##
##  The filter operates as follows. The field data from the
##  vtkDataObject is merged with the input's vtkDataSet and then placed
##  in the output. You can choose to place the field data into the cell
##  data field, the point data field, or the datasets field (i.e., the
##  one inherited from vtkDataSet's superclass vtkDataObject). All this
##  data shuffling occurs via reference counting, therefore memory is
##  not copied.
##
##  One of the uses of this filter is to allow you to read/generate the
##  structure of a dataset independent of the attributes. So, for
##  example, you could store the dataset geometry/topology in one file,
##  and field data in another. Then use this filter in combination with
##  vtkFieldDataToAttributeData to create a dataset ready for
##  processing in the visualization pipeline.
##

import
  vtkDataSetAlgorithm, vtkFiltersCoreModule

type
  vtkMergeDataObjectFilter* {.importcpp: "vtkMergeDataObjectFilter",
                             header: "vtkMergeDataObjectFilter.h", bycopy.} = object of vtkDataSetAlgorithm
    vtkMergeDataObjectFilter* {.importc: "vtkMergeDataObjectFilter".}: VTK_NEWINSTANCE
    ##  which output field


proc New*(): ptr vtkMergeDataObjectFilter {.importcpp: "vtkMergeDataObjectFilter::New(@)",
                                        header: "vtkMergeDataObjectFilter.h".}
type
  vtkMergeDataObjectFilterSuperclass* = vtkDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkMergeDataObjectFilter::IsTypeOf(@)",
    header: "vtkMergeDataObjectFilter.h".}
proc IsA*(this: var vtkMergeDataObjectFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkMergeDataObjectFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkMergeDataObjectFilter {.
    importcpp: "vtkMergeDataObjectFilter::SafeDownCast(@)",
    header: "vtkMergeDataObjectFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkMergeDataObjectFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMergeDataObjectFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMergeDataObjectFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkMergeDataObjectFilter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkMergeDataObjectFilter.h".}
proc SetDataObjectInputData*(this: var vtkMergeDataObjectFilter;
                            `object`: ptr vtkDataObject) {.
    importcpp: "SetDataObjectInputData", header: "vtkMergeDataObjectFilter.h".}
proc GetDataObject*(this: var vtkMergeDataObjectFilter): ptr vtkDataObject {.
    importcpp: "GetDataObject", header: "vtkMergeDataObjectFilter.h".}
proc SetOutputField*(this: var vtkMergeDataObjectFilter; _arg: cint) {.
    importcpp: "SetOutputField", header: "vtkMergeDataObjectFilter.h".}
## !!!Ignored construct:  virtual int GetOutputField ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputField  of  << this -> OutputField ) ; return this -> OutputField ; } ;
## Error: expected ';'!!!

proc SetOutputFieldToDataObjectField*(this: var vtkMergeDataObjectFilter) {.
    importcpp: "SetOutputFieldToDataObjectField",
    header: "vtkMergeDataObjectFilter.h".}
proc SetOutputFieldToPointDataField*(this: var vtkMergeDataObjectFilter) {.
    importcpp: "SetOutputFieldToPointDataField",
    header: "vtkMergeDataObjectFilter.h".}
proc SetOutputFieldToCellDataField*(this: var vtkMergeDataObjectFilter) {.
    importcpp: "SetOutputFieldToCellDataField",
    header: "vtkMergeDataObjectFilter.h".}