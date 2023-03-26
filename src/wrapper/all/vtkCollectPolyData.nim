## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCollectPolyData.h
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
##  @class   vtkCollectPolyData
##  @brief   Collect distributed polydata.
##
##  This filter has code to collect polydat from across processes onto node 0.
##  Collection can be turned on or off using the "PassThrough" flag.
##

## !!!Ignored construct:  # vtkCollectPolyData_h [NewLine] # vtkCollectPolyData_h [NewLine] # vtkFiltersParallelModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class vtkMultiProcessController ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkSocketController"
## !!!Ignored construct:  class VTKFILTERSPARALLEL_EXPORT vtkCollectPolyData : public vtkPolyDataAlgorithm { public : static vtkCollectPolyData * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkCollectPolyData :: IsTypeOf ( type ) ; } static vtkCollectPolyData * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkCollectPolyData * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkCollectPolyData * NewInstance ( ) const { return vtkCollectPolyData :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCollectPolyData :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCollectPolyData :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  By default this filter uses the global controller,
##  but this method can be used to set another instead.
##  virtual void SetController ( vtkMultiProcessController * ) ; virtual vtkMultiProcessController * GetnameController ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Controller  address  << static_cast < vtkMultiProcessController * > ( this -> Controller ) ) ; return this -> Controller ; } ; /@} /@{ *
##  When this filter is being used in client-server mode,
##  this is the controller used to communicate between
##  client and server.  Client should not set the other controller.
##  virtual void SetSocketController ( vtkSocketController * ) ; virtual vtkSocketController * GetnameControllerSocketController ( ) { vtkDebugWithObjectMacro ( this , <<  returning  SocketController  address  << static_cast < vtkSocketController * > ( this -> SocketController ) ) ; return this -> SocketController ; } ; /@} /@{ *
##  To collect or just copy input to output. Off (collect) by default.
##  virtual void SetPassThrough ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PassThrough  to  << _arg ) ; if ( this -> PassThrough != _arg ) { this -> PassThrough = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetPassThrough ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PassThrough  of  << this -> PassThrough ) ; return this -> PassThrough ; } ; virtual void PassThroughOn ( ) { this -> SetPassThrough ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void PassThroughOff ( ) { this -> SetPassThrough ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkCollectPolyData ( ) ; ~ vtkCollectPolyData ( ) override ; vtkTypeBool PassThrough ;  Data generation method int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; vtkMultiProcessController * Controller ; vtkSocketController * SocketController ; private : vtkCollectPolyData ( const vtkCollectPolyData & ) = delete ; void operator = ( const vtkCollectPolyData & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
