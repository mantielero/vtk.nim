## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPolyDataConnectivityFilter.h
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
##  @class   vtkPolyDataConnectivityFilter
##  @brief   extract polygonal data based on geometric connectivity
##
##  vtkPolyDataConnectivityFilter is a filter that extracts cells that
##  share common points and/or satisfy a scalar threshold
##  criterion. (Such a group of cells is called a region.) The filter
##  works in one of six ways: 1) extract the largest (most points) connected region
##  in the dataset; 2) extract specified region numbers; 3) extract all
##  regions sharing specified point ids; 4) extract all regions sharing
##  specified cell ids; 5) extract the region closest to the specified
##  point; or 6) extract all regions (used to color regions).
##
##  This filter is specialized for polygonal data. This means it runs a bit
##  faster and is easier to construct visualization networks that process
##  polygonal data.
##
##  The behavior of vtkPolyDataConnectivityFilter can be modified by turning
##  on the boolean ivar ScalarConnectivity. If this flag is on, the
##  connectivity algorithm is modified so that cells are considered connected
##  only if 1) they are geometrically connected (share a point) and 2) the
##  scalar values of the cell's points falls in the scalar range specified.
##  If ScalarConnectivity and FullScalarConnectivity is ON, all the cell's
##  points must lie in the scalar range specified for the cell to qualify as
##  being connected. If FullScalarConnectivity is OFF, any one of the cell's
##  points may lie in the user specified scalar range for the cell to qualify
##  as being connected.
##
##  This use of ScalarConnectivity is particularly useful for selecting cells
##  for later processing.
##
##  @sa
##  vtkConnectivityFilter
##

import
  vtkFiltersCoreModule, vtkPolyDataAlgorithm

const
  VTK_EXTRACT_POINT_SEEDED_REGIONS* = 1
  VTK_EXTRACT_CELL_SEEDED_REGIONS* = 2
  VTK_EXTRACT_SPECIFIED_REGIONS* = 3
  VTK_EXTRACT_LARGEST_REGION* = 4
  VTK_EXTRACT_ALL_REGIONS* = 5
  VTK_EXTRACT_CLOSEST_POINT_REGION* = 6

discard "forward decl of vtkDataArray"
discard "forward decl of vtkIdList"
discard "forward decl of vtkIdTypeArray"
type
  vtkPolyDataConnectivityFilter* {.importcpp: "vtkPolyDataConnectivityFilter",
                                  header: "vtkPolyDataConnectivityFilter.h",
                                  bycopy.} = object of vtkPolyDataAlgorithm
    vtkPolyDataConnectivityFilter* {.importc: "vtkPolyDataConnectivityFilter".}: VTK_NEWINSTANCE
    ##  boolean turns on/off scalar gen for separate regions
    ##  how to extract regions
    ##  id's of points or cells used to seed regions
    ##  regions specified for extraction
    ##  size (in cells) of each region extracted
    ##  Does this cell qualify as being scalar connected ?

  vtkPolyDataConnectivityFilterSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPolyDataConnectivityFilter::IsTypeOf(@)",
    header: "vtkPolyDataConnectivityFilter.h".}
