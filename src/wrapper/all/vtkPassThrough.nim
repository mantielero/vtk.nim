## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPassThrough.h
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
##  @class vtkPassThrough
##  @brief Pass input input data through to the output
##
##  vtkPassThrough simply passes input data to the output. By default, the input
##  is shallow-copied (using `vtkDataObject::ShallowCopy`). If `DeepCopyInput` is true,
##  then the input is deep-copied (using `vtkDataObject::DeepCopy`).
##
##  The output type is always the same as the input object type.
##

import
  vtkFiltersCoreModule, vtkPassInputTypeAlgorithm

type
  vtkPassThrough* {.importcpp: "vtkPassThrough", header: "vtkPassThrough.h", bycopy.} = object of vtkPassInputTypeAlgorithm
    vtkPassThrough* {.importc: "vtkPassThrough".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPassThrough {.importcpp: "vtkPassThrough::New(@)",
                              header: "vtkPassThrough.h".}
type
  vtkPassThroughSuperclass* = vtkPassInputTypeAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPassThrough::IsTypeOf(@)", header: "vtkPassThrough.h".}
proc IsA*(this: var vtkPassThrough; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkPassThrough.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPassThrough {.
    importcpp: "vtkPassThrough::SafeDownCast(@)", header: "vtkPassThrough.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPassThrough :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPassInputTypeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPassThrough :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPassThrough :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPassThrough; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPassThrough.h".}
proc FillInputPortInformation*(this: var vtkPassThrough; port: cint;
                              info: ptr vtkInformation): cint {.
    importcpp: "FillInputPortInformation", header: "vtkPassThrough.h".}
proc SetDeepCopyInput*(this: var vtkPassThrough; _arg: vtkTypeBool) {.
    importcpp: "SetDeepCopyInput", header: "vtkPassThrough.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetDeepCopyInput ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DeepCopyInput  of  << this -> DeepCopyInput ) ; return this -> DeepCopyInput ; } ;
## Error: expected ';'!!!

proc DeepCopyInputOn*(this: var vtkPassThrough) {.importcpp: "DeepCopyInputOn",
    header: "vtkPassThrough.h".}
proc DeepCopyInputOff*(this: var vtkPassThrough) {.importcpp: "DeepCopyInputOff",
    header: "vtkPassThrough.h".}
  ## /@}
  ## *
  ##  Allow the filter to execute without error when no input connection is
  ##  specified. In this case, and empty vtkPolyData dataset will be created.
  ##  By default, this setting is false.
  ##  @{
  ##
proc SetDeepCopyInputAllowNullInput*(this: var vtkPassThrough; _arg: bool) {.
    importcpp: "SetDeepCopyInputAllowNullInput", header: "vtkPassThrough.h".}
## !!!Ignored construct:  virtual bool GetDeepCopyInputAllowNullInput ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AllowNullInput  of  << this -> AllowNullInput ) ; return this -> AllowNullInput ; } ;
## Error: expected ';'!!!

proc AllowNullInputOn*(this: var vtkPassThrough) {.importcpp: "AllowNullInputOn",
    header: "vtkPassThrough.h".}
proc AllowNullInputOff*(this: var vtkPassThrough) {.importcpp: "AllowNullInputOff",
    header: "vtkPassThrough.h".}
  ## *@}