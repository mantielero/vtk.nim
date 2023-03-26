## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTypeList.h
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
## //////////////////////////////////////////////////////////////////////////////
##  The Loki Library
##  Copyright (c) 2001 by Andrei Alexandrescu
##  This code accompanies the book:
##  Alexandrescu, Andrei. "Modern C++ Design: Generic Programming and Design
##      Patterns Applied". Copyright (c) 2001. Addison-Wesley.
##  Permission to use, copy, modify, distribute and sell this software for any
##      purpose is hereby granted without fee, provided that the above copyright
##      notice appear in all copies and that both that copyright notice and this
##      permission notice appear in supporting documentation.
##  The author or Addison-Wesley Longman make no representations about the
##      suitability of this software for any purpose. It is provided "as is"
##      without express or implied warranty.
## //////////////////////////////////////////////////////////////////////////////
## *
##  @class   vtkTypeList
##  @brief   TypeList implementation and utilities.
##
##
##  vtkTypeList provides a way to collect a list of types using C++ templates.
##  In VTK, this is used heavily by the vtkArrayDispatch system to instantiate
##  templated code for specific array implementations. The book "Modern C++
##  Design: Generic Programming and Design Patterns Applied" by Andrei
##  Alexandrescu provides additional details and applications for typeLists. This
##  implementation is heavily influenced by the example code in the book.
##
##  Note that creating a typelist in C++ is simplified greatly by using the
##  vtkTypeList::Create<T1, T2, ...> functions.
##
##  @sa
##  vtkArrayDispatch vtkTypeListMacros
##

import
  vtkTypeListMacros

## ------------------------------------------------------------------------------
## *
##  Used to terminate a TypeList.
##

type
  NullType* {.importcpp: "vtkTypeList::NullType", header: "vtkTypeList.h", bycopy.} = object


## ------------------------------------------------------------------------------
## /@{
## *
##  Generic implementation of TypeList.
##

type
  TypeList*[T; U] {.importcpp: "vtkTypeList::TypeList<\'0,\'1>",
                  header: "vtkTypeList.h", bycopy.} = object

  TypeListHead*[T] = T
  TypeListTail*[U] = U

## /@}
## ------------------------------------------------------------------------------
## *
##  Sets Result to T if Exp is true, or F if Exp is false.
##

discard "forward decl of Select"
discard "forward decl of CanConvert"
discard "forward decl of IndexOf"
discard "forward decl of Erase"
discard "forward decl of EraseAll"
discard "forward decl of Unique"
discard "forward decl of Replace"
discard "forward decl of ReplaceAll"
discard "forward decl of MostDerived"
discard "forward decl of DerivedToFront"
discard "forward decl of Append"
##  end namespace vtkTypeList

import
  vtkTypeList

## !!!Ignored construct:  template < typename ... Ts > [end of template] using Create = typename vtkTypeList :: detail :: CreateImpl < Ts ... > :: type ;
## Error: identifier expected, but got: ...!!!

##  end namespace vtkTypeList
