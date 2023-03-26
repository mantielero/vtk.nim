## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFloatArray.h
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
##  @class   vtkFloatArray
##  @brief   dynamic, self-adjusting array of float
##
##  vtkFloatArray is an array of values of type float.  It provides
##  methods for insertion and retrieval of values and will
##  automatically resize itself to hold new data.
##

## !!!Ignored construct:  # vtkFloatArray_h [NewLine] # vtkFloatArray_h [NewLine] # vtkAOSDataArrayTemplate.h  Real Superclass # vtkCommonCoreModule.h  For export macro # vtkDataArray.h [NewLine]  Fake the superclass for the wrappers. # __VTK_WRAP__ [NewLine] # vtkDataArray vtkAOSDataArrayTemplate < float > [end of template] [NewLine] # [NewLine] class VTKCOMMONCORE_EXPORT vtkFloatArray : public vtkDataArray { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataArray Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataArray :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkFloatArray :: IsTypeOf ( type ) ; } static vtkFloatArray * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkFloatArray * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkFloatArray * NewInstance ( ) const { return vtkFloatArray :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataArray :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFloatArray :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFloatArray :: New ( ) ; } public : ; # __VTK_WRAP__ [NewLine] # vtkDataArray [NewLine] # [NewLine] static vtkFloatArray * New ( ) ; static vtkFloatArray * ExtendedNew ( ) ; void PrintSelf ( ostream & os , vtkIndent indent ) override ;  This macro expands to the set of method declarations that
##  make up the interface of vtkAOSDataArrayTemplate, which is ignored
##  by the wrappers. # defined ( __VTK_WRAP__ ) || defined ( __WRAP_GCCXML__ ) [NewLine] vtkCreateWrappedArrayInterface ( float ) ; # [NewLine] *
##  A faster alternative to SafeDownCast for downcasting vtkAbstractArrays.
##  static vtkFloatArray * FastDownCast ( vtkAbstractArray * source ) { return static_cast < vtkFloatArray * > ( Superclass :: FastDownCast ( source ) ) ; } *
##  Get the minimum data value in its native type.
##  static float GetDataTypeValueMin ( ) { return VTK_FLOAT_MIN ; } *
##  Get the maximum data value in its native type.
##  static float GetDataTypeValueMax ( ) { return VTK_FLOAT_MAX ; } protected : vtkFloatArray ( ) ; ~ vtkFloatArray ( ) override ; private : typedef vtkAOSDataArrayTemplate < float > RealSuperclass ; vtkFloatArray ( const vtkFloatArray & ) = delete ; void operator = ( const vtkFloatArray & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

##  Define vtkArrayDownCast implementation:

vtkArrayDownCast_FastCastMacro(vtkFloatArray)