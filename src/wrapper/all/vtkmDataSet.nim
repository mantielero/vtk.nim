## ============================================================================
##   Copyright (c) Kitware, Inc.
##   All rights reserved.
##   See LICENSE.txt for details.
##   This software is distributed WITHOUT ANY WARRANTY; without even
##   the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##   PURPOSE.  See the above copyright notice for more information.
##
##   Copyright 2015 Sandia Corporation.
##   Copyright 2015 UT-Battelle, LLC.
##   Copyright 2015 Los Alamos National Security.
##
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
##
##   Under the terms of Contract DE-AC52-06NA25396 with Los Alamos National
##   Laboratory (LANL), the U.S. Government retains certain rights in
##   this software.
## ============================================================================

import
  vtkAcceleratorsVTKmDataModelModule, vtkDataSet

discard "forward decl of DataSet"
##  vtkm::cont

discard "forward decl of vtkPoints"
discard "forward decl of vtkCell"
discard "forward decl of vtkGenericCell"
type
  vtkmDataSet* {.importcpp: "vtkmDataSet", header: "vtkmDataSet.h", bycopy.} = object of vtkDataSet
    vtkmDataSet* {.importc: "vtkmDataSet".}: VTK_NEWINSTANCE

  vtkmDataSetSuperclass* = vtkDataSet

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkmDataSet::IsTypeOf(@)", header: "vtkmDataSet.h".}
proc IsA*(this: var vtkmDataSet; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkmDataSet.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkmDataSet {.
    importcpp: "vtkmDataSet::SafeDownCast(@)", header: "vtkmDataSet.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkmDataSet :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSet :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkmDataSet :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkmDataSet :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkmDataSet; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkmDataSet.h".}
proc New*(): ptr vtkmDataSet {.importcpp: "vtkmDataSet::New(@)",
                           header: "vtkmDataSet.h".}
proc SetVtkmDataSet*(this: var vtkmDataSet; ds: DataSet) {.
    importcpp: "SetVtkmDataSet", header: "vtkmDataSet.h".}
proc GetVtkmDataSet*(this: vtkmDataSet): DataSet {.noSideEffect,
    importcpp: "GetVtkmDataSet", header: "vtkmDataSet.h".}
proc CopyStructure*(this: var vtkmDataSet; ds: ptr vtkDataSet) {.
    importcpp: "CopyStructure", header: "vtkmDataSet.h".}
proc GetNumberOfPoints*(this: var vtkmDataSet): vtkIdType {.
    importcpp: "GetNumberOfPoints", header: "vtkmDataSet.h".}
proc GetNumberOfCells*(this: var vtkmDataSet): vtkIdType {.
    importcpp: "GetNumberOfCells", header: "vtkmDataSet.h".}
## !!!Ignored construct:  *
##  Get point coordinates with ptId such that: 0 <= ptId < NumberOfPoints.
##  double * GetPoint ( vtkIdType ptId ) VTK_SIZEHINT ( 3 ) override ;
## Error: expected ';'!!!

proc GetPoint*(this: var vtkmDataSet; id: vtkIdType; x: array[3, cdouble]) {.
    importcpp: "GetPoint", header: "vtkmDataSet.h".}
## using statement

proc GetCell*(this: var vtkmDataSet; cellId: vtkIdType): ptr vtkCell {.
    importcpp: "GetCell", header: "vtkmDataSet.h".}
proc GetCell*(this: var vtkmDataSet; cellId: vtkIdType; cell: ptr vtkGenericCell) {.
    importcpp: "GetCell", header: "vtkmDataSet.h".}
proc GetCellBounds*(this: var vtkmDataSet; cellId: vtkIdType;
                   bounds: array[6, cdouble]) {.importcpp: "GetCellBounds",
    header: "vtkmDataSet.h".}
proc GetCellType*(this: var vtkmDataSet; cellId: vtkIdType): cint {.
    importcpp: "GetCellType", header: "vtkmDataSet.h".}
## using statement

proc GetCellPoints*(this: var vtkmDataSet; cellId: vtkIdType; ptIds: ptr vtkIdList) {.
    importcpp: "GetCellPoints", header: "vtkmDataSet.h".}
proc GetPointCells*(this: var vtkmDataSet; ptId: vtkIdType; cellIds: ptr vtkIdList) {.
    importcpp: "GetPointCells", header: "vtkmDataSet.h".}
proc FindPoint*(this: var vtkmDataSet; x: array[3, cdouble]): vtkIdType {.
    importcpp: "FindPoint", header: "vtkmDataSet.h".}
proc FindCell*(this: var vtkmDataSet; x: array[3, cdouble]; cell: ptr vtkCell;
              cellId: vtkIdType; tol2: cdouble; subId: var cint;
              pcoords: array[3, cdouble]; weights: ptr cdouble): vtkIdType {.
    importcpp: "FindCell", header: "vtkmDataSet.h".}
proc FindCell*(this: var vtkmDataSet; x: array[3, cdouble]; cell: ptr vtkCell;
              gencell: ptr vtkGenericCell; cellId: vtkIdType; tol2: cdouble;
              subId: var cint; pcoords: array[3, cdouble]; weights: ptr cdouble): vtkIdType {.
    importcpp: "FindCell", header: "vtkmDataSet.h".}
proc Squeeze*(this: var vtkmDataSet) {.importcpp: "Squeeze", header: "vtkmDataSet.h".}
proc ComputeBounds*(this: var vtkmDataSet) {.importcpp: "ComputeBounds",
    header: "vtkmDataSet.h".}
proc Initialize*(this: var vtkmDataSet) {.importcpp: "Initialize",
                                      header: "vtkmDataSet.h".}
proc GetMaxCellSize*(this: var vtkmDataSet): cint {.importcpp: "GetMaxCellSize",
    header: "vtkmDataSet.h".}
proc GetActualMemorySize*(this: var vtkmDataSet): culong {.
    importcpp: "GetActualMemorySize", header: "vtkmDataSet.h".}
proc GetDataObjectType*(this: var vtkmDataSet): cint {.
    importcpp: "GetDataObjectType", header: "vtkmDataSet.h".}
proc ShallowCopy*(this: var vtkmDataSet; src: ptr vtkDataObject) {.
    importcpp: "ShallowCopy", header: "vtkmDataSet.h".}
proc DeepCopy*(this: var vtkmDataSet; src: ptr vtkDataObject) {.importcpp: "DeepCopy",
    header: "vtkmDataSet.h".}