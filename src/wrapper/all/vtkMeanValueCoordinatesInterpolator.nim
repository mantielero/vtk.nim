## =========================================================================
##
## Program:   Visualization Toolkit
## Module:    vtkMeanValueCoordinatesInterpolator.h
##
## Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
## All rights reserved.
## See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
## This software is distributed WITHOUT ANY WARRANTY; without even
## the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
## PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkMeanValueCoordinatesInterpolator
##  @brief   compute interpolation computes
##  for closed triangular mesh
##
##  vtkMeanValueCoordinatesInterpolator computes interpolation weights for a
##  closed, manifold polyhedron mesh.  Once computed, the interpolation
##  weights can be used to interpolate data anywhere interior or exterior to
##  the mesh. This work implements two MVC algorithms. The first one is for
##  triangular meshes which is documented in the Siggraph 2005 paper by Tao Ju,
##  Scot Schaefer and Joe Warren from Rice University "Mean Value Coordinates
##  for Closed Triangular Meshes". The second one is for general polyhedron
##  mesh which is documented in the Eurographics Symposium on Geometry Processing
##  2006 paper by Torsten Langer, Alexander Belyaev and Hans-Peter Seidel from
##  MPI Informatik "Spherical Barycentric Coordinates".
##  The filter will automatically choose which algorithm to use based on whether
##  the input mesh is triangulated or not.
##
##  In VTK this class was initially created to interpolate data across
##  polyhedral cells. In addition, the class can be used to interpolate
##  data values from a polyhedron mesh, and to smoothly deform a mesh from
##  an associated control mesh.
##
##  @sa
##  vtkPolyhedralCell
##

## !!!Ignored construct:  # vtkMeanValueCoordinatesInterpolator_h [NewLine] # vtkMeanValueCoordinatesInterpolator_h [NewLine] # vtkCommonDataModelModule.h  For export macro # vtkObject.h [NewLine] class vtkPoints ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkIdList"
discard "forward decl of vtkCellArray"
discard "forward decl of vtkDataArray"
discard "forward decl of vtkMVCTriIterator"
discard "forward decl of vtkMVCPolyIterator"
## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkMeanValueCoordinatesInterpolator : public vtkObject { public : /@{ *
##  Standard instantiable class methods.
##  static vtkMeanValueCoordinatesInterpolator * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkMeanValueCoordinatesInterpolator :: IsTypeOf ( type ) ; } static vtkMeanValueCoordinatesInterpolator * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkMeanValueCoordinatesInterpolator * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkMeanValueCoordinatesInterpolator * NewInstance ( ) const { return vtkMeanValueCoordinatesInterpolator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMeanValueCoordinatesInterpolator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMeanValueCoordinatesInterpolator :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  Method to generate interpolation weights for a point x[3] from a list of
##  triangles.  In this version of the method, the triangles are defined by
##  a vtkPoints array plus a vtkIdList, where the vtkIdList is organized
##  such that three ids in order define a triangle.  Note that number of weights
##  must equal the number of points.
##  static void ComputeInterpolationWeights ( const double x [ 3 ] , vtkPoints * pts , vtkIdList * tris , double * weights ) ; *
##  Method to generate interpolation weights for a point x[3] from a list of
##  polygonal faces.  In this version of the method, the faces are defined by
##  a vtkPoints array plus a vtkCellArray, where the vtkCellArray contains all
##  faces and is of format [nFace0Pts, pid1, pid2, pid3,..., nFace1Pts, pid1,
##  pid2, pid3,...].  Note: the number of weights must equal the number of points.
##  static void ComputeInterpolationWeights ( const double x [ 3 ] , vtkPoints * pts , vtkCellArray * tris , double * weights ) ; protected : vtkMeanValueCoordinatesInterpolator ( ) ; ~ vtkMeanValueCoordinatesInterpolator ( ) override ; *
##  Internal method that sets up the processing of triangular meshes.
##  static void ComputeInterpolationWeightsForTriangleMesh ( const double x [ 3 ] , vtkPoints * pts , vtkMVCTriIterator & iter , double * weights ) ; *
##  Internal method that sets up the processing of general polyhedron meshes.
##  static void ComputeInterpolationWeightsForPolygonMesh ( const double x [ 3 ] , vtkPoints * pts , vtkMVCPolyIterator & iter , double * weights ) ; private : vtkMeanValueCoordinatesInterpolator ( const vtkMeanValueCoordinatesInterpolator & ) = delete ; void operator = ( const vtkMeanValueCoordinatesInterpolator & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
