## =========================================================================
##
## Program:   Visualization Toolkit
## Module:    vtkSQLDatabase.h
##
## Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
## All rights reserved.
## See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
## This software is distributed WITHOUT ANY WARRANTY; without even
## the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
## PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkSQLDatabase
##  @brief   maintain a connection to an sql database
##
##
##  Abstract base class for all SQL database connection classes.
##  Manages a connection to the database, and is responsible for creating
##  instances of the associated vtkSQLQuery objects associated with this
##  class in order to perform execute queries on the database.
##  To allow connections to a new type of database, create both a subclass
##  of this class and vtkSQLQuery, and implement the required functions:
##
##  Open() - open the database connection, if possible.
##  Close() - close the connection.
##  GetQueryInstance() - create and return an instance of the vtkSQLQuery
##                       subclass associated with the database type.
##
##  The subclass should also provide API to set connection parameters.
##
##  This class also provides the function EffectSchema to transform a
##  database schema into a SQL database.
##
##  @par Thanks:
##  Thanks to Andrew Wilson from Sandia National Laboratories for his work
##  on the database classes and for the SQLite example. Thanks to David Thompson
##  and Philippe Pebay from Sandia National Laboratories for implementing
##  this class.
##
##  @sa
##  vtkSQLQuery
##  vtkSQLDatabaseSchema
##

import
  vtkIOSQLModule, vtkObject, vtkStdString

discard "forward decl of vtkInformationObjectBaseKey"
discard "forward decl of vtkSQLDatabaseSchema"
discard "forward decl of vtkSQLQuery"
discard "forward decl of vtkStringArray"
const
  VTK_SQL_FEATURE_TRANSACTIONS* = 1000
  VTK_SQL_FEATURE_QUERY_SIZE* = 1001
  VTK_SQL_FEATURE_BLOB* = 1002
  VTK_SQL_FEATURE_UNICODE* = 1003
  VTK_SQL_FEATURE_PREPARED_QUERIES* = 1004
  VTK_SQL_FEATURE_NAMED_PLACEHOLDERS* = 1005
  VTK_SQL_FEATURE_POSITIONAL_PLACEHOLDERS* = 1006
  VTK_SQL_FEATURE_LAST_INSERT_ID* = 1007
  VTK_SQL_FEATURE_BATCH_OPERATIONS* = 1008
  VTK_SQL_FEATURE_TRIGGERS* = 1009

##  Default size for columns types which require a size to be specified
##  (i.e., VARCHAR), when no size has been specified

const
  VTK_SQL_DEFAULT_COLUMN_SIZE* = 32

type
  vtkSQLDatabase* {.importcpp: "vtkSQLDatabase", header: "vtkSQLDatabase.h", bycopy.} = object of vtkObject
    vtkSQLDatabase* {.importc: "vtkSQLDatabase".}: VTK_NEWINSTANCE
    vtkSQLQuery* {.importc: "vtkSQLQuery".}: VTK_NEWINSTANCE

  vtkSQLDatabaseSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSQLDatabase::IsTypeOf(@)", header: "vtkSQLDatabase.h".}
proc IsA*(this: var vtkSQLDatabase; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkSQLDatabase.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSQLDatabase {.
    importcpp: "vtkSQLDatabase::SafeDownCast(@)", header: "vtkSQLDatabase.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSQLDatabase :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSQLDatabase :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSQLDatabase :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSQLDatabase; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkSQLDatabase.h".}
proc Open*(this: var vtkSQLDatabase; password: cstring): bool {.importcpp: "Open",
    header: "vtkSQLDatabase.h".}
proc Close*(this: var vtkSQLDatabase) {.importcpp: "Close", header: "vtkSQLDatabase.h".}
proc IsOpen*(this: var vtkSQLDatabase): bool {.importcpp: "IsOpen",
    header: "vtkSQLDatabase.h".}
## !!!Ignored construct:  * GetQueryInstance ( ) = 0 ;
## Error: identifier expected, but got: *!!!

proc HasError*(this: var vtkSQLDatabase): bool {.importcpp: "HasError",
    header: "vtkSQLDatabase.h".}
proc GetLastErrorText*(this: var vtkSQLDatabase): cstring {.
    importcpp: "GetLastErrorText", header: "vtkSQLDatabase.h".}
proc GetDatabaseType*(this: var vtkSQLDatabase): cstring {.
    importcpp: "GetDatabaseType", header: "vtkSQLDatabase.h".}
proc GetTables*(this: var vtkSQLDatabase): ptr vtkStringArray {.
    importcpp: "GetTables", header: "vtkSQLDatabase.h".}
proc GetRecord*(this: var vtkSQLDatabase; table: cstring): ptr vtkStringArray {.
    importcpp: "GetRecord", header: "vtkSQLDatabase.h".}
proc IsSupported*(this: var vtkSQLDatabase; vtkNotUsed: proc (a1: feature): cint): bool {.
    importcpp: "IsSupported", header: "vtkSQLDatabase.h".}
proc GetURL*(this: var vtkSQLDatabase): vtkStdString {.importcpp: "GetURL",
    header: "vtkSQLDatabase.h".}
proc GetTablePreamble*(this: var vtkSQLDatabase; a2: bool): vtkStdString {.
    importcpp: "GetTablePreamble", header: "vtkSQLDatabase.h".}
proc GetColumnSpecification*(this: var vtkSQLDatabase;
                            schema: ptr vtkSQLDatabaseSchema; tblHandle: cint;
                            colHandle: cint): vtkStdString {.
    importcpp: "GetColumnSpecification", header: "vtkSQLDatabase.h".}
proc GetIndexSpecification*(this: var vtkSQLDatabase;
                           schema: ptr vtkSQLDatabaseSchema; tblHandle: cint;
                           idxHandle: cint; skipped: var bool): vtkStdString {.
    importcpp: "GetIndexSpecification", header: "vtkSQLDatabase.h".}
proc GetTriggerSpecification*(this: var vtkSQLDatabase;
                             schema: ptr vtkSQLDatabaseSchema; tblHandle: cint;
                             trgHandle: cint): vtkStdString {.
    importcpp: "GetTriggerSpecification", header: "vtkSQLDatabase.h".}
## !!!Ignored construct:  * CreateFromURL ( const char * URL ) ;
## Error: identifier expected, but got: *!!!

proc EffectSchema*(this: var vtkSQLDatabase; a2: ptr vtkSQLDatabaseSchema;
                  dropIfExists: bool = false): bool {.importcpp: "EffectSchema",
    header: "vtkSQLDatabase.h".}
type
  vtkSQLDatabaseCreateFunction* = proc (URL: cstring): ptr vtkSQLDatabase

proc RegisterCreateFromURLCallback*(callback: vtkSQLDatabaseCreateFunction) {.
    importcpp: "vtkSQLDatabase::RegisterCreateFromURLCallback(@)",
    header: "vtkSQLDatabase.h".}
proc UnRegisterCreateFromURLCallback*(callback: vtkSQLDatabaseCreateFunction) {.
    importcpp: "vtkSQLDatabase::UnRegisterCreateFromURLCallback(@)",
    header: "vtkSQLDatabase.h".}
proc UnRegisterAllCreateFromURLCallbacks*() {.
    importcpp: "vtkSQLDatabase::UnRegisterAllCreateFromURLCallbacks(@)",
    header: "vtkSQLDatabase.h".}
proc DATABASE*(): ptr vtkInformationObjectBaseKey {.
    importcpp: "vtkSQLDatabase::DATABASE(@)", header: "vtkSQLDatabase.h".}