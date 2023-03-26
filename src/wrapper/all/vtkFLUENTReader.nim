## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFLUENTReader.h
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
##  @class   vtkFLUENTReader
##  @brief   reads a dataset in Fluent file format
##
##  vtkFLUENTReader creates an unstructured grid dataset. It reads .cas and
##  .dat files stored in FLUENT native format.
##
##  @par Thanks:
##  Thanks to Brian W. Dotson & Terry E. Jordan (Department of Energy, National
##  Energy Technology Laboratory) & Douglas McCorkle (Iowa State University)
##  who developed this class.
##  Please address all comments to Brian Dotson (brian.dotson@netl.doe.gov) &
##  Terry Jordan (terry.jordan@sa.netl.doe.gov)
##  & Doug McCorkle (mccdo@iastate.edu)
##
##
##  @sa
##  vtkGAMBITReader
##

## !!!Ignored construct:  # vtkFLUENTReader_h [NewLine] # vtkFLUENTReader_h [NewLine] # vtkIOGeometryModule.h  For export macro # vtkMultiBlockDataSetAlgorithm.h [NewLine] class vtkDataArraySelection ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkPoints"
discard "forward decl of vtkTriangle"
discard "forward decl of vtkTetra"
discard "forward decl of vtkQuad"
discard "forward decl of vtkHexahedron"
discard "forward decl of vtkPyramid"
discard "forward decl of vtkWedge"
discard "forward decl of vtkConvexPointSet"
## !!!Ignored construct:  class VTKIOGEOMETRY_EXPORT vtkFLUENTReader : public vtkMultiBlockDataSetAlgorithm { public : static vtkFLUENTReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkMultiBlockDataSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkMultiBlockDataSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkFLUENTReader :: IsTypeOf ( type ) ; } static vtkFLUENTReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkFLUENTReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkFLUENTReader * NewInstance ( ) const { return vtkFLUENTReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMultiBlockDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFLUENTReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFLUENTReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Specify the file name of the Fluent case file to read.
##  virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ; /@} /@{ *
##  Get the total number of cells. The number of cells is only valid after a
##  successful read of the data file is performed. Initial value is 0.
##  virtual vtkIdType GetNumberOfCells ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfCells  of  << this -> NumberOfCells ) ; return this -> NumberOfCells ; } ; /@} *
##  Get the number of cell arrays available in the input.
##  int GetNumberOfCellArrays ( void ) ; *
##  Get the name of the cell array with the given index in
##  the input.
##  const char * GetCellArrayName ( int index ) ; /@{ *
##  Get/Set whether the cell array with the given name is to
##  be read.
##  int GetCellArrayStatus ( const char * name ) ; void SetCellArrayStatus ( const char * name , int status ) ; /@} /@{ *
##  Turn on/off all cell arrays.
##  void DisableAllCellArrays ( ) ; void EnableAllCellArrays ( ) ; /@} /@{ *
##  These methods should be used instead of the SwapBytes methods.
##  They indicate the byte ordering of the file you are trying
##  to read in. These methods will then either swap or not swap
##  the bytes depending on the byte ordering of the machine it is
##  being run on. For example, reading in a BigEndian file on a
##  BigEndian machine will result in no swapping. Trying to read
##  the same file on a LittleEndian machine will result in swapping.
##  As a quick note most UNIX machines are BigEndian while PC's
##  and VAX tend to be LittleEndian. So if the file you are reading
##  in was generated on a VAX or PC, SetDataByteOrderToLittleEndian
##  otherwise SetDataByteOrderToBigEndian. Not used when reading
##  text files.
##  void SetDataByteOrderToBigEndian ( ) ; void SetDataByteOrderToLittleEndian ( ) ; int GetDataByteOrder ( ) ; void SetDataByteOrder ( int ) ; const char * GetDataByteOrderAsString ( ) ;
##   Structures
##  struct Cell ; struct Face ; struct ScalarDataChunk ; struct VectorDataChunk ; struct stdString ; struct intVector ; struct doubleVector ; struct stringVector ; struct cellVector ; struct faceVector ; struct stdMap ; struct scalarDataVector ; struct vectorDataVector ; struct intVectorVector ; /@} protected : vtkFLUENTReader ( ) ; ~ vtkFLUENTReader ( ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; /@{ *
##  Set/Get the byte swapping to explicitly swap the bytes of a file.
##  Not used when reading text files.
##  virtual void SetSwapBytes ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SwapBytes  to  << _arg ) ; if ( this -> SwapBytes != _arg ) { this -> SwapBytes = _arg ; this -> Modified ( ) ; } } ; vtkTypeBool GetSwapBytes ( ) { return this -> SwapBytes ; } virtual void SwapBytesOn ( ) { this -> SetSwapBytes ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void SwapBytesOff ( ) { this -> SetSwapBytes ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} virtual bool OpenCaseFile ( const char * filename ) ; virtual bool OpenDataFile ( const char * filename ) ; virtual int GetCaseChunk ( ) ; virtual void GetNumberOfCellZones ( ) ; virtual int GetCaseIndex ( ) ; virtual void LoadVariableNames ( ) ; virtual int GetDataIndex ( ) ; virtual int GetDataChunk ( ) ; virtual void GetSpeciesVariableNames ( ) ; virtual void ParseCaseFile ( ) ; virtual int GetDimension ( ) ; virtual void GetLittleEndianFlag ( ) ; virtual void GetNodesAscii ( ) ; virtual void GetNodesSinglePrecision ( ) ; virtual void GetNodesDoublePrecision ( ) ; virtual void GetCellsAscii ( ) ; virtual void GetCellsBinary ( ) ; virtual void GetFacesAscii ( ) ; virtual void GetFacesBinary ( ) ; virtual void GetPeriodicShadowFacesAscii ( ) ; virtual void GetPeriodicShadowFacesBinary ( ) ; virtual void GetCellTreeAscii ( ) ; virtual void GetCellTreeBinary ( ) ; virtual void GetFaceTreeAscii ( ) ; virtual void GetFaceTreeBinary ( ) ; virtual void GetInterfaceFaceParentsAscii ( ) ; virtual void GetInterfaceFaceParentsBinary ( ) ; virtual void GetNonconformalGridInterfaceFaceInformationAscii ( ) ; virtual void GetNonconformalGridInterfaceFaceInformationBinary ( ) ; virtual void GetPartitionInfo ( ) { } virtual void CleanCells ( ) ; virtual void PopulateCellNodes ( ) ; virtual int GetCaseBufferInt ( int ptr ) ; virtual float GetCaseBufferFloat ( int ptr ) ; virtual double GetCaseBufferDouble ( int ptr ) ; virtual void PopulateTriangleCell ( int i ) ; virtual void PopulateTetraCell ( int i ) ; virtual void PopulateQuadCell ( int i ) ; virtual void PopulateHexahedronCell ( int i ) ; virtual void PopulatePyramidCell ( int i ) ; virtual void PopulateWedgeCell ( int i ) ; virtual void PopulatePolyhedronCell ( int i ) ; virtual void ParseDataFile ( ) ; virtual int GetDataBufferInt ( int ptr ) ; virtual float GetDataBufferFloat ( int ptr ) ; virtual double GetDataBufferDouble ( int ptr ) ; virtual void GetData ( int dataType ) ; virtual bool ParallelCheckCell ( int vtkNotUsed ( i ) ) { return true ; }
##   Variables
##  vtkDataArraySelection * CellDataArraySelection ; char * FileName ; vtkIdType NumberOfCells ; int NumberOfCellArrays ; istream * FluentCaseFile ; istream * FluentDataFile ; stdString * CaseBuffer ; stdString * DataBuffer ; vtkPoints * Points ; vtkTriangle * Triangle ; vtkTetra * Tetra ; vtkQuad * Quad ; vtkHexahedron * Hexahedron ; vtkPyramid * Pyramid ; vtkWedge * Wedge ; vtkConvexPointSet * ConvexPointSet ; cellVector * Cells ; faceVector * Faces ; stdMap * VariableNames ; intVector * CellZones ; scalarDataVector * ScalarDataChunks ; vectorDataVector * VectorDataChunks ; intVectorVector * SubSectionZones ; intVector * SubSectionIds ; intVector * SubSectionSize ; stringVector * ScalarVariableNames ; intVector * ScalarSubSectionIds ; stringVector * VectorVariableNames ; intVector * VectorSubSectionIds ; vtkTypeBool SwapBytes ; int GridDimension ; int DataPass ; int NumberOfScalars ; int NumberOfVectors ; private : vtkFLUENTReader ( const vtkFLUENTReader & ) = delete ; void operator = ( const vtkFLUENTReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
