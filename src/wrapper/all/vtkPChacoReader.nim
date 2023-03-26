## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPChacoReader.h
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
##  @class   vtkPChacoReader
##  @brief   Read Chaco files
##
##  vtkPChacoReader is a unstructured grid source object that reads
##  Chaco files.  The file is read by process 0 and converted into
##  a vtkUnstructuredGrid.  The vtkDistributedDataFilter is invoked
##  to divide the grid among the processes.
##

## !!!Ignored construct:  # vtkPChacoReader_h [NewLine] # vtkPChacoReader_h [NewLine] # vtkChacoReader.h [NewLine] # vtkIOParallelModule.h  For export macro [NewLine] class vtkTimerLog ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkMultiProcessController"
## !!!Ignored construct:  class VTKIOPARALLEL_EXPORT vtkPChacoReader : public vtkChacoReader { public : static vtkPChacoReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkChacoReader Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkChacoReader :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPChacoReader :: IsTypeOf ( type ) ; } static vtkPChacoReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPChacoReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPChacoReader * NewInstance ( ) const { return vtkPChacoReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkChacoReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPChacoReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPChacoReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Set/Get the communicator object (we'll use global World controller
##  if you don't set a different one).
##  void SetController ( vtkMultiProcessController * c ) ; virtual vtkMultiProcessController * GetnameController ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Controller  address  << static_cast < vtkMultiProcessController * > ( this -> Controller ) ) ; return this -> Controller ; } ; protected : vtkPChacoReader ( ) ; ~ vtkPChacoReader ( ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkPChacoReader ( const vtkPChacoReader & ) = delete ; void operator = ( const vtkPChacoReader & ) = delete ; void SetUpEmptyGrid ( vtkUnstructuredGrid * output ) ; int DivideCells ( vtkMultiProcessController * contr , vtkUnstructuredGrid * output , int source ) ; int SendGrid ( vtkMultiProcessController * c , int to , vtkUnstructuredGrid * grid ) ; vtkUnstructuredGrid * GetGrid ( vtkMultiProcessController * c , int from ) ; vtkUnstructuredGrid * SubGrid ( vtkUnstructuredGrid * ug , vtkIdType from , vtkIdType to ) ; char * MarshallDataSet ( vtkUnstructuredGrid * extractedGrid , vtkIdType & len ) ; vtkUnstructuredGrid * UnMarshallDataSet ( char * buf , vtkIdType size ) ; int NumProcesses ; int MyId ; vtkMultiProcessController * Controller ; } ;
## Error: token expected: ; but got: [identifier]!!!
