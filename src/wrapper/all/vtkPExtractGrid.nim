## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPExtractGrid.h
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
##  @class   vtkPExtractGrid
##  @brief   Extract VOI and/or sub-sample a distributed
##   structured dataset.
##
##
##   vtkPExtractGrid inherits from vtkExtractGrid and provides additional
##   functionality when dealing with a distributed dataset. Specifically, when
##   sub-sampling a dataset, a gap may be introduced between partitions. This
##   filter handles such cases correctly by growing the grid to the right to
##   close the gap.
##
##  @sa
##   vtkExtractGrid
##

import
  vtkExtractGrid, vtkFiltersParallelMPIModule

##  Forward declarations

discard "forward decl of vtkMPIController"
type
  vtkPExtractGrid* {.importcpp: "vtkPExtractGrid", header: "vtkPExtractGrid.h",
                    bycopy.} = object of vtkExtractGrid
    vtkPExtractGrid* {.importc: "vtkPExtractGrid".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPExtractGrid {.importcpp: "vtkPExtractGrid::New(@)",
                               header: "vtkPExtractGrid.h".}
type
  vtkPExtractGridSuperclass* = vtkExtractGrid

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPExtractGrid::IsTypeOf(@)", header: "vtkPExtractGrid.h".}
proc IsA*(this: var vtkPExtractGrid; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkPExtractGrid.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPExtractGrid {.
    importcpp: "vtkPExtractGrid::SafeDownCast(@)", header: "vtkPExtractGrid.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPExtractGrid :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkExtractGrid :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPExtractGrid :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPExtractGrid :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPExtractGrid; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPExtractGrid.h".}