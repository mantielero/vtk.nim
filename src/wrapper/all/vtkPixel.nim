## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPixel.h
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
##  @class   vtkPixel
##  @brief   a cell that represents an orthogonal quadrilateral
##
##  vtkPixel is a concrete implementation of vtkCell to represent a 2D
##  orthogonal quadrilateral. Unlike vtkQuad, the corners are at right angles,
##  and aligned along x-y-z coordinate axes leading to large increases in
##  computational efficiency.
##

## !!!Ignored construct:  # vtkPixel_h [NewLine] # vtkPixel_h [NewLine] # vtkCell.h [NewLine] # vtkCommonDataModelModule.h  For export macro [NewLine] class vtkLine ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkIncrementalPointLocator"
## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkPixel : public vtkCell { public : static vtkPixel * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkCell Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkCell :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPixel :: IsTypeOf ( type ) ; } static vtkPixel * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPixel * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPixel * NewInstance ( ) const { return vtkPixel :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCell :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPixel :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPixel :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  See the vtkCell API for descriptions of these methods.
##  int GetCellType ( ) override { return VTK_PIXEL ; } int GetCellDimension ( ) override { return 2 ; } int GetNumberOfEdges ( ) override { return 4 ; } int GetNumberOfFaces ( ) override { return 0 ; } vtkCell * GetEdge ( int edgeId ) override ; vtkCell * GetFace ( int ) override { return nullptr ; } int CellBoundary ( int subId , const double pcoords [ 3 ] , vtkIdList * pts ) override ; void Contour ( double value , vtkDataArray * cellScalars , vtkIncrementalPointLocator * locator , vtkCellArray * verts , vtkCellArray * lines , vtkCellArray * polys , vtkPointData * inPd , vtkPointData * outPd , vtkCellData * inCd , vtkIdType cellId , vtkCellData * outCd ) override ; void Clip ( double value , vtkDataArray * cellScalars , vtkIncrementalPointLocator * locator , vtkCellArray * polys , vtkPointData * inPd , vtkPointData * outPd , vtkCellData * inCd , vtkIdType cellId , vtkCellData * outCd , int insideOut ) override ; int EvaluatePosition ( const double x [ 3 ] , double closestPoint [ 3 ] , int & subId , double pcoords [ 3 ] , double & dist2 , double weights [ ] ) override ; void EvaluateLocation ( int & subId , const double pcoords [ 3 ] , double x [ 3 ] , double * weights ) override ; /@} *
##  Inflates this pixel by a distance of dist by moving the edges of the pixel
##  by that distance. Since a pixel lies in 3D, the degenerate case where the
##  pixel is homogeneous to a line are discarted because of normal direction
##  ambiguity. Hence, if you shrink a 2D pixel so it loses thickness in one
##  dimension. inflating it back to its previous form is impossible.
##
##  A degenerate pixel of dimension 1 is inflated the same way a segment would be
##  inflated. A degenerate pixel of dimension 0 is untouched.
##
##  \return 1
##  int Inflate ( double dist ) override ; *
##  Computes exact bounding sphere of this pixel.
##  double ComputeBoundingSphere ( double center [ 3 ] ) const override ; *
##  Return the center of the triangle in parametric coordinates.
##  int GetParametricCenter ( double pcoords [ 3 ] ) override ; int IntersectWithLine ( const double p1 [ 3 ] , const double p2 [ 3 ] , double tol , double & t , double x [ 3 ] , double pcoords [ 3 ] , int & subId ) override ; int Triangulate ( int index , vtkIdList * ptIds , vtkPoints * pts ) override ; void Derivatives ( int subId , const double pcoords [ 3 ] , const double * values , int dim , double * derivs ) override ; double * GetParametricCoords ( ) override ; static void InterpolationFunctions ( const double pcoords [ 3 ] , double weights [ 4 ] ) ; static void InterpolationDerivs ( const double pcoords [ 3 ] , double derivs [ 8 ] ) ; /@{ *
##  Compute the interpolation functions/derivatives
##  (aka shape functions/derivatives)
##  void InterpolateFunctions ( const double pcoords [ 3 ] , double weights [ 4 ] ) override { vtkPixel :: InterpolationFunctions ( pcoords , weights ) ; } void InterpolateDerivs ( const double pcoords [ 3 ] , double derivs [ 8 ] ) override { vtkPixel :: InterpolationDerivs ( pcoords , derivs ) ; } /@} *
##  vtkPixel's normal cannot be computed using vtkPolygon::ComputeNormal because
##  its points are not sorted such that circulating on them forms the pixel.
##  This is a convenient method so one can compute normals on a pixel.
##  int ComputeNormal ( double n [ 3 ] ) ; protected : vtkPixel ( ) ; ~ vtkPixel ( ) override ; vtkLine * Line ; private : vtkPixel ( const vtkPixel & ) = delete ; void operator = ( const vtkPixel & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## ----------------------------------------------------------------------------

proc GetParametricCenter*(pcoords: array[3, cdouble]): cint {.
    importcpp: "VTKCOMMONDATAMODEL_EXPORT::GetParametricCenter(@)",
    header: "vtkPixel.h".}