## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLagrangianParticleTracker.h
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##     This software is distributed WITHOUT ANY WARRANTY; without even
##     the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##     PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkLagrangianParticleTracker
##  @brief   Filter to inject and track particles in a flow
##
##
##
##  Introduce LagrangianParticleTracker
##
##  This is a very flexible and adaptive filter to inject and track particles in a
##  flow. It takes three inputs :
##  * port 0 : Flow Input, a volumic dataset containing data to integrate with,
##      any kind of data object, support distributed input.
##  * port 1 : Seed (source) Input, a dataset containing point to generate particles
##      with, any kind of data object, support distributed input. Only first leaf
##      of composite dataset is used.
##  * port 2 : Optional Surface Input, containing dataset to interact with, any
##      kind of data object, support distributed input.
##
##  It has two outputs :
##  * port 0 : ParticlePaths : a multipiece of polyData (one per thread) of polyLines showing the
##  paths of particles in the flow
##  * port 1 : ParticleInteractions : empty if no surface input, contains a
##      a multiblock with as many children as the number of threads, each children containing a
##  multiblock with the same structure as the surfaces. The leafs of these structures contain a
##  polydata of vertexes corresponding to the interactions. with the same composite layout of surface
##  input if any, showing all interactions between particles and the surface input.
##
##  It has a parallel implementation which streams particle between domains.
##
##  The most important parameters of this filter is it's integrationModel.
##  Only one integration model implementation exist currently in ParaView
##  ,vtkLagrangianMatidaIntegrationModel but the design enables plugin developers
##  to expand this tracker by creating new models.
##  A model can define  :
##  * The number of integration variable and new user defined integration variable
##  * the way the particle are integrated
##  * the way particles intersect and interact with the surface
##  * the way freeFlight termination is handled
##  * PreProcess and PostProcess methods
##  * Manual Integration, Manual partichle shifting
##  see vtkLagrangianBasicIntegrationModel and vtkLagrangianMatidaIntegrationModel
##  for more information
##
##  It also let the user choose the Locator to use when integrating in the flow,
##  as well as the Integrator to use. Integration steps are also highly configurable,
##  step, step min and step max are passed down to the integrator (hence min and max
##  does not matter with a non adaptive integrator like RK4/5)
##
##   An IntegrationModel is a very specific vtkFunctionSet with a lot of features
##  allowing inherited classes
##  to concentrate on the mathematical part of the code.
##   a Particle is basically a class wrapper around three table containing variables
##  about the particle at previous, current and next position.
##   The particle is passed to the integrator, which use the integration model to
##  integrate the particle in the flow.
##
##  It has other features also, including :
##   * Adaptative Step Reintegration, to retry the step with different time step
##       when the next position is too far
##   * Different kind of cell length computation, including a divergence theorem
##       based computation
##   * Optional lines rendering controlled by a threshold
##   * Ghost cell support
##   * Non planar quad interaction support
##   * Built-in support for surface interaction including, terminate, bounce,
##       break-up and pass-through surface
##  The serial and parallel filters are fully tested.
##
##  @sa
##  vtkLagrangianMatidaIntegrationModel vtkLagrangianParticle
##  vtkLagrangianBasicIntegrationModel
##

