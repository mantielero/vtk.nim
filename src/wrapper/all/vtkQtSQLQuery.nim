## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkQtSQLQuery.h
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
##  @class   vtkQtSQLQuery
##  @brief   query class associated with vtkQtSQLDatabase
##
##
##  Implements vtkSQLQuery using an underlying QSQLQuery.
##

## !!!Ignored construct:  # vtkQtSQLQuery_h [NewLine] # vtkQtSQLQuery_h [NewLine] # vtkGUISupportQtSQLModule.h  For export macro # vtkSQLQuery.h [NewLine] class vtkVariant ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkQtSQLQueryInternals"
## !!!Ignored construct:  class VTKGUISUPPORTQTSQL_EXPORT vtkQtSQLQuery : public vtkSQLQuery { public : static vtkQtSQLQuery * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkSQLQuery Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkSQLQuery :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkQtSQLQuery :: IsTypeOf ( type ) ; } static vtkQtSQLQuery * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkQtSQLQuery * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkQtSQLQuery * NewInstance ( ) const { return vtkQtSQLQuery :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkSQLQuery :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkQtSQLQuery :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkQtSQLQuery :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Execute the query.  This must be performed
##  before any field name or data access functions
##  are used.
##  bool Execute ( ) override ; *
##  The number of fields in the query result.
##  int GetNumberOfFields ( ) override ; *
##  Return the name of the specified query field.
##  const char * GetFieldName ( int col ) override ; *
##  Return the type of the specified query field, as defined in vtkType.h.
##  int GetFieldType ( int col ) override ; *
##  Advance row, return false if past end.
##  bool NextRow ( ) override ; *
##  Return data in current row, field c
##  vtkVariant DataValue ( vtkIdType c ) override ; *
##  Returns true if an error is set, otherwise false.
##  bool HasError ( ) override ; *
##  Get the last error text from the query
##  const char * GetLastErrorText ( ) override ; protected : vtkQtSQLQuery ( ) ; ~ vtkQtSQLQuery ( ) override ; vtkQtSQLQueryInternals * Internals ; friend class vtkQtSQLDatabase ; private :  Using the convenience function internally virtual void SetLastErrorText ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << LastErrorText  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> LastErrorText == nullptr && _arg == nullptr ) { return ; } if ( this -> LastErrorText && _arg && ( ! strcmp ( this -> LastErrorText , _arg ) ) ) { return ; } delete [ ] this -> LastErrorText ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> LastErrorText = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> LastErrorText = nullptr ; } this -> Modified ( ) ; } ; char * LastErrorText ; vtkQtSQLQuery ( const vtkQtSQLQuery & ) = delete ; void operator = ( const vtkQtSQLQuery & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
