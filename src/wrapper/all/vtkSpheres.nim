## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSpheres.h
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
##  @class   vtkSpheres
##  @brief   implicit function for a set of spheres
##
##  vtkSpheres computes the implicit function and function gradient for a set
##  of spheres. The spheres are combined via a union operation (i.e., the
##  minimum value from the evaluation of all spheres is taken).
##
##  The function value is the distance of a point to the closest sphere, with
##  negative values interior to the spheres, positive outside the spheres, and
##  distance=0 on the spheres surface.  The function gradient is the sphere
##  normal at the function value.
##
##  @sa
##  vtkPlanes vtkImplicitBoolean
##

## !!!Ignored construct:  # vtkSpheres_h [NewLine] # vtkSpheres_h [NewLine] # vtkCommonDataModelModule.h  For export macro # vtkImplicitFunction.h [NewLine] class vtkSphere ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkPoints"
discard "forward decl of vtkDataArray"
## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkSpheres : public vtkImplicitFunction { public : /@{ *
##  Standard methods for instantiation, type information, and printing.
##  static vtkSpheres * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImplicitFunction Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImplicitFunction :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkSpheres :: IsTypeOf ( type ) ; } static vtkSpheres * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkSpheres * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkSpheres * NewInstance ( ) const { return vtkSpheres :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImplicitFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSpheres :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSpheres :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Evaluate spheres equations. Return largest value when evaluating all
##  sphere equations.
##  using vtkImplicitFunction :: EvaluateFunction ; double EvaluateFunction ( double x [ 3 ] ) override ; /@} *
##  Evaluate spheres gradient. Gradients point towards the outside of the
##  spheres.
##  void EvaluateGradient ( double x [ 3 ] , double n [ 3 ] ) override ; /@{ *
##  Specify a list of points defining sphere centers.
##  virtual void SetCenters ( vtkPoints * ) ; virtual vtkPoints * GetnameCenters ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Centers  address  << static_cast < vtkPoints * > ( this -> Centers ) ) ; return this -> Centers ; } ; /@} /@{ *
##  Specify a list of radii for the spheres. There is a one-to-one
##  correspondence between sphere points and sphere radii.
##  void SetRadii ( vtkDataArray * radii ) ; virtual vtkDataArray * GetnameCentersRadii ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Radii  address  << static_cast < vtkDataArray * > ( this -> Radii ) ) ; return this -> Radii ; } ; /@} *
##  Return the number of spheres in the set of spheres.
##  int GetNumberOfSpheres ( ) ; *
##  Create and return a pointer to a vtkSphere object at the ith
##  position. Asking for a sphere outside the allowable range returns
##  nullptr.  This method always returns the same object.  Alternatively use
##  GetSphere(int i, vtkSphere *sphere) to update a user supplied sphere.
##  vtkSphere * GetSphere ( int i ) ; *
##  If i is within the allowable range, mutates the given sphere's
##  Center and Radius to match the vtkSphere object at the ith
##  position. Does nothing if i is outside the allowable range.
##  void GetSphere ( int i , vtkSphere * sphere ) ; protected : vtkSpheres ( ) ; ~ vtkSpheres ( ) override ; vtkPoints * Centers ; vtkDataArray * Radii ; vtkSphere * Sphere ; private : vtkSpheres ( const vtkSpheres & ) = delete ; void operator = ( const vtkSpheres & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
