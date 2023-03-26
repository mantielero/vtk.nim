## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTable.h
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
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkTable
##  @brief   A table, which contains similar-typed columns of data
##
##
##  vtkTable is a basic data structure for storing columns of data.
##  Internally, columns are stored in a vtkDataSetAttributes structure called
##  RowData. However, using the vtkTable API additionally ensures that every column
##  has the same number of entries, and provides row access (using vtkVariantArray)
##  and single entry access (using vtkVariant).
##
##  Inserting or removing rows via the class API preserves existing table data where possible.
##
##  The "RemoveRow*" and SetNumberOfRows() operations will not release memory. Call on SqueezeRows()
##  to achieve this after performing the operations.
##
##  The field data inherited from vtkDataObject may be used to store metadata
##  related to the table.
##
##  @warning
##  You should use the vtkTable API to change the table data. Performing
##  operations on the object returned by GetRowData() may
##  yield unexpected results. vtkTable does allow the user to set the field
##  data using SetRowData(); the number of rows in the table is determined
##  by the number of tuples in the first array (it is assumed that all arrays
##  are the same length).
##
##  @warning
##  Each column added with AddColumn <b>must</b> have its name set to a unique,
##  non-empty string in order for GetValue() to function properly.
##
##  @par Thanks:
##  Thanks to Patricia Crossno, Ken Moreland, Andrew Wilson and Brian Wylie from
##  Sandia National Laboratories for their help in developing this class API.
##

import
  vtkCommonDataModelModule, vtkDataObject

discard "forward decl of vtkAbstractArray"
discard "forward decl of vtkDataSetAttributes"
discard "forward decl of vtkVariant"
discard "forward decl of vtkVariantArray"
type
  vtkTable* {.importcpp: "vtkTable", header: "vtkTable.h", bycopy.} = object of vtkDataObject
    vtkTable* {.importc: "vtkTable".}: VTK_NEWINSTANCE
    ## *
    ##  Holds row information returned by GetRow().
    ##
    ## *
    ##  Move the content of the rows, starting first row and including last row. The rows
    ##  will be moved by delta, which can be positive or negative. No checks will be performed that the
    ##  arrays are correctly sized.
    ##


proc New*(): ptr vtkTable {.importcpp: "vtkTable::New(@)", header: "vtkTable.h".}
proc ExtendedNew*(): ptr vtkTable {.importcpp: "vtkTable::ExtendedNew(@)",
                                header: "vtkTable.h".}
type
  vtkTableSuperclass* = vtkDataObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkTable::IsTypeOf(@)",
    header: "vtkTable.h".}
