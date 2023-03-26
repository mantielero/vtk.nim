## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInformationStringKey.h
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
##  @class   vtkInformationStringKey
##  @brief   Key for string values in vtkInformation.
##
##  vtkInformationStringKey is used to represent keys for string values
##  in vtkInformation.
##

## !!!Ignored construct:  # vtkInformationStringKey_h [NewLine] # vtkInformationStringKey_h [NewLine] # vtkCommonCoreModule.h  For export macro # vtkInformationKey.h [NewLine] # vtkCommonInformationKeyManager.h  Manage instances of this type. [NewLine] # < string >  for std::string compat [NewLine] class VTKCOMMONCORE_EXPORT vtkInformationStringKey : public vtkInformationKey { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkInformationKey Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkInformationKey :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkInformationStringKey :: IsTypeOf ( type ) ; } static vtkInformationStringKey * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkInformationStringKey * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkInformationStringKey * NewInstance ( ) const { return vtkInformationStringKey :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInformationKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInformationStringKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInformationStringKey :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; vtkInformationStringKey ( const char * name , const char * location ) ; ~ vtkInformationStringKey ( ) override ; *
##  This method simply returns a new vtkInformationStringKey, given a
##  name and a location. This method is provided for wrappers. Use the
##  constructor directly from C++ instead.
##  static VTK_NEWINSTANCE vtkInformationStringKey * MakeKey ( const char * name , const char * location ) { return new vtkInformationStringKey ( name , location ) ; } /@{ *
##  Get/Set the value associated with this key in the given
##  information object.
##  void Set ( vtkInformation * info , const char * ) ; void Set ( vtkInformation * info , const std :: string & str ) ; const char * Get ( vtkInformation * info ) ; /@} *
##  Copy the entry associated with this key from one information
##  object to another.  If there is no entry in the first information
##  object for this key, the value is removed from the second.
##  void ShallowCopy ( vtkInformation * from , vtkInformation * to ) override ; *
##  Print the key's value in an information object to a stream.
##  void Print ( ostream & os , vtkInformation * info ) override ; private : vtkInformationStringKey ( const vtkInformationStringKey & ) = delete ; void operator = ( const vtkInformationStringKey & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
