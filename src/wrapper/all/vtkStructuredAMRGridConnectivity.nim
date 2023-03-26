## =========================================================================
##
##  Program:   Visualization Toolkit
##  Module:    vtkStructuredAMRGridConnectivity.h
##
##  Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##  All rights reserved.
##  See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##  This software is distributed WITHOUT ANY WARRANTY; without even
##  the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##  PURPOSE.  See the above copyright notice for more information.
##
##  =========================================================================
## *
##  @class   vtkStructuredAMRGridConnectivity
##   grid connectivity.
##
##
##   A concrete instance of vtkAbstractGridConnectivity that implements
##   functionality for computing the neighboring topology within a structured
##   AMR grid, as well as, generating ghost-layers. Support is provided for
##   1-D, 2-D (XY,XZ,YZ) and 3-D cell-centered datasets. This implementation
##   does not have any support for distributed data. For the parallel
##   implementation see vtkPStructuredAMRGridConnectivity.
##
##  @sa
##   vtkPStructuredAMRGridConnectivity vtkAbstractGridConnectivity
##

import
  vtkAbstractGridConnectivity, vtkFiltersGeometryModule, vtkStructuredAMRNeighbor

##  C++ includes

type
  vtkStructuredAMRGridConnectivity* {.importcpp: "vtkStructuredAMRGridConnectivity", header: "vtkStructuredAMRGridConnectivity.h",
                                     bycopy.} = object of vtkAbstractGridConnectivity
    vtkStructuredAMRGridConnectivity* {.importc: "vtkStructuredAMRGridConnectivity".}: VTK_NEWINSTANCE
    ##  The total number of levels;
    ##  The dimension of the data, i.e. 2 or 3
    ##  The data description, i.e., VTK_XY_PLANE, etc.
    ##  The whole extent w.r.t. to the root level, level 0.
    ##  The max level of the AMR hierarchy
    ##  The refinement ratio, set in the initialization,iff,
    ##  a constant refinement ratio is used. A value of -1
    ##  indicates that the refinement ratio is not constant
    ##  and the RefinementRatios vector is used instead.
    ##  Indicates if the data is node-centered
    ##  Indicates if the data is cell-centered
    ##  If Balanced refinement is true, then adjacent
    ##  grids in the hierarchy can only differ by one
    ##  level.
    ##  AMRHierarchy stores the set of grid Ids in [0,N] for each level
    ##  For each grid, [0,N] store the grid extents,level, and list of neighbors
    ##  size of this vector is 6*N
    ##  size of this vector is 6*N
    ##  size of this vector is N
    ##  size of this vector is N
    ##  For each grid, [0,N], store the donor level,grid and cell information, a
    ##  DonorLevel of -1 indicates that the cell is not receiving any information
    ##  from a donor.
    ##  RefinementRatios stores the refinement ratio at each level, this vector
    ##  is used only when the refinement ratio varies across levels


proc New*(): ptr vtkStructuredAMRGridConnectivity {.
    importcpp: "vtkStructuredAMRGridConnectivity::New(@)",
    header: "vtkStructuredAMRGridConnectivity.h".}
type
  vtkStructuredAMRGridConnectivitySuperclass* = vtkAbstractGridConnectivity

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkStructuredAMRGridConnectivity::IsTypeOf(@)",
    header: "vtkStructuredAMRGridConnectivity.h".}
