## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInterpolatingSubdivisionFilter.h
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
##  @class   vtkInterpolatingSubdivisionFilter
##  @brief   generate a subdivision surface using an Interpolating Scheme
##
##  vtkInterpolatingSubdivisionFilter is an abstract class that defines
##  the protocol for interpolating subdivision surface filters.
##
##  @par Thanks:
##  This work was supported by PHS Research Grant No. 1 P41 RR13218-01
##  from the National Center for Research Resources.
##
##  @sa
##  vtkLinearSubdivisionFilter vtkButterflySubdivisionFilter
##

import
  vtkFiltersGeneralModule, vtkSubdivisionFilter

discard "forward decl of vtkCellArray"
discard "forward decl of vtkCellData"
discard "forward decl of vtkIdList"
discard "forward decl of vtkIntArray"
discard "forward decl of vtkPointData"
discard "forward decl of vtkPoints"
discard "forward decl of vtkPolyData"
type
  vtkInterpolatingSubdivisionFilter* {.importcpp: "vtkInterpolatingSubdivisionFilter", header: "vtkInterpolatingSubdivisionFilter.h",
                                      bycopy.} = object of vtkSubdivisionFilter
    vtkInterpolatingSubdivisionFilter* {.importc: "vtkInterpolatingSubdivisionFilter".}: VTK_NEWINSTANCE

  vtkInterpolatingSubdivisionFilterSuperclass* = vtkSubdivisionFilter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkInterpolatingSubdivisionFilter::IsTypeOf(@)",
    header: "vtkInterpolatingSubdivisionFilter.h".}
proc IsA*(this: var vtkInterpolatingSubdivisionFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkInterpolatingSubdivisionFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkInterpolatingSubdivisionFilter {.
    importcpp: "vtkInterpolatingSubdivisionFilter::SafeDownCast(@)",
    header: "vtkInterpolatingSubdivisionFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkInterpolatingSubdivisionFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkSubdivisionFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInterpolatingSubdivisionFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInterpolatingSubdivisionFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkInterpolatingSubdivisionFilter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkInterpolatingSubdivisionFilter.h".}