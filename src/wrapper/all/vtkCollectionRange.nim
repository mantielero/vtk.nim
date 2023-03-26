## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCollectionRange.h
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

import
  vtkCollection, vtkMeta, vtkRange, vtkSmartPointer

discard "forward decl of CollectionRange"
discard "forward decl of CollectionIterator"
type
  IsCollection*[T] {.importcpp: "vtk::detail::IsCollection<\'0>",
                    header: "vtkCollectionRange.h", bycopy.} = object of is_base_of[
      vtkCollection, T]


## !!!Ignored construct:  template < typename CollectionType , typename T = CollectionType > [end of template] using EnableIfIsCollection = typename std :: enable_if < IsCollection < CollectionType > :: value , T > :: type ;
## Error: token expected: > [end of template] but got: =!!!

## ------------------------------------------------------------------------------
##  Detect the type of items held by the collection by checking the return type
##  of GetNextItem(), or GetNextItemAsObject() as a fallback.

type
  GetCollectionItemType*[CollectionType] {.
      importcpp: "vtk::detail::GetCollectionItemType<\'0>",
      header: "vtkCollectionRange.h", bycopy.} = object ##  The GetType methods are only used in a decltype context and are left
                                                   ##  unimplemented as we only care about their signatures. They are used to
                                                   ##  determine the type of object held by the collection.
                                                   ##
                                                   ##  By passing literal 0 as the argument, the overload taking `int` is
                                                   ##  preferred and returns the same type as CollectionType::GetNextItem, which
                                                   ##  is usually the exact type held by the collection (e.g.
                                                   ##  vtkRendererCollection::GetNextItem returns vtkRenderer*).
                                                   ##
                                                   ##  If the collection class does not define GetNextItem, SFINAE removes the
                                                   ##  preferred `int` overload, and the `...` overload is used instead. This
                                                   ##  method returns the same type as vtkCollection::GetNextItemAsObject, which
                                                   ##  is vtkObject*. This lets us define a more derived collection item type
                                                   ##  when possible, while falling back to the general vtkObject if a more
                                                   ##  refined type is not known.
                                                   ##  not implemented
                                                   ##  Just use std::remove pointer, vtk::detail::StripPointer is overkill.


## !!!Ignored construct:  static_assert ( IsCollection < CollectionType > :: value , Invalid vtkCollection subclass. ) ;
## Error: token expected: ) but got: <!!!

type
  PointerType* = typeof(GetType[CollectionType](0))
  Type* = typename

## !!!Ignored construct:  std :: remove_pointer < PointerType > [end of template] :: type ;
## Error: identifier expected, but got: ;!!!

## ------------------------------------------------------------------------------
##  Collection iterator. Reference, value, and pointer types are all ItemType
##  pointers, since:
##  a) values: ItemType* instead of ItemType because vtkObjects can't be
##     copied/assigned.
##  b) references: No good usecase to change the pointers held by the collection
##     by returning ItemType*&, nor would returning ItemType& be useful, since
##     it'd have to be dereferenced anyway to pass it anywhere, and vtkObjects
##     are conventionally held by address.
##  c) pointers: Returning ItemType** from operator-> would be useless.
##
##  There are no const_reference, etc, since VTK is not const correct and marking
##  vtkObjects consts makes them unusable.

