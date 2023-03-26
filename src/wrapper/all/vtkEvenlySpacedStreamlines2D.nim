## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkEvenlySpacedStreamlines2D.h
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
##  @class   vtkEvenlySpacedStreamlines2D
##  @brief   Evenly spaced streamline generator for 2D.
##
##  vtkEvenlySpacedStreamlines2D is a filter that integrates a 2D
##  vector field to generate evenly-spaced streamlines.
##
##  We implement
##  the algorithm described in:
##  Jobard, Bruno, and Wilfrid Lefer. "Creating evenly-spaced
##  streamlines of arbitrary density." Visualization in Scientific
##  Computing '97. Springer Vienna, 1997. 43-55.
##  The loop detection is described in:
##  Liu, Zhanping, Robert Moorhead, and Joe Groner.
##  "An advanced evenly-spaced streamline placement algorithm."
##  IEEE Transactions on Visualization and Computer Graphics 12.5 (2006): 965-972.
##
##  The integration is performed using a specified integrator,
##  by default Runge-Kutta2.
##
##  vtkEvenlySpacedStreamlines2D produces polylines as the output, with
##  each cell (i.e., polyline) representing a streamline. The attribute
##  values associated with each streamline are stored in the cell data,
##  whereas those associated with streamline-points are stored in the
##  point data.
##
##  vtkEvenlySpacedStreamlines2D integrates streamlines both forward
##  and backward. The integration for a streamline terminates upon
##  exiting the flow field domain, or if the particle speed is reduced
##  to a value less than a specified terminal speed, if the current
##  streamline gets too close to other streamlines
##  (vtkStreamTracer::FIXED_REASONS_FOR_TERMINATION_COUNT + 1) or if
##  the streamline forms a loop
##  (vtkStreamTracer::FIXED_REASONS_FOR_TERMINATION_COUNT). The
##  specific reason for the termination is stored in a cell array named
##  ReasonForTermination.
##
##  Note that normalized vectors are adopted in streamline integration,
##  which achieves high numerical accuracy/smoothness of flow lines that is
##  particularly guaranteed for Runge-Kutta45 with adaptive step size and
##  error control). In support of this feature, the underlying step size is
##  ALWAYS in arc length unit (LENGTH_UNIT) while the 'real' time interval
##  (virtual for steady flows) that a particle actually takes to trave in a
##  single step is obtained by dividing the arc length by the LOCAL speed.
##  The overall elapsed time (i.e., the life span) of the particle is the
##  sum of those individual step-wise time intervals.
##
##  The quality of streamline integration can be controlled by setting
##  the initial integration step (InitialIntegrationStep), particularly
##  for Runge-Kutta2 and Runge-Kutta4 (with a fixed step size). We do
##  not support Runge-Kutta45 (with an adaptive step size and error
##  control) because a requirement of the algorithm is that sample
##  points along a streamline be evenly spaced. These steps are in
##  either LENGTH_UNIT or CELL_LENGTH_UNIT.
##
##  The integration time, vorticity, rotation and angular velocity are stored
##  in point data arrays named "IntegrationTime", "Vorticity", "Rotation" and
##  "AngularVelocity", respectively (vorticity, rotation and angular velocity
##  are computed only when ComputeVorticity is on). All point data attributes
##  in the source dataset are interpolated on the new streamline points.
##
##  vtkEvenlySpacedStreamlines2D supports integration through any type of 2D dataset.
##
##  The starting point, or the so-called 'seed', of the first streamline is set
##  by setting StartPosition
##
##  @sa
##  vtkStreamTracer vtkRibbonFilter vtkRuledSurfaceFilter vtkInitialValueProblemSolver
##  vtkRungeKutta2 vtkRungeKutta4 vtkRungeKutta45 vtkParticleTracerBase
##  vtkParticleTracer vtkParticlePathFilter vtkStreaklineFilter
##  vtkAbstractInterpolatedVelocityField vtkCompositeInterpolatedVelocityField
##  vtkAMRInterpolatedVelocityField
##

