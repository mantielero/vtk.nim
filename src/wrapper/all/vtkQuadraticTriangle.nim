## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkQuadraticTriangle.h
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
##  @class   vtkQuadraticTriangle
##  @brief   cell represents a parabolic, isoparametric triangle
##
##  vtkQuadraticTriangle is a concrete implementation of vtkNonLinearCell to
##  represent a two-dimensional, 6-node, isoparametric parabolic triangle. The
##  interpolation is the standard finite element, quadratic isoparametric
##  shape function. The cell includes three mid-edge nodes besides the three
##  triangle vertices. The ordering of the three points defining the cell is
##  point ids (0-2,3-5) where id #3 is the midedge node between points
##  (0,1); id #4 is the midedge node between points (1,2); and id #5 is the
##  midedge node between points (2,0).
##
##  @sa
##  vtkQuadraticEdge vtkQuadraticTetra vtkQuadraticPyramid
##  vtkQuadraticQuad vtkQuadraticHexahedron vtkQuadraticWedge
##

## !!!Ignored construct:  # vtkQuadraticTriangle_h [NewLine] # vtkQuadraticTriangle_h [NewLine] # vtkCommonDataModelModule.h  For export macro # vtkNonLinearCell.h [NewLine] class vtkQuadraticEdge ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkTriangle"
discard "forward decl of vtkDoubleArray"
## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkQuadraticTriangle : public vtkNonLinearCell { public : static vtkQuadraticTriangle * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkNonLinearCell Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkNonLinearCell :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkQuadraticTriangle :: IsTypeOf ( type ) ; } static vtkQuadraticTriangle * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkQuadraticTriangle * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkQuadraticTriangle * NewInstance ( ) const { return vtkQuadraticTriangle :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkNonLinearCell :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkQuadraticTriangle :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkQuadraticTriangle :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Implement the vtkCell API. See the vtkCell API for descriptions
##  of these methods.
##  int GetCellType ( ) override { return VTK_QUADRATIC_TRIANGLE ; } int GetCellDimension ( ) override { return 2 ; } int GetNumberOfEdges ( ) override { return 3 ; } int GetNumberOfFaces ( ) override { return 0 ; } vtkCell * GetEdge ( int edgeId ) override ; vtkCell * GetFace ( int ) override { return nullptr ; } /@} int CellBoundary ( int subId , const double pcoords [ 3 ] , vtkIdList * pts ) override ; void Contour ( double value , vtkDataArray * cellScalars , vtkIncrementalPointLocator * locator , vtkCellArray * verts , vtkCellArray * lines , vtkCellArray * polys , vtkPointData * inPd , vtkPointData * outPd , vtkCellData * inCd , vtkIdType cellId , vtkCellData * outCd ) override ; int EvaluatePosition ( const double x [ 3 ] , double closestPoint [ 3 ] , int & subId , double pcoords [ 3 ] , double & dist2 , double weights [ ] ) override ; void EvaluateLocation ( int & subId , const double pcoords [ 3 ] , double x [ 3 ] , double * weights ) override ; int Triangulate ( int index , vtkIdList * ptIds , vtkPoints * pts ) override ; void Derivatives ( int subId , const double pcoords [ 3 ] , const double * values , int dim , double * derivs ) override ; double * GetParametricCoords ( ) override ; *
##  Clip this quadratic triangle using scalar value provided. Like
##  contouring, except that it cuts the triangle to produce linear
##  triangles.
##  void Clip ( double value , vtkDataArray * cellScalars , vtkIncrementalPointLocator * locator , vtkCellArray * polys , vtkPointData * inPd , vtkPointData * outPd , vtkCellData * inCd , vtkIdType cellId , vtkCellData * outCd , int insideOut ) override ; *
##  Line-edge intersection. Intersection has to occur within [0,1] parametric
##  coordinates and with specified tolerance.
##  int IntersectWithLine ( const double p1 [ 3 ] , const double p2 [ 3 ] , double tol , double & t , double x [ 3 ] , double pcoords [ 3 ] , int & subId ) override ; *
##  Return the center of the quadratic triangle in parametric coordinates.
##  int GetParametricCenter ( double pcoords [ 3 ] ) override ; *
##  Return the distance of the parametric coordinate provided to the
##  cell. If inside the cell, a distance of zero is returned.
##  double GetParametricDistance ( const double pcoords [ 3 ] ) override ; static void InterpolationFunctions ( const double pcoords [ 3 ] , double weights [ 6 ] ) ; static void InterpolationDerivs ( const double pcoords [ 3 ] , double derivs [ 12 ] ) ; /@{ *
##  Compute the interpolation functions/derivatives
##  (aka shape functions/derivatives)
##  void InterpolateFunctions ( const double pcoords [ 3 ] , double weights [ 6 ] ) override { vtkQuadraticTriangle :: InterpolationFunctions ( pcoords , weights ) ; } void InterpolateDerivs ( const double pcoords [ 3 ] , double derivs [ 12 ] ) override { vtkQuadraticTriangle :: InterpolationDerivs ( pcoords , derivs ) ; } /@} protected : vtkQuadraticTriangle ( ) ; ~ vtkQuadraticTriangle ( ) override ; vtkQuadraticEdge * Edge ; vtkTriangle * Face ; vtkDoubleArray * Scalars ;  used to avoid New/Delete in contouring/clipping private : vtkQuadraticTriangle ( const vtkQuadraticTriangle & ) = delete ; void operator = ( const vtkQuadraticTriangle & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## ----------------------------------------------------------------------------

proc GetParametricCenter*(pcoords: array[3, cdouble]): cint {.
    importcpp: "VTKCOMMONDATAMODEL_EXPORT::GetParametricCenter(@)",
    header: "vtkQuadraticTriangle.h".}