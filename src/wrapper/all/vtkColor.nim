## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkColor.h
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
##  @class   vtkColor
##  @brief   templated type for storage of colors.
##
##
##  This class is a templated data type for storing and manipulating fixed size
##  colors. It derives from the vtkVector templated data structure.
##

import
  vtkObject, vtkTuple

##  .NAME vtkColor3 - templated base type for storage of 3 component colors.
##

type
  vtkColor3*[T] {.importcpp: "vtkColor3<\'0>", header: "vtkColor.h", bycopy.} = object of vtkTuple[
      T, 3]


proc constructvtkColor3*[T](): vtkColor3[T] {.constructor,
    importcpp: "vtkColor3<\'*0>(@)", header: "vtkColor.h".}
proc constructvtkColor3*[T](scalar: T): vtkColor3[T] {.constructor,
    importcpp: "vtkColor3<\'*0>(@)", header: "vtkColor.h".}
proc constructvtkColor3*[T](init: ptr T): vtkColor3[T] {.constructor,
    importcpp: "vtkColor3<\'*0>(@)", header: "vtkColor.h".}
proc constructvtkColor3*[T](red: T; green: T; blue: T): vtkColor3[T] {.constructor,
    importcpp: "vtkColor3<\'*0>(@)", header: "vtkColor.h".}
proc Set*[T](this: var vtkColor3[T]; red: T; green: T; blue: T) {.importcpp: "Set",
    header: "vtkColor.h".}
proc SetRed*[T](this: var vtkColor3[T]; red: T) {.importcpp: "SetRed",
    header: "vtkColor.h".}
proc GetRed*[T](this: vtkColor3[T]): T {.noSideEffect, importcpp: "GetRed",
                                     header: "vtkColor.h".}
proc SetGreen*[T](this: var vtkColor3[T]; green: T) {.importcpp: "SetGreen",
    header: "vtkColor.h".}
proc GetGreen*[T](this: vtkColor3[T]): T {.noSideEffect, importcpp: "GetGreen",
                                       header: "vtkColor.h".}
proc SetBlue*[T](this: var vtkColor3[T]; blue: T) {.importcpp: "SetBlue",
    header: "vtkColor.h".}
proc GetBlue*[T](this: vtkColor3[T]): T {.noSideEffect, importcpp: "GetBlue",
                                      header: "vtkColor.h".}
##  .NAME vtkColor4 - templated base type for storage of 4 component colors.
##

type
  vtkColor4*[T] {.importcpp: "vtkColor4<\'0>", header: "vtkColor.h", bycopy.} = object of vtkTuple[
      T, 4]


proc constructvtkColor4*[T](): vtkColor4[T] {.constructor,
    importcpp: "vtkColor4<\'*0>(@)", header: "vtkColor.h".}
proc constructvtkColor4*[T](scalar: T): vtkColor4[T] {.constructor,
    importcpp: "vtkColor4<\'*0>(@)", header: "vtkColor.h".}
proc constructvtkColor4*[T](init: ptr T): vtkColor4[T] {.constructor,
    importcpp: "vtkColor4<\'*0>(@)", header: "vtkColor.h".}
proc constructvtkColor4*[T](red: T; green: T; blue: T; alpha: T): vtkColor4[T] {.
    constructor, importcpp: "vtkColor4<\'*0>(@)", header: "vtkColor.h".}
proc Set*[T](this: var vtkColor4[T]; red: T; green: T; blue: T) {.importcpp: "Set",
    header: "vtkColor.h".}
proc Set*[T](this: var vtkColor4[T]; red: T; green: T; blue: T; alpha: T) {.
    importcpp: "Set", header: "vtkColor.h".}
proc SetRed*[T](this: var vtkColor4[T]; red: T) {.importcpp: "SetRed",
    header: "vtkColor.h".}
proc GetRed*[T](this: vtkColor4[T]): T {.noSideEffect, importcpp: "GetRed",
                                     header: "vtkColor.h".}
proc SetGreen*[T](this: var vtkColor4[T]; green: T) {.importcpp: "SetGreen",
    header: "vtkColor.h".}
proc GetGreen*[T](this: vtkColor4[T]): T {.noSideEffect, importcpp: "GetGreen",
                                       header: "vtkColor.h".}
proc SetBlue*[T](this: var vtkColor4[T]; blue: T) {.importcpp: "SetBlue",
    header: "vtkColor.h".}
proc GetBlue*[T](this: vtkColor4[T]): T {.noSideEffect, importcpp: "GetBlue",
                                      header: "vtkColor.h".}
proc SetAlpha*[T](this: var vtkColor4[T]; alpha: T) {.importcpp: "SetAlpha",
    header: "vtkColor.h".}
proc GetAlpha*[T](this: vtkColor4[T]): T {.noSideEffect, importcpp: "GetAlpha",
                                       header: "vtkColor.h".}
## *
##  Some derived classes for the different colors commonly used.
##

type
  vtkColor3ub* {.importcpp: "vtkColor3ub", header: "vtkColor.h", bycopy.} = object of vtkColor3[
      cuchar]


proc constructvtkColor3ub*(): vtkColor3ub {.constructor,
    importcpp: "vtkColor3ub(@)", header: "vtkColor.h".}
proc constructvtkColor3ub*(scalar: cuchar): vtkColor3ub {.constructor,
    importcpp: "vtkColor3ub(@)", header: "vtkColor.h".}
