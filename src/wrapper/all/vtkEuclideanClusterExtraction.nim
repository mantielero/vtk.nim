## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkEuclideanClusterExtraction.h
##
##   Copyright (c) Kitware, Inc.
##   All rights reserved.
##   See LICENSE file for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkEuclideanClusterExtraction
##  @brief   perform segmentation based on geometric
##  proximity and optional scalar threshold
##
##  vtkEuclideanClusterExtraction is a filter that extracts points that are in
##  close geometric proximity, and optionally satisfies a scalar threshold
##  criterion. (Points extracted in this way are referred to as clusters.)
##  The filter works in one of five ways: 1) extract the largest cluster in the
##  dataset; 2) extract specified cluster number(s); 3) extract all clusters
##  containing specified point ids; 4) extract the cluster closest to a specified
##  point; or 5) extract all clusters (which can be used for coloring the clusters).
##
##  Note that geometric proximity is defined by setting the Radius instance
##  variable. This variable defines a local sphere around each point; other
##  points contained in this sphere are considered "connected" to the
##  point. Setting this number too large will connect clusters that should not
##  be; setting it too small will fragment the point cloud into myriad
##  clusters. To accelerate the geometric proximity operations, a point
##  locator may be specified. By default, a vtkStaticPointLocator is used, but
##  any vtkAbstractPointLocator may be specified.
##
##  The behavior of vtkEuclideanClusterExtraction can be modified by turning
##  on the boolean ivar ScalarConnectivity. If this flag is on, the clustering
##  algorithm is modified so that points are considered part of a cluster if
##  they satisfy both the geometric proximity measure, and the points scalar
##  values falls into the scalar range specified. This use of
##  ScalarConnectivity is particularly useful for data with intensity or color
##  information, serving as a simple "connected segmentation" algorithm. For
##  example, by using a seed point in a known cluster, clustering will pull
##  out all points "representing" the local structure.
##
##  @sa
##  vtkConnectivityFilter vtkPolyDataConnectivityFilter
##

