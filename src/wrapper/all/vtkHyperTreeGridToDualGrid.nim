## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHyperTreeGridToDualGrid.h
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
##  @class   vtkHyperTreeGridToDualGrid
##  @brief   Convert hyper tree grid to the dual unstructured grid.
##
##  This filter is the new home for what was the dataset API within the
##  vtkHyperTreeGrid class.
##

import
  vtkFiltersHyperTreeModule, vtkHyperTreeGridAlgorithm

discard "forward decl of vtkHyperTreeGrid"
discard "forward decl of vtkHyperTreeGridNonOrientedMooreSuperCursor"
discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkUnstructuredGrid"
discard "forward decl of vtkPoints"
type
  vtkHyperTreeGridToDualGrid* {.importcpp: "vtkHyperTreeGridToDualGrid",
                               header: "vtkHyperTreeGridToDualGrid.h", bycopy.} = object of vtkHyperTreeGridAlgorithm
    vtkHyperTreeGridToDualGrid* {.importc: "vtkHyperTreeGridToDualGrid".}: VTK_NEWINSTANCE


proc New*(): ptr vtkHyperTreeGridToDualGrid {.
    importcpp: "vtkHyperTreeGridToDualGrid::New(@)",
    header: "vtkHyperTreeGridToDualGrid.h".}
type
  vtkHyperTreeGridToDualGridSuperclass* = vtkHyperTreeGridAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkHyperTreeGridToDualGrid::IsTypeOf(@)",
    header: "vtkHyperTreeGridToDualGrid.h".}
proc IsA*(this: var vtkHyperTreeGridToDualGrid; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkHyperTreeGridToDualGrid.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkHyperTreeGridToDualGrid {.
    importcpp: "vtkHyperTreeGridToDualGrid::SafeDownCast(@)",
    header: "vtkHyperTreeGridToDualGrid.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkHyperTreeGridToDualGrid :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHyperTreeGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHyperTreeGridToDualGrid :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHyperTreeGridToDualGrid :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkHyperTreeGridToDualGrid; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkHyperTreeGridToDualGrid.h".}