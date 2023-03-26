## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkContourRepresentation.h
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
##  @class   vtkContourRepresentation
##  @brief   represent the vtkContourWidget
##
##  The vtkContourRepresentation is a superclass for various types of
##  representations for vtkContourWidget.
##
##  @par Managing contour points:
##  The classes vtkContourRepresentationNode, vtkContourRepresentationInternals,
##  and vtkContourRepresentationPoint manage the data structure used to represent
##  nodes and points on a contour. A contour may contain several nodes and
##  several additional points. Nodes are usually the result of user-clicked points
##  on the contour. Additional points are created between nodes to generate a
##  smooth curve using some Interpolator -- see the method \c SetLineInterpolator.
##
##  @par Managing contour points:
##  \par
##  The data structure stores both the world and display positions for every
##  point. (This may seem like a duplication.) The default behaviour of this
##  class is to use the WorldPosition to do all the math. Typically a point is
##  added at a given display position. Its corresponding world position is
##  computed using the point placer, and stored. Any query of the display
##  position of a stored point is done via the Renderer, which computes the
##  display position given a world position.
##
##  @par Managing contour points:
##  \par
##  So why maintain the display position? Consider drawing a contour on a
##  volume widget. You might want the contour to be located at a certain world
##  position in the volume or you might want to be overlaid over the window
##  like an Actor2D. The default behaviour of this class is to provide the
##  former behaviour.
##
##  @par Managing contour points:
##  \par
##  To achieve the latter behaviour, override the methods that return the display
##  position (to return the set display position instead of computing it from
##  the world positions) and the method \c BuildLines() to interpolate lines
##  using their display positions instead of world positions.
##
##  @sa
##  vtkContourWidget
##

import
  vtkInteractionWidgetsModule, vtkWidgetRepresentation

discard "forward decl of vtkContourLineInterpolator"
discard "forward decl of vtkIncrementalOctreePointLocator"
discard "forward decl of vtkPointPlacer"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkIdList"
type
  vtkContourRepresentationPoint* {.importcpp: "vtkContourRepresentationPoint",
                                  header: "vtkContourRepresentation.h", bycopy.} = object
    WorldPosition* {.importc: "WorldPosition".}: array[3, cdouble]
    NormalizedDisplayPosition* {.importc: "NormalizedDisplayPosition".}: array[2,
        cdouble]              ##  The point id. This is blank except in the case of
                ##  vtkPolygonalSurfaceContourLineInterpolator
    PointId* {.importc: "PointId".}: vtkIdType

  vtkContourRepresentationNode* {.importcpp: "vtkContourRepresentationNode",
                                 header: "vtkContourRepresentation.h", bycopy.} = object
    WorldPosition* {.importc: "WorldPosition".}: array[3, cdouble]
    WorldOrientation* {.importc: "WorldOrientation".}: array[9, cdouble]
    NormalizedDisplayPosition* {.importc: "NormalizedDisplayPosition".}: array[2,
        cdouble]
    Selected* {.importc: "Selected".}: cint
    Points* {.importc: "Points".}: vector[ptr vtkContourRepresentationPoint] ##  The point id. This is blank except in the case of
                                                                        ##  vtkPolygonalSurfaceContourLineInterpolator
    PointId* {.importc: "PointId".}: vtkIdType

  vtkContourRepresentationInternals* {.importcpp: "vtkContourRepresentationInternals",
                                      header: "vtkContourRepresentation.h", bycopy.} = object
    Nodes* {.importc: "Nodes".}: vector[ptr vtkContourRepresentationNode]


proc ClearNodes*(this: var vtkContourRepresentationInternals) {.
    importcpp: "ClearNodes", header: "vtkContourRepresentation.h".}
