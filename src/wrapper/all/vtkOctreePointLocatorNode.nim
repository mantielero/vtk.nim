## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOctreePointLocatorNode.h
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
##  @class   vtkOctreePointLocatorNode
##  @brief   Octree node that has 8 children each of equal size
##
##
##  This class represents a single spatial region in a 3D axis octant
##  partitioning.  It is intended to work efficiently with the
##  vtkOctreePointLocator and is not meant for general use.  It is assumed
##  the region bounds some set of points.  The ordering of the children is
##  (-x,-y,-z),(+x,-y,-z),(-x,+y,-z),(+x,+y,-z),(-x,-y,+z),(+x,-y,+z),
##  (-x,+y,+z),(+x,+y,+z).  The portion of the domain assigned to an
##  octant is Min < x <= Max.
##
##  @sa
##  vtkOctreePointLocator
##

import
  vtkCommonDataModelModule, vtkObject

discard "forward decl of vtkCell"
discard "forward decl of vtkPlanesIntersection"
type
  vtkOctreePointLocatorNode* {.importcpp: "vtkOctreePointLocatorNode",
                              header: "vtkOctreePointLocatorNode.h", bycopy.} = object of vtkObject
    vtkOctreePointLocatorNode* {.importc: "vtkOctreePointLocatorNode".}: VTK_NEWINSTANCE
    double* {.importc: "double".}: VTK_FUTURE_CONST
    double* {.importc: "double".}: VTK_FUTURE_CONST
    double* {.importc: "double".}: VTK_FUTURE_CONST
    double* {.importc: "double".}: VTK_FUTURE_CONST
    ## *
    ##  The maximum coordinate location of the node.
    ##
    ## *
    ##  The minimum coordinate location of the points contained
    ##  within this node.
    ##
    ## *
    ##  The maximum coordinate location of the points contained
    ##  within this node.
    ##
    ## *
    ##  Get the number of points associated with this octant.
    ##  The octant does not have to be a leaf octant.  For example,
    ##  for the root octant NumberOfPoints is equal to the number
    ##  of points in the dataset.
    ##
    ## *
    ##  A pointer to the 8 children of this node.
    ##
    ## *
    ##  The ID of this octant.  If it is not a leaf octant then ID=-1.
    ##
    ## *
    ##  The minimum Id of the ordered points in this octant (note that
    ##  this Id is different than the vtkIdType used for referencing
    ##  the point in the data set.
    ##

  vtkOctreePointLocatorNodeSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOctreePointLocatorNode::IsTypeOf(@)",
    header: "vtkOctreePointLocatorNode.h".}
