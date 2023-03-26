## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAlgorithmOutput.h
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
##  @class   vtkAlgorithmOutput
##  @brief   Proxy object to connect input/output ports.
##
##  vtkAlgorithmOutput is a proxy object returned by the GetOutputPort
##  method of vtkAlgorithm.  It may be passed to the
##  SetInputConnection, AddInputConnection, or RemoveInputConnection
##  methods of another vtkAlgorithm to establish a connection between
##  an output and input port.  The connection is not stored in the
##  proxy object: it is simply a convenience for creating or removing
##  connections.
##

## !!!Ignored construct:  # vtkAlgorithmOutput_h [NewLine] # vtkAlgorithmOutput_h [NewLine] # vtkCommonExecutionModelModule.h  For export macro # vtkObject.h [NewLine] class vtkAlgorithm ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKCOMMONEXECUTIONMODEL_EXPORT vtkAlgorithmOutput : public vtkObject { public : static vtkAlgorithmOutput * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkAlgorithmOutput :: IsTypeOf ( type ) ; } static vtkAlgorithmOutput * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkAlgorithmOutput * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkAlgorithmOutput * NewInstance ( ) const { return vtkAlgorithmOutput :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAlgorithmOutput :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAlgorithmOutput :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; void SetIndex ( int index ) ; int GetIndex ( ) const ; vtkAlgorithm * GetProducer ( ) const ; void SetProducer ( vtkAlgorithm * producer ) ; protected : vtkAlgorithmOutput ( ) ; ~ vtkAlgorithmOutput ( ) override ; int Index ; vtkAlgorithm * Producer ; private : vtkAlgorithmOutput ( const vtkAlgorithmOutput & ) = delete ; void operator = ( const vtkAlgorithmOutput & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
