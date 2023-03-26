## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLinearSubdivisionFilter.h
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
##  @class   vtkLinearSubdivisionFilter
##  @brief   generate a subdivision surface using the Linear Scheme
##
##  vtkLinearSubdivisionFilter is a filter that generates output by
##  subdividing its input polydata. Each subdivision iteration create 4
##  new triangles for each triangle in the polydata.
##
##  @par Thanks:
##  This work was supported by PHS Research Grant No. 1 P41 RR13218-01
##  from the National Center for Research Resources.
##
##  @sa
##  vtkInterpolatingSubdivisionFilter vtkButterflySubdivisionFilter
##

import
  vtkFiltersModelingModule, vtkInterpolatingSubdivisionFilter

discard "forward decl of vtkIntArray"
discard "forward decl of vtkPointData"
discard "forward decl of vtkPoints"
discard "forward decl of vtkPolyData"
type
  vtkLinearSubdivisionFilter* {.importcpp: "vtkLinearSubdivisionFilter",
                               header: "vtkLinearSubdivisionFilter.h", bycopy.} = object of vtkInterpolatingSubdivisionFilter ## /@{
                                                                                                                       ## *
                                                                                                                       ##  Construct object with NumberOfSubdivisions set to 1.
                                                                                                                       ##
    vtkLinearSubdivisionFilter* {.importc: "vtkLinearSubdivisionFilter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkLinearSubdivisionFilter {.
    importcpp: "vtkLinearSubdivisionFilter::New(@)",
    header: "vtkLinearSubdivisionFilter.h".}
type
  vtkLinearSubdivisionFilterSuperclass* = vtkInterpolatingSubdivisionFilter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkLinearSubdivisionFilter::IsTypeOf(@)",
    header: "vtkLinearSubdivisionFilter.h".}
proc IsA*(this: var vtkLinearSubdivisionFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkLinearSubdivisionFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkLinearSubdivisionFilter {.
    importcpp: "vtkLinearSubdivisionFilter::SafeDownCast(@)",
    header: "vtkLinearSubdivisionFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkLinearSubdivisionFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInterpolatingSubdivisionFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLinearSubdivisionFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLinearSubdivisionFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkLinearSubdivisionFilter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkLinearSubdivisionFilter.h".}