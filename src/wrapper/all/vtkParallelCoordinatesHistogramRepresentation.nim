## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkParallelCoordinatesHistogramRepresentation.h
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
##  @class   vtkParallelCoordinatesHistogramRepresentation
##  @brief   Data representation
##   that takes generic multivariate data and produces a parallel coordinates plot.
##   This plot optionally can draw a histogram-based plot summary.
##
##
##   A parallel coordinates plot represents each variable in a multivariate
##   data set as a separate axis.  Individual samples of that data set are
##   represented as a polyline that pass through each variable axis at
##   positions that correspond to data values.  This class can generate
##   parallel coordinates plots identical to its superclass
##   (vtkParallelCoordinatesRepresentation) and has the same interaction
##   styles.
##
##   In addition to the standard parallel coordinates plot, this class also
##   can draw a histogram summary of the parallel coordinates plot.
##   Rather than draw every row in an input data set, first it computes
##   a 2D histogram for all neighboring variable axes, then it draws
##   bar (thickness corresponds to bin size) for each bin the histogram
##   with opacity weighted by the number of rows contained in the bin.
##   The result is essentially a density map.
##
##   Because this emphasizes dense regions over sparse outliers, this class
##   also uses a vtkComputeHistogram2DOutliers instance to identify outlier
##   table rows and draws those as standard parallel coordinates lines.
##
##  @sa
##   vtkParallelCoordinatesView vtkParallelCoordinatesRepresentation
##   vtkExtractHistogram2D vtkComputeHistogram2DOutliers
##
##  @par Thanks:
##   Developed by David Feng at Sandia National Laboratories
##

import
  vtkParallelCoordinatesRepresentation, vtkViewsInfovisModule

discard "forward decl of vtkComputeHistogram2DOutliers"
discard "forward decl of vtkPairwiseExtractHistogram2D"
discard "forward decl of vtkExtractHistogram2D"
discard "forward decl of vtkInformationVector"
discard "forward decl of vtkLookupTable"
type
  vtkParallelCoordinatesHistogramRepresentation* {.
      importcpp: "vtkParallelCoordinatesHistogramRepresentation",
      header: "vtkParallelCoordinatesHistogramRepresentation.h", bycopy.} = object of vtkParallelCoordinatesRepresentation
    vtkParallelCoordinatesHistogramRepresentation*
        {.importc: "vtkParallelCoordinatesHistogramRepresentation".}: VTK_NEWINSTANCE
    ## *
    ##  The range applied to the lookup table used to draw histogram quads
    ##
    ## *
    ##  How many bins are used during the 2D histogram computation
    ##
    ## *
    ##  Whether or not to draw outlier lines
    ##
    ## *
    ##  How many outlier lines to draw, approximately.
    ##
    ## *
    ##  Correctly forwards the superclass call to draw lines to the internal
    ##  PlaceHistogramLineQuads call.
    ##


proc New*(): ptr vtkParallelCoordinatesHistogramRepresentation {.
    importcpp: "vtkParallelCoordinatesHistogramRepresentation::New(@)",
    header: "vtkParallelCoordinatesHistogramRepresentation.h".}
type
  vtkParallelCoordinatesHistogramRepresentationSuperclass* = vtkParallelCoordinatesRepresentation

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkParallelCoordinatesHistogramRepresentation::IsTypeOf(@)",
    header: "vtkParallelCoordinatesHistogramRepresentation.h".}
