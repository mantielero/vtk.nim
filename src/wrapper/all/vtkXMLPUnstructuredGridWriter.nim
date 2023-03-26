## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLPUnstructuredGridWriter.h
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
##  @class   vtkXMLPUnstructuredGridWriter
##  @brief   Write PVTK XML UnstructuredGrid files.
##
##  vtkXMLPUnstructuredGridWriter writes the PVTK XML UnstructuredGrid
##  file format.  One unstructured grid input can be written into a
##  parallel file format with any number of pieces spread across files.
##  The standard extension for this writer's file format is "pvtu".
##  This writer uses vtkXMLUnstructuredGridWriter to write the
##  individual piece files.
##
##  @sa
##  vtkXMLUnstructuredGridWriter
##

## !!!Ignored construct:  # vtkXMLPUnstructuredGridWriter_h [NewLine] # vtkXMLPUnstructuredGridWriter_h [NewLine] # vtkIOParallelXMLModule.h  For export macro # vtkXMLPUnstructuredDataWriter.h [NewLine] class vtkUnstructuredGridBase ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIOPARALLELXML_EXPORT vtkXMLPUnstructuredGridWriter : public vtkXMLPUnstructuredDataWriter { public : static vtkXMLPUnstructuredGridWriter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkXMLPUnstructuredDataWriter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkXMLPUnstructuredDataWriter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkXMLPUnstructuredGridWriter :: IsTypeOf ( type ) ; } static vtkXMLPUnstructuredGridWriter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkXMLPUnstructuredGridWriter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkXMLPUnstructuredGridWriter * NewInstance ( ) const { return vtkXMLPUnstructuredGridWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLPUnstructuredDataWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLPUnstructuredGridWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLPUnstructuredGridWriter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Get/Set the writer's input.
##  vtkUnstructuredGridBase * GetInput ( ) ; *
##  Get the default file extension for files written by this writer.
##  const char * GetDefaultFileExtension ( ) override ; protected : vtkXMLPUnstructuredGridWriter ( ) ; ~ vtkXMLPUnstructuredGridWriter ( ) override ;  see algorithm for more info int FillInputPortInformation ( int port , vtkInformation * info ) override ; const char * GetDataSetName ( ) override ; vtkXMLUnstructuredDataWriter * CreateUnstructuredPieceWriter ( ) override ; private : vtkXMLPUnstructuredGridWriter ( const vtkXMLPUnstructuredGridWriter & ) = delete ; void operator = ( const vtkXMLPUnstructuredGridWriter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
