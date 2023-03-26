## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExtractGrid.h
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
##  @class   vtkExtractGrid
##  @brief   select piece (e.g., volume of interest) and/or subsample structured grid dataset
##
##
##  vtkExtractGrid is a filter that selects a portion of an input structured
##  grid dataset, or subsamples an input dataset. (The selected portion of
##  interested is referred to as the Volume Of Interest, or VOI.) The output of
##  this filter is a structured grid dataset. The filter treats input data of
##  any topological dimension (i.e., point, line, image, or volume) and can
##  generate output data of any topological dimension.
##
##  To use this filter set the VOI ivar which are i-j-k min/max indices that
##  specify a rectangular region in the data. (Note that these are 0-offset.)
##  You can also specify a sampling rate to subsample the data.
##
##  Typical applications of this filter are to extract a plane from a grid for
##  contouring, subsampling large grids to reduce data size, or extracting
##  regions of a grid with interesting data.
##
##  @sa
##  vtkGeometryFilter vtkExtractGeometry vtkExtractVOI
##  vtkStructuredGridGeometryFilter
##

## !!!Ignored construct:  # vtkExtractGrid_h [NewLine] # vtkExtractGrid_h [NewLine] # vtkFiltersExtractionModule.h  For export macro # vtkStructuredGridAlgorithm.h [NewLine]  Forward Declarations class vtkExtractStructuredGridHelper ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSEXTRACTION_EXPORT vtkExtractGrid : public vtkStructuredGridAlgorithm { public : static vtkExtractGrid * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkStructuredGridAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkStructuredGridAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkExtractGrid :: IsTypeOf ( type ) ; } static vtkExtractGrid * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkExtractGrid * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkExtractGrid * NewInstance ( ) const { return vtkExtractGrid :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkStructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExtractGrid :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExtractGrid :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Specify i-j-k (min,max) pairs to extract. The resulting structured grid
##  dataset can be of any topological dimension (i.e., point, line, plane,
##  or 3D grid).
##  virtual void SetVOI ( int _arg1 , int _arg2 , int _arg3 , int _arg4 , int _arg5 , int _arg6 ) { vtkDebugWithObjectMacro ( this , <<  setting  << VOI  to ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; if ( ( this -> VOI [ 0 ] != _arg1 ) || ( this -> VOI [ 1 ] != _arg2 ) || ( this -> VOI [ 2 ] != _arg3 ) || ( this -> VOI [ 3 ] != _arg4 ) || ( this -> VOI [ 4 ] != _arg5 ) || ( this -> VOI [ 5 ] != _arg6 ) ) { this -> VOI [ 0 ] = _arg1 ; this -> VOI [ 1 ] = _arg2 ; this -> VOI [ 2 ] = _arg3 ; this -> VOI [ 3 ] = _arg4 ; this -> VOI [ 4 ] = _arg5 ; this -> VOI [ 5 ] = _arg6 ; this -> Modified ( ) ; } } virtual void SetVOI ( const int _arg [ 6 ] ) { this -> SetVOI ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; virtual int * GetVOI ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << VOI  pointer  << this -> VOI ) ; return this -> VOI ; } VTK_WRAPEXCLUDE virtual void GetVOI ( int data [ 6 ] ) { for ( int i = 0 ; i < 6 ; i ++ ) { data [ i ] = this -> VOI [ i ] ; } } ; /@} /@{ *
##  Set the sampling rate in the i, j, and k directions. If the rate is > 1,
##  then the resulting VOI will be subsampled representation of the input.
##  For example, if the SampleRate=(2,2,2), every other point will be
##  selected, resulting in a volume 1/8th the original size.
##  Initial value is (1,1,1).
##  virtual void SetSampleRate ( int _arg1 , int _arg2 , int _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << SampleRate  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> SampleRate [ 0 ] != _arg1 ) || ( this -> SampleRate [ 1 ] != _arg2 ) || ( this -> SampleRate [ 2 ] != _arg3 ) ) { this -> SampleRate [ 0 ] = _arg1 ; this -> SampleRate [ 1 ] = _arg2 ; this -> SampleRate [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetSampleRate ( const int _arg [ 3 ] ) { this -> SetSampleRate ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual int * GetVOISampleRate ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << SampleRate  pointer  << this -> SampleRate ) ; return this -> SampleRate ; } VTK_WRAPEXCLUDE virtual void GetVOISampleRate ( int data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> SampleRate [ i ] ; } } ; /@} /@{ *
##  Control whether to enforce that the "boundary" of the grid is output in
##  the subsampling process. (This ivar only has effect when the SampleRate
##  in any direction is not equal to 1.) When this ivar IncludeBoundary is
##  on, the subsampling will always include the boundary of the grid even
##  though the sample rate is not an even multiple of the grid
##  dimensions. (By default IncludeBoundary is off.)
##  virtual void SetIncludeBoundary ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  IncludeBoundary  to  << _arg ) ; if ( this -> IncludeBoundary != _arg ) { this -> IncludeBoundary = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetIncludeBoundary ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IncludeBoundary  of  << this -> IncludeBoundary ) ; return this -> IncludeBoundary ; } ; virtual void IncludeBoundaryOn ( ) { this -> SetIncludeBoundary ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void IncludeBoundaryOff ( ) { this -> SetIncludeBoundary ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkExtractGrid ( ) ; ~ vtkExtractGrid ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; *
##  Implementation for RequestData using a specified VOI. This is because the
##  parallel filter needs to muck around with the VOI to get spacing and
##  partitioning to play nice. The VOI is calculated from the output
##  data object's extents in this implementation.
##  bool RequestDataImpl ( vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) ; int VOI [ 6 ] ; int SampleRate [ 3 ] ; vtkTypeBool IncludeBoundary ; vtkExtractStructuredGridHelper * Internal ; private : vtkExtractGrid ( const vtkExtractGrid & ) = delete ; void operator = ( const vtkExtractGrid & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
