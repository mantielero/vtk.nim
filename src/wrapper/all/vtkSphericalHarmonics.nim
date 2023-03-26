## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSphericalHarmonics.h
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
##  @class   vtkSphericalHarmonics
##  @brief   compute spherical harmonics of an equirectangular projection image
##
##  vtkSphericalHarmonics is a filter that computes spherical harmonics of an
##  equirectangular projection image representing a 360 degree image.
##  Its output is a vtkTable containing the third degree spherical harmonics coefficients.
##  This filter expects the image data to be a RGB image.
##  8-bits images are expected to be sRGB encoded and other formats are expected to be in
##  linear color space.
##

## !!!Ignored construct:  # vtkSphericalHarmonics_h [NewLine] # vtkSphericalHarmonics_h [NewLine] # vtkFiltersGeneralModule.h  For export macro # vtkImageAlgorithm.h [NewLine] class VTKFILTERSGENERAL_EXPORT vtkSphericalHarmonics : public vtkImageAlgorithm { public : static vtkSphericalHarmonics * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkSphericalHarmonics :: IsTypeOf ( type ) ; } static vtkSphericalHarmonics * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkSphericalHarmonics * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkSphericalHarmonics * NewInstance ( ) const { return vtkSphericalHarmonics :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSphericalHarmonics :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSphericalHarmonics :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : vtkSphericalHarmonics ( ) = default ; ~ vtkSphericalHarmonics ( ) override = default ;  Usual data generation method int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillOutputPortInformation ( int , vtkInformation * ) override ; private : vtkSphericalHarmonics ( const vtkSphericalHarmonics & ) = delete ; void operator = ( const vtkSphericalHarmonics & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
