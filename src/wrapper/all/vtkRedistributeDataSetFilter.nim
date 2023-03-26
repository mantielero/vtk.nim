## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRedistributeDataSetFilter.h
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
##  @class vtkRedistributeDataSetFilter
##  @brief redistributes input dataset into requested number of partitions
##
##  vtkRedistributeDataSetFilter is intended for redistributing data in a load
##  balanced fashion. The load balancing attempts to balance the number of cells
##  per target partition approximately. It uses a DIY-based kdtree implementation
##  that builds balances the cell centers among requested number of partitions.
##  Current implementation only supports power-of-2 target partition. If a
##  non-power of two value is specified for `NumberOfPartitions`, then the load
##  balancing simply uses the power-of-two greater than the requested value. The
##  bounding boxes for the kdtree leaf nodes are then used to redistribute the
##  data.
##
##  Alternatively a collection of bounding boxes may be provided that can be used
##  to distribute the data instead of computing them (see `UseExplicitCuts` and
##  `SetExplicitCuts`). When explicit cuts are specified, it is possible use
##  those cuts strictly or to expand boxes on the edge to fit the domain of the
##  input dataset. This can be controlled by `ExpandExplicitCutsForInputDomain`.
##
##  The filter allows users to pick how cells along the boundary of the cuts
##  either automatically generated or explicitly specified are to be distributed
##  using `BoundaryMode`. One can choose to assign those cells uniquely to one of
##  those regions or duplicate then on all regions or split the cells (using
##  vtkTableBasedClipDataSet filter). When cells are
##  duplicated along the boundary,  the filter will mark the duplicated cells as
##  `vtkDataSetAttributes::DUPLICATECELL` correctly on all but one of the
##  partitions using the ghost cell array (@sa `vtkDataSetAttributes::GhostArrayName`).
##
##  Besides redistributing the data, the filter can optionally generate global
##  cell ids. This is provided since it relative easy to generate these
##  on when it is known that the data is spatially partitioned as is the case
##  after this filter has executed.
##
##  @section vtkRedistributeDataSetFilter-SupportedDataTypes  Supported Data Types
##
##  vtkRedistributeDataSetFilter is primarily intended for unstructured datasets
##  i.e. vtkUnstructuredGrid, vtkPolyData and composite datasets comprising of
##  the same. It will work when applied to structured datasets as well, however,
##  it results in conversion of the dataset to an unstructured grid -- which is
##  often not suitable. Also, other redistribution and load balancing strategies
##  can be applied to structured data which may be more efficient and hence
##  should be preferred over using this filter.
##
##  For composite datasets, the filter supports `vtkPartitionedDataSet` and
##  `vtkPartitionedDataSetCollection`. When input is a
##  `vtkPartitionedDataSetCollection`, you can set `LoadBalanceAcrossAllBlocks`
##  to true to build the load balancing KdTree using all vtkPartitionedDataSets
##  in the collection. Default is load balance each `vtkPartitionedDataSet`
##  separately.
##
##  For `vtkMultiBlockDataSet`, the filter internally uses
##  `vtkDataAssemblyUtilities` to convert the
##  vtkMultiBlockDataSet to a vtkPartitionedDataSetCollection and back.
##

import
  vtkDataObjectAlgorithm, vtkFiltersParallelDIY2Module, vtkSmartPointer

##  clang-format off

import
  vtk_diy2

##  clang-format on

discard "forward decl of vtkMultiProcessController"
discard "forward decl of vtkBoundingBox"
discard "forward decl of vtkPartitionedDataSet"
discard "forward decl of vtkMultiBlockDataSet"
discard "forward decl of vtkMultiPieceDataSet"
discard "forward decl of vtkDataObjectTree"
type
  vtkRedistributeDataSetFilter* {.importcpp: "vtkRedistributeDataSetFilter",
                                 header: "vtkRedistributeDataSetFilter.h", bycopy.} = object of vtkDataObjectAlgorithm
    vtkRedistributeDataSetFilter* {.importc: "vtkRedistributeDataSetFilter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkRedistributeDataSetFilter {.
    importcpp: "vtkRedistributeDataSetFilter::New(@)",
    header: "vtkRedistributeDataSetFilter.h".}
type
  vtkRedistributeDataSetFilterSuperclass* = vtkDataObjectAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkRedistributeDataSetFilter::IsTypeOf(@)",
    header: "vtkRedistributeDataSetFilter.h".}
