## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageTracerWidget.h
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
##  @class   vtkImageTracerWidget
##  @brief   3D widget for tracing on planar props.
##
##  vtkImageTracerWidget is different from other widgets in three distinct ways:
##  1) any sub-class of vtkProp can be input rather than just vtkProp3D, so that
##  vtkImageActor can be set as the prop and then traced over, 2) the widget fires
##  pick events at the input prop to decide where to move its handles, 3) the
##  widget has 2D glyphs for handles instead of 3D spheres as is done in other
##  sub-classes of vtk3DWidget. This widget is primarily designed for manually
##  tracing over image data.
##  The button actions and key modifiers are as follows for controlling the
##  widget:
##  1) left button click over the image, hold and drag draws a free hand line.
##  2) left button click and release erases the widget line,
##  if it exists, and repositions the first handle.
##  3) middle button click starts a snap drawn line.  The line is terminated by
##  clicking the middle button while depressing the ctrl key.
##  4) when tracing a continuous or snap drawn line, if the last cursor position
##  is within a specified tolerance to the first handle, the widget line will form
##  a closed loop.
##  5) right button clicking and holding on any handle that is part of a snap
##  drawn line allows handle dragging: existing line segments are updated
##  accordingly.  If the path is open and AutoClose is set to On, the path can
##  be closed by repositioning the first and last points over one another.
##  6) ctrl key + right button down on any handle will erase it: existing
##  snap drawn line segments are updated accordingly.  If the line was formed by
##  continuous tracing, the line is deleted leaving one handle.
##  7) shift key + right button down on any snap drawn line segment will insert
##  a handle at the cursor position.  The line segment is split accordingly.
##
##  @warning
##  the input vtkDataSet should be vtkImageData.
##
##  @sa
##  vtk3DWidget vtkBoxWidget vtkLineWidget vtkPointWidget vtkSphereWidget
##  vtkImagePlaneWidget vtkImplicitPlaneWidget vtkPlaneWidget
##

import
  vtk3DWidget, vtkInteractionWidgetsModule

discard "forward decl of vtkAbstractPropPicker"
discard "forward decl of vtkActor"
discard "forward decl of vtkCellArray"
discard "forward decl of vtkCellPicker"
discard "forward decl of vtkFloatArray"
discard "forward decl of vtkGlyphSource2D"
discard "forward decl of vtkPoints"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkProp"
discard "forward decl of vtkProperty"
discard "forward decl of vtkPropPicker"
discard "forward decl of vtkTransform"
discard "forward decl of vtkTransformPolyDataFilter"
const
  VTK_ITW_PROJECTION_YZ* = 0
  VTK_ITW_PROJECTION_XZ* = 1
  VTK_ITW_PROJECTION_XY* = 2
  VTK_ITW_SNAP_CELLS* = 0
  VTK_ITW_SNAP_POINTS* = 1

type
  vtkImageTracerWidget* {.importcpp: "vtkImageTracerWidget",
                         header: "vtkImageTracerWidget.h", bycopy.} = object of vtk3DWidget ## *
                                                                                     ##  Instantiate the object.
                                                                                     ##
    vtkImageTracerWidget* {.importc: "vtkImageTracerWidget".}: VTK_NEWINSTANCE
    ##  tolerance for auto path close
    ##  Transforms required as 2D glyphs are generated in the x-y plane
    ##  the prop we want to pick on
    ##  the prop's picker
    ##  Representation of the line
    ##  Do the picking of the handles and the lines
    ##  Register internal Pickers within PickingManager


proc New*(): ptr vtkImageTracerWidget {.importcpp: "vtkImageTracerWidget::New(@)",
                                    header: "vtkImageTracerWidget.h".}
type
  vtkImageTracerWidgetSuperclass* = vtk3DWidget

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageTracerWidget::IsTypeOf(@)",
    header: "vtkImageTracerWidget.h".}
