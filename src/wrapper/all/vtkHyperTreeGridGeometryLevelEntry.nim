## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHyperTreeGridGeometryLevelEntry.h
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
##  @class   vtkHyperTreeGridGeometryLevelEntry
##  @brief   Cursor cache data with coordinates and level info
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
  assert, vtkObject, vtkSmartPointer, vtkHyperTreeGridNonOrientedGeometryCursor,
  vtkHyperTreeGridOrientedGeometryCursor

discard "forward decl of vtkHyperTree"
discard "forward decl of vtkHyperTreeGrid"
type
  vtkHyperTreeGridGeometryLevelEntry* {.importcpp: "vtkHyperTreeGridGeometryLevelEntry", header: "vtkHyperTreeGridGeometryLevelEntry.h",
                                       bycopy.} = object ## *
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
    ## *
    ##  origin coiordinates of the current cell
    ##


proc PrintSelf*(this: var vtkHyperTreeGridGeometryLevelEntry; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf", header: "vtkHyperTreeGridGeometryLevelEntry.h".}
proc constructvtkHyperTreeGridGeometryLevelEntry*(): vtkHyperTreeGridGeometryLevelEntry {.
    constructor, importcpp: "vtkHyperTreeGridGeometryLevelEntry(@)",
    header: "vtkHyperTreeGridGeometryLevelEntry.h".}
proc destroyvtkHyperTreeGridGeometryLevelEntry*(
    this: var vtkHyperTreeGridGeometryLevelEntry) {.
    importcpp: "#.~vtkHyperTreeGridGeometryLevelEntry()",
    header: "vtkHyperTreeGridGeometryLevelEntry.h".}
proc Dump*(this: var vtkHyperTreeGridGeometryLevelEntry; os: var ostream) {.
    importcpp: "Dump", header: "vtkHyperTreeGridGeometryLevelEntry.h".}
proc Initialize*(this: var vtkHyperTreeGridGeometryLevelEntry;
                tree: ptr vtkHyperTree; level: cuint; index: vtkIdType;
                origin: ptr cdouble) {.importcpp: "Initialize", header: "vtkHyperTreeGridGeometryLevelEntry.h".}
proc Initialize*(this: var vtkHyperTreeGridGeometryLevelEntry;
                grid: ptr vtkHyperTreeGrid; treeIndex: vtkIdType;
                create: bool = false): ptr vtkHyperTree {.importcpp: "Initialize",
    header: "vtkHyperTreeGridGeometryLevelEntry.h".}
proc Reset*(this: var vtkHyperTreeGridGeometryLevelEntry) {.importcpp: "Reset",
    header: "vtkHyperTreeGridGeometryLevelEntry.h".}
proc Copy*(this: var vtkHyperTreeGridGeometryLevelEntry;
          entry: ptr vtkHyperTreeGridGeometryLevelEntry) {.importcpp: "Copy",
    header: "vtkHyperTreeGridGeometryLevelEntry.h".}
proc GetHyperTreeGridOrientedGeometryCursor*(
    this: var vtkHyperTreeGridGeometryLevelEntry; grid: ptr vtkHyperTreeGrid): vtkSmartPointer[
    vtkHyperTreeGridOrientedGeometryCursor] {.
    importcpp: "GetHyperTreeGridOrientedGeometryCursor",
    header: "vtkHyperTreeGridGeometryLevelEntry.h".}
proc GetHyperTreeGridNonOrientedGeometryCursor*(
    this: var vtkHyperTreeGridGeometryLevelEntry; grid: ptr vtkHyperTreeGrid): vtkSmartPointer[
    vtkHyperTreeGridNonOrientedGeometryCursor] {.
    importcpp: "GetHyperTreeGridNonOrientedGeometryCursor",
    header: "vtkHyperTreeGridGeometryLevelEntry.h".}
proc GetVertexId*(this: vtkHyperTreeGridGeometryLevelEntry): vtkIdType {.
    noSideEffect, importcpp: "GetVertexId",
    header: "vtkHyperTreeGridGeometryLevelEntry.h".}
proc GetGlobalNodeIndex*(this: vtkHyperTreeGridGeometryLevelEntry): vtkIdType {.
    noSideEffect, importcpp: "GetGlobalNodeIndex",
    header: "vtkHyperTreeGridGeometryLevelEntry.h".}
proc SetGlobalIndexStart*(this: var vtkHyperTreeGridGeometryLevelEntry;
                         index: vtkIdType) {.importcpp: "SetGlobalIndexStart",
    header: "vtkHyperTreeGridGeometryLevelEntry.h".}
proc SetGlobalIndexFromLocal*(this: var vtkHyperTreeGridGeometryLevelEntry;
                             index: vtkIdType) {.
    importcpp: "SetGlobalIndexFromLocal",
    header: "vtkHyperTreeGridGeometryLevelEntry.h".}
proc SetMask*(this: var vtkHyperTreeGridGeometryLevelEntry;
             grid: ptr vtkHyperTreeGrid; state: bool) {.importcpp: "SetMask",
    header: "vtkHyperTreeGridGeometryLevelEntry.h".}
proc IsMasked*(this: vtkHyperTreeGridGeometryLevelEntry; grid: ptr vtkHyperTreeGrid): bool {.
    noSideEffect, importcpp: "IsMasked",
    header: "vtkHyperTreeGridGeometryLevelEntry.h".}
proc IsLeaf*(this: vtkHyperTreeGridGeometryLevelEntry; grid: ptr vtkHyperTreeGrid): bool {.
    noSideEffect, importcpp: "IsLeaf",
    header: "vtkHyperTreeGridGeometryLevelEntry.h".}
proc SubdivideLeaf*(this: var vtkHyperTreeGridGeometryLevelEntry;
                   grid: ptr vtkHyperTreeGrid) {.importcpp: "SubdivideLeaf",
    header: "vtkHyperTreeGridGeometryLevelEntry.h".}
proc IsTerminalNode*(this: vtkHyperTreeGridGeometryLevelEntry;
                    grid: ptr vtkHyperTreeGrid): bool {.noSideEffect,
    importcpp: "IsTerminalNode", header: "vtkHyperTreeGridGeometryLevelEntry.h".}
proc IsRoot*(this: var vtkHyperTreeGridGeometryLevelEntry): bool {.
    importcpp: "IsRoot", header: "vtkHyperTreeGridGeometryLevelEntry.h".}
proc ToChild*(this: var vtkHyperTreeGridGeometryLevelEntry;
             grid: ptr vtkHyperTreeGrid; ichild: cuchar) {.importcpp: "ToChild",
    header: "vtkHyperTreeGridGeometryLevelEntry.h".}
proc GetTree*(this: vtkHyperTreeGridGeometryLevelEntry): ptr vtkHyperTree {.
    noSideEffect, importcpp: "GetTree",
    header: "vtkHyperTreeGridGeometryLevelEntry.h".}
proc GetLevel*(this: vtkHyperTreeGridGeometryLevelEntry): cuint {.noSideEffect,
    importcpp: "GetLevel", header: "vtkHyperTreeGridGeometryLevelEntry.h".}
proc GetOrigin*(this: var vtkHyperTreeGridGeometryLevelEntry): ptr cdouble {.
    importcpp: "GetOrigin", header: "vtkHyperTreeGridGeometryLevelEntry.h".}
proc GetOrigin*(this: vtkHyperTreeGridGeometryLevelEntry): ptr cdouble {.
    noSideEffect, importcpp: "GetOrigin",
    header: "vtkHyperTreeGridGeometryLevelEntry.h".}
proc GetBounds*(this: vtkHyperTreeGridGeometryLevelEntry; bounds: array[6, cdouble]) {.
    noSideEffect, importcpp: "GetBounds",
    header: "vtkHyperTreeGridGeometryLevelEntry.h".}
proc GetPoint*(this: vtkHyperTreeGridGeometryLevelEntry; point: array[3, cdouble]) {.
    noSideEffect, importcpp: "GetPoint",
    header: "vtkHyperTreeGridGeometryLevelEntry.h".}