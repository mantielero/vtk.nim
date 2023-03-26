## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkWindowedSincPolyDataFilter.h
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
##  @class   vtkWindowedSincPolyDataFilter
##  @brief   adjust point positions using a windowed sinc function interpolation kernel
##
##  vtkWindowedSincPolyDataFiler adjust point coordinate using a windowed
##  sinc function interpolation kernel. The effect is to "relax" the mesh,
##  making the cells better shaped and the vertices more evenly distributed.
##  Note that this filter operates the lines, polygons, and triangle strips
##  composing an instance of vtkPolyData. Vertex or poly-vertex cells are
##  never modified.
##
##  The algorithm proceeds as follows. For each vertex v, a topological and
##  geometric analysis is performed to determine which vertices are connected
##  to v, and which cells are connected to v. Then, a connectivity array is
##  constructed for each vertex. (The connectivity array is a list of lists
##  of vertices that directly attach to each vertex.) Next, an iteration
##  phase begins over all vertices. For each vertex v, the coordinates of v
##  are modified using a windowed sinc function interpolation kernel.
##  Taubin describes this methodology is the IBM tech report RC-20404
##  (#90237, dated 3/12/96) "Optimal Surface Smoothing as Filter Design"
##  G. Taubin, T. Zhang and G. Golub. (Zhang and Golub are at Stanford
##  University.)
##
##  This report discusses using standard signal processing low-pass filters
##  (in particular windowed sinc functions) to smooth polyhedra. The
##  transfer functions of the low-pass filters are approximated by
##  Chebyshev polynomials. This facilitates applying the filters in an
##  iterative diffusion process (as opposed to a kernel convolution).  The
##  more smoothing iterations applied, the higher the degree of polynomial
##  approximating the low-pass filter transfer function. Each smoothing
##  iteration, therefore, applies the next higher term of the Chebyshev
##  filter approximation to the polyhedron. This decoupling of the filter
##  into an iteratively applied polynomial is possible since the Chebyshev
##  polynomials are orthogonal, i.e. increasing the order of the
##  approximation to the filter transfer function does not alter the
##  previously calculated coefficients for the low order terms.
##
##  Note: Care must be taken to avoid smoothing with too few iterations.
##  A Chebyshev approximation with too few terms is an poor approximation.
##  The first few smoothing iterations represent a severe scaling and
##  translation of the data.  Subsequent iterations cause the smoothed
##  polyhedron to converge to the true location and scale of the object.
##  We have attempted to protect against this by automatically adjusting
##  the filter, effectively widening the pass band. This adjustment is only
##  possible if the number of iterations is greater than 1.  Note that this
##  sacrifices some degree of smoothing for model integrity. For those
##  interested, the filter is adjusted by searching for a value sigma
##  such that the actual pass band is k_pb + sigma and such that the
##  filter transfer function evaluates to unity at k_pb, i.e. f(k_pb) = 1
##
##  To improve the numerical stability of the solution and minimize the
##  scaling the translation effects, the algorithm can translate and
##  scale the position coordinates to within the unit cube [-1, 1],
##  perform the smoothing, and translate and scale the position
##  coordinates back to the original coordinate frame.  This mode is
##  controlled with the NormalizeCoordinatesOn() /
##  NormalizeCoordinatesOff() methods.  For legacy reasons, the default
##  is NormalizeCoordinatesOff.
##
##  This implementation is currently limited to using an interpolation
##  kernel based on Hamming windows.  Other windows (such as Hann, Blackman,
##  Kaiser, Lanczos, Gaussian, and exponential windows) could be used
##  instead.
##
##  There are some special instance variables used to control the execution
##  of this filter. (These ivars basically control what vertices can be
##  smoothed, and the creation of the connectivity array.) The
##  BoundarySmoothing ivar enables/disables the smoothing operation on
##  vertices that are on the "boundary" of the mesh. A boundary vertex is one
##  that is surrounded by a semi-cycle of polygons (or used by a single
##  line).
##
##  Another important ivar is FeatureEdgeSmoothing. If this ivar is
##  enabled, then interior vertices are classified as either "simple",
##  "interior edge", or "fixed", and smoothed differently. (Interior
##  vertices are manifold vertices surrounded by a cycle of polygons; or used
##  by two line cells.) The classification is based on the number of feature
##  edges attached to v. A feature edge occurs when the angle between the two
##  surface normals of a polygon sharing an edge is greater than the
##  FeatureAngle ivar. Then, vertices used by no feature edges are classified
##  "simple", vertices used by exactly two feature edges are classified
##  "interior edge", and all others are "fixed" vertices.
##
##  Once the classification is known, the vertices are smoothed
##  differently. Corner (i.e., fixed) vertices are not smoothed at all.
##  Simple vertices are smoothed as before . Interior edge vertices are
##  smoothed only along their two connected edges, and only if the angle
##  between the edges is less than the EdgeAngle ivar.
##
##  The total smoothing can be controlled by using two ivars. The
##  NumberOfIterations determines the maximum number of smoothing passes.
##  The NumberOfIterations corresponds to the degree of the polynomial that
##  is used to approximate the windowed sinc function. Ten or twenty
##  iterations is all the is usually necessary. Contrast this with
##  vtkSmoothPolyDataFilter which usually requires 100 to 200 smoothing
##  iterations. vtkSmoothPolyDataFilter is also not an approximation to
##  an ideal low-pass filter, which can cause the geometry to shrink as the
##  amount of smoothing increases.
##
##  The second ivar is the specification of the PassBand for the windowed
##  sinc filter.  By design, the PassBand is specified as a doubling point
##  number between 0 and 2.  Lower PassBand values produce more smoothing.
##  A good default value for the PassBand is 0.1 (for those interested, the
##  PassBand (and frequencies) for PolyData are based on the valence of the
##  vertices, this limits all the frequency modes in a polyhedral mesh to
##  between 0 and 2.)
##
##  There are two instance variables that control the generation of error
##  data. If the ivar GenerateErrorScalars is on, then a scalar value
##  indicating the distance of each vertex from its original position is
##  computed. If the ivar GenerateErrorVectors is on, then a vector
##  representing change in position is computed.
##
##  @warning
##  The smoothing operation reduces high frequency information in the
##  geometry of the mesh. With excessive smoothing important details may be
##  lost. Enabling FeatureEdgeSmoothing helps reduce this effect, but cannot
##  entirely eliminate it.
##
##  @warning
##  For maximum performance, do not enable BoundarySmoothing,
##  NonManifoldSmoothing, or FeatureEdgeSmoothing. FeatureEdgeSmoothing is
##  particularly expensive as it requires building topological links and
##  computing local polygon normals which are relatively expensive
##  operations. BoundarySmoothing and NonManifoldSmoothing have a modest
##  impact on performance.
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential execution type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @sa
##  Another useful documentation resource is this SIGGRAPH publication:
##  Gabriel Taubin. "A Signal Processing Approach To Fair Surface Design".
##
##  @sa
##  vtkSmoothPolyDataFilter vtkPointSmoothingFilter vtkDecimate vtkDecimatePro
##  vtkQuadricDecimation
##

