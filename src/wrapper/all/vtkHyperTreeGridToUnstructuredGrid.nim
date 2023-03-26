## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHyperTreeGridToUnstructuredGrid.h
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
##  @class   vtkHyperTreeGridToUnstructuredGrid
##  @brief   Convert hyper tree grid to
##  unstructured grid.
##
##  JB Primal mesh
##  Make explicit all leaves of a hyper tree grid by converting them to cells
##  of an unstructured grid.
##  Produces segments in 1D, rectangles in 2D, right hexahedra in 3D.
##  NB: The output will contain superimposed inter-element boundaries and pending
##  nodes as a result of T-junctions.
##
##  @sa
##  vtkHyperTreeGrid vtkHyperTreeGridAlgorithm
##
##  @par Thanks:
##  This class was written by Philippe Pebay, Joachim Pouderoux, and Charles Law, Kitware 2012
##  This class was modified by Guenole Harel and Jacques-Bernard Lekien, 2014
##  This class was rewritten by Philippe Pebay, 2016
##  This class was modified by Jacques-Bernard Lekien, 2018
##  This class was corriged (used orientation) by Jacques-Bernard Lekien, 2018
##  This work was supported by Commissariat a l'Energie Atomique
##  CEA, DAM, DIF, F-91297 Arpajon, France.
##

import
  vtkFiltersHyperTreeModule, vtkHyperTreeGridAlgorithm

discard "forward decl of vtkBitArray"
discard "forward decl of vtkCellArray"
discard "forward decl of vtkHyperTreeGrid"
discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkPoints"
discard "forward decl of vtkUnstructuredGrid"
discard "forward decl of vtkHyperTreeGridNonOrientedGeometryCursor"
type
  vtkHyperTreeGridToUnstructuredGrid* {.importcpp: "vtkHyperTreeGridToUnstructuredGrid", header: "vtkHyperTreeGridToUnstructuredGrid.h",
                                       bycopy.} = object of vtkHyperTreeGridAlgorithm
    vtkHyperTreeGridToUnstructuredGrid* {.
        importc: "vtkHyperTreeGridToUnstructuredGrid".}: VTK_NEWINSTANCE
    ## *
    ##  Storage for cells of output unstructured mesh
    ##
    ## *
    ##  Storage of underlying tree
    ##


proc New*(): ptr vtkHyperTreeGridToUnstructuredGrid {.
    importcpp: "vtkHyperTreeGridToUnstructuredGrid::New(@)",
    header: "vtkHyperTreeGridToUnstructuredGrid.h".}
type
  vtkHyperTreeGridToUnstructuredGridSuperclass* = vtkHyperTreeGridAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkHyperTreeGridToUnstructuredGrid::IsTypeOf(@)",
    header: "vtkHyperTreeGridToUnstructuredGrid.h".}
proc IsA*(this: var vtkHyperTreeGridToUnstructuredGrid; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkHyperTreeGridToUnstructuredGrid.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkHyperTreeGridToUnstructuredGrid {.
    importcpp: "vtkHyperTreeGridToUnstructuredGrid::SafeDownCast(@)",
    header: "vtkHyperTreeGridToUnstructuredGrid.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkHyperTreeGridToUnstructuredGrid :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHyperTreeGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHyperTreeGridToUnstructuredGrid :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHyperTreeGridToUnstructuredGrid :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkHyperTreeGridToUnstructuredGrid; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf", header: "vtkHyperTreeGridToUnstructuredGrid.h".}
## !!!Ignored construct:  /@{ *
##  Add a cell array with original HTG ids
##  virtual bool GetAddOriginalIdsAddOriginalIds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AddOriginalIds  of  << this -> AddOriginalIds ) ; return this -> AddOriginalIds ; } ;
## Error: expected ';'!!!

proc SetAddOriginalIds*(this: var vtkHyperTreeGridToUnstructuredGrid; _arg: bool) {.
    importcpp: "SetAddOriginalIds", header: "vtkHyperTreeGridToUnstructuredGrid.h".}
proc AddOriginalIdsOn*(this: var vtkHyperTreeGridToUnstructuredGrid) {.
    importcpp: "AddOriginalIdsOn", header: "vtkHyperTreeGridToUnstructuredGrid.h".}
proc AddOriginalIdsOff*(this: var vtkHyperTreeGridToUnstructuredGrid) {.
    importcpp: "AddOriginalIdsOff", header: "vtkHyperTreeGridToUnstructuredGrid.h".}
  ## /@}