## !!!Ignored construct:  # vtkEuclideanClusterExtraction_h [NewLine] # vtkEuclideanClusterExtraction_h [NewLine] # vtkFiltersPointsModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] # VTK_EXTRACT_POINT_SEEDED_CLUSTERS 1 [NewLine] # VTK_EXTRACT_SPECIFIED_CLUSTERS 2 [NewLine] # VTK_EXTRACT_LARGEST_CLUSTER 3 [NewLine] # VTK_EXTRACT_ALL_CLUSTERS 4 [NewLine] # VTK_EXTRACT_CLOSEST_POINT_CLUSTER 5 [NewLine] class vtkDataArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkFloatArray"
discard "forward decl of vtkIdList"
discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkAbstractPointLocator"
## !!!Ignored construct:  class VTKFILTERSPOINTS_EXPORT vtkEuclideanClusterExtraction : public vtkPolyDataAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkEuclideanClusterExtraction :: IsTypeOf ( type ) ; } static vtkEuclideanClusterExtraction * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkEuclideanClusterExtraction * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkEuclideanClusterExtraction * NewInstance ( ) const { return vtkEuclideanClusterExtraction :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkEuclideanClusterExtraction :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkEuclideanClusterExtraction :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct with default extraction mode to extract largest clusters.
##  static vtkEuclideanClusterExtraction * New ( ) ; /@{ *
##  Specify the local search radius.
##  virtual void SetRadius ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Radius  to  << _arg ) ; if ( this -> Radius != ( _arg < 0.0 ? 0.0 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ) { this -> Radius = ( _arg < 0.0 ? 0.0 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetRadiusMinValue ( ) { return 0.0 ; } virtual double GetRadiusMaxValue ( ) { return VTK_FLOAT_MAX ; } ; virtual double GetRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Radius  of  << this -> Radius ) ; return this -> Radius ; } ; /@} /@{ *
##  Turn on/off connectivity based on scalar value. If on, points are
##  connected only if the are proximal AND the scalar value of a candidate
##  point falls in the scalar range specified. Of course input point scalar
##  data must be provided.
##  virtual void SetScalarConnectivity ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ScalarConnectivity  to  << _arg ) ; if ( this -> ScalarConnectivity != _arg ) { this -> ScalarConnectivity = _arg ; this -> Modified ( ) ; } } ; virtual bool GetRadiusScalarConnectivity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarConnectivity  of  << this -> ScalarConnectivity ) ; return this -> ScalarConnectivity ; } ; virtual void ScalarConnectivityOn ( ) { this -> SetScalarConnectivity ( static_cast < bool > ( 1 ) ) ; } virtual void ScalarConnectivityOff ( ) { this -> SetScalarConnectivity ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Set the scalar range used to extract points based on scalar connectivity.
##  virtual void SetScalarRange ( double _arg1 , double _arg2 ) { vtkDebugWithObjectMacro ( this , <<  setting  << ScalarRange  to ( << _arg1 << , << _arg2 << ) ) ; if ( ( this -> ScalarRange [ 0 ] != _arg1 ) || ( this -> ScalarRange [ 1 ] != _arg2 ) ) { this -> ScalarRange [ 0 ] = _arg1 ; this -> ScalarRange [ 1 ] = _arg2 ; this -> Modified ( ) ; } } void SetScalarRange ( const double _arg [ 2 ] ) { this -> SetScalarRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; virtual double * GetScalarRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarRange  pointer  << this -> ScalarRange ) ; return this -> ScalarRange ; } VTK_WRAPEXCLUDE virtual void GetScalarRange ( double & _arg1 , double & _arg2 ) { _arg1 = this -> ScalarRange [ 0 ] ; _arg2 = this -> ScalarRange [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << ScalarRange  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetScalarRange ( double _arg [ 2 ] ) { this -> GetScalarRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; /@} /@{ *
##  Control the extraction of connected surfaces.
##  virtual void SetRadiusExtractionMode ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ExtractionMode  to  << _arg ) ; if ( this -> ExtractionMode != ( _arg < VTK_EXTRACT_POINT_SEEDED_CLUSTERS ? VTK_EXTRACT_POINT_SEEDED_CLUSTERS : ( _arg > VTK_EXTRACT_CLOSEST_POINT_CLUSTER ? VTK_EXTRACT_CLOSEST_POINT_CLUSTER : _arg ) ) ) { this -> ExtractionMode = ( _arg < VTK_EXTRACT_POINT_SEEDED_CLUSTERS ? VTK_EXTRACT_POINT_SEEDED_CLUSTERS : ( _arg > VTK_EXTRACT_CLOSEST_POINT_CLUSTER ? VTK_EXTRACT_CLOSEST_POINT_CLUSTER : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetRadiusMinValueExtractionModeMinValue ( ) { return VTK_EXTRACT_POINT_SEEDED_CLUSTERS ; } virtual int GetRadiusMaxValueExtractionModeMaxValue ( ) { return VTK_EXTRACT_CLOSEST_POINT_CLUSTER ; } ; virtual int GetRadiusScalarConnectivityExtractionMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ExtractionMode  of  << this -> ExtractionMode ) ; return this -> ExtractionMode ; } ; void SetExtractionModeToPointSeededClusters ( ) { this -> SetExtractionMode ( VTK_EXTRACT_POINT_SEEDED_CLUSTERS ) ; } void SetExtractionModeToLargestCluster ( ) { this -> SetExtractionMode ( VTK_EXTRACT_LARGEST_CLUSTER ) ; } void SetExtractionModeToSpecifiedClusters ( ) { this -> SetExtractionMode ( VTK_EXTRACT_SPECIFIED_CLUSTERS ) ; } void SetExtractionModeToClosestPointCluster ( ) { this -> SetExtractionMode ( VTK_EXTRACT_CLOSEST_POINT_CLUSTER ) ; } void SetExtractionModeToAllClusters ( ) { this -> SetExtractionMode ( VTK_EXTRACT_ALL_CLUSTERS ) ; } const char * GetExtractionModeAsString ( ) ; /@} *
##  Initialize the list of point ids used to seed clusters.
##  void InitializeSeedList ( ) ; *
##  Add a seed id (point id). Note: ids are 0-offset.
##  void AddSeed ( vtkIdType id ) ; *
##  Delete a seed id.a
##  void DeleteSeed ( vtkIdType id ) ; *
##  Initialize the list of cluster ids to extract.
##  void InitializeSpecifiedClusterList ( ) ; *
##  Add a cluster id to extract. Note: ids are 0-offset.
##  void AddSpecifiedCluster ( int id ) ; *
##  Delete a cluster id to extract.
##  void DeleteSpecifiedCluster ( int id ) ; /@{ *
##  Used to specify the x-y-z point coordinates when extracting the cluster
##  closest to a specified point.
##  virtual void SetClosestPoint ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << ClosestPoint  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> ClosestPoint [ 0 ] != _arg1 ) || ( this -> ClosestPoint [ 1 ] != _arg2 ) || ( this -> ClosestPoint [ 2 ] != _arg3 ) ) { this -> ClosestPoint [ 0 ] = _arg1 ; this -> ClosestPoint [ 1 ] = _arg2 ; this -> ClosestPoint [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetClosestPoint ( const double _arg [ 3 ] ) { this -> SetClosestPoint ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetClosestPoint ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ClosestPoint  pointer  << this -> ClosestPoint ) ; return this -> ClosestPoint ; } VTK_WRAPEXCLUDE virtual void GetClosestPoint ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> ClosestPoint [ i ] ; } } ; /@} *
##  Obtain the number of connected clusters. This value is valid only after filter execution.
##  int GetNumberOfExtractedClusters ( ) ; /@{ *
##  Turn on/off the coloring of connected clusters.
##  virtual void SetScalarConnectivityColorClusters ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ColorClusters  to  << _arg ) ; if ( this -> ColorClusters != _arg ) { this -> ColorClusters = _arg ; this -> Modified ( ) ; } } ; virtual bool GetRadiusScalarConnectivityExtractionModeColorClusters ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ColorClusters  of  << this -> ColorClusters ) ; return this -> ColorClusters ; } ; virtual void ColorClustersOn ( ) { this -> SetScalarConnectivityColorClusters ( static_cast < bool > ( 1 ) ) ; } virtual void ColorClustersOff ( ) { this -> SetScalarConnectivityColorClusters ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify a point locator. By default a vtkStaticPointLocator is
##  used. The locator performs efficient proximity searches near a
##  specified interpolation position.
##  void SetLocator ( vtkAbstractPointLocator * locator ) ; virtual vtkAbstractPointLocator * GetnameLocator ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Locator  address  << static_cast < vtkAbstractPointLocator * > ( this -> Locator ) ) ; return this -> Locator ; } ; /@} protected : vtkEuclideanClusterExtraction ( ) ; ~ vtkEuclideanClusterExtraction ( ) override ; double Radius ;  connection radius bool ColorClusters ;  boolean turns on/off scalar gen for separate clusters int ExtractionMode ;  how to extract clusters vtkIdList * Seeds ;  id's of points or cells used to seed clusters vtkIdList * SpecifiedClusterIds ;  clusters specified for extraction vtkIdTypeArray * ClusterSizes ;  size (in cells) of each cluster extracted double ClosestPoint [ 3 ] ; bool ScalarConnectivity ; double ScalarRange [ 2 ] ; vtkAbstractPointLocator * Locator ;  Configure the pipeline int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ;  Internal method for propagating connected waves. void InsertIntoWave ( vtkIdList * wave , vtkIdType ptId ) ; void TraverseAndMark ( vtkPoints * pts ) ; private : vtkEuclideanClusterExtraction ( const vtkEuclideanClusterExtraction & ) = delete ; void operator = ( const vtkEuclideanClusterExtraction & ) = delete ;  used to support algorithm execution vtkFloatArray * NeighborScalars ; vtkIdList * NeighborPointIds ; char * Visited ; vtkIdType * PointMap ; vtkIdTypeArray * NewScalars ; vtkIdType ClusterNumber ; vtkIdType PointNumber ; vtkIdType NumPointsInCluster ; vtkDataArray * InScalars ; vtkIdList * Wave ; vtkIdList * Wave2 ; vtkIdList * PointIds ; } ;
## Error: token expected: ; but got: [identifier]!!!

## *
##  Return the method of extraction as a string.
##

proc GetExtractionModeAsString*(): cstring {.
    importcpp: "VTKFILTERSPOINTS_EXPORT::GetExtractionModeAsString(@)",
    header: "vtkEuclideanClusterExtraction.h".}