## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAbstractTransform.h
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
##  @class   vtkAbstractTransform
##  @brief   superclass for all geometric transformations
##
##  vtkAbstractTransform is the superclass for all VTK geometric
##  transformations.  The VTK transform hierarchy is split into two
##  major branches: warp transformations and homogeneous (including linear)
##  transformations.  The latter can be represented in terms of a 4x4
##  transformation matrix, the former cannot.
##  <p>Transformations can be pipelined through two mechanisms:
##  <p>1) GetInverse() returns the pipelined
##  inverse of a transformation i.e. if you modify the original transform,
##  any transform previously returned by the GetInverse() method will
##  automatically update itself according to the change.
##  <p>2) You can do pipelined concatenation of transformations through
##  the vtkGeneralTransform class, the vtkPerspectiveTransform class,
##  or the vtkTransform class.
##  @sa
##  vtkGeneralTransform vtkWarpTransform vtkHomogeneousTransform
##  vtkLinearTransform vtkIdentityTransform
##  vtkTransformPolyDataFilter vtkTransformFilter vtkImageReslice
##  vtkImplicitFunction
##

import
  vtkCommonTransformsModule, vtkObject

discard "forward decl of vtkDataArray"
discard "forward decl of vtkMatrix4x4"
discard "forward decl of vtkPoints"
type
  vtkAbstractTransform* {.importcpp: "vtkAbstractTransform",
                         header: "vtkAbstractTransform.h", bycopy.} = object of vtkObject ##  We need to record the time of the last update, and we also need
                                                                                   ##  to do mutex locking so updates don't collide.  These are private
                                                                                   ##  because Update() is not virtual.
                                                                                   ##  If DependsOnInverse is set, then this transform object will
                                                                                   ##  check its inverse on every update, and update itself accordingly
                                                                                   ##  if necessary.
    vtkAbstractTransform* {.importc: "vtkAbstractTransform".}: VTK_NEWINSTANCE
    vtkAbstractTransform* {.importc: "vtkAbstractTransform".}: VTK_NEWINSTANCE
    ##  MyInverse is a transform which is the inverse of this one.

  vtkAbstractTransformSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAbstractTransform::IsTypeOf(@)",
    header: "vtkAbstractTransform.h".}
