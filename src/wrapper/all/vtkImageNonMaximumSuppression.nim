## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageNonMaximumSuppression.h
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
##  @class   vtkImageNonMaximumSuppression
##  @brief   Performs non-maximum suppression
##
##  vtkImageNonMaximumSuppression Sets to zero any pixel that is not a peak.
##  If a pixel has a neighbor along the vector that has larger magnitude, the
##  smaller pixel is set to zero.  The filter takes two inputs: a magnitude
##  and a vector.  Output is magnitude information and is always in doubles.
##  Typically this filter is used with vtkImageGradient and
##  vtkImageGradientMagnitude as inputs.
##

## !!!Ignored construct:  # vtkImageNonMaximumSuppression_h [NewLine] # vtkImageNonMaximumSuppression_h [NewLine] # VTK_IMAGE_NON_MAXIMUM_SUPPRESSION_MAGNITUDE_INPUT 0 [NewLine] # VTK_IMAGE_NON_MAXIMUM_SUPPRESSION_VECTOR_INPUT 1 [NewLine] # vtkImageData.h  makes things a bit easier # vtkImagingMorphologicalModule.h  For export macro # vtkThreadedImageAlgorithm.h [NewLine] class VTKIMAGINGMORPHOLOGICAL_EXPORT vtkImageNonMaximumSuppression : public vtkThreadedImageAlgorithm { public : static vtkImageNonMaximumSuppression * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkThreadedImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkThreadedImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageNonMaximumSuppression :: IsTypeOf ( type ) ; } static vtkImageNonMaximumSuppression * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageNonMaximumSuppression * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageNonMaximumSuppression * NewInstance ( ) const { return vtkImageNonMaximumSuppression :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkThreadedImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageNonMaximumSuppression :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageNonMaximumSuppression :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set the magnitude and vector inputs.
##  void SetMagnitudeInputData ( vtkImageData * input ) { this -> SetInputData ( 0 , input ) ; } void SetVectorInputData ( vtkImageData * input ) { this -> SetInputData ( 1 , input ) ; } /@} /@{ *
##  If "HandleBoundariesOn" then boundary pixels are duplicated
##  So central differences can get values.
##  virtual void SetHandleBoundaries ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  HandleBoundaries  to  << _arg ) ; if ( this -> HandleBoundaries != _arg ) { this -> HandleBoundaries = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetHandleBoundaries ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HandleBoundaries  of  << this -> HandleBoundaries ) ; return this -> HandleBoundaries ; } ; virtual void HandleBoundariesOn ( ) { this -> SetHandleBoundaries ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void HandleBoundariesOff ( ) { this -> SetHandleBoundaries ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Determines how the input is interpreted (set of 2d slices or a 3D volume)
##  virtual void SetDimensionality ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Dimensionality  to  << _arg ) ; if ( this -> Dimensionality != ( _arg < 2 ? 2 : ( _arg > 3 ? 3 : _arg ) ) ) { this -> Dimensionality = ( _arg < 2 ? 2 : ( _arg > 3 ? 3 : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetDimensionalityMinValue ( ) { return 2 ; } virtual int GetDimensionalityMaxValue ( ) { return 3 ; } ; virtual int GetHandleBoundariesDimensionality ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Dimensionality  of  << this -> Dimensionality ) ; return this -> Dimensionality ; } ; /@} protected : vtkImageNonMaximumSuppression ( ) ; ~ vtkImageNonMaximumSuppression ( ) override = default ; vtkTypeBool HandleBoundaries ; int Dimensionality ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; void ThreadedRequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector , vtkImageData * * * inData , vtkImageData * * outData , int outExt [ 6 ] , int threadId ) override ; private : vtkImageNonMaximumSuppression ( const vtkImageNonMaximumSuppression & ) = delete ; void operator = ( const vtkImageNonMaximumSuppression & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
