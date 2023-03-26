## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkWarpTransform.h
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
##  @class   vtkWarpTransform
##  @brief   superclass for nonlinear geometric transformations
##
##  vtkWarpTransform provides a generic interface for nonlinear
##  warp transformations.
##  @sa
##  vtkThinPlateSplineTransform vtkGridTransform vtkGeneralTransform
##

## !!!Ignored construct:  # vtkWarpTransform_h [NewLine] # vtkWarpTransform_h [NewLine] # vtkAbstractTransform.h [NewLine] # vtkCommonTransformsModule.h  For export macro [NewLine] class VTKCOMMONTRANSFORMS_EXPORT vtkWarpTransform : public vtkAbstractTransform { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkAbstractTransform Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkAbstractTransform :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkWarpTransform :: IsTypeOf ( type ) ; } static vtkWarpTransform * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkWarpTransform * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkWarpTransform * NewInstance ( ) const { return vtkWarpTransform :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractTransform :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkWarpTransform :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkWarpTransform :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Invert the transformation.  Warp transformations are usually
##  inverted using an iterative technique such as Newton's method.
##  The inverse transform is usually around five or six times as
##  computationally expensive as the forward transform.
##  void Inverse ( ) override ; /@{ *
##  Get the inverse flag of the transformation.  This flag is
##  set to zero when the transformation is first created, and
##  is flipped each time Inverse() is called.
##  virtual int GetInverseFlag ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InverseFlag  of  << this -> InverseFlag ) ; return this -> InverseFlag ; } ; /@} /@{ *
##  Set the tolerance for inverse transformation.
##  The default is 0.001.
##  virtual void SetInverseTolerance ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  InverseTolerance  to  << _arg ) ; if ( this -> InverseTolerance != _arg ) { this -> InverseTolerance = _arg ; this -> Modified ( ) ; } } ; virtual double GetInverseFlagInverseTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InverseTolerance  of  << this -> InverseTolerance ) ; return this -> InverseTolerance ; } ; /@} /@{ *
##  Set the maximum number of iterations for the inverse
##  transformation.  The default is 500, but usually only
##  2 to 5 iterations are used.  The inversion method
##  is fairly robust, and it should converge for nearly all smooth
##  transformations that do not fold back on themselves.
##  virtual void SetInverseToleranceInverseIterations ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  InverseIterations  to  << _arg ) ; if ( this -> InverseIterations != _arg ) { this -> InverseIterations = _arg ; this -> Modified ( ) ; } } ; virtual int GetInverseFlagInverseToleranceInverseIterations ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InverseIterations  of  << this -> InverseIterations ) ; return this -> InverseIterations ; } ; /@} /@{ *
##  This will calculate the transformation without calling Update.
##  Meant for use only within other VTK classes.
##  void InternalTransformPoint ( const float in [ 3 ] , float out [ 3 ] ) override ; void InternalTransformPoint ( const double in [ 3 ] , double out [ 3 ] ) override ; /@} /@{ *
##  This will calculate the transformation, as well as its derivative
##  without calling Update.  Meant for use only within other VTK
##  classes.
##  void InternalTransformDerivative ( const float in [ 3 ] , float out [ 3 ] , float derivative [ 3 ] [ 3 ] ) override ; void InternalTransformDerivative ( const double in [ 3 ] , double out [ 3 ] , double derivative [ 3 ] [ 3 ] ) override ; /@} /@{ *
##  Do not use these methods.  They exists only as a work-around for
##  internal templated functions (I really didn't want to make the
##  Forward/Inverse methods public, is there a decent work around
##  for this sort of thing?)
##  void TemplateTransformPoint ( const float in [ 3 ] , float out [ 3 ] ) { this -> ForwardTransformPoint ( in , out ) ; } void TemplateTransformPoint ( const double in [ 3 ] , double out [ 3 ] ) { this -> ForwardTransformPoint ( in , out ) ; } void TemplateTransformPoint ( const float in [ 3 ] , float out [ 3 ] , float derivative [ 3 ] [ 3 ] ) { this -> ForwardTransformDerivative ( in , out , derivative ) ; } void TemplateTransformPoint ( const double in [ 3 ] , double out [ 3 ] , double derivative [ 3 ] [ 3 ] ) { this -> ForwardTransformDerivative ( in , out , derivative ) ; } void TemplateTransformInverse ( const float in [ 3 ] , float out [ 3 ] ) { this -> InverseTransformPoint ( in , out ) ; } void TemplateTransformInverse ( const double in [ 3 ] , double out [ 3 ] ) { this -> InverseTransformPoint ( in , out ) ; } void TemplateTransformInverse ( const float in [ 3 ] , float out [ 3 ] , float derivative [ 3 ] [ 3 ] ) { this -> InverseTransformDerivative ( in , out , derivative ) ; } void TemplateTransformInverse ( const double in [ 3 ] , double out [ 3 ] , double derivative [ 3 ] [ 3 ] ) { this -> InverseTransformDerivative ( in , out , derivative ) ; } /@} protected : vtkWarpTransform ( ) ; ~ vtkWarpTransform ( ) override ; /@{ *
##  If the InverseFlag is set to 0, then a call to InternalTransformPoint
##  results in a call to ForwardTransformPoint.
##  virtual void ForwardTransformPoint ( const float in [ 3 ] , float out [ 3 ] ) = 0 ; virtual void ForwardTransformPoint ( const double in [ 3 ] , double out [ 3 ] ) = 0 ; /@} /@{ *
##  Calculate the forward transform as well as the derivative.
##  virtual void ForwardTransformDerivative ( const float in [ 3 ] , float out [ 3 ] , float derivative [ 3 ] [ 3 ] ) = 0 ; virtual void ForwardTransformDerivative ( const double in [ 3 ] , double out [ 3 ] , double derivative [ 3 ] [ 3 ] ) = 0 ; /@} /@{ *
##  If the InverseFlag is set to 1, then a call to InternalTransformPoint
##  results in a call to InverseTransformPoint.  The inverse transformation
##  is calculated from using Newton's method.
##  virtual void InverseTransformPoint ( const float in [ 3 ] , float out [ 3 ] ) ; virtual void InverseTransformPoint ( const double in [ 3 ] , double out [ 3 ] ) ; /@} /@{ *
##  Calculate the inverse transform as well as the derivative of the
##  forward transform (that's correct: the derivative of the
##  forward transform, not of the inverse transform)
##  virtual void InverseTransformDerivative ( const float in [ 3 ] , float out [ 3 ] , float derivative [ 3 ] [ 3 ] ) ; virtual void InverseTransformDerivative ( const double in [ 3 ] , double out [ 3 ] , double derivative [ 3 ] [ 3 ] ) ; /@} int InverseFlag ; int InverseIterations ; double InverseTolerance ; private : vtkWarpTransform ( const vtkWarpTransform & ) = delete ; void operator = ( const vtkWarpTransform & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
