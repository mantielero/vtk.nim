## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHyperTreeGridNonOrientedGeometryCursor.h
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
##  @class   vtkHyperTreeGridNonOrientedGeometryCursor
##  @brief   Objects for traversal a HyperTreeGrid.
##
##  JB A REVOIR
##  NonOriented ne peut pas remonter plus haut qu'a sa creation.
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
  vtkCommonDataModelModule, vtkObject, vtkHyperTreeGridGeometryEntry,
  vtkHyperTreeGridTools, vtkSmartPointer

discard "forward decl of vtkHyperTree"
discard "forward decl of vtkHyperTreeGrid"
discard "forward decl of vtkHyperTreeGridScales"
discard "forward decl of vtkHyperTreeGridOrientedGeometryCursor"
type
  vtkHyperTreeGridNonOrientedGeometryCursor* {.
      importcpp: "vtkHyperTreeGridNonOrientedGeometryCursor",
      header: "vtkHyperTreeGridNonOrientedGeometryCursor.h", bycopy.} = object of vtkObject ## *
                                                                                     ##  Constructor
                                                                                     ##  JB Just pour vtkHyperTreeGridNonOrientedVonNeumannSuperCursor et Moore
                                                                                     ##
    vtkHyperTreeGridNonOrientedGeometryCursor*
        {.importc: "vtkHyperTreeGridNonOrientedGeometryCursor".}: VTK_NEWINSTANCE
    ## *
    ##  JB
    ##
    ## *
    ##  JB Storage of pre-computed per-level cell scales
    ##
    ## *
    ##  JB
    ##
    ## *
    ##  JB La derniere entree valide.
    ##
    ##  Hyper tree grid to which the cursor is attached

  vtkHyperTreeGridNonOrientedGeometryCursorSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkHyperTreeGridNonOrientedGeometryCursor::IsTypeOf(@)",
    header: "vtkHyperTreeGridNonOrientedGeometryCursor.h".}
