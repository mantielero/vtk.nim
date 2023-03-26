## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExtractDataSets.h
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
##  @class   vtkExtractDataSets
##  @brief   extracts a number of datasets.
##
##  vtkExtractDataSets accepts a vtkHierarchicalBoxDataSet as input and extracts
##  different datasets from different levels. The output is
##  vtkMultiBlockDataSet of vtkMultiPiece datasets. Each block corresponds to
##  a level in the vktHierarchicalBoxDataSet. Individual datasets, within a level,
##  are stored in a vtkMultiPiece dataset.
##
##  @sa
##  vtkHierarchicalBoxDataSet, vtkMultiBlockDataSet vtkMultiPieceDataSet
##

import
  vtkFiltersExtractionModule, vtkMultiBlockDataSetAlgorithm

type
  vtkExtractDataSets* {.importcpp: "vtkExtractDataSets",
                       header: "vtkExtractDataSets.h", bycopy.} = object of vtkMultiBlockDataSetAlgorithm
    vtkExtractDataSets* {.importc: "vtkExtractDataSets".}: VTK_NEWINSTANCE


proc New*(): ptr vtkExtractDataSets {.importcpp: "vtkExtractDataSets::New(@)",
                                  header: "vtkExtractDataSets.h".}
type
  vtkExtractDataSetsSuperclass* = vtkMultiBlockDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkExtractDataSets::IsTypeOf(@)", header: "vtkExtractDataSets.h".}
proc IsA*(this: var vtkExtractDataSets; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkExtractDataSets.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkExtractDataSets {.
    importcpp: "vtkExtractDataSets::SafeDownCast(@)",
    header: "vtkExtractDataSets.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkExtractDataSets :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMultiBlockDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExtractDataSets :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExtractDataSets :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkExtractDataSets; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkExtractDataSets.h".}
proc AddDataSet*(this: var vtkExtractDataSets; level: cuint; idx: cuint) {.
    importcpp: "AddDataSet", header: "vtkExtractDataSets.h".}
proc ClearDataSetList*(this: var vtkExtractDataSets) {.
    importcpp: "ClearDataSetList", header: "vtkExtractDataSets.h".}