## !!!Ignored construct:  # vtkEvenlySpacedStreamlines2D_h [NewLine] # vtkEvenlySpacedStreamlines2D_h [NewLine] # vtkFiltersFlowPathsModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] # < array >  for std::array # < vector >  for std::vector [NewLine] class vtkAbstractInterpolatedVelocityField ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkCompositeDataSet"
discard "forward decl of vtkDataArray"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkExecutive"
discard "forward decl of vtkGenericCell"
discard "forward decl of vtkIdList"
discard "forward decl of vtkInitialValueProblemSolver"
discard "forward decl of vtkImageData"
discard "forward decl of vtkIntArray"
discard "forward decl of vtkPolyDataCollection"
discard "forward decl of vtkPoints"
discard "forward decl of vtkStreamTracer"
## !!!Ignored construct:  class VTKFILTERSFLOWPATHS_EXPORT vtkEvenlySpacedStreamlines2D : public vtkPolyDataAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkEvenlySpacedStreamlines2D :: IsTypeOf ( type ) ; } static vtkEvenlySpacedStreamlines2D * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkEvenlySpacedStreamlines2D * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkEvenlySpacedStreamlines2D * NewInstance ( ) const { return vtkEvenlySpacedStreamlines2D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkEvenlySpacedStreamlines2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkEvenlySpacedStreamlines2D :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct object to start from position (0,0,0), with forward
##  integration, terminal speed 1.0E-12, vorticity computation on,
##  integration step size 0.5 (in cell length unit), maximum number
##  of steps 2000, using Runge-Kutta2, and maximum propagation 1.0
##  (in arc length unit).
##  static vtkEvenlySpacedStreamlines2D * New ( ) ; /@{ *
##  Specify the starting point (seed) of the first streamline in the global
##  coordinate system. Search must be performed to find the initial cell
##  from which to start integration. If the seed is not specified a
##  random position in the input data is chosen.
##  virtual void SetStartPosition ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << StartPosition  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> StartPosition [ 0 ] != _arg1 ) || ( this -> StartPosition [ 1 ] != _arg2 ) || ( this -> StartPosition [ 2 ] != _arg3 ) ) { this -> StartPosition [ 0 ] = _arg1 ; this -> StartPosition [ 1 ] = _arg2 ; this -> StartPosition [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetStartPosition ( const double _arg [ 3 ] ) { this -> SetStartPosition ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetStartPosition ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << StartPosition  pointer  << this -> StartPosition ) ; return this -> StartPosition ; } VTK_WRAPEXCLUDE virtual void GetStartPosition ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> StartPosition [ 0 ] ; _arg2 = this -> StartPosition [ 1 ] ; _arg3 = this -> StartPosition [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << StartPosition  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetStartPosition ( double _arg [ 3 ] ) { this -> GetStartPosition ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  Set/get the integrator type to be used for streamline generation.
##  The object passed is not actually used but is cloned with
##  NewInstance in the process of integration  (prototype pattern).
##  The default is Runge-Kutta2. The integrator can also be changed
##  using SetIntegratorType. The recognized solvers are:
##  RUNGE_KUTTA2  = 0
##  RUNGE_KUTTA4  = 1
##  void SetIntegrator ( vtkInitialValueProblemSolver * ) ; virtual vtkInitialValueProblemSolver * GetnameIntegrator ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Integrator  address  << static_cast < vtkInitialValueProblemSolver * > ( this -> Integrator ) ) ; return this -> Integrator ; } ; void SetIntegratorType ( int type ) ; int GetIntegratorType ( ) ; void SetIntegratorTypeToRungeKutta2 ( ) ; void SetIntegratorTypeToRungeKutta4 ( ) ; /@} *
##  Set the velocity field interpolator type to the one involving
##  a dataset point locator.
##  void SetInterpolatorTypeToDataSetPointLocator ( ) ; *
##  Set the velocity field interpolator type to the one involving
##  a cell locator.
##  void SetInterpolatorTypeToCellLocator ( ) ; *
##  Specify a uniform integration step unit for
##  InitialIntegrationStep, and SeparatingDistance. Valid units are
##  LENGTH_UNIT (1) (value is in global coordinates) and CELL_LENGTH_UNIT (2)
##  (the value is in number of cell lengths)
##  void SetIntegrationStepUnit ( int unit ) ; int GetIntegrationStepUnit ( ) { return this -> IntegrationStepUnit ; } /@{ *
##  Specify the maximum number of steps for integrating a streamline.
##  virtual void SetMaximumNumberOfSteps ( vtkIdType _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MaximumNumberOfSteps  to  << _arg ) ; if ( this -> MaximumNumberOfSteps != _arg ) { this -> MaximumNumberOfSteps = _arg ; this -> Modified ( ) ; } } ; virtual vtkIdType GetMaximumNumberOfSteps ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumNumberOfSteps  of  << this -> MaximumNumberOfSteps ) ; return this -> MaximumNumberOfSteps ; } ; /@} /@{ *
##  We don't try to eliminate loops with fewer points than this. Default value
##  is 4.
##  virtual void SetMaximumNumberOfStepsMinimumNumberOfLoopPoints ( vtkIdType _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MinimumNumberOfLoopPoints  to  << _arg ) ; if ( this -> MinimumNumberOfLoopPoints != _arg ) { this -> MinimumNumberOfLoopPoints = _arg ; this -> Modified ( ) ; } } ; virtual vtkIdType GetMaximumNumberOfStepsMinimumNumberOfLoopPoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MinimumNumberOfLoopPoints  of  << this -> MinimumNumberOfLoopPoints ) ; return this -> MinimumNumberOfLoopPoints ; } ; /@} /@{ *
##  Specify the Initial step size used for line integration, expressed in
##  IntegrationStepUnit
##
##  This is the constant / fixed size for non-adaptive integration
##  methods, i.e., RK2 and RK4
##  virtual void SetMaximumNumberOfStepsMinimumNumberOfLoopPointsInitialIntegrationStep ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  InitialIntegrationStep  to  << _arg ) ; if ( this -> InitialIntegrationStep != _arg ) { this -> InitialIntegrationStep = _arg ; this -> Modified ( ) ; } } ; virtual double GetMaximumNumberOfStepsMinimumNumberOfLoopPointsInitialIntegrationStep ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InitialIntegrationStep  of  << this -> InitialIntegrationStep ) ; return this -> InitialIntegrationStep ; } ; /@} /@{ *
##  Specify the separation distance between streamlines expressed in
##  IntegrationStepUnit.
##  virtual void SetMaximumNumberOfStepsMinimumNumberOfLoopPointsInitialIntegrationStepSeparatingDistance ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SeparatingDistance  to  << _arg ) ; if ( this -> SeparatingDistance != _arg ) { this -> SeparatingDistance = _arg ; this -> Modified ( ) ; } } ; virtual double GetMaximumNumberOfStepsMinimumNumberOfLoopPointsInitialIntegrationStepSeparatingDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SeparatingDistance  of  << this -> SeparatingDistance ) ; return this -> SeparatingDistance ; } ; /@} /@{ *
##  Streamline integration is stopped if streamlines are closer than
##  SeparatingDistance*SeparatingDistanceRatio to other streamlines.
##  virtual void SetMaximumNumberOfStepsMinimumNumberOfLoopPointsInitialIntegrationStepSeparatingDistanceSeparatingDistanceRatio ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SeparatingDistanceRatio  to  << _arg ) ; if ( this -> SeparatingDistanceRatio != _arg ) { this -> SeparatingDistanceRatio = _arg ; this -> Modified ( ) ; } } ; virtual double GetMaximumNumberOfStepsMinimumNumberOfLoopPointsInitialIntegrationStepSeparatingDistanceSeparatingDistanceRatio ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SeparatingDistanceRatio  of  << this -> SeparatingDistanceRatio ) ; return this -> SeparatingDistanceRatio ; } ; /@} /@{ *
##  Loops are considered closed if the have two points at distance less than this.
##  This is expressed in IntegrationStepUnit.
##  virtual void SetMaximumNumberOfStepsMinimumNumberOfLoopPointsInitialIntegrationStepSeparatingDistanceSeparatingDistanceRatioClosedLoopMaximumDistance ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ClosedLoopMaximumDistance  to  << _arg ) ; if ( this -> ClosedLoopMaximumDistance != _arg ) { this -> ClosedLoopMaximumDistance = _arg ; this -> Modified ( ) ; } } ; virtual double GetMaximumNumberOfStepsMinimumNumberOfLoopPointsInitialIntegrationStepSeparatingDistanceSeparatingDistanceRatioClosedLoopMaximumDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ClosedLoopMaximumDistance  of  << this -> ClosedLoopMaximumDistance ) ; return this -> ClosedLoopMaximumDistance ; } ; /@} /@{ *
##  The angle (in radians) between the vector created by p0p1 and the
##  velocity in the point closing the loop. p0 is the current point
##  and p1 is the point before that.  Default value is 20 degrees in radians.
##  virtual void SetMaximumNumberOfStepsMinimumNumberOfLoopPointsInitialIntegrationStepSeparatingDistanceSeparatingDistanceRatioClosedLoopMaximumDistanceLoopAngle ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  LoopAngle  to  << _arg ) ; if ( this -> LoopAngle != _arg ) { this -> LoopAngle = _arg ; this -> Modified ( ) ; } } ; virtual double GetMaximumNumberOfStepsMinimumNumberOfLoopPointsInitialIntegrationStepSeparatingDistanceSeparatingDistanceRatioClosedLoopMaximumDistanceLoopAngle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LoopAngle  of  << this -> LoopAngle ) ; return this -> LoopAngle ; } ; /@} /@{ *
##  Specify the terminal speed value, below which integration is terminated.
##  virtual void SetMaximumNumberOfStepsMinimumNumberOfLoopPointsInitialIntegrationStepSeparatingDistanceSeparatingDistanceRatioClosedLoopMaximumDistanceLoopAngleTerminalSpeed ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  TerminalSpeed  to  << _arg ) ; if ( this -> TerminalSpeed != _arg ) { this -> TerminalSpeed = _arg ; this -> Modified ( ) ; } } ; virtual double GetMaximumNumberOfStepsMinimumNumberOfLoopPointsInitialIntegrationStepSeparatingDistanceSeparatingDistanceRatioClosedLoopMaximumDistanceLoopAngleTerminalSpeed ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TerminalSpeed  of  << this -> TerminalSpeed ) ; return this -> TerminalSpeed ; } ; /@} /@{ *
##  Turn on/off vorticity computation at streamline points
##  (necessary for generating proper stream-ribbons using the
##  vtkRibbonFilter.
##  virtual void SetMaximumNumberOfStepsMinimumNumberOfLoopPointsInitialIntegrationStepSeparatingDistanceSeparatingDistanceRatioClosedLoopMaximumDistanceLoopAngleTerminalSpeedComputeVorticity ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeVorticity  to  << _arg ) ; if ( this -> ComputeVorticity != _arg ) { this -> ComputeVorticity = _arg ; this -> Modified ( ) ; } } ; virtual bool GetMaximumNumberOfStepsMinimumNumberOfLoopPointsInitialIntegrationStepSeparatingDistanceSeparatingDistanceRatioClosedLoopMaximumDistanceLoopAngleTerminalSpeedComputeVorticity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeVorticity  of  << this -> ComputeVorticity ) ; return this -> ComputeVorticity ; } ; /@} *
##  The object used to interpolate the velocity field during
##  integration is of the same class as this prototype.
##  void SetInterpolatorPrototype ( vtkAbstractInterpolatedVelocityField * ivf ) ; *
##  Set the type of the velocity field interpolator to determine whether
##  INTERPOLATOR_WITH_DATASET_POINT_LOCATOR or INTERPOLATOR_WITH_CELL_LOCATOR
##  is employed for locating cells during streamline integration. The latter
##  (adopting vtkAbstractCellLocator sub-classes such as vtkCellLocator and
##  vtkModifiedBSPTree) is more robust then the former (through vtkDataSet /
##  vtkPointSet::FindCell() coupled with vtkPointLocator).
##  void SetInterpolatorType ( int interpType ) ; protected : vtkEvenlySpacedStreamlines2D ( ) ; ~ vtkEvenlySpacedStreamlines2D ( ) override ; *
##  Do we test for separating distance or a ratio of the separating distance.
##  enum DistanceType { DISTANCE , DISTANCE_RATIO } ;  hide the superclass' AddInput() from the user and the compiler void AddInput ( vtkDataObject * ) { do { if ( vtkObject :: GetGlobalWarningDisplay ( ) ) { vtkOStreamWrapper :: EndlType endl ; vtkOStreamWrapper :: UseEndl ( endl ) ; vtkOStrStreamWrapper vtkmsg ; vtkObject * _object = const_cast < vtkObject * > ( static_cast < const vtkObject * > ( this ) ) ; if ( _object ) { vtkmsg << _object -> GetObjectDescription ( ) << :  ; } else { vtkmsg << (nullptr):  ; } vtkmsg <<  << AddInput() must be called with a vtkDataSet not a vtkDataObject. ; std :: string _filename = vtksys :: SystemTools :: GetFilenameName ( __FILE__ ) ; vtkOutputWindowDisplayErrorText ( _filename . c_str ( ) , __LINE__ , vtkmsg . str ( ) , _object ) ; vtkmsg . rdbuf ( ) -> freeze ( 0 ) ; vtkObject :: BreakOnError ( ) ; } } while ( false ) ; } int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int , vtkInformation * ) override ; int SetupOutput ( vtkInformation * inInfo , vtkInformation * outInfo ) ; int CheckInputs ( vtkAbstractInterpolatedVelocityField * & func , int * maxCellSize ) ; double ConvertToLength ( double interval , int unit , double cellLength ) ; static void GetBounds ( vtkCompositeDataSet * cds , double bounds [ 6 ] ) ; void InitializeSuperposedGrid ( double * bounds ) ; void AddToAllPoints ( vtkPolyData * streamline ) ; void AddToCurrentPoints ( vtkIdType pointId ) ; template < typename T > void InitializePoints ( T & points ) ; void InitializeMinPointIds ( ) ; static bool IsStreamlineLooping ( void * clientdata , vtkPoints * points , vtkDataArray * velocity , int direction ) ; static bool IsStreamlineTooCloseToOthers ( void * clientdata , vtkPoints * points , vtkDataArray * velocity , int direction ) ; template < typename CellCheckerType > bool ForEachCell ( double * point , CellCheckerType checker , vtkPoints * points = nullptr , vtkDataArray * velocity = nullptr , int direction = 1 ) ; template < int distanceType > bool IsTooClose ( double * point , vtkIdType cellId , vtkPoints * points , vtkDataArray * velocity , int direction ) ; bool IsLooping ( double * point , vtkIdType cellId , vtkPoints * points , vtkDataArray * velocity , int direction ) ; const char * GetInputArrayToProcessName ( ) ; int ComputeCellLength ( double * cellLength ) ;  starting from global x-y-z position double StartPosition [ 3 ] ; double TerminalSpeed ; double InitialIntegrationStep ; double SeparatingDistance ;  SeparatingDistance can be in cell length or arc length. This member
##  stores SeparatingDistance in arc length. It is computed when
##  the filter executes. double SeparatingDistanceArcLength ; double SeparatingDistanceRatio ; double ClosedLoopMaximumDistance ;  ClosedLoopMaximumDistance can be in cell length or arc length.
##  This member stores ClosedLoopMaximumDistance in arc length. It is
##  computed when the filter executes. double ClosedLoopMaximumDistanceArcLength ; double LoopAngle ; int IntegrationStepUnit ; vtkIdType MaximumNumberOfSteps ; vtkIdType MinimumNumberOfStreamlinePoints ; vtkIdType MinimumNumberOfLoopPoints ;  Prototype showing the integrator type to be set by the user. vtkInitialValueProblemSolver * Integrator ; bool ComputeVorticity ; vtkAbstractInterpolatedVelocityField * InterpolatorPrototype ; vtkCompositeDataSet * InputData ;  grid superposed over InputData. The grid cell height and width is
##  SeparatingDistance vtkImageData * SuperposedGrid ;  AllPoints[i][j] is the point for point j on the streamlines that
##  falls over cell id i in SuperposedGrid. AllPoint[i].size() tell
##  us how many points fall over cell id i. std :: vector < std :: vector < std :: array < double , 3 >> > AllPoints ;  CurrentPoints[i][j] is the point id for point j on the current streamline that
##  falls over cell id i in SuperposedGrid. CurrentPoints[i].size() tell us
##  how many points fall over cell id i. std :: vector < std :: vector < vtkIdType >> CurrentPoints ;  Min and Max point ids stored in a cell of SuperposedGrid std :: vector < vtkIdType > MinPointIds ;  The index of the first point for the current
##  direction. Note we integrate streamlines both forward and
##  backward. vtkIdType DirectionStart ;  The previous integration direction. int PreviousDirection ;  queue of streamlines to be processed vtkPolyDataCollection * Streamlines ; private : vtkEvenlySpacedStreamlines2D ( const vtkEvenlySpacedStreamlines2D & ) = delete ; void operator = ( const vtkEvenlySpacedStreamlines2D & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
