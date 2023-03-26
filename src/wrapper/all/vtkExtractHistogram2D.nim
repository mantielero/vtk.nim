## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExtractHistogram2D.h
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
##   Copyright 2011 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkExtractHistogram2D
##  @brief   compute a 2D histogram between two columns
##   of an input vtkTable.
##
##
##   This class computes a 2D histogram between two columns of an input
##   vtkTable. Just as with a 1D histogram, a 2D histogram breaks
##   up the input domain into bins, and each pair of values (row in
##   the table) fits into a single bin and increments a row counter
##   for that bin.
##
##   To use this class, set the input with a table and call AddColumnPair(nameX,nameY),
##   where nameX and nameY are the names of the two columns to be used.
##
##   In addition to the number of bins (in X and Y), the domain of
##   the histogram can be customized by toggling the UseCustomHistogramExtents
##   flag and setting the CustomHistogramExtents variable to the
##   desired value.
##
##  @sa
##   vtkPExtractHistogram2D
##
##  @par Thanks:
##   Developed by David Feng and Philippe Pebay at Sandia National Laboratories
## ------------------------------------------------------------------------------
##

import
  vtkFiltersImagingModule, vtkStatisticsAlgorithm

discard "forward decl of vtkDataSetAttributes"
discard "forward decl of vtkImageData"
discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkMultiBlockDataSet"
type
  vtkExtractHistogram2D* {.importcpp: "vtkExtractHistogram2D",
                          header: "vtkExtractHistogram2D.h", bycopy.} = object of vtkStatisticsAlgorithm
    vtkExtractHistogram2D* {.importc: "vtkExtractHistogram2D".}: VTK_NEWINSTANCE


proc New*(): ptr vtkExtractHistogram2D {.importcpp: "vtkExtractHistogram2D::New(@)",
                                     header: "vtkExtractHistogram2D.h".}
type
  vtkExtractHistogram2DSuperclass* = vtkStatisticsAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkExtractHistogram2D::IsTypeOf(@)",
    header: "vtkExtractHistogram2D.h".}
proc IsA*(this: var vtkExtractHistogram2D; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkExtractHistogram2D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkExtractHistogram2D {.
    importcpp: "vtkExtractHistogram2D::SafeDownCast(@)",
    header: "vtkExtractHistogram2D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkExtractHistogram2D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkStatisticsAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExtractHistogram2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExtractHistogram2D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkExtractHistogram2D; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkExtractHistogram2D.h".}
type
  vtkExtractHistogram2DOutputIndices* {.size: sizeof(cint), importcpp: "vtkExtractHistogram2D::OutputIndices",
                                       header: "vtkExtractHistogram2D.h".} = enum
    HISTOGRAM_IMAGE = 3


proc SetNumberOfBins*(this: var vtkExtractHistogram2D; _arg1: cint; _arg2: cint) {.
    importcpp: "SetNumberOfBins", header: "vtkExtractHistogram2D.h".}
proc SetNumberOfBins*(this: var vtkExtractHistogram2D; _arg: array[2, cint]) {.
    importcpp: "SetNumberOfBins", header: "vtkExtractHistogram2D.h".}
## !!!Ignored construct:  virtual int * GetNumberOfBins ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfBins  pointer  << this -> NumberOfBins ) ; return this -> NumberOfBins ; } VTK_WRAPEXCLUDE virtual void GetNumberOfBins ( int & _arg1 , int & _arg2 ) { _arg1 = this -> NumberOfBins [ 0 ] ; _arg2 = this -> NumberOfBins [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfBins  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetNumberOfBins ( int _arg [ 2 ] ) { this -> GetNumberOfBins ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetNumberOfBinsComponentsToProcess*(this: var vtkExtractHistogram2D;
                                        _arg1: cint; _arg2: cint) {.
    importcpp: "SetNumberOfBinsComponentsToProcess",
    header: "vtkExtractHistogram2D.h".}
