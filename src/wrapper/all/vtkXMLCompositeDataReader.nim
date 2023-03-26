## =========================================================================
##
##   Program:   ParaView
##   Module:    vtkXMLCompositeDataReader.h
##
##   Copyright (c) Kitware, Inc.
##   All rights reserved.
##   See Copyright.txt or http://www.paraview.org/HTML/Copyright.html for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkXMLCompositeDataReader
##  @brief   Reader for multi-group datasets
##
##  vtkXMLCompositeDataReader reads the VTK XML multi-group data file
##  format. XML multi-group data files are meta-files that point to a list
##  of serial VTK XML files. When reading in parallel, it will distribute
##  sub-blocks among processor. If the number of sub-blocks is less than
##  the number of processors, some processors will not have any sub-blocks
##  for that group. If the number of sub-blocks is larger than the
##  number of processors, each processor will possibly have more than
##  1 sub-block.
##

## !!!Ignored construct:  # vtkXMLCompositeDataReader_h [NewLine] # vtkXMLCompositeDataReader_h [NewLine] # vtkIOXMLModule.h  For export macro # vtkXMLReader.h [NewLine] class vtkCompositeDataSet ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkInformationIntegerKey"
discard "forward decl of vtkInformationIntegerVectorKey"
discard "forward decl of vtkXMLCompositeDataReaderInternals"
## !!!Ignored construct:  class VTKIOXML_EXPORT vtkXMLCompositeDataReader : public vtkXMLReader { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkXMLReader Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkXMLReader :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkXMLCompositeDataReader :: IsTypeOf ( type ) ; } static vtkXMLCompositeDataReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkXMLCompositeDataReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkXMLCompositeDataReader * NewInstance ( ) const { return vtkXMLCompositeDataReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLCompositeDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLCompositeDataReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; enum { Block , Interleave } ; *
##  Set the strategy for assigning files to parallel readers. The default is
##  @a Block.
##
##  Let @a X be the rank of a specific reader, and @a N be the number of
##  reader, then:
##  @arg @c Block Each processor is assigned a contiguous block of files,
##       [@a X * @a N, ( @a X + 1) * @a N ).
##  @arg @c Interleave The files are interleaved across readers,
##  @a i * @a N + @a X.
##  @{
##  virtual void SetPieceDistribution ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << PieceDistribution  to  << _arg ) ; if ( this -> PieceDistribution != ( _arg < Block ? Block : ( _arg > Interleave ? Interleave : _arg ) ) ) { this -> PieceDistribution = ( _arg < Block ? Block : ( _arg > Interleave ? Interleave : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetPieceDistributionMinValue ( ) { return Block ; } virtual int GetPieceDistributionMaxValue ( ) { return Interleave ; } ; virtual int GetPieceDistribution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PieceDistribution  of  << this -> PieceDistribution ) ; return this -> PieceDistribution ; } ; *@} /@{ *
##  Get the output data object for a port on this algorithm.
##  vtkCompositeDataSet * GetOutput ( ) ; vtkCompositeDataSet * GetOutput ( int ) ; /@} void SetFileName ( VTK_FILEPATH const char * ) override ; protected : vtkXMLCompositeDataReader ( ) ; ~ vtkXMLCompositeDataReader ( ) override ;  Get the name of the data set being read. const char * GetDataSetName ( ) override ;  Returns the primary element pass to ReadPrimaryElement(). vtkXMLDataElement * GetPrimaryElement ( ) ; void ReadXMLData ( ) override ; int ReadPrimaryElement ( vtkXMLDataElement * ePrimary ) override ;  Setup the output with no data available.  Used in error cases. void SetupEmptyOutput ( ) override ; int FillOutputPortInformation ( int , vtkInformation * info ) override ;  Create a default executive. vtkExecutive * CreateDefaultExecutive ( ) override ;  Find the path to this file in case the internal files are
##  specified as relative paths. std :: string GetFilePath ( ) ; std :: string GetFileNameFromXML ( vtkXMLDataElement * xmlElem , const std :: string & filePath ) ; vtkXMLReader * GetReaderOfType ( const char * type ) ; vtkXMLReader * GetReaderForFile ( const std :: string & filename ) ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; void SyncDataArraySelections ( vtkXMLReader * accum , vtkXMLDataElement * xmlElem , const std :: string & filePath ) ;  Adds a child data object to the composite parent. childXML is the XML for
##  the child data object need to obtain certain meta-data about the child. void AddChild ( vtkCompositeDataSet * parent , vtkDataObject * child , vtkXMLDataElement * childXML ) ;  Read the XML element for the subtree of a the composite dataset.
##  dataSetIndex is used to rank the leaf nodes in an inorder traversal. virtual void ReadComposite ( vtkXMLDataElement * element , vtkCompositeDataSet * composite , const char * filePath , unsigned int & dataSetIndex ) = 0 ;  Read the vtkDataSet (a leaf) in the composite dataset. virtual vtkDataSet * ReadDataset ( vtkXMLDataElement * xmlElem , const char * filePath ) ;  Read the vtkDataObject (a leaf) in the composite dataset. virtual vtkDataObject * ReadDataObject ( vtkXMLDataElement * xmlElem , const char * filePath ) ; *
##  Given the inorder index for a leaf node, this method tells if the current
##  process should read the dataset.
##
##  For a dataset that is part of a vtkParititionedDataSet or a
##  vtkMultiPieceDataset, valid `pieceIndex` and `numPieces` should be specified such that
##  `pieceIndex < numPieces`. When provided, this method can use the
##  `PieceDistribution` selection to distribute each vtkMultiPieceDataset and
##  vtkParititionedDataSet across ranks.
##
##  int ShouldReadDataSet ( unsigned int datasetIndex , unsigned int pieceIndex = 0 , unsigned int numPieces = 0 ) ; # __VTK_WRAP__ [NewLine] *
##  Convenience method to count all nested elements with the given tag name.
##  In addition, one can specify a list of tags to skip traversing into.
##  static unsigned int CountNestedElements ( vtkXMLDataElement * element , const std :: string & tagName , const std :: set < std :: string > & exclusions = std :: set < std :: string > ( ) ) ; # [NewLine] private : vtkXMLCompositeDataReader ( const vtkXMLCompositeDataReader & ) = delete ; void operator = ( const vtkXMLCompositeDataReader & ) = delete ; /@{ *
##  Given the number of datasets (@a numDatasets) and number of pieces (@a numPieces),
##  return the piece number of a dataset at the chosen index (@a datasetIndex)
##  based on the assignment strategy.
##  static int GetPieceAssignmentForBlockStrategy ( unsigned int datasetIndex , unsigned int numDatasets , int numPieces ) ; static int GetPieceAssignmentForInterleaveStrategy ( unsigned int datasetIndex , unsigned int numDatasets , int numPieces ) ; /@} int PieceDistribution ; vtkXMLCompositeDataReaderInternals * Internal ; } ;
## Error: token expected: ; but got: [identifier]!!!
