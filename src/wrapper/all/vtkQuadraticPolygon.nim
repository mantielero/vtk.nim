## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkQuadraticPolygon.h
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
##  @class   vtkQuadraticPolygon
##  @brief   a cell that represents a parabolic n-sided polygon
##
##  vtkQuadraticPolygon is a concrete implementation of vtkNonLinearCell to
##  represent a 2D n-sided (2*n nodes) parabolic polygon. The polygon cannot
##  have any internal holes, and cannot self-intersect. The cell includes a
##  mid-edge node for each of the n edges of the cell. The ordering of the
##  2*n points defining the cell are point ids (0..n-1 and n..2*n-1) where ids
##  0..n-1 define the corner vertices of the polygon; ids n..2*n-1 define the
##  midedge nodes. Define the polygon with points ordered in the counter-
##  clockwise direction; do not repeat the last point.
##
##  @sa
##  vtkQuadraticEdge vtkQuadraticTriangle vtkQuadraticTetra
##  vtkQuadraticHexahedron vtkQuadraticWedge vtkQuadraticPyramid
##

## !!!Ignored construct:  # vtkQuadraticPolygon_h [NewLine] # vtkQuadraticPolygon_h [NewLine] # vtkCommonDataModelModule.h  For export macro # vtkNonLinearCell.h [NewLine] class vtkQuadraticEdge ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkPolygon"
discard "forward decl of vtkIdTypeArray"
## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkQuadraticPolygon : public vtkNonLinearCell { public : static vtkQuadraticPolygon * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkNonLinearCell Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkNonLinearCell :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkQuadraticPolygon :: IsTypeOf ( type ) ; } static vtkQuadraticPolygon * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkQuadraticPolygon * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkQuadraticPolygon * NewInstance ( ) const { return vtkQuadraticPolygon :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkNonLinearCell :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkQuadraticPolygon :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkQuadraticPolygon :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Implement the vtkCell API. See the vtkCell API for descriptions
##  of these methods.
##  int GetCellType ( ) override { return VTK_QUADRATIC_POLYGON ; } int GetCellDimension ( ) override { return 2 ; } int GetNumberOfEdges ( ) override { return this -> GetNumberOfPoints ( ) / 2 ; } int GetNumberOfFaces ( ) override { return 0 ; } vtkCell * GetEdge ( int ) override ; vtkCell * GetFace ( int ) override { return nullptr ; } int IsPrimaryCell ( ) override { return 0 ; } /@{ *
##  These methods are based on the vtkPolygon ones :
##  the vtkQuadraticPolygon (with n edges and 2*n points)
##  is transform into a vtkPolygon (with 2*n edges and 2*n points)
##  and the vtkPolygon methods are called.
##  int CellBoundary ( int subId , const double pcoords [ 3 ] , vtkIdList * pts ) override ; void Contour ( double value , vtkDataArray * cellScalars , vtkIncrementalPointLocator * locator , vtkCellArray * verts , vtkCellArray * lines , vtkCellArray * polys , vtkPointData * inPd , vtkPointData * outPd , vtkCellData * inCd , vtkIdType cellId , vtkCellData * outCd ) override ; void Clip ( double value , vtkDataArray * cellScalars , vtkIncrementalPointLocator * locator , vtkCellArray * polys , vtkPointData * inPd , vtkPointData * outPd , vtkCellData * inCd , vtkIdType cellId , vtkCellData * outCd , int insideOut ) override ; int EvaluatePosition ( const double x [ 3 ] , double closestPoint [ 3 ] , int & subId , double pcoords [ 3 ] , double & dist2 , double weights [ ] ) override ; void EvaluateLocation ( int & subId , const double pcoords [ 3 ] , double x [ 3 ] , double * weights ) override ; int IntersectWithLine ( const double p1 [ 3 ] , const double p2 [ 3 ] , double tol , double & t , double x [ 3 ] , double pcoords [ 3 ] , int & subId ) override ; void InterpolateFunctions ( const double x [ 3 ] , double * weights ) override ; static void ComputeCentroid ( vtkIdTypeArray * ids , vtkPoints * pts , double centroid [ 3 ] ) ; int ParameterizePolygon ( double p0 [ 3 ] , double p10 [ 3 ] , double & l10 , double p20 [ 3 ] , double & l20 , double n [ 3 ] ) ; static int PointInPolygon ( double x [ 3 ] , int numPts , double * pts , double bounds [ 6 ] , double n [ 3 ] ) ; int Triangulate ( vtkIdList * outTris ) ; int Triangulate ( int index , vtkIdList * ptIds , vtkPoints * pts ) override ; int NonDegenerateTriangulate ( vtkIdList * outTris ) ; static double DistanceToPolygon ( double x [ 3 ] , int numPts , double * pts , double bounds [ 6 ] , double closest [ 3 ] ) ; static int IntersectPolygonWithPolygon ( int npts , double * pts , double bounds [ 6 ] , int npts2 , double * pts2 , double bounds2 [ 6 ] , double tol , double x [ 3 ] ) ; static int IntersectConvex2DCells ( vtkCell * cell1 , vtkCell * cell2 , double tol , double p0 [ 3 ] , double p1 [ 3 ] ) ; /@}  Not implemented void Derivatives ( int subId , const double pcoords [ 3 ] , const double * values , int dim , double * derivs ) override ; /@{ *
##  Set/Get the flag indicating whether to use Mean Value Coordinate for the
##  interpolation. If true, InterpolateFunctions() uses the Mean Value
##  Coordinate to compute weights. Otherwise, the conventional 1/r^2 method
##  is used. The UseMVCInterpolation parameter is set to true by default.
##  virtual bool GetUseMVCInterpolation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseMVCInterpolation  of  << this -> UseMVCInterpolation ) ; return this -> UseMVCInterpolation ; } ; virtual void SetUseMVCInterpolation ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseMVCInterpolation  to  << _arg ) ; if ( this -> UseMVCInterpolation != _arg ) { this -> UseMVCInterpolation = _arg ; this -> Modified ( ) ; } } ; /@} protected : vtkQuadraticPolygon ( ) ; ~ vtkQuadraticPolygon ( ) override ;  variables used by instances of this class vtkPolygon * Polygon ; vtkQuadraticEdge * Edge ;  Parameter indicating whether to use Mean Value Coordinate algorithm
##  for interpolation. The parameter is true by default. bool UseMVCInterpolation ; /@{ *
##  Methods to transform a vtkQuadraticPolygon variable into a vtkPolygon
##  variable.
##  static void GetPermutationFromPolygon ( vtkIdType nb , vtkIdList * permutation ) ; static void PermuteToPolygon ( vtkIdType nbPoints , double * inPoints , double * outPoints ) ; static void PermuteToPolygon ( vtkCell * inCell , vtkCell * outCell ) ; static void PermuteToPolygon ( vtkPoints * inPoints , vtkPoints * outPoints ) ; static void PermuteToPolygon ( vtkIdTypeArray * inIds , vtkIdTypeArray * outIds ) ; static void PermuteToPolygon ( vtkDataArray * inDataArray , vtkDataArray * outDataArray ) ; void InitializePolygon ( ) ; /@} /@{ *
##  Methods to transform a vtkPolygon variable into a vtkQuadraticPolygon
##  variable.
##  static void GetPermutationToPolygon ( vtkIdType nb , vtkIdList * permutation ) ; static void PermuteFromPolygon ( vtkIdType nb , double * values ) ; static void ConvertFromPolygon ( vtkIdList * ids ) ; /@} private : vtkQuadraticPolygon ( const vtkQuadraticPolygon & ) = delete ; void operator = ( const vtkQuadraticPolygon & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
