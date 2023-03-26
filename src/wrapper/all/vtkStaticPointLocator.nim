## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkStaticPointLocator.h
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
##  @class   vtkStaticPointLocator
##  @brief   quickly locate points in 3-space
##
##  vtkStaticPointLocator is a spatial search object to quickly locate points
##  in 3D.  vtkStaticPointLocator works by dividing a specified region of
##  space into a regular array of cuboid buckets, and then keeping a
##  list of points that lie in each bucket. Typical operation involves giving
##  a position in 3D and finding the closest point; or finding the N closest
##  points.
##
##  vtkStaticPointLocator is an accelerated version of vtkPointLocator. It is
##  threaded (via vtkSMPTools), and supports one-time static construction
##  (i.e., incremental point insertion is not supported). If you need to
##  incrementally insert points, use the vtkPointLocator or its kin to do so.
##
##  @warning
##  This class is templated. It may run slower than serial execution if the code
##  is not optimized during compilation. Build in Release or ReleaseWithDebugInfo.
##
##  @warning
##  Make sure that you review the documentation for the superclasses
##  vtkAbstactPointLocator and vtkLocator. In particular the Automatic
##  data member can be used to automatically determine divisions based
##  on the average number of points per bucket.
##
##  @warning
##  Other types of spatial locators have been developed such as octrees and
##  kd-trees. These are often more efficient for the operations described
##  here.
##
##  @warning
##  Frequently vtkStaticPointLocator is used in lieu of vtkPointLocator.
##  They are very similar in terms of algorithmic approach, however
##  vtkStaticCellLocator is threaded and is typically much faster for
##  a large number of points (on the order of 3-5x faster). For small numbers
##  of points, vtkPointLocator is just as fast as vtkStaticPointLocator.
##
##  @sa
##  vtkPointLocator vtkCellLocator vtkLocator vtkAbstractPointLocator
##

import
  vtkAbstractPointLocator, vtkCommonDataModelModule

discard "forward decl of vtkIdList"
discard "forward decl of vtkBucketList"
discard "forward decl of vtkDataArray"
type
  vtkStaticPointLocator* {.importcpp: "vtkStaticPointLocator",
                          header: "vtkStaticPointLocator.h", bycopy.} = object of vtkAbstractPointLocator ## *
                                                                                                   ##  Construct with automatic computation of divisions, averaging
                                                                                                   ##  5 points per bucket.
                                                                                                   ##
    vtkStaticPointLocator* {.importc: "vtkStaticPointLocator".}: VTK_NEWINSTANCE
    ##  Used with AutomaticOn to control subdivide
    ##  Number of sub-divisions in x-y-z directions
    ##  Width of each bucket in x-y-z directions
    ##  Lists of point ids in each bucket
    ##  Maximum number of buckets in locator
    ##  indicate whether integer ids are small or large
    ##  Control traversal order when threading


proc New*(): ptr vtkStaticPointLocator {.importcpp: "vtkStaticPointLocator::New(@)",
                                     header: "vtkStaticPointLocator.h".}
type
  vtkStaticPointLocatorSuperclass* = vtkAbstractPointLocator

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkStaticPointLocator::IsTypeOf(@)",
    header: "vtkStaticPointLocator.h".}
