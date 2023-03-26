## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMaskPoints.h
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
##  @class   vtkMaskPoints
##  @brief   selectively filter points
##
##  vtkMaskPoints is a filter that passes through points and point attributes
##  from input dataset. (Other geometry is not passed through.) It is
##  possible to mask every nth point, and to specify an initial offset
##  to begin masking from.
##  It is possible to also generate different random selections
##  (jittered strides, real random samples, and spatially stratified
##  random samples) from the input data.
##  The filter can also generate vertices (topological
##  primitives) as well as points. This is useful because vertices are
##  rendered while points are not.
##

## !!!Ignored construct:  # vtkMaskPoints_h [NewLine] # vtkMaskPoints_h [NewLine] # vtkFiltersCoreModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class VTKFILTERSCORE_EXPORT vtkMaskPoints : public vtkPolyDataAlgorithm { public :  Method used to pick points enum DistributionType { RANDOMIZED_ID_STRIDES , RANDOM_SAMPLING , SPATIALLY_STRATIFIED , UNIFORM_SPATIAL_BOUNDS , UNIFORM_SPATIAL_SURFACE , UNIFORM_SPATIAL_VOLUME } ; static vtkMaskPoints * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkMaskPoints :: IsTypeOf ( type ) ; } static vtkMaskPoints * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkMaskPoints * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkMaskPoints * NewInstance ( ) const { return vtkMaskPoints :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMaskPoints :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMaskPoints :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Turn on every nth point (strided sampling), ignored by random modes.
##  virtual void SetOnRatio ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << OnRatio  to  << _arg ) ; if ( this -> OnRatio != ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> OnRatio = ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetOnRatioMinValue ( ) { return 1 ; } virtual int GetOnRatioMaxValue ( ) { return VTK_INT_MAX ; } ; virtual int GetOnRatio ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OnRatio  of  << this -> OnRatio ) ; return this -> OnRatio ; } ; /@} /@{ *
##  Limit the number of points that can be passed through (i.e.,
##  sets the output sample size).
##  virtual void SetOnRatioMaximumNumberOfPoints ( vtkIdType _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << MaximumNumberOfPoints  to  << _arg ) ; if ( this -> MaximumNumberOfPoints != ( _arg < 0 ? 0 : ( _arg > VTK_ID_MAX ? VTK_ID_MAX : _arg ) ) ) { this -> MaximumNumberOfPoints = ( _arg < 0 ? 0 : ( _arg > VTK_ID_MAX ? VTK_ID_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual vtkIdType GetOnRatioMinValueMaximumNumberOfPointsMinValue ( ) { return 0 ; } virtual vtkIdType GetOnRatioMaxValueMaximumNumberOfPointsMaxValue ( ) { return VTK_ID_MAX ; } ; virtual vtkIdType GetOnRatioMaximumNumberOfPoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumNumberOfPoints  of  << this -> MaximumNumberOfPoints ) ; return this -> MaximumNumberOfPoints ; } ; /@} /@{ *
##  Start sampling with this point. Ignored by certain random modes.
##  virtual void SetOnRatioMaximumNumberOfPointsOffset ( vtkIdType _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Offset  to  << _arg ) ; if ( this -> Offset != ( _arg < 0 ? 0 : ( _arg > VTK_ID_MAX ? VTK_ID_MAX : _arg ) ) ) { this -> Offset = ( _arg < 0 ? 0 : ( _arg > VTK_ID_MAX ? VTK_ID_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual vtkIdType GetOnRatioMinValueMaximumNumberOfPointsMinValueOffsetMinValue ( ) { return 0 ; } virtual vtkIdType GetOnRatioMaxValueMaximumNumberOfPointsMaxValueOffsetMaxValue ( ) { return VTK_ID_MAX ; } ; virtual vtkIdType GetOnRatioMaximumNumberOfPointsOffset ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Offset  of  << this -> Offset ) ; return this -> Offset ; } ; /@} /@{ *
##  Special flag causes randomization of point selection.
##  virtual void SetRandomMode ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  RandomMode  to  << _arg ) ; if ( this -> RandomMode != _arg ) { this -> RandomMode = _arg ; this -> Modified ( ) ; } } ; virtual bool GetOnRatioMaximumNumberOfPointsOffsetRandomMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RandomMode  of  << this -> RandomMode ) ; return this -> RandomMode ; } ; virtual void RandomModeOn ( ) { this -> SetRandomMode ( static_cast < bool > ( 1 ) ) ; } virtual void RandomModeOff ( ) { this -> SetRandomMode ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get Seed used for generating a spatially uniform distributions.
##  default is 1.
##  virtual void SetRandomModeRandomSeed ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  RandomSeed  to  << _arg ) ; if ( this -> RandomSeed != _arg ) { this -> RandomSeed = _arg ; this -> Modified ( ) ; } } ; virtual int GetOnRatioMaximumNumberOfPointsOffsetRandomModeRandomSeed ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RandomSeed  of  << this -> RandomSeed ) ; return this -> RandomSeed ; } ; /@} /@{ *
##  Special mode selector that switches between random mode types.
##  0 - randomized strides: randomly strides through the data (default);
##  fairly certain that this is not a statistically random sample
##  because the output depends on the order of the input and
##  the input points do not have an equal chance to appear in the output
##  (plus Vitter's incremental random algorithms are more complex
##  than this, while not a proof it is good indication this isn't
##  a statistically random sample - the closest would be algorithm S)
##  1 - random sample: create a statistically random sample using Vitter's
##  incremental algorithm D without A described in Vitter
##  "Faster Mthods for Random Sampling", Communications of the ACM
##  Volume 27, Issue 7, 1984
##  (OnRatio and Offset are ignored) O(sample size)
##  2 - spatially stratified random sample: create a spatially
##  stratified random sample using the first method described in
##  Woodring et al. "In-situ Sampling of a Large-Scale Particle
##  Simulation for Interactive Visualization and Analysis",
##  Computer Graphics Forum, 2011 (EuroVis 2011).
##  (OnRatio and Offset are ignored) O(N log N)
##  3 - spatially uniform (bound based): point randomly sampled
##  using a point locator and random positions inside the bounds
##  of the data set.
##  4 - spatially uniform (surface based): points randomly sampled
##  via an inverse transform on surface area of each cell.
##  Note that 3D cells are ignored.
##  5 - spatially uniform (volume based): points randomly sampled via an
##  inverse transform on volume area of each cell.
##  Note that 2D cells are ignored.
##  virtual void SetOnRatioMaximumNumberOfPointsOffsetRandomModeType ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << RandomModeType  to  << _arg ) ; if ( this -> RandomModeType != ( _arg < RANDOMIZED_ID_STRIDES ? RANDOMIZED_ID_STRIDES : ( _arg > UNIFORM_SPATIAL_VOLUME ? UNIFORM_SPATIAL_VOLUME : _arg ) ) ) { this -> RandomModeType = ( _arg < RANDOMIZED_ID_STRIDES ? RANDOMIZED_ID_STRIDES : ( _arg > UNIFORM_SPATIAL_VOLUME ? UNIFORM_SPATIAL_VOLUME : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetOnRatioMinValueMaximumNumberOfPointsMinValueOffsetMinValueRandomModeTypeMinValue ( ) { return RANDOMIZED_ID_STRIDES ; } virtual int GetOnRatioMaxValueMaximumNumberOfPointsMaxValueOffsetMaxValueRandomModeTypeMaxValue ( ) { return UNIFORM_SPATIAL_VOLUME ; } ; virtual int GetOnRatioMaximumNumberOfPointsOffsetRandomModeRandomSeedRandomModeType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RandomModeType  of  << this -> RandomModeType ) ; return this -> RandomModeType ; } ; /@} /@{ *
##  THIS ONLY WORKS WITH THE PARALLEL IMPLEMENTATION vtkPMaskPoints RUNNING
##  IN PARALLEL.
##  NOTHING WILL CHANGE IF THIS IS NOT THE PARALLEL vtkPMaskPoints.
##  Determines whether maximum number of points is taken per processor
##  (default) or if the maximum number of points is proportionally
##  taken across processors (i.e., number of points per
##  processor = points on a processor * maximum number of points /
##  total points across all processors).  In the first case,
##  the total number of points = maximum number of points *
##  number of processors.  In the second case, the total number of
##  points = maximum number of points.
##  virtual void SetRandomModeRandomSeedProportionalMaximumNumberOfPoints ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ProportionalMaximumNumberOfPoints  to  << _arg ) ; if ( this -> ProportionalMaximumNumberOfPoints != _arg ) { this -> ProportionalMaximumNumberOfPoints = _arg ; this -> Modified ( ) ; } } ; virtual bool GetOnRatioMaximumNumberOfPointsOffsetRandomModeRandomSeedRandomModeTypeProportionalMaximumNumberOfPoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ProportionalMaximumNumberOfPoints  of  << this -> ProportionalMaximumNumberOfPoints ) ; return this -> ProportionalMaximumNumberOfPoints ; } ; virtual void ProportionalMaximumNumberOfPointsOn ( ) { this -> SetRandomModeProportionalMaximumNumberOfPoints ( static_cast < bool > ( 1 ) ) ; } virtual void ProportionalMaximumNumberOfPointsOff ( ) { this -> SetRandomModeProportionalMaximumNumberOfPoints ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Generate output polydata vertices as well as points. A useful
##  convenience method because vertices are drawn (they are topology) while
##  points are not (they are geometry). By default this method is off.
##  virtual void SetRandomModeRandomSeedProportionalMaximumNumberOfPointsGenerateVertices ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateVertices  to  << _arg ) ; if ( this -> GenerateVertices != _arg ) { this -> GenerateVertices = _arg ; this -> Modified ( ) ; } } ; virtual bool GetOnRatioMaximumNumberOfPointsOffsetRandomModeRandomSeedRandomModeTypeProportionalMaximumNumberOfPointsGenerateVertices ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateVertices  of  << this -> GenerateVertices ) ; return this -> GenerateVertices ; } ; virtual void GenerateVerticesOn ( ) { this -> SetRandomModeProportionalMaximumNumberOfPointsGenerateVertices ( static_cast < bool > ( 1 ) ) ; } virtual void GenerateVerticesOff ( ) { this -> SetRandomModeProportionalMaximumNumberOfPointsGenerateVertices ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  When vertex generation is enabled, by default vertices are produced
##  as multi-vertex cells (more than one per cell), if you wish to have
##  a single vertex per cell, enable this flag.
##  virtual void SetRandomModeRandomSeedProportionalMaximumNumberOfPointsGenerateVerticesSingleVertexPerCell ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SingleVertexPerCell  to  << _arg ) ; if ( this -> SingleVertexPerCell != _arg ) { this -> SingleVertexPerCell = _arg ; this -> Modified ( ) ; } } ; virtual bool GetOnRatioMaximumNumberOfPointsOffsetRandomModeRandomSeedRandomModeTypeProportionalMaximumNumberOfPointsGenerateVerticesSingleVertexPerCell ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SingleVertexPerCell  of  << this -> SingleVertexPerCell ) ; return this -> SingleVertexPerCell ; } ; virtual void SingleVertexPerCellOn ( ) { this -> SetRandomModeProportionalMaximumNumberOfPointsGenerateVerticesSingleVertexPerCell ( static_cast < bool > ( 1 ) ) ; } virtual void SingleVertexPerCellOff ( ) { this -> SetRandomModeProportionalMaximumNumberOfPointsGenerateVerticesSingleVertexPerCell ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/get the desired precision for the output types. See the documentation
##  for the vtkAlgorithm::DesiredOutputPrecision enum for an explanation of
##  the available precision settings.
##  virtual void SetRandomModeRandomSeedProportionalMaximumNumberOfPointsGenerateVerticesSingleVertexPerCellOutputPointsPrecision ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutputPointsPrecision  to  << _arg ) ; if ( this -> OutputPointsPrecision != _arg ) { this -> OutputPointsPrecision = _arg ; this -> Modified ( ) ; } } ; virtual int GetOnRatioMaximumNumberOfPointsOffsetRandomModeRandomSeedRandomModeTypeProportionalMaximumNumberOfPointsGenerateVerticesSingleVertexPerCellOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ; /@} protected : vtkMaskPoints ( ) ; ~ vtkMaskPoints ( ) override = default ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; int OnRatio = 2 ;  every OnRatio point is on; all others are off. vtkIdType Offset = 0 ;  or starting point id. bool RandomMode = false ;  turn on/off randomization. int RandomSeed = 1 ; vtkIdType MaximumNumberOfPoints ; bool GenerateVertices = false ;  generate polydata verts bool SingleVertexPerCell = false ; int RandomModeType = RANDOMIZED_ID_STRIDES ; bool ProportionalMaximumNumberOfPoints = false ; int OutputPointsPrecision = DEFAULT_PRECISION ; virtual void InternalScatter ( unsigned long * , unsigned long * , int , int ) { } virtual void InternalGather ( unsigned long * , unsigned long * , int , int ) { } virtual void InternalBroadcast ( double * , int , int ) { } virtual void InternalGather ( double * , double * , int , int ) { } virtual int InternalGetNumberOfProcesses ( ) { return 1 ; } virtual int InternalGetLocalProcessId ( ) { return 0 ; } virtual void InternalSplitController ( int , int ) { } virtual void InternalResetController ( ) { } virtual void InternalBarrier ( ) { } unsigned long GetLocalSampleSize ( vtkIdType , int ) ; double GetLocalAreaFactor ( double , int ) ; private : vtkMaskPoints ( const vtkMaskPoints & ) = delete ; void operator = ( const vtkMaskPoints & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
