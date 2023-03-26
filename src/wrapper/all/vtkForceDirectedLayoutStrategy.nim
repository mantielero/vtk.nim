## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkForceDirectedLayoutStrategy.h
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
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkForceDirectedLayoutStrategy
##  @brief   a force directed graph layout algorithm
##
##
##  Lays out a graph in 2D or 3D using a force-directed algorithm.
##  The user may specify whether to layout the graph randomly initially,
##  the bounds, the number of dimensions (2 or 3), and the cool-down rate.
##
##  @par Thanks:
##  Thanks to Brian Wylie for adding functionality for allowing this layout
##  to be incremental.
##

import
  vtkGraphLayoutStrategy, vtkInfovisLayoutModule

type
  vtkForceDirectedLayoutStrategy* {.importcpp: "vtkForceDirectedLayoutStrategy",
                                   header: "vtkForceDirectedLayoutStrategy.h",
                                   bycopy.} = object of vtkGraphLayoutStrategy ##  A vertex contains a position and a displacement.
    vtkForceDirectedLayoutStrategy* {.importc: "vtkForceDirectedLayoutStrategy".}: VTK_NEWINSTANCE
    ##  Boolean controls automatic bounds calc.
    ##  Maximum number of iterations.
    ##  Cool-down rate.  Note:  Higher # = Slower rate.
    ##  Boolean for a third dimension.
    ##  Boolean for having random points


proc New*(): ptr vtkForceDirectedLayoutStrategy {.
    importcpp: "vtkForceDirectedLayoutStrategy::New(@)",
    header: "vtkForceDirectedLayoutStrategy.h".}
type
  vtkForceDirectedLayoutStrategySuperclass* = vtkGraphLayoutStrategy

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkForceDirectedLayoutStrategy::IsTypeOf(@)",
    header: "vtkForceDirectedLayoutStrategy.h".}
