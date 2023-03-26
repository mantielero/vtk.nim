## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOpenFOAMReader.h
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
##  @class   vtkOpenFOAMReader
##  @brief   reads a dataset in OpenFOAM format
##
##  vtkOpenFOAMReader creates a multiblock dataset. It reads mesh
##  information and time dependent data.  The polyMesh folders contain
##  mesh information. The time folders contain transient data for the
##  cells. Each folder can contain any number of data files.
##
##  @par Thanks:
##  Thanks to Terry Jordan (terry.jordan@sa.netl.doe.gov) of SAIC
##  at the National Energy Technology Laboratory who originally
##  developed this class.
##
##  Takuya Oshima of Niigata University, Japan (oshima@eng.niigata-u.ac.jp)
##  provided the major bulk of improvements (rewrite) that made the reader
##  truly functional and icluded the following features:
##  Token-based FoamFile format lexer/parser,
##  performance/stability/compatibility enhancements, gzipped file
##  support, lagrangian field support, variable timestep support,
##  builtin cell-to-point filter, pointField support, polyhedron
##  decomposition support, multiregion support, parallelization support for
##  decomposed cases in conjunction with vtkPOpenFOAMReader etc.
##
##  Philippose Rajan (sarith@rocketmail.com) added
##  GUI-based selection of mesh regions and fields available in the case,
##  minor bug fixes, strict memory allocation checks,
##
##  Mark Olesen (OpenCFD Ltd.) www.openfoam.com
##  has provided various bugfixes, improvements, cleanup
##

