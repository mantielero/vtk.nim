## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkArrayIteratorTemplate.h
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
##  @class   vtkArrayIteratorTemplate
##  @brief   Implementation template for a array
##  iterator.
##
##
##  This is implementation template for a array iterator. It only works
##  with arrays that have a contiguous internal storage of values (as in
##  vtkDataArray, vtkStringArray).
##

## !!!Ignored construct:  # vtkArrayIteratorTemplate_h [NewLine] # vtkArrayIteratorTemplate_h [NewLine] # vtkArrayIterator.h [NewLine] # vtkCommonCoreModule.h  For export macro [NewLine] # vtkCompiler.h  for VTK_USE_EXTERN_TEMPLATE # vtkStdString.h  For template instantiation # vtkVariant.h  For template instantiation [NewLine] template < class T > [end of template] class vtkArrayIteratorTemplate : public vtkArrayIterator { public : static vtkArrayIteratorTemplate < T > [end of template] * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return typeid ( vtkArrayIteratorTemplate < T > ) . name ( ) ; } public : typedef vtkArrayIterator Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( typeid ( vtkArrayIteratorTemplate < T > ) . name ( ) , type ) ) { return 1 ; } return vtkArrayIterator :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkArrayIteratorTemplate < T > :: IsTypeOf ( type ) ; } static vtkArrayIteratorTemplate < T > * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( typeid ( vtkArrayIteratorTemplate < T > ) . name ( ) ) ) { return static_cast < vtkArrayIteratorTemplate < T > * > [end of template] ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkArrayIteratorTemplate < T > * NewInstance ( ) const { return vtkArrayIteratorTemplate < T > :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( typeid ( vtkArrayIteratorTemplate < T > ) . name ( ) , type ) ) { return 0 ; } return 1 + vtkArrayIterator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkArrayIteratorTemplate < T > :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : ; protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkArrayIteratorTemplate < T > :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Set the array this iterator will iterate over.
##  After Initialize() has been called, the iterator is valid
##  so long as the Array has not been modified
##  (except using the iterator itself).
##  If the array is modified, the iterator must be re-initialized.
##  void Initialize ( vtkAbstractArray * array ) override ; *
##  Get the array.
##  vtkAbstractArray * GetArray ( ) { return this -> Array ; } *
##  Must be called only after Initialize.
##  T * GetTuple ( vtkIdType id ) ; *
##  Must be called only after Initialize.
##  T & GetValue ( vtkIdType id ) { return this -> Pointer [ id ] ; } *
##  Sets the value at the index. This does not verify if the index is
##  valid.  The caller must ensure that id is less than the maximum
##  number of values.
##  void SetValue ( vtkIdType id , T value ) { this -> Pointer [ id ] = value ; } *
##  Must be called only after Initialize.
##  vtkIdType GetNumberOfTuples ( ) const ; *
##  Must be called only after Initialize.
##  vtkIdType GetNumberOfValues ( ) const ; *
##  Must be called only after Initialize.
##  int GetNumberOfComponents ( ) const ; *
##  Get the data type from the underlying array.
##  int GetDataType ( ) const override ; *
##  Get the data type size from the underlying array.
##  int GetDataTypeSize ( ) const ; *
##  This is the data type for the value.
##  typedef T ValueType ; protected : vtkArrayIteratorTemplate ( ) ; ~ vtkArrayIteratorTemplate ( ) override ; T * Pointer ; private : vtkArrayIteratorTemplate ( const vtkArrayIteratorTemplate & ) = delete ; void operator = ( const vtkArrayIteratorTemplate & ) = delete ; void SetArray ( vtkAbstractArray * ) ; vtkAbstractArray * Array ; } ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  # VTK_USE_EXTERN_TEMPLATE [NewLine] # vtkArrayIteratorTemplateInstantiate_cxx [NewLine] # _MSC_VER [NewLine] # warning ( push ) [NewLine]  The following is needed when the vtkArrayIteratorTemplate is declared
##  dllexport and is used from another class in vtkCommonCore # warning ( disable : 4910 )  extern and dllexport incompatible # [NewLine] vtkInstantiateTemplateMacro ( extern template class vtkArrayIteratorTemplate ) ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  extern template class vtkArrayIteratorTemplate < vtkStdString > ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  extern template class vtkArrayIteratorTemplate < vtkVariant > ;
## Error: token expected: ; but got: [identifier]!!!

when defined(_MSC_VER):
  discard
##  VTK-HeaderTest-Exclude: vtkArrayIteratorTemplate.h
