## =========================================================================
##
##  Program:   Visualization Toolkit
##  Module:    vtkSMPThreadLocalObject.h
##
##  Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##  All rights reserved.
##  See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##     This software is distributed WITHOUT ANY WARRANTY; without even
##     the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##     PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkSMPThreadLocalObject
##  @brief   Thread local storage for VTK objects.
##
##  This class essentially does the same thing as vtkSMPThreadLocal with
##  2 additional functions:
##  - Local() allocates an object of the template argument type using New()
##  - The destructor calls Delete() on all objects created with Local().
##
##  @warning
##  There is absolutely no guarantee to the order in which the local objects
##  will be stored and hence the order in which they will be traversed when
##  using iterators. You should not even assume that two vtkSMPThreadLocal
##  populated in the same parallel section will be populated in the same
##  order. For example, consider the following
##  \verbatim
##  vtkSMPThreadLocal<int> Foo;
##  vtkSMPThreadLocal<int> Bar;
##  class AFunctor
##  {
##     void Initialize() const
##     {
##       int& foo = Foo.Local();
##       int& bar = Bar.Local();
##       foo = random();
##       bar = foo;
##     }
##
##  @warning
##     void operator()(vtkIdType, vtkIdType)
##     {}
##     void Finalize()
##     {}
##  };
##
##  @warning
##  AFunctor functor;
##  vtkSMPTools::For(0, 100000, functor);
##
##  @warning
##  vtkSMPThreadLocal<int>::iterator itr1 = Foo.begin();
##  vtkSMPThreadLocal<int>::iterator itr2 = Bar.begin();
##  while (itr1 != Foo.end())
##  {
##    assert(*itr1 == *itr2);
##    ++itr1; ++itr2;
##  }
##  \endverbatim
##
##  @warning
##  It is possible and likely that the assert() will fail using the TBB
##  backend. So if you need to store values related to each other and
##  iterate over them together, use a struct or class to group them together
##  and use a thread local of that class.
##
##  @sa
##  vtkSMPThreadLocal
##

import
  vtkSMPThreadLocal

type
  vtkSMPThreadLocalObject*[T] {.importcpp: "vtkSMPThreadLocalObject<\'0>",
                               header: "vtkSMPThreadLocalObject.h", bycopy.} = object ## *
                                                                                 ##  Default constructor.
                                                                                 ##


proc constructvtkSMPThreadLocalObject*[T](): vtkSMPThreadLocalObject[T] {.
    constructor, importcpp: "vtkSMPThreadLocalObject<\'*0>(@)",
    header: "vtkSMPThreadLocalObject.h".}
proc constructvtkSMPThreadLocalObject*[T](exemplar: ptr T): vtkSMPThreadLocalObject[
    T] {.constructor, importcpp: "vtkSMPThreadLocalObject<\'*0>(@)",
        header: "vtkSMPThreadLocalObject.h".}
proc destroyvtkSMPThreadLocalObject*[T](this: var vtkSMPThreadLocalObject[T]) {.
    importcpp: "#.~vtkSMPThreadLocalObject()", header: "vtkSMPThreadLocalObject.h".}
proc Local*[T](this: var vtkSMPThreadLocalObject[T]): ptr T {.importcpp: "Local",
    header: "vtkSMPThreadLocalObject.h".}
proc size*[T](this: vtkSMPThreadLocalObject[T]): csize_t {.noSideEffect,
    importcpp: "size", header: "vtkSMPThreadLocalObject.h".}
type
  vtkSMPThreadLocalObjectiterator*[T] {.importcpp: "vtkSMPThreadLocalObject<\'0>::iterator",
                                       header: "vtkSMPThreadLocalObject.h", bycopy.} = object


proc `++`*[T](this: var vtkSMPThreadLocalObjectiterator[T]): var vtkSMPThreadLocalObjectiterator {.
    importcpp: "(++ #)", header: "vtkSMPThreadLocalObject.h".}
proc `++`*[T](this: var vtkSMPThreadLocalObjectiterator[T]; a2: cint): vtkSMPThreadLocalObjectiterator {.
    importcpp: "(++ #)", header: "vtkSMPThreadLocalObject.h".}
proc `==`*[T](this: var vtkSMPThreadLocalObjectiterator[T];
             other: vtkSMPThreadLocalObjectiterator): bool {.importcpp: "(# == #)",
    header: "vtkSMPThreadLocalObject.h".}
proc `*`*[T](this: var vtkSMPThreadLocalObjectiterator[T]): ptr T {.
    importcpp: "(* #)", header: "vtkSMPThreadLocalObject.h".}
proc `->`*[T](this: var vtkSMPThreadLocalObjectiterator[T]): ptr ptr T {.
    importcpp: "(# -> #)", header: "vtkSMPThreadLocalObject.h".}
proc begin*[T](this: var vtkSMPThreadLocalObject[T]): vtkSMPThreadLocalObjectiterator {.
    importcpp: "begin", header: "vtkSMPThreadLocalObject.h".}
proc `end`*[T](this: var vtkSMPThreadLocalObject[T]): vtkSMPThreadLocalObjectiterator {.
    importcpp: "end", header: "vtkSMPThreadLocalObject.h".}
##  VTK-HeaderTest-Exclude: vtkSMPThreadLocalObject.h