proc IsA*(this: var vtkOctreePointLocatorNode; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkOctreePointLocatorNode.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOctreePointLocatorNode {.
    importcpp: "vtkOctreePointLocatorNode::SafeDownCast(@)",
    header: "vtkOctreePointLocatorNode.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOctreePointLocatorNode :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOctreePointLocatorNode :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOctreePointLocatorNode :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkOctreePointLocatorNode; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkOctreePointLocatorNode.h".}
proc New*(): ptr vtkOctreePointLocatorNode {.
    importcpp: "vtkOctreePointLocatorNode::New(@)",
    header: "vtkOctreePointLocatorNode.h".}
proc SetNumberOfPoints*(this: var vtkOctreePointLocatorNode; numberOfPoints: cint) {.
    importcpp: "SetNumberOfPoints", header: "vtkOctreePointLocatorNode.h".}
## !!!Ignored construct:  virtual int GetNumberOfPoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfPoints  of  << this -> NumberOfPoints ) ; return this -> NumberOfPoints ; } ;
## Error: expected ';'!!!

proc SetBounds*(this: var vtkOctreePointLocatorNode; xMin: cdouble; xMax: cdouble;
               yMin: cdouble; yMax: cdouble; zMin: cdouble; zMax: cdouble) {.
    importcpp: "SetBounds", header: "vtkOctreePointLocatorNode.h".}
proc SetBounds*(this: var vtkOctreePointLocatorNode; b: array[6, cdouble]) {.
    importcpp: "SetBounds", header: "vtkOctreePointLocatorNode.h".}
proc GetBounds*(this: vtkOctreePointLocatorNode; b: ptr cdouble) {.noSideEffect,
    importcpp: "GetBounds", header: "vtkOctreePointLocatorNode.h".}
proc SetDataBounds*(this: var vtkOctreePointLocatorNode; xMin: cdouble; xMax: cdouble;
                   yMin: cdouble; yMax: cdouble; zMin: cdouble; zMax: cdouble) {.
    importcpp: "SetDataBounds", header: "vtkOctreePointLocatorNode.h".}
proc GetDataBounds*(this: vtkOctreePointLocatorNode; b: ptr cdouble) {.noSideEffect,
    importcpp: "GetDataBounds", header: "vtkOctreePointLocatorNode.h".}
## !!!Ignored construct:  * GetNumberOfPointsMinBounds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MinBounds  of  << this -> MinBounds ) ; return this -> MinBounds ; } ;
## Error: identifier expected, but got: *!!!

## !!!Ignored construct:  * GetNumberOfPointsMinBoundsMaxBounds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaxBounds  of  << this -> MaxBounds ) ; return this -> MaxBounds ; } ;
## Error: identifier expected, but got: *!!!

proc SetMinBounds*(this: var vtkOctreePointLocatorNode; minBounds: array[3, cdouble]) {.
    importcpp: "SetMinBounds", header: "vtkOctreePointLocatorNode.h".}
proc SetMaxBounds*(this: var vtkOctreePointLocatorNode; maxBounds: array[3, cdouble]) {.
    importcpp: "SetMaxBounds", header: "vtkOctreePointLocatorNode.h".}
## !!!Ignored construct:  * GetNumberOfPointsMinBoundsMaxBoundsMinDataBounds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MinDataBounds  of  << this -> MinDataBounds ) ; return this -> MinDataBounds ; } ;
## Error: identifier expected, but got: *!!!

## !!!Ignored construct:  * GetNumberOfPointsMinBoundsMaxBoundsMinDataBoundsMaxDataBounds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaxDataBounds  of  << this -> MaxDataBounds ) ; return this -> MaxDataBounds ; } ;
## Error: identifier expected, but got: *!!!

## !!!Ignored construct:  /@} /@{ *
##  Set the xmin, ymin and zmin value of the bounds of this
##  data within this region.
##  void SetMinDataBounds ( VTK_FUTURE_CONST double minDataBounds [ 3 ] ) { this -> MinDataBounds [ 0 ] = minDataBounds [ 0 ] ; this -> MinDataBounds [ 1 ] = minDataBounds [ 1 ] ; this -> MinDataBounds [ 2 ] = minDataBounds [ 2 ] ; } /@} /@{ *
##  Set the xmax, ymax and zmax value of the bounds of this
##  data within this region.
##  void SetMaxDataBounds ( VTK_FUTURE_CONST double maxDataBounds [ 3 ] ) { this -> MaxDataBounds [ 0 ] = maxDataBounds [ 0 ] ; this -> MaxDataBounds [ 1 ] = maxDataBounds [ 1 ] ; this -> MaxDataBounds [ 2 ] = maxDataBounds [ 2 ] ; } /@} /@{ *
##  Get the ID associated with the region described by this node.  If
##  this is not a leaf node, this value should be -1.
##  virtual int GetNumberOfPointsMinBoundsMaxBoundsMinDataBoundsMaxDataBoundsID ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ID  of  << this -> ID ) ; return this -> ID ; } ;
## Error: token expected: ) but got: [identifier]!!!

## !!!Ignored construct:  /@} /@{ *
##  If this node is not a leaf node, there are leaf nodes below it whose
##  regions represent a partitioning of this region.  The IDs of these
##  leaf nodes form a contiguous set.  Get the first of the first point's
##  ID that is contained in this node.
##  virtual int GetNumberOfPointsMinBoundsMaxBoundsMinDataBoundsMaxDataBoundsIDMinIDMinID ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MinID  of  << this -> MinID ) ; return this -> MinID ; } ;
## Error: expected ';'!!!

proc CreateChildNodes*(this: var vtkOctreePointLocatorNode) {.
    importcpp: "CreateChildNodes", header: "vtkOctreePointLocatorNode.h".}
proc DeleteChildNodes*(this: var vtkOctreePointLocatorNode) {.
    importcpp: "DeleteChildNodes", header: "vtkOctreePointLocatorNode.h".}
proc GetChild*(this: var vtkOctreePointLocatorNode; i: cint): ptr vtkOctreePointLocatorNode {.
    importcpp: "GetChild", header: "vtkOctreePointLocatorNode.h".}
proc IntersectsRegion*(this: var vtkOctreePointLocatorNode;
                      pi: ptr vtkPlanesIntersection; useDataBounds: cint): cint {.
    importcpp: "IntersectsRegion", header: "vtkOctreePointLocatorNode.h".}
proc ContainsPoint*(this: var vtkOctreePointLocatorNode; x: cdouble; y: cdouble;
                   z: cdouble; useDataBounds: cint): vtkTypeBool {.
    importcpp: "ContainsPoint", header: "vtkOctreePointLocatorNode.h".}
proc GetDistance2ToBoundary*(this: var vtkOctreePointLocatorNode; x: cdouble;
                            y: cdouble; z: cdouble;
                            top: ptr vtkOctreePointLocatorNode; useDataBounds: cint): cdouble {.
    importcpp: "GetDistance2ToBoundary", header: "vtkOctreePointLocatorNode.h".}
proc GetDistance2ToBoundary*(this: var vtkOctreePointLocatorNode; x: cdouble;
                            y: cdouble; z: cdouble; boundaryPt: ptr cdouble;
                            top: ptr vtkOctreePointLocatorNode; useDataBounds: cint): cdouble {.
    importcpp: "GetDistance2ToBoundary", header: "vtkOctreePointLocatorNode.h".}
proc GetDistance2ToInnerBoundary*(this: var vtkOctreePointLocatorNode; x: cdouble;
                                 y: cdouble; z: cdouble;
                                 top: ptr vtkOctreePointLocatorNode): cdouble {.
    importcpp: "GetDistance2ToInnerBoundary",
    header: "vtkOctreePointLocatorNode.h".}
proc GetSubOctantIndex*(this: var vtkOctreePointLocatorNode; point: ptr cdouble;
                       CheckContainment: cint): cint {.
    importcpp: "GetSubOctantIndex", header: "vtkOctreePointLocatorNode.h".}
proc ComputeOctreeNodeInformation*(this: var vtkOctreePointLocatorNode;
                                  Parent: ptr vtkOctreePointLocatorNode;
                                  NextLeafId: var cint; NextMinId: var cint;
                                  coordinates: ptr cfloat) {.
    importcpp: "ComputeOctreeNodeInformation",
    header: "vtkOctreePointLocatorNode.h".}