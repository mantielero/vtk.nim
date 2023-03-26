## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSimpleImageFilterExample.h
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
##  @class   vtkSimpleImageFilterExample
##  @brief   Simple example of an image-image filter.
##
##  This is an example of a simple image-image filter. It copies it's input
##  to it's output (point by point). It shows how templates can be used
##  to support various data types.
##  @sa
##  vtkSimpleImageToImageFilter
##

## !!!Ignored construct:  # vtkSimpleImageFilterExample_h [NewLine] # vtkSimpleImageFilterExample_h [NewLine] # vtkDeprecation.h  For VTK_DEPRECATED_IN_9_1_0 # vtkImagingGeneralModule.h  For export macro # vtkSimpleImageToImageFilter.h [NewLine] VTK_DEPRECATED_IN_9_1_0 ( This class is an example and should not have been public ) class vtkSimpleImageFilterExample : public vtkSimpleImageToImageFilter { public : static vtkSimpleImageFilterExample * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkSimpleImageToImageFilter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkSimpleImageToImageFilter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkSimpleImageFilterExample :: IsTypeOf ( type ) ; } static vtkSimpleImageFilterExample * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkSimpleImageFilterExample * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkSimpleImageFilterExample * NewInstance ( ) const { return vtkSimpleImageFilterExample :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkSimpleImageToImageFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSimpleImageFilterExample :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSimpleImageFilterExample :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : vtkSimpleImageFilterExample ( ) = default ; ~ vtkSimpleImageFilterExample ( ) override = default ; void SimpleExecute ( vtkImageData * input , vtkImageData * output ) override ; private : vtkSimpleImageFilterExample ( const vtkSimpleImageFilterExample & ) = delete ; void operator = ( const vtkSimpleImageFilterExample & ) = delete ; } ;
## Error: expected ';'!!!
