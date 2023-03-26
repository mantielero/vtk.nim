## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRowQueryToTable.h
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
##  @class   vtkRowQueryToTable
##  @brief   executes an sql query and retrieves results into a table
##
##
##  vtkRowQueryToTable creates a vtkTable with the results of an arbitrary SQL
##  query.  To use this filter, you first need an instance of a vtkSQLDatabase
##  subclass.  You may use the database class to obtain a vtkRowQuery instance.
##  Set that query on this filter to extract the query as a table.
##
##  @par Thanks:
##  Thanks to Andrew Wilson from Sandia National Laboratories for his work
##  on the database classes.
##
##  @sa
##  vtkSQLDatabase vtkRowQuery
##

## !!!Ignored construct:  # vtkRowQueryToTable_h [NewLine] # vtkRowQueryToTable_h [NewLine] # vtkIOSQLModule.h  For export macro # vtkTableAlgorithm.h [NewLine] class vtkRowQuery ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIOSQL_EXPORT vtkRowQueryToTable : public vtkTableAlgorithm { public : static vtkRowQueryToTable * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkTableAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkTableAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkRowQueryToTable :: IsTypeOf ( type ) ; } static vtkRowQueryToTable * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkRowQueryToTable * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkRowQueryToTable * NewInstance ( ) const { return vtkRowQueryToTable :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTableAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRowQueryToTable :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRowQueryToTable :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  The query to execute.
##  void SetQuery ( vtkRowQuery * query ) ; virtual vtkRowQuery * GetnameQuery ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Query  address  << static_cast < vtkRowQuery * > ( this -> Query ) ) ; return this -> Query ; } ; /@} *
##  Update the modified time based on the query.
##  vtkMTimeType GetMTime ( ) override ; protected : vtkRowQueryToTable ( ) ; ~ vtkRowQueryToTable ( ) override ; vtkRowQuery * Query ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkRowQueryToTable ( const vtkRowQueryToTable & ) = delete ; void operator = ( const vtkRowQueryToTable & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
