## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMultiProcessStream.h
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
##  @class   vtkMultiProcessStream
##  @brief   stream used to pass data across processes
##  using vtkMultiProcessController.
##
##  vtkMultiProcessStream is used to pass data across processes. Using
##  vtkMultiProcessStream it is possible to send data whose length is not known
##  at the receiving end.
##
##  @warning
##  Note, stream operators cannot be combined with the Push/Pop array operators.
##  For example, if you push an array to the stream,
##

import
  vtkObject, vtkParallelCoreModule

type
  vtkMultiProcessStream* {.importcpp: "vtkMultiProcessStream",
                          header: "vtkMultiProcessStream.h", bycopy.} = object


proc constructvtkMultiProcessStream*(): vtkMultiProcessStream {.constructor,
    importcpp: "vtkMultiProcessStream(@)", header: "vtkMultiProcessStream.h".}
proc constructvtkMultiProcessStream*(a1: vtkMultiProcessStream): vtkMultiProcessStream {.
    constructor, importcpp: "vtkMultiProcessStream(@)",
    header: "vtkMultiProcessStream.h".}
proc destroyvtkMultiProcessStream*(this: var vtkMultiProcessStream) {.
    importcpp: "#.~vtkMultiProcessStream()", header: "vtkMultiProcessStream.h".}
proc `<<`*(this: var vtkMultiProcessStream; value: cdouble): var vtkMultiProcessStream {.
    importcpp: "(# << #)", header: "vtkMultiProcessStream.h".}
proc `<<`*(this: var vtkMultiProcessStream; value: cfloat): var vtkMultiProcessStream {.
    importcpp: "(# << #)", header: "vtkMultiProcessStream.h".}
proc `<<`*(this: var vtkMultiProcessStream; value: cint): var vtkMultiProcessStream {.
    importcpp: "(# << #)", header: "vtkMultiProcessStream.h".}
proc `<<`*(this: var vtkMultiProcessStream; value: char): var vtkMultiProcessStream {.
    importcpp: "(# << #)", header: "vtkMultiProcessStream.h".}
proc `<<`*(this: var vtkMultiProcessStream; value: bool): var vtkMultiProcessStream {.
    importcpp: "(# << #)", header: "vtkMultiProcessStream.h".}
proc `<<`*(this: var vtkMultiProcessStream; value: cuint): var vtkMultiProcessStream {.
    importcpp: "(# << #)", header: "vtkMultiProcessStream.h".}
proc `<<`*(this: var vtkMultiProcessStream; value: cuchar): var vtkMultiProcessStream {.
    importcpp: "(# << #)", header: "vtkMultiProcessStream.h".}
proc `<<`*(this: var vtkMultiProcessStream; value: vtkTypeInt64): var vtkMultiProcessStream {.
    importcpp: "(# << #)", header: "vtkMultiProcessStream.h".}
proc `<<`*(this: var vtkMultiProcessStream; value: vtkTypeUInt64): var vtkMultiProcessStream {.
    importcpp: "(# << #)", header: "vtkMultiProcessStream.h".}
proc `<<`*(this: var vtkMultiProcessStream; value: string): var vtkMultiProcessStream {.
    importcpp: "(# << #)", header: "vtkMultiProcessStream.h".}
proc `<<`*(this: var vtkMultiProcessStream; value: cstring): var vtkMultiProcessStream {.
    importcpp: "(# << #)", header: "vtkMultiProcessStream.h".}
proc `<<`*(this: var vtkMultiProcessStream; a2: vtkMultiProcessStream): var vtkMultiProcessStream {.
    importcpp: "(# << #)", header: "vtkMultiProcessStream.h".}
proc `>>`*(this: var vtkMultiProcessStream; value: var cdouble): var vtkMultiProcessStream {.
    importcpp: "(# >> #)", header: "vtkMultiProcessStream.h".}
proc `>>`*(this: var vtkMultiProcessStream; value: var cfloat): var vtkMultiProcessStream {.
    importcpp: "(# >> #)", header: "vtkMultiProcessStream.h".}
proc `>>`*(this: var vtkMultiProcessStream; value: var cint): var vtkMultiProcessStream {.
    importcpp: "(# >> #)", header: "vtkMultiProcessStream.h".}
proc `>>`*(this: var vtkMultiProcessStream; value: var char): var vtkMultiProcessStream {.
    importcpp: "(# >> #)", header: "vtkMultiProcessStream.h".}
proc `>>`*(this: var vtkMultiProcessStream; value: var bool): var vtkMultiProcessStream {.
    importcpp: "(# >> #)", header: "vtkMultiProcessStream.h".}
proc `>>`*(this: var vtkMultiProcessStream; value: var cuint): var vtkMultiProcessStream {.
    importcpp: "(# >> #)", header: "vtkMultiProcessStream.h".}
proc `>>`*(this: var vtkMultiProcessStream; value: var cuchar): var vtkMultiProcessStream {.
    importcpp: "(# >> #)", header: "vtkMultiProcessStream.h".}
proc `>>`*(this: var vtkMultiProcessStream; value: var vtkTypeInt64): var vtkMultiProcessStream {.
    importcpp: "(# >> #)", header: "vtkMultiProcessStream.h".}
