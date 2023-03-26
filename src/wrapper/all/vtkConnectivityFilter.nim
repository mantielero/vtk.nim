## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkConnectivityFilter.h
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
##  @class   vtkConnectivityFilter
##  @brief   extract data based on geometric connectivity
##
##  vtkConnectivityFilter is a filter that extracts cells that share common
##  points and/or meet other connectivity criterion. (Cells that share
##  vertices and meet other connectivity criterion such as scalar range are
##  known as a region.)  The filter works in one of six ways: 1) extract the
##  largest connected region in the dataset; 2) extract specified region
##  numbers; 3) extract all regions sharing specified point ids; 4) extract
##  all regions sharing specified cell ids; 5) extract the region closest to
##  the specified point; or 6) extract all regions (used to color the data by
##  region).
##
##  vtkConnectivityFilter is generalized to handle any type of input dataset.
##  If the input to this filter is a vtkPolyData, the output will be a vtkPolyData.
##  For all other input types, it generates output data of type vtkUnstructuredGrid.
##  Note that the only Get*Output() methods that will return a non-null pointer
##  are GetUnstructuredGridOutput() and GetPolyDataOutput() when the output of the
##  filter is a vtkUnstructuredGrid or vtkPolyData, respectively.
##
##  The behavior of vtkConnectivityFilter can be modified by turning on the
##  boolean ivar ScalarConnectivity. If this flag is on, the connectivity
##  algorithm is modified so that cells are considered connected only if 1)
##  they are geometrically connected (share a point) and 2) the scalar values
##  of one of the cell's points falls in the scalar range specified. This use
##  of ScalarConnectivity is particularly useful for volume datasets: it can
##  be used as a simple "connected segmentation" algorithm. For example, by
##  using a seed voxel (i.e., cell) on a known anatomical structure,
##  connectivity will pull out all voxels "containing" the anatomical
##  structure. These voxels can then be contoured or processed by other
##  visualization filters.
##
##  If the extraction mode is set to all regions and ColorRegions is enabled,
##  The RegionIds are assigned to each region by the order in which the region
##  was processed and has no other significance with respect to the size of
##  or number of cells.
##
##  @sa
##  vtkPolyDataConnectivityFilter
##

import
  vtkFiltersCoreModule, vtkPointSetAlgorithm

const
  VTK_EXTRACT_POINT_SEEDED_REGIONS* = 1
  VTK_EXTRACT_CELL_SEEDED_REGIONS* = 2
  VTK_EXTRACT_SPECIFIED_REGIONS* = 3
  VTK_EXTRACT_LARGEST_REGION* = 4
  VTK_EXTRACT_ALL_REGIONS* = 5
  VTK_EXTRACT_CLOSEST_POINT_REGION* = 6

discard "forward decl of vtkDataArray"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkFloatArray"
discard "forward decl of vtkIdList"
discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkIntArray"
discard "forward decl of vtkPolyData"
type
  vtkConnectivityFilter* {.importcpp: "vtkConnectivityFilter",
                          header: "vtkConnectivityFilter.h", bycopy.} = object of vtkPointSetAlgorithm ##  used to support algorithm execution
    vtkConnectivityFilter* {.importc: "vtkConnectivityFilter".}: VTK_NEWINSTANCE
    ##  boolean turns on/off scalar gen for separate regions
    ##  how to extract regions
    ##  id's of points or cells used to seed regions
    ##  regions specified for extraction
    ##  size (in cells) of each region extracted

  vtkConnectivityFilterSuperclass* = vtkPointSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkConnectivityFilter::IsTypeOf(@)",
    header: "vtkConnectivityFilter.h".}
