## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGeoTransform.h
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
##  @class   vtkGeoTransform
##  @brief   A transformation between two geographic coordinate systems
##
##  This class takes two geographic projections and transforms point
##  coordinates between them.
##

## !!!Ignored construct:  # vtkGeoTransform_h [NewLine] # vtkGeoTransform_h [NewLine] # vtkAbstractTransform.h [NewLine] # vtkGeovisCoreModule.h  For export macro [NewLine] class vtkGeoProjection ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKGEOVISCORE_EXPORT vtkGeoTransform : public vtkAbstractTransform { public : static vtkGeoTransform * New ( ) ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkAbstractTransform Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkAbstractTransform :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkGeoTransform :: IsTypeOf ( type ) ; } static vtkGeoTransform * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkGeoTransform * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkGeoTransform * NewInstance ( ) const { return vtkGeoTransform :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractTransform :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGeoTransform :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGeoTransform :: New ( ) ; } public : ; /@{ *
##  The source geographic projection.
##  void SetSourceProjection ( vtkGeoProjection * source ) ; virtual vtkGeoProjection * GetnameSourceProjection ( ) { vtkDebugWithObjectMacro ( this , <<  returning  SourceProjection  address  << static_cast < vtkGeoProjection * > ( this -> SourceProjection ) ) ; return this -> SourceProjection ; } ; /@} /@{ *
##  The target geographic projection.
##  void SetDestinationProjection ( vtkGeoProjection * dest ) ; virtual vtkGeoProjection * GetnameSourceProjectionDestinationProjection ( ) { vtkDebugWithObjectMacro ( this , <<  returning  DestinationProjection  address  << static_cast < vtkGeoProjection * > ( this -> DestinationProjection ) ) ; return this -> DestinationProjection ; } ; /@} *
##  Transform many points at once.
##  void TransformPoints ( vtkPoints * src , vtkPoints * dst ) override ; *
##  Invert the transformation.
##  void Inverse ( ) override ; /@{ *
##  This will calculate the transformation without calling Update.
##  Meant for use only within other VTK classes.
##  void InternalTransformPoint ( const float in [ 3 ] , float out [ 3 ] ) override ; void InternalTransformPoint ( const double in [ 3 ] , double out [ 3 ] ) override ; /@} /@{ *
##  Computes Universal Transverse Mercator (UTM) zone given the
##  longitude and latitude of the point.
##  It correctly computes the zones in the two exception areas.
##  It returns an integer between 1 and 60 for valid long lat, or 0 otherwise.
##
##  static int ComputeUTMZone ( double lon , double lat ) ; static int ComputeUTMZone ( double * lonlat ) { return ComputeUTMZone ( lonlat [ 0 ] , lonlat [ 1 ] ) ; } /@} /@{ *
##  This will transform a point and, at the same time, calculate a
##  3x3 Jacobian matrix that provides the partial derivatives of the
##  transformation at that point.  This method does not call Update.
##  Meant for use only within other VTK classes.
##  void InternalTransformDerivative ( const float in [ 3 ] , float out [ 3 ] , float derivative [ 3 ] [ 3 ] ) override ; void InternalTransformDerivative ( const double in [ 3 ] , double out [ 3 ] , double derivative [ 3 ] [ 3 ] ) override ; /@} *
##  Make another transform of the same type.
##  vtkAbstractTransform * MakeTransform ( ) override ; protected : vtkGeoTransform ( ) ; ~ vtkGeoTransform ( ) override ; void InternalTransformPoints ( double * ptsInOut , vtkIdType numPts , int stride ) ; vtkGeoProjection * SourceProjection ; vtkGeoProjection * DestinationProjection ; private : vtkGeoTransform ( const vtkGeoTransform & ) = delete ; void operator = ( const vtkGeoTransform & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
