## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPolyDataWriter.h
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
##  @class   vtkPolyDataWriter
##  @brief   write vtk polygonal data
##
##  vtkPolyDataWriter is a source object that writes ASCII or binary
##  polygonal data files in vtk format. See text for format details.
##  @warning
##  Binary files written on one system may not be readable on other systems.
##

## !!!Ignored construct:  # vtkPolyDataWriter_h [NewLine] # vtkPolyDataWriter_h [NewLine] # vtkDataWriter.h [NewLine] # vtkIOLegacyModule.h  For export macro [NewLine] class vtkPolyData ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIOLEGACY_EXPORT vtkPolyDataWriter : public vtkDataWriter { public : static vtkPolyDataWriter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataWriter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataWriter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPolyDataWriter :: IsTypeOf ( type ) ; } static vtkPolyDataWriter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPolyDataWriter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPolyDataWriter * NewInstance ( ) const { return vtkPolyDataWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPolyDataWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPolyDataWriter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get the input to this writer.
##  vtkPolyData * GetInput ( ) ; vtkPolyData * GetInput ( int port ) ; /@} protected : vtkPolyDataWriter ( ) = default ; ~ vtkPolyDataWriter ( ) override = default ; void WriteData ( ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; private : vtkPolyDataWriter ( const vtkPolyDataWriter & ) = delete ; void operator = ( const vtkPolyDataWriter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
