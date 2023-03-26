## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPairwiseExtractHistogram2D.h
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
##   Copyright 2009 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkPairwiseExtractHistogram2D
##  @brief   compute a 2D histogram between
##   all adjacent columns of an input vtkTable.
##
##
##   This class computes a 2D histogram between all adjacent pairs of columns
##   of an input vtkTable. Internally it creates multiple vtkExtractHistogram2D
##   instances (one for each pair of adjacent table columns).  It also
##   manages updating histogram computations intelligently, only recomputing
##   those histograms for whom a relevant property has been altered.
##
##   Note that there are two different outputs from this filter.  One is a
##   table for which each column contains a flattened 2D histogram array.
##   The other is a vtkMultiBlockDataSet for which each block is a
##   vtkImageData representation of the 2D histogram.
##
##  @sa
##   vtkExtractHistogram2D vtkPPairwiseExtractHistogram2D
##
##  @par Thanks:
##   Developed by David Feng and Philippe Pebay at Sandia National Laboratories
## ------------------------------------------------------------------------------
##

import
  vtkFiltersImagingModule, vtkSmartPointer, vtkStatisticsAlgorithm

discard "forward decl of vtkCollection"
discard "forward decl of vtkExtractHistogram2D"
discard "forward decl of vtkImageData"
discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkMultiBlockDataSet"
type
  vtkPairwiseExtractHistogram2D* {.importcpp: "vtkPairwiseExtractHistogram2D",
                                  header: "vtkPairwiseExtractHistogram2D.h",
                                  bycopy.} = object of vtkStatisticsAlgorithm
    vtkPairwiseExtractHistogram2D* {.importc: "vtkPairwiseExtractHistogram2D".}: VTK_NEWINSTANCE
    ## *
    ##  Execute the calculations required by the Learn option.
    ##  Does the actual histogram computation works.
    ##


proc New*(): ptr vtkPairwiseExtractHistogram2D {.
    importcpp: "vtkPairwiseExtractHistogram2D::New(@)",
    header: "vtkPairwiseExtractHistogram2D.h".}
type
  vtkPairwiseExtractHistogram2DSuperclass* = vtkStatisticsAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPairwiseExtractHistogram2D::IsTypeOf(@)",
    header: "vtkPairwiseExtractHistogram2D.h".}
proc IsA*(this: var vtkPairwiseExtractHistogram2D; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPairwiseExtractHistogram2D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPairwiseExtractHistogram2D {.
    importcpp: "vtkPairwiseExtractHistogram2D::SafeDownCast(@)",
    header: "vtkPairwiseExtractHistogram2D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPairwiseExtractHistogram2D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkStatisticsAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPairwiseExtractHistogram2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPairwiseExtractHistogram2D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPairwiseExtractHistogram2D; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkPairwiseExtractHistogram2D.h".}
proc SetNumberOfBins*(this: var vtkPairwiseExtractHistogram2D; _arg1: cint;
                     _arg2: cint) {.importcpp: "SetNumberOfBins",
                                  header: "vtkPairwiseExtractHistogram2D.h".}
proc SetNumberOfBins*(this: var vtkPairwiseExtractHistogram2D; _arg: array[2, cint]) {.
    importcpp: "SetNumberOfBins", header: "vtkPairwiseExtractHistogram2D.h".}
## !!!Ignored construct:  virtual int * GetNumberOfBins ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfBins  pointer  << this -> NumberOfBins ) ; return this -> NumberOfBins ; } VTK_WRAPEXCLUDE virtual void GetNumberOfBins ( int & _arg1 , int & _arg2 ) { _arg1 = this -> NumberOfBins [ 0 ] ; _arg2 = this -> NumberOfBins [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfBins  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetNumberOfBins ( int _arg [ 2 ] ) { this -> GetNumberOfBins ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetCustomColumnRangeIndex*(this: var vtkPairwiseExtractHistogram2D; _arg: cint) {.
    importcpp: "SetCustomColumnRangeIndex",
    header: "vtkPairwiseExtractHistogram2D.h".}
proc SetCustomColumnRangeByIndex*(this: var vtkPairwiseExtractHistogram2D;
                                 a2: cdouble; a3: cdouble) {.
    importcpp: "SetCustomColumnRangeByIndex",
    header: "vtkPairwiseExtractHistogram2D.h".}