## !!!Ignored construct:  template < typename CollectionType > [end of template] struct CollectionIterator : public std :: iterator < std :: forward_iterator_tag , typename GetCollectionItemType < CollectionType > :: Type * , int , typename GetCollectionItemType < CollectionType > :: Type * , typename GetCollectionItemType < CollectionType > :: Type * > [end of template] { static_assert ( IsCollection < CollectionType > :: value , Invalid vtkCollection subclass. ) ; private : using ItemType = typename GetCollectionItemType < CollectionType > :: Type ; using Superclass = std :: iterator < std :: forward_iterator_tag , ItemType * , int , ItemType * , ItemType * > ; public : using iterator_category = typename Superclass :: iterator_category ; using value_type = typename Superclass :: value_type ; using difference_type = typename Superclass :: difference_type ; using pointer = typename Superclass :: pointer ; using reference = typename Superclass :: reference ; CollectionIterator ( ) noexcept : Element ( nullptr ) { } CollectionIterator ( const CollectionIterator & o ) noexcept = default ; CollectionIterator & operator = ( const CollectionIterator & o ) noexcept = default ; CollectionIterator & operator ++ ( ) noexcept  prefix { this -> Increment ( ) ; return * this ; } CollectionIterator operator ++ ( int ) noexcept  postfix { auto elem = this -> Element ; this -> Increment ( ) ; return CollectionIterator { elem } ; } reference operator * ( ) const noexcept { return this -> GetItem ( ) ; } pointer operator -> ( ) const noexcept { return this -> GetItem ( ) ; } friend bool operator == ( const CollectionIterator & lhs , const CollectionIterator & rhs ) noexcept { return lhs . Element == rhs . Element ; } friend bool operator != ( const CollectionIterator & lhs , const CollectionIterator & rhs ) noexcept { return lhs . Element != rhs . Element ; } friend void swap ( CollectionIterator & lhs , CollectionIterator & rhs ) noexcept { using std :: swap ; swap ( lhs . Element , rhs . Element ) ; } friend struct CollectionRange < CollectionType > ; protected : CollectionIterator ( vtkCollectionElement * element ) noexcept : Element ( element ) { } private : void Increment ( ) noexcept {  incrementing an invalid iterator is UB, no need to check for non-null. this -> Element = this -> Element -> Next ; } ItemType * GetItem ( ) const noexcept { return static_cast < ItemType * > ( this -> Element -> Item ) ; } vtkCollectionElement * Element ; } ;
## Error: token expected: > [end of template] but got: [identifier]!!!

## ------------------------------------------------------------------------------
##  Collection range proxy.
##  The const_iterators/references are the same as the non-const versions, since
##  vtkObjects marked const are unusable.

type
  CollectionIteratorCollectionRange*[CollectionType] {.
      importcpp: "vtk::detail::CollectionIterator<\'0>::CollectionRange<\'1>",
      header: "vtkCollectionRange.h", bycopy.} = object


## !!!Ignored construct:  static_assert ( IsCollection < CollectionType > :: value , Invalid vtkCollection subclass. ) ;
## Error: token expected: ) but got: <!!!

type
  ItemType* = typename

## !!!Ignored construct:  GetCollectionItemType < CollectionType > [end of template] :: Type ;
## Error: identifier expected, but got: ;!!!

type
  size_type* = cint
  `iterator`* = CollectionIterator[CollectionType]
  const_iterator* = CollectionIterator[CollectionType]
  reference* = ptr ItemType
  const_reference* = ptr ItemType
  value_type* = ptr ItemType

## !!!Ignored construct:  CollectionRange ( CollectionType * coll ) noexcept : Collection ( coll ) { assert ( this -> Collection ) ; } CollectionType * GetCollection ( ) const noexcept { return this -> Collection ; } size_type size ( ) const noexcept { return this -> Collection -> GetNumberOfItems ( ) ; } iterator begin ( ) const { vtkCollectionSimpleIterator cookie ; this -> Collection -> InitTraversal ( cookie ) ;  The cookie is a linked list node pointer, vtkCollectionElement: return iterator { static_cast < vtkCollectionElement * > ( cookie ) } ; } iterator end ( ) const { return iterator { nullptr } ; }  Note: These return mutable objects because const vtkObject are unusable. const_iterator cbegin ( ) const { vtkCollectionSimpleIterator cookie ; this -> Collection -> InitTraversal ( cookie ) ;  The cookie is a linked list node pointer, vtkCollectionElement: return const_iterator { static_cast < vtkCollectionElement * > ( cookie ) } ; }  Note: These return mutable objects because const vtkObjects are unusable. const_iterator cend ( ) const { return const_iterator { nullptr } ; } private : vtkSmartPointer < CollectionType > Collection ;
## Error: expected ';'!!!

##  end namespace vtk::detail

##  VTK-HeaderTest-Exclude: vtkCollectionRange.h
