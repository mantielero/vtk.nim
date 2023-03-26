## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkUnsignedDistance.h
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
##  @class   vtkUnsignedDistance
##  @brief   compute unsigned (i.e., non-negative) distances from an input point cloud
##
##  vtkUnsignedDistance is a filter that computes non-negative (i.e., unsigned)
##  distances over a volume from an input point cloud. This filter is distinct
##  from vtkSignedDistance in that it does not require point normals. However,
##  isocontouring a zero-valued distance function (e.g., trying to fit a
##  surface will produce unsatisfactory results). Rather this filter, when
##  combined with an isocontouring filter such as vtkFlyingEdges3D, can
##  produce an offset, bounding surface surrounding the input point cloud.
##
##  To use this filter, specify the input vtkPolyData (which represents the
##  point cloud); define the sampling volume; specify a radius (which limits
##  the radius of influence of each point); and set an optional point locator
##  (to accelerate proximity operations, a vtkStaticPointLocator is used by
##  default). Note that large radius values may have significant impact on
##  performance. The volume is defined by specifying dimensions in the x-y-z
##  directions, as well as a domain bounds. By default the model bounds are
##  defined from the input points, but the user can also manually specify
##  them. Finally, because the radius data member limits the influence of the
##  distance calculation, some voxels may receive no contribution. These voxel
##  values are set to the CapValue.
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
##  @warning
##  Note that multiple, non-connected surfaces may be produced. For example,
##  if the point cloud is from the surface of the sphere, it is possible to
##  generate two surfaces (with isocontouring): one inside the sphere, one
##  outside the sphere. It is sometimes possible to select the surface you
##  want from the output of the contouring filter by using
##  vtkPolyDataConnectivityFilter.
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @sa
##  vtkSignedDistance vtkExtractSurface vtkImplicitModeller
##

