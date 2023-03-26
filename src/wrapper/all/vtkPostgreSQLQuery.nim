## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPostgreSQLQuery.h
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
##  @class   vtkPostgreSQLQuery
##  @brief   vtkSQLQuery implementation for PostgreSQL databases
##
##
##
##  This is an implementation of vtkSQLQuery for PostgreSQL databases.  See
##  the documentation for vtkSQLQuery for information about what the
##  methods do.
##
##
##  @par Thanks:
##  Thanks to David Thompson and Andy Wilson from Sandia National
##  Laboratories for implementing this class.
##
##  @sa
##  vtkSQLDatabase vtkSQLQuery vtkPostgreSQLDatabase
##

## !!!Ignored construct:  # vtkPostgreSQLQuery_h [NewLine] # vtkPostgreSQLQuery_h [NewLine] # vtkIOPostgreSQLModule.h  For export macro # vtkSQLQuery.h [NewLine] class vtkPostgreSQLDatabase ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkVariant"
discard "forward decl of vtkVariantArray"
discard "forward decl of vtkPostgreSQLQueryPrivate"
## !!!Ignored construct:  class VTKIOPOSTGRESQL_EXPORT vtkPostgreSQLQuery : public vtkSQLQuery { public : static vtkPostgreSQLQuery * New ( ) ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkSQLQuery Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkSQLQuery :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPostgreSQLQuery :: IsTypeOf ( type ) ; } static vtkPostgreSQLQuery * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPostgreSQLQuery * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPostgreSQLQuery * NewInstance ( ) const { return vtkPostgreSQLQuery :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkSQLQuery :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPostgreSQLQuery :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPostgreSQLQuery :: New ( ) ; } public : ; *
##  Execute the query.  This must be performed
##  before any field name or data access functions
##  are used.
##  bool Execute ( ) override ; *
##  The number of fields in the query result.
##  int GetNumberOfFields ( ) override ; *
##  Return the name of the specified query field.
##  const char * GetFieldName ( int i ) override ; *
##  Return the type of the field, using the constants defined in vtkType.h.
##  int GetFieldType ( int i ) override ; *
##  Advance row, return false if past end.
##  bool NextRow ( ) override ; *
##  Return true if there is an error on the current query.
##  bool HasError ( ) override ; /@{ *
##  Begin, abort (roll back), or commit a transaction.
##  bool BeginTransaction ( ) override ; bool RollbackTransaction ( ) override ; bool CommitTransaction ( ) override ; /@} *
##  Return data in current row, field c
##  vtkVariant DataValue ( vtkIdType c ) override ; *
##  Get the last error text from the query
##  const char * GetLastErrorText ( ) override ; *
##  Escape a string for inclusion into an SQL query
##  vtkStdString EscapeString ( vtkStdString s , bool addSurroundingQuotes = true ) override ; *
##  Unlike some databases, Postgres can tell you right away how many
##  rows are in the results of your query.
##  int GetNumberOfRows ( ) ; protected : vtkPostgreSQLQuery ( ) ; ~ vtkPostgreSQLQuery ( ) override ; virtual void SetLastErrorText ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << LastErrorText  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> LastErrorText == nullptr && _arg == nullptr ) { return ; } if ( this -> LastErrorText && _arg && ( ! strcmp ( this -> LastErrorText , _arg ) ) ) { return ; } delete [ ] this -> LastErrorText ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> LastErrorText = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> LastErrorText = nullptr ; } this -> Modified ( ) ; } ; bool IsColumnBinary ( int whichColumn ) ; const char * GetColumnRawData ( int whichColumn ) ; bool TransactionInProgress ; char * LastErrorText ; int CurrentRow ; vtkPostgreSQLQueryPrivate * QueryInternals ; void DeleteQueryResults ( ) ; friend class vtkPostgreSQLDatabase ; private : vtkPostgreSQLQuery ( const vtkPostgreSQLQuery & ) = delete ; void operator = ( const vtkPostgreSQLQuery & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
