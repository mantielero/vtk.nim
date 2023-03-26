## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHyperTreeGridLevelEntry.h
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
##  @class   vtkHyperTreeGridLevelEntry
##  @brief   LevelEntry is a cache data for cursors requiring level info
##
##  cf. vtkHyperTreeGridEntry
##
##  @sa
##  vtkHyperTreeGridEntry
##  vtkHyperTreeGridLevelEntry
##  vtkHyperTreeGridGeometryEntry
##  vtkHyperTreeGridGeometryLevelEntry
##  vtkHyperTreeGridNonOrientedSuperCursor
##  vtkHyperTreeGridNonOrientedSuperCursorLight
##
##  @par Thanks:
##  This class was written by Jacques-Bernard Lekien, Jerome Dubois and
##  Guenole Harel, CEA 2018.
##  This work was supported by Commissariat a l'Energie Atomique
##  CEA, DAM, DIF, F-91297 Arpajon, France.
##

import
  vtkObject, vtkSmartPointer

discard "forward decl of vtkHyperTree"
discard "forward decl of vtkHyperTreeGrid"
discard "forward decl of vtkHyperTreeGridNonOrientedCursor"
type
  vtkHyperTreeGridLevelEntry* {.importcpp: "vtkHyperTreeGridLevelEntry",
                               header: "vtkHyperTreeGridLevelEntry.h", bycopy.} = object ## *
                                                                                    ##  Display info about the entry
                                                                                    ##
                                                                                    ## *
                                                                                    ##  pointer to the HyperTree containing the current cell.
                                                                                    ##
    ## *
    ##  level of the current cell in the HyperTree.
    ##
    ## *
    ##  index of the current cell in the HyperTree.
    ##


