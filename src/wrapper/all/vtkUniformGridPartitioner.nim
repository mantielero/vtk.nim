## =========================================================================
##
##  Program:   Visualization Toolkit
##  Module:    vtkUniformGridPartitioner.h
##
##  Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##  All rights reserved.
##  See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##  This software is distributed WITHOUT ANY WARRANTY; without even
##  the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##  PURPOSE.  See the above copyright notice for more information.
##
##  =========================================================================
## *
##  @class   vtkUniformGridPartitioner
##
##
##   A concrete implementation of vtkMultiBlockDataSetAlgorithm that provides
##   functionality for partitioning a uniform grid. The partitioning method
##   that is used is Recursive Coordinate Bisection (RCB) where each time
##   the longest dimension is split.
##
##  @sa
##  vtkStructuredGridPartitioner vtkRectilinearGridPartitioner
##

## !!!Ignored construct:  # vtkUniformGridPartitioner_h [NewLine] # vtkUniformGridPartitioner_h [NewLine] # vtkCommonExecutionModelModule.h  For export macro # vtkMultiBlockDataSetAlgorithm.h [NewLine] class vtkInformation ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkInformationVector"
discard "forward decl of vtkIndent"
## !!!Ignored construct:  class VTKCOMMONEXECUTIONMODEL_EXPORT vtkUniformGridPartitioner : public vtkMultiBlockDataSetAlgorithm { public : static vtkUniformGridPartitioner * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkMultiBlockDataSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkMultiBlockDataSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkUniformGridPartitioner :: IsTypeOf ( type ) ; } static vtkUniformGridPartitioner * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkUniformGridPartitioner * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkUniformGridPartitioner * NewInstance ( ) const { return vtkUniformGridPartitioner :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMultiBlockDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkUniformGridPartitioner :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkUniformGridPartitioner :: New ( ) ; } public : ; void PrintSelf ( ostream & oss , vtkIndent indent ) override ; /@{ *
##  Set/Get macro for the number of subdivisions.
##  virtual int GetNumberOfPartitions ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfPartitions  of  << this -> NumberOfPartitions ) ; return this -> NumberOfPartitions ; } ; virtual void SetNumberOfPartitions ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NumberOfPartitions  to  << _arg ) ; if ( this -> NumberOfPartitions != _arg ) { this -> NumberOfPartitions = _arg ; this -> Modified ( ) ; } } ; /@} /@{ *
##  Set/Get macro for the number of ghost layers.
##  virtual int GetNumberOfPartitionsNumberOfGhostLayers ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfGhostLayers  of  << this -> NumberOfGhostLayers ) ; return this -> NumberOfGhostLayers ; } ; virtual void SetNumberOfPartitionsNumberOfGhostLayers ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NumberOfGhostLayers  to  << _arg ) ; if ( this -> NumberOfGhostLayers != _arg ) { this -> NumberOfGhostLayers = _arg ; this -> Modified ( ) ; } } ; /@} /@{ virtual vtkTypeBool GetNumberOfPartitionsNumberOfGhostLayersDuplicateNodes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DuplicateNodes  of  << this -> DuplicateNodes ) ; return this -> DuplicateNodes ; } ; virtual void SetNumberOfPartitionsNumberOfGhostLayersDuplicateNodes ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  DuplicateNodes  to  << _arg ) ; if ( this -> DuplicateNodes != _arg ) { this -> DuplicateNodes = _arg ; this -> Modified ( ) ; } } ; virtual void DuplicateNodesOn ( ) { this -> SetDuplicateNodes ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void DuplicateNodesOff ( ) { this -> SetDuplicateNodes ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkUniformGridPartitioner ( ) ; ~ vtkUniformGridPartitioner ( ) override ;  Standard Pipeline methods int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; int FillOutputPortInformation ( int port , vtkInformation * info ) override ; int NumberOfPartitions ; int NumberOfGhostLayers ; vtkTypeBool DuplicateNodes ; private : vtkUniformGridPartitioner ( const vtkUniformGridPartitioner & ) = delete ; void operator = ( const vtkUniformGridPartitioner & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
