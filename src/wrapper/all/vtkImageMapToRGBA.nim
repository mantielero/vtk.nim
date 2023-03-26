## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageMapToRGBA.h
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
##  @class   vtkImageMapToRGBA
##  @brief   map the input image through a lookup table
##
##  This filter has been replaced by vtkImageMapToColors, which provided
##  additional features.  Use vtkImageMapToColors instead.
##
##  @sa
##  vtkLookupTable
##

## !!!Ignored construct:  # vtkImageMapToRGBA_h [NewLine] # vtkImageMapToRGBA_h [NewLine] # vtkImageMapToColors.h [NewLine] # vtkImagingColorModule.h  For export macro [NewLine] class VTKIMAGINGCOLOR_EXPORT vtkImageMapToRGBA : public vtkImageMapToColors { public : static vtkImageMapToRGBA * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageMapToColors Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageMapToColors :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageMapToRGBA :: IsTypeOf ( type ) ; } static vtkImageMapToRGBA * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageMapToRGBA * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageMapToRGBA * NewInstance ( ) const { return vtkImageMapToRGBA :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageMapToColors :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageMapToRGBA :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageMapToRGBA :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : vtkImageMapToRGBA ( ) = default ; ~ vtkImageMapToRGBA ( ) override = default ; private : vtkImageMapToRGBA ( const vtkImageMapToRGBA & ) = delete ; void operator = ( const vtkImageMapToRGBA & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
