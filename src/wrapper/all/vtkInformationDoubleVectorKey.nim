## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInformationDoubleVectorKey.h
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
##  @class   vtkInformationDoubleVectorKey
##  @brief   Key for double vector values.
##
##  vtkInformationDoubleVectorKey is used to represent keys for double
##  vector values in vtkInformation.h
##

## !!!Ignored construct:  # vtkInformationDoubleVectorKey_h [NewLine] # vtkInformationDoubleVectorKey_h [NewLine] # vtkCommonCoreModule.h  For export macro # vtkInformationKey.h [NewLine] # vtkCommonInformationKeyManager.h  Manage instances of this type. [NewLine] class VTKCOMMONCORE_EXPORT vtkInformationDoubleVectorKey : public vtkInformationKey { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkInformationKey Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkInformationKey :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkInformationDoubleVectorKey :: IsTypeOf ( type ) ; } static vtkInformationDoubleVectorKey * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkInformationDoubleVectorKey * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkInformationDoubleVectorKey * NewInstance ( ) const { return vtkInformationDoubleVectorKey :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInformationKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInformationDoubleVectorKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInformationDoubleVectorKey :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; vtkInformationDoubleVectorKey ( const char * name , const char * location , int length = - 1 ) ; ~ vtkInformationDoubleVectorKey ( ) override ; *
##  This method simply returns a new vtkInformationDoubleVectorKey, given a
##  name, a location and a required length. This method is provided for
##  wrappers. Use the constructor directly from C++ instead.
##  static VTK_NEWINSTANCE vtkInformationDoubleVectorKey * MakeKey ( const char * name , const char * location , int length = - 1 ) { return new vtkInformationDoubleVectorKey ( name , location , length ) ; } /@{ *
##  Get/Set the value associated with this key in the given
##  information object.
##  void Append ( vtkInformation * info , double value ) ; void Set ( vtkInformation * info , const double * value , int length ) ; double * Get ( vtkInformation * info ) ; double Get ( vtkInformation * info , int idx ) ; void Get ( vtkInformation * info , double * value ) ; int Length ( vtkInformation * info ) ; /@} *
##  Copy the entry associated with this key from one information
##  object to another.  If there is no entry in the first information
##  object for this key, the value is removed from the second.
##  void ShallowCopy ( vtkInformation * from , vtkInformation * to ) override ; *
##  Print the key's value in an information object to a stream.
##  void Print ( ostream & os , vtkInformation * info ) override ; protected :  The required length of the vector value (-1 is no restriction). int RequiredLength ; private : vtkInformationDoubleVectorKey ( const vtkInformationDoubleVectorKey & ) = delete ; void operator = ( const vtkInformationDoubleVectorKey & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
