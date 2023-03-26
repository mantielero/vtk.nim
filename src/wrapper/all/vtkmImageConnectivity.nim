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
##  @class   vtkmImageConnectivity
##  @brief   Label regions inside an image by connectivity
##
##  vtkmImageConnectivity will identify connected regions within an
##  image and label them.
##  The filter finds groups of points that have the same field value and are
##  connected together through their topology. Any point is considered to be
##  connected to its Moore neighborhood:
##  - 8 neighboring points for 2D
##  - 27 neighboring points for 3D
##
##  The active field passed to the filter must be associated with the points.
##  The result of the filter is a point field of type vtkIdType.
##  Each entry in the point field will be a number that identifies to which
##  region it belongs. By default, this output point field is named “component”.
##
##  @sa
##  vtkConnectivityFilter, vtkImageConnectivityFilter
##

## !!!Ignored construct:  # vtkmImageConnectivity_h [NewLine] # vtkmImageConnectivity_h [NewLine] # vtkAcceleratorsVTKmFiltersModule.h required for correct implementation # vtkImageAlgorithm.h [NewLine] class VTKACCELERATORSVTKMFILTERS_EXPORT vtkmImageConnectivity : public vtkImageAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkmImageConnectivity :: IsTypeOf ( type ) ; } static vtkmImageConnectivity * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkmImageConnectivity * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkmImageConnectivity * NewInstance ( ) const { return vtkmImageConnectivity :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkmImageConnectivity :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkmImageConnectivity :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkmImageConnectivity * New ( ) ; protected : vtkmImageConnectivity ( ) ; ~ vtkmImageConnectivity ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkmImageConnectivity ( const vtkmImageConnectivity & ) = delete ; void operator = ( const vtkmImageConnectivity & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
