## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTableToPostgreSQLWriter.h
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
##  @class   vtkTableToPostgreSQLWriter
##  @brief   store a vtkTable in a PostgreSQL database
##
##  vtkTableToPostgreSQLWriter reads a vtkTable and inserts it into a PostgreSQL
##  database.
##

## !!!Ignored construct:  # vtkTableToPostgreSQLWriter_h [NewLine] # vtkTableToPostgreSQLWriter_h [NewLine] # vtkIOPostgreSQLModule.h  For export macro # vtkTableToDatabaseWriter.h [NewLine] class vtkPostgreSQLDatabase ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIOPOSTGRESQL_EXPORT vtkTableToPostgreSQLWriter : public vtkTableToDatabaseWriter { public : static vtkTableToPostgreSQLWriter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkTableToDatabaseWriter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkTableToDatabaseWriter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkTableToPostgreSQLWriter :: IsTypeOf ( type ) ; } static vtkTableToPostgreSQLWriter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkTableToPostgreSQLWriter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkTableToPostgreSQLWriter * NewInstance ( ) const { return vtkTableToPostgreSQLWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTableToDatabaseWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTableToPostgreSQLWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTableToPostgreSQLWriter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get the input to this writer.
##  vtkTable * GetInput ( ) ; vtkTable * GetInput ( int port ) ; /@} protected : vtkTableToPostgreSQLWriter ( ) ; ~ vtkTableToPostgreSQLWriter ( ) override ; void WriteData ( ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; private : vtkTableToPostgreSQLWriter ( const vtkTableToPostgreSQLWriter & ) = delete ; void operator = ( const vtkTableToPostgreSQLWriter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
