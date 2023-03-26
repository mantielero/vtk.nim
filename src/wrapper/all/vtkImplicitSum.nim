## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImplicitSum.h
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
##  @class   vtkImplicitSum
##  @brief   implicit sum of other implicit functions
##
##  vtkImplicitSum produces a linear combination of other implicit functions.
##  The contribution of each function is weighted by a scalar coefficient.
##  The NormalizeByWeight option normalizes the output so that the
##  scalar weights add up to 1. Note that this function gives accurate
##  sums and gradients only if the input functions are linear.
##

import
  vtkCommonDataModelModule, vtkImplicitFunction

discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkImplicitFunctionCollection"
type
  vtkImplicitSum* {.importcpp: "vtkImplicitSum", header: "vtkImplicitSum.h", bycopy.} = object of vtkImplicitFunction
    vtkImplicitSum* {.importc: "vtkImplicitSum".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImplicitSum {.importcpp: "vtkImplicitSum::New(@)",
                              header: "vtkImplicitSum.h".}
type
  vtkImplicitSumSuperclass* = vtkImplicitFunction

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImplicitSum::IsTypeOf(@)", header: "vtkImplicitSum.h".}
proc IsA*(this: var vtkImplicitSum; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkImplicitSum.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImplicitSum {.
    importcpp: "vtkImplicitSum::SafeDownCast(@)", header: "vtkImplicitSum.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImplicitSum :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImplicitFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImplicitSum :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImplicitSum :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImplicitSum; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImplicitSum.h".}
## using statement

proc EvaluateFunction*(this: var vtkImplicitSum; x: array[3, cdouble]): cdouble {.
    importcpp: "EvaluateFunction", header: "vtkImplicitSum.h".}
proc EvaluateGradient*(this: var vtkImplicitSum; x: array[3, cdouble];
                      g: array[3, cdouble]) {.importcpp: "EvaluateGradient",
    header: "vtkImplicitSum.h".}
proc GetMTime*(this: var vtkImplicitSum): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkImplicitSum.h".}
proc AddFunction*(this: var vtkImplicitSum; `in`: ptr vtkImplicitFunction;
                 weight: cdouble) {.importcpp: "AddFunction",
                                  header: "vtkImplicitSum.h".}
proc AddFunction*(this: var vtkImplicitSum; `in`: ptr vtkImplicitFunction) {.
    importcpp: "AddFunction", header: "vtkImplicitSum.h".}
proc RemoveAllFunctions*(this: var vtkImplicitSum) {.
    importcpp: "RemoveAllFunctions", header: "vtkImplicitSum.h".}
proc SetFunctionWeight*(this: var vtkImplicitSum; f: ptr vtkImplicitFunction;
                       weight: cdouble) {.importcpp: "SetFunctionWeight",
                                        header: "vtkImplicitSum.h".}
proc SetNormalizeByWeight*(this: var vtkImplicitSum; _arg: vtkTypeBool) {.
    importcpp: "SetNormalizeByWeight", header: "vtkImplicitSum.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetNormalizeByWeight ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NormalizeByWeight  of  << this -> NormalizeByWeight ) ; return this -> NormalizeByWeight ; } ;
## Error: expected ';'!!!

proc NormalizeByWeightOn*(this: var vtkImplicitSum) {.
    importcpp: "NormalizeByWeightOn", header: "vtkImplicitSum.h".}
proc NormalizeByWeightOff*(this: var vtkImplicitSum) {.
    importcpp: "NormalizeByWeightOff", header: "vtkImplicitSum.h".}
  ## /@}