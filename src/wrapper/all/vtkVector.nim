## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkVector.h
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
##  @class   vtkVector
##  @brief   templated base type for storage of vectors.
##
##
##  This class is a templated data type for storing and manipulating fixed size
##  vectors, which can be used to represent two and three dimensional points. The
##  memory layout is a contiguous array of the specified type, such that a
##  float[2] can be cast to a vtkVector2f and manipulated. Also a float[6] could
##  be cast and used as a vtkVector2f[3].
##

## !!!Ignored construct:  # vtkVector_h [NewLine] # vtkVector_h [NewLine] # vtkObject.h  for legacy macros # vtkTuple.h [NewLine] # < cmath >  For math functions [NewLine] template < typename T , int Size > [end of template] class vtkVector : public vtkTuple < T , Size > [end of template] { public : vtkVector ( ) = default ; *
##  Initialize all of the vector's elements with the supplied scalar.
##  explicit vtkVector ( const T & scalar ) : vtkTuple < T , Size > [end of template] ( scalar ) { } *
##  Initialize the vector's elements with the elements of the supplied array.
##  Note that the supplied pointer must contain at least as many elements as
##  the vector, or it will result in access to out of bounds memory.
##  explicit vtkVector ( const T * init ) : vtkTuple < T , Size > [end of template] ( init ) { } /@{ *
##  Get the squared norm of the vector.
##  T SquaredNorm ( ) const { T result = 0 ; for ( int i = 0 ; i < Size ; ++ i ) { result += this -> Data [ i ] * this -> Data [ i ] ; } return result ; } /@} *
##  Get the norm of the vector, i.e. its length.
##  double Norm ( ) const { return sqrt ( static_cast < double > [end of template] ( this -> SquaredNorm ( ) ) ) ; } /@{ *
##  Normalize the vector in place.
##  \return The length of the vector.
##  double Normalize ( ) { const double norm ( this -> Norm ( ) ) ; if ( norm == 0.0 ) { return 0.0 ; } const double inv ( 1.0 / norm ) ; for ( int i = 0 ; i < Size ; ++ i ) { this -> Data [ i ] = static_cast < T > [end of template] ( this -> Data [ i ] * inv ) ; } return norm ; } /@} /@{ *
##  Return the normalized form of this vector.
##  \return The normalized form of this vector.
##  vtkVector < T , Size > [end of template] Normalized ( ) const { vtkVector < T , Size > [end of template] temp ( * this ) ; temp . Normalize ( ) ; return temp ; } /@} /@{ *
##  The dot product of this and the supplied vector.
##  T Dot ( const vtkVector < T , Size > [end of template] & other ) const { T result ( 0 ) ; for ( int i = 0 ; i < Size ; ++ i ) { result += this -> Data [ i ] * other [ i ] ; } return result ; } /@} /@{ *
##  Cast the vector to the specified type, returning the result.
##  template < typename TR > [end of template] vtkVector < TR , Size > [end of template] Cast ( ) const { vtkVector < TR , Size > [end of template] result ; for ( int i = 0 ; i < Size ; ++ i ) { result [ i ] = static_cast < TR > [end of template] ( this -> Data [ i ] ) ; } return result ; } /@} } ;
## Error: expected ';'!!!

##  .NAME vtkVector2 - templated base type for storage of 2D vectors.
##

type
  vtkVector2*[T] {.importcpp: "vtkVector2<\'0>", header: "vtkVector.h", bycopy.} = object of vtkVector[
      T, 2]


proc constructvtkVector2*[T](): vtkVector2[T] {.constructor,
    importcpp: "vtkVector2<\'*0>(@)", header: "vtkVector.h".}
proc constructvtkVector2*[T](scalar: T): vtkVector2[T] {.constructor,
    importcpp: "vtkVector2<\'*0>(@)", header: "vtkVector.h".}
proc constructvtkVector2*[T](init: ptr T): vtkVector2[T] {.constructor,
    importcpp: "vtkVector2<\'*0>(@)", header: "vtkVector.h".}
proc constructvtkVector2*[T](x: T; y: T): vtkVector2[T] {.constructor,
    importcpp: "vtkVector2<\'*0>(@)", header: "vtkVector.h".}
proc Set*[T](this: var vtkVector2[T]; x: T; y: T) {.importcpp: "Set",
    header: "vtkVector.h".}
proc SetX*[T](this: var vtkVector2[T]; x: T) {.importcpp: "SetX", header: "vtkVector.h".}
proc GetX*[T](this: vtkVector2[T]): T {.noSideEffect, importcpp: "GetX",
                                    header: "vtkVector.h".}
proc SetY*[T](this: var vtkVector2[T]; y: T) {.importcpp: "SetY", header: "vtkVector.h".}
proc GetY*[T](this: vtkVector2[T]): T {.noSideEffect, importcpp: "GetY",
                                    header: "vtkVector.h".}
proc `<`*[T](this: vtkVector2[T]; v: vtkVector2[T]): bool {.noSideEffect,
    importcpp: "(# < #)", header: "vtkVector.h".}
##  .NAME vtkVector3 - templated base type for storage of 3D vectors.
##

type
  vtkVector3*[T] {.importcpp: "vtkVector3<\'0>", header: "vtkVector.h", bycopy.} = object of vtkVector[
      T, 3]


proc constructvtkVector3*[T](): vtkVector3[T] {.constructor,
    importcpp: "vtkVector3<\'*0>(@)", header: "vtkVector.h".}
proc constructvtkVector3*[T](scalar: T): vtkVector3[T] {.constructor,
    importcpp: "vtkVector3<\'*0>(@)", header: "vtkVector.h".}
proc constructvtkVector3*[T](init: ptr T): vtkVector3[T] {.constructor,
    importcpp: "vtkVector3<\'*0>(@)", header: "vtkVector.h".}
proc constructvtkVector3*[T](x: T; y: T; z: T): vtkVector3[T] {.constructor,
    importcpp: "vtkVector3<\'*0>(@)", header: "vtkVector.h".}
proc Set*[T](this: var vtkVector3[T]; x: T; y: T; z: T) {.importcpp: "Set",
    header: "vtkVector.h".}
proc SetX*[T](this: var vtkVector3[T]; x: T) {.importcpp: "SetX", header: "vtkVector.h".}
proc GetX*[T](this: vtkVector3[T]): T {.noSideEffect, importcpp: "GetX",
                                    header: "vtkVector.h".}
proc SetY*[T](this: var vtkVector3[T]; y: T) {.importcpp: "SetY", header: "vtkVector.h".}
proc GetY*[T](this: vtkVector3[T]): T {.noSideEffect, importcpp: "GetY",
                                    header: "vtkVector.h".}
proc SetZ*[T](this: var vtkVector3[T]; z: T) {.importcpp: "SetZ", header: "vtkVector.h".}
proc GetZ*[T](this: vtkVector3[T]): T {.noSideEffect, importcpp: "GetZ",
                                    header: "vtkVector.h".}
proc Cross*[T](this: vtkVector3[T]; other: vtkVector3[T]): vtkVector3[T] {.
    noSideEffect, importcpp: "Cross", header: "vtkVector.h".}
proc `<`*[T](this: vtkVector3[T]; v: vtkVector3[T]): bool {.noSideEffect,
    importcpp: "(# < #)", header: "vtkVector.h".}
##  .NAME vtkVector4 - templated base type for storage of 4D vectors.
##

type
  vtkVector4*[T] {.importcpp: "vtkVector4<\'0>", header: "vtkVector.h", bycopy.} = object of vtkVector[
      T, 4]


proc constructvtkVector4*[T](): vtkVector4[T] {.constructor,
    importcpp: "vtkVector4<\'*0>(@)", header: "vtkVector.h".}
proc constructvtkVector4*[T](scalar: T): vtkVector4[T] {.constructor,
    importcpp: "vtkVector4<\'*0>(@)", header: "vtkVector.h".}
proc constructvtkVector4*[T](init: ptr T): vtkVector4[T] {.constructor,
    importcpp: "vtkVector4<\'*0>(@)", header: "vtkVector.h".}
proc constructvtkVector4*[T](x: T; y: T; z: T; w: T): vtkVector4[T] {.constructor,
    importcpp: "vtkVector4<\'*0>(@)", header: "vtkVector.h".}
proc Set*[T](this: var vtkVector4[T]; x: T; y: T; z: T; w: T) {.importcpp: "Set",
    header: "vtkVector.h".}
proc SetX*[T](this: var vtkVector4[T]; x: T) {.importcpp: "SetX", header: "vtkVector.h".}
proc GetX*[T](this: vtkVector4[T]): T {.noSideEffect, importcpp: "GetX",
                                    header: "vtkVector.h".}
proc SetY*[T](this: var vtkVector4[T]; y: T) {.importcpp: "SetY", header: "vtkVector.h".}
proc GetY*[T](this: vtkVector4[T]): T {.noSideEffect, importcpp: "GetY",
                                    header: "vtkVector.h".}
proc SetZ*[T](this: var vtkVector4[T]; z: T) {.importcpp: "SetZ", header: "vtkVector.h".}
proc GetZ*[T](this: vtkVector4[T]): T {.noSideEffect, importcpp: "GetZ",
                                    header: "vtkVector.h".}
proc SetW*[T](this: var vtkVector4[T]; w: T) {.importcpp: "SetW", header: "vtkVector.h".}
proc GetW*[T](this: vtkVector4[T]): T {.noSideEffect, importcpp: "GetW",
                                    header: "vtkVector.h".}
## *
##  Some inline functions for the derived types.
##

template vtkVectorNormalized*(vectorType, `type`, size: untyped): untyped =
  vectorType

## !!!Ignored construct:  Normalized ( ) const { return vectorType ( vtkVector < type , size > :: Normalized ( ) . GetData ( ) ) ; } [NewLine] # vtkVectorDerivedMacro ( vectorType , type , size ) vtkVectorNormalized ( vectorType , type , size ) ;
## Error: expected ';'!!!

## !!!Ignored construct:  explicit vectorType ( type s ) : Superclass ( s ) { } explicit vectorType ( const type * i ) : Superclass ( i ) { } explicit vectorType ( const vtkTuple < type , size > & o ) : Superclass ( o . GetData ( ) ) { } vectorType ( const vtkVector < type , size > & o ) : Superclass ( o . GetData ( ) ) { } [NewLine] /@{ *
##  Some derived classes for the different vectors commonly used.
##  class vtkVector2i : public vtkVector2 < int > { public : typedef vtkVector2 < int > Superclass ; vtkVector2i ( ) = default ; vtkVector2i ( int x , int y ) : vtkVector2 < int > ( x , y ) { } vtkVectorDerivedMacro ( vtkVector2i , int , 2 ) ; } ;
## Error: expected ';'!!!

## /@}

type
  vtkVector2f* {.importcpp: "vtkVector2f", header: "vtkVector.h", bycopy.} = object of vtkVector2[
      cfloat]

  vtkVector2fSuperclass* = vtkVector2[cfloat]

proc constructvtkVector2f*(): vtkVector2f {.constructor,
    importcpp: "vtkVector2f(@)", header: "vtkVector.h".}
proc constructvtkVector2f*(x: cfloat; y: cfloat): vtkVector2f {.constructor,
    importcpp: "vtkVector2f(@)", header: "vtkVector.h".}
## !!!Ignored construct:  vtkVectorDerivedMacro ( vtkVector2f , float , 2 ) ;
## Error: token expected: ) but got: ,!!!

type
  vtkVector2d* {.importcpp: "vtkVector2d", header: "vtkVector.h", bycopy.} = object of vtkVector2[
      cdouble]

  vtkVector2dSuperclass* = vtkVector2[cdouble]

proc constructvtkVector2d*(): vtkVector2d {.constructor,
    importcpp: "vtkVector2d(@)", header: "vtkVector.h".}
proc constructvtkVector2d*(x: cdouble; y: cdouble): vtkVector2d {.constructor,
    importcpp: "vtkVector2d(@)", header: "vtkVector.h".}
## !!!Ignored construct:  vtkVectorDerivedMacro ( vtkVector2d , double , 2 ) ;
## Error: token expected: ) but got: ,!!!

template vtkVector3Cross*(vectorType, `type`: untyped): untyped =
  vectorType

## !!!Ignored construct:  Cross ( const vectorType & other ) const { return vectorType ( vtkVector3 < type > :: Cross ( other ) . GetData ( ) ) ; } [NewLine] class vtkVector3i : public vtkVector3 < int > { public : typedef vtkVector3 < int > Superclass ; vtkVector3i ( ) = default ; vtkVector3i ( int x , int y , int z ) : vtkVector3 < int > ( x , y , z ) { } vtkVectorDerivedMacro ( vtkVector3i , int , 3 ) ; vtkVector3Cross ( vtkVector3i , int ) ; } ;
## Error: expected ';'!!!

type
  vtkVector3f* {.importcpp: "vtkVector3f", header: "vtkVector.h", bycopy.} = object of vtkVector3[
      cfloat]

  vtkVector3fSuperclass* = vtkVector3[cfloat]

proc constructvtkVector3f*(): vtkVector3f {.constructor,
    importcpp: "vtkVector3f(@)", header: "vtkVector.h".}
proc constructvtkVector3f*(x: cfloat; y: cfloat; z: cfloat): vtkVector3f {.constructor,
    importcpp: "vtkVector3f(@)", header: "vtkVector.h".}
## !!!Ignored construct:  vtkVectorDerivedMacro ( vtkVector3f , float , 3 ) ;
## Error: token expected: ) but got: ,!!!

## !!!Ignored construct:  vtkVector3Cross ( vtkVector3f , float ) ;
## Error: token expected: ) but got: ,!!!

type
  vtkVector3d* {.importcpp: "vtkVector3d", header: "vtkVector.h", bycopy.} = object of vtkVector3[
      cdouble]

  vtkVector3dSuperclass* = vtkVector3[cdouble]

proc constructvtkVector3d*(): vtkVector3d {.constructor,
    importcpp: "vtkVector3d(@)", header: "vtkVector.h".}
proc constructvtkVector3d*(x: cdouble; y: cdouble; z: cdouble): vtkVector3d {.
    constructor, importcpp: "vtkVector3d(@)", header: "vtkVector.h".}
## !!!Ignored construct:  vtkVectorDerivedMacro ( vtkVector3d , double , 3 ) ;
## Error: token expected: ) but got: ,!!!

## !!!Ignored construct:  vtkVector3Cross ( vtkVector3d , double ) ;
## Error: token expected: ) but got: ,!!!

type
  vtkVector4i* {.importcpp: "vtkVector4i", header: "vtkVector.h", bycopy.} = object of vtkVector4[
      cint]

  vtkVector4iSuperclass* = vtkVector4[cint]

proc constructvtkVector4i*(): vtkVector4i {.constructor,
    importcpp: "vtkVector4i(@)", header: "vtkVector.h".}
proc constructvtkVector4i*(x: cint; y: cint; z: cint; w: cint): vtkVector4i {.constructor,
    importcpp: "vtkVector4i(@)", header: "vtkVector.h".}
## !!!Ignored construct:  vtkVectorDerivedMacro ( vtkVector4i , int , 4 ) ;
## Error: token expected: ) but got: ,!!!

type
  vtkVector4d* {.importcpp: "vtkVector4d", header: "vtkVector.h", bycopy.} = object of vtkVector4[
      cdouble]

  Superclass* = vtkVector4[cdouble]

proc constructvtkVector4d*(): vtkVector4d {.constructor,
    importcpp: "vtkVector4d(@)", header: "vtkVector.h".}
proc constructvtkVector4d*(x: cdouble; y: cdouble; z: cdouble; w: cdouble): vtkVector4d {.
    constructor, importcpp: "vtkVector4d(@)", header: "vtkVector.h".}
## !!!Ignored construct:  vtkVectorDerivedMacro ( vtkVector4d , double , 4 ) ;
## Error: token expected: ) but got: ,!!!
