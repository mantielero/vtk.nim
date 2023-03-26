## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHierarchicalDataExtractLevel.h
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
##  @class   vtkHierarchicalDataExtractLevel
##  @brief   extract levels between min and max
##
##  Legacy class. Use vtkExtractLevel instead.
##

import
  vtkExtractLevel, vtkFiltersExtractionModule

type
  vtkHierarchicalDataExtractLevel* {.importcpp: "vtkHierarchicalDataExtractLevel", header: "vtkHierarchicalDataExtractLevel.h",
                                    bycopy.} = object of vtkExtractLevel
    vtkHierarchicalDataExtractLevel* {.importc: "vtkHierarchicalDataExtractLevel".}: VTK_NEWINSTANCE

  vtkHierarchicalDataExtractLevelSuperclass* = vtkExtractLevel

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkHierarchicalDataExtractLevel::IsTypeOf(@)",
    header: "vtkHierarchicalDataExtractLevel.h".}
proc IsA*(this: var vtkHierarchicalDataExtractLevel; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkHierarchicalDataExtractLevel.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkHierarchicalDataExtractLevel {.
    importcpp: "vtkHierarchicalDataExtractLevel::SafeDownCast(@)",
    header: "vtkHierarchicalDataExtractLevel.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkHierarchicalDataExtractLevel :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkExtractLevel :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHierarchicalDataExtractLevel :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHierarchicalDataExtractLevel :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkHierarchicalDataExtractLevel; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkHierarchicalDataExtractLevel.h".}
proc New*(): ptr vtkHierarchicalDataExtractLevel {.
    importcpp: "vtkHierarchicalDataExtractLevel::New(@)",
    header: "vtkHierarchicalDataExtractLevel.h".}