##  -*- Mode: C++; -*-
## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkODBCDatabase.h
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
##  @class   vtkODBCDatabase
##  @brief   maintain an ODBC connection to a SQL database
##
##
##
##  ODBC is a standard for connecting to an SQL database regardless of
##  vendor or implementation.  In order to make it work you need two
##  separate pices of software: a driver manager and then a
##  database-specific driver.  On Windows, the driver manager is built
##  into the OS.  On Unix platforms, the open-source packages iODBC and
##  unixODBC will do the job.  Mac OS X has its own driver manager and
##  can also use the open-source packages.  Database-specific drivers
##  must be obtained from the entity that makes the database(s) you
##  use.
##
##  Unlike the other VTK database drivers, ODBC can read its parameters
##  from a configuration file (odbc.ini).  That file can define an
##  entire set of connection parameters and give it a single name
##  called a data source name (DSN).  Writing and maintaining odbc.ini
##  files is beyond the scope of this header file.
##
##
##  @warning
##  The password supplied as an argument to the Open call will override
##  whatever password is set (if any) in the DSN definition.  To use
##  the password from the DSN definition, pass in nullptr for
##  the password argument.
##
##  @warning
##  Also, vtkSQLDatabase::CreateFromURL() will only handle URLs of the
##  following form for ODBC:
##
##  @warning
##  odbc://[user@]datsourcename[:port]/[dbname]
##
##  @warning
##  Anything more complicated than that needs to be set up manually.
##
##  @warning
##  Finally, this class does not yet support the schema API present in
##  the SQLite, MySQL and PostgreSQL drivers.  Those functions will be
##  added once the bare-bones driver has been successfully integrated
##  into VTK.
##
##  @sa
##  vtkODBCQuery
##

import
  vtkIOODBCModule, vtkSQLDatabase

discard "forward decl of vtkSQLQuery"
discard "forward decl of vtkODBCQuery"
discard "forward decl of vtkStringArray"
discard "forward decl of vtkODBCInternals"
type
  vtkODBCDatabase* {.importcpp: "vtkODBCDatabase", header: "vtkODBCDatabase.h",
                    bycopy.} = object of vtkSQLDatabase
    vtkODBCDatabase* {.importc: "vtkODBCDatabase".}: VTK_NEWINSTANCE
    ##  We want this to be private, a user of this class
    ##  should not be setting this for any reason

  vtkODBCDatabaseSuperclass* = vtkSQLDatabase

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkODBCDatabase::IsTypeOf(@)", header: "vtkODBCDatabase.h".}
proc IsA*(this: var vtkODBCDatabase; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkODBCDatabase.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkODBCDatabase {.
    importcpp: "vtkODBCDatabase::SafeDownCast(@)", header: "vtkODBCDatabase.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkODBCDatabase :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkSQLDatabase :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkODBCDatabase :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkODBCDatabase :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkODBCDatabase; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkODBCDatabase.h".}
proc New*(): ptr vtkODBCDatabase {.importcpp: "vtkODBCDatabase::New(@)",
                               header: "vtkODBCDatabase.h".}
proc Open*(this: var vtkODBCDatabase; password: cstring): bool {.importcpp: "Open",
    header: "vtkODBCDatabase.h".}
proc Close*(this: var vtkODBCDatabase) {.importcpp: "Close",
                                     header: "vtkODBCDatabase.h".}
proc IsOpen*(this: var vtkODBCDatabase): bool {.importcpp: "IsOpen",
    header: "vtkODBCDatabase.h".}
proc GetQueryInstance*(this: var vtkODBCDatabase): ptr vtkSQLQuery {.
    importcpp: "GetQueryInstance", header: "vtkODBCDatabase.h".}
proc GetLastErrorText*(this: var vtkODBCDatabase): cstring {.
    importcpp: "GetLastErrorText", header: "vtkODBCDatabase.h".}
proc GetTables*(this: var vtkODBCDatabase): ptr vtkStringArray {.
    importcpp: "GetTables", header: "vtkODBCDatabase.h".}
proc GetRecord*(this: var vtkODBCDatabase; table: cstring): ptr vtkStringArray {.
    importcpp: "GetRecord", header: "vtkODBCDatabase.h".}
proc IsSupported*(this: var vtkODBCDatabase; feature: cint): bool {.
    importcpp: "IsSupported", header: "vtkODBCDatabase.h".}
proc SetDataSourceName*(this: var vtkODBCDatabase; _arg: cstring) {.
    importcpp: "SetDataSourceName", header: "vtkODBCDatabase.h".}
proc GetDataSourceName*(this: var vtkODBCDatabase): cstring {.
    importcpp: "GetDataSourceName", header: "vtkODBCDatabase.h".}
  ## /@}
proc SetServerPort*(this: var vtkODBCDatabase; _arg: cint) {.
    importcpp: "SetServerPort", header: "vtkODBCDatabase.h".}
proc SetDataSourceNameHostName*(this: var vtkODBCDatabase; _arg: cstring) {.
    importcpp: "SetDataSourceNameHostName", header: "vtkODBCDatabase.h".}
proc SetDataSourceNameHostNameUserName*(this: var vtkODBCDatabase; _arg: cstring) {.
    importcpp: "SetDataSourceNameHostNameUserName", header: "vtkODBCDatabase.h".}
proc SetDataSourceNameHostNameUserNameDatabaseName*(this: var vtkODBCDatabase;
    _arg: cstring) {.importcpp: "SetDataSourceNameHostNameUserNameDatabaseName",
                   header: "vtkODBCDatabase.h".}
proc GetDataSourceNameDatabaseName*(this: var vtkODBCDatabase): cstring {.
    importcpp: "GetDataSourceNameDatabaseName", header: "vtkODBCDatabase.h".}
proc SetDataSourceNameHostNameUserNameDatabaseNamePassword*(
    this: var vtkODBCDatabase; _arg: cstring) {.
    importcpp: "SetDataSourceNameHostNameUserNameDatabaseNamePassword",
    header: "vtkODBCDatabase.h".}
proc HasError*(this: var vtkODBCDatabase): bool {.importcpp: "HasError",
    header: "vtkODBCDatabase.h".}
proc GetDatabaseType*(this: var vtkODBCDatabase): cstring {.
    importcpp: "GetDatabaseType", header: "vtkODBCDatabase.h".}
proc GetURL*(this: var vtkODBCDatabase): vtkStdString {.importcpp: "GetURL",
    header: "vtkODBCDatabase.h".}
proc GetColumnSpecification*(this: var vtkODBCDatabase;
                            schema: ptr vtkSQLDatabaseSchema; tblHandle: cint;
                            colHandle: cint): vtkStdString {.
    importcpp: "GetColumnSpecification", header: "vtkODBCDatabase.h".}
proc GetIndexSpecification*(this: var vtkODBCDatabase;
                           schema: ptr vtkSQLDatabaseSchema; tblHandle: cint;
                           idxHandle: cint; skipped: var bool): vtkStdString {.
    importcpp: "GetIndexSpecification", header: "vtkODBCDatabase.h".}
proc CreateDatabase*(this: var vtkODBCDatabase; dbName: cstring; dropExisting: bool): bool {.
    importcpp: "CreateDatabase", header: "vtkODBCDatabase.h".}
proc DropDatabase*(this: var vtkODBCDatabase; dbName: cstring): bool {.
    importcpp: "DropDatabase", header: "vtkODBCDatabase.h".}
proc ParseURL*(this: var vtkODBCDatabase; url: cstring): bool {.importcpp: "ParseURL",
    header: "vtkODBCDatabase.h".}