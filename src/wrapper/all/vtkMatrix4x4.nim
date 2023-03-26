## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMatrix4x4.h
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
##  @class   vtkMatrix4x4
##  @brief   represent and manipulate 4x4 transformation matrices
##
##  vtkMatrix4x4 is a class to represent and manipulate 4x4 matrices.
##  Specifically, it is designed to work on 4x4 transformation matrices
##  found in 3D rendering using homogeneous coordinates [x y z w].
##  Many of the methods take an array of 16 doubles in row-major format.
##  Note that OpenGL stores matrices in column-major format, so the matrix
##  contents must be transposed when they are moved between OpenGL and VTK.
##  @sa
##  vtkTransform
##

## !!!Ignored construct:  # vtkMatrix4x4_h [NewLine] # vtkMatrix4x4_h [NewLine] # vtkCommonMathModule.h  For export macro # vtkObject.h [NewLine] class VTKCOMMONMATH_EXPORT vtkMatrix4x4 : public vtkObject { public : / The internal data is public for historical reasons. Do not use! double Element [ 4 ] [ 4 ] ; *
##  Construct a 4x4 identity matrix.
##  static vtkMatrix4x4 * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkMatrix4x4 :: IsTypeOf ( type ) ; } static vtkMatrix4x4 * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkMatrix4x4 * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkMatrix4x4 * NewInstance ( ) const { return vtkMatrix4x4 :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMatrix4x4 :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMatrix4x4 :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Set the elements of the matrix to the same values as the elements
##  of the given source matrix.
##  void DeepCopy ( const vtkMatrix4x4 * source ) { vtkMatrix4x4 :: DeepCopy ( * this -> Element , source ) ; this -> Modified ( ) ; } *
##  Set the elements of the given destination buffer to the same values
##  as the elements of the given source matrix.
##  static void DeepCopy ( double destination [ 16 ] , const vtkMatrix4x4 * source ) { vtkMatrix4x4 :: DeepCopy ( destination , * source -> Element ) ; } *
##  Copies the given source buffer to the given destination buffer.
##  The memory ranges must not overlap.  Does not affect any matrix.
##  static void DeepCopy ( double destination [ 16 ] , const double source [ 16 ] ) ; *
##  Non-static member function. Assigns *to* the matrix *from*
##  the given elements array.
##  void DeepCopy ( const double elements [ 16 ] ) { this -> DeepCopy ( * this -> Element , elements ) ; this -> Modified ( ) ; } *
##  Set all of the elements to zero.
##  void Zero ( ) { vtkMatrix4x4 :: Zero ( * this -> Element ) ; this -> Modified ( ) ; } static void Zero ( double elements [ 16 ] ) ; *
##  Set equal to Identity matrix
##  void Identity ( ) { vtkMatrix4x4 :: Identity ( * this -> Element ) ; this -> Modified ( ) ; } static void Identity ( double elements [ 16 ] ) ; *
##  Returns true if this matrix is equal to the identity matrix.
##  bool IsIdentity ( ) ; *
##  Matrix Inversion (adapted from Richard Carling in "Graphics Gems,"
##  Academic Press, 1990).
##  static void Invert ( const vtkMatrix4x4 * in , vtkMatrix4x4 * out ) { vtkMatrix4x4 :: Invert ( * in -> Element , * out -> Element ) ; out -> Modified ( ) ; } void Invert ( ) { vtkMatrix4x4 :: Invert ( this , this ) ; } static void Invert ( const double inElements [ 16 ] , double outElements [ 16 ] ) ; *
##  Transpose the matrix and put it into out.
##  static void Transpose ( const vtkMatrix4x4 * in , vtkMatrix4x4 * out ) { vtkMatrix4x4 :: Transpose ( * in -> Element , * out -> Element ) ; out -> Modified ( ) ; } void Transpose ( ) { vtkMatrix4x4 :: Transpose ( this , this ) ; } static void Transpose ( const double inElements [ 16 ] , double outElements [ 16 ] ) ; /@{ *
##  Construct a matrix from a rotation
##  static void MatrixFromRotation ( double angle , double x , double y , double z , vtkMatrix4x4 * result ) ; static void MatrixFromRotation ( double angle , double x , double y , double z , double matrix [ 16 ] ) ; /@} *
##  Given an orientation and position this function will fill in a matrix
##  representing the transformation from the pose to whatever space the pose was
##  defined in. For example if the position and orientation are in world
##  coordinates then this method would set the matrix to be PoseToWorld
##  static void PoseToMatrix ( double pos [ 3 ] , double ori [ 4 ] , vtkMatrix4x4 * mat ) ; *
##  Multiply a homogeneous coordinate by this matrix, i.e. out = A*in.
##  The in[4] and out[4] can be the same array.
##  void MultiplyPoint ( const float in [ 4 ] , float out [ 4 ] ) { vtkMatrix4x4 :: MultiplyPoint ( * this -> Element , in , out ) ; } void MultiplyPoint ( const double in [ 4 ] , double out [ 4 ] ) { vtkMatrix4x4 :: MultiplyPoint ( * this -> Element , in , out ) ; } static void MultiplyPoint ( const double elements [ 16 ] , const float in [ 4 ] , float out [ 4 ] ) ; static void MultiplyPoint ( const double elements [ 16 ] , const double in [ 4 ] , double out [ 4 ] ) ; *
##  For use in Java or Python.
##  float * MultiplyPoint ( const float in [ 4 ] ) VTK_SIZEHINT ( 4 ) { return this -> MultiplyFloatPoint ( in ) ; } double * MultiplyPoint ( const double in [ 4 ] ) VTK_SIZEHINT ( 4 ) { return this -> MultiplyDoublePoint ( in ) ; } float * MultiplyFloatPoint ( const float in [ 4 ] ) VTK_SIZEHINT ( 4 ) { this -> MultiplyPoint ( in , this -> FloatPoint ) ; return this -> FloatPoint ; } double * MultiplyDoublePoint ( const double in [ 4 ] ) VTK_SIZEHINT ( 4 ) { this -> MultiplyPoint ( in , this -> DoublePoint ) ; return this -> DoublePoint ; } /@{ *
##  Multiplies matrices a and b and stores the result in c.
##  static void Multiply4x4 ( const vtkMatrix4x4 * a , const vtkMatrix4x4 * b , vtkMatrix4x4 * c ) ; static void Multiply4x4 ( const double a [ 16 ] , const double b [ 16 ] , double c [ 16 ] ) ; static void Multiply4x4 ( const double a [ 16 ] , const double b [ 16 ] , float c [ 16 ] ) ; static void MultiplyAndTranspose4x4 ( const double a [ 16 ] , const double b [ 16 ] , float c [ 16 ] ) ; /@} *
##  Compute adjoint of the matrix and put it into out.
##  void Adjoint ( const vtkMatrix4x4 * in , vtkMatrix4x4 * out ) { vtkMatrix4x4 :: Adjoint ( * in -> Element , * out -> Element ) ; } static void Adjoint ( const double inElements [ 16 ] , double outElements [ 16 ] ) ; *
##  Compute the determinant of the matrix and return it.
##  double Determinant ( ) { return vtkMatrix4x4 :: Determinant ( * this -> Element ) ; } static double Determinant ( const double elements [ 16 ] ) ; *
##  Sets the element i,j in the matrix.
##  void SetElement ( int i , int j , double value ) ; *
##  Returns the element i,j from the matrix.
##  double GetElement ( int i , int j ) const { return this -> Element [ i ] [ j ] ; } *
##  Returns the raw double array holding the matrix.
##  double * GetData ( ) { return * this -> Element ; } *
##  Returns the raw double array holding the matrix.
##  const double * GetData ( ) const { return * this -> Element ; } protected : vtkMatrix4x4 ( ) { vtkMatrix4x4 :: Identity ( * this -> Element ) ; } ~ vtkMatrix4x4 ( ) override = default ; float FloatPoint [ 4 ] ; double DoublePoint [ 4 ] ; private : vtkMatrix4x4 ( const vtkMatrix4x4 & ) = delete ; void operator = ( const vtkMatrix4x4 & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## ----------------------------------------------------------------------------
##  Multiplies matrices a and b and stores the result in c.

