## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExtractCells.h
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
## ----------------------------------------------------------------------------
##  Copyright (c) Sandia Corporation
##  See Copyright.txt or http://www.paraview.org/HTML/Copyright.html for details.
## ----------------------------------------------------------------------------
## *
##  @class   vtkExtractCells
##  @brief   subset a vtkDataSet to create a vtkUnstructuredGrid
##
##
##     Given a vtkDataSet and a list of cell ids, create a vtkUnstructuredGrid
##     composed of these cells.  If the cell list is empty when vtkExtractCells
##     executes, it will set up the ugrid, point and cell arrays, with no points,
##     cells or data.
##

import
  vtkFiltersExtractionModule, vtkUnstructuredGridAlgorithm

discard "forward decl of vtkIdList"
discard "forward decl of vtkExtractCellsSTLCloak"
type
  vtkExtractCells* {.importcpp: "vtkExtractCells", header: "vtkExtractCells.h",
                    bycopy.} = object of vtkUnstructuredGridAlgorithm ## /@{
                                                                 ## *
                                                                 ##  Standard methods for construction, type info, and printing.
                                                                 ##
    vtkExtractCells* {.importc: "vtkExtractCells".}: VTK_NEWINSTANCE

  vtkExtractCellsSuperclass* = vtkUnstructuredGridAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkExtractCells::IsTypeOf(@)", header: "vtkExtractCells.h".}
proc IsA*(this: var vtkExtractCells; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkExtractCells.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkExtractCells {.
    importcpp: "vtkExtractCells::SafeDownCast(@)", header: "vtkExtractCells.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkExtractCells :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExtractCells :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExtractCells :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkExtractCells; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkExtractCells.h".}
proc New*(): ptr vtkExtractCells {.importcpp: "vtkExtractCells::New(@)",
                               header: "vtkExtractCells.h".}
proc SetCellList*(this: var vtkExtractCells; l: ptr vtkIdList) {.
    importcpp: "SetCellList", header: "vtkExtractCells.h".}
proc AddCellList*(this: var vtkExtractCells; l: ptr vtkIdList) {.
    importcpp: "AddCellList", header: "vtkExtractCells.h".}
proc AddCellRange*(this: var vtkExtractCells; `from`: vtkIdType; to: vtkIdType) {.
    importcpp: "AddCellRange", header: "vtkExtractCells.h".}
proc SetCellIds*(this: var vtkExtractCells; `ptr`: ptr vtkIdType; numValues: vtkIdType) {.
    importcpp: "SetCellIds", header: "vtkExtractCells.h".}
proc AddCellIds*(this: var vtkExtractCells; `ptr`: ptr vtkIdType; numValues: vtkIdType) {.
    importcpp: "AddCellIds", header: "vtkExtractCells.h".}
proc SetExtractAllCells*(this: var vtkExtractCells; _arg: bool) {.
    importcpp: "SetExtractAllCells", header: "vtkExtractCells.h".}
## !!!Ignored construct:  virtual bool GetExtractAllCells ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ExtractAllCells  of  << this -> ExtractAllCells ) ; return this -> ExtractAllCells ; } ;
## Error: expected ';'!!!

proc ExtractAllCellsOn*(this: var vtkExtractCells) {.importcpp: "ExtractAllCellsOn",
    header: "vtkExtractCells.h".}
proc ExtractAllCellsOff*(this: var vtkExtractCells) {.
    importcpp: "ExtractAllCellsOff", header: "vtkExtractCells.h".}
  ## /@}
  ## /@{
  ## *
  ##  If the cell ids specified are already sorted and unique, then set this to
  ##  true to avoid the filter from doing time-consuming sorts and uniquification
  ##  operations. Defaults to false.
  ##
proc SetExtractAllCellsAssumeSortedAndUniqueIds*(this: var vtkExtractCells;
    _arg: bool) {.importcpp: "SetExtractAllCellsAssumeSortedAndUniqueIds",
                header: "vtkExtractCells.h".}
## !!!Ignored construct:  virtual bool GetExtractAllCellsAssumeSortedAndUniqueIds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AssumeSortedAndUniqueIds  of  << this -> AssumeSortedAndUniqueIds ) ; return this -> AssumeSortedAndUniqueIds ; } ;
## Error: expected ';'!!!

proc AssumeSortedAndUniqueIdsOn*(this: var vtkExtractCells) {.
    importcpp: "AssumeSortedAndUniqueIdsOn", header: "vtkExtractCells.h".}
proc AssumeSortedAndUniqueIdsOff*(this: var vtkExtractCells) {.
    importcpp: "AssumeSortedAndUniqueIdsOff", header: "vtkExtractCells.h".}
  ## /@}