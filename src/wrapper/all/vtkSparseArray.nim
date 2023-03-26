## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSparseArray.h
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
##  @class   vtkSparseArray
##  @brief   Sparse, independent coordinate storage for N-way arrays.
##
##
##  vtkSparseArray is a concrete vtkArray implementation that stores values using
##  sparse independent coordinate storage.  This means that the array stores the
##  complete set of coordinates and the value for each non-null value in the array.
##  While this approach requires slightly more storage than other sparse storage
##  schemes (such as Compressed-Row or Compressed-Column), it is easier and more
##  efficient to work with when implementing algorithms, and it generalizes well
##  for arbitrary numbers of dimensions.
##
##  In addition to the value retrieval and update methods provided by vtkTypedArray,
##  vtkSparseArray provides methods to:
##
##  Get and set a special 'null' value that will be returned when retrieving values
##  for undefined coordinates.
##
##  Clear the contents of the array so that every set of coordinates is undefined.
##
##  Sort the array contents so that value coordinates can be visited in a specific order.
##
##  Retrieve pointers to the value- and coordinate-storage memory blocks.
##
##  Reserve storage for a specific number of non-null values, for efficiency when the
##  number of non-null values is known in advance.
##
##  Recompute the array extents so that they bound the largest set of non-nullptr values
##  along each dimension.
##
##  Specify arbitrary array extents.
##
##  Add values to the array in amortized-constant time.
##
##  Validate that the array does not contain duplicate coordinates.
##
##  @sa
##  vtkArray, vtkTypedArray, vtkDenseArray
##
##  @par Thanks:
##  Developed by Timothy M. Shead (tshead@sandia.gov) at Sandia National Laboratories.
##

import
  vtkArrayCoordinates, vtkArraySort, vtkObjectFactory, vtkTypedArray

type
  vtkSparseArray*[T] {.importcpp: "vtkSparseArray<\'0>",
                      header: "vtkSparseArray.h", bycopy.} = object of vtkTypedArray[T]
    vtkSparseArray* {.importc: "vtkSparseArray".}: VTK_NEWINSTANCE
    ## *
    ##  Stores a label for each array dimension
    ##
    ## *
    ##  Stores the coordinates of each non-null element within the array,
    ##  using one contiguous array to store the coordinates for each dimension.
    ##
    ## *
    ##  Stores the value of each non-null element within the array
    ##
    ## /@{
    ## *
    ##  Stores the value that will be returned when accessing nullptr areas
    ##  of the array.
    ##
    ## /@}

  vtkSparseArraySuperclass* = vtkTypedArray[T]

