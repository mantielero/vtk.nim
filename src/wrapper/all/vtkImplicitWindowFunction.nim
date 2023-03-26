## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImplicitWindowFunction.h
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
##  @class   vtkImplicitWindowFunction
##  @brief   implicit function maps another implicit function to lie within a specified range
##
##  vtkImplicitWindowFunction is used to modify the output of another
##  implicit function to lie within a specified "window", or function
##  range. This can be used to add "thickness" to cutting or clipping
##  functions.
##
##  This class works as follows. First, it evaluates the function value of the
##  user-specified implicit function. Then, based on the window range specified,
##  it maps the function value into the window values specified.
##
##
##  @sa
##  vtkImplicitFunction
##

import
  vtkCommonDataModelModule, vtkImplicitFunction

type
  vtkImplicitWindowFunction* {.importcpp: "vtkImplicitWindowFunction",
                              header: "vtkImplicitWindowFunction.h", bycopy.} = object of vtkImplicitFunction
    vtkImplicitWindowFunction* {.importc: "vtkImplicitWindowFunction".}: VTK_NEWINSTANCE

  vtkImplicitWindowFunctionSuperclass* = vtkImplicitFunction

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImplicitWindowFunction::IsTypeOf(@)",
    header: "vtkImplicitWindowFunction.h".}
proc IsA*(this: var vtkImplicitWindowFunction; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImplicitWindowFunction.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImplicitWindowFunction {.
    importcpp: "vtkImplicitWindowFunction::SafeDownCast(@)",
    header: "vtkImplicitWindowFunction.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImplicitWindowFunction :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImplicitFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImplicitWindowFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImplicitWindowFunction :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImplicitWindowFunction; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImplicitWindowFunction.h".}
proc New*(): ptr vtkImplicitWindowFunction {.
    importcpp: "vtkImplicitWindowFunction::New(@)",
    header: "vtkImplicitWindowFunction.h".}
## using statement

proc EvaluateFunction*(this: var vtkImplicitWindowFunction; x: array[3, cdouble]): cdouble {.
    importcpp: "EvaluateFunction", header: "vtkImplicitWindowFunction.h".}
proc EvaluateGradient*(this: var vtkImplicitWindowFunction; x: array[3, cdouble];
                      n: array[3, cdouble]) {.importcpp: "EvaluateGradient",
    header: "vtkImplicitWindowFunction.h".}
proc SetImplicitFunction*(this: var vtkImplicitWindowFunction;
                         a2: ptr vtkImplicitFunction) {.
    importcpp: "SetImplicitFunction", header: "vtkImplicitWindowFunction.h".}
proc GetnameImplicitFunction*(this: var vtkImplicitWindowFunction): ptr vtkImplicitFunction {.
    importcpp: "GetnameImplicitFunction", header: "vtkImplicitWindowFunction.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify the range of function values which are considered to lie within
  ##  the window. WindowRange[0] is assumed to be less than WindowRange[1].
  ##
proc SetWindowRange*(this: var vtkImplicitWindowFunction; _arg1: cdouble;
                    _arg2: cdouble) {.importcpp: "SetWindowRange",
                                    header: "vtkImplicitWindowFunction.h".}
proc SetWindowRange*(this: var vtkImplicitWindowFunction; _arg: array[2, cdouble]) {.
    importcpp: "SetWindowRange", header: "vtkImplicitWindowFunction.h".}
## !!!Ignored construct:  virtual double * GetWindowRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << WindowRange  pointer  << this -> WindowRange ) ; return this -> WindowRange ; } VTK_WRAPEXCLUDE virtual void GetWindowRange ( double data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> WindowRange [ i ] ; } } ;
## Error: expected ';'!!!

proc SetWindowRangeWindowValues*(this: var vtkImplicitWindowFunction;
                                _arg1: cdouble; _arg2: cdouble) {.
    importcpp: "SetWindowRangeWindowValues", header: "vtkImplicitWindowFunction.h".}
proc SetWindowRangeWindowValues*(this: var vtkImplicitWindowFunction;
                                _arg: array[2, cdouble]) {.
    importcpp: "SetWindowRangeWindowValues", header: "vtkImplicitWindowFunction.h".}
## !!!Ignored construct:  virtual double * GetWindowRangeWindowValues ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << WindowValues  pointer  << this -> WindowValues ) ; return this -> WindowValues ; } VTK_WRAPEXCLUDE virtual void GetWindowRangeWindowValues ( double data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> WindowValues [ i ] ; } } ;
## Error: expected ';'!!!

proc GetMTime*(this: var vtkImplicitWindowFunction): vtkMTimeType {.
    importcpp: "GetMTime", header: "vtkImplicitWindowFunction.h".}
proc UsesGarbageCollector*(this: vtkImplicitWindowFunction): bool {.noSideEffect,
    importcpp: "UsesGarbageCollector", header: "vtkImplicitWindowFunction.h".}