## !!!Ignored construct:  # vtkUnsignedDistance_h [NewLine] # vtkUnsignedDistance_h [NewLine] # vtkFiltersPointsModule.h  For export macro # vtkImageAlgorithm.h [NewLine] class vtkPolyData ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkAbstractPointLocator"
## !!!Ignored construct:  class VTKFILTERSPOINTS_EXPORT vtkUnsignedDistance : public vtkImageAlgorithm { public : /@{ *
##  Standard methods for instantiating the class, providing type information,
##  and printing.
##  static vtkUnsignedDistance * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkUnsignedDistance :: IsTypeOf ( type ) ; } static vtkUnsignedDistance * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkUnsignedDistance * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkUnsignedDistance * NewInstance ( ) const { return vtkUnsignedDistance :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkUnsignedDistance :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkUnsignedDistance :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Set/Get the i-j-k dimensions on which to computer the distance function.
##  virtual int * GetDimensions ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Dimensions  pointer  << this -> Dimensions ) ; return this -> Dimensions ; } VTK_WRAPEXCLUDE virtual void GetDimensions ( int data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Dimensions [ i ] ; } } ; void SetDimensions ( int i , int j , int k ) ; void SetDimensions ( const int dim [ 3 ] ) ; /@} /@{ *
##  Set / get the region in space in which to perform the sampling. If
##  not specified, it will be computed automatically.
##  virtual void SetBounds ( double _arg1 , double _arg2 , double _arg3 , double _arg4 , double _arg5 , double _arg6 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Bounds  to ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; if ( ( this -> Bounds [ 0 ] != _arg1 ) || ( this -> Bounds [ 1 ] != _arg2 ) || ( this -> Bounds [ 2 ] != _arg3 ) || ( this -> Bounds [ 3 ] != _arg4 ) || ( this -> Bounds [ 4 ] != _arg5 ) || ( this -> Bounds [ 5 ] != _arg6 ) ) { this -> Bounds [ 0 ] = _arg1 ; this -> Bounds [ 1 ] = _arg2 ; this -> Bounds [ 2 ] = _arg3 ; this -> Bounds [ 3 ] = _arg4 ; this -> Bounds [ 4 ] = _arg5 ; this -> Bounds [ 5 ] = _arg6 ; this -> Modified ( ) ; } } virtual void SetBounds ( const double _arg [ 6 ] ) { this -> SetBounds ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; virtual double * GetDimensionsBounds ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Bounds  pointer  << this -> Bounds ) ; return this -> Bounds ; } VTK_WRAPEXCLUDE virtual void GetDimensionsBounds ( double data [ 6 ] ) { for ( int i = 0 ; i < 6 ; i ++ ) { data [ i ] = this -> Bounds [ i ] ; } } ; /@} /@{ *
##  Control how the model bounds are computed. If the ivar AdjustBounds
##  is set, then the bounds specified (or computed automatically) is modified
##  by the fraction given by AdjustDistance. This means that the model
##  bounds is expanded in each of the x-y-z directions.
##  virtual void SetAdjustBounds ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  AdjustBounds  to  << _arg ) ; if ( this -> AdjustBounds != _arg ) { this -> AdjustBounds = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetAdjustBounds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AdjustBounds  of  << this -> AdjustBounds ) ; return this -> AdjustBounds ; } ; virtual void AdjustBoundsOn ( ) { this -> SetAdjustBounds ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void AdjustBoundsOff ( ) { this -> SetAdjustBounds ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify the amount to grow the model bounds (if the ivar AdjustBounds
##  is set). The value is a fraction of the maximum length of the sides
##  of the box specified by the model bounds.
##  virtual void SetAdjustDistance ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << AdjustDistance  to  << _arg ) ; if ( this -> AdjustDistance != ( _arg < - 1.0 ? - 1.0 : ( _arg > 1.0 ? 1.0 : _arg ) ) ) { this -> AdjustDistance = ( _arg < - 1.0 ? - 1.0 : ( _arg > 1.0 ? 1.0 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetAdjustDistanceMinValue ( ) { return - 1.0 ; } virtual double GetAdjustDistanceMaxValue ( ) { return 1.0 ; } ; virtual double GetAdjustBoundsAdjustDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AdjustDistance  of  << this -> AdjustDistance ) ; return this -> AdjustDistance ; } ; /@} /@{ *
##  Set / get the radius of influence of each point. Smaller values
##  generally improve performance markedly.
##  virtual void SetAdjustDistanceRadius ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Radius  to  << _arg ) ; if ( this -> Radius != ( _arg < 0.0 ? 0.0 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ) { this -> Radius = ( _arg < 0.0 ? 0.0 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetAdjustDistanceMinValueRadiusMinValue ( ) { return 0.0 ; } virtual double GetAdjustDistanceMaxValueRadiusMaxValue ( ) { return VTK_FLOAT_MAX ; } ; virtual double GetAdjustBoundsAdjustDistanceRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Radius  of  << this -> Radius ) ; return this -> Radius ; } ; /@} /@{ *
##  Specify a point locator. By default a vtkStaticPointLocator is
##  used. The locator performs efficient searches to locate points
##  surrounding a voxel (within the specified radius).
##  void SetLocator ( vtkAbstractPointLocator * locator ) ; virtual vtkAbstractPointLocator * GetnameLocator ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Locator  address  << static_cast < vtkAbstractPointLocator * > ( this -> Locator ) ) ; return this -> Locator ; } ; /@} /@{ *
##  The outer boundary of the volume can be assigned a particular value
##  after distances are computed. This can be used to close or "cap" all
##  surfaces during isocontouring.
##  virtual void SetAdjustBoundsCapping ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Capping  to  << _arg ) ; if ( this -> Capping != _arg ) { this -> Capping = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetAdjustBoundsAdjustDistanceRadiusCapping ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Capping  of  << this -> Capping ) ; return this -> Capping ; } ; virtual void CappingOn ( ) { this -> SetAdjustBoundsCapping ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void CappingOff ( ) { this -> SetAdjustBoundsCapping ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify the capping value to use. The CapValue is also used as an
##  initial distance value at each point in the dataset. By default, the
##  CapValue is VTK_FLOAT_MAX;
##  virtual void SetAdjustBoundsCappingCapValue ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CapValue  to  << _arg ) ; if ( this -> CapValue != _arg ) { this -> CapValue = _arg ; this -> Modified ( ) ; } } ; virtual double GetAdjustBoundsAdjustDistanceRadiusCappingCapValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CapValue  of  << this -> CapValue ) ; return this -> CapValue ; } ; /@} /@{ *
##  Set the desired output scalar type. Currently only real types are
##  supported. By default, VTK_FLOAT scalars are created.
##  virtual void SetAdjustBoundsCappingCapValueOutputScalarType ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutputScalarType  to  << _arg ) ; if ( this -> OutputScalarType != _arg ) { this -> OutputScalarType = _arg ; this -> Modified ( ) ; } } ; virtual int GetAdjustBoundsAdjustDistanceRadiusCappingCapValueOutputScalarType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputScalarType  of  << this -> OutputScalarType ) ; return this -> OutputScalarType ; } ; void SetOutputScalarTypeToFloat ( ) { this -> SetOutputScalarType ( VTK_FLOAT ) ; } void SetOutputScalarTypeToDouble ( ) { this -> SetOutputScalarType ( VTK_DOUBLE ) ; } /@} *
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
##  void EndAppend ( ) ;  See the vtkAlgorithm for a description of what these do vtkTypeBool ProcessRequest ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; protected : vtkUnsignedDistance ( ) ; ~ vtkUnsignedDistance ( ) override ; int Dimensions [ 3 ] ; double Bounds [ 6 ] ; vtkTypeBool AdjustBounds ; double AdjustDistance ; double Radius ; vtkAbstractPointLocator * Locator ; vtkTypeBool Capping ; double CapValue ; int OutputScalarType ;  Flag tracks whether process needs initialization int Initialized ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int , vtkInformation * ) override ; private : vtkUnsignedDistance ( const vtkUnsignedDistance & ) = delete ; void operator = ( const vtkUnsignedDistance & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
