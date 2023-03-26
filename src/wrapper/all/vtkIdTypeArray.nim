## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkIdTypeArray.h
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
##  @class   vtkIdTypeArray
##  @brief   dynamic, self-adjusting array of vtkIdType
##
##  vtkIdTypeArray is an array of values of type vtkIdType.
##  It provides methods for insertion and retrieval of values and will
##  automatically resize itself to hold new data.
##

## !!!Ignored construct:  # vtkIdTypeArray_h [NewLine] # vtkIdTypeArray_h [NewLine] # vtkAOSDataArrayTemplate.h  Real Superclass # vtkCommonCoreModule.h  For export macro # vtkDataArray.h [NewLine]  Fake the superclass for the wrappers. # __VTK_WRAP__ [NewLine] # vtkDataArray vtkAOSDataArrayTemplate < vtkIdType > [end of template] [NewLine] # [NewLine] class VTKCOMMONCORE_EXPORT vtkIdTypeArray : public vtkDataArray { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataArray Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataArray :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkIdTypeArray :: IsTypeOf ( type ) ; } static vtkIdTypeArray * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkIdTypeArray * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkIdTypeArray * NewInstance ( ) const { return vtkIdTypeArray :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataArray :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkIdTypeArray :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkIdTypeArray :: New ( ) ; } public : ; # __VTK_WRAP__ [NewLine] # vtkDataArray [NewLine] # [NewLine] static vtkIdTypeArray * New ( ) ; static vtkIdTypeArray * ExtendedNew ( ) ; void PrintSelf ( ostream & os , vtkIndent indent ) override ;  This macro expands to the set of method declarations that
##  make up the interface of vtkAOSDataArrayTemplate, which is ignored
##  by the wrappers. # defined ( __VTK_WRAP__ ) || defined ( __WRAP_GCCXML__ ) [NewLine] vtkCreateWrappedArrayInterface ( vtkIdType ) ; # [NewLine] *
##  Get the data type.
##  int GetDataType ( ) const override {  This needs to overwritten from superclass because
##  the templated superclass is not able to differentiate
##  vtkIdType from a long long or an int since vtkIdType
##  is simply a typedef. This means that
##  vtkAOSDataArrayTemplate<vtkIdType> != vtkIdTypeArray. return VTK_ID_TYPE ; } # [NewLine] *
##  A faster alternative to SafeDownCast for downcasting vtkAbstractArrays.
##  static vtkIdTypeArray * FastDownCast ( vtkAbstractArray * source ) { return static_cast < vtkIdTypeArray * > ( Superclass :: FastDownCast ( source ) ) ; } *
##  Get the minimum data value in its native type.
##  static vtkIdType GetDataTypeValueMin ( ) { return VTK_ID_MIN ; } *
##  Get the maximum data value in its native type.
##  static vtkIdType GetDataTypeValueMax ( ) { return VTK_ID_MAX ; } protected : vtkIdTypeArray ( ) ; ~ vtkIdTypeArray ( ) override ; private : typedef vtkAOSDataArrayTemplate < vtkIdType > RealSuperclass ; vtkIdTypeArray ( const vtkIdTypeArray & ) = delete ; void operator = ( const vtkIdTypeArray & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

##  Define vtkArrayDownCast implementation:

vtkArrayDownCast_FastCastMacro(vtkIdTypeArray)