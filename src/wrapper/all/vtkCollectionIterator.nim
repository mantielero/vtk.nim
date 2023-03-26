## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCollectionIterator.h
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
##  @class   vtkCollectionIterator
##  @brief   iterator through a vtkCollection.
##
##  vtkCollectionIterator provides an alternative way to traverse
##  through the objects in a vtkCollection.  Unlike the collection's
##  built in interface, this allows multiple iterators to
##  simultaneously traverse the collection.  If items are removed from
##  the collection, only the iterators currently pointing to those
##  items are invalidated.  Other iterators will still continue to
##  function normally.
##

## !!!Ignored construct:  # vtkCollectionIterator_h [NewLine] # vtkCollectionIterator_h [NewLine] # vtkCommonCoreModule.h  For export macro # vtkObject.h [NewLine] class vtkCollection ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkCollectionElement"
## !!!Ignored construct:  class VTKCOMMONCORE_EXPORT vtkCollectionIterator : public vtkObject { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkCollectionIterator :: IsTypeOf ( type ) ; } static vtkCollectionIterator * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkCollectionIterator * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkCollectionIterator * NewInstance ( ) const { return vtkCollectionIterator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCollectionIterator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCollectionIterator :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkCollectionIterator * New ( ) ; /@{ *
##  Set/Get the collection over which to iterate.
##  virtual void SetCollection ( vtkCollection * ) ; virtual vtkCollection * GetnameCollection ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Collection  address  << static_cast < vtkCollection * > ( this -> Collection ) ) ; return this -> Collection ; } ; /@} *
##  Position the iterator at the first item in the collection.
##  void InitTraversal ( ) { this -> GoToFirstItem ( ) ; } *
##  Position the iterator at the first item in the collection.
##  void GoToFirstItem ( ) ; *
##  Move the iterator to the next item in the collection.
##  void GoToNextItem ( ) ; *
##  Test whether the iterator is currently positioned at a valid item.
##  Returns 1 for yes, 0 for no.
##  int IsDoneWithTraversal ( ) ; *
##  Get the item at the current iterator position.  Valid only when
##  IsDoneWithTraversal() returns 1.
##  vtkObject * GetCurrentObject ( ) ; protected : vtkCollectionIterator ( ) ; ~ vtkCollectionIterator ( ) override ;  The collection over which we are iterating. vtkCollection * Collection ;  The current iterator position. vtkCollectionElement * Element ; vtkObject * GetObjectInternal ( ) ; private : vtkCollectionIterator ( const vtkCollectionIterator & ) = delete ; void operator = ( const vtkCollectionIterator & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