proc IsA*(this: var vtkParallelCoordinatesHistogramRepresentation; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkParallelCoordinatesHistogramRepresentation.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkParallelCoordinatesHistogramRepresentation {.importcpp: "vtkParallelCoordinatesHistogramRepresentation::SafeDownCast(@)",
    header: "vtkParallelCoordinatesHistogramRepresentation.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkParallelCoordinatesHistogramRepresentation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkParallelCoordinatesRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkParallelCoordinatesHistogramRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkParallelCoordinatesHistogramRepresentation :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkParallelCoordinatesHistogramRepresentation;
               os: var ostream; indent: vtkIndent) {.importcpp: "PrintSelf",
    header: "vtkParallelCoordinatesHistogramRepresentation.h".}
proc ApplyViewTheme*(this: var vtkParallelCoordinatesHistogramRepresentation;
                    theme: ptr vtkViewTheme) {.importcpp: "ApplyViewTheme",
    header: "vtkParallelCoordinatesHistogramRepresentation.h".}
proc SetUseHistograms*(this: var vtkParallelCoordinatesHistogramRepresentation;
                      a2: vtkTypeBool) {.importcpp: "SetUseHistograms", header: "vtkParallelCoordinatesHistogramRepresentation.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetUseHistograms ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseHistograms  of  << this -> UseHistograms ) ; return this -> UseHistograms ; } ;
## Error: expected ';'!!!

proc UseHistogramsOn*(this: var vtkParallelCoordinatesHistogramRepresentation) {.
    importcpp: "UseHistogramsOn",
    header: "vtkParallelCoordinatesHistogramRepresentation.h".}
proc UseHistogramsOff*(this: var vtkParallelCoordinatesHistogramRepresentation) {.
    importcpp: "UseHistogramsOff",
    header: "vtkParallelCoordinatesHistogramRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Whether to compute and show outlier lines
  ##
proc SetShowOutliers*(this: var vtkParallelCoordinatesHistogramRepresentation;
                     a2: vtkTypeBool) {.importcpp: "SetShowOutliers", header: "vtkParallelCoordinatesHistogramRepresentation.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetUseHistogramsShowOutliers ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ShowOutliers  of  << this -> ShowOutliers ) ; return this -> ShowOutliers ; } ;
## Error: expected ';'!!!

proc ShowOutliersOn*(this: var vtkParallelCoordinatesHistogramRepresentation) {.
    importcpp: "ShowOutliersOn",
    header: "vtkParallelCoordinatesHistogramRepresentation.h".}
proc ShowOutliersOff*(this: var vtkParallelCoordinatesHistogramRepresentation) {.
    importcpp: "ShowOutliersOff",
    header: "vtkParallelCoordinatesHistogramRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Control over the range of the lookup table used to draw the histogram quads.
  ##
proc SetHistogramLookupTableRange*(this: var vtkParallelCoordinatesHistogramRepresentation;
                                  _arg1: cdouble; _arg2: cdouble) {.
    importcpp: "SetHistogramLookupTableRange",
    header: "vtkParallelCoordinatesHistogramRepresentation.h".}
proc SetHistogramLookupTableRange*(this: var vtkParallelCoordinatesHistogramRepresentation;
                                  _arg: array[2, cdouble]) {.
    importcpp: "SetHistogramLookupTableRange",
    header: "vtkParallelCoordinatesHistogramRepresentation.h".}
## !!!Ignored construct:  virtual double * GetHistogramLookupTableRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << HistogramLookupTableRange  pointer  << this -> HistogramLookupTableRange ) ; return this -> HistogramLookupTableRange ; } VTK_WRAPEXCLUDE virtual void GetHistogramLookupTableRange ( double & _arg1 , double & _arg2 ) { _arg1 = this -> HistogramLookupTableRange [ 0 ] ; _arg2 = this -> HistogramLookupTableRange [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << HistogramLookupTableRange  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetHistogramLookupTableRange ( double _arg [ 2 ] ) { this -> GetHistogramLookupTableRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetNumberOfHistogramBins*(this: var vtkParallelCoordinatesHistogramRepresentation;
                              a2: cint; a3: cint) {.
    importcpp: "SetNumberOfHistogramBins",
    header: "vtkParallelCoordinatesHistogramRepresentation.h".}
proc SetNumberOfHistogramBins*(this: var vtkParallelCoordinatesHistogramRepresentation;
                              a2: ptr cint) {.
    importcpp: "SetNumberOfHistogramBins",
    header: "vtkParallelCoordinatesHistogramRepresentation.h".}
## !!!Ignored construct:  virtual int * GetHistogramLookupTableRangeNumberOfHistogramBins ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfHistogramBins  pointer  << this -> NumberOfHistogramBins ) ; return this -> NumberOfHistogramBins ; } VTK_WRAPEXCLUDE virtual void GetHistogramLookupTableRangeNumberOfHistogramBins ( int & _arg1 , int & _arg2 ) { _arg1 = this -> NumberOfHistogramBins [ 0 ] ; _arg2 = this -> NumberOfHistogramBins [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfHistogramBins  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetHistogramLookupTableRangeNumberOfHistogramBins ( int _arg [ 2 ] ) { this -> GetHistogramLookupTableRangeNumberOfHistogramBins ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetPreferredNumberOfOutliers*(this: var vtkParallelCoordinatesHistogramRepresentation;
                                  a2: cint) {.
    importcpp: "SetPreferredNumberOfOutliers",
    header: "vtkParallelCoordinatesHistogramRepresentation.h".}
## !!!Ignored construct:  virtual int GetUseHistogramsShowOutliersPreferredNumberOfOutliers ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PreferredNumberOfOutliers  of  << this -> PreferredNumberOfOutliers ) ; return this -> PreferredNumberOfOutliers ; } ;
## Error: expected ';'!!!

proc SwapAxisPositions*(this: var vtkParallelCoordinatesHistogramRepresentation;
                       position1: cint; position2: cint): cint {.
    importcpp: "SwapAxisPositions",
    header: "vtkParallelCoordinatesHistogramRepresentation.h".}
proc SetRangeAtPosition*(this: var vtkParallelCoordinatesHistogramRepresentation;
                        position: cint; range: array[2, cdouble]): cint {.
    importcpp: "SetRangeAtPosition",
    header: "vtkParallelCoordinatesHistogramRepresentation.h".}