proc IsA*(this: var vtkImageTracerWidget; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageTracerWidget.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageTracerWidget {.
    importcpp: "vtkImageTracerWidget::SafeDownCast(@)",
    header: "vtkImageTracerWidget.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageTracerWidget :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtk3DWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageTracerWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageTracerWidget :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageTracerWidget; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageTracerWidget.h".}
proc SetEnabled*(this: var vtkImageTracerWidget; a2: cint) {.importcpp: "SetEnabled",
    header: "vtkImageTracerWidget.h".}
proc PlaceWidget*(this: var vtkImageTracerWidget; bounds: array[6, cdouble]) {.
    importcpp: "PlaceWidget", header: "vtkImageTracerWidget.h".}
proc PlaceWidget*(this: var vtkImageTracerWidget) {.importcpp: "PlaceWidget",
    header: "vtkImageTracerWidget.h".}
proc PlaceWidget*(this: var vtkImageTracerWidget; xmin: cdouble; xmax: cdouble;
                 ymin: cdouble; ymax: cdouble; zmin: cdouble; zmax: cdouble) {.
    importcpp: "PlaceWidget", header: "vtkImageTracerWidget.h".}
proc SetHandleProperty*(this: var vtkImageTracerWidget; a2: ptr vtkProperty) {.
    importcpp: "SetHandleProperty", header: "vtkImageTracerWidget.h".}
proc GetnameHandleProperty*(this: var vtkImageTracerWidget): ptr vtkProperty {.
    importcpp: "GetnameHandleProperty", header: "vtkImageTracerWidget.h".}
proc SetSelectedHandleProperty*(this: var vtkImageTracerWidget; a2: ptr vtkProperty) {.
    importcpp: "SetSelectedHandleProperty", header: "vtkImageTracerWidget.h".}
proc GetnameHandlePropertySelectedHandleProperty*(this: var vtkImageTracerWidget): ptr vtkProperty {.
    importcpp: "GetnameHandlePropertySelectedHandleProperty",
    header: "vtkImageTracerWidget.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the line properties. The properties of the line when selected
  ##  and unselected can be manipulated.
  ##
proc SetLineProperty*(this: var vtkImageTracerWidget; a2: ptr vtkProperty) {.
    importcpp: "SetLineProperty", header: "vtkImageTracerWidget.h".}
proc GetnameHandlePropertySelectedHandlePropertyLineProperty*(
    this: var vtkImageTracerWidget): ptr vtkProperty {.
    importcpp: "GetnameHandlePropertySelectedHandlePropertyLineProperty",
    header: "vtkImageTracerWidget.h".}
proc SetSelectedLineProperty*(this: var vtkImageTracerWidget; a2: ptr vtkProperty) {.
    importcpp: "SetSelectedLineProperty", header: "vtkImageTracerWidget.h".}
proc GetnameHandlePropertySelectedHandlePropertyLinePropertySelectedLineProperty*(
    this: var vtkImageTracerWidget): ptr vtkProperty {.importcpp: "GetnameHandlePropertySelectedHandlePropertyLinePropertySelectedLineProperty",
    header: "vtkImageTracerWidget.h".}
  ## /@}
  ## *
  ##  Set the prop, usually a vtkImageActor, to trace over.
  ##
proc SetViewProp*(this: var vtkImageTracerWidget; prop: ptr vtkProp) {.
    importcpp: "SetViewProp", header: "vtkImageTracerWidget.h".}
proc SetProjectToPlane*(this: var vtkImageTracerWidget; _arg: vtkTypeBool) {.
    importcpp: "SetProjectToPlane", header: "vtkImageTracerWidget.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetProjectToPlane ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ProjectToPlane  of  << this -> ProjectToPlane ) ; return this -> ProjectToPlane ; } ;
## Error: expected ';'!!!

proc ProjectToPlaneOn*(this: var vtkImageTracerWidget) {.
    importcpp: "ProjectToPlaneOn", header: "vtkImageTracerWidget.h".}
proc ProjectToPlaneOff*(this: var vtkImageTracerWidget) {.
    importcpp: "ProjectToPlaneOff", header: "vtkImageTracerWidget.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set the projection normal.  The normal in SetProjectionNormal is 0,1,2
  ##  for YZ,XZ,XY planes respectively.  Since the handles are 2D glyphs, it is
  ##  necessary to specify a plane on which to generate them, even though
  ##  ProjectToPlane may be turned off.
  ##
proc SetProjectionNormal*(this: var vtkImageTracerWidget; _arg: cint) {.
    importcpp: "SetProjectionNormal", header: "vtkImageTracerWidget.h".}
proc GetProjectionNormalMinValue*(this: var vtkImageTracerWidget): cint {.
    importcpp: "GetProjectionNormalMinValue", header: "vtkImageTracerWidget.h".}
proc GetProjectionNormalMaxValue*(this: var vtkImageTracerWidget): cint {.
    importcpp: "GetProjectionNormalMaxValue", header: "vtkImageTracerWidget.h".}
## !!!Ignored construct:  virtual int GetProjectToPlaneProjectionNormal ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ProjectionNormal  of  << this -> ProjectionNormal ) ; return this -> ProjectionNormal ; } ;
## Error: expected ';'!!!

proc SetProjectionNormalToXAxes*(this: var vtkImageTracerWidget) {.
    importcpp: "SetProjectionNormalToXAxes", header: "vtkImageTracerWidget.h".}
proc SetProjectionNormalToYAxes*(this: var vtkImageTracerWidget) {.
    importcpp: "SetProjectionNormalToYAxes", header: "vtkImageTracerWidget.h".}
proc SetProjectionNormalToZAxes*(this: var vtkImageTracerWidget) {.
    importcpp: "SetProjectionNormalToZAxes", header: "vtkImageTracerWidget.h".}
proc SetProjectionPosition*(this: var vtkImageTracerWidget; position: cdouble) {.
    importcpp: "SetProjectionPosition", header: "vtkImageTracerWidget.h".}
## !!!Ignored construct:  virtual double GetProjectToPlaneProjectionNormalProjectionPosition ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ProjectionPosition  of  << this -> ProjectionPosition ) ; return this -> ProjectionPosition ; } ;
## Error: expected ';'!!!

proc SetSnapToImage*(this: var vtkImageTracerWidget; snap: vtkTypeBool) {.
    importcpp: "SetSnapToImage", header: "vtkImageTracerWidget.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetProjectToPlaneProjectionNormalProjectionPositionSnapToImage ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SnapToImage  of  << this -> SnapToImage ) ; return this -> SnapToImage ; } ;
## Error: expected ';'!!!

proc SnapToImageOn*(this: var vtkImageTracerWidget) {.importcpp: "SnapToImageOn",
    header: "vtkImageTracerWidget.h".}
proc SnapToImageOff*(this: var vtkImageTracerWidget) {.importcpp: "SnapToImageOff",
    header: "vtkImageTracerWidget.h".}
  ## /@}
  ## /@{
  ## *
  ##  In concert with a CaptureRadius value, automatically
  ##  form a closed path by connecting first to last path points.
  ##  Default is Off.
  ##
proc SetProjectToPlaneAutoClose*(this: var vtkImageTracerWidget; _arg: vtkTypeBool) {.
    importcpp: "SetProjectToPlaneAutoClose", header: "vtkImageTracerWidget.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetProjectToPlaneProjectionNormalProjectionPositionSnapToImageAutoClose ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AutoClose  of  << this -> AutoClose ) ; return this -> AutoClose ; } ;
## Error: expected ';'!!!

proc AutoCloseOn*(this: var vtkImageTracerWidget) {.importcpp: "AutoCloseOn",
    header: "vtkImageTracerWidget.h".}
proc AutoCloseOff*(this: var vtkImageTracerWidget) {.importcpp: "AutoCloseOff",
    header: "vtkImageTracerWidget.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the capture radius for automatic path closing.  For image
  ##  data, capture radius should be half the distance between voxel/pixel
  ##  centers.
  ##  Default is 1.0
  ##
proc SetProjectToPlaneAutoCloseCaptureRadius*(this: var vtkImageTracerWidget;
    _arg: cdouble) {.importcpp: "SetProjectToPlaneAutoCloseCaptureRadius",
                   header: "vtkImageTracerWidget.h".}
## !!!Ignored construct:  virtual double GetProjectToPlaneProjectionNormalProjectionPositionSnapToImageAutoCloseCaptureRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CaptureRadius  of  << this -> CaptureRadius ) ; return this -> CaptureRadius ; } ;
## Error: expected ';'!!!

proc GetPath*(this: var vtkImageTracerWidget; pd: ptr vtkPolyData) {.
    importcpp: "GetPath", header: "vtkImageTracerWidget.h".}
proc GetGlyphSource*(this: var vtkImageTracerWidget): ptr vtkGlyphSource2D {.
    importcpp: "GetGlyphSource", header: "vtkImageTracerWidget.h".}
proc SetProjectionNormalImageSnapType*(this: var vtkImageTracerWidget; _arg: cint) {.
    importcpp: "SetProjectionNormalImageSnapType",
    header: "vtkImageTracerWidget.h".}
proc GetProjectionNormalMinValueImageSnapTypeMinValue*(
    this: var vtkImageTracerWidget): cint {.importcpp: "GetProjectionNormalMinValueImageSnapTypeMinValue",
                                        header: "vtkImageTracerWidget.h".}
proc GetProjectionNormalMaxValueImageSnapTypeMaxValue*(
    this: var vtkImageTracerWidget): cint {.importcpp: "GetProjectionNormalMaxValueImageSnapTypeMaxValue",
                                        header: "vtkImageTracerWidget.h".}
## !!!Ignored construct:  virtual int GetProjectToPlaneProjectionNormalProjectionPositionSnapToImageAutoCloseCaptureRadiusImageSnapType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ImageSnapType  of  << this -> ImageSnapType ) ; return this -> ImageSnapType ; } ;
## Error: expected ';'!!!

proc SetHandlePosition*(this: var vtkImageTracerWidget; handle: cint;
                       xyz: array[3, cdouble]) {.importcpp: "SetHandlePosition",
    header: "vtkImageTracerWidget.h".}
proc SetHandlePosition*(this: var vtkImageTracerWidget; handle: cint; x: cdouble;
                       y: cdouble; z: cdouble) {.importcpp: "SetHandlePosition",
    header: "vtkImageTracerWidget.h".}
proc GetHandlePosition*(this: var vtkImageTracerWidget; handle: cint;
                       xyz: array[3, cdouble]) {.importcpp: "GetHandlePosition",
    header: "vtkImageTracerWidget.h".}
## !!!Ignored construct:  double * GetHandlePosition ( int handle ) VTK_SIZEHINT ( 3 ) ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get the number of handles.
##  virtual int GetProjectToPlaneProjectionNormalProjectionPositionSnapToImageAutoCloseCaptureRadiusImageSnapTypeNumberOfHandlesNumberOfHandles ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfHandles  of  << this -> NumberOfHandles ) ; return this -> NumberOfHandles ; } ;
## Error: expected ';'!!!

proc SetInteraction*(this: var vtkImageTracerWidget; interact: vtkTypeBool) {.
    importcpp: "SetInteraction", header: "vtkImageTracerWidget.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetProjectToPlaneProjectionNormalProjectionPositionSnapToImageAutoCloseCaptureRadiusImageSnapTypeNumberOfHandlesNumberOfHandlesInteraction ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Interaction  of  << this -> Interaction ) ; return this -> Interaction ; } ;
## Error: expected ';'!!!

proc InteractionOn*(this: var vtkImageTracerWidget) {.importcpp: "InteractionOn",
    header: "vtkImageTracerWidget.h".}
proc InteractionOff*(this: var vtkImageTracerWidget) {.importcpp: "InteractionOff",
    header: "vtkImageTracerWidget.h".}
  ## /@}
  ## *
  ##  Initialize the widget with a set of points and generate
  ##  lines between them.  If AutoClose is on it will handle the
  ##  case wherein the first and last points are congruent.
  ##
proc InitializeHandles*(this: var vtkImageTracerWidget; a2: ptr vtkPoints) {.
    importcpp: "InitializeHandles", header: "vtkImageTracerWidget.h".}
proc IsClosed*(this: var vtkImageTracerWidget): cint {.importcpp: "IsClosed",
    header: "vtkImageTracerWidget.h".}
proc SetProjectToPlaneAutoCloseCaptureRadiusHandleLeftMouseButton*(
    this: var vtkImageTracerWidget; _arg: vtkTypeBool) {.
    importcpp: "SetProjectToPlaneAutoCloseCaptureRadiusHandleLeftMouseButton",
    header: "vtkImageTracerWidget.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetProjectToPlaneProjectionNormalProjectionPositionSnapToImageAutoCloseCaptureRadiusImageSnapTypeNumberOfHandlesNumberOfHandlesInteractionHandleLeftMouseButton ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HandleLeftMouseButton  of  << this -> HandleLeftMouseButton ) ; return this -> HandleLeftMouseButton ; } ;
## Error: expected ';'!!!

proc HandleLeftMouseButtonOn*(this: var vtkImageTracerWidget) {.
    importcpp: "HandleLeftMouseButtonOn", header: "vtkImageTracerWidget.h".}
proc HandleLeftMouseButtonOff*(this: var vtkImageTracerWidget) {.
    importcpp: "HandleLeftMouseButtonOff", header: "vtkImageTracerWidget.h".}
proc SetProjectToPlaneAutoCloseCaptureRadiusHandleLeftMouseButtonHandleMiddleMouseButton*(
    this: var vtkImageTracerWidget; _arg: vtkTypeBool) {.importcpp: "SetProjectToPlaneAutoCloseCaptureRadiusHandleLeftMouseButtonHandleMiddleMouseButton",
    header: "vtkImageTracerWidget.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetProjectToPlaneProjectionNormalProjectionPositionSnapToImageAutoCloseCaptureRadiusImageSnapTypeNumberOfHandlesNumberOfHandlesInteractionHandleLeftMouseButtonHandleMiddleMouseButton ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HandleMiddleMouseButton  of  << this -> HandleMiddleMouseButton ) ; return this -> HandleMiddleMouseButton ; } ;
## Error: expected ';'!!!

proc HandleMiddleMouseButtonOn*(this: var vtkImageTracerWidget) {.
    importcpp: "HandleMiddleMouseButtonOn", header: "vtkImageTracerWidget.h".}
proc HandleMiddleMouseButtonOff*(this: var vtkImageTracerWidget) {.
    importcpp: "HandleMiddleMouseButtonOff", header: "vtkImageTracerWidget.h".}
proc SetProjectToPlaneAutoCloseCaptureRadiusHandleLeftMouseButtonHandleMiddleMouseButtonHandleRightMouseButton*(
    this: var vtkImageTracerWidget; _arg: vtkTypeBool) {.importcpp: "SetProjectToPlaneAutoCloseCaptureRadiusHandleLeftMouseButtonHandleMiddleMouseButtonHandleRightMouseButton",
    header: "vtkImageTracerWidget.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetProjectToPlaneProjectionNormalProjectionPositionSnapToImageAutoCloseCaptureRadiusImageSnapTypeNumberOfHandlesNumberOfHandlesInteractionHandleLeftMouseButtonHandleMiddleMouseButtonHandleRightMouseButton ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HandleRightMouseButton  of  << this -> HandleRightMouseButton ) ; return this -> HandleRightMouseButton ; } ;
## Error: expected ';'!!!

proc HandleRightMouseButtonOn*(this: var vtkImageTracerWidget) {.
    importcpp: "HandleRightMouseButtonOn", header: "vtkImageTracerWidget.h".}
proc HandleRightMouseButtonOff*(this: var vtkImageTracerWidget) {.
    importcpp: "HandleRightMouseButtonOff", header: "vtkImageTracerWidget.h".}
  ## /@}