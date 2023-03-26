## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSmoothPolyDataFilter.h
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
##  @class   vtkSmoothPolyDataFilter
##  @brief   adjust point positions using Laplacian smoothing
##
##  vtkSmoothPolyDataFilter is a filter that adjusts point coordinates using
##  Laplacian smoothing. The effect is to "relax" the mesh, making the cells
##  better shaped and the vertices more evenly distributed. Note that this
##  filter operates on the lines, polygons, and triangle strips composing an
##  instance of vtkPolyData. Vertex or poly-vertex cells are never modified.
##
##  The algorithm proceeds as follows. For each vertex v, a topological and
##  geometric analysis is performed to determine which vertices are connected
##  to v, and which cells are connected to v. Then, a connectivity array is
##  constructed for each vertex. (The connectivity array is a list of lists
##  of vertices that directly attach to each vertex.) Next, an iteration
##  phase begins over all vertices. For each vertex v, the coordinates of v
##  are modified according to an average of the connected vertices.  (A
##  relaxation factor is available to control the amount of displacement of
##  v).  The process repeats for each vertex. This pass over the list of
##  vertices is a single iteration. Many iterations (generally around 20 or
##  so) are repeated until the desired result is obtained.
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
##  Simple vertices are smoothed as before (i.e., average of connected
##  vertex coordinates). Interior edge vertices are smoothed only along
##  their two connected edges, and only if the angle between the edges
##  is less than the EdgeAngle ivar.
##
##  The total smoothing can be controlled by using two ivars. The
##  NumberOfIterations is a cap on the maximum number of smoothing passes.
##  The Convergence ivar is a limit on the maximum point motion. If the
##  maximum motion during an iteration is less than Convergence, then the
##  smoothing process terminates. (Convergence is expressed as a fraction of
##  the diagonal of the bounding box.)
##
##  There are two instance variables that control the generation of error
##  data. If the ivar GenerateErrorScalars is on, then a scalar value indicating
##  the distance of each vertex from its original position is computed. If the
##  ivar GenerateErrorVectors is on, then a vector representing change in
##  position is computed.
##
##  Optionally you can further control the smoothing process by defining a
##  second input: the Source. If defined, the input mesh is constrained to
##  lie on the surface defined by the Source ivar.
##
##
##  @warning
##  The Laplacian operation reduces high frequency information in the geometry
##  of the mesh. With excessive smoothing important details may be lost, and
##  the surface may shrink towards the centroid. Enabling FeatureEdgeSmoothing
##  helps reduce this effect, but cannot entirely eliminate it. You may also
##  wish to try vtkWindowedSincPolyDataFilter. It does a better job of
##  minimizing shrinkage. Another option is vtkConstrainedSmoothingFilter
##  which limits the distance that points can move.
##
##  @sa
##  vtkWindowedSincPolyDataFilter vtkConstrainedSmoothingFilter
##  vtkDecimate vtkDecimatePro
##