type
  vtkContourRepresentation* {.importcpp: "vtkContourRepresentation",
                             header: "vtkContourRepresentation.h", bycopy.} = object of vtkWidgetRepresentation ## /@{
                                                                                                         ## *
                                                                                                         ##  Standard VTK methods.
                                                                                                         ##
    vtkContourRepresentation* {.importc: "vtkContourRepresentation".}: VTK_NEWINSTANCE
    ##  A flag to indicate whether to show the Selected nodes
    ## *
    ##  Deletes the previous locator if it exists and creates
    ##  a new locator. Also deletes / recreates the attached data set.
    ##

  vtkContourRepresentationSuperclass* = vtkWidgetRepresentation

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkContourRepresentation::IsTypeOf(@)",
    header: "vtkContourRepresentation.h".}
proc IsA*(this: var vtkContourRepresentation; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkContourRepresentation.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkContourRepresentation {.
    importcpp: "vtkContourRepresentation::SafeDownCast(@)",
    header: "vtkContourRepresentation.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkContourRepresentation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWidgetRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkContourRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkContourRepresentation :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkContourRepresentation; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkContourRepresentation.h".}
proc AddNodeAtWorldPosition*(this: var vtkContourRepresentation; x: cdouble;
                            y: cdouble; z: cdouble): cint {.
    importcpp: "AddNodeAtWorldPosition", header: "vtkContourRepresentation.h".}
proc AddNodeAtWorldPosition*(this: var vtkContourRepresentation;
                            worldPos: array[3, cdouble]): cint {.
    importcpp: "AddNodeAtWorldPosition", header: "vtkContourRepresentation.h".}
proc AddNodeAtWorldPosition*(this: var vtkContourRepresentation;
                            worldPos: array[3, cdouble];
                            worldOrient: array[9, cdouble]): cint {.
    importcpp: "AddNodeAtWorldPosition", header: "vtkContourRepresentation.h".}
proc AddNodeAtDisplayPosition*(this: var vtkContourRepresentation;
                              displayPos: array[2, cdouble]): cint {.
    importcpp: "AddNodeAtDisplayPosition", header: "vtkContourRepresentation.h".}
proc AddNodeAtDisplayPosition*(this: var vtkContourRepresentation;
                              displayPos: array[2, cint]): cint {.
    importcpp: "AddNodeAtDisplayPosition", header: "vtkContourRepresentation.h".}
proc AddNodeAtDisplayPosition*(this: var vtkContourRepresentation; X: cint; Y: cint): cint {.
    importcpp: "AddNodeAtDisplayPosition", header: "vtkContourRepresentation.h".}
proc ActivateNode*(this: var vtkContourRepresentation; displayPos: array[2, cdouble]): cint {.
    importcpp: "ActivateNode", header: "vtkContourRepresentation.h".}
proc ActivateNode*(this: var vtkContourRepresentation; displayPos: array[2, cint]): cint {.
    importcpp: "ActivateNode", header: "vtkContourRepresentation.h".}
proc ActivateNode*(this: var vtkContourRepresentation; X: cint; Y: cint): cint {.
    importcpp: "ActivateNode", header: "vtkContourRepresentation.h".}
proc SetActiveNodeToWorldPosition*(this: var vtkContourRepresentation;
                                  pos: array[3, cdouble]): cint {.
    importcpp: "SetActiveNodeToWorldPosition",
    header: "vtkContourRepresentation.h".}
proc SetActiveNodeToWorldPosition*(this: var vtkContourRepresentation;
                                  pos: array[3, cdouble]; orient: array[9, cdouble]): cint {.
    importcpp: "SetActiveNodeToWorldPosition",
    header: "vtkContourRepresentation.h".}
proc SetActiveNodeToDisplayPosition*(this: var vtkContourRepresentation;
                                    pos: array[2, cdouble]): cint {.
    importcpp: "SetActiveNodeToDisplayPosition",
    header: "vtkContourRepresentation.h".}
proc SetActiveNodeToDisplayPosition*(this: var vtkContourRepresentation;
                                    pos: array[2, cint]): cint {.
    importcpp: "SetActiveNodeToDisplayPosition",
    header: "vtkContourRepresentation.h".}
proc SetActiveNodeToDisplayPosition*(this: var vtkContourRepresentation; X: cint;
                                    Y: cint): cint {.
    importcpp: "SetActiveNodeToDisplayPosition",
    header: "vtkContourRepresentation.h".}
proc ToggleActiveNodeSelected*(this: var vtkContourRepresentation): cint {.
    importcpp: "ToggleActiveNodeSelected", header: "vtkContourRepresentation.h".}
proc GetActiveNodeSelected*(this: var vtkContourRepresentation): cint {.
    importcpp: "GetActiveNodeSelected", header: "vtkContourRepresentation.h".}
proc GetNthNodeSelected*(this: var vtkContourRepresentation; a2: cint): cint {.
    importcpp: "GetNthNodeSelected", header: "vtkContourRepresentation.h".}
proc SetNthNodeSelected*(this: var vtkContourRepresentation; a2: cint): cint {.
    importcpp: "SetNthNodeSelected", header: "vtkContourRepresentation.h".}
proc GetActiveNodeWorldPosition*(this: var vtkContourRepresentation;
                                pos: array[3, cdouble]): cint {.
    importcpp: "GetActiveNodeWorldPosition", header: "vtkContourRepresentation.h".}
proc GetActiveNodeWorldOrientation*(this: var vtkContourRepresentation;
                                   orient: array[9, cdouble]): cint {.
    importcpp: "GetActiveNodeWorldOrientation",
    header: "vtkContourRepresentation.h".}
proc GetActiveNodeDisplayPosition*(this: var vtkContourRepresentation;
                                  pos: array[2, cdouble]): cint {.
    importcpp: "GetActiveNodeDisplayPosition",
    header: "vtkContourRepresentation.h".}
proc GetNumberOfNodes*(this: var vtkContourRepresentation): cint {.
    importcpp: "GetNumberOfNodes", header: "vtkContourRepresentation.h".}
proc GetNthNodeDisplayPosition*(this: var vtkContourRepresentation; n: cint;
                               pos: array[2, cdouble]): cint {.
    importcpp: "GetNthNodeDisplayPosition", header: "vtkContourRepresentation.h".}
proc GetNthNodeWorldPosition*(this: var vtkContourRepresentation; n: cint;
                             pos: array[3, cdouble]): cint {.
    importcpp: "GetNthNodeWorldPosition", header: "vtkContourRepresentation.h".}
proc GetNthNode*(this: var vtkContourRepresentation; n: cint): ptr vtkContourRepresentationNode {.
    importcpp: "GetNthNode", header: "vtkContourRepresentation.h".}
proc GetNthNodeWorldOrientation*(this: var vtkContourRepresentation; n: cint;
                                orient: array[9, cdouble]): cint {.
    importcpp: "GetNthNodeWorldOrientation", header: "vtkContourRepresentation.h".}
proc SetNthNodeDisplayPosition*(this: var vtkContourRepresentation; n: cint; X: cint;
                               Y: cint): cint {.
    importcpp: "SetNthNodeDisplayPosition", header: "vtkContourRepresentation.h".}
proc SetNthNodeDisplayPosition*(this: var vtkContourRepresentation; n: cint;
                               pos: array[2, cint]): cint {.
    importcpp: "SetNthNodeDisplayPosition", header: "vtkContourRepresentation.h".}
proc SetNthNodeDisplayPosition*(this: var vtkContourRepresentation; n: cint;
                               pos: array[2, cdouble]): cint {.
    importcpp: "SetNthNodeDisplayPosition", header: "vtkContourRepresentation.h".}
proc SetNthNodeWorldPosition*(this: var vtkContourRepresentation; n: cint;
                             pos: array[3, cdouble]): cint {.
    importcpp: "SetNthNodeWorldPosition", header: "vtkContourRepresentation.h".}
proc SetNthNodeWorldPosition*(this: var vtkContourRepresentation; n: cint;
                             pos: array[3, cdouble]; orient: array[9, cdouble]): cint {.
    importcpp: "SetNthNodeWorldPosition", header: "vtkContourRepresentation.h".}
proc GetNthNodeSlope*(this: var vtkContourRepresentation; idx: cint;
                     slope: array[3, cdouble]): cint {.importcpp: "GetNthNodeSlope",
    header: "vtkContourRepresentation.h".}
proc GetNumberOfIntermediatePoints*(this: var vtkContourRepresentation; n: cint): cint {.
    importcpp: "GetNumberOfIntermediatePoints",
    header: "vtkContourRepresentation.h".}
proc GetIntermediatePointWorldPosition*(this: var vtkContourRepresentation; n: cint;
                                       idx: cint; point: array[3, cdouble]): cint {.
    importcpp: "GetIntermediatePointWorldPosition",
    header: "vtkContourRepresentation.h".}
proc AddIntermediatePointWorldPosition*(this: var vtkContourRepresentation; n: cint;
                                       point: array[3, cdouble]): cint {.
    importcpp: "AddIntermediatePointWorldPosition",
    header: "vtkContourRepresentation.h".}
proc AddIntermediatePointWorldPosition*(this: var vtkContourRepresentation; n: cint;
                                       point: array[3, cdouble]; ptId: vtkIdType): cint {.
    importcpp: "AddIntermediatePointWorldPosition",
    header: "vtkContourRepresentation.h".}
proc DeleteLastNode*(this: var vtkContourRepresentation): cint {.
    importcpp: "DeleteLastNode", header: "vtkContourRepresentation.h".}
proc DeleteActiveNode*(this: var vtkContourRepresentation): cint {.
    importcpp: "DeleteActiveNode", header: "vtkContourRepresentation.h".}
proc DeleteNthNode*(this: var vtkContourRepresentation; n: cint): cint {.
    importcpp: "DeleteNthNode", header: "vtkContourRepresentation.h".}
proc ClearAllNodes*(this: var vtkContourRepresentation) {.
    importcpp: "ClearAllNodes", header: "vtkContourRepresentation.h".}
proc AddNodeOnContour*(this: var vtkContourRepresentation; X: cint; Y: cint): cint {.
    importcpp: "AddNodeOnContour", header: "vtkContourRepresentation.h".}
proc SetPixelTolerance*(this: var vtkContourRepresentation; _arg: cint) {.
    importcpp: "SetPixelTolerance", header: "vtkContourRepresentation.h".}
proc GetPixelToleranceMinValue*(this: var vtkContourRepresentation): cint {.
    importcpp: "GetPixelToleranceMinValue", header: "vtkContourRepresentation.h".}
proc GetPixelToleranceMaxValue*(this: var vtkContourRepresentation): cint {.
    importcpp: "GetPixelToleranceMaxValue", header: "vtkContourRepresentation.h".}
## !!!Ignored construct:  virtual int GetPixelTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PixelTolerance  of  << this -> PixelTolerance ) ; return this -> PixelTolerance ; } ;
## Error: expected ';'!!!

proc SetPixelToleranceWorldTolerance*(this: var vtkContourRepresentation;
                                     _arg: cdouble) {.
    importcpp: "SetPixelToleranceWorldTolerance",
    header: "vtkContourRepresentation.h".}
proc GetPixelToleranceMinValueWorldToleranceMinValue*(
    this: var vtkContourRepresentation): cdouble {.
    importcpp: "GetPixelToleranceMinValueWorldToleranceMinValue",
    header: "vtkContourRepresentation.h".}
proc GetPixelToleranceMaxValueWorldToleranceMaxValue*(
    this: var vtkContourRepresentation): cdouble {.
    importcpp: "GetPixelToleranceMaxValueWorldToleranceMaxValue",
    header: "vtkContourRepresentation.h".}
## !!!Ignored construct:  virtual double GetPixelToleranceWorldTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WorldTolerance  of  << this -> WorldTolerance ) ; return this -> WorldTolerance ; } ;
## Error: expected ';'!!!

const
  vtkContourRepresentationOutside* = 0
  vtkContourRepresentationNearby* = 1

const
  vtkContourRepresentationInactive* = 0
  vtkContourRepresentationTranslate* = 1
  vtkContourRepresentationShift* = 2
  vtkContourRepresentationScale* = 3

## !!!Ignored construct:  /@{ *
##  Set / get the current operation. The widget is either
##  inactive, or it is being translated.
##  virtual int GetPixelToleranceWorldToleranceCurrentOperationCurrentOperation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CurrentOperation  of  << this -> CurrentOperation ) ; return this -> CurrentOperation ; } ;
## Error: expected ';'!!!

proc SetPixelToleranceWorldToleranceCurrentOperation*(
    this: var vtkContourRepresentation; _arg: cint) {.
    importcpp: "SetPixelToleranceWorldToleranceCurrentOperation",
    header: "vtkContourRepresentation.h".}
proc GetPixelToleranceMinValueWorldToleranceMinValueCurrentOperationMinValue*(
    this: var vtkContourRepresentation): cint {.importcpp: "GetPixelToleranceMinValueWorldToleranceMinValueCurrentOperationMinValue",
    header: "vtkContourRepresentation.h".}
proc GetPixelToleranceMaxValueWorldToleranceMaxValueCurrentOperationMaxValue*(
    this: var vtkContourRepresentation): cint {.importcpp: "GetPixelToleranceMaxValueWorldToleranceMaxValueCurrentOperationMaxValue",
    header: "vtkContourRepresentation.h".}
proc SetCurrentOperationToInactive*(this: var vtkContourRepresentation) {.
    importcpp: "SetCurrentOperationToInactive",
    header: "vtkContourRepresentation.h".}
proc SetCurrentOperationToTranslate*(this: var vtkContourRepresentation) {.
    importcpp: "SetCurrentOperationToTranslate",
    header: "vtkContourRepresentation.h".}
proc SetCurrentOperationToShift*(this: var vtkContourRepresentation) {.
    importcpp: "SetCurrentOperationToShift", header: "vtkContourRepresentation.h".}
proc SetCurrentOperationToScale*(this: var vtkContourRepresentation) {.
    importcpp: "SetCurrentOperationToScale", header: "vtkContourRepresentation.h".}
proc SetPointPlacer*(this: var vtkContourRepresentation; a2: ptr vtkPointPlacer) {.
    importcpp: "SetPointPlacer", header: "vtkContourRepresentation.h".}
proc GetnamePointPlacer*(this: var vtkContourRepresentation): ptr vtkPointPlacer {.
    importcpp: "GetnamePointPlacer", header: "vtkContourRepresentation.h".}
  ## /@{
  ## *
  ##  Set / Get the Line Interpolator. The line interpolator
  ##  is responsible for generating the line segments connecting
  ##  nodes.
  ##
proc SetLineInterpolator*(this: var vtkContourRepresentation;
                         a2: ptr vtkContourLineInterpolator) {.
    importcpp: "SetLineInterpolator", header: "vtkContourRepresentation.h".}
proc GetnamePointPlacerLineInterpolator*(this: var vtkContourRepresentation): ptr vtkContourLineInterpolator {.
    importcpp: "GetnamePointPlacerLineInterpolator",
    header: "vtkContourRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  These are methods that satisfy vtkWidgetRepresentation's API.
  ##
proc BuildRepresentation*(this: var vtkContourRepresentation) {.
    importcpp: "BuildRepresentation", header: "vtkContourRepresentation.h".}
proc ComputeInteractionState*(this: var vtkContourRepresentation; X: cint; Y: cint;
                             modified: cint = 0): cint {.
    importcpp: "ComputeInteractionState", header: "vtkContourRepresentation.h".}
proc StartWidgetInteraction*(this: var vtkContourRepresentation;
                            e: array[2, cdouble]) {.
    importcpp: "StartWidgetInteraction", header: "vtkContourRepresentation.h".}
proc WidgetInteraction*(this: var vtkContourRepresentation; e: array[2, cdouble]) {.
    importcpp: "WidgetInteraction", header: "vtkContourRepresentation.h".}
proc ReleaseGraphicsResources*(this: var vtkContourRepresentation; w: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkContourRepresentation.h".}
proc RenderOverlay*(this: var vtkContourRepresentation; viewport: ptr vtkViewport): cint {.
    importcpp: "RenderOverlay", header: "vtkContourRepresentation.h".}
proc RenderOpaqueGeometry*(this: var vtkContourRepresentation;
                          viewport: ptr vtkViewport): cint {.
    importcpp: "RenderOpaqueGeometry", header: "vtkContourRepresentation.h".}
proc RenderTranslucentPolygonalGeometry*(this: var vtkContourRepresentation;
                                        viewport: ptr vtkViewport): cint {.
    importcpp: "RenderTranslucentPolygonalGeometry",
    header: "vtkContourRepresentation.h".}
proc HasTranslucentPolygonalGeometry*(this: var vtkContourRepresentation): vtkTypeBool {.
    importcpp: "HasTranslucentPolygonalGeometry",
    header: "vtkContourRepresentation.h".}
proc SetClosedLoop*(this: var vtkContourRepresentation; val: vtkTypeBool) {.
    importcpp: "SetClosedLoop", header: "vtkContourRepresentation.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetPixelToleranceWorldToleranceCurrentOperationCurrentOperationClosedLoop ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ClosedLoop  of  << this -> ClosedLoop ) ; return this -> ClosedLoop ; } ;
## Error: expected ';'!!!

proc ClosedLoopOn*(this: var vtkContourRepresentation) {.importcpp: "ClosedLoopOn",
    header: "vtkContourRepresentation.h".}
proc ClosedLoopOff*(this: var vtkContourRepresentation) {.
    importcpp: "ClosedLoopOff", header: "vtkContourRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  A flag to indicate whether to show the Selected nodes
  ##  Default is to set it to false.
  ##
proc SetShowSelectedNodes*(this: var vtkContourRepresentation; a2: vtkTypeBool) {.
    importcpp: "SetShowSelectedNodes", header: "vtkContourRepresentation.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetPixelToleranceWorldToleranceCurrentOperationCurrentOperationClosedLoopShowSelectedNodes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ShowSelectedNodes  of  << this -> ShowSelectedNodes ) ; return this -> ShowSelectedNodes ; } ;
## Error: expected ';'!!!

proc ShowSelectedNodesOn*(this: var vtkContourRepresentation) {.
    importcpp: "ShowSelectedNodesOn", header: "vtkContourRepresentation.h".}
proc ShowSelectedNodesOff*(this: var vtkContourRepresentation) {.
    importcpp: "ShowSelectedNodesOff", header: "vtkContourRepresentation.h".}
  ## /@}
  ## *
  ##  Get the points in this contour as a vtkPolyData.
  ##
proc GetContourRepresentationAsPolyData*(this: var vtkContourRepresentation): ptr vtkPolyData {.
    importcpp: "GetContourRepresentationAsPolyData",
    header: "vtkContourRepresentation.h".}
proc GetNodePolyData*(this: var vtkContourRepresentation; poly: ptr vtkPolyData) {.
    importcpp: "GetNodePolyData", header: "vtkContourRepresentation.h".}
proc SetRebuildLocator*(this: var vtkContourRepresentation; _arg: bool) {.
    importcpp: "SetRebuildLocator", header: "vtkContourRepresentation.h".}