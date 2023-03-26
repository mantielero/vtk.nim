## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLStructuredGridReader.h
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
##  @class   vtkXMLStructuredGridReader
##  @brief   Read VTK XML StructuredGrid files.
##
##  vtkXMLStructuredGridReader reads the VTK XML StructuredGrid file
##  format.  One structured grid file can be read to produce one
##  output.  Streaming is supported.  The standard extension for this
##  reader's file format is "vts".  This reader is also used to read a
##  single piece of the parallel file format.
##
##  @sa
##  vtkXMLPStructuredGridReader
##

## !!!Ignored construct:  # vtkXMLStructuredGridReader_h [NewLine] # vtkXMLStructuredGridReader_h [NewLine] # vtkIOXMLModule.h  For export macro # vtkXMLStructuredDataReader.h [NewLine] class vtkStructuredGrid ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIOXML_EXPORT vtkXMLStructuredGridReader : public vtkXMLStructuredDataReader { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkXMLStructuredDataReader Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkXMLStructuredDataReader :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkXMLStructuredGridReader :: IsTypeOf ( type ) ; } static vtkXMLStructuredGridReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkXMLStructuredGridReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkXMLStructuredGridReader * NewInstance ( ) const { return vtkXMLStructuredGridReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLStructuredDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLStructuredGridReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLStructuredGridReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkXMLStructuredGridReader * New ( ) ; /@{ *
##  Get the reader's output.
##  vtkStructuredGrid * GetOutput ( ) ; vtkStructuredGrid * GetOutput ( int idx ) ; /@} protected : vtkXMLStructuredGridReader ( ) ; ~ vtkXMLStructuredGridReader ( ) override ; const char * GetDataSetName ( ) override ; void SetOutputExtent ( int * extent ) override ; void SetupPieces ( int numPieces ) override ; void DestroyPieces ( ) override ; void SetupOutputData ( ) override ; int ReadPiece ( vtkXMLDataElement * ePiece ) override ; int ReadPieceData ( ) override ; int FillOutputPortInformation ( int , vtkInformation * ) override ;  The elements representing the points for each piece. vtkXMLDataElement * * PointElements ; private : vtkXMLStructuredGridReader ( const vtkXMLStructuredGridReader & ) = delete ; void operator = ( const vtkXMLStructuredGridReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