proc IsA*(this: var vtkHyperTreeGridNonOrientedGeometryCursor; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkHyperTreeGridNonOrientedGeometryCursor.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkHyperTreeGridNonOrientedGeometryCursor {.
    importcpp: "vtkHyperTreeGridNonOrientedGeometryCursor::SafeDownCast(@)",
    header: "vtkHyperTreeGridNonOrientedGeometryCursor.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkHyperTreeGridNonOrientedGeometryCursor :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHyperTreeGridNonOrientedGeometryCursor :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHyperTreeGridNonOrientedGeometryCursor :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkHyperTreeGridNonOrientedGeometryCursor;
               os: var ostream; indent: vtkIndent) {.importcpp: "PrintSelf",
    header: "vtkHyperTreeGridNonOrientedGeometryCursor.h".}
proc New*(): ptr vtkHyperTreeGridNonOrientedGeometryCursor {.
    importcpp: "vtkHyperTreeGridNonOrientedGeometryCursor::New(@)",
    header: "vtkHyperTreeGridNonOrientedGeometryCursor.h".}
proc Dump*(this: var vtkHyperTreeGridNonOrientedGeometryCursor; os: var ostream) {.
    importcpp: "Dump", header: "vtkHyperTreeGridNonOrientedGeometryCursor.h".}
proc Clone*(this: var vtkHyperTreeGridNonOrientedGeometryCursor): ptr vtkHyperTreeGridNonOrientedGeometryCursor {.
    importcpp: "Clone", header: "vtkHyperTreeGridNonOrientedGeometryCursor.h".}
proc Initialize*(this: var vtkHyperTreeGridNonOrientedGeometryCursor;
                grid: ptr vtkHyperTreeGrid; treeIndex: vtkIdType;
                create: bool = false) {.importcpp: "Initialize", header: "vtkHyperTreeGridNonOrientedGeometryCursor.h".}
proc Initialize*(this: var vtkHyperTreeGridNonOrientedGeometryCursor;
                grid: ptr vtkHyperTreeGrid; tree: ptr vtkHyperTree; level: cuint;
                entry: var vtkHyperTreeGridGeometryEntry) {.
    importcpp: "Initialize", header: "vtkHyperTreeGridNonOrientedGeometryCursor.h".}
proc Initialize*(this: var vtkHyperTreeGridNonOrientedGeometryCursor;
                grid: ptr vtkHyperTreeGrid; tree: ptr vtkHyperTree; level: cuint;
                index: vtkIdType; origin: ptr cdouble) {.importcpp: "Initialize",
    header: "vtkHyperTreeGridNonOrientedGeometryCursor.h".}
proc Initialize*(this: var vtkHyperTreeGridNonOrientedGeometryCursor;
                cursor: ptr vtkHyperTreeGridNonOrientedGeometryCursor) {.
    importcpp: "Initialize", header: "vtkHyperTreeGridNonOrientedGeometryCursor.h".}
proc HasTree*(this: vtkHyperTreeGridNonOrientedGeometryCursor): bool {.noSideEffect,
    importcpp: "HasTree", header: "vtkHyperTreeGridNonOrientedGeometryCursor.h".}
proc GetTree*(this: vtkHyperTreeGridNonOrientedGeometryCursor): ptr vtkHyperTree {.
    noSideEffect, importcpp: "GetTree",
    header: "vtkHyperTreeGridNonOrientedGeometryCursor.h".}
proc GetVertexId*(this: var vtkHyperTreeGridNonOrientedGeometryCursor): vtkIdType {.
    importcpp: "GetVertexId",
    header: "vtkHyperTreeGridNonOrientedGeometryCursor.h".}
proc GetGlobalNodeIndex*(this: var vtkHyperTreeGridNonOrientedGeometryCursor): vtkIdType {.
    importcpp: "GetGlobalNodeIndex",
    header: "vtkHyperTreeGridNonOrientedGeometryCursor.h".}
proc GetDimension*(this: var vtkHyperTreeGridNonOrientedGeometryCursor): cuchar {.
    importcpp: "GetDimension",
    header: "vtkHyperTreeGridNonOrientedGeometryCursor.h".}
proc GetNumberOfChildren*(this: var vtkHyperTreeGridNonOrientedGeometryCursor): cuchar {.
    importcpp: "GetNumberOfChildren",
    header: "vtkHyperTreeGridNonOrientedGeometryCursor.h".}
proc SetGlobalIndexStart*(this: var vtkHyperTreeGridNonOrientedGeometryCursor;
                         index: vtkIdType) {.importcpp: "SetGlobalIndexStart",
    header: "vtkHyperTreeGridNonOrientedGeometryCursor.h".}
proc SetGlobalIndexFromLocal*(this: var vtkHyperTreeGridNonOrientedGeometryCursor;
                             index: vtkIdType) {.
    importcpp: "SetGlobalIndexFromLocal",
    header: "vtkHyperTreeGridNonOrientedGeometryCursor.h".}
proc GetOrigin*(this: var vtkHyperTreeGridNonOrientedGeometryCursor): ptr cdouble {.
    importcpp: "GetOrigin", header: "vtkHyperTreeGridNonOrientedGeometryCursor.h".}
proc GetSize*(this: var vtkHyperTreeGridNonOrientedGeometryCursor): ptr cdouble {.
    importcpp: "GetSize", header: "vtkHyperTreeGridNonOrientedGeometryCursor.h".}
proc GetBounds*(this: var vtkHyperTreeGridNonOrientedGeometryCursor;
               bounds: array[6, cdouble]) {.importcpp: "GetBounds",
    header: "vtkHyperTreeGridNonOrientedGeometryCursor.h".}
proc GetPoint*(this: var vtkHyperTreeGridNonOrientedGeometryCursor;
              point: array[3, cdouble]) {.importcpp: "GetPoint", header: "vtkHyperTreeGridNonOrientedGeometryCursor.h".}
proc SetMask*(this: var vtkHyperTreeGridNonOrientedGeometryCursor; state: bool) {.
    importcpp: "SetMask", header: "vtkHyperTreeGridNonOrientedGeometryCursor.h".}
proc IsMasked*(this: var vtkHyperTreeGridNonOrientedGeometryCursor): bool {.
    importcpp: "IsMasked", header: "vtkHyperTreeGridNonOrientedGeometryCursor.h".}
proc IsLeaf*(this: var vtkHyperTreeGridNonOrientedGeometryCursor): bool {.
    importcpp: "IsLeaf", header: "vtkHyperTreeGridNonOrientedGeometryCursor.h".}
proc SubdivideLeaf*(this: var vtkHyperTreeGridNonOrientedGeometryCursor) {.
    importcpp: "SubdivideLeaf",
    header: "vtkHyperTreeGridNonOrientedGeometryCursor.h".}
proc IsRoot*(this: var vtkHyperTreeGridNonOrientedGeometryCursor): bool {.
    importcpp: "IsRoot", header: "vtkHyperTreeGridNonOrientedGeometryCursor.h".}
proc GetLevel*(this: var vtkHyperTreeGridNonOrientedGeometryCursor): cuint {.
    importcpp: "GetLevel", header: "vtkHyperTreeGridNonOrientedGeometryCursor.h".}
proc ToChild*(this: var vtkHyperTreeGridNonOrientedGeometryCursor; ichild: cuchar) {.
    importcpp: "ToChild", header: "vtkHyperTreeGridNonOrientedGeometryCursor.h".}
proc ToRoot*(this: var vtkHyperTreeGridNonOrientedGeometryCursor) {.
    importcpp: "ToRoot", header: "vtkHyperTreeGridNonOrientedGeometryCursor.h".}
proc ToParent*(this: var vtkHyperTreeGridNonOrientedGeometryCursor) {.
    importcpp: "ToParent", header: "vtkHyperTreeGridNonOrientedGeometryCursor.h".}
proc GetHyperTreeGridOrientedGeometryCursor*(
    this: var vtkHyperTreeGridNonOrientedGeometryCursor; grid: ptr vtkHyperTreeGrid): vtkSmartPointer[
    vtkHyperTreeGridOrientedGeometryCursor] {.
    importcpp: "GetHyperTreeGridOrientedGeometryCursor",
    header: "vtkHyperTreeGridNonOrientedGeometryCursor.h".}