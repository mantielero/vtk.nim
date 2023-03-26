## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPiecewiseFunctionShiftScale.h
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
##  @class   vtkPiecewiseFunctionShiftScale
##
##
##

import
  vtkCommonExecutionModelModule, vtkPiecewiseFunctionAlgorithm

discard "forward decl of vtkPiecewiseFunction"
type
  vtkPiecewiseFunctionShiftScale* {.importcpp: "vtkPiecewiseFunctionShiftScale",
                                   header: "vtkPiecewiseFunctionShiftScale.h",
                                   bycopy.} = object of vtkPiecewiseFunctionAlgorithm
    vtkPiecewiseFunctionShiftScale* {.importc: "vtkPiecewiseFunctionShiftScale".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPiecewiseFunctionShiftScale {.
    importcpp: "vtkPiecewiseFunctionShiftScale::New(@)",
    header: "vtkPiecewiseFunctionShiftScale.h".}
type
  vtkPiecewiseFunctionShiftScaleSuperclass* = vtkPiecewiseFunctionAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPiecewiseFunctionShiftScale::IsTypeOf(@)",
    header: "vtkPiecewiseFunctionShiftScale.h".}
proc IsA*(this: var vtkPiecewiseFunctionShiftScale; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPiecewiseFunctionShiftScale.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPiecewiseFunctionShiftScale {.
    importcpp: "vtkPiecewiseFunctionShiftScale::SafeDownCast(@)",
    header: "vtkPiecewiseFunctionShiftScale.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPiecewiseFunctionShiftScale :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPiecewiseFunctionAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPiecewiseFunctionShiftScale :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPiecewiseFunctionShiftScale :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPiecewiseFunctionShiftScale; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkPiecewiseFunctionShiftScale.h".}
proc SetPositionShift*(this: var vtkPiecewiseFunctionShiftScale; _arg: cdouble) {.
    importcpp: "SetPositionShift", header: "vtkPiecewiseFunctionShiftScale.h".}
proc SetPositionShiftPositionScale*(this: var vtkPiecewiseFunctionShiftScale;
                                   _arg: cdouble) {.
    importcpp: "SetPositionShiftPositionScale",
    header: "vtkPiecewiseFunctionShiftScale.h".}
proc SetPositionShiftPositionScaleValueShift*(
    this: var vtkPiecewiseFunctionShiftScale; _arg: cdouble) {.
    importcpp: "SetPositionShiftPositionScaleValueShift",
    header: "vtkPiecewiseFunctionShiftScale.h".}
proc SetPositionShiftPositionScaleValueShiftValueScale*(
    this: var vtkPiecewiseFunctionShiftScale; _arg: cdouble) {.
    importcpp: "SetPositionShiftPositionScaleValueShiftValueScale",
    header: "vtkPiecewiseFunctionShiftScale.h".}
## !!!Ignored construct:  virtual double GetPositionShift ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PositionShift  of  << this -> PositionShift ) ; return this -> PositionShift ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual double GetPositionShiftPositionScale ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PositionScale  of  << this -> PositionScale ) ; return this -> PositionScale ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual double GetPositionShiftPositionScaleValueShift ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ValueShift  of  << this -> ValueShift ) ; return this -> ValueShift ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual double GetPositionShiftPositionScaleValueShiftValueScale ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ValueScale  of  << this -> ValueScale ) ; return this -> ValueScale ; } ;
## Error: expected ';'!!!
