## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkParticleTracerBase.h
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
##  @class   vtkParticleTracerBase
##  @brief   A particle tracer for vector fields
##
##  vtkParticleTracerBase is the base class for filters that advect particles
##  in a vector field. Note that the input vtkPointData structure must
##  be identical on all datasets.
##
##  @sa
##  vtkRibbonFilter vtkRuledSurfaceFilter vtkInitialValueProblemSolver
##  vtkRungeKutta2 vtkRungeKutta4 vtkRungeKutta45 vtkStreamTracer
##

## !!!Ignored construct:  # vtkParticleTracerBase_h [NewLine] # vtkParticleTracerBase_h [NewLine] # vtkDeprecation.h  For VTK_DEPRECATED_IN_9_2_0 # vtkFiltersFlowPathsModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] # vtkSmartPointer.h  For vtkSmartPointer [NewLine] # < list >  STL Header # < mutex >  STL Header # < vector >  STL Header [NewLine] class vtkAbstractParticleWriter ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkCellArray"
discard "forward decl of vtkCompositeDataSet"
discard "forward decl of vtkDataArray"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkFloatArray"
discard "forward decl of vtkGenericCell"
discard "forward decl of vtkInitialValueProblemSolver"
discard "forward decl of vtkIntArray"
discard "forward decl of vtkMultiBlockDataSet"
discard "forward decl of vtkMultiProcessController"
discard "forward decl of vtkPointData"
discard "forward decl of vtkPoints"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkSignedCharArray"
discard "forward decl of vtkTemporalInterpolatedVelocityField"
type
  VTKFILTERSFLOWPATHS_EXPORTPosition_t* {.importcpp: "vtkParticleTracerBaseNamespace::VTKFILTERSFLOWPATHS_EXPORT::Position_t",
      header: "vtkParticleTracerBase.h", bycopy.} = object
    x* {.importc: "x".}: array[4, cdouble]

  Position* = VTKFILTERSFLOWPATHS_EXPORTPosition_t

## ignored statement

type
  VTKFILTERSFLOWPATHS_EXPORTParticleInformation_t* {.importcpp: "vtkParticleTracerBaseNamespace::VTKFILTERSFLOWPATHS_EXPORT::ParticleInformation_t",
      header: "vtkParticleTracerBase.h", bycopy.} = object ##  These are used during iteration
    CurrentPosition* {.importc: "CurrentPosition".}: Position
    CachedDataSetId* {.importc: "CachedDataSetId".}: array[2, cint]
    CachedCellId* {.importc: "CachedCellId".}: array[2, vtkIdType]
    LocationState* {.importc: "LocationState".}: cint ##  These are computed scalars we might display
    SourceID* {.importc: "SourceID".}: cint
    TimeStepAge* {.importc: "TimeStepAge".}: cint ##  amount of time steps the particle has advanced
    InjectedPointId* {.importc: "InjectedPointId".}: cint
    InjectedStepId* {.importc: "InjectedStepId".}: cint ##  time step the particle was injected
    UniqueParticleId* {.importc: "UniqueParticleId".}: cint
    SimulationTime* {.importc: "SimulationTime".}: cdouble ##  These are useful to track for debugging etc
    ErrorCode* {.importc: "ErrorCode".}: cint
    age* {.importc: "age".}: cfloat ##  these are needed across time steps to compute vorticity
    rotation* {.importc: "rotation".}: cfloat
    angularVel* {.importc: "angularVel".}: cfloat
    time* {.importc: "time".}: cfloat
    speed* {.importc: "speed".}: cfloat ##  once the particle is added, PointId is valid and is the tuple location
                                    ##  in ProtoPD.
    PointId* {.importc: "PointId".}: vtkIdType ##  if PointId is negative then in parallel this particle was just
                                           ##  received and we need to get the tuple value from vtkPParticleTracerBase::Tail.
    TailPointId* {.importc: "TailPointId".}: vtkIdType

  ParticleInformation* = VTKFILTERSFLOWPATHS_EXPORTParticleInformation_t

## ignored statement

type
  VTKFILTERSFLOWPATHS_EXPORTParticleVector* = vector[ParticleInformation]
  VTKFILTERSFLOWPATHS_EXPORTParticleIterator* = `iterator`
  VTKFILTERSFLOWPATHS_EXPORTParticleDataList* = list[ParticleInformation]
  VTKFILTERSFLOWPATHS_EXPORTParticleListIterator* = `iterator`

