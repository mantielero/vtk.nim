## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMergeCells.h
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
##  @class   vtkMergeCells
##  @brief   merges any number of vtkDataSets back into a single
##    vtkUnstructuredGrid
##
##
##     Designed to work with distributed vtkDataSets, this class will take
##     vtkDataSets and merge them back into a single vtkUnstructuredGrid.
##
##     The vtkPoints object of the unstructured grid will have data type
##     VTK_FLOAT if input is not of type vtkPointSet, otherwise it will have same
##     data type than the input point set.
##
##     It is assumed the different DataSets have the same field arrays.  If
##     the name of a global point ID array is provided, this class will
##     refrain from including duplicate points in the merged Ugrid.  This
##     class differs from vtkAppendFilter in these ways: (1) it uses less
##     memory than that class (which uses memory equal to twice the size
##     of the final Ugrid) but requires that you know the size of the
##     final Ugrid in advance (2) this class assumes the individual DataSets have
##     the same field arrays, while vtkAppendFilter intersects the field
##     arrays (3) this class knows duplicate points may be appearing in
##     the DataSets and can filter those out, (4) this class is not a filter.
##

import
  vtkAlgorithm, vtkDataSetAttributes, vtkFiltersGeneralModule, vtkObject,
  vtkSmartPointer

discard "forward decl of vtkCellData"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkMergeCellsSTLCloak"
discard "forward decl of vtkMergePoints"
discard "forward decl of vtkIncrementalPointLocator"
discard "forward decl of vtkPointData"
discard "forward decl of vtkUnstructuredGrid"
type
  vtkMergeCells* {.importcpp: "vtkMergeCells", header: "vtkMergeCells.h", bycopy.} = object of vtkObject
    vtkMergeCells* {.importc: "vtkMergeCells".}: VTK_NEWINSTANCE
    ##  so far
    ##  point, or node, IDs
    ##  cell IDs

  vtkMergeCellsSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkMergeCells::IsTypeOf(@)", header: "vtkMergeCells.h".}
