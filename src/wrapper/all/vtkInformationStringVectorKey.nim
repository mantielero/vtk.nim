## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInformationStringVectorKey.h
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
##  @class   vtkInformationStringVectorKey
##  @brief   Key for String vector values.
##
##  vtkInformationStringVectorKey is used to represent keys for String
##  vector values in vtkInformation.h
##

## !!!Ignored construct:  # vtkInformationStringVectorKey_h [NewLine] # vtkInformationStringVectorKey_h [NewLine] # vtkCommonCoreModule.h  For export macro # vtkInformationKey.h [NewLine] # vtkCommonInformationKeyManager.h  Manage instances of this type. [NewLine] # < string >  for std::string compat [NewLine] class VTKCOMMONCORE_EXPORT vtkInformationStringVectorKey : public vtkInformationKey { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkInformationKey Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkInformationKey :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkInformationStringVectorKey :: IsTypeOf ( type ) ; } static vtkInformationStringVectorKey * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkInformationStringVectorKey * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkInformationStringVectorKey * NewInstance ( ) const { return vtkInformationStringVectorKey :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInformationKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInformationStringVectorKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInformationStringVectorKey :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; vtkInformationStringVectorKey ( const char * name , const char * location , int length = - 1 ) ; ~ vtkInformationStringVectorKey ( ) override ; *
##  This method simply returns a new vtkInformationStringVectorKey, given a
##  name, a location and a required length. This method is provided for
##  wrappers. Use the constructor directly from C++ instead.
##  static VTK_NEWINSTANCE vtkInformationStringVectorKey * MakeKey ( const char * name , const char * location , int length = - 1 ) { return new vtkInformationStringVectorKey ( name , location , length ) ; } /@{ *
##  Get/Set the value associated with this key in the given
##  information object.
##  void Append ( vtkInformation * info , const char * value ) ; void Set ( vtkInformation * info , const char * value , int index = 0 ) ; void Append ( vtkInformation * info , const std :: string & value ) ; void Set ( vtkInformation * info , const std :: string & value , int idx = 0 ) ; const char * Get ( vtkInformation * info , int idx = 0 ) ; int Length ( vtkInformation * info ) ; /@} *
##  Copy the entry associated with this key from one information
##  object to another.  If there is no entry in the first information
##  object for this key, the value is removed from the second.
##  void ShallowCopy ( vtkInformation * from , vtkInformation * to ) override ; *
##  Print the key's value in an information object to a stream.
##  void Print ( ostream & os , vtkInformation * info ) override ; protected :  The required length of the vector value (-1 is no restriction). int RequiredLength ; private : vtkInformationStringVectorKey ( const vtkInformationStringVectorKey & ) = delete ; void operator = ( const vtkInformationStringVectorKey & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