## !!!Ignored construct:  # vtkSmoothPolyDataFilter_h [NewLine] # vtkSmoothPolyDataFilter_h [NewLine] # vtkFiltersCoreModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] # < memory >  For std::unique_ptr<> [NewLine] class vtkSmoothPoints ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSCORE_EXPORT vtkSmoothPolyDataFilter : public vtkPolyDataAlgorithm { public : *
##  Construct object with number of iterations 20; relaxation factor .01;
##  feature edge smoothing turned off; feature
##  angle 45 degrees; edge angle 15 degrees; and boundary smoothing turned
##  on. Error scalars and vectors are not generated (by default). The
##  convergence criterion is 0.0 of the bounding box diagonal.
##  static vtkSmoothPolyDataFilter * New ( ) ; /@{ *
##  Standard methods to obtain type information, and print the
##  state of a class instance.
##  protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkSmoothPolyDataFilter :: IsTypeOf ( type ) ; } static vtkSmoothPolyDataFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkSmoothPolyDataFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkSmoothPolyDataFilter * NewInstance ( ) const { return vtkSmoothPolyDataFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSmoothPolyDataFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSmoothPolyDataFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Specify a convergence criterion for the iteration
##  process. Smaller numbers result in more smoothing iterations.
##  virtual void SetConvergence ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Convergence  to  << _arg ) ; if ( this -> Convergence != ( _arg < 0.0 ? 0.0 : ( _arg > 1.0 ? 1.0 : _arg ) ) ) { this -> Convergence = ( _arg < 0.0 ? 0.0 : ( _arg > 1.0 ? 1.0 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetConvergenceMinValue ( ) { return 0.0 ; } virtual double GetConvergenceMaxValue ( ) { return 1.0 ; } ; virtual double GetConvergence ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Convergence  of  << this -> Convergence ) ; return this -> Convergence ; } ; /@} /@{ *
##  Specify the number of iterations for Laplacian smoothing,
##  virtual void SetConvergenceNumberOfIterations ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << NumberOfIterations  to  << _arg ) ; if ( this -> NumberOfIterations != ( _arg < 0 ? 0 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> NumberOfIterations = ( _arg < 0 ? 0 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetConvergenceMinValueNumberOfIterationsMinValue ( ) { return 0 ; } virtual int GetConvergenceMaxValueNumberOfIterationsMaxValue ( ) { return VTK_INT_MAX ; } ; virtual int GetConvergenceNumberOfIterations ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfIterations  of  << this -> NumberOfIterations ) ; return this -> NumberOfIterations ; } ; /@} /@{ *
##  Specify the relaxation factor for Laplacian smoothing. As in all
##  iterative methods, the stability of the process is sensitive to
##  this parameter. In general, small relaxation factors and large
##  numbers of iterations are more stable than larger relaxation
##  factors and smaller numbers of iterations.
##  virtual void SetRelaxationFactor ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  RelaxationFactor  to  << _arg ) ; if ( this -> RelaxationFactor != _arg ) { this -> RelaxationFactor = _arg ; this -> Modified ( ) ; } } ; virtual double GetConvergenceNumberOfIterationsRelaxationFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RelaxationFactor  of  << this -> RelaxationFactor ) ; return this -> RelaxationFactor ; } ; /@} /@{ *
##  Turn on/off smoothing along sharp interior edges.
##  virtual void SetRelaxationFactorFeatureEdgeSmoothing ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  FeatureEdgeSmoothing  to  << _arg ) ; if ( this -> FeatureEdgeSmoothing != _arg ) { this -> FeatureEdgeSmoothing = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetConvergenceNumberOfIterationsRelaxationFactorFeatureEdgeSmoothing ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FeatureEdgeSmoothing  of  << this -> FeatureEdgeSmoothing ) ; return this -> FeatureEdgeSmoothing ; } ; virtual void FeatureEdgeSmoothingOn ( ) { this -> SetFeatureEdgeSmoothing ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void FeatureEdgeSmoothingOff ( ) { this -> SetFeatureEdgeSmoothing ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify the feature angle for sharp edge identification.
##  virtual void SetConvergenceNumberOfIterationsFeatureAngle ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FeatureAngle  to  << _arg ) ; if ( this -> FeatureAngle != ( _arg < 0.0 ? 0.0 : ( _arg > 180.0 ? 180.0 : _arg ) ) ) { this -> FeatureAngle = ( _arg < 0.0 ? 0.0 : ( _arg > 180.0 ? 180.0 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetConvergenceMinValueNumberOfIterationsMinValueFeatureAngleMinValue ( ) { return 0.0 ; } virtual double GetConvergenceMaxValueNumberOfIterationsMaxValueFeatureAngleMaxValue ( ) { return 180.0 ; } ; virtual double GetConvergenceNumberOfIterationsRelaxationFactorFeatureEdgeSmoothingFeatureAngle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FeatureAngle  of  << this -> FeatureAngle ) ; return this -> FeatureAngle ; } ; /@} /@{ *
##  Specify the edge angle to control smoothing along edges (either interior
##  or boundary).
##  virtual void SetConvergenceNumberOfIterationsFeatureAngleEdgeAngle ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << EdgeAngle  to  << _arg ) ; if ( this -> EdgeAngle != ( _arg < 0.0 ? 0.0 : ( _arg > 180.0 ? 180.0 : _arg ) ) ) { this -> EdgeAngle = ( _arg < 0.0 ? 0.0 : ( _arg > 180.0 ? 180.0 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetConvergenceMinValueNumberOfIterationsMinValueFeatureAngleMinValueEdgeAngleMinValue ( ) { return 0.0 ; } virtual double GetConvergenceMaxValueNumberOfIterationsMaxValueFeatureAngleMaxValueEdgeAngleMaxValue ( ) { return 180.0 ; } ; virtual double GetConvergenceNumberOfIterationsRelaxationFactorFeatureEdgeSmoothingFeatureAngleEdgeAngle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EdgeAngle  of  << this -> EdgeAngle ) ; return this -> EdgeAngle ; } ; /@} /@{ *
##  Turn on/off the smoothing of vertices on the boundary of the mesh.
##  virtual void SetRelaxationFactorFeatureEdgeSmoothingBoundarySmoothing ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  BoundarySmoothing  to  << _arg ) ; if ( this -> BoundarySmoothing != _arg ) { this -> BoundarySmoothing = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetConvergenceNumberOfIterationsRelaxationFactorFeatureEdgeSmoothingFeatureAngleEdgeAngleBoundarySmoothing ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BoundarySmoothing  of  << this -> BoundarySmoothing ) ; return this -> BoundarySmoothing ; } ; virtual void BoundarySmoothingOn ( ) { this -> SetFeatureEdgeSmoothingBoundarySmoothing ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void BoundarySmoothingOff ( ) { this -> SetFeatureEdgeSmoothingBoundarySmoothing ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off the generation of scalar distance values.
##  virtual void SetRelaxationFactorFeatureEdgeSmoothingBoundarySmoothingGenerateErrorScalars ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateErrorScalars  to  << _arg ) ; if ( this -> GenerateErrorScalars != _arg ) { this -> GenerateErrorScalars = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetConvergenceNumberOfIterationsRelaxationFactorFeatureEdgeSmoothingFeatureAngleEdgeAngleBoundarySmoothingGenerateErrorScalars ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateErrorScalars  of  << this -> GenerateErrorScalars ) ; return this -> GenerateErrorScalars ; } ; virtual void GenerateErrorScalarsOn ( ) { this -> SetFeatureEdgeSmoothingBoundarySmoothingGenerateErrorScalars ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GenerateErrorScalarsOff ( ) { this -> SetFeatureEdgeSmoothingBoundarySmoothingGenerateErrorScalars ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off the generation of error vectors.
##  virtual void SetRelaxationFactorFeatureEdgeSmoothingBoundarySmoothingGenerateErrorScalarsGenerateErrorVectors ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateErrorVectors  to  << _arg ) ; if ( this -> GenerateErrorVectors != _arg ) { this -> GenerateErrorVectors = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetConvergenceNumberOfIterationsRelaxationFactorFeatureEdgeSmoothingFeatureAngleEdgeAngleBoundarySmoothingGenerateErrorScalarsGenerateErrorVectors ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateErrorVectors  of  << this -> GenerateErrorVectors ) ; return this -> GenerateErrorVectors ; } ; virtual void GenerateErrorVectorsOn ( ) { this -> SetFeatureEdgeSmoothingBoundarySmoothingGenerateErrorScalarsGenerateErrorVectors ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GenerateErrorVectorsOff ( ) { this -> SetFeatureEdgeSmoothingBoundarySmoothingGenerateErrorScalarsGenerateErrorVectors ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify the source object which is used to constrain smoothing. The
##  source defines a surface that the input (as it is smoothed) is
##  constrained to lie upon.
##  void SetSourceData ( vtkPolyData * source ) ; vtkPolyData * GetSource ( ) ; /@} /@{ *
##  Set/get the desired precision for the output types. See the documentation
##  for the vtkAlgorithm::DesiredOutputPrecision enum for an explanation of
##  the available precision settings.
##  virtual void SetRelaxationFactorFeatureEdgeSmoothingBoundarySmoothingGenerateErrorScalarsGenerateErrorVectorsOutputPointsPrecision ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutputPointsPrecision  to  << _arg ) ; if ( this -> OutputPointsPrecision != _arg ) { this -> OutputPointsPrecision = _arg ; this -> Modified ( ) ; } } ; virtual int GetConvergenceNumberOfIterationsRelaxationFactorFeatureEdgeSmoothingFeatureAngleEdgeAngleBoundarySmoothingGenerateErrorScalarsGenerateErrorVectorsOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ; /@} protected : vtkSmoothPolyDataFilter ( ) ; ~ vtkSmoothPolyDataFilter ( ) override = default ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; double Convergence ; int NumberOfIterations ; double RelaxationFactor ; vtkTypeBool FeatureEdgeSmoothing ; double FeatureAngle ; double EdgeAngle ; vtkTypeBool BoundarySmoothing ; vtkTypeBool GenerateErrorScalars ; vtkTypeBool GenerateErrorVectors ; int OutputPointsPrecision ; std :: unique_ptr < vtkSmoothPoints > SmoothPoints ; private : vtkSmoothPolyDataFilter ( const vtkSmoothPolyDataFilter & ) = delete ; void operator = ( const vtkSmoothPolyDataFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
