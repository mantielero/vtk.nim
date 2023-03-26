## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHyperTreeGridEntry.h
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
##  @class   vtkHyperTreeGridEntry
##  @brief   Entries are cache data for cursors
##
##  Entries are relevant for cursor/supercursor developers. Filters
##  developers should have a look at cursors/supercursors documentation.
##  (cf. vtkHyperTreeGridNonOrientedCursor). When writing a new cursor or
##  supercursor the choice of the entry is very important: it will drive
##  the performance and memory cost. This is even more important for
##  supercursors which have several neighbors: 6x for VonNeuman and 26x for
##  Moore.
##
##  Several types of Entries exist:
##  1. vtkHyperTreeGridEntry
##  This cache only memorizes the current cell index in one HyperTree.
##  Using the index, this entry provides several services such as:
##  is the cell coarse or leaf, get or set global index (to access
##  field value, cf. vtkHyperTree), descend into selected child,
##  subdivise the cell. Equivalent services are available for all entries.
##
##  2. vtkHyperTreeGridGeometryEntry
##  This cache adds the origin coordinates of the cell atop
##  vtkHyperTreeGridEntry. Getter is provided, as well as services related
##  to the bounding box and cell center.
##
##  3. vtkHyperTreeGridLevelEntry
##  This cache adds the following information with their getters atop
##  vtkHyperTreeGridEntry: pointer to the HyperTree, level of the current
##  cell.
##
##  4. vtkHyperTreeGridGeometryLevelEntry
##  This cache is a combination of vtkHyperTreeGridLevelEntry and
##  vtkHyperTreeGridLevelEntry: it provides all combined services.
##
##  @sa
##  vtkHyperTreeGridEntry
##  vtkHyperTreeGridLevelEntry
##  vtkHyperTreeGridGeometryEntry
##  vtkHyperTreeGridGeometryLevelEntry
##  vtkHyperTreeGridOrientedCursor
##  vtkHyperTreeGridNonOrientedCursor
##
##  @par Thanks:
##  This class was written by Jacques-Bernard Lekien, Jerome Dubois and
##  Guenole Harel, CEA 2018.
##  This work was supported by Commissariat a l'Energie Atomique
##  CEA, DAM, DIF, F-91297 Arpajon, France.
##

import
  vtkObject

discard "forward decl of vtkHyperTree"
discard "forward decl of vtkHyperTreeGrid"
type
  vtkHyperTreeGridEntry* {.importcpp: "vtkHyperTreeGridEntry",
                          header: "vtkHyperTreeGridEntry.h", bycopy.} = object ## *
                                                                          ##  Display info about the entry
                                                                          ##
                                                                          ## *
                                                                          ##  index of the current cell in the HyperTree.
                                                                          ##


proc PrintSelf*(this: var vtkHyperTreeGridEntry; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkHyperTreeGridEntry.h".}
proc Dump*(this: var vtkHyperTreeGridEntry; os: var ostream) {.importcpp: "Dump",
    header: "vtkHyperTreeGridEntry.h".}
proc constructvtkHyperTreeGridEntry*(): vtkHyperTreeGridEntry {.constructor,
    importcpp: "vtkHyperTreeGridEntry(@)", header: "vtkHyperTreeGridEntry.h".}
proc constructvtkHyperTreeGridEntry*(index: vtkIdType): vtkHyperTreeGridEntry {.
    constructor, importcpp: "vtkHyperTreeGridEntry(@)",
    header: "vtkHyperTreeGridEntry.h".}
proc destroyvtkHyperTreeGridEntry*(this: var vtkHyperTreeGridEntry) {.
    importcpp: "#.~vtkHyperTreeGridEntry()", header: "vtkHyperTreeGridEntry.h".}
proc Initialize*(this: var vtkHyperTreeGridEntry; grid: ptr vtkHyperTreeGrid;
                treeIndex: vtkIdType; create: bool = false): ptr vtkHyperTree {.
    importcpp: "Initialize", header: "vtkHyperTreeGridEntry.h".}
proc Initialize*(this: var vtkHyperTreeGridEntry; index: vtkIdType) {.
    importcpp: "Initialize", header: "vtkHyperTreeGridEntry.h".}
proc Copy*(this: var vtkHyperTreeGridEntry; entry: ptr vtkHyperTreeGridEntry) {.
    importcpp: "Copy", header: "vtkHyperTreeGridEntry.h".}
proc GetVertexId*(this: vtkHyperTreeGridEntry): vtkIdType {.noSideEffect,
    importcpp: "GetVertexId", header: "vtkHyperTreeGridEntry.h".}
proc GetGlobalNodeIndex*(this: vtkHyperTreeGridEntry; tree: ptr vtkHyperTree): vtkIdType {.
    noSideEffect, importcpp: "GetGlobalNodeIndex",
    header: "vtkHyperTreeGridEntry.h".}
proc SetGlobalIndexStart*(this: var vtkHyperTreeGridEntry; tree: ptr vtkHyperTree;
                         index: vtkIdType) {.importcpp: "SetGlobalIndexStart",
    header: "vtkHyperTreeGridEntry.h".}
proc SetGlobalIndexFromLocal*(this: var vtkHyperTreeGridEntry;
                             tree: ptr vtkHyperTree; index: vtkIdType) {.
    importcpp: "SetGlobalIndexFromLocal", header: "vtkHyperTreeGridEntry.h".}
proc SetMask*(this: var vtkHyperTreeGridEntry; grid: ptr vtkHyperTreeGrid;
             tree: ptr vtkHyperTree; state: bool) {.importcpp: "SetMask",
    header: "vtkHyperTreeGridEntry.h".}
proc IsMasked*(this: vtkHyperTreeGridEntry; grid: ptr vtkHyperTreeGrid;
              tree: ptr vtkHyperTree): bool {.noSideEffect, importcpp: "IsMasked",
    header: "vtkHyperTreeGridEntry.h".}
proc IsLeaf*(this: vtkHyperTreeGridEntry; grid: ptr vtkHyperTreeGrid;
            tree: ptr vtkHyperTree; level: cuint): bool {.noSideEffect,
    importcpp: "IsLeaf", header: "vtkHyperTreeGridEntry.h".}
proc SubdivideLeaf*(this: var vtkHyperTreeGridEntry; grid: ptr vtkHyperTreeGrid;
                   tree: ptr vtkHyperTree; level: cuint) {.
    importcpp: "SubdivideLeaf", header: "vtkHyperTreeGridEntry.h".}
proc IsTerminalNode*(this: vtkHyperTreeGridEntry; grid: ptr vtkHyperTreeGrid;
                    tree: ptr vtkHyperTree; level: cuint): bool {.noSideEffect,
    importcpp: "IsTerminalNode", header: "vtkHyperTreeGridEntry.h".}
proc IsRoot*(this: vtkHyperTreeGridEntry): bool {.noSideEffect, importcpp: "IsRoot",
    header: "vtkHyperTreeGridEntry.h".}
proc ToChild*(this: var vtkHyperTreeGridEntry; grid: ptr vtkHyperTreeGrid;
             tree: ptr vtkHyperTree; level: cuint; ichild: cuchar) {.
    importcpp: "ToChild", header: "vtkHyperTreeGridEntry.h".}