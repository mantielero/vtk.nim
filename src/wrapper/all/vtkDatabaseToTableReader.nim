## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDatabaseToTableReader.h
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
##  @class   vtkDatabaseToTableReader
##  @brief   Read an SQL table as a vtkTable
##
##  vtkDatabaseToTableReader reads a table from an SQL database, outputting
##  it as a vtkTable.
##

## !!!Ignored construct:  # vtkDatabaseToTableReader_h [NewLine] # vtkDatabaseToTableReader_h [NewLine] # vtkIOSQLModule.h  For export macro # vtkTableAlgorithm.h [NewLine] # < string >  STL Header [NewLine] class vtkSQLDatabase ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkStringArray"
## !!!Ignored construct:  class VTKIOSQL_EXPORT vtkDatabaseToTableReader : public vtkTableAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkTableAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkTableAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkDatabaseToTableReader :: IsTypeOf ( type ) ; } static vtkDatabaseToTableReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkDatabaseToTableReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkDatabaseToTableReader * NewInstance ( ) const { return vtkDatabaseToTableReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTableAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDatabaseToTableReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDatabaseToTableReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Set the database associated with this reader
##  bool SetDatabase ( vtkSQLDatabase * db ) ; *
##  Set the name of the table that you'd like to convert to a vtkTable
##  Returns false if the specified table does not exist in the database.
##  bool SetTableName ( const char * name ) ; *
##  Check if the currently specified table name exists in the database.
##  bool CheckIfTableExists ( ) ; vtkSQLDatabase * GetDatabase ( ) { return this -> Database ; } protected : vtkDatabaseToTableReader ( ) ; ~ vtkDatabaseToTableReader ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override = 0 ; vtkSQLDatabase * Database ; std :: string TableName ; private : vtkDatabaseToTableReader ( const vtkDatabaseToTableReader & ) = delete ; void operator = ( const vtkDatabaseToTableReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
