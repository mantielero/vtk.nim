## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInformationIntegerPointerKey.h
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
##  @class   vtkInformationIntegerPointerKey
##  @brief   Key for pointer to integer.
##
##  vtkInformationIntegerPointerKey is used to represent keys for pointer
##  to integer values in vtkInformation.h
##

## !!!Ignored construct:  # vtkInformationIntegerPointerKey_h [NewLine] # vtkInformationIntegerPointerKey_h [NewLine] # vtkCommonCoreModule.h  For export macro # vtkInformationKey.h [NewLine] # vtkCommonInformationKeyManager.h  Manage instances of this type. [NewLine] class VTKCOMMONCORE_EXPORT vtkInformationIntegerPointerKey : public vtkInformationKey { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkInformationKey Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkInformationKey :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkInformationIntegerPointerKey :: IsTypeOf ( type ) ; } static vtkInformationIntegerPointerKey * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkInformationIntegerPointerKey * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkInformationIntegerPointerKey * NewInstance ( ) const { return vtkInformationIntegerPointerKey :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInformationKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInformationIntegerPointerKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInformationIntegerPointerKey :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; vtkInformationIntegerPointerKey ( const char * name , const char * location , int length = - 1 ) ; ~ vtkInformationIntegerPointerKey ( ) override ; /@{ *
##  Get/Set the value associated with this key in the given
##  information object.
##  void Set ( vtkInformation * info , int * value , int length ) ; int * Get ( vtkInformation * info ) ; void Get ( vtkInformation * info , int * value ) ; int Length ( vtkInformation * info ) ; /@} *
##  Copy the entry associated with this key from one information
##  object to another.  If there is no entry in the first information
##  object for this key, the value is removed from the second.
##  void ShallowCopy ( vtkInformation * from , vtkInformation * to ) override ; *
##  Print the key's value in an information object to a stream.
##  void Print ( ostream & os , vtkInformation * info ) override ; protected :  The required length of the vector value (-1 is no restriction). int RequiredLength ; *
##  Get the address at which the actual value is stored.  This is
##  meant for use from a debugger to add watches and is therefore not
##  a public method.
##  int * GetWatchAddress ( vtkInformation * info ) ; private : vtkInformationIntegerPointerKey ( const vtkInformationIntegerPointerKey & ) = delete ; void operator = ( const vtkInformationIntegerPointerKey & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
