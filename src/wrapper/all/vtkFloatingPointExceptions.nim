## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFloatingPointExceptions.h
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
##  @class   vtkFloatingPointExceptions
##  @brief   Deal with floating-point exceptions
##
##  Right now it is really basic and it only provides a function to enable
##  floating point exceptions on some compilers.
##  Note that Borland C++ has floating-point exceptions by default, not
##  Visual studio nor gcc. It is mainly use to optionally enable floating
##  point exceptions in the C++ tests.
##

import
  vtkCommonCoreModule, vtkSystemIncludes

type
  vtkFloatingPointExceptions* {.importcpp: "vtkFloatingPointExceptions",
                               header: "vtkFloatingPointExceptions.h", bycopy.} = object ## *
                                                                                    ##  Enable floating point exceptions.
                                                                                    ##


proc Enable*() {.importcpp: "vtkFloatingPointExceptions::Enable(@)",
               header: "vtkFloatingPointExceptions.h".}
proc Disable*() {.importcpp: "vtkFloatingPointExceptions::Disable(@)",
                header: "vtkFloatingPointExceptions.h".}
##  VTK-HeaderTest-Exclude: vtkFloatingPointExceptions.h
