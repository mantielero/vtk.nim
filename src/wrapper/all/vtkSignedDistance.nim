## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSignedDistance.h
##
##   Copyright (c) Kitware, Inc.
##   All rights reserved.
##   See LICENSE file for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkSignedDistance
##  @brief   compute signed distances from an input point cloud
##
##  vtkSignedDistance is a filter that computes signed distances over a volume
##  from an input point cloud. The input point cloud must have point normals
##  defined, as well as an optional weighting function (e.g., probabilities
##  that the point measurements are accurate). Once the signed distance
##  function is computed, then the output volume may be isocontoured to with
##  vtkExtractSurface to extract a approximating surface to the point cloud.
##
##  To use this filter, specify the input vtkPolyData (which represents the
##  point cloud); define the sampling volume; specify a radius (which limits
##  the radius of influence of each point); and set an optional point locator
##  (to accelerate proximity operations, a vtkStaticPointLocator is used by
##  default). Note that large radius values may have significant impact on
##  performance. The volume is defined by specifying dimensions in the x-y-z
##  directions, as well as a domain bounds. By default the model bounds are
##  defined from the input points, but the user can also manually specify
##  them.
##
##  This filter has one other unusual capability: it is possible to append
##  data in a sequence of operations to generate a single output. This is
##  useful when you have multiple point clouds (e.g., possibly from multiple
##  acqusition scans) and want to incrementally accumulate all the data.
##  However, the user must be careful to either specify the Bounds or
##  order the input such that the bounds of the first input completely
##  contains all other input data.  This is because the geometry and topology
##  of the output sampling volume cannot be changed after the initial Append
##  operation.
##
##  This algorithm loosely follows the most excellent paper by Curless and
##  Levoy: "A Volumetric Method for Building Complex Models from Range
##  Images." As described in this paper it may produce a signed distance
##  volume that may contain the three data states for each voxel: near
##  surface, empty, or unseen (see vtkExtractSurface for additional
##  information). Note in this implementation the initial values of the volume
##  are set to < this->Radius. This indicates that these voxels are
##  "empty". Of course voxels with value -this->Radius <= d <= this->Radius
##  are "near" the surface. (Voxels with values > this->Radius are "unseen" --
##  this filter does not produce such values.)
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @warning
##  Empty voxel values are set to -this->Radius.
##
##  @sa
##  vtkExtractSurface vtkImplicitModeller
##

## !!!Ignored construct:  # vtkSignedDistance_h [NewLine] # vtkSignedDistance_h [NewLine] # vtkFiltersPointsModule.h  For export macro # vtkImageAlgorithm.h [NewLine] class vtkPolyData ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkAbstractPointLocator"
## !!!Ignored construct:  class VTKFILTERSPOINTS_EXPORT vtkSignedDistance : public vtkImageAlgorithm { public : /@{ *
##  Standard methods for instantiating the class, providing type information,
##  and printing.
##  static vtkSignedDistance * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkSignedDistance :: IsTypeOf ( type ) ; } static vtkSignedDistance * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkSignedDistance * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkSignedDistance * NewInstance ( ) const { return vtkSignedDistance :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSignedDistance :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSignedDistance :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Set/Get the i-j-k dimensions on which to computer the distance function.
##  virtual int * GetDimensions ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Dimensions  pointer  << this -> Dimensions ) ; return this -> Dimensions ; } VTK_WRAPEXCLUDE virtual void GetDimensions ( int data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Dimensions [ i ] ; } } ; void SetDimensions ( int i , int j , int k ) ; void SetDimensions ( const int dim [ 3 ] ) ; /@} /@{ *
##  Set / get the region in space in which to perform the sampling. If
##  not specified, it will be computed automatically.
##  virtual void SetBounds ( double _arg1 , double _arg2 , double _arg3 , double _arg4 , double _arg5 , double _arg6 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Bounds  to ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; if ( ( this -> Bounds [ 0 ] != _arg1 ) || ( this -> Bounds [ 1 ] != _arg2 ) || ( this -> Bounds [ 2 ] != _arg3 ) || ( this -> Bounds [ 3 ] != _arg4 ) || ( this -> Bounds [ 4 ] != _arg5 ) || ( this -> Bounds [ 5 ] != _arg6 ) ) { this -> Bounds [ 0 ] = _arg1 ; this -> Bounds [ 1 ] = _arg2 ; this -> Bounds [ 2 ] = _arg3 ; this -> Bounds [ 3 ] = _arg4 ; this -> Bounds [ 4 ] = _arg5 ; this -> Bounds [ 5 ] = _arg6 ; this -> Modified ( ) ; } } virtual void SetBounds ( const double _arg [ 6 ] ) { this -> SetBounds ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; virtual double * GetDimensionsBounds ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Bounds  pointer  << this -> Bounds ) ; return this -> Bounds ; } VTK_WRAPEXCLUDE virtual void GetDimensionsBounds ( double data [ 6 ] ) { for ( int i = 0 ; i < 6 ; i ++ ) { data [ i ] = this -> Bounds [ i ] ; } } ; /@} /@{ *
##  Set / get the radius of influence of each point. Smaller values
##  generally improve performance markedly. Note that after the signed
##  distance function is computed, any voxel taking on the value >= Radius
##  is presumed to be "unseen" or uninitialized.
##  virtual void SetRadius ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Radius  to  << _arg ) ; if ( this -> Radius != ( _arg < 0.0 ? 0.0 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ) { this -> Radius = ( _arg < 0.0 ? 0.0 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetRadiusMinValue ( ) { return 0.0 ; } virtual double GetRadiusMaxValue ( ) { return VTK_FLOAT_MAX ; } ; virtual double GetRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Radius  of  << this -> Radius ) ; return this -> Radius ; } ; /@} /@{ *
##  Specify a point locator. By default a vtkStaticPointLocator is
##  used. The locator performs efficient searches to locate points
##  surrounding a voxel (within the specified radius).
##  void SetLocator ( vtkAbstractPointLocator * locator ) ; virtual vtkAbstractPointLocator * GetnameLocator ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Locator  address  << static_cast < vtkAbstractPointLocator * > ( this -> Locator ) ) ; return this -> Locator ; } ; /@} *
##  Initialize the filter for appending data. You must invoke the
##  StartAppend() method before doing successive Appends(). It's also a
##  good idea to manually specify the model bounds; otherwise the input
##  bounds for the data will be used.
##  void StartAppend ( ) ; *
##  Append a data set to the existing output. To use this function,
##  you'll have to invoke the StartAppend() method before doing
##  successive appends. It's also a good idea to specify the model
##  bounds; otherwise the input model bounds is used. When you've
##  finished appending, use the EndAppend() method.
##  void Append ( vtkPolyData * input ) ; *
##  Method completes the append process.
##  void EndAppend ( ) ;  See the vtkAlgorithm for a description of what these do vtkTypeBool ProcessRequest ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; protected : vtkSignedDistance ( ) ; ~ vtkSignedDistance ( ) override ; int Dimensions [ 3 ] ; double Bounds [ 6 ] ; double Radius ; vtkAbstractPointLocator * Locator ;  Flag tracks whether process needs initialization int Initialized ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int , vtkInformation * ) override ; private : vtkSignedDistance ( const vtkSignedDistance & ) = delete ; void operator = ( const vtkSignedDistance & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
