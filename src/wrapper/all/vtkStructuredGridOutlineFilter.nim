## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkStructuredGridOutlineFilter.h
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
##  @class   vtkStructuredGridOutlineFilter
##  @brief   create wireframe outline for structured grid
##
##  vtkStructuredGridOutlineFilter is a filter that generates a wireframe
##  outline of a structured grid (vtkStructuredGrid). Structured data is
##  topologically a cube, so the outline will have 12 "edges".
##

import
  vtkFiltersCoreModule, vtkPolyDataAlgorithm

type
  vtkStructuredGridOutlineFilter* {.importcpp: "vtkStructuredGridOutlineFilter",
                                   header: "vtkStructuredGridOutlineFilter.h",
                                   bycopy.} = object of vtkPolyDataAlgorithm
    vtkStructuredGridOutlineFilter* {.importc: "vtkStructuredGridOutlineFilter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkStructuredGridOutlineFilter {.
    importcpp: "vtkStructuredGridOutlineFilter::New(@)",
    header: "vtkStructuredGridOutlineFilter.h".}
type
  vtkStructuredGridOutlineFilterSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkStructuredGridOutlineFilter::IsTypeOf(@)",
    header: "vtkStructuredGridOutlineFilter.h".}
proc IsA*(this: var vtkStructuredGridOutlineFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkStructuredGridOutlineFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkStructuredGridOutlineFilter {.
    importcpp: "vtkStructuredGridOutlineFilter::SafeDownCast(@)",
    header: "vtkStructuredGridOutlineFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkStructuredGridOutlineFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkStructuredGridOutlineFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkStructuredGridOutlineFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkStructuredGridOutlineFilter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkStructuredGridOutlineFilter.h".}