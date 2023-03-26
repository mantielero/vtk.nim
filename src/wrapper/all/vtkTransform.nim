## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTransform.h
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
##  @class   vtkTransform
##  @brief   describes linear transformations via a 4x4 matrix
##
##  A vtkTransform can be used to describe the full range of linear (also
##  known as affine) coordinate transformations in three dimensions,
##  which are internally represented as a 4x4 homogeneous transformation
##  matrix.  When you create a new vtkTransform, it is always initialized
##  to the identity transformation.
##  <P>The SetInput() method allows you to set another transform,
##  instead of the identity transform, to be the base transformation.
##  There is a pipeline mechanism to ensure that when the input is
##  modified, the current transformation will be updated accordingly.
##  This pipeline mechanism is also supported by the Concatenate() method.
##  <P>Most of the methods for manipulating this transformation,
##  e.g. Translate, Rotate, and Concatenate, can operate in either
##  PreMultiply (the default) or PostMultiply mode.  In PreMultiply
##  mode, the translation, concatenation, etc. will occur before any
##  transformations which are represented by the current matrix.  In
##  PostMultiply mode, the additional transformation will occur after
##  any transformations represented by the current matrix.
##  <P>This class performs all of its operations in a right handed
##  coordinate system with right handed rotations. Some other graphics
##  libraries use left handed coordinate systems and rotations.
##  @sa
##  vtkPerspectiveTransform vtkGeneralTransform vtkMatrix4x4
##  vtkTransformCollection vtkTransformFilter vtkTransformPolyDataFilter
##  vtkImageReslice
##

import
  vtkCommonTransformsModule, vtkLinearTransform, vtkMatrix4x4

type
  vtkTransform* {.importcpp: "vtkTransform", header: "vtkTransform.h", bycopy.} = object of vtkLinearTransform
    vtkTransform* {.importc: "vtkTransform".}: VTK_NEWINSTANCE
    ##  this allows us to check whether people have been fooling
    ##  around with our matrix


proc New*(): ptr vtkTransform {.importcpp: "vtkTransform::New(@)",
                            header: "vtkTransform.h".}
