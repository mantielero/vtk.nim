## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPointLocator.h
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
##  @class   vtkPointLocator
##  @brief   quickly locate points in 3-space
##
##  vtkPointLocator is a spatial search object to quickly locate points in 3D.
##  vtkPointLocator works by dividing a specified region of space into a regular
##  array of "rectangular" buckets, and then keeping a list of points that
##  lie in each bucket. Typical operation involves giving a position in 3D
##  and finding the closest point.
##
##  vtkPointLocator has two distinct methods of interaction. In the first
##  method, you supply it with a dataset, and it operates on the points in
##  the dataset. In the second method, you supply it with an array of points,
##  and the object operates on the array.
##
##  @warning
##  Many other types of spatial locators have been developed such as
##  octrees and kd-trees. These are often more efficient for the
##  operations described here.
##
##  @warning
##  Frequently vtkStaticPointLocator is used in lieu of vtkPointLocator.
##  They are very similar in terms of algorithmic approach, however
##  vtkStaticCellLocator is threaded and is typically much faster for
##  a large number of points (on the order of 3-5x faster). For small numbers
##  of points, vtkPointLocator is just as fast as vtkStaticPointLocator.
##
##  @sa
##  vtkCellPicker vtkPointPicker vtkStaticPointLocator
##

import
  vtkCommonDataModelModule, vtkIncrementalPointLocator

discard "forward decl of vtkCellArray"
discard "forward decl of vtkIdList"
discard "forward decl of vtkNeighborPoints"
discard "forward decl of vtkPoints"
type
  vtkPointLocator* {.importcpp: "vtkPointLocator", header: "vtkPointLocator.h",
                    bycopy.} = object of vtkIncrementalPointLocator ## *
                                                               ##  Construct with automatic computation of divisions, averaging
                                                               ##  25 points per bucket.
                                                               ##
    vtkPointLocator* {.importc: "vtkPointLocator".}: VTK_NEWINSTANCE
    ##  Used for merging points
    ##  Number of sub-divisions in x-y-z directions
    ##  Used with previous boolean to control subdivide
    ##  lists of point ids in buckets
    ##  width of each bucket in x-y-z directions
    ##  These are inlined methods and data members for performance reasons


proc New*(): ptr vtkPointLocator {.importcpp: "vtkPointLocator::New(@)",
                               header: "vtkPointLocator.h".}
