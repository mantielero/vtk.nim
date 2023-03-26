## =========================================================================
##
##  Program:   Visualization Toolkit
##  Module:    vtkPStructuredGridConnectivity.h
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
##  @class   vtkPStructuredGridConnectivity
##
##
##   vtkPStructuredGridConnectivity inherits from vtkStructuredGridConnectivity
##   and implements functionality to compute the neighboring topology within a
##   single, partitioned and distributed structured grid dataset.
##
##  @warning
##   Initialize(), ComputeNeighbors() and CreateGhostLayers() are collective
##   operations, every process must call that method.
##
##  @sa
##   vtkStructuredGridConnectivity
##

## !!!Ignored construct:  # vtkPStructuredGridConnectivity_h [NewLine] # vtkPStructuredGridConnectivity_h [NewLine]  VTK include directives # vtkFiltersParallelGeometryModule.h  For export macro # vtkMPICommunicator.h  Needed for vtkMPICommunicator::Request # vtkStructuredGridConnectivity.h [NewLine]  C++ include directives # < vector >  For STL vector [NewLine]  Forward declarations class vtkMultiProcessController ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkMPIController"
discard "forward decl of vtkMultiProcessStream"
## !!!Ignored construct:  class VTKFILTERSPARALLELGEOMETRY_EXPORT vtkPStructuredGridConnectivity : public vtkStructuredGridConnectivity { public : static vtkPStructuredGridConnectivity * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkStructuredGridConnectivity Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkStructuredGridConnectivity :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPStructuredGridConnectivity :: IsTypeOf ( type ) ; } static vtkPStructuredGridConnectivity * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPStructuredGridConnectivity * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPStructuredGridConnectivity * NewInstance ( ) const { return vtkPStructuredGridConnectivity :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkStructuredGridConnectivity :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPStructuredGridConnectivity :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPStructuredGridConnectivity :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set & Get the process controller
##  virtual void SetController ( vtkMultiProcessController * ) ; virtual vtkMultiProcessController * GetnameController ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Controller  address  << static_cast < vtkMultiProcessController * > ( this -> Controller ) ) ; return this -> Controller ; } ; /@} *
##  Sets the total number of domains distributed among processors
##  void SetNumberOfGrids ( const unsigned int N ) override ; *
##  See vtkStructuredGridConnectivity::RegisterGrid
##  void RegisterGrid ( const int gridID , int extents [ 6 ] , vtkUnsignedCharArray * nodesGhostArray , vtkUnsignedCharArray * cellGhostArray , vtkPointData * pointData , vtkCellData * cellData , vtkPoints * gridNodes ) override ; *
##  Returns the number of local grids registers by the process that owns
##  the current vtkPStructuredGridConnectivity instance
##  int GetNumberOfLocalGrids ( ) { return static_cast < int > ( this -> GridIds . size ( ) ) ; } *
##  Returns the rank of the given gridID. A nominal value of -1 for the
##  return value of this method indicates that possibly ComputeNeighbors
##  has not been called and consequently the GridRanks vector has not been
##  populated yet.
##  int GetGridRank ( const int gridID ) ; *
##  Returns true iff the grid is remote, otherwise false.
##  bool IsGridRemote ( const int gridID ) ; *
##  Returns true iff the grid corresponding to the given gridID is local.
##  bool IsGridLocal ( const int gridID ) ; *
##  Initializes this instance of vtkPStructuredGridConnectivity, essentially,
##  the acquires the local process ID from the registered controller. If a
##  controller is not registered, the global controller is set.
##  void Initialize ( ) ; *
##  Computes the neighboring topology of a distributed structured grid
##  data-set.
##  See vtkStructuredGridConnectivity::ComputeNeighbors
##  void ComputeNeighbors ( ) override ; *
##  Creates ghost layers on the grids owned by this process using data from
##  both local and remote block neighbors.
##  void CreateGhostLayers ( const int N = 1 ) override ; protected : vtkPStructuredGridConnectivity ( ) ; ~ vtkPStructuredGridConnectivity ( ) override ; vtkMultiProcessController * Controller ; int Rank ; bool Initialized ; std :: vector < int > GridRanks ;  Corresponding rank for each grid std :: vector < int > GridIds ;  List of GridIds, owned by this process  Data structures to store the remote ghost data of each grid for each one
##  of its neighbors. The first index is the global grid index. The second
##  is the neighbor index. std :: vector < std :: vector < vtkPoints * >> RemotePoints ; std :: vector < std :: vector < vtkPointData * >> RemotePointData ; std :: vector < std :: vector < vtkCellData * >> RemoteCellData ;  Data structures to store the send/receive buffer sizes and corresponding
##  persistent buffers. The first index is the global grid index. The second
##  index is the neighbor index for the given grid. std :: vector < std :: vector < unsigned int >> SendBufferSizes ; std :: vector < std :: vector < unsigned int >> RcvBufferSizes ; std :: vector < std :: vector < unsigned char * >> SendBuffers ; std :: vector < std :: vector < unsigned char * >> RcvBuffers ; int TotalNumberOfSends ; int TotalNumberOfRcvs ; int TotalNumberOfMsgs ;  Array of MPI requests vtkMPICommunicator :: Request * MPIRequests ; *
##  Returns true if the two extents are equal, otherwise false.
##  bool GridExtentsAreEqual ( int rhs [ 6 ] , int lhs [ 6 ] ) ; *
##  Returns true iff the grid corresponding to the given ID has point data.
##  bool HasPointData ( const int gridIdx ) ; *
##  Returns true iff the grid corresponding to the given ID has cell data.
##  bool HasCellData ( const int gridIdx ) ; *
##  Returns true iff the grid corresponding to the given ID has points.
##  bool HasPoints ( const int gridIdx ) ; *
##  Sets all message counters to 0.
##  void InitializeMessageCounters ( ) ; *
##  Clears all internal VTK data-structures that are used to store the remote
##  ghost data.
##  void ClearRemoteData ( ) ; *
##  Clears all raw send/rcv buffers
##  void ClearRawBuffers ( ) ; *
##  Registers a remote grid with the given grid Id, structured extents and
##  process.
##  void RegisterRemoteGrid ( const int gridID , int extents [ 6 ] , int process ) ; *
##  This method transfers all the remote neighbor data to the ghosted grid
##  instance of the grid corresponding to the given grid index.
##  void TransferRemoteNeighborData ( const int gridIdx , const int nei , const vtkStructuredNeighbor & Neighbor ) ; *
##  This method transfers the fields (point data and cell data) to the ghost
##  extents from the neighboring grids of the grid corresponding to the given
##  gridID.
##  void TransferGhostDataFromNeighbors ( const int gridID ) override ; *
##  Helper method to pack all the ghost data into send buffers.
##  void PackGhostData ( ) ; *
##  Helper method to unpack the raw ghost data from the receive buffers in
##  to the VTK remote point data-structures.
##  void UnpackGhostData ( ) ; *
##  Helper method to deserialize the buffer sizes coming from the given
##  process.
##  void DeserializeBufferSizesForProcess ( int * buffersizes , vtkIdType N , const int processId ) ; *
##  Helper method to serialize the buffer sizes for the grids of this process
##  to neighboring grids.
##  void SerializeBufferSizes ( int * & sizesbuf , vtkIdType & N ) ; *
##  Helper method to exchange buffer sizes.Each process sends the send buffer
##  size of each grid to each of its neighbors.
##  void ExchangeBufferSizes ( ) ; *
##  Helper method for exchanging ghost data. It loops through all the grids,
##  and for each neighbor it constructs the corresponding send buffer.
##  size and posts a non-blocking receive.
##  void ExchangeGhostDataInit ( ) ; *
##  Helper method to communicate ghost data. Loops through all the neighbors
##  and for every remote neighbor posts a non-blocking receive.
##  void PostReceives ( ) ; *
##  Helper method to communicate ghost data. Loops through the neighbors and
##  for every remote neighbor posts a non-blocking send.
##  void PostSends ( ) ; *
##  Helper method for exchanging ghost data. It loops through all the grids
##  and for each neighbor of each grid it serializes the data in the send
##  extent and posts a non-blocking send.
##  void CommunicateGhostData ( ) ; *
##  Helper method for exchanging ghost data. It blocks until all requests
##  are complete (via a waitAll) and then de-serializes the receive buffers
##  to form the corresponding remote data-structures.
##  void ExchangeGhostDataPost ( ) ; *
##  Exchanges ghost data of the grids owned by this process.
##  void ExchangeGhostData ( ) ; *
##  Helper method to serialize the ghost points to send to a remote process.
##  Called from SerializeGhostData.
##  void SerializeGhostPoints ( const int gridIdx , int ext [ 6 ] , vtkMultiProcessStream & bytestream ) ; *
##  Serializes the data array into a bytestream.
##  void SerializeDataArray ( vtkDataArray * dataArray , vtkMultiProcessStream & bytestream ) ; *
##  Helper method to serialize field data. Called from
##  SerializeGhostPointData and SerializeGhostCellData.
##  void SerializeFieldData ( int sourceExtent [ 6 ] , int targetExtent [ 6 ] , vtkFieldData * fieldData , vtkMultiProcessStream & bytestream ) ; *
##  Helper method to serialize ghost point data. Called from
##  SerializeGhostData.
##  void SerializeGhostPointData ( const int gridIdx , int ext [ 6 ] , vtkMultiProcessStream & bytestream ) ; *
##  Helper method to serialize ghost cell data. Called from
##  SerializeGhostData.
##  void SerializeGhostCellData ( const int gridIdx , int ext [ 6 ] , vtkMultiProcessStream & bytestream ) ; *
##  Helper method to de-serialize the ghost points received from a remote
##  process. Called from DeserializeGhostData.
##  void DeserializeGhostPoints ( const int gridIdx , const int nei , int ext [ 6 ] , vtkMultiProcessStream & bytestream ) ; *
##  Helper method to deserialize the data array from a bytestream.
##  void DeserializeDataArray ( vtkDataArray * & dataArray , const int dataType , const int numberOfTuples , const int numberOfComponents , vtkMultiProcessStream & bytestream ) ; *
##  Helper method to de-serialize field data. Called from
##  DeserializeGhostPointData and DeserializeGhostCellData.
##  void DeserializeFieldData ( int ext [ 6 ] , vtkFieldData * fieldData , vtkMultiProcessStream & bytestream ) ; *
##  Helper method to de-serialize the ghost point data received from a
##  remote process. Called from DeserializeGhostData.
##  void DeserializeGhostPointData ( const int gridIdx , const int nei , int ext [ 6 ] , vtkMultiProcessStream & bytestream ) ; *
##  Helper method to de-serialize the ghost cell data received from a remote
##  process. Called from DeserializeGhostCellData.
##  void DeserializeGhostCellData ( const int gridIdx , const int nei , int ext [ 6 ] , vtkMultiProcessStream & bytestream ) ; *
##  Given a grid ID and the corresponding send extent, this method serializes
##  the grid and data within the given extent. Upon return, the buffer is
##  allocated and contains the data in raw form, ready to be sent. Called
##  from vtkPStructuredGridConnectivity::PackGhostData().
##  void SerializeGhostData ( const int sndGridID , const int rcvGrid , int sndext [ 6 ] , unsigned char * & buffer , unsigned int & size ) ; *
##  Given the raw buffer consisting of ghost data, this method deserializes
##  the object and returns the gridID and rcvext of the grid.
##  void DeserializeGhostData ( const int gridID , const int neiListID , const int neiGridIdx , int rcvext [ 6 ] , unsigned char * buffer , unsigned int size ) ; *
##  Exchanges the grid extents among all processes and fully populates the
##  GridExtents vector.
##  void ExchangeGridExtents ( ) ; *
##  Serializes the grid extents and information in a buffer to send over MPI
##  The data is serialized as follows: ID imin imax jmin jmax kmin kmax
##  void SerializeGridExtents ( int * & sndbuffer , vtkIdType & N ) ; *
##  Deserializes the received grid extent information to the GridExtents
##  internal data-structures.
##  void DeserializeGridExtentForProcess ( int * rcvbuffer , vtkIdType & N , const int processId ) ; private : vtkPStructuredGridConnectivity ( const vtkPStructuredGridConnectivity & ) = delete ; void operator = ( const vtkPStructuredGridConnectivity & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## =============================================================================
##   INLINE METHODS
## =============================================================================

