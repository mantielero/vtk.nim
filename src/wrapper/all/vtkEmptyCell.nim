## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkEmptyCell.h
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
##  @class   vtkEmptyCell
##  @brief   an empty cell used as a place-holder during processing
##
##  vtkEmptyCell is a concrete implementation of vtkCell. It is used
##  during processing to represented a deleted element.
##

## !!!Ignored construct:  # vtkEmptyCell_h [NewLine] # vtkEmptyCell_h [NewLine] # vtkCell.h [NewLine] # vtkCommonDataModelModule.h  For export macro [NewLine] class VTKCOMMONDATAMODEL_EXPORT vtkEmptyCell : public vtkCell { public : static vtkEmptyCell * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkCell Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkCell :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkEmptyCell :: IsTypeOf ( type ) ; } static vtkEmptyCell * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkEmptyCell * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkEmptyCell * NewInstance ( ) const { return vtkEmptyCell :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCell :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkEmptyCell :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkEmptyCell :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  See the vtkCell API for descriptions of these methods.
##  int GetCellType ( ) override { return VTK_EMPTY_CELL ; } int GetCellDimension ( ) override { return 0 ; } int GetNumberOfEdges ( ) override { return 0 ; } int GetNumberOfFaces ( ) override { return 0 ; } vtkCell * GetEdge ( int ) override { return nullptr ; } vtkCell * GetFace ( int ) override { return nullptr ; } int CellBoundary ( int subId , const double pcoords [ 3 ] , vtkIdList * pts ) override ; void Contour ( double value , vtkDataArray * cellScalars , vtkIncrementalPointLocator * locator , vtkCellArray * verts1 , vtkCellArray * lines , vtkCellArray * verts2 , vtkPointData * inPd , vtkPointData * outPd , vtkCellData * inCd , vtkIdType cellId , vtkCellData * outCd ) override ; void Clip ( double value , vtkDataArray * cellScalars , vtkIncrementalPointLocator * locator , vtkCellArray * pts , vtkPointData * inPd , vtkPointData * outPd , vtkCellData * inCd , vtkIdType cellId , vtkCellData * outCd , int insideOut ) override ; /@} int EvaluatePosition ( const double x [ 3 ] , double closestPoint [ 3 ] , int & subId , double pcoords [ 3 ] , double & dist2 , double weights [ ] ) override ; void EvaluateLocation ( int & subId , const double pcoords [ 3 ] , double x [ 3 ] , double * weights ) override ; int IntersectWithLine ( const double p1 [ 3 ] , const double p2 [ 3 ] , double tol , double & t , double x [ 3 ] , double pcoords [ 3 ] , int & subId ) override ; int Triangulate ( int index , vtkIdList * ptIds , vtkPoints * pts ) override ; void Derivatives ( int subId , const double pcoords [ 3 ] , const double * values , int dim , double * derivs ) override ; protected : vtkEmptyCell ( ) = default ; ~ vtkEmptyCell ( ) override = default ; private : vtkEmptyCell ( const vtkEmptyCell & ) = delete ; void operator = ( const vtkEmptyCell & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
