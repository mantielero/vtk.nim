## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageContinuousDilate3D.h
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
##  @class   vtkImageContinuousDilate3D
##  @brief   Dilate implemented as a maximum.
##
##  vtkImageContinuousDilate3D replaces a pixel with the maximum over
##  an ellipsoidal neighborhood.  If KernelSize of an axis is 1, no processing
##  is done on that axis.
##

## !!!Ignored construct:  # vtkImageContinuousDilate3D_h [NewLine] # vtkImageContinuousDilate3D_h [NewLine] # vtkImageSpatialAlgorithm.h [NewLine] # vtkImagingMorphologicalModule.h  For export macro [NewLine] class vtkImageEllipsoidSource ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIMAGINGMORPHOLOGICAL_EXPORT vtkImageContinuousDilate3D : public vtkImageSpatialAlgorithm { public : /@{ *
##  Construct an instance of vtkImageContinuousDilate3D filter.
##  By default zero values are dilated.
##  static vtkImageContinuousDilate3D * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageSpatialAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageSpatialAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageContinuousDilate3D :: IsTypeOf ( type ) ; } static vtkImageContinuousDilate3D * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageContinuousDilate3D * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageContinuousDilate3D * NewInstance ( ) const { return vtkImageContinuousDilate3D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageSpatialAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageContinuousDilate3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageContinuousDilate3D :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  This method sets the size of the neighborhood.  It also sets the
##  default middle of the neighborhood and computes the elliptical foot print.
##  void SetKernelSize ( int size0 , int size1 , int size2 ) ; protected : vtkImageContinuousDilate3D ( ) ; ~ vtkImageContinuousDilate3D ( ) override ; vtkImageEllipsoidSource * Ellipse ; void ThreadedRequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector , vtkImageData * * * inData , vtkImageData * * outData , int outExt [ 6 ] , int id ) override ; int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; private : vtkImageContinuousDilate3D ( const vtkImageContinuousDilate3D & ) = delete ; void operator = ( const vtkImageContinuousDilate3D & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
