## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInteractorStyleRubberBandZoom.h
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
##  @class   vtkInteractorStyleRubberBandZoom
##  @brief   zoom in by amount indicated by rubber band box
##
##  This interactor style allows the user to draw a rectangle in the render
##  window using the left mouse button.  When the mouse button is released,
##  the current camera zooms by an amount determined from the shorter side of
##  the drawn rectangle.
##

import
  vtkInteractionStyleModule, vtkInteractorStyle, vtkRect

discard "forward decl of vtkUnsignedCharArray"
type
  vtkInteractorStyleRubberBandZoom* {.importcpp: "vtkInteractorStyleRubberBandZoom", header: "vtkInteractorStyleRubberBandZoom.h",
                                     bycopy.} = object of vtkInteractorStyle
    vtkInteractorStyleRubberBandZoom* {.importc: "vtkInteractorStyleRubberBandZoom".}: VTK_NEWINSTANCE


proc New*(): ptr vtkInteractorStyleRubberBandZoom {.
    importcpp: "vtkInteractorStyleRubberBandZoom::New(@)",
    header: "vtkInteractorStyleRubberBandZoom.h".}
type
  vtkInteractorStyleRubberBandZoomSuperclass* = vtkInteractorStyle

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkInteractorStyleRubberBandZoom::IsTypeOf(@)",
    header: "vtkInteractorStyleRubberBandZoom.h".}
proc IsA*(this: var vtkInteractorStyleRubberBandZoom; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkInteractorStyleRubberBandZoom.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkInteractorStyleRubberBandZoom {.
    importcpp: "vtkInteractorStyleRubberBandZoom::SafeDownCast(@)",
    header: "vtkInteractorStyleRubberBandZoom.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkInteractorStyleRubberBandZoom :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInteractorStyle :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInteractorStyleRubberBandZoom :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInteractorStyleRubberBandZoom :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkInteractorStyleRubberBandZoom; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkInteractorStyleRubberBandZoom.h".}
proc SetLockAspectToViewport*(this: var vtkInteractorStyleRubberBandZoom; _arg: bool) {.
    importcpp: "SetLockAspectToViewport",
    header: "vtkInteractorStyleRubberBandZoom.h".}
## !!!Ignored construct:  virtual bool GetLockAspectToViewport ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LockAspectToViewport  of  << this -> LockAspectToViewport ) ; return this -> LockAspectToViewport ; } ;
## Error: expected ';'!!!

proc LockAspectToViewportOn*(this: var vtkInteractorStyleRubberBandZoom) {.
    importcpp: "LockAspectToViewportOn",
    header: "vtkInteractorStyleRubberBandZoom.h".}
proc LockAspectToViewportOff*(this: var vtkInteractorStyleRubberBandZoom) {.
    importcpp: "LockAspectToViewportOff",
    header: "vtkInteractorStyleRubberBandZoom.h".}
  ## /@}
  ## /@{
  ## *
  ##  When set to true (default, false), the position where the user starts the
  ##  interaction is treated as the center of the box rather that one of the
  ##  corners of the box.
  ##
  ##  During interaction, modifier keys `Shift` or `Control` can be used to toggle
  ##  this flag temporarily. In other words, if `Shift` or `Control` key is pressed,
  ##  this class will act as if CenterAtStartPosition was opposite of what it is
  ##  set to.
  ##
proc SetLockAspectToViewportCenterAtStartPosition*(
    this: var vtkInteractorStyleRubberBandZoom; _arg: bool) {.
    importcpp: "SetLockAspectToViewportCenterAtStartPosition",
    header: "vtkInteractorStyleRubberBandZoom.h".}
## !!!Ignored construct:  virtual bool GetLockAspectToViewportCenterAtStartPosition ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CenterAtStartPosition  of  << this -> CenterAtStartPosition ) ; return this -> CenterAtStartPosition ; } ;
## Error: expected ';'!!!

proc CenterAtStartPositionOn*(this: var vtkInteractorStyleRubberBandZoom) {.
    importcpp: "CenterAtStartPositionOn",
    header: "vtkInteractorStyleRubberBandZoom.h".}
proc CenterAtStartPositionOff*(this: var vtkInteractorStyleRubberBandZoom) {.
    importcpp: "CenterAtStartPositionOff",
    header: "vtkInteractorStyleRubberBandZoom.h".}
  ## /@}
  ## /@{
  ## *
  ##  If camera is in perspective projection mode, this interactor style uses
  ##  vtkCamera::Dolly to dolly the camera ahead for zooming. However, that can
  ##  have unintended consequences such as the camera entering into the data.
  ##  Another option is to use vtkCamera::Zoom instead. In that case, the camera
  ##  position is left unchanged, instead the focal point is changed to the
  ##  center of the target box and then the view angle is changed to zoom in.
  ##  To use this approach, set this parameter to false (default, true).
  ##
proc SetLockAspectToViewportCenterAtStartPositionUseDollyForPerspectiveProjection*(
    this: var vtkInteractorStyleRubberBandZoom; _arg: bool) {.importcpp: "SetLockAspectToViewportCenterAtStartPositionUseDollyForPerspectiveProjection",
    header: "vtkInteractorStyleRubberBandZoom.h".}
## !!!Ignored construct:  virtual bool GetLockAspectToViewportCenterAtStartPositionUseDollyForPerspectiveProjection ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseDollyForPerspectiveProjection  of  << this -> UseDollyForPerspectiveProjection ) ; return this -> UseDollyForPerspectiveProjection ; } ;
## Error: expected ';'!!!

proc UseDollyForPerspectiveProjectionOn*(this: var vtkInteractorStyleRubberBandZoom) {.
    importcpp: "UseDollyForPerspectiveProjectionOn",
    header: "vtkInteractorStyleRubberBandZoom.h".}
proc UseDollyForPerspectiveProjectionOff*(
    this: var vtkInteractorStyleRubberBandZoom) {.
    importcpp: "UseDollyForPerspectiveProjectionOff",
    header: "vtkInteractorStyleRubberBandZoom.h".}
  ## /@}
  ## /@{
  ## *
  ##  Event bindings
  ##
proc OnMouseMove*(this: var vtkInteractorStyleRubberBandZoom) {.
    importcpp: "OnMouseMove", header: "vtkInteractorStyleRubberBandZoom.h".}
proc OnLeftButtonDown*(this: var vtkInteractorStyleRubberBandZoom) {.
    importcpp: "OnLeftButtonDown", header: "vtkInteractorStyleRubberBandZoom.h".}
proc OnLeftButtonUp*(this: var vtkInteractorStyleRubberBandZoom) {.
    importcpp: "OnLeftButtonUp", header: "vtkInteractorStyleRubberBandZoom.h".}