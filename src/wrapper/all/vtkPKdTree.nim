## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPKdTree.h
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
##  @class   vtkPKdTree
##  @brief   Build a k-d tree decomposition of a list of points.
##
##
##       Build, in parallel, a k-d tree decomposition of one or more
##       vtkDataSets distributed across processors.  We assume each
##       process has read in one portion of a large distributed data set.
##       When done, each process has access to the k-d tree structure,
##       can obtain information about which process contains
##       data for each spatial region, and can depth sort the spatial
##       regions.
##
##       This class can also assign spatial regions to processors, based
##       on one of several region assignment schemes.  By default
##       a contiguous, convex region is assigned to each process.  Several
##       queries return information about how many and what cells I have
##       that lie in a region assigned to another process.
##
##  @sa
##       vtkKdTree
##

import
  vtkFiltersParallelModule, vtkKdTree

discard "forward decl of vtkMultiProcessController"
discard "forward decl of vtkCommunicator"
discard "forward decl of vtkSubGroup"
discard "forward decl of vtkIntArray"
discard "forward decl of vtkKdNode"
type
  vtkPKdTree* {.importcpp: "vtkPKdTree", header: "vtkPKdTree.h", bycopy.} = object of vtkKdTree
    vtkPKdTree* {.importc: "vtkPKdTree".}: VTK_NEWINSTANCE
    ##  basic tables - each region is the responsibility of one process, but
    ##                 one process may be assigned many regions
    ##  indexed by region ID
    ##  indexed by process ID
    ##  indexed by process ID
    ##  by process, by region
    ##  indexed by region ID
    ##  indexed by region ID
    ##  indexed by process ID
    ##  indexed by process ID
    ##  indexed by region ID
    ##  global range for data arrays
    ##  distribution of indices for select operation
    ##  local share of points to be partitioned, and local cache
    ##  just pointer to other memory but never allocated
    ##  just pointer to other memory but never allocated
    ##  Parallel build of k-d tree

  vtkPKdTreeSuperclass* = vtkKdTree

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkPKdTree::IsTypeOf(@)",
    header: "vtkPKdTree.h".}
