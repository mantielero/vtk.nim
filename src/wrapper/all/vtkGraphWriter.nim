## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGraphWriter.h
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
##  @class   vtkGraphWriter
##  @brief   write vtkGraph data to a file
##
##  vtkGraphWriter is a sink object that writes ASCII or binary
##  vtkGraph data files in vtk format. See text for format details.
##  @warning
##  Binary files written on one system may not be readable on other systems.
##

## !!!Ignored construct:  # vtkGraphWriter_h [NewLine] # vtkGraphWriter_h [NewLine] # vtkDataWriter.h [NewLine] # vtkIOLegacyModule.h  For export macro [NewLine] class vtkGraph ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkMolecule"
## !!!Ignored construct:  class VTKIOLEGACY_EXPORT vtkGraphWriter : public vtkDataWriter { public : static vtkGraphWriter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataWriter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataWriter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkGraphWriter :: IsTypeOf ( type ) ; } static vtkGraphWriter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkGraphWriter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkGraphWriter * NewInstance ( ) const { return vtkGraphWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGraphWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGraphWriter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get the input to this writer.
##  vtkGraph * GetInput ( ) ; vtkGraph * GetInput ( int port ) ; /@} protected : vtkGraphWriter ( ) = default ; ~ vtkGraphWriter ( ) override = default ; void WriteData ( ) override ; void WriteMoleculeData ( ostream * fp , vtkMolecule * m ) ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; private : vtkGraphWriter ( const vtkGraphWriter & ) = delete ; void operator = ( const vtkGraphWriter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
