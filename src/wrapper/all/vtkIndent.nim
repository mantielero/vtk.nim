## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkIndent.h
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
##  @class   vtkIndent
##  @brief   a simple class to control print indentation
##
##  vtkIndent is used to control indentation during the chaining print
##  process. This way nested objects can correctly indent themselves.
##

import
  vtkCommonCoreModule, vtkSystemIncludes

type
  ostream* = object   # FIXME

type
  vtkIndent* {.importcpp: "vtkIndent", header: "vtkIndent.h", bycopy.} = object


discard "forward decl of vtkIndent"
proc `<<`*(os: var ostream; o: vtkIndent): var ostream {.importcpp: "(# << #)",
    header: "vtkIndent.h".}


proc Delete*(this: var vtkIndent) {.importcpp: "Delete", header: "vtkIndent.h".}
proc constructvtkIndent*(ind: cint = 0): vtkIndent {.constructor,
    importcpp: "vtkIndent(@)", header: "vtkIndent.h".}
proc New*(): ptr vtkIndent {.importcpp: "vtkIndent::New(@)", header: "vtkIndent.h".}
proc GetNextIndent*(this: var vtkIndent): vtkIndent {.importcpp: "GetNextIndent",
    header: "vtkIndent.h".}
##  VTK-HeaderTest-Exclude: vtkIndent.h
