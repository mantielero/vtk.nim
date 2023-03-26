## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMoleculeToBondStickFilter.h
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
##  @class   vtkMoleculeToBondStickFilter
##  @brief   Generate polydata with cylinders
##  representing bonds
##

import
  vtkDomainsChemistryModule, vtkMoleculeToPolyDataFilter

discard "forward decl of vtkMolecule"
type
  vtkMoleculeToBondStickFilter* {.importcpp: "vtkMoleculeToBondStickFilter",
                                 header: "vtkMoleculeToBondStickFilter.h", bycopy.} = object of vtkMoleculeToPolyDataFilter
    vtkMoleculeToBondStickFilter* {.importc: "vtkMoleculeToBondStickFilter".}: VTK_NEWINSTANCE

  vtkMoleculeToBondStickFilterSuperclass* = vtkMoleculeToPolyDataFilter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkMoleculeToBondStickFilter::IsTypeOf(@)",
    header: "vtkMoleculeToBondStickFilter.h".}
proc IsA*(this: var vtkMoleculeToBondStickFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkMoleculeToBondStickFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkMoleculeToBondStickFilter {.
    importcpp: "vtkMoleculeToBondStickFilter::SafeDownCast(@)",
    header: "vtkMoleculeToBondStickFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkMoleculeToBondStickFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMoleculeToPolyDataFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMoleculeToBondStickFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMoleculeToBondStickFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkMoleculeToBondStickFilter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkMoleculeToBondStickFilter.h".}
proc New*(): ptr vtkMoleculeToBondStickFilter {.
    importcpp: "vtkMoleculeToBondStickFilter::New(@)",
    header: "vtkMoleculeToBondStickFilter.h".}