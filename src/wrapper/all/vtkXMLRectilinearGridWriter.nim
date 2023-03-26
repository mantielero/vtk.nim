## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLRectilinearGridWriter.h
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
##  @class   vtkXMLRectilinearGridWriter
##  @brief   Write VTK XML RectilinearGrid files.
##
##  vtkXMLRectilinearGridWriter writes the VTK XML RectilinearGrid
##  file format.  One rectilinear grid input can be written into one
##  file in any number of streamed pieces.  The standard extension for
##  this writer's file format is "vtr".  This writer is also used to
##  write a single piece of the parallel file format.
##
##  @sa
##  vtkXMLPRectilinearGridWriter
##

## !!!Ignored construct:  # vtkXMLRectilinearGridWriter_h [NewLine] # vtkXMLRectilinearGridWriter_h [NewLine] # vtkIOXMLModule.h  For export macro # vtkXMLStructuredDataWriter.h [NewLine] class vtkRectilinearGrid ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIOXML_EXPORT vtkXMLRectilinearGridWriter : public vtkXMLStructuredDataWriter { public : static vtkXMLRectilinearGridWriter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkXMLStructuredDataWriter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkXMLStructuredDataWriter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkXMLRectilinearGridWriter :: IsTypeOf ( type ) ; } static vtkXMLRectilinearGridWriter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkXMLRectilinearGridWriter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkXMLRectilinearGridWriter * NewInstance ( ) const { return vtkXMLRectilinearGridWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLStructuredDataWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLRectilinearGridWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLRectilinearGridWriter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Get/Set the writer's input.
##  vtkRectilinearGrid * GetInput ( ) ; *
##  Get the default file extension for files written by this writer.
##  const char * GetDefaultFileExtension ( ) override ; protected : vtkXMLRectilinearGridWriter ( ) ; ~ vtkXMLRectilinearGridWriter ( ) override ;  see algorithm for more info int FillInputPortInformation ( int port , vtkInformation * info ) override ; int WriteAppendedMode ( vtkIndent indent ) ; void WriteAppendedPiece ( int index , vtkIndent indent ) override ; void WriteAppendedPieceData ( int index ) override ; void WriteInlinePiece ( vtkIndent indent ) override ; void GetInputExtent ( int * extent ) override ; const char * GetDataSetName ( ) override ; void CalculateSuperclassFraction ( float * fractions ) ;  Coordinate array appended data positions. OffsetsManagerArray * CoordinateOM ; void AllocatePositionArrays ( ) override ; void DeletePositionArrays ( ) override ; private : vtkXMLRectilinearGridWriter ( const vtkXMLRectilinearGridWriter & ) = delete ; void operator = ( const vtkXMLRectilinearGridWriter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
