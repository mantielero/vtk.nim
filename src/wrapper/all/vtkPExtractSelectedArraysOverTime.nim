## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPExtractSelectedArraysOverTime.h
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
##  @class   vtkPExtractSelectedArraysOverTime
##  @brief   extracts a selection over time.
##
##  vtkPExtractSelectedArraysOverTime is a parallelized version of
##  vtkExtractSelectedArraysOverTime. It simply changes the types of internal
##  filters used to their parallelized versions. Thus instead of using
##  vtkExtractDataArraysOverTime over time, it's changed to
##  vtkPExtractDataArraysOverTime.
##
##  @sa vtkExtractDataArraysOverTime, vtkPExtractDataArraysOverTime
##

import
  vtkExtractSelectedArraysOverTime, vtkFiltersParallelModule

discard "forward decl of vtkMultiProcessController"
type
  vtkPExtractSelectedArraysOverTime* {.importcpp: "vtkPExtractSelectedArraysOverTime", header: "vtkPExtractSelectedArraysOverTime.h",
                                      bycopy.} = object of vtkExtractSelectedArraysOverTime
    vtkPExtractSelectedArraysOverTime* {.importc: "vtkPExtractSelectedArraysOverTime".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPExtractSelectedArraysOverTime {.
    importcpp: "vtkPExtractSelectedArraysOverTime::New(@)",
    header: "vtkPExtractSelectedArraysOverTime.h".}
type
  vtkPExtractSelectedArraysOverTimeSuperclass* = vtkExtractSelectedArraysOverTime

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPExtractSelectedArraysOverTime::IsTypeOf(@)",
    header: "vtkPExtractSelectedArraysOverTime.h".}
proc IsA*(this: var vtkPExtractSelectedArraysOverTime; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPExtractSelectedArraysOverTime.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPExtractSelectedArraysOverTime {.
    importcpp: "vtkPExtractSelectedArraysOverTime::SafeDownCast(@)",
    header: "vtkPExtractSelectedArraysOverTime.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPExtractSelectedArraysOverTime :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkExtractSelectedArraysOverTime :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPExtractSelectedArraysOverTime :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPExtractSelectedArraysOverTime :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPExtractSelectedArraysOverTime; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkPExtractSelectedArraysOverTime.h".}
proc SetController*(this: var vtkPExtractSelectedArraysOverTime;
                   a2: ptr vtkMultiProcessController) {.importcpp: "SetController",
    header: "vtkPExtractSelectedArraysOverTime.h".}
proc GetController*(this: var vtkPExtractSelectedArraysOverTime): ptr vtkMultiProcessController {.
    importcpp: "GetController", header: "vtkPExtractSelectedArraysOverTime.h".}