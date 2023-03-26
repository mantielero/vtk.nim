## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLStructuredGridWriter.h
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
##  @class   vtkXMLStructuredGridWriter
##  @brief   Write VTK XML StructuredGrid files.
##
##  vtkXMLStructuredGridWriter writes the VTK XML StructuredGrid file
##  format.  One structured grid input can be written into one file in
##  any number of streamed pieces.  The standard extension for this
##  writer's file format is "vts".  This writer is also used to write a
##  single piece of the parallel file format.
##
##  @sa
##  vtkXMLPStructuredGridWriter
##

## !!!Ignored construct:  # vtkXMLStructuredGridWriter_h [NewLine] # vtkXMLStructuredGridWriter_h [NewLine] # vtkIOXMLModule.h  For export macro # vtkXMLStructuredDataWriter.h [NewLine] class vtkStructuredGrid ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIOXML_EXPORT vtkXMLStructuredGridWriter : public vtkXMLStructuredDataWriter { public : static vtkXMLStructuredGridWriter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkXMLStructuredDataWriter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkXMLStructuredDataWriter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkXMLStructuredGridWriter :: IsTypeOf ( type ) ; } static vtkXMLStructuredGridWriter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkXMLStructuredGridWriter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkXMLStructuredGridWriter * NewInstance ( ) const { return vtkXMLStructuredGridWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLStructuredDataWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLStructuredGridWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLStructuredGridWriter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Get/Set the writer's input.
##  vtkStructuredGrid * GetInput ( ) ; *
##  Get the default file extension for files written by this writer.
##  const char * GetDefaultFileExtension ( ) override ; protected : vtkXMLStructuredGridWriter ( ) ; ~ vtkXMLStructuredGridWriter ( ) override ;  see algorithm for more info int FillInputPortInformation ( int port , vtkInformation * info ) override ; void WriteAppendedPiece ( int index , vtkIndent indent ) override ; void WriteAppendedPieceData ( int index ) override ; void WriteInlinePiece ( vtkIndent indent ) override ; void GetInputExtent ( int * extent ) override ; const char * GetDataSetName ( ) override ; void CalculateSuperclassFraction ( float * fractions ) ;  The position of the appended data offset attribute for the points
##  array. OffsetsManagerGroup * PointsOM ;  one per piece void AllocatePositionArrays ( ) override ; void DeletePositionArrays ( ) override ; private : vtkXMLStructuredGridWriter ( const vtkXMLStructuredGridWriter & ) = delete ; void operator = ( const vtkXMLStructuredGridWriter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
