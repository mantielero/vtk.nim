## =========================================================================
##
## Program:   Visualization Toolkit
## Module:    vtkCellDistanceSelector
##
## Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
## All rights reserved.
## See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
## This software is distributed WITHOUT ANY WARRANTY; without even
## the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
## PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkCellDistanceSelector
##  @brief   select neighbor cells up to a distance
##
##
##  This filter grows an input selection by iteratively selecting neighbor
##  cells (a neighbor cell is a cell that shares a vertex/edge/face), up to
##  a given topological distance to the selected neighborhood (number of times
##  we add neighbor cells).
##  This filter takes a vtkSelection and a vtkCompositeDataSet as inputs.
##  It outputs a vtkSelection identifying all the selected cells.
##
##  @par Thanks:
##  This file has been initially developed in the frame of CEA's Love visualization software
##  development <br> CEA/DIF - Commissariat a l'Energie Atomique, Centre DAM Ile-De-France <br> BP12,
##  F-91297 Arpajon, France. <br> Modified and integrated into VTK, Kitware SAS 2012 Implementation
##  by Thierry Carrard and Philippe Pebay
##

## !!!Ignored construct:  # vtkCellDistanceSelector_h [NewLine] # vtkCellDistanceSelector_h [NewLine] # vtkFiltersSelectionModule.h  For export macro # vtkSelectionAlgorithm.h [NewLine] # vtkSmartPointer.h  For smart pointers [NewLine] class vtkDataSet ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkSelection"
discard "forward decl of vtkAlgorithmOutput"
discard "forward decl of vtkDataArray"
## !!!Ignored construct:  class VTKFILTERSSELECTION_EXPORT vtkCellDistanceSelector : public vtkSelectionAlgorithm { public : /@{ protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkSelectionAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkSelectionAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkCellDistanceSelector :: IsTypeOf ( type ) ; } static vtkCellDistanceSelector * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkCellDistanceSelector * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkCellDistanceSelector * NewInstance ( ) const { return vtkCellDistanceSelector :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkSelectionAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCellDistanceSelector :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCellDistanceSelector :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} static vtkCellDistanceSelector * New ( ) ; *
##  enumeration values to specify input port types
##  enum InputPorts { INPUT_MESH = 0 , !< Port 0 is for input mesh INPUT_SELECTION = 1 !< Port 1 is for input selection } ; *
##  A convenience method to set the data object input connection to the producer output
##  void SetInputMeshConnection ( vtkAlgorithmOutput * in ) { this -> SetInputConnection ( INPUT_MESH , in ) ; } *
##  A convenience method to set the input data object
##  void SetInputMesh ( vtkDataObject * obj ) { this -> SetInputData ( INPUT_MESH , obj ) ; } *
##  A convenience method to set the selection input connection to the producer output
##  void SetInputSelectionConnection ( vtkAlgorithmOutput * in ) { this -> SetInputConnection ( INPUT_SELECTION , in ) ; } *
##  A convenience method to set the input selection
##  void SetInputSelection ( vtkSelection * obj ) { this -> SetInputData ( INPUT_SELECTION , obj ) ; } /@{ *
##  Tells how far (in term of topological distance) away from seed cells to expand the selection
##  virtual void SetDistance ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Distance  to  << _arg ) ; if ( this -> Distance != _arg ) { this -> Distance = _arg ; this -> Modified ( ) ; } } ; virtual int GetDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Distance  of  << this -> Distance ) ; return this -> Distance ; } ; /@} /@{ *
##  If set, seed cells passed with SetSeedCells will be included in the final selection
##  virtual void SetDistanceIncludeSeed ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  IncludeSeed  to  << _arg ) ; if ( this -> IncludeSeed != _arg ) { this -> IncludeSeed = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetDistanceIncludeSeed ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IncludeSeed  of  << this -> IncludeSeed ) ; return this -> IncludeSeed ; } ; virtual void IncludeSeedOn ( ) { this -> SetIncludeSeed ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void IncludeSeedOff ( ) { this -> SetIncludeSeed ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  If set, intermediate cells (between seed cells and the selection boundary) will be included in
##  the final selection
##  virtual void SetDistanceIncludeSeedAddIntermediate ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  AddIntermediate  to  << _arg ) ; if ( this -> AddIntermediate != _arg ) { this -> AddIntermediate = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetDistanceIncludeSeedAddIntermediate ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AddIntermediate  of  << this -> AddIntermediate ) ; return this -> AddIntermediate ; } ; virtual void AddIntermediateOn ( ) { this -> SetIncludeSeedAddIntermediate ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void AddIntermediateOff ( ) { this -> SetIncludeSeedAddIntermediate ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkCellDistanceSelector ( ) ; ~ vtkCellDistanceSelector ( ) override ; void AddSelectionNode ( vtkSelection * output , vtkSmartPointer < vtkDataArray > outIndices , int partNumber , int d ) ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; *
##  Tological radius from seed cells to be used to select cells
##  Default: 1
##  int Distance ; *
##  Decide whether seed cells are included in selection
##  Default: 1
##  vtkTypeBool IncludeSeed ; *
##  Decide whether at distance between 1 and Distance-1 are included in selection
##  Default: 1
##  vtkTypeBool AddIntermediate ; private : vtkCellDistanceSelector ( const vtkCellDistanceSelector & ) = delete ; void operator = ( const vtkCellDistanceSelector & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