proc GridExtentsAreEqual*(rhs: array[6, cint]; lhs: array[6, cint]): bool {.
    importcpp: "VTKFILTERSPARALLELGEOMETRY_EXPORT::GridExtentsAreEqual(@)",
    header: "vtkPStructuredGridConnectivity.h".}
## ------------------------------------------------------------------------------

proc HasPointData*(gridIdx: cint): bool {.importcpp: "VTKFILTERSPARALLELGEOMETRY_EXPORT::HasPointData(@)", header: "vtkPStructuredGridConnectivity.h".}
## ------------------------------------------------------------------------------

proc HasCellData*(gridIdx: cint): bool {.importcpp: "VTKFILTERSPARALLELGEOMETRY_EXPORT::HasCellData(@)",
                                     header: "vtkPStructuredGridConnectivity.h".}
## ------------------------------------------------------------------------------

proc HasPoints*(gridIdx: cint): bool {.importcpp: "VTKFILTERSPARALLELGEOMETRY_EXPORT::HasPoints(@)",
                                   header: "vtkPStructuredGridConnectivity.h".}
## ------------------------------------------------------------------------------

proc InitializeMessageCounters*() {.importcpp: "VTKFILTERSPARALLELGEOMETRY_EXPORT::InitializeMessageCounters(@)",
                                  header: "vtkPStructuredGridConnectivity.h".}
