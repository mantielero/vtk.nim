## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkQtSQLDatabase.h
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
##  @class   vtkQtSQLDatabase
##  @brief   maintains a connection to an sql database
##
##
##  Implements a vtkSQLDatabase using an underlying Qt QSQLDatabase.
##

## !!!Ignored construct:  # vtkQtSQLDatabase_h [NewLine] # vtkQtSQLDatabase_h [NewLine] # vtkDeprecation.h  For deprecation macros # vtkGUISupportQtSQLModule.h  For export macro # vtkSQLDatabase.h [NewLine] # < QtSql / QSqlDatabase >  For the database member [NewLine] class vtkSQLQuery ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkStringArray"
## !!!Ignored construct:  class VTKGUISUPPORTQTSQL_EXPORT vtkQtSQLDatabase : public vtkSQLDatabase { public : static vtkQtSQLDatabase * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkSQLDatabase Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkSQLDatabase :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkQtSQLDatabase :: IsTypeOf ( type ) ; } static vtkQtSQLDatabase * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkQtSQLDatabase * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkQtSQLDatabase * NewInstance ( ) const { return vtkQtSQLDatabase :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkSQLDatabase :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkQtSQLDatabase :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkQtSQLDatabase :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Open a new connection to the database.
##  You need to set up any database parameters before calling this function.
##  Returns true is the database was opened successfully, and false otherwise.
##  bool Open ( const char * password ) override ; *
##  Close the connection to the database.
##  void Close ( ) override ; *
##  Return whether the database has an open connection
##  bool IsOpen ( ) override ; *
##  Return an empty query on this database.
##  vtkSQLQuery * GetQueryInstance ( ) override ; *
##  Get the list of tables from the database
##  vtkStringArray * GetTables ( ) override ; *
##  Get the list of fields for a particular table
##  vtkStringArray * GetRecord ( const char * table ) override ; *
##  Returns a list of columns for a particular table.
##  Note that this is mainly for use with the VTK parallel server.
##  Serial VTK developers should prefer to use GetRecord() instead.
##  vtkStringArray * GetColumns ( ) ; *
##  Set the table used by GetColumns()
##  Note that this is mainly for use with the VTK parallel server.
##  Serial VTK developers should prefer to use GetRecord() instead.
##  void SetColumnsTable ( const char * table ) ; *
##  Return whether a feature is supported by the database.
##  bool IsSupported ( int feature ) override ; *
##  Did the last operation generate an error
##  bool HasError ( ) override ; *
##  Get the last error text from the database
##  const char * GetLastErrorText ( ) override ; /@{ *
##  String representing Qt database type (e.g. "mysql").
##  const char * GetDatabaseType ( ) override { return this -> DatabaseType ; } virtual void SetDatabaseType ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << DatabaseType  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> DatabaseType == nullptr && _arg == nullptr ) { return ; } if ( this -> DatabaseType && _arg && ( ! strcmp ( this -> DatabaseType , _arg ) ) ) { return ; } delete [ ] this -> DatabaseType ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> DatabaseType = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> DatabaseType = nullptr ; } this -> Modified ( ) ; } ; /@} /@{ *
##  The database server host name.
##  virtual void SetDatabaseTypeHostName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << HostName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> HostName == nullptr && _arg == nullptr ) { return ; } if ( this -> HostName && _arg && ( ! strcmp ( this -> HostName , _arg ) ) ) { return ; } delete [ ] this -> HostName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> HostName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> HostName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetHostName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << HostName  of  << ( this -> HostName ? this -> HostName : (null) ) ) ; return this -> HostName ; } ; /@} /@{ *
##  The user name for connecting to the database server.
##  virtual void SetDatabaseTypeHostNameUserName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << UserName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> UserName == nullptr && _arg == nullptr ) { return ; } if ( this -> UserName && _arg && ( ! strcmp ( this -> UserName , _arg ) ) ) { return ; } delete [ ] this -> UserName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> UserName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> UserName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetHostNameUserName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << UserName  of  << ( this -> UserName ? this -> UserName : (null) ) ) ; return this -> UserName ; } ; /@} /@{ *
##  The name of the database to connect to.
##  virtual void SetDatabaseTypeHostNameUserNameDatabaseName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << DatabaseName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> DatabaseName == nullptr && _arg == nullptr ) { return ; } if ( this -> DatabaseName && _arg && ( ! strcmp ( this -> DatabaseName , _arg ) ) ) { return ; } delete [ ] this -> DatabaseName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> DatabaseName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> DatabaseName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetHostNameUserNameDatabaseName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << DatabaseName  of  << ( this -> DatabaseName ? this -> DatabaseName : (null) ) ) ; return this -> DatabaseName ; } ; /@} /@{ *
##  Additional options for the database.
##  virtual void SetDatabaseTypeHostNameUserNameDatabaseNameConnectOptions ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ConnectOptions  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> ConnectOptions == nullptr && _arg == nullptr ) { return ; } if ( this -> ConnectOptions && _arg && ( ! strcmp ( this -> ConnectOptions , _arg ) ) ) { return ; } delete [ ] this -> ConnectOptions ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> ConnectOptions = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> ConnectOptions = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetHostNameUserNameDatabaseNameConnectOptions ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << ConnectOptions  of  << ( this -> ConnectOptions ? this -> ConnectOptions : (null) ) ) ; return this -> ConnectOptions ; } ; /@}  VTK_DEPRECATED_IN_9_1_0: Remove header test exclusion when this is removed.
## /@{ VTK_DEPRECATED_IN_9_1_0 ( Renamed to DbPort to avoid Windows macro collisions ) void SetPort ( int port ) { this -> SetDbPort ( port ) ; } VTK_DEPRECATED_IN_9_1_0 ( Renamed to DbPort to avoid Windows macro collisions ) int GetPort ( ) { return this -> GetDbPort ( ) ; } /@} /@{ *
##  The port used for connecting to the database.
##  virtual void SetDbPort ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << DbPort  to  << _arg ) ; if ( this -> DbPort != ( _arg < 0 ? 0 : ( _arg > 65535 ? 65535 : _arg ) ) ) { this -> DbPort = ( _arg < 0 ? 0 : ( _arg > 65535 ? 65535 : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetDbPortMinValue ( ) { return 0 ; } virtual int GetDbPortMaxValue ( ) { return 65535 ; } ; virtual int GetDbPort ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DbPort  of  << this -> DbPort ) ; return this -> DbPort ; } ; /@} *
##  Create a the proper subclass given a URL.
##  The URL format for SQL databases is a true URL of the form:
##  'protocol://'[[username[':'password]'@']hostname[':'port]]'/'[dbname] .
##  static vtkSQLDatabase * CreateFromURL ( const char * URL ) ; *
##  Get the URL of the database.
##  vtkStdString GetURL ( ) override ; protected : vtkQtSQLDatabase ( ) ; ~ vtkQtSQLDatabase ( ) override ; char * DatabaseType ; char * HostName ; char * UserName ; char * DatabaseName ; int DbPort ; char * ConnectOptions ; QSqlDatabase QtDatabase ; friend class vtkQtSQLQuery ; *
##  Overridden to determine connection parameters given the URL.
##  This is called by CreateFromURL() to initialize the instance.
##  Look at CreateFromURL() for details about the URL format.
##  bool ParseURL ( const char * url ) override ; private :  Storing the tables in the database, this array
##  is accessible through GetTables() method vtkStringArray * myTables ;  Storing the correct record list from any one
##  of the tables in the database, this array is
##  accessible through GetRecord(const char *table) vtkStringArray * currentRecord ;  Used to assign unique identifiers for database instances static int id ; vtkQtSQLDatabase ( const vtkQtSQLDatabase & ) = delete ; void operator = ( const vtkQtSQLDatabase & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
