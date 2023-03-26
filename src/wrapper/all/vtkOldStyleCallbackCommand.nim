## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOldStyleCallbackCommand.h
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
##  @class   vtkOldStyleCallbackCommand
##  @brief   supports legacy function callbacks for VTK
##
##  vtkOldStyleCallbackCommand is a callback that supports the legacy callback
##  methods found in VTK. For example, the legacy method
##  vtkProcessObject::SetStartMethod() is actually invoked using the
##  command/observer design pattern of VTK, and the vtkOldStyleCallbackCommand
##  is used to provide the legacy functionality. The callback function should
##  have the form void func(void *clientdata), where clientdata is special data
##  that should is associated with this instance of vtkCallbackCommand.
##
##  @warning
##  This is legacy glue. Please do not use; it will be eventually eliminated.
##
##  @sa
##  vtkCommand vtkCallbackCommand
##

## !!!Ignored construct:  # vtkOldStyleCallbackCommand_h [NewLine] # vtkOldStyleCallbackCommand_h [NewLine] # vtkCommand.h [NewLine] # vtkCommonCoreModule.h  For export macro [NewLine]  the old style void fund(void *) callbacks class VTKCOMMONCORE_EXPORT vtkOldStyleCallbackCommand : public vtkCommand { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkCommand Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkCommand :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkOldStyleCallbackCommand :: IsTypeOf ( type ) ; } static vtkOldStyleCallbackCommand * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkOldStyleCallbackCommand * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkOldStyleCallbackCommand * NewInstance ( ) const { return vtkOldStyleCallbackCommand :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCommand :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOldStyleCallbackCommand :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOldStyleCallbackCommand :: New ( ) ; } public : ; static vtkOldStyleCallbackCommand * New ( ) { return new vtkOldStyleCallbackCommand ; } *
##  Satisfy the superclass API for callbacks.
##  void Execute ( vtkObject * invoker , unsigned long eid , void * calldata ) override ; /@{ *
##  Methods to set and get client and callback information.
##  void SetClientData ( void * cd ) { this -> ClientData = cd ; } void SetCallback ( void ( * f ) ( void * clientdata ) ) { this -> Callback = f ; } void SetClientDataDeleteCallback ( void ( * f ) ( void * ) ) { this -> ClientDataDeleteCallback = f ; } /@} void * ClientData ; void ( * Callback ) ( void * ) ; void ( * ClientDataDeleteCallback ) ( void * ) ; protected : vtkOldStyleCallbackCommand ( ) ; ~ vtkOldStyleCallbackCommand ( ) override ; } ;
## Error: token expected: ; but got: [identifier]!!!

##  VTK-HeaderTest-Exclude: vtkOldStyleCallbackCommand.h
