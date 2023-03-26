## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageGradientMagnitude.h
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
##  @class   vtkImageGradientMagnitude
##  @brief   Computes magnitude of the gradient.
##
##
##  vtkImageGradientMagnitude computes the gradient magnitude of an image.
##  Setting the dimensionality determines whether the gradient is computed on
##  2D images, or 3D volumes.  The default is two dimensional XY images.
##
##  @sa
##  vtkImageGradient vtkImageMagnitude
##

## !!!Ignored construct:  # vtkImageGradientMagnitude_h [NewLine] # vtkImageGradientMagnitude_h [NewLine] # vtkImagingGeneralModule.h  For export macro # vtkThreadedImageAlgorithm.h [NewLine] class VTKIMAGINGGENERAL_EXPORT vtkImageGradientMagnitude : public vtkThreadedImageAlgorithm { public : static vtkImageGradientMagnitude * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkThreadedImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkThreadedImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageGradientMagnitude :: IsTypeOf ( type ) ; } static vtkImageGradientMagnitude * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageGradientMagnitude * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageGradientMagnitude * NewInstance ( ) const { return vtkImageGradientMagnitude :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkThreadedImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageGradientMagnitude :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageGradientMagnitude :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  If "HandleBoundariesOn" then boundary pixels are duplicated
##  So central differences can get values.
##  virtual void SetHandleBoundaries ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  HandleBoundaries  to  << _arg ) ; if ( this -> HandleBoundaries != _arg ) { this -> HandleBoundaries = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetHandleBoundaries ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HandleBoundaries  of  << this -> HandleBoundaries ) ; return this -> HandleBoundaries ; } ; virtual void HandleBoundariesOn ( ) { this -> SetHandleBoundaries ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void HandleBoundariesOff ( ) { this -> SetHandleBoundaries ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Determines how the input is interpreted (set of 2d slices ...)
##  virtual void SetDimensionality ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Dimensionality  to  << _arg ) ; if ( this -> Dimensionality != ( _arg < 2 ? 2 : ( _arg > 3 ? 3 : _arg ) ) ) { this -> Dimensionality = ( _arg < 2 ? 2 : ( _arg > 3 ? 3 : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetDimensionalityMinValue ( ) { return 2 ; } virtual int GetDimensionalityMaxValue ( ) { return 3 ; } ; virtual int GetHandleBoundariesDimensionality ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Dimensionality  of  << this -> Dimensionality ) ; return this -> Dimensionality ; } ; /@} protected : vtkImageGradientMagnitude ( ) ; ~ vtkImageGradientMagnitude ( ) override = default ; vtkTypeBool HandleBoundaries ; int Dimensionality ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; void ThreadedExecute ( vtkImageData * inData , vtkImageData * outData , int outExt [ 6 ] , int id ) override ; private : vtkImageGradientMagnitude ( const vtkImageGradientMagnitude & ) = delete ; void operator = ( const vtkImageGradientMagnitude & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
