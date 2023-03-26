## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTransmitPolyDataPiece.h
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
##  @class   vtkTransmitRectilinearGridPiece
##  @brief   Redistributes data produced
##  by serial readers
##
##
##  This filter can be used to redistribute data from producers that can't
##  produce data in parallel. All data is produced on first process and
##  the distributed to others using the multiprocess controller.
##

## !!!Ignored construct:  # vtkTransmitPolyDataPiece_h [NewLine] # vtkTransmitPolyDataPiece_h [NewLine] # vtkFiltersParallelModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class vtkMultiProcessController ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSPARALLEL_EXPORT vtkTransmitPolyDataPiece : public vtkPolyDataAlgorithm { public : static vtkTransmitPolyDataPiece * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkTransmitPolyDataPiece :: IsTypeOf ( type ) ; } static vtkTransmitPolyDataPiece * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkTransmitPolyDataPiece * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkTransmitPolyDataPiece * NewInstance ( ) const { return vtkTransmitPolyDataPiece :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTransmitPolyDataPiece :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTransmitPolyDataPiece :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  By default this filter uses the global controller,
##  but this method can be used to set another instead.
##  virtual void SetController ( vtkMultiProcessController * ) ; virtual vtkMultiProcessController * GetnameController ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Controller  address  << static_cast < vtkMultiProcessController * > ( this -> Controller ) ) ; return this -> Controller ; } ; /@} /@{ *
##  Turn on/off creating ghost cells (on by default).
##  virtual void SetCreateGhostCells ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CreateGhostCells  to  << _arg ) ; if ( this -> CreateGhostCells != _arg ) { this -> CreateGhostCells = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetCreateGhostCells ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CreateGhostCells  of  << this -> CreateGhostCells ) ; return this -> CreateGhostCells ; } ; virtual void CreateGhostCellsOn ( ) { this -> SetCreateGhostCells ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void CreateGhostCellsOff ( ) { this -> SetCreateGhostCells ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkTransmitPolyDataPiece ( ) ; ~ vtkTransmitPolyDataPiece ( ) override ;  Data generation method int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; void RootExecute ( vtkPolyData * input , vtkPolyData * output , vtkInformation * outInfo ) ; void SatelliteExecute ( int procId , vtkPolyData * output , vtkInformation * outInfo ) ; vtkTypeBool CreateGhostCells ; vtkMultiProcessController * Controller ; private : vtkTransmitPolyDataPiece ( const vtkTransmitPolyDataPiece & ) = delete ; void operator = ( const vtkTransmitPolyDataPiece & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
