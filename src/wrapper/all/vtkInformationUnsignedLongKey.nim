## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInformationUnsignedLongKey.h
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
##  @class   vtkInformationUnsignedLongKey
##  @brief   Key for unsigned long values in vtkInformation.
##
##  vtkInformationUnsignedLongKey is used to represent keys for unsigned long values
##  in vtkInformation.
##

## !!!Ignored construct:  # vtkInformationUnsignedLongKey_h [NewLine] # vtkInformationUnsignedLongKey_h [NewLine] # vtkCommonCoreModule.h  For export macro # vtkInformationKey.h [NewLine] # vtkCommonInformationKeyManager.h  Manage instances of this type. [NewLine] class VTKCOMMONCORE_EXPORT vtkInformationUnsignedLongKey : public vtkInformationKey { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkInformationKey Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkInformationKey :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkInformationUnsignedLongKey :: IsTypeOf ( type ) ; } static vtkInformationUnsignedLongKey * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkInformationUnsignedLongKey * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkInformationUnsignedLongKey * NewInstance ( ) const { return vtkInformationUnsignedLongKey :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInformationKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInformationUnsignedLongKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInformationUnsignedLongKey :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; vtkInformationUnsignedLongKey ( const char * name , const char * location ) ; ~ vtkInformationUnsignedLongKey ( ) override ; *
##  This method simply returns a new vtkInformationUnsignedLongKey, given a
##  name and a location. This method is provided for wrappers. Use the
##  constructor directly from C++ instead.
##  static VTK_NEWINSTANCE vtkInformationUnsignedLongKey * MakeKey ( const char * name , const char * location ) { return new vtkInformationUnsignedLongKey ( name , location ) ; } /@{ *
##  Get/Set the value associated with this key in the given
##  information object.
##  void Set ( vtkInformation * info , unsigned long ) ; unsigned long Get ( vtkInformation * info ) ; /@} *
##  Copy the entry associated with this key from one information
##  object to another.  If there is no entry in the first information
##  object for this key, the value is removed from the second.
##  void ShallowCopy ( vtkInformation * from , vtkInformation * to ) override ; *
##  Print the key's value in an information object to a stream.
##  void Print ( ostream & os , vtkInformation * info ) override ; protected : *
##  Get the address at which the actual value is stored.  This is
##  meant for use from a debugger to add watches and is therefore not
##  a public method.
##  unsigned long * GetWatchAddress ( vtkInformation * info ) ; private : vtkInformationUnsignedLongKey ( const vtkInformationUnsignedLongKey & ) = delete ; void operator = ( const vtkInformationUnsignedLongKey & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
