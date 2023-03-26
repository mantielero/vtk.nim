## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHierarchicalDataExtractDataSets.h
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
##  @class   vtkHierarchicalDataExtractDataSets
##  @brief   extract a number of datasets
##
##  Legacy class. Use vtkExtractDataSets instead.
##
##  @sa
##  vtkExtractDataSets
##

import
  vtkExtractDataSets, vtkFiltersExtractionModule

discard "forward decl of vtkHierarchicalDataExtractDataSetsInternals"
type
  vtkHierarchicalDataExtractDataSets* {.importcpp: "vtkHierarchicalDataExtractDataSets", header: "vtkHierarchicalDataExtractDataSets.h",
                                       bycopy.} = object of vtkExtractDataSets
    vtkHierarchicalDataExtractDataSets* {.
        importc: "vtkHierarchicalDataExtractDataSets".}: VTK_NEWINSTANCE

  vtkHierarchicalDataExtractDataSetsSuperclass* = vtkExtractDataSets

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkHierarchicalDataExtractDataSets::IsTypeOf(@)",
    header: "vtkHierarchicalDataExtractDataSets.h".}
proc IsA*(this: var vtkHierarchicalDataExtractDataSets; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkHierarchicalDataExtractDataSets.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkHierarchicalDataExtractDataSets {.
    importcpp: "vtkHierarchicalDataExtractDataSets::SafeDownCast(@)",
    header: "vtkHierarchicalDataExtractDataSets.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkHierarchicalDataExtractDataSets :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkExtractDataSets :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHierarchicalDataExtractDataSets :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHierarchicalDataExtractDataSets :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkHierarchicalDataExtractDataSets; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf", header: "vtkHierarchicalDataExtractDataSets.h".}
proc New*(): ptr vtkHierarchicalDataExtractDataSets {.
    importcpp: "vtkHierarchicalDataExtractDataSets::New(@)",
    header: "vtkHierarchicalDataExtractDataSets.h".}