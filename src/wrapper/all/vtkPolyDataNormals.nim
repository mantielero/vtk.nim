## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPolyDataNormals.h
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
##  @class   vtkPolyDataNormals
##  @brief   compute normals for polygonal mesh
##
##  vtkPolyDataNormals is a filter that computes point and/or cell normals
##  for a polygonal mesh. The user specifies if they would like the point
##  and/or cell normals to be computed by setting the ComputeCellNormals
##  and ComputePointNormals flags.
##
##  The computed normals (a vtkFloatArray) are set to be the active normals
##  (using SetNormals()) of the PointData and/or the CellData (respectively)
##  of the output PolyData. The name of these arrays is "Normals", so they
##  can be retrieved either with
##  vtkArrayDownCast<vtkFloatArray>(output->GetPointData()->GetNormals())
##  or with
##  vtkArrayDownCast<vtkFloatArray>(output->GetPointData()->GetArray("Normals"))
##
##  The filter can reorder polygons to ensure consistent
##  orientation across polygon neighbors. Sharp edges can be split and points
##  duplicated with separate normals to give crisp (rendered) surface definition.
##  It is also possible to globally flip the normal orientation.
##
##  The algorithm works by determining normals for each polygon and then
##  averaging them at shared points. When sharp edges are present, the edges
##  are split and new points generated to prevent blurry edges (due to
##  Gouraud shading).
##
##  @warning
##  Normals are computed only for polygons and triangle strips. Normals are
##  not computed for lines or vertices.
##
##  @warning
##  Triangle strips are broken up into triangle polygons. You may want to
##  restrip the triangles.
##
##  @sa
##  For high-performance rendering, you could use vtkTriangleMeshPointNormals
##  if you know that you have a triangle mesh which does not require splitting
##  nor consistency check on the cell orientations.
##
##

