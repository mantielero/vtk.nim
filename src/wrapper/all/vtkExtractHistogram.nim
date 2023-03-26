## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExtractHistogram.h
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
##  @class   vtkExtractHistogram
##  @brief   Extract histogram data (binned values) from any
##  dataset
##
##  vtkExtractHistogram accepts any vtkDataSet as input and produces a
##  vtkTable containing histogram data as output.  The output vtkTable
##  will contains a vtkDoubleArray named "bin_extents" which contains
##  the boundaries between each histogram bin, and a vtkUnsignedLongArray
##  named "bin_values" which will contain the value for each bin.
##

import
  vtkFiltersStatisticsModule, vtkTableAlgorithm

discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkFieldData"
discard "forward decl of vtkIntArray"
discard "forward decl of vtkExtractHistogramInternal"
type
  vtkExtractHistogram* {.importcpp: "vtkExtractHistogram",
                        header: "vtkExtractHistogram.h", bycopy.} = object of vtkTableAlgorithm
    vtkExtractHistogram* {.importc: "vtkExtractHistogram".}: VTK_NEWINSTANCE


proc New*(): ptr vtkExtractHistogram {.importcpp: "vtkExtractHistogram::New(@)",
                                   header: "vtkExtractHistogram.h".}
type
  vtkExtractHistogramSuperclass* = vtkTableAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkExtractHistogram::IsTypeOf(@)", header: "vtkExtractHistogram.h".}
proc IsA*(this: var vtkExtractHistogram; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkExtractHistogram.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkExtractHistogram {.
    importcpp: "vtkExtractHistogram::SafeDownCast(@)",
    header: "vtkExtractHistogram.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkExtractHistogram :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTableAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExtractHistogram :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExtractHistogram :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkExtractHistogram; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkExtractHistogram.h".}
proc SetComponent*(this: var vtkExtractHistogram; _arg: cint) {.
    importcpp: "SetComponent", header: "vtkExtractHistogram.h".}
proc GetComponentMinValue*(this: var vtkExtractHistogram): cint {.
    importcpp: "GetComponentMinValue", header: "vtkExtractHistogram.h".}
proc GetComponentMaxValue*(this: var vtkExtractHistogram): cint {.
    importcpp: "GetComponentMaxValue", header: "vtkExtractHistogram.h".}
## !!!Ignored construct:  virtual int GetComponent ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Component  of  << this -> Component ) ; return this -> Component ; } ;
## Error: expected ';'!!!

proc SetComponentBinCount*(this: var vtkExtractHistogram; _arg: cint) {.
    importcpp: "SetComponentBinCount", header: "vtkExtractHistogram.h".}
proc GetComponentMinValueBinCountMinValue*(this: var vtkExtractHistogram): cint {.
    importcpp: "GetComponentMinValueBinCountMinValue",
    header: "vtkExtractHistogram.h".}
proc GetComponentMaxValueBinCountMaxValue*(this: var vtkExtractHistogram): cint {.
    importcpp: "GetComponentMaxValueBinCountMaxValue",
    header: "vtkExtractHistogram.h".}
## !!!Ignored construct:  virtual int GetComponentBinCount ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BinCount  of  << this -> BinCount ) ; return this -> BinCount ; } ;
## Error: expected ';'!!!

proc SetCenterBinsAroundMinAndMax*(this: var vtkExtractHistogram; _arg: bool) {.
    importcpp: "SetCenterBinsAroundMinAndMax", header: "vtkExtractHistogram.h".}
## !!!Ignored construct:  virtual bool GetComponentBinCountCenterBinsAroundMinAndMax ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CenterBinsAroundMinAndMax  of  << this -> CenterBinsAroundMinAndMax ) ; return this -> CenterBinsAroundMinAndMax ; } ;
## Error: expected ';'!!!

proc CenterBinsAroundMinAndMaxOn*(this: var vtkExtractHistogram) {.
    importcpp: "CenterBinsAroundMinAndMaxOn", header: "vtkExtractHistogram.h".}
proc CenterBinsAroundMinAndMaxOff*(this: var vtkExtractHistogram) {.
    importcpp: "CenterBinsAroundMinAndMaxOff", header: "vtkExtractHistogram.h".}
  ## @}
  ## @{
  ## *
  ##  Get/Set custom bin range to use. These are used only when
  ##  UseCustomBinRanges is set to true.
  ##  Default is [0, 100].
  ##
proc SetCustomBinRanges*(this: var vtkExtractHistogram; _arg1: cdouble; _arg2: cdouble) {.
    importcpp: "SetCustomBinRanges", header: "vtkExtractHistogram.h".}
proc SetCustomBinRanges*(this: var vtkExtractHistogram; _arg: array[2, cdouble]) {.
    importcpp: "SetCustomBinRanges", header: "vtkExtractHistogram.h".}
## !!!Ignored construct:  virtual double * GetCustomBinRanges ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << CustomBinRanges  pointer  << this -> CustomBinRanges ) ; return this -> CustomBinRanges ; } VTK_WRAPEXCLUDE virtual void GetCustomBinRanges ( double & _arg1 , double & _arg2 ) { _arg1 = this -> CustomBinRanges [ 0 ] ; _arg2 = this -> CustomBinRanges [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << CustomBinRanges  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCustomBinRanges ( double _arg [ 2 ] ) { this -> GetCustomBinRanges ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetCenterBinsAroundMinAndMaxUseCustomBinRanges*(
    this: var vtkExtractHistogram; _arg: bool) {.
    importcpp: "SetCenterBinsAroundMinAndMaxUseCustomBinRanges",
    header: "vtkExtractHistogram.h".}
