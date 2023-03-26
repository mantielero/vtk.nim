## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkKdTree.h
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
## ----------------------------------------------------------------------------
##  Copyright (c) Sandia Corporation
##  See Copyright.txt or http://www.paraview.org/HTML/Copyright.html for details.
## ----------------------------------------------------------------------------
## *
##  @class   vtkKdTree
##  @brief   a Kd-tree spatial decomposition of a set of points
##
##
##      Given one or more vtkDataSets, create a load balancing
##      k-d tree decomposition of the points at the center of the cells.
##      Or, create a k-d tree point locator from a list of points.
##
##      This class can also generate a PolyData representation of
##      the boundaries of the spatial regions in the decomposition.
##
##      It can sort the regions with respect to a viewing direction,
##      and it can decompose a list of regions into subsets, each
##      of which represent a convex spatial region (since many algorithms
##      require a convex region).
##
##      If the points were derived from cells, vtkKdTree
##      can create a list of cell Ids for each region for each data set.
##      Two lists are available - all cells with centroid in the region,
##      and all cells that intersect the region but whose centroid lies
##      in another region.
##
##      For the purpose of removing duplicate points quickly from large
##      data sets, or for finding nearby points, we added another mode for
##      building the locator.  BuildLocatorFromPoints will build a k-d tree
##      from one or more vtkPoints objects.  This can be followed by
##      BuildMapForDuplicatePoints which returns a mapping from the original
##      ids to a subset of the ids that is unique within a supplied
##      tolerance, or you can use FindPoint and FindClosestPoint to
##      locate points in the original set that the tree was built from.
##
##  @sa
##       vtkLocator vtkCellLocator vtkPKdTree
##

import
  vtkCommonDataModelModule, vtkLocator

discard "forward decl of vtkTimerLog"
discard "forward decl of vtkIdList"
discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkIntArray"
discard "forward decl of vtkPointSet"
discard "forward decl of vtkPoints"
discard "forward decl of vtkCellArray"
discard "forward decl of vtkCell"
discard "forward decl of vtkKdNode"
discard "forward decl of vtkBSPCuts"
discard "forward decl of vtkBSPIntersections"
discard "forward decl of vtkDataSetCollection"
type
  vtkKdTree* {.importcpp: "vtkKdTree::vtkKdTree", header: "vtkKdTree.h", bycopy.} = object of vtkLocator ##  So that each suboperation can report progress
                                                                                               ##  in [0,1], yet we will be able to report a global
                                                                                               ##  progress. Sub-operations must use UpdateSubOperationProgress()
                                                                                               ##  for this to work.
    vtkKdTree* {.importc: "vtkKdTree".}: VTK_NEWINSTANCE
    ##  indexed by region ID
    ## *
    ##  Modelled on vtkAlgorithm::UpdateProgress().
    ##  Update the progress when building the locator.
    ##  Fires vtkCommand::ProgressEvent.
    ##
    ##  Update progress for a sub-operation. \c amount goes from 0.0 to 1.0.
    ##  Actual progress is given by
    ##  (this->ProgressOffset + this->ProgressScale* amount).
    ##  to optimize IntersectsCell()
    ##  number of leaf nodes
    ##  a very small distance, relative to the dataset's size
    ##  These instance variables are used by the special locator created
    ##  to find duplicate points. (BuildLocatorFromPoints)
    ##  These Last* values are here to save state so we can
    ##  determine later if k-d tree must be rebuilt.

  vtkKdTreeSuperclass* = vtkLocator

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkKdTree::IsTypeOf(@)",
    header: "vtkKdTree.h".}
