## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTextActor.h
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
##  @class   vtkTextActor
##  @brief   An actor that displays text. Scaled or unscaled
##
##  vtkTextActor can be used to place text annotation into a window.
##  When TextScaleMode is NONE, the text is fixed font and operation is
##  the same as a vtkPolyDataMapper2D/vtkActor2D pair.
##  When TextScaleMode is VIEWPORT, the font resizes such that it maintains a
##  consistent size relative to the viewport in which it is rendered.
##  When TextScaleMode is PROP, the font resizes such that the text fits inside
##  the box defined by the position 1 & 2 coordinates. This class replaces the
##  deprecated vtkScaledTextActor and acts as a convenient wrapper for
##  a vtkTextMapper/vtkActor2D pair.
##  Set the text property/attributes through the vtkTextProperty associated to
##  this actor.
##
##  @sa
##  vtkActor2D vtkPolyDataMapper vtkTextProperty vtkTextRenderer
##

import
  vtkRenderingCoreModule, vtkTexturedActor2D

discard "forward decl of vtkImageData"
discard "forward decl of vtkPoints"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkPolyDataMapper2D"
discard "forward decl of vtkProperty2D"
discard "forward decl of vtkTextProperty"
discard "forward decl of vtkTextRenderer"
discard "forward decl of vtkTransform"
type
  vtkTextActor* {.importcpp: "vtkTextActor", header: "vtkTextActor.h", bycopy.} = object of vtkTexturedActor2D ## *
                                                                                                     ##  Render Input to Image using the supplied font property.
                                                                                                     ##
    vtkTextActor* {.importc: "vtkTextActor".}: VTK_NEWINSTANCE
    ##  Stuff needed to display the image text as a texture map.

  vtkTextActorSuperclass* = vtkTexturedActor2D

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTextActor::IsTypeOf(@)", header: "vtkTextActor.h".}
proc IsA*(this: var vtkTextActor; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkTextActor.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTextActor {.
    importcpp: "vtkTextActor::SafeDownCast(@)", header: "vtkTextActor.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTextActor :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTexturedActor2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTextActor :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTextActor :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTextActor; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTextActor.h".}
proc New*(): ptr vtkTextActor {.importcpp: "vtkTextActor::New(@)",
                            header: "vtkTextActor.h".}
proc ShallowCopy*(this: var vtkTextActor; prop: ptr vtkProp) {.
    importcpp: "ShallowCopy", header: "vtkTextActor.h".}
proc SetInput*(this: var vtkTextActor; inputString: cstring) {.importcpp: "SetInput",
    header: "vtkTextActor.h".}
proc GetInput*(this: var vtkTextActor): cstring {.importcpp: "GetInput",
    header: "vtkTextActor.h".}
proc SetMinimumSize*(this: var vtkTextActor; _arg1: cint; _arg2: cint) {.
    importcpp: "SetMinimumSize", header: "vtkTextActor.h".}
proc SetMinimumSize*(this: var vtkTextActor; _arg: array[2, cint]) {.
    importcpp: "SetMinimumSize", header: "vtkTextActor.h".}
## !!!Ignored construct:  virtual int * GetMinimumSize ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << MinimumSize  pointer  << this -> MinimumSize ) ; return this -> MinimumSize ; } VTK_WRAPEXCLUDE virtual void GetMinimumSize ( int & _arg1 , int & _arg2 ) { _arg1 = this -> MinimumSize [ 0 ] ; _arg2 = this -> MinimumSize [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << MinimumSize  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetMinimumSize ( int _arg [ 2 ] ) { this -> GetMinimumSize ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetMaximumLineHeight*(this: var vtkTextActor; _arg: cfloat) {.
    importcpp: "SetMaximumLineHeight", header: "vtkTextActor.h".}
## !!!Ignored construct:  virtual float GetMaximumLineHeight ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumLineHeight  of  << this -> MaximumLineHeight ) ; return this -> MaximumLineHeight ; } ;
## Error: expected ';'!!!

