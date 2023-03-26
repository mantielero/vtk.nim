## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHyperTreeGridGeometryEntry.h
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
##  @class   vtkHyperTreeGridGeometryEntry
## JB
##  @brief   GeometryEntry is a cache data for cursors requiring coordinates
##
##  cf. vtkHyperTreeGridEntry
##
##  @sa
##  vtkHyperTreeGridEntry
##  vtkHyperTreeGridLevelEntry
##  vtkHyperTreeGridGeometryEntry
##  vtkHyperTreeGridGeometryLevelEntry
##  vtkHyperTreeGridNonOrientedGeometryCursor
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
  vtkObject

discard "forward decl of vtkHyperTree"
discard "forward decl of vtkHyperTreeGrid"
type
  vtkHyperTreeGridGeometryEntry* {.importcpp: "vtkHyperTreeGridGeometryEntry",
                                  header: "vtkHyperTreeGridGeometryEntry.h",
                                  bycopy.} = object ## *
                                                 ##  Display info about the entry
                                                 ##
                                                 ## *
                                                 ##  index of the current cell in the HyperTree.
                                                 ##
    ## *
    ##  origin coiordinates of the current cell
    ##


proc PrintSelf*(this: var vtkHyperTreeGridGeometryEntry; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkHyperTreeGridGeometryEntry.h".}
proc constructvtkHyperTreeGridGeometryEntry*(): vtkHyperTreeGridGeometryEntry {.
    constructor, importcpp: "vtkHyperTreeGridGeometryEntry(@)",
    header: "vtkHyperTreeGridGeometryEntry.h".}
proc constructvtkHyperTreeGridGeometryEntry*(index: vtkIdType; origin: ptr cdouble): vtkHyperTreeGridGeometryEntry {.
    constructor, importcpp: "vtkHyperTreeGridGeometryEntry(@)",
    header: "vtkHyperTreeGridGeometryEntry.h".}
proc destroyvtkHyperTreeGridGeometryEntry*(
    this: var vtkHyperTreeGridGeometryEntry) {.
    importcpp: "#.~vtkHyperTreeGridGeometryEntry()",
    header: "vtkHyperTreeGridGeometryEntry.h".}
proc Dump*(this: var vtkHyperTreeGridGeometryEntry; os: var ostream) {.
    importcpp: "Dump", header: "vtkHyperTreeGridGeometryEntry.h".}
proc Initialize*(this: var vtkHyperTreeGridGeometryEntry;
                grid: ptr vtkHyperTreeGrid; treeIndex: vtkIdType;
                create: bool = false): ptr vtkHyperTree {.importcpp: "Initialize",
    header: "vtkHyperTreeGridGeometryEntry.h".}
proc Initialize*(this: var vtkHyperTreeGridGeometryEntry; index: vtkIdType;
                origin: ptr cdouble) {.importcpp: "Initialize",
                                    header: "vtkHyperTreeGridGeometryEntry.h".}
proc Copy*(this: var vtkHyperTreeGridGeometryEntry;
          entry: ptr vtkHyperTreeGridGeometryEntry) {.importcpp: "Copy",
    header: "vtkHyperTreeGridGeometryEntry.h".}
proc GetVertexId*(this: vtkHyperTreeGridGeometryEntry): vtkIdType {.noSideEffect,
    importcpp: "GetVertexId", header: "vtkHyperTreeGridGeometryEntry.h".}
proc GetGlobalNodeIndex*(this: vtkHyperTreeGridGeometryEntry;
                        tree: ptr vtkHyperTree): vtkIdType {.noSideEffect,
    importcpp: "GetGlobalNodeIndex", header: "vtkHyperTreeGridGeometryEntry.h".}
proc SetGlobalIndexStart*(this: var vtkHyperTreeGridGeometryEntry;
                         tree: ptr vtkHyperTree; index: vtkIdType) {.
    importcpp: "SetGlobalIndexStart", header: "vtkHyperTreeGridGeometryEntry.h".}
proc SetGlobalIndexFromLocal*(this: var vtkHyperTreeGridGeometryEntry;
                             tree: ptr vtkHyperTree; index: vtkIdType) {.
    importcpp: "SetGlobalIndexFromLocal",
    header: "vtkHyperTreeGridGeometryEntry.h".}
proc SetMask*(this: var vtkHyperTreeGridGeometryEntry; grid: ptr vtkHyperTreeGrid;
             tree: ptr vtkHyperTree; state: bool) {.importcpp: "SetMask",
    header: "vtkHyperTreeGridGeometryEntry.h".}
proc IsMasked*(this: vtkHyperTreeGridGeometryEntry; grid: ptr vtkHyperTreeGrid;
              tree: ptr vtkHyperTree): bool {.noSideEffect, importcpp: "IsMasked",
    header: "vtkHyperTreeGridGeometryEntry.h".}
proc IsLeaf*(this: vtkHyperTreeGridGeometryEntry; grid: ptr vtkHyperTreeGrid;
            tree: ptr vtkHyperTree; level: cuint): bool {.noSideEffect,
    importcpp: "IsLeaf", header: "vtkHyperTreeGridGeometryEntry.h".}
proc SubdivideLeaf*(this: var vtkHyperTreeGridGeometryEntry;
                   grid: ptr vtkHyperTreeGrid; tree: ptr vtkHyperTree; level: cuint) {.
    importcpp: "SubdivideLeaf", header: "vtkHyperTreeGridGeometryEntry.h".}
proc IsTerminalNode*(this: vtkHyperTreeGridGeometryEntry;
                    grid: ptr vtkHyperTreeGrid; tree: ptr vtkHyperTree; level: cuint): bool {.
    noSideEffect, importcpp: "IsTerminalNode",
    header: "vtkHyperTreeGridGeometryEntry.h".}
proc IsRoot*(this: vtkHyperTreeGridGeometryEntry): bool {.noSideEffect,
    importcpp: "IsRoot", header: "vtkHyperTreeGridGeometryEntry.h".}
proc ToChild*(this: var vtkHyperTreeGridGeometryEntry; grid: ptr vtkHyperTreeGrid;
             tree: ptr vtkHyperTree; level: cuint; sizeChild: ptr cdouble;
             ichild: cuchar) {.importcpp: "ToChild",
                             header: "vtkHyperTreeGridGeometryEntry.h".}
proc GetOrigin*(this: var vtkHyperTreeGridGeometryEntry): ptr cdouble {.
    importcpp: "GetOrigin", header: "vtkHyperTreeGridGeometryEntry.h".}
proc GetOrigin*(this: vtkHyperTreeGridGeometryEntry): ptr cdouble {.noSideEffect,
    importcpp: "GetOrigin", header: "vtkHyperTreeGridGeometryEntry.h".}
proc GetBounds*(this: vtkHyperTreeGridGeometryEntry; sizeChild: ptr cdouble;
               bounds: array[6, cdouble]) {.noSideEffect, importcpp: "GetBounds",
    header: "vtkHyperTreeGridGeometryEntry.h".}
proc GetPoint*(this: vtkHyperTreeGridGeometryEntry; sizeChild: ptr cdouble;
              point: array[3, cdouble]) {.noSideEffect, importcpp: "GetPoint", header: "vtkHyperTreeGridGeometryEntry.h".}