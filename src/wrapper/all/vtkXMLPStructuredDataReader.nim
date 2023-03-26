## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLPStructuredDataReader.h
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
##  @class   vtkXMLPStructuredDataReader
##  @brief   Superclass for parallel structured data XML readers.
##
##  vtkXMLPStructuredDataReader provides functionality common to all
##  parallel structured data format readers.
##
##  @sa
##  vtkXMLPImageDataReader vtkXMLPStructuredGridReader
##  vtkXMLPRectilinearGridReader
##

## !!!Ignored construct:  # vtkXMLPStructuredDataReader_h [NewLine] # vtkXMLPStructuredDataReader_h [NewLine] # vtkIOXMLModule.h  For export macro # vtkXMLPDataReader.h [NewLine] class vtkAbstractArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkExtentSplitter"
discard "forward decl of vtkXMLStructuredDataReader"
## !!!Ignored construct:  class VTKIOXML_EXPORT vtkXMLPStructuredDataReader : public vtkXMLPDataReader { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkXMLPDataReader Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkXMLPDataReader :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkXMLPStructuredDataReader :: IsTypeOf ( type ) ; } static vtkXMLPStructuredDataReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkXMLPStructuredDataReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkXMLPStructuredDataReader * NewInstance ( ) const { return vtkXMLPStructuredDataReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLPDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLPStructuredDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLPStructuredDataReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ;  For the specified port, copy the information this reader sets up in
##  SetupOutputInformation to outInfo void CopyOutputInformation ( vtkInformation * outInfo , int port ) override ; protected : vtkXMLPStructuredDataReader ( ) ; ~ vtkXMLPStructuredDataReader ( ) override ; vtkIdType GetNumberOfPoints ( ) override ; vtkIdType GetNumberOfCells ( ) override ; void CopyArrayForPoints ( vtkAbstractArray * inArray , vtkAbstractArray * outArray ) override ; void CopyArrayForCells ( vtkAbstractArray * inArray , vtkAbstractArray * outArray ) override ; virtual void SetOutputExtent ( int * extent ) = 0 ; virtual void GetPieceInputExtent ( int index , int * extent ) = 0 ;  Pipeline execute data driver.  Called by vtkXMLReader. void ReadXMLData ( ) override ; int ReadPrimaryElement ( vtkXMLDataElement * ePrimary ) override ; void SetupOutputData ( ) override ; void SetupPieces ( int numPieces ) override ; void DestroyPieces ( ) override ; int ReadPiece ( vtkXMLDataElement * ePiece ) override ; int ReadPieceData ( ) override ; void CopySubExtent ( int * inExtent , int * inDimensions , vtkIdType * inIncrements , int * outExtent , int * outDimensions , vtkIdType * outIncrements , int * subExtent , int * subDimensions , vtkAbstractArray * inArray , vtkAbstractArray * outArray ) ; int ComputePieceSubExtents ( ) ; vtkExtentSplitter * ExtentSplitter ;  The extent to be updated in the output. int UpdateExtent [ 6 ] ; int PointDimensions [ 3 ] ; vtkIdType PointIncrements [ 3 ] ; int CellDimensions [ 3 ] ; vtkIdType CellIncrements [ 3 ] ;  The extent currently being read from a piece. int SubExtent [ 6 ] ; int SubPointDimensions [ 3 ] ; int SubCellDimensions [ 3 ] ; int SubPieceExtent [ 6 ] ; int SubPiecePointDimensions [ 3 ] ; vtkIdType SubPiecePointIncrements [ 3 ] ; int SubPieceCellDimensions [ 3 ] ; vtkIdType SubPieceCellIncrements [ 3 ] ;  Information per-piece. int * PieceExtents ; int RequestInformation ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; private : vtkXMLPStructuredDataReader ( const vtkXMLPStructuredDataReader & ) = delete ; void operator = ( const vtkXMLPStructuredDataReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
