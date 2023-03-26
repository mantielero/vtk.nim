## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLPDataReader.h
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
##  @class   vtkXMLPDataReader
##  @brief   Superclass for PVTK XML file readers that read vtkDataSets.
##
##  vtkXMLPDataReader provides functionality common to all PVTK XML
##  file readers that read vtkDataSets. Concrete subclasses call upon
##  this functionality when needed.
##
##  @sa
##  vtkXMLDataReader
##

## !!!Ignored construct:  # vtkXMLPDataReader_h [NewLine] # vtkXMLPDataReader_h [NewLine] # vtkIOXMLModule.h  For export macro # vtkXMLPDataObjectReader.h [NewLine] class vtkAbstractArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDataSet"
discard "forward decl of vtkXMLDataReader"
## !!!Ignored construct:  class VTKIOXML_EXPORT vtkXMLPDataReader : public vtkXMLPDataObjectReader { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkXMLPDataObjectReader Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkXMLPDataObjectReader :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkXMLPDataReader :: IsTypeOf ( type ) ; } static vtkXMLPDataReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkXMLPDataReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkXMLPDataReader * NewInstance ( ) const { return vtkXMLPDataReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLPDataObjectReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLPDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLPDataReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  For the specified port, copy the information this reader sets up in
##  SetupOutputInformation to outInfo
##  void CopyOutputInformation ( vtkInformation * outInfo , int port ) override ; protected : vtkXMLPDataReader ( ) ; ~ vtkXMLPDataReader ( ) override ;  Re-use any superclass signatures that we don't override. using vtkXMLPDataObjectReader :: ReadPiece ; *
##  Delete all piece readers and related information
##  void DestroyPieces ( ) override ; virtual vtkIdType GetNumberOfPoints ( ) = 0 ; virtual vtkIdType GetNumberOfCells ( ) = 0 ; *
##  Get a given piece input as a dataset, return nullptr if there is none.
##  vtkDataSet * GetPieceInputAsDataSet ( int piece ) ; *
##  Initialize the output data
##  void SetupOutputData ( ) override ; *
##  Pipeline execute information driver.  Called by vtkXMLReader.
##  void SetupOutputInformation ( vtkInformation * outInfo ) override ; *
##  Setup the number of pieces to be read and allocate space accordingly
##  void SetupPieces ( int numPieces ) override ; *
##  Whether or not the current reader can read the current piece
##  int CanReadPiece ( int index ) override ; *
##  Create a reader according to the data to read. It needs to be overridden by subclass.
##  virtual vtkXMLDataReader * CreatePieceReader ( ) = 0 ; *
##  Setup the current piece reader
##  int ReadPiece ( vtkXMLDataElement * ePiece ) override ; *
##  Actually read the piece at the given index data
##  int ReadPieceData ( int index ) ; *
##  Actually read the current piece data
##  virtual int ReadPieceData ( ) ; *
##  Read the information relative to the dataset and allocate the needed structures according to it
##  int ReadPrimaryElement ( vtkXMLDataElement * ePrimary ) override ; virtual void CopyArrayForPoints ( vtkAbstractArray * inArray , vtkAbstractArray * outArray ) = 0 ; virtual void CopyArrayForCells ( vtkAbstractArray * inArray , vtkAbstractArray * outArray ) = 0 ; *
##  Callback registered with the PieceProgressObserver.
##  void PieceProgressCallback ( ) override ; *
##  The ghost level available on each input piece.
##  int GhostLevel ; *
##  Information per-piece.
##  vtkXMLDataReader * * PieceReaders ; *
##  The PPointData and PCellData element representations.
##  vtkXMLDataElement * PPointDataElement ; vtkXMLDataElement * PCellDataElement ; private : vtkXMLPDataReader ( const vtkXMLPDataReader & ) = delete ; void operator = ( const vtkXMLPDataReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
