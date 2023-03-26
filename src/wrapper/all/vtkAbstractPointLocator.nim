## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAbstractPointLocator.h
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
##  @class   vtkAbstractPointLocator
##  @brief   abstract class to quickly locate points in 3-space
##
##  vtkAbstractPointLocator is an abstract spatial search object to quickly locate points
##  in 3D. vtkAbstractPointLocator works by dividing a specified region of space into
##  "rectangular" buckets, and then keeping a list of points that
##  lie in each bucket. Typical operation involves giving a position in 3D
##  and finding the closest point.  The points are provided from the specified
##  dataset input.
##
##  @sa
##  vtkPointLocator vtkStaticPointLocator vtkMergePoints
##

import
  vtkCommonDataModelModule, vtkLocator

discard "forward decl of vtkIdList"
type
  vtkAbstractPointLocator* {.importcpp: "vtkAbstractPointLocator",
                            header: "vtkAbstractPointLocator.h", bycopy.} = object of vtkLocator ## /@{
                                                                                          ## *
                                                                                          ##  Standard type and print methods.
                                                                                          ##
    vtkAbstractPointLocator* {.importc: "vtkAbstractPointLocator".}: VTK_NEWINSTANCE
    ##  bounds of points
    ##  total size of locator

  vtkAbstractPointLocatorSuperclass* = vtkLocator

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAbstractPointLocator::IsTypeOf(@)",
    header: "vtkAbstractPointLocator.h".}
proc IsA*(this: var vtkAbstractPointLocator; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkAbstractPointLocator.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAbstractPointLocator {.
    importcpp: "vtkAbstractPointLocator::SafeDownCast(@)",
    header: "vtkAbstractPointLocator.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAbstractPointLocator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkLocator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAbstractPointLocator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAbstractPointLocator :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAbstractPointLocator; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkAbstractPointLocator.h".}
proc FindClosestPoint*(this: var vtkAbstractPointLocator; x: array[3, cdouble]): vtkIdType {.
    importcpp: "FindClosestPoint", header: "vtkAbstractPointLocator.h".}
proc FindClosestPoint*(this: var vtkAbstractPointLocator; x: cdouble; y: cdouble;
                      z: cdouble): vtkIdType {.importcpp: "FindClosestPoint",
    header: "vtkAbstractPointLocator.h".}
proc FindClosestPointWithinRadius*(this: var vtkAbstractPointLocator;
                                  radius: cdouble; x: array[3, cdouble];
                                  dist2: var cdouble): vtkIdType {.
    importcpp: "FindClosestPointWithinRadius", header: "vtkAbstractPointLocator.h".}
proc FindClosestNPoints*(this: var vtkAbstractPointLocator; N: cint;
                        x: array[3, cdouble]; result: ptr vtkIdList) {.
    importcpp: "FindClosestNPoints", header: "vtkAbstractPointLocator.h".}
proc FindClosestNPoints*(this: var vtkAbstractPointLocator; N: cint; x: cdouble;
                        y: cdouble; z: cdouble; result: ptr vtkIdList) {.
    importcpp: "FindClosestNPoints", header: "vtkAbstractPointLocator.h".}
proc FindPointsWithinRadius*(this: var vtkAbstractPointLocator; R: cdouble;
                            x: array[3, cdouble]; result: ptr vtkIdList) {.
    importcpp: "FindPointsWithinRadius", header: "vtkAbstractPointLocator.h".}
proc FindPointsWithinRadius*(this: var vtkAbstractPointLocator; R: cdouble;
                            x: cdouble; y: cdouble; z: cdouble; result: ptr vtkIdList) {.
    importcpp: "FindPointsWithinRadius", header: "vtkAbstractPointLocator.h".}
proc GetBounds*(this: var vtkAbstractPointLocator): ptr cdouble {.
    importcpp: "GetBounds", header: "vtkAbstractPointLocator.h".}
proc GetBounds*(this: var vtkAbstractPointLocator; a2: ptr cdouble) {.
    importcpp: "GetBounds", header: "vtkAbstractPointLocator.h".}
## !!!Ignored construct:  /@} /@{ *
##  Return the total number of buckets in the locator. This has meaning only
##  after the locator is constructed.
##  virtual vtkIdType GetNumberOfBucketsNumberOfBuckets ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfBuckets  of  << this -> NumberOfBuckets ) ; return this -> NumberOfBuckets ; } ;
## Error: expected ';'!!!
