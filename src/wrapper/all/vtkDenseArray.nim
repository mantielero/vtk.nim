## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDenseArray.h
##
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
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
##  @class   vtkDenseArray
##  @brief   Contiguous storage for N-way arrays.
##
##
##  vtkDenseArray is a concrete vtkArray implementation that stores values
##  using a contiguous block of memory.  Values are stored with fortran ordering,
##  meaning that if you iterated over the memory block, the left-most coordinates
##  would vary the fastest.
##
##  In addition to the retrieval and update methods provided by vtkTypedArray,
##  vtkDenseArray provides methods to:
##
##  Fill the entire array with a specific value.
##
##  Retrieve a pointer to the storage memory block.
##
##  @sa
##  vtkArray, vtkTypedArray, vtkSparseArray
##
##  @par Thanks:
##  Developed by Timothy M. Shead (tshead@sandia.gov) at Sandia National Laboratories.
##

import
  vtkArrayCoordinates, vtkObjectFactory, vtkTypedArray

type
  vtkDenseArray*[T] {.importcpp: "vtkDenseArray<\'0>", header: "vtkDenseArray.h",
                     bycopy.} = object of vtkTypedArray[T]
    vtkDenseArray* {.importc: "vtkDenseArray".}: VTK_NEWINSTANCE
    ## *
    ##  Stores labels for each array dimension
    ##
    ## *
    ##  Manages array value memory storage.
    ##
    ## /@{
    ## *
    ##  Stores array values using a contiguous range of memory
    ##  with constant-time value lookup.
    ##
    ## /@}
    ## *
    ##  Stores the offset along each array dimension (used for fast lookups).
    ##
    ## /@{
    ## *
    ##  Stores the stride along each array dimension (used for fast lookups).
    ##
    ## /@}


proc New*[T](): ptr vtkDenseArray[T] {.importcpp: "vtkDenseArray::New(@)",
                                   header: "vtkDenseArray.h".}
type
  vtkDenseArraySuperclass* = vtkTypedArray[T]

proc IsTypeOf*[T](`type`: cstring): vtkTypeBool {.
    importcpp: "vtkDenseArray::IsTypeOf(@)", header: "vtkDenseArray.h".}
