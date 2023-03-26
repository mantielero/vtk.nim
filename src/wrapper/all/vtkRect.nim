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
##  @class   vtkRect
##  @brief   templated base type for storage of 2D rectangles.
##
##
##  This class is a templated data type for storing and manipulating rectangles.
##  The memory layout is a contiguous array of the specified type, such that a
##  float[4] can be cast to a vtkRectf and manipulated. Also a float[12] could
##  be cast and used as a vtkRectf[3].
##

import
  vtkVector, vtkMath

type
  vtkRect*[T] {.importcpp: "vtkRect<\'0>", header: "vtkRect.h", bycopy.} = object of vtkVector[
      T, 4]


proc constructvtkRect*[T](): vtkRect[T] {.constructor,
                                       importcpp: "vtkRect<\'*0>(@)",
                                       header: "vtkRect.h".}
proc constructvtkRect*[T](x: T; y: T; width: T; height: T): vtkRect[T] {.constructor,
    importcpp: "vtkRect<\'*0>(@)", header: "vtkRect.h".}
proc constructvtkRect*[T](init: ptr T): vtkRect[T] {.constructor,
    importcpp: "vtkRect<\'*0>(@)", header: "vtkRect.h".}
proc Set*[T](this: var vtkRect[T]; x: T; y: T; width: T; height: T) {.importcpp: "Set",
    header: "vtkRect.h".}
proc SetX*[T](this: var vtkRect[T]; x: T) {.importcpp: "SetX", header: "vtkRect.h".}
proc GetX*[T](this: vtkRect[T]): T {.noSideEffect, importcpp: "GetX",
                                 header: "vtkRect.h".}
proc SetY*[T](this: var vtkRect[T]; y: T) {.importcpp: "SetY", header: "vtkRect.h".}
proc GetY*[T](this: vtkRect[T]): T {.noSideEffect, importcpp: "GetY",
                                 header: "vtkRect.h".}
proc SetWidth*[T](this: var vtkRect[T]; width: T) {.importcpp: "SetWidth",
    header: "vtkRect.h".}
proc GetWidth*[T](this: vtkRect[T]): T {.noSideEffect, importcpp: "GetWidth",
                                     header: "vtkRect.h".}
proc SetHeight*[T](this: var vtkRect[T]; height: T) {.importcpp: "SetHeight",
    header: "vtkRect.h".}
proc GetHeight*[T](this: vtkRect[T]): T {.noSideEffect, importcpp: "GetHeight",
                                      header: "vtkRect.h".}
proc GetLeft*[T](this: vtkRect[T]): T {.noSideEffect, importcpp: "GetLeft",
                                    header: "vtkRect.h".}
proc GetRight*[T](this: vtkRect[T]): T {.noSideEffect, importcpp: "GetRight",
                                     header: "vtkRect.h".}
proc GetTop*[T](this: vtkRect[T]): T {.noSideEffect, importcpp: "GetTop",
                                   header: "vtkRect.h".}
proc GetBottom*[T](this: vtkRect[T]): T {.noSideEffect, importcpp: "GetBottom",
                                      header: "vtkRect.h".}
proc GetBottomLeft*[T](this: vtkRect[T]): vtkVector2[T] {.noSideEffect,
    importcpp: "GetBottomLeft", header: "vtkRect.h".}
proc GetTopLeft*[T](this: vtkRect[T]): vtkVector[T, 2] {.noSideEffect,
    importcpp: "GetTopLeft", header: "vtkRect.h".}
proc GetBottomRight*[T](this: vtkRect[T]): vtkVector[T, 2] {.noSideEffect,
    importcpp: "GetBottomRight", header: "vtkRect.h".}
proc GetTopRight*[T](this: vtkRect[T]): vtkVector[T, 2] {.noSideEffect,
    importcpp: "GetTopRight", header: "vtkRect.h".}
proc AddPoint*[T](this: var vtkRect[T]; point: array[2, T]) {.importcpp: "AddPoint",
    header: "vtkRect.h".}
proc AddPoint*[T](this: var vtkRect[T]; x: T; y: T) {.importcpp: "AddPoint",
    header: "vtkRect.h".}
proc AddRect*[T](this: var vtkRect[T]; rect: vtkRect[T]) {.importcpp: "AddRect",
    header: "vtkRect.h".}
proc IntersectsWith*[T](this: vtkRect[T]; rect: vtkRect[T]): bool {.noSideEffect,
    importcpp: "IntersectsWith", header: "vtkRect.h".}
proc MoveTo*[T](this: var vtkRect[T]; x: T; y: T) {.importcpp: "MoveTo",
    header: "vtkRect.h".}
proc Intersect*[T](this: var vtkRect[T]; other: vtkRect[T]): bool {.
    importcpp: "Intersect", header: "vtkRect.h".}
proc GetCenter*[T](this: vtkRect[T]): vtkVector2d {.noSideEffect,
    importcpp: "GetCenter", header: "vtkRect.h".}
type
  vtkRecti* {.importcpp: "vtkRecti", header: "vtkRect.h", bycopy.} = object of vtkRect[
      cint]


proc constructvtkRecti*(): vtkRecti {.constructor, importcpp: "vtkRecti(@)",
                                   header: "vtkRect.h".}
proc constructvtkRecti*(x: cint; y: cint; width: cint; height: cint): vtkRecti {.
    constructor, importcpp: "vtkRecti(@)", header: "vtkRect.h".}
proc constructvtkRecti*(init: ptr cint): vtkRecti {.constructor,
    importcpp: "vtkRecti(@)", header: "vtkRect.h".}
type
  vtkRectf* {.importcpp: "vtkRectf", header: "vtkRect.h", bycopy.} = object of vtkRect[
      cfloat]


proc constructvtkRectf*(): vtkRectf {.constructor, importcpp: "vtkRectf(@)",
                                   header: "vtkRect.h".}
proc constructvtkRectf*(x: cfloat; y: cfloat; width: cfloat; height: cfloat): vtkRectf {.
    constructor, importcpp: "vtkRectf(@)", header: "vtkRect.h".}
proc constructvtkRectf*(init: ptr cfloat): vtkRectf {.constructor,
    importcpp: "vtkRectf(@)", header: "vtkRect.h".}
type
  vtkRectd* {.importcpp: "vtkRectd", header: "vtkRect.h", bycopy.} = object of vtkRect[
      cdouble]


proc constructvtkRectd*(): vtkRectd {.constructor, importcpp: "vtkRectd(@)",
                                   header: "vtkRect.h".}
proc constructvtkRectd*(x: cdouble; y: cdouble; width: cdouble; height: cdouble): vtkRectd {.
    constructor, importcpp: "vtkRectd(@)", header: "vtkRect.h".}
proc constructvtkRectd*(init: ptr cdouble): vtkRectd {.constructor,
    importcpp: "vtkRectd(@)", header: "vtkRect.h".}