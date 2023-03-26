##  -*- c++ -*-
## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSubCommunicator.h
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
##  @class   vtkSubCommunicator
##  @brief   Provides communication on a process group.
##
##
##
##  This class provides an implementation for communicating on process groups.
##  In general, you should never use this class directly.  Instead, use the
##  vtkMultiProcessController::CreateSubController method.
##
##
##  @bug
##  Because all communication is delegated to the original communicator,
##  any error will report process ids with respect to the original
##  communicator, not this communicator that was actually used.
##
##  @sa
##  vtkCommunicator, vtkMultiProcessController
##
##  @par Thanks:
##  This class was originally written by Kenneth Moreland (kmorel@sandia.gov)
##  from Sandia National Laboratories.
##
##

## !!!Ignored construct:  # vtkSubCommunicator_h [NewLine] # vtkSubCommunicator_h [NewLine] # vtkCommunicator.h [NewLine] # vtkParallelCoreModule.h  For export macro [NewLine] class vtkProcessGroup ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKPARALLELCORE_EXPORT vtkSubCommunicator : public vtkCommunicator { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkCommunicator Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkCommunicator :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkSubCommunicator :: IsTypeOf ( type ) ; } static vtkSubCommunicator * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkSubCommunicator * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkSubCommunicator * NewInstance ( ) const { return vtkSubCommunicator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCommunicator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSubCommunicator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSubCommunicator :: New ( ) ; } public : ; static vtkSubCommunicator * New ( ) ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set/get the group on which communication will happen.
##  virtual vtkProcessGroup * GetnameGroup ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Group  address  << static_cast < vtkProcessGroup * > ( this -> Group ) ) ; return this -> Group ; } ; virtual void SetGroup ( vtkProcessGroup * group ) ; /@} /@{ *
##  Implementation for abstract supercalss.
##  int SendVoidArray ( const void * data , vtkIdType length , int type , int remoteHandle , int tag ) override ; int ReceiveVoidArray ( void * data , vtkIdType length , int type , int remoteHandle , int tag ) override ; /@} protected : vtkSubCommunicator ( ) ; ~ vtkSubCommunicator ( ) override ; vtkProcessGroup * Group ; private : vtkSubCommunicator ( const vtkSubCommunicator & ) = delete ; void operator = ( const vtkSubCommunicator & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
