## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkConnectedPointsFilter.h
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
##  @class   vtkConnectedPointsFilter
##  @brief   extract / segment points based on geometric connectivity
##
##  vtkConnectedPointsFilter is a filter that extracts and/or segments points
##  from a point cloud based on geometric distance measures (e.g., proximity,
##  normal alignments, etc.) and optional measures such as scalar range. The
##  default operation is to segment the points into "connected" regions where
##  the connection is determined by an appropriate distance measure. Each
##  region is given a region id. Optionally, the filter can output the largest
##  connected region of points; a particular region (via id specification);
##  those regions that are seeded using a list of input point ids; or the
##  region of points closest to a specified position.
##
##  The key parameter of this filter is the radius defining a sphere around
##  each point which defines a local neighborhood: any other points in the
##  local neighborhood are assumed connected to the point. Note that the
##  radius is defined in absolute terms.
##
##  Other parameters are used to further qualify what it means to be a
##  neighboring point. For example, scalar range and/or point normals can be
##  used to further constrain the neighborhood. Also the extraction mode
##  defines how the filter operates. By default, all regions are extracted but
##  it is possible to extract particular regions; the region closest to a seed
##  point; seeded regions; or the largest region found while processing. By
##  default, all regions are extracted.
##
##  On output, all points are labeled with a region number. However note that
##  the number of input and output points may not be the same: if not
##  extracting all regions then the output size may be less than the input
##  size.
##
##  @sa
##  vtkPolyDataConnectivityFilter vtkConnectivityFilter
##