proc IsA*(this: var vtkPKdTree; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkPKdTree.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPKdTree {.
    importcpp: "vtkPKdTree::SafeDownCast(@)", header: "vtkPKdTree.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPKdTree :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkKdTree :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPKdTree :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPKdTree :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPKdTree; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPKdTree.h".}
proc PrintTiming*(this: var vtkPKdTree; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintTiming", header: "vtkPKdTree.h".}
proc PrintTables*(this: var vtkPKdTree; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintTables", header: "vtkPKdTree.h".}
proc New*(): ptr vtkPKdTree {.importcpp: "vtkPKdTree::New(@)", header: "vtkPKdTree.h".}
proc BuildLocator*(this: var vtkPKdTree) {.importcpp: "BuildLocator",
                                       header: "vtkPKdTree.h".}
proc GetTotalNumberOfCells*(this: var vtkPKdTree): vtkIdType {.
    importcpp: "GetTotalNumberOfCells", header: "vtkPKdTree.h".}
proc CreateProcessCellCountData*(this: var vtkPKdTree): cint {.
    importcpp: "CreateProcessCellCountData", header: "vtkPKdTree.h".}
proc CreateGlobalDataArrayBounds*(this: var vtkPKdTree): cint {.
    importcpp: "CreateGlobalDataArrayBounds", header: "vtkPKdTree.h".}
proc SetController*(this: var vtkPKdTree; c: ptr vtkMultiProcessController) {.
    importcpp: "SetController", header: "vtkPKdTree.h".}
proc GetnameController*(this: var vtkPKdTree): ptr vtkMultiProcessController {.
    importcpp: "GetnameController", header: "vtkPKdTree.h".}
  ## /@}
  ## /@{
  ## *
  ##  The PKdTree class can assign spatial regions to processors after
  ##  building the k-d tree, using one of several partitioning criteria.
  ##  These functions Set/Get whether this assignment is computed.
  ##  The default is "Off", no assignment is computed.   If "On", and
  ##  no assignment scheme is specified, contiguous assignment will be
  ##  computed.  Specifying an assignment scheme (with AssignRegions*())
  ##  automatically turns on RegionAssignment.
  ##
## !!!Ignored construct:  virtual int GetRegionAssignment ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RegionAssignment  of  << this -> RegionAssignment ) ; return this -> RegionAssignment ; } ;
## Error: expected ';'!!!

proc AssignRegions*(this: var vtkPKdTree; map: ptr cint; numRegions: cint): cint {.
    importcpp: "AssignRegions", header: "vtkPKdTree.h".}
proc AssignRegionsRoundRobin*(this: var vtkPKdTree): cint {.
    importcpp: "AssignRegionsRoundRobin", header: "vtkPKdTree.h".}
proc AssignRegionsContiguous*(this: var vtkPKdTree): cint {.
    importcpp: "AssignRegionsContiguous", header: "vtkPKdTree.h".}
proc GetRegionAssignmentMap*(this: var vtkPKdTree): ptr cint {.
    importcpp: "GetRegionAssignmentMap", header: "vtkPKdTree.h".}
proc GetRegionAssignmentMapLength*(this: var vtkPKdTree): cint {.
    importcpp: "GetRegionAssignmentMapLength", header: "vtkPKdTree.h".}
proc GetRegionAssignmentList*(this: var vtkPKdTree; procId: cint;
                             list: ptr vtkIntArray): cint {.
    importcpp: "GetRegionAssignmentList", header: "vtkPKdTree.h".}
proc GetAllProcessesBorderingOnPoint*(this: var vtkPKdTree; x: cfloat; y: cfloat;
                                     z: cfloat; list: ptr vtkIntArray) {.
    importcpp: "GetAllProcessesBorderingOnPoint", header: "vtkPKdTree.h".}
proc GetProcessAssignedToRegion*(this: var vtkPKdTree; regionId: cint): cint {.
    importcpp: "GetProcessAssignedToRegion", header: "vtkPKdTree.h".}
proc HasData*(this: var vtkPKdTree; processId: cint; regionId: cint): cint {.
    importcpp: "HasData", header: "vtkPKdTree.h".}
proc GetProcessCellCountForRegion*(this: var vtkPKdTree; processId: cint;
                                  regionId: cint): cint {.
    importcpp: "GetProcessCellCountForRegion", header: "vtkPKdTree.h".}
proc GetTotalProcessesInRegion*(this: var vtkPKdTree; regionId: cint): cint {.
    importcpp: "GetTotalProcessesInRegion", header: "vtkPKdTree.h".}
proc GetProcessListForRegion*(this: var vtkPKdTree; regionId: cint;
                             processes: ptr vtkIntArray): cint {.
    importcpp: "GetProcessListForRegion", header: "vtkPKdTree.h".}
proc GetProcessesCellCountForRegion*(this: var vtkPKdTree; regionId: cint;
                                    count: ptr cint; len: cint): cint {.
    importcpp: "GetProcessesCellCountForRegion", header: "vtkPKdTree.h".}
proc GetTotalRegionsForProcess*(this: var vtkPKdTree; processId: cint): cint {.
    importcpp: "GetTotalRegionsForProcess", header: "vtkPKdTree.h".}
proc GetRegionListForProcess*(this: var vtkPKdTree; processId: cint;
                             regions: ptr vtkIntArray): cint {.
    importcpp: "GetRegionListForProcess", header: "vtkPKdTree.h".}
proc GetRegionsCellCountForProcess*(this: var vtkPKdTree; ProcessId: cint;
                                   count: ptr cint; len: cint): cint {.
    importcpp: "GetRegionsCellCountForProcess", header: "vtkPKdTree.h".}
proc GetCellListsForProcessRegions*(this: var vtkPKdTree; ProcessId: cint; set: cint;
                                   inRegionCells: ptr vtkIdList;
                                   onBoundaryCells: ptr vtkIdList): vtkIdType {.
    importcpp: "GetCellListsForProcessRegions", header: "vtkPKdTree.h".}
proc GetCellListsForProcessRegions*(this: var vtkPKdTree; ProcessId: cint;
                                   set: ptr vtkDataSet;
                                   inRegionCells: ptr vtkIdList;
                                   onBoundaryCells: ptr vtkIdList): vtkIdType {.
    importcpp: "GetCellListsForProcessRegions", header: "vtkPKdTree.h".}
proc GetCellListsForProcessRegions*(this: var vtkPKdTree; ProcessId: cint;
                                   inRegionCells: ptr vtkIdList;
                                   onBoundaryCells: ptr vtkIdList): vtkIdType {.
    importcpp: "GetCellListsForProcessRegions", header: "vtkPKdTree.h".}
proc ViewOrderAllProcessesInDirection*(this: var vtkPKdTree;
                                      directionOfProjection: array[3, cdouble];
                                      orderedList: ptr vtkIntArray): cint {.
    importcpp: "ViewOrderAllProcessesInDirection", header: "vtkPKdTree.h".}
proc ViewOrderAllProcessesFromPosition*(this: var vtkPKdTree;
                                       cameraPosition: array[3, cdouble];
                                       orderedList: ptr vtkIntArray): cint {.
    importcpp: "ViewOrderAllProcessesFromPosition", header: "vtkPKdTree.h".}
proc GetCellArrayGlobalRange*(this: var vtkPKdTree; name: cstring;
                             range: array[2, cfloat]): cint {.
    importcpp: "GetCellArrayGlobalRange", header: "vtkPKdTree.h".}
proc GetPointArrayGlobalRange*(this: var vtkPKdTree; name: cstring;
                              range: array[2, cfloat]): cint {.
    importcpp: "GetPointArrayGlobalRange", header: "vtkPKdTree.h".}
proc GetCellArrayGlobalRange*(this: var vtkPKdTree; name: cstring;
                             range: array[2, cdouble]): cint {.
    importcpp: "GetCellArrayGlobalRange", header: "vtkPKdTree.h".}
proc GetPointArrayGlobalRange*(this: var vtkPKdTree; name: cstring;
                              range: array[2, cdouble]): cint {.
    importcpp: "GetPointArrayGlobalRange", header: "vtkPKdTree.h".}
proc GetCellArrayGlobalRange*(this: var vtkPKdTree; arrayIndex: cint;
                             range: array[2, cdouble]): cint {.
    importcpp: "GetCellArrayGlobalRange", header: "vtkPKdTree.h".}
proc GetPointArrayGlobalRange*(this: var vtkPKdTree; arrayIndex: cint;
                              range: array[2, cdouble]): cint {.
    importcpp: "GetPointArrayGlobalRange", header: "vtkPKdTree.h".}
proc GetCellArrayGlobalRange*(this: var vtkPKdTree; arrayIndex: cint;
                             range: array[2, cfloat]): cint {.
    importcpp: "GetCellArrayGlobalRange", header: "vtkPKdTree.h".}
proc GetPointArrayGlobalRange*(this: var vtkPKdTree; arrayIndex: cint;
                              range: array[2, cfloat]): cint {.
    importcpp: "GetPointArrayGlobalRange", header: "vtkPKdTree.h".}