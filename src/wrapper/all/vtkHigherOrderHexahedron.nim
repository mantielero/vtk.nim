## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHigherOrderHexahedron.h
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
##  @class   vtkHigherOrderHexahedron
##  @brief   A 3D cell that represents an arbitrary order HigherOrder hex
##
##  vtkHigherOrderHexahedron is a concrete implementation of vtkCell to represent a
##  3D hexahedron using HigherOrder shape functions of user specified order.
##
##  @sa
##  vtkHexahedron
##

## !!!Ignored construct:  # vtkHigherOrderHexahedron_h [NewLine] # vtkHigherOrderHexahedron_h [NewLine] # vtkCellType.h  For GetCellType. # vtkCommonDataModelModule.h  For export macro # vtkDeprecation.h  For deprecation macros # vtkNew.h  For member variable. # vtkNonLinearCell.h [NewLine] # vtkSmartPointer.h  For member variable. # < functional > For std::function [NewLine] class vtkCellData ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkHexahedron"
discard "forward decl of vtkIdList"
discard "forward decl of vtkHigherOrderCurve"
discard "forward decl of vtkHigherOrderInterpolation"
discard "forward decl of vtkHigherOrderQuadrilateral"
discard "forward decl of vtkPointData"
discard "forward decl of vtkPoints"
discard "forward decl of vtkVector3d"
discard "forward decl of vtkVector3i"
## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkHigherOrderHexahedron : public vtkNonLinearCell { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkNonLinearCell Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkNonLinearCell :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkHigherOrderHexahedron :: IsTypeOf ( type ) ; } static vtkHigherOrderHexahedron * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkHigherOrderHexahedron * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkHigherOrderHexahedron * NewInstance ( ) const { return vtkHigherOrderHexahedron :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkNonLinearCell :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHigherOrderHexahedron :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHigherOrderHexahedron :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; int GetCellType ( ) override = 0 ; int GetCellDimension ( ) override { return 3 ; } int RequiresInitialization ( ) override { return 1 ; } int GetNumberOfEdges ( ) override { return 12 ; } int GetNumberOfFaces ( ) override { return 6 ; } vtkCell * GetEdge ( int edgeId ) override = 0 ; vtkCell * GetFace ( int faceId ) override = 0 ; void SetEdgeIdsAndPoints ( int edgeId , const std :: function < void ( const vtkIdType & ) > & set_number_of_ids_and_points , const std :: function < void ( const vtkIdType & , const vtkIdType & ) > & set_ids_and_points ) ; void SetFaceIdsAndPoints ( vtkHigherOrderQuadrilateral * result , int faceId , const std :: function < void ( const vtkIdType & ) > & set_number_of_ids_and_points , const std :: function < void ( const vtkIdType & , const vtkIdType & ) > & set_ids_and_points ) ; void Initialize ( ) override ; int CellBoundary ( int subId , const double pcoords [ 3 ] , vtkIdList * pts ) override ; int EvaluatePosition ( const double x [ 3 ] , double closestPoint [ 3 ] , int & subId , double pcoords [ 3 ] , double & dist2 , double weights [ ] ) override ; void EvaluateLocation ( int & subId , const double pcoords [ 3 ] , double x [ 3 ] , double * weights ) override ; void Contour ( double value , vtkDataArray * cellScalars , vtkIncrementalPointLocator * locator , vtkCellArray * verts , vtkCellArray * lines , vtkCellArray * polys , vtkPointData * inPd , vtkPointData * outPd , vtkCellData * inCd , vtkIdType cellId , vtkCellData * outCd ) override ; void Clip ( double value , vtkDataArray * cellScalars , vtkIncrementalPointLocator * locator , vtkCellArray * polys , vtkPointData * inPd , vtkPointData * outPd , vtkCellData * inCd , vtkIdType cellId , vtkCellData * outCd , int insideOut ) override ; int IntersectWithLine ( const double p1 [ 3 ] , const double p2 [ 3 ] , double tol , double & t , double x [ 3 ] , double pcoords [ 3 ] , int & subId ) override ; int Triangulate ( int index , vtkIdList * ptIds , vtkPoints * pts ) override ; void Derivatives ( int subId , const double pcoords [ 3 ] , const double * values , int dim , double * derivs ) override ; void SetParametricCoords ( ) ; double * GetParametricCoords ( ) override ; int GetParametricCenter ( double center [ 3 ] ) override ; double GetParametricDistance ( const double pcoords [ 3 ] ) override ; virtual void SetOrderFromCellData ( vtkCellData * cell_data , const vtkIdType numPts , const vtkIdType cell_id ) ; virtual void SetUniformOrderFromNumPoints ( const vtkIdType numPts ) ; virtual void SetOrder ( const int s , const int t , const int u ) ; virtual const int * GetOrder ( ) ; virtual int GetOrder ( int i ) { return this -> GetOrder ( ) [ i ] ; } void InterpolateFunctions ( const double pcoords [ 3 ] , double * weights ) override = 0 ; void InterpolateDerivs ( const double pcoords [ 3 ] , double * derivs ) override = 0 ; bool SubCellCoordinatesFromId ( vtkVector3i & ijk , int subId ) ; bool SubCellCoordinatesFromId ( int & i , int & j , int & k , int subId ) ; static int PointIndexFromIJK ( int i , int j , int k , const int * order ) ; int PointIndexFromIJK ( int i , int j , int k ) ; bool TransformApproxToCellParams ( int subCell , double * pcoords ) ; bool TransformFaceToCellParams ( int bdyFace , double * pcoords ) ; virtual vtkHigherOrderCurve * GetEdgeCell ( ) = 0 ; VTK_DEPRECATED_IN_9_1_0 ( renamed to GetEdgeCell ) virtual vtkHigherOrderCurve * getEdgeCell ( ) ; virtual vtkHigherOrderQuadrilateral * GetFaceCell ( ) = 0 ; VTK_DEPRECATED_IN_9_1_0 ( renamed to GetFaceCell ) virtual vtkHigherOrderQuadrilateral * getFaceCell ( ) ; virtual vtkHigherOrderInterpolation * GetInterpolation ( ) = 0 ; VTK_DEPRECATED_IN_9_1_0 ( renamed to GetInterpolation ) virtual vtkHigherOrderInterpolation * getInterp ( ) ; static vtkIdType NodeNumberingMappingFromVTK8To9 ( const int order [ 3 ] , const vtkIdType node_id_vtk8 ) ; protected : vtkHigherOrderHexahedron ( ) ; ~ vtkHigherOrderHexahedron ( ) override ; vtkHexahedron * GetApprox ( ) ; void PrepareApproxData ( vtkPointData * pd , vtkCellData * cd , vtkIdType cellId , vtkDataArray * cellScalars ) ; virtual vtkHexahedron * GetApproximateHex ( int subId , vtkDataArray * scalarsIn = nullptr , vtkDataArray * scalarsOut = nullptr ) = 0 ; int Order [ 4 ] ; vtkSmartPointer < vtkPoints > PointParametricCoordinates ; vtkSmartPointer < vtkHexahedron > Approx ; vtkSmartPointer < vtkPointData > ApproxPD ; vtkSmartPointer < vtkCellData > ApproxCD ; vtkNew < vtkDoubleArray > CellScalars ; vtkNew < vtkDoubleArray > Scalars ; vtkNew < vtkPoints > TmpPts ; vtkNew < vtkIdList > TmpIds ; private : vtkHigherOrderHexahedron ( const vtkHigherOrderHexahedron & ) = delete ; void operator = ( const vtkHigherOrderHexahedron & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

proc GetParametricCenter*(center: array[3, cdouble]): cint {.
    importcpp: "VTKCOMMONDATAMODEL_EXPORT::GetParametricCenter(@)",
    header: "vtkHigherOrderHexahedron.h".}