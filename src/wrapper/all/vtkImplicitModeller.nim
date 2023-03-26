## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImplicitModeller.h
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
##  @class   vtkImplicitModeller
##  @brief   compute distance from input geometry on structured point dataset
##
##  vtkImplicitModeller is a filter that computes the distance from the input
##  geometry to the points of an output structured point set. This distance
##  function can then be "contoured" to generate new, offset surfaces from
##  the original geometry. An important feature of this object is
##  "capping". If capping is turned on, after the implicit model is created,
##  the values on the boundary of the structured points dataset are set to
##  the cap value. This is used to force closure of the resulting contoured
##  surface. Note, however, that large cap values can generate weird surface
##  normals in those cells adjacent to the boundary of the dataset. Using
##  smaller cap value will reduce this effect.
##  <P>
##  Another important ivar is MaximumDistance. This controls how far into the
##  volume the distance function is computed from the input geometry.  Small
##  values give significant increases in performance. However, there can
##  strange sampling effects at the extreme range of the MaximumDistance.
##  <P>
##  In order to properly execute and sample the input data, a rectangular
##  region in space must be defined (this is the ivar ModelBounds).  If not
##  explicitly defined, the model bounds will be computed. Note that to avoid
##  boundary effects, it is possible to adjust the model bounds (i.e., using
##  the AdjustBounds and AdjustDistance ivars) to strictly contain the
##  sampled data.
##  <P>
##  This filter has one other unusual capability: it is possible to append
##  data in a sequence of operations to generate a single output. This is
##  useful when you have multiple datasets and want to create a
##  conglomeration of all the data.  However, the user must be careful to
##  either specify the ModelBounds or specify the first item such that its
##  bounds completely contain all other items.  This is because the
##  rectangular region of the output can not be changed after the 1st Append.
##  <P>
##  The ProcessMode ivar controls the method used within the Append function
##  (where the actual work is done regardless if the Append function is
##  explicitly called) to compute the implicit model.  If set to work in voxel
##  mode, each voxel is visited once.  If set to cell mode, each cell is visited
##  once.  Tests have shown once per voxel to be faster when there are a
##  lot of cells (at least a thousand?); relative performance improvement
##  increases with addition cells. Primitives should not be stripped for best
##  performance of the voxel mode.  Also, if explicitly using the Append feature
##  many times, the cell mode will probably be better because each voxel will be
##  visited each Append.  Append the data before input if possible when using
##  the voxel mode.  Do not switch between voxel and cell mode between execution
##  of StartAppend and EndAppend.
##  <P>
##  Further performance improvement is now possible using the PerVoxel process
##  mode on multi-processor machines (the mode is now multithreaded).  Each
##  thread processes a different "slab" of the output.  Also, if the input is
##  vtkPolyData, it is appropriately clipped for each thread; that is, each
##  thread only considers the input which could affect its slab of the output.
##  <P>
##  This filter can now produce output of any type supported by vtkImageData.
##  However to support this change, additional sqrts must be executed during the
##  Append step.  Previously, the output was initialized to the squared CapValue
##  in StartAppend, the output was updated with squared distance values during
##  the Append, and then the sqrt of the distances was computed in EndAppend.
##  To support different scalar types in the output (largely to reduce memory
##  requirements as an vtkImageShiftScale and/or vtkImageCast could have
##  achieved the same result), we can't "afford" to save squared value in the
##  output, because then we could only represent up to the sqrt of the scalar
##  max for an integer type in the output; 1 (instead of 255) for an unsigned
##  char; 11 for a char (instead of 127).  Thus this change may result in a
##  minor performance degradation.  Non-float output types can be scaled to the
##  CapValue by turning ScaleToMaximumDistance On.
##
##  @sa
##  vtkSampleFunction vtkContourFilter
##

