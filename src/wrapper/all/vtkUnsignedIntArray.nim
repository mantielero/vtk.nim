## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkUnsignedIntArray.h
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
##  @class   vtkUnsignedIntArray
##  @brief   dynamic, self-adjusting array of unsigned int
##
##  vtkUnsignedIntArray is an array of values of type unsigned int.  It
##  provides methods for insertion and retrieval of values and will
##  automatically resize itself to hold new data.
##
##  The C++ standard does not define the exact size of the unsigned int type,
##  so use of this type directly is discouraged.  If an array of 32 bit unsigned
##  integers is needed, prefer vtkTypeUInt32Array to this class.
##

## !!!Ignored construct:  # vtkUnsignedIntArray_h [NewLine] # vtkUnsignedIntArray_h [NewLine] # vtkAOSDataArrayTemplate.h  Real Superclass # vtkCommonCoreModule.h  For export macro # vtkDataArray.h [NewLine]  Fake the superclass for the wrappers. # __VTK_WRAP__ [NewLine] # vtkDataArray vtkAOSDataArrayTemplate < unsigned int > [end of template] [NewLine] # [NewLine] class VTKCOMMONCORE_EXPORT vtkUnsignedIntArray : public vtkDataArray { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataArray Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataArray :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkUnsignedIntArray :: IsTypeOf ( type ) ; } static vtkUnsignedIntArray * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkUnsignedIntArray * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkUnsignedIntArray * NewInstance ( ) const { return vtkUnsignedIntArray :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataArray :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkUnsignedIntArray :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkUnsignedIntArray :: New ( ) ; } public : ; # __VTK_WRAP__ [NewLine] # vtkDataArray [NewLine] # [NewLine] static vtkUnsignedIntArray * New ( ) ; static vtkUnsignedIntArray * ExtendedNew ( ) ; void PrintSelf ( ostream & os , vtkIndent indent ) override ;  This macro expands to the set of method declarations that
##  make up the interface of vtkAOSDataArrayTemplate, which is ignored
##  by the wrappers. # defined ( __VTK_WRAP__ ) || defined ( __WRAP_GCCXML__ ) [NewLine] vtkCreateWrappedArrayInterface ( unsigned int ) ; # [NewLine] *
##  A faster alternative to SafeDownCast for downcasting vtkAbstractArrays.
##  static vtkUnsignedIntArray * FastDownCast ( vtkAbstractArray * source ) { return static_cast < vtkUnsignedIntArray * > ( Superclass :: FastDownCast ( source ) ) ; } *
##  Get the minimum data value in its native type.
##  static unsigned int GetDataTypeValueMin ( ) { return VTK_UNSIGNED_INT_MIN ; } *
##  Get the maximum data value in its native type.
##  static unsigned int GetDataTypeValueMax ( ) { return VTK_UNSIGNED_INT_MAX ; } protected : vtkUnsignedIntArray ( ) ; ~ vtkUnsignedIntArray ( ) override ; private : typedef vtkAOSDataArrayTemplate < unsigned int > RealSuperclass ; vtkUnsignedIntArray ( const vtkUnsignedIntArray & ) = delete ; void operator = ( const vtkUnsignedIntArray & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

##  Define vtkArrayDownCast implementation:

vtkArrayDownCast_FastCastMacro(vtkUnsignedIntArray)