## !!!Ignored construct:  # vtkOpenFOAMReader_h [NewLine] # vtkOpenFOAMReader_h [NewLine] # vtkIOGeometryModule.h  For export macro # vtkMultiBlockDataSetAlgorithm.h [NewLine] class vtkCollection ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkCharArray"
discard "forward decl of vtkDataArraySelection"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkStdString"
discard "forward decl of vtkStringArray"
discard "forward decl of vtkOpenFOAMReaderPrivate"
## !!!Ignored construct:  class VTKIOGEOMETRY_EXPORT vtkOpenFOAMReader : public vtkMultiBlockDataSetAlgorithm { public :  Access for implementation class friend class vtkOpenFOAMReaderPrivate ; static vtkOpenFOAMReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkMultiBlockDataSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkMultiBlockDataSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkOpenFOAMReader :: IsTypeOf ( type ) ; } static vtkOpenFOAMReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkOpenFOAMReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkOpenFOAMReader * NewInstance ( ) const { return vtkOpenFOAMReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMultiBlockDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOpenFOAMReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOpenFOAMReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Determine if the file can be read with this reader.
##  int CanReadFile ( VTK_FILEPATH const char * ) ; /@{ *
##  Set/Get the filename.
##  virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ; /@} *
##  Get the number of cell arrays available in the input.
##  int GetNumberOfCellArrays ( void ) { return this -> GetNumberOfSelectionArrays ( this -> CellDataArraySelection ) ; } *
##  Get/Set whether the cell array with the given name is to
##  be read.
##  int GetCellArrayStatus ( const char * name ) { return this -> GetSelectionArrayStatus ( this -> CellDataArraySelection , name ) ; } void SetCellArrayStatus ( const char * name , int status ) { this -> SetSelectionArrayStatus ( this -> CellDataArraySelection , name , status ) ; } *
##  Get the name of the cell array with the given index in
##  the input.
##  const char * GetCellArrayName ( int index ) { return this -> GetSelectionArrayName ( this -> CellDataArraySelection , index ) ; } *
##  Turn on/off all cell arrays.
##  void DisableAllCellArrays ( ) { this -> DisableAllSelectionArrays ( this -> CellDataArraySelection ) ; } void EnableAllCellArrays ( ) { this -> EnableAllSelectionArrays ( this -> CellDataArraySelection ) ; } *
##  Get the number of point arrays available in the input.
##  int GetNumberOfPointArrays ( void ) { return this -> GetNumberOfSelectionArrays ( this -> PointDataArraySelection ) ; } *
##  Get/Set whether the point array with the given name is to
##  be read.
##  int GetPointArrayStatus ( const char * name ) { return this -> GetSelectionArrayStatus ( this -> PointDataArraySelection , name ) ; } void SetPointArrayStatus ( const char * name , int status ) { this -> SetSelectionArrayStatus ( this -> PointDataArraySelection , name , status ) ; } *
##  Get the name of the point array with the given index in
##  the input.
##  const char * GetPointArrayName ( int index ) { return this -> GetSelectionArrayName ( this -> PointDataArraySelection , index ) ; } *
##  Turn on/off all point arrays.
##  void DisableAllPointArrays ( ) { this -> DisableAllSelectionArrays ( this -> PointDataArraySelection ) ; } void EnableAllPointArrays ( ) { this -> EnableAllSelectionArrays ( this -> PointDataArraySelection ) ; } *
##  Get the number of Lagrangian arrays available in the input.
##  int GetNumberOfLagrangianArrays ( void ) { return this -> GetNumberOfSelectionArrays ( this -> LagrangianDataArraySelection ) ; } *
##  Get/Set whether the Lagrangian array with the given name is to
##  be read.
##  int GetLagrangianArrayStatus ( const char * name ) { return this -> GetSelectionArrayStatus ( this -> LagrangianDataArraySelection , name ) ; } void SetLagrangianArrayStatus ( const char * name , int status ) { this -> SetSelectionArrayStatus ( this -> LagrangianDataArraySelection , name , status ) ; } *
##  Get the name of the Lagrangian array with the given index in
##  the input.
##  const char * GetLagrangianArrayName ( int index ) { return this -> GetSelectionArrayName ( this -> LagrangianDataArraySelection , index ) ; } *
##  Turn on/off all Lagrangian arrays.
##  void DisableAllLagrangianArrays ( ) { this -> DisableAllSelectionArrays ( this -> LagrangianDataArraySelection ) ; } void EnableAllLagrangianArrays ( ) { this -> EnableAllSelectionArrays ( this -> LagrangianDataArraySelection ) ; } *
##  Get the number of Patches (including Internal Mesh) available in the input.
##  int GetNumberOfPatchArrays ( void ) { return this -> GetNumberOfSelectionArrays ( this -> PatchDataArraySelection ) ; } *
##  Get/Set whether the Patch with the given name is to
##  be read.
##  int GetPatchArrayStatus ( const char * name ) { return this -> GetSelectionArrayStatus ( this -> PatchDataArraySelection , name ) ; } void SetPatchArrayStatus ( const char * name , int status ) { this -> SetSelectionArrayStatus ( this -> PatchDataArraySelection , name , status ) ; } *
##  Get the name of the Patch with the given index in
##  the input.
##  const char * GetPatchArrayName ( int index ) { return this -> GetSelectionArrayName ( this -> PatchDataArraySelection , index ) ; } *
##  Turn on/off all Patches including the Internal Mesh.
##  void DisableAllPatchArrays ( ) { this -> DisableAllSelectionArrays ( this -> PatchDataArraySelection ) ; } void EnableAllPatchArrays ( ) { this -> EnableAllSelectionArrays ( this -> PatchDataArraySelection ) ; } /@{ *
##  Set/Get whether to create cell-to-point translated data for cell-type data
##  virtual void SetCreateCellToPoint ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CreateCellToPoint  to  << _arg ) ; if ( this -> CreateCellToPoint != _arg ) { this -> CreateCellToPoint = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetCreateCellToPoint ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CreateCellToPoint  of  << this -> CreateCellToPoint ) ; return this -> CreateCellToPoint ; } ; virtual void CreateCellToPointOn ( ) { this -> SetCreateCellToPoint ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void CreateCellToPointOff ( ) { this -> SetCreateCellToPoint ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get whether mesh is to be cached.
##  virtual void SetCreateCellToPointCacheMesh ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CacheMesh  to  << _arg ) ; if ( this -> CacheMesh != _arg ) { this -> CacheMesh = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetCreateCellToPointCacheMesh ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CacheMesh  of  << this -> CacheMesh ) ; return this -> CacheMesh ; } ; virtual void CacheMeshOn ( ) { this -> SetCreateCellToPointCacheMesh ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void CacheMeshOff ( ) { this -> SetCreateCellToPointCacheMesh ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get whether polyhedra are to be decomposed.
##  virtual void SetCreateCellToPointCacheMeshDecomposePolyhedra ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  DecomposePolyhedra  to  << _arg ) ; if ( this -> DecomposePolyhedra != _arg ) { this -> DecomposePolyhedra = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetCreateCellToPointCacheMeshDecomposePolyhedra ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DecomposePolyhedra  of  << this -> DecomposePolyhedra ) ; return this -> DecomposePolyhedra ; } ; virtual void DecomposePolyhedraOn ( ) { this -> SetCreateCellToPointCacheMeshDecomposePolyhedra ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void DecomposePolyhedraOff ( ) { this -> SetCreateCellToPointCacheMeshDecomposePolyhedra ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@}  Option for reading old binary lagrangian/positions format
## /@{ *
##  Set/Get whether the lagrangian/positions have additional data or not.
##  For historical reasons, PositionsIsIn13Format is used to denote that
##  the positions only have x,y,z value and the cell of the enclosing cell.
##  In OpenFOAM 1.4-2.4, positions included facei and stepFraction information.
##  virtual void SetCreateCellToPointCacheMeshDecomposePolyhedraPositionsIsIn13Format ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PositionsIsIn13Format  to  << _arg ) ; if ( this -> PositionsIsIn13Format != _arg ) { this -> PositionsIsIn13Format = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetCreateCellToPointCacheMeshDecomposePolyhedraPositionsIsIn13Format ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PositionsIsIn13Format  of  << this -> PositionsIsIn13Format ) ; return this -> PositionsIsIn13Format ; } ; virtual void PositionsIsIn13FormatOn ( ) { this -> SetCreateCellToPointCacheMeshDecomposePolyhedraPositionsIsIn13Format ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void PositionsIsIn13FormatOff ( ) { this -> SetCreateCellToPointCacheMeshDecomposePolyhedraPositionsIsIn13Format ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Ignore 0/ time directory, which is normally missing Lagrangian fields
##  and may have many dictionary functionality that we cannot easily handle.
##  virtual void SetCreateCellToPointCacheMeshDecomposePolyhedraPositionsIsIn13FormatSkipZeroTime ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SkipZeroTime  to  << _arg ) ; if ( this -> SkipZeroTime != _arg ) { this -> SkipZeroTime = _arg ; this -> Modified ( ) ; } } ; virtual bool GetCreateCellToPointCacheMeshDecomposePolyhedraPositionsIsIn13FormatSkipZeroTime ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SkipZeroTime  of  << this -> SkipZeroTime ) ; return this -> SkipZeroTime ; } ; virtual void SkipZeroTimeOn ( ) { this -> SetCreateCellToPointCacheMeshDecomposePolyhedraPositionsIsIn13FormatSkipZeroTime ( static_cast < bool > ( 1 ) ) ; } virtual void SkipZeroTimeOff ( ) { this -> SetCreateCellToPointCacheMeshDecomposePolyhedraPositionsIsIn13FormatSkipZeroTime ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Determine if time directories are to be listed according to controlDict
##  virtual void SetCreateCellToPointCacheMeshDecomposePolyhedraPositionsIsIn13FormatSkipZeroTimeListTimeStepsByControlDict ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ListTimeStepsByControlDict  to  << _arg ) ; if ( this -> ListTimeStepsByControlDict != _arg ) { this -> ListTimeStepsByControlDict = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetCreateCellToPointCacheMeshDecomposePolyhedraPositionsIsIn13FormatSkipZeroTimeListTimeStepsByControlDict ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ListTimeStepsByControlDict  of  << this -> ListTimeStepsByControlDict ) ; return this -> ListTimeStepsByControlDict ; } ; virtual void ListTimeStepsByControlDictOn ( ) { this -> SetCreateCellToPointCacheMeshDecomposePolyhedraPositionsIsIn13FormatSkipZeroTimeListTimeStepsByControlDict ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ListTimeStepsByControlDictOff ( ) { this -> SetCreateCellToPointCacheMeshDecomposePolyhedraPositionsIsIn13FormatSkipZeroTimeListTimeStepsByControlDict ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Add dimensions to array names
##  virtual void SetCreateCellToPointCacheMeshDecomposePolyhedraPositionsIsIn13FormatSkipZeroTimeListTimeStepsByControlDictAddDimensionsToArrayNames ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  AddDimensionsToArrayNames  to  << _arg ) ; if ( this -> AddDimensionsToArrayNames != _arg ) { this -> AddDimensionsToArrayNames = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetCreateCellToPointCacheMeshDecomposePolyhedraPositionsIsIn13FormatSkipZeroTimeListTimeStepsByControlDictAddDimensionsToArrayNames ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AddDimensionsToArrayNames  of  << this -> AddDimensionsToArrayNames ) ; return this -> AddDimensionsToArrayNames ; } ; virtual void AddDimensionsToArrayNamesOn ( ) { this -> SetCreateCellToPointCacheMeshDecomposePolyhedraPositionsIsIn13FormatSkipZeroTimeListTimeStepsByControlDictAddDimensionsToArrayNames ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void AddDimensionsToArrayNamesOff ( ) { this -> SetCreateCellToPointCacheMeshDecomposePolyhedraPositionsIsIn13FormatSkipZeroTimeListTimeStepsByControlDictAddDimensionsToArrayNames ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get whether zones will be read.
##  virtual void SetCreateCellToPointCacheMeshDecomposePolyhedraPositionsIsIn13FormatSkipZeroTimeListTimeStepsByControlDictAddDimensionsToArrayNamesReadZones ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ReadZones  to  << _arg ) ; if ( this -> ReadZones != _arg ) { this -> ReadZones = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetCreateCellToPointCacheMeshDecomposePolyhedraPositionsIsIn13FormatSkipZeroTimeListTimeStepsByControlDictAddDimensionsToArrayNamesReadZones ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReadZones  of  << this -> ReadZones ) ; return this -> ReadZones ; } ; virtual void ReadZonesOn ( ) { this -> SetCreateCellToPointCacheMeshDecomposePolyhedraPositionsIsIn13FormatSkipZeroTimeListTimeStepsByControlDictAddDimensionsToArrayNamesReadZones ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ReadZonesOff ( ) { this -> SetCreateCellToPointCacheMeshDecomposePolyhedraPositionsIsIn13FormatSkipZeroTimeListTimeStepsByControlDictAddDimensionsToArrayNamesReadZones ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  If true, labels are expected to be 64-bit, rather than 32.
##  virtual void SetUse64BitLabels ( bool val ) ; virtual bool GetCreateCellToPointCacheMeshDecomposePolyhedraPositionsIsIn13FormatSkipZeroTimeListTimeStepsByControlDictAddDimensionsToArrayNamesReadZonesUse64BitLabels ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Use64BitLabels  of  << this -> Use64BitLabels ) ; return this -> Use64BitLabels ; } ; virtual void Use64BitLabelsOn ( ) { this -> SetCreateCellToPointCacheMeshDecomposePolyhedraPositionsIsIn13FormatSkipZeroTimeListTimeStepsByControlDictAddDimensionsToArrayNamesReadZonesUse64BitLabels ( static_cast < bool > ( 1 ) ) ; } virtual void Use64BitLabelsOff ( ) { this -> SetCreateCellToPointCacheMeshDecomposePolyhedraPositionsIsIn13FormatSkipZeroTimeListTimeStepsByControlDictAddDimensionsToArrayNamesReadZonesUse64BitLabels ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  If true, data of the internal mesh are copied to the cell zones.
##  Default is false.
##  virtual bool GetCreateCellToPointCacheMeshDecomposePolyhedraPositionsIsIn13FormatSkipZeroTimeListTimeStepsByControlDictAddDimensionsToArrayNamesReadZonesUse64BitLabelsCopyDataToCellZones ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CopyDataToCellZones  of  << this -> CopyDataToCellZones ) ; return this -> CopyDataToCellZones ; } ; virtual void SetCreateCellToPointCacheMeshDecomposePolyhedraPositionsIsIn13FormatSkipZeroTimeListTimeStepsByControlDictAddDimensionsToArrayNamesReadZonesCopyDataToCellZones ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CopyDataToCellZones  to  << _arg ) ; if ( this -> CopyDataToCellZones != _arg ) { this -> CopyDataToCellZones = _arg ; this -> Modified ( ) ; } } ; virtual void CopyDataToCellZonesOn ( ) { this -> SetCreateCellToPointCacheMeshDecomposePolyhedraPositionsIsIn13FormatSkipZeroTimeListTimeStepsByControlDictAddDimensionsToArrayNamesReadZonesUse64BitLabelsCopyDataToCellZones ( static_cast < bool > ( 1 ) ) ; } virtual void CopyDataToCellZonesOff ( ) { this -> SetCreateCellToPointCacheMeshDecomposePolyhedraPositionsIsIn13FormatSkipZeroTimeListTimeStepsByControlDictAddDimensionsToArrayNamesReadZonesUse64BitLabelsCopyDataToCellZones ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  If true, floats are expected to be 64-bit, rather than 32. Note that
##  vtkFloatArrays may still be used in the output if this is true. This flag
##  is only used to ensure that binary data is correctly parsed.
##  virtual void SetUse64BitFloats ( bool val ) ; virtual bool GetCreateCellToPointCacheMeshDecomposePolyhedraPositionsIsIn13FormatSkipZeroTimeListTimeStepsByControlDictAddDimensionsToArrayNamesReadZonesUse64BitLabelsCopyDataToCellZonesUse64BitFloats ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Use64BitFloats  of  << this -> Use64BitFloats ) ; return this -> Use64BitFloats ; } ; virtual void Use64BitFloatsOn ( ) { this -> SetCreateCellToPointCacheMeshDecomposePolyhedraPositionsIsIn13FormatSkipZeroTimeListTimeStepsByControlDictAddDimensionsToArrayNamesReadZonesUse64BitLabelsCopyDataToCellZonesUse64BitFloats ( static_cast < bool > ( 1 ) ) ; } virtual void Use64BitFloatsOff ( ) { this -> SetCreateCellToPointCacheMeshDecomposePolyhedraPositionsIsIn13FormatSkipZeroTimeListTimeStepsByControlDictAddDimensionsToArrayNamesReadZonesUse64BitLabelsCopyDataToCellZonesUse64BitFloats ( static_cast < bool > ( 0 ) ) ; } ; /@} void SetRefresh ( ) { this -> Refresh = true ; this -> Modified ( ) ; } void SetParent ( vtkOpenFOAMReader * parent ) { this -> Parent = parent ; } int MakeInformationVector ( vtkInformationVector * , const vtkStdString & procDirName , vtkStringArray * timeNames = nullptr , vtkDoubleArray * timeValues = nullptr ) ; double GetTimeValue ( ) const ; bool SetTimeValue ( const double ) ; vtkStringArray * GetTimeNames ( ) ; vtkDoubleArray * GetTimeValues ( ) ; int MakeMetaDataAtTimeStep ( const bool ) ; protected :  refresh flag bool Refresh ;  for creating cell-to-point translated data vtkTypeBool CreateCellToPoint ;  for caching mesh vtkTypeBool CacheMesh ;  for decomposing polyhedra on-the-fly vtkTypeBool DecomposePolyhedra ;  for lagrangian/positions without extra data (OF 1.4 - 2.4) vtkTypeBool PositionsIsIn13Format ;  for reading point/face/cell-Zones vtkTypeBool ReadZones ;  Ignore 0/ directory bool SkipZeroTime ;  determine if time directories are listed according to controlDict vtkTypeBool ListTimeStepsByControlDict ;  add dimensions to array names vtkTypeBool AddDimensionsToArrayNames ;  Expect label size to be 64-bit integers instead of 32-bit. bool Use64BitLabels ;  Expect float data to be 64-bit floats instead of 32-bit.
##  Note that vtkFloatArrays may still be used -- this just tells the reader how to
##  parse the binary data. bool Use64BitFloats ;  The data of internal mesh are copied to cell zones bool CopyDataToCellZones ; char * FileName ; vtkCharArray * CasePath ; vtkCollection * Readers ;  DataArraySelection for Patch / Region Data vtkDataArraySelection * PatchDataArraySelection ; vtkDataArraySelection * CellDataArraySelection ; vtkDataArraySelection * PointDataArraySelection ; vtkDataArraySelection * LagrangianDataArraySelection ;  old selection status vtkMTimeType PatchSelectionMTimeOld ; vtkMTimeType CellSelectionMTimeOld ; vtkMTimeType PointSelectionMTimeOld ; vtkMTimeType LagrangianSelectionMTimeOld ;  preserved old information vtkStdString * FileNameOld ; bool SkipZeroTimeOld ; int ListTimeStepsByControlDictOld ; int CreateCellToPointOld ; int DecomposePolyhedraOld ; int PositionsIsIn13FormatOld ; int AddDimensionsToArrayNamesOld ; int ReadZonesOld ; bool Use64BitLabelsOld ; bool Use64BitFloatsOld ;  paths to Lagrangians vtkStringArray * LagrangianPaths ;  number of reader instances int NumberOfReaders ;  index of the active reader int CurrentReaderIndex ; vtkOpenFOAMReader ( ) ; ~ vtkOpenFOAMReader ( ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; void CreateCasePath ( vtkStdString & , vtkStdString & ) ; void SetTimeInformation ( vtkInformationVector * , vtkDoubleArray * ) ; void CreateCharArrayFromString ( vtkCharArray * , const char * , vtkStdString & ) ; void UpdateStatus ( ) ; void UpdateProgress ( double ) ; private : vtkOpenFOAMReader * Parent ; vtkOpenFOAMReader ( const vtkOpenFOAMReader & ) = delete ; void operator = ( const vtkOpenFOAMReader & ) = delete ; int GetNumberOfSelectionArrays ( vtkDataArraySelection * ) ; int GetSelectionArrayStatus ( vtkDataArraySelection * , const char * ) ; void SetSelectionArrayStatus ( vtkDataArraySelection * , const char * , int ) ; const char * GetSelectionArrayName ( vtkDataArraySelection * , int ) ; void DisableAllSelectionArrays ( vtkDataArraySelection * ) ; void EnableAllSelectionArrays ( vtkDataArraySelection * ) ; void AddSelectionNames ( vtkDataArraySelection * , vtkStringArray * ) ;  Print some time information (names, current time-step) void PrintTimes ( std :: ostream & os , vtkIndent indent = vtkIndent ( ) , bool full = false ) const ; } ;
## Error: token expected: ; but got: [identifier]!!!
