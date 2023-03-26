## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCharArray.h
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
##  @class   vtkCharArray
##  @brief   dynamic, self-adjusting array of char
##
##  vtkCharArray is an array of values of type char.  It provides
##  methods for insertion and retrieval of values and will
##  automatically resize itself to hold new data.
##
##  @warning
##  This class should be avoided in favor of either
##  vtkSignedCharArray or vtkUnsignedCharArray. On some systems
##  the underlying data will be stored as unsigned chars and others
##  it will be stored as signed chars. Additionally, saving this
##  array out and then reading it back in it could be transformed to
##  a vtkSignedCharArray or vtkUnsignedCharArray and if that happens
##  the result of a vtkCharArray::SafeDownCast() of that pointer will be
##  a null pointer.
##
##  @sa
##  vtkSignedCharArray vtkUnsignedCharArray
##

## !!!Ignored construct:  # vtkCharArray_h [NewLine] # vtkCharArray_h [NewLine] # vtkAOSDataArrayTemplate.h  Real Superclass # vtkCommonCoreModule.h  For export macro # vtkDataArray.h [NewLine]  Fake the superclass for the wrappers. # __VTK_WRAP__ [NewLine] # vtkDataArray vtkAOSDataArrayTemplate < char > [end of template] [NewLine] # [NewLine] class VTKCOMMONCORE_EXPORT vtkCharArray : public vtkDataArray { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataArray Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataArray :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkCharArray :: IsTypeOf ( type ) ; } static vtkCharArray * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkCharArray * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkCharArray * NewInstance ( ) const { return vtkCharArray :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataArray :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCharArray :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCharArray :: New ( ) ; } public : ; # __VTK_WRAP__ [NewLine] # vtkDataArray [NewLine] # [NewLine] static vtkCharArray * New ( ) ; static vtkCharArray * ExtendedNew ( ) ; void PrintSelf ( ostream & os , vtkIndent indent ) override ;  This macro expands to the set of method declarations that
##  make up the interface of vtkAOSDataArrayTemplate, which is ignored
##  by the wrappers. # defined ( __VTK_WRAP__ ) || defined ( __WRAP_GCCXML__ ) [NewLine] vtkCreateWrappedArrayInterface ( char ) ; # [NewLine] *
##  A faster alternative to SafeDownCast for downcasting vtkAbstractArrays.
##  static vtkCharArray * FastDownCast ( vtkAbstractArray * source ) { return static_cast < vtkCharArray * > ( Superclass :: FastDownCast ( source ) ) ; } *
##  Get the minimum data value in its native type.
##  static char GetDataTypeValueMin ( ) { return VTK_CHAR_MIN ; } *
##  Get the maximum data value in its native type.
##  static char GetDataTypeValueMax ( ) { return VTK_CHAR_MAX ; } protected : vtkCharArray ( ) ; ~ vtkCharArray ( ) override ; private : typedef vtkAOSDataArrayTemplate < char > RealSuperclass ; vtkCharArray ( const vtkCharArray & ) = delete ; void operator = ( const vtkCharArray & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

##  Define vtkArrayDownCast implementation:

vtkArrayDownCast_FastCastMacro(vtkCharArray)