## !!!Ignored construct:  # vtkLagrangianParticleTracker_h [NewLine] # vtkLagrangianParticleTracker_h [NewLine] # vtkBoundingBox.h  For cached bounds # vtkDataObjectAlgorithm.h [NewLine] # vtkFiltersFlowPathsModule.h  For export macro [NewLine] # < atomic >  for atomic # < mutex >  for mutexes # < queue >  for particle queue [NewLine] class vtkBoundingBox ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkCellArray"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkIdList"
discard "forward decl of vtkInformation"
discard "forward decl of vtkInitialValueProblemSolver"
discard "forward decl of vtkLagrangianBasicIntegrationModel"
discard "forward decl of vtkLagrangianParticle"
discard "forward decl of vtkMultiBlockDataSet"
discard "forward decl of vtkMultiPieceDataSet"
discard "forward decl of vtkPointData"
discard "forward decl of vtkPoints"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkPolyLine"
discard "forward decl of IntegratingFunctor"
discard "forward decl of vtkLagrangianThreadedData"
## !!!Ignored construct:  class VTKFILTERSFLOWPATHS_EXPORT vtkLagrangianParticleTracker : public vtkDataObjectAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataObjectAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataObjectAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkLagrangianParticleTracker :: IsTypeOf ( type ) ; } static vtkLagrangianParticleTracker * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkLagrangianParticleTracker * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkLagrangianParticleTracker * NewInstance ( ) const { return vtkLagrangianParticleTracker :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataObjectAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLagrangianParticleTracker :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLagrangianParticleTracker :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkLagrangianParticleTracker * New ( ) ; typedef enum CellLengthComputation { STEP_CUR_CELL_LENGTH = 1 , STEP_CUR_CELL_VEL_DIR = 3 , STEP_CUR_CELL_DIV_THEO = 5 } CellLengthComputation ; /@{ *
##  Set/Get the integration model.
##  Default is vtkLagrangianMatidaIntegrationModel
##  void SetIntegrationModel ( vtkLagrangianBasicIntegrationModel * integrationModel ) ; virtual vtkLagrangianBasicIntegrationModel * GetnameIntegrationModel ( ) { vtkDebugWithObjectMacro ( this , <<  returning  IntegrationModel  address  << static_cast < vtkLagrangianBasicIntegrationModel * > ( this -> IntegrationModel ) ) ; return this -> IntegrationModel ; } ; /@} /@{ *
##  Set/Get the integrator.
##  Default is vtkRungeKutta2
##  void SetIntegrator ( vtkInitialValueProblemSolver * integrator ) ; virtual vtkInitialValueProblemSolver * GetnameIntegrationModelIntegrator ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Integrator  address  << static_cast < vtkInitialValueProblemSolver * > ( this -> Integrator ) ) ; return this -> Integrator ; } ; /@} /@{ *
##  Set/Get whether or not to use PolyVertex cell type
##  for the interaction output
##  Default is false
##  virtual void SetGeneratePolyVertexInteractionOutput ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GeneratePolyVertexInteractionOutput  to  << _arg ) ; if ( this -> GeneratePolyVertexInteractionOutput != _arg ) { this -> GeneratePolyVertexInteractionOutput = _arg ; this -> Modified ( ) ; } } ; virtual bool GetGeneratePolyVertexInteractionOutput ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GeneratePolyVertexInteractionOutput  of  << this -> GeneratePolyVertexInteractionOutput ) ; return this -> GeneratePolyVertexInteractionOutput ; } ; /@} /@{ *
##  Set/Get the cell length computation mode.
##  Available modes are :
##  - STEP_CUR_CELL_LENGTH :
##  Compute cell length using getLength method
##  on the current cell the particle is in
##  - STEP_CUR_CELL_VEL_DIR :
##  Compute cell length using the particle velocity
##  and the edges of the last cell the particle was in.
##  - STEP_CUR_CELL_DIV_THEO :
##  Compute cell length using the particle velocity
##  and the divergence theorem.
##  virtual void SetGeneratePolyVertexInteractionOutputCellLengthComputationMode ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CellLengthComputationMode  to  << _arg ) ; if ( this -> CellLengthComputationMode != _arg ) { this -> CellLengthComputationMode = _arg ; this -> Modified ( ) ; } } ; virtual int GetGeneratePolyVertexInteractionOutputCellLengthComputationMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CellLengthComputationMode  of  << this -> CellLengthComputationMode ) ; return this -> CellLengthComputationMode ; } ; /@} /@{ *
##  Set/Get the integration step factor. Default is 1.0.
##  virtual void SetGeneratePolyVertexInteractionOutputCellLengthComputationModeStepFactor ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  StepFactor  to  << _arg ) ; if ( this -> StepFactor != _arg ) { this -> StepFactor = _arg ; this -> Modified ( ) ; } } ; virtual double GetGeneratePolyVertexInteractionOutputCellLengthComputationModeStepFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << StepFactor  of  << this -> StepFactor ) ; return this -> StepFactor ; } ; /@} /@{ *
##  Set/Get the integration step factor min. Default is 0.5.
##  virtual void SetGeneratePolyVertexInteractionOutputCellLengthComputationModeStepFactorStepFactorMin ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  StepFactorMin  to  << _arg ) ; if ( this -> StepFactorMin != _arg ) { this -> StepFactorMin = _arg ; this -> Modified ( ) ; } } ; virtual double GetGeneratePolyVertexInteractionOutputCellLengthComputationModeStepFactorStepFactorMin ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << StepFactorMin  of  << this -> StepFactorMin ) ; return this -> StepFactorMin ; } ; /@} /@{ *
##  Set/Get the integration step factor max. Default is 1.5.
##  virtual void SetGeneratePolyVertexInteractionOutputCellLengthComputationModeStepFactorStepFactorMinStepFactorMax ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  StepFactorMax  to  << _arg ) ; if ( this -> StepFactorMax != _arg ) { this -> StepFactorMax = _arg ; this -> Modified ( ) ; } } ; virtual double GetGeneratePolyVertexInteractionOutputCellLengthComputationModeStepFactorStepFactorMinStepFactorMax ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << StepFactorMax  of  << this -> StepFactorMax ) ; return this -> StepFactorMax ; } ; /@} /@{ *
##  Set/Get the maximum number of steps. -1 means no limit. Default is 100.
##  virtual void SetGeneratePolyVertexInteractionOutputCellLengthComputationModeStepFactorStepFactorMinStepFactorMaxMaximumNumberOfSteps ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MaximumNumberOfSteps  to  << _arg ) ; if ( this -> MaximumNumberOfSteps != _arg ) { this -> MaximumNumberOfSteps = _arg ; this -> Modified ( ) ; } } ; virtual int GetGeneratePolyVertexInteractionOutputCellLengthComputationModeStepFactorStepFactorMinStepFactorMaxMaximumNumberOfSteps ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumNumberOfSteps  of  << this -> MaximumNumberOfSteps ) ; return this -> MaximumNumberOfSteps ; } ; /@} /@{ *
##  Set/Get the maximum integration time. A negative value means no limit.
##  Default is -1.
##  virtual void SetGeneratePolyVertexInteractionOutputCellLengthComputationModeStepFactorStepFactorMinStepFactorMaxMaximumNumberOfStepsMaximumIntegrationTime ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MaximumIntegrationTime  to  << _arg ) ; if ( this -> MaximumIntegrationTime != _arg ) { this -> MaximumIntegrationTime = _arg ; this -> Modified ( ) ; } } ; virtual double GetGeneratePolyVertexInteractionOutputCellLengthComputationModeStepFactorStepFactorMinStepFactorMaxMaximumNumberOfStepsMaximumIntegrationTime ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumIntegrationTime  of  << this -> MaximumIntegrationTime ) ; return this -> MaximumIntegrationTime ; } ; /@} /@{ *
##  Set/Get the Adaptive Step Reintegration feature.
##  it checks the step size after the integration
##  and if it is too big will retry with a smaller step
##  Default is false.
##  virtual void SetGeneratePolyVertexInteractionOutputCellLengthComputationModeStepFactorStepFactorMinStepFactorMaxMaximumNumberOfStepsMaximumIntegrationTimeAdaptiveStepReintegration ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  AdaptiveStepReintegration  to  << _arg ) ; if ( this -> AdaptiveStepReintegration != _arg ) { this -> AdaptiveStepReintegration = _arg ; this -> Modified ( ) ; } } ; virtual bool GetGeneratePolyVertexInteractionOutputCellLengthComputationModeStepFactorStepFactorMinStepFactorMaxMaximumNumberOfStepsMaximumIntegrationTimeAdaptiveStepReintegration ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AdaptiveStepReintegration  of  << this -> AdaptiveStepReintegration ) ; return this -> AdaptiveStepReintegration ; } ; virtual void AdaptiveStepReintegrationOn ( ) { this -> SetAdaptiveStepReintegration ( static_cast < bool > ( 1 ) ) ; } virtual void AdaptiveStepReintegrationOff ( ) { this -> SetAdaptiveStepReintegration ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the generation of the particle path output,
##  Default is true.
##  virtual void SetGeneratePolyVertexInteractionOutputCellLengthComputationModeStepFactorStepFactorMinStepFactorMaxMaximumNumberOfStepsMaximumIntegrationTimeAdaptiveStepReintegrationGenerateParticlePathsOutput ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateParticlePathsOutput  to  << _arg ) ; if ( this -> GenerateParticlePathsOutput != _arg ) { this -> GenerateParticlePathsOutput = _arg ; this -> Modified ( ) ; } } ; virtual bool GetGeneratePolyVertexInteractionOutputCellLengthComputationModeStepFactorStepFactorMinStepFactorMaxMaximumNumberOfStepsMaximumIntegrationTimeAdaptiveStepReintegrationGenerateParticlePathsOutput ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateParticlePathsOutput  of  << this -> GenerateParticlePathsOutput ) ; return this -> GenerateParticlePathsOutput ; } ; virtual void GenerateParticlePathsOutputOn ( ) { this -> SetAdaptiveStepReintegrationGenerateParticlePathsOutput ( static_cast < bool > ( 1 ) ) ; } virtual void GenerateParticlePathsOutputOff ( ) { this -> SetAdaptiveStepReintegrationGenerateParticlePathsOutput ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify the source object used to generate particle initial position (seeds).
##  Note that this method does not connect the pipeline. The algorithm will
##  work on the input data as it is without updating the producer of the data.
##  See SetSourceConnection for connecting the pipeline.
##  void SetSourceData ( vtkDataObject * source ) ; vtkDataObject * GetSource ( ) ; /@} *
##  Specify the source object used to generate particle initial position (seeds).
##  void SetSourceConnection ( vtkAlgorithmOutput * algOutput ) ; /@{ *
##  Specify the source object used to compute surface interaction with
##  Note that this method does not connect the pipeline. The algorithm will
##  work on the input data as it is without updating the producer of the data.
##  See SetSurfaceConnection for connecting the pipeline.
##  void SetSurfaceData ( vtkDataObject * source ) ; vtkDataObject * GetSurface ( ) ; /@} *
##  Specify the object used to compute surface interaction with.
##  void SetSurfaceConnection ( vtkAlgorithmOutput * algOutput ) ; *
##  Declare input port type
##  int FillInputPortInformation ( int port , vtkInformation * info ) override ; *
##  Declare output port type
##  int FillOutputPortInformation ( int port , vtkInformation * info ) override ; *
##  Create outputs objects.
##  int RequestDataObject ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; *
##  Process inputs to integrate particle and generate output.
##  int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; *
##  Get the tracker modified time taking into account the integration model
##  and the integrator.
##  vtkMTimeType GetMTime ( ) override ; *
##  Get an unique id for a particle
##  This method is thread safe
##  virtual vtkIdType GetNewParticleId ( ) ; protected : vtkLagrangianParticleTracker ( ) ; ~ vtkLagrangianParticleTracker ( ) override ; virtual bool InitializeFlow ( vtkDataObject * flow , vtkBoundingBox * bounds ) ; virtual bool InitializeParticles ( const vtkBoundingBox * bounds , vtkDataSet * seeds , std :: queue < vtkLagrangianParticle * > & particles , vtkPointData * seedData ) ; virtual void GenerateParticles ( const vtkBoundingBox * bounds , vtkDataSet * seeds , vtkDataArray * initialVelocities , vtkDataArray * initialIntegrationTimes , vtkPointData * seedData , int nVar , std :: queue < vtkLagrangianParticle * > & particles ) ; virtual bool UpdateSurfaceCacheIfNeeded ( vtkDataObject * & surfaces ) ; virtual void InitializeSurface ( vtkDataObject * & surfaces ) ; *
##  This method is thread safe
##  virtual bool InitializePathsOutput ( vtkPointData * seedData , vtkIdType numberOfSeeds , vtkPolyData * & particlePathsOutput ) ; *
##  This method is thread safe
##  virtual bool InitializeInteractionOutput ( vtkPointData * seedData , vtkDataObject * surfaces , vtkDataObject * & interractionOutput ) ; virtual bool FinalizeOutputs ( vtkPolyData * particlePathsOutput , vtkDataObject * interactionOutput ) ; static void InsertPolyVertexCell ( vtkPolyData * polydata ) ; static void InsertVertexCells ( vtkPolyData * polydata ) ; virtual void GetParticleFeed ( std :: queue < vtkLagrangianParticle * > & particleQueue ) ; *
##  This method is thread safe
##  virtual int Integrate ( vtkInitialValueProblemSolver * integrator , vtkLagrangianParticle * , std :: queue < vtkLagrangianParticle * > & , vtkPolyData * particlePathsOutput , vtkPolyLine * particlePath , vtkDataObject * interactionOutput ) ; *
##  This method is thread safe
##  void InsertPathOutputPoint ( vtkLagrangianParticle * particle , vtkPolyData * particlePathsOutput , vtkIdList * particlePathPointId , bool prev = false ) ; *
##  This method is thread safe
##  void InsertInteractionOutputPoint ( vtkLagrangianParticle * particle , unsigned int interactedSurfaceFlatIndex , vtkDataObject * interactionOutput ) ; *
##  Computes the cell length for the next step using the method set by
##  CellLengthComputationMode. Returns -1 if particle is out the of domain.
##  double ComputeCellLength ( vtkLagrangianParticle * particle ) ; *
##  This method is thread safe
##  bool ComputeNextStep ( vtkInitialValueProblemSolver * integrator , double * xprev , double * xnext , double t , double & delT , double & delTActual , double minStep , double maxStep , double cellLength , int & integrationRes , vtkLagrangianParticle * particle ) ; *
##  This method is thread safe
##  Call the ParticleAboutToBeDeleted model method and delete the particle
##  virtual void DeleteParticle ( vtkLagrangianParticle * particle ) ; vtkLagrangianBasicIntegrationModel * IntegrationModel ; vtkInitialValueProblemSolver * Integrator ; int CellLengthComputationMode ; double StepFactor ; double StepFactorMin ; double StepFactorMax ; int MaximumNumberOfSteps ; double MaximumIntegrationTime ; bool AdaptiveStepReintegration ; bool GenerateParticlePathsOutput = true ; bool GeneratePolyVertexInteractionOutput ; std :: atomic < vtkIdType > ParticleCounter ; std :: atomic < vtkIdType > IntegratedParticleCounter ; vtkIdType IntegratedParticleCounterIncrement ; vtkPointData * SeedData ;  internal parameters use for step computation double MinimumVelocityMagnitude ; double MinimumReductionFactor ;  Cache related parameters vtkDataObject * FlowCache ; vtkMTimeType FlowTime ; vtkBoundingBox FlowBoundsCache ; bool FlowCacheInvalid = true ; vtkDataObject * SurfacesCache ; vtkMTimeType SurfacesTime ; bool SurfaceCacheInvalid = true ; std :: mutex ProgressMutex ; friend struct IntegratingFunctor ; vtkLagrangianThreadedData * SerialThreadedData ; private : vtkLagrangianParticleTracker ( const vtkLagrangianParticleTracker & ) = delete ; void operator = ( const vtkLagrangianParticleTracker & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
