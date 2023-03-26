## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLStructuredDataReader.h
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
##  @class   vtkXMLStructuredDataReader
##  @brief   Superclass for structured data XML readers.
##
##  vtkXMLStructuredDataReader provides functionality common to all
##  structured data format readers.
##
##  @sa
##  vtkXMLImageDataReader vtkXMLStructuredGridReader
##  vtkXMLRectilinearGridReader
##

## !!!Ignored construct:  # vtkXMLStructuredDataReader_h [NewLine] # vtkXMLStructuredDataReader_h [NewLine] # vtkIOXMLModule.h  For export macro # vtkXMLDataReader.h [NewLine] class VTKIOXML_EXPORT vtkXMLStructuredDataReader : public vtkXMLDataReader { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkXMLDataReader Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkXMLDataReader :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkXMLStructuredDataReader :: IsTypeOf ( type ) ; } static vtkXMLStructuredDataReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkXMLStructuredDataReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkXMLStructuredDataReader * NewInstance ( ) const { return vtkXMLStructuredDataReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLStructuredDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLStructuredDataReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Get the number of points in the output.
##  vtkIdType GetNumberOfPoints ( ) override ; *
##  Get the number of cells in the output.
##  vtkIdType GetNumberOfCells ( ) override ; /@{ *
##  Get/Set whether the reader gets a whole slice from disk when only
##  a rectangle inside it is needed.  This mode reads more data than
##  necessary, but prevents many short reads from interacting poorly
##  with the compression and encoding schemes.
##  virtual void SetWholeSlices ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  WholeSlices  to  << _arg ) ; if ( this -> WholeSlices != _arg ) { this -> WholeSlices = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetWholeSlices ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WholeSlices  of  << this -> WholeSlices ) ; return this -> WholeSlices ; } ; virtual void WholeSlicesOn ( ) { this -> SetWholeSlices ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void WholeSlicesOff ( ) { this -> SetWholeSlices ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} *
##  For the specified port, copy the information this reader sets up in
##  SetupOutputInformation to outInfo
##  void CopyOutputInformation ( vtkInformation * outInfo , int port ) override ; protected : vtkXMLStructuredDataReader ( ) ; ~ vtkXMLStructuredDataReader ( ) override ; virtual void SetOutputExtent ( int * extent ) = 0 ; int ReadPrimaryElement ( vtkXMLDataElement * ePrimary ) override ;  Pipeline execute data driver.  Called by vtkXMLReader. void ReadXMLData ( ) override ; void SetupOutputInformation ( vtkInformation * outInfo ) override ;  Internal representation of pieces in the file that may have come
##  from a streamed write. int * PieceExtents ; int * PiecePointDimensions ; vtkIdType * PiecePointIncrements ; int * PieceCellDimensions ; vtkIdType * PieceCellIncrements ;  Whether to read in whole slices mode. vtkTypeBool WholeSlices ;  The update extent and corresponding increments and dimensions. int UpdateExtent [ 6 ] ; int PointDimensions [ 3 ] ; int CellDimensions [ 3 ] ; vtkIdType PointIncrements [ 3 ] ; vtkIdType CellIncrements [ 3 ] ; int WholeExtent [ 6 ] ;  The extent currently being read. int SubExtent [ 6 ] ; int SubPointDimensions [ 3 ] ; int SubCellDimensions [ 3 ] ;  Override methods from superclass. void SetupEmptyOutput ( ) override ; void SetupPieces ( int numPieces ) override ; void DestroyPieces ( ) override ; int ReadArrayForPoints ( vtkXMLDataElement * da , vtkAbstractArray * outArray ) override ; int ReadArrayForCells ( vtkXMLDataElement * da , vtkAbstractArray * outArray ) override ;  Internal utility methods. int ReadPiece ( vtkXMLDataElement * ePiece ) override ; virtual int ReadSubExtent ( int * inExtent , int * inDimensions , vtkIdType * inIncrements , int * outExtent , int * outDimensions , vtkIdType * outIncrements , int * subExtent , int * subDimensions , vtkXMLDataElement * da , vtkAbstractArray * array , FieldType type ) ; private : vtkXMLStructuredDataReader ( const vtkXMLStructuredDataReader & ) = delete ; void operator = ( const vtkXMLStructuredDataReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
