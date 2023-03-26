## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkVectorFieldTopology.h
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
##  @class   vtkVectorFieldTopology
##  @brief   Extract the topological skeleton as output datasets
##
##  vtkVectorFieldTopology is a filter that extracts the critical points and the 1D separatrices
##  (lines) If the data is 3D and the user enables ComputeSurfaces, also the 2D separatrices are
##  computed (surfaces)
##
##  @par Thanks:
##  Developed by Roxana Bujack and Karen Tsai at Los Alamos National Laboratory under LDRD 20190143ER
##

## !!!Ignored construct:  # vtkVectorFieldTopology_h [NewLine] # vtkVectorFieldTopology_h [NewLine] # vtkFiltersFlowPathsModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] # vtkStreamTracer.h  for vtkStreamSurface::CELL_LENGTH_UNIT [NewLine] class vtkGradientFilter ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkImageData"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkStreamSurface"
discard "forward decl of vtkUnstructuredGrid"
## !!!Ignored construct:  class VTKFILTERSFLOWPATHS_EXPORT vtkVectorFieldTopology : public vtkPolyDataAlgorithm { public : static vtkVectorFieldTopology * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkVectorFieldTopology :: IsTypeOf ( type ) ; } static vtkVectorFieldTopology * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkVectorFieldTopology * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkVectorFieldTopology * NewInstance ( ) const { return vtkVectorFieldTopology :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkVectorFieldTopology :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkVectorFieldTopology :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Specify a uniform integration step unit for MinimumIntegrationStep,
##  InitialIntegrationStep, and MaximumIntegrationStep.
##  1 = LENGTH_UNIT, i.e. all sizes are expresed in coordinate scale or cell scale
##  2 = CELL_LENGTH_UNIT, i.e. all sizes are expresed in cell scale
##  virtual void SetIntegrationStepUnit ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  IntegrationStepUnit  to  << _arg ) ; if ( this -> IntegrationStepUnit != _arg ) { this -> IntegrationStepUnit = _arg ; this -> Modified ( ) ; } } ; virtual int GetIntegrationStepUnit ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IntegrationStepUnit  of  << this -> IntegrationStepUnit ) ; return this -> IntegrationStepUnit ; } ; /@} /@{ *
##  Specify/see the maximal number of iterations in this class and in vtkStreamTracer
##  virtual void SetIntegrationStepUnitMaxNumSteps ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MaxNumSteps  to  << _arg ) ; if ( this -> MaxNumSteps != _arg ) { this -> MaxNumSteps = _arg ; this -> Modified ( ) ; } } ; virtual int GetIntegrationStepUnitMaxNumSteps ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaxNumSteps  of  << this -> MaxNumSteps ) ; return this -> MaxNumSteps ; } ; /@} /@{ *
##  Specify the Initial, minimum, and maximum step size used for line integration,
##  expressed in IntegrationStepUnit
##  virtual void SetIntegrationStepUnitMaxNumStepsIntegrationStepSize ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  IntegrationStepSize  to  << _arg ) ; if ( this -> IntegrationStepSize != _arg ) { this -> IntegrationStepSize = _arg ; this -> Modified ( ) ; } } ; virtual double GetIntegrationStepUnitMaxNumStepsIntegrationStepSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IntegrationStepSize  of  << this -> IntegrationStepSize ) ; return this -> IntegrationStepSize ; } ; /@} /@{ *
##  Specify/see the distance by which the seedpoints of the separatrices are placed away from the
##  saddle expressed in IntegrationStepUnit
##  virtual void SetIntegrationStepUnitMaxNumStepsIntegrationStepSizeSeparatrixDistance ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SeparatrixDistance  to  << _arg ) ; if ( this -> SeparatrixDistance != _arg ) { this -> SeparatrixDistance = _arg ; this -> Modified ( ) ; } } ; virtual double GetIntegrationStepUnitMaxNumStepsIntegrationStepSizeSeparatrixDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SeparatrixDistance  of  << this -> SeparatrixDistance ) ; return this -> SeparatrixDistance ; } ; /@} /@{ *
##  Specify/see if the simple (fast) or iterative (correct) version is called
##  virtual void SetIntegrationStepUnitMaxNumStepsIntegrationStepSizeSeparatrixDistanceUseIterativeSeeding ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseIterativeSeeding  to  << _arg ) ; if ( this -> UseIterativeSeeding != _arg ) { this -> UseIterativeSeeding = _arg ; this -> Modified ( ) ; } } ; virtual bool GetIntegrationStepUnitMaxNumStepsIntegrationStepSizeSeparatrixDistanceUseIterativeSeeding ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseIterativeSeeding  of  << this -> UseIterativeSeeding ) ; return this -> UseIterativeSeeding ; } ; /@} /@{ *
##  Specify/see if the separatring surfaces (separatrices in 3D) are computed or not
##  virtual void SetIntegrationStepUnitMaxNumStepsIntegrationStepSizeSeparatrixDistanceUseIterativeSeedingComputeSurfaces ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeSurfaces  to  << _arg ) ; if ( this -> ComputeSurfaces != _arg ) { this -> ComputeSurfaces = _arg ; this -> Modified ( ) ; } } ; virtual bool GetIntegrationStepUnitMaxNumStepsIntegrationStepSizeSeparatrixDistanceUseIterativeSeedingComputeSurfaces ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeSurfaces  of  << this -> ComputeSurfaces ) ; return this -> ComputeSurfaces ; } ; /@} /@{ *
##  Specify/see if the boundary cells are treated or not
##  virtual void SetIntegrationStepUnitMaxNumStepsIntegrationStepSizeSeparatrixDistanceUseIterativeSeedingComputeSurfacesExcludeBoundary ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ExcludeBoundary  to  << _arg ) ; if ( this -> ExcludeBoundary != _arg ) { this -> ExcludeBoundary = _arg ; this -> Modified ( ) ; } } ; virtual bool GetIntegrationStepUnitMaxNumStepsIntegrationStepSizeSeparatrixDistanceUseIterativeSeedingComputeSurfacesExcludeBoundary ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ExcludeBoundary  of  << this -> ExcludeBoundary ) ; return this -> ExcludeBoundary ; } ; /@} @{ *
##  Specify/see whether to use boundary switch points/lines points as seeds or not
##  virtual void SetIntegrationStepUnitMaxNumStepsIntegrationStepSizeSeparatrixDistanceUseIterativeSeedingComputeSurfacesExcludeBoundaryUseBoundarySwitchPoints ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseBoundarySwitchPoints  to  << _arg ) ; if ( this -> UseBoundarySwitchPoints != _arg ) { this -> UseBoundarySwitchPoints = _arg ; this -> Modified ( ) ; } } ; virtual bool GetIntegrationStepUnitMaxNumStepsIntegrationStepSizeSeparatrixDistanceUseIterativeSeedingComputeSurfacesExcludeBoundaryUseBoundarySwitchPoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseBoundarySwitchPoints  of  << this -> UseBoundarySwitchPoints ) ; return this -> UseBoundarySwitchPoints ; } ; @} @{ *
##  Specify the VectorAngleThreshold to remove noisy boundary switch points/lines
##  When computing boundary switch point, if the vecotrs of the two points within a cell are almost
##  parallel, the boundary switch point computed is considered as a noise point. Let v0 and v1 be
##  the vectors of the two points, and their norm equal to 1. The dot product between them
##  Dot(v0,v1) = cos(theta), where theta is the angle between v0 and v1. When v0 and v1 are almost
##  parallel, abs(Dot(v0,v1)) is close to 1. The range of this threshold is [0,1]. For any
##  abs(Dot(v0,v1)) > VectorAngleThreshold, the boundary switch point computed is a noise point.
##  virtual void SetIntegrationStepUnitMaxNumStepsIntegrationStepSizeSeparatrixDistanceUseIterativeSeedingComputeSurfacesExcludeBoundaryUseBoundarySwitchPointsVectorAngleThreshold ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  VectorAngleThreshold  to  << _arg ) ; if ( this -> VectorAngleThreshold != _arg ) { this -> VectorAngleThreshold = _arg ; this -> Modified ( ) ; } } ; virtual double GetIntegrationStepUnitMaxNumStepsIntegrationStepSizeSeparatrixDistanceUseIterativeSeedingComputeSurfacesExcludeBoundaryUseBoundarySwitchPointsVectorAngleThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << VectorAngleThreshold  of  << this -> VectorAngleThreshold ) ; return this -> VectorAngleThreshold ; } ; @} @{ *
##  Specify the OffsetAwayFromBoundary to shift seeds for computing separating lines/surfaces
##  virtual void SetIntegrationStepUnitMaxNumStepsIntegrationStepSizeSeparatrixDistanceUseIterativeSeedingComputeSurfacesExcludeBoundaryUseBoundarySwitchPointsVectorAngleThresholdOffsetAwayFromBoundary ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OffsetAwayFromBoundary  to  << _arg ) ; if ( this -> OffsetAwayFromBoundary != _arg ) { this -> OffsetAwayFromBoundary = _arg ; this -> Modified ( ) ; } } ; virtual double GetIntegrationStepUnitMaxNumStepsIntegrationStepSizeSeparatrixDistanceUseIterativeSeedingComputeSurfacesExcludeBoundaryUseBoundarySwitchPointsVectorAngleThresholdOffsetAwayFromBoundary ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OffsetAwayFromBoundary  of  << this -> OffsetAwayFromBoundary ) ; return this -> OffsetAwayFromBoundary ; } ; @} @{ *
##  Specify EpsilonCriticalPoint for classifying critical points. The default is 1e-10.
##  virtual void SetIntegrationStepUnitMaxNumStepsIntegrationStepSizeSeparatrixDistanceUseIterativeSeedingComputeSurfacesExcludeBoundaryUseBoundarySwitchPointsVectorAngleThresholdOffsetAwayFromBoundaryEpsilonCriticalPoint ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  EpsilonCriticalPoint  to  << _arg ) ; if ( this -> EpsilonCriticalPoint != _arg ) { this -> EpsilonCriticalPoint = _arg ; this -> Modified ( ) ; } } ; virtual double GetIntegrationStepUnitMaxNumStepsIntegrationStepSizeSeparatrixDistanceUseIterativeSeedingComputeSurfacesExcludeBoundaryUseBoundarySwitchPointsVectorAngleThresholdOffsetAwayFromBoundaryEpsilonCriticalPoint ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EpsilonCriticalPoint  of  << this -> EpsilonCriticalPoint ) ; return this -> EpsilonCriticalPoint ; } ; @} *
##  Set the type of the velocity field interpolator to determine whether
##  INTERPOLATOR_WITH_DATASET_POINT_LOCATOR or INTERPOLATOR_WITH_CELL_LOCATOR is employed for
##  locating cells during streamline integration.
##  void SetInterpolatorType ( int interpType ) ; *
##  Set the velocity field interpolator type to the one involving a cell locator.
##  void SetInterpolatorTypeToCellLocator ( ) ; *
##  Set the velocity field interpolator type to the one involving a dataset point locator.
##  void SetInterpolatorTypeToDataSetPointLocator ( ) ; protected : vtkVectorFieldTopology ( ) ; ~ vtkVectorFieldTopology ( ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; int FillOutputPortInformation ( int port , vtkInformation * info ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkVectorFieldTopology ( const vtkVectorFieldTopology & ) = delete ; void operator = ( const vtkVectorFieldTopology & ) = delete ; *
##  This function checks the values of flags, such as UseBoundarySwitchPoints and ExcludeBoundary
##  int Validate ( ) ; *
##  main function if input is vtkImageData
##  triangulate, compute critical points, separatrices, and surfaces
##  @param dataset: the input dataset
##  @param tridataset: the triangulated version of the input dataset
##  @return 1 if successfully terminated
##  int ImageDataPrepare ( vtkDataSet * dataSetInput , vtkUnstructuredGrid * tridataset ) ; *
##  main function if input is vtkUnstructuredGrid
##  triangulate if necessary, compute critical points, separatrices, and surfaces
##  @param dataset: the input dataset
##  @param tridataset: the triangulated version of the input dataset
##  @return 1 if successfully terminated
##  int UnstructuredGridPrepare ( vtkDataSet * dataSetInput , vtkUnstructuredGrid * tridataset ) ; *
##  delete the cells that touch the boundary
##  @param tridataset: input vector field after triangulation
##  @return 1 if successful, 0 if not
##  int RemoveBoundary ( vtkSmartPointer < vtkUnstructuredGrid > tridataset ) ; *
##  for each triangle, we solve the linear vector field analytically for its zeros
##   if this location is inside the triangle, we have found a critical point
##  @param criticalPoints: list of the locations where the vf is zero
##  @param tridataset: input vector field after triangulation
##  @return 1 if successful, 0 if not
##  int ComputeCriticalPoints2D ( vtkSmartPointer < vtkPolyData > criticalPoints , vtkSmartPointer < vtkUnstructuredGrid > tridataset ) ; *
##  for each tetrahedron, we solve the linear vector field analytically for its zeros
##   if this location is inside the tetrahedron, we have found a critical point
##  @param criticalPoints: list of the locations where the vf is zero
##  @param tridataset: input vector field after tetrahedrization
##  @return 1 if successfully terminated
##  int ComputeCriticalPoints3D ( vtkSmartPointer < vtkPolyData > criticalPoints , vtkSmartPointer < vtkUnstructuredGrid > tridataset ) ; *
##  Given 1D position x0 <= x <= x1, and two 3-vectors v0 and v1, this functions interpolates a
##  3-vector at x.
##  @param x0: minimum 1D position
##  @param x1: maximum 1D position
##  @param x: target 1D position
##  @param v0: 3-vector at x0
##  @param v1: 3-vector at x1
##  @param v: output 3-vector at x
##  static void InterpolateVector ( double x0 , double x1 , double x , const double v0 [ 3 ] , const double v1 [ 3 ] , double v [ 3 ] ) ; *
##  This functions compute boundary switch points from boundaries that are lines.
##  @param boundarySwitchPoints: list of the locations of the boundary switch points
##  @param tridataset: input vector field after triangulation
##  @return 1 if successful, 0 if not
##  int ComputeBoundarySwitchPoints ( vtkPolyData * boundarySwitchPoints , vtkUnstructuredGrid * tridataset ) ; *
##  This function computes separatrix lines using boundary switch points, by using the
##  vtkStreamTracer filter
##  @param boundarySwitchPoints: list of the locations of boundaries where the directions of the
##  flow change
##  @param separatrices: inegration lines
##  @param dataset: input vector field
##  @param interestPoints: a set of points that includes both critical points and boundary switch
##  points
##  @param integrationStepUnit: whether the sizes are expresed in coordinate scale or cell scale
##  @param dist: size of the offset of the seeding
##  @param stepSize: stepsize of the integrator
##  @param maxNumSteps: maximal number of integration steps
##  @return 1 if successfully terminated
##  int ComputeSeparatricesBoundarySwitchPoints ( vtkPolyData * boundarySwitchPoints , vtkPolyData * separatrices , vtkDataSet * dataset , vtkPoints * interestPoints , int integrationStepUnit , double dist , int maxNumSteps ) ; *
##  This function computes boundary switch lines from boundaries that surfaces.
##  It then computes separatrix surfaces using boundary switch lines, by using the
##  vtkStreamSurfaces filter.
##  @param boundarySwitchLines: list of the locations of boundaries where the directions of the
##  flow change
##  @param separatrices: inegration surfaces
##  @param dataset: input vector field
##  @param integrationStepUnit: whether the sizes are expresed in coordinate scale or cell scale
##  @param dist: size of the offset of the seeding
##  @param stepSize: stepsize of the integrator
##  @param maxNumSteps: maximal number of integration steps
##  @param computeSurfaces: depending on this boolen the separatring surfaces are computed or not
##  @param useIterativeSeeding: depending on this boolen the separatring surfaces  are computed
##  either good or fast
##  @return 1 if successfully terminated
##  int ComputeSeparatricesBoundarySwitchLines ( vtkPolyData * boundarySwitchLines , vtkPolyData * separatrices , vtkDataSet * dataset , int integrationStepUnit , double dist , int maxNumSteps , bool computeSurfaces , bool useIterativeSeeding ) ; *
##  we classify the critical points based on the eigenvalues of the jacobian
##  for the saddles, we seed in an offset of dist and integrate
##  @param criticalPoints: list of the locations where the vf is zero
##  @param separatrices: inegration lines starting at saddles
##  @param surfaces: inegration surfaces starting at saddles
##  @param dataset: input vector field
##  @param interestPoints: a set of points that includes both critical points and boundary switch
##  points
##  @param integrationStepUnit: whether the sizes are expresed in coordinate scale or cell scale
##  @param dist: size of the offset of the seeding
##  @param stepSize: stepsize of the integrator
##  @param maxNumSteps: maximal number of integration steps
##  @param computeSurfaces: depending on this boolen the separatring surfaces are computed or not
##  @param useIterativeSeeding: depending on this boolen the separatring surfaces  are computed
##  either good or fast
##  @return 1 if successfully terminated
##  int ComputeSeparatrices ( vtkPolyData * criticalPoints , vtkPolyData * separatrices , vtkPolyData * surfaces , vtkDataSet * dataset , vtkPoints * interestPoints , int integrationStepUnit , double dist , double stepSize , int maxNumSteps , bool computeSurfaces , bool useIterativeSeeding ) ; *
##  this method computes streamsurfaces
##  in the plane of the two eigenvectors of the same sign around saddles
##  @param isBackward: is 1 if the integration direction is backward and 0 for forward
##  @param normal: direction along the one eigenvector with opposite sign
##  @param zeroPos: location of the saddle
##  @param streamSurfaces: surfaces that have so far been computed
##  @param dataset: the vector field in which we advect
##  @param integrationStepUnit: whether the sizes are expresed in coordinate scale or cell scale
##  @param dist: size of the offset of the seeding
##  @param stepSize: stepsize of the integrator
##  @param maxNumSteps: maximal number of integration steps
##  @param useIterativeSeeding: depending on this boolen the separatring surfaces  are computed
##  either good or fast
##  @return 1 if successful, 0 if empty
##  int ComputeSurface ( int numberOfSeparatingSurfaces , bool isBackward , double normal [ 3 ] , double zeroPos [ 3 ] , vtkPolyData * streamSurfaces , vtkDataSet * dataset , int integrationStepUnit , double dist , double stepSize , int maxNumSteps , bool useIterativeSeeding ) ; *
##  simple type that corresponds to the number of positive eigenvalues
##  in analogy to ttk, where the type corresponds to the down directions
##  enum CriticalType2D { DEGENERATE_2D = - 1 , SINK_2D = 0 , SADDLE_2D = 1 , SOURCE_2D = 2 , CENTER_2D = 3 } ; *
##  detailed type that additionally distinguishes nodes from foci
##  nomenclature as in James Helman, Hesselink: "Visualizing Vector Field Topology in Fluid Flows"
##  enum CriticalTypeDetailed2D {     DEGENERATE2D = -1, ATTRACTING_NODE_2D = 0 , ATTRACTING_FOCUS_2D = 1 , NODE_SADDLE_2D = 2 , REPELLING_NODE_2D = 3 , REPELLING_FOCUS_2D = 4 , CENTER_DETAILED_2D = 5 } ; *
##  simple type that corresponds to the number of positive eigenvalues
##  in analogy to ttk, where the type corresponds to the down directions
##  enum CriticalType3D { DEGENERATE_3D = - 1 , SINK_3D = 0 , SADDLE_1_3D = 1 , SADDLE_2_3D = 2 , SOURCE_3D = 3 , CENTER_3D = 4 } ; *
##  detailed type that additionally distinguishes nodes from foci
##  nomenclature as in James Helman, Hesselink: "Visualizing Vector Field Topology in Fluid Flows"
##  enum CriticalTypeDetailed3D { ATTRACTING_NODE_3D = 0 , ATTRACTING_FOCUS_3D = 1 , NODE_SADDLE_1_3D = 2 , FOCUS_SADDLE_1_3D = 3 , NODE_SADDLE_2_3D = 4 , FOCUS_SADDLE_2_3D = 5 , REPELLING_NODE_3D = 6 , REPELLING_FOCUS_3D = 7 , CENTER_DETAILED_3D = 8 } ; *
##  determine which type of critical point we have based on the eigenvalues of the Jacobian in 2D
##  @param countReal: number of complex valued eigenvalues
##  @param countPos: number of positive eigenvalues
##  @param countNeg: number of negative eigenvalues
##  @return type of critical point: SOURCE_2D 2, SADDLE_2D 1, SINK_2D 0, (CENTER_2D 3)
##  static int Classify2D ( int countComplex , int countPos , int countNeg ) ; *
##  determine which type of critical point we have including distinction between node and spiral
##  @param countReal: number of complex valued eigenvalues
##  @param countPos: number of positive eigenvalues
##  @param countNeg: number of negative eigenvalues
##  @return type of critical point: ATTRACTING_NODE_2D 0, ATTRACTING_FOCUS_2D 1, NODE_SADDLE_2D 2,
##  REPELLING_NODE_2D 3, REPELLING_FOCUS_2D 4, CENTER_DETAILED_2D 5,
##  static int ClassifyDetailed2D ( int countComplex , int countPos , int countNeg ) ; *
##  determine which type of critical point we have based on the eigenvalues of the Jacobian in 3D
##  @param countReal: number of complex valued eigenvalues
##  @param countPos: number of positive eigenvalues
##  @param countNeg: number of negative eigenvalues
##  @return type of critical point: SOURCE_3D 3, SADDLE_2_3D 2, SADDLE_1_3D 1, SINK_3D 0,
##  (CENTER_3D 4)
##  static int Classify3D ( int countComplex , int countPos , int countNeg ) ; *
##  determine which type of critical point we have including distinction between node and spiral
##  @param countReal: number of complex valued eigenvalues
##  @param countPos: number of positive eigenvalues
##  @param countNeg: number of negative eigenvalues
##  @return type of critical point: ATTRACTING_NODE_3D 0, ATTRACTING_FOCUS_3D 1, NODE_SADDLE_1_3D
##  2, FOCUS_SADDLE_1_3D 3, NODE_SADDLE_2_3D 4, FOCUS_SADDLE_2_3D 5, REPELLING_NODE_3D 6,
##  REPELLING_FOCUS_3D 7, CENTER_DETAILED_3D 8
##  static int ClassifyDetailed3D ( int countComplex , int countPos , int countNeg ) ; *
##  number of iterations in this class and in vtkStreamTracer
##  int MaxNumSteps = 100 ; *
##  this value is used as stepsize for the integration
##  double IntegrationStepSize = 1 ; *
##  the separatrices are seeded with this offset from the critical points
##  double SeparatrixDistance = 1 ; *
##  depending on this boolen the simple (fast) or iterative (correct) version is called
##  bool UseIterativeSeeding = false ; *
##  depending on this boolen the separatring surfaces (separatrices in 3D) are computed or not
##  bool ComputeSurfaces = false ; *
##  the name of the array in pointdata that is being processed
##  const char * NameOfVectorArray ; *
##  depending on this boolen the cells touching the boundary of the input dataset are treated or
##  not this prevents detection of the whole boundary in no slip boundary settings
##  bool ExcludeBoundary = false ; *
##  dimension of the input data: 2 or 3
##  int Dimension = 2 ; *
##  Analogous to integration step unit in vtkStreamTracer
##  Specify a uniform integration step unit for MinimumIntegrationStep,
##  InitialIntegrationStep, and MaximumIntegrationStep. NOTE: The valid
##  unit is now limited to only LENGTH_UNIT (1) and CELL_LENGTH_UNIT (2),
##  EXCLUDING the previously-supported TIME_UNIT.
##  int IntegrationStepUnit = vtkStreamTracer :: CELL_LENGTH_UNIT ; *
##  Use boundary switch points/lines as seeds to compute seperatrix.
##  For 2D data, seeds are boundary switch points
##  For 3D data, seeds are boundary switch lines instead of points.
##  The default is to use critical points only.
##  bool UseBoundarySwitchPoints = false ; *
##   It is either vtkStreamTracer::INTERPOLATOR_WITH_DATASET_POINT_LOCATOR or
##  vtkStreamTracer::INTERPOLATOR_WITH_CELL_LOCATOR
##  int InterpolatorType = vtkStreamTracer :: INTERPOLATOR_WITH_DATASET_POINT_LOCATOR ; *
##  When computing boundary switch point, if the vecotrs of the two points within a cell are almost
##  parallel, the boundary switch point computed is considered as a noise point. Let v0 and v1 be
##  the vectors of the two points, and their norm equal to 1. The dot product between them
##  Dot(v0,v1) = cos(theta), where theta is the angle between v0 and v1. When v0 and v1 are almost
##  parallel, abs(Dot(v0,v1)) is close to 1. The range of this threshold is [0,1]. For any
##  abs(Dot(v0,v1)) > VectorAngleThreshold, the boundary switch point computed is a noise point.
##  double VectorAngleThreshold = 1 ; *
##  When computing the separatrix, seeds are used. Seeds need to be inside the boundary.
##  This ratio is used to computed the amount of shift that shifts seeds a little bit inward.
##  It is multiplied with the variable SeparatrixDistance.
##  If users choose integrationStepUnit == vtkStreamTracer::CELL_LENGTH_UNIT, which is default, it
##  is equivalent to OffsetAwayFromBoundary * cell length
##  double OffsetAwayFromBoundary = 1e-3 ; *
##  It is used to classify the type of critical points.
##  double EpsilonCriticalPoint = 1e-10 ; vtkNew < vtkStreamSurface > StreamSurface ; } ;
## Error: token expected: ; but got: [identifier]!!!
