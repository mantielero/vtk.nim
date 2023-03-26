## =============================================================================
##
##   Copyright (c) Kitware, Inc.
##   All rights reserved.
##   See LICENSE.txt for details.
##
##   This software is distributed WITHOUT ANY WARRANTY; without even
##   the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##   PURPOSE.  See the above copyright notice for more information.
##
##   Copyright 2012 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
##
## =============================================================================
## *
##  @class   vtkmHistogram
##  @brief   generate a histogram out of a scalar data
##
##  vtkmHistogram is a filter that generates a histogram out of a scalar data.
##  The histogram consists of a certain number of bins specified by the user, and
##  the user can fetch the range and bin delta after completion.
##
##

import
  vtkAcceleratorsVTKmFiltersModule, vtkTableAlgorithm

discard "forward decl of vtkDoubleArray"
type
  vtkmHistogram* {.importcpp: "vtkmHistogram", header: "vtkmHistogram.h", bycopy.} = object of vtkTableAlgorithm
    vtkmHistogram* {.importc: "vtkmHistogram".}: VTK_NEWINSTANCE

  vtkmHistogramSuperclass* = vtkTableAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkmHistogram::IsTypeOf(@)", header: "vtkmHistogram.h".}
proc IsA*(this: var vtkmHistogram; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkmHistogram.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkmHistogram {.
    importcpp: "vtkmHistogram::SafeDownCast(@)", header: "vtkmHistogram.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkmHistogram :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTableAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkmHistogram :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkmHistogram :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkmHistogram; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkmHistogram.h".}
proc New*(): ptr vtkmHistogram {.importcpp: "vtkmHistogram::New(@)",
                             header: "vtkmHistogram.h".}
proc SetNumberOfBins*(this: var vtkmHistogram; _arg: csize_t) {.
    importcpp: "SetNumberOfBins", header: "vtkmHistogram.h".}
## !!!Ignored construct:  virtual size_t GetNumberOfBins ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfBins  of  << this -> NumberOfBins ) ; return this -> NumberOfBins ; } ;
## Error: expected ';'!!!

proc SetCustomBinRange*(this: var vtkmHistogram; _arg1: cdouble; _arg2: cdouble) {.
    importcpp: "SetCustomBinRange", header: "vtkmHistogram.h".}
proc SetCustomBinRange*(this: var vtkmHistogram; _arg: array[2, cdouble]) {.
    importcpp: "SetCustomBinRange", header: "vtkmHistogram.h".}
## !!!Ignored construct:  virtual double * GetCustomBinRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << CustomBinRange  pointer  << this -> CustomBinRange ) ; return this -> CustomBinRange ; } VTK_WRAPEXCLUDE virtual void GetCustomBinRange ( double & _arg1 , double & _arg2 ) { _arg1 = this -> CustomBinRange [ 0 ] ; _arg2 = this -> CustomBinRange [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << CustomBinRange  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCustomBinRange ( double _arg [ 2 ] ) { this -> GetCustomBinRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetNumberOfBinsUseCustomBinRanges*(this: var vtkmHistogram; _arg: bool) {.
    importcpp: "SetNumberOfBinsUseCustomBinRanges", header: "vtkmHistogram.h".}
## !!!Ignored construct:  virtual bool GetNumberOfBinsUseCustomBinRanges ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseCustomBinRanges  of  << this -> UseCustomBinRanges ) ; return this -> UseCustomBinRanges ; } ;
## Error: expected ';'!!!

proc UseCustomBinRangesOn*(this: var vtkmHistogram) {.
    importcpp: "UseCustomBinRangesOn", header: "vtkmHistogram.h".}
proc UseCustomBinRangesOff*(this: var vtkmHistogram) {.
    importcpp: "UseCustomBinRangesOff", header: "vtkmHistogram.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get/Set if first and last bins must be centered around the min and max
  ##  data. This is only used when UseCustomBinRanges is set to false.
  ##  Default is false.
  ##
proc SetNumberOfBinsUseCustomBinRangesCenterBinsAroundMinAndMax*(
    this: var vtkmHistogram; _arg: bool) {.importcpp: "SetNumberOfBinsUseCustomBinRangesCenterBinsAroundMinAndMax",
                                      header: "vtkmHistogram.h".}
## !!!Ignored construct:  virtual bool GetNumberOfBinsUseCustomBinRangesCenterBinsAroundMinAndMax ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CenterBinsAroundMinAndMax  of  << this -> CenterBinsAroundMinAndMax ) ; return this -> CenterBinsAroundMinAndMax ; } ;
## Error: expected ';'!!!

proc CenterBinsAroundMinAndMaxOn*(this: var vtkmHistogram) {.
    importcpp: "CenterBinsAroundMinAndMaxOn", header: "vtkmHistogram.h".}
proc CenterBinsAroundMinAndMaxOff*(this: var vtkmHistogram) {.
    importcpp: "CenterBinsAroundMinAndMaxOff", header: "vtkmHistogram.h".}
  ## /@}
  ## /@{
  ## *
  ##  Return the range used to generate the histogram.
  ##
## !!!Ignored construct:  virtual double * GetComputedRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ComputedRange  pointer  << this -> ComputedRange ) ; return this -> ComputedRange ; } VTK_WRAPEXCLUDE virtual void GetComputedRange ( double data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> ComputedRange [ i ] ; } } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Return the bin delta of the computed field.
##  virtual double GetNumberOfBinsUseCustomBinRangesCenterBinsAroundMinAndMaxBinDeltaBinDelta ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BinDelta  of  << this -> BinDelta ) ; return this -> BinDelta ; } ;
## Error: expected ';'!!!