proc IsA*(this: var vtkTable; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkTable.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTable {.
    importcpp: "vtkTable::SafeDownCast(@)", header: "vtkTable.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTable :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTable :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTable :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTable; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTable.h".}
proc Dump*(this: var vtkTable; colWidth: cuint = 16; rowLimit: cint = -1) {.
    importcpp: "Dump", header: "vtkTable.h".}
proc GetDataObjectType*(this: var vtkTable): cint {.importcpp: "GetDataObjectType",
    header: "vtkTable.h".}
proc GetActualMemorySize*(this: var vtkTable): culong {.
    importcpp: "GetActualMemorySize", header: "vtkTable.h".}
proc GetnameRowData*(this: var vtkTable): ptr vtkDataSetAttributes {.
    importcpp: "GetnameRowData", header: "vtkTable.h".}
proc SetRowData*(this: var vtkTable; data: ptr vtkDataSetAttributes) {.
    importcpp: "SetRowData", header: "vtkTable.h".}
proc GetNumberOfRows*(this: var vtkTable): vtkIdType {.importcpp: "GetNumberOfRows",
    header: "vtkTable.h".}
proc SetNumberOfRows*(this: var vtkTable; a2: vtkIdType) {.
    importcpp: "SetNumberOfRows", header: "vtkTable.h".}
proc SqueezeRows*(this: var vtkTable) {.importcpp: "SqueezeRows", header: "vtkTable.h".}
proc GetRow*(this: var vtkTable; row: vtkIdType): ptr vtkVariantArray {.
    importcpp: "GetRow", header: "vtkTable.h".}
proc GetRow*(this: var vtkTable; row: vtkIdType; values: ptr vtkVariantArray) {.
    importcpp: "GetRow", header: "vtkTable.h".}
proc SetRow*(this: var vtkTable; row: vtkIdType; values: ptr vtkVariantArray) {.
    importcpp: "SetRow", header: "vtkTable.h".}
proc InsertRow*(this: var vtkTable; row: vtkIdType) {.importcpp: "InsertRow",
    header: "vtkTable.h".}
proc InsertRows*(this: var vtkTable; row: vtkIdType; n: vtkIdType) {.
    importcpp: "InsertRows", header: "vtkTable.h".}
proc InsertNextBlankRow*(this: var vtkTable; default_num_val: cdouble = 0.0): vtkIdType {.
    importcpp: "InsertNextBlankRow", header: "vtkTable.h".}
proc InsertNextRow*(this: var vtkTable; values: ptr vtkVariantArray): vtkIdType {.
    importcpp: "InsertNextRow", header: "vtkTable.h".}
proc RemoveRow*(this: var vtkTable; row: vtkIdType) {.importcpp: "RemoveRow",
    header: "vtkTable.h".}
proc RemoveRows*(this: var vtkTable; row: vtkIdType; n: vtkIdType) {.
    importcpp: "RemoveRows", header: "vtkTable.h".}
proc RemoveAllRows*(this: var vtkTable) {.importcpp: "RemoveAllRows",
                                      header: "vtkTable.h".}
proc GetNumberOfColumns*(this: var vtkTable): vtkIdType {.
    importcpp: "GetNumberOfColumns", header: "vtkTable.h".}
proc GetColumnName*(this: var vtkTable; col: vtkIdType): cstring {.
    importcpp: "GetColumnName", header: "vtkTable.h".}
proc GetColumnByName*(this: var vtkTable; name: cstring): ptr vtkAbstractArray {.
    importcpp: "GetColumnByName", header: "vtkTable.h".}
proc GetColumnIndex*(this: var vtkTable; name: cstring): vtkIdType {.
    importcpp: "GetColumnIndex", header: "vtkTable.h".}
proc GetColumn*(this: var vtkTable; col: vtkIdType): ptr vtkAbstractArray {.
    importcpp: "GetColumn", header: "vtkTable.h".}
proc AddColumn*(this: var vtkTable; arr: ptr vtkAbstractArray) {.
    importcpp: "AddColumn", header: "vtkTable.h".}
proc InsertColumn*(this: var vtkTable; arr: ptr vtkAbstractArray; index: vtkIdType) {.
    importcpp: "InsertColumn", header: "vtkTable.h".}
proc RemoveColumnByName*(this: var vtkTable; name: cstring) {.
    importcpp: "RemoveColumnByName", header: "vtkTable.h".}
proc RemoveColumn*(this: var vtkTable; col: vtkIdType) {.importcpp: "RemoveColumn",
    header: "vtkTable.h".}
proc RemoveAllColumns*(this: var vtkTable) {.importcpp: "RemoveAllColumns",
    header: "vtkTable.h".}
proc GetValue*(this: var vtkTable; row: vtkIdType; col: vtkIdType): vtkVariant {.
    importcpp: "GetValue", header: "vtkTable.h".}
proc GetValueByName*(this: var vtkTable; row: vtkIdType; col: cstring): vtkVariant {.
    importcpp: "GetValueByName", header: "vtkTable.h".}
proc SetValue*(this: var vtkTable; row: vtkIdType; col: vtkIdType; value: vtkVariant) {.
    importcpp: "SetValue", header: "vtkTable.h".}
proc SetValueByName*(this: var vtkTable; row: vtkIdType; col: cstring; value: vtkVariant) {.
    importcpp: "SetValueByName", header: "vtkTable.h".}
proc Initialize*(this: var vtkTable) {.importcpp: "Initialize", header: "vtkTable.h".}
proc GetData*(info: ptr vtkInformation): ptr vtkTable {.
    importcpp: "vtkTable::GetData(@)", header: "vtkTable.h".}
proc GetData*(v: ptr vtkInformationVector; i: cint = 0): ptr vtkTable {.
    importcpp: "vtkTable::GetData(@)", header: "vtkTable.h".}
proc ShallowCopy*(this: var vtkTable; src: ptr vtkDataObject) {.
    importcpp: "ShallowCopy", header: "vtkTable.h".}
proc DeepCopy*(this: var vtkTable; src: ptr vtkDataObject) {.importcpp: "DeepCopy",
    header: "vtkTable.h".}
proc GetAttributesAsFieldData*(this: var vtkTable; `type`: cint): ptr vtkFieldData {.
    importcpp: "GetAttributesAsFieldData", header: "vtkTable.h".}
proc GetNumberOfElements*(this: var vtkTable; `type`: cint): vtkIdType {.
    importcpp: "GetNumberOfElements", header: "vtkTable.h".}