type
  vtkPointLocatorSuperclass* = vtkIncrementalPointLocator

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPointLocator::IsTypeOf(@)", header: "vtkPointLocator.h".}
proc IsA*(this: var vtkPointLocator; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkPointLocator.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPointLocator {.
    importcpp: "vtkPointLocator::SafeDownCast(@)", header: "vtkPointLocator.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPointLocator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkIncrementalPointLocator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPointLocator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPointLocator :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPointLocator; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPointLocator.h".}
proc SetDivisions*(this: var vtkPointLocator; _arg1: cint; _arg2: cint; _arg3: cint) {.
    importcpp: "SetDivisions", header: "vtkPointLocator.h".}
proc SetDivisions*(this: var vtkPointLocator; _arg: array[3, cint]) {.
    importcpp: "SetDivisions", header: "vtkPointLocator.h".}
## !!!Ignored construct:  virtual int * GetDivisions ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Divisions  pointer  << this -> Divisions ) ; return this -> Divisions ; } VTK_WRAPEXCLUDE virtual void GetDivisions ( int data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Divisions [ i ] ; } } ;
## Error: expected ';'!!!

proc SetNumberOfPointsPerBucket*(this: var vtkPointLocator; _arg: cint) {.
    importcpp: "SetNumberOfPointsPerBucket", header: "vtkPointLocator.h".}
proc GetNumberOfPointsPerBucketMinValue*(this: var vtkPointLocator): cint {.
    importcpp: "GetNumberOfPointsPerBucketMinValue", header: "vtkPointLocator.h".}
proc GetNumberOfPointsPerBucketMaxValue*(this: var vtkPointLocator): cint {.
    importcpp: "GetNumberOfPointsPerBucketMaxValue", header: "vtkPointLocator.h".}
## !!!Ignored construct:  virtual int GetNumberOfPointsPerBucket ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfPointsPerBucket  of  << this -> NumberOfPointsPerBucket ) ; return this -> NumberOfPointsPerBucket ; } ;
## Error: expected ';'!!!

## using statement

proc FindClosestPoint*(this: var vtkPointLocator; x: array[3, cdouble]): vtkIdType {.
    importcpp: "FindClosestPoint", header: "vtkPointLocator.h".}
proc FindClosestPointWithinRadius*(this: var vtkPointLocator; radius: cdouble;
                                  x: array[3, cdouble]; dist2: var cdouble): vtkIdType {.
    importcpp: "FindClosestPointWithinRadius", header: "vtkPointLocator.h".}
proc FindClosestPointWithinRadius*(this: var vtkPointLocator; radius: cdouble;
                                  x: array[3, cdouble]; inputDataLength: cdouble;
                                  dist2: var cdouble): vtkIdType {.
    importcpp: "FindClosestPointWithinRadius", header: "vtkPointLocator.h".}
proc InitPointInsertion*(this: var vtkPointLocator; newPts: ptr vtkPoints;
                        bounds: array[6, cdouble]): cint {.
    importcpp: "InitPointInsertion", header: "vtkPointLocator.h".}
proc InitPointInsertion*(this: var vtkPointLocator; newPts: ptr vtkPoints;
                        bounds: array[6, cdouble]; estNumPts: vtkIdType): cint {.
    importcpp: "InitPointInsertion", header: "vtkPointLocator.h".}
proc InsertPoint*(this: var vtkPointLocator; ptId: vtkIdType; x: array[3, cdouble]) {.
    importcpp: "InsertPoint", header: "vtkPointLocator.h".}
proc InsertNextPoint*(this: var vtkPointLocator; x: array[3, cdouble]): vtkIdType {.
    importcpp: "InsertNextPoint", header: "vtkPointLocator.h".}
proc IsInsertedPoint*(this: var vtkPointLocator; x: cdouble; y: cdouble; z: cdouble): vtkIdType {.
    importcpp: "IsInsertedPoint", header: "vtkPointLocator.h".}
proc IsInsertedPoint*(this: var vtkPointLocator; x: array[3, cdouble]): vtkIdType {.
    importcpp: "IsInsertedPoint", header: "vtkPointLocator.h".}
proc InsertUniquePoint*(this: var vtkPointLocator; x: array[3, cdouble];
                       ptId: var vtkIdType): cint {.importcpp: "InsertUniquePoint",
    header: "vtkPointLocator.h".}
proc FindClosestInsertedPoint*(this: var vtkPointLocator; x: array[3, cdouble]): vtkIdType {.
    importcpp: "FindClosestInsertedPoint", header: "vtkPointLocator.h".}
proc FindClosestNPoints*(this: var vtkPointLocator; N: cint; x: array[3, cdouble];
                        result: ptr vtkIdList) {.importcpp: "FindClosestNPoints",
    header: "vtkPointLocator.h".}
proc FindDistributedPoints*(this: var vtkPointLocator; N: cint; x: array[3, cdouble];
                           result: ptr vtkIdList; M: cint) {.
    importcpp: "FindDistributedPoints", header: "vtkPointLocator.h".}
proc FindDistributedPoints*(this: var vtkPointLocator; N: cint; x: cdouble; y: cdouble;
                           z: cdouble; result: ptr vtkIdList; M: cint) {.
    importcpp: "FindDistributedPoints", header: "vtkPointLocator.h".}
proc FindPointsWithinRadius*(this: var vtkPointLocator; R: cdouble;
                            x: array[3, cdouble]; result: ptr vtkIdList) {.
    importcpp: "FindPointsWithinRadius", header: "vtkPointLocator.h".}
proc GetPointsInBucket*(this: var vtkPointLocator; x: array[3, cdouble];
                       ijk: array[3, cint]): ptr vtkIdList {.
    importcpp: "GetPointsInBucket", header: "vtkPointLocator.h".}
proc GetnamePoints*(this: var vtkPointLocator): ptr vtkPoints {.
    importcpp: "GetnamePoints", header: "vtkPointLocator.h".}
  ## /@}
  ## /@{
  ## *
  ##  See vtkLocator interface documentation.
  ##  These methods are not thread safe.
  ##
proc Initialize*(this: var vtkPointLocator) {.importcpp: "Initialize",
    header: "vtkPointLocator.h".}
proc FreeSearchStructure*(this: var vtkPointLocator) {.
    importcpp: "FreeSearchStructure", header: "vtkPointLocator.h".}
proc BuildLocator*(this: var vtkPointLocator) {.importcpp: "BuildLocator",
    header: "vtkPointLocator.h".}
proc ForceBuildLocator*(this: var vtkPointLocator) {.importcpp: "ForceBuildLocator",
    header: "vtkPointLocator.h".}
proc GenerateRepresentation*(this: var vtkPointLocator; level: cint;
                            pd: ptr vtkPolyData) {.
    importcpp: "GenerateRepresentation", header: "vtkPointLocator.h".}