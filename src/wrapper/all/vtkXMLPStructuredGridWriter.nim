## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLPStructuredGridWriter.h
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
##  @class   vtkXMLPStructuredGridWriter
##  @brief   Write PVTK XML StructuredGrid files.
##
##  vtkXMLPStructuredGridWriter writes the PVTK XML StructuredGrid
##  file format.  One structured grid input can be written into a
##  parallel file format with any number of pieces spread across files.
##  The standard extension for this writer's file format is "pvts".
##  This writer uses vtkXMLStructuredGridWriter to write the individual
##  piece files.
##
##  @sa
##  vtkXMLStructuredGridWriter
##

## !!!Ignored construct:  # vtkXMLPStructuredGridWriter_h [NewLine] # vtkXMLPStructuredGridWriter_h [NewLine] # vtkIOParallelXMLModule.h  For export macro # vtkXMLPStructuredDataWriter.h [NewLine] class vtkStructuredGrid ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIOPARALLELXML_EXPORT vtkXMLPStructuredGridWriter : public vtkXMLPStructuredDataWriter { public : static vtkXMLPStructuredGridWriter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkXMLPStructuredDataWriter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkXMLPStructuredDataWriter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkXMLPStructuredGridWriter :: IsTypeOf ( type ) ; } static vtkXMLPStructuredGridWriter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkXMLPStructuredGridWriter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkXMLPStructuredGridWriter * NewInstance ( ) const { return vtkXMLPStructuredGridWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLPStructuredDataWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLPStructuredGridWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLPStructuredGridWriter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Get/Set the writer's input.
##  vtkStructuredGrid * GetInput ( ) ; *
##  Get the default file extension for files written by this writer.
##  const char * GetDefaultFileExtension ( ) override ; protected : vtkXMLPStructuredGridWriter ( ) ; ~ vtkXMLPStructuredGridWriter ( ) override ;  see algorithm for more info int FillInputPortInformation ( int port , vtkInformation * info ) override ; const char * GetDataSetName ( ) override ; vtkXMLStructuredDataWriter * CreateStructuredPieceWriter ( ) override ; void WritePData ( vtkIndent indent ) override ; private : vtkXMLPStructuredGridWriter ( const vtkXMLPStructuredGridWriter & ) = delete ; void operator = ( const vtkXMLPStructuredGridWriter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
