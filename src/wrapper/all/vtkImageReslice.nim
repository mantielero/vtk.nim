## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageReslice.h
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
##  @class   vtkImageReslice
##  @brief   Reslices a volume along a new set of axes.
##
##  vtkImageReslice is the swiss-army-knife of image geometry filters:
##  It can permute, rotate, flip, scale, resample, deform, and pad image
##  data in any combination with reasonably high efficiency.  Simple
##  operations such as permutation, resampling and padding are done
##  with similar efficiently to the specialized vtkImagePermute,
##  vtkImageResample, and vtkImagePad filters.  There are a number of
##  tasks that vtkImageReslice is well suited for:
##  <p>1) Application of simple rotations, scales, and translations to
##  an image. It is often a good idea to use vtkImageChangeInformation
##  to center the image first, so that scales and rotations occur around
##  the center rather than around the lower-left corner of the image.
##  <p>2) Resampling of one data set to match the voxel sampling of
##  a second data set via the SetInformationInput() method, e.g. for
##  the purpose of comparing two images or combining two images.
##  A transformation, either linear or nonlinear, can be applied
##  at the same time via the SetResliceTransform method if the two
##  images are not in the same coordinate space.
##  <p>3) Extraction of slices from an image volume.  The most convenient
##  way to do this is to use SetResliceAxesDirectionCosines() to
##  specify the orientation of the slice.  The direction cosines give
##  the x, y, and z axes for the output volume.  The method
##  SetOutputDimensionality(2) is used to specify that want to output a
##  slice rather than a volume.  The SetResliceAxesOrigin() command is
##  used to provide an (x,y,z) point that the slice will pass through.
##  You can use both the ResliceAxes and the ResliceTransform at the
##  same time, in order to extract slices from a volume that you have
##  applied a transformation to.
##  @warning
##  This filter is very inefficient if the output X dimension is 1.
##  @sa
##  vtkAbstractTransform vtkMatrix4x4
##

