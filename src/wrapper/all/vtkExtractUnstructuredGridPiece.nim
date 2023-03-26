## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExtractUnstructuredGridPiece.h
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
##  @class   vtkExtractUnstructuredGridPiece
##  @brief   Return specified piece, including specified
##  number of ghost levels.
##

## !!!Ignored construct:  # vtkExtractUnstructuredGridPiece_h [NewLine] # vtkExtractUnstructuredGridPiece_h [NewLine] # vtkFiltersParallelModule.h  For export macro # vtkUnstructuredGridAlgorithm.h [NewLine] class vtkIdList ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkIntArray"
## !!!Ignored construct:  class VTKFILTERSPARALLEL_EXPORT vtkExtractUnstructuredGridPiece : public vtkUnstructuredGridAlgorithm { public : static vtkExtractUnstructuredGridPiece * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkUnstructuredGridAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkUnstructuredGridAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkExtractUnstructuredGridPiece :: IsTypeOf ( type ) ; } static vtkExtractUnstructuredGridPiece * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkExtractUnstructuredGridPiece * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkExtractUnstructuredGridPiece * NewInstance ( ) const { return vtkExtractUnstructuredGridPiece :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExtractUnstructuredGridPiece :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExtractUnstructuredGridPiece :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Turn on/off creating ghost cells (on by default).
##  virtual void SetCreateGhostCells ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CreateGhostCells  to  << _arg ) ; if ( this -> CreateGhostCells != _arg ) { this -> CreateGhostCells = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetCreateGhostCells ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CreateGhostCells  of  << this -> CreateGhostCells ) ; return this -> CreateGhostCells ; } ; virtual void CreateGhostCellsOn ( ) { this -> SetCreateGhostCells ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void CreateGhostCellsOff ( ) { this -> SetCreateGhostCells ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkExtractUnstructuredGridPiece ( ) ; ~ vtkExtractUnstructuredGridPiece ( ) override = default ;  Usual data generation method int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ;  A method for labeling which piece the cells belong to. void ComputeCellTags ( vtkIntArray * cellTags , vtkIdList * pointOwnership , int piece , int numPieces , vtkUnstructuredGrid * input ) ; void AddGhostLevel ( vtkUnstructuredGrid * input , vtkIntArray * cellTags , int ghostLevel ) ; vtkTypeBool CreateGhostCells ; private : void AddFirstGhostLevel ( vtkUnstructuredGrid * input , vtkIntArray * cellTags , int piece , int numPieces ) ; vtkExtractUnstructuredGridPiece ( const vtkExtractUnstructuredGridPiece & ) = delete ; void operator = ( const vtkExtractUnstructuredGridPiece & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
