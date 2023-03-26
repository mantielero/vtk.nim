## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTuple.h
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
##  @class   vtkTuple
##  @brief   templated base type for containers of constant size.
##
##
##  This class is a templated data type for storing and manipulating tuples.
##

## !!!Ignored construct:  # vtkTuple_h [NewLine] # vtkTuple_h [NewLine] # vtkIOStream.h  For streaming operators # vtkSystemIncludes.h [NewLine] # < algorithm >  for std::copy # < array >  for std::array # < cassert >  For inline assert for bounds checked methods. # < cmath >  for std::abs() with float overloads # < cstdlib >  for std::abs() with int overloads [NewLine] template < typename T , int Size > [end of template] class vtkTuple { public : *
##  The default constructor does not initialize values. If initializtion is
##  desired, this should be done explicitly using the constructors for scalar
##  initialization, or other suitable constructors taking arguments.
##  vtkTuple ( ) = default ; *
##  Initialize all of the tuple's elements with the supplied scalar.
##  explicit vtkTuple ( const T & scalar ) { for ( int i = 0 ; i < Size ; ++ i ) { this -> Data [ i ] = scalar ; } } *
##  Initialize the tuple's elements with the elements of the supplied array.
##  Note that the supplied pointer must contain at least as many elements as
##  the tuple, or it will result in access to out of bounds memory.
##  explicit vtkTuple ( const T * init ) { for ( int i = 0 ; i < Size ; ++ i ) { this -> Data [ i ] = init [ i ] ; } } *
##  Initialize the tuple's elements using a `std::array` for matching type and
##  size. Example usage: `vtkTuple<double, 2 >({0.1, 0.2})`.
##  explicit vtkTuple ( const std :: array < T , Size > [end of template] & values ) { std :: copy ( values . begin ( ) , values . end ( ) , this -> Data ) ; } *
##  Get the size of the tuple.
##  int GetSize ( ) const { return Size ; } *
##  Get a pointer to the underlying data of the tuple.
##  T * GetData ( ) { return this -> Data ; } const T * GetData ( ) const { return this -> Data ; } *
##  Get a reference to the underlying data element of the tuple.
##  This works similarly to the way C++ STL containers work.  No
##  bounds checking is performed.
##  T & operator [ ] ( int i ) { return this -> Data [ i ] ; } const T & operator [ ] ( int i ) const { return this -> Data [ i ] ; } /@{ *
##  Get the value of the tuple at the index specified. Does bounds
##  checking, similar to the at(i) method of C++ STL containers, but
##  only when the code is compiled in debug mode.
##  T operator ( ) ( int i ) const { assert ( pre: index_in_bounds && i >= 0 && i < Size ) ; return this -> Data [ i ] ; } /@} /@{ *
##  Equality operator with a tolerance to allow fuzzy comparisons.
##  bool Compare ( const vtkTuple < T , Size > [end of template] & other , const T & tol ) const { if ( Size != other . GetSize ( ) ) { return false ; } for ( int i = 0 ; i < Size ; ++ i ) { if ( std :: abs ( this -> Data [ i ] - other . Data [ i ] ) >= tol ) { return false ; } } return true ; } /@} /@{ *
##  Cast the tuple to the specified type, returning the result.
##  template < typename TR > [end of template] vtkTuple < TR , Size > [end of template] Cast ( ) const { vtkTuple < TR , Size > [end of template] result ; for ( int i = 0 ; i < Size ; ++ i ) { result [ i ] = static_cast < TR > [end of template] ( this -> Data [ i ] ) ; } return result ; } /@} protected : /@{ *
##  The only thing stored in memory!
##  T Data [ Size ] ; /@} } ;
## Error: token expected: ; but got: #!!!

## /@{
## *
##  Output the contents of a tuple, mainly useful for debugging.
##

proc `<<`*(`out`: var ostream; t: vtkTuple[A, Size]): var ostream {.
    importcpp: "(# << #)", header: "vtkTuple.h".}
##  Specialize for unsigned char so that we can see the numbers!

proc `<<`*(`out`: var ostream; t: vtkTuple[cuchar, Size]): var ostream {.
    importcpp: "(# << #)", header: "vtkTuple.h".}
## /@}
## /@{
## *
##  Equality operator performs an equality check on each component.
##

proc `==`*(t1: vtkTuple[A, Size]; t2: vtkTuple[A, Size]): bool {.importcpp: "(# == #)",
    header: "vtkTuple.h".}
## /@}
## *
##  Inequality for vector type.
##

## !!!Ignored construct:  template < typename A , int Size > [end of template] bool operator != ( const vtkTuple < A , Size > [end of template] & t1 , const vtkTuple < A , Size > [end of template] & t2 ) { return ! ( t1 == t2 ) ; } #  vtkTuple_h  VTK-HeaderTest-Exclude: vtkTuple.h
## Error: token expected: ; but got: #!!!
