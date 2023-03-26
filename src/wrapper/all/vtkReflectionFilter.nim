## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkReflectionFilter.h
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
##  @class   vtkReflectionFilter
##  @brief   reflects a data set across a plane
##
##  The vtkReflectionFilter reflects a data set across one of the
##  planes formed by the data set's bounding box.
##  Since it converts data sets into unstructured grids, it is not efficient
##  for structured data sets.
##

import
  vtkDataObjectAlgorithm, vtkFiltersGeneralModule

discard "forward decl of vtkUnstructuredGrid"
discard "forward decl of vtkDataSet"
type
  vtkReflectionFilter* {.importcpp: "vtkReflectionFilter",
                        header: "vtkReflectionFilter.h", bycopy.} = object of vtkDataObjectAlgorithm
    vtkReflectionFilter* {.importc: "vtkReflectionFilter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkReflectionFilter {.importcpp: "vtkReflectionFilter::New(@)",
                                   header: "vtkReflectionFilter.h".}
type
  vtkReflectionFilterSuperclass* = vtkDataObjectAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkReflectionFilter::IsTypeOf(@)", header: "vtkReflectionFilter.h".}
proc IsA*(this: var vtkReflectionFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkReflectionFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkReflectionFilter {.
    importcpp: "vtkReflectionFilter::SafeDownCast(@)",
    header: "vtkReflectionFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkReflectionFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataObjectAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkReflectionFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkReflectionFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkReflectionFilter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkReflectionFilter.h".}
type
  vtkReflectionFilterReflectionPlane* {.size: sizeof(cint), importcpp: "vtkReflectionFilter::ReflectionPlane",
                                       header: "vtkReflectionFilter.h".} = enum
    USE_X_MIN = 0, USE_Y_MIN = 1, USE_Z_MIN = 2, USE_X_MAX = 3, USE_Y_MAX = 4, USE_Z_MAX = 5,
    USE_X = 6, USE_Y = 7, USE_Z = 8


proc SetPlane*(this: var vtkReflectionFilter; _arg: cint) {.importcpp: "SetPlane",
    header: "vtkReflectionFilter.h".}
proc GetPlaneMinValue*(this: var vtkReflectionFilter): cint {.
    importcpp: "GetPlaneMinValue", header: "vtkReflectionFilter.h".}
proc GetPlaneMaxValue*(this: var vtkReflectionFilter): cint {.
    importcpp: "GetPlaneMaxValue", header: "vtkReflectionFilter.h".}
## !!!Ignored construct:  virtual int GetPlane ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Plane  of  << this -> Plane ) ; return this -> Plane ; } ;
## Error: expected ';'!!!

proc SetPlaneToX*(this: var vtkReflectionFilter) {.importcpp: "SetPlaneToX",
    header: "vtkReflectionFilter.h".}
proc SetPlaneToY*(this: var vtkReflectionFilter) {.importcpp: "SetPlaneToY",
    header: "vtkReflectionFilter.h".}
proc SetPlaneToZ*(this: var vtkReflectionFilter) {.importcpp: "SetPlaneToZ",
    header: "vtkReflectionFilter.h".}
proc SetPlaneToXMin*(this: var vtkReflectionFilter) {.importcpp: "SetPlaneToXMin",
    header: "vtkReflectionFilter.h".}
proc SetPlaneToYMin*(this: var vtkReflectionFilter) {.importcpp: "SetPlaneToYMin",
    header: "vtkReflectionFilter.h".}
proc SetPlaneToZMin*(this: var vtkReflectionFilter) {.importcpp: "SetPlaneToZMin",
    header: "vtkReflectionFilter.h".}
proc SetPlaneToXMax*(this: var vtkReflectionFilter) {.importcpp: "SetPlaneToXMax",
    header: "vtkReflectionFilter.h".}
proc SetPlaneToYMax*(this: var vtkReflectionFilter) {.importcpp: "SetPlaneToYMax",
    header: "vtkReflectionFilter.h".}
proc SetPlaneToZMax*(this: var vtkReflectionFilter) {.importcpp: "SetPlaneToZMax",
    header: "vtkReflectionFilter.h".}
proc SetCenter*(this: var vtkReflectionFilter; _arg: cdouble) {.
    importcpp: "SetCenter", header: "vtkReflectionFilter.h".}
## !!!Ignored construct:  virtual double GetPlaneCenter ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Center  of  << this -> Center ) ; return this -> Center ; } ;
## Error: expected ';'!!!

proc SetCenterCopyInput*(this: var vtkReflectionFilter; _arg: vtkTypeBool) {.
    importcpp: "SetCenterCopyInput", header: "vtkReflectionFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetPlaneCenterCopyInput ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CopyInput  of  << this -> CopyInput ) ; return this -> CopyInput ; } ;
## Error: expected ';'!!!

proc CopyInputOn*(this: var vtkReflectionFilter) {.importcpp: "CopyInputOn",
    header: "vtkReflectionFilter.h".}
proc CopyInputOff*(this: var vtkReflectionFilter) {.importcpp: "CopyInputOff",
    header: "vtkReflectionFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  If off (the default), only Vectors, Normals and Tensors will be flipped.
  ##  If on, all 3-component data arrays ( considered as 3D vectors),
  ##  6-component data arrays (considered as symmetric tensors),
  ##  9-component data arrays (considered as tensors ) of signed type will be flipped.
  ##  All other won't be flipped and will only be copied.
  ##
proc SetCenterCopyInputFlipAllInputArrays*(this: var vtkReflectionFilter; _arg: bool) {.
    importcpp: "SetCenterCopyInputFlipAllInputArrays",
    header: "vtkReflectionFilter.h".}
## !!!Ignored construct:  virtual bool GetPlaneCenterCopyInputFlipAllInputArrays ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FlipAllInputArrays  of  << this -> FlipAllInputArrays ) ; return this -> FlipAllInputArrays ; } ;
## Error: expected ';'!!!

proc FlipAllInputArraysOn*(this: var vtkReflectionFilter) {.
    importcpp: "FlipAllInputArraysOn", header: "vtkReflectionFilter.h".}
proc FlipAllInputArraysOff*(this: var vtkReflectionFilter) {.
    importcpp: "FlipAllInputArraysOff", header: "vtkReflectionFilter.h".}
  ## /@}