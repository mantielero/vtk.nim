## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInformationQuadratureSchemeDefinitionVectorKey.h
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
##  @class   vtkInformationQuadratureSchemeDefinitionVectorKey
##  @brief   Key for vtkQuadratureSchemeDefinition vector values.
##
##  vtkInformationQuadratureSchemeDefinitionVectorKey is used to represent keys for double
##  vector values in vtkInformation.h. NOTE the interface in this key differs
##  from that in other similar keys because of our internal use of smart
##  pointers.
##

## !!!Ignored construct:  # vtkInformationQuadratureSchemeDefinitionVectorKey_h [NewLine] # vtkInformationQuadratureSchemeDefinitionVectorKey_h [NewLine] # vtkCommonDataModelModule.h  For export macro # vtkCommonInformationKeyManager.h  Manage instances of this type. # vtkInformationKey.h [NewLine] class vtkInformationQuadratureSchemeDefinitionVectorValue ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkXMLDataElement"
discard "forward decl of vtkQuadratureSchemeDefinition"
## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkInformationQuadratureSchemeDefinitionVectorKey : public vtkInformationKey { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkInformationKey Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkInformationKey :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkInformationQuadratureSchemeDefinitionVectorKey :: IsTypeOf ( type ) ; } static vtkInformationQuadratureSchemeDefinitionVectorKey * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkInformationQuadratureSchemeDefinitionVectorKey * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkInformationQuadratureSchemeDefinitionVectorKey * NewInstance ( ) const { return vtkInformationQuadratureSchemeDefinitionVectorKey :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInformationKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInformationQuadratureSchemeDefinitionVectorKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInformationQuadratureSchemeDefinitionVectorKey :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  The name of the static instance and the class in which
##  it is defined(location) should be passed to the constructor.
##  vtkInformationQuadratureSchemeDefinitionVectorKey ( const char * name , const char * location ) ;  ~ vtkInformationQuadratureSchemeDefinitionVectorKey ( ) override ; /@} *
##  Clear the vector.
##  void Clear ( vtkInformation * info ) ; *
##  Resize (extend) the vector to hold n objects. Any new elements
##  created will be null initialized.
##  void Resize ( vtkInformation * info , int n ) ; *
##  Get the vector's length.
##  int Size ( vtkInformation * info ) ; int Length ( vtkInformation * info ) { return this -> Size ( info ) ; } *
##  Put the value on the back of the vector, with reference counting.
##  void Append ( vtkInformation * info , vtkQuadratureSchemeDefinition * value ) ; *
##  Set element i of the vector to value. Resizes the vector
##  if needed.
##  void Set ( vtkInformation * info , vtkQuadratureSchemeDefinition * value , int i ) ; *
##  Copy n values from the range in source defined by [from  from+n-1]
##  into the range in this vector defined by [to to+n-1]. Resizes
##  the vector if needed.
##  void SetRange ( vtkInformation * info , vtkQuadratureSchemeDefinition * * source , int from , int to , int n ) ; *
##  Copy n values from the range in this vector defined by [from  from+n-1]
##  into the range in the destination vector defined by [to to+n-1]. Up
##  to you to make sure the destination is big enough.
##  void GetRange ( vtkInformation * info , vtkQuadratureSchemeDefinition * * dest , int from , int to , int n ) ; *
##  Get the vtkQuadratureSchemeDefinition at a specific location in the vector.
##  vtkQuadratureSchemeDefinition * Get ( vtkInformation * info , int idx ) ;  _escription:
##  Get a pointer to the first vtkQuadratureSchemeDefinition in the vector. We are
##  uysing a vector of smart pointers so this is not easy to
##  implement.
##  vtkQuadratureSchemeDefinition **Get(vtkInformation* info); /@{ *
##  Copy the entry associated with this key from one information
##  object to another.  If there is no entry in the first information
##  object for this key, the value is removed from the second.
##  void ShallowCopy ( vtkInformation * from , vtkInformation * to ) override ; void DeepCopy ( vtkInformation * from , vtkInformation * to ) override ; /@} *
##  Print the key's value in an information object to a stream.
##  void Print ( ostream & os , vtkInformation * info ) override ;  note: I had wanted to make the following interface in vtkInformationKey
##  with a default implementation that did nothing. but we decided that
##  vtkInformationKey class is too important a class to add such an interface
##  without a thorough design review. we don't have budget for such a review. *
##  Generate an XML representation of the object. Each
##  key/value pair will be nested in the resulting XML hierarchy.
##  The element passed in is assumed to be empty.
##  int SaveState ( vtkInformation * info , vtkXMLDataElement * element ) ; *
##  Load key/value pairs from an XML state representation created
##  with SaveState. Duplicate keys will generate a fatal error.
##  int RestoreState ( vtkInformation * info , vtkXMLDataElement * element ) ; private : *
##  Used to create the underlying vector that will be associated
##  with this key.
##  void CreateQuadratureSchemeDefinition ( ) ; *
##  Get the vector associated with this key, if there is
##  none then associate a new vector with this key and return
##  that.
##  vtkInformationQuadratureSchemeDefinitionVectorValue * GetQuadratureSchemeDefinitionVector ( vtkInformation * info ) ;  vtkInformationQuadratureSchemeDefinitionVectorKey ( const vtkInformationQuadratureSchemeDefinitionVectorKey & ) = delete ; void operator = ( const vtkInformationQuadratureSchemeDefinitionVectorKey & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!