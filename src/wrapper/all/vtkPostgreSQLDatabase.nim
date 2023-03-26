##  -*- Mode: C++; -*-
## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPostgreSQLDatabase.h
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
##  @class   vtkPostgreSQLDatabase
##  @brief   maintain a connection to a PostgreSQL database
##
##
##
##  PostgreSQL (http://www.postgres.org) is a BSD-licensed SQL database.
##  It's large, fast, and can not be easily embedded
##  inside other applications.  Its databases are stored in files that
##  belong to another process.
##
##  This class provides a VTK interface to PostgreSQL.  You do need to
##  download external libraries: we need a copy of PostgreSQL 8
##  (currently 8.2 or 8.3) so that we can link against the libpq C
##  interface.
##
##
##  @par Thanks:
##  Thanks to David Thompson and Andy Wilson from Sandia National
##  Laboratories for implementing this class.
##
##  @sa
##  vtkPostgreSQLQuery
##

## !!!Ignored construct:  # vtkPostgreSQLDatabase_h [NewLine] # vtkPostgreSQLDatabase_h [NewLine] # vtkIOPostgreSQLModule.h  For export macro # vtkSQLDatabase.h [NewLine] class vtkPostgreSQLQuery ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkStringArray"
discard "forward decl of vtkPostgreSQLDatabasePrivate"
discard "forward decl of PQconn"
## !!!Ignored construct:  class VTKIOPOSTGRESQL_EXPORT vtkPostgreSQLDatabase : public vtkSQLDatabase { friend class vtkPostgreSQLQuery ; friend class vtkPostgreSQLQueryPrivate ; public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkSQLDatabase Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkSQLDatabase :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPostgreSQLDatabase :: IsTypeOf ( type ) ; } static vtkPostgreSQLDatabase * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPostgreSQLDatabase * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPostgreSQLDatabase * NewInstance ( ) const { return vtkPostgreSQLDatabase :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkSQLDatabase :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPostgreSQLDatabase :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPostgreSQLDatabase :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkPostgreSQLDatabase * New ( ) ; *
##  Open a new connection to the database.  You need to set the
##  filename before calling this function.  Returns true if the
##  database was opened successfully; false otherwise.
##  bool Open ( const char * password = nullptr ) override ; *
##  Close the connection to the database.
##  void Close ( ) override ; *
##  Return whether the database has an open connection
##  bool IsOpen ( ) override ; *
##  Return an empty query on this database.
##  vtkSQLQuery * GetQueryInstance ( ) override ; *
##  Did the last operation generate an error
##  bool HasError ( ) override ; *
##  Get the last error text from the database
##  const char * GetLastErrorText ( ) override ; /@{ *
##  String representing database type (e.g. "psql").
##  const char * GetDatabaseType ( ) override { return this -> DatabaseType ; } /@} /@{ *
##  The database server host name.
##  virtual void SetHostName ( const char * ) ; virtual char * GetHostName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << HostName  of  << ( this -> HostName ? this -> HostName : (null) ) ) ; return this -> HostName ; } ; /@} /@{ *
##  The user name for connecting to the database server.
##  virtual void SetUser ( const char * ) ; virtual char * GetHostNameUser ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << User  of  << ( this -> User ? this -> User : (null) ) ) ; return this -> User ; } ; /@} *
##  The user's password for connecting to the database server.
##  virtual void SetPassword ( const char * ) ; /@{ *
##  The name of the database to connect to.
##  virtual void SetDatabaseName ( const char * ) ; virtual char * GetHostNameUserDatabaseName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << DatabaseName  of  << ( this -> DatabaseName ? this -> DatabaseName : (null) ) ) ; return this -> DatabaseName ; } ; /@} /@{ *
##  Additional options for the database.
##  virtual void SetConnectOptions ( const char * ) ; virtual char * GetHostNameUserDatabaseNameConnectOptions ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << ConnectOptions  of  << ( this -> ConnectOptions ? this -> ConnectOptions : (null) ) ) ; return this -> ConnectOptions ; } ; /@} /@{ *
##  The port used for connecting to the database.
##  virtual void SetServerPort ( int ) ; virtual int GetServerPortMinValue ( ) { return 0 ; } virtual int GetServerPortMaxValue ( ) { return VTK_INT_MAX ; } virtual int GetServerPort ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ServerPort  of  << this -> ServerPort ) ; return this -> ServerPort ; } ; /@} *
##  Get a URL referencing the current database connection.
##  This is not well-defined if the HostName and DatabaseName
##  have not been set. The URL will be of the form
##  <code>'psql://'[username[':'password]'@']hostname[':'port]'/'database</code> .
##  vtkStdString GetURL ( ) override ; *
##  Get the list of tables from the database
##  vtkStringArray * GetTables ( ) override ; *
##  Get the list of fields for a particular table
##  vtkStringArray * GetRecord ( const char * table ) override ; *
##  Return whether a feature is supported by the database.
##  bool IsSupported ( int feature ) override ; *
##  Return a list of databases on the server.
##  vtkStringArray * GetDatabases ( ) ; *
##  Create a new database, optionally dropping any existing database of the same name.
##  Returns true when the database is properly created and false on failure.
##  bool CreateDatabase ( const char * dbName , bool dropExisting = false ) ; *
##  Drop a database if it exists.
##  Returns true on success and false on failure.
##  bool DropDatabase ( const char * dbName ) ; *
##  Return the SQL string with the syntax to create a column inside a
##  "CREATE TABLE" SQL statement.
##  NB: this method implements the PostgreSQL-specific syntax:
##  \code
##  <column name> <column type> <column attributes>
##  \endcode
##  vtkStdString GetColumnSpecification ( vtkSQLDatabaseSchema * schema , int tblHandle , int colHandle ) override ; *
##  Overridden to determine connection parameters given the URL.
##  This is called by CreateFromURL() to initialize the instance.
##  Look at CreateFromURL() for details about the URL format.
##  bool ParseURL ( const char * url ) override ; protected : vtkPostgreSQLDatabase ( ) ; ~ vtkPostgreSQLDatabase ( ) override ; *
##  Create or refresh the map from Postgres column types to VTK array types.
##
##  Postgres defines a table for types so that users may define types.
##  This adaptor does not support user-defined types or even all of the
##  default types defined by Postgres (some are inherently difficult to
##  translate into VTK since Postgres allows columns to have composite types,
##  vector-valued types, and extended precision types that vtkVariant does
##  not support.
##
##  This routine examines the pg_types table to get a map from Postgres column
##  type IDs (stored as OIDs) to VTK array types. It is called whenever a new
##  database connection is initiated.
##  void UpdateDataTypeMap ( ) ; virtual void SetDatabaseType ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << DatabaseType  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> DatabaseType == nullptr && _arg == nullptr ) { return ; } if ( this -> DatabaseType && _arg && ( ! strcmp ( this -> DatabaseType , _arg ) ) ) { return ; } delete [ ] this -> DatabaseType ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> DatabaseType = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> DatabaseType = nullptr ; } this -> Modified ( ) ; } ; virtual void SetDatabaseTypeLastErrorText ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << LastErrorText  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> LastErrorText == nullptr && _arg == nullptr ) { return ; } if ( this -> LastErrorText && _arg && ( ! strcmp ( this -> LastErrorText , _arg ) ) ) { return ; } delete [ ] this -> LastErrorText ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> LastErrorText = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> LastErrorText = nullptr ; } this -> Modified ( ) ; } ; void NullTrailingWhitespace ( char * msg ) ; bool OpenInternal ( const char * connectionOptions ) ; vtkTimeStamp URLMTime ; vtkPostgreSQLDatabasePrivate * Connection ; vtkTimeStamp ConnectionMTime ; vtkStringArray * Tables ; char * DatabaseType ; char * HostName ; char * User ; char * Password ; char * DatabaseName ; int ServerPort ; char * ConnectOptions ; char * LastErrorText ; private : vtkPostgreSQLDatabase ( const vtkPostgreSQLDatabase & ) = delete ; void operator = ( const vtkPostgreSQLDatabase & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

##  This is basically the body of the SetStringMacro but with a
##  call to update an additional vtkTimeStamp. We inline the implementation
##  so that wrapping will work.

template vtkSetStringPlusMTimeMacro*(className, name, timeStamp: untyped): void =
  proc SetHostName*(_arg: cstring) {.importcpp: "VTKIOPOSTGRESQL_EXPORT::SetHostName(@)",
                                  header: "vtkPostgreSQLDatabase.h".}

## ignored statement

vtkSetStringPlusMTimeMacro(vtkPostgreSQLDatabase, User, URLMTime)
vtkSetStringPlusMTimeMacro(vtkPostgreSQLDatabase, Password, URLMTime)
vtkSetStringPlusMTimeMacro(vtkPostgreSQLDatabase, DatabaseName, URLMTime)
vtkSetStringPlusMTimeMacro(vtkPostgreSQLDatabase, ConnectOptions, URLMTime)
proc SetServerPort*(_arg: cint) {.importcpp: "VTKIOPOSTGRESQL_EXPORT::SetServerPort(@)",
                               header: "vtkPostgreSQLDatabase.h".}