## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRungeKutta2.h
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
##  @class   vtkRungeKutta2
##  @brief   Integrate an initial value problem using 2nd
##  order Runge-Kutta method.
##
##
##  This is a concrete sub-class of vtkInitialValueProblemSolver.
##  It uses a 2nd order Runge-Kutta method to obtain the values of
##  a set of functions at the next time step.
##
##  @sa
##  vtkInitialValueProblemSolver vtkRungeKutta4 vtkRungeKutta45 vtkFunctionSet
##

## !!!Ignored construct:  # vtkRungeKutta2_h [NewLine] # vtkRungeKutta2_h [NewLine] # vtkCommonMathModule.h  For export macro # vtkInitialValueProblemSolver.h [NewLine] class VTKCOMMONMATH_EXPORT vtkRungeKutta2 : public vtkInitialValueProblemSolver { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkInitialValueProblemSolver Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkInitialValueProblemSolver :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkRungeKutta2 :: IsTypeOf ( type ) ; } static vtkRungeKutta2 * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkRungeKutta2 * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkRungeKutta2 * NewInstance ( ) const { return vtkRungeKutta2 :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInitialValueProblemSolver :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRungeKutta2 :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRungeKutta2 :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct a vtkRungeKutta2 with no initial FunctionSet.
##  static vtkRungeKutta2 * New ( ) ; using Superclass :: ComputeNextStep ; /@{ *
##  Given initial values, xprev , initial time, t and a requested time
##  interval, delT calculate values of x at t+delT (xnext).
##  delTActual is always equal to delT.
##  Since this class can not provide an estimate for the error error
##  is set to 0.
##  maxStep, minStep and maxError are unused.
##  This method returns an error code representing the nature of
##  the failure:
##  OutOfDomain = 1,
##  NotInitialized = 2,
##  UnexpectedValue = 3
##  int ComputeNextStep ( double * xprev , double * xnext , double t , double & delT , double maxError , double & error , void * userData ) override { double minStep = delT ; double maxStep = delT ; double delTActual ; return this -> ComputeNextStep ( xprev , nullptr , xnext , t , delT , delTActual , minStep , maxStep , maxError , error , userData ) ; } int ComputeNextStep ( double * xprev , double * dxprev , double * xnext , double t , double & delT , double maxError , double & error , void * userData ) override { double minStep = delT ; double maxStep = delT ; double delTActual ; return this -> ComputeNextStep ( xprev , dxprev , xnext , t , delT , delTActual , minStep , maxStep , maxError , error , userData ) ; } int ComputeNextStep ( double * xprev , double * xnext , double t , double & delT , double & delTActual , double minStep , double maxStep , double maxError , double & error , void * userData ) override { return this -> ComputeNextStep ( xprev , nullptr , xnext , t , delT , delTActual , minStep , maxStep , maxError , error , userData ) ; } int ComputeNextStep ( double * xprev , double * dxprev , double * xnext , double t , double & delT , double & delTActual , double minStep , double maxStep , double maxError , double & error , void * userData ) override ; /@} protected : vtkRungeKutta2 ( ) ; ~ vtkRungeKutta2 ( ) override ; private : vtkRungeKutta2 ( const vtkRungeKutta2 & ) = delete ; void operator = ( const vtkRungeKutta2 & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
