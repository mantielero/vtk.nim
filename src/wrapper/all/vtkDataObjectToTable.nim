## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDataObjectToTable.h
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
##  @class   vtkDataObjectToTable
##  @brief   extract field data as a table
##
##
##  This filter is used to extract either the field, cell or point data of
##  any data object as a table.
##

import
  vtkInfovisCoreModule, vtkTableAlgorithm

type
  vtkDataObjectToTable* {.importcpp: "vtkDataObjectToTable",
                         header: "vtkDataObjectToTable.h", bycopy.} = object of vtkTableAlgorithm
    vtkDataObjectToTable* {.importc: "vtkDataObjectToTable".}: VTK_NEWINSTANCE


proc New*(): ptr vtkDataObjectToTable {.importcpp: "vtkDataObjectToTable::New(@)",
                                    header: "vtkDataObjectToTable.h".}
type
  vtkDataObjectToTableSuperclass* = vtkTableAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkDataObjectToTable::IsTypeOf(@)",
    header: "vtkDataObjectToTable.h".}
proc IsA*(this: var vtkDataObjectToTable; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkDataObjectToTable.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkDataObjectToTable {.
    importcpp: "vtkDataObjectToTable::SafeDownCast(@)",
    header: "vtkDataObjectToTable.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkDataObjectToTable :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTableAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDataObjectToTable :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDataObjectToTable :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkDataObjectToTable; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkDataObjectToTable.h".}
const
  vtkDataObjectToTableFIELD_DATA* = 0
  vtkDataObjectToTablePOINT_DATA* = 1
  vtkDataObjectToTableCELL_DATA* = 2
  vtkDataObjectToTableVERTEX_DATA* = 3
  vtkDataObjectToTableEDGE_DATA* = 4

## !!!Ignored construct:  /@{ *
##  The field type to copy into the output table.
##  Should be one of FIELD_DATA, POINT_DATA, CELL_DATA, VERTEX_DATA, EDGE_DATA.
##  virtual int GetFieldTypeFieldType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FieldType  of  << this -> FieldType ) ; return this -> FieldType ; } ;
## Error: expected ';'!!!

proc SetFieldType*(this: var vtkDataObjectToTable; _arg: cint) {.
    importcpp: "SetFieldType", header: "vtkDataObjectToTable.h".}
proc GetFieldTypeMinValue*(this: var vtkDataObjectToTable): cint {.
    importcpp: "GetFieldTypeMinValue", header: "vtkDataObjectToTable.h".}
proc GetFieldTypeMaxValue*(this: var vtkDataObjectToTable): cint {.
    importcpp: "GetFieldTypeMaxValue", header: "vtkDataObjectToTable.h".}
  ## /@}