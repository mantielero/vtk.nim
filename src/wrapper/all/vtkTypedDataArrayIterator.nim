## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTypedDataArrayIterator.h
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
##  @class   vtkTypedDataArrayIterator
##  @brief   STL-style random access iterator for
##  vtkTypedDataArrays.
##
##
##  vtkTypedDataArrayIterator provides an STL-style iterator that can be used to
##  interact with instances of vtkTypedDataArray. It is intended to provide an
##  alternative to using vtkDataArray::GetVoidPointer() that only uses
##  vtkTypedDataArray API functions to retrieve values. It is especially helpful
##  for safely iterating through subclasses of vtkMappedDataArray, which may
##  not use the same memory layout as a typical vtkDataArray.
##
##  NOTE: This class has been superceded by the newer vtkGenericDataArray and
##  vtkArrayDispatch mechanism.
##

import
  vtkTypedDataArray

type
  vtkTypedDataArrayIterator*[Scalar] {.importcpp: "vtkTypedDataArrayIterator<\'0>",
                                      header: "vtkTypedDataArrayIterator.h",
                                      bycopy.} = object

  vtkTypedDataArrayIteratoriterator_category* = random_access_iterator_tag
  vtkTypedDataArrayIteratorvalue_type*[Scalar] = Scalar
  vtkTypedDataArrayIteratordifference_type* = ptrdiff_t
  vtkTypedDataArrayIteratorreference*[Scalar] = var Scalar
  vtkTypedDataArrayIteratorpointer*[Scalar] = ptr Scalar

proc constructvtkTypedDataArrayIterator*[Scalar](): vtkTypedDataArrayIterator[
    Scalar] {.constructor, importcpp: "vtkTypedDataArrayIterator<\'*0>(@)",
             header: "vtkTypedDataArrayIterator.h".}
proc constructvtkTypedDataArrayIterator*[Scalar](
    arr: ptr vtkTypedDataArray[Scalar]; index: vtkIdType = 0): vtkTypedDataArrayIterator[
    Scalar] {.constructor, importcpp: "vtkTypedDataArrayIterator<\'*0>(@)",
             header: "vtkTypedDataArrayIterator.h".}
proc constructvtkTypedDataArrayIterator*[Scalar](o: vtkTypedDataArrayIterator): vtkTypedDataArrayIterator[
    Scalar] {.constructor, importcpp: "vtkTypedDataArrayIterator<\'*0>(@)",
             header: "vtkTypedDataArrayIterator.h".}
proc `==`*[Scalar](this: vtkTypedDataArrayIterator[Scalar];
                  o: vtkTypedDataArrayIterator[Scalar]): bool {.noSideEffect,
    importcpp: "(# == #)", header: "vtkTypedDataArrayIterator.h".}
proc `<`*[Scalar](this: vtkTypedDataArrayIterator[Scalar];
                 o: vtkTypedDataArrayIterator[Scalar]): bool {.noSideEffect,
    importcpp: "(# < #)", header: "vtkTypedDataArrayIterator.h".}
proc `<=`*[Scalar](this: vtkTypedDataArrayIterator[Scalar];
                  o: vtkTypedDataArrayIterator[Scalar]): bool {.noSideEffect,
    importcpp: "(# <= #)", header: "vtkTypedDataArrayIterator.h".}
proc `*`*[Scalar](this: var vtkTypedDataArrayIterator[Scalar]): var Scalar {.
    importcpp: "(* #)", header: "vtkTypedDataArrayIterator.h".}
proc `->`*[Scalar](this: vtkTypedDataArrayIterator[Scalar]): ptr Scalar {.
    noSideEffect, importcpp: "(# -> #)", header: "vtkTypedDataArrayIterator.h".}
proc `[]`*[Scalar](this: var vtkTypedDataArrayIterator[Scalar];
                  n: vtkTypedDataArrayIteratordifference_type): var Scalar {.
    importcpp: "#[@]", header: "vtkTypedDataArrayIterator.h".}
proc `++`*[Scalar](this: var vtkTypedDataArrayIterator[Scalar]): var vtkTypedDataArrayIterator {.
    importcpp: "(++ #)", header: "vtkTypedDataArrayIterator.h".}
proc `--`*[Scalar](this: var vtkTypedDataArrayIterator[Scalar]): var vtkTypedDataArrayIterator {.
    importcpp: "(-- #)", header: "vtkTypedDataArrayIterator.h".}
proc `++`*[Scalar](this: var vtkTypedDataArrayIterator[Scalar]; a2: cint): vtkTypedDataArrayIterator {.
    importcpp: "(++ #)", header: "vtkTypedDataArrayIterator.h".}
proc `--`*[Scalar](this: var vtkTypedDataArrayIterator[Scalar]; a2: cint): vtkTypedDataArrayIterator {.
    importcpp: "(-- #)", header: "vtkTypedDataArrayIterator.h".}
proc `+`*[Scalar](this: vtkTypedDataArrayIterator[Scalar];
                 n: vtkTypedDataArrayIteratordifference_type): vtkTypedDataArrayIterator {.
    noSideEffect, importcpp: "(# + #)", header: "vtkTypedDataArrayIterator.h".}
proc `-`*[Scalar](this: vtkTypedDataArrayIterator[Scalar];
                 n: vtkTypedDataArrayIteratordifference_type): vtkTypedDataArrayIterator {.
    noSideEffect, importcpp: "(# - #)", header: "vtkTypedDataArrayIterator.h".}
proc `-`*[Scalar](this: vtkTypedDataArrayIterator[Scalar];
                 other: vtkTypedDataArrayIterator): vtkTypedDataArrayIteratordifference_type {.
    noSideEffect, importcpp: "(# - #)", header: "vtkTypedDataArrayIterator.h".}
proc `+=`*[Scalar](this: var vtkTypedDataArrayIterator[Scalar];
                  n: vtkTypedDataArrayIteratordifference_type) {.
    importcpp: "(# += #)", header: "vtkTypedDataArrayIterator.h".}
proc `-=`*[Scalar](this: var vtkTypedDataArrayIterator[Scalar];
                  n: vtkTypedDataArrayIteratordifference_type) {.
    importcpp: "(# -= #)", header: "vtkTypedDataArrayIterator.h".}
##  VTK-HeaderTest-Exclude: vtkTypedDataArrayIterator.h
