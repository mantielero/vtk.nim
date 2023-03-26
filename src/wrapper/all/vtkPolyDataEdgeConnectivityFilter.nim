## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPolyDataEdgeConnectivityFilter.h
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
##  @class   vtkPolyDataEdgeConnectivityFilter
##  @brief   segment polygonal mesh based on shared edge connectivity
##
##  vtkPolyDataEdgeConnectivityFilter is a filter to segment cells that
##  share common edges (i.e., are edge connected), given certain conditions on
##  edge connectivity. These conditions are 1) the shared edge is not a
##  barrier edge, and 2) the edge neighbor satisfies conditions on scalar
##  values.  Specification of both #1 and #2 are optional; in which case all
##  polygons in a region that share edges are connected. Barrier edges are
##  either defined by providing an optional second polydata input (which
##  contains a list of lines defining the barrier edges), or a condition on
##  edge length. The conditions on edge length specify whether edges within a
##  range of edge lengths are considered barrier edges.  All connected
##  polygonal cells satisfying these conditions form a region. Typically the
##  filter segments multiple regions; however the user can specify which
##  region(s) are to be extracted and output.
##
##  The filter works in one of seven ways: 1) extract the largest (in terms of
##  total surface area) edge-connected region in the dataset; 2) extract
##  specified regions; 3) extract all regions containing user-specified
##  point ids; 4) extract all regions containing user-specified cell ids; 5)
##  extract the region closest to a user-specified point; 6) extract all
##  edge-connected regions (used to color regions, i.e., create segmentation
##  labeling); or 7) extract "large" regions, that is all regions considered
##  large in terms of their surface area relative to the total input polydata
##  surface area.
##
##  Barrier edges add a unique twist to the filter. By using them, it is
##  possible to segment out portions of a mesh with very small, very large, or
##  inbetween polygon-sized features.
##
##  Due to the nature of edge connectivity, the filter only operates on
##  polygons. Vertices, lines, and triangle strips are ignored (and not passed
##  through to the output). Point and cell attribute data are copied to the
##  output; however, an additional, optional array named "RegionId" may be
##  added to the output cell attribute data by enabling ColorRegions.
##
##  @warning
##  If more than one output region is produced, regions are sorted based on
##  their surface area. Thus region# 0 is the largest, followed by the next
##  largest and so on.
##
##  @warning
##  To be clear: if scalar connectivity is enabled, this filter segments data
##  based on *cell* attribute data based on edge-connected meshes. The similar
##  vtkPolyDataConnectivityFilter segments based on point attribute data and
##  point-connected meshes.
##
##  @warning
##  A second, optional vtkPolyData (the Source) may be specified which
##  contains edges (i.e., vtkPolyData::Lines) that specify barries to edge
##  connectivity. That is, two polygons who share an edge are not connected if
##  the shared edge exists in the Source vtkPolyData. This feature can be used
##  with other filters such as vtkDelaunay2D (and its constraint edges) to
##  create segmented regions.
##
##  @warning
##  Note that mesh regions attached at just a point are not considered
##  connected. Thus such point-connected meshes will be segmented into
##  different regions. This differs from vtkPolyDataConnectivityFilter which
##  segments produces point-connected regions.
##
##  @sa
##  vtkPolyDataConnectivityFilter vtkConnectivityFilter vtkDelaunay2D
##

import
  vtkFiltersCoreModule, vtkIdTypeArray, vtkPolyDataAlgorithm

const
  VTK_EXTRACT_POINT_SEEDED_REGIONS* = 1
  VTK_EXTRACT_CELL_SEEDED_REGIONS* = 2
  VTK_EXTRACT_SPECIFIED_REGIONS* = 3
  VTK_EXTRACT_LARGEST_REGION* = 4
  VTK_EXTRACT_ALL_REGIONS* = 5
  VTK_EXTRACT_CLOSEST_POINT_REGION* = 6
  VTK_EXTRACT_LARGE_REGIONS* = 7

