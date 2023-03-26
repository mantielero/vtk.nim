## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCylindricalTransform.h
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
##  @class   vtkCylindricalTransform
##  @brief   cylindrical to rectangular coords and back
##
##  vtkCylindricalTransform will convert (r,theta,z) coordinates to
##  (x,y,z) coordinates and back again.  The angles are given in radians.
##  By default, it converts cylindrical coordinates to rectangular, but
##  GetInverse() returns a transform that will do the opposite.  The
##  equation that is used is x = r*cos(theta), y = r*sin(theta), z = z.
##  @warning
##  This transform is not well behaved along the line x=y=0 (i.e. along
##  the z-axis)
##  @sa
##  vtkSphericalTransform vtkGeneralTransform
##

## !!!Ignored construct:  # vtkCylindricalTransform_h [NewLine] # vtkCylindricalTransform_h [NewLine] # vtkCommonTransformsModule.h  For export macro # vtkWarpTransform.h [NewLine] class VTKCOMMONTRANSFORMS_EXPORT vtkCylindricalTransform : public vtkWarpTransform { public : static vtkCylindricalTransform * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkWarpTransform Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkWarpTransform :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkCylindricalTransform :: IsTypeOf ( type ) ; } static vtkCylindricalTransform * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkCylindricalTransform * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkCylindricalTransform * NewInstance ( ) const { return vtkCylindricalTransform :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWarpTransform :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCylindricalTransform :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCylindricalTransform :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Make another transform of the same type.
##  vtkAbstractTransform * MakeTransform ( ) override ; protected : vtkCylindricalTransform ( ) ; ~ vtkCylindricalTransform ( ) override ; *
##  Copy this transform from another of the same type.
##  void InternalDeepCopy ( vtkAbstractTransform * transform ) override ; /@{ *
##  Internal functions for calculating the transformation.
##  void ForwardTransformPoint ( const float in [ 3 ] , float out [ 3 ] ) override ; void ForwardTransformPoint ( const double in [ 3 ] , double out [ 3 ] ) override ; /@} void ForwardTransformDerivative ( const float in [ 3 ] , float out [ 3 ] , float derivative [ 3 ] [ 3 ] ) override ; void ForwardTransformDerivative ( const double in [ 3 ] , double out [ 3 ] , double derivative [ 3 ] [ 3 ] ) override ; void InverseTransformPoint ( const float in [ 3 ] , float out [ 3 ] ) override ; void InverseTransformPoint ( const double in [ 3 ] , double out [ 3 ] ) override ; void InverseTransformDerivative ( const float in [ 3 ] , float out [ 3 ] , float derivative [ 3 ] [ 3 ] ) override ; void InverseTransformDerivative ( const double in [ 3 ] , double out [ 3 ] , double derivative [ 3 ] [ 3 ] ) override ; private : vtkCylindricalTransform ( const vtkCylindricalTransform & ) = delete ; void operator = ( const vtkCylindricalTransform & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
