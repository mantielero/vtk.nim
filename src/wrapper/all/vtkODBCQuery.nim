##  -*- Mode: C++; -*-
## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkODBCQuery.h
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
##  @class   vtkODBCQuery
##  @brief   vtkSQLQuery implementation for ODBC connections to databases
##
##
##
##  This is an implementation of vtkSQLQuery for ODBC databases.  See
##  the documentation for vtkSQLQuery and vtkRowQuery for information
##  about what the methods do.
##
##  @sa
##  vtkSQLDatabase vtkSQLQuery vtkODBCDatabase
##

import
  vtkIOODBCModule, vtkSQLQuery

discard "forward decl of vtkODBCDatabase"
discard "forward decl of vtkVariant"
discard "forward decl of vtkVariantArray"
discard "forward decl of vtkODBCInternals"
discard "forward decl of vtkODBCQueryInternals"
type
  vtkODBCQuery* {.importcpp: "vtkODBCQuery", header: "vtkODBCQuery.h", bycopy.} = object of vtkSQLQuery
    vtkODBCQuery* {.importc: "vtkODBCQuery".}: VTK_NEWINSTANCE

  vtkODBCQuerySuperclass* = vtkSQLQuery

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkODBCQuery::IsTypeOf(@)", header: "vtkODBCQuery.h".}
proc IsA*(this: var vtkODBCQuery; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkODBCQuery.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkODBCQuery {.
    importcpp: "vtkODBCQuery::SafeDownCast(@)", header: "vtkODBCQuery.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkODBCQuery :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkSQLQuery :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkODBCQuery :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkODBCQuery :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkODBCQuery; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkODBCQuery.h".}
proc New*(): ptr vtkODBCQuery {.importcpp: "vtkODBCQuery::New(@)",
                            header: "vtkODBCQuery.h".}
proc Execute*(this: var vtkODBCQuery): bool {.importcpp: "Execute",
    header: "vtkODBCQuery.h".}
proc GetNumberOfFields*(this: var vtkODBCQuery): cint {.
    importcpp: "GetNumberOfFields", header: "vtkODBCQuery.h".}
proc GetFieldName*(this: var vtkODBCQuery; i: cint): cstring {.
    importcpp: "GetFieldName", header: "vtkODBCQuery.h".}
proc GetFieldType*(this: var vtkODBCQuery; i: cint): cint {.importcpp: "GetFieldType",
    header: "vtkODBCQuery.h".}
proc NextRow*(this: var vtkODBCQuery): bool {.importcpp: "NextRow",
    header: "vtkODBCQuery.h".}
proc HasError*(this: var vtkODBCQuery): bool {.importcpp: "HasError",
    header: "vtkODBCQuery.h".}
proc DataValue*(this: var vtkODBCQuery; c: vtkIdType): vtkVariant {.
    importcpp: "DataValue", header: "vtkODBCQuery.h".}
proc GetLastErrorText*(this: var vtkODBCQuery): cstring {.
    importcpp: "GetLastErrorText", header: "vtkODBCQuery.h".}
proc BeginTransaction*(this: var vtkODBCQuery): bool {.importcpp: "BeginTransaction",
    header: "vtkODBCQuery.h".}
proc CommitTransaction*(this: var vtkODBCQuery): bool {.
    importcpp: "CommitTransaction", header: "vtkODBCQuery.h".}
proc RollbackTransaction*(this: var vtkODBCQuery): bool {.
    importcpp: "RollbackTransaction", header: "vtkODBCQuery.h".}
proc SetQuery*(this: var vtkODBCQuery; queryString: cstring): bool {.
    importcpp: "SetQuery", header: "vtkODBCQuery.h".}
proc GetQuery*(this: var vtkODBCQuery): cstring {.importcpp: "GetQuery",
    header: "vtkODBCQuery.h".}
## using statement

proc BindParameter*(this: var vtkODBCQuery; index: cint; value: cuchar): bool {.
    importcpp: "BindParameter", header: "vtkODBCQuery.h".}
proc BindParameter*(this: var vtkODBCQuery; index: cint; value: cchar): bool {.
    importcpp: "BindParameter", header: "vtkODBCQuery.h".}
proc BindParameter*(this: var vtkODBCQuery; index: cint; value: cushort): bool {.
    importcpp: "BindParameter", header: "vtkODBCQuery.h".}
proc BindParameter*(this: var vtkODBCQuery; index: cint; value: cshort): bool {.
    importcpp: "BindParameter", header: "vtkODBCQuery.h".}
proc BindParameter*(this: var vtkODBCQuery; index: cint; value: cuint): bool {.
    importcpp: "BindParameter", header: "vtkODBCQuery.h".}
proc BindParameter*(this: var vtkODBCQuery; index: cint; value: cint): bool {.
    importcpp: "BindParameter", header: "vtkODBCQuery.h".}
proc BindParameter*(this: var vtkODBCQuery; index: cint; value: culong): bool {.
    importcpp: "BindParameter", header: "vtkODBCQuery.h".}
proc BindParameter*(this: var vtkODBCQuery; index: cint; value: clong): bool {.
    importcpp: "BindParameter", header: "vtkODBCQuery.h".}
proc BindParameter*(this: var vtkODBCQuery; index: cint; value: culonglong): bool {.
    importcpp: "BindParameter", header: "vtkODBCQuery.h".}
proc BindParameter*(this: var vtkODBCQuery; index: cint; value: clonglong): bool {.
    importcpp: "BindParameter", header: "vtkODBCQuery.h".}
proc BindParameter*(this: var vtkODBCQuery; index: cint; value: cfloat): bool {.
    importcpp: "BindParameter", header: "vtkODBCQuery.h".}
proc BindParameter*(this: var vtkODBCQuery; index: cint; value: cdouble): bool {.
    importcpp: "BindParameter", header: "vtkODBCQuery.h".}
proc BindParameter*(this: var vtkODBCQuery; index: cint; stringValue: cstring): bool {.
    importcpp: "BindParameter", header: "vtkODBCQuery.h".}
proc BindParameter*(this: var vtkODBCQuery; index: cint; stringValue: cstring;
                   length: csize_t): bool {.importcpp: "BindParameter",
    header: "vtkODBCQuery.h".}
proc BindParameter*(this: var vtkODBCQuery; index: cint; string: vtkStdString): bool {.
    importcpp: "BindParameter", header: "vtkODBCQuery.h".}
proc BindParameter*(this: var vtkODBCQuery; index: cint; data: pointer; length: csize_t): bool {.
    importcpp: "BindParameter", header: "vtkODBCQuery.h".}
proc ClearParameterBindings*(this: var vtkODBCQuery): bool {.
    importcpp: "ClearParameterBindings", header: "vtkODBCQuery.h".}