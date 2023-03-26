## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLocator.h
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
##  @class   vtkLocator
##  @brief   abstract base class for objects that accelerate spatial searches
##
##  vtkLocator is an abstract base class for spatial search objects, or
##  locators. The principle behind locators is that they divide 3-space into
##  small regions (or "buckets") that can be quickly found in response to
##  queries about point location, line intersection, or object-object
##  intersection.
##
##  The purpose of this base class is to provide data members and methods
##  shared by all locators. The GenerateRepresentation() is one such
##  interesting method.  This method works in conjunction with
##  vtkLocatorFilter to create polygonal representations for the locator. For
##  example, if the locator is an OBB tree (i.e., vtkOBBTree.h), then the
##  representation is a set of one or more oriented bounding boxes, depending
##  upon the specified level.
##
##  Locators typically work as follows. One or more "entities", such as points
##  or cells, are inserted into the locator structure. These entities are
##  associated with one or more buckets. Then, when performing geometric
##  operations, the operations are performed first on the buckets, and then if
##  the operation tests positive, then on the entities in the bucket. For
##  example, during collision tests, the locators are collided first to
##  identify intersecting buckets. If an intersection is found, more expensive
##  operations are then carried out on the entities in the bucket.
##
##  To obtain good performance, locators are often organized in a tree
##  structure.  In such a structure, there are frequently multiple "levels"
##  corresponding to different nodes in the tree. So the word level (in the
##  context of the locator) can be used to specify a particular representation
##  in the tree.  For example, in an octree (which is a tree with 8 children),
##  level 0 is the bounding box, or root octant, and level 1 consists of its
##  eight children.
##
##  @warning
##  There is a concept of static and incremental locators. Static locators are
##  constructed one time, and then support appropriate queries. Incremental
##  locators may have data inserted into them over time (e.g., adding new
##  points during the process of isocontouring).
##
##  @sa
##  vtkPointLocator vtkCellLocator vtkOBBTree vtkMergePoints
##

import
  vtkCommonDataModelModule, vtkObject

discard "forward decl of vtkDataSet"
discard "forward decl of vtkPolyData"
type
  vtkLocator* {.importcpp: "vtkLocator", header: "vtkLocator.h", bycopy.} = object of vtkObject ## /@{
                                                                                      ## *
                                                                                      ##  Standard type and print methods.
                                                                                      ##
    vtkLocator* {.importc: "vtkLocator".}: VTK_NEWINSTANCE
    ##  boolean controls automatic subdivision (or uses user spec.)
    ##  for performing merging
    ##  time at which locator was built

  vtkLocatorSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkLocator::IsTypeOf(@)",
    header: "vtkLocator.h".}
