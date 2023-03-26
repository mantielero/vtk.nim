## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkProcess.h
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
##  @class   vtkProcess
##  @brief   a process that can be launched by a vtkMultiProcessController
##
##  vtkProcess is an abstract class representing a process that can be launched
##  by a vtkMultiProcessController. Concrete classes just have to implement
##  Execute() method and make sure it set the proper value in ReturnValue.
##
##  @par Example:
##   class MyProcess: public vtkProcess
##   ...
##   vtkMultiProcessController *c;
##   MyProcess *p=new MyProcess::New();
##   p->SetArgs(argc,argv); // some parameters specific to the process
##   p->SetX(10.0); // ...
##   c->SetSingleProcess(p);
##   c->SingleMethodExecute();
##   int returnValue=p->GetReturnValue();
##
##  @sa
##  vtkMultiProcessController
##

## !!!Ignored construct:  # vtkProcess_h [NewLine] # vtkProcess_h [NewLine] # vtkObject.h [NewLine] # vtkParallelCoreModule.h  For export macro [NewLine] class vtkMultiProcessController ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKPARALLELCORE_EXPORT vtkProcess : public vtkObject { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkProcess :: IsTypeOf ( type ) ; } static vtkProcess * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkProcess * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkProcess * NewInstance ( ) const { return vtkProcess :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkProcess :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkProcess :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Entry point of the process.
##  This method is expected to update ReturnValue.
##  virtual void Execute ( ) = 0 ; *
##  Give access to the controller that launched the process.
##  Initial value is nullptr.
##  vtkMultiProcessController * GetController ( ) ; *
##  This method should not be called directly but set by the controller
##  itself.
##  void SetController ( vtkMultiProcessController * aController ) ; *
##  Value set at the end of a call to Execute.
##  int GetReturnValue ( ) ; protected : vtkProcess ( ) ; ~ vtkProcess ( ) override ; vtkMultiProcessController * Controller ; int ReturnValue ; private : vtkProcess ( const vtkProcess & ) = delete ; void operator = ( const vtkProcess & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