proc SetNumberOfBinsComponentsToProcess*(this: var vtkExtractHistogram2D;
                                        _arg: array[2, cint]) {.
    importcpp: "SetNumberOfBinsComponentsToProcess",
    header: "vtkExtractHistogram2D.h".}
## !!!Ignored construct:  virtual int * GetNumberOfBinsComponentsToProcess ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ComponentsToProcess  pointer  << this -> ComponentsToProcess ) ; return this -> ComponentsToProcess ; } VTK_WRAPEXCLUDE virtual void GetNumberOfBinsComponentsToProcess ( int & _arg1 , int & _arg2 ) { _arg1 = this -> ComponentsToProcess [ 0 ] ; _arg2 = this -> ComponentsToProcess [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << ComponentsToProcess  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetNumberOfBinsComponentsToProcess ( int _arg [ 2 ] ) { this -> GetNumberOfBinsComponentsToProcess ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetCustomHistogramExtents*(this: var vtkExtractHistogram2D; _arg1: cdouble;
                               _arg2: cdouble; _arg3: cdouble; _arg4: cdouble) {.
    importcpp: "SetCustomHistogramExtents", header: "vtkExtractHistogram2D.h".}
proc SetCustomHistogramExtents*(this: var vtkExtractHistogram2D;
                               _arg: array[4, cdouble]) {.
    importcpp: "SetCustomHistogramExtents", header: "vtkExtractHistogram2D.h".}
## !!!Ignored construct:  virtual double * GetCustomHistogramExtents ( ) VTK_SIZEHINT ( 4 ) { vtkDebugWithObjectMacro ( this , <<  returning  << CustomHistogramExtents  pointer  << this -> CustomHistogramExtents ) ; return this -> CustomHistogramExtents ; } VTK_WRAPEXCLUDE virtual void GetCustomHistogramExtents ( double & _arg1 , double & _arg2 , double & _arg3 , double & _arg4 ) { _arg1 = this -> CustomHistogramExtents [ 0 ] ; _arg2 = this -> CustomHistogramExtents [ 1 ] ; _arg3 = this -> CustomHistogramExtents [ 2 ] ; _arg4 = this -> CustomHistogramExtents [ 3 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << CustomHistogramExtents  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCustomHistogramExtents ( double _arg [ 4 ] ) { this -> GetCustomHistogramExtents ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] ) ; } ;
## Error: expected ';'!!!

