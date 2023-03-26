## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPythonCommand.h
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

## !!!Ignored construct:  # vtkPythonCommand_h [NewLine] # vtkPythonCommand_h [NewLine] # vtkCommand.h [NewLine] # vtkPython.h [NewLine] # vtkWrappingPythonCoreModule.h  For export macro [NewLine]  To allow Python to use the vtkCommand features class VTKWRAPPINGPYTHONCORE_EXPORT vtkPythonCommand : public vtkCommand { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkCommand Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkCommand :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPythonCommand :: IsTypeOf ( type ) ; } static vtkPythonCommand * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPythonCommand * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPythonCommand * NewInstance ( ) const { return vtkPythonCommand :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCommand :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPythonCommand :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPythonCommand :: New ( ) ; } public : ; static vtkPythonCommand * New ( ) { return new vtkPythonCommand ; } void SetObject ( PyObject * o ) ; void SetThreadState ( PyThreadState * ts ) ; void Execute ( vtkObject * ptr , unsigned long eventtype , void * callData ) override ; PyObject * obj ; PyThreadState * ThreadState ; protected : vtkPythonCommand ( ) ; ~ vtkPythonCommand ( ) override ; } ;
## Error: token expected: ; but got: [identifier]!!!

##  VTK-HeaderTest-Exclude: vtkPythonCommand.h