proc PrintSelf*(this: var vtkHyperTreeGridLevelEntry; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkHyperTreeGridLevelEntry.h".}
proc Dump*(this: var vtkHyperTreeGridLevelEntry; os: var ostream) {.importcpp: "Dump",
    header: "vtkHyperTreeGridLevelEntry.h".}
proc constructvtkHyperTreeGridLevelEntry*(): vtkHyperTreeGridLevelEntry {.
    constructor, importcpp: "vtkHyperTreeGridLevelEntry(@)",
    header: "vtkHyperTreeGridLevelEntry.h".}
proc constructvtkHyperTreeGridLevelEntry*(entry: ptr vtkHyperTreeGridLevelEntry): vtkHyperTreeGridLevelEntry {.
    constructor, importcpp: "vtkHyperTreeGridLevelEntry(@)",
    header: "vtkHyperTreeGridLevelEntry.h".}
proc constructvtkHyperTreeGridLevelEntry*(tree: ptr vtkHyperTree; level: cuint;
    index: vtkIdType): vtkHyperTreeGridLevelEntry {.constructor,
    importcpp: "vtkHyperTreeGridLevelEntry(@)",
    header: "vtkHyperTreeGridLevelEntry.h".}
proc constructvtkHyperTreeGridLevelEntry*(grid: ptr vtkHyperTreeGrid;
    treeIndex: vtkIdType; create: bool = false): vtkHyperTreeGridLevelEntry {.
    constructor, importcpp: "vtkHyperTreeGridLevelEntry(@)",
    header: "vtkHyperTreeGridLevelEntry.h".}
proc destroyvtkHyperTreeGridLevelEntry*(this: var vtkHyperTreeGridLevelEntry) {.
    importcpp: "#.~vtkHyperTreeGridLevelEntry()",
    header: "vtkHyperTreeGridLevelEntry.h".}
proc Reset*(this: var vtkHyperTreeGridLevelEntry) {.importcpp: "Reset",
    header: "vtkHyperTreeGridLevelEntry.h".}
proc Initialize*(this: var vtkHyperTreeGridLevelEntry; tree: ptr vtkHyperTree;
                level: cuint; index: vtkIdType) {.importcpp: "Initialize",
    header: "vtkHyperTreeGridLevelEntry.h".}
proc Initialize*(this: var vtkHyperTreeGridLevelEntry; grid: ptr vtkHyperTreeGrid;
                treeIndex: vtkIdType; create: bool = false): ptr vtkHyperTree {.
    importcpp: "Initialize", header: "vtkHyperTreeGridLevelEntry.h".}
proc Copy*(this: var vtkHyperTreeGridLevelEntry;
          entry: ptr vtkHyperTreeGridLevelEntry) {.importcpp: "Copy",
    header: "vtkHyperTreeGridLevelEntry.h".}
proc GetHyperTreeGridNonOrientedCursor*(this: var vtkHyperTreeGridLevelEntry;
                                       grid: ptr vtkHyperTreeGrid): vtkSmartPointer[
    vtkHyperTreeGridNonOrientedCursor] {.importcpp: "GetHyperTreeGridNonOrientedCursor",
                                        header: "vtkHyperTreeGridLevelEntry.h".}
proc GetVertexId*(this: vtkHyperTreeGridLevelEntry): vtkIdType {.noSideEffect,
    importcpp: "GetVertexId", header: "vtkHyperTreeGridLevelEntry.h".}
proc GetGlobalNodeIndex*(this: vtkHyperTreeGridLevelEntry): vtkIdType {.
    noSideEffect, importcpp: "GetGlobalNodeIndex",
    header: "vtkHyperTreeGridLevelEntry.h".}
proc SetGlobalIndexStart*(this: var vtkHyperTreeGridLevelEntry; index: vtkIdType) {.
    importcpp: "SetGlobalIndexStart", header: "vtkHyperTreeGridLevelEntry.h".}
proc SetGlobalIndexFromLocal*(this: var vtkHyperTreeGridLevelEntry; index: vtkIdType) {.
    importcpp: "SetGlobalIndexFromLocal", header: "vtkHyperTreeGridLevelEntry.h".}
proc SetMask*(this: var vtkHyperTreeGridLevelEntry; grid: ptr vtkHyperTreeGrid;
             state: bool) {.importcpp: "SetMask",
                          header: "vtkHyperTreeGridLevelEntry.h".}
proc IsMasked*(this: vtkHyperTreeGridLevelEntry; grid: ptr vtkHyperTreeGrid): bool {.
    noSideEffect, importcpp: "IsMasked", header: "vtkHyperTreeGridLevelEntry.h".}
proc IsLeaf*(this: vtkHyperTreeGridLevelEntry; grid: ptr vtkHyperTreeGrid): bool {.
    noSideEffect, importcpp: "IsLeaf", header: "vtkHyperTreeGridLevelEntry.h".}
proc SubdivideLeaf*(this: var vtkHyperTreeGridLevelEntry; grid: ptr vtkHyperTreeGrid) {.
    importcpp: "SubdivideLeaf", header: "vtkHyperTreeGridLevelEntry.h".}
proc IsTerminalNode*(this: vtkHyperTreeGridLevelEntry; grid: ptr vtkHyperTreeGrid): bool {.
    noSideEffect, importcpp: "IsTerminalNode",
    header: "vtkHyperTreeGridLevelEntry.h".}
proc IsRoot*(this: vtkHyperTreeGridLevelEntry): bool {.noSideEffect,
    importcpp: "IsRoot", header: "vtkHyperTreeGridLevelEntry.h".}
proc ToChild*(this: var vtkHyperTreeGridLevelEntry; grid: ptr vtkHyperTreeGrid;
             ichild: cuchar) {.importcpp: "ToChild",
                             header: "vtkHyperTreeGridLevelEntry.h".}
proc GetTree*(this: vtkHyperTreeGridLevelEntry): ptr vtkHyperTree {.noSideEffect,
    importcpp: "GetTree", header: "vtkHyperTreeGridLevelEntry.h".}
proc GetLevel*(this: vtkHyperTreeGridLevelEntry): cuint {.noSideEffect,
    importcpp: "GetLevel", header: "vtkHyperTreeGridLevelEntry.h".}