discard "forward decl of vtkDataArray"
discard "forward decl of vtkCharArray"
discard "forward decl of vtkIdList"
discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkEdgeTable"
type
  vtkPolyDataEdgeConnectivityFilter* {.importcpp: "vtkPolyDataEdgeConnectivityFilter", header: "vtkPolyDataEdgeConnectivityFilter.h",
                                      bycopy.} = object of vtkPolyDataAlgorithm ## /@{
                                                                           ## *
                                                                           ##  Standard methods to instantiate, get type information, and print the object.
                                                                           ##
    vtkPolyDataEdgeConnectivityFilter* {.importc: "vtkPolyDataEdgeConnectivityFilter".}: VTK_NEWINSTANCE
    ##  boolean turns on/off scalar generation for separate regions
    ##  for each cell, the area of the region the cell is associated with
    ##  how to extract regions
    ##  enable barrier edges
    ##  edges of length within this range are barrier edges
    ##  id's of points or cells used to seed regions
    ##  regions specified for extraction
    ##  size (in cells) of each region extracted
    ##  Methods for iterative traversal and marking cells
    ##  region growing is a multiple-pass process
    ##  the total area of the input mesh
    ##  the area of each polygonal cell
    ##  the total area of each region
    ##  indicate whether the region is large or small
    ##  used to support algorithm execution
    ##  BarrierEdgeLenght[0,1]**2 of edge lengths defining barriers