proc IsTypeOf*[T](`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSparseArray::IsTypeOf(@)", header: "vtkSparseArray.h".}
proc IsA*[T](this: var vtkSparseArray[T]; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkSparseArray.h".}
proc SafeDownCast*[T](o: ptr vtkObjectBase): ptr vtkSparseArray[T] {.
    importcpp: "vtkSparseArray::SafeDownCast(@)", header: "vtkSparseArray.h".}
## !!!Ignored construct:  < T > * NewInstance ( ) const { return vtkSparseArray < T > :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( typeid ( vtkSparseArray < T > ) . name ( ) , type ) ) { return 0 ; } return 1 + vtkTypedArray < T > :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSparseArray < T > :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : ;
## Error: identifier expected, but got: <!!!

proc New*[T](): ptr vtkSparseArray[T] {.importcpp: "vtkSparseArray::New(@)",
                                    header: "vtkSparseArray.h".}
proc PrintSelf*[T](this: var vtkSparseArray[T]; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkSparseArray.h".}
type
  vtkSparseArrayCoordinateT* = CoordinateT
  vtkSparseArrayDimensionT* = DimensionT
  vtkSparseArraySizeT* = SizeT

proc IsDense*[T](this: var vtkSparseArray[T]): bool {.importcpp: "IsDense",
    header: "vtkSparseArray.h".}
proc GetExtents*[T](this: var vtkSparseArray[T]): vtkArrayExtents {.
    importcpp: "GetExtents", header: "vtkSparseArray.h".}
proc GetNonNullSize*[T](this: var vtkSparseArray[T]): vtkSparseArraySizeT {.
    importcpp: "GetNonNullSize", header: "vtkSparseArray.h".}
proc GetCoordinatesN*[T](this: var vtkSparseArray[T]; n: vtkSparseArraySizeT;
                        coordinates: var vtkArrayCoordinates) {.
    importcpp: "GetCoordinatesN", header: "vtkSparseArray.h".}
proc DeepCopy*[T](this: var vtkSparseArray[T]): ptr vtkArray {.importcpp: "DeepCopy",
    header: "vtkSparseArray.h".}
proc GetValue*[T](this: var vtkSparseArray[T]; i: vtkSparseArrayCoordinateT): T {.
    importcpp: "GetValue", header: "vtkSparseArray.h".}
proc GetValue*[T](this: var vtkSparseArray[T]; i: vtkSparseArrayCoordinateT;
                 j: vtkSparseArrayCoordinateT): T {.importcpp: "GetValue",
    header: "vtkSparseArray.h".}
proc GetValue*[T](this: var vtkSparseArray[T]; i: vtkSparseArrayCoordinateT;
                 j: vtkSparseArrayCoordinateT; k: vtkSparseArrayCoordinateT): T {.
    importcpp: "GetValue", header: "vtkSparseArray.h".}
proc GetValue*[T](this: var vtkSparseArray[T]; coordinates: vtkArrayCoordinates): T {.
    importcpp: "GetValue", header: "vtkSparseArray.h".}
proc GetValueN*[T](this: var vtkSparseArray[T]; n: vtkSparseArraySizeT): T {.
    importcpp: "GetValueN", header: "vtkSparseArray.h".}
proc SetValue*[T](this: var vtkSparseArray[T]; i: vtkSparseArrayCoordinateT; value: T) {.
    importcpp: "SetValue", header: "vtkSparseArray.h".}
proc SetValue*[T](this: var vtkSparseArray[T]; i: vtkSparseArrayCoordinateT;
                 j: vtkSparseArrayCoordinateT; value: T) {.importcpp: "SetValue",
    header: "vtkSparseArray.h".}
proc SetValue*[T](this: var vtkSparseArray[T]; i: vtkSparseArrayCoordinateT;
                 j: vtkSparseArrayCoordinateT; k: vtkSparseArrayCoordinateT;
                 value: T) {.importcpp: "SetValue", header: "vtkSparseArray.h".}
proc SetValue*[T](this: var vtkSparseArray[T]; coordinates: vtkArrayCoordinates;
                 value: T) {.importcpp: "SetValue", header: "vtkSparseArray.h".}
proc SetValueN*[T](this: var vtkSparseArray[T]; n: vtkSparseArraySizeT; value: T) {.
    importcpp: "SetValueN", header: "vtkSparseArray.h".}
proc SetNullValue*[T](this: var vtkSparseArray[T]; value: T) {.
    importcpp: "SetNullValue", header: "vtkSparseArray.h".}
proc GetNullValue*[T](this: var vtkSparseArray[T]): T {.importcpp: "GetNullValue",
    header: "vtkSparseArray.h".}
proc Clear*[T](this: var vtkSparseArray[T]) {.importcpp: "Clear",
    header: "vtkSparseArray.h".}
proc Sort*[T](this: var vtkSparseArray[T]; sort: vtkArraySort) {.importcpp: "Sort",
    header: "vtkSparseArray.h".}
proc GetUniqueCoordinates*[T](this: var vtkSparseArray[T];
                             dimension: vtkSparseArrayDimensionT): vector[
    vtkSparseArrayCoordinateT] {.importcpp: "GetUniqueCoordinates",
                                header: "vtkSparseArray.h".}
proc GetCoordinateStorage*[T](this: vtkSparseArray[T];
                             dimension: vtkSparseArrayDimensionT): ptr vtkSparseArrayCoordinateT {.
    noSideEffect, importcpp: "GetCoordinateStorage", header: "vtkSparseArray.h".}
proc GetCoordinateStorage*[T](this: var vtkSparseArray[T];
                             dimension: vtkSparseArrayDimensionT): ptr vtkSparseArrayCoordinateT {.
    importcpp: "GetCoordinateStorage", header: "vtkSparseArray.h".}
proc GetValueStorage*[T](this: vtkSparseArray[T]): ptr T {.noSideEffect,
    importcpp: "GetValueStorage", header: "vtkSparseArray.h".}
proc GetValueStorage*[T](this: var vtkSparseArray[T]): ptr T {.
    importcpp: "GetValueStorage", header: "vtkSparseArray.h".}
proc ReserveStorage*[T](this: var vtkSparseArray[T];
                       value_count: vtkSparseArraySizeT) {.
    importcpp: "ReserveStorage", header: "vtkSparseArray.h".}
proc SetExtentsFromContents*[T](this: var vtkSparseArray[T]) {.
    importcpp: "SetExtentsFromContents", header: "vtkSparseArray.h".}
proc SetExtents*[T](this: var vtkSparseArray[T]; extents: vtkArrayExtents) {.
    importcpp: "SetExtents", header: "vtkSparseArray.h".}
proc AddValue*[T](this: var vtkSparseArray[T]; i: vtkSparseArrayCoordinateT; value: T) {.
    importcpp: "AddValue", header: "vtkSparseArray.h".}
proc AddValue*[T](this: var vtkSparseArray[T]; i: vtkSparseArrayCoordinateT;
                 j: vtkSparseArrayCoordinateT; value: T) {.importcpp: "AddValue",
    header: "vtkSparseArray.h".}
proc AddValue*[T](this: var vtkSparseArray[T]; i: vtkSparseArrayCoordinateT;
                 j: vtkSparseArrayCoordinateT; k: vtkSparseArrayCoordinateT;
                 value: T) {.importcpp: "AddValue", header: "vtkSparseArray.h".}
proc AddValue*[T](this: var vtkSparseArray[T]; coordinates: vtkArrayCoordinates;
                 value: T) {.importcpp: "AddValue", header: "vtkSparseArray.h".}
proc Validate*[T](this: var vtkSparseArray[T]): bool {.importcpp: "Validate",
    header: "vtkSparseArray.h".}
import
  vtkSparseArray

##  VTK-HeaderTest-Exclude: vtkSparseArray.h
