## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkQuadraticQuad.h
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
##  @class   vtkQuadraticQuad
##  @brief   cell represents a parabolic, 8-node isoparametric quad
##
##  vtkQuadraticQuad is a concrete implementation of vtkNonLinearCell to
##  represent a two-dimensional, 8-node isoparametric parabolic quadrilateral
##  element. The interpolation is the standard finite element, quadratic
##  isoparametric shape function. The cell includes a mid-edge node for each
##  of the four edges of the cell. The ordering of the eight points defining
##  the cell are point ids (0-3,4-7) where ids 0-3 define the four corner
##  vertices of the quad; ids 4-7 define the midedge nodes (0,1), (1,2),
##  (2,3), (3,0).
##
##  @sa
##  vtkQuadraticEdge vtkQuadraticTriangle vtkQuadraticTetra
##  vtkQuadraticHexahedron vtkQuadraticWedge vtkQuadraticPyramid
##

## !!!Ignored construct:  # vtkQuadraticQuad_h [NewLine] # vtkQuadraticQuad_h [NewLine] # vtkCommonDataModelModule.h  For export macro # vtkNonLinearCell.h [NewLine] class vtkQuadraticEdge ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkQuad"
discard "forward decl of vtkDoubleArray"
## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkQuadraticQuad : public vtkNonLinearCell { public : static vtkQuadraticQuad * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkNonLinearCell Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkNonLinearCell :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkQuadraticQuad :: IsTypeOf ( type ) ; } static vtkQuadraticQuad * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkQuadraticQuad * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkQuadraticQuad * NewInstance ( ) const { return vtkQuadraticQuad :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkNonLinearCell :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkQuadraticQuad :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkQuadraticQuad :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Implement the vtkCell API. See the vtkCell API for descriptions
##  of these methods.
##  int GetCellType ( ) override { return VTK_QUADRATIC_QUAD ; } int GetCellDimension ( ) override { return 2 ; } int GetNumberOfEdges ( ) override { return 4 ; } int GetNumberOfFaces ( ) override { return 0 ; } vtkCell * GetEdge ( int ) override ; vtkCell * GetFace ( int ) override { return nullptr ; } /@} int CellBoundary ( int subId , const double pcoords [ 3 ] , vtkIdList * pts ) override ; void Contour ( double value , vtkDataArray * cellScalars , vtkIncrementalPointLocator * locator , vtkCellArray * verts , vtkCellArray * lines , vtkCellArray * polys , vtkPointData * inPd , vtkPointData * outPd , vtkCellData * inCd , vtkIdType cellId , vtkCellData * outCd ) override ; int EvaluatePosition ( const double x [ 3 ] , double closestPoint [ 3 ] , int & subId , double pcoords [ 3 ] , double & dist2 , double weights [ ] ) override ; void EvaluateLocation ( int & subId , const double pcoords [ 3 ] , double x [ 3 ] , double * weights ) override ; int Triangulate ( int index , vtkIdList * ptIds , vtkPoints * pts ) override ; void Derivatives ( int subId , const double pcoords [ 3 ] , const double * values , int dim , double * derivs ) override ; double * GetParametricCoords ( ) override ; *
##  Clip this quadratic quad using scalar value provided. Like contouring,
##  except that it cuts the quad to produce linear triangles.
##  void Clip ( double value , vtkDataArray * cellScalars , vtkIncrementalPointLocator * locator , vtkCellArray * polys , vtkPointData * inPd , vtkPointData * outPd , vtkCellData * inCd , vtkIdType cellId , vtkCellData * outCd , int insideOut ) override ; *
##  Line-edge intersection. Intersection has to occur within [0,1] parametric
##  coordinates and with specified tolerance.
##  int IntersectWithLine ( const double p1 [ 3 ] , const double p2 [ 3 ] , double tol , double & t , double x [ 3 ] , double pcoords [ 3 ] , int & subId ) override ; *
##  Return the center of the pyramid in parametric coordinates.
##  int GetParametricCenter ( double pcoords [ 3 ] ) override ; static void InterpolationFunctions ( const double pcoords [ 3 ] , double weights [ 8 ] ) ; static void InterpolationDerivs ( const double pcoords [ 3 ] , double derivs [ 16 ] ) ; /@{ *
##  Compute the interpolation functions/derivatives
##  (aka shape functions/derivatives)
##  void InterpolateFunctions ( const double pcoords [ 3 ] , double weights [ 8 ] ) override { vtkQuadraticQuad :: InterpolationFunctions ( pcoords , weights ) ; } void InterpolateDerivs ( const double pcoords [ 3 ] , double derivs [ 16 ] ) override { vtkQuadraticQuad :: InterpolationDerivs ( pcoords , derivs ) ; } /@} protected : vtkQuadraticQuad ( ) ; ~ vtkQuadraticQuad ( ) override ; vtkQuadraticEdge * Edge ; vtkQuad * Quad ; vtkPointData * PointData ; vtkDoubleArray * Scalars ;  In order to achieve some functionality we introduce a fake center point
##  which require to have some extra functionalities compare to other non-linar
##  cells vtkCellData * CellData ; vtkDoubleArray * CellScalars ; void Subdivide ( double * weights ) ; void InterpolateAttributes ( vtkPointData * inPd , vtkCellData * inCd , vtkIdType cellId , vtkDataArray * cellScalars ) ; private : vtkQuadraticQuad ( const vtkQuadraticQuad & ) = delete ; void operator = ( const vtkQuadraticQuad & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## ----------------------------------------------------------------------------

proc GetParametricCenter*(pcoords: array[3, cdouble]): cint {.
    importcpp: "VTKCOMMONDATAMODEL_EXPORT::GetParametricCenter(@)",
    header: "vtkQuadraticQuad.h".}