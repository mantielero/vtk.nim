## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHyperTreeGridNonOrientedCursor.h
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
##  @class   vtkHyperTreeGridNonOrientedCursor
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
##  JB This class was re-written for more optimisation by Jacques-Bernard Lekien,
##  Guenole Harel and Jerome Dubois, 2018.
##  This work was supported by Commissariat a l'Energie Atomique
##  CEA, DAM, DIF, F-91297 Arpajon, France.
##

import
  vtkCommonDataModelModule, vtkObject

discard "forward decl of vtkHyperTree"
discard "forward decl of vtkHyperTreeGrid"
discard "forward decl of vtkHyperTreeGridEntry"
type
  vtkHyperTreeGridNonOrientedCursor* {.importcpp: "vtkHyperTreeGridNonOrientedCursor", header: "vtkHyperTreeGridNonOrientedCursor.h",
                                      bycopy.} = object of vtkObject ## *
                                                                ##  Constructor
                                                                ##
    vtkHyperTreeGridNonOrientedCursor* {.importc: "vtkHyperTreeGridNonOrientedCursor".}: VTK_NEWINSTANCE
    ## *
    ##  JB
    ##
    ## *
    ##  JB .
    ##
    ## *
    ##  JB Le dernier noeud valid enregistre
    ##
    ## *
    ##  JB Hyper tree grid to which the cursor is attached
    ##

  vtkHyperTreeGridNonOrientedCursorSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkHyperTreeGridNonOrientedCursor::IsTypeOf(@)",
    header: "vtkHyperTreeGridNonOrientedCursor.h".}
proc IsA*(this: var vtkHyperTreeGridNonOrientedCursor; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkHyperTreeGridNonOrientedCursor.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkHyperTreeGridNonOrientedCursor {.
    importcpp: "vtkHyperTreeGridNonOrientedCursor::SafeDownCast(@)",
    header: "vtkHyperTreeGridNonOrientedCursor.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkHyperTreeGridNonOrientedCursor :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHyperTreeGridNonOrientedCursor :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHyperTreeGridNonOrientedCursor :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkHyperTreeGridNonOrientedCursor; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkHyperTreeGridNonOrientedCursor.h".}
proc New*(): ptr vtkHyperTreeGridNonOrientedCursor {.
    importcpp: "vtkHyperTreeGridNonOrientedCursor::New(@)",
    header: "vtkHyperTreeGridNonOrientedCursor.h".}
proc Clone*(this: var vtkHyperTreeGridNonOrientedCursor): ptr vtkHyperTreeGridNonOrientedCursor {.
    importcpp: "Clone", header: "vtkHyperTreeGridNonOrientedCursor.h".}
proc Initialize*(this: var vtkHyperTreeGridNonOrientedCursor;
                grid: ptr vtkHyperTreeGrid; treeIndex: vtkIdType;
                create: bool = false) {.importcpp: "Initialize", header: "vtkHyperTreeGridNonOrientedCursor.h".}
proc Initialize*(this: var vtkHyperTreeGridNonOrientedCursor;
                grid: ptr vtkHyperTreeGrid; tree: ptr vtkHyperTree; level: cuint;
                entry: var vtkHyperTreeGridEntry) {.importcpp: "Initialize",
    header: "vtkHyperTreeGridNonOrientedCursor.h".}
proc Initialize*(this: var vtkHyperTreeGridNonOrientedCursor;
                grid: ptr vtkHyperTreeGrid; tree: ptr vtkHyperTree; level: cuint;
                index: vtkIdType) {.importcpp: "Initialize",
                                  header: "vtkHyperTreeGridNonOrientedCursor.h".}
proc GetGrid*(this: var vtkHyperTreeGridNonOrientedCursor): ptr vtkHyperTreeGrid {.
    importcpp: "GetGrid", header: "vtkHyperTreeGridNonOrientedCursor.h".}
proc HasTree*(this: vtkHyperTreeGridNonOrientedCursor): bool {.noSideEffect,
    importcpp: "HasTree", header: "vtkHyperTreeGridNonOrientedCursor.h".}
proc GetTree*(this: vtkHyperTreeGridNonOrientedCursor): ptr vtkHyperTree {.
    noSideEffect, importcpp: "GetTree",
    header: "vtkHyperTreeGridNonOrientedCursor.h".}
proc GetVertexId*(this: var vtkHyperTreeGridNonOrientedCursor): vtkIdType {.
    importcpp: "GetVertexId", header: "vtkHyperTreeGridNonOrientedCursor.h".}
proc GetGlobalNodeIndex*(this: var vtkHyperTreeGridNonOrientedCursor): vtkIdType {.
    importcpp: "GetGlobalNodeIndex", header: "vtkHyperTreeGridNonOrientedCursor.h".}
proc GetDimension*(this: var vtkHyperTreeGridNonOrientedCursor): cuchar {.
    importcpp: "GetDimension", header: "vtkHyperTreeGridNonOrientedCursor.h".}
proc GetNumberOfChildren*(this: var vtkHyperTreeGridNonOrientedCursor): cuchar {.
    importcpp: "GetNumberOfChildren",
    header: "vtkHyperTreeGridNonOrientedCursor.h".}
proc SetGlobalIndexStart*(this: var vtkHyperTreeGridNonOrientedCursor;
                         index: vtkIdType) {.importcpp: "SetGlobalIndexStart",
    header: "vtkHyperTreeGridNonOrientedCursor.h".}
proc SetGlobalIndexFromLocal*(this: var vtkHyperTreeGridNonOrientedCursor;
                             index: vtkIdType) {.
    importcpp: "SetGlobalIndexFromLocal",
    header: "vtkHyperTreeGridNonOrientedCursor.h".}
proc SetMask*(this: var vtkHyperTreeGridNonOrientedCursor; state: bool) {.
    importcpp: "SetMask", header: "vtkHyperTreeGridNonOrientedCursor.h".}
proc IsMasked*(this: var vtkHyperTreeGridNonOrientedCursor): bool {.
    importcpp: "IsMasked", header: "vtkHyperTreeGridNonOrientedCursor.h".}
proc IsLeaf*(this: var vtkHyperTreeGridNonOrientedCursor): bool {.
    importcpp: "IsLeaf", header: "vtkHyperTreeGridNonOrientedCursor.h".}
proc SubdivideLeaf*(this: var vtkHyperTreeGridNonOrientedCursor) {.
    importcpp: "SubdivideLeaf", header: "vtkHyperTreeGridNonOrientedCursor.h".}
proc IsRoot*(this: var vtkHyperTreeGridNonOrientedCursor): bool {.
    importcpp: "IsRoot", header: "vtkHyperTreeGridNonOrientedCursor.h".}
proc GetLevel*(this: var vtkHyperTreeGridNonOrientedCursor): cuint {.
    importcpp: "GetLevel", header: "vtkHyperTreeGridNonOrientedCursor.h".}
proc ToChild*(this: var vtkHyperTreeGridNonOrientedCursor; ichild: cuchar) {.
    importcpp: "ToChild", header: "vtkHyperTreeGridNonOrientedCursor.h".}
proc ToRoot*(this: var vtkHyperTreeGridNonOrientedCursor) {.importcpp: "ToRoot",
    header: "vtkHyperTreeGridNonOrientedCursor.h".}
proc ToParent*(this: var vtkHyperTreeGridNonOrientedCursor) {.importcpp: "ToParent",
    header: "vtkHyperTreeGridNonOrientedCursor.h".}