proc Multiply4x4*(a: array[16, cdouble]; b: array[16, cdouble]; c: array[16, cdouble]) {.
    importcpp: "VTKCOMMONMATH_EXPORT::Multiply4x4(@)", header: "vtkMatrix4x4.h".}
## ----------------------------------------------------------------------------
##  Multiplies matrices a and b and stores the result in c.

proc Multiply4x4*(a: array[16, cdouble]; b: array[16, cdouble]; c: array[16, cfloat]) {.
    importcpp: "VTKCOMMONMATH_EXPORT::Multiply4x4(@)", header: "vtkMatrix4x4.h".}
## ----------------------------------------------------------------------------
##  Multiplies matrices a and b and stores the result in c.

proc MultiplyAndTranspose4x4*(a: array[16, cdouble]; b: array[16, cdouble];
                             c: array[16, cfloat]) {.
    importcpp: "VTKCOMMONMATH_EXPORT::MultiplyAndTranspose4x4(@)",
    header: "vtkMatrix4x4.h".}
## ----------------------------------------------------------------------------

proc Multiply4x4*(a: ptr vtkMatrix4x4; b: ptr vtkMatrix4x4; c: ptr vtkMatrix4x4) {.
    importcpp: "VTKCOMMONMATH_EXPORT::Multiply4x4(@)", header: "vtkMatrix4x4.h".}
## ----------------------------------------------------------------------------

proc SetElement*(i: cint; j: cint; value: cdouble) {.
    importcpp: "VTKCOMMONMATH_EXPORT::SetElement(@)", header: "vtkMatrix4x4.h".}
## ----------------------------------------------------------------------------

proc IsIdentity*(): bool {.importcpp: "VTKCOMMONMATH_EXPORT::IsIdentity(@)",
                        header: "vtkMatrix4x4.h".}