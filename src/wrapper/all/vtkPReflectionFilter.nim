## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPReflectionFilter.h
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
##  @class   vtkPReflectionFilter
##  @brief   parallel version of vtkReflectionFilter
##
##  vtkPReflectionFilter is a parallel version of vtkReflectionFilter which takes
##  into consideration the full dataset bounds for performing the reflection.
##

import
  vtkFiltersParallelModule, vtkReflectionFilter

discard "forward decl of vtkMultiProcessController"
type
  vtkPReflectionFilter* {.importcpp: "vtkPReflectionFilter",
                         header: "vtkPReflectionFilter.h", bycopy.} = object of vtkReflectionFilter
    vtkPReflectionFilter* {.importc: "vtkPReflectionFilter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPReflectionFilter {.importcpp: "vtkPReflectionFilter::New(@)",
                                    header: "vtkPReflectionFilter.h".}
type
  vtkPReflectionFilterSuperclass* = vtkReflectionFilter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPReflectionFilter::IsTypeOf(@)",
    header: "vtkPReflectionFilter.h".}
proc IsA*(this: var vtkPReflectionFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPReflectionFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPReflectionFilter {.
    importcpp: "vtkPReflectionFilter::SafeDownCast(@)",
    header: "vtkPReflectionFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPReflectionFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkReflectionFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPReflectionFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPReflectionFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPReflectionFilter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPReflectionFilter.h".}
proc SetController*(this: var vtkPReflectionFilter;
                   a2: ptr vtkMultiProcessController) {.importcpp: "SetController",
    header: "vtkPReflectionFilter.h".}
proc GetnameController*(this: var vtkPReflectionFilter): ptr vtkMultiProcessController {.
    importcpp: "GetnameController", header: "vtkPReflectionFilter.h".}
  ## /@}