type
  vtkTransformSuperclass* = vtkLinearTransform

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTransform::IsTypeOf(@)", header: "vtkTransform.h".}
proc IsA*(this: var vtkTransform; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkTransform.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTransform {.
    importcpp: "vtkTransform::SafeDownCast(@)", header: "vtkTransform.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTransform :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkLinearTransform :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTransform :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTransform :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTransform; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTransform.h".}
proc Identity*(this: var vtkTransform) {.importcpp: "Identity",
                                     header: "vtkTransform.h".}
proc Inverse*(this: var vtkTransform) {.importcpp: "Inverse", header: "vtkTransform.h".}
proc Translate*(this: var vtkTransform; x: cdouble; y: cdouble; z: cdouble) {.
    importcpp: "Translate", header: "vtkTransform.h".}
proc Translate*(this: var vtkTransform; x: array[3, cdouble]) {.importcpp: "Translate",
    header: "vtkTransform.h".}
proc Translate*(this: var vtkTransform; x: array[3, cfloat]) {.importcpp: "Translate",
    header: "vtkTransform.h".}
proc RotateWXYZ*(this: var vtkTransform; angle: cdouble; x: cdouble; y: cdouble;
                z: cdouble) {.importcpp: "RotateWXYZ", header: "vtkTransform.h".}
proc RotateWXYZ*(this: var vtkTransform; angle: cdouble; axis: array[3, cdouble]) {.
    importcpp: "RotateWXYZ", header: "vtkTransform.h".}
proc RotateWXYZ*(this: var vtkTransform; angle: cdouble; axis: array[3, cfloat]) {.
    importcpp: "RotateWXYZ", header: "vtkTransform.h".}
proc RotateX*(this: var vtkTransform; angle: cdouble) {.importcpp: "RotateX",
    header: "vtkTransform.h".}
proc RotateY*(this: var vtkTransform; angle: cdouble) {.importcpp: "RotateY",
    header: "vtkTransform.h".}
proc RotateZ*(this: var vtkTransform; angle: cdouble) {.importcpp: "RotateZ",
    header: "vtkTransform.h".}
proc Scale*(this: var vtkTransform; x: cdouble; y: cdouble; z: cdouble) {.
    importcpp: "Scale", header: "vtkTransform.h".}
proc Scale*(this: var vtkTransform; s: array[3, cdouble]) {.importcpp: "Scale",
    header: "vtkTransform.h".}
proc Scale*(this: var vtkTransform; s: array[3, cfloat]) {.importcpp: "Scale",
    header: "vtkTransform.h".}
proc SetMatrix*(this: var vtkTransform; matrix: ptr vtkMatrix4x4) {.
    importcpp: "SetMatrix", header: "vtkTransform.h".}
proc SetMatrix*(this: var vtkTransform; elements: array[16, cdouble]) {.
    importcpp: "SetMatrix", header: "vtkTransform.h".}
proc Concatenate*(this: var vtkTransform; matrix: ptr vtkMatrix4x4) {.
    importcpp: "Concatenate", header: "vtkTransform.h".}
proc Concatenate*(this: var vtkTransform; elements: array[16, cdouble]) {.
    importcpp: "Concatenate", header: "vtkTransform.h".}
proc Concatenate*(this: var vtkTransform; transform: ptr vtkLinearTransform) {.
    importcpp: "Concatenate", header: "vtkTransform.h".}
proc PreMultiply*(this: var vtkTransform) {.importcpp: "PreMultiply",
                                        header: "vtkTransform.h".}
proc PostMultiply*(this: var vtkTransform) {.importcpp: "PostMultiply",
    header: "vtkTransform.h".}
proc GetNumberOfConcatenatedTransforms*(this: var vtkTransform): cint {.
    importcpp: "GetNumberOfConcatenatedTransforms", header: "vtkTransform.h".}
proc GetConcatenatedTransform*(this: var vtkTransform; i: cint): ptr vtkLinearTransform {.
    importcpp: "GetConcatenatedTransform", header: "vtkTransform.h".}
proc GetOrientation*(this: var vtkTransform; orient: array[3, cdouble]) {.
    importcpp: "GetOrientation", header: "vtkTransform.h".}
proc GetOrientation*(this: var vtkTransform; orient: array[3, cfloat]) {.
    importcpp: "GetOrientation", header: "vtkTransform.h".}
## !!!Ignored construct:  double * GetOrientation ( ) VTK_SIZEHINT ( 3 ) { this -> GetOrientation ( this -> ReturnValue ) ; return this -> ReturnValue ; } /@} *
##  Convenience function to get the x, y, z orientation angles from
##  a transformation matrix as an array of three floating point values.
##  static void GetOrientation ( double orient [ 3 ] , vtkMatrix4x4 * matrix ) ;
## Error: expected ';'!!!

proc GetOrientationWXYZ*(this: var vtkTransform; wxyz: array[4, cdouble]) {.
    importcpp: "GetOrientationWXYZ", header: "vtkTransform.h".}
proc GetOrientationWXYZ*(this: var vtkTransform; wxyz: array[4, cfloat]) {.
    importcpp: "GetOrientationWXYZ", header: "vtkTransform.h".}
## !!!Ignored construct:  double * GetOrientationWXYZ ( ) VTK_SIZEHINT ( 4 ) { this -> GetOrientationWXYZ ( this -> ReturnValue ) ; return this -> ReturnValue ; } /@} /@{ *
##  Return the position from the current transformation matrix as an array
##  of three floating point numbers. This is simply returning the translation
##  component of the 4x4 matrix.
##  void GetPosition ( double pos [ 3 ] ) ;
## Error: expected ';'!!!

proc GetPosition*(this: var vtkTransform; pos: array[3, cfloat]) {.
    importcpp: "GetPosition", header: "vtkTransform.h".}
## !!!Ignored construct:  double * GetPosition ( ) VTK_SIZEHINT ( 3 ) { this -> GetPosition ( this -> ReturnValue ) ; return this -> ReturnValue ; } /@} /@{ *
##  Return the scale factors of the current transformation matrix as
##  an array of three float numbers.  These scale factors are not necessarily
##  about the x, y, and z axes unless unless the scale transformation was
##  applied before any rotations.
##  void GetScale ( double scale [ 3 ] ) ;
## Error: expected ';'!!!

proc GetScale*(this: var vtkTransform; scale: array[3, cfloat]) {.
    importcpp: "GetScale", header: "vtkTransform.h".}
## !!!Ignored construct:  double * GetScale ( ) VTK_SIZEHINT ( 3 ) { this -> GetScale ( this -> ReturnValue ) ; return this -> ReturnValue ; } /@} *
##  Return a matrix which is the inverse of the current transformation
##  matrix.
##  void GetInverse ( vtkMatrix4x4 * inverse ) ;
## Error: expected ';'!!!

proc GetTranspose*(this: var vtkTransform; transpose: ptr vtkMatrix4x4) {.
    importcpp: "GetTranspose", header: "vtkTransform.h".}
proc SetInput*(this: var vtkTransform; input: ptr vtkLinearTransform) {.
    importcpp: "SetInput", header: "vtkTransform.h".}
proc GetInput*(this: var vtkTransform): ptr vtkLinearTransform {.
    importcpp: "GetInput", header: "vtkTransform.h".}
proc GetInverseFlag*(this: var vtkTransform): cint {.importcpp: "GetInverseFlag",
    header: "vtkTransform.h".}
proc Push*(this: var vtkTransform) {.importcpp: "Push", header: "vtkTransform.h".}
proc Pop*(this: var vtkTransform) {.importcpp: "Pop", header: "vtkTransform.h".}
proc CircuitCheck*(this: var vtkTransform; transform: ptr vtkAbstractTransform): cint {.
    importcpp: "CircuitCheck", header: "vtkTransform.h".}
proc GetInverse*(this: var vtkTransform): ptr vtkAbstractTransform {.
    importcpp: "GetInverse", header: "vtkTransform.h".}
proc MakeTransform*(this: var vtkTransform): ptr vtkAbstractTransform {.
    importcpp: "MakeTransform", header: "vtkTransform.h".}
proc GetMTime*(this: var vtkTransform): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkTransform.h".}
proc MultiplyPoint*(this: var vtkTransform; `in`: array[4, cfloat];
                   `out`: array[4, cfloat]) {.importcpp: "MultiplyPoint",
    header: "vtkTransform.h".}
proc MultiplyPoint*(this: var vtkTransform; `in`: array[4, cdouble];
                   `out`: array[4, cdouble]) {.importcpp: "MultiplyPoint",
    header: "vtkTransform.h".}