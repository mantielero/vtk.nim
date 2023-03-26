## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkKdNode.h
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
##  @class   vtkKdNode
##  @brief   This class represents a single spatial region
##      in an 3D axis aligned binary spatial partitioning.  It is assumed
##      the region bounds some set of points.  Regions are represented
##      as nodes in a binary tree.
##
##
##
##  @sa
##       vtkKdTree vtkOBSPCuts
##

import
  vtkCommonDataModelModule, vtkObject

discard "forward decl of vtkCell"
discard "forward decl of vtkPlanesIntersection"
type
  vtkKdNode* {.importcpp: "vtkKdNode", header: "vtkKdNode.h", bycopy.} = object of vtkObject
    vtkKdNode* {.importc: "vtkKdNode".}: VTK_NEWINSTANCE
    ##  spatial bounds of node
    ##  spatial bounds of node
    ##  spatial bounds of data within node
    ##  spatial bounds of data within node
    ##  region id

  vtkKdNodeSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkKdNode::IsTypeOf(@)",
    header: "vtkKdNode.h".}
proc IsA*(this: var vtkKdNode; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkKdNode.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkKdNode {.
    importcpp: "vtkKdNode::SafeDownCast(@)", header: "vtkKdNode.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkKdNode :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkKdNode :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkKdNode :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkKdNode; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkKdNode.h".}
proc New*(): ptr vtkKdNode {.importcpp: "vtkKdNode::New(@)", header: "vtkKdNode.h".}
proc SetDim*(this: var vtkKdNode; _arg: cint) {.importcpp: "SetDim",
    header: "vtkKdNode.h".}
## !!!Ignored construct:  virtual int GetDim ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Dim  of  << this -> Dim ) ; return this -> Dim ; } ;
## Error: expected ';'!!!

proc GetDivisionPosition*(this: var vtkKdNode): cdouble {.
    importcpp: "GetDivisionPosition", header: "vtkKdNode.h".}
proc SetDimNumberOfPoints*(this: var vtkKdNode; _arg: cint) {.
    importcpp: "SetDimNumberOfPoints", header: "vtkKdNode.h".}
## !!!Ignored construct:  virtual int GetDimNumberOfPoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfPoints  of  << this -> NumberOfPoints ) ; return this -> NumberOfPoints ; } ;
## Error: expected ';'!!!

proc SetBounds*(this: var vtkKdNode; x1: cdouble; x2: cdouble; y1: cdouble; y2: cdouble;
               z1: cdouble; z2: cdouble) {.importcpp: "SetBounds",
                                       header: "vtkKdNode.h".}
proc SetBounds*(this: var vtkKdNode; b: array[6, cdouble]) {.importcpp: "SetBounds",
    header: "vtkKdNode.h".}
proc GetBounds*(this: vtkKdNode; b: ptr cdouble) {.noSideEffect,
    importcpp: "GetBounds", header: "vtkKdNode.h".}
proc SetDataBounds*(this: var vtkKdNode; x1: cdouble; x2: cdouble; y1: cdouble;
                   y2: cdouble; z1: cdouble; z2: cdouble) {.
    importcpp: "SetDataBounds", header: "vtkKdNode.h".}
proc GetDataBounds*(this: vtkKdNode; b: ptr cdouble) {.noSideEffect,
    importcpp: "GetDataBounds", header: "vtkKdNode.h".}
proc SetDataBounds*(this: var vtkKdNode; v: ptr cfloat) {.importcpp: "SetDataBounds",
    header: "vtkKdNode.h".}
## !!!Ignored construct:  *
##  Get a pointer to the 3 bound minima (xmin, ymin and zmin) or the
##  3 bound maxima (xmax, ymax, zmax).  Don't free this pointer.
##  double * GetMinBounds ( ) VTK_SIZEHINT ( 3 ) { return this -> Min ; } double * GetMaxBounds ( ) VTK_SIZEHINT ( 3 ) { return this -> Max ; } *
##  Set the xmin, ymin and zmin value of the bounds of this region
##  void SetMinBounds ( const double * mb ) ;
## Error: expected ';'!!!

proc SetMaxBounds*(this: var vtkKdNode; mb: ptr cdouble) {.importcpp: "SetMaxBounds",
    header: "vtkKdNode.h".}
## !!!Ignored construct:  *
##  Get a pointer to the 3 data bound minima (xmin, ymin and zmin) or the
##  3 data bound maxima (xmax, ymax, zmax).  Don't free this pointer.
##  double * GetMinDataBounds ( ) VTK_SIZEHINT ( 3 ) { return this -> MinVal ; } double * GetMaxDataBounds ( ) VTK_SIZEHINT ( 3 ) { return this -> MaxVal ; } *
##  Set the xmin, ymin and zmin value of the bounds of this
##  data within this region
##  void SetMinDataBounds ( const double * mb ) ;
## Error: expected ';'!!!

proc SetMaxDataBounds*(this: var vtkKdNode; mb: ptr cdouble) {.
    importcpp: "SetMaxDataBounds", header: "vtkKdNode.h".}
proc SetDimNumberOfPointsID*(this: var vtkKdNode; _arg: cint) {.
    importcpp: "SetDimNumberOfPointsID", header: "vtkKdNode.h".}
## !!!Ignored construct:  virtual int GetDimNumberOfPointsID ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ID  of  << this -> ID ) ; return this -> ID ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  If this node is not a leaf node, there are leaf nodes below it whose
##  regions represent a partitioning of this region.  The IDs of these
##  leaf nodes form a contiguous set.  Set/Get the range of the IDs of
##  the leaf nodes below this node.  If this is already a leaf node, these
##  values should be the same as the ID.
##  virtual int GetDimNumberOfPointsIDMinIDMinID ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MinID  of  << this -> MinID ) ; return this -> MinID ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual int GetDimNumberOfPointsIDMinIDMinIDMaxID ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaxID  of  << this -> MaxID ) ; return this -> MaxID ; } ;
## Error: expected ';'!!!

proc SetDimNumberOfPointsIDMinID*(this: var vtkKdNode; _arg: cint) {.
    importcpp: "SetDimNumberOfPointsIDMinID", header: "vtkKdNode.h".}
proc SetDimNumberOfPointsIDMinIDMaxID*(this: var vtkKdNode; _arg: cint) {.
    importcpp: "SetDimNumberOfPointsIDMinIDMaxID", header: "vtkKdNode.h".}
  ## /@}
  ## *
  ##  Add the left and right children.
  ##
proc AddChildNodes*(this: var vtkKdNode; left: ptr vtkKdNode; right: ptr vtkKdNode) {.
    importcpp: "AddChildNodes", header: "vtkKdNode.h".}
proc DeleteChildNodes*(this: var vtkKdNode) {.importcpp: "DeleteChildNodes",
    header: "vtkKdNode.h".}
proc GetnameLeft*(this: var vtkKdNode): ptr vtkKdNode {.importcpp: "GetnameLeft",
    header: "vtkKdNode.h".}
proc SetLeft*(this: var vtkKdNode; left: ptr vtkKdNode) {.importcpp: "SetLeft",
    header: "vtkKdNode.h".}
proc GetnameLeftRight*(this: var vtkKdNode): ptr vtkKdNode {.
    importcpp: "GetnameLeftRight", header: "vtkKdNode.h".}
proc SetRight*(this: var vtkKdNode; right: ptr vtkKdNode) {.importcpp: "SetRight",
    header: "vtkKdNode.h".}
proc GetnameLeftRightUp*(this: var vtkKdNode): ptr vtkKdNode {.
    importcpp: "GetnameLeftRightUp", header: "vtkKdNode.h".}
proc SetUp*(this: var vtkKdNode; up: ptr vtkKdNode) {.importcpp: "SetUp",
    header: "vtkKdNode.h".}
proc IntersectsBox*(this: var vtkKdNode; x1: cdouble; x2: cdouble; y1: cdouble;
                   y2: cdouble; z1: cdouble; z2: cdouble; useDataBounds: cint): cint {.
    importcpp: "IntersectsBox", header: "vtkKdNode.h".}
proc IntersectsSphere2*(this: var vtkKdNode; x: cdouble; y: cdouble; z: cdouble;
                       rSquared: cdouble; useDataBounds: cint): cint {.
    importcpp: "IntersectsSphere2", header: "vtkKdNode.h".}
proc IntersectsRegion*(this: var vtkKdNode; pi: ptr vtkPlanesIntersection;
                      useDataBounds: cint): cint {.importcpp: "IntersectsRegion",
    header: "vtkKdNode.h".}
proc IntersectsCell*(this: var vtkKdNode; cell: ptr vtkCell; useDataBounds: cint;
                    cellRegion: cint = -1; cellBounds: ptr cdouble = nil): cint {.
    importcpp: "IntersectsCell", header: "vtkKdNode.h".}
proc ContainsBox*(this: var vtkKdNode; x1: cdouble; x2: cdouble; y1: cdouble; y2: cdouble;
                 z1: cdouble; z2: cdouble; useDataBounds: cint): cint {.
    importcpp: "ContainsBox", header: "vtkKdNode.h".}
proc ContainsPoint*(this: var vtkKdNode; x: cdouble; y: cdouble; z: cdouble;
                   useDataBounds: cint): vtkTypeBool {.importcpp: "ContainsPoint",
    header: "vtkKdNode.h".}
proc GetDistance2ToBoundary*(this: var vtkKdNode; x: cdouble; y: cdouble; z: cdouble;
                            useDataBounds: cint): cdouble {.
    importcpp: "GetDistance2ToBoundary", header: "vtkKdNode.h".}
proc GetDistance2ToBoundary*(this: var vtkKdNode; x: cdouble; y: cdouble; z: cdouble;
                            boundaryPt: ptr cdouble; useDataBounds: cint): cdouble {.
    importcpp: "GetDistance2ToBoundary", header: "vtkKdNode.h".}
proc GetDistance2ToInnerBoundary*(this: var vtkKdNode; x: cdouble; y: cdouble;
                                 z: cdouble): cdouble {.
    importcpp: "GetDistance2ToInnerBoundary", header: "vtkKdNode.h".}
proc PrintNode*(this: var vtkKdNode; depth: cint) {.importcpp: "PrintNode",
    header: "vtkKdNode.h".}
proc PrintVerboseNode*(this: var vtkKdNode; depth: cint) {.
    importcpp: "PrintVerboseNode", header: "vtkKdNode.h".}