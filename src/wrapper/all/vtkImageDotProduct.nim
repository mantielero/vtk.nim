## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageDotProduct.h
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
##  @class   vtkImageDotProduct
##  @brief   Dot product of two vector images.
##
##  vtkImageDotProduct interprets the scalar components of two images
##  as vectors and takes the dot product vector by vector (pixel by pixel).
##

## !!!Ignored construct:  # vtkImageDotProduct_h [NewLine] # vtkImageDotProduct_h [NewLine] # vtkImagingMathModule.h  For export macro # vtkThreadedImageAlgorithm.h [NewLine] class VTKIMAGINGMATH_EXPORT vtkImageDotProduct : public vtkThreadedImageAlgorithm { public : static vtkImageDotProduct * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkThreadedImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkThreadedImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageDotProduct :: IsTypeOf ( type ) ; } static vtkImageDotProduct * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageDotProduct * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageDotProduct * NewInstance ( ) const { return vtkImageDotProduct :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkThreadedImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageDotProduct :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageDotProduct :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Set the two inputs to this filter
##  virtual void SetInput1Data ( vtkDataObject * in ) { this -> SetInputData ( 0 , in ) ; } virtual void SetInput2Data ( vtkDataObject * in ) { this -> SetInputData ( 1 , in ) ; } protected : vtkImageDotProduct ( ) ; ~ vtkImageDotProduct ( ) override = default ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; void ThreadedRequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector , vtkImageData * * * inData , vtkImageData * * outData , int outExt [ 6 ] , int threadId ) override ; private : vtkImageDotProduct ( const vtkImageDotProduct & ) = delete ; void operator = ( const vtkImageDotProduct & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
