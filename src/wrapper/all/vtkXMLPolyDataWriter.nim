## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLPolyDataWriter.h
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
##  @class   vtkXMLPolyDataWriter
##  @brief   Write VTK XML PolyData files.
##
##  vtkXMLPolyDataWriter writes the VTK XML PolyData file format.  One
##  polygonal data input can be written into one file in any number of
##  streamed pieces (if supported by the rest of the pipeline).  The
##  standard extension for this writer's file format is "vtp".  This
##  writer is also used to write a single piece of the parallel file
##  format.
##
##  @sa
##  vtkXMLPPolyDataWriter
##

## !!!Ignored construct:  # vtkXMLPolyDataWriter_h [NewLine] # vtkXMLPolyDataWriter_h [NewLine] # vtkIOXMLModule.h  For export macro # vtkXMLUnstructuredDataWriter.h [NewLine] class vtkPolyData ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIOXML_EXPORT vtkXMLPolyDataWriter : public vtkXMLUnstructuredDataWriter { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkXMLUnstructuredDataWriter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkXMLUnstructuredDataWriter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkXMLPolyDataWriter :: IsTypeOf ( type ) ; } static vtkXMLPolyDataWriter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkXMLPolyDataWriter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkXMLPolyDataWriter * NewInstance ( ) const { return vtkXMLPolyDataWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLUnstructuredDataWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLPolyDataWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLPolyDataWriter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkXMLPolyDataWriter * New ( ) ; *
##  Get/Set the writer's input.
##  vtkPolyData * GetInput ( ) ; *
##  Get the default file extension for files written by this writer.
##  const char * GetDefaultFileExtension ( ) override ; protected : vtkXMLPolyDataWriter ( ) ; ~ vtkXMLPolyDataWriter ( ) override ;  see algorithm for more info int FillInputPortInformation ( int port , vtkInformation * info ) override ; const char * GetDataSetName ( ) override ; void AllocatePositionArrays ( ) override ; void DeletePositionArrays ( ) override ; void WriteInlinePieceAttributes ( ) override ; void WriteInlinePiece ( vtkIndent indent ) override ; void WriteAppendedPieceAttributes ( int index ) override ; void WriteAppendedPiece ( int index , vtkIndent indent ) override ; void WriteAppendedPieceData ( int index ) override ; vtkIdType GetNumberOfInputCells ( ) override ; void CalculateSuperclassFraction ( float * fractions ) ;  Positions of attributes for each piece. unsigned long * NumberOfVertsPositions ; unsigned long * NumberOfLinesPositions ; unsigned long * NumberOfStripsPositions ; unsigned long * NumberOfPolysPositions ; OffsetsManagerArray * VertsOM ; OffsetsManagerArray * LinesOM ; OffsetsManagerArray * StripsOM ; OffsetsManagerArray * PolysOM ; private : vtkXMLPolyDataWriter ( const vtkXMLPolyDataWriter & ) = delete ; void operator = ( const vtkXMLPolyDataWriter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