proc SetCustomColumnRange*(this: var vtkPairwiseExtractHistogram2D; col: cint;
                          range: array[2, cdouble]) {.
    importcpp: "SetCustomColumnRange", header: "vtkPairwiseExtractHistogram2D.h".}
proc SetCustomColumnRange*(this: var vtkPairwiseExtractHistogram2D; col: cint;
                          rmin: cdouble; rmax: cdouble) {.
    importcpp: "SetCustomColumnRange", header: "vtkPairwiseExtractHistogram2D.h".}
proc SetCustomColumnRangeIndexScalarType*(
    this: var vtkPairwiseExtractHistogram2D; _arg: cint) {.
    importcpp: "SetCustomColumnRangeIndexScalarType",
    header: "vtkPairwiseExtractHistogram2D.h".}
proc SetScalarTypeToUnsignedInt*(this: var vtkPairwiseExtractHistogram2D) {.
    importcpp: "SetScalarTypeToUnsignedInt",
    header: "vtkPairwiseExtractHistogram2D.h".}
proc SetScalarTypeToUnsignedLong*(this: var vtkPairwiseExtractHistogram2D) {.
    importcpp: "SetScalarTypeToUnsignedLong",
    header: "vtkPairwiseExtractHistogram2D.h".}
proc SetScalarTypeToUnsignedShort*(this: var vtkPairwiseExtractHistogram2D) {.
    importcpp: "SetScalarTypeToUnsignedShort",
    header: "vtkPairwiseExtractHistogram2D.h".}
proc SetScalarTypeToUnsignedChar*(this: var vtkPairwiseExtractHistogram2D) {.
    importcpp: "SetScalarTypeToUnsignedChar",
    header: "vtkPairwiseExtractHistogram2D.h".}
## !!!Ignored construct:  virtual int GetScalarType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarType  of  << this -> ScalarType ) ; return this -> ScalarType ; } ;
## Error: expected ';'!!!

proc GetMaximumBinCount*(this: var vtkPairwiseExtractHistogram2D; idx: cint): cdouble {.
    importcpp: "GetMaximumBinCount", header: "vtkPairwiseExtractHistogram2D.h".}
proc GetMaximumBinCount*(this: var vtkPairwiseExtractHistogram2D): cdouble {.
    importcpp: "GetMaximumBinCount", header: "vtkPairwiseExtractHistogram2D.h".}
proc GetBinRange*(this: var vtkPairwiseExtractHistogram2D; idx: cint; binX: vtkIdType;
                 binY: vtkIdType; range: array[4, cdouble]): cint {.
    importcpp: "GetBinRange", header: "vtkPairwiseExtractHistogram2D.h".}
proc GetBinRange*(this: var vtkPairwiseExtractHistogram2D; idx: cint; bin: vtkIdType;
                 range: array[4, cdouble]): cint {.importcpp: "GetBinRange",
    header: "vtkPairwiseExtractHistogram2D.h".}
proc GetBinWidth*(this: var vtkPairwiseExtractHistogram2D; idx: cint;
                 bw: array[2, cdouble]) {.importcpp: "GetBinWidth", header: "vtkPairwiseExtractHistogram2D.h".}
proc GetHistogramExtents*(this: var vtkPairwiseExtractHistogram2D; idx: cint): ptr cdouble {.
    importcpp: "GetHistogramExtents", header: "vtkPairwiseExtractHistogram2D.h".}
proc GetOutputHistogramImage*(this: var vtkPairwiseExtractHistogram2D; idx: cint): ptr vtkImageData {.
    importcpp: "GetOutputHistogramImage",
    header: "vtkPairwiseExtractHistogram2D.h".}
proc GetHistogramFilter*(this: var vtkPairwiseExtractHistogram2D; idx: cint): ptr vtkExtractHistogram2D {.
    importcpp: "GetHistogramFilter", header: "vtkPairwiseExtractHistogram2D.h".}
type
  vtkPairwiseExtractHistogram2DOutputIndices* {.size: sizeof(cint),
      importcpp: "vtkPairwiseExtractHistogram2D::OutputIndices",
      header: "vtkPairwiseExtractHistogram2D.h".} = enum
    HISTOGRAM_IMAGE = 3


proc Aggregate*(this: var vtkPairwiseExtractHistogram2D;
               a2: ptr vtkDataObjectCollection; a3: ptr vtkMultiBlockDataSet) {.
    importcpp: "Aggregate", header: "vtkPairwiseExtractHistogram2D.h".}