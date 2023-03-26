## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMySQLDatabase.h
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
##  @class   vtkMySQLDatabase
##  @brief   maintain a connection to a MySQL database
##
##
##
##  This class provides a VTK interface to MySQL
##  (http://www.mysql.com).  Unlike file-based databases like SQLite, you
##  talk to MySQL through a client/server connection.  You must specify
##  the hostname, (optional) port to connect to, username, password and
##  database name in order to connect.
##
##  @sa
##  vtkMySQLQuery
##

import
  vtkIOMySQLModule, vtkSQLDatabase

discard "forward decl of vtkSQLQuery"
discard "forward decl of vtkMySQLQuery"
discard "forward decl of vtkStringArray"
discard "forward decl of vtkMySQLDatabasePrivate"
type
  vtkMySQLDatabase* {.importcpp: "vtkMySQLDatabase", header: "vtkMySQLDatabase.h",
                     bycopy.} = object of vtkSQLDatabase ##  We want this to be private, a user of this class
                                                    ##  should not be setting this for any reason
    vtkMySQLDatabase* {.importc: "vtkMySQLDatabase".}: VTK_NEWINSTANCE

  vtkMySQLDatabaseSuperclass* = vtkSQLDatabase

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkMySQLDatabase::IsTypeOf(@)", header: "vtkMySQLDatabase.h".}
proc IsA*(this: var vtkMySQLDatabase; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkMySQLDatabase.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkMySQLDatabase {.
    importcpp: "vtkMySQLDatabase::SafeDownCast(@)", header: "vtkMySQLDatabase.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkMySQLDatabase :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkSQLDatabase :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMySQLDatabase :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMySQLDatabase :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkMySQLDatabase; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkMySQLDatabase.h".}
proc New*(): ptr vtkMySQLDatabase {.importcpp: "vtkMySQLDatabase::New(@)",
                                header: "vtkMySQLDatabase.h".}
proc Open*(this: var vtkMySQLDatabase; password: cstring = nil): bool {.
    importcpp: "Open", header: "vtkMySQLDatabase.h".}
proc Close*(this: var vtkMySQLDatabase) {.importcpp: "Close",
                                      header: "vtkMySQLDatabase.h".}
proc IsOpen*(this: var vtkMySQLDatabase): bool {.importcpp: "IsOpen",
    header: "vtkMySQLDatabase.h".}
proc GetQueryInstance*(this: var vtkMySQLDatabase): ptr vtkSQLQuery {.
    importcpp: "GetQueryInstance", header: "vtkMySQLDatabase.h".}
proc GetTables*(this: var vtkMySQLDatabase): ptr vtkStringArray {.
    importcpp: "GetTables", header: "vtkMySQLDatabase.h".}
proc GetRecord*(this: var vtkMySQLDatabase; table: cstring): ptr vtkStringArray {.
    importcpp: "GetRecord", header: "vtkMySQLDatabase.h".}
proc IsSupported*(this: var vtkMySQLDatabase; feature: cint): bool {.
    importcpp: "IsSupported", header: "vtkMySQLDatabase.h".}
proc HasError*(this: var vtkMySQLDatabase): bool {.importcpp: "HasError",
    header: "vtkMySQLDatabase.h".}
proc GetLastErrorText*(this: var vtkMySQLDatabase): cstring {.
    importcpp: "GetLastErrorText", header: "vtkMySQLDatabase.h".}
proc GetDatabaseType*(this: var vtkMySQLDatabase): cstring {.
    importcpp: "GetDatabaseType", header: "vtkMySQLDatabase.h".}
proc SetHostName*(this: var vtkMySQLDatabase; _arg: cstring) {.
    importcpp: "SetHostName", header: "vtkMySQLDatabase.h".}
proc GetHostName*(this: var vtkMySQLDatabase): cstring {.importcpp: "GetHostName",
    header: "vtkMySQLDatabase.h".}
  ## /@}
  ## /@{
  ## *
  ##  The user name for connecting to the database server.
  ##
proc SetHostNameUser*(this: var vtkMySQLDatabase; _arg: cstring) {.
    importcpp: "SetHostNameUser", header: "vtkMySQLDatabase.h".}
proc GetHostNameUser*(this: var vtkMySQLDatabase): cstring {.
    importcpp: "GetHostNameUser", header: "vtkMySQLDatabase.h".}
  ## /@}
  ## /@{
  ## *
  ##  The user's password for connecting to the database server.
  ##
proc SetHostNameUserPassword*(this: var vtkMySQLDatabase; _arg: cstring) {.
    importcpp: "SetHostNameUserPassword", header: "vtkMySQLDatabase.h".}
  ## /@}
  ## /@{
  ## *
  ##  The name of the database to connect to.
  ##
proc SetHostNameUserPasswordDatabaseName*(this: var vtkMySQLDatabase; _arg: cstring) {.
    importcpp: "SetHostNameUserPasswordDatabaseName", header: "vtkMySQLDatabase.h".}
proc GetHostNameUserDatabaseName*(this: var vtkMySQLDatabase): cstring {.
    importcpp: "GetHostNameUserDatabaseName", header: "vtkMySQLDatabase.h".}
  ## /@}
  ## /@{
  ## *
  ##  Should automatic reconnection be enabled?
  ##  This defaults to true.
  ##  If you change its value, you must do so before any call to Open().
  ##
proc SetReconnect*(this: var vtkMySQLDatabase; _arg: cint) {.
    importcpp: "SetReconnect", header: "vtkMySQLDatabase.h".}
## !!!Ignored construct:  virtual int GetReconnect ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Reconnect  of  << this -> Reconnect ) ; return this -> Reconnect ; } ;
## Error: expected ';'!!!

proc ReconnectOn*(this: var vtkMySQLDatabase) {.importcpp: "ReconnectOn",
    header: "vtkMySQLDatabase.h".}
proc ReconnectOff*(this: var vtkMySQLDatabase) {.importcpp: "ReconnectOff",
    header: "vtkMySQLDatabase.h".}
  ## /@}
  ## /@{
  ## *
  ##  The port used for connecting to the database.
  ##
proc SetServerPort*(this: var vtkMySQLDatabase; _arg: cint) {.
    importcpp: "SetServerPort", header: "vtkMySQLDatabase.h".}
proc GetServerPortMinValue*(this: var vtkMySQLDatabase): cint {.
    importcpp: "GetServerPortMinValue", header: "vtkMySQLDatabase.h".}
proc GetServerPortMaxValue*(this: var vtkMySQLDatabase): cint {.
    importcpp: "GetServerPortMaxValue", header: "vtkMySQLDatabase.h".}
## !!!Ignored construct:  virtual int GetReconnectServerPort ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ServerPort  of  << this -> ServerPort ) ; return this -> ServerPort ; } ;
## Error: expected ';'!!!

proc GetURL*(this: var vtkMySQLDatabase): vtkStdString {.importcpp: "GetURL",
    header: "vtkMySQLDatabase.h".}
proc GetTablePreamble*(this: var vtkMySQLDatabase; b: bool): vtkStdString {.
    importcpp: "GetTablePreamble", header: "vtkMySQLDatabase.h".}
proc GetColumnSpecification*(this: var vtkMySQLDatabase;
                            schema: ptr vtkSQLDatabaseSchema; tblHandle: cint;
                            colHandle: cint): vtkStdString {.
    importcpp: "GetColumnSpecification", header: "vtkMySQLDatabase.h".}
proc GetIndexSpecification*(this: var vtkMySQLDatabase;
                           schema: ptr vtkSQLDatabaseSchema; tblHandle: cint;
                           idxHandle: cint; skipped: var bool): vtkStdString {.
    importcpp: "GetIndexSpecification", header: "vtkMySQLDatabase.h".}
proc CreateDatabase*(this: var vtkMySQLDatabase; dbName: cstring; dropExisting: bool): bool {.
    importcpp: "CreateDatabase", header: "vtkMySQLDatabase.h".}
proc DropDatabase*(this: var vtkMySQLDatabase; dbName: cstring): bool {.
    importcpp: "DropDatabase", header: "vtkMySQLDatabase.h".}
proc ParseURL*(this: var vtkMySQLDatabase; url: cstring): bool {.importcpp: "ParseURL",
    header: "vtkMySQLDatabase.h".}