## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkUnsignedShortArray.h
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
##  @class   vtkUnsignedShortArray
##  @brief   dynamic, self-adjusting array of unsigned short
##
##  vtkUnsignedShortArray is an array of values of type unsigned short.
##  It provides methods for insertion and retrieval of values and will
##  automatically resize itself to hold new data.
##
##  The C++ standard does not define the exact size of the unsigned short type,
##  so use of this type directly is discouraged.  If an array of 16 bit
##  unsigned integers is needed, prefer vtkTypeUInt16Array to this class.
##

## !!!Ignored construct:  # vtkUnsignedShortArray_h [NewLine] # vtkUnsignedShortArray_h [NewLine] # vtkAOSDataArrayTemplate.h  Real Superclass # vtkCommonCoreModule.h  For export macro # vtkDataArray.h [NewLine]  Fake the superclass for the wrappers. # __VTK_WRAP__ [NewLine] # vtkDataArray vtkAOSDataArrayTemplate < unsigned short > [end of template] [NewLine] # [NewLine] class VTKCOMMONCORE_EXPORT vtkUnsignedShortArray : public vtkDataArray { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataArray Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataArray :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkUnsignedShortArray :: IsTypeOf ( type ) ; } static vtkUnsignedShortArray * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkUnsignedShortArray * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkUnsignedShortArray * NewInstance ( ) const { return vtkUnsignedShortArray :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataArray :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkUnsignedShortArray :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkUnsignedShortArray :: New ( ) ; } public : ; # __VTK_WRAP__ [NewLine] # vtkDataArray [NewLine] # [NewLine] static vtkUnsignedShortArray * New ( ) ; static vtkUnsignedShortArray * ExtendedNew ( ) ; void PrintSelf ( ostream & os , vtkIndent indent ) override ;  This macro expands to the set of method declarations that
##  make up the interface of vtkAOSDataArrayTemplate, which is ignored
##  by the wrappers. # defined ( __VTK_WRAP__ ) || defined ( __WRAP_GCCXML__ ) [NewLine] vtkCreateWrappedArrayInterface ( unsigned short ) ; # [NewLine] *
##  A faster alternative to SafeDownCast for downcasting vtkAbstractArrays.
##  static vtkUnsignedShortArray * FastDownCast ( vtkAbstractArray * source ) { return static_cast < vtkUnsignedShortArray * > ( Superclass :: FastDownCast ( source ) ) ; } *
##  Get the minimum data value in its native type.
##  static unsigned short GetDataTypeValueMin ( ) { return VTK_UNSIGNED_SHORT_MIN ; } *
##  Get the maximum data value in its native type.
##  static unsigned short GetDataTypeValueMax ( ) { return VTK_UNSIGNED_SHORT_MAX ; } protected : vtkUnsignedShortArray ( ) ; ~ vtkUnsignedShortArray ( ) override ; private : typedef vtkAOSDataArrayTemplate < unsigned short > RealSuperclass ; vtkUnsignedShortArray ( const vtkUnsignedShortArray & ) = delete ; void operator = ( const vtkUnsignedShortArray & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

##  Define vtkArrayDownCast implementation:

vtkArrayDownCast_FastCastMacro(vtkUnsignedShortArray)