## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSQLiteDatabase.h
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
##  @class   vtkSQLiteDatabase
##  @brief   maintain a connection to an SQLite database
##
##
##
##  SQLite (http://www.sqlite.org) is a public-domain SQL database
##  written in C++.  It's small, fast, and can be easily embedded
##  inside other applications.  Its databases are stored in files.
##
##  This class provides a VTK interface to SQLite.  You do not need to
##  download any external libraries: we include a copy of SQLite 3.3.16
##  in VTK/Utilities/vtksqlite.
##
##  If you want to open a database that stays in memory and never gets
##  written to disk, pass in the URL <tt>sqlite://:memory:</tt>; otherwise,
##  specify the file path by passing the URL <tt>sqlite://\<file_path\></tt>.
##
##  @par Thanks:
##  Thanks to Andrew Wilson and Philippe Pebay from Sandia National
##  Laboratories for implementing this class.
##
##  @sa
##  vtkSQLiteQuery
##

import
  vtkIOSQLModule, vtkSQLDatabase

discard "forward decl of vtkSQLQuery"
discard "forward decl of vtkSQLiteQuery"
discard "forward decl of vtkStringArray"
discard "forward decl of vtkSQLiteDatabaseInternals"
type
  vtkSQLiteDatabase* {.importcpp: "vtkSQLiteDatabase",
                      header: "vtkSQLiteDatabase.h", bycopy.} = object of vtkSQLDatabase
    vtkSQLiteDatabase* {.importc: "vtkSQLiteDatabase".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    ##  We want this to be private, a user of this class
    ##  should not be setting this for any reason

  vtkSQLiteDatabaseSuperclass* = vtkSQLDatabase

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSQLiteDatabase::IsTypeOf(@)", header: "vtkSQLiteDatabase.h".}
proc IsA*(this: var vtkSQLiteDatabase; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkSQLiteDatabase.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSQLiteDatabase {.
    importcpp: "vtkSQLiteDatabase::SafeDownCast(@)", header: "vtkSQLiteDatabase.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSQLiteDatabase :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkSQLDatabase :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSQLiteDatabase :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSQLiteDatabase :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSQLiteDatabase; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkSQLiteDatabase.h".}
proc New*(): ptr vtkSQLiteDatabase {.importcpp: "vtkSQLiteDatabase::New(@)",
                                 header: "vtkSQLiteDatabase.h".}
const
  vtkSQLiteDatabaseUSE_EXISTING* = 0
  vtkSQLiteDatabaseUSE_EXISTING_OR_CREATE* = 1
  vtkSQLiteDatabaseCREATE_OR_CLEAR* = 2
  vtkSQLiteDatabaseCREATE* = 3

proc Open*(this: var vtkSQLiteDatabase; password: cstring): bool {.importcpp: "Open",
    header: "vtkSQLiteDatabase.h".}
proc Open*(this: var vtkSQLiteDatabase; password: cstring; mode: cint): bool {.
    importcpp: "Open", header: "vtkSQLiteDatabase.h".}
proc Close*(this: var vtkSQLiteDatabase) {.importcpp: "Close",
                                       header: "vtkSQLiteDatabase.h".}
proc IsOpen*(this: var vtkSQLiteDatabase): bool {.importcpp: "IsOpen",
    header: "vtkSQLiteDatabase.h".}
proc GetQueryInstance*(this: var vtkSQLiteDatabase): ptr vtkSQLQuery {.
    importcpp: "GetQueryInstance", header: "vtkSQLiteDatabase.h".}
proc GetTables*(this: var vtkSQLiteDatabase): ptr vtkStringArray {.
    importcpp: "GetTables", header: "vtkSQLiteDatabase.h".}
proc GetRecord*(this: var vtkSQLiteDatabase; table: cstring): ptr vtkStringArray {.
    importcpp: "GetRecord", header: "vtkSQLiteDatabase.h".}
proc IsSupported*(this: var vtkSQLiteDatabase; feature: cint): bool {.
    importcpp: "IsSupported", header: "vtkSQLiteDatabase.h".}
proc HasError*(this: var vtkSQLiteDatabase): bool {.importcpp: "HasError",
    header: "vtkSQLiteDatabase.h".}
proc GetLastErrorText*(this: var vtkSQLiteDatabase): cstring {.
    importcpp: "GetLastErrorText", header: "vtkSQLiteDatabase.h".}
proc GetDatabaseType*(this: var vtkSQLiteDatabase): cstring {.
    importcpp: "GetDatabaseType", header: "vtkSQLiteDatabase.h".}
## !!!Ignored construct:  char * GetDatabaseFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DatabaseFileName  of  << ( this -> DatabaseFileName ? this -> DatabaseFileName : (null) ) ) ; return this -> DatabaseFileName ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual void SetDatabaseFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << DatabaseFileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> DatabaseFileName == nullptr && _arg == nullptr ) { return ; } if ( this -> DatabaseFileName && _arg && ( ! strcmp ( this -> DatabaseFileName , _arg ) ) ) { return ; } delete [ ] this -> DatabaseFileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> DatabaseFileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> DatabaseFileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

proc GetURL*(this: var vtkSQLiteDatabase): vtkStdString {.importcpp: "GetURL",
    header: "vtkSQLiteDatabase.h".}
proc GetColumnSpecification*(this: var vtkSQLiteDatabase;
                            schema: ptr vtkSQLDatabaseSchema; tblHandle: cint;
                            colHandle: cint): vtkStdString {.
    importcpp: "GetColumnSpecification", header: "vtkSQLiteDatabase.h".}