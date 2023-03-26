## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHyperTreeGridNonOrientedVonNeumannSuperCursor.h
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright Nonice for more information.
##
## =========================================================================
## *
##  @class   vtkHyperTreeGridNonOrientedVonNeumannSuperCursor
##  @brief   Objects for traversal a HyperTreeGrid.
##
##  JB A REVOIR
##  Objects that can perform depth traversal of a hyper tree grid,
##  take into account more parameters (related to the grid structure) than
##  the compact hyper tree cursor implemented in vtkHyperTree can.
##  This is an abstract class.
##  Cursors are created by the HyperTreeGrid implementation.
##
##  @sa
##  vtkHyperTreeCursor vtkHyperTree vtkHyperTreeGrid
##
##  @par Thanks:
##  This class was written by Guenole Harel and Jacques-Bernard Lekien, 2014.
##  This class was re-written by Philippe Pebay, 2016.
##  This class was re-written and optimized by Jacques-Bernard Lekien,
##  Guenole Harel and Jerome Dubois, 2018.
##  This work was supported by Commissariat a l'Energie Atomique
##  CEA, DAM, DIF, F-91297 Arpajon, France.
##

import
  vtkHyperTreeGridNonOrientedSuperCursor

discard "forward decl of vtkHyperTreeGrid"
type
  vtkHyperTreeGridNonOrientedVonNeumannSuperCursor* {.
      importcpp: "vtkHyperTreeGridNonOrientedVonNeumannSuperCursor",
      header: "vtkHyperTreeGridNonOrientedVonNeumannSuperCursor.h", bycopy.} = object of vtkHyperTreeGridNonOrientedSuperCursor ## *
                                                                                                                         ##  Constructor
                                                                                                                         ##
    vtkHyperTreeGridNonOrientedVonNeumannSuperCursor*
        {.importc: "vtkHyperTreeGridNonOrientedVonNeumannSuperCursor".}: VTK_NEWINSTANCE

  vtkHyperTreeGridNonOrientedVonNeumannSuperCursorSuperclass* = vtkHyperTreeGridNonOrientedSuperCursor

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkHyperTreeGridNonOrientedVonNeumannSuperCursor::IsTypeOf(@)",
    header: "vtkHyperTreeGridNonOrientedVonNeumannSuperCursor.h".}
proc IsA*(this: var vtkHyperTreeGridNonOrientedVonNeumannSuperCursor;
         `type`: cstring): vtkTypeBool {.importcpp: "IsA", header: "vtkHyperTreeGridNonOrientedVonNeumannSuperCursor.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkHyperTreeGridNonOrientedVonNeumannSuperCursor {.importcpp: "vtkHyperTreeGridNonOrientedVonNeumannSuperCursor::SafeDownCast(@)",
    header: "vtkHyperTreeGridNonOrientedVonNeumannSuperCursor.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkHyperTreeGridNonOrientedVonNeumannSuperCursor :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHyperTreeGridNonOrientedSuperCursor :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHyperTreeGridNonOrientedVonNeumannSuperCursor :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHyperTreeGridNonOrientedVonNeumannSuperCursor :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkHyperTreeGridNonOrientedVonNeumannSuperCursor;
               os: var ostream; indent: vtkIndent) {.importcpp: "PrintSelf",
    header: "vtkHyperTreeGridNonOrientedVonNeumannSuperCursor.h".}
proc New*(): ptr vtkHyperTreeGridNonOrientedVonNeumannSuperCursor {.
    importcpp: "vtkHyperTreeGridNonOrientedVonNeumannSuperCursor::New(@)",
    header: "vtkHyperTreeGridNonOrientedVonNeumannSuperCursor.h".}
proc Initialize*(this: var vtkHyperTreeGridNonOrientedVonNeumannSuperCursor;
                grid: ptr vtkHyperTreeGrid; treeIndex: vtkIdType;
                create: bool = false) {.importcpp: "Initialize", header: "vtkHyperTreeGridNonOrientedVonNeumannSuperCursor.h".}