proc IsA*(this: var vtkMergeCells; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkMergeCells.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkMergeCells {.
    importcpp: "vtkMergeCells::SafeDownCast(@)", header: "vtkMergeCells.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkMergeCells :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMergeCells :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMergeCells :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkMergeCells; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkMergeCells.h".}
proc New*(): ptr vtkMergeCells {.importcpp: "vtkMergeCells::New(@)",
                             header: "vtkMergeCells.h".}
proc SetUnstructuredGrid*(this: var vtkMergeCells; a2: ptr vtkUnstructuredGrid) {.
    importcpp: "SetUnstructuredGrid", header: "vtkMergeCells.h".}
proc GetnameUnstructuredGrid*(this: var vtkMergeCells): ptr vtkUnstructuredGrid {.
    importcpp: "GetnameUnstructuredGrid", header: "vtkMergeCells.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify the total number of cells in the final vtkUnstructuredGrid.
  ##  Make this call before any call to MergeDataSet().
  ##
proc SetTotalNumberOfCells*(this: var vtkMergeCells; _arg: vtkIdType) {.
    importcpp: "SetTotalNumberOfCells", header: "vtkMergeCells.h".}
## !!!Ignored construct:  virtual vtkIdType GetTotalNumberOfCells ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TotalNumberOfCells  of  << this -> TotalNumberOfCells ) ; return this -> TotalNumberOfCells ; } ;
## Error: expected ';'!!!

proc SetTotalNumberOfCellsTotalNumberOfPoints*(this: var vtkMergeCells;
    _arg: vtkIdType) {.importcpp: "SetTotalNumberOfCellsTotalNumberOfPoints",
                     header: "vtkMergeCells.h".}
## !!!Ignored construct:  virtual vtkIdType GetTotalNumberOfCellsTotalNumberOfPoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TotalNumberOfPoints  of  << this -> TotalNumberOfPoints ) ; return this -> TotalNumberOfPoints ; } ;
## Error: expected ';'!!!

proc SetTotalNumberOfCellsTotalNumberOfPointsUseGlobalIds*(
    this: var vtkMergeCells; _arg: cint) {.importcpp: "SetTotalNumberOfCellsTotalNumberOfPointsUseGlobalIds",
                                      header: "vtkMergeCells.h".}
## !!!Ignored construct:  virtual int GetTotalNumberOfCellsTotalNumberOfPointsUseGlobalIds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseGlobalIds  of  << this -> UseGlobalIds ) ; return this -> UseGlobalIds ; } ;
## Error: expected ';'!!!

proc UseGlobalIdsOn*(this: var vtkMergeCells) {.importcpp: "UseGlobalIdsOn",
    header: "vtkMergeCells.h".}
proc UseGlobalIdsOff*(this: var vtkMergeCells) {.importcpp: "UseGlobalIdsOff",
    header: "vtkMergeCells.h".}
  ## /@}
  ## /@{
  ## *
  ##  vtkMergeCells attempts eliminate duplicate points when merging
  ##  data sets.  If no global point ID field array name is provided,
  ##  it will use a point locator to find duplicate points.  You can
  ##  set a tolerance for that locator here.  The default tolerance
  ##  is 10e-4.
  ##
proc SetPointMergeTolerance*(this: var vtkMergeCells; _arg: cdouble) {.
    importcpp: "SetPointMergeTolerance", header: "vtkMergeCells.h".}
proc GetPointMergeToleranceMinValue*(this: var vtkMergeCells): cdouble {.
    importcpp: "GetPointMergeToleranceMinValue", header: "vtkMergeCells.h".}
proc GetPointMergeToleranceMaxValue*(this: var vtkMergeCells): cdouble {.
    importcpp: "GetPointMergeToleranceMaxValue", header: "vtkMergeCells.h".}
## !!!Ignored construct:  virtual double GetTotalNumberOfCellsTotalNumberOfPointsUseGlobalIdsPointMergeTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PointMergeTolerance  of  << this -> PointMergeTolerance ) ; return this -> PointMergeTolerance ; } ;
## Error: expected ';'!!!

proc SetTotalNumberOfCellsTotalNumberOfPointsUseGlobalIdsUseGlobalCellIds*(
    this: var vtkMergeCells; _arg: cint) {.importcpp: "SetTotalNumberOfCellsTotalNumberOfPointsUseGlobalIdsUseGlobalCellIds",
                                      header: "vtkMergeCells.h".}
## !!!Ignored construct:  virtual int GetTotalNumberOfCellsTotalNumberOfPointsUseGlobalIdsPointMergeToleranceUseGlobalCellIds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseGlobalCellIds  of  << this -> UseGlobalCellIds ) ; return this -> UseGlobalCellIds ; } ;
## Error: expected ';'!!!

proc UseGlobalCellIdsOn*(this: var vtkMergeCells) {.importcpp: "UseGlobalCellIdsOn",
    header: "vtkMergeCells.h".}
proc UseGlobalCellIdsOff*(this: var vtkMergeCells) {.
    importcpp: "UseGlobalCellIdsOff", header: "vtkMergeCells.h".}
  ## /@}
  ## /@{
  ## *
  ##  vtkMergeCells attempts eliminate duplicate points when merging
  ##  data sets.  If for some reason you don't want it to do this,
  ##  than MergeDuplicatePointsOff().
  ##
proc SetTotalNumberOfCellsTotalNumberOfPointsUseGlobalIdsUseGlobalCellIdsMergeDuplicatePoints*(
    this: var vtkMergeCells; _arg: bool) {.importcpp: "SetTotalNumberOfCellsTotalNumberOfPointsUseGlobalIdsUseGlobalCellIdsMergeDuplicatePoints",
                                      header: "vtkMergeCells.h".}
## !!!Ignored construct:  virtual bool GetTotalNumberOfCellsTotalNumberOfPointsUseGlobalIdsPointMergeToleranceUseGlobalCellIdsMergeDuplicatePoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MergeDuplicatePoints  of  << this -> MergeDuplicatePoints ) ; return this -> MergeDuplicatePoints ; } ;
## Error: expected ';'!!!

proc MergeDuplicatePointsOn*(this: var vtkMergeCells) {.
    importcpp: "MergeDuplicatePointsOn", header: "vtkMergeCells.h".}
proc MergeDuplicatePointsOff*(this: var vtkMergeCells) {.
    importcpp: "MergeDuplicatePointsOff", header: "vtkMergeCells.h".}
  ## /@}
  ## *
  ##  Clear the Locator and set it to nullptr.
  ##
proc InvalidateCachedLocator*(this: var vtkMergeCells) {.
    importcpp: "InvalidateCachedLocator", header: "vtkMergeCells.h".}
proc SetTotalNumberOfCellsTotalNumberOfPointsUseGlobalIdsUseGlobalCellIdsMergeDuplicatePointsTotalNumberOfDataSets*(
    this: var vtkMergeCells; _arg: cint) {.importcpp: "SetTotalNumberOfCellsTotalNumberOfPointsUseGlobalIdsUseGlobalCellIdsMergeDuplicatePointsTotalNumberOfDataSets",
                                      header: "vtkMergeCells.h".}
## !!!Ignored construct:  virtual int GetTotalNumberOfCellsTotalNumberOfPointsUseGlobalIdsPointMergeToleranceUseGlobalCellIdsMergeDuplicatePointsTotalNumberOfDataSets ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TotalNumberOfDataSets  of  << this -> TotalNumberOfDataSets ) ; return this -> TotalNumberOfDataSets ; } ;
## Error: expected ';'!!!

proc MergeDataSet*(this: var vtkMergeCells; set: ptr vtkDataSet): cint {.
    importcpp: "MergeDataSet", header: "vtkMergeCells.h".}
proc SetTotalNumberOfCellsTotalNumberOfPointsUseGlobalIdsUseGlobalCellIdsMergeDuplicatePointsTotalNumberOfDataSetsOutputPointsPrecision*(
    this: var vtkMergeCells; _arg: cint) {.importcpp: "SetTotalNumberOfCellsTotalNumberOfPointsUseGlobalIdsUseGlobalCellIdsMergeDuplicatePointsTotalNumberOfDataSetsOutputPointsPrecision",
                                      header: "vtkMergeCells.h".}
## !!!Ignored construct:  virtual int GetTotalNumberOfCellsTotalNumberOfPointsUseGlobalIdsPointMergeToleranceUseGlobalCellIdsMergeDuplicatePointsTotalNumberOfDataSetsOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ;
## Error: expected ';'!!!

proc Finish*(this: var vtkMergeCells) {.importcpp: "Finish", header: "vtkMergeCells.h".}