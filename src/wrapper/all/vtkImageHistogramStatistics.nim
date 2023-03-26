## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageHistogramStatistics.h
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
##  @class   vtkImageHistogramStatistics
##  @brief   Compute statistics for an image
##
##  vtkImageHistogramStatistics computes statistics such as mean, median, and
##  standard deviation.  These statistics are computed from the histogram
##  of the image, rather than from the image itself, because this is more
##  efficient than computing the statistics while traversing the pixels.
##  If the input image is of type float or double, then the precision of
##  the Mean, Median, and StandardDeviation will depend on the number of
##  histogram bins.  By default, 65536 bins are used for float data, giving
##  at least 16 bits of precision.
##  @par Thanks:
##  Thanks to David Gobbi at the Seaman Family MR Centre and Dept. of Clinical
##  Neurosciences, Foothills Medical Centre, Calgary, for providing this class.
##

## !!!Ignored construct:  # vtkImageHistogramStatistics_h [NewLine] # vtkImageHistogramStatistics_h [NewLine] # vtkImageHistogram.h [NewLine] # vtkImagingStatisticsModule.h  For export macro [NewLine] class vtkImageStencilData ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkIdTypeArray"
## !!!Ignored construct:  class VTKIMAGINGSTATISTICS_EXPORT vtkImageHistogramStatistics : public vtkImageHistogram { public : static vtkImageHistogramStatistics * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageHistogram Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageHistogram :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageHistogramStatistics :: IsTypeOf ( type ) ; } static vtkImageHistogramStatistics * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageHistogramStatistics * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageHistogramStatistics * NewInstance ( ) const { return vtkImageHistogramStatistics :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageHistogram :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageHistogramStatistics :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageHistogramStatistics :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Get the minimum value present in the image.  This value is computed
##  when Update() is called.
##  double GetMinimum ( ) { return this -> Minimum ; } *
##  Get the maximum value present in the image.  This value is computed
##  when Update() is called.
##  double GetMaximum ( ) { return this -> Maximum ; } *
##  Get the mean value of the image.  This value is computed when Update()
##  is called.
##  double GetMean ( ) { return this -> Mean ; } *
##  Get the median value.  This is computed when Update() is called.
##  double GetMedian ( ) { return this -> Median ; } *
##  Get the standard deviation of the values in the image.  This is
##  computed when Update() is called.
##  double GetStandardDeviation ( ) { return this -> StandardDeviation ; } /@{ *
##  Set the percentiles to use for automatic view range computation.
##  This allows one to compute a range that does not include outliers
##  that are significantly darker or significantly brighter than the
##  rest of the pixels in the image.  The default is to use the first
##  percentile and the 99th percentile.
##  virtual void SetAutoRangePercentiles ( double _arg1 , double _arg2 ) { vtkDebugWithObjectMacro ( this , <<  setting  << AutoRangePercentiles  to ( << _arg1 << , << _arg2 << ) ) ; if ( ( this -> AutoRangePercentiles [ 0 ] != _arg1 ) || ( this -> AutoRangePercentiles [ 1 ] != _arg2 ) ) { this -> AutoRangePercentiles [ 0 ] = _arg1 ; this -> AutoRangePercentiles [ 1 ] = _arg2 ; this -> Modified ( ) ; } } void SetAutoRangePercentiles ( const double _arg [ 2 ] ) { this -> SetAutoRangePercentiles ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; virtual double * GetAutoRangePercentiles ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << AutoRangePercentiles  pointer  << this -> AutoRangePercentiles ) ; return this -> AutoRangePercentiles ; } VTK_WRAPEXCLUDE virtual void GetAutoRangePercentiles ( double & _arg1 , double & _arg2 ) { _arg1 = this -> AutoRangePercentiles [ 0 ] ; _arg2 = this -> AutoRangePercentiles [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << AutoRangePercentiles  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetAutoRangePercentiles ( double _arg [ 2 ] ) { this -> GetAutoRangePercentiles ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; /@} /@{ *
##  Set lower and upper expansion factors to apply to the auto range
##  that was computed from the AutoRangePercentiles.  Any outliers that
##  are within this expanded range will be included, even if they are
##  beyond the percentile.  This allows inclusion of values that are
##  just slightly outside of the percentile, while rejecting values
##  that are far beyond the percentile.  The default is to expand the
##  range by a factor of 0.1 at each end.  The range will never be
##  expanded beyond the Minimum or Maximum pixel values.
##  virtual void SetAutoRangePercentilesAutoRangeExpansionFactors ( double _arg1 , double _arg2 ) { vtkDebugWithObjectMacro ( this , <<  setting  << AutoRangeExpansionFactors  to ( << _arg1 << , << _arg2 << ) ) ; if ( ( this -> AutoRangeExpansionFactors [ 0 ] != _arg1 ) || ( this -> AutoRangeExpansionFactors [ 1 ] != _arg2 ) ) { this -> AutoRangeExpansionFactors [ 0 ] = _arg1 ; this -> AutoRangeExpansionFactors [ 1 ] = _arg2 ; this -> Modified ( ) ; } } void SetAutoRangePercentilesAutoRangeExpansionFactors ( const double _arg [ 2 ] ) { this -> SetAutoRangePercentilesAutoRangeExpansionFactors ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; virtual double * GetAutoRangePercentilesAutoRangeExpansionFactors ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << AutoRangeExpansionFactors  pointer  << this -> AutoRangeExpansionFactors ) ; return this -> AutoRangeExpansionFactors ; } VTK_WRAPEXCLUDE virtual void GetAutoRangePercentilesAutoRangeExpansionFactors ( double & _arg1 , double & _arg2 ) { _arg1 = this -> AutoRangeExpansionFactors [ 0 ] ; _arg2 = this -> AutoRangeExpansionFactors [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << AutoRangeExpansionFactors  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetAutoRangePercentilesAutoRangeExpansionFactors ( double _arg [ 2 ] ) { this -> GetAutoRangePercentilesAutoRangeExpansionFactors ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; /@} /@{ *
##  Get an automatically computed view range for the image, for use
##  with the lookup table or image property that is used when viewing
##  the image.  The use of this range will avoid situations where an
##  image looks too dark because a few pixels happen to be much brighter
##  than the rest.
##  virtual double * GetAutoRangePercentilesAutoRangeExpansionFactorsAutoRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << AutoRange  pointer  << this -> AutoRange ) ; return this -> AutoRange ; } VTK_WRAPEXCLUDE virtual void GetAutoRangePercentilesAutoRangeExpansionFactorsAutoRange ( double & _arg1 , double & _arg2 ) { _arg1 = this -> AutoRange [ 0 ] ; _arg2 = this -> AutoRange [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << AutoRange  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetAutoRangePercentilesAutoRangeExpansionFactorsAutoRange ( double _arg [ 2 ] ) { this -> GetAutoRangePercentilesAutoRangeExpansionFactorsAutoRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; /@} protected : vtkImageHistogramStatistics ( ) ; ~ vtkImageHistogramStatistics ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; double Minimum ; double Maximum ; double Mean ; double StandardDeviation ; double Median ; double AutoRange [ 2 ] ; double AutoRangePercentiles [ 2 ] ; double AutoRangeExpansionFactors [ 2 ] ; private : vtkImageHistogramStatistics ( const vtkImageHistogramStatistics & ) = delete ; void operator = ( const vtkImageHistogramStatistics & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
