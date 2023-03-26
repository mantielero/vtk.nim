## =========================================================================
##
##  Program:   Visualization Toolkit
##  Module:    vtkAMRBaseReader.h
##
##  Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##  All rights reserved.
##  See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##  This software is distributed WITHOUT ANY WARRANTY; without even
##  the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##  PURPOSE.  See the above copyright notice for more information.
##
##  =========================================================================
## *
##  @class   vtkAMRBaseReader
##  @brief   An abstract class that encapsulates common functionality for all AMR readers.
##

## !!!Ignored construct:  # vtkAMRBaseReader_h [NewLine] # vtkAMRBaseReader_h [NewLine] # vtkIOAMRModule.h  For export macro # vtkOverlappingAMRAlgorithm.h [NewLine] # < map >  STL map header # < utility >  for STL pair # < vector >  STL vector header [NewLine]  Forward Declarations class vtkOverlappingAMR ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkMultiProcessController"
discard "forward decl of vtkDataArraySelection"
discard "forward decl of vtkCallbackCommand"
discard "forward decl of vtkIndent"
discard "forward decl of vtkAMRDataSetCache"
discard "forward decl of vtkUniformGrid"
discard "forward decl of vtkDataArray"
## !!!Ignored construct:  class VTKIOAMR_EXPORT vtkAMRBaseReader : public vtkOverlappingAMRAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkOverlappingAMRAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkOverlappingAMRAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkAMRBaseReader :: IsTypeOf ( type ) ; } static vtkAMRBaseReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkAMRBaseReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkAMRBaseReader * NewInstance ( ) const { return vtkAMRBaseReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkOverlappingAMRAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAMRBaseReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAMRBaseReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Initializes the AMR reader.
##  All concrete instances must call this method in their constructor.
##  void Initialize ( ) ; /@{ *
##  Set/Get Reader caching property
##  virtual void SetEnableCaching ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  EnableCaching  to  << _arg ) ; if ( this -> EnableCaching != _arg ) { this -> EnableCaching = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetEnableCaching ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EnableCaching  of  << this -> EnableCaching ) ; return this -> EnableCaching ; } ; virtual void EnableCachingOn ( ) { this -> SetEnableCaching ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void EnableCachingOff ( ) { this -> SetEnableCaching ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; bool IsCachingEnabled ( ) const { return ( ( this -> EnableCaching ) ? true : false ) ; } ; /@} /@{ *
##  Set/Get a multiprocess-controller for reading in parallel.
##  By default this parameter is set to nullptr by the constructor.
##  virtual void SetController ( vtkMultiProcessController * ) ; virtual vtkMultiProcessController * GetnameController ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Controller  address  << static_cast < vtkMultiProcessController * > ( this -> Controller ) ) ; return this -> Controller ; } ; /@} /@{ *
##  Set the level, up to which the blocks are loaded.
##  virtual void SetEnableCachingMaxLevel ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MaxLevel  to  << _arg ) ; if ( this -> MaxLevel != _arg ) { this -> MaxLevel = _arg ; this -> Modified ( ) ; } } ; /@} /@{ *
##  Get the data array selection tables used to configure which data
##  arrays are loaded by the reader.
##  virtual vtkDataArraySelection * GetnameControllerCellDataArraySelection ( ) { vtkDebugWithObjectMacro ( this , <<  returning  CellDataArraySelection  address  << static_cast < vtkDataArraySelection * > ( this -> CellDataArraySelection ) ) ; return this -> CellDataArraySelection ; } ; virtual vtkDataArraySelection * GetnameControllerCellDataArraySelectionPointDataArraySelection ( ) { vtkDebugWithObjectMacro ( this , <<  returning  PointDataArraySelection  address  << static_cast < vtkDataArraySelection * > ( this -> PointDataArraySelection ) ) ; return this -> PointDataArraySelection ; } ; /@} /@{ *
##  Get the number of point or cell arrays available in the input.
##  int GetNumberOfPointArrays ( ) ; int GetNumberOfCellArrays ( ) ; /@} /@{ *
##  Get the name of the point or cell array with the given index in
##  the input.
##  const char * GetPointArrayName ( int index ) ; const char * GetCellArrayName ( int index ) ; /@} /@{ *
##  Get/Set whether the point or cell array with the given name is to
##  be read.
##  int GetPointArrayStatus ( const char * name ) ; int GetCellArrayStatus ( const char * name ) ; void SetPointArrayStatus ( const char * name , int status ) ; void SetCellArrayStatus ( const char * name , int status ) ; /@} /@{ *
##  Set/Get the filename. Concrete instances of this class must implement
##  the SetFileName method accordingly.
##  virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ; virtual void SetFileName ( VTK_FILEPATH const char * fileName ) = 0 ; /@} *
##  Returns the total number of blocks. Implemented by concrete instances.
##  virtual int GetNumberOfBlocks ( ) = 0 ; *
##  Returns the total number of levels. Implemented by concrete instances.
##  virtual int GetNumberOfLevels ( ) = 0 ; protected : vtkAMRBaseReader ( ) ; ~ vtkAMRBaseReader ( ) override ;  Desscription:
##  Checks if this reader instance is attached to a communicator
##  with more than one MPI processes. bool IsParallel ( ) ; *
##  Determines if the block is owned by this process based on the
##  the block index and total number of processes.
##  bool IsBlockMine ( const int blockIdx ) ; *
##  Loads the AMR block corresponding to the given index. The block
##  is either loaded from the file, or, from the cache if caching is
##  enabled.
##  vtkUniformGrid * GetAMRBlock ( const int blockIdx ) ; *
##  This method assigns blocks to processes using block-cyclic distribution.
##  It is the method that is used to load distributed AMR data by default.
##  void AssignAndLoadBlocks ( vtkOverlappingAMR * amrds ) ; *
##  This method loads all the blocks in the BlockMap for the given process.
##  It assumes that the downstream module is doing an upstream request with
##  the flag LOAD_REQUESTED_BLOCKS which indicates that the downstream filter
##  has already assigned which blocks are needed for each process.
##  void LoadRequestedBlocks ( vtkOverlappingAMR * amrds ) ; *
##  Loads the AMR data corresponding to the given field name.
##  NOTE: Currently, only cell-data are supported.
##  void GetAMRData ( const int blockIdx , vtkUniformGrid * block , const char * fieldName ) ; *
##  Loads the AMR point data corresponding to the given field name.
##  void GetAMRPointData ( const int blockIdx , vtkUniformGrid * block , const char * fieldName ) ; *
##  A wrapper that loops over point arrays and load the point
##  arrays that are enabled, i.e., selected for the given block.
##  NOTE: This method is currently not implemented.
##  void LoadPointData ( const int blockIdx , vtkUniformGrid * block ) ; *
##  A wrapper that loops over all cell arrays and loads the cell
##  arrays that are enabled, i.e., selected for the given block.
##  The data are either loaded from the file, or, from the cache if
##  caching is enabled.
##  void LoadCellData ( const int blockIdx , vtkUniformGrid * block ) ; *
##  Returns the block process ID for the block corresponding to the
##  given block index. If this reader instance is serial, i.e., there
##  is no controller associated, the method returns 0. Otherwise, static
##  block-cyclic-distribution is assumed and each block is assigned to
##  a process according to blockIdx%N, where N is the total number of
##  processes.
##  int GetBlockProcessId ( const int blockIdx ) ; *
##  Initializes the request of blocks to be loaded. This method checks
##  if an upstream request has been issued from a downstream module which
##  specifies which blocks are to be loaded, otherwise, it uses the max
##  level associated with this reader instance to determine which blocks
##  are to be loaded.
##  void SetupBlockRequest ( vtkInformation * outputInfo ) ; *
##  Reads all the metadata from the file. Implemented by concrete classes.
##  virtual void ReadMetaData ( ) = 0 ; *
##  Returns the block level for the given block
##  virtual int GetBlockLevel ( const int blockIdx ) = 0 ; *
##  Loads all the AMR metadata & constructs the LevelIdxPair12InternalIdx
##  datastructure which maps (level,id) pairs to an internal linear index
##  used to identify the corresponding block.
##  virtual int FillMetaData ( ) = 0 ; *
##  Loads the block according to the index w.r.t. the generated BlockMap.
##  virtual vtkUniformGrid * GetAMRGrid ( const int blockIdx ) = 0 ; *
##  Loads the block data
##  virtual void GetAMRGridData ( const int blockIdx , vtkUniformGrid * block , const char * field ) = 0 ; *
##  Loads the block Point data
##  virtual void GetAMRGridPointData ( const int blockIdx , vtkUniformGrid * block , const char * field ) = 0 ; /@{ *
##  Standard Pipeline methods, subclasses may override this method if needed.
##  int RequestData ( vtkInformation * vtkNotUsed ( request ) , vtkInformationVector * * vtkNotUsed ( inputVector ) , vtkInformationVector * outputVector ) override ; int RequestInformation ( vtkInformation * rqst , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; int FillOutputPortInformation ( int port , vtkInformation * info ) override ; /@}  Array selection member variables and methods vtkDataArraySelection * PointDataArraySelection ; vtkDataArraySelection * CellDataArraySelection ; vtkCallbackCommand * SelectionObserver ; *
##  Initializes the array selections. If this is an initial request,
##  i.e., the first load from the file, all the arrays are deselected,
##  and the InitialRequest ivar is set to false.
##  void InitializeArraySelections ( ) ; *
##  Initializes the PointDataArraySelection & CellDataArraySelection
##  virtual void SetUpDataArraySelections ( ) = 0 ; *
##  Call-back registered with the SelectionObserver.
##  static void SelectionModifiedCallback ( vtkObject * caller , unsigned long eid , void * clientdata , void * calldata ) ; bool InitialRequest ; int MaxLevel ; char * FileName ; vtkMultiProcessController * Controller ; vtkTypeBool EnableCaching ; vtkAMRDataSetCache * Cache ; int NumBlocksFromFile ; int NumBlocksFromCache ; vtkOverlappingAMR * Metadata ; bool LoadedMetaData ; std :: vector < int > BlockMap ; private : vtkAMRBaseReader ( const vtkAMRBaseReader & ) = delete ; void operator = ( const vtkAMRBaseReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
