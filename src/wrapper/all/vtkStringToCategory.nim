## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkStringToCategory.h
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
##  @class   vtkStringToCategory
##  @brief   Creates a category array from a string array
##
##
##  vtkStringToCategory creates an integer array named "category" based on the
##  values in a string array.  You may use this filter to create an array that
##  you may use to color points/cells by the values in a string array.  Currently
##  there is not support to color by a string array directly.
##  The category values will range from zero to N-1,
##  where N is the number of distinct strings in the string array.  Set the string
##  array to process with SetInputArrayToProcess(0,0,0,...).  The array may be in
##  the point, cell, or field data of the data object.
##
##  The list of unique strings, in the order they are mapped, can also be
##  retrieved from output port 1. They are in a vtkTable, stored in the "Strings"
##  column as a vtkStringArray.
##

## !!!Ignored construct:  # vtkStringToCategory_h [NewLine] # vtkStringToCategory_h [NewLine] # vtkDataObjectAlgorithm.h [NewLine] # vtkInfovisCoreModule.h  For export macro [NewLine] class VTKINFOVISCORE_EXPORT vtkStringToCategory : public vtkDataObjectAlgorithm { public : static vtkStringToCategory * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataObjectAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataObjectAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkStringToCategory :: IsTypeOf ( type ) ; } static vtkStringToCategory * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkStringToCategory * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkStringToCategory * NewInstance ( ) const { return vtkStringToCategory :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataObjectAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkStringToCategory :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkStringToCategory :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  The name to give to the output vtkIntArray of category values.
##  virtual void SetCategoryArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << CategoryArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> CategoryArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> CategoryArrayName && _arg && ( ! strcmp ( this -> CategoryArrayName , _arg ) ) ) { return ; } delete [ ] this -> CategoryArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> CategoryArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> CategoryArrayName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetCategoryArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << CategoryArrayName  of  << ( this -> CategoryArrayName ? this -> CategoryArrayName : (null) ) ) ; return this -> CategoryArrayName ; } ; /@} *
##  This is required to capture REQUEST_DATA_OBJECT requests.
##  vtkTypeBool ProcessRequest ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; protected : vtkStringToCategory ( ) ; ~ vtkStringToCategory ( ) override ; *
##  Creates the same output type as the input type.
##  int RequestDataObject ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillOutputPortInformation ( int port , vtkInformation * info ) override ; char * CategoryArrayName ; private : vtkStringToCategory ( const vtkStringToCategory & ) = delete ; void operator = ( const vtkStringToCategory & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
