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
##  @brief   Accelerated point to cell interpolation filter.
##
##  vtkmAverageToPoints is a filter that transforms point data (i.e., data
##  specified at cell points) into cell data (i.e., data specified per cell).
##  The method of transformation is based on averaging the data
##  values of all points used by particular cell. This filter will also
##  pass through any existing point and cell arrays.
##
##

## !!!Ignored construct:  # vtkmAverageToCells_h [NewLine] # vtkmAverageToCells_h [NewLine] # vtkAcceleratorsVTKmFiltersModule.h required for correct implementation # vtkDataSetAlgorithm.h [NewLine] class VTKACCELERATORSVTKMFILTERS_EXPORT vtkmAverageToCells : public vtkDataSetAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkmAverageToCells :: IsTypeOf ( type ) ; } static vtkmAverageToCells * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkmAverageToCells * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkmAverageToCells * NewInstance ( ) const { return vtkmAverageToCells :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkmAverageToCells :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkmAverageToCells :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkmAverageToCells * New ( ) ; protected : vtkmAverageToCells ( ) ; ~ vtkmAverageToCells ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkmAverageToCells ( const vtkmAverageToCells & ) = delete ; void operator = ( const vtkmAverageToCells & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
