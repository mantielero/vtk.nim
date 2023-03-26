## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTableToDatabaseWriter.h
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
##  @class   vtkTableToDatabaseWriter
##  in a SQL database.
##
##  vtkTableToDatabaseWriter abstract parent class that reads a vtkTable and
##  inserts it into an SQL database.
##

## !!!Ignored construct:  # vtkTableToDatabaseWriter_h [NewLine] # vtkTableToDatabaseWriter_h [NewLine] # vtkIOSQLModule.h  For export macro # vtkWriter.h [NewLine] # < string >  STL Header [NewLine] class vtkSQLDatabase ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkStringArray"
discard "forward decl of vtkTable"
## !!!Ignored construct:  class VTKIOSQL_EXPORT vtkTableToDatabaseWriter : public vtkWriter { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkWriter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkWriter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkTableToDatabaseWriter :: IsTypeOf ( type ) ; } static vtkTableToDatabaseWriter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkTableToDatabaseWriter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkTableToDatabaseWriter * NewInstance ( ) const { return vtkTableToDatabaseWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTableToDatabaseWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTableToDatabaseWriter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Set the database.  Must already be open.
##  bool SetDatabase ( vtkSQLDatabase * db ) ; *
##  Set the name of the new SQL table that you'd this writer to create.
##  Returns false if the specified table already exists in the database.
##  bool SetTableName ( const char * name ) ; *
##  Check if the currently specified table name exists in the database.
##  bool TableNameIsNew ( ) ; vtkSQLDatabase * GetDatabase ( ) { return this -> Database ; } /@{ *
##  Get the input to this writer.
##  vtkTable * GetInput ( ) ; vtkTable * GetInput ( int port ) ; /@} protected : vtkTableToDatabaseWriter ( ) ; ~ vtkTableToDatabaseWriter ( ) override ; void WriteData ( ) override = 0 ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; vtkSQLDatabase * Database ; vtkTable * Input ; std :: string TableName ; private : vtkTableToDatabaseWriter ( const vtkTableToDatabaseWriter & ) = delete ; void operator = ( const vtkTableToDatabaseWriter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
