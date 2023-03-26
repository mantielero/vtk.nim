## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInformationObjectBaseKey.h
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
##  @class   vtkInformationObjectBaseKey
##  @brief   Key for vtkObjectBase values.
##
##  vtkInformationObjectBaseKey is used to represent keys in
##  vtkInformation for values that are vtkObjectBase instances.
##

## !!!Ignored construct:  # vtkInformationObjectBaseKey_h [NewLine] # vtkInformationObjectBaseKey_h [NewLine] # vtkCommonCoreModule.h  For export macro # vtkInformationKey.h [NewLine] # vtkCommonInformationKeyManager.h  Manage instances of this type. [NewLine] class vtkObjectBase ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKCOMMONCORE_EXPORT vtkInformationObjectBaseKey : public vtkInformationKey { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkInformationKey Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkInformationKey :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkInformationObjectBaseKey :: IsTypeOf ( type ) ; } static vtkInformationObjectBaseKey * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkInformationObjectBaseKey * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkInformationObjectBaseKey * NewInstance ( ) const { return vtkInformationObjectBaseKey :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInformationKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInformationObjectBaseKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInformationObjectBaseKey :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; vtkInformationObjectBaseKey ( const char * name , const char * location , const char * requiredClass = nullptr ) ; ~ vtkInformationObjectBaseKey ( ) override ; *
##  This method simply returns a new vtkInformationObjectBaseKey, given a
##  name, location and optionally a required class (a classname to restrict
##  which class types can be set with this key). This method is provided
##  for wrappers. Use the constructor directly from C++ instead.
##  static VTK_NEWINSTANCE vtkInformationObjectBaseKey * MakeKey ( const char * name , const char * location , const char * requiredClass = nullptr ) { return new vtkInformationObjectBaseKey ( name , location , requiredClass ) ; } /@{ *
##  Get/Set the value associated with this key in the given
##  information object.
##  void Set ( vtkInformation * info , vtkObjectBase * ) ; vtkObjectBase * Get ( vtkInformation * info ) ; /@} *
##  Copy the entry associated with this key from one information
##  object to another.  If there is no entry in the first information
##  object for this key, the value is removed from the second.
##  void ShallowCopy ( vtkInformation * from , vtkInformation * to ) override ; *
##  Report a reference this key has in the given information object.
##  void Report ( vtkInformation * info , vtkGarbageCollector * collector ) override ; protected :  The type required of all objects stored with this key. const char * RequiredClass ; vtkInformationKeySetStringMacro ( RequiredClass ) ; private : vtkInformationObjectBaseKey ( const vtkInformationObjectBaseKey & ) = delete ; void operator = ( const vtkInformationObjectBaseKey & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
