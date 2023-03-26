## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBoxWidget.h
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
##  @class   vtkBoxWidget
##  @brief   orthogonal hexahedron 3D widget
##
##  This 3D widget defines a region of interest that is represented by an
##  arbitrarily oriented hexahedron with interior face angles of 90 degrees
##  (orthogonal faces). The object creates 7 handles that can be moused on and
##  manipulated. The first six correspond to the six faces, the seventh is in
##  the center of the hexahedron. In addition, a bounding box outline is shown,
##  the "faces" of which can be selected for object rotation or scaling. A
##  nice feature of the object is that the vtkBoxWidget, like any 3D widget,
##  will work with the current interactor style. That is, if vtkBoxWidget does
##  not handle an event, then all other registered observers (including the
##  interactor style) have an opportunity to process the event. Otherwise, the
##  vtkBoxWidget will terminate the processing of the event that it handles.
##
##  To use this object, just invoke SetInteractor() with the argument of the
##  method a vtkRenderWindowInteractor.  You may also wish to invoke
##  "PlaceWidget()" to initially position the widget. The interactor will act
##  normally until the "i" key (for "interactor") is pressed, at which point the
##  vtkBoxWidget will appear. (See superclass documentation for information
##  about changing this behavior.) By grabbing the six face handles (use the
##  left mouse button), faces can be moved. By grabbing the center handle
##  (with the left mouse button), the entire hexahedron can be
##  translated. (Translation can also be employed by using the
##  "shift-left-mouse-button" combination inside of the widget.) Scaling is
##  achieved by using the right mouse button "up" the render window (makes the
##  widget bigger) or "down" the render window (makes the widget smaller). To
##  rotate vtkBoxWidget, pick a face (but not a face handle) and move the left
##  mouse. (Note: the mouse button must be held down during manipulation.)
##  Events that occur outside of the widget (i.e., no part of the widget is
##  picked) are propagated to any other registered obsevers (such as the
##  interaction style).  Turn off the widget by pressing the "i" key again.
##  (See the superclass documentation on key press activiation.)
##
##  The vtkBoxWidget is very flexible. It can be used to select, cut, clip, or
##  perform any other operation that depends on an implicit function (use the
##  GetPlanes() method); or it can be used to transform objects using a linear
##  transformation (use the GetTransform() method). Typical usage of the
##  widget is to make use of the StartInteractionEvent, InteractionEvent, and
##  EndInteractionEvent events. The InteractionEvent is called on mouse
##  motion; the other two events are called on button down and button up
##  (either left or right button).
##
##  Some additional features of this class include the ability to control the
##  rendered properties of the widget. You can set the properties of the
##  selected and unselected representations of the parts of the widget. For
##  example, you can set the property for the handles, faces, and outline in
##  their normal and selected states.
##
##  The box widget can be oriented by specifying a transformation matrix.
##  This transformation is applied to the initial bounding box as defined by
##  the PlaceWidget() method. DO NOT ASSUME that the transformation is applied
##  to a unit box centered at the origin; this is wrong!
##
##  @sa
##  vtk3DWidget vtkPointWidget vtkLineWidget vtkPlaneWidget
##  vtkImplicitPlaneWidget vtkImagePlaneWidget
##

import
  vtk3DWidget, vtkInteractionWidgetsModule

discard "forward decl of vtkActor"
discard "forward decl of vtkCellPicker"
discard "forward decl of vtkPlanes"
discard "forward decl of vtkPoints"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkPolyDataMapper"
discard "forward decl of vtkProp"
discard "forward decl of vtkProperty"
discard "forward decl of vtkSphereSource"
discard "forward decl of vtkTransform"
type
  vtkBoxWidget* {.importcpp: "vtkBoxWidget", header: "vtkBoxWidget.h", bycopy.} = object of vtk3DWidget ## *
                                                                                              ##  Instantiate the object.
                                                                                              ##
    vtkBoxWidget* {.importc: "vtkBoxWidget".}: VTK_NEWINSTANCE
    ##  used by others as well
    ##  the normals of the faces
    ##  A face of the hexahedron
    ##  glyphs representing hot spots (e.g., handles)
    ##  Do the picking
    ##  Register internal Pickers within PickingManager
    ##  Properties used to control the appearance of selected objects and
    ##  the manipulator in general.


proc New*(): ptr vtkBoxWidget {.importcpp: "vtkBoxWidget::New(@)",
                            header: "vtkBoxWidget.h".}
