## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAVSucdReader.h
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
##  @class   vtkAVSucdReader
##  @brief   reads a dataset in AVS "UCD" format
##
##  vtkAVSucdReader creates an unstructured grid dataset. It reads binary or
##  ASCII files stored in UCD format, with optional data stored at the nodes
##  or at the cells of the model. A cell-based fielddata stores the material
##  id. The class can automatically detect the endian-ness of the binary files.
##
##  @par Thanks:
##  Thanks to Guenole Harel and Emmanuel Colin (Supelec engineering school,
##  France) and Jean M. Favre (CSCS, Switzerland) who co-developed this class.
##  Thanks to Isabelle Surin (isabelle.surin at cea.fr, CEA-DAM, France) who
##  supervised the internship of the first two authors. Thanks to Daniel
##  Aguilera (daniel.aguilera at cea.fr, CEA-DAM, France) who contributed code
##  and advice. Please address all comments to Jean Favre (jfavre at cscs.ch)
##
##  @sa
##  vtkGAMBITReader
##

## !!!Ignored construct:  # vtkAVSucdReader_h [NewLine] # vtkAVSucdReader_h [NewLine] # vtkIOGeometryModule.h  For export macro # vtkUnstructuredGridAlgorithm.h [NewLine] class vtkIntArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkFloatArray"
discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkDataArraySelection"
## !!!Ignored construct:  class VTKIOGEOMETRY_EXPORT vtkAVSucdReader : public vtkUnstructuredGridAlgorithm { public : static vtkAVSucdReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkUnstructuredGridAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkUnstructuredGridAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkAVSucdReader :: IsTypeOf ( type ) ; } static vtkAVSucdReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkAVSucdReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkAVSucdReader * NewInstance ( ) const { return vtkAVSucdReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAVSucdReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAVSucdReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Specify file name of AVS UCD datafile to read
##  virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ; /@} /@{ *
##  Is the file to be read written in binary format (as opposed to ascii).
##  virtual void SetBinaryFile ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  BinaryFile  to  << _arg ) ; if ( this -> BinaryFile != _arg ) { this -> BinaryFile = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetBinaryFile ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BinaryFile  of  << this -> BinaryFile ) ; return this -> BinaryFile ; } ; virtual void BinaryFileOn ( ) { this -> SetBinaryFile ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void BinaryFileOff ( ) { this -> SetBinaryFile ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Get the total number of cells.
##  virtual int GetBinaryFileNumberOfCells ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfCells  of  << this -> NumberOfCells ) ; return this -> NumberOfCells ; } ; /@} /@{ *
##  Get the total number of nodes.
##  virtual int GetBinaryFileNumberOfCellsNumberOfNodes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfNodes  of  << this -> NumberOfNodes ) ; return this -> NumberOfNodes ; } ; /@} /@{ *
##  Get the number of data fields at the nodes.
##  virtual int GetBinaryFileNumberOfCellsNumberOfNodesNumberOfNodeFields ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfNodeFields  of  << this -> NumberOfNodeFields ) ; return this -> NumberOfNodeFields ; } ; /@} /@{ *
##  Get the number of data fields at the cell centers.
##  virtual int GetBinaryFileNumberOfCellsNumberOfNodesNumberOfNodeFieldsNumberOfCellFields ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfCellFields  of  << this -> NumberOfCellFields ) ; return this -> NumberOfCellFields ; } ; /@} /@{ *
##  Get the number of data fields for the model. Unused because VTK
##  has no methods for it.
##  virtual int GetBinaryFileNumberOfCellsNumberOfNodesNumberOfNodeFieldsNumberOfCellFieldsNumberOfFields ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfFields  of  << this -> NumberOfFields ) ; return this -> NumberOfFields ; } ; /@} /@{ *
##  Get the number of data components at the nodes and cells.
##  virtual int GetBinaryFileNumberOfCellsNumberOfNodesNumberOfNodeFieldsNumberOfCellFieldsNumberOfFieldsNumberOfNodeComponents ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfNodeComponents  of  << this -> NumberOfNodeComponents ) ; return this -> NumberOfNodeComponents ; } ; virtual int GetBinaryFileNumberOfCellsNumberOfNodesNumberOfNodeFieldsNumberOfCellFieldsNumberOfFieldsNumberOfNodeComponentsNumberOfCellComponents ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfCellComponents  of  << this -> NumberOfCellComponents ) ; return this -> NumberOfCellComponents ; } ; /@} /@{ *
##  Set/Get the endian-ness of the binary file.
##  void SetByteOrderToBigEndian ( ) ; void SetByteOrderToLittleEndian ( ) ; const char * GetByteOrderAsString ( ) ; /@} virtual void SetBinaryFileByteOrder ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ByteOrder  to  << _arg ) ; if ( this -> ByteOrder != _arg ) { this -> ByteOrder = _arg ; this -> Modified ( ) ; } } ; virtual int GetBinaryFileNumberOfCellsNumberOfNodesNumberOfNodeFieldsNumberOfCellFieldsNumberOfFieldsNumberOfNodeComponentsNumberOfCellComponentsByteOrder ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ByteOrder  of  << this -> ByteOrder ) ; return this -> ByteOrder ; } ; /@{ *
##  The following methods allow selective reading of solutions fields.  by
##  default, ALL data fields are the nodes and cells are read, but this can
##  be modified.
##  int GetNumberOfPointArrays ( ) ; int GetNumberOfCellArrays ( ) ; const char * GetPointArrayName ( int index ) ; const char * GetCellArrayName ( int index ) ; int GetPointArrayStatus ( const char * name ) ; int GetCellArrayStatus ( const char * name ) ; void SetPointArrayStatus ( const char * name , int status ) ; void SetCellArrayStatus ( const char * name , int status ) ; /@} void DisableAllCellArrays ( ) ; void EnableAllCellArrays ( ) ; void DisableAllPointArrays ( ) ; void EnableAllPointArrays ( ) ;  get min and max value for the index-th value of a cell component
##  index varies from 0 to (veclen - 1) void GetCellDataRange ( int cellComp , int index , float * min , float * max ) ;  get min and max value for the index-th value of a node component
##  index varies from 0 to (veclen - 1) void GetNodeDataRange ( int nodeComp , int index , float * min , float * max ) ; protected : vtkAVSucdReader ( ) ; ~ vtkAVSucdReader ( ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; char * FileName ; vtkTypeBool BinaryFile ; int NumberOfNodes ; int NumberOfCells ; int NumberOfNodeFields ; int NumberOfNodeComponents ; int NumberOfCellComponents ; int NumberOfCellFields ; int NumberOfFields ; int NlistNodes ; istream * FileStream ; vtkDataArraySelection * PointDataArraySelection ; vtkDataArraySelection * CellDataArraySelection ; int ByteOrder ; int GetLabel ( char * string , int number , char * label ) ; enum { FILE_BIG_ENDIAN = 0 , FILE_LITTLE_ENDIAN = 1 } ; enum UCDCell_type { PT = 0 , LINE = 1 , TRI = 2 , QUAD = 3 , TET = 4 , PYR = 5 , PRISM = 6 , HEX = 7 } ; struct DataInfo { long foffset ;  offset in binary file int veclen ;  number of components in the node or cell variable float min [ 3 ] ;  pre-calculated data minima (max size 3 for vectors) float max [ 3 ] ;  pre-calculated data maxima (max size 3 for vectors) } ; DataInfo * NodeDataInfo ; DataInfo * CellDataInfo ; private : struct idMapping ; void ReadFile ( vtkUnstructuredGrid * output ) ; void ReadGeometry ( vtkUnstructuredGrid * output , idMapping & nodeMap , idMapping & cellMap ) ; void ReadNodeData ( vtkUnstructuredGrid * output , const idMapping & nodeMap ) ; void ReadCellData ( vtkUnstructuredGrid * output , const idMapping & cellMap ) ; int ReadFloatBlock ( int n , float * block ) ; int ReadIntBlock ( int n , int * block ) ; void ReadXYZCoords ( vtkFloatArray * coords , idMapping & nodeMap ) ; void ReadBinaryCellTopology ( vtkIntArray * material , int * types , vtkIdTypeArray * listcells ) ; void ReadASCIICellTopology ( vtkIntArray * material , vtkUnstructuredGrid * output , const idMapping & nodeMap , idMapping & cellMap ) ; vtkAVSucdReader ( const vtkAVSucdReader & ) = delete ; void operator = ( const vtkAVSucdReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
