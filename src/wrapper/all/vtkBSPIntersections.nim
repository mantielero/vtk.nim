## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBSPIntersections.h
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
##  @class   vtkBSPIntersections
##  @brief   Perform calculations (mostly intersection
##    calculations) on regions of a 3D binary spatial partitioning.
##
##
##     Given an axis aligned binary spatial partitioning described by a
##     vtkBSPCuts object, perform intersection queries on various
##     geometric entities with regions of the spatial partitioning.
##
##  @sa
##     vtkBSPCuts  vtkKdTree
##

import
  vtkCommonDataModelModule, vtkObject

discard "forward decl of vtkTimeStamp"
discard "forward decl of vtkCell"
discard "forward decl of vtkKdNode"
discard "forward decl of vtkBSPCuts"
type
  vtkBSPIntersections* {.importcpp: "vtkBSPIntersections",
                        header: "vtkBSPIntersections.h", bycopy.} = object of vtkObject
    vtkBSPIntersections* {.importc: "vtkBSPIntersections".}: VTK_NEWINSTANCE
    ##  to speed cell intersection queries

  vtkBSPIntersectionsSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkBSPIntersections::IsTypeOf(@)", header: "vtkBSPIntersections.h".}
proc IsA*(this: var vtkBSPIntersections; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkBSPIntersections.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkBSPIntersections {.
    importcpp: "vtkBSPIntersections::SafeDownCast(@)",
    header: "vtkBSPIntersections.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkBSPIntersections :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBSPIntersections :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBSPIntersections :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkBSPIntersections; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkBSPIntersections.h".}
proc New*(): ptr vtkBSPIntersections {.importcpp: "vtkBSPIntersections::New(@)",
                                   header: "vtkBSPIntersections.h".}
proc SetCuts*(this: var vtkBSPIntersections; cuts: ptr vtkBSPCuts) {.
    importcpp: "SetCuts", header: "vtkBSPIntersections.h".}
proc GetnameCuts*(this: var vtkBSPIntersections): ptr vtkBSPCuts {.
    importcpp: "GetnameCuts", header: "vtkBSPIntersections.h".}
  ## *
  ##  Get the bounds of the whole space (xmin, xmax, ymin, ymax, zmin, zmax)
  ##  Return 0 if OK, 1 on error.
  ##
proc GetBounds*(this: var vtkBSPIntersections; bounds: ptr cdouble): cint {.
    importcpp: "GetBounds", header: "vtkBSPIntersections.h".}
proc GetNumberOfRegions*(this: var vtkBSPIntersections): cint {.
    importcpp: "GetNumberOfRegions", header: "vtkBSPIntersections.h".}
proc GetRegionBounds*(this: var vtkBSPIntersections; regionID: cint;
                     bounds: array[6, cdouble]): cint {.
    importcpp: "GetRegionBounds", header: "vtkBSPIntersections.h".}
proc GetRegionDataBounds*(this: var vtkBSPIntersections; regionID: cint;
                         bounds: array[6, cdouble]): cint {.
    importcpp: "GetRegionDataBounds", header: "vtkBSPIntersections.h".}
proc IntersectsBox*(this: var vtkBSPIntersections; regionId: cint; x: ptr cdouble): cint {.
    importcpp: "IntersectsBox", header: "vtkBSPIntersections.h".}
proc IntersectsBox*(this: var vtkBSPIntersections; regionId: cint; x0: cdouble;
                   x1: cdouble; y0: cdouble; y1: cdouble; z0: cdouble; z1: cdouble): cint {.
    importcpp: "IntersectsBox", header: "vtkBSPIntersections.h".}
proc IntersectsBox*(this: var vtkBSPIntersections; ids: ptr cint; len: cint;
                   x: ptr cdouble): cint {.importcpp: "IntersectsBox",
                                       header: "vtkBSPIntersections.h".}
proc IntersectsBox*(this: var vtkBSPIntersections; ids: ptr cint; len: cint; x0: cdouble;
                   x1: cdouble; y0: cdouble; y1: cdouble; z0: cdouble; z1: cdouble): cint {.
    importcpp: "IntersectsBox", header: "vtkBSPIntersections.h".}
proc IntersectsSphere2*(this: var vtkBSPIntersections; regionId: cint; x: cdouble;
                       y: cdouble; z: cdouble; rSquared: cdouble): cint {.
    importcpp: "IntersectsSphere2", header: "vtkBSPIntersections.h".}
proc IntersectsSphere2*(this: var vtkBSPIntersections; ids: ptr cint; len: cint;
                       x: cdouble; y: cdouble; z: cdouble; rSquared: cdouble): cint {.
    importcpp: "IntersectsSphere2", header: "vtkBSPIntersections.h".}
proc IntersectsCell*(this: var vtkBSPIntersections; regionId: cint; cell: ptr vtkCell;
                    cellRegion: cint = -1): cint {.importcpp: "IntersectsCell",
    header: "vtkBSPIntersections.h".}
proc IntersectsCell*(this: var vtkBSPIntersections; ids: ptr cint; len: cint;
                    cell: ptr vtkCell; cellRegion: cint = -1): cint {.
    importcpp: "IntersectsCell", header: "vtkBSPIntersections.h".}
## !!!Ignored construct:  *
##  When computing the intersection of k-d tree regions with other
##  objects, we use the spatial bounds of the region.  To use the
##  tighter bound of the bounding box of the data within the region,
##  set this variable ON.  (Specifying data bounds in the vtkBSPCuts
##  object is optional.  If data bounds were not specified, this
##  option has no meaning.)
##  virtual int GetComputeIntersectionsUsingDataBoundsComputeIntersectionsUsingDataBounds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeIntersectionsUsingDataBounds  of  << this -> ComputeIntersectionsUsingDataBounds ) ; return this -> ComputeIntersectionsUsingDataBounds ; } ;
## Error: expected ';'!!!

proc SetComputeIntersectionsUsingDataBounds*(this: var vtkBSPIntersections; c: cint) {.
    importcpp: "SetComputeIntersectionsUsingDataBounds",
    header: "vtkBSPIntersections.h".}
proc ComputeIntersectionsUsingDataBoundsOn*(this: var vtkBSPIntersections) {.
    importcpp: "ComputeIntersectionsUsingDataBoundsOn",
    header: "vtkBSPIntersections.h".}
proc ComputeIntersectionsUsingDataBoundsOff*(this: var vtkBSPIntersections) {.
    importcpp: "ComputeIntersectionsUsingDataBoundsOff",
    header: "vtkBSPIntersections.h".}
## !!!Ignored construct:  virtual vtkMTimeType GetComputeIntersectionsUsingDataBoundsComputeIntersectionsUsingDataBoundsRegionListBuildTime ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RegionListBuildTime  of  << this -> RegionListBuildTime ) ; return this -> RegionListBuildTime ; } ;
## Error: expected ';'!!!