proc SetUseCustomHistogramExtents*(this: var vtkExtractHistogram2D;
                                  _arg: vtkTypeBool) {.
    importcpp: "SetUseCustomHistogramExtents", header: "vtkExtractHistogram2D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetUseCustomHistogramExtents ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseCustomHistogramExtents  of  << this -> UseCustomHistogramExtents ) ; return this -> UseCustomHistogramExtents ; } ;
## Error: expected ';'!!!

proc UseCustomHistogramExtentsOn*(this: var vtkExtractHistogram2D) {.
    importcpp: "UseCustomHistogramExtentsOn", header: "vtkExtractHistogram2D.h".}
proc UseCustomHistogramExtentsOff*(this: var vtkExtractHistogram2D) {.
    importcpp: "UseCustomHistogramExtentsOff", header: "vtkExtractHistogram2D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Control the scalar type of the output histogram.  If the input
  ##  is relatively small, you can save space by using a smaller
  ##  data type.  Defaults to unsigned integer.
  ##
proc SetUseCustomHistogramExtentsScalarType*(this: var vtkExtractHistogram2D;
    _arg: cint) {.importcpp: "SetUseCustomHistogramExtentsScalarType",
                header: "vtkExtractHistogram2D.h".}
proc SetScalarTypeToUnsignedInt*(this: var vtkExtractHistogram2D) {.
    importcpp: "SetScalarTypeToUnsignedInt", header: "vtkExtractHistogram2D.h".}
proc SetScalarTypeToUnsignedLong*(this: var vtkExtractHistogram2D) {.
    importcpp: "SetScalarTypeToUnsignedLong", header: "vtkExtractHistogram2D.h".}
proc SetScalarTypeToUnsignedShort*(this: var vtkExtractHistogram2D) {.
    importcpp: "SetScalarTypeToUnsignedShort", header: "vtkExtractHistogram2D.h".}
proc SetScalarTypeToUnsignedChar*(this: var vtkExtractHistogram2D) {.
    importcpp: "SetScalarTypeToUnsignedChar", header: "vtkExtractHistogram2D.h".}
proc SetScalarTypeToFloat*(this: var vtkExtractHistogram2D) {.
    importcpp: "SetScalarTypeToFloat", header: "vtkExtractHistogram2D.h".}
proc SetScalarTypeToDouble*(this: var vtkExtractHistogram2D) {.
    importcpp: "SetScalarTypeToDouble", header: "vtkExtractHistogram2D.h".}
## !!!Ignored construct:  virtual int GetUseCustomHistogramExtentsScalarType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarType  of  << this -> ScalarType ) ; return this -> ScalarType ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Access the count of the histogram bin containing the largest number
##  of input rows.
##  virtual double GetUseCustomHistogramExtentsScalarTypeMaximumBinCountMaximumBinCount ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumBinCount  of  << this -> MaximumBinCount ) ; return this -> MaximumBinCount ; } ;
## Error: expected ';'!!!

proc GetBinRange*(this: var vtkExtractHistogram2D; binX: vtkIdType; binY: vtkIdType;
                 range: array[4, cdouble]): cint {.importcpp: "GetBinRange",
    header: "vtkExtractHistogram2D.h".}
proc GetBinRange*(this: var vtkExtractHistogram2D; bin: vtkIdType;
                 range: array[4, cdouble]): cint {.importcpp: "GetBinRange",
    header: "vtkExtractHistogram2D.h".}
proc GetBinWidth*(this: var vtkExtractHistogram2D; bw: array[2, cdouble]) {.
    importcpp: "GetBinWidth", header: "vtkExtractHistogram2D.h".}
proc GetOutputHistogramImage*(this: var vtkExtractHistogram2D): ptr vtkImageData {.
    importcpp: "GetOutputHistogramImage", header: "vtkExtractHistogram2D.h".}
proc GetHistogramExtents*(this: var vtkExtractHistogram2D): ptr cdouble {.
    importcpp: "GetHistogramExtents", header: "vtkExtractHistogram2D.h".}
proc SetUseCustomHistogramExtentsScalarTypeSwapColumns*(
    this: var vtkExtractHistogram2D; _arg: vtkTypeBool) {.
    importcpp: "SetUseCustomHistogramExtentsScalarTypeSwapColumns",
    header: "vtkExtractHistogram2D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetUseCustomHistogramExtentsScalarTypeMaximumBinCountMaximumBinCountSwapColumns ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SwapColumns  of  << this -> SwapColumns ) ; return this -> SwapColumns ; } ;
## Error: expected ';'!!!

proc SwapColumnsOn*(this: var vtkExtractHistogram2D) {.importcpp: "SwapColumnsOn",
    header: "vtkExtractHistogram2D.h".}
proc SwapColumnsOff*(this: var vtkExtractHistogram2D) {.importcpp: "SwapColumnsOff",
    header: "vtkExtractHistogram2D.h".}
  ## /@{
  ## *
  ##  Get/Set an optional mask that can ignore rows of the table
  ##
proc SetRowMask*(this: var vtkExtractHistogram2D; a2: ptr vtkDataArray) {.
    importcpp: "SetRowMask", header: "vtkExtractHistogram2D.h".}
proc GetnameRowMask*(this: var vtkExtractHistogram2D): ptr vtkDataArray {.
    importcpp: "GetnameRowMask", header: "vtkExtractHistogram2D.h".}
  ## /@}
  ## *
  ##  Given a collection of models, calculate aggregate model. Not used.
  ##
proc Aggregate*(this: var vtkExtractHistogram2D; a2: ptr vtkDataObjectCollection;
               a3: ptr vtkMultiBlockDataSet) {.importcpp: "Aggregate",
    header: "vtkExtractHistogram2D.h".}