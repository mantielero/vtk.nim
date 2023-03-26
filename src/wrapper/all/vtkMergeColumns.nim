## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMergeColumns.h
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
##  @class   vtkMergeColumns
##  @brief   merge two columns into a single column
##
##
##  vtkMergeColumns replaces two columns in a table with a single column
##  containing data in both columns.  The columns are set using
##
##    SetInputArrayToProcess(0, 0, 0, vtkDataObject::FIELD_ASSOCIATION_ROWS, "col1")
##
##  and
##
##    SetInputArrayToProcess(1, 0, 0, vtkDataObject::FIELD_ASSOCIATION_ROWS, "col2")
##
##  where "col1" and "col2" are the names of the columns to merge.
##  The user may also specify the name of the merged column.
##  The arrays must be of the same type.
##  If the arrays are numeric, the values are summed in the merged column.
##  If the arrays are strings, the values are concatenated.  The strings are
##  separated by a space if they are both nonempty.
##

## !!!Ignored construct:  # vtkMergeColumns_h [NewLine] # vtkMergeColumns_h [NewLine] # vtkInfovisCoreModule.h  For export macro # vtkTableAlgorithm.h [NewLine] class VTKINFOVISCORE_EXPORT vtkMergeColumns : public vtkTableAlgorithm { public : static vtkMergeColumns * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkTableAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkTableAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkMergeColumns :: IsTypeOf ( type ) ; } static vtkMergeColumns * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkMergeColumns * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkMergeColumns * NewInstance ( ) const { return vtkMergeColumns :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTableAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMergeColumns :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMergeColumns :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  The name to give the merged column created by this filter.
##  virtual void SetMergedColumnName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << MergedColumnName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> MergedColumnName == nullptr && _arg == nullptr ) { return ; } if ( this -> MergedColumnName && _arg && ( ! strcmp ( this -> MergedColumnName , _arg ) ) ) { return ; } delete [ ] this -> MergedColumnName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> MergedColumnName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> MergedColumnName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetMergedColumnName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << MergedColumnName  of  << ( this -> MergedColumnName ? this -> MergedColumnName : (null) ) ) ; return this -> MergedColumnName ; } ; /@} protected : vtkMergeColumns ( ) ; ~ vtkMergeColumns ( ) override ; char * MergedColumnName ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkMergeColumns ( const vtkMergeColumns & ) = delete ; void operator = ( const vtkMergeColumns & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