proc SetTextScaleMode*(this: var vtkTextActor; _arg: cint) {.
    importcpp: "SetTextScaleMode", header: "vtkTextActor.h".}
proc GetTextScaleModeMinValue*(this: var vtkTextActor): cint {.
    importcpp: "GetTextScaleModeMinValue", header: "vtkTextActor.h".}
proc GetTextScaleModeMaxValue*(this: var vtkTextActor): cint {.
    importcpp: "GetTextScaleModeMaxValue", header: "vtkTextActor.h".}
## !!!Ignored construct:  virtual int GetMaximumLineHeightTextScaleMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TextScaleMode  of  << this -> TextScaleMode ) ; return this -> TextScaleMode ; } ;
## Error: expected ';'!!!

proc SetTextScaleModeToNone*(this: var vtkTextActor) {.
    importcpp: "SetTextScaleModeToNone", header: "vtkTextActor.h".}
proc SetTextScaleModeToProp*(this: var vtkTextActor) {.
    importcpp: "SetTextScaleModeToProp", header: "vtkTextActor.h".}
proc SetTextScaleModeToViewport*(this: var vtkTextActor) {.
    importcpp: "SetTextScaleModeToViewport", header: "vtkTextActor.h".}
const
  vtkTextActorTEXT_SCALE_MODE_NONE* = 0
  vtkTextActorTEXT_SCALE_MODE_PROP* = 1
  vtkTextActorTEXT_SCALE_MODE_VIEWPORT* = 2

