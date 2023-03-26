## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDummyController.h
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
##  @class   vtkDummyController
##  @brief   Dummy controller for single process applications
##
##  This is a dummy controller which can be used by applications which always
##  require a controller but are also compile on systems without threads
##  or mpi.
##  @sa
##  vtkMultiProcessController
##

## !!!Ignored construct:  # vtkDummyController_h [NewLine] # vtkDummyController_h [NewLine] # vtkMultiProcessController.h [NewLine] # vtkParallelCoreModule.h  For export macro [NewLine] class VTKPARALLELCORE_EXPORT vtkDummyController : public vtkMultiProcessController { public : static vtkDummyController * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkMultiProcessController Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkMultiProcessController :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkDummyController :: IsTypeOf ( type ) ; } static vtkDummyController * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkDummyController * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkDummyController * NewInstance ( ) const { return vtkDummyController :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMultiProcessController :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDummyController :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDummyController :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  This method is for setting up the processes.
##  void Initialize ( int * , char * * * , int ) override { } void Initialize ( int * , char * * * ) override { } void Finalize ( ) override { } void Finalize ( int ) override { } *
##  This method always returns 0.
##  int GetLocalProcessId ( ) { return 0 ; } *
##  Directly calls the single method.
##  void SingleMethodExecute ( ) override ; *
##  Directly calls multiple method 0.
##  void MultipleMethodExecute ( ) override ; *
##  Does nothing.
##  void CreateOutputWindow ( ) override { } /@{ *
##  If you don't need any special functionality from the controller, you
##  can swap out the dummy communicator for another one.
##  virtual vtkCommunicator * GetnameRMICommunicator ( ) { vtkDebugWithObjectMacro ( this , <<  returning  RMICommunicator  address  << static_cast < vtkCommunicator * > ( this -> RMICommunicator ) ) ; return this -> RMICommunicator ; } ; virtual void SetCommunicator ( vtkCommunicator * ) ; virtual void SetRMICommunicator ( vtkCommunicator * ) ; /@} protected : vtkDummyController ( ) ; ~ vtkDummyController ( ) override ; private : vtkDummyController ( const vtkDummyController & ) = delete ; void operator = ( const vtkDummyController & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