## !!!Ignored construct:  # vtkImplicitModeller_h [NewLine] # vtkImplicitModeller_h [NewLine] # vtkFiltersHybridModule.h  For export macro # vtkImageAlgorithm.h [NewLine] # vtkThreads.h  for VTK_MAX_THREADS [NewLine] # VTK_VOXEL_MODE 0 [NewLine] # VTK_CELL_MODE 1 [NewLine] class vtkDataArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkExtractGeometry"
discard "forward decl of vtkMultiThreader"
## !!!Ignored construct:  class VTKFILTERSHYBRID_EXPORT vtkImplicitModeller : public vtkImageAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImplicitModeller :: IsTypeOf ( type ) ; } static vtkImplicitModeller * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImplicitModeller * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImplicitModeller * NewInstance ( ) const { return vtkImplicitModeller :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImplicitModeller :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImplicitModeller :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct with sample dimensions=(50,50,50), and so that model bounds are
##  automatically computed from the input. Capping is turned on with CapValue
##  equal to a large positive number.
##  static vtkImplicitModeller * New ( ) ; *
##  Compute ModelBounds from input geometry. If input is not specified, the
##  input of the filter will be used.
##  double ComputeModelBounds ( vtkDataSet * input = nullptr ) ; /@{ *
##  Set/Get the i-j-k dimensions on which to sample distance function.
##  virtual int * GetSampleDimensions ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << SampleDimensions  pointer  << this -> SampleDimensions ) ; return this -> SampleDimensions ; } VTK_WRAPEXCLUDE virtual void GetSampleDimensions ( int data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> SampleDimensions [ i ] ; } } ; void SetSampleDimensions ( int i , int j , int k ) ; void SetSampleDimensions ( int dim [ 3 ] ) ; /@} /@{ *
##  Set / get the distance away from surface of input geometry to
##  sample. This value is specified as a percentage of the length of
##  the diagonal of the input data bounding box.
##  Smaller values make large increases in performance.
##  virtual void SetMaximumDistance ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << MaximumDistance  to  << _arg ) ; if ( this -> MaximumDistance != ( _arg < 0.0 ? 0.0 : ( _arg > 1.0 ? 1.0 : _arg ) ) ) { this -> MaximumDistance = ( _arg < 0.0 ? 0.0 : ( _arg > 1.0 ? 1.0 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetMaximumDistanceMinValue ( ) { return 0.0 ; } virtual double GetMaximumDistanceMaxValue ( ) { return 1.0 ; } ; virtual double GetMaximumDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumDistance  of  << this -> MaximumDistance ) ; return this -> MaximumDistance ; } ; /@} /@{ *
##  Set / get the region in space in which to perform the sampling. If
##  not specified, it will be computed automatically.
##  virtual void SetModelBounds ( double _arg1 , double _arg2 , double _arg3 , double _arg4 , double _arg5 , double _arg6 ) { vtkDebugWithObjectMacro ( this , <<  setting  << ModelBounds  to ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; if ( ( this -> ModelBounds [ 0 ] != _arg1 ) || ( this -> ModelBounds [ 1 ] != _arg2 ) || ( this -> ModelBounds [ 2 ] != _arg3 ) || ( this -> ModelBounds [ 3 ] != _arg4 ) || ( this -> ModelBounds [ 4 ] != _arg5 ) || ( this -> ModelBounds [ 5 ] != _arg6 ) ) { this -> ModelBounds [ 0 ] = _arg1 ; this -> ModelBounds [ 1 ] = _arg2 ; this -> ModelBounds [ 2 ] = _arg3 ; this -> ModelBounds [ 3 ] = _arg4 ; this -> ModelBounds [ 4 ] = _arg5 ; this -> ModelBounds [ 5 ] = _arg6 ; this -> Modified ( ) ; } } virtual void SetModelBounds ( const double _arg [ 6 ] ) { this -> SetModelBounds ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; virtual double * GetSampleDimensionsModelBounds ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ModelBounds  pointer  << this -> ModelBounds ) ; return this -> ModelBounds ; } VTK_WRAPEXCLUDE virtual void GetSampleDimensionsModelBounds ( double data [ 6 ] ) { for ( int i = 0 ; i < 6 ; i ++ ) { data [ i ] = this -> ModelBounds [ i ] ; } } ; /@} /@{ *
##  Control how the model bounds are computed. If the ivar AdjustBounds
##  is set, then the bounds specified (or computed automatically) is modified
##  by the fraction given by AdjustDistance. This means that the model
##  bounds is expanded in each of the x-y-z directions.
##  virtual void SetAdjustBounds ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  AdjustBounds  to  << _arg ) ; if ( this -> AdjustBounds != _arg ) { this -> AdjustBounds = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetMaximumDistanceAdjustBounds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AdjustBounds  of  << this -> AdjustBounds ) ; return this -> AdjustBounds ; } ; virtual void AdjustBoundsOn ( ) { this -> SetAdjustBounds ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void AdjustBoundsOff ( ) { this -> SetAdjustBounds ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify the amount to grow the model bounds (if the ivar AdjustBounds
##  is set). The value is a fraction of the maximum length of the sides
##  of the box specified by the model bounds.
##  virtual void SetMaximumDistanceAdjustDistance ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << AdjustDistance  to  << _arg ) ; if ( this -> AdjustDistance != ( _arg < - 1.0 ? - 1.0 : ( _arg > 1.0 ? 1.0 : _arg ) ) ) { this -> AdjustDistance = ( _arg < - 1.0 ? - 1.0 : ( _arg > 1.0 ? 1.0 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetMaximumDistanceMinValueAdjustDistanceMinValue ( ) { return - 1.0 ; } virtual double GetMaximumDistanceMaxValueAdjustDistanceMaxValue ( ) { return 1.0 ; } ; virtual double GetMaximumDistanceAdjustBoundsAdjustDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AdjustDistance  of  << this -> AdjustDistance ) ; return this -> AdjustDistance ; } ; /@} /@{ *
##  The outer boundary of the structured point set can be assigned a
##  particular value. This can be used to close or "cap" all surfaces.
##  virtual void SetAdjustBoundsCapping ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Capping  to  << _arg ) ; if ( this -> Capping != _arg ) { this -> Capping = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetMaximumDistanceAdjustBoundsAdjustDistanceCapping ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Capping  of  << this -> Capping ) ; return this -> Capping ; } ; virtual void CappingOn ( ) { this -> SetAdjustBoundsCapping ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void CappingOff ( ) { this -> SetAdjustBoundsCapping ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify the capping value to use. The CapValue is also used as an
##  initial distance value at each point in the dataset.
##  void SetCapValue ( double value ) ; virtual double GetMaximumDistanceAdjustBoundsAdjustDistanceCappingCapValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CapValue  of  << this -> CapValue ) ; return this -> CapValue ; } ; /@} /@{ *
##  If a non-floating output type is specified, the output distances can be
##  scaled to use the entire positive scalar range of the output type
##  specified (up to the CapValue which is equal to the max for the type
##  unless modified by the user).  For example, if ScaleToMaximumDistance
##  is On and the OutputScalarType is UnsignedChar the distances saved in the
##  output would be linearly scaled between 0 (for distances "very close" to
##  the surface) and 255 (at the specified maximum distance)... assuming the
##  CapValue is not changed from 255.
##  virtual void SetAdjustBoundsCappingScaleToMaximumDistance ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ScaleToMaximumDistance  to  << _arg ) ; if ( this -> ScaleToMaximumDistance != _arg ) { this -> ScaleToMaximumDistance = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetMaximumDistanceAdjustBoundsAdjustDistanceCappingCapValueScaleToMaximumDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScaleToMaximumDistance  of  << this -> ScaleToMaximumDistance ) ; return this -> ScaleToMaximumDistance ; } ; virtual void ScaleToMaximumDistanceOn ( ) { this -> SetAdjustBoundsCappingScaleToMaximumDistance ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ScaleToMaximumDistanceOff ( ) { this -> SetAdjustBoundsCappingScaleToMaximumDistance ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify whether to visit each cell once per append or each voxel once
##  per append.  Some tests have shown once per voxel to be faster
##  when there are a lot of cells (at least a thousand?); relative
##  performance improvement increases with addition cells.  Primitives
##  should not be stripped for best performance of the voxel mode.
##  virtual void SetMaximumDistanceAdjustDistanceProcessMode ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ProcessMode  to  << _arg ) ; if ( this -> ProcessMode != ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ) { this -> ProcessMode = ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetMaximumDistanceMinValueAdjustDistanceMinValueProcessModeMinValue ( ) { return 0 ; } virtual int GetMaximumDistanceMaxValueAdjustDistanceMaxValueProcessModeMaxValue ( ) { return 1 ; } ; virtual int GetMaximumDistanceAdjustBoundsAdjustDistanceCappingCapValueScaleToMaximumDistanceProcessMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ProcessMode  of  << this -> ProcessMode ) ; return this -> ProcessMode ; } ; void SetProcessModeToPerVoxel ( ) { this -> SetProcessMode ( VTK_VOXEL_MODE ) ; } void SetProcessModeToPerCell ( ) { this -> SetProcessMode ( VTK_CELL_MODE ) ; } const char * GetProcessModeAsString ( void ) ; /@} /@{ *
##  Specify the level of the locator to use when using the per voxel
##  process mode.
##  virtual void SetAdjustBoundsCappingScaleToMaximumDistanceLocatorMaxLevel ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  LocatorMaxLevel  to  << _arg ) ; if ( this -> LocatorMaxLevel != _arg ) { this -> LocatorMaxLevel = _arg ; this -> Modified ( ) ; } } ; virtual int GetMaximumDistanceAdjustBoundsAdjustDistanceCappingCapValueScaleToMaximumDistanceProcessModeLocatorMaxLevel ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LocatorMaxLevel  of  << this -> LocatorMaxLevel ) ; return this -> LocatorMaxLevel ; } ; /@} /@{ *
##  Set / Get the number of threads used during Per-Voxel processing mode
##  virtual void SetMaximumDistanceAdjustDistanceProcessModeNumberOfThreads ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << NumberOfThreads  to  << _arg ) ; if ( this -> NumberOfThreads != ( _arg < 1 ? 1 : ( _arg > VTK_MAX_THREADS ? VTK_MAX_THREADS : _arg ) ) ) { this -> NumberOfThreads = ( _arg < 1 ? 1 : ( _arg > VTK_MAX_THREADS ? VTK_MAX_THREADS : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetMaximumDistanceMinValueAdjustDistanceMinValueProcessModeMinValueNumberOfThreadsMinValue ( ) { return 1 ; } virtual int GetMaximumDistanceMaxValueAdjustDistanceMaxValueProcessModeMaxValueNumberOfThreadsMaxValue ( ) { return VTK_MAX_THREADS ; } ; virtual int GetMaximumDistanceAdjustBoundsAdjustDistanceCappingCapValueScaleToMaximumDistanceProcessModeLocatorMaxLevelNumberOfThreads ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfThreads  of  << this -> NumberOfThreads ) ; return this -> NumberOfThreads ; } ; /@} /@{ *
##  Set the desired output scalar type.
##  void SetOutputScalarType ( int type ) ; virtual int GetMaximumDistanceAdjustBoundsAdjustDistanceCappingCapValueScaleToMaximumDistanceProcessModeLocatorMaxLevelNumberOfThreadsOutputScalarType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputScalarType  of  << this -> OutputScalarType ) ; return this -> OutputScalarType ; } ; void SetOutputScalarTypeToFloat ( ) { this -> SetOutputScalarType ( VTK_FLOAT ) ; } void SetOutputScalarTypeToDouble ( ) { this -> SetOutputScalarType ( VTK_DOUBLE ) ; } void SetOutputScalarTypeToInt ( ) { this -> SetOutputScalarType ( VTK_INT ) ; } void SetOutputScalarTypeToUnsignedInt ( ) { this -> SetOutputScalarType ( VTK_UNSIGNED_INT ) ; } void SetOutputScalarTypeToLong ( ) { this -> SetOutputScalarType ( VTK_LONG ) ; } void SetOutputScalarTypeToUnsignedLong ( ) { this -> SetOutputScalarType ( VTK_UNSIGNED_LONG ) ; } void SetOutputScalarTypeToShort ( ) { this -> SetOutputScalarType ( VTK_SHORT ) ; } void SetOutputScalarTypeToUnsignedShort ( ) { this -> SetOutputScalarType ( VTK_UNSIGNED_SHORT ) ; } void SetOutputScalarTypeToUnsignedChar ( ) { this -> SetOutputScalarType ( VTK_UNSIGNED_CHAR ) ; } void SetOutputScalarTypeToChar ( ) { this -> SetOutputScalarType ( VTK_CHAR ) ; } /@} *
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
##  void Append ( vtkDataSet * input ) ; *
##  Method completes the append process.
##  void EndAppend ( ) ;  See the vtkAlgorithm for a description of what these do vtkTypeBool ProcessRequest ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; protected : vtkImplicitModeller ( ) ; ~ vtkImplicitModeller ( ) override ; double GetScalarTypeMax ( int type ) ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; void StartAppend ( int internal ) ; void Cap ( vtkDataArray * s ) ; vtkMultiThreader * Threader ; int NumberOfThreads ; int SampleDimensions [ 3 ] ; double MaximumDistance ; double ModelBounds [ 6 ] ; vtkTypeBool Capping ; double CapValue ; int DataAppended ; vtkTypeBool AdjustBounds ; double AdjustDistance ; int ProcessMode ; int LocatorMaxLevel ; int OutputScalarType ; vtkTypeBool ScaleToMaximumDistance ;  flag to limit to one ComputeModelBounds per StartAppend int BoundsComputed ;  the max distance computed during that one call double InternalMaxDistance ; int FillInputPortInformation ( int , vtkInformation * ) override ; private : vtkImplicitModeller ( const vtkImplicitModeller & ) = delete ; void operator = ( const vtkImplicitModeller & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
