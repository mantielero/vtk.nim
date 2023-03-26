## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTypedArray.h
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
##  @class   vtkTypedArray
##  @brief   Provides a type-specific interface to N-way arrays
##
##
##  vtkTypedArray provides an interface for retrieving and updating data in an
##  arbitrary-dimension array.  It derives from vtkArray and is templated on the
##  type of value stored in the array.
##
##  Methods are provided for retrieving and updating array values based either
##  on their array coordinates, or on a 1-dimensional integer index.  The latter
##  approach can be used to iterate over the values in an array in arbitrary order,
##  which is useful when writing filters that operate efficiently on sparse arrays
##  and arrays that can have any number of dimensions.
##
##  Special overloaded methods provide simple access for arrays with one, two, or
##  three dimensions.
##
##  @sa
##  vtkArray, vtkDenseArray, vtkSparseArray
##
##  @par Thanks:
##  Developed by Timothy M. Shead (tshead@sandia.gov) at Sandia National Laboratories.
##

import
  vtkArray

discard "forward decl of vtkArrayCoordinates"
type
  vtkTypedArray*[T] {.importcpp: "vtkTypedArray<\'0>", header: "vtkTypedArray.h",
                     bycopy.} = object of vtkArray
    vtkTypedArray* {.importc: "vtkTypedArray".}: VTK_NEWINSTANCE

  vtkTypedArraySuperclass* = vtkArray

proc IsTypeOf*[T](`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTypedArray::IsTypeOf(@)", header: "vtkTypedArray.h".}
proc IsA*[T](this: var vtkTypedArray[T]; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTypedArray.h".}
proc SafeDownCast*[T](o: ptr vtkObjectBase): ptr vtkTypedArray[T] {.
    importcpp: "vtkTypedArray::SafeDownCast(@)", header: "vtkTypedArray.h".}
## !!!Ignored construct:  < T > * NewInstance ( ) const { return vtkTypedArray < T > :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( typeid ( vtkTypedArray < T > ) . name ( ) , type ) ) { return 0 ; } return 1 + vtkArray :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTypedArray < T > :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : ;
## Error: identifier expected, but got: <!!!

type
  vtkTypedArrayCoordinateT* = CoordinateT
  vtkTypedArraySizeT* = SizeT

## using statement

## using statement

proc PrintSelf*[T](this: var vtkTypedArray[T]; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTypedArray.h".}
proc GetVariantValue*[T](this: var vtkTypedArray[T];
                        coordinates: vtkArrayCoordinates): vtkVariant {.
    importcpp: "GetVariantValue", header: "vtkTypedArray.h".}
proc GetVariantValueN*[T](this: var vtkTypedArray[T]; n: vtkTypedArraySizeT): vtkVariant {.
    importcpp: "GetVariantValueN", header: "vtkTypedArray.h".}
proc SetVariantValue*[T](this: var vtkTypedArray[T];
                        coordinates: vtkArrayCoordinates; value: vtkVariant) {.
    importcpp: "SetVariantValue", header: "vtkTypedArray.h".}
proc SetVariantValueN*[T](this: var vtkTypedArray[T]; n: vtkTypedArraySizeT;
                         value: vtkVariant) {.importcpp: "SetVariantValueN",
    header: "vtkTypedArray.h".}
proc CopyValue*[T](this: var vtkTypedArray[T]; source: ptr vtkArray;
                  source_coordinates: vtkArrayCoordinates;
                  target_coordinates: vtkArrayCoordinates) {.
    importcpp: "CopyValue", header: "vtkTypedArray.h".}
proc CopyValue*[T](this: var vtkTypedArray[T]; source: ptr vtkArray;
                  source_index: vtkTypedArraySizeT;
                  target_coordinates: vtkArrayCoordinates) {.
    importcpp: "CopyValue", header: "vtkTypedArray.h".}
proc CopyValue*[T](this: var vtkTypedArray[T]; source: ptr vtkArray;
                  source_coordinates: vtkArrayCoordinates;
                  target_index: vtkTypedArraySizeT) {.importcpp: "CopyValue",
    header: "vtkTypedArray.h".}
proc GetValue*[T](this: var vtkTypedArray[T]; i: vtkTypedArrayCoordinateT): T {.
    importcpp: "GetValue", header: "vtkTypedArray.h".}
proc GetValue*[T](this: var vtkTypedArray[T]; i: vtkTypedArrayCoordinateT;
                 j: vtkTypedArrayCoordinateT): T {.importcpp: "GetValue",
    header: "vtkTypedArray.h".}
proc GetValue*[T](this: var vtkTypedArray[T]; i: vtkTypedArrayCoordinateT;
                 j: vtkTypedArrayCoordinateT; k: vtkTypedArrayCoordinateT): T {.
    importcpp: "GetValue", header: "vtkTypedArray.h".}
proc GetValue*[T](this: var vtkTypedArray[T]; coordinates: vtkArrayCoordinates): T {.
    importcpp: "GetValue", header: "vtkTypedArray.h".}
proc GetValueN*[T](this: var vtkTypedArray[T]; n: vtkTypedArraySizeT): T {.
    importcpp: "GetValueN", header: "vtkTypedArray.h".}
proc SetValue*[T](this: var vtkTypedArray[T]; i: vtkTypedArrayCoordinateT; value: T) {.
    importcpp: "SetValue", header: "vtkTypedArray.h".}
proc SetValue*[T](this: var vtkTypedArray[T]; i: vtkTypedArrayCoordinateT;
                 j: vtkTypedArrayCoordinateT; value: T) {.importcpp: "SetValue",
    header: "vtkTypedArray.h".}
proc SetValue*[T](this: var vtkTypedArray[T]; i: vtkTypedArrayCoordinateT;
                 j: vtkTypedArrayCoordinateT; k: vtkTypedArrayCoordinateT; value: T) {.
    importcpp: "SetValue", header: "vtkTypedArray.h".}
proc SetValue*[T](this: var vtkTypedArray[T]; coordinates: vtkArrayCoordinates;
                 value: T) {.importcpp: "SetValue", header: "vtkTypedArray.h".}
proc SetValueN*[T](this: var vtkTypedArray[T]; n: vtkTypedArraySizeT; value: T) {.
    importcpp: "SetValueN", header: "vtkTypedArray.h".}
import
  vtkTypedArray

##  VTK-HeaderTest-Exclude: vtkTypedArray.h
