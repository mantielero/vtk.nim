## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCollectGraph.h
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
## ----------------------------------------------------------------------------
##  Copyright (c) Sandia Corporation
##  See Copyright.txt or http://www.paraview.org/HTML/Copyright.html for details.
## ----------------------------------------------------------------------------
## *
##  @class   vtkCollectGraph
##  @brief   Collect distributed graph.
##
##  This filter has code to collect a graph from across processes onto vertex 0.
##  Collection can be turned on or off using the "PassThrough" flag.
##

## !!!Ignored construct:  # vtkCollectGraph_h [NewLine] # vtkCollectGraph_h [NewLine] # vtkFiltersParallelModule.h  For export macro # vtkGraphAlgorithm.h [NewLine] class vtkMultiProcessController ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkSocketController"
## !!!Ignored construct:  class VTKFILTERSPARALLEL_EXPORT vtkCollectGraph : public vtkGraphAlgorithm { public : static vtkCollectGraph * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkGraphAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkGraphAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkCollectGraph :: IsTypeOf ( type ) ; } static vtkCollectGraph * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkCollectGraph * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkCollectGraph * NewInstance ( ) const { return vtkCollectGraph :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGraphAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCollectGraph :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCollectGraph :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  By default this filter uses the global controller,
##  but this method can be used to set another instead.
##  virtual void SetController ( vtkMultiProcessController * ) ; virtual vtkMultiProcessController * GetnameController ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Controller  address  << static_cast < vtkMultiProcessController * > ( this -> Controller ) ) ; return this -> Controller ; } ; /@} /@{ *
##  When this filter is being used in client-server mode,
##  this is the controller used to communicate between
##  client and server.  Client should not set the other controller.
##  virtual void SetSocketController ( vtkSocketController * ) ; virtual vtkSocketController * GetnameControllerSocketController ( ) { vtkDebugWithObjectMacro ( this , <<  returning  SocketController  address  << static_cast < vtkSocketController * > ( this -> SocketController ) ) ; return this -> SocketController ; } ; /@} /@{ *
##  To collect or just copy input to output. Off (collect) by default.
##  virtual void SetPassThrough ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PassThrough  to  << _arg ) ; if ( this -> PassThrough != _arg ) { this -> PassThrough = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetPassThrough ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PassThrough  of  << this -> PassThrough ) ; return this -> PassThrough ; } ; virtual void PassThroughOn ( ) { this -> SetPassThrough ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void PassThroughOff ( ) { this -> SetPassThrough ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} enum { DIRECTED_OUTPUT , UNDIRECTED_OUTPUT , USE_INPUT_TYPE } ; /@{ *
##  Directedness flag, used to signal whether the output graph is directed or undirected.
##  DIRECTED_OUTPUT expects that this filter is generating a directed graph.
##  UNDIRECTED_OUTPUT expects that this filter is generating an undirected graph.
##  DIRECTED_OUTPUT and UNDIRECTED_OUTPUT flags should only be set on the client
##  filter.  Server filters should be set to USE_INPUT_TYPE since they have valid
##  input and the directedness is determined from the input type.
##  virtual void SetPassThroughOutputType ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutputType  to  << _arg ) ; if ( this -> OutputType != _arg ) { this -> OutputType = _arg ; this -> Modified ( ) ; } } ; virtual int GetPassThroughOutputType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputType  of  << this -> OutputType ) ; return this -> OutputType ; } ; /@} protected : vtkCollectGraph ( ) ; ~ vtkCollectGraph ( ) override ; vtkTypeBool PassThrough ; int OutputType ;  Data generation method int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestDataObject ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; vtkMultiProcessController * Controller ; vtkSocketController * SocketController ; private : vtkCollectGraph ( const vtkCollectGraph & ) = delete ; void operator = ( const vtkCollectGraph & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
