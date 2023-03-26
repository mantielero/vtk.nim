## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPointSmoothingFilter.h
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
##  @class   vtkPointSmoothingFilter
##  @brief   adjust point positions to form a pleasing, packed arrangement
##
##
##  vtkPointSmoothingFilter modifies the coordinates of the input points of a
##  vtkPointSet by adjusting their position to create a smooth distribution
##  (and thereby form a pleasing packing of the points). Smoothing is
##  performed by considering the effects of neighboring points on one
##  another. Smoothing in its simplest form (geometric) is simply a variant of
##  Laplacian smoothing where each point moves towards the average position of
##  its neighboring points. Next, uniform smoothing uses a cubic cutoff
##  function to produce repulsive forces between close points and attractive
##  forces that are a little further away. Smoothing can be further controlled
##  either by a scalar field, by a tensor field, or a frame field (the user
##  can specify the nature of the smoothing operation). If controlled by a
##  scalar field, then each input point is assumed to be surrounded by a
##  isotropic sphere scaled by the scalar field; if controlled by a tensor
##  field, then each input point is assumed to be surrounded by an
##  anisotropic, oriented ellipsoid aligned to the the tensor eigenvectors and
##  scaled by the determinate of the tensor. A frame field also assumes a
##  surrounding, ellipsoidal shape except that the inversion of the ellipsoid
##  tensor is already performed. Typical usage of this filter is to perform a
##  smoothing (also referred to as packing) operation (i.e., first execute
##  this filter) and then combine it with a glyph filter (e.g., vtkTensorGlyph
##  or vtkGlyph3D) to visualize the packed points.
##
##  Smoothing depends on a local neighborhood of nearby points. In general,
##  the larger the neighborhood size, the greater the reduction in high
##  frequency information. (The memory and/or computational requirements of
##  the algorithm may also significantly increase.) The PackingRadius (and
##  PackingFactor) controls what points are considered close. The
##  PackingRadius can be computed automatically, or specified by the user.
##  (The product of PackingRadius*PackingFactor is referred to as the scaling
##  factor alpha in the paper cited below. This provides a convenient way to
##  combine automatic PackingRadius computation based on average between
##  particle neighborhoods, and then adjust it with the PackingFactor.)
##
##  Any vtkPointSet type can be provided as input, and the output will contain
##  the same number of new points each of which is adjusted to a new position.
##
##  Note that the algorithm requires the use of a spatial point locator. The
##  point locator is used to build a local neighborhood of the points
##  surrounding each point. It is also used to perform interpolation as the
##  point positions are adjusted.
##
##  The algorithm incrementally adjusts the point positions through an
##  iterative process. Basically points are moved due to the influence of
##  neighboring points. Iterations continue until the specified number of
##  iterations is reached, or convergence occurs. Convergence occurs when the
##  maximum displacement of any point is less than the convergence value. As
##  points move, both the local connectivity and data attributes associated
##  with each point must be updated. Rather than performing these expensive
##  operations after every iteration, a number of sub-iterations Si can be
##  specified. If Si > 1, then the neighborhood and attribute value updates
##  occur only every Si'th iteration. Using sub-iterations can improve
##  performance significantly.
##
##  @warning
##  Geometric smoothing defines a one-sided attractive force between
##  particles. Thus particles tend to clump together, and the entire set of
##  points (with enough iterations and appropriate PackingRadius) can converge
##  to a single position. This can be mitigated by turning on point
##  constraints, which limit the movement of "boundary" points.
##
##  @warning
##  This class has been loosely inspired by the paper by Kindlmann and Westin
##  "Diffusion Tensor Visualization with Glyph Packing". However, several
##  computational shortcuts, and generalizations have been used for performance
##  and utility reasons.
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @sa
##  vtkTensorWidget vtkTensorGlyph vtkSmoothPolyDataFilter vtkGlyph3D
##