type
  vtkBoxWidgetSuperclass* = vtk3DWidget

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkBoxWidget::IsTypeOf(@)", header: "vtkBoxWidget.h".}
proc IsA*(this: var vtkBoxWidget; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkBoxWidget.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkBoxWidget {.
    importcpp: "vtkBoxWidget::SafeDownCast(@)", header: "vtkBoxWidget.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkBoxWidget :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtk3DWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBoxWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBoxWidget :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkBoxWidget; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkBoxWidget.h".}
proc SetEnabled*(this: var vtkBoxWidget; a2: cint) {.importcpp: "SetEnabled",
    header: "vtkBoxWidget.h".}
proc PlaceWidget*(this: var vtkBoxWidget; bounds: array[6, cdouble]) {.
    importcpp: "PlaceWidget", header: "vtkBoxWidget.h".}
proc PlaceWidget*(this: var vtkBoxWidget) {.importcpp: "PlaceWidget",
                                        header: "vtkBoxWidget.h".}
proc PlaceWidget*(this: var vtkBoxWidget; xmin: cdouble; xmax: cdouble; ymin: cdouble;
                 ymax: cdouble; zmin: cdouble; zmax: cdouble) {.
    importcpp: "PlaceWidget", header: "vtkBoxWidget.h".}
proc GetPlanes*(this: var vtkBoxWidget; planes: ptr vtkPlanes) {.
    importcpp: "GetPlanes", header: "vtkBoxWidget.h".}
proc SetInsideOut*(this: var vtkBoxWidget; _arg: vtkTypeBool) {.
    importcpp: "SetInsideOut", header: "vtkBoxWidget.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetInsideOut ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InsideOut  of  << this -> InsideOut ) ; return this -> InsideOut ; } ;
## Error: expected ';'!!!

proc InsideOutOn*(this: var vtkBoxWidget) {.importcpp: "InsideOutOn",
                                        header: "vtkBoxWidget.h".}
proc InsideOutOff*(this: var vtkBoxWidget) {.importcpp: "InsideOutOff",
    header: "vtkBoxWidget.h".}
  ## /@}
  ## *
  ##  Retrieve a linear transform characterizing the transformation of the
  ##  box. Note that the transformation is relative to where PlaceWidget
  ##  was initially called. This method modifies the transform provided. The
  ##  transform can be used to control the position of vtkProp3D's, as well as
  ##  other transformation operations (e.g., vtkTransformPolyData).
  ##
proc GetTransform*(this: var vtkBoxWidget; t: ptr vtkTransform) {.
    importcpp: "GetTransform", header: "vtkBoxWidget.h".}
proc SetTransform*(this: var vtkBoxWidget; t: ptr vtkTransform) {.
    importcpp: "SetTransform", header: "vtkBoxWidget.h".}
proc GetPolyData*(this: var vtkBoxWidget; pd: ptr vtkPolyData) {.
    importcpp: "GetPolyData", header: "vtkBoxWidget.h".}
proc GetnameHandleProperty*(this: var vtkBoxWidget): ptr vtkProperty {.
    importcpp: "GetnameHandleProperty", header: "vtkBoxWidget.h".}
proc GetnameHandlePropertySelectedHandleProperty*(this: var vtkBoxWidget): ptr vtkProperty {.
    importcpp: "GetnameHandlePropertySelectedHandleProperty",
    header: "vtkBoxWidget.h".}
  ## /@}
  ## /@{
  ## *
  ##  Switches handles (the spheres) on or off by manipulating the actor
  ##  visibility.
  ##
proc HandlesOn*(this: var vtkBoxWidget) {.importcpp: "HandlesOn",
                                      header: "vtkBoxWidget.h".}
proc HandlesOff*(this: var vtkBoxWidget) {.importcpp: "HandlesOff",
                                       header: "vtkBoxWidget.h".}
proc GetnameHandlePropertySelectedHandlePropertyFaceProperty*(
    this: var vtkBoxWidget): ptr vtkProperty {.
    importcpp: "GetnameHandlePropertySelectedHandlePropertyFaceProperty",
    header: "vtkBoxWidget.h".}
proc GetnameHandlePropertySelectedHandlePropertyFacePropertySelectedFaceProperty*(
    this: var vtkBoxWidget): ptr vtkProperty {.importcpp: "GetnameHandlePropertySelectedHandlePropertyFacePropertySelectedFaceProperty",
    header: "vtkBoxWidget.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the outline properties (the outline of the box). The
  ##  properties of the outline when selected and normal can be
  ##  set.
  ##
proc GetnameHandlePropertySelectedHandlePropertyFacePropertySelectedFacePropertyOutlineProperty*(
    this: var vtkBoxWidget): ptr vtkProperty {.importcpp: "GetnameHandlePropertySelectedHandlePropertyFacePropertySelectedFacePropertyOutlineProperty",
    header: "vtkBoxWidget.h".}
proc GetnameHandlePropertySelectedHandlePropertyFacePropertySelectedFacePropertyOutlinePropertySelectedOutlineProperty*(
    this: var vtkBoxWidget): ptr vtkProperty {.importcpp: "GetnameHandlePropertySelectedHandlePropertyFacePropertySelectedFacePropertyOutlinePropertySelectedOutlineProperty",
    header: "vtkBoxWidget.h".}
  ## /@}
  ## /@{
  ## *
  ##  Control the representation of the outline. This flag enables
  ##  face wires. By default face wires are off.
  ##
proc SetOutlineFaceWires*(this: var vtkBoxWidget; a2: cint) {.
    importcpp: "SetOutlineFaceWires", header: "vtkBoxWidget.h".}
## !!!Ignored construct:  virtual int GetInsideOutOutlineFaceWires ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutlineFaceWires  of  << this -> OutlineFaceWires ) ; return this -> OutlineFaceWires ; } ;
## Error: expected ';'!!!

proc OutlineFaceWiresOn*(this: var vtkBoxWidget) {.importcpp: "OutlineFaceWiresOn",
    header: "vtkBoxWidget.h".}
proc OutlineFaceWiresOff*(this: var vtkBoxWidget) {.
    importcpp: "OutlineFaceWiresOff", header: "vtkBoxWidget.h".}
proc SetOutlineCursorWires*(this: var vtkBoxWidget; a2: cint) {.
    importcpp: "SetOutlineCursorWires", header: "vtkBoxWidget.h".}
## !!!Ignored construct:  virtual int GetInsideOutOutlineFaceWiresOutlineCursorWires ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutlineCursorWires  of  << this -> OutlineCursorWires ) ; return this -> OutlineCursorWires ; } ;
## Error: expected ';'!!!

proc OutlineCursorWiresOn*(this: var vtkBoxWidget) {.
    importcpp: "OutlineCursorWiresOn", header: "vtkBoxWidget.h".}
proc OutlineCursorWiresOff*(this: var vtkBoxWidget) {.
    importcpp: "OutlineCursorWiresOff", header: "vtkBoxWidget.h".}
proc SetInsideOutTranslationEnabled*(this: var vtkBoxWidget; _arg: vtkTypeBool) {.
    importcpp: "SetInsideOutTranslationEnabled", header: "vtkBoxWidget.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetInsideOutOutlineFaceWiresOutlineCursorWiresTranslationEnabled ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TranslationEnabled  of  << this -> TranslationEnabled ) ; return this -> TranslationEnabled ; } ;
## Error: expected ';'!!!

proc TranslationEnabledOn*(this: var vtkBoxWidget) {.
    importcpp: "TranslationEnabledOn", header: "vtkBoxWidget.h".}
proc TranslationEnabledOff*(this: var vtkBoxWidget) {.
    importcpp: "TranslationEnabledOff", header: "vtkBoxWidget.h".}
proc SetInsideOutTranslationEnabledScalingEnabled*(this: var vtkBoxWidget;
    _arg: vtkTypeBool) {.importcpp: "SetInsideOutTranslationEnabledScalingEnabled",
                       header: "vtkBoxWidget.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetInsideOutOutlineFaceWiresOutlineCursorWiresTranslationEnabledScalingEnabled ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalingEnabled  of  << this -> ScalingEnabled ) ; return this -> ScalingEnabled ; } ;
## Error: expected ';'!!!

proc ScalingEnabledOn*(this: var vtkBoxWidget) {.importcpp: "ScalingEnabledOn",
    header: "vtkBoxWidget.h".}
proc ScalingEnabledOff*(this: var vtkBoxWidget) {.importcpp: "ScalingEnabledOff",
    header: "vtkBoxWidget.h".}
proc SetInsideOutTranslationEnabledScalingEnabledRotationEnabled*(
    this: var vtkBoxWidget; _arg: vtkTypeBool) {.
    importcpp: "SetInsideOutTranslationEnabledScalingEnabledRotationEnabled",
    header: "vtkBoxWidget.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetInsideOutOutlineFaceWiresOutlineCursorWiresTranslationEnabledScalingEnabledRotationEnabled ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RotationEnabled  of  << this -> RotationEnabled ) ; return this -> RotationEnabled ; } ;
## Error: expected ';'!!!

proc RotationEnabledOn*(this: var vtkBoxWidget) {.importcpp: "RotationEnabledOn",
    header: "vtkBoxWidget.h".}
proc RotationEnabledOff*(this: var vtkBoxWidget) {.importcpp: "RotationEnabledOff",
    header: "vtkBoxWidget.h".}
  ## /@}