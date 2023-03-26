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
##  @class   vtkmContour
##  @brief   generate isosurface(s) from volume
##
##  vtkmContour is a filter that takes as input a volume (e.g., 3D
##  structured point set) and generates on output one or more isosurfaces.
##  One or more contour values must be specified to generate the isosurfaces.
##  Alternatively, you can specify a min/max scalar range and the number of
##  contours to generate a series of evenly spaced contour values.
##
##  @warning
##  This filter is currently only supports 3D volumes. If you are interested in
##  contouring other types of data, use the general vtkContourFilter. If you
##  want to contour an image (i.e., a volume slice), use vtkMarchingSquares.
##
##

## !!!Ignored construct:  # vtkmContour_h [NewLine] # vtkmContour_h [NewLine] # vtkAcceleratorsVTKmFiltersModule.h required for correct implementation # vtkContourFilter.h [NewLine] class VTKACCELERATORSVTKMFILTERS_EXPORT vtkmContour : public vtkContourFilter { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkContourFilter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkContourFilter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkmContour :: IsTypeOf ( type ) ; } static vtkmContour * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkmContour * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkmContour * NewInstance ( ) const { return vtkmContour :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkContourFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkmContour :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkmContour :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkmContour * New ( ) ; protected : / \brief Check if the input dataset and parameters combination is supported by this filter
## /
## / Certain input and parameters combinations are not currently supported by vtkm.
## / This information is internally used to determine if this filter should fall back to
## / Superclass implementaion. bool CanProcessInput ( vtkDataSet * input ) ; vtkmContour ( ) ; ~ vtkmContour ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkmContour ( const vtkmContour & ) = delete ; void operator = ( const vtkmContour & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
