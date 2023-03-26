## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTemporalShiftScale.h
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
##  @class   vtkTemporalShiftScale
##  @brief   modify the time range/steps of temporal data
##
##  vtkTemporalShiftScale  modify the time range or time steps of
##  the data without changing the data itself. The data is not resampled
##  by this filter, only the information accompanying the data is modified.
##
##  @par Thanks:
##  Ken Martin (Kitware) and John Bidiscombe of
##  CSCS - Swiss National Supercomputing Centre
##  for creating and contributing this class.
##  For related material, please refer to :
##  John Biddiscombe, Berk Geveci, Ken Martin, Kenneth Moreland, David Thompson,
##  "Time Dependent Processing in a Parallel Pipeline Architecture",
##  IEEE Visualization 2007.
##

import
  vtkAlgorithm, vtkFiltersHybridModule

type
  vtkTemporalShiftScale* {.importcpp: "vtkTemporalShiftScale",
                          header: "vtkTemporalShiftScale.h", bycopy.} = object of vtkAlgorithm
    vtkTemporalShiftScale* {.importc: "vtkTemporalShiftScale".}: VTK_NEWINSTANCE
    ## *
    ##  see vtkAlgorithm for details
    ##


proc New*(): ptr vtkTemporalShiftScale {.importcpp: "vtkTemporalShiftScale::New(@)",
                                     header: "vtkTemporalShiftScale.h".}
type
  vtkTemporalShiftScaleSuperclass* = vtkAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTemporalShiftScale::IsTypeOf(@)",
    header: "vtkTemporalShiftScale.h".}
proc IsA*(this: var vtkTemporalShiftScale; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTemporalShiftScale.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTemporalShiftScale {.
    importcpp: "vtkTemporalShiftScale::SafeDownCast(@)",
    header: "vtkTemporalShiftScale.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTemporalShiftScale :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTemporalShiftScale :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTemporalShiftScale :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTemporalShiftScale; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTemporalShiftScale.h".}
proc SetPreShift*(this: var vtkTemporalShiftScale; _arg: cdouble) {.
    importcpp: "SetPreShift", header: "vtkTemporalShiftScale.h".}
## !!!Ignored construct:  virtual double GetPreShift ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PreShift  of  << this -> PreShift ) ; return this -> PreShift ; } ;
## Error: expected ';'!!!

proc SetPreShiftPostShift*(this: var vtkTemporalShiftScale; _arg: cdouble) {.
    importcpp: "SetPreShiftPostShift", header: "vtkTemporalShiftScale.h".}
## !!!Ignored construct:  virtual double GetPreShiftPostShift ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PostShift  of  << this -> PostShift ) ; return this -> PostShift ; } ;
## Error: expected ';'!!!

proc SetPreShiftPostShiftScale*(this: var vtkTemporalShiftScale; _arg: cdouble) {.
    importcpp: "SetPreShiftPostShiftScale", header: "vtkTemporalShiftScale.h".}
## !!!Ignored construct:  virtual double GetPreShiftPostShiftScale ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Scale  of  << this -> Scale ) ; return this -> Scale ; } ;
## Error: expected ';'!!!

proc SetPreShiftPostShiftScalePeriodic*(this: var vtkTemporalShiftScale;
                                       _arg: vtkTypeBool) {.
    importcpp: "SetPreShiftPostShiftScalePeriodic",
    header: "vtkTemporalShiftScale.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetPreShiftPostShiftScalePeriodic ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Periodic  of  << this -> Periodic ) ; return this -> Periodic ; } ;
## Error: expected ';'!!!

proc PeriodicOn*(this: var vtkTemporalShiftScale) {.importcpp: "PeriodicOn",
    header: "vtkTemporalShiftScale.h".}
proc PeriodicOff*(this: var vtkTemporalShiftScale) {.importcpp: "PeriodicOff",
    header: "vtkTemporalShiftScale.h".}
  ## /@}
  ## /@{
  ## *
  ##  if Periodic time is enabled, this flag determines if the last time step is the same
  ##  as the first. If PeriodicEndCorrection is true, then it is assumed that the input
  ##  data goes from 0-1 (or whatever scaled/shifted actual time) and time 1 is the
  ##  same as time 0 so that steps will be 0,1,2,3...N,1,2,3...N,1,2,3 where step N
  ##  is the same as 0 and step 0 is not repeated. When this flag is false
  ##  the data is assumed to be literal and output is of the form 0,1,2,3...N,0,1,2,3...
  ##  By default this flag is ON
  ##
proc SetPreShiftPostShiftScalePeriodicPeriodicEndCorrection*(
    this: var vtkTemporalShiftScale; _arg: vtkTypeBool) {.
    importcpp: "SetPreShiftPostShiftScalePeriodicPeriodicEndCorrection",
    header: "vtkTemporalShiftScale.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetPreShiftPostShiftScalePeriodicPeriodicEndCorrection ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PeriodicEndCorrection  of  << this -> PeriodicEndCorrection ) ; return this -> PeriodicEndCorrection ; } ;
## Error: expected ';'!!!

proc PeriodicEndCorrectionOn*(this: var vtkTemporalShiftScale) {.
    importcpp: "PeriodicEndCorrectionOn", header: "vtkTemporalShiftScale.h".}
proc PeriodicEndCorrectionOff*(this: var vtkTemporalShiftScale) {.
    importcpp: "PeriodicEndCorrectionOff", header: "vtkTemporalShiftScale.h".}
  ## /@}
  ## /@{
  ## *
  ##  if Periodic time is enabled, this controls how many time periods time is reported
  ##  for. A filter cannot output an infinite number of time steps and therefore a finite
  ##  number of periods is generated when reporting time.
  ##
proc SetPreShiftPostShiftScalePeriodicPeriodicEndCorrectionMaximumNumberOfPeriods*(
    this: var vtkTemporalShiftScale; _arg: cdouble) {.importcpp: "SetPreShiftPostShiftScalePeriodicPeriodicEndCorrectionMaximumNumberOfPeriods",
    header: "vtkTemporalShiftScale.h".}
## !!!Ignored construct:  virtual double GetPreShiftPostShiftScalePeriodicPeriodicEndCorrectionMaximumNumberOfPeriods ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumNumberOfPeriods  of  << this -> MaximumNumberOfPeriods ) ; return this -> MaximumNumberOfPeriods ; } ;
## Error: expected ';'!!!
