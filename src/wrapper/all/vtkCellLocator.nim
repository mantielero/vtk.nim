## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCellLocator.h
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
##  @class   vtkCellLocator
##  @brief   octree-based spatial search object to quickly locate cells
##
##  vtkCellLocator is a spatial search object to quickly locate cells in 3D.
##  vtkCellLocator uses a uniform-level octree subdivision, where each octant
##  (an octant is also referred to as a bucket) carries an indication of
##  whether it is empty or not, and each leaf octant carries a list of the
##  cells inside of it. (An octant is not empty if it has one or more cells
##  inside of it.)  Typical operations are intersection with a line to return
##  candidate cells, or intersection with another vtkCellLocator to return
##  candidate cells.
##
##  @warning
##  vtkCellLocator utilizes the following parent class parameters:
##  - Automatic                   (default true)
##  - Level                       (default 8)
##  - MaxLevel                    (default 8)
##  - NumberOfCellsPerNode        (default 25)
##  - CacheCellBounds             (default true)
##  - UseExistingSearchStructure  (default false)
##
##  vtkCellLocator does NOT utilize the following parameters:
##  - Tolerance
##  - RetainCellLists
##
##  @sa
##  vtkAbstractCellLocator vtkStaticCellLocator vtkCellTreeLocator vtkModifiedBSPTree vtkOBBTree
##

import
  vtkAbstractCellLocator, vtkCommonDataModelModule, vtkDeprecation, vtkNew

discard "forward decl of vtkIntArray"
type
  vtkCellLocator* {.importcpp: "vtkCellLocator", header: "vtkCellLocator.h", bycopy.} = object of vtkAbstractCellLocator ## /@{
                                                                                                               ## *
                                                                                                               ##  Standard methods to print and obtain type-related information.
                                                                                                               ##
    vtkCellLocator* {.importc: "vtkCellLocator".}: VTK_NEWINSTANCE
    ##  number of octants in tree
    ##  bounding box root octant
    ##  width of leaf octant in x-y-z directions
    ##  number of "leaf" octant sub-divisions
    ##  octree

  vtkCellLocatorSuperclass* = vtkAbstractCellLocator

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCellLocator::IsTypeOf(@)", header: "vtkCellLocator.h".}
proc IsA*(this: var vtkCellLocator; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkCellLocator.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCellLocator {.
    importcpp: "vtkCellLocator::SafeDownCast(@)", header: "vtkCellLocator.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCellLocator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractCellLocator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCellLocator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCellLocator :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCellLocator; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCellLocator.h".}
proc New*(): ptr vtkCellLocator {.importcpp: "vtkCellLocator::New(@)",
                              header: "vtkCellLocator.h".}
proc SetNumberOfCellsPerBucket*(this: var vtkCellLocator; N: cint) {.
    importcpp: "SetNumberOfCellsPerBucket", header: "vtkCellLocator.h".}
proc GetNumberOfCellsPerBucket*(this: var vtkCellLocator): cint {.
    importcpp: "GetNumberOfCellsPerBucket", header: "vtkCellLocator.h".}
## using statement

## using statement

## using statement

## using statement

proc IntersectWithLine*(this: var vtkCellLocator; p1: array[3, cdouble];
                       p2: array[3, cdouble]; tol: cdouble; t: var cdouble;
                       x: array[3, cdouble]; pcoords: array[3, cdouble];
                       subId: var cint; cellId: var vtkIdType;
                       cell: ptr vtkGenericCell): cint {.
    importcpp: "IntersectWithLine", header: "vtkCellLocator.h".}
proc IntersectWithLine*(this: var vtkCellLocator; p1: array[3, cdouble];
                       p2: array[3, cdouble]; tol: cdouble; points: ptr vtkPoints;
                       cellIds: ptr vtkIdList; cell: ptr vtkGenericCell): cint {.
    importcpp: "IntersectWithLine", header: "vtkCellLocator.h".}
proc FindClosestPoint*(this: var vtkCellLocator; x: array[3, cdouble];
                      closestPoint: array[3, cdouble]; cell: ptr vtkGenericCell;
                      cellId: var vtkIdType; subId: var cint; dist2: var cdouble) {.
    importcpp: "FindClosestPoint", header: "vtkCellLocator.h".}
proc FindClosestPointWithinRadius*(this: var vtkCellLocator; x: array[3, cdouble];
                                  radius: cdouble;
                                  closestPoint: array[3, cdouble];
                                  cell: ptr vtkGenericCell; cellId: var vtkIdType;
                                  subId: var cint; dist2: var cdouble;
                                  inside: var cint): vtkIdType {.
    importcpp: "FindClosestPointWithinRadius", header: "vtkCellLocator.h".}
proc FindCell*(this: var vtkCellLocator; x: array[3, cdouble];
              vtkNotUsed: proc (a1: tol2): cdouble; GenCell: ptr vtkGenericCell;
              subId: var cint; pcoords: array[3, cdouble]; weights: ptr cdouble): vtkIdType {.
    importcpp: "FindCell", header: "vtkCellLocator.h".}
proc FindCellsWithinBounds*(this: var vtkCellLocator; bbox: ptr cdouble;
                           cells: ptr vtkIdList) {.
    importcpp: "FindCellsWithinBounds", header: "vtkCellLocator.h".}
proc FindCellsAlongLine*(this: var vtkCellLocator; p1: array[3, cdouble];
                        p2: array[3, cdouble]; tolerance: cdouble;
                        cellsIds: ptr vtkIdList) {.importcpp: "FindCellsAlongLine",
    header: "vtkCellLocator.h".}
proc FreeSearchStructure*(this: var vtkCellLocator) {.
    importcpp: "FreeSearchStructure", header: "vtkCellLocator.h".}
proc BuildLocator*(this: var vtkCellLocator) {.importcpp: "BuildLocator",
    header: "vtkCellLocator.h".}
proc ForceBuildLocator*(this: var vtkCellLocator) {.importcpp: "ForceBuildLocator",
    header: "vtkCellLocator.h".}
proc GenerateRepresentation*(this: var vtkCellLocator; level: cint;
                            pd: ptr vtkPolyData) {.
    importcpp: "GenerateRepresentation", header: "vtkCellLocator.h".}
## !!!Ignored construct:  /@} VTK_DEPRECATED_IN_9_2_0 ( This method is deprecated because LazyEvaluation has been deprecated ) virtual void BuildLocatorIfNeeded ( ) { } *
##  Get the cells in a particular bucket.
##  virtual vtkIdList * GetCells ( int bucket ) ;
## Error: identifier expected, but got: This method is deprecated because LazyEvaluation has been deprecated!!!

proc GetNumberOfBuckets*(this: var vtkCellLocator): cint {.
    importcpp: "GetNumberOfBuckets", header: "vtkCellLocator.h".}
proc ShallowCopy*(this: var vtkCellLocator; locator: ptr vtkAbstractCellLocator) {.
    importcpp: "ShallowCopy", header: "vtkCellLocator.h".}
## !!!Ignored construct:  std :: shared_ptr < std :: vector < vtkSmartPointer < vtkIdList >> > TreeSharedPtr ;
## Error: identifier expected, but got: <!!!
