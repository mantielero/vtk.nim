## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkForceTime.h
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##     This software is distributed WITHOUT ANY WARRANTY; without even
##     the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##     PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================

import
  vtkFiltersHybridModule, vtkPassInputTypeAlgorithm

type
  vtkForceTime* {.importcpp: "vtkForceTime", header: "vtkForceTime.h", bycopy.} = object of vtkPassInputTypeAlgorithm
    vtkForceTime* {.importc: "vtkForceTime".}: VTK_NEWINSTANCE


proc New*(): ptr vtkForceTime {.importcpp: "vtkForceTime::New(@)",
                            header: "vtkForceTime.h".}
type
  vtkForceTimeSuperclass* = vtkPassInputTypeAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkForceTime::IsTypeOf(@)", header: "vtkForceTime.h".}
proc IsA*(this: var vtkForceTime; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkForceTime.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkForceTime {.
    importcpp: "vtkForceTime::SafeDownCast(@)", header: "vtkForceTime.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkForceTime :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPassInputTypeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkForceTime :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkForceTime :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkForceTime; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkForceTime.h".}
proc SetForcedTime*(this: var vtkForceTime; _arg: cdouble) {.
    importcpp: "SetForcedTime", header: "vtkForceTime.h".}
## !!!Ignored construct:  virtual double GetForcedTime ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ForcedTime  of  << this -> ForcedTime ) ; return this -> ForcedTime ; } ;
## Error: expected ';'!!!

proc SetForcedTimeIgnorePipelineTime*(this: var vtkForceTime; _arg: bool) {.
    importcpp: "SetForcedTimeIgnorePipelineTime", header: "vtkForceTime.h".}
## !!!Ignored construct:  virtual bool GetForcedTimeIgnorePipelineTime ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IgnorePipelineTime  of  << this -> IgnorePipelineTime ) ; return this -> IgnorePipelineTime ; } ;
## Error: expected ';'!!!

proc IgnorePipelineTimeOn*(this: var vtkForceTime) {.
    importcpp: "IgnorePipelineTimeOn", header: "vtkForceTime.h".}
proc IgnorePipelineTimeOff*(this: var vtkForceTime) {.
    importcpp: "IgnorePipelineTimeOff", header: "vtkForceTime.h".}