proc IsA*(this: var vtkRedistributeDataSetFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkRedistributeDataSetFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkRedistributeDataSetFilter {.
    importcpp: "vtkRedistributeDataSetFilter::SafeDownCast(@)",
    header: "vtkRedistributeDataSetFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkRedistributeDataSetFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataObjectAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRedistributeDataSetFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRedistributeDataSetFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkRedistributeDataSetFilter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkRedistributeDataSetFilter.h".}
proc SetController*(this: var vtkRedistributeDataSetFilter;
                   a2: ptr vtkMultiProcessController) {.importcpp: "SetController",
    header: "vtkRedistributeDataSetFilter.h".}
proc GetnameController*(this: var vtkRedistributeDataSetFilter): ptr vtkMultiProcessController {.
    importcpp: "GetnameController", header: "vtkRedistributeDataSetFilter.h".}
  ## /@}
type
  vtkRedistributeDataSetFilterBoundaryModes* {.size: sizeof(cint),
      importcpp: "vtkRedistributeDataSetFilter::BoundaryModes",
      header: "vtkRedistributeDataSetFilter.h".} = enum
    ASSIGN_TO_ONE_REGION = 0, ASSIGN_TO_ALL_INTERSECTING_REGIONS = 1,
    SPLIT_BOUNDARY_CELLS = 2


proc SetBoundaryMode*(this: var vtkRedistributeDataSetFilter; _arg: cint) {.
    importcpp: "SetBoundaryMode", header: "vtkRedistributeDataSetFilter.h".}
proc GetBoundaryModeMinValue*(this: var vtkRedistributeDataSetFilter): cint {.
    importcpp: "GetBoundaryModeMinValue", header: "vtkRedistributeDataSetFilter.h".}
proc GetBoundaryModeMaxValue*(this: var vtkRedistributeDataSetFilter): cint {.
    importcpp: "GetBoundaryModeMaxValue", header: "vtkRedistributeDataSetFilter.h".}
## !!!Ignored construct:  virtual int GetBoundaryMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BoundaryMode  of  << this -> BoundaryMode ) ; return this -> BoundaryMode ; } ;
## Error: expected ';'!!!

proc SetBoundaryModeToAssignToOneRegion*(this: var vtkRedistributeDataSetFilter) {.
    importcpp: "SetBoundaryModeToAssignToOneRegion",
    header: "vtkRedistributeDataSetFilter.h".}
proc SetBoundaryModeToAssignToAllIntersectingRegions*(
    this: var vtkRedistributeDataSetFilter) {.
    importcpp: "SetBoundaryModeToAssignToAllIntersectingRegions",
    header: "vtkRedistributeDataSetFilter.h".}
proc SetBoundaryModeToSplitBoundaryCells*(this: var vtkRedistributeDataSetFilter) {.
    importcpp: "SetBoundaryModeToSplitBoundaryCells",
    header: "vtkRedistributeDataSetFilter.h".}
proc SetUseExplicitCuts*(this: var vtkRedistributeDataSetFilter; _arg: bool) {.
    importcpp: "SetUseExplicitCuts", header: "vtkRedistributeDataSetFilter.h".}
## !!!Ignored construct:  virtual bool GetBoundaryModeUseExplicitCuts ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseExplicitCuts  of  << this -> UseExplicitCuts ) ; return this -> UseExplicitCuts ; } ;
## Error: expected ';'!!!

proc UseExplicitCutsOn*(this: var vtkRedistributeDataSetFilter) {.
    importcpp: "UseExplicitCutsOn", header: "vtkRedistributeDataSetFilter.h".}
proc UseExplicitCutsOff*(this: var vtkRedistributeDataSetFilter) {.
    importcpp: "UseExplicitCutsOff", header: "vtkRedistributeDataSetFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify the cuts to use when `UseExplicitCuts` is true.
  ##
proc SetExplicitCuts*(this: var vtkRedistributeDataSetFilter;
                     boxes: vector[vtkBoundingBox]) {.
    importcpp: "SetExplicitCuts", header: "vtkRedistributeDataSetFilter.h".}
proc GetExplicitCuts*(this: vtkRedistributeDataSetFilter): vector[vtkBoundingBox] {.
    noSideEffect, importcpp: "GetExplicitCuts",
    header: "vtkRedistributeDataSetFilter.h".}
proc RemoveAllExplicitCuts*(this: var vtkRedistributeDataSetFilter) {.
    importcpp: "RemoveAllExplicitCuts", header: "vtkRedistributeDataSetFilter.h".}
proc AddExplicitCut*(this: var vtkRedistributeDataSetFilter; bbox: vtkBoundingBox) {.
    importcpp: "AddExplicitCut", header: "vtkRedistributeDataSetFilter.h".}
proc AddExplicitCut*(this: var vtkRedistributeDataSetFilter; bbox: array[6, cdouble]) {.
    importcpp: "AddExplicitCut", header: "vtkRedistributeDataSetFilter.h".}
proc GetNumberOfExplicitCuts*(this: vtkRedistributeDataSetFilter): cint {.
    noSideEffect, importcpp: "GetNumberOfExplicitCuts",
    header: "vtkRedistributeDataSetFilter.h".}
proc GetExplicitCut*(this: vtkRedistributeDataSetFilter; index: cint): vtkBoundingBox {.
    noSideEffect, importcpp: "GetExplicitCut",
    header: "vtkRedistributeDataSetFilter.h".}
proc SetAssigner*(this: var vtkRedistributeDataSetFilter;
                 assigner: shared_ptr[Assigner]) {.importcpp: "SetAssigner",
    header: "vtkRedistributeDataSetFilter.h".}
proc GetAssigner*(this: var vtkRedistributeDataSetFilter): shared_ptr[Assigner] {.
    importcpp: "GetAssigner", header: "vtkRedistributeDataSetFilter.h".}
proc GetAssigner*(this: vtkRedistributeDataSetFilter): shared_ptr[Assigner] {.
    noSideEffect, importcpp: "GetAssigner",
    header: "vtkRedistributeDataSetFilter.h".}
proc SetUseExplicitCutsExpandExplicitCuts*(
    this: var vtkRedistributeDataSetFilter; _arg: bool) {.
    importcpp: "SetUseExplicitCutsExpandExplicitCuts",
    header: "vtkRedistributeDataSetFilter.h".}
## !!!Ignored construct:  virtual bool GetBoundaryModeUseExplicitCutsExpandExplicitCuts ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ExpandExplicitCuts  of  << this -> ExpandExplicitCuts ) ; return this -> ExpandExplicitCuts ; } ;
## Error: expected ';'!!!

proc ExpandExplicitCutsOn*(this: var vtkRedistributeDataSetFilter) {.
    importcpp: "ExpandExplicitCutsOn", header: "vtkRedistributeDataSetFilter.h".}
proc ExpandExplicitCutsOff*(this: var vtkRedistributeDataSetFilter) {.
    importcpp: "ExpandExplicitCutsOff", header: "vtkRedistributeDataSetFilter.h".}
  ## /@}
  ## /@}
  ## *
  ##  Returns the cuts used by the most recent `RequestData` call. This is only
  ##  valid after a successful `Update` request.
  ##
proc GetCuts*(this: vtkRedistributeDataSetFilter): vector[vtkBoundingBox] {.
    noSideEffect, importcpp: "GetCuts", header: "vtkRedistributeDataSetFilter.h".}
proc SetBoundaryModeNumberOfPartitions*(this: var vtkRedistributeDataSetFilter;
                                       _arg: cint) {.
    importcpp: "SetBoundaryModeNumberOfPartitions",
    header: "vtkRedistributeDataSetFilter.h".}
proc GetBoundaryModeMinValueNumberOfPartitionsMinValue*(
    this: var vtkRedistributeDataSetFilter): cint {.
    importcpp: "GetBoundaryModeMinValueNumberOfPartitionsMinValue",
    header: "vtkRedistributeDataSetFilter.h".}
proc GetBoundaryModeMaxValueNumberOfPartitionsMaxValue*(
    this: var vtkRedistributeDataSetFilter): cint {.
    importcpp: "GetBoundaryModeMaxValueNumberOfPartitionsMaxValue",
    header: "vtkRedistributeDataSetFilter.h".}
## !!!Ignored construct:  virtual int GetBoundaryModeUseExplicitCutsExpandExplicitCutsNumberOfPartitions ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfPartitions  of  << this -> NumberOfPartitions ) ; return this -> NumberOfPartitions ; } ;
## Error: expected ';'!!!

proc SetUseExplicitCutsExpandExplicitCutsPreservePartitionsInOutput*(
    this: var vtkRedistributeDataSetFilter; _arg: bool) {.importcpp: "SetUseExplicitCutsExpandExplicitCutsPreservePartitionsInOutput",
    header: "vtkRedistributeDataSetFilter.h".}
## !!!Ignored construct:  virtual bool GetBoundaryModeUseExplicitCutsExpandExplicitCutsNumberOfPartitionsPreservePartitionsInOutput ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PreservePartitionsInOutput  of  << this -> PreservePartitionsInOutput ) ; return this -> PreservePartitionsInOutput ; } ;
## Error: expected ';'!!!

proc PreservePartitionsInOutputOn*(this: var vtkRedistributeDataSetFilter) {.
    importcpp: "PreservePartitionsInOutputOn",
    header: "vtkRedistributeDataSetFilter.h".}
proc PreservePartitionsInOutputOff*(this: var vtkRedistributeDataSetFilter) {.
    importcpp: "PreservePartitionsInOutputOff",
    header: "vtkRedistributeDataSetFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Generate global cell ids if none present in the input. If global cell ids are present
  ##  in the input then this flag is ignored. Default is true.
  ##
proc SetUseExplicitCutsExpandExplicitCutsPreservePartitionsInOutputGenerateGlobalCellIds*(
    this: var vtkRedistributeDataSetFilter; _arg: bool) {.importcpp: "SetUseExplicitCutsExpandExplicitCutsPreservePartitionsInOutputGenerateGlobalCellIds",
    header: "vtkRedistributeDataSetFilter.h".}
## !!!Ignored construct:  virtual bool GetBoundaryModeUseExplicitCutsExpandExplicitCutsNumberOfPartitionsPreservePartitionsInOutputGenerateGlobalCellIds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateGlobalCellIds  of  << this -> GenerateGlobalCellIds ) ; return this -> GenerateGlobalCellIds ; } ;
## Error: expected ';'!!!

proc GenerateGlobalCellIdsOn*(this: var vtkRedistributeDataSetFilter) {.
    importcpp: "GenerateGlobalCellIdsOn", header: "vtkRedistributeDataSetFilter.h".}
proc GenerateGlobalCellIdsOff*(this: var vtkRedistributeDataSetFilter) {.
    importcpp: "GenerateGlobalCellIdsOff",
    header: "vtkRedistributeDataSetFilter.h".}
  ## /@}
  ## *
  ##  Helper function to expand a collection of bounding boxes to include the
  ##  `bounds` specified. This will expand any boxes in the `cuts` that abut any
  ##  of the external faces of the bounding box formed by all the `cuts` to
  ##  touch the external faces of the `bounds`.
  ##
proc ExpandCuts*(this: var vtkRedistributeDataSetFilter;
                cuts: vector[vtkBoundingBox]; bounds: vtkBoundingBox): vector[
    vtkBoundingBox] {.importcpp: "ExpandCuts",
                     header: "vtkRedistributeDataSetFilter.h".}
proc SetUseExplicitCutsExpandExplicitCutsPreservePartitionsInOutputGenerateGlobalCellIdsEnableDebugging*(
    this: var vtkRedistributeDataSetFilter; _arg: bool) {.importcpp: "SetUseExplicitCutsExpandExplicitCutsPreservePartitionsInOutputGenerateGlobalCellIdsEnableDebugging",
    header: "vtkRedistributeDataSetFilter.h".}
## !!!Ignored construct:  virtual bool GetBoundaryModeUseExplicitCutsExpandExplicitCutsNumberOfPartitionsPreservePartitionsInOutputGenerateGlobalCellIdsEnableDebugging ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EnableDebugging  of  << this -> EnableDebugging ) ; return this -> EnableDebugging ; } ;
## Error: expected ';'!!!

proc EnableDebuggingOn*(this: var vtkRedistributeDataSetFilter) {.
    importcpp: "EnableDebuggingOn", header: "vtkRedistributeDataSetFilter.h".}
proc EnableDebuggingOff*(this: var vtkRedistributeDataSetFilter) {.
    importcpp: "EnableDebuggingOff", header: "vtkRedistributeDataSetFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  When UseExplicitCuts is false, and input is a
  ##  `vtkPartitionedDataSetCollection`, set this to true to generate cuts for
  ##  load balancing using all the datasets in the
  ##  vtkPartitionedDataSetCollection.
  ##
  ##  Default is true.
  ##
proc SetUseExplicitCutsExpandExplicitCutsPreservePartitionsInOutputGenerateGlobalCellIdsEnableDebuggingLoadBalanceAcrossAllBlocks*(
    this: var vtkRedistributeDataSetFilter; _arg: bool) {.importcpp: "SetUseExplicitCutsExpandExplicitCutsPreservePartitionsInOutputGenerateGlobalCellIdsEnableDebuggingLoadBalanceAcrossAllBlocks",
    header: "vtkRedistributeDataSetFilter.h".}
## !!!Ignored construct:  virtual bool GetBoundaryModeUseExplicitCutsExpandExplicitCutsNumberOfPartitionsPreservePartitionsInOutputGenerateGlobalCellIdsEnableDebuggingLoadBalanceAcrossAllBlocks ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LoadBalanceAcrossAllBlocks  of  << this -> LoadBalanceAcrossAllBlocks ) ; return this -> LoadBalanceAcrossAllBlocks ; } ;
## Error: expected ';'!!!

proc LoadBalanceAcrossAllBlocksOn*(this: var vtkRedistributeDataSetFilter) {.
    importcpp: "LoadBalanceAcrossAllBlocksOn",
    header: "vtkRedistributeDataSetFilter.h".}
proc LoadBalanceAcrossAllBlocksOff*(this: var vtkRedistributeDataSetFilter) {.
    importcpp: "LoadBalanceAcrossAllBlocksOff",
    header: "vtkRedistributeDataSetFilter.h".}
  ## /@}