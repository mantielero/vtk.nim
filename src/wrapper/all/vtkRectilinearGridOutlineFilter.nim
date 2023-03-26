## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRectilinearGridOutlineFilter.h
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
##  @class   vtkRectilinearGridOutlineFilter
##  @brief   create wireframe outline for a rectilinear grid.
##
##  vtkRectilinearGridOutlineFilter works in parallel.  There is no reason.
##  to use this filter if you are not breaking the processing into pieces.
##  With one piece you can simply use vtkOutlineFilter.  This filter
##  ignores internal edges when the extent is not the whole extent.
##

import
  vtkFiltersParallelModule, vtkPolyDataAlgorithm

type
  vtkRectilinearGridOutlineFilter* {.importcpp: "vtkRectilinearGridOutlineFilter", header: "vtkRectilinearGridOutlineFilter.h",
                                    bycopy.} = object of vtkPolyDataAlgorithm
    vtkRectilinearGridOutlineFilter* {.importc: "vtkRectilinearGridOutlineFilter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkRectilinearGridOutlineFilter {.
    importcpp: "vtkRectilinearGridOutlineFilter::New(@)",
    header: "vtkRectilinearGridOutlineFilter.h".}
type
  vtkRectilinearGridOutlineFilterSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkRectilinearGridOutlineFilter::IsTypeOf(@)",
    header: "vtkRectilinearGridOutlineFilter.h".}
proc IsA*(this: var vtkRectilinearGridOutlineFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkRectilinearGridOutlineFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkRectilinearGridOutlineFilter {.
    importcpp: "vtkRectilinearGridOutlineFilter::SafeDownCast(@)",
    header: "vtkRectilinearGridOutlineFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkRectilinearGridOutlineFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRectilinearGridOutlineFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRectilinearGridOutlineFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkRectilinearGridOutlineFilter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkRectilinearGridOutlineFilter.h".}