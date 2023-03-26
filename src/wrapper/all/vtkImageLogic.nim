## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageLogic.h
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
##  @class   vtkImageLogic
##  @brief   And, or, xor, nand, nor, not.
##
##  vtkImageLogic implements basic logic operations.
##  SetOperation is used to select the filter's behavior.
##  The filter can take two or one input. Inputs must have the same type.
##

##  Operation options.

const
  VTK_AND* = 0
  VTK_OR* = 1
  VTK_XOR* = 2
  VTK_NAND* = 3
  VTK_NOR* = 4
  VTK_NOT* = 5
  VTK_NOP* = 6

import
  vtkImagingMathModule, vtkThreadedImageAlgorithm

type
  vtkImageLogic* {.importcpp: "vtkImageLogic", header: "vtkImageLogic.h", bycopy.} = object of vtkThreadedImageAlgorithm
    vtkImageLogic* {.importc: "vtkImageLogic".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageLogic {.importcpp: "vtkImageLogic::New(@)",
                             header: "vtkImageLogic.h".}
type
  vtkImageLogicSuperclass* = vtkThreadedImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageLogic::IsTypeOf(@)", header: "vtkImageLogic.h".}
proc IsA*(this: var vtkImageLogic; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkImageLogic.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageLogic {.
    importcpp: "vtkImageLogic::SafeDownCast(@)", header: "vtkImageLogic.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageLogic :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkThreadedImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageLogic :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageLogic :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageLogic; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageLogic.h".}
proc SetOperation*(this: var vtkImageLogic; _arg: cint) {.importcpp: "SetOperation",
    header: "vtkImageLogic.h".}
## !!!Ignored construct:  virtual int GetOperation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Operation  of  << this -> Operation ) ; return this -> Operation ; } ;
## Error: expected ';'!!!

proc SetOperationToAnd*(this: var vtkImageLogic) {.importcpp: "SetOperationToAnd",
    header: "vtkImageLogic.h".}
proc SetOperationToOr*(this: var vtkImageLogic) {.importcpp: "SetOperationToOr",
    header: "vtkImageLogic.h".}
proc SetOperationToXor*(this: var vtkImageLogic) {.importcpp: "SetOperationToXor",
    header: "vtkImageLogic.h".}
proc SetOperationToNand*(this: var vtkImageLogic) {.importcpp: "SetOperationToNand",
    header: "vtkImageLogic.h".}
proc SetOperationToNor*(this: var vtkImageLogic) {.importcpp: "SetOperationToNor",
    header: "vtkImageLogic.h".}
proc SetOperationToNot*(this: var vtkImageLogic) {.importcpp: "SetOperationToNot",
    header: "vtkImageLogic.h".}
proc SetOperationOutputTrueValue*(this: var vtkImageLogic; _arg: cdouble) {.
    importcpp: "SetOperationOutputTrueValue", header: "vtkImageLogic.h".}
## !!!Ignored construct:  virtual double GetOperationOutputTrueValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputTrueValue  of  << this -> OutputTrueValue ) ; return this -> OutputTrueValue ; } ;
## Error: expected ';'!!!

proc SetInput1Data*(this: var vtkImageLogic; input: ptr vtkDataObject) {.
    importcpp: "SetInput1Data", header: "vtkImageLogic.h".}
proc SetInput2Data*(this: var vtkImageLogic; input: ptr vtkDataObject) {.
    importcpp: "SetInput2Data", header: "vtkImageLogic.h".}