proc IsA*(this: var vtkPolyDataConnectivityFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPolyDataConnectivityFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPolyDataConnectivityFilter {.
    importcpp: "vtkPolyDataConnectivityFilter::SafeDownCast(@)",
    header: "vtkPolyDataConnectivityFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPolyDataConnectivityFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPolyDataConnectivityFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPolyDataConnectivityFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPolyDataConnectivityFilter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkPolyDataConnectivityFilter.h".}
proc GetnameRegionSizes*(this: var vtkPolyDataConnectivityFilter): ptr vtkIdTypeArray {.
    importcpp: "GetnameRegionSizes", header: "vtkPolyDataConnectivityFilter.h".}
  ## /@}
  ## *
  ##  Construct with default extraction mode to extract largest regions.
  ##
proc New*(): ptr vtkPolyDataConnectivityFilter {.
    importcpp: "vtkPolyDataConnectivityFilter::New(@)",
    header: "vtkPolyDataConnectivityFilter.h".}
proc SetScalarConnectivity*(this: var vtkPolyDataConnectivityFilter;
                           _arg: vtkTypeBool) {.
    importcpp: "SetScalarConnectivity", header: "vtkPolyDataConnectivityFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetScalarConnectivity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarConnectivity  of  << this -> ScalarConnectivity ) ; return this -> ScalarConnectivity ; } ;
## Error: expected ';'!!!

proc ScalarConnectivityOn*(this: var vtkPolyDataConnectivityFilter) {.
    importcpp: "ScalarConnectivityOn", header: "vtkPolyDataConnectivityFilter.h".}
proc ScalarConnectivityOff*(this: var vtkPolyDataConnectivityFilter) {.
    importcpp: "ScalarConnectivityOff", header: "vtkPolyDataConnectivityFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off the use of Fully connected scalar connectivity. This is off
  ##  by default. The flag is used only if ScalarConnectivity is on. If
  ##  FullScalarConnectivity is ON, all the cell's points must lie in the
  ##  scalar range specified for the cell to qualify as being connected. If
  ##  FullScalarConnectivity is OFF, any one of the cell's points may lie in
  ##  the user specified scalar range for the cell to qualify as being
  ##  connected.
  ##
proc SetScalarConnectivityFullScalarConnectivity*(
    this: var vtkPolyDataConnectivityFilter; _arg: vtkTypeBool) {.
    importcpp: "SetScalarConnectivityFullScalarConnectivity",
    header: "vtkPolyDataConnectivityFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetScalarConnectivityFullScalarConnectivity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FullScalarConnectivity  of  << this -> FullScalarConnectivity ) ; return this -> FullScalarConnectivity ; } ;
## Error: expected ';'!!!

proc FullScalarConnectivityOn*(this: var vtkPolyDataConnectivityFilter) {.
    importcpp: "FullScalarConnectivityOn",
    header: "vtkPolyDataConnectivityFilter.h".}
proc FullScalarConnectivityOff*(this: var vtkPolyDataConnectivityFilter) {.
    importcpp: "FullScalarConnectivityOff",
    header: "vtkPolyDataConnectivityFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set the scalar range to use to extract cells based on scalar connectivity.
  ##
proc SetScalarRange*(this: var vtkPolyDataConnectivityFilter; _arg1: cdouble;
                    _arg2: cdouble) {.importcpp: "SetScalarRange",
                                    header: "vtkPolyDataConnectivityFilter.h".}
proc SetScalarRange*(this: var vtkPolyDataConnectivityFilter;
                    _arg: array[2, cdouble]) {.importcpp: "SetScalarRange",
    header: "vtkPolyDataConnectivityFilter.h".}
## !!!Ignored construct:  virtual double * GetScalarRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarRange  pointer  << this -> ScalarRange ) ; return this -> ScalarRange ; } VTK_WRAPEXCLUDE virtual void GetScalarRange ( double & _arg1 , double & _arg2 ) { _arg1 = this -> ScalarRange [ 0 ] ; _arg2 = this -> ScalarRange [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << ScalarRange  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetScalarRange ( double _arg [ 2 ] ) { this -> GetScalarRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetExtractionMode*(this: var vtkPolyDataConnectivityFilter; _arg: cint) {.
    importcpp: "SetExtractionMode", header: "vtkPolyDataConnectivityFilter.h".}
proc GetExtractionModeMinValue*(this: var vtkPolyDataConnectivityFilter): cint {.
    importcpp: "GetExtractionModeMinValue",
    header: "vtkPolyDataConnectivityFilter.h".}
proc GetExtractionModeMaxValue*(this: var vtkPolyDataConnectivityFilter): cint {.
    importcpp: "GetExtractionModeMaxValue",
    header: "vtkPolyDataConnectivityFilter.h".}
## !!!Ignored construct:  virtual int GetScalarConnectivityFullScalarConnectivityExtractionMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ExtractionMode  of  << this -> ExtractionMode ) ; return this -> ExtractionMode ; } ;
## Error: expected ';'!!!

proc SetExtractionModeToPointSeededRegions*(
    this: var vtkPolyDataConnectivityFilter) {.
    importcpp: "SetExtractionModeToPointSeededRegions",
    header: "vtkPolyDataConnectivityFilter.h".}
proc SetExtractionModeToCellSeededRegions*(
    this: var vtkPolyDataConnectivityFilter) {.
    importcpp: "SetExtractionModeToCellSeededRegions",
    header: "vtkPolyDataConnectivityFilter.h".}
proc SetExtractionModeToLargestRegion*(this: var vtkPolyDataConnectivityFilter) {.
    importcpp: "SetExtractionModeToLargestRegion",
    header: "vtkPolyDataConnectivityFilter.h".}
proc SetExtractionModeToSpecifiedRegions*(this: var vtkPolyDataConnectivityFilter) {.
    importcpp: "SetExtractionModeToSpecifiedRegions",
    header: "vtkPolyDataConnectivityFilter.h".}
proc SetExtractionModeToClosestPointRegion*(
    this: var vtkPolyDataConnectivityFilter) {.
    importcpp: "SetExtractionModeToClosestPointRegion",
    header: "vtkPolyDataConnectivityFilter.h".}
proc SetExtractionModeToAllRegions*(this: var vtkPolyDataConnectivityFilter) {.
    importcpp: "SetExtractionModeToAllRegions",
    header: "vtkPolyDataConnectivityFilter.h".}
proc GetExtractionModeAsString*(this: var vtkPolyDataConnectivityFilter): cstring {.
    importcpp: "GetExtractionModeAsString",
    header: "vtkPolyDataConnectivityFilter.h".}
proc InitializeSeedList*(this: var vtkPolyDataConnectivityFilter) {.
    importcpp: "InitializeSeedList", header: "vtkPolyDataConnectivityFilter.h".}
proc AddSeed*(this: var vtkPolyDataConnectivityFilter; id: cint) {.
    importcpp: "AddSeed", header: "vtkPolyDataConnectivityFilter.h".}
proc DeleteSeed*(this: var vtkPolyDataConnectivityFilter; id: cint) {.
    importcpp: "DeleteSeed", header: "vtkPolyDataConnectivityFilter.h".}
proc InitializeSpecifiedRegionList*(this: var vtkPolyDataConnectivityFilter) {.
    importcpp: "InitializeSpecifiedRegionList",
    header: "vtkPolyDataConnectivityFilter.h".}
proc AddSpecifiedRegion*(this: var vtkPolyDataConnectivityFilter; id: cint) {.
    importcpp: "AddSpecifiedRegion", header: "vtkPolyDataConnectivityFilter.h".}
proc DeleteSpecifiedRegion*(this: var vtkPolyDataConnectivityFilter; id: cint) {.
    importcpp: "DeleteSpecifiedRegion", header: "vtkPolyDataConnectivityFilter.h".}
proc SetClosestPoint*(this: var vtkPolyDataConnectivityFilter; _arg1: cdouble;
                     _arg2: cdouble; _arg3: cdouble) {.importcpp: "SetClosestPoint",
    header: "vtkPolyDataConnectivityFilter.h".}
proc SetClosestPoint*(this: var vtkPolyDataConnectivityFilter;
                     _arg: array[3, cdouble]) {.importcpp: "SetClosestPoint",
    header: "vtkPolyDataConnectivityFilter.h".}
## !!!Ignored construct:  virtual double * GetClosestPoint ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ClosestPoint  pointer  << this -> ClosestPoint ) ; return this -> ClosestPoint ; } VTK_WRAPEXCLUDE virtual void GetClosestPoint ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> ClosestPoint [ i ] ; } } ;
## Error: expected ';'!!!

proc GetNumberOfExtractedRegions*(this: var vtkPolyDataConnectivityFilter): cint {.
    importcpp: "GetNumberOfExtractedRegions",
    header: "vtkPolyDataConnectivityFilter.h".}
proc SetScalarConnectivityFullScalarConnectivityColorRegions*(
    this: var vtkPolyDataConnectivityFilter; _arg: vtkTypeBool) {.
    importcpp: "SetScalarConnectivityFullScalarConnectivityColorRegions",
    header: "vtkPolyDataConnectivityFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetScalarConnectivityFullScalarConnectivityExtractionModeColorRegions ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ColorRegions  of  << this -> ColorRegions ) ; return this -> ColorRegions ; } ;
## Error: expected ';'!!!

proc ColorRegionsOn*(this: var vtkPolyDataConnectivityFilter) {.
    importcpp: "ColorRegionsOn", header: "vtkPolyDataConnectivityFilter.h".}
proc ColorRegionsOff*(this: var vtkPolyDataConnectivityFilter) {.
    importcpp: "ColorRegionsOff", header: "vtkPolyDataConnectivityFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify whether to record input point ids that appear in the output connected
  ##  components. It may be useful to extract the visited point ids for use by a
  ##  downstream filter. Default is OFF.
  ##
proc SetScalarConnectivityFullScalarConnectivityColorRegionsMarkVisitedPointIds*(
    this: var vtkPolyDataConnectivityFilter; _arg: vtkTypeBool) {.importcpp: "SetScalarConnectivityFullScalarConnectivityColorRegionsMarkVisitedPointIds",
    header: "vtkPolyDataConnectivityFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetScalarConnectivityFullScalarConnectivityExtractionModeColorRegionsMarkVisitedPointIds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MarkVisitedPointIds  of  << this -> MarkVisitedPointIds ) ; return this -> MarkVisitedPointIds ; } ;
## Error: expected ';'!!!

proc MarkVisitedPointIdsOn*(this: var vtkPolyDataConnectivityFilter) {.
    importcpp: "MarkVisitedPointIdsOn", header: "vtkPolyDataConnectivityFilter.h".}
proc MarkVisitedPointIdsOff*(this: var vtkPolyDataConnectivityFilter) {.
    importcpp: "MarkVisitedPointIdsOff", header: "vtkPolyDataConnectivityFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the input point ids that appear in the output connected components. This is
  ##  non-empty only if MarkVisitedPointIds has been set.
  ##
proc GetnameRegionSizesVisitedPointIds*(this: var vtkPolyDataConnectivityFilter): ptr vtkIdList {.
    importcpp: "GetnameRegionSizesVisitedPointIds",
    header: "vtkPolyDataConnectivityFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get the desired precision for the output types. See the documentation
  ##  for the vtkAlgorithm::DesiredOutputPrecision enum for an explanation of
  ##  the available precision settings.
  ##
proc SetScalarConnectivityFullScalarConnectivityColorRegionsMarkVisitedPointIdsOutputPointsPrecision*(
    this: var vtkPolyDataConnectivityFilter; _arg: cint) {.importcpp: "SetScalarConnectivityFullScalarConnectivityColorRegionsMarkVisitedPointIdsOutputPointsPrecision",
    header: "vtkPolyDataConnectivityFilter.h".}
## !!!Ignored construct:  virtual int GetScalarConnectivityFullScalarConnectivityExtractionModeColorRegionsMarkVisitedPointIdsOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ;
## Error: expected ';'!!!

## *
##  Return the method of extraction as a string.
##

proc GetExtractionModeAsString*(this: var vtkPolyDataConnectivityFilter): cstring {.
    importcpp: "GetExtractionModeAsString",
    header: "vtkPolyDataConnectivityFilter.h".}