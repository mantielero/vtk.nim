## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkShortArray.h
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
##  @class   vtkShortArray
##  @brief   dynamic, self-adjusting array of short
##
##  vtkShortArray is an array of values of type short.  It provides
##  methods for insertion and retrieval of values and will
##  automatically resize itself to hold new data.
##
##  The C++ standard does not define the exact size of the short type,
##  so use of this type directly is discouraged.  If an array of 16 bit
##  integers is needed, prefer vtkTypeInt16Array to this class.
##

## !!!Ignored construct:  # vtkShortArray_h [NewLine] # vtkShortArray_h [NewLine] # vtkAOSDataArrayTemplate.h  Real Superclass # vtkCommonCoreModule.h  For export macro # vtkDataArray.h [NewLine]  Fake the superclass for the wrappers. # __VTK_WRAP__ [NewLine] # vtkDataArray vtkAOSDataArrayTemplate < short > [end of template] [NewLine] # [NewLine] class VTKCOMMONCORE_EXPORT vtkShortArray : public vtkDataArray { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataArray Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataArray :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkShortArray :: IsTypeOf ( type ) ; } static vtkShortArray * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkShortArray * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkShortArray * NewInstance ( ) const { return vtkShortArray :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataArray :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkShortArray :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkShortArray :: New ( ) ; } public : ; # __VTK_WRAP__ [NewLine] # vtkDataArray [NewLine] # [NewLine] static vtkShortArray * New ( ) ; static vtkShortArray * ExtendedNew ( ) ; void PrintSelf ( ostream & os , vtkIndent indent ) override ;  This macro expands to the set of method declarations that
##  make up the interface of vtkAOSDataArrayTemplate, which is ignored
##  by the wrappers. # defined ( __VTK_WRAP__ ) || defined ( __WRAP_GCCXML__ ) [NewLine] vtkCreateWrappedArrayInterface ( short ) ; # [NewLine] *
##  A faster alternative to SafeDownCast for downcasting vtkAbstractArrays.
##  static vtkShortArray * FastDownCast ( vtkAbstractArray * source ) { return static_cast < vtkShortArray * > ( Superclass :: FastDownCast ( source ) ) ; } *
##  Get the minimum data value in its native type.
##  static short GetDataTypeValueMin ( ) { return VTK_SHORT_MIN ; } *
##  Get the maximum data value in its native type.
##  static short GetDataTypeValueMax ( ) { return VTK_SHORT_MAX ; } protected : vtkShortArray ( ) ; ~ vtkShortArray ( ) override ; private : typedef vtkAOSDataArrayTemplate < short > RealSuperclass ; vtkShortArray ( const vtkShortArray & ) = delete ; void operator = ( const vtkShortArray & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

##  Define vtkArrayDownCast implementation:

vtkArrayDownCast_FastCastMacro(vtkShortArray)