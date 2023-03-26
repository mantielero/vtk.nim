## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMatrixToLinearTransform.h
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
##  @class   vtkMatrixToLinearTransform
##  @brief   convert a matrix to a transform
##
##  This is a very simple class which allows a vtkMatrix4x4 to be used in
##  place of a vtkLinearTransform or vtkAbstractTransform.  For example,
##  if you use it as a proxy between a matrix and vtkTransformPolyDataFilter
##  then any modifications to the matrix will automatically be reflected in
##  the output of the filter.
##  @sa
##  vtkTransform vtkMatrix4x4 vtkMatrixToHomogeneousTransform
##

## !!!Ignored construct:  # vtkMatrixToLinearTransform_h [NewLine] # vtkMatrixToLinearTransform_h [NewLine] # vtkCommonTransformsModule.h  For export macro # vtkLinearTransform.h [NewLine] class vtkMatrix4x4 ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKCOMMONTRANSFORMS_EXPORT vtkMatrixToLinearTransform : public vtkLinearTransform { public : static vtkMatrixToLinearTransform * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkLinearTransform Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkLinearTransform :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkMatrixToLinearTransform :: IsTypeOf ( type ) ; } static vtkMatrixToLinearTransform * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkMatrixToLinearTransform * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkMatrixToLinearTransform * NewInstance ( ) const { return vtkMatrixToLinearTransform :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkLinearTransform :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMatrixToLinearTransform :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMatrixToLinearTransform :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set the input matrix.  Any modifications to the matrix will be
##  reflected in the transformation.
##  virtual void SetInput ( vtkMatrix4x4 * ) ; virtual vtkMatrix4x4 * GetnameInput ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Input  address  << static_cast < vtkMatrix4x4 * > ( this -> Input ) ) ; return this -> Input ; } ; /@} *
##  The input matrix is left as-is, but the transformation matrix
##  is inverted.
##  void Inverse ( ) override ; *
##  Get the MTime: this is the bit of magic that makes everything work.
##  vtkMTimeType GetMTime ( ) override ; *
##  Make a new transform of the same type.
##  vtkAbstractTransform * MakeTransform ( ) override ; protected : vtkMatrixToLinearTransform ( ) ; ~ vtkMatrixToLinearTransform ( ) override ; void InternalUpdate ( ) override ; void InternalDeepCopy ( vtkAbstractTransform * transform ) override ; int InverseFlag ; vtkMatrix4x4 * Input ; private : vtkMatrixToLinearTransform ( const vtkMatrixToLinearTransform & ) = delete ; void operator = ( const vtkMatrixToLinearTransform & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