proc IsA*(this: var vtkConnectivityFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkConnectivityFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkConnectivityFilter {.
    importcpp: "vtkConnectivityFilter::SafeDownCast(@)",
    header: "vtkConnectivityFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkConnectivityFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPointSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkConnectivityFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkConnectivityFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkConnectivityFilter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkConnectivityFilter.h".}
proc New*(): ptr vtkConnectivityFilter {.importcpp: "vtkConnectivityFilter::New(@)",
                                     header: "vtkConnectivityFilter.h".}
proc SetScalarConnectivity*(this: var vtkConnectivityFilter; _arg: vtkTypeBool) {.
    importcpp: "SetScalarConnectivity", header: "vtkConnectivityFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetScalarConnectivity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarConnectivity  of  << this -> ScalarConnectivity ) ; return this -> ScalarConnectivity ; } ;
## Error: expected ';'!!!

proc ScalarConnectivityOn*(this: var vtkConnectivityFilter) {.
    importcpp: "ScalarConnectivityOn", header: "vtkConnectivityFilter.h".}
proc ScalarConnectivityOff*(this: var vtkConnectivityFilter) {.
    importcpp: "ScalarConnectivityOff", header: "vtkConnectivityFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set the scalar range to use to extract cells based on scalar connectivity.
  ##
proc SetScalarRange*(this: var vtkConnectivityFilter; _arg1: cdouble; _arg2: cdouble) {.
    importcpp: "SetScalarRange", header: "vtkConnectivityFilter.h".}
proc SetScalarRange*(this: var vtkConnectivityFilter; _arg: array[2, cdouble]) {.
    importcpp: "SetScalarRange", header: "vtkConnectivityFilter.h".}
## !!!Ignored construct:  virtual double * GetScalarRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarRange  pointer  << this -> ScalarRange ) ; return this -> ScalarRange ; } VTK_WRAPEXCLUDE virtual void GetScalarRange ( double & _arg1 , double & _arg2 ) { _arg1 = this -> ScalarRange [ 0 ] ; _arg2 = this -> ScalarRange [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << ScalarRange  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetScalarRange ( double _arg [ 2 ] ) { this -> GetScalarRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetExtractionMode*(this: var vtkConnectivityFilter; _arg: cint) {.
    importcpp: "SetExtractionMode", header: "vtkConnectivityFilter.h".}
proc GetExtractionModeMinValue*(this: var vtkConnectivityFilter): cint {.
    importcpp: "GetExtractionModeMinValue", header: "vtkConnectivityFilter.h".}
proc GetExtractionModeMaxValue*(this: var vtkConnectivityFilter): cint {.
    importcpp: "GetExtractionModeMaxValue", header: "vtkConnectivityFilter.h".}
## !!!Ignored construct:  virtual int GetScalarConnectivityExtractionMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ExtractionMode  of  << this -> ExtractionMode ) ; return this -> ExtractionMode ; } ;
## Error: expected ';'!!!

proc SetExtractionModeToPointSeededRegions*(this: var vtkConnectivityFilter) {.
    importcpp: "SetExtractionModeToPointSeededRegions",
    header: "vtkConnectivityFilter.h".}
proc SetExtractionModeToCellSeededRegions*(this: var vtkConnectivityFilter) {.
    importcpp: "SetExtractionModeToCellSeededRegions",
    header: "vtkConnectivityFilter.h".}
proc SetExtractionModeToLargestRegion*(this: var vtkConnectivityFilter) {.
    importcpp: "SetExtractionModeToLargestRegion",
    header: "vtkConnectivityFilter.h".}
proc SetExtractionModeToSpecifiedRegions*(this: var vtkConnectivityFilter) {.
    importcpp: "SetExtractionModeToSpecifiedRegions",
    header: "vtkConnectivityFilter.h".}
proc SetExtractionModeToClosestPointRegion*(this: var vtkConnectivityFilter) {.
    importcpp: "SetExtractionModeToClosestPointRegion",
    header: "vtkConnectivityFilter.h".}
proc SetExtractionModeToAllRegions*(this: var vtkConnectivityFilter) {.
    importcpp: "SetExtractionModeToAllRegions", header: "vtkConnectivityFilter.h".}
proc GetExtractionModeAsString*(this: var vtkConnectivityFilter): cstring {.
    importcpp: "GetExtractionModeAsString", header: "vtkConnectivityFilter.h".}
proc InitializeSeedList*(this: var vtkConnectivityFilter) {.
    importcpp: "InitializeSeedList", header: "vtkConnectivityFilter.h".}
proc AddSeed*(this: var vtkConnectivityFilter; id: vtkIdType) {.importcpp: "AddSeed",
    header: "vtkConnectivityFilter.h".}
proc DeleteSeed*(this: var vtkConnectivityFilter; id: vtkIdType) {.
    importcpp: "DeleteSeed", header: "vtkConnectivityFilter.h".}
proc InitializeSpecifiedRegionList*(this: var vtkConnectivityFilter) {.
    importcpp: "InitializeSpecifiedRegionList", header: "vtkConnectivityFilter.h".}
proc AddSpecifiedRegion*(this: var vtkConnectivityFilter; id: cint) {.
    importcpp: "AddSpecifiedRegion", header: "vtkConnectivityFilter.h".}
proc DeleteSpecifiedRegion*(this: var vtkConnectivityFilter; id: cint) {.
    importcpp: "DeleteSpecifiedRegion", header: "vtkConnectivityFilter.h".}
proc SetClosestPoint*(this: var vtkConnectivityFilter; _arg1: cdouble; _arg2: cdouble;
                     _arg3: cdouble) {.importcpp: "SetClosestPoint",
                                     header: "vtkConnectivityFilter.h".}
proc SetClosestPoint*(this: var vtkConnectivityFilter; _arg: array[3, cdouble]) {.
    importcpp: "SetClosestPoint", header: "vtkConnectivityFilter.h".}
## !!!Ignored construct:  virtual double * GetClosestPoint ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ClosestPoint  pointer  << this -> ClosestPoint ) ; return this -> ClosestPoint ; } VTK_WRAPEXCLUDE virtual void GetClosestPoint ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> ClosestPoint [ i ] ; } } ;
## Error: expected ';'!!!

proc GetNumberOfExtractedRegions*(this: var vtkConnectivityFilter): cint {.
    importcpp: "GetNumberOfExtractedRegions", header: "vtkConnectivityFilter.h".}
proc SetScalarConnectivityColorRegions*(this: var vtkConnectivityFilter;
                                       _arg: vtkTypeBool) {.
    importcpp: "SetScalarConnectivityColorRegions",
    header: "vtkConnectivityFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetScalarConnectivityExtractionModeColorRegions ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ColorRegions  of  << this -> ColorRegions ) ; return this -> ColorRegions ; } ;
## Error: expected ';'!!!

proc ColorRegionsOn*(this: var vtkConnectivityFilter) {.importcpp: "ColorRegionsOn",
    header: "vtkConnectivityFilter.h".}
proc ColorRegionsOff*(this: var vtkConnectivityFilter) {.
    importcpp: "ColorRegionsOff", header: "vtkConnectivityFilter.h".}
  ## /@}
  ## *
  ##  Enumeration of the various ways to assign RegionIds when
  ##  the ColorRegions option is on.
  ##
type
  vtkConnectivityFilterRegionIdAssignment* {.size: sizeof(cint),
      importcpp: "vtkConnectivityFilter::RegionIdAssignment",
      header: "vtkConnectivityFilter.h".} = enum
    UNSPECIFIED, CELL_COUNT_DESCENDING, CELL_COUNT_ASCENDING


proc SetScalarConnectivityColorRegionsRegionIdAssignmentMode*(
    this: var vtkConnectivityFilter; _arg: cint) {.
    importcpp: "SetScalarConnectivityColorRegionsRegionIdAssignmentMode",
    header: "vtkConnectivityFilter.h".}
## !!!Ignored construct:  virtual int GetScalarConnectivityExtractionModeColorRegionsRegionIdAssignmentMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RegionIdAssignmentMode  of  << this -> RegionIdAssignmentMode ) ; return this -> RegionIdAssignmentMode ; } ;
## Error: expected ';'!!!

proc SetScalarConnectivityColorRegionsRegionIdAssignmentModeOutputPointsPrecision*(
    this: var vtkConnectivityFilter; _arg: cint) {.importcpp: "SetScalarConnectivityColorRegionsRegionIdAssignmentModeOutputPointsPrecision",
    header: "vtkConnectivityFilter.h".}
## !!!Ignored construct:  virtual int GetScalarConnectivityExtractionModeColorRegionsRegionIdAssignmentModeOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ;
## Error: expected ';'!!!

## *
##  Return the method of extraction as a string.
##

proc GetExtractionModeAsString*(this: var vtkConnectivityFilter): cstring {.
    importcpp: "GetExtractionModeAsString", header: "vtkConnectivityFilter.h".}