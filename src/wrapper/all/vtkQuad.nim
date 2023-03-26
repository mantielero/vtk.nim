## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkQuad.h
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
##  @class   vtkQuad
##  @brief   a cell that represents a 2D quadrilateral
##
##  vtkQuad is a concrete implementation of vtkCell to represent a 2D
##  quadrilateral. vtkQuad is defined by the four points (0,1,2,3) in
##  counterclockwise order. vtkQuad uses the standard isoparametric
##  interpolation functions for a linear quadrilateral.
##

## !!!Ignored construct:  # vtkQuad_h [NewLine] # vtkQuad_h [NewLine] # vtkCell.h [NewLine] # vtkCommonDataModelModule.h  For export macro [NewLine] class vtkLine ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkTriangle"
discard "forward decl of vtkIncrementalPointLocator"
## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkQuad : public vtkCell { public : static vtkQuad * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkCell Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkCell :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkQuad :: IsTypeOf ( type ) ; } static vtkQuad * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkQuad * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkQuad * NewInstance ( ) const { return vtkQuad :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCell :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkQuad :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkQuad :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  See the vtkCell API for descriptions of these methods.
##  int GetCellType ( ) override { return VTK_QUAD ; } int GetCellDimension ( ) override { return 2 ; } int GetNumberOfEdges ( ) override { return 4 ; } int GetNumberOfFaces ( ) override { return 0 ; } vtkCell * GetEdge ( int edgeId ) override ; vtkCell * GetFace ( int ) override { return nullptr ; } int CellBoundary ( int subId , const double pcoords [ 3 ] , vtkIdList * pts ) override ; void Contour ( double value , vtkDataArray * cellScalars , vtkIncrementalPointLocator * locator , vtkCellArray * verts , vtkCellArray * lines , vtkCellArray * polys , vtkPointData * inPd , vtkPointData * outPd , vtkCellData * inCd , vtkIdType cellId , vtkCellData * outCd ) override ; int EvaluatePosition ( const double x [ 3 ] , double closestPoint [ 3 ] , int & subId , double pcoords [ 3 ] , double & dist2 , double weights [ ] ) override ; void EvaluateLocation ( int & subId , const double pcoords [ 3 ] , double x [ 3 ] , double * weights ) override ; int IntersectWithLine ( const double p1 [ 3 ] , const double p2 [ 3 ] , double tol , double & t , double x [ 3 ] , double pcoords [ 3 ] , int & subId ) override ; int Triangulate ( int index , vtkIdList * ptIds , vtkPoints * pts ) override ; void Derivatives ( int subId , const double pcoords [ 3 ] , const double * values , int dim , double * derivs ) override ; double * GetParametricCoords ( ) override ; /@} *
##  Return the center of the triangle in parametric coordinates.
##  int GetParametricCenter ( double pcoords [ 3 ] ) override ; *
##  Clip this quad using scalar value provided. Like contouring, except
##  that it cuts the quad to produce other quads and/or triangles.
##  void Clip ( double value , vtkDataArray * cellScalars , vtkIncrementalPointLocator * locator , vtkCellArray * polys , vtkPointData * inPd , vtkPointData * outPd , vtkCellData * inCd , vtkIdType cellId , vtkCellData * outCd , int insideOut ) override ; static void InterpolationFunctions ( const double pcoords [ 3 ] , double sf [ 4 ] ) ; static void InterpolationDerivs ( const double pcoords [ 3 ] , double derivs [ 8 ] ) ; /@{ *
##  Compute the interpolation functions/derivatives
##  (aka shape functions/derivatives)
##  void InterpolateFunctions ( const double pcoords [ 3 ] , double sf [ 4 ] ) override { vtkQuad :: InterpolationFunctions ( pcoords , sf ) ; } void InterpolateDerivs ( const double pcoords [ 3 ] , double derivs [ 8 ] ) override { vtkQuad :: InterpolationDerivs ( pcoords , derivs ) ; } /@} *
##  Return the ids of the vertices defining edge (`edgeId`).
##  Ids are related to the cell, not to the dataset.
##
##  @note The return type changed. It used to be int*, it is now const vtkIdType*.
##  This is so ids are unified between vtkCell and vtkPoints, and so vtkCell ids
##  can be used as inputs in algorithms such as vtkPolygon::ComputeNormal.
##  const vtkIdType * GetEdgeArray ( vtkIdType edgeId ) ; protected : vtkQuad ( ) ; ~ vtkQuad ( ) override ; vtkLine * Line ; vtkTriangle * Triangle ; private : vtkQuad ( const vtkQuad & ) = delete ; void operator = ( const vtkQuad & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## ----------------------------------------------------------------------------

proc GetParametricCenter*(pcoords: array[3, cdouble]): cint {.
    importcpp: "VTKCOMMONDATAMODEL_EXPORT::GetParametricCenter(@)",
    header: "vtkQuad.h".}