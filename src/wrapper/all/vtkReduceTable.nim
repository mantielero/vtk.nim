## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkReduceTable.h
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
##  @class   vtkReduceTable
##  @brief   combine some of the rows of a table
##
##
##  Collapses the rows of the input table so that one particular
##  column (the IndexColumn) does not contain any duplicate values.
##  Thus the output table will have the same columns as the input
##  table, but potentially fewer rows.  One example use of this
##  class would be to generate a summary table from a table of
##  observations.
##  When two or more rows of the input table share a value in the
##  IndexColumn, the values from these rows will be combined on a
##  column-by-column basis.  By default, such numerical values will be
##  reduced to their mean, and non-numerical values will be reduced to
##  their mode.  This default behavior can be changed by calling
##  SetNumericalReductionMethod() or SetNonNumericalReductionMethod().
##  You can also specify the reduction method to use for a particular
##  column by calling SetReductionMethodForColumn().
##

import
  vtkInfovisCoreModule, vtkTableAlgorithm

discard "forward decl of vtkVariant"
type
  vtkReduceTable* {.importcpp: "vtkReduceTable", header: "vtkReduceTable.h", bycopy.} = object of vtkTableAlgorithm
    vtkReduceTable* {.importc: "vtkReduceTable".}: VTK_NEWINSTANCE


proc New*(): ptr vtkReduceTable {.importcpp: "vtkReduceTable::New(@)",
                              header: "vtkReduceTable.h".}
type
  vtkReduceTableSuperclass* = vtkTableAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkReduceTable::IsTypeOf(@)", header: "vtkReduceTable.h".}
proc IsA*(this: var vtkReduceTable; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkReduceTable.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkReduceTable {.
    importcpp: "vtkReduceTable::SafeDownCast(@)", header: "vtkReduceTable.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkReduceTable :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTableAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkReduceTable :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkReduceTable :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkReduceTable; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkReduceTable.h".}
## !!!Ignored construct:  /@{ *
##  Get/Set the column that will be used to reduce the input table.
##  Any rows sharing a value in this column will be collapsed into
##  a single row in the output table.
##  virtual vtkIdType GetIndexColumnIndexColumn ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IndexColumn  of  << this -> IndexColumn ) ; return this -> IndexColumn ; } ;
## Error: expected ';'!!!

proc SetIndexColumn*(this: var vtkReduceTable; _arg: vtkIdType) {.
    importcpp: "SetIndexColumn", header: "vtkReduceTable.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get/Set the method that should be used to combine numerical
  ##  values.
  ##
## !!!Ignored construct:  virtual int GetIndexColumnIndexColumnNumericalReductionMethod ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumericalReductionMethod  of  << this -> NumericalReductionMethod ) ; return this -> NumericalReductionMethod ; } ;
## Error: expected ';'!!!

proc SetIndexColumnNumericalReductionMethod*(this: var vtkReduceTable; _arg: cint) {.
    importcpp: "SetIndexColumnNumericalReductionMethod",
    header: "vtkReduceTable.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get/Set the method that should be used to combine non-numerical
  ##  values.
  ##
## !!!Ignored construct:  virtual int GetIndexColumnIndexColumnNumericalReductionMethodNonNumericalReductionMethod ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NonNumericalReductionMethod  of  << this -> NonNumericalReductionMethod ) ; return this -> NonNumericalReductionMethod ; } ;
## Error: expected ';'!!!

proc SetIndexColumnNumericalReductionMethodNonNumericalReductionMethod*(
    this: var vtkReduceTable; _arg: cint) {.importcpp: "SetIndexColumnNumericalReductionMethodNonNumericalReductionMethod",
                                       header: "vtkReduceTable.h".}
  ## /@}
  ## *
  ##  Get the method that should be used to combine the values within
  ##  the specified column.  Returns -1 if no method has been set for
  ##  this particular column.
  ##
proc GetReductionMethodForColumn*(this: var vtkReduceTable; col: vtkIdType): cint {.
    importcpp: "GetReductionMethodForColumn", header: "vtkReduceTable.h".}
proc SetReductionMethodForColumn*(this: var vtkReduceTable; col: vtkIdType;
                                 `method`: cint) {.
    importcpp: "SetReductionMethodForColumn", header: "vtkReduceTable.h".}
const
  vtkReduceTableMEAN* = 0
  vtkReduceTableMEDIAN* = 1
  vtkReduceTableMODE* = 2
