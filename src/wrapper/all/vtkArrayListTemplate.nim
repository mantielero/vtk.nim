## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkArrayListTemplate.h
##
##   Copyright (c) Kitware, Inc.
##   All rights reserved.
##   See LICENSE file for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkArrayListTemplate
##  @brief   thread-safe and efficient data attribute processing
##
##
##  vtkArrayListTemplate supplements the vtkDataSetAttributes class to provide
##  threaded processing of data arrays. It is also more efficient for certain
##  interpolation operations. The expectation is that it will be replaced one
##  day once vtkPointData, vtkCellData, vtkDataSetAttributes, and vtkFieldData
##  properly support multithreading and/or are redesigned. Note that this
##  implementation does not support incremental operations (like InsertNext()).
##
##  Generally the way this helper class is used is to first invoke
##  vtkDataSetAttributes::CopyInterpolate() or InterpolateAllocate() which
##  performs the initial magic of constructing input and output arrays. Then
##  the input attributes, and output attributes, are passed to initialize the
##  internal structures via the AddArrays() method. Essentially these internal
##  structures are templated pairs of arrays of the same type, which can be
##  efficiently accessed and assigned. The operations on these array pairs
##  (e.g., interpolation) occur using a typeless, virtual dispatch base class.
##
##  @warning
##  vtkDataSetAttributes is not in general thread safe due to the use of its
##  vtkFieldData::BasicIterator RequiredArrays data member. This class augments
##  vtkDataSetAttributes for thread safety.
##
##  @sa
##  vtkFieldData vtkDataSetAttributes vtkPointData vtkCellData
##

import
  vtkAbstractArray, vtkDataSetAttributes, vtkSmartPointer, vtkStdString

##  Create a generic class supporting virtual dispatch to type-specific
##  subclasses.

type
  BaseArrayPair* {.importcpp: "BaseArrayPair", header: "vtkArrayListTemplate.h",
                  bycopy.} = object
    Num* {.importc: "Num".}: vtkIdType
    NumComp* {.importc: "NumComp".}: cint
    OutputArray* {.importc: "OutputArray".}: vtkSmartPointer[vtkAbstractArray]


proc constructBaseArrayPair*(num: vtkIdType; numComp: cint;
                            outArray: ptr vtkAbstractArray): BaseArrayPair {.
    constructor, importcpp: "BaseArrayPair(@)", header: "vtkArrayListTemplate.h".}
proc destroyBaseArrayPair*(this: var BaseArrayPair) {.
    importcpp: "#.~BaseArrayPair()", header: "vtkArrayListTemplate.h".}
proc Copy*(this: var BaseArrayPair; inId: vtkIdType; outId: vtkIdType) {.
    importcpp: "Copy", header: "vtkArrayListTemplate.h".}
proc Interpolate*(this: var BaseArrayPair; numWeights: cint; ids: ptr vtkIdType;
                 weights: ptr cdouble; outId: vtkIdType) {.importcpp: "Interpolate",
    header: "vtkArrayListTemplate.h".}
proc Average*(this: var BaseArrayPair; numPts: cint; ids: ptr vtkIdType; outId: vtkIdType) {.
    importcpp: "Average", header: "vtkArrayListTemplate.h".}
proc WeightedAverage*(this: var BaseArrayPair; numPts: cint; ids: ptr vtkIdType;
                     weights: ptr cdouble; outId: vtkIdType) {.
    importcpp: "WeightedAverage", header: "vtkArrayListTemplate.h".}
proc InterpolateEdge*(this: var BaseArrayPair; v0: vtkIdType; v1: vtkIdType; t: cdouble;
                     outId: vtkIdType) {.importcpp: "InterpolateEdge",
                                       header: "vtkArrayListTemplate.h".}
proc AssignNullValue*(this: var BaseArrayPair; outId: vtkIdType) {.
    importcpp: "AssignNullValue", header: "vtkArrayListTemplate.h".}
proc Realloc*(this: var BaseArrayPair; sze: vtkIdType) {.importcpp: "Realloc",
    header: "vtkArrayListTemplate.h".}
##  Type specific interpolation on a matched pair of data arrays

type
  ArrayPair*[T] {.importcpp: "ArrayPair<\'0>", header: "vtkArrayListTemplate.h",
                 bycopy.} = object of BaseArrayPair
    Input* {.importc: "Input".}: ptr T
    Output* {.importc: "Output".}: ptr T
    NullValue* {.importc: "NullValue".}: T