## !!!Ignored construct:  # vtkWindowedSincPolyDataFilter_h [NewLine] # vtkWindowedSincPolyDataFilter_h [NewLine] # vtkFiltersCoreModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class VTKFILTERSCORE_EXPORT vtkWindowedSincPolyDataFilter : public vtkPolyDataAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkWindowedSincPolyDataFilter :: IsTypeOf ( type ) ; } static vtkWindowedSincPolyDataFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkWindowedSincPolyDataFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkWindowedSincPolyDataFilter * NewInstance ( ) const { return vtkWindowedSincPolyDataFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkWindowedSincPolyDataFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkWindowedSincPolyDataFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct object with number of iterations 20; passband .1; feature edge
##  smoothing turned off; feature angle 45 degrees; edge angle 15 degrees;
##  and boundary smoothing turned on. Error scalars and vectors are not
##  generated (by default).
##  static vtkWindowedSincPolyDataFilter * New ( ) ; /@{ *
##  Specify the number of iterations (i.e., the degree of the polynomial
##  approximating the windowed sinc function). Typically values around 20
##  are used.
##  virtual void SetNumberOfIterations ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << NumberOfIterations  to  << _arg ) ; if ( this -> NumberOfIterations != ( _arg < 0 ? 0 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> NumberOfIterations = ( _arg < 0 ? 0 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetNumberOfIterationsMinValue ( ) { return 0 ; } virtual int GetNumberOfIterationsMaxValue ( ) { return VTK_INT_MAX ; } ; virtual int GetNumberOfIterations ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfIterations  of  << this -> NumberOfIterations ) ; return this -> NumberOfIterations ; } ; /@} /@{ *
##  Set the passband value for the windowed sinc filter.
##  virtual void SetNumberOfIterationsPassBand ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << PassBand  to  << _arg ) ; if ( this -> PassBand != ( _arg < 0.0 ? 0.0 : ( _arg > 2.0 ? 2.0 : _arg ) ) ) { this -> PassBand = ( _arg < 0.0 ? 0.0 : ( _arg > 2.0 ? 2.0 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetNumberOfIterationsMinValuePassBandMinValue ( ) { return 0.0 ; } virtual double GetNumberOfIterationsMaxValuePassBandMaxValue ( ) { return 2.0 ; } ; virtual double GetNumberOfIterationsPassBand ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PassBand  of  << this -> PassBand ) ; return this -> PassBand ; } ; /@} /@{ *
##  Turn on/off coordinate normalization.  The positions can be translated
##  and scaled such that they fit within a [-1, 1] prior to the smoothing
##  computation. The default is off.  The numerical stability of the
##  solution can be improved by turning normalization on.  If normalization
##  is on, the coordinates will be rescaled to the original coordinate
##  system after smoothing has completed.
##  virtual void SetNormalizeCoordinates ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NormalizeCoordinates  to  << _arg ) ; if ( this -> NormalizeCoordinates != _arg ) { this -> NormalizeCoordinates = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetNumberOfIterationsPassBandNormalizeCoordinates ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NormalizeCoordinates  of  << this -> NormalizeCoordinates ) ; return this -> NormalizeCoordinates ; } ; virtual void NormalizeCoordinatesOn ( ) { this -> SetNormalizeCoordinates ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void NormalizeCoordinatesOff ( ) { this -> SetNormalizeCoordinates ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off smoothing points along sharp interior edges. Enabling this
##  option has a performance impact on the algorithm since neihborhood
##  information (cell links) and polygon normals must be computed.
##  virtual void SetNormalizeCoordinatesFeatureEdgeSmoothing ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  FeatureEdgeSmoothing  to  << _arg ) ; if ( this -> FeatureEdgeSmoothing != _arg ) { this -> FeatureEdgeSmoothing = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetNumberOfIterationsPassBandNormalizeCoordinatesFeatureEdgeSmoothing ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FeatureEdgeSmoothing  of  << this -> FeatureEdgeSmoothing ) ; return this -> FeatureEdgeSmoothing ; } ; virtual void FeatureEdgeSmoothingOn ( ) { this -> SetNormalizeCoordinatesFeatureEdgeSmoothing ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void FeatureEdgeSmoothingOff ( ) { this -> SetNormalizeCoordinatesFeatureEdgeSmoothing ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify the feature angle for sharp edge identification. It only affects
##  the filter when FeatureEdgeSmoothing is enabled.
##  virtual void SetNumberOfIterationsPassBandFeatureAngle ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FeatureAngle  to  << _arg ) ; if ( this -> FeatureAngle != ( _arg < 0.0 ? 0.0 : ( _arg > 180.0 ? 180.0 : _arg ) ) ) { this -> FeatureAngle = ( _arg < 0.0 ? 0.0 : ( _arg > 180.0 ? 180.0 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetNumberOfIterationsMinValuePassBandMinValueFeatureAngleMinValue ( ) { return 0.0 ; } virtual double GetNumberOfIterationsMaxValuePassBandMaxValueFeatureAngleMaxValue ( ) { return 180.0 ; } ; virtual double GetNumberOfIterationsPassBandNormalizeCoordinatesFeatureEdgeSmoothingFeatureAngle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FeatureAngle  of  << this -> FeatureAngle ) ; return this -> FeatureAngle ; } ; /@} /@{ *
##  Specify the edge angle to control smoothing along edges (either interior
##  or boundary).
##  virtual void SetNumberOfIterationsPassBandFeatureAngleEdgeAngle ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << EdgeAngle  to  << _arg ) ; if ( this -> EdgeAngle != ( _arg < 0.0 ? 0.0 : ( _arg > 180.0 ? 180.0 : _arg ) ) ) { this -> EdgeAngle = ( _arg < 0.0 ? 0.0 : ( _arg > 180.0 ? 180.0 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetNumberOfIterationsMinValuePassBandMinValueFeatureAngleMinValueEdgeAngleMinValue ( ) { return 0.0 ; } virtual double GetNumberOfIterationsMaxValuePassBandMaxValueFeatureAngleMaxValueEdgeAngleMaxValue ( ) { return 180.0 ; } ; virtual double GetNumberOfIterationsPassBandNormalizeCoordinatesFeatureEdgeSmoothingFeatureAngleEdgeAngle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EdgeAngle  of  << this -> EdgeAngle ) ; return this -> EdgeAngle ; } ; /@} /@{ *
##  Turn on/off the smoothing of points on the boundary of the mesh.
##  Enabled this option has a modest impact on performance.
##  virtual void SetNormalizeCoordinatesFeatureEdgeSmoothingBoundarySmoothing ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  BoundarySmoothing  to  << _arg ) ; if ( this -> BoundarySmoothing != _arg ) { this -> BoundarySmoothing = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetNumberOfIterationsPassBandNormalizeCoordinatesFeatureEdgeSmoothingFeatureAngleEdgeAngleBoundarySmoothing ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BoundarySmoothing  of  << this -> BoundarySmoothing ) ; return this -> BoundarySmoothing ; } ; virtual void BoundarySmoothingOn ( ) { this -> SetNormalizeCoordinatesFeatureEdgeSmoothingBoundarySmoothing ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void BoundarySmoothingOff ( ) { this -> SetNormalizeCoordinatesFeatureEdgeSmoothingBoundarySmoothing ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Smooth non-manifold points. Enabling this option has a modest
##  impact on performance.
##  virtual void SetNormalizeCoordinatesFeatureEdgeSmoothingBoundarySmoothingNonManifoldSmoothing ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NonManifoldSmoothing  to  << _arg ) ; if ( this -> NonManifoldSmoothing != _arg ) { this -> NonManifoldSmoothing = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetNumberOfIterationsPassBandNormalizeCoordinatesFeatureEdgeSmoothingFeatureAngleEdgeAngleBoundarySmoothingNonManifoldSmoothing ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NonManifoldSmoothing  of  << this -> NonManifoldSmoothing ) ; return this -> NonManifoldSmoothing ; } ; virtual void NonManifoldSmoothingOn ( ) { this -> SetNormalizeCoordinatesFeatureEdgeSmoothingBoundarySmoothingNonManifoldSmoothing ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void NonManifoldSmoothingOff ( ) { this -> SetNormalizeCoordinatesFeatureEdgeSmoothingBoundarySmoothingNonManifoldSmoothing ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off the generation of scalar distance values.
##  virtual void SetNormalizeCoordinatesFeatureEdgeSmoothingBoundarySmoothingNonManifoldSmoothingGenerateErrorScalars ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateErrorScalars  to  << _arg ) ; if ( this -> GenerateErrorScalars != _arg ) { this -> GenerateErrorScalars = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetNumberOfIterationsPassBandNormalizeCoordinatesFeatureEdgeSmoothingFeatureAngleEdgeAngleBoundarySmoothingNonManifoldSmoothingGenerateErrorScalars ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateErrorScalars  of  << this -> GenerateErrorScalars ) ; return this -> GenerateErrorScalars ; } ; virtual void GenerateErrorScalarsOn ( ) { this -> SetNormalizeCoordinatesFeatureEdgeSmoothingBoundarySmoothingNonManifoldSmoothingGenerateErrorScalars ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GenerateErrorScalarsOff ( ) { this -> SetNormalizeCoordinatesFeatureEdgeSmoothingBoundarySmoothingNonManifoldSmoothingGenerateErrorScalars ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off the generation of error vectors.
##  virtual void SetNormalizeCoordinatesFeatureEdgeSmoothingBoundarySmoothingNonManifoldSmoothingGenerateErrorScalarsGenerateErrorVectors ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateErrorVectors  to  << _arg ) ; if ( this -> GenerateErrorVectors != _arg ) { this -> GenerateErrorVectors = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetNumberOfIterationsPassBandNormalizeCoordinatesFeatureEdgeSmoothingFeatureAngleEdgeAngleBoundarySmoothingNonManifoldSmoothingGenerateErrorScalarsGenerateErrorVectors ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateErrorVectors  of  << this -> GenerateErrorVectors ) ; return this -> GenerateErrorVectors ; } ; virtual void GenerateErrorVectorsOn ( ) { this -> SetNormalizeCoordinatesFeatureEdgeSmoothingBoundarySmoothingNonManifoldSmoothingGenerateErrorScalarsGenerateErrorVectors ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GenerateErrorVectorsOff ( ) { this -> SetNormalizeCoordinatesFeatureEdgeSmoothingBoundarySmoothingNonManifoldSmoothingGenerateErrorScalarsGenerateErrorVectors ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkWindowedSincPolyDataFilter ( ) ; ~ vtkWindowedSincPolyDataFilter ( ) override = default ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int NumberOfIterations ; double PassBand ; vtkTypeBool NormalizeCoordinates ; vtkTypeBool FeatureEdgeSmoothing ; double FeatureAngle ; double EdgeAngle ; vtkTypeBool BoundarySmoothing ; vtkTypeBool NonManifoldSmoothing ; vtkTypeBool GenerateErrorScalars ; vtkTypeBool GenerateErrorVectors ; private : vtkWindowedSincPolyDataFilter ( const vtkWindowedSincPolyDataFilter & ) = delete ; void operator = ( const vtkWindowedSincPolyDataFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
