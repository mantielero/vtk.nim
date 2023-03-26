## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAppendSelection.h
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
## ----------------------------------------------------------------------------
##  Copyright (c) Sandia Corporation
##  See Copyright.txt or http://www.paraview.org/HTML/Copyright.html for details.
## ----------------------------------------------------------------------------
## *
##  @class   vtkAppendSelection
##  @brief   appends one or more selections together
##
##  vtkAppendSelection is a filter that appends one of more selections into
##  a single selection.
##
##  If AppendByUnion is true, all selections must have the same content
##  type and they are combined together to form a single vtkSelection output.
##
##  If AppendByUnion is false, the output is a composite selection with
##  input selections as the children of the composite selection. This allows
##  for selections with different content types and properties.
##
##  If AppendByUnion is true, an Expression can be defined which uses the input
##  selection names to define the relation between the selections. If the Expression
##  is not defined, all the selection are combined using the '| 'boolean operator.
##
##  @warning It should be noted that this filter is not responsible for checking if
##  the field type is the same across all selections nodes of all selections.
##

import
  vtkFiltersCoreModule, vtkSelectionAlgorithm

discard "forward decl of vtkSelection"
type
  vtkAppendSelection* {.importcpp: "vtkAppendSelection",
                       header: "vtkAppendSelection.h", bycopy.} = object of vtkSelectionAlgorithm ##  hide the superclass' AddInput() from the user and the compiler
    vtkAppendSelection* {.importc: "vtkAppendSelection".}: VTK_NEWINSTANCE


proc New*(): ptr vtkAppendSelection {.importcpp: "vtkAppendSelection::New(@)",
                                  header: "vtkAppendSelection.h".}
type
  vtkAppendSelectionSuperclass* = vtkSelectionAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAppendSelection::IsTypeOf(@)", header: "vtkAppendSelection.h".}
proc IsA*(this: var vtkAppendSelection; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkAppendSelection.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAppendSelection {.
    importcpp: "vtkAppendSelection::SafeDownCast(@)",
    header: "vtkAppendSelection.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAppendSelection :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkSelectionAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAppendSelection :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAppendSelection :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAppendSelection; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkAppendSelection.h".}
proc SetExpression*(this: var vtkAppendSelection; arg: cstring) {.
    importcpp: "SetExpression", header: "vtkAppendSelection.h".}
proc GetExpression*(this: var vtkAppendSelection): cstring {.
    importcpp: "GetExpression", header: "vtkAppendSelection.h".}
  ## /@}
  ## /@{
  ## *
  ##  Determines whether the selection describes what to include or exclude.
  ##
  ##  The default is false, meaning include.
  ##
  ##  NOTE: If you want to use Inverse, AppendByUnion MUST be set to false.
  ##  If Expression is set, then the inverse flag inverses it (internally) without modifying it.
  ##
proc SetInverse*(this: var vtkAppendSelection; _arg: bool) {.importcpp: "SetInverse",
    header: "vtkAppendSelection.h".}
proc InverseOn*(this: var vtkAppendSelection) {.importcpp: "InverseOn",
    header: "vtkAppendSelection.h".}
proc InverseOff*(this: var vtkAppendSelection) {.importcpp: "InverseOff",
    header: "vtkAppendSelection.h".}
## !!!Ignored construct:  virtual bool GetInverse ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Inverse  of  << this -> Inverse ) ; return this -> Inverse ; } ;
## Error: expected ';'!!!

proc SetInputName*(this: var vtkAppendSelection; index: cint; name: cstring) {.
    importcpp: "SetInputName", header: "vtkAppendSelection.h".}
proc GetInputName*(this: vtkAppendSelection; index: cint): cstring {.noSideEffect,
    importcpp: "GetInputName", header: "vtkAppendSelection.h".}
proc RemoveAllInputNames*(this: var vtkAppendSelection) {.
    importcpp: "RemoveAllInputNames", header: "vtkAppendSelection.h".}
proc SetInverseUserManagedInputs*(this: var vtkAppendSelection; _arg: vtkTypeBool) {.
    importcpp: "SetInverseUserManagedInputs", header: "vtkAppendSelection.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetInverseUserManagedInputs ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UserManagedInputs  of  << this -> UserManagedInputs ) ; return this -> UserManagedInputs ; } ;
## Error: expected ';'!!!

proc UserManagedInputsOn*(this: var vtkAppendSelection) {.
    importcpp: "UserManagedInputsOn", header: "vtkAppendSelection.h".}
proc UserManagedInputsOff*(this: var vtkAppendSelection) {.
    importcpp: "UserManagedInputsOff", header: "vtkAppendSelection.h".}
  ## /@}
  ## *
  ##  Add a dataset to the list of data to append. Should not be
  ##  used when UserManagedInputs is true, use SetInputByNumber instead.
  ##
proc AddInputData*(this: var vtkAppendSelection; a2: ptr vtkSelection) {.
    importcpp: "AddInputData", header: "vtkAppendSelection.h".}
proc RemoveInputData*(this: var vtkAppendSelection; a2: ptr vtkSelection) {.
    importcpp: "RemoveInputData", header: "vtkAppendSelection.h".}
proc GetInput*(this: var vtkAppendSelection; idx: cint): ptr vtkSelection {.
    importcpp: "GetInput", header: "vtkAppendSelection.h".}
proc GetInput*(this: var vtkAppendSelection): ptr vtkSelection {.
    importcpp: "GetInput", header: "vtkAppendSelection.h".}
proc SetNumberOfInputs*(this: var vtkAppendSelection; num: cint) {.
    importcpp: "SetNumberOfInputs", header: "vtkAppendSelection.h".}
proc SetInputConnectionByNumber*(this: var vtkAppendSelection; num: cint;
                                input: ptr vtkAlgorithmOutput) {.
    importcpp: "SetInputConnectionByNumber", header: "vtkAppendSelection.h".}
proc SetInverseUserManagedInputsAppendByUnion*(this: var vtkAppendSelection;
    _arg: vtkTypeBool) {.importcpp: "SetInverseUserManagedInputsAppendByUnion",
                       header: "vtkAppendSelection.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetInverseUserManagedInputsAppendByUnion ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AppendByUnion  of  << this -> AppendByUnion ) ; return this -> AppendByUnion ; } ;
## Error: expected ';'!!!

proc AppendByUnionOn*(this: var vtkAppendSelection) {.importcpp: "AppendByUnionOn",
    header: "vtkAppendSelection.h".}
proc AppendByUnionOff*(this: var vtkAppendSelection) {.
    importcpp: "AppendByUnionOff", header: "vtkAppendSelection.h".}
  ## /@}