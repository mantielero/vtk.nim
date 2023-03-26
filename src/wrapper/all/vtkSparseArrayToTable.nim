## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSparseArrayToTable.h
##
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
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
##  @class   vtkSparseArrayToTable
##  @brief   Converts a sparse array to a vtkTable.
##
##
##  Converts any sparse array to a vtkTable containing one row for each value
##  stored in the array.  The table will contain one column of coordinates for each
##  dimension in the source array, plus one column of array values.  A common use-case
##  for vtkSparseArrayToTable would be converting a sparse array into a table
##  suitable for use as an input to vtkTableToGraph.
##
##  The coordinate columns in the output table will be named using the dimension labels
##  from the source array,  The value column name can be explicitly set using
##  SetValueColumn().
##
##  @par Thanks:
##  Developed by Timothy M. Shead (tshead@sandia.gov) at Sandia National Laboratories.
##

import
  vtkInfovisCoreModule, vtkTableAlgorithm

type
  vtkSparseArrayToTable* {.importcpp: "vtkSparseArrayToTable",
                          header: "vtkSparseArrayToTable.h", bycopy.} = object of vtkTableAlgorithm
    vtkSparseArrayToTable* {.importc: "vtkSparseArrayToTable".}: VTK_NEWINSTANCE


proc New*(): ptr vtkSparseArrayToTable {.importcpp: "vtkSparseArrayToTable::New(@)",
                                     header: "vtkSparseArrayToTable.h".}
type
  vtkSparseArrayToTableSuperclass* = vtkTableAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSparseArrayToTable::IsTypeOf(@)",
    header: "vtkSparseArrayToTable.h".}
proc IsA*(this: var vtkSparseArrayToTable; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkSparseArrayToTable.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSparseArrayToTable {.
    importcpp: "vtkSparseArrayToTable::SafeDownCast(@)",
    header: "vtkSparseArrayToTable.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSparseArrayToTable :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTableAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSparseArrayToTable :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSparseArrayToTable :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSparseArrayToTable; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkSparseArrayToTable.h".}
proc GetValueColumn*(this: var vtkSparseArrayToTable): cstring {.
    importcpp: "GetValueColumn", header: "vtkSparseArrayToTable.h".}
proc SetValueColumn*(this: var vtkSparseArrayToTable; _arg: cstring) {.
    importcpp: "SetValueColumn", header: "vtkSparseArrayToTable.h".}
  ## /@}