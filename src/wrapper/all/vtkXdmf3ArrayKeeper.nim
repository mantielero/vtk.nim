## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXdmf3ArrayKeeper.h
##   Language:  C++
##
##   Copyright (c) 1993-2002 Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkXdmf3ArrayKeeper
##  @brief   LRU cache of XDMF Arrays
##
##  vtkXdmf3ArrayKeeper maintains the in memory cache of recently used XdmfArrays.
##  Each array that is loaded from XDMF is put in the cache and/or marked with the
##  current timestep. A release method frees arrays that have not been recently
##  used.
##
##  This file is a helper for the vtkXdmf3Reader and not intended to be
##  part of VTK public API
##

import
  vtkIOXdmf3Module

discard "forward decl of XdmfArray"
when defined(_MSC_VER):
type
  vtkXdmf3ArrayKeeper* {.importcpp: "vtkXdmf3ArrayKeeper",
                        header: "vtkXdmf3ArrayKeeper.h", bycopy.} = object of map[
      ptr XdmfArray, cuint]     ## *
                         ##  Constructor
                         ##


proc constructvtkXdmf3ArrayKeeper*(): vtkXdmf3ArrayKeeper {.constructor,
    importcpp: "vtkXdmf3ArrayKeeper(@)", header: "vtkXdmf3ArrayKeeper.h".}
proc destroyvtkXdmf3ArrayKeeper*(this: var vtkXdmf3ArrayKeeper) {.
    importcpp: "#.~vtkXdmf3ArrayKeeper()", header: "vtkXdmf3ArrayKeeper.h".}
proc BumpGeneration*(this: var vtkXdmf3ArrayKeeper) {.importcpp: "BumpGeneration",
    header: "vtkXdmf3ArrayKeeper.h".}
proc Insert*(this: var vtkXdmf3ArrayKeeper; val: ptr XdmfArray) {.importcpp: "Insert",
    header: "vtkXdmf3ArrayKeeper.h".}
proc Release*(this: var vtkXdmf3ArrayKeeper; force: bool) {.importcpp: "Release",
    header: "vtkXdmf3ArrayKeeper.h".}
when defined(_MSC_VER):
  discard