## ------------------------------------------------------------------------------

proc ClearRawBuffers*() {.importcpp: "VTKFILTERSPARALLELGEOMETRY_EXPORT::ClearRawBuffers(@)",
                        header: "vtkPStructuredGridConnectivity.h".}
## ------------------------------------------------------------------------------

proc ClearRemoteData*() {.importcpp: "VTKFILTERSPARALLELGEOMETRY_EXPORT::ClearRemoteData(@)",
                        header: "vtkPStructuredGridConnectivity.h".}
## ------------------------------------------------------------------------------

proc IsGridRemote*(gridID: cint): bool {.importcpp: "VTKFILTERSPARALLELGEOMETRY_EXPORT::IsGridRemote(@)",
                                     header: "vtkPStructuredGridConnectivity.h".}
## ------------------------------------------------------------------------------

proc IsGridLocal*(gridID: cint): bool {.importcpp: "VTKFILTERSPARALLELGEOMETRY_EXPORT::IsGridLocal(@)",
                                    header: "vtkPStructuredGridConnectivity.h".}
## ------------------------------------------------------------------------------

proc GetGridRank*(gridID: cint): cint {.importcpp: "VTKFILTERSPARALLELGEOMETRY_EXPORT::GetGridRank(@)",
                                    header: "vtkPStructuredGridConnectivity.h".}