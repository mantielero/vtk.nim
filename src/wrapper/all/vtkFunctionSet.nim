## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFunctionSet.h
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
##  @class   vtkFunctionSet
##  @brief   Abstract interface for sets of functions
##
##  vtkFunctionSet specifies an abstract interface for set of functions
##  of the form F_i = F_i(x_j) where F (with i=1..m) are the functions
##  and x (with j=1..n) are the independent variables.
##  The only supported operation is the function evaluation at x_j.
##
##  @sa
##  vtkImplicitDataSet vtkCompositeInterpolatedVelocityField vtkAMRInterpolatedVelocityField
##  vtkInitialValueProblemSolver
##

import
  vtkCommonMathModule, vtkObject

type
  vtkFunctionSet* {.importcpp: "vtkFunctionSet", header: "vtkFunctionSet.h", bycopy.} = object of vtkObject
    vtkFunctionSet* {.importc: "vtkFunctionSet".}: VTK_NEWINSTANCE

  vtkFunctionSetSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkFunctionSet::IsTypeOf(@)", header: "vtkFunctionSet.h".}
proc IsA*(this: var vtkFunctionSet; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkFunctionSet.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkFunctionSet {.
    importcpp: "vtkFunctionSet::SafeDownCast(@)", header: "vtkFunctionSet.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkFunctionSet :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFunctionSet :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFunctionSet :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkFunctionSet; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkFunctionSet.h".}
proc FunctionValues*(this: var vtkFunctionSet; x: ptr cdouble; f: ptr cdouble): cint {.
    importcpp: "FunctionValues", header: "vtkFunctionSet.h".}
proc FunctionValues*(this: var vtkFunctionSet; x: ptr cdouble; f: ptr cdouble;
                    vtkNotUsed: proc (a1: userData): pointer): cint {.
    importcpp: "FunctionValues", header: "vtkFunctionSet.h".}
proc GetNumberOfFunctions*(this: var vtkFunctionSet): cint {.
    importcpp: "GetNumberOfFunctions", header: "vtkFunctionSet.h".}
proc GetNumberOfIndependentVariables*(this: var vtkFunctionSet): cint {.
    importcpp: "GetNumberOfIndependentVariables", header: "vtkFunctionSet.h".}