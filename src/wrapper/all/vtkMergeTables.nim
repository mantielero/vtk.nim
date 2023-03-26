## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMergeTables.h
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
##  @class   vtkMergeTables
##  @brief   combine two tables
##
##
##  Combines the columns of two tables into one larger table.
##  The number of rows in the resulting table is the sum of the number of
##  rows in each of the input tables.
##  The number of columns in the output is generally the sum of the number
##  of columns in each input table, except in the case where column names
##  are duplicated in both tables.
##  In this case, if MergeColumnsByName is on (the default), the two columns
##  will be merged into a single column of the same name.
##  If MergeColumnsByName is off, both columns will exist in the output.
##  You may set the FirstTablePrefix and SecondTablePrefix to define how
##  the columns named are modified.  One of these prefixes may be the empty
##  string, but they must be different.
##

import
  vtkInfovisCoreModule, vtkTableAlgorithm

type
  vtkMergeTables* {.importcpp: "vtkMergeTables", header: "vtkMergeTables.h", bycopy.} = object of vtkTableAlgorithm
    vtkMergeTables* {.importc: "vtkMergeTables".}: VTK_NEWINSTANCE


proc New*(): ptr vtkMergeTables {.importcpp: "vtkMergeTables::New(@)",
                              header: "vtkMergeTables.h".}
type
  vtkMergeTablesSuperclass* = vtkTableAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkMergeTables::IsTypeOf(@)", header: "vtkMergeTables.h".}
proc IsA*(this: var vtkMergeTables; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkMergeTables.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkMergeTables {.
    importcpp: "vtkMergeTables::SafeDownCast(@)", header: "vtkMergeTables.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkMergeTables :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTableAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMergeTables :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMergeTables :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkMergeTables; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkMergeTables.h".}
proc SetFirstTablePrefix*(this: var vtkMergeTables; _arg: cstring) {.
    importcpp: "SetFirstTablePrefix", header: "vtkMergeTables.h".}
proc GetFirstTablePrefix*(this: var vtkMergeTables): cstring {.
    importcpp: "GetFirstTablePrefix", header: "vtkMergeTables.h".}
  ## /@}
  ## /@{
  ## *
  ##  The prefix to give to same-named fields from the second table.
  ##  Default is "Table2.".
  ##
proc SetFirstTablePrefixSecondTablePrefix*(this: var vtkMergeTables; _arg: cstring) {.
    importcpp: "SetFirstTablePrefixSecondTablePrefix", header: "vtkMergeTables.h".}
proc GetFirstTablePrefixSecondTablePrefix*(this: var vtkMergeTables): cstring {.
    importcpp: "GetFirstTablePrefixSecondTablePrefix", header: "vtkMergeTables.h".}
  ## /@}
  ## /@{
  ## *
  ##  If on, merges columns with the same name.
  ##  If off, keeps both columns, but calls one
  ##  FirstTablePrefix + name, and the other SecondTablePrefix + name.
  ##  Default is on.
  ##
proc SetMergeColumnsByName*(this: var vtkMergeTables; _arg: bool) {.
    importcpp: "SetMergeColumnsByName", header: "vtkMergeTables.h".}
## !!!Ignored construct:  virtual bool GetMergeColumnsByName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MergeColumnsByName  of  << this -> MergeColumnsByName ) ; return this -> MergeColumnsByName ; } ;
## Error: expected ';'!!!

proc MergeColumnsByNameOn*(this: var vtkMergeTables) {.
    importcpp: "MergeColumnsByNameOn", header: "vtkMergeTables.h".}
proc MergeColumnsByNameOff*(this: var vtkMergeTables) {.
    importcpp: "MergeColumnsByNameOff", header: "vtkMergeTables.h".}
  ## /@}
  ## /@{
  ## *
  ##  If on, all columns will have prefixes except merged columns.
  ##  If off, only unmerged columns with the same name will have prefixes.
  ##  Default is off.
  ##
proc SetMergeColumnsByNamePrefixAllButMerged*(this: var vtkMergeTables; _arg: bool) {.
    importcpp: "SetMergeColumnsByNamePrefixAllButMerged",
    header: "vtkMergeTables.h".}
## !!!Ignored construct:  virtual bool GetMergeColumnsByNamePrefixAllButMerged ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PrefixAllButMerged  of  << this -> PrefixAllButMerged ) ; return this -> PrefixAllButMerged ; } ;
## Error: expected ';'!!!

proc PrefixAllButMergedOn*(this: var vtkMergeTables) {.
    importcpp: "PrefixAllButMergedOn", header: "vtkMergeTables.h".}
proc PrefixAllButMergedOff*(this: var vtkMergeTables) {.
    importcpp: "PrefixAllButMergedOff", header: "vtkMergeTables.h".}
  ## /@}