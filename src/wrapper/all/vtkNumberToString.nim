## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkNumberToString.h
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
##  @class vtkNumberToString
##  @brief Convert floating and fixed point numbers to strings
##
##  This class uses the double-conversion library to convert floating point and
##  fixed point numbers to ASCII versions that are represented without
##  numerical precision errors.
##
##  Typical use:
##
##  @code{cpp}
##   #include "vtkNumberToString.h"
##   vtkNumberToString convert;
##   float a = 1.0f/3.0f;
##   std::cout << convert(a) << std::endl;
##  @endcode
##

import
  vtkIOCoreModule, vtkTypeTraits

type
  vtkNumberToString* {.importcpp: "vtkNumberToString",
                      header: "vtkNumberToString.h", bycopy.} = object

  vtkNumberToStringTagDouble* {.importcpp: "vtkNumberToString::TagDouble",
                               header: "vtkNumberToString.h", bycopy.} = object
    Value* {.importc: "Value".}: cdouble


proc constructvtkNumberToStringTagDouble*(value: cdouble): vtkNumberToStringTagDouble {.
    constructor, importcpp: "vtkNumberToString::TagDouble(@)",
    header: "vtkNumberToString.h".}
type
  vtkNumberToStringTagFloat* {.importcpp: "vtkNumberToString::TagFloat",
                              header: "vtkNumberToString.h", bycopy.} = object
    Value* {.importc: "Value".}: cfloat


proc constructvtkNumberToStringTagFloat*(value: cfloat): vtkNumberToStringTagFloat {.
    constructor, importcpp: "vtkNumberToString::TagFloat(@)",
    header: "vtkNumberToString.h".}
proc `()`*[T](this: vtkNumberToString; val: T): T {.noSideEffect, importcpp: "#(@)",
    header: "vtkNumberToString.h".}
proc `()`*(this: vtkNumberToString; val: cdouble): vtkNumberToStringTagDouble {.
    noSideEffect, importcpp: "#(@)", header: "vtkNumberToString.h".}
proc `()`*(this: vtkNumberToString; val: cfloat): vtkNumberToStringTagFloat {.
    noSideEffect, importcpp: "#(@)", header: "vtkNumberToString.h".}
proc `<<`*(stream: var ostream; tag: vtkNumberToStringTagDouble): var ostream {.
    importcpp: "(# << #)", header: "vtkNumberToString.h".}
proc `<<`*(stream: var ostream; tag: vtkNumberToStringTagFloat): var ostream {.
    importcpp: "(# << #)", header: "vtkNumberToString.h".}
##  VTK-HeaderTest-Exclude: vtkNumberToString.h
