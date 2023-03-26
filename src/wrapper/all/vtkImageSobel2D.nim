## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageSobel2D.h
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
##  @class   vtkImageSobel2D
##  @brief   Computes a vector field using sobel functions.
##
##  vtkImageSobel2D computes a vector field from a scalar field by using
##  Sobel functions.  The number of vector components is 2 because
##  the input is an image.  Output is always doubles.
##

## !!!Ignored construct:  # vtkImageSobel2D_h [NewLine] # vtkImageSobel2D_h [NewLine] # vtkImageSpatialAlgorithm.h [NewLine] # vtkImagingGeneralModule.h  For export macro [NewLine] class VTKIMAGINGGENERAL_EXPORT vtkImageSobel2D : public vtkImageSpatialAlgorithm { public : static vtkImageSobel2D * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageSpatialAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageSpatialAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageSobel2D :: IsTypeOf ( type ) ; } static vtkImageSobel2D * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageSobel2D * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageSobel2D * NewInstance ( ) const { return vtkImageSobel2D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageSpatialAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageSobel2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageSobel2D :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : vtkImageSobel2D ( ) ; ~ vtkImageSobel2D ( ) override = default ; void ThreadedRequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector , vtkImageData * * * inData , vtkImageData * * outData , int outExt [ 6 ] , int id ) override ; int RequestInformation ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; private : vtkImageSobel2D ( const vtkImageSobel2D & ) = delete ; void operator = ( const vtkImageSobel2D & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