proc SetMaximumLineHeightUseBorderAlign*(this: var vtkTextActor; _arg: vtkTypeBool) {.
    importcpp: "SetMaximumLineHeightUseBorderAlign", header: "vtkTextActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetMaximumLineHeightTextScaleModeUseBorderAlign ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseBorderAlign  of  << this -> UseBorderAlign ) ; return this -> UseBorderAlign ; } ;
## Error: expected ';'!!!

proc UseBorderAlignOn*(this: var vtkTextActor) {.importcpp: "UseBorderAlignOn",
    header: "vtkTextActor.h".}
proc UseBorderAlignOff*(this: var vtkTextActor) {.importcpp: "UseBorderAlignOff",
    header: "vtkTextActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  This method is being deprecated.  Use SetJustification and
  ##  SetVerticalJustification in text property instead.
  ##  Set/Get the Alignment point
  ##  if zero (default), the text aligns itself to the bottom left corner
  ##  (which is defined by the PositionCoordinate)
  ##  otherwise the text aligns itself to corner/midpoint or centre
  ##  @verbatim
  ##  6   7   8
  ##  3   4   5
  ##  0   1   2
  ##  @endverbatim
  ##  This is the same as setting the TextProperty's justification.
  ##  Currently TextActor is not oriented around its AlignmentPoint.
  ##
proc SetAlignmentPoint*(this: var vtkTextActor; point: cint) {.
    importcpp: "SetAlignmentPoint", header: "vtkTextActor.h".}
proc GetAlignmentPoint*(this: var vtkTextActor): cint {.
    importcpp: "GetAlignmentPoint", header: "vtkTextActor.h".}
proc SetOrientation*(this: var vtkTextActor; orientation: cfloat) {.
    importcpp: "SetOrientation", header: "vtkTextActor.h".}
## !!!Ignored construct:  virtual float GetMaximumLineHeightTextScaleModeUseBorderAlignOrientation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Orientation  of  << this -> Orientation ) ; return this -> Orientation ; } ;
## Error: expected ';'!!!

proc SetTextProperty*(this: var vtkTextActor; p: ptr vtkTextProperty) {.
    importcpp: "SetTextProperty", header: "vtkTextActor.h".}
proc GetnameTextProperty*(this: var vtkTextActor): ptr vtkTextProperty {.
    importcpp: "GetnameTextProperty", header: "vtkTextActor.h".}
  ## /@}
  ## *
  ##  Return the bounding box coordinates of the text in pixels.
  ##  The bbox array is populated with [ xmin, xmax, ymin, ymax ]
  ##  values in that order.
  ##
proc GetBoundingBox*(this: var vtkTextActor; vport: ptr vtkViewport;
                    bbox: array[4, cdouble]) {.importcpp: "GetBoundingBox",
    header: "vtkTextActor.h".}
proc GetSize*(this: var vtkTextActor; vport: ptr vtkViewport; size: array[2, cdouble]) {.
    importcpp: "GetSize", header: "vtkTextActor.h".}
proc SetConstrainedFontSize*(this: var vtkTextActor; a2: ptr vtkViewport;
                            targetWidth: cint; targetHeight: cint): cint {.
    importcpp: "SetConstrainedFontSize", header: "vtkTextActor.h".}
proc SetConstrainedFontSize*(a1: ptr vtkTextActor; a2: ptr vtkViewport;
                            targetWidth: cint; targetHeight: cint): cint {.
    importcpp: "vtkTextActor::SetConstrainedFontSize(@)", header: "vtkTextActor.h".}
proc SetMultipleConstrainedFontSize*(a1: ptr vtkViewport; targetWidth: cint;
                                    targetHeight: cint;
                                    actors: ptr ptr vtkTextActor; nbOfActors: cint;
                                    maxResultingSize: ptr cint): cint {.
    importcpp: "vtkTextActor::SetMultipleConstrainedFontSize(@)",
    header: "vtkTextActor.h".}
proc SetNonLinearFontScale*(this: var vtkTextActor; exponent: cdouble; target: cint) {.
    importcpp: "SetNonLinearFontScale", header: "vtkTextActor.h".}
proc SpecifiedToDisplay*(this: var vtkTextActor; pos: ptr cdouble;
                        vport: ptr vtkViewport; specified: cint) {.
    importcpp: "SpecifiedToDisplay", header: "vtkTextActor.h".}
proc DisplayToSpecified*(this: var vtkTextActor; pos: ptr cdouble;
                        vport: ptr vtkViewport; specified: cint) {.
    importcpp: "DisplayToSpecified", header: "vtkTextActor.h".}
proc ComputeScaledFont*(this: var vtkTextActor; viewport: ptr vtkViewport) {.
    importcpp: "ComputeScaledFont", header: "vtkTextActor.h".}
proc GetnameTextPropertyScaledTextProperty*(this: var vtkTextActor): ptr vtkTextProperty {.
    importcpp: "GetnameTextPropertyScaledTextProperty", header: "vtkTextActor.h".}
  ## /@}
  ## *
  ##  Provide a font scaling based on a viewport.  This is the scaling factor
  ##  used when the TextScaleMode is set to VIEWPORT and has been made public for
  ##  other components to use.  This scaling assumes that the long dimension of
  ##  the viewport is meant to be 6 inches (a typical width of text in a paper)
  ##  and then resizes based on if that long dimension was 72 DPI.
  ##
proc GetFontScale*(viewport: ptr vtkViewport): cfloat {.
    importcpp: "vtkTextActor::GetFontScale(@)", header: "vtkTextActor.h".}
proc ReleaseGraphicsResources*(this: var vtkTextActor; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkTextActor.h".}
proc RenderOpaqueGeometry*(this: var vtkTextActor; viewport: ptr vtkViewport): cint {.
    importcpp: "RenderOpaqueGeometry", header: "vtkTextActor.h".}
proc RenderTranslucentPolygonalGeometry*(this: var vtkTextActor; a2: ptr vtkViewport): cint {.
    importcpp: "RenderTranslucentPolygonalGeometry", header: "vtkTextActor.h".}
proc RenderOverlay*(this: var vtkTextActor; viewport: ptr vtkViewport): cint {.
    importcpp: "RenderOverlay", header: "vtkTextActor.h".}
proc HasTranslucentPolygonalGeometry*(this: var vtkTextActor): vtkTypeBool {.
    importcpp: "HasTranslucentPolygonalGeometry", header: "vtkTextActor.h".}