proc IsA*(this: var vtkStaticPointLocator; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkStaticPointLocator.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkStaticPointLocator {.
    importcpp: "vtkStaticPointLocator::SafeDownCast(@)",
    header: "vtkStaticPointLocator.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkStaticPointLocator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractPointLocator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkStaticPointLocator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkStaticPointLocator :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkStaticPointLocator; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkStaticPointLocator.h".}
proc SetNumberOfPointsPerBucket*(this: var vtkStaticPointLocator; _arg: cint) {.
    importcpp: "SetNumberOfPointsPerBucket", header: "vtkStaticPointLocator.h".}
proc GetNumberOfPointsPerBucketMinValue*(this: var vtkStaticPointLocator): cint {.
    importcpp: "GetNumberOfPointsPerBucketMinValue",
    header: "vtkStaticPointLocator.h".}
proc GetNumberOfPointsPerBucketMaxValue*(this: var vtkStaticPointLocator): cint {.
    importcpp: "GetNumberOfPointsPerBucketMaxValue",
    header: "vtkStaticPointLocator.h".}
## !!!Ignored construct:  virtual int GetNumberOfPointsPerBucket ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfPointsPerBucket  of  << this -> NumberOfPointsPerBucket ) ; return this -> NumberOfPointsPerBucket ; } ;
## Error: expected ';'!!!

proc SetDivisions*(this: var vtkStaticPointLocator; _arg1: cint; _arg2: cint;
                  _arg3: cint) {.importcpp: "SetDivisions",
                               header: "vtkStaticPointLocator.h".}
proc SetDivisions*(this: var vtkStaticPointLocator; _arg: array[3, cint]) {.
    importcpp: "SetDivisions", header: "vtkStaticPointLocator.h".}
## !!!Ignored construct:  virtual int * GetDivisions ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Divisions  pointer  << this -> Divisions ) ; return this -> Divisions ; } VTK_WRAPEXCLUDE virtual void GetDivisions ( int data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Divisions [ i ] ; } } ;
## Error: expected ';'!!!

## using statement

## using statement

## using statement

## using statement

proc FindClosestPoint*(this: var vtkStaticPointLocator; x: array[3, cdouble]): vtkIdType {.
    importcpp: "FindClosestPoint", header: "vtkStaticPointLocator.h".}
proc FindClosestPointWithinRadius*(this: var vtkStaticPointLocator; radius: cdouble;
                                  x: array[3, cdouble]; dist2: var cdouble): vtkIdType {.
    importcpp: "FindClosestPointWithinRadius", header: "vtkStaticPointLocator.h".}
proc FindClosestPointWithinRadius*(this: var vtkStaticPointLocator; radius: cdouble;
                                  x: array[3, cdouble]; inputDataLength: cdouble;
                                  dist2: var cdouble): vtkIdType {.
    importcpp: "FindClosestPointWithinRadius", header: "vtkStaticPointLocator.h".}
proc FindClosestNPoints*(this: var vtkStaticPointLocator; N: cint;
                        x: array[3, cdouble]; result: ptr vtkIdList) {.
    importcpp: "FindClosestNPoints", header: "vtkStaticPointLocator.h".}
proc FindPointsWithinRadius*(this: var vtkStaticPointLocator; R: cdouble;
                            x: array[3, cdouble]; result: ptr vtkIdList) {.
    importcpp: "FindPointsWithinRadius", header: "vtkStaticPointLocator.h".}
proc IntersectWithLine*(this: var vtkStaticPointLocator; a0: array[3, cdouble];
                       a1: array[3, cdouble]; tol: cdouble; t: var cdouble;
                       lineX: array[3, cdouble]; ptX: array[3, cdouble];
                       ptId: var vtkIdType): cint {.importcpp: "IntersectWithLine",
    header: "vtkStaticPointLocator.h".}
proc MergePoints*(this: var vtkStaticPointLocator; tol: cdouble;
                 mergeMap: ptr vtkIdType) {.importcpp: "MergePoints",
    header: "vtkStaticPointLocator.h".}
proc MergePointsWithData*(this: var vtkStaticPointLocator; data: ptr vtkDataArray;
                         mergeMap: ptr vtkIdType) {.
    importcpp: "MergePointsWithData", header: "vtkStaticPointLocator.h".}
proc Initialize*(this: var vtkStaticPointLocator) {.importcpp: "Initialize",
    header: "vtkStaticPointLocator.h".}
proc FreeSearchStructure*(this: var vtkStaticPointLocator) {.
    importcpp: "FreeSearchStructure", header: "vtkStaticPointLocator.h".}
proc BuildLocator*(this: var vtkStaticPointLocator) {.importcpp: "BuildLocator",
    header: "vtkStaticPointLocator.h".}
proc ForceBuildLocator*(this: var vtkStaticPointLocator) {.
    importcpp: "ForceBuildLocator", header: "vtkStaticPointLocator.h".}
proc BuildLocator*(this: var vtkStaticPointLocator; inBounds: ptr cdouble) {.
    importcpp: "BuildLocator", header: "vtkStaticPointLocator.h".}
proc GenerateRepresentation*(this: var vtkStaticPointLocator; level: cint;
                            pd: ptr vtkPolyData) {.
    importcpp: "GenerateRepresentation", header: "vtkStaticPointLocator.h".}
proc GetNumberOfPointsInBucket*(this: var vtkStaticPointLocator; bNum: vtkIdType): vtkIdType {.
    importcpp: "GetNumberOfPointsInBucket", header: "vtkStaticPointLocator.h".}
proc GetBucketIds*(this: var vtkStaticPointLocator; bNum: vtkIdType;
                  bList: ptr vtkIdList) {.importcpp: "GetBucketIds",
                                       header: "vtkStaticPointLocator.h".}
proc SetNumberOfPointsPerBucketMaxNumberOfBuckets*(
    this: var vtkStaticPointLocator; _arg: vtkIdType) {.
    importcpp: "SetNumberOfPointsPerBucketMaxNumberOfBuckets",
    header: "vtkStaticPointLocator.h".}
proc GetNumberOfPointsPerBucketMinValueMaxNumberOfBucketsMinValue*(
    this: var vtkStaticPointLocator): vtkIdType {.
    importcpp: "GetNumberOfPointsPerBucketMinValueMaxNumberOfBucketsMinValue",
    header: "vtkStaticPointLocator.h".}
proc GetNumberOfPointsPerBucketMaxValueMaxNumberOfBucketsMaxValue*(
    this: var vtkStaticPointLocator): vtkIdType {.
    importcpp: "GetNumberOfPointsPerBucketMaxValueMaxNumberOfBucketsMaxValue",
    header: "vtkStaticPointLocator.h".}
## !!!Ignored construct:  virtual vtkIdType GetNumberOfPointsPerBucketMaxNumberOfBuckets ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaxNumberOfBuckets  of  << this -> MaxNumberOfBuckets ) ; return this -> MaxNumberOfBuckets ; } ;
## Error: expected ';'!!!

proc GetLargeIds*(this: var vtkStaticPointLocator): bool {.importcpp: "GetLargeIds",
    header: "vtkStaticPointLocator.h".}
proc GetSpacing*(this: var vtkStaticPointLocator): ptr cdouble {.
    importcpp: "GetSpacing", header: "vtkStaticPointLocator.h".}
proc GetSpacing*(this: var vtkStaticPointLocator; spacing: array[3, cdouble]) {.
    importcpp: "GetSpacing", header: "vtkStaticPointLocator.h".}
type
  vtkStaticPointLocatorTraversalOrderType* {.size: sizeof(cint),
      importcpp: "vtkStaticPointLocator::TraversalOrderType",
      header: "vtkStaticPointLocator.h".} = enum
    POINT_ORDER = 0, BIN_ORDER = 1


proc SetNumberOfPointsPerBucketMaxNumberOfBucketsTraversalOrder*(
    this: var vtkStaticPointLocator; _arg: cint) {.
    importcpp: "SetNumberOfPointsPerBucketMaxNumberOfBucketsTraversalOrder",
    header: "vtkStaticPointLocator.h".}
proc GetNumberOfPointsPerBucketMinValueMaxNumberOfBucketsMinValueTraversalOrderMinValue*(
    this: var vtkStaticPointLocator): cint {.importcpp: "GetNumberOfPointsPerBucketMinValueMaxNumberOfBucketsMinValueTraversalOrderMinValue",
    header: "vtkStaticPointLocator.h".}
proc GetNumberOfPointsPerBucketMaxValueMaxNumberOfBucketsMaxValueTraversalOrderMaxValue*(
    this: var vtkStaticPointLocator): cint {.importcpp: "GetNumberOfPointsPerBucketMaxValueMaxNumberOfBucketsMaxValueTraversalOrderMaxValue",
    header: "vtkStaticPointLocator.h".}
## !!!Ignored construct:  virtual int GetNumberOfPointsPerBucketMaxNumberOfBucketsTraversalOrder ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TraversalOrder  of  << this -> TraversalOrder ) ; return this -> TraversalOrder ; } ;
## Error: expected ';'!!!

proc SetTraversalOrderToPointOrder*(this: var vtkStaticPointLocator) {.
    importcpp: "SetTraversalOrderToPointOrder", header: "vtkStaticPointLocator.h".}
proc SetTraversalOrderToBinOrder*(this: var vtkStaticPointLocator) {.
    importcpp: "SetTraversalOrderToBinOrder", header: "vtkStaticPointLocator.h".}