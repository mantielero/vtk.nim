## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHigherOrderCurve.h
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
##  .NAME vtkHigherOrderCurve
##  .SECTION Description
##  .SECTION See Also

## !!!Ignored construct:  # vtkHigherOrderCurve_h [NewLine] # vtkHigherOrderCurve_h [NewLine] # vtkCellType.h  For GetCellType. # vtkCommonDataModelModule.h  For export macro # vtkNew.h  For member variable. # vtkNonLinearCell.h [NewLine] # vtkSmartPointer.h  For member variable. [NewLine] class vtkCellData ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkIdList"
discard "forward decl of vtkLine"
discard "forward decl of vtkPointData"
discard "forward decl of vtkPoints"
discard "forward decl of vtkVector3d"
discard "forward decl of vtkVector3i"
## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkHigherOrderCurve : public vtkNonLinearCell { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkNonLinearCell Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkNonLinearCell :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkHigherOrderCurve :: IsTypeOf ( type ) ; } static vtkHigherOrderCurve * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkHigherOrderCurve * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkHigherOrderCurve * NewInstance ( ) const { return vtkHigherOrderCurve :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkNonLinearCell :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHigherOrderCurve :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHigherOrderCurve :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; int GetCellType ( ) override = 0 ; int GetCellDimension ( ) override { return 1 ; } int RequiresInitialization ( ) override { return 1 ; } int GetNumberOfEdges ( ) override { return 0 ; } int GetNumberOfFaces ( ) override { return 0 ; } vtkCell * GetEdge ( int ) override { return nullptr ; } vtkCell * GetFace ( int ) override { return nullptr ; } void Initialize ( ) override ; int CellBoundary ( int subId , const double pcoords [ 3 ] , vtkIdList * pts ) override ; int EvaluatePosition ( const double x [ 3 ] , double closestPoint [ 3 ] , int & subId , double pcoords [ 3 ] , double & dist2 , double weights [ ] ) override ; void EvaluateLocation ( int & subId , const double pcoords [ 3 ] , double x [ 3 ] , double * weights ) override ; void Contour ( double value , vtkDataArray * cellScalars , vtkIncrementalPointLocator * locator , vtkCellArray * verts , vtkCellArray * lines , vtkCellArray * polys , vtkPointData * inPd , vtkPointData * outPd , vtkCellData * inCd , vtkIdType cellId , vtkCellData * outCd ) override ; void Clip ( double value , vtkDataArray * cellScalars , vtkIncrementalPointLocator * locator , vtkCellArray * polys , vtkPointData * inPd , vtkPointData * outPd , vtkCellData * inCd , vtkIdType cellId , vtkCellData * outCd , int insideOut ) override ; int IntersectWithLine ( const double p1 [ 3 ] , const double p2 [ 3 ] , double tol , double & t , double x [ 3 ] , double pcoords [ 3 ] , int & subId ) override ; int Triangulate ( int index , vtkIdList * ptIds , vtkPoints * pts ) override ; void Derivatives ( int subId , const double pcoords [ 3 ] , const double * values , int dim , double * derivs ) override ; void SetParametricCoords ( ) ; double * GetParametricCoords ( ) override ; int GetParametricCenter ( double center [ 3 ] ) override ; double GetParametricDistance ( const double pcoords [ 3 ] ) override ; const int * GetOrder ( ) ; int GetOrder ( int i ) { return this -> GetOrder ( ) [ i ] ; } void InterpolateFunctions ( const double pcoords [ 3 ] , double * weights ) override = 0 ; void InterpolateDerivs ( const double pcoords [ 3 ] , double * derivs ) override = 0 ; bool SubCellCoordinatesFromId ( vtkVector3i & ijk , int subId ) ; bool SubCellCoordinatesFromId ( int & i , int subId ) ; int PointIndexFromIJK ( int i , int , int ) ; bool TransformApproxToCellParams ( int subCell , double * pcoords ) ; protected : vtkHigherOrderCurve ( ) ; ~ vtkHigherOrderCurve ( ) override ; vtkLine * GetApprox ( ) ; void PrepareApproxData ( vtkPointData * pd , vtkCellData * cd , vtkIdType cellId , vtkDataArray * cellScalars ) ; virtual vtkLine * GetApproximateLine ( int subId , vtkDataArray * scalarsIn = nullptr , vtkDataArray * scalarsOut = nullptr ) = 0 ; int Order [ 2 ] ; vtkSmartPointer < vtkPoints > PointParametricCoordinates ; vtkSmartPointer < vtkLine > Approx ; vtkSmartPointer < vtkPointData > ApproxPD ; vtkSmartPointer < vtkCellData > ApproxCD ; vtkNew < vtkDoubleArray > CellScalars ; vtkNew < vtkDoubleArray > Scalars ; vtkNew < vtkPoints > TmpPts ; vtkNew < vtkIdList > TmpIds ; private : vtkHigherOrderCurve ( const vtkHigherOrderCurve & ) = delete ; void operator = ( const vtkHigherOrderCurve & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

proc GetParametricCenter*(center: array[3, cdouble]): cint {.
    importcpp: "VTKCOMMONDATAMODEL_EXPORT::GetParametricCenter(@)",
    header: "vtkHigherOrderCurve.h".}