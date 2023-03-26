## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkIntArray.h
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
##  @class   vtkIntArray
##  @brief   dynamic, self-adjusting array of int
##
##  vtkIntArray is an array of values of type int.  It provides
##  methods for insertion and retrieval of values and will
##  automatically resize itself to hold new data.
##
##  The C++ standard does not define the exact size of the int type, so use
##  of this type directly is discouraged.  If an array of 32 bit integers is
##  needed, prefer vtkTypeInt32Array to this class.
##

## !!!Ignored construct:  # vtkIntArray_h [NewLine] # vtkIntArray_h [NewLine] # vtkAOSDataArrayTemplate.h  Real Superclass # vtkCommonCoreModule.h  For export macro # vtkDataArray.h [NewLine]  Fake the superclass for the wrappers. # __VTK_WRAP__ [NewLine] # vtkDataArray vtkAOSDataArrayTemplate < int > [end of template] [NewLine] # [NewLine] class VTKCOMMONCORE_EXPORT vtkIntArray : public vtkDataArray { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataArray Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataArray :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkIntArray :: IsTypeOf ( type ) ; } static vtkIntArray * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkIntArray * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkIntArray * NewInstance ( ) const { return vtkIntArray :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataArray :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkIntArray :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkIntArray :: New ( ) ; } public : ; # __VTK_WRAP__ [NewLine] # vtkDataArray [NewLine] # [NewLine] static vtkIntArray * New ( ) ; static vtkIntArray * ExtendedNew ( ) ; void PrintSelf ( ostream & os , vtkIndent indent ) override ;  This macro expands to the set of method declarations that
##  make up the interface of vtkAOSDataArrayTemplate, which is ignored
##  by the wrappers. # defined ( __VTK_WRAP__ ) || defined ( __WRAP_GCCXML__ ) [NewLine] vtkCreateWrappedArrayInterface ( int ) ; # [NewLine] *
##  A faster alternative to SafeDownCast for downcasting vtkAbstractArrays.
##  static vtkIntArray * FastDownCast ( vtkAbstractArray * source ) { return static_cast < vtkIntArray * > ( Superclass :: FastDownCast ( source ) ) ; } *
##  Get the minimum data value in its native type.
##  static int GetDataTypeValueMin ( ) { return VTK_INT_MIN ; } *
##  Get the maximum data value in its native type.
##  static int GetDataTypeValueMax ( ) { return VTK_INT_MAX ; } protected : vtkIntArray ( ) ; ~ vtkIntArray ( ) override ; private : typedef vtkAOSDataArrayTemplate < int > RealSuperclass ; vtkIntArray ( const vtkIntArray & ) = delete ; void operator = ( const vtkIntArray & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

##  Define vtkArrayDownCast implementation:

vtkArrayDownCast_FastCastMacro(vtkIntArray)