## !!!Ignored construct:  # vtkPolyDataNormals_h [NewLine] # vtkPolyDataNormals_h [NewLine] # vtkFiltersCoreModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class vtkFloatArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkIdList"
discard "forward decl of vtkPolyData"
## !!!Ignored construct:  class VTKFILTERSCORE_EXPORT vtkPolyDataNormals : public vtkPolyDataAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPolyDataNormals :: IsTypeOf ( type ) ; } static vtkPolyDataNormals * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPolyDataNormals * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPolyDataNormals * NewInstance ( ) const { return vtkPolyDataNormals :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPolyDataNormals :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPolyDataNormals :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct with feature angle=30, splitting and consistency turned on,
##  flipNormals turned off, and non-manifold traversal turned on.
##  ComputePointNormals is on and ComputeCellNormals is off.
##  static vtkPolyDataNormals * New ( ) ; /@{ *
##  Specify the angle that defines a sharp edge. If the difference in
##  angle across neighboring polygons is greater than this value, the
##  shared edge is considered "sharp".
##  virtual void SetFeatureAngle ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FeatureAngle  to  << _arg ) ; if ( this -> FeatureAngle != ( _arg < 0.0 ? 0.0 : ( _arg > 180.0 ? 180.0 : _arg ) ) ) { this -> FeatureAngle = ( _arg < 0.0 ? 0.0 : ( _arg > 180.0 ? 180.0 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetFeatureAngleMinValue ( ) { return 0.0 ; } virtual double GetFeatureAngleMaxValue ( ) { return 180.0 ; } ; virtual double GetFeatureAngle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FeatureAngle  of  << this -> FeatureAngle ) ; return this -> FeatureAngle ; } ; /@} /@{ *
##  Turn on/off the splitting of sharp edges.
##  virtual void SetSplitting ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Splitting  to  << _arg ) ; if ( this -> Splitting != _arg ) { this -> Splitting = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetFeatureAngleSplitting ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Splitting  of  << this -> Splitting ) ; return this -> Splitting ; } ; virtual void SplittingOn ( ) { this -> SetSplitting ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void SplittingOff ( ) { this -> SetSplitting ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off the enforcement of consistent polygon ordering.
##  virtual void SetSplittingConsistency ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Consistency  to  << _arg ) ; if ( this -> Consistency != _arg ) { this -> Consistency = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetFeatureAngleSplittingConsistency ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Consistency  of  << this -> Consistency ) ; return this -> Consistency ; } ; virtual void ConsistencyOn ( ) { this -> SetSplittingConsistency ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ConsistencyOff ( ) { this -> SetSplittingConsistency ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off the automatic determination of correct normal
##  orientation. NOTE: This assumes a completely closed surface
##  (i.e. no boundary edges) and no non-manifold edges. If these
##  constraints do not hold, all bets are off. This option adds some
##  computational complexity, and is useful if you don't want to have
##  to inspect the rendered image to determine whether to turn on the
##  FlipNormals flag. However, this flag can work with the FlipNormals
##  flag, and if both are set, all the normals in the output will
##  point "inward".
##  virtual void SetSplittingConsistencyAutoOrientNormals ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  AutoOrientNormals  to  << _arg ) ; if ( this -> AutoOrientNormals != _arg ) { this -> AutoOrientNormals = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetFeatureAngleSplittingConsistencyAutoOrientNormals ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AutoOrientNormals  of  << this -> AutoOrientNormals ) ; return this -> AutoOrientNormals ; } ; virtual void AutoOrientNormalsOn ( ) { this -> SetSplittingConsistencyAutoOrientNormals ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void AutoOrientNormalsOff ( ) { this -> SetSplittingConsistencyAutoOrientNormals ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off the computation of point normals.
##  virtual void SetSplittingConsistencyAutoOrientNormalsComputePointNormals ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputePointNormals  to  << _arg ) ; if ( this -> ComputePointNormals != _arg ) { this -> ComputePointNormals = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetFeatureAngleSplittingConsistencyAutoOrientNormalsComputePointNormals ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputePointNormals  of  << this -> ComputePointNormals ) ; return this -> ComputePointNormals ; } ; virtual void ComputePointNormalsOn ( ) { this -> SetSplittingConsistencyAutoOrientNormalsComputePointNormals ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ComputePointNormalsOff ( ) { this -> SetSplittingConsistencyAutoOrientNormalsComputePointNormals ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off the computation of cell normals.
##  virtual void SetSplittingConsistencyAutoOrientNormalsComputePointNormalsComputeCellNormals ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeCellNormals  to  << _arg ) ; if ( this -> ComputeCellNormals != _arg ) { this -> ComputeCellNormals = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetFeatureAngleSplittingConsistencyAutoOrientNormalsComputePointNormalsComputeCellNormals ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeCellNormals  of  << this -> ComputeCellNormals ) ; return this -> ComputeCellNormals ; } ; virtual void ComputeCellNormalsOn ( ) { this -> SetSplittingConsistencyAutoOrientNormalsComputePointNormalsComputeCellNormals ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ComputeCellNormalsOff ( ) { this -> SetSplittingConsistencyAutoOrientNormalsComputePointNormalsComputeCellNormals ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off the global flipping of normal orientation. Flipping
##  reverves the meaning of front and back for Frontface and Backface
##  culling in vtkProperty.  Flipping modifies both the normal
##  direction and the order of a cell's points.
##  virtual void SetSplittingConsistencyAutoOrientNormalsComputePointNormalsComputeCellNormalsFlipNormals ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  FlipNormals  to  << _arg ) ; if ( this -> FlipNormals != _arg ) { this -> FlipNormals = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetFeatureAngleSplittingConsistencyAutoOrientNormalsComputePointNormalsComputeCellNormalsFlipNormals ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FlipNormals  of  << this -> FlipNormals ) ; return this -> FlipNormals ; } ; virtual void FlipNormalsOn ( ) { this -> SetSplittingConsistencyAutoOrientNormalsComputePointNormalsComputeCellNormalsFlipNormals ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void FlipNormalsOff ( ) { this -> SetSplittingConsistencyAutoOrientNormalsComputePointNormalsComputeCellNormalsFlipNormals ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off traversal across non-manifold edges. This will prevent
##  problems where the consistency of polygonal ordering is corrupted due
##  to topological loops.
##  virtual void SetSplittingConsistencyAutoOrientNormalsComputePointNormalsComputeCellNormalsFlipNormalsNonManifoldTraversal ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NonManifoldTraversal  to  << _arg ) ; if ( this -> NonManifoldTraversal != _arg ) { this -> NonManifoldTraversal = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetFeatureAngleSplittingConsistencyAutoOrientNormalsComputePointNormalsComputeCellNormalsFlipNormalsNonManifoldTraversal ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NonManifoldTraversal  of  << this -> NonManifoldTraversal ) ; return this -> NonManifoldTraversal ; } ; virtual void NonManifoldTraversalOn ( ) { this -> SetSplittingConsistencyAutoOrientNormalsComputePointNormalsComputeCellNormalsFlipNormalsNonManifoldTraversal ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void NonManifoldTraversalOff ( ) { this -> SetSplittingConsistencyAutoOrientNormalsComputePointNormalsComputeCellNormalsFlipNormalsNonManifoldTraversal ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/get the desired precision for the output types. See the documentation
##  for the vtkAlgorithm::DesiredOutputPrecision enum for an explanation of
##  the available precision settings.
##  virtual void SetFeatureAngleOutputPointsPrecision ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << OutputPointsPrecision  to  << _arg ) ; if ( this -> OutputPointsPrecision != ( _arg < SINGLE_PRECISION ? SINGLE_PRECISION : ( _arg > DEFAULT_PRECISION ? DEFAULT_PRECISION : _arg ) ) ) { this -> OutputPointsPrecision = ( _arg < SINGLE_PRECISION ? SINGLE_PRECISION : ( _arg > DEFAULT_PRECISION ? DEFAULT_PRECISION : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetFeatureAngleMinValueOutputPointsPrecisionMinValue ( ) { return SINGLE_PRECISION ; } virtual int GetFeatureAngleMaxValueOutputPointsPrecisionMaxValue ( ) { return DEFAULT_PRECISION ; } ; virtual int GetFeatureAngleSplittingConsistencyAutoOrientNormalsComputePointNormalsComputeCellNormalsFlipNormalsNonManifoldTraversalOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ; /@} protected : vtkPolyDataNormals ( ) ; ~ vtkPolyDataNormals ( ) override = default ;  Usual data generation method int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; double FeatureAngle ; vtkTypeBool Splitting ; vtkTypeBool Consistency ; vtkTypeBool FlipNormals ; vtkTypeBool AutoOrientNormals ; vtkTypeBool NonManifoldTraversal ; vtkTypeBool ComputePointNormals ; vtkTypeBool ComputeCellNormals ; int NumFlips ; int OutputPointsPrecision ; private : vtkIdList * Wave ; vtkIdList * Wave2 ; vtkIdList * CellIds ; vtkIdList * CellPoints ; vtkIdList * NeighborPoints ; vtkIdList * Map ; vtkPolyData * OldMesh ; vtkPolyData * NewMesh ; int * Visited ; vtkFloatArray * PolyNormals ; double CosAngle ;  Uses the list of cell ids (this->Wave) to propagate a wave of
##  checked and properly ordered polygons. void TraverseAndOrder ( void ) ;  Check the point id give to see whether it lies on a feature
##  edge. If so, split the point (i.e., duplicate it) to topologically
##  separate the mesh. void MarkAndSplit ( vtkIdType ptId ) ; private : vtkPolyDataNormals ( const vtkPolyDataNormals & ) = delete ; void operator = ( const vtkPolyDataNormals & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
