## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTimeStamp.h
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
##  @class   vtkTimeStamp
##  @brief   record modification and/or execution time
##
##  vtkTimeStamp records a unique time when the method Modified() is
##  executed. This time is guaranteed to be monotonically increasing.
##  Classes use this object to record modified and/or execution time.
##  There is built in support for the binary < and > comparison
##  operators between two vtkTimeStamp objects.
##

import
  vtkCommonCoreModule, vtkSystemIncludes, vtkType

type
  vtkTimeStamp* {.importcpp: "vtkTimeStamp", header: "vtkTimeStamp.h", bycopy.} = object
  #vtkMTimeType* = object # FIXME

converter tovtkMTimeType*(this: vtkTimeStamp): vtkMTimeType {.noSideEffect,
    importcpp: "vtkTimeStamp::operator vtkMTimeType", header: "vtkTimeStamp.h".}

proc constructvtkTimeStamp*(): vtkTimeStamp {.constructor,
    importcpp: "vtkTimeStamp(@)", header: "vtkTimeStamp.h".}
proc New*(): ptr vtkTimeStamp {.importcpp: "vtkTimeStamp::New(@)",
                            header: "vtkTimeStamp.h".}
proc Delete*(this: var vtkTimeStamp) {.importcpp: "Delete", header: "vtkTimeStamp.h".}
proc Modified*(this: var vtkTimeStamp) {.importcpp: "Modified",
                                     header: "vtkTimeStamp.h".}
proc GetMTime*(this: vtkTimeStamp): vtkMTimeType {.noSideEffect,
    importcpp: "GetMTime", header: "vtkTimeStamp.h".}
proc `<`*(this: var vtkTimeStamp; ts: var vtkTimeStamp): bool {.importcpp: "(# < #)",
    header: "vtkTimeStamp.h".}

##  VTK-HeaderTest-Exclude: vtkTimeStamp.h
