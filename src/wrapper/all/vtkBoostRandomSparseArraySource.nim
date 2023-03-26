## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBoostRandomSparseArraySource.h
##
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
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
##  @class   vtkBoostRandomSparseArraySource
##  @brief   generates a sparse N-way array containing random values.
##
##  @par Thanks:
##  Developed by Timothy M. Shead (tshead@sandia.gov) at Sandia National Laboratories.
##

import
  vtkArrayDataAlgorithm, vtkArrayExtents, vtkInfovisBoostGraphAlgorithmsModule

type
  vtkBoostRandomSparseArraySource* {.importcpp: "vtkBoostRandomSparseArraySource", header: "vtkBoostRandomSparseArraySource.h",
                                    bycopy.} = object of vtkArrayDataAlgorithm
    vtkBoostRandomSparseArraySource* {.importc: "vtkBoostRandomSparseArraySource".}: VTK_NEWINSTANCE


proc New*(): ptr vtkBoostRandomSparseArraySource {.
    importcpp: "vtkBoostRandomSparseArraySource::New(@)",
    header: "vtkBoostRandomSparseArraySource.h".}
type
  vtkBoostRandomSparseArraySourceSuperclass* = vtkArrayDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkBoostRandomSparseArraySource::IsTypeOf(@)",
    header: "vtkBoostRandomSparseArraySource.h".}
proc IsA*(this: var vtkBoostRandomSparseArraySource; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkBoostRandomSparseArraySource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkBoostRandomSparseArraySource {.
    importcpp: "vtkBoostRandomSparseArraySource::SafeDownCast(@)",
    header: "vtkBoostRandomSparseArraySource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkBoostRandomSparseArraySource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkArrayDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBoostRandomSparseArraySource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBoostRandomSparseArraySource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkBoostRandomSparseArraySource; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkBoostRandomSparseArraySource.h".}
proc SetExtents*(this: var vtkBoostRandomSparseArraySource; a2: vtkArrayExtents) {.
    importcpp: "SetExtents", header: "vtkBoostRandomSparseArraySource.h".}
proc GetExtents*(this: var vtkBoostRandomSparseArraySource): vtkArrayExtents {.
    importcpp: "GetExtents", header: "vtkBoostRandomSparseArraySource.h".}
## !!!Ignored construct:  /@{ *
##  Stores a random-number-seed for determining which elements within
##  the output matrix will have non-zero values
##  virtual vtkTypeUInt32 GetElementProbabilitySeedElementProbabilitySeed ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ElementProbabilitySeed  of  << this -> ElementProbabilitySeed ) ; return this -> ElementProbabilitySeed ; } ;
## Error: expected ';'!!!

proc SetElementProbabilitySeed*(this: var vtkBoostRandomSparseArraySource;
                               _arg: vtkTypeUInt32) {.
    importcpp: "SetElementProbabilitySeed",
    header: "vtkBoostRandomSparseArraySource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Stores the probability (in the range [0, 1]) that an element within
  ##  the output matrix will have a non-zero value
  ##
## !!!Ignored construct:  virtual double GetElementProbabilitySeedElementProbabilitySeedElementProbability ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ElementProbability  of  << this -> ElementProbability ) ; return this -> ElementProbability ; } ;
## Error: expected ';'!!!

proc SetElementProbabilitySeedElementProbability*(
    this: var vtkBoostRandomSparseArraySource; _arg: cdouble) {.
    importcpp: "SetElementProbabilitySeedElementProbability",
    header: "vtkBoostRandomSparseArraySource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Stores a random-number-seed for computing random element values
  ##
## !!!Ignored construct:  virtual vtkTypeUInt32 GetElementProbabilitySeedElementProbabilitySeedElementProbabilityElementValueSeed ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ElementValueSeed  of  << this -> ElementValueSeed ) ; return this -> ElementValueSeed ; } ;
## Error: expected ';'!!!

proc SetElementProbabilitySeedElementProbabilityElementValueSeed*(
    this: var vtkBoostRandomSparseArraySource; _arg: vtkTypeUInt32) {.
    importcpp: "SetElementProbabilitySeedElementProbabilityElementValueSeed",
    header: "vtkBoostRandomSparseArraySource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Stores the minimum value of any element
  ##
## !!!Ignored construct:  virtual double GetElementProbabilitySeedElementProbabilitySeedElementProbabilityElementValueSeedMinValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MinValue  of  << this -> MinValue ) ; return this -> MinValue ; } ;
## Error: expected ';'!!!

proc SetElementProbabilitySeedElementProbabilityElementValueSeedMinValue*(
    this: var vtkBoostRandomSparseArraySource; _arg: cdouble) {.importcpp: "SetElementProbabilitySeedElementProbabilityElementValueSeedMinValue",
    header: "vtkBoostRandomSparseArraySource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Stores the maximum value of any element
  ##
## !!!Ignored construct:  virtual double GetElementProbabilitySeedElementProbabilitySeedElementProbabilityElementValueSeedMinValueMaxValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaxValue  of  << this -> MaxValue ) ; return this -> MaxValue ; } ;
## Error: expected ';'!!!

proc SetElementProbabilitySeedElementProbabilityElementValueSeedMinValueMaxValue*(
    this: var vtkBoostRandomSparseArraySource; _arg: cdouble) {.importcpp: "SetElementProbabilitySeedElementProbabilityElementValueSeedMinValueMaxValue",
    header: "vtkBoostRandomSparseArraySource.h".}
  ## /@}