## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkApproximatingSubdivisionFilter.h
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
##  @class   vtkApproximatingSubdivisionFilter
##  @brief   generate a subdivision surface using an Approximating Scheme
##
##  vtkApproximatingSubdivisionFilter is an abstract class that defines
##  the protocol for Approximating subdivision surface filters.
##
##  @par Thanks:
##  This work was supported by PHS Research Grant No. 1 P41 RR13218-01
##  from the National Center for Research Resources.
##

import
  vtkFiltersGeneralModule, vtkSubdivisionFilter

discard "forward decl of vtkCellArray"
discard "forward decl of vtkCellData"
discard "forward decl of vtkIdList"
discard "forward decl of vtkIntArray"
discard "forward decl of vtkPoints"
discard "forward decl of vtkPointData"
type
  vtkApproximatingSubdivisionFilter* {.importcpp: "vtkApproximatingSubdivisionFilter", header: "vtkApproximatingSubdivisionFilter.h",
                                      bycopy.} = object of vtkSubdivisionFilter
    vtkApproximatingSubdivisionFilter* {.importc: "vtkApproximatingSubdivisionFilter".}: VTK_NEWINSTANCE

  vtkApproximatingSubdivisionFilterSuperclass* = vtkSubdivisionFilter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkApproximatingSubdivisionFilter::IsTypeOf(@)",
    header: "vtkApproximatingSubdivisionFilter.h".}
proc IsA*(this: var vtkApproximatingSubdivisionFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkApproximatingSubdivisionFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkApproximatingSubdivisionFilter {.
    importcpp: "vtkApproximatingSubdivisionFilter::SafeDownCast(@)",
    header: "vtkApproximatingSubdivisionFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkApproximatingSubdivisionFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkSubdivisionFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkApproximatingSubdivisionFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkApproximatingSubdivisionFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkApproximatingSubdivisionFilter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkApproximatingSubdivisionFilter.h".}