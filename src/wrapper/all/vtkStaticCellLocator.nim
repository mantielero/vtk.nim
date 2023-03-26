## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkStaticCellLocator.h
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
##  @class   vtkStaticCellLocator
##  @brief   perform fast cell location operations
##
##  vtkStaticCellLocator is a type of vtkAbstractCellLocator that accelerates
##  certain operations when performing spatial operations on cells. These
##  operations include finding a point that contains a cell, and intersecting
##  cells with a line.
##
##  vtkStaticCellLocator is an accelerated version of vtkCellLocator. It is
##  threaded (via vtkSMPTools), and supports one-time static construction
##  (i.e., incremental cell insertion is not supported).
##
##  @warning
##  vtkStaticCellLocator utilizes the following parent class parameters:
##  - Automatic                   (default true)
##  - NumberOfCellsPerNode        (default 10)
##  - UseExistingSearchStructure  (default false)
##
##  vtkStaticCellLocator does NOT utilize the following parameters:
##  - CacheCellBounds             (always cached)
##  - Tolerance
##  - Level
##  - MaxLevel
##  - RetainCellLists
##
##  @warning
##  This class is templated. It may run slower than serial execution if the code
##  is not optimized during compilation. Build in Release or ReleaseWithDebugInfo.
##
##  @sa
##  vtkAbstractCellLocator vtkCellLocator vtkCellTreeLocator vtkModifiedBSPTree vtkOBBTree
##

import
  vtkAbstractCellLocator, vtkCommonDataModelModule, vtkDeprecation

##  Forward declarations for PIMPL

discard "forward decl of vtkCellBinner"
discard "forward decl of vtkCellProcessor"
type
  vtkStaticCellLocator* {.importcpp: "vtkStaticCellLocator",
                         header: "vtkStaticCellLocator.h", bycopy.} = object of vtkAbstractCellLocator ## /@{
                                                                                                ## *
                                                                                                ##  Standard methods to instantiate, print and obtain type-related information.
                                                                                                ##
    vtkStaticCellLocator* {.importc: "vtkStaticCellLocator".}: VTK_NEWINSTANCE
    ##  Bounding box of the whole dataset
    ##  Number of sub-divisions in x-y-z directions
    ##  Width of each bin in x-y-z directions
    ##  Maximum number of buckets in locator
    ##  indicate whether integer ids are small or large
    ##  VTK_DEPRECATED_IN_9_2_0 This attribute needs to be removed
    ##  Support PIMPLd implementation
    ##  Does the binning
    ##  Invokes methods (templated subclasses)


proc New*(): ptr vtkStaticCellLocator {.importcpp: "vtkStaticCellLocator::New(@)",
                                    header: "vtkStaticCellLocator.h".}
type
  vtkStaticCellLocatorSuperclass* = vtkAbstractCellLocator

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkStaticCellLocator::IsTypeOf(@)",
    header: "vtkStaticCellLocator.h".}
proc IsA*(this: var vtkStaticCellLocator; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkStaticCellLocator.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkStaticCellLocator {.
    importcpp: "vtkStaticCellLocator::SafeDownCast(@)",
    header: "vtkStaticCellLocator.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkStaticCellLocator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractCellLocator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkStaticCellLocator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkStaticCellLocator :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkStaticCellLocator; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkStaticCellLocator.h".}
proc SetDivisions*(this: var vtkStaticCellLocator; _arg1: cint; _arg2: cint; _arg3: cint) {.
    importcpp: "SetDivisions", header: "vtkStaticCellLocator.h".}
proc SetDivisions*(this: var vtkStaticCellLocator; _arg: array[3, cint]) {.
    importcpp: "SetDivisions", header: "vtkStaticCellLocator.h".}
## !!!Ignored construct:  virtual int * GetDivisions ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Divisions  pointer  << this -> Divisions ) ; return this -> Divisions ; } VTK_WRAPEXCLUDE virtual void GetDivisions ( int data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Divisions [ i ] ; } } ;
## Error: expected ';'!!!

proc SetMaxNumberOfBuckets*(this: var vtkStaticCellLocator; _arg: vtkIdType) {.
    importcpp: "SetMaxNumberOfBuckets", header: "vtkStaticCellLocator.h".}
proc GetMaxNumberOfBucketsMinValue*(this: var vtkStaticCellLocator): vtkIdType {.
    importcpp: "GetMaxNumberOfBucketsMinValue", header: "vtkStaticCellLocator.h".}
proc GetMaxNumberOfBucketsMaxValue*(this: var vtkStaticCellLocator): vtkIdType {.
    importcpp: "GetMaxNumberOfBucketsMaxValue", header: "vtkStaticCellLocator.h".}
## !!!Ignored construct:  virtual vtkIdType GetMaxNumberOfBuckets ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaxNumberOfBuckets  of  << this -> MaxNumberOfBuckets ) ; return this -> MaxNumberOfBuckets ; } ;
## Error: expected ';'!!!

proc GetLargeIds*(this: var vtkStaticCellLocator): bool {.importcpp: "GetLargeIds",
    header: "vtkStaticCellLocator.h".}
## !!!Ignored construct:  /@{ *
##  These methods are deprecated. This flag was used in internally in conjunction with
##  Tolerance, which has been removed because nobody was using it, and it would lead
##  to really slow performance if the dataset was small bounds-wise. Tolerance was
##  originally introduced to solve IntersectionWithLine issues the existed before. These
##  issues have been resolved by using double tolerance internally.
##
##  When set to true, the CellBinner will multiply the locator tolerance by the diagonal length
##  of the dataset to compute its own tolerance. When not, it uses the locator tolerance
##  directly. Default is false.
##  VTK_DEPRECATED_IN_9_2_0 ( This method is no longer used because Tolerance is also not used ) virtual void SetUseDiagonalLengthTolerance ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseDiagonalLengthTolerance  to  << _arg ) ; if ( this -> UseDiagonalLengthTolerance != _arg ) { this -> UseDiagonalLengthTolerance = _arg ; this -> Modified ( ) ; } } ;
## Error: identifier expected, but got: This method is no longer used because Tolerance is also not used!!!

## !!!Ignored construct:  VTK_DEPRECATED_IN_9_2_0 ( This method is no longer used because Tolerance is also not used ) virtual bool GetMaxNumberOfBucketsUseDiagonalLengthTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseDiagonalLengthTolerance  of  << this -> UseDiagonalLengthTolerance ) ; return this -> UseDiagonalLengthTolerance ; } ;
## Error: identifier expected, but got: This method is no longer used because Tolerance is also not used!!!

## !!!Ignored construct:  VTK_DEPRECATED_IN_9_2_0 ( This method is no longer used because Tolerance is also not used ) virtual void UseDiagonalLengthToleranceOn ( ) { if ( this -> UseDiagonalLengthTolerance != true ) { this -> UseDiagonalLengthTolerance = true ; this -> Modified ( ) ; } } VTK_DEPRECATED_IN_9_2_0 ( This method is no longer used because Tolerance is also not used ) virtual void UseDiagonalLengthToleranceOff ( ) { if ( this -> UseDiagonalLengthTolerance != false ) { this -> UseDiagonalLengthTolerance = false ; this -> Modified ( ) ; } } /@}  Re-use any superclass signatures that we don't override. using vtkAbstractCellLocator :: FindCell ;
## Error: identifier expected, but got: This method is no longer used because Tolerance is also not used!!!

## using statement

## using statement

## using statement

proc IntersectWithLine*(this: var vtkStaticCellLocator; a0: array[3, cdouble];
                       a1: array[3, cdouble]; tol: cdouble; t: var cdouble;
                       x: array[3, cdouble]; pcoords: array[3, cdouble];
                       subId: var cint; cellId: var vtkIdType;
                       cell: ptr vtkGenericCell): cint {.
    importcpp: "IntersectWithLine", header: "vtkStaticCellLocator.h".}
proc IntersectWithLine*(this: var vtkStaticCellLocator; p1: array[3, cdouble];
                       p2: array[3, cdouble]; tol: cdouble; points: ptr vtkPoints;
                       cellIds: ptr vtkIdList; cell: ptr vtkGenericCell): cint {.
    importcpp: "IntersectWithLine", header: "vtkStaticCellLocator.h".}
proc FindClosestPoint*(this: var vtkStaticCellLocator; x: array[3, cdouble];
                      closestPoint: array[3, cdouble]; cell: ptr vtkGenericCell;
                      cellId: var vtkIdType; subId: var cint; dist2: var cdouble) {.
    importcpp: "FindClosestPoint", header: "vtkStaticCellLocator.h".}
proc FindClosestPointWithinRadius*(this: var vtkStaticCellLocator;
                                  x: array[3, cdouble]; radius: cdouble;
                                  closestPoint: array[3, cdouble];
                                  cell: ptr vtkGenericCell; cellId: var vtkIdType;
                                  subId: var cint; dist2: var cdouble;
                                  inside: var cint): vtkIdType {.
    importcpp: "FindClosestPointWithinRadius", header: "vtkStaticCellLocator.h".}
proc FindCellsWithinBounds*(this: var vtkStaticCellLocator; bbox: ptr cdouble;
                           cells: ptr vtkIdList) {.
    importcpp: "FindCellsWithinBounds", header: "vtkStaticCellLocator.h".}
proc FindCellsAlongLine*(this: var vtkStaticCellLocator; p1: array[3, cdouble];
                        p2: array[3, cdouble]; tolerance: cdouble;
                        cellsIds: ptr vtkIdList) {.importcpp: "FindCellsAlongLine",
    header: "vtkStaticCellLocator.h".}
proc FindCellsAlongPlane*(this: var vtkStaticCellLocator; o: array[3, cdouble];
                         n: array[3, cdouble]; tolerance: cdouble;
                         cells: ptr vtkIdList) {.importcpp: "FindCellsAlongPlane",
    header: "vtkStaticCellLocator.h".}
proc FindCell*(this: var vtkStaticCellLocator; x: array[3, cdouble];
              vtkNotUsed: proc (a1: tol2): cdouble; GenCell: ptr vtkGenericCell;
              subId: var cint; pcoords: array[3, cdouble]; weights: ptr cdouble): vtkIdType {.
    importcpp: "FindCell", header: "vtkStaticCellLocator.h".}
proc InsideCellBounds*(this: var vtkStaticCellLocator; x: array[3, cdouble];
                      cellId: vtkIdType): bool {.importcpp: "InsideCellBounds",
    header: "vtkStaticCellLocator.h".}
proc GenerateRepresentation*(this: var vtkStaticCellLocator; level: cint;
                            pd: ptr vtkPolyData) {.
    importcpp: "GenerateRepresentation", header: "vtkStaticCellLocator.h".}
proc FreeSearchStructure*(this: var vtkStaticCellLocator) {.
    importcpp: "FreeSearchStructure", header: "vtkStaticCellLocator.h".}
proc BuildLocator*(this: var vtkStaticCellLocator) {.importcpp: "BuildLocator",
    header: "vtkStaticCellLocator.h".}
proc ForceBuildLocator*(this: var vtkStaticCellLocator) {.
    importcpp: "ForceBuildLocator", header: "vtkStaticCellLocator.h".}
proc ShallowCopy*(this: var vtkStaticCellLocator;
                 locator: ptr vtkAbstractCellLocator) {.importcpp: "ShallowCopy",
    header: "vtkStaticCellLocator.h".}