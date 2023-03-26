## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTypedArray.h.in
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
##  .NAME vtkTypeFloat64Array - dynamic, self-adjusting array of vtkTypeFloat64
##  .SECTION Description
##  vtkTypeFloat64Array is an array of values of type vtkTypeFloat64.  It
##  provides methods for insertion and retrieval of values and will
##  automatically resize itself to hold new data.
##
##  This array should be preferred for data of type Float64 as this
##  array will use the correct underlying datatype based on the desired number of bits
##  and the current platform.  The superclass of this type will change depending on the
##  machine and compiler in use so that the data contained always uses the proper type.

## !!!Ignored construct:  # vtkTypeFloat64Array_h [NewLine] # vtkTypeFloat64Array_h [NewLine] # vtkCommonCoreModule.h  For export macro # vtkType.h  For native type selections. [NewLine] # VTK_TYPE_FLOAT64 == VTK_DOUBLE [NewLine] # vtkDoubleArray.h [NewLine] # vtkTypeArrayBase vtkDoubleArray [NewLine] # [NewLine] class VTKCOMMONCORE_EXPORT vtkTypeFloat64Array : public vtkTypeArrayBase { public : static vtkTypeFloat64Array * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkTypeArrayBase Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkTypeArrayBase :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkTypeFloat64Array :: IsTypeOf ( type ) ; } static vtkTypeFloat64Array * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkTypeFloat64Array * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkTypeFloat64Array * NewInstance ( ) const { return vtkTypeFloat64Array :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTypeArrayBase :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTypeFloat64Array :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTypeFloat64Array :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ;  Description:
##  A faster alternative to SafeDownCast for downcasting vtkAbstractArrays. static vtkTypeFloat64Array * FastDownCast ( vtkAbstractArray * source ) { return static_cast < vtkTypeFloat64Array * > ( Superclass :: FastDownCast ( source ) ) ; } protected : vtkTypeFloat64Array ( ) ; ~ vtkTypeFloat64Array ( ) override ; private : vtkTypeFloat64Array ( const vtkTypeFloat64Array & ) = delete ; void operator = ( const vtkTypeFloat64Array & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

##  Define vtkArrayDownCast implementation:

vtkArrayDownCast_FastCastMacro(vtkTypeFloat64Array)