proc New*(): ptr vtkPolyDataEdgeConnectivityFilter {.
    importcpp: "vtkPolyDataEdgeConnectivityFilter::New(@)",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
type
  vtkPolyDataEdgeConnectivityFilterSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPolyDataEdgeConnectivityFilter::IsTypeOf(@)",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc IsA*(this: var vtkPolyDataEdgeConnectivityFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPolyDataEdgeConnectivityFilter {.
    importcpp: "vtkPolyDataEdgeConnectivityFilter::SafeDownCast(@)",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPolyDataEdgeConnectivityFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPolyDataEdgeConnectivityFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPolyDataEdgeConnectivityFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPolyDataEdgeConnectivityFilter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc SetExtractionMode*(this: var vtkPolyDataEdgeConnectivityFilter; _arg: cint) {.
    importcpp: "SetExtractionMode", header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc GetExtractionModeMinValue*(this: var vtkPolyDataEdgeConnectivityFilter): cint {.
    importcpp: "GetExtractionModeMinValue",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc GetExtractionModeMaxValue*(this: var vtkPolyDataEdgeConnectivityFilter): cint {.
    importcpp: "GetExtractionModeMaxValue",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
## !!!Ignored construct:  virtual int GetExtractionMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ExtractionMode  of  << this -> ExtractionMode ) ; return this -> ExtractionMode ; } ;
## Error: expected ';'!!!

proc SetExtractionModeToPointSeededRegions*(
    this: var vtkPolyDataEdgeConnectivityFilter) {.
    importcpp: "SetExtractionModeToPointSeededRegions",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc SetExtractionModeToCellSeededRegions*(
    this: var vtkPolyDataEdgeConnectivityFilter) {.
    importcpp: "SetExtractionModeToCellSeededRegions",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc SetExtractionModeToLargestRegion*(this: var vtkPolyDataEdgeConnectivityFilter) {.
    importcpp: "SetExtractionModeToLargestRegion",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc SetExtractionModeToSpecifiedRegions*(
    this: var vtkPolyDataEdgeConnectivityFilter) {.
    importcpp: "SetExtractionModeToSpecifiedRegions",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc SetExtractionModeToClosestPointRegion*(
    this: var vtkPolyDataEdgeConnectivityFilter) {.
    importcpp: "SetExtractionModeToClosestPointRegion",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc SetExtractionModeToLargeRegions*(this: var vtkPolyDataEdgeConnectivityFilter) {.
    importcpp: "SetExtractionModeToLargeRegions",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc SetExtractionModeToAllRegions*(this: var vtkPolyDataEdgeConnectivityFilter) {.
    importcpp: "SetExtractionModeToAllRegions",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc GetExtractionModeAsString*(this: var vtkPolyDataEdgeConnectivityFilter): cstring {.
    importcpp: "GetExtractionModeAsString",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc SetBarrierEdges*(this: var vtkPolyDataEdgeConnectivityFilter; _arg: vtkTypeBool) {.
    importcpp: "SetBarrierEdges", header: "vtkPolyDataEdgeConnectivityFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetExtractionModeBarrierEdges ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BarrierEdges  of  << this -> BarrierEdges ) ; return this -> BarrierEdges ; } ;
## Error: expected ';'!!!

proc BarrierEdgesOn*(this: var vtkPolyDataEdgeConnectivityFilter) {.
    importcpp: "BarrierEdgesOn", header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc BarrierEdgesOff*(this: var vtkPolyDataEdgeConnectivityFilter) {.
    importcpp: "BarrierEdgesOff", header: "vtkPolyDataEdgeConnectivityFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify the source vtkPolyData object used to specify barrier edges
  ##  (this is an optional connection.) If specified, the connected traversal
  ##  cannot traverse across the edges indicated as they are defined as
  ##  barrier edges. Also note that the data member BarrierEdges must be
  ##  enabled.
  ##
proc SetSourceData*(this: var vtkPolyDataEdgeConnectivityFilter; a2: ptr vtkPolyData) {.
    importcpp: "SetSourceData", header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc SetSourceConnection*(this: var vtkPolyDataEdgeConnectivityFilter;
                         algOutput: ptr vtkAlgorithmOutput) {.
    importcpp: "SetSourceConnection",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc GetSource*(this: var vtkPolyDataEdgeConnectivityFilter): ptr vtkPolyData {.
    importcpp: "GetSource", header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc SetBarrierEdgeLength*(this: var vtkPolyDataEdgeConnectivityFilter;
                          _arg1: cdouble; _arg2: cdouble) {.
    importcpp: "SetBarrierEdgeLength",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc SetBarrierEdgeLength*(this: var vtkPolyDataEdgeConnectivityFilter;
                          _arg: array[2, cdouble]) {.
    importcpp: "SetBarrierEdgeLength",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
## !!!Ignored construct:  virtual double * GetBarrierEdgeLength ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << BarrierEdgeLength  pointer  << this -> BarrierEdgeLength ) ; return this -> BarrierEdgeLength ; } VTK_WRAPEXCLUDE virtual void GetBarrierEdgeLength ( double & _arg1 , double & _arg2 ) { _arg1 = this -> BarrierEdgeLength [ 0 ] ; _arg2 = this -> BarrierEdgeLength [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << BarrierEdgeLength  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetBarrierEdgeLength ( double _arg [ 2 ] ) { this -> GetBarrierEdgeLength ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetBarrierEdgesScalarConnectivity*(this: var vtkPolyDataEdgeConnectivityFilter;
                                       _arg: vtkTypeBool) {.
    importcpp: "SetBarrierEdgesScalarConnectivity",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetExtractionModeBarrierEdgesScalarConnectivity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarConnectivity  of  << this -> ScalarConnectivity ) ; return this -> ScalarConnectivity ; } ;
## Error: expected ';'!!!

proc ScalarConnectivityOn*(this: var vtkPolyDataEdgeConnectivityFilter) {.
    importcpp: "ScalarConnectivityOn",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc ScalarConnectivityOff*(this: var vtkPolyDataEdgeConnectivityFilter) {.
    importcpp: "ScalarConnectivityOff",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set the scalar range to extract cells based on scalar connectivity.
  ##
proc SetBarrierEdgeLengthScalarRange*(this: var vtkPolyDataEdgeConnectivityFilter;
                                     _arg1: cdouble; _arg2: cdouble) {.
    importcpp: "SetBarrierEdgeLengthScalarRange",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc SetBarrierEdgeLengthScalarRange*(this: var vtkPolyDataEdgeConnectivityFilter;
                                     _arg: array[2, cdouble]) {.
    importcpp: "SetBarrierEdgeLengthScalarRange",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
## !!!Ignored construct:  virtual double * GetBarrierEdgeLengthScalarRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarRange  pointer  << this -> ScalarRange ) ; return this -> ScalarRange ; } VTK_WRAPEXCLUDE virtual void GetBarrierEdgeLengthScalarRange ( double & _arg1 , double & _arg2 ) { _arg1 = this -> ScalarRange [ 0 ] ; _arg2 = this -> ScalarRange [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << ScalarRange  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetBarrierEdgeLengthScalarRange ( double _arg [ 2 ] ) { this -> GetBarrierEdgeLengthScalarRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc GetnameRegionSizes*(this: var vtkPolyDataEdgeConnectivityFilter): ptr vtkIdTypeArray {.
    importcpp: "GetnameRegionSizes", header: "vtkPolyDataEdgeConnectivityFilter.h".}
  ## /@}
  ## *
  ##  Initialize list of point ids/cell ids used to seed regions.
  ##
proc InitializeSeedList*(this: var vtkPolyDataEdgeConnectivityFilter) {.
    importcpp: "InitializeSeedList", header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc AddSeed*(this: var vtkPolyDataEdgeConnectivityFilter; id: cint) {.
    importcpp: "AddSeed", header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc DeleteSeed*(this: var vtkPolyDataEdgeConnectivityFilter; id: cint) {.
    importcpp: "DeleteSeed", header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc InitializeSpecifiedRegionList*(this: var vtkPolyDataEdgeConnectivityFilter) {.
    importcpp: "InitializeSpecifiedRegionList",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc AddSpecifiedRegion*(this: var vtkPolyDataEdgeConnectivityFilter; id: cint) {.
    importcpp: "AddSpecifiedRegion", header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc DeleteSpecifiedRegion*(this: var vtkPolyDataEdgeConnectivityFilter; id: cint) {.
    importcpp: "DeleteSpecifiedRegion",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc GetNumberOfSpecifiedRegions*(this: var vtkPolyDataEdgeConnectivityFilter): cint {.
    importcpp: "GetNumberOfSpecifiedRegions",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc SetClosestPoint*(this: var vtkPolyDataEdgeConnectivityFilter; _arg1: cdouble;
                     _arg2: cdouble; _arg3: cdouble) {.importcpp: "SetClosestPoint",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc SetClosestPoint*(this: var vtkPolyDataEdgeConnectivityFilter;
                     _arg: array[3, cdouble]) {.importcpp: "SetClosestPoint",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
## !!!Ignored construct:  virtual double * GetClosestPoint ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ClosestPoint  pointer  << this -> ClosestPoint ) ; return this -> ClosestPoint ; } VTK_WRAPEXCLUDE virtual void GetClosestPoint ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> ClosestPoint [ i ] ; } } ;
## Error: expected ';'!!!

type
  vtkPolyDataEdgeConnectivityFilterRegionGrowingType* {.size: sizeof(cint),
      importcpp: "vtkPolyDataEdgeConnectivityFilter::RegionGrowingType",
      header: "vtkPolyDataEdgeConnectivityFilter.h".} = enum
    RegionGrowingOff = 0, LargeRegions = 1, SmallRegions = 2


proc SetExtractionModeRegionGrowing*(this: var vtkPolyDataEdgeConnectivityFilter;
                                    _arg: cint) {.
    importcpp: "SetExtractionModeRegionGrowing",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc GetExtractionModeMinValueRegionGrowingMinValue*(
    this: var vtkPolyDataEdgeConnectivityFilter): cint {.
    importcpp: "GetExtractionModeMinValueRegionGrowingMinValue",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc GetExtractionModeMaxValueRegionGrowingMaxValue*(
    this: var vtkPolyDataEdgeConnectivityFilter): cint {.
    importcpp: "GetExtractionModeMaxValueRegionGrowingMaxValue",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
## !!!Ignored construct:  virtual int GetExtractionModeBarrierEdgesScalarConnectivityRegionGrowing ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RegionGrowing  of  << this -> RegionGrowing ) ; return this -> RegionGrowing ; } ;
## Error: expected ';'!!!

proc SetRegionGrowingOff*(this: var vtkPolyDataEdgeConnectivityFilter) {.
    importcpp: "SetRegionGrowingOff",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc GrowLargeRegionsOff*(this: var vtkPolyDataEdgeConnectivityFilter) {.
    importcpp: "GrowLargeRegionsOff",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc GrowSmallRegionsOff*(this: var vtkPolyDataEdgeConnectivityFilter) {.
    importcpp: "GrowSmallRegionsOff",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc SetRegionGrowingToLargeRegions*(this: var vtkPolyDataEdgeConnectivityFilter) {.
    importcpp: "SetRegionGrowingToLargeRegions",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc GrowLargeRegionsOn*(this: var vtkPolyDataEdgeConnectivityFilter) {.
    importcpp: "GrowLargeRegionsOn", header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc SetRegionGrowingToSmallRegions*(this: var vtkPolyDataEdgeConnectivityFilter) {.
    importcpp: "SetRegionGrowingToSmallRegions",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc GrowSmallRegionsOn*(this: var vtkPolyDataEdgeConnectivityFilter) {.
    importcpp: "GrowSmallRegionsOn", header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc SetExtractionModeRegionGrowingLargeRegionThreshold*(
    this: var vtkPolyDataEdgeConnectivityFilter; _arg: cdouble) {.
    importcpp: "SetExtractionModeRegionGrowingLargeRegionThreshold",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc GetExtractionModeMinValueRegionGrowingMinValueLargeRegionThresholdMinValue*(
    this: var vtkPolyDataEdgeConnectivityFilter): cdouble {.importcpp: "GetExtractionModeMinValueRegionGrowingMinValueLargeRegionThresholdMinValue",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc GetExtractionModeMaxValueRegionGrowingMaxValueLargeRegionThresholdMaxValue*(
    this: var vtkPolyDataEdgeConnectivityFilter): cdouble {.importcpp: "GetExtractionModeMaxValueRegionGrowingMaxValueLargeRegionThresholdMaxValue",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
## !!!Ignored construct:  virtual double GetExtractionModeBarrierEdgesScalarConnectivityRegionGrowingLargeRegionThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LargeRegionThreshold  of  << this -> LargeRegionThreshold ) ; return this -> LargeRegionThreshold ; } ;
## Error: expected ';'!!!

proc GetNumberOfExtractedRegions*(this: var vtkPolyDataEdgeConnectivityFilter): cint {.
    importcpp: "GetNumberOfExtractedRegions",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc GetTotalArea*(this: var vtkPolyDataEdgeConnectivityFilter): cdouble {.
    importcpp: "GetTotalArea", header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc SetBarrierEdgesScalarConnectivityColorRegions*(
    this: var vtkPolyDataEdgeConnectivityFilter; _arg: vtkTypeBool) {.
    importcpp: "SetBarrierEdgesScalarConnectivityColorRegions",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetExtractionModeBarrierEdgesScalarConnectivityRegionGrowingLargeRegionThresholdColorRegions ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ColorRegions  of  << this -> ColorRegions ) ; return this -> ColorRegions ; } ;
## Error: expected ';'!!!

proc ColorRegionsOn*(this: var vtkPolyDataEdgeConnectivityFilter) {.
    importcpp: "ColorRegionsOn", header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc ColorRegionsOff*(this: var vtkPolyDataEdgeConnectivityFilter) {.
    importcpp: "ColorRegionsOff", header: "vtkPolyDataEdgeConnectivityFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off the creation of a cell array that, for each cell, contains
  ##  the area of the region to which the cell is associated. If enabled, then
  ##  an array named "CellRegionArea" is added to the output cell data.
  ##
proc SetBarrierEdgesScalarConnectivityColorRegionsCellRegionAreas*(
    this: var vtkPolyDataEdgeConnectivityFilter; _arg: vtkTypeBool) {.
    importcpp: "SetBarrierEdgesScalarConnectivityColorRegionsCellRegionAreas",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetExtractionModeBarrierEdgesScalarConnectivityRegionGrowingLargeRegionThresholdColorRegionsCellRegionAreas ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CellRegionAreas  of  << this -> CellRegionAreas ) ; return this -> CellRegionAreas ; } ;
## Error: expected ';'!!!

proc CellRegionAreasOn*(this: var vtkPolyDataEdgeConnectivityFilter) {.
    importcpp: "CellRegionAreasOn", header: "vtkPolyDataEdgeConnectivityFilter.h".}
proc CellRegionAreasOff*(this: var vtkPolyDataEdgeConnectivityFilter) {.
    importcpp: "CellRegionAreasOff", header: "vtkPolyDataEdgeConnectivityFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get the desired precision for the output types. See the documentation
  ##  for the vtkAlgorithm::DesiredOutputPrecision enum for an explanation of
  ##  the available precision settings.
  ##
proc SetBarrierEdgesScalarConnectivityColorRegionsCellRegionAreasOutputPointsPrecision*(
    this: var vtkPolyDataEdgeConnectivityFilter; _arg: cint) {.importcpp: "SetBarrierEdgesScalarConnectivityColorRegionsCellRegionAreasOutputPointsPrecision",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}
## !!!Ignored construct:  virtual int GetExtractionModeBarrierEdgesScalarConnectivityRegionGrowingLargeRegionThresholdColorRegionsCellRegionAreasOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ;
## Error: expected ';'!!!

## *
##  Return the method of extraction as a string.
##

proc GetExtractionModeAsString*(this: var vtkPolyDataEdgeConnectivityFilter): cstring {.
    importcpp: "GetExtractionModeAsString",
    header: "vtkPolyDataEdgeConnectivityFilter.h".}