## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkShepardMethod.h
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
##  @class   vtkShepardMethod
##  @brief   interpolate points and associated scalars onto volume
##  using the method of Shepard
##
##
##  vtkShepardMethod is a filter used to interpolate point scalar values using
##  Shepard's method. The method works by resampling the scalars associated
##  with points defined on an arbitrary dataset onto a volume (i.e.,
##  structured points) dataset. The influence functions are described as
##  "inverse distance weighted". Once the interpolation is performed across
##  the volume, the usual volume visualization techniques (e.g.,
##  iso-contouring or volume rendering) can be used.
##
##  Note that this implementation also provides the ability to specify the
##  power parameter p. Given the generalized Inverse Distance Weighting (IDW)
##  function with distance between points measured as d(x,xi), p is defined
##  as:
##  <pre>
##  u(x) = Sum(wi(x) * ui) / Sum(wi(x)) if d(x,xi) != 0
##  u(x) = ui                           if d(x,xi) == 0
##
##  where wi(x) = 1 / (d(x,xi)^p
##  </pre>
##  Typically p=2, so the weights wi(x) are the inverse of the distance
##  squared. However, power parameters > 2 can be used which assign higher
##  weights for data closer to the interpolated point; or <2 which assigns
##  greater weight to points further away. (Note that if p!=2, performance may
##  be significantly impacted as the algorithm is tuned for p=2.)
##
##  @warning
##  Strictly speaking, this is a modified Shepard's methodsince only points
##  within the MaxiumDistance are used for interpolation. By setting the
##  maximum distance to include the entire bounding box and therefore all
##  points, the class executes much slower but incorporates all points into
##  the interpolation process (i.e., a pure Shepard method).
##
##  @warning
##  The input to this filter is any dataset type. This filter can be used to
##  resample the points of any type of dataset onto the output volume; i.e.,
##  the input data need not be unstructured with explicit point
##  representations.
##
##  @warning
##  The bounds of the data (i.e., the sample space) is automatically computed
##  if not set by the user.
##
##  @warning
##  If you use a maximum distance less than 1.0 (i.e., using a modified
##  Shephard's method), some output points may never receive a
##  contribution. The final value of these points can be specified with the
##  "NullValue" instance variable.
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @sa
##  vtkGaussianSplatter vtkCheckerboardSplatter
##

