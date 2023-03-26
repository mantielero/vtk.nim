## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSQLiteToTableReader.h
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
##  @class   vtkSQLiteToTableReader
##  @brief   Read an SQLite table as a vtkTable
##
##  vtkSQLiteToTableReader reads a table from an SQLite database and
##  outputs it as a vtkTable.
##

## !!!Ignored construct:  # vtkSQLiteToTableReader_h [NewLine] # vtkSQLiteToTableReader_h [NewLine] # vtkDatabaseToTableReader.h [NewLine] # vtkIOSQLModule.h  For export macro [NewLine] class vtkSQLiteDatabase ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIOSQL_EXPORT vtkSQLiteToTableReader : public vtkDatabaseToTableReader { public : static vtkSQLiteToTableReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDatabaseToTableReader Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDatabaseToTableReader :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkSQLiteToTableReader :: IsTypeOf ( type ) ; } static vtkSQLiteToTableReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkSQLiteToTableReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkSQLiteToTableReader * NewInstance ( ) const { return vtkSQLiteToTableReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDatabaseToTableReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSQLiteToTableReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSQLiteToTableReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : vtkSQLiteToTableReader ( ) ; ~ vtkSQLiteToTableReader ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkSQLiteToTableReader ( const vtkSQLiteToTableReader & ) = delete ; void operator = ( const vtkSQLiteToTableReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