proc `>>`*(this: var vtkMultiProcessStream; value: var vtkTypeUInt64): var vtkMultiProcessStream {.
    importcpp: "(# >> #)", header: "vtkMultiProcessStream.h".}
proc `>>`*(this: var vtkMultiProcessStream; value: var string): var vtkMultiProcessStream {.
    importcpp: "(# >> #)", header: "vtkMultiProcessStream.h".}
proc `>>`*(this: var vtkMultiProcessStream; a2: var vtkMultiProcessStream): var vtkMultiProcessStream {.
    importcpp: "(# >> #)", header: "vtkMultiProcessStream.h".}
proc Push*(this: var vtkMultiProcessStream; array: ptr cdouble; size: cuint) {.
    importcpp: "Push", header: "vtkMultiProcessStream.h".}
proc Push*(this: var vtkMultiProcessStream; array: ptr cfloat; size: cuint) {.
    importcpp: "Push", header: "vtkMultiProcessStream.h".}
proc Push*(this: var vtkMultiProcessStream; array: ptr cint; size: cuint) {.
    importcpp: "Push", header: "vtkMultiProcessStream.h".}
proc Push*(this: var vtkMultiProcessStream; array: ptr char; size: cuint) {.
    importcpp: "Push", header: "vtkMultiProcessStream.h".}
proc Push*(this: var vtkMultiProcessStream; array: ptr cuint; size: cuint) {.
    importcpp: "Push", header: "vtkMultiProcessStream.h".}
proc Push*(this: var vtkMultiProcessStream; array: ptr cuchar; size: cuint) {.
    importcpp: "Push", header: "vtkMultiProcessStream.h".}
proc Push*(this: var vtkMultiProcessStream; array: ptr vtkTypeInt64; size: cuint) {.
    importcpp: "Push", header: "vtkMultiProcessStream.h".}
proc Push*(this: var vtkMultiProcessStream; array: ptr vtkTypeUInt64; size: cuint) {.
    importcpp: "Push", header: "vtkMultiProcessStream.h".}
proc Pop*(this: var vtkMultiProcessStream; array: ptr cdouble; size: var cuint) {.
    importcpp: "Pop", header: "vtkMultiProcessStream.h".}
proc Pop*(this: var vtkMultiProcessStream; array: ptr cfloat; size: var cuint) {.
    importcpp: "Pop", header: "vtkMultiProcessStream.h".}
proc Pop*(this: var vtkMultiProcessStream; array: ptr cint; size: var cuint) {.
    importcpp: "Pop", header: "vtkMultiProcessStream.h".}
proc Pop*(this: var vtkMultiProcessStream; array: cstring; size: var cuint) {.
    importcpp: "Pop", header: "vtkMultiProcessStream.h".}
proc Pop*(this: var vtkMultiProcessStream; array: ptr cuint; size: var cuint) {.
    importcpp: "Pop", header: "vtkMultiProcessStream.h".}
proc Pop*(this: var vtkMultiProcessStream; array: ptr cuchar; size: var cuint) {.
    importcpp: "Pop", header: "vtkMultiProcessStream.h".}
proc Pop*(this: var vtkMultiProcessStream; array: ptr vtkTypeInt64; size: var cuint) {.
    importcpp: "Pop", header: "vtkMultiProcessStream.h".}
proc Pop*(this: var vtkMultiProcessStream; array: ptr vtkTypeUInt64; size: var cuint) {.
    importcpp: "Pop", header: "vtkMultiProcessStream.h".}
proc Reset*(this: var vtkMultiProcessStream) {.importcpp: "Reset",
    header: "vtkMultiProcessStream.h".}
proc Size*(this: var vtkMultiProcessStream): cint {.importcpp: "Size",
    header: "vtkMultiProcessStream.h".}
proc RawSize*(this: var vtkMultiProcessStream): cint {.importcpp: "RawSize",
    header: "vtkMultiProcessStream.h".}
proc Empty*(this: var vtkMultiProcessStream): bool {.importcpp: "Empty",
    header: "vtkMultiProcessStream.h".}
proc GetRawData*(this: vtkMultiProcessStream; data: var vector[cuchar]) {.
    noSideEffect, importcpp: "GetRawData", header: "vtkMultiProcessStream.h".}
proc GetRawData*(this: var vtkMultiProcessStream; data: ptr cuchar; size: var cuint) {.
    importcpp: "GetRawData", header: "vtkMultiProcessStream.h".}
proc SetRawData*(this: var vtkMultiProcessStream; data: vector[cuchar]) {.
    importcpp: "SetRawData", header: "vtkMultiProcessStream.h".}
proc SetRawData*(this: var vtkMultiProcessStream; a2: ptr cuchar; size: cuint) {.
    importcpp: "SetRawData", header: "vtkMultiProcessStream.h".}
proc GetRawData*(this: vtkMultiProcessStream): vector[cuchar] {.noSideEffect,
    importcpp: "GetRawData", header: "vtkMultiProcessStream.h".}
##  VTK-HeaderTest-Exclude: vtkMultiProcessStream.h