proc IsA*(this: var vtkForceDirectedLayoutStrategy; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkForceDirectedLayoutStrategy.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkForceDirectedLayoutStrategy {.
    importcpp: "vtkForceDirectedLayoutStrategy::SafeDownCast(@)",
    header: "vtkForceDirectedLayoutStrategy.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkForceDirectedLayoutStrategy :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGraphLayoutStrategy :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkForceDirectedLayoutStrategy :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkForceDirectedLayoutStrategy :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkForceDirectedLayoutStrategy; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkForceDirectedLayoutStrategy.h".}
proc SetRandomSeed*(this: var vtkForceDirectedLayoutStrategy; _arg: cint) {.
    importcpp: "SetRandomSeed", header: "vtkForceDirectedLayoutStrategy.h".}
proc GetRandomSeedMinValue*(this: var vtkForceDirectedLayoutStrategy): cint {.
    importcpp: "GetRandomSeedMinValue", header: "vtkForceDirectedLayoutStrategy.h".}
proc GetRandomSeedMaxValue*(this: var vtkForceDirectedLayoutStrategy): cint {.
    importcpp: "GetRandomSeedMaxValue", header: "vtkForceDirectedLayoutStrategy.h".}
## !!!Ignored construct:  virtual int GetRandomSeed ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RandomSeed  of  << this -> RandomSeed ) ; return this -> RandomSeed ; } ;
## Error: expected ';'!!!

proc SetGraphBounds*(this: var vtkForceDirectedLayoutStrategy; _arg1: cdouble;
                    _arg2: cdouble; _arg3: cdouble; _arg4: cdouble; _arg5: cdouble;
                    _arg6: cdouble) {.importcpp: "SetGraphBounds",
                                    header: "vtkForceDirectedLayoutStrategy.h".}
proc SetGraphBounds*(this: var vtkForceDirectedLayoutStrategy;
                    _arg: array[6, cdouble]) {.importcpp: "SetGraphBounds",
    header: "vtkForceDirectedLayoutStrategy.h".}
## !!!Ignored construct:  virtual double * GetGraphBounds ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << GraphBounds  pointer  << this -> GraphBounds ) ; return this -> GraphBounds ; } VTK_WRAPEXCLUDE virtual void GetGraphBounds ( double data [ 6 ] ) { for ( int i = 0 ; i < 6 ; i ++ ) { data [ i ] = this -> GraphBounds [ i ] ; } } ;
## Error: expected ';'!!!

proc SetAutomaticBoundsComputation*(this: var vtkForceDirectedLayoutStrategy;
                                   _arg: vtkTypeBool) {.
    importcpp: "SetAutomaticBoundsComputation",
    header: "vtkForceDirectedLayoutStrategy.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetRandomSeedAutomaticBoundsComputation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AutomaticBoundsComputation  of  << this -> AutomaticBoundsComputation ) ; return this -> AutomaticBoundsComputation ; } ;
## Error: expected ';'!!!

proc AutomaticBoundsComputationOn*(this: var vtkForceDirectedLayoutStrategy) {.
    importcpp: "AutomaticBoundsComputationOn",
    header: "vtkForceDirectedLayoutStrategy.h".}
proc AutomaticBoundsComputationOff*(this: var vtkForceDirectedLayoutStrategy) {.
    importcpp: "AutomaticBoundsComputationOff",
    header: "vtkForceDirectedLayoutStrategy.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the maximum number of iterations to be used.
  ##  The higher this number, the more iterations through the algorithm
  ##  is possible, and thus, the more the graph gets modified.
  ##  The default is '50' for no particular reason
  ##
proc SetRandomSeedMaxNumberOfIterations*(this: var vtkForceDirectedLayoutStrategy;
                                        _arg: cint) {.
    importcpp: "SetRandomSeedMaxNumberOfIterations",
    header: "vtkForceDirectedLayoutStrategy.h".}
proc GetRandomSeedMinValueMaxNumberOfIterationsMinValue*(
    this: var vtkForceDirectedLayoutStrategy): cint {.
    importcpp: "GetRandomSeedMinValueMaxNumberOfIterationsMinValue",
    header: "vtkForceDirectedLayoutStrategy.h".}
proc GetRandomSeedMaxValueMaxNumberOfIterationsMaxValue*(
    this: var vtkForceDirectedLayoutStrategy): cint {.
    importcpp: "GetRandomSeedMaxValueMaxNumberOfIterationsMaxValue",
    header: "vtkForceDirectedLayoutStrategy.h".}
## !!!Ignored construct:  virtual int GetRandomSeedAutomaticBoundsComputationMaxNumberOfIterations ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaxNumberOfIterations  of  << this -> MaxNumberOfIterations ) ; return this -> MaxNumberOfIterations ; } ;
## Error: expected ';'!!!

proc SetRandomSeedMaxNumberOfIterationsIterationsPerLayout*(
    this: var vtkForceDirectedLayoutStrategy; _arg: cint) {.
    importcpp: "SetRandomSeedMaxNumberOfIterationsIterationsPerLayout",
    header: "vtkForceDirectedLayoutStrategy.h".}
proc GetRandomSeedMinValueMaxNumberOfIterationsMinValueIterationsPerLayoutMinValue*(
    this: var vtkForceDirectedLayoutStrategy): cint {.importcpp: "GetRandomSeedMinValueMaxNumberOfIterationsMinValueIterationsPerLayoutMinValue",
    header: "vtkForceDirectedLayoutStrategy.h".}
proc GetRandomSeedMaxValueMaxNumberOfIterationsMaxValueIterationsPerLayoutMaxValue*(
    this: var vtkForceDirectedLayoutStrategy): cint {.importcpp: "GetRandomSeedMaxValueMaxNumberOfIterationsMaxValueIterationsPerLayoutMaxValue",
    header: "vtkForceDirectedLayoutStrategy.h".}
## !!!Ignored construct:  virtual int GetRandomSeedAutomaticBoundsComputationMaxNumberOfIterationsIterationsPerLayout ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IterationsPerLayout  of  << this -> IterationsPerLayout ) ; return this -> IterationsPerLayout ; } ;
## Error: expected ';'!!!

proc SetRandomSeedMaxNumberOfIterationsIterationsPerLayoutCoolDownRate*(
    this: var vtkForceDirectedLayoutStrategy; _arg: cdouble) {.importcpp: "SetRandomSeedMaxNumberOfIterationsIterationsPerLayoutCoolDownRate",
    header: "vtkForceDirectedLayoutStrategy.h".}
proc GetRandomSeedMinValueMaxNumberOfIterationsMinValueIterationsPerLayoutMinValueCoolDownRateMinValue*(
    this: var vtkForceDirectedLayoutStrategy): cdouble {.importcpp: "GetRandomSeedMinValueMaxNumberOfIterationsMinValueIterationsPerLayoutMinValueCoolDownRateMinValue",
    header: "vtkForceDirectedLayoutStrategy.h".}
proc GetRandomSeedMaxValueMaxNumberOfIterationsMaxValueIterationsPerLayoutMaxValueCoolDownRateMaxValue*(
    this: var vtkForceDirectedLayoutStrategy): cdouble {.importcpp: "GetRandomSeedMaxValueMaxNumberOfIterationsMaxValueIterationsPerLayoutMaxValueCoolDownRateMaxValue",
    header: "vtkForceDirectedLayoutStrategy.h".}
## !!!Ignored construct:  virtual double GetRandomSeedAutomaticBoundsComputationMaxNumberOfIterationsIterationsPerLayoutCoolDownRate ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CoolDownRate  of  << this -> CoolDownRate ) ; return this -> CoolDownRate ; } ;
## Error: expected ';'!!!

proc SetAutomaticBoundsComputationThreeDimensionalLayout*(
    this: var vtkForceDirectedLayoutStrategy; _arg: vtkTypeBool) {.
    importcpp: "SetAutomaticBoundsComputationThreeDimensionalLayout",
    header: "vtkForceDirectedLayoutStrategy.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetRandomSeedAutomaticBoundsComputationMaxNumberOfIterationsIterationsPerLayoutCoolDownRateThreeDimensionalLayout ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ThreeDimensionalLayout  of  << this -> ThreeDimensionalLayout ) ; return this -> ThreeDimensionalLayout ; } ;
## Error: expected ';'!!!

proc ThreeDimensionalLayoutOn*(this: var vtkForceDirectedLayoutStrategy) {.
    importcpp: "ThreeDimensionalLayoutOn",
    header: "vtkForceDirectedLayoutStrategy.h".}
proc ThreeDimensionalLayoutOff*(this: var vtkForceDirectedLayoutStrategy) {.
    importcpp: "ThreeDimensionalLayoutOff",
    header: "vtkForceDirectedLayoutStrategy.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off use of random positions within the graph bounds as initial points.
  ##
proc SetAutomaticBoundsComputationThreeDimensionalLayoutRandomInitialPoints*(
    this: var vtkForceDirectedLayoutStrategy; _arg: vtkTypeBool) {.importcpp: "SetAutomaticBoundsComputationThreeDimensionalLayoutRandomInitialPoints",
    header: "vtkForceDirectedLayoutStrategy.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetRandomSeedAutomaticBoundsComputationMaxNumberOfIterationsIterationsPerLayoutCoolDownRateThreeDimensionalLayoutRandomInitialPoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RandomInitialPoints  of  << this -> RandomInitialPoints ) ; return this -> RandomInitialPoints ; } ;
## Error: expected ';'!!!

proc RandomInitialPointsOn*(this: var vtkForceDirectedLayoutStrategy) {.
    importcpp: "RandomInitialPointsOn", header: "vtkForceDirectedLayoutStrategy.h".}
proc RandomInitialPointsOff*(this: var vtkForceDirectedLayoutStrategy) {.
    importcpp: "RandomInitialPointsOff",
    header: "vtkForceDirectedLayoutStrategy.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set the initial temperature.  If zero (the default) , the initial temperature
  ##  will be computed automatically.
  ##
proc SetRandomSeedMaxNumberOfIterationsIterationsPerLayoutCoolDownRateInitialTemperature*(
    this: var vtkForceDirectedLayoutStrategy; _arg: cfloat) {.importcpp: "SetRandomSeedMaxNumberOfIterationsIterationsPerLayoutCoolDownRateInitialTemperature",
    header: "vtkForceDirectedLayoutStrategy.h".}
proc GetRandomSeedMinValueMaxNumberOfIterationsMinValueIterationsPerLayoutMinValueCoolDownRateMinValueInitialTemperatureMinValue*(
    this: var vtkForceDirectedLayoutStrategy): cfloat {.importcpp: "GetRandomSeedMinValueMaxNumberOfIterationsMinValueIterationsPerLayoutMinValueCoolDownRateMinValueInitialTemperatureMinValue",
    header: "vtkForceDirectedLayoutStrategy.h".}
proc GetRandomSeedMaxValueMaxNumberOfIterationsMaxValueIterationsPerLayoutMaxValueCoolDownRateMaxValueInitialTemperatureMaxValue*(
    this: var vtkForceDirectedLayoutStrategy): cfloat {.importcpp: "GetRandomSeedMaxValueMaxNumberOfIterationsMaxValueIterationsPerLayoutMaxValueCoolDownRateMaxValueInitialTemperatureMaxValue",
    header: "vtkForceDirectedLayoutStrategy.h".}
## !!!Ignored construct:  virtual float GetRandomSeedAutomaticBoundsComputationMaxNumberOfIterationsIterationsPerLayoutCoolDownRateThreeDimensionalLayoutRandomInitialPointsInitialTemperature ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InitialTemperature  of  << this -> InitialTemperature ) ; return this -> InitialTemperature ; } ;
## Error: expected ';'!!!

proc Initialize*(this: var vtkForceDirectedLayoutStrategy) {.
    importcpp: "Initialize", header: "vtkForceDirectedLayoutStrategy.h".}
proc Layout*(this: var vtkForceDirectedLayoutStrategy) {.importcpp: "Layout",
    header: "vtkForceDirectedLayoutStrategy.h".}
proc IsLayoutComplete*(this: var vtkForceDirectedLayoutStrategy): cint {.
    importcpp: "IsLayoutComplete", header: "vtkForceDirectedLayoutStrategy.h".}
type
  vtkLayoutVertex* = vtkForceDirectedLayoutStrategyvtkLayoutVertex_t
  vtkLayoutEdge* = vtkForceDirectedLayoutStrategyvtkLayoutEdge_t
