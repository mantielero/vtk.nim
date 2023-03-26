## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGeoMath.h
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
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkGeoMath
##  @brief   Useful geographic calculations
##
##
##  vtkGeoMath provides some useful geographic calculations.
##

## !!!Ignored construct:  # vtkGeoMath_h [NewLine] # vtkGeoMath_h [NewLine] # vtkInfovisLayoutModule.h  For export macro # vtkObject.h [NewLine] class VTKINFOVISLAYOUT_EXPORT vtkGeoMath : public vtkObject { public : static vtkGeoMath * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkGeoMath :: IsTypeOf ( type ) ; } static vtkGeoMath * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkGeoMath * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkGeoMath * NewInstance ( ) const { return vtkGeoMath :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGeoMath :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGeoMath :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Returns the average radius of the earth in meters.
##  static double EarthRadiusMeters ( ) { return 6356750.0 ; } *
##  Returns the squared distance between two points.
##  static double DistanceSquared ( double pt0 [ 3 ] , double pt1 [ 3 ] ) ; *
##  Converts a (longitude, latitude, altitude) triple to
##  world coordinates where the center of the earth is at the origin.
##  Units are in meters.
##  Note that having altitude realtive to sea level causes issues.
##  static void LongLatAltToRect ( double longLatAlt [ 3 ] , double rect [ 3 ] ) ; protected : vtkGeoMath ( ) ; ~ vtkGeoMath ( ) override ; private : vtkGeoMath ( const vtkGeoMath & ) = delete ; void operator = ( const vtkGeoMath & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