## !!!Ignored construct:  # vtkShepardMethod_h [NewLine] # vtkShepardMethod_h [NewLine] # vtkImageAlgorithm.h [NewLine] # vtkImagingHybridModule.h  For export macro [NewLine] class VTKIMAGINGHYBRID_EXPORT vtkShepardMethod : public vtkImageAlgorithm { public : /@{ *
##  Standard type and print methods.
##  protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkShepardMethod :: IsTypeOf ( type ) ; } static vtkShepardMethod * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkShepardMethod * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkShepardMethod * NewInstance ( ) const { return vtkShepardMethod :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkShepardMethod :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkShepardMethod :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  Construct with sample dimensions=(50,50,50) and so that model bounds are
##  automatically computed from the input. The null value for each unvisited
##  output point is 0.0. Maximum distance is 0.25. Power parameter p=2.
##  static vtkShepardMethod * New ( ) ; *
##  Set the i-j-k dimensions on which to interpolate the input points.
##  void SetSampleDimensions ( int i , int j , int k ) ; *
##  Set the i-j-k dimensions on which to sample the input points.
##  void SetSampleDimensions ( int dim [ 3 ] ) ; /@{ *
##  Retrieve the i-j-k dimensions on which to interpolate the input points.
##  virtual int * GetSampleDimensions ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << SampleDimensions  pointer  << this -> SampleDimensions ) ; return this -> SampleDimensions ; } VTK_WRAPEXCLUDE virtual void GetSampleDimensions ( int data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> SampleDimensions [ i ] ; } } ; /@} /@{ *
##  Specify the maximum influence distance of each input point. This
##  distance is a fraction of the length of the diagonal of the sample
##  space. Thus, values of 1.0 will cause each input point to influence all
##  points in the volume dataset. Values less than 1.0 can improve
##  performance significantly. By default the maximum distance is 0.25.
##  virtual void SetMaximumDistance ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << MaximumDistance  to  << _arg ) ; if ( this -> MaximumDistance != ( _arg < 0.0 ? 0.0 : ( _arg > 1.0 ? 1.0 : _arg ) ) ) { this -> MaximumDistance = ( _arg < 0.0 ? 0.0 : ( _arg > 1.0 ? 1.0 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetMaximumDistanceMinValue ( ) { return 0.0 ; } virtual double GetMaximumDistanceMaxValue ( ) { return 1.0 ; } ; virtual double GetMaximumDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumDistance  of  << this -> MaximumDistance ) ; return this -> MaximumDistance ; } ; /@} /@{ *
##  Set the value for output points not receiving a contribution from any
##  input point(s). Output points may not receive a contribution when the
##  MaximumDistance < 1.
##  virtual void SetNullValue ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NullValue  to  << _arg ) ; if ( this -> NullValue != _arg ) { this -> NullValue = _arg ; this -> Modified ( ) ; } } ; virtual double GetMaximumDistanceNullValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NullValue  of  << this -> NullValue ) ; return this -> NullValue ; } ; /@} /@{ *
##  Specify the position in space to perform the sampling. The ModelBounds
##  and SampleDimensions together define the output volume. (Note: if the
##  ModelBounds are set to an invalid state [zero or negative volume] then
##  the bounds are computed automatically.)
##  virtual void SetModelBounds ( double _arg1 , double _arg2 , double _arg3 , double _arg4 , double _arg5 , double _arg6 ) { vtkDebugWithObjectMacro ( this , <<  setting  << ModelBounds  to ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; if ( ( this -> ModelBounds [ 0 ] != _arg1 ) || ( this -> ModelBounds [ 1 ] != _arg2 ) || ( this -> ModelBounds [ 2 ] != _arg3 ) || ( this -> ModelBounds [ 3 ] != _arg4 ) || ( this -> ModelBounds [ 4 ] != _arg5 ) || ( this -> ModelBounds [ 5 ] != _arg6 ) ) { this -> ModelBounds [ 0 ] = _arg1 ; this -> ModelBounds [ 1 ] = _arg2 ; this -> ModelBounds [ 2 ] = _arg3 ; this -> ModelBounds [ 3 ] = _arg4 ; this -> ModelBounds [ 4 ] = _arg5 ; this -> ModelBounds [ 5 ] = _arg6 ; this -> Modified ( ) ; } } virtual void SetModelBounds ( const double _arg [ 6 ] ) { this -> SetModelBounds ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; virtual double * GetSampleDimensionsModelBounds ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ModelBounds  pointer  << this -> ModelBounds ) ; return this -> ModelBounds ; } VTK_WRAPEXCLUDE virtual void GetSampleDimensionsModelBounds ( double data [ 6 ] ) { for ( int i = 0 ; i < 6 ; i ++ ) { data [ i ] = this -> ModelBounds [ i ] ; } } ; /@} /@{ *
##  Set / Get the power parameter p. By default p=2. Values (which must be
##  a positive, real value) != 2 may affect performance significantly.
##  virtual void SetMaximumDistancePowerParameter ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << PowerParameter  to  << _arg ) ; if ( this -> PowerParameter != ( _arg < 0.001 ? 0.001 : ( _arg > 100 ? 100 : _arg ) ) ) { this -> PowerParameter = ( _arg < 0.001 ? 0.001 : ( _arg > 100 ? 100 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetMaximumDistanceMinValuePowerParameterMinValue ( ) { return 0.001 ; } virtual double GetMaximumDistanceMaxValuePowerParameterMaxValue ( ) { return 100 ; } ; virtual double GetMaximumDistanceNullValuePowerParameter ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PowerParameter  of  << this -> PowerParameter ) ; return this -> PowerParameter ; } ; /@} *
##  Compute ModelBounds from the input geometry.
##  double ComputeModelBounds ( double origin [ 3 ] , double spacing [ 3 ] ) ; protected : vtkShepardMethod ( ) ; ~ vtkShepardMethod ( ) override = default ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ;  see vtkAlgorithm for details int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ;  see algorithm for more info int FillInputPortInformation ( int port , vtkInformation * info ) override ; int SampleDimensions [ 3 ] ; double MaximumDistance ; double ModelBounds [ 6 ] ; double NullValue ; double PowerParameter ; private : vtkShepardMethod ( const vtkShepardMethod & ) = delete ; void operator = ( const vtkShepardMethod & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
