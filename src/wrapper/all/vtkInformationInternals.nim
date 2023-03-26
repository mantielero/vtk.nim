## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInformationInternals.h
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
##  @class   vtkInformationInternals
##  @brief   internal structure for vtkInformation
##
##  vtkInformationInternals is used in internal implementation of
##  vtkInformation. This should only be accessed by friends
##  and sub-classes of that class.
##

import
  vtkInformationKey, vtkObjectBase

## ----------------------------------------------------------------------------

type
  vtkInformationInternals* {.importcpp: "vtkInformationInternals",
                            header: "vtkInformationInternals.h", bycopy.} = object
    Map* {.importc: "Map".}: vtkInformationInternalsMapType

  vtkInformationInternalsKeyType* = ptr vtkInformationKey
  vtkInformationInternalsDataType* = ptr vtkObjectBase
  vtkInformationInternalsHashFun* {.importcpp: "vtkInformationInternals::HashFun",
                                   header: "vtkInformationInternals.h", bycopy.} = object


proc `()`*(this: vtkInformationInternalsHashFun;
          key: vtkInformationInternalsKeyType): csize_t {.noSideEffect,
    importcpp: "#(@)", header: "vtkInformationInternals.h".}
type
  vtkInformationInternalsMapType* = unordered_map[vtkInformationInternalsKeyType,
      vtkInformationInternalsDataType, vtkInformationInternalsHashFun]

proc constructvtkInformationInternals*(): vtkInformationInternals {.constructor,
    importcpp: "vtkInformationInternals(@)", header: "vtkInformationInternals.h".}
proc destroyvtkInformationInternals*(this: var vtkInformationInternals) {.
    importcpp: "#.~vtkInformationInternals()", header: "vtkInformationInternals.h".}
##  VTK-HeaderTest-Exclude: vtkInformationInternals.h
