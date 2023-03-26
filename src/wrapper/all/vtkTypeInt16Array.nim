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
##  .NAME vtkTypeInt16Array - dynamic, self-adjusting array of vtkTypeInt16
##  .SECTION Description
##  vtkTypeInt16Array is an array of values of type vtkTypeInt16.  It
##  provides methods for insertion and retrieval of values and will
##  automatically resize itself to hold new data.
##
##  This array should be preferred for data of type Int16 as this
##  array will use the correct underlying datatype based on the desired number of bits
##  and the current platform.  The superclass of this type will change depending on the
##  machine and compiler in use so that the data contained always uses the proper type.

## !!!Ignored construct:  # vtkTypeInt16Array_h [NewLine] # vtkTypeInt16Array_h [NewLine] # vtkCommonCoreModule.h  For export macro # vtkType.h  For native type selections. [NewLine] # VTK_TYPE_INT16 == VTK_SHORT [NewLine] # vtkShortArray.h [NewLine] # vtkTypeArrayBase vtkShortArray [NewLine] # [NewLine] class VTKCOMMONCORE_EXPORT vtkTypeInt16Array : public vtkTypeArrayBase { public : static vtkTypeInt16Array * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkTypeArrayBase Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkTypeArrayBase :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkTypeInt16Array :: IsTypeOf ( type ) ; } static vtkTypeInt16Array * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkTypeInt16Array * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkTypeInt16Array * NewInstance ( ) const { return vtkTypeInt16Array :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTypeArrayBase :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTypeInt16Array :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTypeInt16Array :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ;  Description:
##  A faster alternative to SafeDownCast for downcasting vtkAbstractArrays. static vtkTypeInt16Array * FastDownCast ( vtkAbstractArray * source ) { return static_cast < vtkTypeInt16Array * > ( Superclass :: FastDownCast ( source ) ) ; } protected : vtkTypeInt16Array ( ) ; ~ vtkTypeInt16Array ( ) override ; private : vtkTypeInt16Array ( const vtkTypeInt16Array & ) = delete ; void operator = ( const vtkTypeInt16Array & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

##  Define vtkArrayDownCast implementation:

vtkArrayDownCast_FastCastMacro(vtkTypeInt16Array)