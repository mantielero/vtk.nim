## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBlankStructuredGridWithImage.h
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
##  @class   vtkBlankStructuredGridWithImage
##  @brief   blank a structured grid with an image
##
##  This filter can be used to set the blanking in a structured grid with
##  an image. The filter takes two inputs: the structured grid to blank,
##  and the image used to set the blanking. Make sure that the dimensions of
##  both the image and the structured grid are identical.
##
##  Note that the image is interpreted as follows: zero values indicate that
##  the structured grid point is blanked; non-zero values indicate that the
##  structured grid point is visible. The blanking data must be unsigned char.
##
##  @sa
##  vtkStructuredGrid
##

## !!!Ignored construct:  # vtkBlankStructuredGridWithImage_h [NewLine] # vtkBlankStructuredGridWithImage_h [NewLine] # vtkFiltersGeneralModule.h  For export macro # vtkStructuredGridAlgorithm.h [NewLine] class vtkImageData ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSGENERAL_EXPORT vtkBlankStructuredGridWithImage : public vtkStructuredGridAlgorithm { public : static vtkBlankStructuredGridWithImage * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkStructuredGridAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkStructuredGridAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkBlankStructuredGridWithImage :: IsTypeOf ( type ) ; } static vtkBlankStructuredGridWithImage * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkBlankStructuredGridWithImage * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkBlankStructuredGridWithImage * NewInstance ( ) const { return vtkBlankStructuredGridWithImage :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkStructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBlankStructuredGridWithImage :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBlankStructuredGridWithImage :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set / get the input image used to perform the blanking.
##  void SetBlankingInputData ( vtkImageData * input ) ; vtkImageData * GetBlankingInput ( ) ; /@} protected : vtkBlankStructuredGridWithImage ( ) ; ~ vtkBlankStructuredGridWithImage ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; private : vtkBlankStructuredGridWithImage ( const vtkBlankStructuredGridWithImage & ) = delete ; void operator = ( const vtkBlankStructuredGridWithImage & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
