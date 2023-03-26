## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBooleanOperationPolyDataFilter.h
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
##  @class   vtkBooleanOperationPolyDataFilter
##
##
##  Computes the boundary of the union, intersection, or difference
##  volume computed from the volumes defined by two input surfaces. The
##  two surfaces do not need to be manifold, but if they are not,
##  unexpected results may be obtained. The resulting surface is
##  available in the first output of the filter. The second output
##  contains a set of polylines that represent the intersection between
##  the two input surfaces.
##
##  @warning This filter is not designed to perform 2D boolean operations,
##  and in fact relies on the inputs having no co-planar, overlapping cells.
##
##  This code was contributed in the VTK Journal paper:
##  "Boolean Operations on Surfaces in VTK Without External Libraries"
##  by Cory Quammen, Chris Weigle C., Russ Taylor
##  http://hdl.handle.net/10380/3262
##  http://www.midasjournal.org/browse/publication/797
##

## !!!Ignored construct:  # vtkBooleanOperationPolyDataFilter_h [NewLine] # vtkBooleanOperationPolyDataFilter_h [NewLine] # vtkFiltersGeneralModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] # vtkDataSetAttributes.h  Needed for CopyCells() method [NewLine] class vtkIdList ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSGENERAL_EXPORT vtkBooleanOperationPolyDataFilter : public vtkPolyDataAlgorithm { public : *
##  Construct object that computes the boolean surface.
##  static vtkBooleanOperationPolyDataFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkBooleanOperationPolyDataFilter :: IsTypeOf ( type ) ; } static vtkBooleanOperationPolyDataFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkBooleanOperationPolyDataFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkBooleanOperationPolyDataFilter * NewInstance ( ) const { return vtkBooleanOperationPolyDataFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBooleanOperationPolyDataFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBooleanOperationPolyDataFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; enum OperationType { VTK_UNION = 0 , VTK_INTERSECTION , VTK_DIFFERENCE } ; /@{ *
##  Set the boolean operation to perform. Defaults to union.
##  virtual void SetOperation ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Operation  to  << _arg ) ; if ( this -> Operation != ( _arg < VTK_UNION ? VTK_UNION : ( _arg > VTK_DIFFERENCE ? VTK_DIFFERENCE : _arg ) ) ) { this -> Operation = ( _arg < VTK_UNION ? VTK_UNION : ( _arg > VTK_DIFFERENCE ? VTK_DIFFERENCE : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetOperationMinValue ( ) { return VTK_UNION ; } virtual int GetOperationMaxValue ( ) { return VTK_DIFFERENCE ; } ; virtual int GetOperation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Operation  of  << this -> Operation ) ; return this -> Operation ; } ; void SetOperationToUnion ( ) { this -> SetOperation ( VTK_UNION ) ; } void SetOperationToIntersection ( ) { this -> SetOperation ( VTK_INTERSECTION ) ; } void SetOperationToDifference ( ) { this -> SetOperation ( VTK_DIFFERENCE ) ; } /@} /@{ *
##  Turn on/off cell reorientation of the intersection portion of the
##  surface when the operation is set to DIFFERENCE. Defaults to on.
##  virtual void SetReorientDifferenceCells ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ReorientDifferenceCells  to  << _arg ) ; if ( this -> ReorientDifferenceCells != _arg ) { this -> ReorientDifferenceCells = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetOperationReorientDifferenceCells ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReorientDifferenceCells  of  << this -> ReorientDifferenceCells ) ; return this -> ReorientDifferenceCells ; } ; virtual void ReorientDifferenceCellsOn ( ) { this -> SetReorientDifferenceCells ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ReorientDifferenceCellsOff ( ) { this -> SetReorientDifferenceCells ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/get the tolerance used to determine when a point's absolute
##  distance is considered to be zero. Defaults to 1e-6.
##  virtual void SetReorientDifferenceCellsTolerance ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Tolerance  to  << _arg ) ; if ( this -> Tolerance != _arg ) { this -> Tolerance = _arg ; this -> Modified ( ) ; } } ; virtual double GetOperationReorientDifferenceCellsTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tolerance  of  << this -> Tolerance ) ; return this -> Tolerance ; } ; /@} protected : vtkBooleanOperationPolyDataFilter ( ) ; ~ vtkBooleanOperationPolyDataFilter ( ) override ; *
##  Labels triangles in mesh as part of the intersection or union surface.
##  void SortPolyData ( vtkPolyData * input , vtkIdList * intersectionList , vtkIdList * unionList ) ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int , vtkInformation * ) override ; private : vtkBooleanOperationPolyDataFilter ( const vtkBooleanOperationPolyDataFilter & ) = delete ; void operator = ( const vtkBooleanOperationPolyDataFilter & ) = delete ; *
##  Copies cells with indices given by from one vtkPolyData to
##  another. The point and cell field lists are used to determine
##  which fields should be copied.
##  void CopyCells ( vtkPolyData * in , vtkPolyData * out , int idx , vtkDataSetAttributes :: FieldList & pointFieldList , vtkDataSetAttributes :: FieldList & cellFieldList , vtkIdList * cellIds , bool reverseCells ) ; *
##  Tolerance used to determine when a point's absolute
##  distance is considered to be zero.
##  double Tolerance ; *
##  Which operation to perform.
##  Can be VTK_UNION, VTK_INTERSECTION, or VTK_DIFFERENCE.
##  int Operation ; /@{ *
##  Determines if cells from the intersection surface should be
##  reversed in the difference surface.
##  vtkTypeBool ReorientDifferenceCells ; /@} } ;
## Error: token expected: ; but got: [identifier]!!!
