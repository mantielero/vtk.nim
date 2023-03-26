## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTriangleMeshPointNormals.h
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
##  @class   vtkTriangleMeshPointNormals
##  @brief   compute point normals for triangle mesh
##
##  vtkTriangleMeshPointNormals is a filter that computes point normals for
##  a triangle mesh to enable high-performance rendering. It is a fast-path
##  version of the vtkPolyDataNormals filter in order to be able to compute
##  normals for triangle meshes deforming rapidly.
##
##  The computed normals (a vtkFloatArray) are set to be the active normals
##  (using SetNormals()) of the PointData. The array name is "Normals", so
##  they can be retrieved either with `output->GetPointData()->GetNormals()`
##  or with `output->GetPointData()->GetArray("Normals")`.
##
##  The algorithm works by determining normals for each triangle and adding
##  these vectors to the triangle points. The resulting vectors at each
##  point are then normalized.
##
##  @warning
##  Normals are computed only for triangular polygons: the filter can not
##  handle meshes with other types of cells (Verts, Lines, Strips) or Polys
##  with the wrong number of components (not equal to 3).
##
##  @warning
##  Unlike the vtkPolyDataNormals filter, this filter does not apply any
##  splitting nor checks for cell orientation consistency in order to speed
##  up the computation. Moreover, normals are not calculated the exact same
##  way as the vtkPolyDataNormals filter since the triangle normals are not
##  normalized before being added to the point normals: those cell normals
##  are therefore weighted by the triangle area. This is not more nor less
##  correct than normalizing them before adding them, but it is much faster.
##
##  @sa
##  If you do not need to do high-performance rendering, you should use
##  vtkPolyDataNormals if your mesh is not only triangular, if you need to
##  split vertices at sharp edges, or if you need to check that the cell
##  orientations are consistent to flip inverted normals.
##
##  @sa
##  If you still need high-performance rendering but your input polydata is
##  not a triangular mesh and/or does not have consistent cell orientations
##  (causing inverted normals), you can still use this filter by using
##  vtkTriangleFilter and/or vtkCleanPolyData respectively beforehand. If
##  your mesh is deforming rapidly, you should be deforming the output mesh
##  of those two filters instead in order to only run them once.
##
##

## !!!Ignored construct:  # vtkTriangleMeshPointNormals_h [NewLine] # vtkTriangleMeshPointNormals_h [NewLine] # vtkFiltersCoreModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class vtkPolyData ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSCORE_EXPORT vtkTriangleMeshPointNormals : public vtkPolyDataAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkTriangleMeshPointNormals :: IsTypeOf ( type ) ; } static vtkTriangleMeshPointNormals * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkTriangleMeshPointNormals * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkTriangleMeshPointNormals * NewInstance ( ) const { return vtkTriangleMeshPointNormals :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTriangleMeshPointNormals :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTriangleMeshPointNormals :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkTriangleMeshPointNormals * New ( ) ; protected : vtkTriangleMeshPointNormals ( ) = default ; ~ vtkTriangleMeshPointNormals ( ) override = default ;  Usual data generation method int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkTriangleMeshPointNormals ( const vtkTriangleMeshPointNormals & ) = delete ; void operator = ( const vtkTriangleMeshPointNormals & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
