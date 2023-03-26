## =========================================================================
##
## Program:   Visualization Toolkit
## Module:    vtkQImageToImageSource.h
##
## Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
## All rights reserved.
## See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
## This software is distributed WITHOUT ANY WARRANTY; without even
## the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
## PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkQImageToImageSource
##  @brief   Create image data from a QImage.
##
##  vtkQImageToImageSource produces image data from a QImage.
##

## !!!Ignored construct:  # vtkQImageToImageSource_h [NewLine] # vtkQImageToImageSource_h [NewLine] # vtkImageAlgorithm.h [NewLine] # vtkRenderingQtModule.h  For export macro [NewLine] class QImage ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKRENDERINGQT_EXPORT vtkQImageToImageSource : public vtkImageAlgorithm { public : static vtkQImageToImageSource * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkQImageToImageSource :: IsTypeOf ( type ) ; } static vtkQImageToImageSource * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkQImageToImageSource * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkQImageToImageSource * NewInstance ( ) const { return vtkQImageToImageSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkQImageToImageSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkQImageToImageSource :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Set/Get QImage surface to be used.
##  void SetQImage ( QImage * image ) { this -> QtImage = image ; this -> Modified ( ) ; } const QImage * GetQImage ( ) { return QtImage ; } protected : vtkQImageToImageSource ( ) ; ~ vtkQImageToImageSource ( ) override = default ; const QImage * QtImage ; int DataExtent [ 6 ] ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestInformation ( vtkInformation * vtkNotUsed ( request ) , vtkInformationVector * * vtkNotUsed ( inputVector ) , vtkInformationVector * outputVector ) override ; private : vtkQImageToImageSource ( const vtkQImageToImageSource & ) = delete ; void operator = ( const vtkQImageToImageSource & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
