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
##  @class   vtkmWarpScalar
##  @brief   deform geometry with scalar data
##
##  vtkmWarpScalar is a filter that modifies point coordinates by moving points
##  along point normals by the scalar amount times the scalar factor with vtkm
##  as its backend.
##  Useful for creating carpet or x-y-z plots.
##
##  If normals are not present in data, the Normal instance variable will
##  be used as the direction along which to warp the geometry. If normals are
##  present but you would like to use the Normal instance variable, set the
##  UseNormal boolean to true.
##
##  If XYPlane boolean is set true, then the z-value is considered to be
##  a scalar value (still scaled by scale factor), and the displacement is
##  along the z-axis. If scalars are also present, these are copied through
##  and can be used to color the surface.
##
##  Note that the filter passes both its point data and cell data to
##  its output, except for normals, since these are distorted by the
##  warping.
##

## !!!Ignored construct:  # vtkmWarpScalar_h [NewLine] # vtkmWarpScalar_h [NewLine] # vtkAcceleratorsVTKmFiltersModule.h  required for correct export # vtkWarpScalar.h [NewLine] class VTKACCELERATORSVTKMFILTERS_EXPORT vtkmWarpScalar : public vtkWarpScalar { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkWarpScalar Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkWarpScalar :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkmWarpScalar :: IsTypeOf ( type ) ; } static vtkmWarpScalar * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkmWarpScalar * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkmWarpScalar * NewInstance ( ) const { return vtkmWarpScalar :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWarpScalar :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkmWarpScalar :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkmWarpScalar :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkmWarpScalar * New ( ) ; protected : vtkmWarpScalar ( ) ; ~ vtkmWarpScalar ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkmWarpScalar ( const vtkmWarpScalar & ) = delete ; void operator = ( const vtkmWarpScalar & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
