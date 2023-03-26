## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLengthDistribution.h
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
##  @class   vtkLengthDistribution
##  @brief   Sample the distribution of representative "cell lengths"
##   of a mesh.
##
##  vtkLengthDistribution chooses a subset of N cells and, for each one, chooses
##  two random connectivity entries of the cell. Then it computes the distance
##  between the corresponding points and inserts the distance into an ordered set.
##  The result is a cumulative distribution function (CDF) of lengths which are
##  representative of the length scales present in the dataset.
##  Quantiles (other than the extremal values) of this distribution should be
##  relatively stable estimates of length scales compared to moment-based
##  estimates that may be skewed by outlier elements.
##
##  This filter produces a vtkTable as its result, with N rows containing
##  monotonically increasing length values. Only polydata and unstructured
##  grids are accepted; other dataset types will produce an empty table
##  and a warning.
##

## !!!Ignored construct:  # vtkLengthDistribution_h [NewLine] # vtkLengthDistribution_h [NewLine] # vtkFiltersStatisticsModule.h  For export macro # vtkTableAlgorithm.h [NewLine] class vtkCell ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDataArray"
## !!!Ignored construct:  class VTKFILTERSSTATISTICS_EXPORT vtkLengthDistribution : public vtkTableAlgorithm { public : void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkTableAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkTableAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkLengthDistribution :: IsTypeOf ( type ) ; } static vtkLengthDistribution * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkLengthDistribution * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkLengthDistribution * NewInstance ( ) const { return vtkLengthDistribution :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTableAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLengthDistribution :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLengthDistribution :: New ( ) ; } public : ; static vtkLengthDistribution * New ( ) ; / Set/get the size of the distribution.
## / The output table will be no larger than this but may be
## / smaller if the input dataset has fewer cells.
## / The default is to generate 100,000 samples. virtual vtkIdType GetSampleSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SampleSize  of  << this -> SampleSize ) ; return this -> SampleSize ; } ; virtual void SetSampleSize ( vtkIdType _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SampleSize  to  << _arg ) ; if ( this -> SampleSize != _arg ) { this -> SampleSize = _arg ; this -> Modified ( ) ; } } ; / Set/get whether to sort the table rows or not.
## /
## / By default, the cell lengths are sorted so that
## / the table can be used as a CDF. If you are working
## / with large samples and do not need the sampled
## / set of lengths sorted, turn this off. virtual bool GetSampleSizeSortSample ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SortSample  of  << this -> SortSample ) ; return this -> SortSample ; } ; virtual void SetSampleSizeSortSample ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SortSample  to  << _arg ) ; if ( this -> SortSample != _arg ) { this -> SortSample = _arg ; this -> Modified ( ) ; } } ; virtual void SortSampleOn ( ) { this -> SetSortSample ( static_cast < bool > ( 1 ) ) ; } virtual void SortSampleOff ( ) { this -> SetSortSample ( static_cast < bool > ( 0 ) ) ; } ; / Return the length scale at a particular quantile.
## /
## / This method must only be invoked after the filter
## / has been run (i.e., the output is up-to-date with
## / the filter inputs and parameters). It is a convenience
## / method that fetches the cell-length column from the
## / output table and returns the value at or immediately
## / below the requested quantile. If the filter is
## / configured not to sort data, this method will throw
## / an exception since the output table is not a CDF.
## /
## / By default, the method returns the median length. double GetLengthQuantile ( double qq = 0.5 ) ; protected : ~ vtkLengthDistribution ( ) override = default ; vtkLengthDistribution ( ) = default ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; vtkIdType SampleSize = 100000 ; bool SortSample = true ; private : vtkLengthDistribution ( const vtkLengthDistribution & ) = delete ; void operator = ( const vtkLengthDistribution & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
