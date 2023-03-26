## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLegendScaleActor.h
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
##  @class   vtkLegendScaleActor
##  @brief   annotate the render window with scale and distance information
##
##  This class is used to annotate the render window. Its basic goal is to
##  provide an indication of the scale of the scene. Four axes surrounding the
##  render window indicate (in a variety of ways) the scale of what the camera
##  is viewing. An option also exists for displaying a scale legend.
##
##  The axes can be programmed either to display distance scales or x-y
##  coordinate values. By default, the scales display a distance. However,
##  if you know that the view is down the z-axis, the scales can be programmed
##  to display x-y coordinate values.
##
##  @warning
##  Please be aware that the axes and scale values are subject to perspective
##  effects. The distances are computed in the focal plane of the camera.
##  When there are large view angles (i.e., perspective projection), the
##  computed distances may provide users the wrong sense of scale. These
##  effects are not present when parallel projection is enabled.
##

import
  vtkCoordinate, vtkProp, vtkRenderingAnnotationModule

discard "forward decl of vtkAxisActor2D"
discard "forward decl of vtkTextProperty"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkPolyDataMapper2D"
discard "forward decl of vtkActor2D"
discard "forward decl of vtkTextMapper"
discard "forward decl of vtkPoints"
discard "forward decl of vtkCoordinate"
type
  vtkLegendScaleActor* {.importcpp: "vtkLegendScaleActor",
                        header: "vtkLegendScaleActor.h", bycopy.} = object of vtkProp ## *
                                                                               ##  Instantiate the class.
                                                                               ##
    vtkLegendScaleActor* {.importc: "vtkLegendScaleActor".}: VTK_NEWINSTANCE
    ##  The four axes around the borders of the renderer
    ##  Control the display of the axes
    ##  Support for the legend.


proc New*(): ptr vtkLegendScaleActor {.importcpp: "vtkLegendScaleActor::New(@)",
                                   header: "vtkLegendScaleActor.h".}
