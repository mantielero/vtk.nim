## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMPI4PyCommunicator.h
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
##  @class   vtkMPI4PyCommunicator
##  @brief   Class for bridging MPI4Py with vtkMPICommunicator.
##
##
##  This class can be used to convert between VTK and MPI4Py communicators.
##
##  @sa
##  vtkMPICommunicator
##

## !!!Ignored construct:  # vtkMPI4PyCommunicator_h [NewLine] # vtkMPI4PyCommunicator_h [NewLine]  This class should only be wrapped for Python. The hierarchy "wrapping" also
##  needs to see the class for use in the Python wrappers. # ! defined ( __VTK_WRAP__ ) || defined ( __VTK_WRAP_HIERARCHY__ ) || defined ( __VTK_WRAP_PYTHON__ ) [NewLine] # vtkPython.h  For PyObject*; must be first [NewLine] # vtkObject.h [NewLine] # vtkParallelMPI4PyModule.h  For export macro [NewLine] class vtkMPICommunicator ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKPARALLELMPI4PY_EXPORT vtkMPI4PyCommunicator : public vtkObject { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkMPI4PyCommunicator :: IsTypeOf ( type ) ; } static vtkMPI4PyCommunicator * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkMPI4PyCommunicator * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkMPI4PyCommunicator * NewInstance ( ) const { return vtkMPI4PyCommunicator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMPI4PyCommunicator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMPI4PyCommunicator :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkMPI4PyCommunicator * New ( ) ; vtkMPI4PyCommunicator ( ) ; *
##  Convert a VTK communicator into an mpi4py communicator.
##  static PyObject * ConvertToPython ( vtkMPICommunicator * comm ) ; *
##  Convert an mpi4py communicator into a VTK communicator.
##  static vtkMPICommunicator * ConvertToVTK ( PyObject * comm ) ; private : vtkMPI4PyCommunicator ( const vtkMPI4PyCommunicator & ) = delete ; void operator = ( const vtkMPI4PyCommunicator & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
