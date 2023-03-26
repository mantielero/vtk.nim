## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCGNSReader.h
##
##   Copyright (c) Ken Martin, Will Schrodeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
##   =========================================================================
##  Copyright 2013-2014 Mickael Philit.
## *
##  @class   vtkCGNSReader
##
##  vtkCGNSReader creates a multi-block dataset and reads unstructured grids
##  and structured meshes from binary files stored in CGNS file format,
##  with data stored at the nodes, cells or faces.
##
##  vtkCGNSReader is inspired by the VisIt CGNS reader originally written by
##  B. Whitlock. vtkCGNSReader relies on the low level CGNS API to load data sets
##  and reduce memory footprint.
##

## !!!Ignored construct:  # vtkCGNSReader_h [NewLine] # vtkCGNSReader_h [NewLine] # vtkIOCGNSReaderModule.h  for export macro # vtkMultiBlockDataSetAlgorithm.h [NewLine] # vtkNew.h  for vtkNew. [NewLine] # < string >  for std::string [NewLine] class vtkDataArraySelection ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkInformationStringKey"
discard "forward decl of vtkCGNSMetaData"
discard "forward decl of vtkMultiProcessController"
## !!!Ignored construct:  class VTKIOCGNSREADER_EXPORT vtkCGNSReader : public vtkMultiBlockDataSetAlgorithm { public : static vtkCGNSReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkMultiBlockDataSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkMultiBlockDataSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkCGNSReader :: IsTypeOf ( type ) ; } static vtkCGNSReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkCGNSReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkCGNSReader * NewInstance ( ) const { return vtkCGNSReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMultiBlockDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCGNSReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCGNSReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; enum DataArrayLocation { CELL_DATA = 0 , FACE_DATA } ; /@{ *
##  Set/get the location of the data arrays to read. Possible values for the data location are:
##  - CELL_DATA - Read CellCenter data arrays from the CGNS file. Construct 3D meshes with 3D cells
##  (e.g. a cube is defined as 1 cell).
##  - FACE_DATA - Read FaceCenter data arrays from the CGNS file. Construct 3D meshes with 2D
##  cells/faces (e.g. a cube is defined as 6 quad cells). Element connectivity must be defined with
##  element type NGON_n.
##
##  Default is CELL_DATA.
##  virtual void SetDataLocation ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << DataLocation  to  << _arg ) ; if ( this -> DataLocation != ( _arg < vtkCGNSReader :: CELL_DATA ? vtkCGNSReader :: CELL_DATA : ( _arg > vtkCGNSReader :: FACE_DATA ? vtkCGNSReader :: FACE_DATA : _arg ) ) ) { this -> DataLocation = ( _arg < vtkCGNSReader :: CELL_DATA ? vtkCGNSReader :: CELL_DATA : ( _arg > vtkCGNSReader :: FACE_DATA ? vtkCGNSReader :: FACE_DATA : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetDataLocationMinValue ( ) { return vtkCGNSReader :: CELL_DATA ; } virtual int GetDataLocationMaxValue ( ) { return vtkCGNSReader :: FACE_DATA ; } ; virtual int GetDataLocation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DataLocation  of  << this -> DataLocation ) ; return this -> DataLocation ; } ; /@} /@{ *
##  Specify file name of CGNS datafile to read
##  virtual void SetFileName ( const char * arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( arg ? arg : (null) ) ) ; if ( arg ) { this -> FileName = arg ; } else { this -> FileName . clear ( ) ; } this -> Modified ( ) ; } ; virtual const char * GetFileName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << this -> FileName ) ; return this -> FileName . c_str ( ) ; } ; /@} *
##  Is the given file name a CGNS file?
##  int CanReadFile ( VTK_FILEPATH const char * filename ) ; *
##  Returns access to the base selection object.
##  vtkDataArraySelection * GetBaseSelection ( ) ; *
##  Returns access to the family selection object.
##  vtkDataArraySelection * GetFamilySelection ( ) ; /@{ *
##  API to select bases to read. These calls simply forward to the
##  vtkDataArraySelection instance obtained from `GetBaseSelection()`.
##
##  By default, 0-th base is enabled and all others are disabled.
##  int GetBaseArrayStatus ( const char * name ) ; void SetBaseArrayStatus ( const char * name , int status ) ; void DisableAllBases ( ) ; void EnableAllBases ( ) ; int GetNumberOfBaseArrays ( ) ; const char * GetBaseArrayName ( int index ) ; /@} /@{ *
##  API to select families to read. These calls simply forward to the
##  vtkDataArraySelection instance obtained from `GetFamilySelection()`.
##  int GetNumberOfFamilyArrays ( ) ; const char * GetFamilyArrayName ( int index ) ; void SetFamilyArrayStatus ( const char * name , int status ) ; int GetFamilyArrayStatus ( const char * name ) ; void EnableAllFamilies ( ) ; void DisableAllFamilies ( ) ; /@} /@{ *
##  API to get information of point arrays and enable/disable loading of
##  a particular arrays.
##  int GetNumberOfPointArrays ( ) ; const char * GetPointArrayName ( int index ) ; int GetPointArrayStatus ( const char * name ) ; void SetPointArrayStatus ( const char * name , int status ) ; void DisableAllPointArrays ( ) ; void EnableAllPointArrays ( ) ; /@} /@{ *
##  API to get information of cell arrays and enable/disable loading of
##  a particular arrays.
##  int GetNumberOfCellArrays ( ) ; const char * GetCellArrayName ( int index ) ; int GetCellArrayStatus ( const char * name ) ; void SetCellArrayStatus ( const char * name , int status ) ; void DisableAllCellArrays ( ) ; void EnableAllCellArrays ( ) ; /@} /@{ *
##  API to get information of face arrays and enable/disable loading of
##  a particular arrays.
##  int GetNumberOfFaceArrays ( ) ; const char * GetFaceArrayName ( int index ) ; int GetFaceArrayStatus ( const char * name ) ; void SetFaceArrayStatus ( const char * name , int status ) ; void DisableAllFaceArrays ( ) ; void EnableAllFaceArrays ( ) ; /@} virtual void SetDoublePrecisionMesh ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  DoublePrecisionMesh  to  << _arg ) ; if ( this -> DoublePrecisionMesh != _arg ) { this -> DoublePrecisionMesh = _arg ; this -> Modified ( ) ; } } ; virtual int GetDataLocationDoublePrecisionMesh ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DoublePrecisionMesh  of  << this -> DoublePrecisionMesh ) ; return this -> DoublePrecisionMesh ; } ; virtual void DoublePrecisionMeshOn ( ) { this -> SetDoublePrecisionMesh ( static_cast < int > ( 1 ) ) ; } virtual void DoublePrecisionMeshOff ( ) { this -> SetDoublePrecisionMesh ( static_cast < int > ( 0 ) ) ; } ; /@{ *
##  Enable/disable loading of boundary condition patches.
##  Defaults to false.
##  virtual void SetDoublePrecisionMeshLoadBndPatch ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  LoadBndPatch  to  << _arg ) ; if ( this -> LoadBndPatch != _arg ) { this -> LoadBndPatch = _arg ; this -> Modified ( ) ; } } ; virtual bool GetDataLocationDoublePrecisionMeshLoadBndPatch ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LoadBndPatch  of  << this -> LoadBndPatch ) ; return this -> LoadBndPatch ; } ; virtual void LoadBndPatchOn ( ) { this -> SetDoublePrecisionMeshLoadBndPatch ( static_cast < bool > ( 1 ) ) ; } virtual void LoadBndPatchOff ( ) { this -> SetDoublePrecisionMeshLoadBndPatch ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Enable/disable loading of zone mesh. Defaults to true. It may be turned off
##  to load only boundary patches (when LoadBndPatch if ON), for example.
##  virtual void SetDoublePrecisionMeshLoadBndPatchLoadMesh ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  LoadMesh  to  << _arg ) ; if ( this -> LoadMesh != _arg ) { this -> LoadMesh = _arg ; this -> Modified ( ) ; } } ; virtual bool GetDataLocationDoublePrecisionMeshLoadBndPatchLoadMesh ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LoadMesh  of  << this -> LoadMesh ) ; return this -> LoadMesh ; } ; virtual void LoadMeshOn ( ) { this -> SetDoublePrecisionMeshLoadBndPatchLoadMesh ( static_cast < bool > ( 1 ) ) ; } virtual void LoadMeshOff ( ) { this -> SetDoublePrecisionMeshLoadBndPatchLoadMesh ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Enable/disable adding an empty physical dimension to vectors in case of 2D solutions.
##  virtual void SetDoublePrecisionMeshLoadBndPatchLoadMeshUse3DVector ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Use3DVector  to  << _arg ) ; if ( this -> Use3DVector != _arg ) { this -> Use3DVector = _arg ; this -> Modified ( ) ; } } ; virtual bool GetDataLocationDoublePrecisionMeshLoadBndPatchLoadMeshUse3DVector ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Use3DVector  of  << this -> Use3DVector ) ; return this -> Use3DVector ; } ; virtual void Use3DVectorOn ( ) { this -> SetDoublePrecisionMeshLoadBndPatchLoadMeshUse3DVector ( static_cast < bool > ( 1 ) ) ; } virtual void Use3DVectorOff ( ) { this -> SetDoublePrecisionMeshLoadBndPatchLoadMeshUse3DVector ( static_cast < bool > ( 0 ) ) ; } ; /@} *
##  This option is provided for debugging and should not be used for production
##  runs as the output data produced may not be correct. When set to true, the
##  read will simply read each solution (`FlowSolution_t`) node encountered in
##  a zone and create a separate block under the block corresponding to the
##  zone in the output.
##  virtual void SetDoublePrecisionMeshLoadBndPatchLoadMeshUse3DVectorCreateEachSolutionAsBlock ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CreateEachSolutionAsBlock  to  << _arg ) ; if ( this -> CreateEachSolutionAsBlock != _arg ) { this -> CreateEachSolutionAsBlock = _arg ; this -> Modified ( ) ; } } ; virtual int GetDataLocationDoublePrecisionMeshLoadBndPatchLoadMeshUse3DVectorCreateEachSolutionAsBlock ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CreateEachSolutionAsBlock  of  << this -> CreateEachSolutionAsBlock ) ; return this -> CreateEachSolutionAsBlock ; } ; virtual void CreateEachSolutionAsBlockOn ( ) { this -> SetDoublePrecisionMeshLoadBndPatchLoadMeshUse3DVectorCreateEachSolutionAsBlock ( static_cast < int > ( 1 ) ) ; } virtual void CreateEachSolutionAsBlockOff ( ) { this -> SetDoublePrecisionMeshLoadBndPatchLoadMeshUse3DVectorCreateEachSolutionAsBlock ( static_cast < int > ( 0 ) ) ; } ; *
##  When set to true (default is false), the reader will simply
##  ignore `FlowSolutionPointers` since they are either incomplete or invalid
##  and instead will rely on FlowSolution_t nodes being labelled as
##  "...AtStep<tsindex>" to locate solution nodes for a specific timestep.
##  Note, tsindex starts with 1 (not zero).
##
##  When set to false, the reader will still try to confirm that at least one
##  valid FlowSolution_t node is referred to in FlowSolutionPointers nodes for the
##  current timestep. If none is found, then the reader will print out a
##  warning and act as if IgnoreFlowSolutionPointers was set to true. To avoid
##  this warning, one should set IgnoreFlowSolutionPointers to true.
##  virtual void SetDoublePrecisionMeshLoadBndPatchLoadMeshUse3DVectorCreateEachSolutionAsBlockIgnoreFlowSolutionPointers ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  IgnoreFlowSolutionPointers  to  << _arg ) ; if ( this -> IgnoreFlowSolutionPointers != _arg ) { this -> IgnoreFlowSolutionPointers = _arg ; this -> Modified ( ) ; } } ; virtual bool GetDataLocationDoublePrecisionMeshLoadBndPatchLoadMeshUse3DVectorCreateEachSolutionAsBlockIgnoreFlowSolutionPointers ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IgnoreFlowSolutionPointers  of  << this -> IgnoreFlowSolutionPointers ) ; return this -> IgnoreFlowSolutionPointers ; } ; virtual void IgnoreFlowSolutionPointersOn ( ) { this -> SetDoublePrecisionMeshLoadBndPatchLoadMeshUse3DVectorCreateEachSolutionAsBlockIgnoreFlowSolutionPointers ( static_cast < bool > ( 1 ) ) ; } virtual void IgnoreFlowSolutionPointersOff ( ) { this -> SetDoublePrecisionMeshLoadBndPatchLoadMeshUse3DVectorCreateEachSolutionAsBlockIgnoreFlowSolutionPointers ( static_cast < bool > ( 0 ) ) ; } ; *
##  When set to true (default is false), the reader will try
##  to determine to determine FlowSolution_t nodes to read with a pattern matching
##  This can be useful for unsteady solutions when `FlowSolutionPointers` are not
##  reliable
##  virtual void SetDoublePrecisionMeshLoadBndPatchLoadMeshUse3DVectorCreateEachSolutionAsBlockIgnoreFlowSolutionPointersUseUnsteadyPattern ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseUnsteadyPattern  to  << _arg ) ; if ( this -> UseUnsteadyPattern != _arg ) { this -> UseUnsteadyPattern = _arg ; this -> Modified ( ) ; } } ; virtual bool GetDataLocationDoublePrecisionMeshLoadBndPatchLoadMeshUse3DVectorCreateEachSolutionAsBlockIgnoreFlowSolutionPointersUseUnsteadyPattern ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseUnsteadyPattern  of  << this -> UseUnsteadyPattern ) ; return this -> UseUnsteadyPattern ; } ; virtual void UseUnsteadyPatternOn ( ) { this -> SetDoublePrecisionMeshLoadBndPatchLoadMeshUse3DVectorCreateEachSolutionAsBlockIgnoreFlowSolutionPointersUseUnsteadyPattern ( static_cast < bool > ( 1 ) ) ; } virtual void UseUnsteadyPatternOff ( ) { this -> SetDoublePrecisionMeshLoadBndPatchLoadMeshUse3DVectorCreateEachSolutionAsBlockIgnoreFlowSolutionPointersUseUnsteadyPattern ( static_cast < bool > ( 0 ) ) ; } ; *
##  This reader can support piece requests by distributing each block in each
##  zone across ranks (default). To make the reader disregard piece request and
##  read all blocks in the zone, set this to false (default is true).
##  virtual void SetDoublePrecisionMeshLoadBndPatchLoadMeshUse3DVectorCreateEachSolutionAsBlockIgnoreFlowSolutionPointersUseUnsteadyPatternDistributeBlocks ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  DistributeBlocks  to  << _arg ) ; if ( this -> DistributeBlocks != _arg ) { this -> DistributeBlocks = _arg ; this -> Modified ( ) ; } } ; virtual bool GetDataLocationDoublePrecisionMeshLoadBndPatchLoadMeshUse3DVectorCreateEachSolutionAsBlockIgnoreFlowSolutionPointersUseUnsteadyPatternDistributeBlocks ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DistributeBlocks  of  << this -> DistributeBlocks ) ; return this -> DistributeBlocks ; } ; virtual void DistributeBlocksOn ( ) { this -> SetDoublePrecisionMeshLoadBndPatchLoadMeshUse3DVectorCreateEachSolutionAsBlockIgnoreFlowSolutionPointersUseUnsteadyPatternDistributeBlocks ( static_cast < bool > ( 1 ) ) ; } virtual void DistributeBlocksOff ( ) { this -> SetDoublePrecisionMeshLoadBndPatchLoadMeshUse3DVectorCreateEachSolutionAsBlockIgnoreFlowSolutionPointersUseUnsteadyPatternDistributeBlocks ( static_cast < bool > ( 0 ) ) ; } ; /@{ *
##  This reader can cache the mesh points if they are time invariant.
##  They will be stored with a unique reference to their /base/zonename
##  and not be read in the file when doing unsteady analysis.
##  void SetCacheMesh ( bool enable ) ; virtual bool GetDataLocationDoublePrecisionMeshLoadBndPatchLoadMeshUse3DVectorCreateEachSolutionAsBlockIgnoreFlowSolutionPointersUseUnsteadyPatternDistributeBlocksCacheMesh ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CacheMesh  of  << this -> CacheMesh ) ; return this -> CacheMesh ; } ; virtual void CacheMeshOn ( ) { this -> SetDoublePrecisionMeshLoadBndPatchLoadMeshUse3DVectorCreateEachSolutionAsBlockIgnoreFlowSolutionPointersUseUnsteadyPatternDistributeBlocksCacheMesh ( static_cast < bool > ( 1 ) ) ; } virtual void CacheMeshOff ( ) { this -> SetDoublePrecisionMeshLoadBndPatchLoadMeshUse3DVectorCreateEachSolutionAsBlockIgnoreFlowSolutionPointersUseUnsteadyPatternDistributeBlocksCacheMesh ( static_cast < bool > ( 0 ) ) ; } ; /@{ *
##  This reader can cache the mesh connectivities if they are time invariant.
##  They will be stored with a unique reference to their /base/zonename
##  and not be read in the file when doing unsteady analysis.
##  void SetCacheConnectivity ( bool enable ) ; virtual bool GetDataLocationDoublePrecisionMeshLoadBndPatchLoadMeshUse3DVectorCreateEachSolutionAsBlockIgnoreFlowSolutionPointersUseUnsteadyPatternDistributeBlocksCacheMeshCacheConnectivity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CacheConnectivity  of  << this -> CacheConnectivity ) ; return this -> CacheConnectivity ; } ; virtual void CacheConnectivityOn ( ) { this -> SetDoublePrecisionMeshLoadBndPatchLoadMeshUse3DVectorCreateEachSolutionAsBlockIgnoreFlowSolutionPointersUseUnsteadyPatternDistributeBlocksCacheMeshCacheConnectivity ( static_cast < bool > ( 1 ) ) ; } virtual void CacheConnectivityOff ( ) { this -> SetDoublePrecisionMeshLoadBndPatchLoadMeshUse3DVectorCreateEachSolutionAsBlockIgnoreFlowSolutionPointersUseUnsteadyPatternDistributeBlocksCacheMeshCacheConnectivity ( static_cast < bool > ( 0 ) ) ; } ; /@{ *
##  Set/get the communication object used to relay a list of files
##  from the rank 0 process to all others. This is the only interprocess
##  communication required by vtkPExodusIIReader.
##  void SetController ( vtkMultiProcessController * c ) ; virtual vtkMultiProcessController * GetnameController ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Controller  address  << static_cast < vtkMultiProcessController * > ( this -> Controller ) ) ; return this -> Controller ; } ; /@} *
##  Sends metadata (that read from the input file, not settings modified
##  through this API) from the rank 0 node to all other processes in a job.
##  void Broadcast ( vtkMultiProcessController * ctrl ) ; *
##  Key used to put a family name in the meta-data associated with a node
##  static vtkInformationStringKey * FAMILY ( ) ; protected : vtkCGNSReader ( ) ; ~ vtkCGNSReader ( ) override ; int FillOutputPortInformation ( int port , vtkInformation * info ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int GetCurvilinearZone ( int base , int zone , int cell_dim , int phys_dim , void * zsize , vtkMultiBlockDataSet * mbase ) ; int GetUnstructuredZone ( int base , int zone , int cell_dim , int phys_dim , void * zsize , vtkMultiBlockDataSet * mbase ) ; vtkMultiProcessController * Controller = nullptr ; vtkIdType ProcRank = 0 ; vtkIdType ProcSize = 1 ; vtkNew < vtkDataArraySelection > BaseSelection ; vtkNew < vtkDataArraySelection > FamilySelection ; vtkNew < vtkDataArraySelection > CellDataArraySelection ; vtkNew < vtkDataArraySelection > FaceDataArraySelection ; vtkNew < vtkDataArraySelection > PointDataArraySelection ; private : vtkCGNSReader ( const vtkCGNSReader & ) = delete ; void operator = ( const vtkCGNSReader & ) = delete ; std :: string FileName =  ; int DataLocation = vtkCGNSReader :: CELL_DATA ; bool LoadBndPatch = false ;  option to set section loading for unstructured grid bool LoadMesh = true ;  option to enable/disable mesh loading int DoublePrecisionMesh = 1 ;  option to set mesh loading to double precision int CreateEachSolutionAsBlock = 0 ;  debug option to create bool IgnoreFlowSolutionPointers = false ; bool UseUnsteadyPattern = false ; bool DistributeBlocks = true ; bool CacheMesh = false ; bool CacheConnectivity = false ; bool Use3DVector = true ;  For internal cgio calls (low level IO) int cgioNum ;  cgio file reference double rootId ;  id of root node double currentId ;  id of node currently being read (zone) unsigned int NumberOfBases = 0 ; int ActualTimeStep = 0 ; class vtkPrivate ; vtkPrivate * Internals ; friend class vtkPrivate ; } ;
## Error: token expected: ; but got: [identifier]!!!
