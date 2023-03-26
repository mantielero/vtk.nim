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
##  @class   vtkmAverageToPoints
##  @brief   Accelerated cell to point interpolation filter.
##
##  vtkmAverageToPoints is a filter that transforms cell data (i.e., data
##  specified per cell) into point data (i.e., data specified at cell
##  points). The method of transformation is based on averaging the data
##  values of all cells using a particular point. This filter will also
##  pass through any existing point and cell arrays.
##
##

## !!!Ignored construct:  # vtkmAverageToPoints_h [NewLine] # vtkmAverageToPoints_h [NewLine] # vtkAcceleratorsVTKmFiltersModule.h required for correct implementation # vtkDataSetAlgorithm.h [NewLine] class VTKACCELERATORSVTKMFILTERS_EXPORT vtkmAverageToPoints : public vtkDataSetAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkmAverageToPoints :: IsTypeOf ( type ) ; } static vtkmAverageToPoints * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkmAverageToPoints * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkmAverageToPoints * NewInstance ( ) const { return vtkmAverageToPoints :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkmAverageToPoints :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkmAverageToPoints :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkmAverageToPoints * New ( ) ; protected : vtkmAverageToPoints ( ) ; ~ vtkmAverageToPoints ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkmAverageToPoints ( const vtkmAverageToPoints & ) = delete ; void operator = ( const vtkmAverageToPoints & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