proc constructArrayPair*[T](`in`: ptr T; `out`: ptr T; num: vtkIdType; numComp: cint;
                           outArray: ptr vtkAbstractArray; null: T): ArrayPair[T] {.
    constructor, importcpp: "ArrayPair<\'*0>(@)", header: "vtkArrayListTemplate.h".}
proc destroyArrayPair*[T](this: var ArrayPair[T]) {.importcpp: "#.~ArrayPair()",
    header: "vtkArrayListTemplate.h".}
proc Copy*[T](this: var ArrayPair[T]; inId: vtkIdType; outId: vtkIdType) {.
    importcpp: "Copy", header: "vtkArrayListTemplate.h".}
proc Interpolate*[T](this: var ArrayPair[T]; numWeights: cint; ids: ptr vtkIdType;
                    weights: ptr cdouble; outId: vtkIdType) {.
    importcpp: "Interpolate", header: "vtkArrayListTemplate.h".}
proc Average*[T](this: var ArrayPair[T]; numPts: cint; ids: ptr vtkIdType;
                outId: vtkIdType) {.importcpp: "Average",
                                  header: "vtkArrayListTemplate.h".}
proc WeightedAverage*[T](this: var ArrayPair[T]; numPts: cint; ids: ptr vtkIdType;
                        weights: ptr cdouble; outId: vtkIdType) {.
    importcpp: "WeightedAverage", header: "vtkArrayListTemplate.h".}
proc InterpolateEdge*[T](this: var ArrayPair[T]; v0: vtkIdType; v1: vtkIdType;
                        t: cdouble; outId: vtkIdType) {.
    importcpp: "InterpolateEdge", header: "vtkArrayListTemplate.h".}
proc AssignNullValue*[T](this: var ArrayPair[T]; outId: vtkIdType) {.
    importcpp: "AssignNullValue", header: "vtkArrayListTemplate.h".}
proc Realloc*[T](this: var ArrayPair[T]; sze: vtkIdType) {.importcpp: "Realloc",
    header: "vtkArrayListTemplate.h".}
##  Type specific interpolation on a pair of data arrays with different types, where the
##  output type is expected to be a real type (i.e., float or double).

type
  RealArrayPair*[TInput; TOutput] {.importcpp: "RealArrayPair<\'0,\'1>",
                                  header: "vtkArrayListTemplate.h", bycopy.} = object of BaseArrayPair
    Input* {.importc: "Input".}: ptr TInput
    Output* {.importc: "Output".}: ptr TOutput
    NullValue* {.importc: "NullValue".}: TOutput


proc constructRealArrayPair*[TInput; TOutput](`in`: ptr TInput; `out`: ptr TOutput;
    num: vtkIdType; numComp: cint; outArray: ptr vtkAbstractArray; null: TOutput): RealArrayPair[
    TInput, TOutput] {.constructor, importcpp: "RealArrayPair<\'*0,\'*1>(@)",
                     header: "vtkArrayListTemplate.h".}
proc destroyRealArrayPair*[TInput; TOutput](
    this: var RealArrayPair[TInput, TOutput]) {.importcpp: "#.~RealArrayPair()",
    header: "vtkArrayListTemplate.h".}
proc Copy*[TInput; TOutput](this: var RealArrayPair[TInput, TOutput]; inId: vtkIdType;
                          outId: vtkIdType) {.importcpp: "Copy",
    header: "vtkArrayListTemplate.h".}
proc Interpolate*[TInput; TOutput](this: var RealArrayPair[TInput, TOutput];
                                 numWeights: cint; ids: ptr vtkIdType;
                                 weights: ptr cdouble; outId: vtkIdType) {.
    importcpp: "Interpolate", header: "vtkArrayListTemplate.h".}
proc Average*[TInput; TOutput](this: var RealArrayPair[TInput, TOutput]; numPts: cint;
                             ids: ptr vtkIdType; outId: vtkIdType) {.
    importcpp: "Average", header: "vtkArrayListTemplate.h".}
proc WeightedAverage*[TInput; TOutput](this: var RealArrayPair[TInput, TOutput];
                                     numPts: cint; ids: ptr vtkIdType;
                                     weights: ptr cdouble; outId: vtkIdType) {.
    importcpp: "WeightedAverage", header: "vtkArrayListTemplate.h".}
proc InterpolateEdge*[TInput; TOutput](this: var RealArrayPair[TInput, TOutput];
                                     v0: vtkIdType; v1: vtkIdType; t: cdouble;
                                     outId: vtkIdType) {.
    importcpp: "InterpolateEdge", header: "vtkArrayListTemplate.h".}
