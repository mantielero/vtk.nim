## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAttributeClustering2DLayoutStrategy.h
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
##  @class   vtkAttributeClustering2DLayoutStrategy
##  @brief   a simple fast 2D graph layout
##
##
##  This class is a density grid based force directed layout strategy.
##  Also please note that 'fast' is relative to quite slow. :)
##  The layout running time is O(V+E) with an extremely high constant.
##  @par Thanks:
##  Thanks to Godzilla for not eating my computer so that this class
##  could be written.
##

import
  vtkGraphLayoutStrategy, vtkInfovisLayoutModule, vtkSmartPointer

discard "forward decl of vtkFastSplatter"
discard "forward decl of vtkImageData"
discard "forward decl of vtkIntArray"
discard "forward decl of vtkFloatArray"
type
  vtkAttributeClustering2DLayoutStrategy* {.
      importcpp: "vtkAttributeClustering2DLayoutStrategy",
      header: "vtkAttributeClustering2DLayoutStrategy.h", bycopy.} = object of vtkGraphLayoutStrategy ##  This class 'has a' vtkFastSplatter for the density grid
    vtkAttributeClustering2DLayoutStrategy*
        {.importc: "vtkAttributeClustering2DLayoutStrategy".}: VTK_NEWINSTANCE
    ##  Maximum number of iterations.
    ##  Cool-down rate.  Note:  Higher # = Slower rate.
    ##  Private helper methods


proc New*(): ptr vtkAttributeClustering2DLayoutStrategy {.
    importcpp: "vtkAttributeClustering2DLayoutStrategy::New(@)",
    header: "vtkAttributeClustering2DLayoutStrategy.h".}
type
  vtkAttributeClustering2DLayoutStrategySuperclass* = vtkGraphLayoutStrategy

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAttributeClustering2DLayoutStrategy::IsTypeOf(@)",
    header: "vtkAttributeClustering2DLayoutStrategy.h".}
proc IsA*(this: var vtkAttributeClustering2DLayoutStrategy; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkAttributeClustering2DLayoutStrategy.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAttributeClustering2DLayoutStrategy {.
    importcpp: "vtkAttributeClustering2DLayoutStrategy::SafeDownCast(@)",
    header: "vtkAttributeClustering2DLayoutStrategy.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAttributeClustering2DLayoutStrategy :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGraphLayoutStrategy :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAttributeClustering2DLayoutStrategy :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAttributeClustering2DLayoutStrategy :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAttributeClustering2DLayoutStrategy; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf", header: "vtkAttributeClustering2DLayoutStrategy.h".}
proc GetVertexAttribute*(this: var vtkAttributeClustering2DLayoutStrategy): cstring {.
    importcpp: "GetVertexAttribute",
    header: "vtkAttributeClustering2DLayoutStrategy.h".}
proc SetVertexAttribute*(this: var vtkAttributeClustering2DLayoutStrategy;
                        a2: cstring) {.importcpp: "SetVertexAttribute", header: "vtkAttributeClustering2DLayoutStrategy.h".}
proc SetRandomSeed*(this: var vtkAttributeClustering2DLayoutStrategy; _arg: cint) {.
    importcpp: "SetRandomSeed", header: "vtkAttributeClustering2DLayoutStrategy.h".}
proc GetRandomSeedMinValue*(this: var vtkAttributeClustering2DLayoutStrategy): cint {.
    importcpp: "GetRandomSeedMinValue",
    header: "vtkAttributeClustering2DLayoutStrategy.h".}
proc GetRandomSeedMaxValue*(this: var vtkAttributeClustering2DLayoutStrategy): cint {.
    importcpp: "GetRandomSeedMaxValue",
    header: "vtkAttributeClustering2DLayoutStrategy.h".}
## !!!Ignored construct:  virtual int GetRandomSeed ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RandomSeed  of  << this -> RandomSeed ) ; return this -> RandomSeed ; } ;
## Error: expected ';'!!!

proc SetRandomSeedMaxNumberOfIterations*(this: var vtkAttributeClustering2DLayoutStrategy;
                                        _arg: cint) {.
    importcpp: "SetRandomSeedMaxNumberOfIterations",
    header: "vtkAttributeClustering2DLayoutStrategy.h".}
proc GetRandomSeedMinValueMaxNumberOfIterationsMinValue*(
    this: var vtkAttributeClustering2DLayoutStrategy): cint {.
    importcpp: "GetRandomSeedMinValueMaxNumberOfIterationsMinValue",
    header: "vtkAttributeClustering2DLayoutStrategy.h".}
proc GetRandomSeedMaxValueMaxNumberOfIterationsMaxValue*(
    this: var vtkAttributeClustering2DLayoutStrategy): cint {.
    importcpp: "GetRandomSeedMaxValueMaxNumberOfIterationsMaxValue",
    header: "vtkAttributeClustering2DLayoutStrategy.h".}
## !!!Ignored construct:  virtual int GetRandomSeedMaxNumberOfIterations ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaxNumberOfIterations  of  << this -> MaxNumberOfIterations ) ; return this -> MaxNumberOfIterations ; } ;
## Error: expected ';'!!!

proc SetRandomSeedMaxNumberOfIterationsIterationsPerLayout*(
    this: var vtkAttributeClustering2DLayoutStrategy; _arg: cint) {.
    importcpp: "SetRandomSeedMaxNumberOfIterationsIterationsPerLayout",
    header: "vtkAttributeClustering2DLayoutStrategy.h".}
proc GetRandomSeedMinValueMaxNumberOfIterationsMinValueIterationsPerLayoutMinValue*(
    this: var vtkAttributeClustering2DLayoutStrategy): cint {.importcpp: "GetRandomSeedMinValueMaxNumberOfIterationsMinValueIterationsPerLayoutMinValue",
    header: "vtkAttributeClustering2DLayoutStrategy.h".}
proc GetRandomSeedMaxValueMaxNumberOfIterationsMaxValueIterationsPerLayoutMaxValue*(
    this: var vtkAttributeClustering2DLayoutStrategy): cint {.importcpp: "GetRandomSeedMaxValueMaxNumberOfIterationsMaxValueIterationsPerLayoutMaxValue",
    header: "vtkAttributeClustering2DLayoutStrategy.h".}
## !!!Ignored construct:  virtual int GetRandomSeedMaxNumberOfIterationsIterationsPerLayout ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IterationsPerLayout  of  << this -> IterationsPerLayout ) ; return this -> IterationsPerLayout ; } ;
## Error: expected ';'!!!

proc SetRandomSeedMaxNumberOfIterationsIterationsPerLayoutInitialTemperature*(
    this: var vtkAttributeClustering2DLayoutStrategy; _arg: cfloat) {.importcpp: "SetRandomSeedMaxNumberOfIterationsIterationsPerLayoutInitialTemperature",
    header: "vtkAttributeClustering2DLayoutStrategy.h".}
proc GetRandomSeedMinValueMaxNumberOfIterationsMinValueIterationsPerLayoutMinValueInitialTemperatureMinValue*(
    this: var vtkAttributeClustering2DLayoutStrategy): cfloat {.importcpp: "GetRandomSeedMinValueMaxNumberOfIterationsMinValueIterationsPerLayoutMinValueInitialTemperatureMinValue",
    header: "vtkAttributeClustering2DLayoutStrategy.h".}
proc GetRandomSeedMaxValueMaxNumberOfIterationsMaxValueIterationsPerLayoutMaxValueInitialTemperatureMaxValue*(
    this: var vtkAttributeClustering2DLayoutStrategy): cfloat {.importcpp: "GetRandomSeedMaxValueMaxNumberOfIterationsMaxValueIterationsPerLayoutMaxValueInitialTemperatureMaxValue",
    header: "vtkAttributeClustering2DLayoutStrategy.h".}
## !!!Ignored construct:  virtual float GetRandomSeedMaxNumberOfIterationsIterationsPerLayoutInitialTemperature ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InitialTemperature  of  << this -> InitialTemperature ) ; return this -> InitialTemperature ; } ;
## Error: expected ';'!!!

proc SetRandomSeedMaxNumberOfIterationsIterationsPerLayoutInitialTemperatureCoolDownRate*(
    this: var vtkAttributeClustering2DLayoutStrategy; _arg: cdouble) {.importcpp: "SetRandomSeedMaxNumberOfIterationsIterationsPerLayoutInitialTemperatureCoolDownRate",
    header: "vtkAttributeClustering2DLayoutStrategy.h".}
proc GetRandomSeedMinValueMaxNumberOfIterationsMinValueIterationsPerLayoutMinValueInitialTemperatureMinValueCoolDownRateMinValue*(
    this: var vtkAttributeClustering2DLayoutStrategy): cdouble {.importcpp: "GetRandomSeedMinValueMaxNumberOfIterationsMinValueIterationsPerLayoutMinValueInitialTemperatureMinValueCoolDownRateMinValue",
    header: "vtkAttributeClustering2DLayoutStrategy.h".}
proc GetRandomSeedMaxValueMaxNumberOfIterationsMaxValueIterationsPerLayoutMaxValueInitialTemperatureMaxValueCoolDownRateMaxValue*(
    this: var vtkAttributeClustering2DLayoutStrategy): cdouble {.importcpp: "GetRandomSeedMaxValueMaxNumberOfIterationsMaxValueIterationsPerLayoutMaxValueInitialTemperatureMaxValueCoolDownRateMaxValue",
    header: "vtkAttributeClustering2DLayoutStrategy.h".}
## !!!Ignored construct:  virtual double GetRandomSeedMaxNumberOfIterationsIterationsPerLayoutInitialTemperatureCoolDownRate ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CoolDownRate  of  << this -> CoolDownRate ) ; return this -> CoolDownRate ; } ;
## Error: expected ';'!!!

proc SetRestDistance*(this: var vtkAttributeClustering2DLayoutStrategy; _arg: cfloat) {.
    importcpp: "SetRestDistance",
    header: "vtkAttributeClustering2DLayoutStrategy.h".}
## !!!Ignored construct:  virtual float GetRandomSeedMaxNumberOfIterationsIterationsPerLayoutInitialTemperatureCoolDownRateRestDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RestDistance  of  << this -> RestDistance ) ; return this -> RestDistance ; } ;
## Error: expected ';'!!!

proc Initialize*(this: var vtkAttributeClustering2DLayoutStrategy) {.
    importcpp: "Initialize", header: "vtkAttributeClustering2DLayoutStrategy.h".}
proc Layout*(this: var vtkAttributeClustering2DLayoutStrategy) {.
    importcpp: "Layout", header: "vtkAttributeClustering2DLayoutStrategy.h".}
proc IsLayoutComplete*(this: var vtkAttributeClustering2DLayoutStrategy): cint {.
    importcpp: "IsLayoutComplete",
    header: "vtkAttributeClustering2DLayoutStrategy.h".}