## !!!Ignored construct:  # vtkImageReslice_h [NewLine] # vtkImageReslice_h [NewLine] # vtkImagingCoreModule.h  For export macro # vtkThreadedImageAlgorithm.h [NewLine]  interpolation mode constants # VTK_RESLICE_NEAREST VTK_NEAREST_INTERPOLATION [NewLine] # VTK_RESLICE_LINEAR VTK_LINEAR_INTERPOLATION [NewLine] # VTK_RESLICE_CUBIC VTK_CUBIC_INTERPOLATION [NewLine] class vtkImageData ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkAbstractTransform"
discard "forward decl of vtkMatrix4x4"
discard "forward decl of vtkImageStencilData"
discard "forward decl of vtkScalarsToColors"
discard "forward decl of vtkAbstractImageInterpolator"
## !!!Ignored construct:  class VTKIMAGINGCORE_EXPORT vtkImageReslice : public vtkThreadedImageAlgorithm { public : static vtkImageReslice * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkThreadedImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkThreadedImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageReslice :: IsTypeOf ( type ) ; } static vtkImageReslice * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageReslice * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageReslice * NewInstance ( ) const { return vtkImageReslice :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkThreadedImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageReslice :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageReslice :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  This method is used to set up the axes for the output voxels.
##  The output Spacing, Origin, and Extent specify the locations
##  of the voxels within the coordinate system defined by the axes.
##  The ResliceAxes are used most often to permute the data, e.g.
##  to extract ZY or XZ slices of a volume as 2D XY images.
##  <p>The first column of the matrix specifies the x-axis
##  vector (the fourth element must be set to zero), the second
##  column specifies the y-axis, and the third column the
##  z-axis.  The fourth column is the origin of the
##  axes (the fourth element must be set to one).
##  <p>An alternative to SetResliceAxes() is to use
##  SetResliceAxesDirectionCosines() to set the directions of the
##  axes and SetResliceAxesOrigin() to set the origin of the axes.
##  virtual void SetResliceAxes ( vtkMatrix4x4 * ) ; virtual vtkMatrix4x4 * GetnameResliceAxes ( ) { vtkDebugWithObjectMacro ( this , <<  returning  ResliceAxes  address  << static_cast < vtkMatrix4x4 * > ( this -> ResliceAxes ) ) ; return this -> ResliceAxes ; } ; /@} /@{ *
##  Specify the direction cosines for the ResliceAxes (i.e. the
##  first three elements of each of the first three columns of
##  the ResliceAxes matrix).  This will modify the current
##  ResliceAxes matrix, or create a new matrix if none exists.
##  void SetResliceAxesDirectionCosines ( double x0 , double x1 , double x2 , double y0 , double y1 , double y2 , double z0 , double z1 , double z2 ) ; void SetResliceAxesDirectionCosines ( const double x [ 3 ] , const double y [ 3 ] , const double z [ 3 ] ) { this -> SetResliceAxesDirectionCosines ( x [ 0 ] , x [ 1 ] , x [ 2 ] , y [ 0 ] , y [ 1 ] , y [ 2 ] , z [ 0 ] , z [ 1 ] , z [ 2 ] ) ; } void SetResliceAxesDirectionCosines ( const double xyz [ 9 ] ) { this -> SetResliceAxesDirectionCosines ( xyz [ 0 ] , xyz [ 1 ] , xyz [ 2 ] , xyz [ 3 ] , xyz [ 4 ] , xyz [ 5 ] , xyz [ 6 ] , xyz [ 7 ] , xyz [ 8 ] ) ; } void GetResliceAxesDirectionCosines ( double x [ 3 ] , double y [ 3 ] , double z [ 3 ] ) ; void GetResliceAxesDirectionCosines ( double xyz [ 9 ] ) { this -> GetResliceAxesDirectionCosines ( & xyz [ 0 ] , & xyz [ 3 ] , & xyz [ 6 ] ) ; } double * GetResliceAxesDirectionCosines ( ) VTK_SIZEHINT ( 9 ) { this -> GetResliceAxesDirectionCosines ( this -> ResliceAxesDirectionCosines ) ; return this -> ResliceAxesDirectionCosines ; } /@} /@{ *
##  Specify the origin for the ResliceAxes (i.e. the first three
##  elements of the final column of the ResliceAxes matrix).
##  This will modify the current ResliceAxes matrix, or create
##  new matrix if none exists.
##  void SetResliceAxesOrigin ( double x , double y , double z ) ; void SetResliceAxesOrigin ( const double xyz [ 3 ] ) { this -> SetResliceAxesOrigin ( xyz [ 0 ] , xyz [ 1 ] , xyz [ 2 ] ) ; } void GetResliceAxesOrigin ( double xyz [ 3 ] ) ; double * GetResliceAxesOrigin ( ) VTK_SIZEHINT ( 3 ) { this -> GetResliceAxesOrigin ( this -> ResliceAxesOrigin ) ; return this -> ResliceAxesOrigin ; } /@} /@{ *
##  Set a transform to be applied to the resampling grid that has
##  been defined via the ResliceAxes and the output Origin, Spacing
##  and Extent.  Note that applying a transform to the resampling
##  grid (which lies in the output coordinate system) is
##  equivalent to applying the inverse of that transform to
##  the input volume.  Nonlinear transforms such as vtkGridTransform
##  and vtkThinPlateSplineTransform can be used here.
##  virtual void SetResliceTransform ( vtkAbstractTransform * ) ; virtual vtkAbstractTransform * GetnameResliceAxesResliceTransform ( ) { vtkDebugWithObjectMacro ( this , <<  returning  ResliceTransform  address  << static_cast < vtkAbstractTransform * > ( this -> ResliceTransform ) ) ; return this -> ResliceTransform ; } ; /@} /@{ *
##  Set a vtkImageData from which the default Spacing, Origin,
##  and WholeExtent of the output will be copied.  The spacing,
##  origin, and extent will be permuted according to the
##  ResliceAxes.  Any values set via SetOutputSpacing,
##  SetOutputOrigin, and SetOutputExtent will override these
##  values.  By default, the Spacing, Origin, and WholeExtent
##  of the Input are used.
##  virtual void SetInformationInput ( vtkImageData * ) ; virtual vtkImageData * GetnameResliceAxesResliceTransformInformationInput ( ) { vtkDebugWithObjectMacro ( this , <<  returning  InformationInput  address  << static_cast < vtkImageData * > ( this -> InformationInput ) ) ; return this -> InformationInput ; } ; /@} /@{ *
##  Specify whether to transform the spacing, origin and extent
##  of the Input (or the InformationInput) according to the
##  direction cosines and origin of the ResliceAxes before applying
##  them as the default output spacing, origin and extent
##  (default: On).
##  virtual void SetTransformInputSampling ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  TransformInputSampling  to  << _arg ) ; if ( this -> TransformInputSampling != _arg ) { this -> TransformInputSampling = _arg ; this -> Modified ( ) ; } } ; virtual void TransformInputSamplingOn ( ) { this -> SetTransformInputSampling ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void TransformInputSamplingOff ( ) { this -> SetTransformInputSampling ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual vtkTypeBool GetTransformInputSampling ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TransformInputSampling  of  << this -> TransformInputSampling ) ; return this -> TransformInputSampling ; } ; /@} /@{ *
##  Turn this on if you want to guarantee that the extent of the
##  output will be large enough to ensure that none of the
##  data will be cropped (default: Off).
##  virtual void SetTransformInputSamplingAutoCropOutput ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  AutoCropOutput  to  << _arg ) ; if ( this -> AutoCropOutput != _arg ) { this -> AutoCropOutput = _arg ; this -> Modified ( ) ; } } ; virtual void AutoCropOutputOn ( ) { this -> SetTransformInputSamplingAutoCropOutput ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void AutoCropOutputOff ( ) { this -> SetTransformInputSamplingAutoCropOutput ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual vtkTypeBool GetTransformInputSamplingAutoCropOutput ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AutoCropOutput  of  << this -> AutoCropOutput ) ; return this -> AutoCropOutput ; } ; /@} /@{ *
##  Turn on wrap-pad feature (default: Off).
##  virtual void SetTransformInputSamplingAutoCropOutputWrap ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Wrap  to  << _arg ) ; if ( this -> Wrap != _arg ) { this -> Wrap = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetTransformInputSamplingAutoCropOutputWrap ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Wrap  of  << this -> Wrap ) ; return this -> Wrap ; } ; virtual void WrapOn ( ) { this -> SetTransformInputSamplingAutoCropOutputWrap ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void WrapOff ( ) { this -> SetTransformInputSamplingAutoCropOutputWrap ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on mirror-pad feature (default: Off).
##  This will override the wrap-pad.
##  virtual void SetTransformInputSamplingAutoCropOutputWrapMirror ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Mirror  to  << _arg ) ; if ( this -> Mirror != _arg ) { this -> Mirror = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetTransformInputSamplingAutoCropOutputWrapMirror ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Mirror  of  << this -> Mirror ) ; return this -> Mirror ; } ; virtual void MirrorOn ( ) { this -> SetTransformInputSamplingAutoCropOutputWrapMirror ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void MirrorOff ( ) { this -> SetTransformInputSamplingAutoCropOutputWrapMirror ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Extend the apparent input border by a half voxel (default: On).
##  This changes how interpolation is handled at the borders of the
##  input image: if the center of an output voxel is beyond the edge
##  of the input image, but is within a half voxel width of the edge
##  (using the input voxel width), then the value of the output voxel
##  is calculated as if the input's edge voxels were duplicated past
##  the edges of the input.
##  This has no effect if Mirror or Wrap are on.
##  virtual void SetTransformInputSamplingAutoCropOutputWrapMirrorBorder ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Border  to  << _arg ) ; if ( this -> Border != _arg ) { this -> Border = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetTransformInputSamplingAutoCropOutputWrapMirrorBorder ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Border  of  << this -> Border ) ; return this -> Border ; } ; virtual void BorderOn ( ) { this -> SetTransformInputSamplingAutoCropOutputWrapMirrorBorder ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void BorderOff ( ) { this -> SetTransformInputSamplingAutoCropOutputWrapMirrorBorder ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set the border thickness for BorderOn() (default: 0.5).
##  See SetBorder() for more information.
##  /@{ virtual void SetTransformInputSamplingAutoCropOutputWrapMirrorBorderBorderThickness ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  BorderThickness  to  << _arg ) ; if ( this -> BorderThickness != _arg ) { this -> BorderThickness = _arg ; this -> Modified ( ) ; } } ; virtual double GetTransformInputSamplingAutoCropOutputWrapMirrorBorderBorderThickness ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BorderThickness  of  << this -> BorderThickness ) ; return this -> BorderThickness ; } ; /@} *
##  Set interpolation mode (default: nearest neighbor).
##  virtual void SetInterpolationMode ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << InterpolationMode  to  << _arg ) ; if ( this -> InterpolationMode != ( _arg < VTK_RESLICE_NEAREST ? VTK_RESLICE_NEAREST : ( _arg > VTK_RESLICE_CUBIC ? VTK_RESLICE_CUBIC : _arg ) ) ) { this -> InterpolationMode = ( _arg < VTK_RESLICE_NEAREST ? VTK_RESLICE_NEAREST : ( _arg > VTK_RESLICE_CUBIC ? VTK_RESLICE_CUBIC : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetInterpolationModeMinValue ( ) { return VTK_RESLICE_NEAREST ; } virtual int GetInterpolationModeMaxValue ( ) { return VTK_RESLICE_CUBIC ; } ; virtual int GetTransformInputSamplingAutoCropOutputWrapMirrorBorderBorderThicknessInterpolationMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InterpolationMode  of  << this -> InterpolationMode ) ; return this -> InterpolationMode ; } ; void SetInterpolationModeToNearestNeighbor ( ) { this -> SetInterpolationMode ( VTK_RESLICE_NEAREST ) ; } void SetInterpolationModeToLinear ( ) { this -> SetInterpolationMode ( VTK_RESLICE_LINEAR ) ; } void SetInterpolationModeToCubic ( ) { this -> SetInterpolationMode ( VTK_RESLICE_CUBIC ) ; } virtual const char * GetInterpolationModeAsString ( ) ; /@} /@{ *
##  Set the interpolator to use.  The default interpolator
##  supports the Nearest, Linear, and Cubic interpolation modes.
##  virtual void SetInterpolator ( vtkAbstractImageInterpolator * sampler ) ; virtual vtkAbstractImageInterpolator * GetInterpolator ( ) ; /@} /@{ *
##  Set the slab mode, for generating thick slices. The default is Mean.
##  If SetSlabNumberOfSlices(N) is called with N greater than one, then
##  each output slice will actually be a composite of N slices.  This method
##  specifies the compositing mode to be used.
##  virtual void SetInterpolationModeSlabMode ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << SlabMode  to  << _arg ) ; if ( this -> SlabMode != ( _arg < VTK_IMAGE_SLAB_MIN ? VTK_IMAGE_SLAB_MIN : ( _arg > VTK_IMAGE_SLAB_SUM ? VTK_IMAGE_SLAB_SUM : _arg ) ) ) { this -> SlabMode = ( _arg < VTK_IMAGE_SLAB_MIN ? VTK_IMAGE_SLAB_MIN : ( _arg > VTK_IMAGE_SLAB_SUM ? VTK_IMAGE_SLAB_SUM : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetInterpolationModeMinValueSlabModeMinValue ( ) { return VTK_IMAGE_SLAB_MIN ; } virtual int GetInterpolationModeMaxValueSlabModeMaxValue ( ) { return VTK_IMAGE_SLAB_SUM ; } ; virtual int GetTransformInputSamplingAutoCropOutputWrapMirrorBorderBorderThicknessInterpolationModeSlabMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SlabMode  of  << this -> SlabMode ) ; return this -> SlabMode ; } ; void SetSlabModeToMin ( ) { this -> SetSlabMode ( VTK_IMAGE_SLAB_MIN ) ; } void SetSlabModeToMax ( ) { this -> SetSlabMode ( VTK_IMAGE_SLAB_MAX ) ; } void SetSlabModeToMean ( ) { this -> SetSlabMode ( VTK_IMAGE_SLAB_MEAN ) ; } void SetSlabModeToSum ( ) { this -> SetSlabMode ( VTK_IMAGE_SLAB_SUM ) ; } virtual const char * GetSlabModeAsString ( ) ; /@} /@{ *
##  Set the number of slices that will be combined to create the slab.
##  virtual void SetTransformInputSamplingAutoCropOutputWrapMirrorBorderBorderThicknessSlabNumberOfSlices ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SlabNumberOfSlices  to  << _arg ) ; if ( this -> SlabNumberOfSlices != _arg ) { this -> SlabNumberOfSlices = _arg ; this -> Modified ( ) ; } } ; virtual int GetTransformInputSamplingAutoCropOutputWrapMirrorBorderBorderThicknessInterpolationModeSlabModeSlabNumberOfSlices ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SlabNumberOfSlices  of  << this -> SlabNumberOfSlices ) ; return this -> SlabNumberOfSlices ; } ; /@} /@{ *
##  Use trapezoid integration for slab computation.  All this does is
##  weigh the first and last slices by half when doing sum and mean.
##  It is off by default.
##  virtual void SetTransformInputSamplingAutoCropOutputWrapMirrorBorderBorderThicknessSlabNumberOfSlicesSlabTrapezoidIntegration ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SlabTrapezoidIntegration  to  << _arg ) ; if ( this -> SlabTrapezoidIntegration != _arg ) { this -> SlabTrapezoidIntegration = _arg ; this -> Modified ( ) ; } } ; virtual void SlabTrapezoidIntegrationOn ( ) { this -> SetTransformInputSamplingAutoCropOutputWrapMirrorBorderSlabTrapezoidIntegration ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void SlabTrapezoidIntegrationOff ( ) { this -> SetTransformInputSamplingAutoCropOutputWrapMirrorBorderSlabTrapezoidIntegration ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual vtkTypeBool GetTransformInputSamplingAutoCropOutputWrapMirrorBorderBorderThicknessInterpolationModeSlabModeSlabNumberOfSlicesSlabTrapezoidIntegration ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SlabTrapezoidIntegration  of  << this -> SlabTrapezoidIntegration ) ; return this -> SlabTrapezoidIntegration ; } ; /@} /@{ *
##  The slab spacing as a fraction of the output slice spacing.
##  When one of the various slab modes is chosen, each output slice is
##  produced by generating several "temporary" output slices and then
##  combining them according to the slab mode.  By default, the spacing
##  between these temporary slices is the Z component of the OutputSpacing.
##  This method sets the spacing between these temporary slices to be a
##  fraction of the output spacing.
##  virtual void SetTransformInputSamplingAutoCropOutputWrapMirrorBorderBorderThicknessSlabNumberOfSlicesSlabTrapezoidIntegrationSlabSliceSpacingFraction ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SlabSliceSpacingFraction  to  << _arg ) ; if ( this -> SlabSliceSpacingFraction != _arg ) { this -> SlabSliceSpacingFraction = _arg ; this -> Modified ( ) ; } } ; virtual double GetTransformInputSamplingAutoCropOutputWrapMirrorBorderBorderThicknessInterpolationModeSlabModeSlabNumberOfSlicesSlabTrapezoidIntegrationSlabSliceSpacingFraction ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SlabSliceSpacingFraction  of  << this -> SlabSliceSpacingFraction ) ; return this -> SlabSliceSpacingFraction ; } ; /@} /@{ *
##  Turn on and off optimizations (default on, they should only be
##  turned off for testing purposes).
##  virtual void SetTransformInputSamplingAutoCropOutputWrapMirrorBorderBorderThicknessSlabNumberOfSlicesSlabTrapezoidIntegrationSlabSliceSpacingFractionOptimization ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Optimization  to  << _arg ) ; if ( this -> Optimization != _arg ) { this -> Optimization = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetTransformInputSamplingAutoCropOutputWrapMirrorBorderBorderThicknessInterpolationModeSlabModeSlabNumberOfSlicesSlabTrapezoidIntegrationSlabSliceSpacingFractionOptimization ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Optimization  of  << this -> Optimization ) ; return this -> Optimization ; } ; virtual void OptimizationOn ( ) { this -> SetTransformInputSamplingAutoCropOutputWrapMirrorBorderSlabTrapezoidIntegrationOptimization ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void OptimizationOff ( ) { this -> SetTransformInputSamplingAutoCropOutputWrapMirrorBorderSlabTrapezoidIntegrationOptimization ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set a value to add to all the output voxels.
##  After a sample value has been interpolated from the input image, the
##  equation u = (v + ScalarShift)*ScalarScale will be applied to it before
##  it is written to the output image.  The result will always be clamped to
##  the limits of the output data type.
##  virtual void SetTransformInputSamplingAutoCropOutputWrapMirrorBorderBorderThicknessSlabNumberOfSlicesSlabTrapezoidIntegrationSlabSliceSpacingFractionOptimizationScalarShift ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ScalarShift  to  << _arg ) ; if ( this -> ScalarShift != _arg ) { this -> ScalarShift = _arg ; this -> Modified ( ) ; } } ; virtual double GetTransformInputSamplingAutoCropOutputWrapMirrorBorderBorderThicknessInterpolationModeSlabModeSlabNumberOfSlicesSlabTrapezoidIntegrationSlabSliceSpacingFractionOptimizationScalarShift ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarShift  of  << this -> ScalarShift ) ; return this -> ScalarShift ; } ; /@} /@{ *
##  Set multiplication factor to apply to all the output voxels.
##  After a sample value has been interpolated from the input image, the
##  equation u = (v + ScalarShift)*ScalarScale will be applied to it before
##  it is written to the output image.  The result will always be clamped to
##  the limits of the output data type.
##  virtual void SetTransformInputSamplingAutoCropOutputWrapMirrorBorderBorderThicknessSlabNumberOfSlicesSlabTrapezoidIntegrationSlabSliceSpacingFractionOptimizationScalarShiftScalarScale ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ScalarScale  to  << _arg ) ; if ( this -> ScalarScale != _arg ) { this -> ScalarScale = _arg ; this -> Modified ( ) ; } } ; virtual double GetTransformInputSamplingAutoCropOutputWrapMirrorBorderBorderThicknessInterpolationModeSlabModeSlabNumberOfSlicesSlabTrapezoidIntegrationSlabSliceSpacingFractionOptimizationScalarShiftScalarScale ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarScale  of  << this -> ScalarScale ) ; return this -> ScalarScale ; } ; /@} /@{ *
##  Set the scalar type of the output to be different from the input.
##  The default value is -1, which means that the input scalar type will be
##  used to set the output scalar type.  Otherwise, this must be set to one
##  of the following types: VTK_CHAR, VTK_SIGNED_CHAR, VTK_UNSIGNED_CHAR,
##  VTK_SHORT, VTK_UNSIGNED_SHORT, VTK_INT, VTK_UNSIGNED_INT, VTK_FLOAT,
##  or VTK_DOUBLE.  Other types are not permitted.  If the output type
##  is an integer type, the output will be rounded and clamped to the
##  limits of the type.
##  virtual void SetTransformInputSamplingAutoCropOutputWrapMirrorBorderBorderThicknessSlabNumberOfSlicesSlabTrapezoidIntegrationSlabSliceSpacingFractionOptimizationScalarShiftScalarScaleOutputScalarType ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutputScalarType  to  << _arg ) ; if ( this -> OutputScalarType != _arg ) { this -> OutputScalarType = _arg ; this -> Modified ( ) ; } } ; virtual int GetTransformInputSamplingAutoCropOutputWrapMirrorBorderBorderThicknessInterpolationModeSlabModeSlabNumberOfSlicesSlabTrapezoidIntegrationSlabSliceSpacingFractionOptimizationScalarShiftScalarScaleOutputScalarType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputScalarType  of  << this -> OutputScalarType ) ; return this -> OutputScalarType ; } ; /@} /@{ *
##  Set the background color (for multi-component images).
##  virtual void SetBackgroundColor ( double _arg1 , double _arg2 , double _arg3 , double _arg4 ) { vtkDebugWithObjectMacro ( this , <<  setting  << BackgroundColor  to ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << ) ) ; if ( ( this -> BackgroundColor [ 0 ] != _arg1 ) || ( this -> BackgroundColor [ 1 ] != _arg2 ) || ( this -> BackgroundColor [ 2 ] != _arg3 ) || ( this -> BackgroundColor [ 3 ] != _arg4 ) ) { this -> BackgroundColor [ 0 ] = _arg1 ; this -> BackgroundColor [ 1 ] = _arg2 ; this -> BackgroundColor [ 2 ] = _arg3 ; this -> BackgroundColor [ 3 ] = _arg4 ; this -> Modified ( ) ; } } virtual void SetBackgroundColor ( const double _arg [ 4 ] ) { this -> SetBackgroundColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] ) ; } ; virtual double * GetBackgroundColor ( ) VTK_SIZEHINT ( 4 ) { vtkDebugWithObjectMacro ( this , <<  returning  << BackgroundColor  pointer  << this -> BackgroundColor ) ; return this -> BackgroundColor ; } VTK_WRAPEXCLUDE virtual void GetBackgroundColor ( double & _arg1 , double & _arg2 , double & _arg3 , double & _arg4 ) { _arg1 = this -> BackgroundColor [ 0 ] ; _arg2 = this -> BackgroundColor [ 1 ] ; _arg3 = this -> BackgroundColor [ 2 ] ; _arg4 = this -> BackgroundColor [ 3 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << BackgroundColor  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetBackgroundColor ( double _arg [ 4 ] ) { this -> GetBackgroundColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] ) ; } ; /@} /@{ *
##  Set background grey level (for single-component images).
##  void SetBackgroundLevel ( double v ) { this -> SetBackgroundColor ( v , v , v , v ) ; } double GetBackgroundLevel ( ) { return this -> GetBackgroundColor ( ) [ 0 ] ; } /@} /@{ *
##  Set the voxel spacing for the output data.  The default output
##  spacing is the input spacing permuted through the ResliceAxes.
##  virtual void SetOutputSpacing ( double x , double y , double z ) ; virtual void SetOutputSpacing ( const double a [ 3 ] ) { this -> SetOutputSpacing ( a [ 0 ] , a [ 1 ] , a [ 2 ] ) ; } virtual double * GetOutputSpacing ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << OutputSpacing  pointer  << this -> OutputSpacing ) ; return this -> OutputSpacing ; } VTK_WRAPEXCLUDE virtual void GetOutputSpacing ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> OutputSpacing [ 0 ] ; _arg2 = this -> OutputSpacing [ 1 ] ; _arg3 = this -> OutputSpacing [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << OutputSpacing  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetOutputSpacing ( double _arg [ 3 ] ) { this -> GetOutputSpacing ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; void SetOutputSpacingToDefault ( ) ; /@} /@{ *
##  Set the origin for the output data.  The default output origin
##  is the input origin permuted through the ResliceAxes.
##  virtual void SetOutputOrigin ( double x , double y , double z ) ; virtual void SetOutputOrigin ( const double a [ 3 ] ) { this -> SetOutputOrigin ( a [ 0 ] , a [ 1 ] , a [ 2 ] ) ; } virtual double * GetOutputSpacingOutputOrigin ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << OutputOrigin  pointer  << this -> OutputOrigin ) ; return this -> OutputOrigin ; } VTK_WRAPEXCLUDE virtual void GetOutputSpacingOutputOrigin ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> OutputOrigin [ 0 ] ; _arg2 = this -> OutputOrigin [ 1 ] ; _arg3 = this -> OutputOrigin [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << OutputOrigin  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetOutputSpacingOutputOrigin ( double _arg [ 3 ] ) { this -> GetOutputSpacingOutputOrigin ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; void SetOutputOriginToDefault ( ) ; /@} /@{ *
##  Set the extent for the output data.  The default output extent
##  is the input extent permuted through the ResliceAxes.
##  virtual void SetOutputExtent ( int a , int b , int c , int d , int e , int f ) ; virtual void SetOutputExtent ( const int a [ 6 ] ) { this -> SetOutputExtent ( a [ 0 ] , a [ 1 ] , a [ 2 ] , a [ 3 ] , a [ 4 ] , a [ 5 ] ) ; } virtual int * GetOutputExtent ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << OutputExtent  pointer  << this -> OutputExtent ) ; return this -> OutputExtent ; } VTK_WRAPEXCLUDE virtual void GetOutputExtent ( int & _arg1 , int & _arg2 , int & _arg3 , int & _arg4 , int & _arg5 , int & _arg6 ) { _arg1 = this -> OutputExtent [ 0 ] ; _arg2 = this -> OutputExtent [ 1 ] ; _arg3 = this -> OutputExtent [ 2 ] ; _arg4 = this -> OutputExtent [ 3 ] ; _arg5 = this -> OutputExtent [ 4 ] ; _arg6 = this -> OutputExtent [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << OutputExtent  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetOutputExtent ( int _arg [ 6 ] ) { this -> GetOutputExtent ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; void SetOutputExtentToDefault ( ) ; /@} /@{ *
##  Force the dimensionality of the output to either 1, 2,
##  3 or 0 (default: 3).  If the dimensionality is 2D, then
##  the Z extent of the output is forced to (0,0) and the Z
##  origin of the output is forced to 0.0 (i.e. the output
##  extent is confined to the xy plane).  If the dimensionality
##  is 1D, the output extent is confined to the x axis.
##  For 0D, the output extent consists of a single voxel at
##  (0,0,0).
##  virtual void SetTransformInputSamplingAutoCropOutputWrapMirrorBorderBorderThicknessSlabNumberOfSlicesSlabTrapezoidIntegrationSlabSliceSpacingFractionOptimizationScalarShiftScalarScaleOutputScalarTypeOutputDimensionality ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutputDimensionality  to  << _arg ) ; if ( this -> OutputDimensionality != _arg ) { this -> OutputDimensionality = _arg ; this -> Modified ( ) ; } } ; virtual int GetTransformInputSamplingAutoCropOutputWrapMirrorBorderBorderThicknessInterpolationModeSlabModeSlabNumberOfSlicesSlabTrapezoidIntegrationSlabSliceSpacingFractionOptimizationScalarShiftScalarScaleOutputScalarTypeOutputDimensionality ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputDimensionality  of  << this -> OutputDimensionality ) ; return this -> OutputDimensionality ; } ; /@} *
##  When determining the modified time of the filter,
##  this check the modified time of the transform and matrix.
##  vtkMTimeType GetMTime ( ) override ; *
##  Report object referenced by instances of this class.
##  void ReportReferences ( vtkGarbageCollector * ) override ; /@{ *
##  Convenient methods for switching between nearest-neighbor and linear
##  interpolation.
##  InterpolateOn() is equivalent to SetInterpolationModeToLinear() and
##  InterpolateOff() is equivalent to SetInterpolationModeToNearestNeighbor()
##  You should not use these methods if you use the SetInterpolationMode
##  methods.
##  void SetInterpolate ( int t ) { if ( t && ! this -> GetInterpolate ( ) ) { this -> SetInterpolationModeToLinear ( ) ; } else if ( ! t && this -> GetInterpolate ( ) ) { this -> SetInterpolationModeToNearestNeighbor ( ) ; } } void InterpolateOn ( ) { this -> SetInterpolate ( 1 ) ; } void InterpolateOff ( ) { this -> SetInterpolate ( 0 ) ; } int GetInterpolate ( ) { return ( this -> GetInterpolationMode ( ) != VTK_RESLICE_NEAREST ) ; } /@} /@{ *
##  Use a stencil to limit the calculations to a specific region of
##  the output.  Portions of the output that are 'outside' the stencil
##  will be cleared to the background color.
##  void SetStencilData ( vtkImageStencilData * stencil ) ; vtkImageStencilData * GetStencil ( ) ; /@} /@{ *
##  Generate an output stencil that defines which pixels were
##  interpolated and which pixels were out-of-bounds of the input.
##  virtual void SetTransformInputSamplingAutoCropOutputWrapMirrorBorderBorderThicknessSlabNumberOfSlicesSlabTrapezoidIntegrationSlabSliceSpacingFractionOptimizationScalarShiftScalarScaleOutputScalarTypeOutputDimensionalityGenerateStencilOutput ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateStencilOutput  to  << _arg ) ; if ( this -> GenerateStencilOutput != _arg ) { this -> GenerateStencilOutput = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetTransformInputSamplingAutoCropOutputWrapMirrorBorderBorderThicknessInterpolationModeSlabModeSlabNumberOfSlicesSlabTrapezoidIntegrationSlabSliceSpacingFractionOptimizationScalarShiftScalarScaleOutputScalarTypeOutputDimensionalityGenerateStencilOutput ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateStencilOutput  of  << this -> GenerateStencilOutput ) ; return this -> GenerateStencilOutput ; } ; virtual void GenerateStencilOutputOn ( ) { this -> SetTransformInputSamplingAutoCropOutputWrapMirrorBorderSlabTrapezoidIntegrationOptimizationGenerateStencilOutput ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GenerateStencilOutputOff ( ) { this -> SetTransformInputSamplingAutoCropOutputWrapMirrorBorderSlabTrapezoidIntegrationOptimizationGenerateStencilOutput ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Get the output stencil.
##  vtkAlgorithmOutput * GetStencilOutputPort ( ) { return this -> GetOutputPort ( 1 ) ; } vtkImageStencilData * GetStencilOutput ( ) ; void SetStencilOutput ( vtkImageStencilData * stencil ) ; /@} protected : vtkImageReslice ( ) ; ~ vtkImageReslice ( ) override ; vtkMatrix4x4 * ResliceAxes ; double ResliceAxesDirectionCosines [ 9 ] ; double ResliceAxesOrigin [ 3 ] ; vtkAbstractTransform * ResliceTransform ; vtkAbstractImageInterpolator * Interpolator ; vtkImageData * InformationInput ; vtkTypeBool Wrap ; vtkTypeBool Mirror ; vtkTypeBool Border ; int InterpolationMode ; vtkTypeBool Optimization ; int SlabMode ; int SlabNumberOfSlices ; vtkTypeBool SlabTrapezoidIntegration ; double SlabSliceSpacingFraction ; double ScalarShift ; double ScalarScale ; double BorderThickness ; double BackgroundColor [ 4 ] ; double OutputOrigin [ 3 ] ; double OutputSpacing [ 3 ] ; int OutputExtent [ 6 ] ; int OutputScalarType ; int OutputDimensionality ; vtkTypeBool TransformInputSampling ; vtkTypeBool AutoCropOutput ; int HitInputExtent ; int UsePermuteExecute ; int ComputeOutputSpacing ; int ComputeOutputOrigin ; int ComputeOutputExtent ; vtkTypeBool GenerateStencilOutput ; vtkMatrix4x4 * IndexMatrix ; vtkAbstractTransform * OptimizedTransform ; *
##  This should be set to 1 by derived classes that override the
##  ConvertScalars method.
##  int HasConvertScalars ; *
##  This should be overridden by derived classes that operate on
##  the interpolated data before it is placed in the output.
##  virtual int ConvertScalarInfo ( int & scalarType , int & numComponents ) ; *
##  This should be overridden by derived classes that operate on
##  the interpolated data before it is placed in the output.
##  The input data will usually be double or float (since the
##  interpolation routines use floating-point) but it could be
##  of any type.  This method will be called from multiple threads,
##  so it must be thread-safe in derived classes.
##  virtual void ConvertScalars ( void * inPtr , void * outPtr , int inputType , int inputNumComponents , int count , int idX , int idY , int idZ , int threadId ) ; void ConvertScalarsBase ( void * inPtr , void * outPtr , int inputType , int inputNumComponents , int count , int idX , int idY , int idZ , int threadId ) { this -> ConvertScalars ( inPtr , outPtr , inputType , inputNumComponents , count , idX , idY , idZ , threadId ) ; } *
##  For derived classes, this should be called at the very end of
##  RequestInformation() to ensure that various bit and pieces of
##  state information are correctly set prior to execution.
##  int RequestInformationBase ( vtkInformationVector * * , vtkInformationVector * ) ; void GetAutoCroppedOutputBounds ( vtkInformation * inInfo , double bounds [ 6 ] ) ; void AllocateOutputData ( vtkImageData * output , vtkInformation * outInfo , int * uExtent ) override ; vtkImageData * AllocateOutputData ( vtkDataObject * , vtkInformation * ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; void ThreadedRequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector , vtkImageData * * * inData , vtkImageData * * outData , int ext [ 6 ] , int id ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; int FillOutputPortInformation ( int port , vtkInformation * info ) override ; vtkMatrix4x4 * GetIndexMatrix ( vtkInformation * inInfo , vtkInformation * outInfo ) ; vtkAbstractTransform * GetOptimizedTransform ( ) { return this -> OptimizedTransform ; } private : vtkImageReslice ( const vtkImageReslice & ) = delete ; void operator = ( const vtkImageReslice & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