proc IsA*(this: var vtkAbstractTransform; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkAbstractTransform.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAbstractTransform {.
    importcpp: "vtkAbstractTransform::SafeDownCast(@)",
    header: "vtkAbstractTransform.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAbstractTransform :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAbstractTransform :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAbstractTransform :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAbstractTransform; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkAbstractTransform.h".}
proc TransformPoint*(this: var vtkAbstractTransform; `in`: array[3, cfloat];
                    `out`: array[3, cfloat]) {.importcpp: "TransformPoint",
    header: "vtkAbstractTransform.h".}
proc TransformPoint*(this: var vtkAbstractTransform; `in`: array[3, cdouble];
                    `out`: array[3, cdouble]) {.importcpp: "TransformPoint",
    header: "vtkAbstractTransform.h".}
## !!!Ignored construct:  *
##  Apply the transformation to a double-precision coordinate.
##  Use this if you are programming in Python or Java.
##  double * TransformPoint ( double x , double y , double z ) VTK_SIZEHINT ( 3 ) { return this -> TransformDoublePoint ( x , y , z ) ; } double * TransformPoint ( const double point [ 3 ] ) VTK_SIZEHINT ( 3 ) { return this -> TransformPoint ( point [ 0 ] , point [ 1 ] , point [ 2 ] ) ; } /@{ *
##  Apply the transformation to an (x,y,z) coordinate.
##  Use this if you are programming in Python or Java.
##  float * TransformFloatPoint ( float x , float y , float z ) VTK_SIZEHINT ( 3 ) { this -> InternalFloatPoint [ 0 ] = x ; this -> InternalFloatPoint [ 1 ] = y ; this -> InternalFloatPoint [ 2 ] = z ; this -> TransformPoint ( this -> InternalFloatPoint , this -> InternalFloatPoint ) ; return this -> InternalFloatPoint ; } float * TransformFloatPoint ( const float point [ 3 ] ) VTK_SIZEHINT ( 3 ) { return this -> TransformFloatPoint ( point [ 0 ] , point [ 1 ] , point [ 2 ] ) ; } /@} /@{ *
##  Apply the transformation to a double-precision (x,y,z) coordinate.
##  Use this if you are programming in Python or Java.
##  double * TransformDoublePoint ( double x , double y , double z ) VTK_SIZEHINT ( 3 ) { this -> InternalDoublePoint [ 0 ] = x ; this -> InternalDoublePoint [ 1 ] = y ; this -> InternalDoublePoint [ 2 ] = z ; this -> TransformPoint ( this -> InternalDoublePoint , this -> InternalDoublePoint ) ; return this -> InternalDoublePoint ; } double * TransformDoublePoint ( const double point [ 3 ] ) VTK_SIZEHINT ( 3 ) { return this -> TransformDoublePoint ( point [ 0 ] , point [ 1 ] , point [ 2 ] ) ; } /@} /@{ *
##  Apply the transformation to a normal at the specified vertex.  If the
##  transformation is a vtkLinearTransform, you can use TransformNormal()
##  instead.
##  void TransformNormalAtPoint ( const float point [ 3 ] , const float in [ 3 ] , float out [ 3 ] ) ;
## Error: expected ';'!!!

proc TransformNormalAtPoint*(this: var vtkAbstractTransform;
                            point: array[3, cdouble]; `in`: array[3, cdouble];
                            `out`: array[3, cdouble]) {.
    importcpp: "TransformNormalAtPoint", header: "vtkAbstractTransform.h".}
## !!!Ignored construct:  /@} double * TransformNormalAtPoint ( const double point [ 3 ] , const double normal [ 3 ] ) VTK_SIZEHINT ( 3 ) { this -> TransformNormalAtPoint ( point , normal , this -> InternalDoublePoint ) ; return this -> InternalDoublePoint ; } /@{ *
##  Apply the transformation to a double-precision normal at the specified
##  vertex.  If the transformation is a vtkLinearTransform, you can use
##  TransformDoubleNormal() instead.
##  double * TransformDoubleNormalAtPoint ( const double point [ 3 ] , const double normal [ 3 ] ) VTK_SIZEHINT ( 3 ) { this -> TransformNormalAtPoint ( point , normal , this -> InternalDoublePoint ) ; return this -> InternalDoublePoint ; } /@} /@{ *
##  Apply the transformation to a single-precision normal at the specified
##  vertex.  If the transformation is a vtkLinearTransform, you can use
##  TransformFloatNormal() instead.
##  float * TransformFloatNormalAtPoint ( const float point [ 3 ] , const float normal [ 3 ] ) VTK_SIZEHINT ( 3 ) { this -> TransformNormalAtPoint ( point , normal , this -> InternalFloatPoint ) ; return this -> InternalFloatPoint ; } /@} /@{ *
##  Apply the transformation to a vector at the specified vertex.  If the
##  transformation is a vtkLinearTransform, you can use TransformVector()
##  instead.
##  void TransformVectorAtPoint ( const float point [ 3 ] , const float in [ 3 ] , float out [ 3 ] ) ;
## Error: expected ';'!!!

proc TransformVectorAtPoint*(this: var vtkAbstractTransform;
                            point: array[3, cdouble]; `in`: array[3, cdouble];
                            `out`: array[3, cdouble]) {.
    importcpp: "TransformVectorAtPoint", header: "vtkAbstractTransform.h".}
## !!!Ignored construct:  /@} double * TransformVectorAtPoint ( const double point [ 3 ] , const double vector [ 3 ] ) VTK_SIZEHINT ( 3 ) { this -> TransformVectorAtPoint ( point , vector , this -> InternalDoublePoint ) ; return this -> InternalDoublePoint ; } /@{ *
##  Apply the transformation to a double-precision vector at the specified
##  vertex.  If the transformation is a vtkLinearTransform, you can use
##  TransformDoubleVector() instead.
##  double * TransformDoubleVectorAtPoint ( const double point [ 3 ] , const double vector [ 3 ] ) VTK_SIZEHINT ( 3 ) { this -> TransformVectorAtPoint ( point , vector , this -> InternalDoublePoint ) ; return this -> InternalDoublePoint ; } /@} /@{ *
##  Apply the transformation to a single-precision vector at the specified
##  vertex.  If the transformation is a vtkLinearTransform, you can use
##  TransformFloatVector() instead.
##  float * TransformFloatVectorAtPoint ( const float point [ 3 ] , const float vector [ 3 ] ) VTK_SIZEHINT ( 3 ) { this -> TransformVectorAtPoint ( point , vector , this -> InternalFloatPoint ) ; return this -> InternalFloatPoint ; } /@} *
##  Apply the transformation to a series of points, and append the
##  results to outPts.
##  virtual void TransformPoints ( vtkPoints * inPts , vtkPoints * outPts ) ;
## Error: expected ';'!!!

proc TransformPointsNormalsVectors*(this: var vtkAbstractTransform;
                                   inPts: ptr vtkPoints; outPts: ptr vtkPoints;
                                   inNms: ptr vtkDataArray;
                                   outNms: ptr vtkDataArray;
                                   inVrs: ptr vtkDataArray;
                                   outVrs: ptr vtkDataArray;
                                   nOptionalVectors: cint = 0;
                                   inVrsArr: ptr ptr vtkDataArray = nil;
                                   outVrsArr: ptr ptr vtkDataArray = nil) {.
    importcpp: "TransformPointsNormalsVectors", header: "vtkAbstractTransform.h".}
proc GetInverse*(this: var vtkAbstractTransform): ptr vtkAbstractTransform {.
    importcpp: "GetInverse", header: "vtkAbstractTransform.h".}
proc SetInverse*(this: var vtkAbstractTransform; transform: ptr vtkAbstractTransform) {.
    importcpp: "SetInverse", header: "vtkAbstractTransform.h".}
proc Inverse*(this: var vtkAbstractTransform) {.importcpp: "Inverse",
    header: "vtkAbstractTransform.h".}
proc DeepCopy*(this: var vtkAbstractTransform; a2: ptr vtkAbstractTransform) {.
    importcpp: "DeepCopy", header: "vtkAbstractTransform.h".}
proc Update*(this: var vtkAbstractTransform) {.importcpp: "Update",
    header: "vtkAbstractTransform.h".}
proc InternalTransformPoint*(this: var vtkAbstractTransform; `in`: array[3, cfloat];
                            `out`: array[3, cfloat]) {.
    importcpp: "InternalTransformPoint", header: "vtkAbstractTransform.h".}
proc InternalTransformPoint*(this: var vtkAbstractTransform;
                            `in`: array[3, cdouble]; `out`: array[3, cdouble]) {.
    importcpp: "InternalTransformPoint", header: "vtkAbstractTransform.h".}
proc InternalTransformDerivative*(this: var vtkAbstractTransform;
                                 `in`: array[3, cfloat]; `out`: array[3, cfloat];
                                 derivative: array[3, array[3, cfloat]]) {.
    importcpp: "InternalTransformDerivative", header: "vtkAbstractTransform.h".}
proc InternalTransformDerivative*(this: var vtkAbstractTransform;
                                 `in`: array[3, cdouble]; `out`: array[3, cdouble];
                                 derivative: array[3, array[3, cdouble]]) {.
    importcpp: "InternalTransformDerivative", header: "vtkAbstractTransform.h".}
## !!!Ignored construct:  * MakeTransform ( ) = 0 ;
## Error: identifier expected, but got: *!!!

proc CircuitCheck*(this: var vtkAbstractTransform;
                  transform: ptr vtkAbstractTransform): cint {.
    importcpp: "CircuitCheck", header: "vtkAbstractTransform.h".}
proc GetMTime*(this: var vtkAbstractTransform): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkAbstractTransform.h".}
proc UnRegister*(this: var vtkAbstractTransform; O: ptr vtkObjectBase) {.
    importcpp: "UnRegister", header: "vtkAbstractTransform.h".}
## -------------------------------------------------------------------------
##  A simple data structure to hold both a transform and its inverse.
##  One of ForwardTransform or InverseTransform might be nullptr,
##  and must be acquired by calling GetInverse() on the other.

type
  vtkTransformPair* {.importcpp: "vtkTransformPair",
                     header: "vtkAbstractTransform.h", bycopy.} = object
    ForwardTransform* {.importc: "ForwardTransform".}: ptr vtkAbstractTransform
    InverseTransform* {.importc: "InverseTransform".}: ptr vtkAbstractTransform


proc constructvtkTransformPair*(): vtkTransformPair {.constructor,
    importcpp: "vtkTransformPair(@)", header: "vtkAbstractTransform.h".}
proc SwapForwardInverse*(this: var vtkTransformPair) {.
    importcpp: "SwapForwardInverse", header: "vtkAbstractTransform.h".}
##  .NAME vtkTransformConcatenation - store a series of transformations.
##  .SECTION Description
##  A helper class (not derived from vtkObject) to store a series of
##  transformations in a pipelined concatenation.

type
  vtkTransformConcatenation* {.importcpp: "vtkTransformConcatenation",
                              header: "vtkAbstractTransform.h", bycopy.} = object


proc New*(): ptr vtkTransformConcatenation {.
    importcpp: "vtkTransformConcatenation::New(@)",
    header: "vtkAbstractTransform.h".}
proc Delete*(this: var vtkTransformConcatenation) {.importcpp: "Delete",
    header: "vtkAbstractTransform.h".}
proc Concatenate*(this: var vtkTransformConcatenation;
                 transform: ptr vtkAbstractTransform) {.importcpp: "Concatenate",
    header: "vtkAbstractTransform.h".}
proc Concatenate*(this: var vtkTransformConcatenation; elements: array[16, cdouble]) {.
    importcpp: "Concatenate", header: "vtkAbstractTransform.h".}
proc SetPreMultiplyFlag*(this: var vtkTransformConcatenation; flag: cint) {.
    importcpp: "SetPreMultiplyFlag", header: "vtkAbstractTransform.h".}
proc GetPreMultiplyFlag*(this: var vtkTransformConcatenation): cint {.
    importcpp: "GetPreMultiplyFlag", header: "vtkAbstractTransform.h".}
proc Translate*(this: var vtkTransformConcatenation; x: cdouble; y: cdouble; z: cdouble) {.
    importcpp: "Translate", header: "vtkAbstractTransform.h".}
proc Rotate*(this: var vtkTransformConcatenation; angle: cdouble; x: cdouble;
            y: cdouble; z: cdouble) {.importcpp: "Rotate",
                                  header: "vtkAbstractTransform.h".}
proc Scale*(this: var vtkTransformConcatenation; x: cdouble; y: cdouble; z: cdouble) {.
    importcpp: "Scale", header: "vtkAbstractTransform.h".}
proc Inverse*(this: var vtkTransformConcatenation) {.importcpp: "Inverse",
    header: "vtkAbstractTransform.h".}
proc GetInverseFlag*(this: var vtkTransformConcatenation): cint {.
    importcpp: "GetInverseFlag", header: "vtkAbstractTransform.h".}
proc Identity*(this: var vtkTransformConcatenation) {.importcpp: "Identity",
    header: "vtkAbstractTransform.h".}
proc DeepCopy*(this: var vtkTransformConcatenation;
              transform: ptr vtkTransformConcatenation) {.importcpp: "DeepCopy",
    header: "vtkAbstractTransform.h".}
proc GetNumberOfTransforms*(this: var vtkTransformConcatenation): cint {.
    importcpp: "GetNumberOfTransforms", header: "vtkAbstractTransform.h".}
proc GetNumberOfPreTransforms*(this: var vtkTransformConcatenation): cint {.
    importcpp: "GetNumberOfPreTransforms", header: "vtkAbstractTransform.h".}
proc GetNumberOfPostTransforms*(this: var vtkTransformConcatenation): cint {.
    importcpp: "GetNumberOfPostTransforms", header: "vtkAbstractTransform.h".}
proc GetTransform*(this: var vtkTransformConcatenation; i: cint): ptr vtkAbstractTransform {.
    importcpp: "GetTransform", header: "vtkAbstractTransform.h".}
proc GetMaxMTime*(this: var vtkTransformConcatenation): vtkMTimeType {.
    importcpp: "GetMaxMTime", header: "vtkAbstractTransform.h".}
proc PrintSelf*(this: var vtkTransformConcatenation; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkAbstractTransform.h".}
##  .NAME vtkTransformConcatenationStack - Store a stack of concatenations.
##  .SECTION Description
##  A helper class (not derived from vtkObject) to store a stack of
##  concatenations.

type
  vtkTransformConcatenationStack* {.importcpp: "vtkTransformConcatenationStack",
                                   header: "vtkAbstractTransform.h", bycopy.} = object


proc New*(): ptr vtkTransformConcatenationStack {.
    importcpp: "vtkTransformConcatenationStack::New(@)",
    header: "vtkAbstractTransform.h".}
proc Delete*(this: var vtkTransformConcatenationStack) {.importcpp: "Delete",
    header: "vtkAbstractTransform.h".}
proc Pop*(this: var vtkTransformConcatenationStack;
         concat: ptr ptr vtkTransformConcatenation) {.importcpp: "Pop",
    header: "vtkAbstractTransform.h".}
proc Push*(this: var vtkTransformConcatenationStack;
          concat: ptr ptr vtkTransformConcatenation) {.importcpp: "Push",
    header: "vtkAbstractTransform.h".}
proc DeepCopy*(this: var vtkTransformConcatenationStack;
              stack: ptr vtkTransformConcatenationStack) {.importcpp: "DeepCopy",
    header: "vtkAbstractTransform.h".}