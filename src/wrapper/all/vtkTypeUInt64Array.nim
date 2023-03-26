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
##  .NAME vtkTypeUInt64Array - dynamic, self-adjusting array of vtkTypeUInt64
##  .SECTION Description
##  vtkTypeUInt64Array is an array of values of type vtkTypeUInt64.  It
##  provides methods for insertion and retrieval of values and will
##  automatically resize itself to hold new data.
##
##  This array should be preferred for data of type UInt64 as this
##  array will use the correct underlying datatype based on the desired number of bits
##  and the current platform.  The superclass of this type will change depending on the
##  machine and compiler in use so that the data contained always uses the proper type.

## !!!Ignored construct:  # vtkTypeUInt64Array_h [NewLine] # vtkTypeUInt64Array_h [NewLine] # vtkCommonCoreModule.h  For export macro # vtkType.h  For native type selections. [NewLine] # VTK_TYPE_UINT64 == VTK_UNSIGNED_LONG [NewLine] # vtkUnsignedLongArray.h [NewLine] # vtkTypeArrayBase vtkUnsignedLongArray [NewLine] # VTK_TYPE_UINT64 == VTK_UNSIGNED_LONG_LONG [NewLine] # vtkUnsignedLongLongArray.h [NewLine] # vtkTypeArrayBase vtkUnsignedLongLongArray [NewLine] # [NewLine] class VTKCOMMONCORE_EXPORT vtkTypeUInt64Array : public vtkTypeArrayBase { public : static vtkTypeUInt64Array * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkTypeArrayBase Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkTypeArrayBase :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkTypeUInt64Array :: IsTypeOf ( type ) ; } static vtkTypeUInt64Array * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkTypeUInt64Array * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkTypeUInt64Array * NewInstance ( ) const { return vtkTypeUInt64Array :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTypeArrayBase :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTypeUInt64Array :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTypeUInt64Array :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ;  Description:
##  A faster alternative to SafeDownCast for downcasting vtkAbstractArrays. static vtkTypeUInt64Array * FastDownCast ( vtkAbstractArray * source ) { return static_cast < vtkTypeUInt64Array * > ( Superclass :: FastDownCast ( source ) ) ; } protected : vtkTypeUInt64Array ( ) ; ~ vtkTypeUInt64Array ( ) override ; private : vtkTypeUInt64Array ( const vtkTypeUInt64Array & ) = delete ; void operator = ( const vtkTypeUInt64Array & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

##  Define vtkArrayDownCast implementation:

vtkArrayDownCast_FastCastMacro(vtkTypeUInt64Array)