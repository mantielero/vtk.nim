## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLPImageDataWriter.h
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
##  @class   vtkXMLPImageDataWriter
##  @brief   Write PVTK XML ImageData files.
##
##  vtkXMLPImageDataWriter writes the PVTK XML ImageData file format.
##  One image data input can be written into a parallel file format
##  with any number of pieces spread across files.  The standard
##  extension for this writer's file format is "pvti".  This writer
##  uses vtkXMLImageDataWriter to write the individual piece files.
##
##  @sa
##  vtkXMLImageDataWriter
##

## !!!Ignored construct:  # vtkXMLPImageDataWriter_h [NewLine] # vtkXMLPImageDataWriter_h [NewLine] # vtkIOParallelXMLModule.h  For export macro # vtkXMLPStructuredDataWriter.h [NewLine] class vtkImageData ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIOPARALLELXML_EXPORT vtkXMLPImageDataWriter : public vtkXMLPStructuredDataWriter { public : static vtkXMLPImageDataWriter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkXMLPStructuredDataWriter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkXMLPStructuredDataWriter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkXMLPImageDataWriter :: IsTypeOf ( type ) ; } static vtkXMLPImageDataWriter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkXMLPImageDataWriter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkXMLPImageDataWriter * NewInstance ( ) const { return vtkXMLPImageDataWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLPStructuredDataWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLPImageDataWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLPImageDataWriter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Get/Set the writer's input.
##  vtkImageData * GetInput ( ) ; *
##  Get the default file extension for files written by this writer.
##  const char * GetDefaultFileExtension ( ) override ; protected : vtkXMLPImageDataWriter ( ) ; ~ vtkXMLPImageDataWriter ( ) override ; const char * GetDataSetName ( ) override ; void WritePrimaryElementAttributes ( ostream & os , vtkIndent indent ) override ; vtkXMLStructuredDataWriter * CreateStructuredPieceWriter ( ) override ;  see algorithm for more info int FillInputPortInformation ( int port , vtkInformation * info ) override ; private : vtkXMLPImageDataWriter ( const vtkXMLPImageDataWriter & ) = delete ; void operator = ( const vtkXMLPImageDataWriter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
