## =============================================================================
##
##   Copyright (c) Kitware, Inc.
##   All rights reserved.
##   See LICENSE.txt for details.
##
##   This software is distributed WITHOUT ANY WARRANTY; without even
##   the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##   PURPOSE.  See the above copyright notice for more information.
##
##   Copyright 2012 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
##
## =============================================================================
## *
##  @class   vtkmCoordinateSystemTransform
##  @brief   transform a coordinate system between Cartesian&Cylindrical and
##           Cartesian&Spherical
##
##  vtkmCoordinateSystemTransform is a filter that transforms a coordinate system
##  between Cartesian&Cylindrical and Cartesian&Spherical.
##

## !!!Ignored construct:  # vtkmCoordinateSystemTransform_h [NewLine] # vtkmCoordinateSystemTransform_h [NewLine] # vtkAcceleratorsVTKmFiltersModule.h  required for correct export # vtkPointSetAlgorithm.h [NewLine] class VTKACCELERATORSVTKMFILTERS_EXPORT vtkmCoordinateSystemTransform : public vtkPointSetAlgorithm { enum struct TransformTypes { None , CarToCyl , CylToCar , CarToSph , SphToCar } ; public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPointSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPointSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkmCoordinateSystemTransform :: IsTypeOf ( type ) ; } static vtkmCoordinateSystemTransform * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkmCoordinateSystemTransform * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkmCoordinateSystemTransform * NewInstance ( ) const { return vtkmCoordinateSystemTransform :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPointSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkmCoordinateSystemTransform :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkmCoordinateSystemTransform :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkmCoordinateSystemTransform * New ( ) ; void SetCartesianToCylindrical ( ) ; void SetCylindricalToCartesian ( ) ; void SetCartesianToSpherical ( ) ; void SetSphericalToCartesian ( ) ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; protected : vtkmCoordinateSystemTransform ( ) ; ~ vtkmCoordinateSystemTransform ( ) override ; int RequestDataObject ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkmCoordinateSystemTransform ( const vtkmCoordinateSystemTransform & ) = delete ; void operator = ( const vtkmCoordinateSystemTransform & ) = delete ; TransformTypes TransformType ; } ;
## Error: token expected: ; but got: [identifier]!!!
