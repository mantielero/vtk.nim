## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAddMembershipArray.h
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
##  @class   vtkAddMembershipArray
##  @brief   Add an array to the output indicating
##  membership within an input selection.
##
##
##  This filter takes an input selection, vtkDataSetAttribute
##  information, and data object and adds a bit array to the output
##  vtkDataSetAttributes indicating whether each index was selected or not.
##

## !!!Ignored construct:  # vtkAddMembershipArray_h [NewLine] # vtkAddMembershipArray_h [NewLine] # vtkInfovisCoreModule.h  For export macro # vtkPassInputTypeAlgorithm.h [NewLine] class vtkAbstractArray ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKINFOVISCORE_EXPORT vtkAddMembershipArray : public vtkPassInputTypeAlgorithm { public : static vtkAddMembershipArray * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPassInputTypeAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPassInputTypeAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkAddMembershipArray :: IsTypeOf ( type ) ; } static vtkAddMembershipArray * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkAddMembershipArray * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkAddMembershipArray * NewInstance ( ) const { return vtkAddMembershipArray :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPassInputTypeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAddMembershipArray :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAddMembershipArray :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; enum { FIELD_DATA = 0 , POINT_DATA = 1 , CELL_DATA = 2 , VERTEX_DATA = 3 , EDGE_DATA = 4 , ROW_DATA = 5 } ; /@{ *
##  The field type to add the membership array to.
##  virtual int GetFieldType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FieldType  of  << this -> FieldType ) ; return this -> FieldType ; } ; virtual void SetFieldType ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FieldType  to  << _arg ) ; if ( this -> FieldType != ( _arg < 0 ? 0 : ( _arg > 5 ? 5 : _arg ) ) ) { this -> FieldType = ( _arg < 0 ? 0 : ( _arg > 5 ? 5 : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetFieldTypeMinValue ( ) { return 0 ; } virtual int GetFieldTypeMaxValue ( ) { return 5 ; } ; /@} /@{ *
##  The name of the array added to the output vtkDataSetAttributes
##  indicating membership. Defaults to "membership".
##  virtual void SetOutputArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << OutputArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> OutputArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> OutputArrayName && _arg && ( ! strcmp ( this -> OutputArrayName , _arg ) ) ) { return ; } delete [ ] this -> OutputArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> OutputArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> OutputArrayName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetOutputArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << OutputArrayName  of  << ( this -> OutputArrayName ? this -> OutputArrayName : (null) ) ) ; return this -> OutputArrayName ; } ; /@} virtual void SetOutputArrayNameInputArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << InputArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> InputArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> InputArrayName && _arg && ( ! strcmp ( this -> InputArrayName , _arg ) ) ) { return ; } delete [ ] this -> InputArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> InputArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> InputArrayName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetOutputArrayNameInputArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << InputArrayName  of  << ( this -> InputArrayName ? this -> InputArrayName : (null) ) ) ; return this -> InputArrayName ; } ; void SetInputValues ( vtkAbstractArray * ) ; virtual vtkAbstractArray * GetnameInputValues ( ) { vtkDebugWithObjectMacro ( this , <<  returning  InputValues  address  << static_cast < vtkAbstractArray * > ( this -> InputValues ) ) ; return this -> InputValues ; } ; protected : vtkAddMembershipArray ( ) ; ~ vtkAddMembershipArray ( ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FieldType ; char * OutputArrayName ; char * InputArrayName ; vtkAbstractArray * InputValues ; private : vtkAddMembershipArray ( const vtkAddMembershipArray & ) = delete ; void operator = ( const vtkAddMembershipArray & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