## !!!Ignored construct:  # vtkConnectedPointsFilter_h [NewLine] # vtkConnectedPointsFilter_h [NewLine] # vtkFiltersPointsModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine]  Make these consistent with the other connectivity filters # VTK_EXTRACT_POINT_SEEDED_REGIONS 1 [NewLine] # VTK_EXTRACT_SPECIFIED_REGIONS 3 [NewLine] # VTK_EXTRACT_LARGEST_REGION 4 [NewLine] # VTK_EXTRACT_ALL_REGIONS 5 [NewLine] # VTK_EXTRACT_CLOSEST_POINT_REGION 6 [NewLine] class vtkAbstractPointLocator ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDataArray"
discard "forward decl of vtkFloatArray"
discard "forward decl of vtkIdList"
discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkIntArray"
## !!!Ignored construct:  class VTKFILTERSPOINTS_EXPORT vtkConnectedPointsFilter : public vtkPolyDataAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkConnectedPointsFilter :: IsTypeOf ( type ) ; } static vtkConnectedPointsFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkConnectedPointsFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkConnectedPointsFilter * NewInstance ( ) const { return vtkConnectedPointsFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkConnectedPointsFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkConnectedPointsFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct with default extraction mode to extract the largest region.
##  static vtkConnectedPointsFilter * New ( ) ; /@{ *
##  Set / get the radius variable specifying a local sphere used to define
##  local point neighborhood.
##  virtual void SetRadius ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Radius  to  << _arg ) ; if ( this -> Radius != ( _arg < 0.0 ? 0.0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ) { this -> Radius = ( _arg < 0.0 ? 0.0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetRadiusMinValue ( ) { return 0.0 ; } virtual double GetRadiusMaxValue ( ) { return VTK_DOUBLE_MAX ; } ; virtual double GetRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Radius  of  << this -> Radius ) ; return this -> Radius ; } ; /@} /@{ *
##  Control the extraction of connected regions.
##  virtual void SetRadiusExtractionMode ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ExtractionMode  to  << _arg ) ; if ( this -> ExtractionMode != ( _arg < VTK_EXTRACT_POINT_SEEDED_REGIONS ? VTK_EXTRACT_POINT_SEEDED_REGIONS : ( _arg > VTK_EXTRACT_CLOSEST_POINT_REGION ? VTK_EXTRACT_CLOSEST_POINT_REGION : _arg ) ) ) { this -> ExtractionMode = ( _arg < VTK_EXTRACT_POINT_SEEDED_REGIONS ? VTK_EXTRACT_POINT_SEEDED_REGIONS : ( _arg > VTK_EXTRACT_CLOSEST_POINT_REGION ? VTK_EXTRACT_CLOSEST_POINT_REGION : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetRadiusMinValueExtractionModeMinValue ( ) { return VTK_EXTRACT_POINT_SEEDED_REGIONS ; } virtual int GetRadiusMaxValueExtractionModeMaxValue ( ) { return VTK_EXTRACT_CLOSEST_POINT_REGION ; } ; virtual int GetRadiusExtractionMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ExtractionMode  of  << this -> ExtractionMode ) ; return this -> ExtractionMode ; } ; void SetExtractionModeToPointSeededRegions ( ) { this -> SetExtractionMode ( VTK_EXTRACT_POINT_SEEDED_REGIONS ) ; } void SetExtractionModeToLargestRegion ( ) { this -> SetExtractionMode ( VTK_EXTRACT_LARGEST_REGION ) ; } void SetExtractionModeToSpecifiedRegions ( ) { this -> SetExtractionMode ( VTK_EXTRACT_SPECIFIED_REGIONS ) ; } void SetExtractionModeToClosestPointRegion ( ) { this -> SetExtractionMode ( VTK_EXTRACT_CLOSEST_POINT_REGION ) ; } void SetExtractionModeToAllRegions ( ) { this -> SetExtractionMode ( VTK_EXTRACT_ALL_REGIONS ) ; } const char * GetExtractionModeAsString ( ) ; /@} /@{ *
##  Use to specify x-y-z point coordinates when extracting the region
##  closest to a specified point.
##  virtual void SetClosestPoint ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << ClosestPoint  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> ClosestPoint [ 0 ] != _arg1 ) || ( this -> ClosestPoint [ 1 ] != _arg2 ) || ( this -> ClosestPoint [ 2 ] != _arg3 ) ) { this -> ClosestPoint [ 0 ] = _arg1 ; this -> ClosestPoint [ 1 ] = _arg2 ; this -> ClosestPoint [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetClosestPoint ( const double _arg [ 3 ] ) { this -> SetClosestPoint ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetClosestPoint ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ClosestPoint  pointer  << this -> ClosestPoint ) ; return this -> ClosestPoint ; } VTK_WRAPEXCLUDE virtual void GetClosestPoint ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> ClosestPoint [ i ] ; } } ; /@} *
##  Initialize list of point ids ids used to seed regions.
##  void InitializeSeedList ( ) ; *
##  Add a non-negative point seed id. Note: ids are 0-offset.
##  void AddSeed ( vtkIdType id ) ; *
##  Delete a point seed id. Note: ids are 0-offset.
##  void DeleteSeed ( vtkIdType id ) ; *
##  Initialize list of region ids to extract.
##  void InitializeSpecifiedRegionList ( ) ; *
##  Add a non-negative region id to extract. Note: ids are 0-offset.
##  void AddSpecifiedRegion ( vtkIdType id ) ; *
##  Delete a region id to extract. Note: ids are 0-offset.
##  void DeleteSpecifiedRegion ( vtkIdType id ) ; /@{ *
##  Turn on/off connectivity based on point normal consistency. If on, and
##  point normals are defined, points are connected only if they satisfy
##  other criterion (e.g., geometric proximity, scalar connectivity, etc.)
##  AND the angle between normals is no greater than NormalAngle;
##  virtual void SetAlignedNormals ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  AlignedNormals  to  << _arg ) ; if ( this -> AlignedNormals != _arg ) { this -> AlignedNormals = _arg ; this -> Modified ( ) ; } } ; virtual int GetRadiusExtractionModeAlignedNormals ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AlignedNormals  of  << this -> AlignedNormals ) ; return this -> AlignedNormals ; } ; virtual void AlignedNormalsOn ( ) { this -> SetAlignedNormals ( static_cast < int > ( 1 ) ) ; } virtual void AlignedNormalsOff ( ) { this -> SetAlignedNormals ( static_cast < int > ( 0 ) ) ; } ; /@} /@{ *
##  Specify a threshold for normal angles. If AlignedNormalsOn is set, then
##  points are connected if the angle between their normals is within this
##  angle threshold (expressed in degress).
##  virtual void SetRadiusExtractionModeNormalAngle ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << NormalAngle  to  << _arg ) ; if ( this -> NormalAngle != ( _arg < 0.0001 ? 0.0001 : ( _arg > 90.0 ? 90.0 : _arg ) ) ) { this -> NormalAngle = ( _arg < 0.0001 ? 0.0001 : ( _arg > 90.0 ? 90.0 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetRadiusMinValueExtractionModeMinValueNormalAngleMinValue ( ) { return 0.0001 ; } virtual double GetRadiusMaxValueExtractionModeMaxValueNormalAngleMaxValue ( ) { return 90.0 ; } ; virtual double GetRadiusExtractionModeAlignedNormalsNormalAngle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NormalAngle  of  << this -> NormalAngle ) ; return this -> NormalAngle ; } ; /@} /@{ *
##  Turn on/off connectivity based on scalar value. If on, points are
##  connected only if they satisfy the various geometric criterion AND one
##  of the points scalar values falls in the scalar range specified.
##  virtual void SetAlignedNormalsScalarConnectivity ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ScalarConnectivity  to  << _arg ) ; if ( this -> ScalarConnectivity != _arg ) { this -> ScalarConnectivity = _arg ; this -> Modified ( ) ; } } ; virtual int GetRadiusExtractionModeAlignedNormalsNormalAngleScalarConnectivity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarConnectivity  of  << this -> ScalarConnectivity ) ; return this -> ScalarConnectivity ; } ; virtual void ScalarConnectivityOn ( ) { this -> SetAlignedNormalsScalarConnectivity ( static_cast < int > ( 1 ) ) ; } virtual void ScalarConnectivityOff ( ) { this -> SetAlignedNormalsScalarConnectivity ( static_cast < int > ( 0 ) ) ; } ; /@} /@{ *
##  Set the scalar range to use to extract points based on scalar connectivity.
##  virtual void SetScalarRange ( double _arg1 , double _arg2 ) { vtkDebugWithObjectMacro ( this , <<  setting  << ScalarRange  to ( << _arg1 << , << _arg2 << ) ) ; if ( ( this -> ScalarRange [ 0 ] != _arg1 ) || ( this -> ScalarRange [ 1 ] != _arg2 ) ) { this -> ScalarRange [ 0 ] = _arg1 ; this -> ScalarRange [ 1 ] = _arg2 ; this -> Modified ( ) ; } } void SetScalarRange ( const double _arg [ 2 ] ) { this -> SetScalarRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; virtual double * GetScalarRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarRange  pointer  << this -> ScalarRange ) ; return this -> ScalarRange ; } VTK_WRAPEXCLUDE virtual void GetScalarRange ( double & _arg1 , double & _arg2 ) { _arg1 = this -> ScalarRange [ 0 ] ; _arg2 = this -> ScalarRange [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << ScalarRange  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetScalarRange ( double _arg [ 2 ] ) { this -> GetScalarRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; /@} *
##  Obtain the number of connected regions. The return value is valid only
##  after the filter has executed.
##  int GetNumberOfExtractedRegions ( ) ; /@{ *
##  Specify a point locator. By default a vtkStaticPointLocator is
##  used. The locator performs efficient searches to locate points
##  around a sample point.
##  void SetLocator ( vtkAbstractPointLocator * locator ) ; virtual vtkAbstractPointLocator * GetnameLocator ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Locator  address  << static_cast < vtkAbstractPointLocator * > ( this -> Locator ) ) ; return this -> Locator ; } ; /@} protected : vtkConnectedPointsFilter ( ) ; ~ vtkConnectedPointsFilter ( ) override ;  Usual data generation method int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ;  The radius defines the proximal neighborhood of points double Radius ;  indicate how to extract regions int ExtractionMode ;  id's of points used to seed regions vtkIdList * Seeds ;  regions specified for extraction vtkIdList * SpecifiedRegionIds ;  Seed with a closest point double ClosestPoint [ 3 ] ;  Segment based on nearly aligned normals int AlignedNormals ; double NormalAngle ; double NormalThreshold ;  Support segmentation based on scalar connectivity int ScalarConnectivity ; double ScalarRange [ 2 ] ;  accelerate searching vtkAbstractPointLocator * Locator ;  Wave propagation used to segment points void TraverseAndMark ( vtkPoints * inPts , vtkDataArray * inScalars , float * normals , vtkIdType * labels ) ; private :  used to support algorithm execution vtkIdType CurrentRegionNumber ; vtkIdTypeArray * RegionLabels ; vtkIdType NumPointsInRegion ; vtkIdTypeArray * RegionSizes ; vtkIdList * NeighborPointIds ;  avoid repetitive new/delete vtkIdList * Wave ; vtkIdList * Wave2 ; private : vtkConnectedPointsFilter ( const vtkConnectedPointsFilter & ) = delete ; void operator = ( const vtkConnectedPointsFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## *
##  Return the method of extraction as a string.
##

proc GetExtractionModeAsString*(): cstring {.
    importcpp: "VTKFILTERSPOINTS_EXPORT::GetExtractionModeAsString(@)",
    header: "vtkConnectedPointsFilter.h".}