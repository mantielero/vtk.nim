## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkIdentityTransform.h
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
##  @class   vtkIdentityTransform
##  @brief   a transform that doesn't do anything
##
##  vtkIdentityTransform is a transformation which will simply pass coordinate
##  data unchanged.  All other transform types can also do this, however,
##  the vtkIdentityTransform does so with much greater efficiency.
##  @sa
##  vtkLinearTransform
##

## !!!Ignored construct:  # vtkIdentityTransform_h [NewLine] # vtkIdentityTransform_h [NewLine] # vtkCommonTransformsModule.h  For export macro # vtkLinearTransform.h [NewLine] class VTKCOMMONTRANSFORMS_EXPORT vtkIdentityTransform : public vtkLinearTransform { public : static vtkIdentityTransform * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkLinearTransform Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkLinearTransform :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkIdentityTransform :: IsTypeOf ( type ) ; } static vtkIdentityTransform * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkIdentityTransform * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkIdentityTransform * NewInstance ( ) const { return vtkIdentityTransform :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkLinearTransform :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkIdentityTransform :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkIdentityTransform :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Apply the transformation to a series of points, and append the
##  results to outPts.
##  void TransformPoints ( vtkPoints * inPts , vtkPoints * outPts ) override ; *
##  Apply the transformation to a series of normals, and append the
##  results to outNms.
##  void TransformNormals ( vtkDataArray * inNms , vtkDataArray * outNms ) override ; *
##  Apply the transformation to a series of vectors, and append the
##  results to outVrs.
##  void TransformVectors ( vtkDataArray * inVrs , vtkDataArray * outVrs ) override ; *
##  Apply the transformation to a combination of points, normals
##  and vectors.
##  void TransformPointsNormalsVectors ( vtkPoints * inPts , vtkPoints * outPts , vtkDataArray * inNms , vtkDataArray * outNms , vtkDataArray * inVrs , vtkDataArray * outVrs , int nOptionalVectors = 0 , vtkDataArray * * inVrsArr = nullptr , vtkDataArray * * outVrsArr = nullptr ) override ;  Invert the transformation.  This doesn't do anything to the
##  identity transformation. void Inverse ( ) override { } /@{ *
##  This will calculate the transformation without calling Update.
##  Meant for use only within other VTK classes.
##  void InternalTransformPoint ( const float in [ 3 ] , float out [ 3 ] ) override ; void InternalTransformPoint ( const double in [ 3 ] , double out [ 3 ] ) override ; /@} /@{ *
##  This will calculate the transformation without calling Update.
##  Meant for use only within other VTK classes.
##  void InternalTransformNormal ( const float in [ 3 ] , float out [ 3 ] ) override ; void InternalTransformNormal ( const double in [ 3 ] , double out [ 3 ] ) override ; /@} /@{ *
##  This will calculate the transformation without calling Update.
##  Meant for use only within other VTK classes.
##  void InternalTransformVector ( const float in [ 3 ] , float out [ 3 ] ) override ; void InternalTransformVector ( const double in [ 3 ] , double out [ 3 ] ) override ; /@} /@{ *
##  This will calculate the transformation as well as its derivative
##  without calling Update.  Meant for use only within other VTK
##  classes.
##  void InternalTransformDerivative ( const float in [ 3 ] , float out [ 3 ] , float derivative [ 3 ] [ 3 ] ) override ; void InternalTransformDerivative ( const double in [ 3 ] , double out [ 3 ] , double derivative [ 3 ] [ 3 ] ) override ; /@} *
##  Make a transform of the same type.  This will actually
##  return the same transform.
##  vtkAbstractTransform * MakeTransform ( ) override ; protected : vtkIdentityTransform ( ) ; ~ vtkIdentityTransform ( ) override ; void InternalDeepCopy ( vtkAbstractTransform * t ) override ; private : vtkIdentityTransform ( const vtkIdentityTransform & ) = delete ; void operator = ( const vtkIdentityTransform & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
