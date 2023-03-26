## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMySQLQuery.h
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
## *
##  @class   vtkMySQLQuery
##  @brief   vtkSQLQuery implementation for MySQL databases
##
##
##
##  This is an implementation of vtkSQLQuery for MySQL databases.  See
##  the documentation for vtkSQLQuery for information about what the
##  methods do.
##
##
##  @bug
##  Since MySQL requires that all bound parameters be passed in a
##  single mysql_stmt_bind_param call, there is no way to determine
##  which one is causing an error when one occurs.
##
##
##  @sa
##  vtkSQLDatabase vtkSQLQuery vtkMySQLDatabase
##

## !!!Ignored construct:  # vtkMySQLQuery_h [NewLine] # vtkMySQLQuery_h [NewLine] # vtkIOMySQLModule.h  For export macro # vtkSQLQuery.h [NewLine] class vtkMySQLDatabase ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkVariant"
discard "forward decl of vtkVariantArray"
discard "forward decl of vtkMySQLQueryInternals"
## !!!Ignored construct:  class VTKIOMYSQL_EXPORT vtkMySQLQuery : public vtkSQLQuery { friend class vtkMySQLDatabase ; public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkSQLQuery Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkSQLQuery :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkMySQLQuery :: IsTypeOf ( type ) ; } static vtkMySQLQuery * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkMySQLQuery * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkMySQLQuery * NewInstance ( ) const { return vtkMySQLQuery :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkSQLQuery :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMySQLQuery :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMySQLQuery :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkMySQLQuery * New ( ) ; *
##  Set the SQL query string.  This must be performed before
##  Execute() or BindParameter() can be called.
##  bool SetQuery ( const char * query ) override ; *
##  Execute the query.  This must be performed
##  before any field name or data access functions
##  are used.
##  bool Execute ( ) override ; /@{ *
##  Begin, commit, or roll back a transaction.
##
##  Calling any of these methods will overwrite the current query text
##  and call Execute() so any previous query text and results will be lost.
##  bool BeginTransaction ( ) override ; bool CommitTransaction ( ) override ; bool RollbackTransaction ( ) override ; /@} *
##  The number of fields in the query result.
##  int GetNumberOfFields ( ) override ; *
##  Return the name of the specified query field.
##  const char * GetFieldName ( int i ) override ; *
##  Return the type of the field, using the constants defined in vtkType.h.
##  int GetFieldType ( int i ) override ; *
##  Advance row, return false if past end.
##  bool NextRow ( ) override ; *
##  Return true if there is an error on the current query.
##  bool HasError ( ) override ; *
##  Return data in current row, field c
##  vtkVariant DataValue ( vtkIdType c ) override ; *
##  Get the last error text from the query
##  const char * GetLastErrorText ( ) override ; *
##  The following methods bind a parameter value to a placeholder in
##  the SQL string.  See the documentation for vtkSQLQuery for
##  further explanation.  The driver makes internal copies of string
##  and BLOB parameters so you don't need to worry about keeping them
##  in scope until the query finishes executing.
##  using vtkSQLQuery :: BindParameter ; bool BindParameter ( int index , unsigned char value ) override ; bool BindParameter ( int index , signed char value ) override ; bool BindParameter ( int index , unsigned short value ) override ; bool BindParameter ( int index , signed short value ) override ; bool BindParameter ( int index , unsigned int value ) override ; bool BindParameter ( int index , int value ) override ; bool BindParameter ( int index , unsigned long value ) override ; bool BindParameter ( int index , signed long value ) override ; bool BindParameter ( int index , unsigned long long value ) override ; bool BindParameter ( int index , long long value ) override ; bool BindParameter ( int index , float value ) override ; bool BindParameter ( int index , double value ) override ; *
##  Bind a string value -- string must be null-terminated
##  bool BindParameter ( int index , const char * stringValue ) override ; /@{ *
##  Bind a string value by specifying an array and a size
##  bool BindParameter ( int index , const char * stringValue , size_t length ) override ; bool BindParameter ( int index , const vtkStdString & string ) override ; /@} /@{ *
##  Bind a blob value.  Not all databases support blobs as a data
##  type.  Check vtkSQLDatabase::IsSupported(VTK_SQL_FEATURE_BLOB) to
##  make sure.
##  bool BindParameter ( int index , const void * data , size_t length ) override ; bool ClearParameterBindings ( ) override ; /@} *
##  Escape a string for use in a query
##  vtkStdString EscapeString ( vtkStdString src , bool addSurroundingQuotes = true ) override ; protected : vtkMySQLQuery ( ) ; ~ vtkMySQLQuery ( ) override ; virtual void SetLastErrorText ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << LastErrorText  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> LastErrorText == nullptr && _arg == nullptr ) { return ; } if ( this -> LastErrorText && _arg && ( ! strcmp ( this -> LastErrorText , _arg ) ) ) { return ; } delete [ ] this -> LastErrorText ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> LastErrorText = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> LastErrorText = nullptr ; } this -> Modified ( ) ; } ; private : vtkMySQLQuery ( const vtkMySQLQuery & ) = delete ; void operator = ( const vtkMySQLQuery & ) = delete ; vtkMySQLQueryInternals * Internals ; bool InitialFetch ; char * LastErrorText ; } ;
## Error: token expected: ; but got: [identifier]!!!