proc IsA*[T](this: var vtkDenseArray[T]; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkDenseArray.h".}
proc SafeDownCast*[T](o: ptr vtkObjectBase): ptr vtkDenseArray[T] {.
    importcpp: "vtkDenseArray::SafeDownCast(@)", header: "vtkDenseArray.h".}
## !!!Ignored construct:  < T > * NewInstance ( ) const { return vtkDenseArray < T > :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( typeid ( vtkDenseArray < T > ) . name ( ) , type ) ) { return 0 ; } return 1 + vtkTypedArray < T > :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDenseArray < T > :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : ;
## Error: identifier expected, but got: <!!!

proc PrintSelf*[T](this: var vtkDenseArray[T]; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkDenseArray.h".}
type
  vtkDenseArrayCoordinateT* = CoordinateT
  vtkDenseArrayDimensionT* = DimensionT
  vtkDenseArraySizeT* = SizeT

proc IsDense*[T](this: var vtkDenseArray[T]): bool {.importcpp: "IsDense",
    header: "vtkDenseArray.h".}
proc GetExtents*[T](this: var vtkDenseArray[T]): vtkArrayExtents {.
    importcpp: "GetExtents", header: "vtkDenseArray.h".}
proc GetNonNullSize*[T](this: var vtkDenseArray[T]): vtkDenseArraySizeT {.
    importcpp: "GetNonNullSize", header: "vtkDenseArray.h".}
proc GetCoordinatesN*[T](this: var vtkDenseArray[T]; n: vtkDenseArraySizeT;
                        coordinates: var vtkArrayCoordinates) {.
    importcpp: "GetCoordinatesN", header: "vtkDenseArray.h".}
proc DeepCopy*[T](this: var vtkDenseArray[T]): ptr vtkArray {.importcpp: "DeepCopy",
    header: "vtkDenseArray.h".}
proc GetValue*[T](this: var vtkDenseArray[T]; i: vtkDenseArrayCoordinateT): T {.
    importcpp: "GetValue", header: "vtkDenseArray.h".}
proc GetValue*[T](this: var vtkDenseArray[T]; i: vtkDenseArrayCoordinateT;
                 j: vtkDenseArrayCoordinateT): T {.importcpp: "GetValue",
    header: "vtkDenseArray.h".}
proc GetValue*[T](this: var vtkDenseArray[T]; i: vtkDenseArrayCoordinateT;
                 j: vtkDenseArrayCoordinateT; k: vtkDenseArrayCoordinateT): T {.
    importcpp: "GetValue", header: "vtkDenseArray.h".}
proc GetValue*[T](this: var vtkDenseArray[T]; coordinates: vtkArrayCoordinates): T {.
    importcpp: "GetValue", header: "vtkDenseArray.h".}
proc GetValueN*[T](this: var vtkDenseArray[T]; n: vtkDenseArraySizeT): T {.
    importcpp: "GetValueN", header: "vtkDenseArray.h".}
proc SetValue*[T](this: var vtkDenseArray[T]; i: vtkDenseArrayCoordinateT; value: T) {.
    importcpp: "SetValue", header: "vtkDenseArray.h".}
proc SetValue*[T](this: var vtkDenseArray[T]; i: vtkDenseArrayCoordinateT;
                 j: vtkDenseArrayCoordinateT; value: T) {.importcpp: "SetValue",
    header: "vtkDenseArray.h".}
proc SetValue*[T](this: var vtkDenseArray[T]; i: vtkDenseArrayCoordinateT;
                 j: vtkDenseArrayCoordinateT; k: vtkDenseArrayCoordinateT; value: T) {.
    importcpp: "SetValue", header: "vtkDenseArray.h".}
proc SetValue*[T](this: var vtkDenseArray[T]; coordinates: vtkArrayCoordinates;
                 value: T) {.importcpp: "SetValue", header: "vtkDenseArray.h".}
proc SetValueN*[T](this: var vtkDenseArray[T]; n: vtkDenseArraySizeT; value: T) {.
    importcpp: "SetValueN", header: "vtkDenseArray.h".}
type
  vtkDenseArrayMemoryBlock*[T] {.importcpp: "vtkDenseArray<\'0>::MemoryBlock",
                                header: "vtkDenseArray.h", bycopy.} = object


proc destroyvtkDenseArrayMemoryBlock*[T](this: var vtkDenseArrayMemoryBlock[T]) {.
    importcpp: "#.~MemoryBlock()", header: "vtkDenseArray.h".}
proc GetAddress*[T](this: var vtkDenseArrayMemoryBlock[T]): ptr T {.
    importcpp: "GetAddress", header: "vtkDenseArray.h".}
type
  vtkDenseArrayHeapMemoryBlock*[T] {.importcpp: "vtkDenseArray<\'0>::HeapMemoryBlock",
                                    header: "vtkDenseArray.h", bycopy.} = object of vtkDenseArrayMemoryBlock


proc constructvtkDenseArrayHeapMemoryBlock*[T](extents: vtkArrayExtents): vtkDenseArrayHeapMemoryBlock[
    T] {.constructor, importcpp: "vtkDenseArray<\'*0>::HeapMemoryBlock(@)",
        header: "vtkDenseArray.h".}
proc destroyvtkDenseArrayHeapMemoryBlock*[T](
    this: var vtkDenseArrayHeapMemoryBlock[T]) {.importcpp: "#.~HeapMemoryBlock()",
    header: "vtkDenseArray.h".}
proc GetAddress*[T](this: var vtkDenseArrayHeapMemoryBlock[T]): ptr T {.
    importcpp: "GetAddress", header: "vtkDenseArray.h".}
type
  vtkDenseArrayStaticMemoryBlock*[T] {.importcpp: "vtkDenseArray<\'0>::StaticMemoryBlock",
                                      header: "vtkDenseArray.h", bycopy.} = object of vtkDenseArrayMemoryBlock


proc constructvtkDenseArrayStaticMemoryBlock*[T](storage: ptr T): vtkDenseArrayStaticMemoryBlock[
    T] {.constructor, importcpp: "vtkDenseArray<\'*0>::StaticMemoryBlock(@)",
        header: "vtkDenseArray.h".}
proc GetAddress*[T](this: var vtkDenseArrayStaticMemoryBlock[T]): ptr T {.
    importcpp: "GetAddress", header: "vtkDenseArray.h".}
proc ExternalStorage*[T](this: var vtkDenseArray[T]; extents: vtkArrayExtents;
                        storage: ptr vtkDenseArrayMemoryBlock) {.
    importcpp: "ExternalStorage", header: "vtkDenseArray.h".}
proc Fill*[T](this: var vtkDenseArray[T]; value: T) {.importcpp: "Fill",
    header: "vtkDenseArray.h".}
proc `[]`*[T](this: var vtkDenseArray[T]; coordinates: vtkArrayCoordinates): var T {.
    importcpp: "#[@]", header: "vtkDenseArray.h".}
proc GetStorage*[T](this: vtkDenseArray[T]): ptr T {.noSideEffect,
    importcpp: "GetStorage", header: "vtkDenseArray.h".}
proc GetStorage*[T](this: var vtkDenseArray[T]): ptr T {.importcpp: "GetStorage",
    header: "vtkDenseArray.h".}
import
  vtkDenseArray

##  VTK-HeaderTest-Exclude: vtkDenseArray.h
