## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSQLiteQuery.h
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
##  @class   vtkSQLiteQuery
##  @brief   vtkSQLQuery implementation for SQLite databases
##
##
##
##  This is an implementation of vtkSQLQuery for SQLite databases.  See
##  the documentation for vtkSQLQuery for information about what the
##  methods do.
##
##
##  @bug
##  Sometimes Execute() will return false (meaning an error) but
##  GetLastErrorText() winds up null.  I am not certain why this is
##  happening.
##
##  @par Thanks:
##  Thanks to Andrew Wilson from Sandia National Laboratories for implementing
##  this class.
##
##  @sa
##  vtkSQLDatabase vtkSQLQuery vtkSQLiteDatabase
##

import
  vtkIOSQLModule, vtkSQLQuery

discard "forward decl of vtkSQLiteDatabase"
discard "forward decl of vtkVariant"
discard "forward decl of vtkVariantArray"
type
  vtkSQLiteQuery* {.importcpp: "vtkSQLiteQuery", header: "vtkSQLiteQuery.h", bycopy.} = object of vtkSQLQuery
    vtkSQLiteQuery* {.importc: "vtkSQLiteQuery".}: VTK_NEWINSTANCE
    ## /@{
    ## *
    ##  All of the BindParameter calls fall through to these methods
    ##  where we actually talk to sqlite.  You don't need to call them directly.
    ##

  vtkSQLiteQuerySuperclass* = vtkSQLQuery

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSQLiteQuery::IsTypeOf(@)", header: "vtkSQLiteQuery.h".}
proc IsA*(this: var vtkSQLiteQuery; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkSQLiteQuery.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSQLiteQuery {.
    importcpp: "vtkSQLiteQuery::SafeDownCast(@)", header: "vtkSQLiteQuery.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSQLiteQuery :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkSQLQuery :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSQLiteQuery :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSQLiteQuery :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSQLiteQuery; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkSQLiteQuery.h".}
proc New*(): ptr vtkSQLiteQuery {.importcpp: "vtkSQLiteQuery::New(@)",
                              header: "vtkSQLiteQuery.h".}
proc SetQuery*(this: var vtkSQLiteQuery; query: cstring): bool {.importcpp: "SetQuery",
    header: "vtkSQLiteQuery.h".}
proc Execute*(this: var vtkSQLiteQuery): bool {.importcpp: "Execute",
    header: "vtkSQLiteQuery.h".}
proc GetNumberOfFields*(this: var vtkSQLiteQuery): cint {.
    importcpp: "GetNumberOfFields", header: "vtkSQLiteQuery.h".}
proc GetFieldName*(this: var vtkSQLiteQuery; i: cint): cstring {.
    importcpp: "GetFieldName", header: "vtkSQLiteQuery.h".}
proc GetFieldType*(this: var vtkSQLiteQuery; i: cint): cint {.
    importcpp: "GetFieldType", header: "vtkSQLiteQuery.h".}
proc NextRow*(this: var vtkSQLiteQuery): bool {.importcpp: "NextRow",
    header: "vtkSQLiteQuery.h".}
proc HasError*(this: var vtkSQLiteQuery): bool {.importcpp: "HasError",
    header: "vtkSQLiteQuery.h".}
proc BeginTransaction*(this: var vtkSQLiteQuery): bool {.
    importcpp: "BeginTransaction", header: "vtkSQLiteQuery.h".}
proc RollbackTransaction*(this: var vtkSQLiteQuery): bool {.
    importcpp: "RollbackTransaction", header: "vtkSQLiteQuery.h".}
proc CommitTransaction*(this: var vtkSQLiteQuery): bool {.
    importcpp: "CommitTransaction", header: "vtkSQLiteQuery.h".}
proc DataValue*(this: var vtkSQLiteQuery; c: vtkIdType): vtkVariant {.
    importcpp: "DataValue", header: "vtkSQLiteQuery.h".}
proc GetLastErrorText*(this: var vtkSQLiteQuery): cstring {.
    importcpp: "GetLastErrorText", header: "vtkSQLiteQuery.h".}
## using statement

proc BindParameter*(this: var vtkSQLiteQuery; index: cint; value: cuchar): bool {.
    importcpp: "BindParameter", header: "vtkSQLiteQuery.h".}
proc BindParameter*(this: var vtkSQLiteQuery; index: cint; value: cchar): bool {.
    importcpp: "BindParameter", header: "vtkSQLiteQuery.h".}
proc BindParameter*(this: var vtkSQLiteQuery; index: cint; value: cushort): bool {.
    importcpp: "BindParameter", header: "vtkSQLiteQuery.h".}
proc BindParameter*(this: var vtkSQLiteQuery; index: cint; value: cshort): bool {.
    importcpp: "BindParameter", header: "vtkSQLiteQuery.h".}
proc BindParameter*(this: var vtkSQLiteQuery; index: cint; value: cuint): bool {.
    importcpp: "BindParameter", header: "vtkSQLiteQuery.h".}
proc BindParameter*(this: var vtkSQLiteQuery; index: cint; value: cint): bool {.
    importcpp: "BindParameter", header: "vtkSQLiteQuery.h".}
proc BindParameter*(this: var vtkSQLiteQuery; index: cint; value: culong): bool {.
    importcpp: "BindParameter", header: "vtkSQLiteQuery.h".}
proc BindParameter*(this: var vtkSQLiteQuery; index: cint; value: clong): bool {.
    importcpp: "BindParameter", header: "vtkSQLiteQuery.h".}
proc BindParameter*(this: var vtkSQLiteQuery; index: cint; value: culonglong): bool {.
    importcpp: "BindParameter", header: "vtkSQLiteQuery.h".}
proc BindParameter*(this: var vtkSQLiteQuery; index: cint; value: clonglong): bool {.
    importcpp: "BindParameter", header: "vtkSQLiteQuery.h".}
proc BindParameter*(this: var vtkSQLiteQuery; index: cint; value: cfloat): bool {.
    importcpp: "BindParameter", header: "vtkSQLiteQuery.h".}
proc BindParameter*(this: var vtkSQLiteQuery; index: cint; value: cdouble): bool {.
    importcpp: "BindParameter", header: "vtkSQLiteQuery.h".}
proc BindParameter*(this: var vtkSQLiteQuery; index: cint; stringValue: cstring): bool {.
    importcpp: "BindParameter", header: "vtkSQLiteQuery.h".}
proc BindParameter*(this: var vtkSQLiteQuery; index: cint; stringValue: cstring;
                   length: csize_t): bool {.importcpp: "BindParameter",
    header: "vtkSQLiteQuery.h".}
proc BindParameter*(this: var vtkSQLiteQuery; index: cint; string: vtkStdString): bool {.
    importcpp: "BindParameter", header: "vtkSQLiteQuery.h".}
proc BindParameter*(this: var vtkSQLiteQuery; index: cint; value: vtkVariant): bool {.
    importcpp: "BindParameter", header: "vtkSQLiteQuery.h".}
proc BindParameter*(this: var vtkSQLiteQuery; index: cint; data: pointer;
                   length: csize_t): bool {.importcpp: "BindParameter",
    header: "vtkSQLiteQuery.h".}
proc ClearParameterBindings*(this: var vtkSQLiteQuery): bool {.
    importcpp: "ClearParameterBindings", header: "vtkSQLiteQuery.h".}