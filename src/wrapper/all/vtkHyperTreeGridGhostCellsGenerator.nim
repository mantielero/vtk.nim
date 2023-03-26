## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHyperTreeGridGhostCellsGenerator.h
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
##  @class   vtkHyperTreeGridGhostCellsGenerator
##  @brief   Generated ghost cells (HyperTree's distributed).
##
##  This filter generates ghost cells for vtkHyperTreeGrid type data. The input vtkHyperTreeGrid
##  should have hyper trees distributed to a single process. This filter produces ghost hyper trees
##  at the interfaces between different processes, only composed of the nodes and leafs at this
##  interface to avoid data waste.
##
##  This filter should be used in a multi-processes environment, and is only required if wanting to
##  filter a vtkHyperTreeGrid with algorithms using Von Neumann or Moore supercursors afterwards.
##
##  @par Thanks:
##  This class was written by Jacques-Bernard Lekien, 2019
##  This work was supported by Commissariat a l'Energie Atomique
##  CEA, DAM, DIF, F-91297 Arpajon, France.
##

import
  vtkFiltersParallelModule, vtkHyperTreeGridAlgorithm

discard "forward decl of vtkBitArray"
discard "forward decl of vtkCellData"
discard "forward decl of vtkHyperTreeGrid"
discard "forward decl of vtkHyperTreeGridNonOrientedCursor"
type
  vtkHyperTreeGridGhostCellsGenerator* {.importcpp: "vtkHyperTreeGridGhostCellsGenerator", header: "vtkHyperTreeGridGhostCellsGenerator.h",
                                        bycopy.} = object of vtkHyperTreeGridAlgorithm
    vtkHyperTreeGridGhostCellsGenerator* {.
        importc: "vtkHyperTreeGridGhostCellsGenerator".}: VTK_NEWINSTANCE


proc New*(): ptr vtkHyperTreeGridGhostCellsGenerator {.
    importcpp: "vtkHyperTreeGridGhostCellsGenerator::New(@)",
    header: "vtkHyperTreeGridGhostCellsGenerator.h".}
type
  vtkHyperTreeGridGhostCellsGeneratorSuperclass* = vtkHyperTreeGridAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkHyperTreeGridGhostCellsGenerator::IsTypeOf(@)",
    header: "vtkHyperTreeGridGhostCellsGenerator.h".}
proc IsA*(this: var vtkHyperTreeGridGhostCellsGenerator; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkHyperTreeGridGhostCellsGenerator.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkHyperTreeGridGhostCellsGenerator {.
    importcpp: "vtkHyperTreeGridGhostCellsGenerator::SafeDownCast(@)",
    header: "vtkHyperTreeGridGhostCellsGenerator.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkHyperTreeGridGhostCellsGenerator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHyperTreeGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHyperTreeGridGhostCellsGenerator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHyperTreeGridGhostCellsGenerator :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkHyperTreeGridGhostCellsGenerator; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf", header: "vtkHyperTreeGridGhostCellsGenerator.h".}