## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkConvertToMultiBlockDataSet.h
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
##  @class vtkConvertToMultiBlockDataSet
##  @brief converts any data type into a vtkMultiBlockDataSet.
##
##  vtkConvertToMultiBlockDataSet can convert any input dataset type to a
##  vtkMultiBlockDataSet. It packs the input dataset into a single
##  block for non-composite datasets, and for composite datasets
##  it attempts create a multiblock reflecting the input's hierarchical
##  organization. If input a vtkMultiBlockDataSet, then this acts as a simple
##  pass through filters.
##
##  @sa vtkPConvertToMultiBlockDataSet
##

import
  vtkFiltersCoreModule, vtkMultiBlockDataSetAlgorithm

type
  vtkConvertToMultiBlockDataSet* {.importcpp: "vtkConvertToMultiBlockDataSet",
                                  header: "vtkConvertToMultiBlockDataSet.h",
                                  bycopy.} = object of vtkMultiBlockDataSetAlgorithm
    vtkConvertToMultiBlockDataSet* {.importc: "vtkConvertToMultiBlockDataSet".}: VTK_NEWINSTANCE


proc New*(): ptr vtkConvertToMultiBlockDataSet {.
    importcpp: "vtkConvertToMultiBlockDataSet::New(@)",
    header: "vtkConvertToMultiBlockDataSet.h".}
type
  vtkConvertToMultiBlockDataSetSuperclass* = vtkMultiBlockDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkConvertToMultiBlockDataSet::IsTypeOf(@)",
    header: "vtkConvertToMultiBlockDataSet.h".}
proc IsA*(this: var vtkConvertToMultiBlockDataSet; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkConvertToMultiBlockDataSet.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkConvertToMultiBlockDataSet {.
    importcpp: "vtkConvertToMultiBlockDataSet::SafeDownCast(@)",
    header: "vtkConvertToMultiBlockDataSet.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkConvertToMultiBlockDataSet :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMultiBlockDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkConvertToMultiBlockDataSet :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkConvertToMultiBlockDataSet :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkConvertToMultiBlockDataSet; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkConvertToMultiBlockDataSet.h".}