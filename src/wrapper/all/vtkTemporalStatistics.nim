##  -*- c++ -*-
## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTemporalStatistics.h
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
##
##  Copyright 2008 Sandia Corporation.
##  Under the terms of Contract DE-AC04-94AL85000, there is a non-exclusive
##  license for use of this work by or on behalf of the
##  U.S. Government. Redistribution and use in source and binary forms, with
##  or without modification, are permitted provided that this Notice and any
##  statement of authorship are reproduced on all copies.
##
## *
##  @class   vtkTemporalStatistics
##  @brief   Compute statistics of point or cell data as it changes over time
##
##
##
##  Given an input that changes over time, vtkTemporalStatistics looks at the
##  data for each time step and computes some statistical information of how a
##  point or cell variable changes over time.  For example, vtkTemporalStatistics
##  can compute the average value of "pressure" over time of each point.
##
##  Note that this filter will require the upstream filter to be run on every
##  time step that it reports that it can compute.  This may be a time consuming
##  operation.
##
##  vtkTemporalStatistics ignores the temporal spacing.  Each timestep will be
##  weighted the same regardless of how long of an interval it is to the next
##  timestep.  Thus, the average statistic may be quite different from an
##  integration of the variable if the time spacing varies.
##
##  @par Thanks:
##  This class was originally written by Kenneth Moreland (kmorel@sandia.gov)
##  from Sandia National Laboratories.
##
##

import
  vtkFiltersGeneralModule, vtkPassInputTypeAlgorithm

discard "forward decl of vtkCompositeDataSet"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkFieldData"
discard "forward decl of vtkGraph"
type
  vtkTemporalStatistics* {.importcpp: "vtkTemporalStatistics",
                          header: "vtkTemporalStatistics.h", bycopy.} = object of vtkPassInputTypeAlgorithm ## /@{
                                                                                                     ## *
                                                                                                     ##  Standard methods for instantiation, type information, and printing.
                                                                                                     ##
    vtkTemporalStatistics* {.importc: "vtkTemporalStatistics".}: VTK_NEWINSTANCE
    ##  Used when iterating the pipeline to keep track of which timestep we are on.
    ## /@}

  vtkTemporalStatisticsSuperclass* = vtkPassInputTypeAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTemporalStatistics::IsTypeOf(@)",
    header: "vtkTemporalStatistics.h".}
proc IsA*(this: var vtkTemporalStatistics; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTemporalStatistics.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTemporalStatistics {.
    importcpp: "vtkTemporalStatistics::SafeDownCast(@)",
    header: "vtkTemporalStatistics.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTemporalStatistics :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPassInputTypeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTemporalStatistics :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTemporalStatistics :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc New*(): ptr vtkTemporalStatistics {.importcpp: "vtkTemporalStatistics::New(@)",
                                     header: "vtkTemporalStatistics.h".}
proc PrintSelf*(this: var vtkTemporalStatistics; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTemporalStatistics.h".}
## !!!Ignored construct:  /@} /@{ *
##  Turn on/off the computation of the average values over time.  On by
##  default.  The resulting array names have "_average" appended to them.
##  virtual vtkTypeBool GetComputeAverageComputeAverage ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeAverage  of  << this -> ComputeAverage ) ; return this -> ComputeAverage ; } ;
## Error: expected ';'!!!

proc SetComputeAverage*(this: var vtkTemporalStatistics; _arg: vtkTypeBool) {.
    importcpp: "SetComputeAverage", header: "vtkTemporalStatistics.h".}
proc ComputeAverageOn*(this: var vtkTemporalStatistics) {.
    importcpp: "ComputeAverageOn", header: "vtkTemporalStatistics.h".}
proc ComputeAverageOff*(this: var vtkTemporalStatistics) {.
    importcpp: "ComputeAverageOff", header: "vtkTemporalStatistics.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off the computation of the minimum values over time.  On by
  ##  default.  The resulting array names have "_minimum" appended to them.
  ##
## !!!Ignored construct:  virtual vtkTypeBool GetComputeAverageComputeAverageComputeMinimum ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeMinimum  of  << this -> ComputeMinimum ) ; return this -> ComputeMinimum ; } ;
## Error: expected ';'!!!

proc SetComputeAverageComputeMinimum*(this: var vtkTemporalStatistics;
                                     _arg: vtkTypeBool) {.
    importcpp: "SetComputeAverageComputeMinimum",
    header: "vtkTemporalStatistics.h".}
proc ComputeMinimumOn*(this: var vtkTemporalStatistics) {.
    importcpp: "ComputeMinimumOn", header: "vtkTemporalStatistics.h".}
proc ComputeMinimumOff*(this: var vtkTemporalStatistics) {.
    importcpp: "ComputeMinimumOff", header: "vtkTemporalStatistics.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off the computation of the maximum values over time.  On by
  ##  default.  The resulting array names have "_maximum" appended to them.
  ##
## !!!Ignored construct:  virtual vtkTypeBool GetComputeAverageComputeAverageComputeMinimumComputeMaximum ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeMaximum  of  << this -> ComputeMaximum ) ; return this -> ComputeMaximum ; } ;
## Error: expected ';'!!!

proc SetComputeAverageComputeMinimumComputeMaximum*(
    this: var vtkTemporalStatistics; _arg: vtkTypeBool) {.
    importcpp: "SetComputeAverageComputeMinimumComputeMaximum",
    header: "vtkTemporalStatistics.h".}
proc ComputeMaximumOn*(this: var vtkTemporalStatistics) {.
    importcpp: "ComputeMaximumOn", header: "vtkTemporalStatistics.h".}
proc ComputeMaximumOff*(this: var vtkTemporalStatistics) {.
    importcpp: "ComputeMaximumOff", header: "vtkTemporalStatistics.h".}
  ## /@}
  ##  Definition:
  ##  Turn on/off the computation of the standard deviation of the values over
  ##  time.  On by default.  The resulting array names have "_stddev" appended to
  ##  them.
## !!!Ignored construct:  virtual vtkTypeBool GetComputeAverageComputeAverageComputeMinimumComputeMaximumComputeStandardDeviation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeStandardDeviation  of  << this -> ComputeStandardDeviation ) ; return this -> ComputeStandardDeviation ; } ;
## Error: expected ';'!!!

proc SetComputeAverageComputeMinimumComputeMaximumComputeStandardDeviation*(
    this: var vtkTemporalStatistics; _arg: vtkTypeBool) {.importcpp: "SetComputeAverageComputeMinimumComputeMaximumComputeStandardDeviation",
    header: "vtkTemporalStatistics.h".}
proc ComputeStandardDeviationOn*(this: var vtkTemporalStatistics) {.
    importcpp: "ComputeStandardDeviationOn", header: "vtkTemporalStatistics.h".}
proc ComputeStandardDeviationOff*(this: var vtkTemporalStatistics) {.
    importcpp: "ComputeStandardDeviationOff", header: "vtkTemporalStatistics.h".}