proc AssignNullValue*[TInput; TOutput](this: var RealArrayPair[TInput, TOutput];
                                     outId: vtkIdType) {.
    importcpp: "AssignNullValue", header: "vtkArrayListTemplate.h".}
proc Realloc*[TInput; TOutput](this: var RealArrayPair[TInput, TOutput];
                             sze: vtkIdType) {.importcpp: "Realloc",
    header: "vtkArrayListTemplate.h".}
##  Forward declarations. This makes working with vtkTemplateMacro easier.

discard "forward decl of ArrayList"
proc CreateArrayPair*[T](list: ptr ArrayList; inData: ptr T; outData: ptr T;
                        numTuples: vtkIdType; numComp: cint; nullValue: T) {.
    importcpp: "CreateArrayPair(@)", header: "vtkArrayListTemplate.h".}
##  A list of the arrays to interpolate, and a method to invoke interpolation on the list

type
  ArrayList* {.importcpp: "ArrayList", header: "vtkArrayListTemplate.h", bycopy.} = object ##  The list of arrays, and the arrays not to process
    Arrays* {.importc: "Arrays".}: vector[ptr BaseArrayPair]
    ExcludedArrays* {.importc: "ExcludedArrays".}: vector[ptr vtkAbstractArray] ##  Add the arrays to interpolate here (from attribute data). Note that this method is
                                                                           ##  not thread-safe due to its use of vtkDataSetAttributes.


proc AddArrays*(this: var ArrayList; numOutPts: vtkIdType;
               inPD: ptr vtkDataSetAttributes; outPD: ptr vtkDataSetAttributes;
               nullValue: cdouble = 0.0; promote: vtkTypeBool = true) {.
    importcpp: "AddArrays", header: "vtkArrayListTemplate.h".}
proc AddSelfInterpolatingArrays*(this: var ArrayList; numOutPts: vtkIdType;
                                attr: ptr vtkDataSetAttributes;
                                nullValue: cdouble = 0.0) {.
    importcpp: "AddSelfInterpolatingArrays", header: "vtkArrayListTemplate.h".}
proc AddArrayPair*(this: var ArrayList; numTuples: vtkIdType;
                  inArray: ptr vtkAbstractArray; outArrayName: var vtkStdString;
                  nullValue: cdouble; promote: vtkTypeBool): ptr vtkAbstractArray {.
    importcpp: "AddArrayPair", header: "vtkArrayListTemplate.h".}
proc ExcludeArray*(this: var ArrayList; da: ptr vtkAbstractArray) {.
    importcpp: "ExcludeArray", header: "vtkArrayListTemplate.h".}
proc IsExcluded*(this: var ArrayList; da: ptr vtkAbstractArray): vtkTypeBool {.
    importcpp: "IsExcluded", header: "vtkArrayListTemplate.h".}
proc Copy*(this: var ArrayList; inId: vtkIdType; outId: vtkIdType) {.importcpp: "Copy",
    header: "vtkArrayListTemplate.h".}
proc Interpolate*(this: var ArrayList; numWeights: cint; ids: ptr vtkIdType;
                 weights: ptr cdouble; outId: vtkIdType) {.importcpp: "Interpolate",
    header: "vtkArrayListTemplate.h".}
proc Average*(this: var ArrayList; numPts: cint; ids: ptr vtkIdType; outId: vtkIdType) {.
    importcpp: "Average", header: "vtkArrayListTemplate.h".}
proc WeightedAverage*(this: var ArrayList; numPts: cint; ids: ptr vtkIdType;
                     weights: ptr cdouble; outId: vtkIdType) {.
    importcpp: "WeightedAverage", header: "vtkArrayListTemplate.h".}
proc InterpolateEdge*(this: var ArrayList; v0: vtkIdType; v1: vtkIdType; t: cdouble;
                     outId: vtkIdType) {.importcpp: "InterpolateEdge",
                                       header: "vtkArrayListTemplate.h".}
proc AssignNullValue*(this: var ArrayList; outId: vtkIdType) {.
    importcpp: "AssignNullValue", header: "vtkArrayListTemplate.h".}
proc Realloc*(this: var ArrayList; sze: vtkIdType) {.importcpp: "Realloc",
    header: "vtkArrayListTemplate.h".}
proc destroyArrayList*(this: var ArrayList) {.importcpp: "#.~ArrayList()",
    header: "vtkArrayListTemplate.h".}
proc GetNumberOfArrays*(this: var ArrayList): vtkIdType {.
    importcpp: "GetNumberOfArrays", header: "vtkArrayListTemplate.h".}
import
  vtkArrayListTemplate

##  VTK-HeaderTest-Exclude: vtkArrayListTemplate.h
