## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPassSelectedArrays.h
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
##  @class vtkPassSelectedArrays
##  @brief pass through chosen arrays
##
##  vtkPassSelectedArrays can be used to pass through chosen arrays. It is
##  intended as a replacement for vtkPassArrays filter with a more standard API
##  that uses `vtkDataArraySelection` to choose arrays to pass through.
##
##  To enable/disable arrays to pass, get the appropriate `vtkDataArraySelection`
##  instance using `GetArraySelection` or the association specific get methods
##  such as `GetPointDataArraySelection`, `GetCellDataArraySelection` etc. and
##  then enable/disable arrays using `vtkDataArraySelection` API. Using
##  vtkDataArraySelection::SetUnknownArraySetting` one also dictate how arrays
##  not explicitly listed are to be handled.
##
##

import
  vtkDataObject, vtkFiltersGeneralModule, vtkPassInputTypeAlgorithm,
  vtkSmartPointer

discard "forward decl of vtkDataArraySelection"
type
  vtkPassSelectedArrays* {.importcpp: "vtkPassSelectedArrays",
                          header: "vtkPassSelectedArrays.h", bycopy.} = object of vtkPassInputTypeAlgorithm
    vtkPassSelectedArrays* {.importc: "vtkPassSelectedArrays".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPassSelectedArrays {.importcpp: "vtkPassSelectedArrays::New(@)",
                                     header: "vtkPassSelectedArrays.h".}
type
  vtkPassSelectedArraysSuperclass* = vtkPassInputTypeAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPassSelectedArrays::IsTypeOf(@)",
    header: "vtkPassSelectedArrays.h".}
proc IsA*(this: var vtkPassSelectedArrays; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPassSelectedArrays.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPassSelectedArrays {.
    importcpp: "vtkPassSelectedArrays::SafeDownCast(@)",
    header: "vtkPassSelectedArrays.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPassSelectedArrays :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPassInputTypeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPassSelectedArrays :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPassSelectedArrays :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPassSelectedArrays; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPassSelectedArrays.h".}
proc SetEnabled*(this: var vtkPassSelectedArrays; _arg: bool) {.
    importcpp: "SetEnabled", header: "vtkPassSelectedArrays.h".}
## !!!Ignored construct:  virtual bool GetEnabled ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Enabled  of  << this -> Enabled ) ; return this -> Enabled ; } ;
## Error: expected ';'!!!

proc EnabledOn*(this: var vtkPassSelectedArrays) {.importcpp: "EnabledOn",
    header: "vtkPassSelectedArrays.h".}
proc EnabledOff*(this: var vtkPassSelectedArrays) {.importcpp: "EnabledOff",
    header: "vtkPassSelectedArrays.h".}
  ## /@}
  ## *
  ##  Returns the vtkDataArraySelection instance associated with a particular
  ##  array association type (vtkDataObject::FieldAssociations). Returns nullptr
  ##  if the association type is invalid others the corresponding
  ##  vtkDataArraySelection instance is returned.
  ##
proc GetArraySelection*(this: var vtkPassSelectedArrays; association: cint): ptr vtkDataArraySelection {.
    importcpp: "GetArraySelection", header: "vtkPassSelectedArrays.h".}
proc GetPointDataArraySelection*(this: var vtkPassSelectedArrays): ptr vtkDataArraySelection {.
    importcpp: "GetPointDataArraySelection", header: "vtkPassSelectedArrays.h".}
proc GetCellDataArraySelection*(this: var vtkPassSelectedArrays): ptr vtkDataArraySelection {.
    importcpp: "GetCellDataArraySelection", header: "vtkPassSelectedArrays.h".}
proc GetFieldDataArraySelection*(this: var vtkPassSelectedArrays): ptr vtkDataArraySelection {.
    importcpp: "GetFieldDataArraySelection", header: "vtkPassSelectedArrays.h".}
proc GetVertexDataArraySelection*(this: var vtkPassSelectedArrays): ptr vtkDataArraySelection {.
    importcpp: "GetVertexDataArraySelection", header: "vtkPassSelectedArrays.h".}
proc GetEdgeDataArraySelection*(this: var vtkPassSelectedArrays): ptr vtkDataArraySelection {.
    importcpp: "GetEdgeDataArraySelection", header: "vtkPassSelectedArrays.h".}
proc GetRowDataArraySelection*(this: var vtkPassSelectedArrays): ptr vtkDataArraySelection {.
    importcpp: "GetRowDataArraySelection", header: "vtkPassSelectedArrays.h".}