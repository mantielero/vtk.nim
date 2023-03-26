## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkConstrainedSmoothingFilter.h
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
##  @class   vtkConstrainedSmoothingFilter
##  @brief   adjust point positions using constrained smoothing
##
##  vtkConstrainedSmoothingFilter is a filter that adjusts point coordinates
##  using a modified Laplacian smoothing approach. The effect is to "relax"
##  the mesh, making the cells better shaped and the points more evenly
##  distributed. Note that this filter operates on any vtkPointSet and derived
##  classes. Cell topology is never modified; note however if the constraints
##  are too lax, cells may self-intersect or otherwise be deformed in
##  unfavorable ways.
##
##  A central concept of this filter is the point smoothing stencil. A
##  smoothing stencil for a point pi is the list of points pj which connect to
##  pi via an edge. To smooth the point pi, pi is moved towards the average
##  position of pj multiplied by the relaxation factor, and limited by the
##  constraint distance. This process is repeated either until convergence
##  occurs, or the maximum number of iterations is reached. Note that
##  smoothing stencils may be specified; or if not provided, the stencils are
##  computed from the input cells connected edges (using vtkExtractEdges with
##  UseAllPoints enabled).
##
##  To constrain the motion of the points, either set the filter's constraint
##  distance, or provide an input point data array (of type vtkDoubleArray)
##  named "SmoothingConstraints." The filter's constraint distance is applied
##  to all points; whereas the smoothing data array may have different
##  constraint values per point. If provided by the user, by default the
##  smoothing data array takes precedence over the filter's constraint
##  distance.
##
##  @warning
##  The smoothing process reduces high frequency information in the geometry
##  of the mesh. With excessive smoothing important details may be lost, and
##  the surface may shrink towards the centroid. The constraints on point
##  movement help significantly in preventing shrinkage from happening.
##
##  @sa
##  vtkWindowedSincPolyDataFilter vtkSmoothPolyDataFilter
##  vtkExtractEdges
##

