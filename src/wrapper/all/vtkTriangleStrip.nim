## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTriangleStrip.h
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
##  @class   vtkTriangleStrip
##  @brief   a cell that represents a triangle strip
##
##  vtkTriangleStrip is a concrete implementation of vtkCell to represent a 2D
##  triangle strip. A triangle strip is a compact representation of triangles
##  connected edge to edge in strip fashion. The connectivity of a triangle
##  strip is three points defining an initial triangle, then for each
##  additional triangle, a single point that, combined with the previous two
##  points, defines the next triangle.
##

## !!!Ignored construct:  # vtkTriangleStrip_h [NewLine] # vtkTriangleStrip_h [NewLine] # vtkCell.h [NewLine] # vtkCommonDataModelModule.h  For export macro [NewLine] class vtkLine ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkTriangle"
discard "forward decl of vtkIncrementalPointLocator"
## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkTriangleStrip : public vtkCell { public : static vtkTriangleStrip * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkCell Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkCell :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkTriangleStrip :: IsTypeOf ( type ) ; } static vtkTriangleStrip * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkTriangleStrip * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkTriangleStrip * NewInstance ( ) const { return vtkTriangleStrip :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCell :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTriangleStrip :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTriangleStrip :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  See the vtkCell API for descriptions of these methods.
##  int GetCellType ( ) override { return VTK_TRIANGLE_STRIP ; } int GetCellDimension ( ) override { return 2 ; } int GetNumberOfEdges ( ) override { return this -> GetNumberOfPoints ( ) ; } int GetNumberOfFaces ( ) override { return 0 ; } vtkCell * GetEdge ( int edgeId ) override ; vtkCell * GetFace ( int vtkNotUsed ( faceId ) ) override { return nullptr ; } int CellBoundary ( int subId , const double pcoords [ 3 ] , vtkIdList * pts ) override ; void Contour ( double value , vtkDataArray * cellScalars , vtkIncrementalPointLocator * locator , vtkCellArray * verts , vtkCellArray * lines , vtkCellArray * polys , vtkPointData * inPd , vtkPointData * outPd , vtkCellData * inCd , vtkIdType cellId , vtkCellData * outCd ) override ; void Clip ( double value , vtkDataArray * cellScalars , vtkIncrementalPointLocator * locator , vtkCellArray * polys , vtkPointData * inPd , vtkPointData * outPd , vtkCellData * inCd , vtkIdType cellId , vtkCellData * outCd , int insideOut ) override ; /@} int EvaluatePosition ( const double x [ 3 ] , double closestPoint [ 3 ] , int & subId , double pcoords [ 3 ] , double & dist2 , double weights [ ] ) override ; void EvaluateLocation ( int & subId , const double pcoords [ 3 ] , double x [ 3 ] , double * weights ) override ; int IntersectWithLine ( const double p1 [ 3 ] , const double p2 [ 3 ] , double tol , double & t , double x [ 3 ] , double pcoords [ 3 ] , int & subId ) override ; int Triangulate ( int index , vtkIdList * ptIds , vtkPoints * pts ) override ; void Derivatives ( int subId , const double pcoords [ 3 ] , const double * values , int dim , double * derivs ) override ; int IsPrimaryCell ( ) override { return 0 ; } *
##  Return the center of the point cloud in parametric coordinates.
##  int GetParametricCenter ( double pcoords [ 3 ] ) override ; *
##  Given a triangle strip, decompose it into a list of (triangle)
##  polygons. The polygons are appended to the end of the list of triangles.
##  static void DecomposeStrip ( int npts , const vtkIdType * pts , vtkCellArray * tris ) ; protected : vtkTriangleStrip ( ) ; ~ vtkTriangleStrip ( ) override ; vtkLine * Line ; vtkTriangle * Triangle ; private : vtkTriangleStrip ( const vtkTriangleStrip & ) = delete ; void operator = ( const vtkTriangleStrip & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
