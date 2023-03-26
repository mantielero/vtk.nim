## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFast2DLayoutStrategy.h
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
##  @class   vtkFast2DLayoutStrategy
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
discard "forward decl of vtkFloatArray"
discard "forward decl of vtkGraphToPolyData"
discard "forward decl of vtkImageData"
type
  vtkFast2DLayoutStrategy* {.importcpp: "vtkFast2DLayoutStrategy",
                            header: "vtkFast2DLayoutStrategy.h", bycopy.} = object of vtkGraphLayoutStrategy ##  An edge consists of two vertices joined together.
                                                                                                      ##  This struct acts as a "pointer" to those two vertices.
    vtkFast2DLayoutStrategy* {.importc: "vtkFast2DLayoutStrategy".}: VTK_NEWINSTANCE
    ##  Maximum number of iterations.
    ##  Cool-down rate.  Note:  Higher # = Slower rate.
    ##  Private helper methods


proc New*(): ptr vtkFast2DLayoutStrategy {.importcpp: "vtkFast2DLayoutStrategy::New(@)",
                                       header: "vtkFast2DLayoutStrategy.h".}
type
  vtkFast2DLayoutStrategySuperclass* = vtkGraphLayoutStrategy

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkFast2DLayoutStrategy::IsTypeOf(@)",
    header: "vtkFast2DLayoutStrategy.h".}
proc IsA*(this: var vtkFast2DLayoutStrategy; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkFast2DLayoutStrategy.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkFast2DLayoutStrategy {.
    importcpp: "vtkFast2DLayoutStrategy::SafeDownCast(@)",
    header: "vtkFast2DLayoutStrategy.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkFast2DLayoutStrategy :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGraphLayoutStrategy :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFast2DLayoutStrategy :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFast2DLayoutStrategy :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkFast2DLayoutStrategy; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkFast2DLayoutStrategy.h".}
proc SetRandomSeed*(this: var vtkFast2DLayoutStrategy; _arg: cint) {.
    importcpp: "SetRandomSeed", header: "vtkFast2DLayoutStrategy.h".}
proc GetRandomSeedMinValue*(this: var vtkFast2DLayoutStrategy): cint {.
    importcpp: "GetRandomSeedMinValue", header: "vtkFast2DLayoutStrategy.h".}
proc GetRandomSeedMaxValue*(this: var vtkFast2DLayoutStrategy): cint {.
    importcpp: "GetRandomSeedMaxValue", header: "vtkFast2DLayoutStrategy.h".}
## !!!Ignored construct:  virtual int GetRandomSeed ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RandomSeed  of  << this -> RandomSeed ) ; return this -> RandomSeed ; } ;
## Error: expected ';'!!!

proc SetRandomSeedMaxNumberOfIterations*(this: var vtkFast2DLayoutStrategy;
                                        _arg: cint) {.
    importcpp: "SetRandomSeedMaxNumberOfIterations",
    header: "vtkFast2DLayoutStrategy.h".}
proc GetRandomSeedMinValueMaxNumberOfIterationsMinValue*(
    this: var vtkFast2DLayoutStrategy): cint {.
    importcpp: "GetRandomSeedMinValueMaxNumberOfIterationsMinValue",
    header: "vtkFast2DLayoutStrategy.h".}
proc GetRandomSeedMaxValueMaxNumberOfIterationsMaxValue*(
    this: var vtkFast2DLayoutStrategy): cint {.
    importcpp: "GetRandomSeedMaxValueMaxNumberOfIterationsMaxValue",
    header: "vtkFast2DLayoutStrategy.h".}
## !!!Ignored construct:  virtual int GetRandomSeedMaxNumberOfIterations ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaxNumberOfIterations  of  << this -> MaxNumberOfIterations ) ; return this -> MaxNumberOfIterations ; } ;
## Error: expected ';'!!!

proc SetRandomSeedMaxNumberOfIterationsIterationsPerLayout*(
    this: var vtkFast2DLayoutStrategy; _arg: cint) {.
    importcpp: "SetRandomSeedMaxNumberOfIterationsIterationsPerLayout",
    header: "vtkFast2DLayoutStrategy.h".}
proc GetRandomSeedMinValueMaxNumberOfIterationsMinValueIterationsPerLayoutMinValue*(
    this: var vtkFast2DLayoutStrategy): cint {.importcpp: "GetRandomSeedMinValueMaxNumberOfIterationsMinValueIterationsPerLayoutMinValue",
    header: "vtkFast2DLayoutStrategy.h".}
proc GetRandomSeedMaxValueMaxNumberOfIterationsMaxValueIterationsPerLayoutMaxValue*(
    this: var vtkFast2DLayoutStrategy): cint {.importcpp: "GetRandomSeedMaxValueMaxNumberOfIterationsMaxValueIterationsPerLayoutMaxValue",
    header: "vtkFast2DLayoutStrategy.h".}
## !!!Ignored construct:  virtual int GetRandomSeedMaxNumberOfIterationsIterationsPerLayout ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IterationsPerLayout  of  << this -> IterationsPerLayout ) ; return this -> IterationsPerLayout ; } ;
## Error: expected ';'!!!

proc SetRandomSeedMaxNumberOfIterationsIterationsPerLayoutInitialTemperature*(
    this: var vtkFast2DLayoutStrategy; _arg: cfloat) {.importcpp: "SetRandomSeedMaxNumberOfIterationsIterationsPerLayoutInitialTemperature",
    header: "vtkFast2DLayoutStrategy.h".}
proc GetRandomSeedMinValueMaxNumberOfIterationsMinValueIterationsPerLayoutMinValueInitialTemperatureMinValue*(
    this: var vtkFast2DLayoutStrategy): cfloat {.importcpp: "GetRandomSeedMinValueMaxNumberOfIterationsMinValueIterationsPerLayoutMinValueInitialTemperatureMinValue",
    header: "vtkFast2DLayoutStrategy.h".}
proc GetRandomSeedMaxValueMaxNumberOfIterationsMaxValueIterationsPerLayoutMaxValueInitialTemperatureMaxValue*(
    this: var vtkFast2DLayoutStrategy): cfloat {.importcpp: "GetRandomSeedMaxValueMaxNumberOfIterationsMaxValueIterationsPerLayoutMaxValueInitialTemperatureMaxValue",
    header: "vtkFast2DLayoutStrategy.h".}
## !!!Ignored construct:  virtual float GetRandomSeedMaxNumberOfIterationsIterationsPerLayoutInitialTemperature ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InitialTemperature  of  << this -> InitialTemperature ) ; return this -> InitialTemperature ; } ;
## Error: expected ';'!!!

proc SetRandomSeedMaxNumberOfIterationsIterationsPerLayoutInitialTemperatureCoolDownRate*(
    this: var vtkFast2DLayoutStrategy; _arg: cdouble) {.importcpp: "SetRandomSeedMaxNumberOfIterationsIterationsPerLayoutInitialTemperatureCoolDownRate",
    header: "vtkFast2DLayoutStrategy.h".}
proc GetRandomSeedMinValueMaxNumberOfIterationsMinValueIterationsPerLayoutMinValueInitialTemperatureMinValueCoolDownRateMinValue*(
    this: var vtkFast2DLayoutStrategy): cdouble {.importcpp: "GetRandomSeedMinValueMaxNumberOfIterationsMinValueIterationsPerLayoutMinValueInitialTemperatureMinValueCoolDownRateMinValue",
    header: "vtkFast2DLayoutStrategy.h".}
proc GetRandomSeedMaxValueMaxNumberOfIterationsMaxValueIterationsPerLayoutMaxValueInitialTemperatureMaxValueCoolDownRateMaxValue*(
    this: var vtkFast2DLayoutStrategy): cdouble {.importcpp: "GetRandomSeedMaxValueMaxNumberOfIterationsMaxValueIterationsPerLayoutMaxValueInitialTemperatureMaxValueCoolDownRateMaxValue",
    header: "vtkFast2DLayoutStrategy.h".}
## !!!Ignored construct:  virtual double GetRandomSeedMaxNumberOfIterationsIterationsPerLayoutInitialTemperatureCoolDownRate ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CoolDownRate  of  << this -> CoolDownRate ) ; return this -> CoolDownRate ; } ;
## Error: expected ';'!!!

proc SetRestDistance*(this: var vtkFast2DLayoutStrategy; _arg: cfloat) {.
    importcpp: "SetRestDistance", header: "vtkFast2DLayoutStrategy.h".}
## !!!Ignored construct:  virtual float GetRandomSeedMaxNumberOfIterationsIterationsPerLayoutInitialTemperatureCoolDownRateRestDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RestDistance  of  << this -> RestDistance ) ; return this -> RestDistance ; } ;
## Error: expected ';'!!!

proc Initialize*(this: var vtkFast2DLayoutStrategy) {.importcpp: "Initialize",
    header: "vtkFast2DLayoutStrategy.h".}
proc Layout*(this: var vtkFast2DLayoutStrategy) {.importcpp: "Layout",
    header: "vtkFast2DLayoutStrategy.h".}
proc IsLayoutComplete*(this: var vtkFast2DLayoutStrategy): cint {.
    importcpp: "IsLayoutComplete", header: "vtkFast2DLayoutStrategy.h".}
type
  vtkLayoutEdge* = vtkFast2DLayoutStrategyvtkLayoutEdge_t