proc constructvtkColor3ub*(init: ptr cuchar): vtkColor3ub {.constructor,
    importcpp: "vtkColor3ub(@)", header: "vtkColor.h".}
proc constructvtkColor3ub*(hexSigned: cint): vtkColor3ub {.constructor,
    importcpp: "vtkColor3ub(@)", header: "vtkColor.h".}
proc constructvtkColor3ub*(r: cuchar; g: cuchar; b: cuchar): vtkColor3ub {.constructor,
    importcpp: "vtkColor3ub(@)", header: "vtkColor.h".}
type
  vtkColor3f* {.importcpp: "vtkColor3f", header: "vtkColor.h", bycopy.} = object of vtkColor3[
      cfloat]


proc constructvtkColor3f*(): vtkColor3f {.constructor, importcpp: "vtkColor3f(@)",
                                       header: "vtkColor.h".}
proc constructvtkColor3f*(scalar: cfloat): vtkColor3f {.constructor,
    importcpp: "vtkColor3f(@)", header: "vtkColor.h".}
proc constructvtkColor3f*(init: ptr cfloat): vtkColor3f {.constructor,
    importcpp: "vtkColor3f(@)", header: "vtkColor.h".}
proc constructvtkColor3f*(r: cfloat; g: cfloat; b: cfloat): vtkColor3f {.constructor,
    importcpp: "vtkColor3f(@)", header: "vtkColor.h".}
type
  vtkColor3d* {.importcpp: "vtkColor3d", header: "vtkColor.h", bycopy.} = object of vtkColor3[
      cdouble]


proc constructvtkColor3d*(): vtkColor3d {.constructor, importcpp: "vtkColor3d(@)",
                                       header: "vtkColor.h".}
proc constructvtkColor3d*(scalar: cdouble): vtkColor3d {.constructor,
    importcpp: "vtkColor3d(@)", header: "vtkColor.h".}
proc constructvtkColor3d*(init: ptr cdouble): vtkColor3d {.constructor,
    importcpp: "vtkColor3d(@)", header: "vtkColor.h".}
proc constructvtkColor3d*(r: cdouble; g: cdouble; b: cdouble): vtkColor3d {.constructor,
    importcpp: "vtkColor3d(@)", header: "vtkColor.h".}
type
  vtkColor4ub* {.importcpp: "vtkColor4ub", header: "vtkColor.h", bycopy.} = object of vtkColor4[
      cuchar]


proc constructvtkColor4ub*(): vtkColor4ub {.constructor,
    importcpp: "vtkColor4ub(@)", header: "vtkColor.h".}
proc constructvtkColor4ub*(scalar: cuchar): vtkColor4ub {.constructor,
    importcpp: "vtkColor4ub(@)", header: "vtkColor.h".}
proc constructvtkColor4ub*(init: ptr cuchar): vtkColor4ub {.constructor,
    importcpp: "vtkColor4ub(@)", header: "vtkColor.h".}
proc constructvtkColor4ub*(hexSigned: cint): vtkColor4ub {.constructor,
    importcpp: "vtkColor4ub(@)", header: "vtkColor.h".}
proc constructvtkColor4ub*(r: cuchar; g: cuchar; b: cuchar; a: cuchar = 255): vtkColor4ub {.
    constructor, importcpp: "vtkColor4ub(@)", header: "vtkColor.h".}
proc constructvtkColor4ub*(c: vtkColor3ub): vtkColor4ub {.constructor,
    importcpp: "vtkColor4ub(@)", header: "vtkColor.h".}
type
  vtkColor4f* {.importcpp: "vtkColor4f", header: "vtkColor.h", bycopy.} = object of vtkColor4[
      cfloat]


proc constructvtkColor4f*(): vtkColor4f {.constructor, importcpp: "vtkColor4f(@)",
                                       header: "vtkColor.h".}
proc constructvtkColor4f*(scalar: cfloat): vtkColor4f {.constructor,
    importcpp: "vtkColor4f(@)", header: "vtkColor.h".}
proc constructvtkColor4f*(init: ptr cfloat): vtkColor4f {.constructor,
    importcpp: "vtkColor4f(@)", header: "vtkColor.h".}
proc constructvtkColor4f*(r: cfloat; g: cfloat; b: cfloat; a: cfloat = 1.0): vtkColor4f {.
    constructor, importcpp: "vtkColor4f(@)", header: "vtkColor.h".}
type
  vtkColor4d* {.importcpp: "vtkColor4d", header: "vtkColor.h", bycopy.} = object of vtkColor4[
      cdouble]


proc constructvtkColor4d*(): vtkColor4d {.constructor, importcpp: "vtkColor4d(@)",
                                       header: "vtkColor.h".}
proc constructvtkColor4d*(scalar: cdouble): vtkColor4d {.constructor,
    importcpp: "vtkColor4d(@)", header: "vtkColor.h".}
proc constructvtkColor4d*(init: ptr cdouble): vtkColor4d {.constructor,
    importcpp: "vtkColor4d(@)", header: "vtkColor.h".}
proc constructvtkColor4d*(r: cdouble; g: cdouble; b: cdouble; a: cdouble = 1.0): vtkColor4d {.
    constructor, importcpp: "vtkColor4d(@)", header: "vtkColor.h".}