## !!!Ignored construct:  virtual bool GetComponentBinCountCenterBinsAroundMinAndMaxUseCustomBinRanges ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseCustomBinRanges  of  << this -> UseCustomBinRanges ) ; return this -> UseCustomBinRanges ; } ;
## Error: expected ';'!!!

proc UseCustomBinRangesOn*(this: var vtkExtractHistogram) {.
    importcpp: "UseCustomBinRangesOn", header: "vtkExtractHistogram.h".}
proc UseCustomBinRangesOff*(this: var vtkExtractHistogram) {.
    importcpp: "UseCustomBinRangesOff", header: "vtkExtractHistogram.h".}
  ## @}
  ## @{
  ## *
  ##  This option controls whether the algorithm calculates averages
  ##  of variables other than the primary variable that fall into each
  ##  bin.
  ##  Default is false.
  ##
proc SetCenterBinsAroundMinAndMaxUseCustomBinRangesCalculateAverages*(
    this: var vtkExtractHistogram; _arg: bool) {.importcpp: "SetCenterBinsAroundMinAndMaxUseCustomBinRangesCalculateAverages",
    header: "vtkExtractHistogram.h".}
## !!!Ignored construct:  virtual bool GetComponentBinCountCenterBinsAroundMinAndMaxUseCustomBinRangesCalculateAverages ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CalculateAverages  of  << this -> CalculateAverages ) ; return this -> CalculateAverages ; } ;
## Error: expected ';'!!!

proc CalculateAveragesOn*(this: var vtkExtractHistogram) {.
    importcpp: "CalculateAveragesOn", header: "vtkExtractHistogram.h".}
proc CalculateAveragesOff*(this: var vtkExtractHistogram) {.
    importcpp: "CalculateAveragesOff", header: "vtkExtractHistogram.h".}
  ## @}
  ## @{
  ## *
  ##  Set/Get the name of the bin extents array.
  ##  Default is "bin_extents".
  ##
proc SetBinExtentsArrayName*(this: var vtkExtractHistogram; _arg: cstring) {.
    importcpp: "SetBinExtentsArrayName", header: "vtkExtractHistogram.h".}
proc GetBinExtentsArrayName*(this: var vtkExtractHistogram): cstring {.
    importcpp: "GetBinExtentsArrayName", header: "vtkExtractHistogram.h".}
  ## @}
  ## @{
  ## *
  ##  Set/Get the name of the bin values array.
  ##  Default is "bin_values".
  ##
