## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRungeKutta4.h
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
##  @class   vtkRungeKutta4
##  @brief   Integrate an initial value problem using 4th
##  order Runge-Kutta method.
##
##
##  This is a concrete sub-class of vtkInitialValueProblemSolver.
##  It uses a 4th order Runge-Kutta method to obtain the values of
##  a set of functions at the next time step.
##
##  @sa
##  vtkInitialValueProblemSolver vtkRungeKutta45 vtkRungeKutta2 vtkFunctionSet
##

import
  vtkCommonMathModule, vtkInitialValueProblemSolver

type
  vtkRungeKutta4* {.importcpp: "vtkRungeKutta4", header: "vtkRungeKutta4.h", bycopy.} = object of vtkInitialValueProblemSolver
    vtkRungeKutta4* {.importc: "vtkRungeKutta4".}: VTK_NEWINSTANCE

  vtkRungeKutta4Superclass* = vtkInitialValueProblemSolver

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkRungeKutta4::IsTypeOf(@)", header: "vtkRungeKutta4.h".}
proc IsA*(this: var vtkRungeKutta4; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkRungeKutta4.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkRungeKutta4 {.
    importcpp: "vtkRungeKutta4::SafeDownCast(@)", header: "vtkRungeKutta4.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkRungeKutta4 :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInitialValueProblemSolver :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRungeKutta4 :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRungeKutta4 :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkRungeKutta4; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkRungeKutta4.h".}
proc New*(): ptr vtkRungeKutta4 {.importcpp: "vtkRungeKutta4::New(@)",
                              header: "vtkRungeKutta4.h".}
## using statement

proc ComputeNextStep*(this: var vtkRungeKutta4; xprev: ptr cdouble; xnext: ptr cdouble;
                     t: cdouble; delT: var cdouble; maxError: cdouble;
                     error: var cdouble; userData: pointer): cint {.
    importcpp: "ComputeNextStep", header: "vtkRungeKutta4.h".}
proc ComputeNextStep*(this: var vtkRungeKutta4; xprev: ptr cdouble;
                     dxprev: ptr cdouble; xnext: ptr cdouble; t: cdouble;
                     delT: var cdouble; maxError: cdouble; error: var cdouble;
                     userData: pointer): cint {.importcpp: "ComputeNextStep",
    header: "vtkRungeKutta4.h".}
proc ComputeNextStep*(this: var vtkRungeKutta4; xprev: ptr cdouble; xnext: ptr cdouble;
                     t: cdouble; delT: var cdouble; delTActual: var cdouble;
                     minStep: cdouble; maxStep: cdouble; maxError: cdouble;
                     error: var cdouble; userData: pointer): cint {.
    importcpp: "ComputeNextStep", header: "vtkRungeKutta4.h".}
proc ComputeNextStep*(this: var vtkRungeKutta4; xprev: ptr cdouble;
                     dxprev: ptr cdouble; xnext: ptr cdouble; t: cdouble;
                     delT: var cdouble; delTActual: var cdouble; minStep: cdouble;
                     maxStep: cdouble; maxError: cdouble; error: var cdouble;
                     userData: pointer): cint {.importcpp: "ComputeNextStep",
    header: "vtkRungeKutta4.h".}