proc IsA*(this: var vtkStructuredAMRGridConnectivity; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkStructuredAMRGridConnectivity.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkStructuredAMRGridConnectivity {.
    importcpp: "vtkStructuredAMRGridConnectivity::SafeDownCast(@)",
    header: "vtkStructuredAMRGridConnectivity.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkStructuredAMRGridConnectivity :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractGridConnectivity :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkStructuredAMRGridConnectivity :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkStructuredAMRGridConnectivity :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkStructuredAMRGridConnectivity; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkStructuredAMRGridConnectivity.h".}
proc Initialize*(this: var vtkStructuredAMRGridConnectivity; NumberOfLevels: cuint;
                N: cuint; RefinementRatio: cint = -1) {.importcpp: "Initialize",
    header: "vtkStructuredAMRGridConnectivity.h".}
proc ComputeNeighbors*(this: var vtkStructuredAMRGridConnectivity) {.
    importcpp: "ComputeNeighbors", header: "vtkStructuredAMRGridConnectivity.h".}
proc CreateGhostLayers*(this: var vtkStructuredAMRGridConnectivity; N: cint = 1) {.
    importcpp: "CreateGhostLayers", header: "vtkStructuredAMRGridConnectivity.h".}
proc RegisterGrid*(this: var vtkStructuredAMRGridConnectivity; gridIdx: cint;
                  level: cint; refinementRatio: cint; extents: array[6, cint];
                  nodesGhostArray: ptr vtkUnsignedCharArray;
                  cellGhostArray: ptr vtkUnsignedCharArray;
                  pointData: ptr vtkPointData; cellData: ptr vtkCellData;
                  gridNodes: ptr vtkPoints) {.importcpp: "RegisterGrid",
    header: "vtkStructuredAMRGridConnectivity.h".}
proc RegisterGrid*(this: var vtkStructuredAMRGridConnectivity; gridIdx: cint;
                  level: cint; extents: array[6, cint];
                  nodesGhostArray: ptr vtkUnsignedCharArray;
                  cellGhostArray: ptr vtkUnsignedCharArray;
                  pointData: ptr vtkPointData; cellData: ptr vtkCellData;
                  gridNodes: ptr vtkPoints) {.importcpp: "RegisterGrid",
    header: "vtkStructuredAMRGridConnectivity.h".}
proc SetBalancedRefinement*(this: var vtkStructuredAMRGridConnectivity; _arg: bool) {.
    importcpp: "SetBalancedRefinement",
    header: "vtkStructuredAMRGridConnectivity.h".}
## !!!Ignored construct:  virtual bool GetBalancedRefinement ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BalancedRefinement  of  << this -> BalancedRefinement ) ; return this -> BalancedRefinement ; } ;
## Error: expected ';'!!!

proc SetBalancedRefinementNodeCentered*(this: var vtkStructuredAMRGridConnectivity;
                                       _arg: bool) {.
    importcpp: "SetBalancedRefinementNodeCentered",
    header: "vtkStructuredAMRGridConnectivity.h".}
## !!!Ignored construct:  virtual bool GetBalancedRefinementNodeCentered ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NodeCentered  of  << this -> NodeCentered ) ; return this -> NodeCentered ; } ;
## Error: expected ';'!!!

proc SetBalancedRefinementNodeCenteredCellCentered*(
    this: var vtkStructuredAMRGridConnectivity; _arg: bool) {.
    importcpp: "SetBalancedRefinementNodeCenteredCellCentered",
    header: "vtkStructuredAMRGridConnectivity.h".}
## !!!Ignored construct:  virtual bool GetBalancedRefinementNodeCenteredCellCentered ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CellCentered  of  << this -> CellCentered ) ; return this -> CellCentered ; } ;
## Error: expected ';'!!!

proc GetNumberOfNeighbors*(this: var vtkStructuredAMRGridConnectivity; gridID: cint): cint {.
    importcpp: "GetNumberOfNeighbors",
    header: "vtkStructuredAMRGridConnectivity.h".}
proc GetGhostedExtent*(this: var vtkStructuredAMRGridConnectivity; gridID: cint;
                      ext: array[6, cint]) {.importcpp: "GetGhostedExtent",
    header: "vtkStructuredAMRGridConnectivity.h".}
proc GetNeighbor*(this: var vtkStructuredAMRGridConnectivity; gridID: cint; nei: cint): vtkStructuredAMRNeighbor {.
    importcpp: "GetNeighbor", header: "vtkStructuredAMRGridConnectivity.h".}
## =============================================================================
##   INLINE METHODS
## =============================================================================
## ------------------------------------------------------------------------------

proc GetNumberOfNeighbors*(this: var vtkStructuredAMRGridConnectivity; gridID: cint): cint {.
    importcpp: "GetNumberOfNeighbors",
    header: "vtkStructuredAMRGridConnectivity.h".}
## ------------------------------------------------------------------------------

proc GetNeighbor*(this: var vtkStructuredAMRGridConnectivity; gridID: cint; nei: cint): vtkStructuredAMRNeighbor {.
    importcpp: "GetNeighbor", header: "vtkStructuredAMRGridConnectivity.h".}
## ------------------------------------------------------------------------------

proc Get1DOrientation*(this: var vtkStructuredAMRGridConnectivity; idx: cint;
                      ExtentLo: cint; ExtentHi: cint; OnLo: cint; OnHi: cint;
                      NotOnBoundary: cint): cint {.importcpp: "Get1DOrientation",
    header: "vtkStructuredAMRGridConnectivity.h".}
## ------------------------------------------------------------------------------

proc GetNumberOfConnectingBlockFaces*(this: var vtkStructuredAMRGridConnectivity;
                                     gridID: cint): cint {.
    importcpp: "GetNumberOfConnectingBlockFaces",
    header: "vtkStructuredAMRGridConnectivity.h".}
## ------------------------------------------------------------------------------

proc RemoveBlockConnection*(this: var vtkStructuredAMRGridConnectivity;
                           gridID: cint; blockDirection: cint) {.
    importcpp: "RemoveBlockConnection",
    header: "vtkStructuredAMRGridConnectivity.h".}
## ------------------------------------------------------------------------------

proc AddBlockConnection*(this: var vtkStructuredAMRGridConnectivity; gridID: cint;
                        blockDirection: cint) {.importcpp: "AddBlockConnection",
    header: "vtkStructuredAMRGridConnectivity.h".}
## ------------------------------------------------------------------------------

proc ClearBlockConnections*(this: var vtkStructuredAMRGridConnectivity; gridID: cint) {.
    importcpp: "ClearBlockConnections",
    header: "vtkStructuredAMRGridConnectivity.h".}
## ------------------------------------------------------------------------------

proc AreExtentsEqual*(this: var vtkStructuredAMRGridConnectivity;
                     ext1: array[6, cint]; ext2: array[6, cint]): bool {.
    importcpp: "AreExtentsEqual", header: "vtkStructuredAMRGridConnectivity.h".}
## ------------------------------------------------------------------------------

proc PrintExtent*(this: var vtkStructuredAMRGridConnectivity; os: var ostream;
                 ext: array[6, cint]) {.importcpp: "PrintExtent", header: "vtkStructuredAMRGridConnectivity.h".}
## ------------------------------------------------------------------------------

proc GetGridLevel*(this: var vtkStructuredAMRGridConnectivity; gridIdx: cint): cint {.
    importcpp: "GetGridLevel", header: "vtkStructuredAMRGridConnectivity.h".}
## ------------------------------------------------------------------------------

proc SetRefinementRatioAtLevel*(this: var vtkStructuredAMRGridConnectivity;
                               level: cint; r: cint) {.
    importcpp: "SetRefinementRatioAtLevel",
    header: "vtkStructuredAMRGridConnectivity.h".}
## ------------------------------------------------------------------------------

proc GetRefinementRatioAtLevel*(this: var vtkStructuredAMRGridConnectivity;
                               level: cint): cint {.
    importcpp: "GetRefinementRatioAtLevel",
    header: "vtkStructuredAMRGridConnectivity.h".}
## ------------------------------------------------------------------------------

proc HasConstantRefinementRatio*(this: var vtkStructuredAMRGridConnectivity): bool {.
    importcpp: "HasConstantRefinementRatio",
    header: "vtkStructuredAMRGridConnectivity.h".}
## ------------------------------------------------------------------------------

proc GetGridExtent*(this: var vtkStructuredAMRGridConnectivity; gridIdx: cint;
                   ext: array[6, cint]) {.importcpp: "GetGridExtent", header: "vtkStructuredAMRGridConnectivity.h".}
## ------------------------------------------------------------------------------

proc LevelExists*(this: var vtkStructuredAMRGridConnectivity; level: cint): bool {.
    importcpp: "LevelExists", header: "vtkStructuredAMRGridConnectivity.h".}
## ------------------------------------------------------------------------------

proc InsertGridAtLevel*(this: var vtkStructuredAMRGridConnectivity; level: cint;
                       gridID: cint) {.importcpp: "InsertGridAtLevel", header: "vtkStructuredAMRGridConnectivity.h".}