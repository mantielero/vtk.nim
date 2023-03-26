## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTableWriter.h
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
##  @class   vtkTableWriter
##  @brief   write vtkTable to a file
##
##  vtkTableWriter is a sink object that writes ASCII or binary
##  vtkTable data files in vtk format. See text for format details.
##  @warning
##  Binary files written on one system may not be readable on other systems.
##

## !!!Ignored construct:  # vtkTableWriter_h [NewLine] # vtkTableWriter_h [NewLine] # vtkDataWriter.h [NewLine] # vtkIOLegacyModule.h  For export macro class vtkTable ;
## Error: did not expect [NewLine]!!!

## !!!Ignored construct:  [NewLine] class VTKIOLEGACY_EXPORT vtkTableWriter : public vtkDataWriter { public : static vtkTableWriter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataWriter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataWriter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkTableWriter :: IsTypeOf ( type ) ; } static vtkTableWriter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkTableWriter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkTableWriter * NewInstance ( ) const { return vtkTableWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTableWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTableWriter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get the input to this writer.
##  vtkTable * GetInput ( ) ; vtkTable * GetInput ( int port ) ; /@} protected : vtkTableWriter ( ) = default ; ~ vtkTableWriter ( ) override = default ; void WriteData ( ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; private : vtkTableWriter ( const vtkTableWriter & ) = delete ; void operator = ( const vtkTableWriter & ) = delete ; } ;
## Error: did not expect [NewLine]!!!