## !!!Ignored construct:  # vtkConstrainedSmoothingFilter_h [NewLine] # vtkConstrainedSmoothingFilter_h [NewLine] # vtkCellArray.h  For point smoothing stencils # vtkFiltersCoreModule.h  For export macro # vtkPointSetAlgorithm.h [NewLine] class VTKFILTERSCORE_EXPORT vtkConstrainedSmoothingFilter : public vtkPointSetAlgorithm { public : /@{ *
##  Standard methods for instantiation, to obtain type information, and
##  print the state of a class instance.
##  static vtkConstrainedSmoothingFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPointSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPointSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkConstrainedSmoothingFilter :: IsTypeOf ( type ) ; } static vtkConstrainedSmoothingFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkConstrainedSmoothingFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkConstrainedSmoothingFilter * NewInstance ( ) const { return vtkConstrainedSmoothingFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPointSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkConstrainedSmoothingFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkConstrainedSmoothingFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ /@{ *
##  Specify a convergence criterion for the iteration process. Smaller
##  numbers result in more smoothing iterations. Convergence occurs
##  when, for the current iteration, the maximum distance any point moves
##  is less than or equal to Convergence. The default value is 0.
##  virtual void SetConvergence ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Convergence  to  << _arg ) ; if ( this -> Convergence != ( _arg < 0.0 ? 0.0 : ( _arg > 1.0 ? 1.0 : _arg ) ) ) { this -> Convergence = ( _arg < 0.0 ? 0.0 : ( _arg > 1.0 ? 1.0 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetConvergenceMinValue ( ) { return 0.0 ; } virtual double GetConvergenceMaxValue ( ) { return 1.0 ; } ; virtual double GetConvergence ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Convergence  of  << this -> Convergence ) ; return this -> Convergence ; } ; /@} /@{ *
##  Specify the maximum number of iterations for smoothing. The number
##  of iterations may be less if the smoothing process converges. The
##  default value is 10.
##  virtual void SetConvergenceNumberOfIterations ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << NumberOfIterations  to  << _arg ) ; if ( this -> NumberOfIterations != ( _arg < 0 ? 0 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> NumberOfIterations = ( _arg < 0 ? 0 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetConvergenceMinValueNumberOfIterationsMinValue ( ) { return 0 ; } virtual int GetConvergenceMaxValueNumberOfIterationsMaxValue ( ) { return VTK_INT_MAX ; } ; virtual int GetConvergenceNumberOfIterations ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfIterations  of  << this -> NumberOfIterations ) ; return this -> NumberOfIterations ; } ; /@} /@{ *
##  Specify the relaxation factor for smoothing. As in all iterative
##  methods, the stability of the process is sensitive to this parameter. In
##  general, small relaxation factors and large numbers of iterations are
##  more stable than larger relaxation factors and smaller numbers of
##  iterations. The default value is 0.01.
##  virtual void SetRelaxationFactor ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  RelaxationFactor  to  << _arg ) ; if ( this -> RelaxationFactor != _arg ) { this -> RelaxationFactor = _arg ; this -> Modified ( ) ; } } ; virtual double GetConvergenceNumberOfIterationsRelaxationFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RelaxationFactor  of  << this -> RelaxationFactor ) ; return this -> RelaxationFactor ; } ; /@} enum ConstraintStrategyType { DEFAULT = 0 , CONSTRAINT_DISTANCE = 1 , CONSTRAINT_ARRAY = 2 } ; /@{ *
##  Indicate how to apply constraints. By default, a constraint array takes
##  precedence over the filter's constraint distance, but if not available
##  then the constraint distance is used. If a CONSTRAINT_ARRAY strategy is
##  specified, and no constraint array is available from the point data,
##  then no constraints are provided. Note that is also possible to turn off
##  constraints completely by simply specifying a very large constraint
##  distance. The default constraint strategy is DEFAULT.
##  virtual void SetConvergenceNumberOfIterationsConstraintStrategy ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ConstraintStrategy  to  << _arg ) ; if ( this -> ConstraintStrategy != ( _arg < DEFAULT ? DEFAULT : ( _arg > CONSTRAINT_ARRAY ? CONSTRAINT_ARRAY : _arg ) ) ) { this -> ConstraintStrategy = ( _arg < DEFAULT ? DEFAULT : ( _arg > CONSTRAINT_ARRAY ? CONSTRAINT_ARRAY : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetConvergenceMinValueNumberOfIterationsMinValueConstraintStrategyMinValue ( ) { return DEFAULT ; } virtual int GetConvergenceMaxValueNumberOfIterationsMaxValueConstraintStrategyMaxValue ( ) { return CONSTRAINT_ARRAY ; } ; virtual int GetConvergenceNumberOfIterationsRelaxationFactorConstraintStrategy ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ConstraintStrategy  of  << this -> ConstraintStrategy ) ; return this -> ConstraintStrategy ; } ; void SetConstraintStrategyToDefault ( ) { this -> SetConstraintStrategy ( DEFAULT ) ; } void SetConstraintStrategyToConstraintDistance ( ) { this -> SetConstraintStrategy ( CONSTRAINT_DISTANCE ) ; } void SetConstraintStrategyToConstraintArray ( ) { this -> SetConstraintStrategy ( CONSTRAINT_ARRAY ) ; } /@} /@{ *
##  Specify a constraint distance for point motion. By default, if a point
##  data array constraint distance (named "SmoothingConstraints") is provided
##  in the input point data, then the array takes precedence. By default, the
##  constraint distance is 0.001.
##  virtual void SetConvergenceNumberOfIterationsConstraintStrategyConstraintDistance ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ConstraintDistance  to  << _arg ) ; if ( this -> ConstraintDistance != ( _arg < 0.0 ? 0.0 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ) { this -> ConstraintDistance = ( _arg < 0.0 ? 0.0 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetConvergenceMinValueNumberOfIterationsMinValueConstraintStrategyMinValueConstraintDistanceMinValue ( ) { return 0.0 ; } virtual double GetConvergenceMaxValueNumberOfIterationsMaxValueConstraintStrategyMaxValueConstraintDistanceMaxValue ( ) { return VTK_FLOAT_MAX ; } ; virtual double GetConvergenceNumberOfIterationsRelaxationFactorConstraintStrategyConstraintDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ConstraintDistance  of  << this -> ConstraintDistance ) ; return this -> ConstraintDistance ; } ; /@} /@{ *
##  Set / get the point smoothing stencils. Here we are repurposing a cell
##  array to define stencils. Basically what's happening is that each point
##  is treated a "cell" connected to a list of point ids (i.e., the
##  "stencil") that defines the smoothing edge connections. By default, no
##  smoothing stencils are defined.
##  virtual void SetSmoothingStencils ( vtkCellArray * _arg ) { { vtkDebugWithObjectMacro ( this , <<  setting  << SmoothingStencils  to  << _arg ) ; if ( this -> SmoothingStencils != _arg ) { this -> SmoothingStencils = _arg ; this -> Modified ( ) ; } } ; } ; virtual vtkCellArray * Getname ( ) { vtkDebugWithObjectMacro ( this , <<  returning  name  address  << static_cast < vtkCellArray * > ( this -> SmoothingStencils ) ) ; return this -> SmoothingStencils ; } ; /@} /@{ *
##  Turn on/off the generation of scalar distance values. By default, the
##  generation of error scalars is disabled.
##  virtual void SetRelaxationFactorGenerateErrorScalars ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateErrorScalars  to  << _arg ) ; if ( this -> GenerateErrorScalars != _arg ) { this -> GenerateErrorScalars = _arg ; this -> Modified ( ) ; } } ; virtual bool GetConvergenceNumberOfIterationsRelaxationFactorConstraintStrategyConstraintDistanceGenerateErrorScalars ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateErrorScalars  of  << this -> GenerateErrorScalars ) ; return this -> GenerateErrorScalars ; } ; virtual void GenerateErrorScalarsOn ( ) { this -> SetGenerateErrorScalars ( static_cast < bool > ( 1 ) ) ; } virtual void GenerateErrorScalarsOff ( ) { this -> SetGenerateErrorScalars ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off the generation of error vectors. By default, the generation
##  of error vectors is disabled.
##  virtual void SetRelaxationFactorGenerateErrorScalarsGenerateErrorVectors ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateErrorVectors  to  << _arg ) ; if ( this -> GenerateErrorVectors != _arg ) { this -> GenerateErrorVectors = _arg ; this -> Modified ( ) ; } } ; virtual bool GetConvergenceNumberOfIterationsRelaxationFactorConstraintStrategyConstraintDistanceGenerateErrorScalarsGenerateErrorVectors ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateErrorVectors  of  << this -> GenerateErrorVectors ) ; return this -> GenerateErrorVectors ; } ; virtual void GenerateErrorVectorsOn ( ) { this -> SetGenerateErrorScalarsGenerateErrorVectors ( static_cast < bool > ( 1 ) ) ; } virtual void GenerateErrorVectorsOff ( ) { this -> SetGenerateErrorScalarsGenerateErrorVectors ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/get the desired precision for the output types. See the documentation
##  for the vtkAlgorithm::DesiredOutputPrecision enum for an explanation of
##  the available precision settings.
##  virtual void SetRelaxationFactorGenerateErrorScalarsGenerateErrorVectorsOutputPointsPrecision ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutputPointsPrecision  to  << _arg ) ; if ( this -> OutputPointsPrecision != _arg ) { this -> OutputPointsPrecision = _arg ; this -> Modified ( ) ; } } ; virtual int GetConvergenceNumberOfIterationsRelaxationFactorConstraintStrategyConstraintDistanceGenerateErrorScalarsGenerateErrorVectorsOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ; /@} protected : vtkConstrainedSmoothingFilter ( ) ; ~ vtkConstrainedSmoothingFilter ( ) override = default ; double Convergence ; int NumberOfIterations ; double RelaxationFactor ; int ConstraintStrategy ; double ConstraintDistance ; vtkSmartPointer < vtkCellArray > SmoothingStencils ; bool GenerateErrorScalars ; bool GenerateErrorVectors ; int OutputPointsPrecision ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkConstrainedSmoothingFilter ( const vtkConstrainedSmoothingFilter & ) = delete ; void operator = ( const vtkConstrainedSmoothingFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