discard "forward decl of ParticleTracerFunctor"
## ignored statement

## !!!Ignored construct:  class VTKFILTERSFLOWPATHS_EXPORT vtkParticleTracerBase : public vtkPolyDataAlgorithm { public : friend struct vtkParticleTracerBaseNamespace :: ParticleTracerFunctor ; enum Solvers { RUNGE_KUTTA2 , RUNGE_KUTTA4 , RUNGE_KUTTA45 , NONE , UNKNOWN } ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkParticleTracerBase :: IsTypeOf ( type ) ; } static vtkParticleTracerBase * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkParticleTracerBase * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkParticleTracerBase * NewInstance ( ) const { return vtkParticleTracerBase :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkParticleTracerBase :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkParticleTracerBase :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; void PrintParticleHistories ( ) ; /@{ *
##  Turn on/off vorticity computation at streamline points
##  (necessary for generating proper stream-ribbons using the
##  vtkRibbonFilter.
##  virtual bool GetComputeVorticity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeVorticity  of  << this -> ComputeVorticity ) ; return this -> ComputeVorticity ; } ; void SetComputeVorticity ( bool ) ; /@} /@{ *
##  Specify the terminal speed value, below which integration is terminated.
##  virtual double GetComputeVorticityTerminalSpeed ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TerminalSpeed  of  << this -> TerminalSpeed ) ; return this -> TerminalSpeed ; } ; void SetTerminalSpeed ( double ) ; /@} /@{ *
##  This can be used to scale the rate with which the streamribbons
##  twist. The default is 1.
##  virtual double GetComputeVorticityTerminalSpeedRotationScale ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RotationScale  of  << this -> RotationScale ) ; return this -> RotationScale ; } ; void SetRotationScale ( double ) ; /@} /@{ *
##  To get around problems with the Paraview Animation controls
##  we can just animate the time step and ignore the TIME_ requests
##  virtual void SetIgnorePipelineTime ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  IgnorePipelineTime  to  << _arg ) ; if ( this -> IgnorePipelineTime != _arg ) { this -> IgnorePipelineTime = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetComputeVorticityTerminalSpeedRotationScaleIgnorePipelineTime ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IgnorePipelineTime  of  << this -> IgnorePipelineTime ) ; return this -> IgnorePipelineTime ; } ; virtual void IgnorePipelineTimeOn ( ) { this -> SetIgnorePipelineTime ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void IgnorePipelineTimeOff ( ) { this -> SetIgnorePipelineTime ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  When animating particles, it is nice to inject new ones every Nth step
##  to produce a continuous flow. Setting ForceReinjectionEveryNSteps to a
##  non zero value will cause the particle source to reinject particles
##  every Nth step even if it is otherwise unchanged.
##  Note that if the particle source is also animated, this flag will be
##  redundant as the particles will be reinjected whenever the source changes
##  anyway
##  virtual vtkTypeBool GetComputeVorticityTerminalSpeedRotationScaleIgnorePipelineTimeForceReinjectionEveryNSteps ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ForceReinjectionEveryNSteps  of  << this -> ForceReinjectionEveryNSteps ) ; return this -> ForceReinjectionEveryNSteps ; } ; void SetForceReinjectionEveryNSteps ( vtkTypeBool ) ; /@} /@{ *
##  Setting TerminationTime to a positive value will cause particles
##  to terminate when the time is reached. Use a vlue of zero to
##  disable termination. The units of time should be consistent with the
##  primary time variable.
##  void SetTerminationTime ( double t ) ; virtual double GetComputeVorticityTerminalSpeedRotationScaleIgnorePipelineTimeForceReinjectionEveryNStepsTerminationTime ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TerminationTime  of  << this -> TerminationTime ) ; return this -> TerminationTime ; } ; /@} void SetIntegrator ( vtkInitialValueProblemSolver * ) ; virtual vtkInitialValueProblemSolver * GetnameIntegrator ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Integrator  address  << static_cast < vtkInitialValueProblemSolver * > ( this -> Integrator ) ) ; return this -> Integrator ; } ; void SetIntegratorType ( int type ) ; int GetIntegratorType ( ) ; /@{ *
##  Set the time value for particle tracing to begin. The units of time should
##  be consistent with the primary time variable.
##  virtual double GetComputeVorticityTerminalSpeedRotationScaleIgnorePipelineTimeForceReinjectionEveryNStepsTerminationTimeStartTime ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << StartTime  of  << this -> StartTime ) ; return this -> StartTime ; } ; void SetStartTime ( double t ) ; /@} /@{ *
##  if StaticSeeds is set and the mesh is static,
##  then every time particles are injected we can re-use the same
##  injection information. We classify particles according to
##  processor just once before start.
##  If StaticSeeds is set and a moving seed source is specified
##  the motion will be ignored and results will not be as expected.
##  The default is that StaticSeeds is 0.
##  virtual void SetIgnorePipelineTimeStaticSeeds ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  StaticSeeds  to  << _arg ) ; if ( this -> StaticSeeds != _arg ) { this -> StaticSeeds = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetComputeVorticityTerminalSpeedRotationScaleIgnorePipelineTimeForceReinjectionEveryNStepsTerminationTimeStartTimeStaticSeeds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << StaticSeeds  of  << this -> StaticSeeds ) ; return this -> StaticSeeds ; } ; /@} *
##  Types of Variance of Mesh over time
##  enum MeshOverTimeTypes { DIFFERENT = 0 , STATIC = 1 , LINEAR_TRANSFORMATION = 2 , SAME_TOPOLOGY = 3 } ; /@{
##  Set/Get the type of variance of the mesh over time.
##
##  DIFFERENT = 0,
##  STATIC = 1,
##  LINEAR_TRANSFORMATION = 2
##  SAME_TOPOLOGY = 3
##  virtual void SetMeshOverTime ( int meshOverTime ) ; virtual int GetMeshOverTimeMinValue ( ) { return DIFFERENT ; } virtual int GetMeshOverTimeMaxValue ( ) { return SAME_TOPOLOGY ; } void SetMeshOverTimeToDifferent ( ) { this -> SetMeshOverTime ( DIFFERENT ) ; } void SetMeshOverTimeToStatic ( ) { this -> SetMeshOverTime ( STATIC ) ; } void SetMeshOverTimeToLinearTransformation ( ) { this -> SetMeshOverTime ( LINEAR_TRANSFORMATION ) ; } void SetMeshOverTimeToSameTopology ( ) { this -> SetMeshOverTime ( SAME_TOPOLOGY ) ; } virtual int GetComputeVorticityTerminalSpeedRotationScaleIgnorePipelineTimeForceReinjectionEveryNStepsTerminationTimeStartTimeStaticSeedsMeshOverTime ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MeshOverTime  of  << this -> MeshOverTime ) ; return this -> MeshOverTime ; } ; /@} /@{ *
##  if StaticMesh is set, many optimizations for cell caching
##  can be assumed. if StaticMesh is not set, the algorithm
##  will attempt to find out if optimizations can be used, but
##  setting it to true will force all optimizations.
##  Do not Set StaticMesh to true if a dynamic mesh is being used
##  as this will invalidate all results.
##  The default is that StaticMesh is 0.
##  VTK_DEPRECATED_IN_9_2_0 ( Use SetMeshOverTime instead ) virtual void SetStaticMesh ( vtkTypeBool staticMesh ) { this -> SetMeshOverTime ( staticMesh ? STATIC : DIFFERENT ) ; } VTK_DEPRECATED_IN_9_2_0 ( Use GetMeshOverTime instead ) virtual vtkTypeBool GetStaticMesh ( ) { return this -> MeshOverTime == STATIC ; } /@} enum { INTERPOLATOR_WITH_DATASET_POINT_LOCATOR , INTERPOLATOR_WITH_CELL_LOCATOR } ; *
##  Set the type of the velocity field interpolator to determine whether
##  INTERPOLATOR_WITH_DATASET_POINT_LOCATOR or INTERPOLATOR_WITH_CELL_LOCATOR
##  is employed for locating cells during streamline integration. The latter
##  (adopting vtkAbstractCellLocator sub-classes such as vtkCellLocator and
##  vtkModifiedBSPTree) is more robust than the former (through vtkDataSet /
##  vtkPointSet::FindCell() coupled with vtkPointLocator). However the former
##  can be much faster and produce adequate results.
##
##  Default is INTERPOLATOR_WITH_CELL_LOCATOR (to maintain backwards compatibility).
##  void SetInterpolatorType ( int interpolatorType ) ; *
##  Set the velocity field interpolator type to one that uses a point
##  locator to perform local spatial searching. Typically a point locator is
##  faster than searches with a cell locator, but it may not always find the
##  correct cells enclosing a point. This is particularly true with meshes
##  that are disjoint at seams, or abut meshes in an incompatible manner.
##  void SetInterpolatorTypeToDataSetPointLocator ( ) ; *
##  Set the velocity field interpolator type to one that uses a cell locator
##  to perform spatial searching. Using a cell locator should always return
##  the correct results, but it can be much slower that point locator-based
##  searches. * By default a cell locator is used.
##  void SetInterpolatorTypeToCellLocator ( ) ; /@{ *
##  Set/Get the Writer associated with this Particle Tracer
##  Ideally a parallel IO capable vtkH5PartWriter should be used
##  which will collect particles from all parallel processes
##  and write them to a single HDF5 file.
##  virtual void SetParticleWriter ( vtkAbstractParticleWriter * pw ) ; virtual vtkAbstractParticleWriter * GetnameIntegratorParticleWriter ( ) { vtkDebugWithObjectMacro ( this , <<  returning  ParticleWriter  address  << static_cast < vtkAbstractParticleWriter * > ( this -> ParticleWriter ) ) ; return this -> ParticleWriter ; } ; /@} /@{ *
##  Set/Get the filename to be used with the particle writer when
##  dumping particles to disk
##  virtual void SetParticleFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ParticleFileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> ParticleFileName == nullptr && _arg == nullptr ) { return ; } if ( this -> ParticleFileName && _arg && ( ! strcmp ( this -> ParticleFileName , _arg ) ) ) { return ; } delete [ ] this -> ParticleFileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> ParticleFileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> ParticleFileName = nullptr ; } this -> Modified ( ) ; } ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetParticleFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ParticleFileName  of  << ( this -> ParticleFileName ? this -> ParticleFileName : (null) ) ) ; return this -> ParticleFileName ; } ; /@} /@{ *
##  Set/Get the filename to be used with the particle writer when
##  dumping particles to disk
##  virtual void SetIgnorePipelineTimeStaticSeedsEnableParticleWriting ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  EnableParticleWriting  to  << _arg ) ; if ( this -> EnableParticleWriting != _arg ) { this -> EnableParticleWriting = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetComputeVorticityTerminalSpeedRotationScaleIgnorePipelineTimeForceReinjectionEveryNStepsTerminationTimeStartTimeStaticSeedsMeshOverTimeEnableParticleWriting ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EnableParticleWriting  of  << this -> EnableParticleWriting ) ; return this -> EnableParticleWriting ; } ; virtual void EnableParticleWritingOn ( ) { this -> SetIgnorePipelineTimeEnableParticleWriting ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void EnableParticleWritingOff ( ) { this -> SetIgnorePipelineTimeEnableParticleWriting ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the flag to disable cache
##  This is off by default and turned on in special circumstances
##  such as in a coprocessing workflow
##  virtual void SetIgnorePipelineTimeStaticSeedsEnableParticleWritingDisableResetCache ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  DisableResetCache  to  << _arg ) ; if ( this -> DisableResetCache != _arg ) { this -> DisableResetCache = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetComputeVorticityTerminalSpeedRotationScaleIgnorePipelineTimeForceReinjectionEveryNStepsTerminationTimeStartTimeStaticSeedsMeshOverTimeEnableParticleWritingDisableResetCache ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DisableResetCache  of  << this -> DisableResetCache ) ; return this -> DisableResetCache ; } ; virtual void DisableResetCacheOn ( ) { this -> SetIgnorePipelineTimeEnableParticleWritingDisableResetCache ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void DisableResetCacheOff ( ) { this -> SetIgnorePipelineTimeEnableParticleWritingDisableResetCache ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Provide support for multiple seed sources
##  void AddSourceConnection ( vtkAlgorithmOutput * input ) ; void RemoveAllSources ( ) ; /@} /@{ *
##  Force the filter to run particle tracer in serial. This affects
##  the filter only if more than 100 particles is to be generated.
##  virtual bool GetComputeVorticityTerminalSpeedRotationScaleIgnorePipelineTimeForceReinjectionEveryNStepsTerminationTimeStartTimeStaticSeedsMeshOverTimeEnableParticleWritingDisableResetCacheForceSerialExecution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ForceSerialExecution  of  << this -> ForceSerialExecution ) ; return this -> ForceSerialExecution ; } ; virtual void SetIgnorePipelineTimeStaticSeedsEnableParticleWritingDisableResetCacheForceSerialExecution ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ForceSerialExecution  to  << _arg ) ; if ( this -> ForceSerialExecution != _arg ) { this -> ForceSerialExecution = _arg ; this -> Modified ( ) ; } } ; virtual void ForceSerialExecutionOn ( ) { this -> SetIgnorePipelineTimeEnableParticleWritingDisableResetCacheForceSerialExecution ( static_cast < bool > ( 1 ) ) ; } virtual void ForceSerialExecutionOff ( ) { this -> SetIgnorePipelineTimeEnableParticleWritingDisableResetCacheForceSerialExecution ( static_cast < bool > ( 0 ) ) ; } ; /@} protected : vtkSmartPointer < vtkPolyData > Output ;  managed by child classes /@{ *
##  ProtoPD is used just to keep track of the input array names and number of components
##  for copy allocating from other vtkPointDatas where the data is really stored
##  vtkSmartPointer < vtkPointData > ProtoPD ; vtkIdType UniqueIdCounter ;  global Id counter used to give particles a stamp vtkParticleTracerBaseNamespace :: ParticleDataList ParticleHistories ; vtkSmartPointer < vtkPointData > ParticlePointData ;  the current particle point data consistent
##  with particle history  Everything related to time vtkTypeBool IgnorePipelineTime ;  whether to use the pipeline time for termination vtkTypeBool DisableResetCache ;  whether to enable ResetCache() method /@}  Control execution as serial or threaded bool ForceSerialExecution ; vtkParticleTracerBase ( ) ; ~ vtkParticleTracerBase ( ) override ;
##  Make sure the pipeline knows what type we expect as input
##  int FillInputPortInformation ( int port , vtkInformation * info ) override ;
##  The usual suspects
##  vtkTypeBool ProcessRequest ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ;
##  Store any information we need in the output and fetch what we can
##  from the input
##  int RequestInformation ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ;
##  Compute input time steps given the output step
##  int RequestUpdateExtent ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ;
##  what the pipeline calls for each time step
##  int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ;
##  these routines are internally called to actually generate the output
##  virtual int ProcessInput ( vtkInformationVector * * inputVector ) ;  This is the main part of the algorithm:
##   * move all the particles one step
##   * Reinject particles (by adding them to this->ParticleHistories)
##     either at the beginning or at the end of each step (modulo
##     this->ForceReinjectionEveryNSteps)
##   * Output a polydata representing the moved particles
##  Note that if the starting and the ending time coincide, the polydata is still valid. virtual vtkPolyData * Execute ( vtkInformationVector * * inputVector ) ;  the RequestData will call these methods in turn virtual void Initialize ( ) { }  the first iteration virtual int OutputParticles ( vtkPolyData * poly ) = 0 ;  every iteration virtual void Finalize ( ) { }  the last iteration *
##  Method to get the data set seed sources.
##  For in situ we want to override how the seed sources are made available.
##  virtual std :: vector < vtkDataSet * > GetSeedSources ( vtkInformationVector * inputVector , int timeStep ) ;  Initialization of input (vector-field) geometry int InitializeInterpolator ( ) ; int UpdateDataCache ( vtkDataObject * td ) ; *
##  inside our data. Add good ones to passed list and set count to the
##  number that passed
##  void TestParticles ( vtkParticleTracerBaseNamespace :: ParticleVector & candidates , vtkParticleTracerBaseNamespace :: ParticleVector & passed , int & count ) ; void TestParticles ( vtkParticleTracerBaseNamespace :: ParticleVector & candidates , std :: vector < int > & passed ) ; *
##  all the injection/seed points according to which processor
##  they belong to. This saves us retesting at every injection time
##  providing 1) The volumes are static, 2) the seed points are static
##  If either are non static, then this step is skipped.
##  virtual void AssignSeedsToProcessors ( double time , vtkDataSet * source , int sourceID , int ptId , vtkParticleTracerBaseNamespace :: ParticleVector & localSeedPoints , int & localAssignedCount ) ; *
##  give each one a unique ID. We need to use MPI to find out
##  who is using which numbers.
##  virtual void AssignUniqueIds ( vtkParticleTracerBaseNamespace :: ParticleVector & localSeedPoints ) ; *
##  and sending between processors, into a list, which is used as the master
##  list on this processor
##  void UpdateParticleList ( vtkParticleTracerBaseNamespace :: ParticleVector & candidates ) ; *
##  this is used during classification of seed points and also between iterations
##  of the main loop as particles leave each processor domain. Returns true
##  if particles moved between processes and false otherwise.
##  virtual bool UpdateParticleListFromOtherProcesses ( ) { return false ; } *
##  particle between the two times supplied.
##  void IntegrateParticle ( vtkParticleTracerBaseNamespace :: ParticleListIterator & it , double currentTime , double targetTime , vtkInitialValueProblemSolver * integrator , vtkTemporalInterpolatedVelocityField * interpolator , vtkDoubleArray * cellVectors , std :: atomic < vtkIdType > & particleCount , std :: mutex & eraseMutex , bool sequential ) ;  if the particle is added to send list, then returns value is 1,
##  if it is kept on this process after a retry return value is 0 virtual bool SendParticleToAnotherProcess ( vtkParticleTracerBaseNamespace :: ParticleInformation & , vtkParticleTracerBaseNamespace :: ParticleInformation & , vtkPointData * ) { return true ; } *
##  This is an old routine kept for possible future use.
##  In dynamic meshes, particles might leave the domain and need to be extrapolated across
##  a gap between the meshes before they re-renter another domain
##  dodgy rotating meshes need special care....
##  bool ComputeDomainExitLocation ( double pos [ 4 ] , double p2 [ 4 ] , double intersection [ 4 ] , vtkGenericCell * cell ) ;
##  Scalar arrays that are generated as each particle is updated
##  void CreateProtoPD ( vtkDataObject * input ) ; vtkFloatArray * GetParticleAge ( vtkPointData * ) ; vtkIntArray * GetParticleIds ( vtkPointData * ) ; vtkSignedCharArray * GetParticleSourceIds ( vtkPointData * ) ; vtkIntArray * GetInjectedPointIds ( vtkPointData * ) ; vtkIntArray * GetInjectedStepIds ( vtkPointData * ) ; vtkIntArray * GetErrorCodeArr ( vtkPointData * ) ; vtkFloatArray * GetParticleVorticity ( vtkPointData * ) ; vtkFloatArray * GetParticleRotation ( vtkPointData * ) ; vtkFloatArray * GetParticleAngularVel ( vtkPointData * ) ;  utility function we use to test if a point is inside any of our local datasets bool InsideBounds ( double point [ ] ) ; void CalculateVorticity ( vtkGenericCell * cell , double pcoords [ 3 ] , vtkDoubleArray * cellVectors , double vorticity [ 3 ] ) ; ------------------------------------------------------ double GetCacheDataTime ( int i ) ; double GetCacheDataTime ( ) ; virtual void ResetCache ( ) ; void SetParticle ( vtkParticleTracerBaseNamespace :: ParticleInformation & info , double * velocity , vtkTemporalInterpolatedVelocityField * interpolator , vtkIdType particleId , vtkDoubleArray * cellVectors ) ; /@{ *
##  Methods that check that the input arrays are ordered the
##  same on all data sets. This needs to be true for all
##  blocks in a composite data set as well as across all processes.
##  virtual bool IsPointDataValid ( vtkDataObject * input ) ; bool IsPointDataValid ( vtkCompositeDataSet * input , std :: vector < std :: string > & arrayNames ) ; void GetPointDataArrayNames ( vtkDataSet * input , std :: vector < std :: string > & names ) ; /@} virtual int GetComputeVorticityTerminalSpeedRotationScaleIgnorePipelineTimeForceReinjectionEveryNStepsTerminationTimeStartTimeStaticSeedsMeshOverTimeEnableParticleWritingDisableResetCacheForceSerialExecutionReinjectionCounter ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReinjectionCounter  of  << this -> ReinjectionCounter ) ; return this -> ReinjectionCounter ; } ; virtual double GetComputeVorticityTerminalSpeedRotationScaleIgnorePipelineTimeForceReinjectionEveryNStepsTerminationTimeStartTimeStaticSeedsMeshOverTimeEnableParticleWritingDisableResetCacheForceSerialExecutionReinjectionCounterCurrentTimeValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CurrentTimeValue  of  << this -> CurrentTimeValue ) ; return this -> CurrentTimeValue ; } ; void ResizeArrays ( vtkIdType numTuples ) ; *
##  Methods to append values to existing point data arrays that may
##  only be desired on specific concrete derived classes.
##  virtual void InitializeExtraPointDataArrays ( vtkPointData * vtkNotUsed ( outputPD ) ) { } virtual void SetToExtraPointDataArrays ( vtkIdType , vtkParticleTracerBaseNamespace :: ParticleInformation & ) { } vtkTemporalInterpolatedVelocityField * GetInterpolator ( ) ; *
##  For restarts of particle paths, we add in the ability to add in
##  particles from a previous computation that we will still advect.
##  virtual void AddRestartSeeds ( vtkInformationVector * * inputVector ) { } private : *
##  When particles leave the domain, they must be collected
##  and sent to the other processes for possible continuation.
##  These routines manage the collection and sending after each main iteration.
##  RetryWithPush adds a small push to a particle along it's current velocity
##  vector, this helps get over cracks in dynamic/rotating meshes. This is a
##  first order integration though so it may introduce a bit extra error compared
##  to the integrator that is used.
##  bool RetryWithPush ( vtkParticleTracerBaseNamespace :: ParticleInformation & info , double * point1 , double delT , int subSteps , vtkTemporalInterpolatedVelocityField * interpolator ) ; bool SetTerminationTimeNoModify ( double t ) ;  Parameters of tracing vtkInitialValueProblemSolver * Integrator ; double IntegrationStep ; double MaximumError ; bool ComputeVorticity ; double RotationScale ; double TerminalSpeed ;  A counter to keep track of how many times we reinjected int ReinjectionCounter ;  Important for Caching of Cells/Ids/Weights etc vtkTypeBool AllFixedGeometry ; int MeshOverTime ; vtkTypeBool StaticSeeds ; std :: vector < double > InputTimeValues ; double StartTime ; double TerminationTime ; double CurrentTimeValue ; int StartTimeStep ;  InputTimeValues[StartTimeStep] <= StartTime <=
##  InputTimeValues[StartTimeStep+1] int CurrentTimeStep ; int TerminationTimeStep ;  computed from start time bool FirstIteration ;  Innjection parameters vtkTypeBool ForceReinjectionEveryNSteps ; vtkTimeStamp ParticleInjectionTime ; bool HasCache ;  Particle writing to disk vtkAbstractParticleWriter * ParticleWriter ; char * ParticleFileName ; vtkTypeBool EnableParticleWriting ;  The main lists which are held during operation- between time step updates vtkParticleTracerBaseNamespace :: ParticleVector LocalSeeds ;  The velocity interpolator vtkSmartPointer < vtkTemporalInterpolatedVelocityField > Interpolator ;  Data for time step CurrentTimeStep-1 and CurrentTimeStep vtkSmartPointer < vtkMultiBlockDataSet > CachedData [ 2 ] ;  Cache bounds info for each dataset we will use repeatedly struct bounds_t { double b [ 6 ] ; } ; using bounds = struct bounds_t ; std :: vector < bounds > CachedBounds [ 2 ] ;  variables used by Execute() to produce output vtkSmartPointer < vtkDataSet > DataReferenceT [ 2 ] ; vtkSmartPointer < vtkPoints > OutputCoordinates ; vtkSmartPointer < vtkIdTypeArray > ParticleCellsConnectivity ; vtkSmartPointer < vtkIdTypeArray > ParticleCellsOffsets ; vtkSmartPointer < vtkCellArray > ParticleCells ; vtkSmartPointer < vtkFloatArray > ParticleAge ; vtkSmartPointer < vtkIntArray > ParticleIds ; vtkSmartPointer < vtkSignedCharArray > ParticleSourceIds ; vtkSmartPointer < vtkIntArray > InjectedPointIds ; vtkSmartPointer < vtkIntArray > InjectedStepIds ; vtkSmartPointer < vtkIntArray > ErrorCodeArray ; vtkSmartPointer < vtkFloatArray > ParticleVorticity ; vtkSmartPointer < vtkFloatArray > ParticleRotation ; vtkSmartPointer < vtkFloatArray > ParticleAngularVel ; vtkSmartPointer < vtkPointData > OutputPointData ;  temp array vtkSmartPointer < vtkDoubleArray > CellVectors ; vtkParticleTracerBase ( const vtkParticleTracerBase & ) = delete ; void operator = ( const vtkParticleTracerBase & ) = delete ; vtkTimeStamp ExecuteTime ; unsigned int NumberOfParticles ( ) ; friend class ParticlePathFilterInternal ; friend class StreaklineFilterInternal ; static const double Epsilon ; } ;
## Error: token expected: ; but got: [identifier]!!!