proc IsA*(this: var vtkLocator; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkLocator.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkLocator {.
    importcpp: "vtkLocator::SafeDownCast(@)", header: "vtkLocator.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkLocator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLocator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLocator :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkLocator; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkLocator.h".}
proc SetDataSet*(this: var vtkLocator; a2: ptr vtkDataSet) {.importcpp: "SetDataSet",
    header: "vtkLocator.h".}
proc GetnameDataSet*(this: var vtkLocator): ptr vtkDataSet {.
    importcpp: "GetnameDataSet", header: "vtkLocator.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set the maximum allowable level for the tree. If the Automatic ivar is
  ##  off, this will be the target depth of the locator.
  ##  Initial value is 8.
  ##
proc SetMaxLevel*(this: var vtkLocator; _arg: cint) {.importcpp: "SetMaxLevel",
    header: "vtkLocator.h".}
proc GetMaxLevelMinValue*(this: var vtkLocator): cint {.
    importcpp: "GetMaxLevelMinValue", header: "vtkLocator.h".}
proc GetMaxLevelMaxValue*(this: var vtkLocator): cint {.
    importcpp: "GetMaxLevelMaxValue", header: "vtkLocator.h".}
## !!!Ignored construct:  virtual int GetMaxLevel ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaxLevel  of  << this -> MaxLevel ) ; return this -> MaxLevel ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get the level of the locator (determined automatically if Automatic is
##  true). The value of this ivar may change each time the locator is built.
##  Initial value is 8.
##  virtual int GetMaxLevelLevelLevel ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Level  of  << this -> Level ) ; return this -> Level ; } ;
## Error: expected ';'!!!

proc SetAutomatic*(this: var vtkLocator; _arg: vtkTypeBool) {.
    importcpp: "SetAutomatic", header: "vtkLocator.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetMaxLevelLevelLevelAutomatic ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Automatic  of  << this -> Automatic ) ; return this -> Automatic ; } ;
## Error: expected ';'!!!

proc AutomaticOn*(this: var vtkLocator) {.importcpp: "AutomaticOn",
                                      header: "vtkLocator.h".}
proc AutomaticOff*(this: var vtkLocator) {.importcpp: "AutomaticOff",
                                       header: "vtkLocator.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify absolute tolerance (in world coordinates) for performing
  ##  geometric operations.
  ##
proc SetMaxLevelTolerance*(this: var vtkLocator; _arg: cdouble) {.
    importcpp: "SetMaxLevelTolerance", header: "vtkLocator.h".}
proc GetMaxLevelMinValueToleranceMinValue*(this: var vtkLocator): cdouble {.
    importcpp: "GetMaxLevelMinValueToleranceMinValue", header: "vtkLocator.h".}
proc GetMaxLevelMaxValueToleranceMaxValue*(this: var vtkLocator): cdouble {.
    importcpp: "GetMaxLevelMaxValueToleranceMaxValue", header: "vtkLocator.h".}
## !!!Ignored construct:  virtual double GetMaxLevelLevelLevelAutomaticTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tolerance  of  << this -> Tolerance ) ; return this -> Tolerance ; } ;
## Error: expected ';'!!!

proc SetAutomaticUseExistingSearchStructure*(this: var vtkLocator; _arg: vtkTypeBool) {.
    importcpp: "SetAutomaticUseExistingSearchStructure", header: "vtkLocator.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetMaxLevelLevelLevelAutomaticToleranceUseExistingSearchStructure ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseExistingSearchStructure  of  << this -> UseExistingSearchStructure ) ; return this -> UseExistingSearchStructure ; } ;
## Error: expected ';'!!!

proc UseExistingSearchStructureOn*(this: var vtkLocator) {.
    importcpp: "UseExistingSearchStructureOn", header: "vtkLocator.h".}
proc UseExistingSearchStructureOff*(this: var vtkLocator) {.
    importcpp: "UseExistingSearchStructureOff", header: "vtkLocator.h".}
  ## /@}
  ## *
  ##  Cause the locator to rebuild itself if it or its input dataset has
  ##  changed.
  ##
proc Update*(this: var vtkLocator) {.importcpp: "Update", header: "vtkLocator.h".}
proc Initialize*(this: var vtkLocator) {.importcpp: "Initialize",
                                     header: "vtkLocator.h".}
proc BuildLocator*(this: var vtkLocator) {.importcpp: "BuildLocator",
                                       header: "vtkLocator.h".}
proc ForceBuildLocator*(this: var vtkLocator) {.importcpp: "ForceBuildLocator",
    header: "vtkLocator.h".}
proc FreeSearchStructure*(this: var vtkLocator) {.importcpp: "FreeSearchStructure",
    header: "vtkLocator.h".}
proc GenerateRepresentation*(this: var vtkLocator; level: cint; pd: ptr vtkPolyData) {.
    importcpp: "GenerateRepresentation", header: "vtkLocator.h".}
## !!!Ignored construct:  /@{ *
##  Return the time of the last data structure build.
##  virtual vtkMTimeType GetMaxLevelLevelLevelAutomaticToleranceUseExistingSearchStructureBuildTimeBuildTime ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BuildTime  of  << this -> BuildTime ) ; return this -> BuildTime ; } ;
## Error: expected ';'!!!

proc UsesGarbageCollector*(this: vtkLocator): bool {.noSideEffect,
    importcpp: "UsesGarbageCollector", header: "vtkLocator.h".}