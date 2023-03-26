## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLandmarkTransform.h
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
##  @class   vtkLandmarkTransform
##  @brief   a linear transform specified by two corresponding point sets
##
##  A vtkLandmarkTransform is defined by two sets of landmarks, the
##  transform computed gives the best fit mapping one onto the other, in a
##  least squares sense. The indices are taken to correspond, so point 1
##  in the first set will get mapped close to point 1 in the second set,
##  etc. Call SetSourceLandmarks and SetTargetLandmarks to specify the two
##  sets of landmarks, ensure they have the same number of points.
##  @warning
##  Whenever you add, subtract, or set points you must call Modified()
##  on the vtkPoints object, or the transformation might not update.
##  @sa
##  vtkLinearTransform
##

## !!!Ignored construct:  # vtkLandmarkTransform_h [NewLine] # vtkLandmarkTransform_h [NewLine] # vtkCommonTransformsModule.h  For export macro # vtkLinearTransform.h [NewLine] # VTK_LANDMARK_RIGIDBODY 6 [NewLine] # VTK_LANDMARK_SIMILARITY 7 [NewLine] # VTK_LANDMARK_AFFINE 12 [NewLine] class VTKCOMMONTRANSFORMS_EXPORT vtkLandmarkTransform : public vtkLinearTransform { public : static vtkLandmarkTransform * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkLinearTransform Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkLinearTransform :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkLandmarkTransform :: IsTypeOf ( type ) ; } static vtkLandmarkTransform * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkLandmarkTransform * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkLandmarkTransform * NewInstance ( ) const { return vtkLandmarkTransform :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkLinearTransform :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLandmarkTransform :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLandmarkTransform :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Specify the source and target landmark sets. The two sets must have
##  the same number of points.  If you add or change points in these objects,
##  you must call Modified() on them or the transformation might not update.
##  void SetSourceLandmarks ( vtkPoints * source ) ; void SetTargetLandmarks ( vtkPoints * target ) ; virtual vtkPoints * GetnameSourceLandmarks ( ) { vtkDebugWithObjectMacro ( this , <<  returning  SourceLandmarks  address  << static_cast < vtkPoints * > ( this -> SourceLandmarks ) ) ; return this -> SourceLandmarks ; } ; virtual vtkPoints * GetnameSourceLandmarksTargetLandmarks ( ) { vtkDebugWithObjectMacro ( this , <<  returning  TargetLandmarks  address  << static_cast < vtkPoints * > ( this -> TargetLandmarks ) ) ; return this -> TargetLandmarks ; } ; /@} /@{ *
##  Set the number of degrees of freedom to constrain the solution to.
##  Rigidbody (VTK_LANDMARK_RIGIDBODY): rotation and translation only.
##  Similarity (VTK_LANDMARK_SIMILARITY): rotation, translation and
##  isotropic scaling.
##  Affine (VTK_LANDMARK_AFFINE): collinearity is preserved.
##  Ratios of distances along a line are preserved.
##  The default is similarity.
##  virtual void SetMode ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Mode  to  << _arg ) ; if ( this -> Mode != _arg ) { this -> Mode = _arg ; this -> Modified ( ) ; } } ; void SetModeToRigidBody ( ) { this -> SetMode ( VTK_LANDMARK_RIGIDBODY ) ; } void SetModeToSimilarity ( ) { this -> SetMode ( VTK_LANDMARK_SIMILARITY ) ; } void SetModeToAffine ( ) { this -> SetMode ( VTK_LANDMARK_AFFINE ) ; } /@} /@{ *
##  Get the current transformation mode.
##  virtual int GetMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Mode  of  << this -> Mode ) ; return this -> Mode ; } ; const char * GetModeAsString ( ) ; /@} *
##  Invert the transformation.  This is done by switching the
##  source and target landmarks.
##  void Inverse ( ) override ; *
##  Get the MTime.
##  vtkMTimeType GetMTime ( ) override ; *
##  Make another transform of the same type.
##  vtkAbstractTransform * MakeTransform ( ) override ; protected : vtkLandmarkTransform ( ) ; ~ vtkLandmarkTransform ( ) override ;  Update the matrix from the quaternion. void InternalUpdate ( ) override ; *
##  This method does no type checking, use DeepCopy instead.
##  void InternalDeepCopy ( vtkAbstractTransform * transform ) override ; vtkPoints * SourceLandmarks ; vtkPoints * TargetLandmarks ; int Mode ; private : vtkLandmarkTransform ( const vtkLandmarkTransform & ) = delete ; void operator = ( const vtkLandmarkTransform & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

proc GetModeAsString*(): cstring {.importcpp: "VTKCOMMONTRANSFORMS_EXPORT::GetModeAsString(@)",
                                header: "vtkLandmarkTransform.h".}