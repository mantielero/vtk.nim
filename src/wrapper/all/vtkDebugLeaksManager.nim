## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDebugLeaksManager.h
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
##  @class   vtkDebugLeaksManager
##  @brief   Manages the vtkDebugLeaks singleton.
##
##  vtkDebugLeaksManager should be included in any translation unit
##  that will use vtkDebugLeaks or that implements the singleton
##  pattern.  It makes sure that the vtkDebugLeaks singleton is created
##  before and destroyed after all other singletons in VTK.
##

import
  vtkCommonCoreModule, vtkSystemIncludes

type
  vtkDebugLeaksManager* {.importcpp: "vtkDebugLeaksManager",
                         header: "vtkDebugLeaksManager.h", bycopy.} = object


proc constructvtkDebugLeaksManager*(): vtkDebugLeaksManager {.constructor,
    importcpp: "vtkDebugLeaksManager(@)", header: "vtkDebugLeaksManager.h".}
proc destroyvtkDebugLeaksManager*(this: var vtkDebugLeaksManager) {.
    importcpp: "#.~vtkDebugLeaksManager()", header: "vtkDebugLeaksManager.h".}
##  This instance will show up in any translation unit that uses
##  vtkDebugLeaks or that has a singleton.  It will make sure
##  vtkDebugLeaks is initialized before it is used and is the last
##  static object destroyed.

var vtkDebugLeaksManagerInstance* {.importcpp: "vtkDebugLeaksManagerInstance",
                                  header: "vtkDebugLeaksManager.h".}: vtkDebugLeaksManager

##  VTK-HeaderTest-Exclude: vtkDebugLeaksManager.h
