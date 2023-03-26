## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSphericalTransform.h
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
##  @class   vtkSphericalTransform
##  @brief   spherical to rectangular coords and back
##
##  vtkSphericalTransform will convert (r,phi,theta) coordinates to
##  (x,y,z) coordinates and back again.  The angles are given in radians.
##  By default, it converts spherical coordinates to rectangular, but
##  GetInverse() returns a transform that will do the opposite.  The equation
##  that is used is x = r*sin(phi)*cos(theta), y = r*sin(phi)*sin(theta),
##  z = r*cos(phi).
##  @warning
##  This transform is not well behaved along the line x=y=0 (i.e. along
##  the z-axis)
##  @sa
##  vtkCylindricalTransform vtkGeneralTransform
##

## !!!Ignored construct:  # vtkSphericalTransform_h [NewLine] # vtkSphericalTransform_h [NewLine] # vtkCommonTransformsModule.h  For export macro # vtkWarpTransform.h [NewLine] class VTKCOMMONTRANSFORMS_EXPORT vtkSphericalTransform : public vtkWarpTransform { public : static vtkSphericalTransform * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkWarpTransform Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkWarpTransform :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkSphericalTransform :: IsTypeOf ( type ) ; } static vtkSphericalTransform * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkSphericalTransform * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkSphericalTransform * NewInstance ( ) const { return vtkSphericalTransform :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWarpTransform :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSphericalTransform :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSphericalTransform :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Make another transform of the same type.
##  vtkAbstractTransform * MakeTransform ( ) override ; protected : vtkSphericalTransform ( ) ; ~ vtkSphericalTransform ( ) override ; *
##  Copy this transform from another of the same type.
##  void InternalDeepCopy ( vtkAbstractTransform * transform ) override ; /@{ *
##  Internal functions for calculating the transformation.
##  void ForwardTransformPoint ( const float in [ 3 ] , float out [ 3 ] ) override ; void ForwardTransformPoint ( const double in [ 3 ] , double out [ 3 ] ) override ; /@} void ForwardTransformDerivative ( const float in [ 3 ] , float out [ 3 ] , float derivative [ 3 ] [ 3 ] ) override ; void ForwardTransformDerivative ( const double in [ 3 ] , double out [ 3 ] , double derivative [ 3 ] [ 3 ] ) override ; void InverseTransformPoint ( const float in [ 3 ] , float out [ 3 ] ) override ; void InverseTransformPoint ( const double in [ 3 ] , double out [ 3 ] ) override ; void InverseTransformDerivative ( const float in [ 3 ] , float out [ 3 ] , float derivative [ 3 ] [ 3 ] ) override ; void InverseTransformDerivative ( const double in [ 3 ] , double out [ 3 ] , double derivative [ 3 ] [ 3 ] ) override ; private : vtkSphericalTransform ( const vtkSphericalTransform & ) = delete ; void operator = ( const vtkSphericalTransform & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
