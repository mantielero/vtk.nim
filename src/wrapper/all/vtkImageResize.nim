## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageResize.h
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
##  @class   vtkImageResize
##  @brief   High-quality image resizing filter
##
##  vtkImageResize will magnify or shrink an image with interpolation and
##  antialiasing.  The resizing is done with a 5-lobe Lanczos-windowed sinc
##  filter that is bandlimited to the output sampling frequency in order to
##  avoid aliasing when the image size is reduced.  This filter utilizes a
##  O(n) algorithm to provide good efficiency even though the filtering kernel
##  is large.  The sinc interpolator can be turned off if nearest-neighbor
##  interpolation is required, or it can be replaced with a different
##  vtkImageInterpolator object.
##  @par Thanks:
##  Thanks to David Gobbi for contributing this class to VTK.
##

## !!!Ignored construct:  # vtkImageResize_h [NewLine] # vtkImageResize_h [NewLine] # vtkImagingCoreModule.h  For export macro # vtkThreadedImageAlgorithm.h [NewLine] class vtkAbstractImageInterpolator ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIMAGINGCORE_EXPORT vtkImageResize : public vtkThreadedImageAlgorithm { public : static vtkImageResize * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkThreadedImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkThreadedImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageResize :: IsTypeOf ( type ) ; } static vtkImageResize * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageResize * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageResize * NewInstance ( ) const { return vtkImageResize :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkThreadedImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageResize :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageResize :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; enum { OUTPUT_DIMENSIONS , OUTPUT_SPACING , MAGNIFICATION_FACTORS } ; /@{ *
##  The resizing method to use.  The default is to set the output image
##  dimensions, and allow the filter to resize the image to these new
##  dimensions.  It is also possible to resize the image by setting the
##  output image spacing or by setting a magnification factor.
##  virtual void SetResizeMethod ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ResizeMethod  to  << _arg ) ; if ( this -> ResizeMethod != ( _arg < OUTPUT_DIMENSIONS ? OUTPUT_DIMENSIONS : ( _arg > MAGNIFICATION_FACTORS ? MAGNIFICATION_FACTORS : _arg ) ) ) { this -> ResizeMethod = ( _arg < OUTPUT_DIMENSIONS ? OUTPUT_DIMENSIONS : ( _arg > MAGNIFICATION_FACTORS ? MAGNIFICATION_FACTORS : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetResizeMethodMinValue ( ) { return OUTPUT_DIMENSIONS ; } virtual int GetResizeMethodMaxValue ( ) { return MAGNIFICATION_FACTORS ; } ; virtual int GetResizeMethod ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ResizeMethod  of  << this -> ResizeMethod ) ; return this -> ResizeMethod ; } ; void SetResizeMethodToOutputDimensions ( ) { this -> SetResizeMethod ( OUTPUT_DIMENSIONS ) ; } void SetResizeMethodToOutputSpacing ( ) { this -> SetResizeMethod ( OUTPUT_SPACING ) ; } void SetResizeMethodToMagnificationFactors ( ) { this -> SetResizeMethod ( MAGNIFICATION_FACTORS ) ; } virtual const char * GetResizeMethodAsString ( ) ; /@} /@{ *
##  The desired output dimensions.  This is only used if the ResizeMethod is
##  set to OutputDimensions.  If you want to keep one of the image dimensions
##  the same as the input, then set that dimension to -1.
##  virtual void SetOutputDimensions ( int _arg1 , int _arg2 , int _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << OutputDimensions  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> OutputDimensions [ 0 ] != _arg1 ) || ( this -> OutputDimensions [ 1 ] != _arg2 ) || ( this -> OutputDimensions [ 2 ] != _arg3 ) ) { this -> OutputDimensions [ 0 ] = _arg1 ; this -> OutputDimensions [ 1 ] = _arg2 ; this -> OutputDimensions [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetOutputDimensions ( const int _arg [ 3 ] ) { this -> SetOutputDimensions ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual int * GetOutputDimensions ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << OutputDimensions  pointer  << this -> OutputDimensions ) ; return this -> OutputDimensions ; } VTK_WRAPEXCLUDE virtual void GetOutputDimensions ( int & _arg1 , int & _arg2 , int & _arg3 ) { _arg1 = this -> OutputDimensions [ 0 ] ; _arg2 = this -> OutputDimensions [ 1 ] ; _arg3 = this -> OutputDimensions [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << OutputDimensions  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetOutputDimensions ( int _arg [ 3 ] ) { this -> GetOutputDimensions ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  The desired output spacing.  This is only used if the ResizeMethod is
##  set to OutputSpacing.  If you want to keep one of the original spacing
##  values, then set that spacing value to zero.
##  virtual void SetOutputDimensionsOutputSpacing ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << OutputSpacing  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> OutputSpacing [ 0 ] != _arg1 ) || ( this -> OutputSpacing [ 1 ] != _arg2 ) || ( this -> OutputSpacing [ 2 ] != _arg3 ) ) { this -> OutputSpacing [ 0 ] = _arg1 ; this -> OutputSpacing [ 1 ] = _arg2 ; this -> OutputSpacing [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetOutputDimensionsOutputSpacing ( const double _arg [ 3 ] ) { this -> SetOutputDimensionsOutputSpacing ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetOutputDimensionsOutputSpacing ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << OutputSpacing  pointer  << this -> OutputSpacing ) ; return this -> OutputSpacing ; } VTK_WRAPEXCLUDE virtual void GetOutputDimensionsOutputSpacing ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> OutputSpacing [ 0 ] ; _arg2 = this -> OutputSpacing [ 1 ] ; _arg3 = this -> OutputSpacing [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << OutputSpacing  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetOutputDimensionsOutputSpacing ( double _arg [ 3 ] ) { this -> GetOutputDimensionsOutputSpacing ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  The desired magnification factor, meaning that the sample spacing will
##  be reduced by this factor.  This setting is only used if the ResizeMethod
##  is set to MagnificationFactors.
##  virtual void SetOutputDimensionsOutputSpacingMagnificationFactors ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << MagnificationFactors  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> MagnificationFactors [ 0 ] != _arg1 ) || ( this -> MagnificationFactors [ 1 ] != _arg2 ) || ( this -> MagnificationFactors [ 2 ] != _arg3 ) ) { this -> MagnificationFactors [ 0 ] = _arg1 ; this -> MagnificationFactors [ 1 ] = _arg2 ; this -> MagnificationFactors [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetOutputDimensionsOutputSpacingMagnificationFactors ( const double _arg [ 3 ] ) { this -> SetOutputDimensionsOutputSpacingMagnificationFactors ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetOutputDimensionsOutputSpacingMagnificationFactors ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << MagnificationFactors  pointer  << this -> MagnificationFactors ) ; return this -> MagnificationFactors ; } VTK_WRAPEXCLUDE virtual void GetOutputDimensionsOutputSpacingMagnificationFactors ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> MagnificationFactors [ 0 ] ; _arg2 = this -> MagnificationFactors [ 1 ] ; _arg3 = this -> MagnificationFactors [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << MagnificationFactors  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetOutputDimensionsOutputSpacingMagnificationFactors ( double _arg [ 3 ] ) { this -> GetOutputDimensionsOutputSpacingMagnificationFactors ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  If Border is Off (the default), then the centers of each of the corner
##  voxels will be considered to form the rectangular bounds of the image.
##  This is the way that VTK normally computes image bounds.  If Border is On,
##  then the image bounds will be defined by the outer corners of the voxels.
##  This setting impacts how the resizing is done.  For example, if a
##  MagnificationFactor of two is applied to a 256x256 image, the output
##  image will be 512x512 if Border is On, or 511x511 if Border is Off.
##  virtual void SetBorder ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Border  to  << _arg ) ; if ( this -> Border != _arg ) { this -> Border = _arg ; this -> Modified ( ) ; } } ; virtual void BorderOn ( ) { this -> SetBorder ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void BorderOff ( ) { this -> SetBorder ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual vtkTypeBool GetResizeMethodBorder ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Border  of  << this -> Border ) ; return this -> Border ; } ; /@} /@{ *
##  Whether to crop the input image before resizing (Off by default).  If this
##  is On, then the CroppingRegion must be set.
##  virtual void SetBorderCropping ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Cropping  to  << _arg ) ; if ( this -> Cropping != _arg ) { this -> Cropping = _arg ; this -> Modified ( ) ; } } ; virtual void CroppingOn ( ) { this -> SetBorderCropping ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void CroppingOff ( ) { this -> SetBorderCropping ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual vtkTypeBool GetResizeMethodBorderCropping ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Cropping  of  << this -> Cropping ) ; return this -> Cropping ; } ; /@} /@{ *
##  If Cropping is On, then the CroppingRegion will be used to crop the image
##  before it is resized.  The region must be specified in data coordinates,
##  rather than voxel indices.
##  virtual void SetCroppingRegion ( double _arg1 , double _arg2 , double _arg3 , double _arg4 , double _arg5 , double _arg6 ) { vtkDebugWithObjectMacro ( this , <<  setting  << CroppingRegion  to ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; if ( ( this -> CroppingRegion [ 0 ] != _arg1 ) || ( this -> CroppingRegion [ 1 ] != _arg2 ) || ( this -> CroppingRegion [ 2 ] != _arg3 ) || ( this -> CroppingRegion [ 3 ] != _arg4 ) || ( this -> CroppingRegion [ 4 ] != _arg5 ) || ( this -> CroppingRegion [ 5 ] != _arg6 ) ) { this -> CroppingRegion [ 0 ] = _arg1 ; this -> CroppingRegion [ 1 ] = _arg2 ; this -> CroppingRegion [ 2 ] = _arg3 ; this -> CroppingRegion [ 3 ] = _arg4 ; this -> CroppingRegion [ 4 ] = _arg5 ; this -> CroppingRegion [ 5 ] = _arg6 ; this -> Modified ( ) ; } } virtual void SetCroppingRegion ( const double _arg [ 6 ] ) { this -> SetCroppingRegion ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; virtual double * GetCroppingRegion ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << CroppingRegion  pointer  << this -> CroppingRegion ) ; return this -> CroppingRegion ; } VTK_WRAPEXCLUDE virtual void GetCroppingRegion ( double & _arg1 , double & _arg2 , double & _arg3 , double & _arg4 , double & _arg5 , double & _arg6 ) { _arg1 = this -> CroppingRegion [ 0 ] ; _arg2 = this -> CroppingRegion [ 1 ] ; _arg3 = this -> CroppingRegion [ 2 ] ; _arg4 = this -> CroppingRegion [ 3 ] ; _arg5 = this -> CroppingRegion [ 4 ] ; _arg6 = this -> CroppingRegion [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << CroppingRegion  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCroppingRegion ( double _arg [ 6 ] ) { this -> GetCroppingRegion ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; /@} /@{ *
##  Turn interpolation on or off (by default, interpolation is on).
##  virtual void SetBorderCroppingInterpolate ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Interpolate  to  << _arg ) ; if ( this -> Interpolate != _arg ) { this -> Interpolate = _arg ; this -> Modified ( ) ; } } ; virtual void InterpolateOn ( ) { this -> SetBorderCroppingInterpolate ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void InterpolateOff ( ) { this -> SetBorderCroppingInterpolate ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual vtkTypeBool GetResizeMethodBorderCroppingInterpolate ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Interpolate  of  << this -> Interpolate ) ; return this -> Interpolate ; } ; /@} /@{ *
##  Set the interpolator for resampling the data.
##  virtual void SetInterpolator ( vtkAbstractImageInterpolator * sampler ) ; virtual vtkAbstractImageInterpolator * GetInterpolator ( ) ; /@} *
##  Get the modified time of the filter.
##  vtkMTimeType GetMTime ( ) override ; protected : vtkImageResize ( ) ; ~ vtkImageResize ( ) override ; virtual vtkAbstractImageInterpolator * GetInternalInterpolator ( ) ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; void ThreadedRequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector , vtkImageData * * * inData , vtkImageData * * outData , int ext [ 6 ] , int id ) override ; int ResizeMethod ; int OutputDimensions [ 3 ] ; double OutputSpacing [ 3 ] ; double MagnificationFactors [ 3 ] ; vtkTypeBool Border ; vtkTypeBool Cropping ; double CroppingRegion [ 6 ] ; double IndexStretch [ 3 ] ; double IndexTranslate [ 3 ] ; vtkAbstractImageInterpolator * Interpolator ; vtkAbstractImageInterpolator * NNInterpolator ; vtkTypeBool Interpolate ; private : vtkImageResize ( const vtkImageResize & ) = delete ; void operator = ( const vtkImageResize & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!