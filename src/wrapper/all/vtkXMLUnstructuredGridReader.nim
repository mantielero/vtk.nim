## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLUnstructuredGridReader.h
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
##  @class   vtkXMLUnstructuredGridReader
##  @brief   Read VTK XML UnstructuredGrid files.
##
##  vtkXMLUnstructuredGridReader reads the VTK XML UnstructuredGrid
##  file format.  One unstructured grid file can be read to produce one
##  output.  Streaming is supported.  The standard extension for this
##  reader's file format is "vtu".  This reader is also used to read a
##  single piece of the parallel file format.
##
##  @sa
##  vtkXMLPUnstructuredGridReader
##

## !!!Ignored construct:  # vtkXMLUnstructuredGridReader_h [NewLine] # vtkXMLUnstructuredGridReader_h [NewLine] # vtkIOXMLModule.h  For export macro # vtkXMLUnstructuredDataReader.h [NewLine] class vtkUnstructuredGrid ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkIdTypeArray"
## !!!Ignored construct:  class VTKIOXML_EXPORT vtkXMLUnstructuredGridReader : public vtkXMLUnstructuredDataReader { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkXMLUnstructuredDataReader Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkXMLUnstructuredDataReader :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkXMLUnstructuredGridReader :: IsTypeOf ( type ) ; } static vtkXMLUnstructuredGridReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkXMLUnstructuredGridReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkXMLUnstructuredGridReader * NewInstance ( ) const { return vtkXMLUnstructuredGridReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLUnstructuredDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLUnstructuredGridReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLUnstructuredGridReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkXMLUnstructuredGridReader * New ( ) ; /@{ *
##  Get the reader's output.
##  vtkUnstructuredGrid * GetOutput ( ) ; vtkUnstructuredGrid * GetOutput ( int idx ) ; /@} protected : vtkXMLUnstructuredGridReader ( ) ; ~ vtkXMLUnstructuredGridReader ( ) override ; const char * GetDataSetName ( ) override ; void GetOutputUpdateExtent ( int & piece , int & numberOfPieces , int & ghostLevel ) override ; void SetupOutputTotals ( ) override ; void SetupPieces ( int numPieces ) override ; void DestroyPieces ( ) override ; void SetupOutputData ( ) override ; int ReadPiece ( vtkXMLDataElement * ePiece ) override ; void SetupNextPiece ( ) override ; int ReadPieceData ( ) override ;  Read a data array whose tuples correspond to cells. int ReadArrayForCells ( vtkXMLDataElement * da , vtkAbstractArray * outArray ) override ;  Get the number of cells in the given piece.  Valid after
##  UpdateInformation. vtkIdType GetNumberOfCellsInPiece ( int piece ) override ; int FillOutputPortInformation ( int , vtkInformation * ) override ;  The index of the cell in the output where the current piece
##  begins. vtkIdType StartCell ;  The Cells element for each piece. vtkXMLDataElement * * CellElements ; vtkIdType * NumberOfCells ; int CellsTimeStep ; unsigned long CellsOffset ; private : vtkXMLUnstructuredGridReader ( const vtkXMLUnstructuredGridReader & ) = delete ; void operator = ( const vtkXMLUnstructuredGridReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
