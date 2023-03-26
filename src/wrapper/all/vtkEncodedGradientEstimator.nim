## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkEncodedGradientEstimator.h
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
##  @class   vtkEncodedGradientEstimator
##  @brief   Superclass for gradient estimation
##
##  vtkEncodedGradientEstimator is an abstract superclass for gradient
##  estimation. It takes a scalar input of vtkImageData, computes
##  a gradient value for every point, and encodes this value into a
##  three byte value (2 for direction, 1 for magnitude) using the
##  vtkDirectionEncoder. The direction encoder is defaulted to a
##  vtkRecursiveSphereDirectionEncoder, but can be overridden with the
##  SetDirectionEncoder method. The scale and the bias values for the gradient
##  magnitude are used to convert it into a one byte value according to
##  v = m*scale + bias where m is the magnitude and v is the resulting
##  one byte value.
##  @sa
##  vtkFiniteDifferenceGradientEstimator vtkDirectionEncoder
##

## !!!Ignored construct:  # vtkEncodedGradientEstimator_h [NewLine] # vtkEncodedGradientEstimator_h [NewLine] # vtkObject.h [NewLine] # vtkRenderingVolumeModule.h  For export macro # vtkThreads.h  for VTK_MAX_THREADS [NewLine] class vtkImageData ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDirectionEncoder"
discard "forward decl of vtkMultiThreader"
## !!!Ignored construct:  class VTKRENDERINGVOLUME_EXPORT vtkEncodedGradientEstimator : public vtkObject { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkEncodedGradientEstimator :: IsTypeOf ( type ) ; } static vtkEncodedGradientEstimator * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkEncodedGradientEstimator * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkEncodedGradientEstimator * NewInstance ( ) const { return vtkEncodedGradientEstimator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkEncodedGradientEstimator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkEncodedGradientEstimator :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set/Get the scalar input for which the normals will be
##  calculated. Note that this call does not setup a pipeline
##  connection. vtkEncodedGradientEstimator is not an algorithm
##  and does not update its input. If you are directly using this
##  class, you may need to manually update the algorithm that produces
##  this data object.
##  virtual void SetInputData ( vtkImageData * ) ; virtual vtkImageData * GetnameInputData ( ) { vtkDebugWithObjectMacro ( this , <<  returning  InputData  address  << static_cast < vtkImageData * > ( this -> InputData ) ) ; return this -> InputData ; } ; /@} /@{ *
##  Set/Get the scale and bias for the gradient magnitude
##  virtual void SetGradientMagnitudeScale ( float _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GradientMagnitudeScale  to  << _arg ) ; if ( this -> GradientMagnitudeScale != _arg ) { this -> GradientMagnitudeScale = _arg ; this -> Modified ( ) ; } } ; virtual float GetGradientMagnitudeScale ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GradientMagnitudeScale  of  << this -> GradientMagnitudeScale ) ; return this -> GradientMagnitudeScale ; } ; virtual void SetGradientMagnitudeScaleGradientMagnitudeBias ( float _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GradientMagnitudeBias  to  << _arg ) ; if ( this -> GradientMagnitudeBias != _arg ) { this -> GradientMagnitudeBias = _arg ; this -> Modified ( ) ; } } ; virtual float GetGradientMagnitudeScaleGradientMagnitudeBias ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GradientMagnitudeBias  of  << this -> GradientMagnitudeBias ) ; return this -> GradientMagnitudeBias ; } ; /@} /@{ *
##  Turn on / off the bounding of the normal computation by
##  the this->Bounds bounding box
##  virtual void SetBoundsClip ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << BoundsClip  to  << _arg ) ; if ( this -> BoundsClip != ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ) { this -> BoundsClip = ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ; this -> Modified ( ) ; } } virtual vtkTypeBool GetBoundsClipMinValue ( ) { return 0 ; } virtual vtkTypeBool GetBoundsClipMaxValue ( ) { return 1 ; } ; virtual vtkTypeBool GetGradientMagnitudeScaleGradientMagnitudeBiasBoundsClip ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BoundsClip  of  << this -> BoundsClip ) ; return this -> BoundsClip ; } ; virtual void BoundsClipOn ( ) { this -> SetBoundsClip ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void BoundsClipOff ( ) { this -> SetBoundsClip ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set / Get the bounds of the computation (used if
##  this->ComputationBounds is 1.) The bounds are specified
##  xmin, xmax, ymin, ymax, zmin, zmax.
##  virtual void SetBounds ( int _arg1 , int _arg2 , int _arg3 , int _arg4 , int _arg5 , int _arg6 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Bounds  to ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; if ( ( this -> Bounds [ 0 ] != _arg1 ) || ( this -> Bounds [ 1 ] != _arg2 ) || ( this -> Bounds [ 2 ] != _arg3 ) || ( this -> Bounds [ 3 ] != _arg4 ) || ( this -> Bounds [ 4 ] != _arg5 ) || ( this -> Bounds [ 5 ] != _arg6 ) ) { this -> Bounds [ 0 ] = _arg1 ; this -> Bounds [ 1 ] = _arg2 ; this -> Bounds [ 2 ] = _arg3 ; this -> Bounds [ 3 ] = _arg4 ; this -> Bounds [ 4 ] = _arg5 ; this -> Bounds [ 5 ] = _arg6 ; this -> Modified ( ) ; } } virtual void SetBounds ( const int _arg [ 6 ] ) { this -> SetBounds ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; virtual int * GetBounds ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Bounds  pointer  << this -> Bounds ) ; return this -> Bounds ; } VTK_WRAPEXCLUDE virtual void GetBounds ( int data [ 6 ] ) { for ( int i = 0 ; i < 6 ; i ++ ) { data [ i ] = this -> Bounds [ i ] ; } } ; /@} *
##  Recompute the encoded normals and gradient magnitudes.
##  void Update ( void ) ; *
##  Get the encoded normals.
##  unsigned short * GetEncodedNormals ( void ) ; /@{ *
##  Get the encoded normal at an x,y,z location in the volume
##  int GetEncodedNormalIndex ( vtkIdType xyzIndex ) ; int GetEncodedNormalIndex ( int xIndex , int yIndex , int zIndex ) ; /@} *
##  Get the gradient magnitudes
##  unsigned char * GetGradientMagnitudes ( void ) ; /@{ *
##  Get/Set the number of threads to create when encoding normals
##  This defaults to the number of available processors on the machine
##  virtual void SetBoundsClipNumberOfThreads ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << NumberOfThreads  to  << _arg ) ; if ( this -> NumberOfThreads != ( _arg < 1 ? 1 : ( _arg > VTK_MAX_THREADS ? VTK_MAX_THREADS : _arg ) ) ) { this -> NumberOfThreads = ( _arg < 1 ? 1 : ( _arg > VTK_MAX_THREADS ? VTK_MAX_THREADS : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetBoundsClipMinValueNumberOfThreadsMinValue ( ) { return 1 ; } virtual int GetBoundsClipMaxValueNumberOfThreadsMaxValue ( ) { return VTK_MAX_THREADS ; } ; virtual int GetGradientMagnitudeScaleGradientMagnitudeBiasBoundsClipNumberOfThreads ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfThreads  of  << this -> NumberOfThreads ) ; return this -> NumberOfThreads ; } ; /@} /@{ *
##  Set / Get the direction encoder used to encode normal directions
##  to fit within two bytes
##  void SetDirectionEncoder ( vtkDirectionEncoder * direnc ) ; virtual vtkDirectionEncoder * GetnameInputDataDirectionEncoder ( ) { vtkDebugWithObjectMacro ( this , <<  returning  DirectionEncoder  address  << static_cast < vtkDirectionEncoder * > ( this -> DirectionEncoder ) ) ; return this -> DirectionEncoder ; } ; /@} /@{ *
##  If you don't want to compute gradient magnitudes (but you
##  do want normals for shading) this can be used. Be careful - if
##  if you a non-constant gradient magnitude transfer function and
##  you turn this on, it may crash
##  virtual void SetGradientMagnitudeScaleGradientMagnitudeBiasComputeGradientMagnitudes ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeGradientMagnitudes  to  << _arg ) ; if ( this -> ComputeGradientMagnitudes != _arg ) { this -> ComputeGradientMagnitudes = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetGradientMagnitudeScaleGradientMagnitudeBiasBoundsClipNumberOfThreadsComputeGradientMagnitudes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeGradientMagnitudes  of  << this -> ComputeGradientMagnitudes ) ; return this -> ComputeGradientMagnitudes ; } ; virtual void ComputeGradientMagnitudesOn ( ) { this -> SetBoundsClipComputeGradientMagnitudes ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ComputeGradientMagnitudesOff ( ) { this -> SetBoundsClipComputeGradientMagnitudes ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  If the data in each slice is only contained within a circle circumscribed
##  within the slice, and the slice is square, then don't compute anything
##  outside the circle. This circle through the slices forms a cylinder.
##  virtual void SetGradientMagnitudeScaleGradientMagnitudeBiasComputeGradientMagnitudesCylinderClip ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CylinderClip  to  << _arg ) ; if ( this -> CylinderClip != _arg ) { this -> CylinderClip = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetGradientMagnitudeScaleGradientMagnitudeBiasBoundsClipNumberOfThreadsComputeGradientMagnitudesCylinderClip ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CylinderClip  of  << this -> CylinderClip ) ; return this -> CylinderClip ; } ; virtual void CylinderClipOn ( ) { this -> SetBoundsClipComputeGradientMagnitudesCylinderClip ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void CylinderClipOff ( ) { this -> SetBoundsClipComputeGradientMagnitudesCylinderClip ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Get the time required for the last update in seconds or cpu seconds
##  virtual float GetGradientMagnitudeScaleGradientMagnitudeBiasBoundsClipNumberOfThreadsComputeGradientMagnitudesCylinderClipLastUpdateTimeInSeconds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LastUpdateTimeInSeconds  of  << this -> LastUpdateTimeInSeconds ) ; return this -> LastUpdateTimeInSeconds ; } ; virtual float GetGradientMagnitudeScaleGradientMagnitudeBiasBoundsClipNumberOfThreadsComputeGradientMagnitudesCylinderClipLastUpdateTimeInSecondsLastUpdateTimeInCPUSeconds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LastUpdateTimeInCPUSeconds  of  << this -> LastUpdateTimeInCPUSeconds ) ; return this -> LastUpdateTimeInCPUSeconds ; } ; /@} virtual int GetGradientMagnitudeScaleGradientMagnitudeBiasBoundsClipNumberOfThreadsComputeGradientMagnitudesCylinderClipLastUpdateTimeInSecondsLastUpdateTimeInCPUSecondsUseCylinderClip ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseCylinderClip  of  << this -> UseCylinderClip ) ; return this -> UseCylinderClip ; } ; int * GetCircleLimits ( ) { return this -> CircleLimits ; } /@{ *
##  Set / Get the ZeroNormalThreshold - this defines the minimum magnitude
##  of a gradient that is considered sufficient to define a
##  direction. Gradients with magnitudes at or less than this value are given
##  a "zero normal" index. These are handled specially in the shader,
##  and you can set the intensity of light for these zero normals in
##  the gradient shader.
##  void SetZeroNormalThreshold ( float v ) ; virtual float GetGradientMagnitudeScaleGradientMagnitudeBiasBoundsClipNumberOfThreadsComputeGradientMagnitudesCylinderClipLastUpdateTimeInSecondsLastUpdateTimeInCPUSecondsUseCylinderClipZeroNormalThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ZeroNormalThreshold  of  << this -> ZeroNormalThreshold ) ; return this -> ZeroNormalThreshold ; } ; /@} /@{ *
##  Assume that the data value outside the volume is zero when
##  computing normals.
##  virtual void SetBoundsClipNumberOfThreadsZeroPad ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ZeroPad  to  << _arg ) ; if ( this -> ZeroPad != ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ) { this -> ZeroPad = ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ; this -> Modified ( ) ; } } virtual vtkTypeBool GetBoundsClipMinValueNumberOfThreadsMinValueZeroPadMinValue ( ) { return 0 ; } virtual vtkTypeBool GetBoundsClipMaxValueNumberOfThreadsMaxValueZeroPadMaxValue ( ) { return 1 ; } ; virtual vtkTypeBool GetGradientMagnitudeScaleGradientMagnitudeBiasBoundsClipNumberOfThreadsComputeGradientMagnitudesCylinderClipLastUpdateTimeInSecondsLastUpdateTimeInCPUSecondsUseCylinderClipZeroNormalThresholdZeroPad ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ZeroPad  of  << this -> ZeroPad ) ; return this -> ZeroPad ; } ; virtual void ZeroPadOn ( ) { this -> SetBoundsClipComputeGradientMagnitudesCylinderClipZeroPad ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ZeroPadOff ( ) { this -> SetBoundsClipComputeGradientMagnitudesCylinderClipZeroPad ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@}  These variables should be protected but are being
##  made public to be accessible to the templated function.
##  We used to have the templated function as a friend, but
##  this does not work with all compilers  The input scalar data on which the normals are computed vtkImageData * InputData ;  The encoded normals (2 bytes) and the size of the encoded normals unsigned short * EncodedNormals ; int EncodedNormalsSize [ 3 ] ;  The magnitude of the gradient array and the size of this array unsigned char * GradientMagnitudes ;  The time at which the normals were last built vtkTimeStamp BuildTime ; virtual int * GetBoundsInputSize ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << InputSize  pointer  << this -> InputSize ) ; return this -> InputSize ; } VTK_WRAPEXCLUDE virtual void GetBoundsInputSize ( int data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> InputSize [ i ] ; } } ; virtual float * GetBoundsInputSizeInputAspect ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << InputAspect  pointer  << this -> InputAspect ) ; return this -> InputAspect ; } VTK_WRAPEXCLUDE virtual void GetBoundsInputSizeInputAspect ( float data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> InputAspect [ i ] ; } } ; protected : vtkEncodedGradientEstimator ( ) ; ~ vtkEncodedGradientEstimator ( ) override ; void ReportReferences ( vtkGarbageCollector * ) override ;  The number of threads to use when encoding normals int NumberOfThreads ; vtkMultiThreader * Threader ; vtkDirectionEncoder * DirectionEncoder ; virtual void UpdateNormals ( void ) = 0 ; float GradientMagnitudeScale ; float GradientMagnitudeBias ; float LastUpdateTimeInSeconds ; float LastUpdateTimeInCPUSeconds ; float ZeroNormalThreshold ; vtkTypeBool CylinderClip ; int * CircleLimits ; int CircleLimitsSize ; int UseCylinderClip ; void ComputeCircleLimits ( int size ) ; vtkTypeBool BoundsClip ; int Bounds [ 6 ] ; int InputSize [ 3 ] ; float InputAspect [ 3 ] ; vtkTypeBool ComputeGradientMagnitudes ; vtkTypeBool ZeroPad ; private : vtkEncodedGradientEstimator ( const vtkEncodedGradientEstimator & ) = delete ; void operator = ( const vtkEncodedGradientEstimator & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
