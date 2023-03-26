## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLRectilinearGridReader.h
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
##  @class   vtkXMLRectilinearGridReader
##  @brief   Read VTK XML RectilinearGrid files.
##
##  vtkXMLRectilinearGridReader reads the VTK XML RectilinearGrid file
##  format.  One rectilinear grid file can be read to produce one
##  output.  Streaming is supported.  The standard extension for this
##  reader's file format is "vtr".  This reader is also used to read a
##  single piece of the parallel file format.
##
##  @sa
##  vtkXMLPRectilinearGridReader
##

## !!!Ignored construct:  # vtkXMLRectilinearGridReader_h [NewLine] # vtkXMLRectilinearGridReader_h [NewLine] # vtkIOXMLModule.h  For export macro # vtkXMLStructuredDataReader.h [NewLine] class vtkRectilinearGrid ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIOXML_EXPORT vtkXMLRectilinearGridReader : public vtkXMLStructuredDataReader { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkXMLStructuredDataReader Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkXMLStructuredDataReader :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkXMLRectilinearGridReader :: IsTypeOf ( type ) ; } static vtkXMLRectilinearGridReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkXMLRectilinearGridReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkXMLRectilinearGridReader * NewInstance ( ) const { return vtkXMLRectilinearGridReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLStructuredDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLRectilinearGridReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLRectilinearGridReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkXMLRectilinearGridReader * New ( ) ; /@{ *
##  Get the reader's output.
##  vtkRectilinearGrid * GetOutput ( ) ; vtkRectilinearGrid * GetOutput ( int idx ) ; /@} protected : vtkXMLRectilinearGridReader ( ) ; ~ vtkXMLRectilinearGridReader ( ) override ; const char * GetDataSetName ( ) override ; void SetOutputExtent ( int * extent ) override ; void SetupPieces ( int numPieces ) override ; void DestroyPieces ( ) override ; void SetupOutputData ( ) override ; int ReadPiece ( vtkXMLDataElement * ePiece ) override ; int ReadPieceData ( ) override ; int ReadSubCoordinates ( int * inBounds , int * outBounds , int * subBounds , vtkXMLDataElement * da , vtkDataArray * array ) ; int FillOutputPortInformation ( int , vtkInformation * ) override ;  The elements representing the coordinate arrays for each piece. vtkXMLDataElement * * CoordinateElements ; private : vtkXMLRectilinearGridReader ( const vtkXMLRectilinearGridReader & ) = delete ; void operator = ( const vtkXMLRectilinearGridReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
