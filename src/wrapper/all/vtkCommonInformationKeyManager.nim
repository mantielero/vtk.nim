## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCommonInformationKeyManager.h
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
##  @class   vtkCommonInformationKeyManager
##  @brief   Manages key types in vtkCommon.
##
##  vtkCommonInformationKeyManager is included in the header of any
##  subclass of vtkInformationKey defined in the vtkCommon library.
##  It makes sure that the table of keys is created before and
##  destroyed after it is used.
##

import
  vtkCommonCoreModule, vtkSystemIncludes, vtkDebugLeaksManager

import
  vtkInformationKey

discard "forward decl of vtkInformationKey"
type
  vtkCommonInformationKeyManager* {.importcpp: "vtkCommonInformationKeyManager",
                                   header: "vtkCommonInformationKeyManager.h",
                                   bycopy.} = object ##  Unimplemented


proc constructvtkCommonInformationKeyManager*(): vtkCommonInformationKeyManager {.
    constructor, importcpp: "vtkCommonInformationKeyManager(@)",
    header: "vtkCommonInformationKeyManager.h".}
proc destroyvtkCommonInformationKeyManager*(
    this: var vtkCommonInformationKeyManager) {.
    importcpp: "#.~vtkCommonInformationKeyManager()",
    header: "vtkCommonInformationKeyManager.h".}
proc Register*(key: ptr vtkInformationKey) {.
    importcpp: "vtkCommonInformationKeyManager::Register(@)",
    header: "vtkCommonInformationKeyManager.h".}
##  This instance will show up in any translation unit that uses key
##  types defined in vtkCommon or that has a singleton.  It will
##  make sure vtkCommonInformationKeyManager's vector of keys is
##  initialized before and destroyed after it is used.

var vtkCommonInformationKeyManagerInstance* {.
    importcpp: "vtkCommonInformationKeyManagerInstance",
    header: "vtkCommonInformationKeyManager.h".}: vtkCommonInformationKeyManager

##  VTK-HeaderTest-Exclude: vtkCommonInformationKeyManager.h
