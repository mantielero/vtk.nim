## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTransposeTable.h
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
##  @class   vtkTransposeTable
##  @brief   Transpose an input table.
##
##
##  This algorithm allows to transpose a vtkTable as a matrix.
##  Columns become rows and vice versa. A new column can be added to
##  the result table at index 0 to collect the name of the initial
##  columns (when AddIdColumn is true). Such a column can be used
##  to name the columns of the result.
##  Note that columns of the output table will have a variant type
##  is the columns of the initial table are not consistent.
##

import
  vtkFiltersCoreModule, vtkTableAlgorithm

type
  vtkTransposeTable* {.importcpp: "vtkTransposeTable",
                      header: "vtkTransposeTable.h", bycopy.} = object of vtkTableAlgorithm
    vtkTransposeTable* {.importc: "vtkTransposeTable".}: VTK_NEWINSTANCE


proc New*(): ptr vtkTransposeTable {.importcpp: "vtkTransposeTable::New(@)",
                                 header: "vtkTransposeTable.h".}
type
  vtkTransposeTableSuperclass* = vtkTableAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTransposeTable::IsTypeOf(@)", header: "vtkTransposeTable.h".}
proc IsA*(this: var vtkTransposeTable; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTransposeTable.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTransposeTable {.
    importcpp: "vtkTransposeTable::SafeDownCast(@)", header: "vtkTransposeTable.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTransposeTable :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTableAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTransposeTable :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTransposeTable :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTransposeTable; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTransposeTable.h".}
## !!!Ignored construct:  /@{ *
##  This flag indicates if a column must be inserted at index 0
##  with the names (ids) of the input columns.
##  Default: true
##  virtual bool GetAddIdColumnAddIdColumn ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AddIdColumn  of  << this -> AddIdColumn ) ; return this -> AddIdColumn ; } ;
## Error: expected ';'!!!

proc SetAddIdColumn*(this: var vtkTransposeTable; _arg: bool) {.
    importcpp: "SetAddIdColumn", header: "vtkTransposeTable.h".}
proc AddIdColumnOn*(this: var vtkTransposeTable) {.importcpp: "AddIdColumnOn",
    header: "vtkTransposeTable.h".}
proc AddIdColumnOff*(this: var vtkTransposeTable) {.importcpp: "AddIdColumnOff",
    header: "vtkTransposeTable.h".}
  ## /@}
  ## /@{
  ## *
  ##  This flag indicates if the output column must be named using the
  ##  names listed in the index 0 column.
  ##  Default: false
  ##
## !!!Ignored construct:  virtual bool GetAddIdColumnAddIdColumnUseIdColumn ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseIdColumn  of  << this -> UseIdColumn ) ; return this -> UseIdColumn ; } ;
## Error: expected ';'!!!

proc SetAddIdColumnUseIdColumn*(this: var vtkTransposeTable; _arg: bool) {.
    importcpp: "SetAddIdColumnUseIdColumn", header: "vtkTransposeTable.h".}
proc UseIdColumnOn*(this: var vtkTransposeTable) {.importcpp: "UseIdColumnOn",
    header: "vtkTransposeTable.h".}
proc UseIdColumnOff*(this: var vtkTransposeTable) {.importcpp: "UseIdColumnOff",
    header: "vtkTransposeTable.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get/Set the name of the id column added by option AddIdColumn.
  ##  Default: ColName
  ##
proc GetIdColumnName*(this: var vtkTransposeTable): cstring {.
    importcpp: "GetIdColumnName", header: "vtkTransposeTable.h".}
proc SetIdColumnName*(this: var vtkTransposeTable; _arg: cstring) {.
    importcpp: "SetIdColumnName", header: "vtkTransposeTable.h".}
  ## /@}