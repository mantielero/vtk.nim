## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkEdgeCenters.h
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
##  @class   vtkEdgeCenters
##  @brief   generate points at center of edges
##
##  vtkEdgeCenters is a filter that takes as input any graph and
##  generates on output points at the center of the cells in the dataset.
##  These points can be used for placing glyphs (vtkGlyph3D) or labeling
##  (vtkLabeledDataMapper). (The center is the parametric center of the
##  cell, not necessarily the geometric or bounding box center.) The edge
##  attributes will be associated with the points on output.
##
##  @warning
##  You can choose to generate just points or points and vertex cells.
##  Vertex cells are drawn during rendering; points are not. Use the ivar
##  VertexCells to generate cells.
##
##  @sa
##  vtkGlyph3D vtkLabeledDataMapper
##

## !!!Ignored construct:  # vtkEdgeCenters_h [NewLine] # vtkEdgeCenters_h [NewLine] # vtkInfovisCoreModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class VTKINFOVISCORE_EXPORT vtkEdgeCenters : public vtkPolyDataAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkEdgeCenters :: IsTypeOf ( type ) ; } static vtkEdgeCenters * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkEdgeCenters * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkEdgeCenters * NewInstance ( ) const { return vtkEdgeCenters :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkEdgeCenters :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkEdgeCenters :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct object with vertex cell generation turned off.
##  static vtkEdgeCenters * New ( ) ; /@{ *
##  Enable/disable the generation of vertex cells.
##  virtual void SetVertexCells ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  VertexCells  to  << _arg ) ; if ( this -> VertexCells != _arg ) { this -> VertexCells = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetVertexCells ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << VertexCells  of  << this -> VertexCells ) ; return this -> VertexCells ; } ; virtual void VertexCellsOn ( ) { this -> SetVertexCells ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void VertexCellsOff ( ) { this -> SetVertexCells ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkEdgeCenters ( ) ; ~ vtkEdgeCenters ( ) override = default ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; vtkTypeBool VertexCells ; private : vtkEdgeCenters ( const vtkEdgeCenters & ) = delete ; void operator = ( const vtkEdgeCenters & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