## !!!Ignored construct:  # vtkPointSmoothingFilter_h [NewLine] # vtkPointSmoothingFilter_h [NewLine] # vtkFiltersPointsModule.h  For export macro # vtkPointSetAlgorithm.h [NewLine] class vtkAbstractPointLocator ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDataArray"
discard "forward decl of vtkPlane"
## !!!Ignored construct:  class VTKFILTERSPOINTS_EXPORT vtkPointSmoothingFilter : public vtkPointSetAlgorithm { public : /@{ *
##  Standard methods for instantiation, obtaining type information, and
##  printing information.
##  static vtkPointSmoothingFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPointSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPointSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPointSmoothingFilter :: IsTypeOf ( type ) ; } static vtkPointSmoothingFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPointSmoothingFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPointSmoothingFilter * NewInstance ( ) const { return vtkPointSmoothingFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPointSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPointSmoothingFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPointSmoothingFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Specify the neighborhood size. This controls the number of surrounding
##  points that can affect a point to be smoothed.
##  virtual void SetNeighborhoodSize ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << NeighborhoodSize  to  << _arg ) ; if ( this -> NeighborhoodSize != ( _arg < 4 ? 4 : ( _arg > 128 ? 128 : _arg ) ) ) { this -> NeighborhoodSize = ( _arg < 4 ? 4 : ( _arg > 128 ? 128 : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetNeighborhoodSizeMinValue ( ) { return 4 ; } virtual int GetNeighborhoodSizeMaxValue ( ) { return 128 ; } ; virtual int GetNeighborhoodSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NeighborhoodSize  of  << this -> NeighborhoodSize ) ; return this -> NeighborhoodSize ; } ; /@} *
##  Specify how smoothing is to be controlled.
##  enum { DEFAULT_SMOOTHING = 0 , GEOMETRIC_SMOOTHING , UNIFORM_SMOOTHING , SCALAR_SMOOTHING , TENSOR_SMOOTHING , FRAME_FIELD_SMOOTHING } ; /@{ *
##  Control how smoothing is to be performed. By default, if a point frame
##  field is available then frame field smoothing will be performed; then if
##  point tensors are available then anisotropic tensor smoothing will be
##  used; the next choice is to use isotropic scalar smoothing; and finally
##  if no frame field, tensors, or scalars are available, uniform smoothing
##  will be used. If both scalars, tensors, and /or a frame field are
##  present, the user can specifiy which to use; or to use uniform or
##  geometric smoothing.
##  virtual void SetNeighborhoodSizeSmoothingMode ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << SmoothingMode  to  << _arg ) ; if ( this -> SmoothingMode != ( _arg < DEFAULT_SMOOTHING ? DEFAULT_SMOOTHING : ( _arg > FRAME_FIELD_SMOOTHING ? FRAME_FIELD_SMOOTHING : _arg ) ) ) { this -> SmoothingMode = ( _arg < DEFAULT_SMOOTHING ? DEFAULT_SMOOTHING : ( _arg > FRAME_FIELD_SMOOTHING ? FRAME_FIELD_SMOOTHING : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetNeighborhoodSizeMinValueSmoothingModeMinValue ( ) { return DEFAULT_SMOOTHING ; } virtual int GetNeighborhoodSizeMaxValueSmoothingModeMaxValue ( ) { return FRAME_FIELD_SMOOTHING ; } ; virtual int GetNeighborhoodSizeSmoothingMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SmoothingMode  of  << this -> SmoothingMode ) ; return this -> SmoothingMode ; } ; void SetSmoothingModeToDefault ( ) { this -> SetSmoothingMode ( DEFAULT_SMOOTHING ) ; } void SetSmoothingModeToGeometric ( ) { this -> SetSmoothingMode ( GEOMETRIC_SMOOTHING ) ; } void SetSmoothingModeToUniform ( ) { this -> SetSmoothingMode ( UNIFORM_SMOOTHING ) ; } void SetSmoothingModeToScalars ( ) { this -> SetSmoothingMode ( SCALAR_SMOOTHING ) ; } void SetSmoothingModeToTensors ( ) { this -> SetSmoothingMode ( TENSOR_SMOOTHING ) ; } void SetSmoothingModeToFrameField ( ) { this -> SetSmoothingMode ( FRAME_FIELD_SMOOTHING ) ; } /@} /@{ *
##  Specify the name of the frame field to use for smoothing. This
##  information is only necessary if a frame field smoothing is enabled.
##  virtual void SetFrameFieldArray ( vtkDataArray * ) ; virtual vtkDataArray * GetnameFrameFieldArray ( ) { vtkDebugWithObjectMacro ( this , <<  returning  FrameFieldArray  address  << static_cast < vtkDataArray * > ( this -> FrameFieldArray ) ) ; return this -> FrameFieldArray ; } ; /@} /@{ *
##  Specify the number of smoothing iterations.
##  virtual void SetNeighborhoodSizeSmoothingModeNumberOfIterations ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << NumberOfIterations  to  << _arg ) ; if ( this -> NumberOfIterations != ( _arg < 0 ? 0 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> NumberOfIterations = ( _arg < 0 ? 0 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetNeighborhoodSizeMinValueSmoothingModeMinValueNumberOfIterationsMinValue ( ) { return 0 ; } virtual int GetNeighborhoodSizeMaxValueSmoothingModeMaxValueNumberOfIterationsMaxValue ( ) { return VTK_INT_MAX ; } ; virtual int GetNeighborhoodSizeSmoothingModeNumberOfIterations ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfIterations  of  << this -> NumberOfIterations ) ; return this -> NumberOfIterations ; } ; /@} /@{ *
##  Specify the number of smoothing subiterations. This specifies the
##  frequency of connectivity and data attribute updates.
##  virtual void SetNeighborhoodSizeSmoothingModeNumberOfIterationsNumberOfSubIterations ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << NumberOfSubIterations  to  << _arg ) ; if ( this -> NumberOfSubIterations != ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> NumberOfSubIterations = ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetNeighborhoodSizeMinValueSmoothingModeMinValueNumberOfIterationsMinValueNumberOfSubIterationsMinValue ( ) { return 1 ; } virtual int GetNeighborhoodSizeMaxValueSmoothingModeMaxValueNumberOfIterationsMaxValueNumberOfSubIterationsMaxValue ( ) { return VTK_INT_MAX ; } ; virtual int GetNeighborhoodSizeSmoothingModeNumberOfIterationsNumberOfSubIterations ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfSubIterations  of  << this -> NumberOfSubIterations ) ; return this -> NumberOfSubIterations ; } ; /@} /@{ *
##  Specify the maximum smoothing step size for each smoothing iteration. This
##  step size limits the the distance over which a point can move in each
##  iteration.  As in all iterative methods, the stability of the process is
##  sensitive to this parameter. In general, small step size and large
##  numbers of iterations are more stable than a larger step size and a
##  smaller numbers of iterations.
##  virtual void SetNeighborhoodSizeSmoothingModeNumberOfIterationsNumberOfSubIterationsMaximumStepSize ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << MaximumStepSize  to  << _arg ) ; if ( this -> MaximumStepSize != ( _arg < 0.0 ? 0.0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ) { this -> MaximumStepSize = ( _arg < 0.0 ? 0.0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetNeighborhoodSizeMinValueSmoothingModeMinValueNumberOfIterationsMinValueNumberOfSubIterationsMinValueMaximumStepSizeMinValue ( ) { return 0.0 ; } virtual double GetNeighborhoodSizeMaxValueSmoothingModeMaxValueNumberOfIterationsMaxValueNumberOfSubIterationsMaxValueMaximumStepSizeMaxValue ( ) { return VTK_DOUBLE_MAX ; } ; virtual double GetNeighborhoodSizeSmoothingModeNumberOfIterationsNumberOfSubIterationsMaximumStepSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumStepSize  of  << this -> MaximumStepSize ) ; return this -> MaximumStepSize ; } ; /@} /@{ *
##  Specify a convergence criterion for the iteration
##  process. Smaller numbers result in more smoothing iterations.
##  virtual void SetNeighborhoodSizeSmoothingModeNumberOfIterationsNumberOfSubIterationsMaximumStepSizeConvergence ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Convergence  to  << _arg ) ; if ( this -> Convergence != ( _arg < 0.0 ? 0.0 : ( _arg > 1.0 ? 1.0 : _arg ) ) ) { this -> Convergence = ( _arg < 0.0 ? 0.0 : ( _arg > 1.0 ? 1.0 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetNeighborhoodSizeMinValueSmoothingModeMinValueNumberOfIterationsMinValueNumberOfSubIterationsMinValueMaximumStepSizeMinValueConvergenceMinValue ( ) { return 0.0 ; } virtual double GetNeighborhoodSizeMaxValueSmoothingModeMaxValueNumberOfIterationsMaxValueNumberOfSubIterationsMaxValueMaximumStepSizeMaxValueConvergenceMaxValue ( ) { return 1.0 ; } ; virtual double GetNeighborhoodSizeSmoothingModeNumberOfIterationsNumberOfSubIterationsMaximumStepSizeConvergence ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Convergence  of  << this -> Convergence ) ; return this -> Convergence ; } ; /@} /@{ *
##  Enable or disable constraints on points. Point constraints are used to
##  prevent points from moving, or to move only on a plane. This can prevent
##  shrinking or growing point clouds. If enabled, a local topological
##  anlysis is performed to determine whether a point should be marked
##  "Fixed" i.e., never moves; "Plane", the point only moves on a plane; or
##  "Unconstrained", the point can move freely. If all points in the
##  neighborhood surrounding a point are in the cone defined by FixedAngle,
##  then the point is classified "Fixed." If all points in the neighborhood
##  surrounding a point are in the cone defined by BoundaryAngle, then the
##  point is classified "Plane." (The angles are expressed in degrees.)
##  virtual void SetEnableConstraints ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  EnableConstraints  to  << _arg ) ; if ( this -> EnableConstraints != _arg ) { this -> EnableConstraints = _arg ; this -> Modified ( ) ; } } ; virtual bool GetNeighborhoodSizeSmoothingModeNumberOfIterationsNumberOfSubIterationsMaximumStepSizeConvergenceEnableConstraints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EnableConstraints  of  << this -> EnableConstraints ) ; return this -> EnableConstraints ; } ; virtual void EnableConstraintsOn ( ) { this -> SetEnableConstraints ( static_cast < bool > ( 1 ) ) ; } virtual void EnableConstraintsOff ( ) { this -> SetEnableConstraints ( static_cast < bool > ( 0 ) ) ; } ; virtual void SetNeighborhoodSizeSmoothingModeNumberOfIterationsNumberOfSubIterationsMaximumStepSizeConvergenceFixedAngle ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FixedAngle  to  << _arg ) ; if ( this -> FixedAngle != ( _arg < 0 ? 0 : ( _arg > 90 ? 90 : _arg ) ) ) { this -> FixedAngle = ( _arg < 0 ? 0 : ( _arg > 90 ? 90 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetNeighborhoodSizeMinValueSmoothingModeMinValueNumberOfIterationsMinValueNumberOfSubIterationsMinValueMaximumStepSizeMinValueConvergenceMinValueFixedAngleMinValue ( ) { return 0 ; } virtual double GetNeighborhoodSizeMaxValueSmoothingModeMaxValueNumberOfIterationsMaxValueNumberOfSubIterationsMaxValueMaximumStepSizeMaxValueConvergenceMaxValueFixedAngleMaxValue ( ) { return 90 ; } ; virtual double GetNeighborhoodSizeSmoothingModeNumberOfIterationsNumberOfSubIterationsMaximumStepSizeConvergenceEnableConstraintsFixedAngle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FixedAngle  of  << this -> FixedAngle ) ; return this -> FixedAngle ; } ; virtual void SetNeighborhoodSizeSmoothingModeNumberOfIterationsNumberOfSubIterationsMaximumStepSizeConvergenceFixedAngleBoundaryAngle ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << BoundaryAngle  to  << _arg ) ; if ( this -> BoundaryAngle != ( _arg < 0 ? 0 : ( _arg > 120 ? 120 : _arg ) ) ) { this -> BoundaryAngle = ( _arg < 0 ? 0 : ( _arg > 120 ? 120 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetNeighborhoodSizeMinValueSmoothingModeMinValueNumberOfIterationsMinValueNumberOfSubIterationsMinValueMaximumStepSizeMinValueConvergenceMinValueFixedAngleMinValueBoundaryAngleMinValue ( ) { return 0 ; } virtual double GetNeighborhoodSizeMaxValueSmoothingModeMaxValueNumberOfIterationsMaxValueNumberOfSubIterationsMaxValueMaximumStepSizeMaxValueConvergenceMaxValueFixedAngleMaxValueBoundaryAngleMaxValue ( ) { return 120 ; } ; virtual double GetNeighborhoodSizeSmoothingModeNumberOfIterationsNumberOfSubIterationsMaximumStepSizeConvergenceEnableConstraintsFixedAngleBoundaryAngle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BoundaryAngle  of  << this -> BoundaryAngle ) ; return this -> BoundaryAngle ; } ; /@} /@{ *
##  If point constraints are enabled, an output scalar indicating the
##  classification of points can be generated.
##  virtual void SetEnableConstraintsGenerateConstraintScalars ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateConstraintScalars  to  << _arg ) ; if ( this -> GenerateConstraintScalars != _arg ) { this -> GenerateConstraintScalars = _arg ; this -> Modified ( ) ; } } ; virtual bool GetNeighborhoodSizeSmoothingModeNumberOfIterationsNumberOfSubIterationsMaximumStepSizeConvergenceEnableConstraintsFixedAngleBoundaryAngleGenerateConstraintScalars ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateConstraintScalars  of  << this -> GenerateConstraintScalars ) ; return this -> GenerateConstraintScalars ; } ; virtual void GenerateConstraintScalarsOn ( ) { this -> SetEnableConstraintsGenerateConstraintScalars ( static_cast < bool > ( 1 ) ) ; } virtual void GenerateConstraintScalarsOff ( ) { this -> SetEnableConstraintsGenerateConstraintScalars ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  If point constraints are enabled, an output vector indicating the
##  average normal at each point can be generated.
##  virtual void SetEnableConstraintsGenerateConstraintScalarsGenerateConstraintNormals ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateConstraintNormals  to  << _arg ) ; if ( this -> GenerateConstraintNormals != _arg ) { this -> GenerateConstraintNormals = _arg ; this -> Modified ( ) ; } } ; virtual bool GetNeighborhoodSizeSmoothingModeNumberOfIterationsNumberOfSubIterationsMaximumStepSizeConvergenceEnableConstraintsFixedAngleBoundaryAngleGenerateConstraintScalarsGenerateConstraintNormals ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateConstraintNormals  of  << this -> GenerateConstraintNormals ) ; return this -> GenerateConstraintNormals ; } ; virtual void GenerateConstraintNormalsOn ( ) { this -> SetEnableConstraintsGenerateConstraintScalarsGenerateConstraintNormals ( static_cast < bool > ( 1 ) ) ; } virtual void GenerateConstraintNormalsOff ( ) { this -> SetEnableConstraintsGenerateConstraintScalarsGenerateConstraintNormals ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Enable / disable the computation of a packing radius. By default,
##  a packing radius is computed as one half of the average distance
##  between neighboring points. (Point neighbors are defined by the
##  neighborhood size.)
##  virtual void SetEnableConstraintsGenerateConstraintScalarsGenerateConstraintNormalsComputePackingRadius ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputePackingRadius  to  << _arg ) ; if ( this -> ComputePackingRadius != _arg ) { this -> ComputePackingRadius = _arg ; this -> Modified ( ) ; } } ; virtual bool GetNeighborhoodSizeSmoothingModeNumberOfIterationsNumberOfSubIterationsMaximumStepSizeConvergenceEnableConstraintsFixedAngleBoundaryAngleGenerateConstraintScalarsGenerateConstraintNormalsComputePackingRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputePackingRadius  of  << this -> ComputePackingRadius ) ; return this -> ComputePackingRadius ; } ; virtual void ComputePackingRadiusOn ( ) { this -> SetEnableConstraintsGenerateConstraintScalarsGenerateConstraintNormalsComputePackingRadius ( static_cast < bool > ( 1 ) ) ; } virtual void ComputePackingRadiusOff ( ) { this -> SetEnableConstraintsGenerateConstraintScalarsGenerateConstraintNormalsComputePackingRadius ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify the packing radius R. This only takes effect if
##  ComputePackingRadius is off. Note that the for two points separated by
##  radius r, a repulsive force is generated when 0<=r<=R, and a repulsive
##  force when R<=r<=(1+AttractionFactor*R). By default, the PackingRadius
##  is automatically computed, but when ComputePackingRadius is off, then
##  manually setting the PackingRadius is allowed. Note that the
##  PackingRadius is updated after the algorithm runs (useful to examine the
##  computed packing radius).
##  virtual void SetNeighborhoodSizeSmoothingModeNumberOfIterationsNumberOfSubIterationsMaximumStepSizeConvergenceFixedAngleBoundaryAnglePackingRadius ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << PackingRadius  to  << _arg ) ; if ( this -> PackingRadius != ( _arg < 0.0 ? 0.0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ) { this -> PackingRadius = ( _arg < 0.0 ? 0.0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetNeighborhoodSizeMinValueSmoothingModeMinValueNumberOfIterationsMinValueNumberOfSubIterationsMinValueMaximumStepSizeMinValueConvergenceMinValueFixedAngleMinValueBoundaryAngleMinValuePackingRadiusMinValue ( ) { return 0.0 ; } virtual double GetNeighborhoodSizeMaxValueSmoothingModeMaxValueNumberOfIterationsMaxValueNumberOfSubIterationsMaxValueMaximumStepSizeMaxValueConvergenceMaxValueFixedAngleMaxValueBoundaryAngleMaxValuePackingRadiusMaxValue ( ) { return VTK_DOUBLE_MAX ; } ; virtual double GetNeighborhoodSizeSmoothingModeNumberOfIterationsNumberOfSubIterationsMaximumStepSizeConvergenceEnableConstraintsFixedAngleBoundaryAngleGenerateConstraintScalarsGenerateConstraintNormalsComputePackingRadiusPackingRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PackingRadius  of  << this -> PackingRadius ) ; return this -> PackingRadius ; } ; /@} /@{ *
##  Specify the packing factor. Larger numbers tend to loosen the overall
##  packing of points. Note however that if the point density in a region is
##  high, then the packing factor may have little effect (due to mutual
##  inter-particle constraints). The default value is 1.0. (Note that a
##  characteristic inter-particle radius R is computed at the onset of the
##  algorithm (or can be manually specified). Within 0<=r<=R*PackingFactor a
##  repulsive force is generated.)
##  virtual void SetNeighborhoodSizeSmoothingModeNumberOfIterationsNumberOfSubIterationsMaximumStepSizeConvergenceFixedAngleBoundaryAnglePackingRadiusPackingFactor ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << PackingFactor  to  << _arg ) ; if ( this -> PackingFactor != ( _arg < 0.1 ? 0.1 : ( _arg > 10.0 ? 10.0 : _arg ) ) ) { this -> PackingFactor = ( _arg < 0.1 ? 0.1 : ( _arg > 10.0 ? 10.0 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetNeighborhoodSizeMinValueSmoothingModeMinValueNumberOfIterationsMinValueNumberOfSubIterationsMinValueMaximumStepSizeMinValueConvergenceMinValueFixedAngleMinValueBoundaryAngleMinValuePackingRadiusMinValuePackingFactorMinValue ( ) { return 0.1 ; } virtual double GetNeighborhoodSizeMaxValueSmoothingModeMaxValueNumberOfIterationsMaxValueNumberOfSubIterationsMaxValueMaximumStepSizeMaxValueConvergenceMaxValueFixedAngleMaxValueBoundaryAngleMaxValuePackingRadiusMaxValuePackingFactorMaxValue ( ) { return 10.0 ; } ; virtual double GetNeighborhoodSizeSmoothingModeNumberOfIterationsNumberOfSubIterationsMaximumStepSizeConvergenceEnableConstraintsFixedAngleBoundaryAngleGenerateConstraintScalarsGenerateConstraintNormalsComputePackingRadiusPackingRadiusPackingFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PackingFactor  of  << this -> PackingFactor ) ; return this -> PackingFactor ; } ; /@} /@{ *
##  Control the relative distance of inter-particle attraction. A value of
##  1.0 means that the radius of the attraction region is the same as the
##  radius of repulsion. By default, a value of 0.5 is used (e.g., in the
##  region 0<=r<=R a repulsive force is generated, while in R<r<=R*1.5 an
##  attractive force is generated).
##  virtual void SetNeighborhoodSizeSmoothingModeNumberOfIterationsNumberOfSubIterationsMaximumStepSizeConvergenceFixedAngleBoundaryAnglePackingRadiusPackingFactorAttractionFactor ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << AttractionFactor  to  << _arg ) ; if ( this -> AttractionFactor != ( _arg < 0.1 ? 0.1 : ( _arg > 10.0 ? 10.0 : _arg ) ) ) { this -> AttractionFactor = ( _arg < 0.1 ? 0.1 : ( _arg > 10.0 ? 10.0 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetNeighborhoodSizeMinValueSmoothingModeMinValueNumberOfIterationsMinValueNumberOfSubIterationsMinValueMaximumStepSizeMinValueConvergenceMinValueFixedAngleMinValueBoundaryAngleMinValuePackingRadiusMinValuePackingFactorMinValueAttractionFactorMinValue ( ) { return 0.1 ; } virtual double GetNeighborhoodSizeMaxValueSmoothingModeMaxValueNumberOfIterationsMaxValueNumberOfSubIterationsMaxValueMaximumStepSizeMaxValueConvergenceMaxValueFixedAngleMaxValueBoundaryAngleMaxValuePackingRadiusMaxValuePackingFactorMaxValueAttractionFactorMaxValue ( ) { return 10.0 ; } ; virtual double GetNeighborhoodSizeSmoothingModeNumberOfIterationsNumberOfSubIterationsMaximumStepSizeConvergenceEnableConstraintsFixedAngleBoundaryAngleGenerateConstraintScalarsGenerateConstraintNormalsComputePackingRadiusPackingRadiusPackingFactorAttractionFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AttractionFactor  of  << this -> AttractionFactor ) ; return this -> AttractionFactor ; } ; /@} *
##  Specify how point motion is to be constrained.
##  enum { UNCONSTRAINED_MOTION = 0 , PLANE_MOTION } ; /@{ *
##  Specify how to constrain the motion of points. By default, point motion is
##  unconstrained. Points can also be constrained to a plane. If constrained to
##  a plane, then an instance of vtkPlane must be specified.
##  virtual void SetEnableConstraintsGenerateConstraintScalarsGenerateConstraintNormalsComputePackingRadiusMotionConstraint ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MotionConstraint  to  << _arg ) ; if ( this -> MotionConstraint != _arg ) { this -> MotionConstraint = _arg ; this -> Modified ( ) ; } } ; virtual int GetNeighborhoodSizeSmoothingModeNumberOfIterationsNumberOfSubIterationsMaximumStepSizeConvergenceEnableConstraintsFixedAngleBoundaryAngleGenerateConstraintScalarsGenerateConstraintNormalsComputePackingRadiusPackingRadiusPackingFactorAttractionFactorMotionConstraint ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MotionConstraint  of  << this -> MotionConstraint ) ; return this -> MotionConstraint ; } ; void SetMotionConstraintToUnconstrained ( ) { this -> SetMotionConstraint ( UNCONSTRAINED_MOTION ) ; } void SetMotionConstraintToPlane ( ) { this -> SetMotionConstraint ( PLANE_MOTION ) ; } /@} /@{ *
##  Specify the plane to which point motion is constrained. Only required if
##  MotionConstraint is set to UNCONSTRAINED_MOTION.
##  void SetPlane ( vtkPlane * ) ; virtual vtkPlane * GetnameFrameFieldArrayPlane ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Plane  address  << static_cast < vtkPlane * > ( this -> Plane ) ) ; return this -> Plane ; } ; /@} /@{ *
##  Specify a point locator. By default a vtkStaticPointLocator is
##  used. The locator performs efficient searches to locate points
##  around a sample point.
##  void SetLocator ( vtkAbstractPointLocator * locator ) ; virtual vtkAbstractPointLocator * GetnameFrameFieldArrayPlaneLocator ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Locator  address  << static_cast < vtkAbstractPointLocator * > ( this -> Locator ) ) ; return this -> Locator ; } ; /@} protected : vtkPointSmoothingFilter ( ) ; ~ vtkPointSmoothingFilter ( ) override ;  Control the smoothing int NeighborhoodSize ; int SmoothingMode ; int NumberOfIterations ; int NumberOfSubIterations ; double MaximumStepSize ; double Convergence ; vtkDataArray * FrameFieldArray ;  Support the algorithm vtkAbstractPointLocator * Locator ;  Constraints bool EnableConstraints ; double FixedAngle ; double BoundaryAngle ; bool GenerateConstraintScalars ; bool GenerateConstraintNormals ;  Packing radius and related bool ComputePackingRadius ; double PackingRadius ; double PackingFactor ; double AttractionFactor ;  Motion constraints int MotionConstraint ; vtkPlane * Plane ;  Pipeline support int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; private : vtkPointSmoothingFilter ( const vtkPointSmoothingFilter & ) = delete ; void operator = ( const vtkPointSmoothingFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
