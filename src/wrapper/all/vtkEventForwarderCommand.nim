## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkEventForwarderCommand.h
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
##  @class   vtkEventForwarderCommand
##  @brief   a simple event forwarder command
##
##  Use vtkEventForwarderCommand to forward an event to a new object.
##  This command will intercept the event, and use InvokeEvent
##  on a 'target' as if that object was the one that invoked the event instead
##  of the object this command was attached to using AddObserver.
##
##  @sa
##  vtkCommand
##

## !!!Ignored construct:  # vtkEventForwarderCommand_h [NewLine] # vtkEventForwarderCommand_h [NewLine] # vtkCommand.h [NewLine] # vtkCommonCoreModule.h  For export macro [NewLine] class VTKCOMMONCORE_EXPORT vtkEventForwarderCommand : public vtkCommand { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkCommand Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkCommand :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkEventForwarderCommand :: IsTypeOf ( type ) ; } static vtkEventForwarderCommand * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkEventForwarderCommand * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkEventForwarderCommand * NewInstance ( ) const { return vtkEventForwarderCommand :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCommand :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkEventForwarderCommand :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkEventForwarderCommand :: New ( ) ; } public : ; static vtkEventForwarderCommand * New ( ) { return new vtkEventForwarderCommand ; } *
##  Satisfy the superclass API for callbacks. Recall that the caller is
##  the instance invoking the event; eid is the event id (see
##  vtkCommand.h); and calldata is information sent when the callback
##  was invoked (e.g., progress value in the vtkCommand::ProgressEvent).
##  void Execute ( vtkObject * caller , unsigned long eid , void * callData ) override ; *
##  Methods to set and get client and callback information, and the callback
##  function.
##  virtual void SetTarget ( vtkObject * obj ) { this -> Target = obj ; } virtual void * GetTarget ( ) { return this -> Target ; } protected : vtkObject * Target ; vtkEventForwarderCommand ( ) ; ~ vtkEventForwarderCommand ( ) override = default ; } ;
## Error: token expected: ; but got: [identifier]!!!

##  VTK-HeaderTest-Exclude: vtkEventForwarderCommand.h
