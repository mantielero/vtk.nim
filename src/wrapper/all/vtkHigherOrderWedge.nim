## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHigherOrderWedge.h
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
##  @class   vtkHigherOrderWedge
##  @brief   A 3D cell that represents an arbitrary order HigherOrder wedge
##
##  vtkHigherOrderWedge is a concrete implementation of vtkCell to represent a
##  3D wedge using HigherOrder shape functions of user specified order.
##  A wedge consists of two triangular and three quadrilateral faces.
##  The first six points of the wedge (0-5) are the "corner" points
##  where the first three points are the base of the wedge. This wedge
##  point ordering is opposite the vtkWedge ordering though in that
##  the base of the wedge defined by the first three points (0,1,2) form
##  a triangle whose normal points inward (toward the triangular face (3,4,5)).
##  While this is opposite the vtkWedge convention it is consistent with
##  every other cell type in VTK. The first 2 parametric coordinates of the
##  HigherOrder wedge or for the triangular base and vary between 0 and 1. The
##  third parametric coordinate is between the two triangular faces and goes
##  from 0 to 1 as well.
##

## !!!Ignored construct:  # vtkHigherOrderWedge_h [NewLine] # vtkHigherOrderWedge_h [NewLine] # < functional > For std::function [NewLine] # vtkCellType.h  For GetCellType. # vtkCommonDataModelModule.h  For export macro # vtkDeprecation.h  For deprecation macros # vtkNew.h  For member variable. # vtkNonLinearCell.h [NewLine] # vtkSmartPointer.h  For member variable. [NewLine] class vtkCellData ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkWedge"
discard "forward decl of vtkIdList"
discard "forward decl of vtkPointData"
discard "forward decl of vtkPoints"
discard "forward decl of vtkVector3d"
discard "forward decl of vtkVector3i"
discard "forward decl of vtkHigherOrderCurve"
discard "forward decl of vtkHigherOrderInterpolation"
discard "forward decl of vtkHigherOrderQuadrilateral"
discard "forward decl of vtkHigherOrderTriangle"
## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkHigherOrderWedge : public vtkNonLinearCell { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkNonLinearCell Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkNonLinearCell :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkHigherOrderWedge :: IsTypeOf ( type ) ; } static vtkHigherOrderWedge * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkHigherOrderWedge * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkHigherOrderWedge * NewInstance ( ) const { return vtkHigherOrderWedge :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkNonLinearCell :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHigherOrderWedge :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHigherOrderWedge :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; int GetCellType ( ) override = 0 ; int GetCellDimension ( ) override { return 3 ; } int RequiresInitialization ( ) override { return 1 ; } int GetNumberOfEdges ( ) override { return 9 ; } int GetNumberOfFaces ( ) override { return 5 ; } vtkCell * GetEdge ( int edgeId ) override = 0 ; void SetEdgeIdsAndPoints ( int edgeId , const std :: function < void ( const vtkIdType & ) > & set_number_of_ids_and_points , const std :: function < void ( const vtkIdType & , const vtkIdType & ) > & set_ids_and_points ) ; vtkCell * GetFace ( int faceId ) override = 0 ; void Initialize ( ) override ; int CellBoundary ( int subId , const double pcoords [ 3 ] , vtkIdList * pts ) override ; int EvaluatePosition ( const double x [ 3 ] , double closestPoint [ 3 ] , int & subId , double pcoords [ 3 ] , double & dist2 , double weights [ ] ) override ; void EvaluateLocation ( int & subId , const double pcoords [ 3 ] , double x [ 3 ] , double * weights ) override ; void Contour ( double value , vtkDataArray * cellScalars , vtkIncrementalPointLocator * locator , vtkCellArray * verts , vtkCellArray * lines , vtkCellArray * polys , vtkPointData * inPd , vtkPointData * outPd , vtkCellData * inCd , vtkIdType cellId , vtkCellData * outCd ) override ; void Clip ( double value , vtkDataArray * cellScalars , vtkIncrementalPointLocator * locator , vtkCellArray * polys , vtkPointData * inPd , vtkPointData * outPd , vtkCellData * inCd , vtkIdType cellId , vtkCellData * outCd , int insideOut ) override ; int IntersectWithLine ( const double p1 [ 3 ] , const double p2 [ 3 ] , double tol , double & t , double x [ 3 ] , double pcoords [ 3 ] , int & subId ) override ; int Triangulate ( int index , vtkIdList * ptIds , vtkPoints * pts ) override ; void Derivatives ( int subId , const double pcoords [ 3 ] , const double * values , int dim , double * derivs ) override ; void SetParametricCoords ( ) ; double * GetParametricCoords ( ) override ; int GetParametricCenter ( double center [ 3 ] ) override ; double GetParametricDistance ( const double pcoords [ 3 ] ) override ; virtual void SetOrderFromCellData ( vtkCellData * cell_data , const vtkIdType numPts , const vtkIdType cell_id ) ; virtual void SetUniformOrderFromNumPoints ( const vtkIdType numPts ) ; virtual void SetOrder ( const int s , const int t , const int u , const vtkIdType numPts ) ; virtual const int * GetOrder ( ) ; virtual int GetOrder ( int i ) { return this -> GetOrder ( ) [ i ] ; } void InterpolateFunctions ( const double pcoords [ 3 ] , double * weights ) override = 0 ; void InterpolateDerivs ( const double pcoords [ 3 ] , double * derivs ) override = 0 ; bool SubCellCoordinatesFromId ( vtkVector3i & ijk , int subId ) ; bool SubCellCoordinatesFromId ( int & i , int & j , int & k , int subId ) ; static int PointIndexFromIJK ( int i , int j , int k , const int * order ) ; int PointIndexFromIJK ( int i , int j , int k ) ; bool TransformApproxToCellParams ( int subCell , double * pcoords ) ; bool TransformFaceToCellParams ( int bdyFace , double * pcoords ) ; static int GetNumberOfApproximatingWedges ( const int * order ) ; int GetNumberOfApproximatingWedges ( ) { return vtkHigherOrderWedge :: GetNumberOfApproximatingWedges ( this -> GetOrder ( ) ) ; } VTK_DEPRECATED_IN_9_1_0 ( renamed to GetBoundaryQuad ) virtual vtkHigherOrderQuadrilateral * getBdyQuad ( ) ; virtual vtkHigherOrderQuadrilateral * GetBoundaryQuad ( ) = 0 ; VTK_DEPRECATED_IN_9_1_0 ( renamed to GetBoundaryTri ) virtual vtkHigherOrderTriangle * getBdyTri ( ) ; virtual vtkHigherOrderTriangle * GetBoundaryTri ( ) = 0 ; VTK_DEPRECATED_IN_9_1_0 ( renamed to GetEdgeCell ) virtual vtkHigherOrderCurve * getEdgeCell ( ) ; virtual vtkHigherOrderCurve * GetEdgeCell ( ) = 0 ; VTK_DEPRECATED_IN_9_1_0 ( renamed to GetInterpolation ) virtual vtkHigherOrderInterpolation * getInterp ( ) ; virtual vtkHigherOrderInterpolation * GetInterpolation ( ) = 0 ; protected : vtkHigherOrderWedge ( ) ; ~ vtkHigherOrderWedge ( ) override ; vtkWedge * GetApprox ( ) ; void PrepareApproxData ( vtkPointData * pd , vtkCellData * cd , vtkIdType cellId , vtkDataArray * cellScalars ) ; vtkWedge * GetApproximateWedge ( int subId , vtkDataArray * scalarsIn = nullptr , vtkDataArray * scalarsOut = nullptr ) ; void GetTriangularFace ( vtkHigherOrderTriangle * result , int faceId , const std :: function < void ( const vtkIdType & ) > & set_number_of_ids_and_points , const std :: function < void ( const vtkIdType & , const vtkIdType & ) > & set_ids_and_points ) ; void GetQuadrilateralFace ( vtkHigherOrderQuadrilateral * result , int faceId , const std :: function < void ( const vtkIdType & ) > & set_number_of_ids_and_points , const std :: function < void ( const vtkIdType & , const vtkIdType & ) > & set_ids_and_points ) ; int Order [ 4 ] ; vtkSmartPointer < vtkPoints > PointParametricCoordinates ; vtkSmartPointer < vtkWedge > Approx ; vtkSmartPointer < vtkPointData > ApproxPD ; vtkSmartPointer < vtkCellData > ApproxCD ; vtkNew < vtkDoubleArray > CellScalars ; vtkNew < vtkDoubleArray > Scalars ; vtkNew < vtkPoints > TmpPts ; vtkNew < vtkIdList > TmpIds ; private : vtkHigherOrderWedge ( const vtkHigherOrderWedge & ) = delete ; void operator = ( const vtkHigherOrderWedge & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

proc GetParametricCenter*(center: array[3, cdouble]): cint {.
    importcpp: "VTKCOMMONDATAMODEL_EXPORT::GetParametricCenter(@)",
    header: "vtkHigherOrderWedge.h".}