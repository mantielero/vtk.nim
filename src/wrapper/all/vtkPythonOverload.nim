## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPythonOverload.h
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
##  Created in June 2010 by David Gobbi, originally in vtkPythonUtil.
##
##  This file provides methods for calling overloaded functions
##  that are stored in a PyMethodDef table.  The arguments are
##  checked against the format strings that are stored in the
##  documentation fields of the table.  For more information,
##  see vtkWrapPython_ArgCheckString() in vtkWrapPython.c.
##
## *
##  @class   vtkPythonOverload
##

import
  vtkPython, vtkWrappingPythonCoreModule

type
  vtkPythonOverload* {.importcpp: "vtkPythonOverload",
                      header: "vtkPythonOverload.h", bycopy.} = object ## *
                                                                  ##  Check python object against a format character and return a number
                                                                  ##  to indicate how well it matches (lower numbers are better).
                                                                  ##


proc CheckArg*(arg: ptr PyObject; format: cstring; classname: cstring; level: cint = 0): cint {.
    importcpp: "vtkPythonOverload::CheckArg(@)", header: "vtkPythonOverload.h".}
proc CallMethod*(methods: ptr PyMethodDef; self: ptr PyObject; args: ptr PyObject): ptr PyObject {.
    importcpp: "vtkPythonOverload::CallMethod(@)", header: "vtkPythonOverload.h".}
proc FindConversionMethod*(methods: ptr PyMethodDef; arg: ptr PyObject): ptr PyMethodDef {.
    importcpp: "vtkPythonOverload::FindConversionMethod(@)",
    header: "vtkPythonOverload.h".}
##  VTK-HeaderTest-Exclude: vtkPythonOverload.h
