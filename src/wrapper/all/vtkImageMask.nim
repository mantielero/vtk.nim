## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageMask.h
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
##  @class   vtkImageMask
##  @brief   Combines a mask and an image.
##
##  vtkImageMask combines a mask with an image.  Non zero mask
##  implies the output pixel will be the same as the image.
##  If a mask pixel is zero,  then the output pixel
##  is set to "MaskedValue".  The filter also has the option to pass
##  the mask through a boolean not operation before processing the image.
##  This reverses the passed and replaced pixels.
##  The two inputs should have the same "WholeExtent".
##  The mask input should be unsigned char, and the image scalar type
##  is the same as the output scalar type.
##

## !!!Ignored construct:  # vtkImageMask_h [NewLine] # vtkImageMask_h [NewLine] # vtkImagingCoreModule.h  For export macro # vtkThreadedImageAlgorithm.h [NewLine] class VTKIMAGINGCORE_EXPORT vtkImageMask : public vtkThreadedImageAlgorithm { public : static vtkImageMask * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkThreadedImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkThreadedImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageMask :: IsTypeOf ( type ) ; } static vtkImageMask * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageMask * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageMask * NewInstance ( ) const { return vtkImageMask :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkThreadedImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageMask :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageMask :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  SetGet the value of the output pixel replaced by mask.
##  void SetMaskedOutputValue ( int num , double * v ) ; void SetMaskedOutputValue ( double v ) { this -> SetMaskedOutputValue ( 1 , & v ) ; } void SetMaskedOutputValue ( double v1 , double v2 ) { double v [ 2 ] ; v [ 0 ] = v1 ; v [ 1 ] = v2 ; this -> SetMaskedOutputValue ( 2 , v ) ; } void SetMaskedOutputValue ( double v1 , double v2 , double v3 ) { double v [ 3 ] ; v [ 0 ] = v1 ; v [ 1 ] = v2 ; v [ 2 ] = v3 ; this -> SetMaskedOutputValue ( 3 , v ) ; } double * GetMaskedOutputValue ( ) { return this -> MaskedOutputValue ; } int GetMaskedOutputValueLength ( ) { return this -> MaskedOutputValueLength ; } /@{ *
##  Set/Get the alpha blending value for the mask
##  The input image is assumed to be at alpha = 1.0
##  and the mask image uses this alpha to blend using
##  an over operator.
##  virtual void SetMaskAlpha ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << MaskAlpha  to  << _arg ) ; if ( this -> MaskAlpha != ( _arg < 0.0 ? 0.0 : ( _arg > 1.0 ? 1.0 : _arg ) ) ) { this -> MaskAlpha = ( _arg < 0.0 ? 0.0 : ( _arg > 1.0 ? 1.0 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetMaskAlphaMinValue ( ) { return 0.0 ; } virtual double GetMaskAlphaMaxValue ( ) { return 1.0 ; } ; virtual double GetMaskAlpha ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaskAlpha  of  << this -> MaskAlpha ) ; return this -> MaskAlpha ; } ; /@} *
##  Set the input to be masked.
##  void SetImageInputData ( vtkImageData * in ) ; *
##  Set the mask to be used.
##  void SetMaskInputData ( vtkImageData * in ) ; /@{ *
##  When Not Mask is on, the mask is passed through a boolean not
##  before it is used to mask the image.  The effect is to pass the
##  pixels where the input mask is zero, and replace the pixels
##  where the input value is non zero.
##  virtual void SetNotMask ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NotMask  to  << _arg ) ; if ( this -> NotMask != _arg ) { this -> NotMask = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetMaskAlphaNotMask ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NotMask  of  << this -> NotMask ) ; return this -> NotMask ; } ; virtual void NotMaskOn ( ) { this -> SetNotMask ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void NotMaskOff ( ) { this -> SetNotMask ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} *
##  Set the two inputs to this filter
##  virtual void SetInput1Data ( vtkDataObject * in ) { this -> SetInputData ( 0 , in ) ; } virtual void SetInput2Data ( vtkDataObject * in ) { this -> SetInputData ( 1 , in ) ; } protected : vtkImageMask ( ) ; ~ vtkImageMask ( ) override ; double * MaskedOutputValue ; int MaskedOutputValueLength ; vtkTypeBool NotMask ; double MaskAlpha ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; void ThreadedRequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector , vtkImageData * * * inData , vtkImageData * * outData , int outExt [ 6 ] , int threadId ) override ; private : vtkImageMask ( const vtkImageMask & ) = delete ; void operator = ( const vtkImageMask & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