type
  vtkLegendScaleActorSuperclass* = vtkProp

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkLegendScaleActor::IsTypeOf(@)", header: "vtkLegendScaleActor.h".}
proc IsA*(this: var vtkLegendScaleActor; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkLegendScaleActor.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkLegendScaleActor {.
    importcpp: "vtkLegendScaleActor::SafeDownCast(@)",
    header: "vtkLegendScaleActor.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkLegendScaleActor :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkProp :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLegendScaleActor :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLegendScaleActor :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkLegendScaleActor; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkLegendScaleActor.h".}
type
  vtkLegendScaleActorAttributeLocation* {.size: sizeof(cint),
      importcpp: "vtkLegendScaleActor::AttributeLocation",
      header: "vtkLegendScaleActor.h".} = enum
    DISTANCE = 0, XY_COORDINATES = 1


proc SetLabelMode*(this: var vtkLegendScaleActor; _arg: cint) {.
    importcpp: "SetLabelMode", header: "vtkLegendScaleActor.h".}
proc GetLabelModeMinValue*(this: var vtkLegendScaleActor): cint {.
    importcpp: "GetLabelModeMinValue", header: "vtkLegendScaleActor.h".}
proc GetLabelModeMaxValue*(this: var vtkLegendScaleActor): cint {.
    importcpp: "GetLabelModeMaxValue", header: "vtkLegendScaleActor.h".}
## !!!Ignored construct:  virtual int GetLabelMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LabelMode  of  << this -> LabelMode ) ; return this -> LabelMode ; } ;
## Error: expected ';'!!!

proc SetLabelModeToDistance*(this: var vtkLegendScaleActor) {.
    importcpp: "SetLabelModeToDistance", header: "vtkLegendScaleActor.h".}
proc SetLabelModeToXYCoordinates*(this: var vtkLegendScaleActor) {.
    importcpp: "SetLabelModeToXYCoordinates", header: "vtkLegendScaleActor.h".}
proc SetRightAxisVisibility*(this: var vtkLegendScaleActor; _arg: vtkTypeBool) {.
    importcpp: "SetRightAxisVisibility", header: "vtkLegendScaleActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetLabelModeRightAxisVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RightAxisVisibility  of  << this -> RightAxisVisibility ) ; return this -> RightAxisVisibility ; } ;
## Error: expected ';'!!!

proc RightAxisVisibilityOn*(this: var vtkLegendScaleActor) {.
    importcpp: "RightAxisVisibilityOn", header: "vtkLegendScaleActor.h".}
proc RightAxisVisibilityOff*(this: var vtkLegendScaleActor) {.
    importcpp: "RightAxisVisibilityOff", header: "vtkLegendScaleActor.h".}
proc SetRightAxisVisibilityTopAxisVisibility*(this: var vtkLegendScaleActor;
    _arg: vtkTypeBool) {.importcpp: "SetRightAxisVisibilityTopAxisVisibility",
                       header: "vtkLegendScaleActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetLabelModeRightAxisVisibilityTopAxisVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TopAxisVisibility  of  << this -> TopAxisVisibility ) ; return this -> TopAxisVisibility ; } ;
## Error: expected ';'!!!

proc TopAxisVisibilityOn*(this: var vtkLegendScaleActor) {.
    importcpp: "TopAxisVisibilityOn", header: "vtkLegendScaleActor.h".}
proc TopAxisVisibilityOff*(this: var vtkLegendScaleActor) {.
    importcpp: "TopAxisVisibilityOff", header: "vtkLegendScaleActor.h".}
proc SetRightAxisVisibilityTopAxisVisibilityLeftAxisVisibility*(
    this: var vtkLegendScaleActor; _arg: vtkTypeBool) {.
    importcpp: "SetRightAxisVisibilityTopAxisVisibilityLeftAxisVisibility",
    header: "vtkLegendScaleActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetLabelModeRightAxisVisibilityTopAxisVisibilityLeftAxisVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LeftAxisVisibility  of  << this -> LeftAxisVisibility ) ; return this -> LeftAxisVisibility ; } ;
## Error: expected ';'!!!

proc LeftAxisVisibilityOn*(this: var vtkLegendScaleActor) {.
    importcpp: "LeftAxisVisibilityOn", header: "vtkLegendScaleActor.h".}
proc LeftAxisVisibilityOff*(this: var vtkLegendScaleActor) {.
    importcpp: "LeftAxisVisibilityOff", header: "vtkLegendScaleActor.h".}
proc SetRightAxisVisibilityTopAxisVisibilityLeftAxisVisibilityBottomAxisVisibility*(
    this: var vtkLegendScaleActor; _arg: vtkTypeBool) {.importcpp: "SetRightAxisVisibilityTopAxisVisibilityLeftAxisVisibilityBottomAxisVisibility",
    header: "vtkLegendScaleActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetLabelModeRightAxisVisibilityTopAxisVisibilityLeftAxisVisibilityBottomAxisVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BottomAxisVisibility  of  << this -> BottomAxisVisibility ) ; return this -> BottomAxisVisibility ; } ;
## Error: expected ';'!!!

proc BottomAxisVisibilityOn*(this: var vtkLegendScaleActor) {.
    importcpp: "BottomAxisVisibilityOn", header: "vtkLegendScaleActor.h".}
proc BottomAxisVisibilityOff*(this: var vtkLegendScaleActor) {.
    importcpp: "BottomAxisVisibilityOff", header: "vtkLegendScaleActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Indicate whether the legend scale should be displayed or not.
  ##  The default is On.
  ##
proc SetRightAxisVisibilityTopAxisVisibilityLeftAxisVisibilityBottomAxisVisibilityLegendVisibility*(
    this: var vtkLegendScaleActor; _arg: vtkTypeBool) {.importcpp: "SetRightAxisVisibilityTopAxisVisibilityLeftAxisVisibilityBottomAxisVisibilityLegendVisibility",
    header: "vtkLegendScaleActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetLabelModeRightAxisVisibilityTopAxisVisibilityLeftAxisVisibilityBottomAxisVisibilityLegendVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LegendVisibility  of  << this -> LegendVisibility ) ; return this -> LegendVisibility ; } ;
## Error: expected ';'!!!

proc LegendVisibilityOn*(this: var vtkLegendScaleActor) {.
    importcpp: "LegendVisibilityOn", header: "vtkLegendScaleActor.h".}
proc LegendVisibilityOff*(this: var vtkLegendScaleActor) {.
    importcpp: "LegendVisibilityOff", header: "vtkLegendScaleActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Convenience method that turns all the axes either on or off.
  ##
proc AllAxesOn*(this: var vtkLegendScaleActor) {.importcpp: "AllAxesOn",
    header: "vtkLegendScaleActor.h".}
proc AllAxesOff*(this: var vtkLegendScaleActor) {.importcpp: "AllAxesOff",
    header: "vtkLegendScaleActor.h".}
proc AllAnnotationsOn*(this: var vtkLegendScaleActor) {.
    importcpp: "AllAnnotationsOn", header: "vtkLegendScaleActor.h".}
proc AllAnnotationsOff*(this: var vtkLegendScaleActor) {.
    importcpp: "AllAnnotationsOff", header: "vtkLegendScaleActor.h".}
proc SetLabelModeRightBorderOffset*(this: var vtkLegendScaleActor; _arg: cint) {.
    importcpp: "SetLabelModeRightBorderOffset", header: "vtkLegendScaleActor.h".}
proc GetLabelModeMinValueRightBorderOffsetMinValue*(this: var vtkLegendScaleActor): cint {.
    importcpp: "GetLabelModeMinValueRightBorderOffsetMinValue",
    header: "vtkLegendScaleActor.h".}
proc GetLabelModeMaxValueRightBorderOffsetMaxValue*(this: var vtkLegendScaleActor): cint {.
    importcpp: "GetLabelModeMaxValueRightBorderOffsetMaxValue",
    header: "vtkLegendScaleActor.h".}
## !!!Ignored construct:  virtual int GetLabelModeRightAxisVisibilityTopAxisVisibilityLeftAxisVisibilityBottomAxisVisibilityLegendVisibilityRightBorderOffset ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RightBorderOffset  of  << this -> RightBorderOffset ) ; return this -> RightBorderOffset ; } ;
## Error: expected ';'!!!

proc SetLabelModeRightBorderOffsetTopBorderOffset*(this: var vtkLegendScaleActor;
    _arg: cint) {.importcpp: "SetLabelModeRightBorderOffsetTopBorderOffset",
                header: "vtkLegendScaleActor.h".}
proc GetLabelModeMinValueRightBorderOffsetMinValueTopBorderOffsetMinValue*(
    this: var vtkLegendScaleActor): cint {.importcpp: "GetLabelModeMinValueRightBorderOffsetMinValueTopBorderOffsetMinValue",
                                       header: "vtkLegendScaleActor.h".}
proc GetLabelModeMaxValueRightBorderOffsetMaxValueTopBorderOffsetMaxValue*(
    this: var vtkLegendScaleActor): cint {.importcpp: "GetLabelModeMaxValueRightBorderOffsetMaxValueTopBorderOffsetMaxValue",
                                       header: "vtkLegendScaleActor.h".}
## !!!Ignored construct:  virtual int GetLabelModeRightAxisVisibilityTopAxisVisibilityLeftAxisVisibilityBottomAxisVisibilityLegendVisibilityRightBorderOffsetTopBorderOffset ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TopBorderOffset  of  << this -> TopBorderOffset ) ; return this -> TopBorderOffset ; } ;
## Error: expected ';'!!!

proc SetLabelModeRightBorderOffsetTopBorderOffsetLeftBorderOffset*(
    this: var vtkLegendScaleActor; _arg: cint) {.
    importcpp: "SetLabelModeRightBorderOffsetTopBorderOffsetLeftBorderOffset",
    header: "vtkLegendScaleActor.h".}
proc GetLabelModeMinValueRightBorderOffsetMinValueTopBorderOffsetMinValueLeftBorderOffsetMinValue*(
    this: var vtkLegendScaleActor): cint {.importcpp: "GetLabelModeMinValueRightBorderOffsetMinValueTopBorderOffsetMinValueLeftBorderOffsetMinValue",
                                       header: "vtkLegendScaleActor.h".}
proc GetLabelModeMaxValueRightBorderOffsetMaxValueTopBorderOffsetMaxValueLeftBorderOffsetMaxValue*(
    this: var vtkLegendScaleActor): cint {.importcpp: "GetLabelModeMaxValueRightBorderOffsetMaxValueTopBorderOffsetMaxValueLeftBorderOffsetMaxValue",
                                       header: "vtkLegendScaleActor.h".}
## !!!Ignored construct:  virtual int GetLabelModeRightAxisVisibilityTopAxisVisibilityLeftAxisVisibilityBottomAxisVisibilityLegendVisibilityRightBorderOffsetTopBorderOffsetLeftBorderOffset ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LeftBorderOffset  of  << this -> LeftBorderOffset ) ; return this -> LeftBorderOffset ; } ;
## Error: expected ';'!!!

proc SetLabelModeRightBorderOffsetTopBorderOffsetLeftBorderOffsetBottomBorderOffset*(
    this: var vtkLegendScaleActor; _arg: cint) {.importcpp: "SetLabelModeRightBorderOffsetTopBorderOffsetLeftBorderOffsetBottomBorderOffset",
    header: "vtkLegendScaleActor.h".}
proc GetLabelModeMinValueRightBorderOffsetMinValueTopBorderOffsetMinValueLeftBorderOffsetMinValueBottomBorderOffsetMinValue*(
    this: var vtkLegendScaleActor): cint {.importcpp: "GetLabelModeMinValueRightBorderOffsetMinValueTopBorderOffsetMinValueLeftBorderOffsetMinValueBottomBorderOffsetMinValue",
                                       header: "vtkLegendScaleActor.h".}
proc GetLabelModeMaxValueRightBorderOffsetMaxValueTopBorderOffsetMaxValueLeftBorderOffsetMaxValueBottomBorderOffsetMaxValue*(
    this: var vtkLegendScaleActor): cint {.importcpp: "GetLabelModeMaxValueRightBorderOffsetMaxValueTopBorderOffsetMaxValueLeftBorderOffsetMaxValueBottomBorderOffsetMaxValue",
                                       header: "vtkLegendScaleActor.h".}
## !!!Ignored construct:  virtual int GetLabelModeRightAxisVisibilityTopAxisVisibilityLeftAxisVisibilityBottomAxisVisibilityLegendVisibilityRightBorderOffsetTopBorderOffsetLeftBorderOffsetBottomBorderOffset ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BottomBorderOffset  of  << this -> BottomBorderOffset ) ; return this -> BottomBorderOffset ; } ;
## Error: expected ';'!!!

proc SetLabelModeRightBorderOffsetTopBorderOffsetLeftBorderOffsetBottomBorderOffsetCornerOffsetFactor*(
    this: var vtkLegendScaleActor; _arg: cdouble) {.importcpp: "SetLabelModeRightBorderOffsetTopBorderOffsetLeftBorderOffsetBottomBorderOffsetCornerOffsetFactor",
    header: "vtkLegendScaleActor.h".}
proc GetLabelModeMinValueRightBorderOffsetMinValueTopBorderOffsetMinValueLeftBorderOffsetMinValueBottomBorderOffsetMinValueCornerOffsetFactorMinValue*(
    this: var vtkLegendScaleActor): cdouble {.importcpp: "GetLabelModeMinValueRightBorderOffsetMinValueTopBorderOffsetMinValueLeftBorderOffsetMinValueBottomBorderOffsetMinValueCornerOffsetFactorMinValue",
    header: "vtkLegendScaleActor.h".}
proc GetLabelModeMaxValueRightBorderOffsetMaxValueTopBorderOffsetMaxValueLeftBorderOffsetMaxValueBottomBorderOffsetMaxValueCornerOffsetFactorMaxValue*(
    this: var vtkLegendScaleActor): cdouble {.importcpp: "GetLabelModeMaxValueRightBorderOffsetMaxValueTopBorderOffsetMaxValueLeftBorderOffsetMaxValueBottomBorderOffsetMaxValueCornerOffsetFactorMaxValue",
    header: "vtkLegendScaleActor.h".}
## !!!Ignored construct:  virtual double GetLabelModeRightAxisVisibilityTopAxisVisibilityLeftAxisVisibilityBottomAxisVisibilityLegendVisibilityRightBorderOffsetTopBorderOffsetLeftBorderOffsetBottomBorderOffsetCornerOffsetFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CornerOffsetFactor  of  << this -> CornerOffsetFactor ) ; return this -> CornerOffsetFactor ; } ;
## Error: expected ';'!!!

proc GetnameLegendTitleProperty*(this: var vtkLegendScaleActor): ptr vtkTextProperty {.
    importcpp: "GetnameLegendTitleProperty", header: "vtkLegendScaleActor.h".}
proc GetnameLegendTitlePropertyLegendLabelProperty*(this: var vtkLegendScaleActor): ptr vtkTextProperty {.
    importcpp: "GetnameLegendTitlePropertyLegendLabelProperty",
    header: "vtkLegendScaleActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  These are methods to retrieve the vtkAxisActors used to represent
  ##  the four axes that form this representation. Users may retrieve and
  ##  then modify these axes to control their appearance.
  ##
proc GetnameLegendTitlePropertyLegendLabelPropertyRightAxis*(
    this: var vtkLegendScaleActor): ptr vtkAxisActor2D {.
    importcpp: "GetnameLegendTitlePropertyLegendLabelPropertyRightAxis",
    header: "vtkLegendScaleActor.h".}
proc GetnameLegendTitlePropertyLegendLabelPropertyRightAxisTopAxis*(
    this: var vtkLegendScaleActor): ptr vtkAxisActor2D {.
    importcpp: "GetnameLegendTitlePropertyLegendLabelPropertyRightAxisTopAxis",
    header: "vtkLegendScaleActor.h".}
proc GetnameLegendTitlePropertyLegendLabelPropertyRightAxisTopAxisLeftAxis*(
    this: var vtkLegendScaleActor): ptr vtkAxisActor2D {.importcpp: "GetnameLegendTitlePropertyLegendLabelPropertyRightAxisTopAxisLeftAxis",
    header: "vtkLegendScaleActor.h".}
proc GetnameLegendTitlePropertyLegendLabelPropertyRightAxisTopAxisLeftAxisBottomAxis*(
    this: var vtkLegendScaleActor): ptr vtkAxisActor2D {.importcpp: "GetnameLegendTitlePropertyLegendLabelPropertyRightAxisTopAxisLeftAxisBottomAxis",
    header: "vtkLegendScaleActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Standard methods supporting the rendering process.
  ##
proc BuildRepresentation*(this: var vtkLegendScaleActor; viewport: ptr vtkViewport) {.
    importcpp: "BuildRepresentation", header: "vtkLegendScaleActor.h".}
proc GetActors2D*(this: var vtkLegendScaleActor; a2: ptr vtkPropCollection) {.
    importcpp: "GetActors2D", header: "vtkLegendScaleActor.h".}
proc ReleaseGraphicsResources*(this: var vtkLegendScaleActor; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkLegendScaleActor.h".}
proc RenderOverlay*(this: var vtkLegendScaleActor; a2: ptr vtkViewport): cint {.
    importcpp: "RenderOverlay", header: "vtkLegendScaleActor.h".}
proc RenderOpaqueGeometry*(this: var vtkLegendScaleActor; a2: ptr vtkViewport): cint {.
    importcpp: "RenderOpaqueGeometry", header: "vtkLegendScaleActor.h".}