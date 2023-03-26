## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPointOccupancyFilter.h
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
##  @class   vtkPointOccupancyFilter
##  @brief   produce occupancy bit mask from input point cloud
##
##  vtkPointOccupancyFilter is a filter that generates an occupancy mask on a
##  volume from a point cloud. The output of the filter is an image/volume
##  that indicates for each pixel/voxel whether a point exists within the
##  pixel/voxel.
##
##  To use this filter, specify an input of type vtkPointSet (i.e., has an
##  explicit representation of points). Then define the occupancy volume by
##  specifying the sample dimensions and bounds. Optionally you can specify
##  unsigned char values used to indicate whether a voxel is empty or occupied.
##
##  @warning
##  During processing, if a point is found to be outside of the occupancy volume,
##  then it is skipped (i.e., it does not affect the occupancy mask).
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @sa
##  vtkPointDensityFilter vtkPointMaskFilter
##

## !!!Ignored construct:  # vtkPointOccupancyFilter_h [NewLine] # vtkPointOccupancyFilter_h [NewLine] # vtkFiltersPointsModule.h  For export macro # vtkImageAlgorithm.h [NewLine] class VTKFILTERSPOINTS_EXPORT vtkPointOccupancyFilter : public vtkImageAlgorithm { public : /@{ *
##  Standard methods for instantiating, obtaining type information, and
##  printing information.
##  static vtkPointOccupancyFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPointOccupancyFilter :: IsTypeOf ( type ) ; } static vtkPointOccupancyFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPointOccupancyFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPointOccupancyFilter * NewInstance ( ) const { return vtkPointOccupancyFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPointOccupancyFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPointOccupancyFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Set / get the dimensions of the occupancy volume. Higher values generally
##  produce better results but may be much slower.
##  void SetSampleDimensions ( int i , int j , int k ) ; void SetSampleDimensions ( int dim [ 3 ] ) ; virtual int * GetSampleDimensions ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << SampleDimensions  pointer  << this -> SampleDimensions ) ; return this -> SampleDimensions ; } VTK_WRAPEXCLUDE virtual void GetSampleDimensions ( int data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> SampleDimensions [ i ] ; } } ; /@} /@{ *
##  Set / get the (xmin,xmax, ymin,ymax, zmin,zmax) bounding box in which
##  the sampling is performed. If any of the (min,max) bounds values are
##  min >= max, then the bounds will be computed automatically from the input
##  data. Otherwise, the user-specified bounds will be used.
##  virtual void SetModelBounds ( double _arg1 , double _arg2 , double _arg3 , double _arg4 , double _arg5 , double _arg6 ) { vtkDebugWithObjectMacro ( this , <<  setting  << ModelBounds  to ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; if ( ( this -> ModelBounds [ 0 ] != _arg1 ) || ( this -> ModelBounds [ 1 ] != _arg2 ) || ( this -> ModelBounds [ 2 ] != _arg3 ) || ( this -> ModelBounds [ 3 ] != _arg4 ) || ( this -> ModelBounds [ 4 ] != _arg5 ) || ( this -> ModelBounds [ 5 ] != _arg6 ) ) { this -> ModelBounds [ 0 ] = _arg1 ; this -> ModelBounds [ 1 ] = _arg2 ; this -> ModelBounds [ 2 ] = _arg3 ; this -> ModelBounds [ 3 ] = _arg4 ; this -> ModelBounds [ 4 ] = _arg5 ; this -> ModelBounds [ 5 ] = _arg6 ; this -> Modified ( ) ; } } virtual void SetModelBounds ( const double _arg [ 6 ] ) { this -> SetModelBounds ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; virtual double * GetSampleDimensionsModelBounds ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ModelBounds  pointer  << this -> ModelBounds ) ; return this -> ModelBounds ; } VTK_WRAPEXCLUDE virtual void GetSampleDimensionsModelBounds ( double data [ 6 ] ) { for ( int i = 0 ; i < 6 ; i ++ ) { data [ i ] = this -> ModelBounds [ i ] ; } } ; /@} /@{ *
##  Set / get the values indicating whether a voxel is empty (i.e., does not
##  contain any points) or occupied. By default, an empty voxel has a zero
##  value; an occupied voxel has a value of one.
##  virtual void SetEmptyValue ( unsigned char _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  EmptyValue  to  << _arg ) ; if ( this -> EmptyValue != _arg ) { this -> EmptyValue = _arg ; this -> Modified ( ) ; } } ; virtual unsigned char GetEmptyValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EmptyValue  of  << this -> EmptyValue ) ; return this -> EmptyValue ; } ; virtual void SetEmptyValueOccupiedValue ( unsigned char _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OccupiedValue  to  << _arg ) ; if ( this -> OccupiedValue != _arg ) { this -> OccupiedValue = _arg ; this -> Modified ( ) ; } } ; virtual unsigned char GetEmptyValueOccupiedValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OccupiedValue  of  << this -> OccupiedValue ) ; return this -> OccupiedValue ; } ; /@} protected : vtkPointOccupancyFilter ( ) ; ~ vtkPointOccupancyFilter ( ) override ; int SampleDimensions [ 3 ] ;  dimensions of volume over which to compute occupancy double ModelBounds [ 6 ] ;  bounding box defining image double Origin [ 3 ] , Spacing [ 3 ] ;  output geometry unsigned char EmptyValue ;  what value indicates a voxel is empty unsigned char OccupiedValue ;  what value indicates a voxel is occupied int FillInputPortInformation ( int port , vtkInformation * info ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; void ComputeModelBounds ( vtkDataSet * input , vtkImageData * output , vtkInformation * outInfo ) ; private : vtkPointOccupancyFilter ( const vtkPointOccupancyFilter & ) = delete ; void operator = ( const vtkPointOccupancyFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