proc SetBinExtentsArrayNameBinValuesArrayName*(this: var vtkExtractHistogram;
    _arg: cstring) {.importcpp: "SetBinExtentsArrayNameBinValuesArrayName",
                   header: "vtkExtractHistogram.h".}
proc GetBinExtentsArrayNameBinValuesArrayName*(this: var vtkExtractHistogram): cstring {.
    importcpp: "GetBinExtentsArrayNameBinValuesArrayName",
    header: "vtkExtractHistogram.h".}
  ## @}
  ## @{
  ## *
  ##  If this option is set then the bin values will be normalized so that the sum of the bin values
  ##  adds up to 1.0.
  ##  Default is false.
  ##
proc SetCenterBinsAroundMinAndMaxUseCustomBinRangesCalculateAveragesNormalize*(
    this: var vtkExtractHistogram; _arg: bool) {.importcpp: "SetCenterBinsAroundMinAndMaxUseCustomBinRangesCalculateAveragesNormalize",
    header: "vtkExtractHistogram.h".}
proc NormalizeOn*(this: var vtkExtractHistogram) {.importcpp: "NormalizeOn",
    header: "vtkExtractHistogram.h".}
proc NormalizeOff*(this: var vtkExtractHistogram) {.importcpp: "NormalizeOff",
    header: "vtkExtractHistogram.h".}
## !!!Ignored construct:  virtual bool GetComponentBinCountCenterBinsAroundMinAndMaxUseCustomBinRangesCalculateAveragesNormalize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Normalize  of  << this -> Normalize ) ; return this -> Normalize ; } ;
## Error: expected ';'!!!

proc SetCenterBinsAroundMinAndMaxUseCustomBinRangesCalculateAveragesNormalizeAccumulation*(
    this: var vtkExtractHistogram; _arg: bool) {.importcpp: "SetCenterBinsAroundMinAndMaxUseCustomBinRangesCalculateAveragesNormalizeAccumulation",
    header: "vtkExtractHistogram.h".}
proc AccumulationOn*(this: var vtkExtractHistogram) {.importcpp: "AccumulationOn",
    header: "vtkExtractHistogram.h".}
proc AccumulationOff*(this: var vtkExtractHistogram) {.importcpp: "AccumulationOff",
    header: "vtkExtractHistogram.h".}
## !!!Ignored construct:  virtual bool GetComponentBinCountCenterBinsAroundMinAndMaxUseCustomBinRangesCalculateAveragesNormalizeAccumulation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Accumulation  of  << this -> Accumulation ) ; return this -> Accumulation ; } ;
## Error: expected ';'!!!

proc SetBinExtentsArrayNameBinValuesArrayNameBinAccumulationArrayName*(
    this: var vtkExtractHistogram; _arg: cstring) {.importcpp: "SetBinExtentsArrayNameBinValuesArrayNameBinAccumulationArrayName",
    header: "vtkExtractHistogram.h".}
proc GetBinExtentsArrayNameBinValuesArrayNameBinAccumulationArrayName*(
    this: var vtkExtractHistogram): cstring {.importcpp: "GetBinExtentsArrayNameBinValuesArrayNameBinAccumulationArrayName",
    header: "vtkExtractHistogram.h".}
  ## @}
  ## @{
  ## *
  ##  Get the bin range which was used to create the bin extents.
  ##
## !!!Ignored construct:  virtual double * GetCustomBinRangesBinRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << BinRange  pointer  << this -> BinRange ) ; return this -> BinRange ; } VTK_WRAPEXCLUDE virtual void GetCustomBinRangesBinRange ( double & _arg1 , double & _arg2 ) { _arg1 = this -> BinRange [ 0 ] ; _arg2 = this -> BinRange [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << BinRange  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCustomBinRangesBinRange ( double _arg [ 2 ] ) { this -> GetCustomBinRangesBinRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!
