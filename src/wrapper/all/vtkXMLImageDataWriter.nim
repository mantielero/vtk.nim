## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLImageDataWriter.h
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
##  @class   vtkXMLImageDataWriter
##  @brief   Write VTK XML ImageData files.
##
##  vtkXMLImageDataWriter writes the VTK XML ImageData file format.
##  One image data input can be written into one file in any number of
##  streamed pieces.  The standard extension for this writer's file
##  format is "vti".  This writer is also used to write a single piece
##  of the parallel file format.
##
##  @sa
##  vtkXMLPImageDataWriter
##

## !!!Ignored construct:  # vtkXMLImageDataWriter_h [NewLine] # vtkXMLImageDataWriter_h [NewLine] # vtkIOXMLModule.h  For export macro # vtkXMLStructuredDataWriter.h [NewLine] class vtkImageData ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIOXML_EXPORT vtkXMLImageDataWriter : public vtkXMLStructuredDataWriter { public : static vtkXMLImageDataWriter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkXMLStructuredDataWriter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkXMLStructuredDataWriter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkXMLImageDataWriter :: IsTypeOf ( type ) ; } static vtkXMLImageDataWriter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkXMLImageDataWriter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkXMLImageDataWriter * NewInstance ( ) const { return vtkXMLImageDataWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLStructuredDataWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLImageDataWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLImageDataWriter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Get/Set the writer's input.
##  vtkImageData * GetInput ( ) ; *
##  Get the default file extension for files written by this writer.
##  const char * GetDefaultFileExtension ( ) override ; protected : vtkXMLImageDataWriter ( ) ; ~ vtkXMLImageDataWriter ( ) override ;  see algorithm for more info int FillInputPortInformation ( int port , vtkInformation * info ) override ; void WritePrimaryElementAttributes ( ostream & os , vtkIndent indent ) override ; void GetInputExtent ( int * extent ) override ; const char * GetDataSetName ( ) override ; private : vtkXMLImageDataWriter ( const vtkXMLImageDataWriter & ) = delete ; void operator = ( const vtkXMLImageDataWriter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