proc IsA*(this: var vtkKdTree; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkKdTree.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkKdTree {.
    importcpp: "vtkKdTree::SafeDownCast(@)", header: "vtkKdTree.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkKdTree :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkLocator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkKdTree :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkKdTree :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkKdTree; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkKdTree.h".}
proc New*(): ptr vtkKdTree {.importcpp: "vtkKdTree::New(@)", header: "vtkKdTree.h".}
proc TimingOn*(this: var vtkKdTree) {.importcpp: "TimingOn", header: "vtkKdTree.h".}
proc TimingOff*(this: var vtkKdTree) {.importcpp: "TimingOff", header: "vtkKdTree.h".}
proc SetTiming*(this: var vtkKdTree; _arg: vtkTypeBool) {.importcpp: "SetTiming",
    header: "vtkKdTree.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetTiming ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Timing  of  << this -> Timing ) ; return this -> Timing ; } ;
## Error: expected ';'!!!

proc SetTimingMinCells*(this: var vtkKdTree; _arg: cint) {.
    importcpp: "SetTimingMinCells", header: "vtkKdTree.h".}
## !!!Ignored construct:  virtual int GetTimingMinCells ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MinCells  of  << this -> MinCells ) ; return this -> MinCells ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} *
##  Set/Get the number of spatial regions you want to get close
##  to without going over.  (The number of spatial regions is normally
##  a power of two.)  Call this before BuildLocator().  Default
##  is unset (0).
##  virtual int GetTimingMinCellsNumberOfRegionsOrLessNumberOfRegionsOrLess ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfRegionsOrLess  of  << this -> NumberOfRegionsOrLess ) ; return this -> NumberOfRegionsOrLess ; } ;
## Error: expected ';'!!!

proc SetTimingMinCellsNumberOfRegionsOrLess*(this: var vtkKdTree; _arg: cint) {.
    importcpp: "SetTimingMinCellsNumberOfRegionsOrLess", header: "vtkKdTree.h".}
  ## *
  ##  Set/Get the number of spatial regions you want to get close
  ##  to while having at least this many regions.  (The number of
  ##  spatial regions is normally a power of two.)   Default
  ##  is unset (0).
  ##
## !!!Ignored construct:  virtual int GetTimingMinCellsNumberOfRegionsOrLessNumberOfRegionsOrLessNumberOfRegionsOrMore ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfRegionsOrMore  of  << this -> NumberOfRegionsOrMore ) ; return this -> NumberOfRegionsOrMore ; } ;
## Error: expected ';'!!!

proc SetTimingMinCellsNumberOfRegionsOrLessNumberOfRegionsOrMore*(
    this: var vtkKdTree; _arg: cint) {.importcpp: "SetTimingMinCellsNumberOfRegionsOrLessNumberOfRegionsOrMore",
                                  header: "vtkKdTree.h".}
  ## *
  ##  Some algorithms on k-d trees require a value that is a very
  ##  small distance relative to the diameter of the entire space
  ##  divided by the k-d tree.  This factor is the maximum axis-aligned
  ##  width of the space multiplied by 10e-6.
  ##
## !!!Ignored construct:  virtual double GetTimingMinCellsNumberOfRegionsOrLessNumberOfRegionsOrLessNumberOfRegionsOrMoreFudgeFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FudgeFactor  of  << this -> FudgeFactor ) ; return this -> FudgeFactor ; } ;
## Error: expected ';'!!!

proc SetTimingMinCellsNumberOfRegionsOrLessNumberOfRegionsOrMoreFudgeFactor*(
    this: var vtkKdTree; _arg: cdouble) {.importcpp: "SetTimingMinCellsNumberOfRegionsOrLessNumberOfRegionsOrMoreFudgeFactor",
                                     header: "vtkKdTree.h".}
  ## *
  ##  Get a vtkBSPCuts object, a general object representing an axis-
  ##  aligned spatial partitioning.  Used by vtkBSPIntersections.
  ##
proc GetnameCuts*(this: var vtkKdTree): ptr vtkBSPCuts {.importcpp: "GetnameCuts",
    header: "vtkKdTree.h".}
  ## *
  ##  Normally the k-d tree is computed from the dataset(s) provided
  ##  in SetDataSet.  Alternatively, you can provide the cuts that will
  ##  be applied by calling SetCuts.
  ##
proc SetCuts*(this: var vtkKdTree; cuts: ptr vtkBSPCuts) {.importcpp: "SetCuts",
    header: "vtkKdTree.h".}
proc OmitXPartitioning*(this: var vtkKdTree) {.importcpp: "OmitXPartitioning",
    header: "vtkKdTree.h".}
proc OmitYPartitioning*(this: var vtkKdTree) {.importcpp: "OmitYPartitioning",
    header: "vtkKdTree.h".}
proc OmitZPartitioning*(this: var vtkKdTree) {.importcpp: "OmitZPartitioning",
    header: "vtkKdTree.h".}
proc OmitXYPartitioning*(this: var vtkKdTree) {.importcpp: "OmitXYPartitioning",
    header: "vtkKdTree.h".}
proc OmitYZPartitioning*(this: var vtkKdTree) {.importcpp: "OmitYZPartitioning",
    header: "vtkKdTree.h".}
proc OmitZXPartitioning*(this: var vtkKdTree) {.importcpp: "OmitZXPartitioning",
    header: "vtkKdTree.h".}
proc OmitNoPartitioning*(this: var vtkKdTree) {.importcpp: "OmitNoPartitioning",
    header: "vtkKdTree.h".}
proc SetDataSet*(this: var vtkKdTree; set: ptr vtkDataSet) {.importcpp: "SetDataSet",
    header: "vtkKdTree.h".}
proc AddDataSet*(this: var vtkKdTree; set: ptr vtkDataSet) {.importcpp: "AddDataSet",
    header: "vtkKdTree.h".}
proc RemoveDataSet*(this: var vtkKdTree; index: cint) {.importcpp: "RemoveDataSet",
    header: "vtkKdTree.h".}
proc RemoveDataSet*(this: var vtkKdTree; set: ptr vtkDataSet) {.
    importcpp: "RemoveDataSet", header: "vtkKdTree.h".}
proc RemoveAllDataSets*(this: var vtkKdTree) {.importcpp: "RemoveAllDataSets",
    header: "vtkKdTree.h".}
proc GetNumberOfDataSets*(this: var vtkKdTree): cint {.
    importcpp: "GetNumberOfDataSets", header: "vtkKdTree.h".}
proc GetDataSet*(this: var vtkKdTree; n: cint): ptr vtkDataSet {.
    importcpp: "GetDataSet", header: "vtkKdTree.h".}
proc GetDataSet*(this: var vtkKdTree): ptr vtkDataSet {.importcpp: "GetDataSet",
    header: "vtkKdTree.h".}
proc GetnameCutsDataSets*(this: var vtkKdTree): ptr vtkDataSetCollection {.
    importcpp: "GetnameCutsDataSets", header: "vtkKdTree.h".}
  ## /@}
  ## *
  ##  Return the index of the given data set.  Returns -1 if that data
  ##  set does not exist.
  ##
proc GetDataSetIndex*(this: var vtkKdTree; set: ptr vtkDataSet): cint {.
    importcpp: "GetDataSetIndex", header: "vtkKdTree.h".}
proc GetBounds*(this: var vtkKdTree; bounds: ptr cdouble) {.importcpp: "GetBounds",
    header: "vtkKdTree.h".}
proc SetNewBounds*(this: var vtkKdTree; bounds: ptr cdouble) {.
    importcpp: "SetNewBounds", header: "vtkKdTree.h".}
## !!!Ignored construct:  /@{ *
##  The number of leaf nodes of the tree, the spatial regions
##  virtual int GetTimingMinCellsNumberOfRegionsOrLessNumberOfRegionsOrLessNumberOfRegionsOrMoreFudgeFactorNumberOfRegionsNumberOfRegions ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfRegions  of  << this -> NumberOfRegions ) ; return this -> NumberOfRegions ; } ;
## Error: expected ';'!!!

proc GetRegionBounds*(this: var vtkKdTree; regionID: cint; bounds: array[6, cdouble]) {.
    importcpp: "GetRegionBounds", header: "vtkKdTree.h".}
proc GetRegionDataBounds*(this: var vtkKdTree; regionID: cint;
                         bounds: array[6, cdouble]) {.
    importcpp: "GetRegionDataBounds", header: "vtkKdTree.h".}
proc PrintTree*(this: var vtkKdTree) {.importcpp: "PrintTree", header: "vtkKdTree.h".}
proc PrintVerboseTree*(this: var vtkKdTree) {.importcpp: "PrintVerboseTree",
    header: "vtkKdTree.h".}
proc PrintRegion*(this: var vtkKdTree; id: cint) {.importcpp: "PrintRegion",
    header: "vtkKdTree.h".}
proc CreateCellLists*(this: var vtkKdTree; dataSetIndex: cint;
                     regionReqList: ptr cint; reqListSize: cint) {.
    importcpp: "CreateCellLists", header: "vtkKdTree.h".}
proc CreateCellLists*(this: var vtkKdTree; set: ptr vtkDataSet;
                     regionReqList: ptr cint; reqListSize: cint) {.
    importcpp: "CreateCellLists", header: "vtkKdTree.h".}
proc CreateCellLists*(this: var vtkKdTree; regionReqList: ptr cint; listSize: cint) {.
    importcpp: "CreateCellLists", header: "vtkKdTree.h".}
proc CreateCellLists*(this: var vtkKdTree) {.importcpp: "CreateCellLists",
    header: "vtkKdTree.h".}
proc SetTimingMinCellsNumberOfRegionsOrLessNumberOfRegionsOrMoreFudgeFactorIncludeRegionBoundaryCells*(
    this: var vtkKdTree; _arg: vtkTypeBool) {.importcpp: "SetTimingMinCellsNumberOfRegionsOrLessNumberOfRegionsOrMoreFudgeFactorIncludeRegionBoundaryCells",
    header: "vtkKdTree.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetTimingMinCellsNumberOfRegionsOrLessNumberOfRegionsOrLessNumberOfRegionsOrMoreFudgeFactorNumberOfRegionsNumberOfRegionsIncludeRegionBoundaryCells ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IncludeRegionBoundaryCells  of  << this -> IncludeRegionBoundaryCells ) ; return this -> IncludeRegionBoundaryCells ; } ;
## Error: expected ';'!!!

proc IncludeRegionBoundaryCellsOn*(this: var vtkKdTree) {.
    importcpp: "IncludeRegionBoundaryCellsOn", header: "vtkKdTree.h".}
proc IncludeRegionBoundaryCellsOff*(this: var vtkKdTree) {.
    importcpp: "IncludeRegionBoundaryCellsOff", header: "vtkKdTree.h".}
  ## /@}
  ## *
  ##  Free the memory used by the cell lists.
  ##
proc DeleteCellLists*(this: var vtkKdTree) {.importcpp: "DeleteCellLists",
    header: "vtkKdTree.h".}
proc GetCellList*(this: var vtkKdTree; regionID: cint): ptr vtkIdList {.
    importcpp: "GetCellList", header: "vtkKdTree.h".}
proc GetBoundaryCellList*(this: var vtkKdTree; regionID: cint): ptr vtkIdList {.
    importcpp: "GetBoundaryCellList", header: "vtkKdTree.h".}
proc GetCellLists*(this: var vtkKdTree; regions: ptr vtkIntArray; set: cint;
                  inRegionCells: ptr vtkIdList; onBoundaryCells: ptr vtkIdList): vtkIdType {.
    importcpp: "GetCellLists", header: "vtkKdTree.h".}
proc GetCellLists*(this: var vtkKdTree; regions: ptr vtkIntArray; set: ptr vtkDataSet;
                  inRegionCells: ptr vtkIdList; onBoundaryCells: ptr vtkIdList): vtkIdType {.
    importcpp: "GetCellLists", header: "vtkKdTree.h".}
proc GetCellLists*(this: var vtkKdTree; regions: ptr vtkIntArray;
                  inRegionCells: ptr vtkIdList; onBoundaryCells: ptr vtkIdList): vtkIdType {.
    importcpp: "GetCellLists", header: "vtkKdTree.h".}
proc GetRegionContainingCell*(this: var vtkKdTree; set: ptr vtkDataSet;
                             cellID: vtkIdType): cint {.
    importcpp: "GetRegionContainingCell", header: "vtkKdTree.h".}
proc GetRegionContainingCell*(this: var vtkKdTree; set: cint; cellID: vtkIdType): cint {.
    importcpp: "GetRegionContainingCell", header: "vtkKdTree.h".}
proc GetRegionContainingCell*(this: var vtkKdTree; cellID: vtkIdType): cint {.
    importcpp: "GetRegionContainingCell", header: "vtkKdTree.h".}
proc AllGetRegionContainingCell*(this: var vtkKdTree): ptr cint {.
    importcpp: "AllGetRegionContainingCell", header: "vtkKdTree.h".}
proc GetRegionContainingPoint*(this: var vtkKdTree; x: cdouble; y: cdouble; z: cdouble): cint {.
    importcpp: "GetRegionContainingPoint", header: "vtkKdTree.h".}
proc BuildLocator*(this: var vtkKdTree) {.importcpp: "BuildLocator",
                                      header: "vtkKdTree.h".}
proc ForceBuildLocator*(this: var vtkKdTree) {.importcpp: "ForceBuildLocator",
    header: "vtkKdTree.h".}
proc MinimalNumberOfConvexSubRegions*(this: var vtkKdTree;
                                     regionIdList: ptr vtkIntArray;
                                     convexRegionBounds: ptr ptr cdouble): cint {.
    importcpp: "MinimalNumberOfConvexSubRegions", header: "vtkKdTree.h".}
proc ViewOrderAllRegionsInDirection*(this: var vtkKdTree;
                                    directionOfProjection: array[3, cdouble];
                                    orderedList: ptr vtkIntArray): cint {.
    importcpp: "ViewOrderAllRegionsInDirection", header: "vtkKdTree.h".}
proc ViewOrderRegionsInDirection*(this: var vtkKdTree; regionIds: ptr vtkIntArray;
                                 directionOfProjection: array[3, cdouble];
                                 orderedList: ptr vtkIntArray): cint {.
    importcpp: "ViewOrderRegionsInDirection", header: "vtkKdTree.h".}
proc ViewOrderAllRegionsFromPosition*(this: var vtkKdTree;
                                     directionOfProjection: array[3, cdouble];
                                     orderedList: ptr vtkIntArray): cint {.
    importcpp: "ViewOrderAllRegionsFromPosition", header: "vtkKdTree.h".}
proc ViewOrderRegionsFromPosition*(this: var vtkKdTree; regionIds: ptr vtkIntArray;
                                  directionOfProjection: array[3, cdouble];
                                  orderedList: ptr vtkIntArray): cint {.
    importcpp: "ViewOrderRegionsFromPosition", header: "vtkKdTree.h".}
proc BuildLocatorFromPoints*(this: var vtkKdTree; pointset: ptr vtkPointSet) {.
    importcpp: "BuildLocatorFromPoints", header: "vtkKdTree.h".}
proc BuildLocatorFromPoints*(this: var vtkKdTree; ptArray: ptr vtkPoints) {.
    importcpp: "BuildLocatorFromPoints", header: "vtkKdTree.h".}
proc BuildLocatorFromPoints*(this: var vtkKdTree; ptArray: ptr ptr vtkPoints;
                            numPtArrays: cint) {.
    importcpp: "BuildLocatorFromPoints", header: "vtkKdTree.h".}
proc BuildMapForDuplicatePoints*(this: var vtkKdTree; tolerance: cfloat): ptr vtkIdTypeArray {.
    importcpp: "BuildMapForDuplicatePoints", header: "vtkKdTree.h".}
proc FindPoint*(this: var vtkKdTree; x: ptr cdouble): vtkIdType {.
    importcpp: "FindPoint", header: "vtkKdTree.h".}
proc FindPoint*(this: var vtkKdTree; x: cdouble; y: cdouble; z: cdouble): vtkIdType {.
    importcpp: "FindPoint", header: "vtkKdTree.h".}
proc FindClosestPoint*(this: var vtkKdTree; x: ptr cdouble; dist2: var cdouble): vtkIdType {.
    importcpp: "FindClosestPoint", header: "vtkKdTree.h".}
proc FindClosestPoint*(this: var vtkKdTree; x: cdouble; y: cdouble; z: cdouble;
                      dist2: var cdouble): vtkIdType {.
    importcpp: "FindClosestPoint", header: "vtkKdTree.h".}
proc FindClosestPointWithinRadius*(this: var vtkKdTree; radius: cdouble;
                                  x: array[3, cdouble]; dist2: var cdouble): vtkIdType {.
    importcpp: "FindClosestPointWithinRadius", header: "vtkKdTree.h".}
proc FindClosestPointInRegion*(this: var vtkKdTree; regionId: cint; x: ptr cdouble;
                              dist2: var cdouble): vtkIdType {.
    importcpp: "FindClosestPointInRegion", header: "vtkKdTree.h".}
proc FindClosestPointInRegion*(this: var vtkKdTree; regionId: cint; x: cdouble;
                              y: cdouble; z: cdouble; dist2: var cdouble): vtkIdType {.
    importcpp: "FindClosestPointInRegion", header: "vtkKdTree.h".}
proc FindPointsWithinRadius*(this: var vtkKdTree; R: cdouble; x: array[3, cdouble];
                            result: ptr vtkIdList) {.
    importcpp: "FindPointsWithinRadius", header: "vtkKdTree.h".}
proc FindClosestNPoints*(this: var vtkKdTree; N: cint; x: array[3, cdouble];
                        result: ptr vtkIdList) {.importcpp: "FindClosestNPoints",
    header: "vtkKdTree.h".}
proc GetPointsInRegion*(this: var vtkKdTree; regionId: cint): ptr vtkIdTypeArray {.
    importcpp: "GetPointsInRegion", header: "vtkKdTree.h".}
proc FreeSearchStructure*(this: var vtkKdTree) {.importcpp: "FreeSearchStructure",
    header: "vtkKdTree.h".}
proc GenerateRepresentation*(this: var vtkKdTree; level: cint; pd: ptr vtkPolyData) {.
    importcpp: "GenerateRepresentation", header: "vtkKdTree.h".}
proc GenerateRepresentation*(this: var vtkKdTree; regionList: ptr cint; len: cint;
                            pd: ptr vtkPolyData) {.
    importcpp: "GenerateRepresentation", header: "vtkKdTree.h".}
proc GenerateRepresentationUsingDataBoundsOn*(this: var vtkKdTree) {.
    importcpp: "GenerateRepresentationUsingDataBoundsOn", header: "vtkKdTree.h".}
proc GenerateRepresentationUsingDataBoundsOff*(this: var vtkKdTree) {.
    importcpp: "GenerateRepresentationUsingDataBoundsOff", header: "vtkKdTree.h".}
proc SetTimingMinCellsNumberOfRegionsOrLessNumberOfRegionsOrMoreFudgeFactorIncludeRegionBoundaryCellsGenerateRepresentationUsingDataBounds*(
    this: var vtkKdTree; _arg: vtkTypeBool) {.importcpp: "SetTimingMinCellsNumberOfRegionsOrLessNumberOfRegionsOrMoreFudgeFactorIncludeRegionBoundaryCellsGenerateRepresentationUsingDataBounds",
    header: "vtkKdTree.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetTimingMinCellsNumberOfRegionsOrLessNumberOfRegionsOrLessNumberOfRegionsOrMoreFudgeFactorNumberOfRegionsNumberOfRegionsIncludeRegionBoundaryCellsGenerateRepresentationUsingDataBounds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateRepresentationUsingDataBounds  of  << this -> GenerateRepresentationUsingDataBounds ) ; return this -> GenerateRepresentationUsingDataBounds ; } ;
## Error: expected ';'!!!

proc PrintTiming*(this: var vtkKdTree; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintTiming", header: "vtkKdTree.h".}
proc NewGeometry*(this: var vtkKdTree): cint {.importcpp: "NewGeometry",
    header: "vtkKdTree.h".}
proc NewGeometry*(this: var vtkKdTree; sets: ptr ptr vtkDataSet; numDataSets: cint): cint {.
    importcpp: "NewGeometry", header: "vtkKdTree.h".}
proc InvalidateGeometry*(this: var vtkKdTree) {.importcpp: "InvalidateGeometry",
    header: "vtkKdTree.h".}
proc CopyTree*(kd: ptr vtkKdNode): ptr vtkKdNode {.
    importcpp: "vtkKdTree::CopyTree(@)", header: "vtkKdTree.h".}
proc FindPointsInArea*(this: var vtkKdTree; area: ptr cdouble; ids: ptr vtkIdTypeArray;
                      clearArray: bool = true) {.importcpp: "FindPointsInArea",
    header: "vtkKdTree.h".}
## !!!Ignored construct:  virtual double GetTimingMinCellsNumberOfRegionsOrLessNumberOfRegionsOrLessNumberOfRegionsOrMoreFudgeFactorNumberOfRegionsNumberOfRegionsIncludeRegionBoundaryCellsGenerateRepresentationUsingDataBoundsProgress ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Progress  of  << this -> Progress ) ; return this -> Progress ; } ;
## Error: expected ';'!!!
