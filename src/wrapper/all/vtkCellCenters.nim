## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCellCenters.h
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
##  @class   vtkCellCenters
##  @brief   generate points at center of cells
##
##  vtkCellCenters is a filter that takes as input any dataset and
##  generates on output points at the center of the cells in the dataset.
##  These points can be used for placing glyphs (vtkGlyph3D) or labeling
##  (vtkLabeledDataMapper). (The center is the parametric center of the
##  cell, not necessarily the geometric or bounding box center.) The cell
##  attributes will be associated with the points on output.
##
##  @warning
##  You can choose to generate just points or points and vertex cells.
##  Vertex cells are drawn during rendering; points are not. Use the ivar
##  VertexCells to generate cells.
##
##  @note
##  Empty cells will be ignored but will require a one by one cell to
##  point data copy that will make the processing slower.
##
##  @sa
##  vtkGlyph3D vtkLabeledDataMapper
##

## !!!Ignored construct:  # vtkCellCenters_h [NewLine] # vtkCellCenters_h [NewLine] # vtkFiltersCoreModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class vtkDoubleArray ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSCORE_EXPORT vtkCellCenters : public vtkPolyDataAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkCellCenters :: IsTypeOf ( type ) ; } static vtkCellCenters * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkCellCenters * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkCellCenters * NewInstance ( ) const { return vtkCellCenters :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCellCenters :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCellCenters :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct object with vertex cell generation turned off.
##  static vtkCellCenters * New ( ) ; /@{ *
##  Enable/disable the generation of vertex cells. The default
##  is Off.
##  virtual void SetVertexCells ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  VertexCells  to  << _arg ) ; if ( this -> VertexCells != _arg ) { this -> VertexCells = _arg ; this -> Modified ( ) ; } } ; virtual bool GetVertexCells ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << VertexCells  of  << this -> VertexCells ) ; return this -> VertexCells ; } ; virtual void VertexCellsOn ( ) { this -> SetVertexCells ( static_cast < bool > ( 1 ) ) ; } virtual void VertexCellsOff ( ) { this -> SetVertexCells ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Enable/disable whether input cell data arrays should be passed through (or
##  copied) as output point data arrays. Default is `true` i.e. the arrays will
##  be propagated.
##  virtual void SetVertexCellsCopyArrays ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CopyArrays  to  << _arg ) ; if ( this -> CopyArrays != _arg ) { this -> CopyArrays = _arg ; this -> Modified ( ) ; } } ; virtual bool GetVertexCellsCopyArrays ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CopyArrays  of  << this -> CopyArrays ) ; return this -> CopyArrays ; } ; virtual void CopyArraysOn ( ) { this -> SetVertexCellsCopyArrays ( static_cast < bool > ( 1 ) ) ; } virtual void CopyArraysOff ( ) { this -> SetVertexCellsCopyArrays ( static_cast < bool > ( 0 ) ) ; } ; /@} *
##  Compute centers of cells from a dataset, storing them in the centers array.
##  static void ComputeCellCenters ( vtkDataSet * dataset , vtkDoubleArray * centers ) ; protected : vtkCellCenters ( ) = default ; ~ vtkCellCenters ( ) override = default ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; bool VertexCells = false ; bool CopyArrays = true ; private : vtkCellCenters ( const vtkCellCenters & ) = delete ; void operator = ( const vtkCellCenters & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
