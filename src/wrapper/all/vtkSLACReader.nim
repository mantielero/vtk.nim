##  -*- c++ -*-
## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSLACReader.h
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
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkSLACReader
##
##
##
##  A reader for a data format used by Omega3p, Tau3p, and several other tools
##  used at the Standford Linear Accelerator Center (SLAC).  The underlying
##  format uses netCDF to store arrays, but also imposes several conventions
##  to form an unstructured grid of elements.
##
##

## !!!Ignored construct:  # vtkSLACReader_h [NewLine] # vtkSLACReader_h [NewLine] # vtkIONetCDFModule.h  For export macro # vtkMultiBlockDataSetAlgorithm.h [NewLine] # vtkSmartPointer.h  For internal method. [NewLine] class vtkDataArraySelection ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkInformationIntegerKey"
discard "forward decl of vtkInformationObjectBaseKey"
## !!!Ignored construct:  class VTKIONETCDF_EXPORT vtkSLACReader : public vtkMultiBlockDataSetAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkMultiBlockDataSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkMultiBlockDataSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkSLACReader :: IsTypeOf ( type ) ; } static vtkSLACReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkSLACReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkSLACReader * NewInstance ( ) const { return vtkSLACReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMultiBlockDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSLACReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSLACReader :: New ( ) ; } public : ; static vtkSLACReader * New ( ) ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetMeshFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MeshFileName  of  << ( this -> MeshFileName ? this -> MeshFileName : (null) ) ) ; return this -> MeshFileName ; } ; virtual void SetMeshFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << MeshFileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> MeshFileName == nullptr && _arg == nullptr ) { return ; } if ( this -> MeshFileName && _arg && ( ! strcmp ( this -> MeshFileName , _arg ) ) ) { return ; } delete [ ] this -> MeshFileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> MeshFileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> MeshFileName = nullptr ; } this -> Modified ( ) ; } ; /@{ *
##  There may be one mode file (usually for actual modes) or multiple mode
##  files (which usually actually represent time series).  These methods
##  set and clear the list of mode files (which can be a single mode file).
##  virtual void AddModeFileName ( VTK_FILEPATH const char * fname ) ; virtual void RemoveAllModeFileNames ( ) ; virtual unsigned int GetNumberOfModeFileNames ( ) ; virtual VTK_FILEPATH const char * GetModeFileName ( unsigned int idx ) ; /@} /@{ *
##  If on, reads the internal volume of the data set.  Set to off by default.
##  virtual vtkTypeBool GetReadInternalVolume ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReadInternalVolume  of  << this -> ReadInternalVolume ) ; return this -> ReadInternalVolume ; } ; virtual void SetReadInternalVolume ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ReadInternalVolume  to  << _arg ) ; if ( this -> ReadInternalVolume != _arg ) { this -> ReadInternalVolume = _arg ; this -> Modified ( ) ; } } ; virtual void ReadInternalVolumeOn ( ) { this -> SetReadInternalVolume ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ReadInternalVolumeOff ( ) { this -> SetReadInternalVolume ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  If on, reads the external surfaces of the data set.  Set to on by default.
##  virtual vtkTypeBool GetReadInternalVolumeReadExternalSurface ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReadExternalSurface  of  << this -> ReadExternalSurface ) ; return this -> ReadExternalSurface ; } ; virtual void SetReadInternalVolumeReadExternalSurface ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ReadExternalSurface  to  << _arg ) ; if ( this -> ReadExternalSurface != _arg ) { this -> ReadExternalSurface = _arg ; this -> Modified ( ) ; } } ; virtual void ReadExternalSurfaceOn ( ) { this -> SetReadInternalVolumeReadExternalSurface ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ReadExternalSurfaceOff ( ) { this -> SetReadInternalVolumeReadExternalSurface ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  If on, reads midpoint information for external surfaces and builds
##  quadratic surface triangles.  Set to on by default.
##  virtual vtkTypeBool GetReadInternalVolumeReadExternalSurfaceReadMidpoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReadMidpoints  of  << this -> ReadMidpoints ) ; return this -> ReadMidpoints ; } ; virtual void SetReadInternalVolumeReadExternalSurfaceReadMidpoints ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ReadMidpoints  to  << _arg ) ; if ( this -> ReadMidpoints != _arg ) { this -> ReadMidpoints = _arg ; this -> Modified ( ) ; } } ; virtual void ReadMidpointsOn ( ) { this -> SetReadInternalVolumeReadExternalSurfaceReadMidpoints ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ReadMidpointsOff ( ) { this -> SetReadInternalVolumeReadExternalSurfaceReadMidpoints ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Variable array selection.
##  virtual int GetNumberOfVariableArrays ( ) ; virtual const char * GetVariableArrayName ( int index ) ; virtual int GetVariableArrayStatus ( const char * name ) ; virtual void SetVariableArrayStatus ( const char * name , int status ) ; /@} /@{ *
##  Sets the scale factor for each mode. Each scale factor is reset to 1.
##  virtual void ResetFrequencyScales ( ) ; virtual void SetFrequencyScale ( int index , double scale ) ; /@} /@{ *
##  Sets the phase offset for each mode. Each shift is reset to 0.
##  virtual void ResetPhaseShifts ( ) ; virtual void SetPhaseShift ( int index , double shift ) ; /@} /@{ *
##  NOTE: This is not thread-safe.
##  virtual vtkDoubleArray * GetFrequencyScales ( ) ; virtual vtkDoubleArray * GetPhaseShifts ( ) ; /@} *
##  Returns true if the given file can be read by this reader.
##  static int CanReadFile ( VTK_FILEPATH const char * filename ) ; *
##  This key is attached to the metadata information of all data sets in the
##  output that are part of the internal volume.
##  static vtkInformationIntegerKey * IS_INTERNAL_VOLUME ( ) ; *
##  This key is attached to the metadata information of all data sets in the
##  output that are part of the external surface.
##  static vtkInformationIntegerKey * IS_EXTERNAL_SURFACE ( ) ; /@{ *
##  All the data sets stored in the multiblock output share the same point
##  data.  For convenience, the point coordinates (vtkPoints) and point data
##  (vtkPointData) are saved under these keys in the vtkInformation of the
##  output data set.
##  static vtkInformationObjectBaseKey * POINTS ( ) ; static vtkInformationObjectBaseKey * POINT_DATA ( ) ; /@} /@{ *
##  Simple class used internally to define an edge based on the endpoints.  The
##  endpoints are canonically identified by the lower and higher values.
##  class VTKIONETCDF_EXPORT EdgeEndpoints { public : EdgeEndpoints ( ) : MinEndPoint ( - 1 ) , MaxEndPoint ( - 1 ) { } EdgeEndpoints ( vtkIdType endpointA , vtkIdType endpointB ) { if ( endpointA < endpointB ) { this -> MinEndPoint = endpointA ; this -> MaxEndPoint = endpointB ; } else { this -> MinEndPoint = endpointB ; this -> MaxEndPoint = endpointA ; } } inline vtkIdType GetMinEndPoint ( ) const { return this -> MinEndPoint ; } inline vtkIdType GetMaxEndPoint ( ) const { return this -> MaxEndPoint ; } inline bool operator == ( const EdgeEndpoints & other ) const { return ( ( this -> GetMinEndPoint ( ) == other . GetMinEndPoint ( ) ) && ( this -> GetMaxEndPoint ( ) == other . GetMaxEndPoint ( ) ) ) ; } protected : vtkIdType MinEndPoint ; vtkIdType MaxEndPoint ; } ; /@} /@{ *
##  Simple class used internally for holding midpoint information.
##  class VTKIONETCDF_EXPORT MidpointCoordinates { public : MidpointCoordinates ( ) = default ; MidpointCoordinates ( const double coord [ 3 ] , vtkIdType id ) { this -> Coordinate [ 0 ] = coord [ 0 ] ; this -> Coordinate [ 1 ] = coord [ 1 ] ; this -> Coordinate [ 2 ] = coord [ 2 ] ; this -> ID = id ; } double Coordinate [ 3 ] ; vtkIdType ID ; } ; /@} enum { SURFACE_OUTPUT = 0 , VOLUME_OUTPUT = 1 , NUM_OUTPUTS = 2 } ; protected : vtkSLACReader ( ) ; ~ vtkSLACReader ( ) override ; class vtkInternal ; vtkInternal * Internal ;  Friend so vtkInternal can access MidpointIdMap
##  (so Sun CC compiler doesn't complain). friend class vtkInternal ; char * MeshFileName ; vtkTypeBool ReadInternalVolume ; vtkTypeBool ReadExternalSurface ; vtkTypeBool ReadMidpoints ; *
##  True if reading from a proper mode file.  Set in RequestInformation.
##  bool ReadModeData ; *
##  True if "mode" files are a sequence of time steps.
##  bool TimeStepModes ; *
##  True if mode files describe vibrating fields.
##  bool FrequencyModes ; int RequestInformation ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; *
##  Callback registered with the VariableArraySelection.
##  static void SelectionModifiedCallback ( vtkObject * caller , unsigned long eid , void * clientdata , void * calldata ) ; *
##  Convenience function that checks the dimensions of a 2D netCDF array that
##  is supposed to be a set of tuples.  It makes sure that the number of
##  dimensions is expected and that the number of components in each tuple
##  agree with what is expected.  It then returns the number of tuples.  An
##  error is emitted and 0 is returned if the checks fail.
##  virtual vtkIdType GetNumTuplesInVariable ( int ncFD , int varId , int expectedNumComponents ) ; *
##  Checks the winding of the tetrahedra in the mesh file.  Returns 1 if
##  the winding conforms to VTK, 0 if the winding needs to be corrected.
##  virtual int CheckTetrahedraWinding ( int meshFD ) ; *
##  Read the connectivity information from the mesh file.  Returns 1 on
##  success, 0 on failure.
##  virtual int ReadConnectivity ( int meshFD , vtkMultiBlockDataSet * surfaceOutput , vtkMultiBlockDataSet * volumeOutput ) ; /@{ *
##  Reads tetrahedron connectivity arrays.  Called by ReadConnectivity.
##  virtual int ReadTetrahedronInteriorArray ( int meshFD , vtkIdTypeArray * connectivity ) ; virtual int ReadTetrahedronExteriorArray ( int meshFD , vtkIdTypeArray * connectivity ) ; /@} *
##  Reads point data arrays.  Called by ReadCoordinates and ReadFieldData.
##  virtual vtkSmartPointer < vtkDataArray > ReadPointDataArray ( int ncFD , int varId ) ; *
##  Helpful constants equal to the amount of identifiers per tet.
##  enum { NumPerTetInt = 5 , NumPerTetExt = 9 } ; /@{ *
##  Manages a map from edges to midpoint coordinates.
##  class VTKIONETCDF_EXPORT MidpointCoordinateMap { public : MidpointCoordinateMap ( ) ; ~ MidpointCoordinateMap ( ) ; /@} void AddMidpoint ( const EdgeEndpoints & edge , const MidpointCoordinates & midpoint ) ; void RemoveMidpoint ( const EdgeEndpoints & edge ) ; void RemoveAllMidpoints ( ) ; vtkIdType GetNumberOfMidpoints ( ) const ; *
##  Finds the coordinates for the given edge or returns nullptr if it
##  does not exist.
##  MidpointCoordinates * FindMidpoint ( const EdgeEndpoints & edge ) ; protected : class vtkInternal ; vtkInternal * Internal ; private :  Too lazy to implement these. MidpointCoordinateMap ( const MidpointCoordinateMap & ) = delete ; void operator = ( const MidpointCoordinateMap & ) = delete ; } ; /@{ *
##  Manages a map from edges to the point id of the midpoint.
##  class VTKIONETCDF_EXPORT MidpointIdMap { public : MidpointIdMap ( ) ; ~ MidpointIdMap ( ) ; /@} void AddMidpoint ( const EdgeEndpoints & edge , vtkIdType midpoint ) ; void RemoveMidpoint ( const EdgeEndpoints & edge ) ; void RemoveAllMidpoints ( ) ; vtkIdType GetNumberOfMidpoints ( ) const ; *
##  Finds the id for the given edge or returns nullptr if it does not exist.
##  vtkIdType * FindMidpoint ( const EdgeEndpoints & edge ) ; *
##  Initialize iteration.  The iteration can occur in any order.
##  void InitTraversal ( ) ; *
##  Get the next midpoint in the iteration.  Return 0 if the end is reached.
##  bool GetNextMidpoint ( EdgeEndpoints & edge , vtkIdType & midpoint ) ; protected : class vtkInternal ; vtkInternal * Internal ; private :  Too lazy to implement these. MidpointIdMap ( const MidpointIdMap & ) = delete ; void operator = ( const MidpointIdMap & ) = delete ; } ; *
##  Read in the point coordinate data from the mesh file.  Returns 1 on
##  success, 0 on failure.
##  virtual int ReadCoordinates ( int meshFD , vtkMultiBlockDataSet * output ) ; *
##  Reads in the midpoint coordinate data from the mesh file and returns a map
##  from edges to midpoints.  This method is called by ReadMidpointData.
##  Returns 1 on success, 0 on failure.
##  virtual int ReadMidpointCoordinates ( int meshFD , vtkMultiBlockDataSet * output , MidpointCoordinateMap & map ) ; *
##  Read in the midpoint data from the mesh file.  Returns 1 on success,
##  0 on failure.  Also fills a midpoint id map that will be passed into
##  InterpolateMidpointFieldData.
##  virtual int ReadMidpointData ( int meshFD , vtkMultiBlockDataSet * output , MidpointIdMap & midpointIds ) ; *
##  Instead of reading data from the mesh file, restore the data from the
##  previous mesh file read.
##  virtual int RestoreMeshCache ( vtkMultiBlockDataSet * surfaceOutput , vtkMultiBlockDataSet * volumeOutput , vtkMultiBlockDataSet * compositeOutput ) ; *
##  Read in the field data from the mode file.  Returns 1 on success, 0
##  on failure.
##  virtual int ReadFieldData ( const int * modeFDArray , int numModeFDs , vtkMultiBlockDataSet * output ) ; *
##  Takes the data read on the fields and interpolates data for the midpoints.
##  map is the same map that was created in ReadMidpointData.
##  virtual int InterpolateMidpointData ( vtkMultiBlockDataSet * output , MidpointIdMap & map ) ; *
##  A time stamp for the last time the mesh file was read.  This is used to
##  determine whether the mesh needs to be read in again or if we just need
##  to read the mode data.
##  vtkTimeStamp MeshReadTime ; *
##  Returns 1 if the mesh is up to date, 0 if the mesh needs to be read from
##  disk.
##  virtual int MeshUpToDate ( ) ; private : vtkSLACReader ( const vtkSLACReader & ) = delete ; void operator = ( const vtkSLACReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
