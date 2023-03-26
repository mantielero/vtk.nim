## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLTableWriter.h
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
##  @class   vtkXMLTableWriter
##  @brief   Write VTK XML Table files.
##
##  vtkXMLTableWriter provides a functionality for writing vtTable as
##  XML .vtt files.
##

## !!!Ignored construct:  # vtkXMLTableWriter_h [NewLine] # vtkXMLTableWriter_h [NewLine] # vtkIOXMLModule.h  For export macro # vtkXMLWriter.h [NewLine] class vtkTable ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIOXML_EXPORT vtkXMLTableWriter : public vtkXMLWriter { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkXMLWriter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkXMLWriter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkXMLTableWriter :: IsTypeOf ( type ) ; } static vtkXMLTableWriter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkXMLTableWriter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkXMLTableWriter * NewInstance ( ) const { return vtkXMLTableWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLTableWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLTableWriter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkXMLTableWriter * New ( ) ; /@{ *
##  Get/Set the number of pieces used to stream the table through the
##  pipeline while writing to the file.
##  virtual void SetNumberOfPieces ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NumberOfPieces  to  << _arg ) ; if ( this -> NumberOfPieces != _arg ) { this -> NumberOfPieces = _arg ; this -> Modified ( ) ; } } ; virtual int GetNumberOfPieces ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfPieces  of  << this -> NumberOfPieces ) ; return this -> NumberOfPieces ; } ; /@} /@{ *
##  Get/Set the piece to write to the file.  If this is
##  negative or equal to the NumberOfPieces, all pieces will be written.
##  virtual void SetNumberOfPiecesWritePiece ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  WritePiece  to  << _arg ) ; if ( this -> WritePiece != _arg ) { this -> WritePiece = _arg ; this -> Modified ( ) ; } } ; virtual int GetNumberOfPiecesWritePiece ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WritePiece  of  << this -> WritePiece ) ; return this -> WritePiece ; } ; /@} *
##  See the vtkAlgorithm for a description of what these do
##  vtkTypeBool ProcessRequest ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; protected : vtkXMLTableWriter ( ) ; ~ vtkXMLTableWriter ( ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; vtkTable * GetInputAsTable ( ) ; const char * GetDataSetName ( ) override ;  vtkTable isn't a DataSet but it's used by vtkXMLWriter *
##  Get the default file extension for files written by this writer.
##  const char * GetDefaultFileExtension ( ) override ; void SetInputUpdateExtent ( int piece , int numPieces ) ; int WriteHeader ( ) ; int WriteAPiece ( ) ; int WriteFooter ( ) ; void AllocatePositionArrays ( ) ; void DeletePositionArrays ( ) ; int WriteInlineMode ( vtkIndent indent ) ; void WriteInlinePieceAttributes ( ) ; void WriteInlinePiece ( vtkIndent indent ) ; void WriteAppendedPieceAttributes ( int index ) ; void WriteAppendedPiece ( int index , vtkIndent indent ) ; void WriteAppendedPieceData ( int index ) ; void WriteRowDataAppended ( vtkDataSetAttributes * ds , vtkIndent indent , OffsetsManagerGroup * dsManager ) ; void WriteRowDataAppendedData ( vtkDataSetAttributes * ds , int timestep , OffsetsManagerGroup * pdManager ) ; void WriteRowDataInline ( vtkDataSetAttributes * ds , vtkIndent indent ) ; *
##  Number of pieces used for streaming.
##  int NumberOfPieces ; *
##  Which piece to write, if not all.
##  int WritePiece ; *
##  Positions of attributes for each piece.
##  vtkTypeInt64 * NumberOfColsPositions ; vtkTypeInt64 * NumberOfRowsPositions ; *
##  For TimeStep support
##  OffsetsManagerArray * RowsOM ; int CurrentPiece ; private : vtkXMLTableWriter ( const vtkXMLTableWriter & ) = delete ; void operator = ( const vtkXMLTableWriter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
