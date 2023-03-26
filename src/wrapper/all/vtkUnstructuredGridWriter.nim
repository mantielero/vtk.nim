## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkUnstructuredGridWriter.h
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
##  @class   vtkUnstructuredGridWriter
##  @brief   write vtk unstructured grid data file
##
##  vtkUnstructuredGridWriter is a source object that writes ASCII or binary
##  unstructured grid data files in vtk format. See text for format details.
##  @warning
##  Binary files written on one system may not be readable on other systems.
##

## !!!Ignored construct:  # vtkUnstructuredGridWriter_h [NewLine] # vtkUnstructuredGridWriter_h [NewLine] # vtkDataWriter.h [NewLine] # vtkIOLegacyModule.h  For export macro class vtkUnstructuredGridBase ;
## Error: did not expect [NewLine]!!!

## !!!Ignored construct:  [NewLine] class vtkUnstructuredGridWriter : public vtkDataWriter { public : static vtkUnstructuredGridWriter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataWriter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataWriter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkUnstructuredGridWriter :: IsTypeOf ( type ) ; } static vtkUnstructuredGridWriter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkUnstructuredGridWriter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkUnstructuredGridWriter * NewInstance ( ) const { return vtkUnstructuredGridWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkUnstructuredGridWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkUnstructuredGridWriter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get the input to this writer.
##  vtkUnstructuredGridBase * GetInput ( ) ; vtkUnstructuredGridBase * GetInput ( int port ) ; /@} protected : vtkUnstructuredGridWriter ( ) = default ; ~ vtkUnstructuredGridWriter ( ) override = default ; void WriteData ( ) override ; int WriteCellsAndFaces ( ostream * fp , vtkUnstructuredGridBase * grid , const char * label ) ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; private : vtkUnstructuredGridWriter ( const vtkUnstructuredGridWriter & ) = delete ; void operator = ( const vtkUnstructuredGridWriter & ) = delete ; } ;
## Error: did not expect [NewLine]!!!
