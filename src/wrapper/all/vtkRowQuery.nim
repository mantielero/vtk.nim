## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRowQuery.h
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
##  @class   vtkRowQuery
##  @brief   abstract interface for queries that return
##  row-oriented results.
##
##
##  The abstract superclass of query classes that return row-oriented (table)
##  results.  A subclass will provide database-specific query parameters and
##  implement the vtkRowQuery API to return query results:
##
##  Execute() - Execute the query.  No results need to be retrieved at this
##              point, unless you are performing caching.
##
##  GetNumberOfFields() - After Execute() is performed, returns the number
##                        of fields in the query results.
##
##  GetFieldName() - The name of the field at an index.
##
##  GetFieldType() - The data type of the field at an index.
##
##  NextRow() - Advances the query results by one row, and returns whether
##              there are more rows left in the query.
##
##  DataValue() - Extract a single data value from the current row.
##
##  @par Thanks:
##  Thanks to Andrew Wilson from Sandia National Laboratories for his work
##  on the database classes.
##
##  @sa
##  vtkRowQueryToTable
##

import
  vtkIOSQLModule, vtkObject

discard "forward decl of vtkVariant"
discard "forward decl of vtkVariantArray"
type
  vtkRowQuery* {.importcpp: "vtkRowQuery", header: "vtkRowQuery.h", bycopy.} = object of vtkObject
    vtkRowQuery* {.importc: "vtkRowQuery".}: VTK_NEWINSTANCE

  vtkRowQuerySuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkRowQuery::IsTypeOf(@)", header: "vtkRowQuery.h".}
proc IsA*(this: var vtkRowQuery; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkRowQuery.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkRowQuery {.
    importcpp: "vtkRowQuery::SafeDownCast(@)", header: "vtkRowQuery.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkRowQuery :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRowQuery :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRowQuery :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkRowQuery; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkRowQuery.h".}
proc Execute*(this: var vtkRowQuery): bool {.importcpp: "Execute",
                                        header: "vtkRowQuery.h".}
proc GetNumberOfFields*(this: var vtkRowQuery): cint {.
    importcpp: "GetNumberOfFields", header: "vtkRowQuery.h".}
proc GetFieldName*(this: var vtkRowQuery; i: cint): cstring {.
    importcpp: "GetFieldName", header: "vtkRowQuery.h".}
proc GetFieldType*(this: var vtkRowQuery; i: cint): cint {.importcpp: "GetFieldType",
    header: "vtkRowQuery.h".}
proc GetFieldIndex*(this: var vtkRowQuery; name: cstring): cint {.
    importcpp: "GetFieldIndex", header: "vtkRowQuery.h".}
proc NextRow*(this: var vtkRowQuery): bool {.importcpp: "NextRow",
                                        header: "vtkRowQuery.h".}
proc IsActive*(this: var vtkRowQuery): bool {.importcpp: "IsActive",
    header: "vtkRowQuery.h".}
proc NextRow*(this: var vtkRowQuery; rowArray: ptr vtkVariantArray): bool {.
    importcpp: "NextRow", header: "vtkRowQuery.h".}
proc DataValue*(this: var vtkRowQuery; c: vtkIdType): vtkVariant {.
    importcpp: "DataValue", header: "vtkRowQuery.h".}
proc HasError*(this: var vtkRowQuery): bool {.importcpp: "HasError",
    header: "vtkRowQuery.h".}
proc GetLastErrorText*(this: var vtkRowQuery): cstring {.
    importcpp: "GetLastErrorText", header: "vtkRowQuery.h".}
proc SetCaseSensitiveFieldNames*(this: var vtkRowQuery; _arg: bool) {.
    importcpp: "SetCaseSensitiveFieldNames", header: "vtkRowQuery.h".}
## !!!Ignored construct:  virtual bool GetCaseSensitiveFieldNames ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CaseSensitiveFieldNames  of  << this -> CaseSensitiveFieldNames ) ; return this -> CaseSensitiveFieldNames ; } ;
## Error: expected ';'!!!

proc CaseSensitiveFieldNamesOn*(this: var vtkRowQuery) {.
    importcpp: "CaseSensitiveFieldNamesOn", header: "vtkRowQuery.h".}
proc CaseSensitiveFieldNamesOff*(this: var vtkRowQuery) {.
    importcpp: "CaseSensitiveFieldNamesOff", header: "vtkRowQuery.h".}
  ## /@}