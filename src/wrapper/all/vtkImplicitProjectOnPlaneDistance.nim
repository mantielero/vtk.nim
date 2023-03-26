## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImplicitProjectOnPlaneDistance.h
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
##  @class   vtkImplicitProjectOnPlaneDistance
##
##  This class recieve a plannar polygon as input. Given a point, it can
##  evaluate the L0 or L2 norm between the projection of this point on the plan
##  of the polygon and the polygon itself.
##
##  An interesting use of this class is to enable the L0 norm and evaluate the
##  "projected distance" between every vertex of a mesh and the given plannar polygon.
##  As a reslut, all the vertices that project onto the polygon will corresond to the value 0
##  and ohter ones will recieve the value 1.
##  From there, we can use a clip to keep only the part of the mesh "below" the polygon.
##
##  TLDR: This filter allows to clip using the extrusion of any plannar polygon.
##

## !!!Ignored construct:  # vtkImplicitProjectOnPlaneDistance_h [NewLine] # vtkImplicitProjectOnPlaneDistance_h [NewLine] # vtkImplicitFunction.h [NewLine] # vtkAbstractCellLocator.h  User defined cellLocator # vtkFiltersCoreModule.h  For export macro # vtkSmartPointer.h  It has vtkSmartPointer fields [NewLine] class vtkGenericCell ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkPolyData"
discard "forward decl of vtkPlane"
## !!!Ignored construct:  class VTKFILTERSCORE_EXPORT vtkImplicitProjectOnPlaneDistance : public vtkImplicitFunction { public : enum class NormType { L0 = 0 , L2 = 2 } ; static vtkImplicitProjectOnPlaneDistance * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImplicitFunction Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImplicitFunction :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImplicitProjectOnPlaneDistance :: IsTypeOf ( type ) ; } static vtkImplicitProjectOnPlaneDistance * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImplicitProjectOnPlaneDistance * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImplicitProjectOnPlaneDistance * NewInstance ( ) const { return vtkImplicitProjectOnPlaneDistance :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImplicitFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImplicitProjectOnPlaneDistance :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImplicitProjectOnPlaneDistance :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Return the MTime also considering the Input dependency.
##  vtkMTimeType GetMTime ( ) override ; *
##  Project x onto the plane defined by the Input polydata and evalute the
##  distance to the geometry defined by the Input polydata.
##  using vtkImplicitFunction :: EvaluateFunction ; double EvaluateFunction ( double x [ 3 ] ) override ; *
##  Evaluate function gradient of nearest triangle to point x[3].
##  WARNING: not implemented as it is of no use in this context.
##  void EvaluateGradient ( double x [ 3 ] , double g [ 3 ] ) override ; *
##  Set the input vtkPolyData used for the implicit function
##  evaluation. This polydata needs to be planar.
##  void SetInput ( vtkPolyData * input ) ; /@{ *
##  Set/get the tolerance usued for the locator.
##  Default is 0.01.
##  virtual double GetTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tolerance  of  << this -> Tolerance ) ; return this -> Tolerance ; } ; virtual void SetTolerance ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Tolerance  to  << _arg ) ; if ( this -> Tolerance != _arg ) { this -> Tolerance = _arg ; this -> Modified ( ) ; } } ; /@} /@{ *
##  Set the norm to use:
##  L0: 0 when the projection is inside the input polygon, 1 otherwise
##  L2: Euclidean distance between the projection and the polygon (default)
##  NormType GetNorm ( ) const { return Norm ; } void SetNorm ( NormType n ) { Norm = n ; Modified ( ) ; } # __VTK_WRAP_JAVA__ [NewLine]  The Java wrappers cannot resolve this signature from the one above,
##  see https://gitlab.kitware.com/vtk/vtk/-/issues/17744 void SetNorm ( int n ) { Norm = static_cast < NormType > ( n ) ; Modified ( ) ; } # [NewLine] /@} /@{ *
##  Set/get the Locator used by to compute the distance.
##  A vtkStaticCellLocator is provided by default if
##  none is given by the user.
##  virtual vtkAbstractCellLocator * Getname ( ) { vtkDebugWithObjectMacro ( this , <<  returning  name  address  << static_cast < vtkAbstractCellLocator * > ( this -> Locator ) ) ; return this -> Locator ; } ; virtual void SetLocator ( vtkAbstractCellLocator * _arg ) { { vtkDebugWithObjectMacro ( this , <<  setting  << Locator  to  << _arg ) ; if ( this -> Locator != _arg ) { this -> Locator = _arg ; this -> Modified ( ) ; } } ; } ; /@} protected : vtkImplicitProjectOnPlaneDistance ( ) ; ~ vtkImplicitProjectOnPlaneDistance ( ) override = default ; *
##  Create a default locator (vtkStaticCellLocator).
##  Used to create one when none is specified by the user.
##  void CreateDefaultLocator ( void ) ; double Tolerance ; NormType Norm ; vtkSmartPointer < vtkPolyData > Input ; vtkSmartPointer < vtkAbstractCellLocator > Locator ; vtkSmartPointer < vtkPlane > ProjectionPlane ;  Stored here to avoid multiple allocation / dealloction vtkSmartPointer < vtkGenericCell > UnusedCell ; double Bounds [ 6 ] ; private : vtkImplicitProjectOnPlaneDistance ( const vtkImplicitProjectOnPlaneDistance & ) = delete ; void operator = ( const vtkImplicitProjectOnPlaneDistance & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
