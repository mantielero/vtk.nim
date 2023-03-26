## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBoxRepresentation.h
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
##  @class   vtkBoxRepresentation
##  @brief   a class defining the representation for the vtkBoxWidget2
##
##  This class is a concrete representation for the vtkBoxWidget2. It
##  represents a box with seven handles: one on each of the six faces, plus a
##  center handle. Through interaction with the widget, the box
##  representation can be arbitrarily positioned in the 3D space.
##
##  To use this representation, you normally use the PlaceWidget() method
##  to position the widget at a specified region in space.
##
##  @warning
##  This class, and vtkBoxWidget2, are second generation VTK
##  widgets. An earlier version of this functionality was defined in the
##  class vtkBoxWidget.
##
##  @sa
##  vtkBoxWidget2 vtkBoxWidget
##

import
  vtkInteractionWidgetsModule, vtkWidgetRepresentation

discard "forward decl of vtkActor"
discard "forward decl of vtkPolyDataMapper"
discard "forward decl of vtkLineSource"
discard "forward decl of vtkSphereSource"
discard "forward decl of vtkCellPicker"
discard "forward decl of vtkProperty"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkPoints"
discard "forward decl of vtkPolyDataAlgorithm"
discard "forward decl of vtkPointHandleRepresentation3D"
discard "forward decl of vtkTransform"
discard "forward decl of vtkPlane"
discard "forward decl of vtkPlanes"
discard "forward decl of vtkBox"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkMatrix4x4"
type
  vtkBoxRepresentation* {.importcpp: "vtkBoxRepresentation",
                         header: "vtkBoxRepresentation.h", bycopy.} = object of vtkWidgetRepresentation ## *
                                                                                                 ##  Instantiate the class.
                                                                                                 ##
    vtkBoxRepresentation* {.importc: "vtkBoxRepresentation".}: VTK_NEWINSTANCE
    ##  Constraint axis translation
    ##  the hexahedron (6 faces)
    ##  used by others as well
    ##  the normals of the faces
    ##  A face of the hexahedron
    ##  glyphs representing hot spots (e.g., handles)
    ##  Do the picking
    ##  Transform the hexahedral points (used for rotations)
    ##  Support GetBounds() method
    ##  Properties used to control the appearance of selected objects and
    ##  the manipulator in general.
    ##  The actual planes which are being manipulated
    ## "dir" is the direction in which the face can be moved i.e. the axis passing
    ##  through the center


proc New*(): ptr vtkBoxRepresentation {.importcpp: "vtkBoxRepresentation::New(@)",
                                    header: "vtkBoxRepresentation.h".}
type
  vtkBoxRepresentationSuperclass* = vtkWidgetRepresentation

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkBoxRepresentation::IsTypeOf(@)",
    header: "vtkBoxRepresentation.h".}
proc IsA*(this: var vtkBoxRepresentation; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkBoxRepresentation.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkBoxRepresentation {.
    importcpp: "vtkBoxRepresentation::SafeDownCast(@)",
    header: "vtkBoxRepresentation.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkBoxRepresentation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWidgetRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBoxRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBoxRepresentation :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkBoxRepresentation; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkBoxRepresentation.h".}
proc GetPlanes*(this: var vtkBoxRepresentation; planes: ptr vtkPlanes) {.
    importcpp: "GetPlanes", header: "vtkBoxRepresentation.h".}
proc GetUnderlyingPlane*(this: var vtkBoxRepresentation; i: cint): ptr vtkPlane {.
    importcpp: "GetUnderlyingPlane", header: "vtkBoxRepresentation.h".}
proc SetInsideOut*(this: var vtkBoxRepresentation; _arg: vtkTypeBool) {.
    importcpp: "SetInsideOut", header: "vtkBoxRepresentation.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetInsideOut ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InsideOut  of  << this -> InsideOut ) ; return this -> InsideOut ; } ;
## Error: expected ';'!!!

proc InsideOutOn*(this: var vtkBoxRepresentation) {.importcpp: "InsideOutOn",
    header: "vtkBoxRepresentation.h".}
proc InsideOutOff*(this: var vtkBoxRepresentation) {.importcpp: "InsideOutOff",
    header: "vtkBoxRepresentation.h".}
  ## /@}
  ## *
  ##  Retrieve a linear transform characterizing the transformation of the
  ##  box. Note that the transformation is relative to where PlaceWidget()
  ##  was initially called. This method modifies the transform provided. The
  ##  transform can be used to control the position of vtkProp3D's, as well as
  ##  other transformation operations (e.g., vtkTransformPolyData).
  ##
proc GetTransform*(this: var vtkBoxRepresentation; t: ptr vtkTransform) {.
    importcpp: "GetTransform", header: "vtkBoxRepresentation.h".}
proc SetTransform*(this: var vtkBoxRepresentation; t: ptr vtkTransform) {.
    importcpp: "SetTransform", header: "vtkBoxRepresentation.h".}
proc GetPolyData*(this: var vtkBoxRepresentation; pd: ptr vtkPolyData) {.
    importcpp: "GetPolyData", header: "vtkBoxRepresentation.h".}
proc GetnameHandleProperty*(this: var vtkBoxRepresentation): ptr vtkProperty {.
    importcpp: "GetnameHandleProperty", header: "vtkBoxRepresentation.h".}
proc GetnameHandlePropertySelectedHandleProperty*(this: var vtkBoxRepresentation): ptr vtkProperty {.
    importcpp: "GetnameHandlePropertySelectedHandleProperty",
    header: "vtkBoxRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the face properties (the faces of the box). The
  ##  properties of the face when selected and normal can be
  ##  set.
  ##
proc GetnameHandlePropertySelectedHandlePropertyFaceProperty*(
    this: var vtkBoxRepresentation): ptr vtkProperty {.
    importcpp: "GetnameHandlePropertySelectedHandlePropertyFaceProperty",
    header: "vtkBoxRepresentation.h".}
proc GetnameHandlePropertySelectedHandlePropertyFacePropertySelectedFaceProperty*(
    this: var vtkBoxRepresentation): ptr vtkProperty {.importcpp: "GetnameHandlePropertySelectedHandlePropertyFacePropertySelectedFaceProperty",
    header: "vtkBoxRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the outline properties (the outline of the box). The
  ##  properties of the outline when selected and normal can be
  ##  set.
  ##
proc GetnameHandlePropertySelectedHandlePropertyFacePropertySelectedFacePropertyOutlineProperty*(
    this: var vtkBoxRepresentation): ptr vtkProperty {.importcpp: "GetnameHandlePropertySelectedHandlePropertyFacePropertySelectedFacePropertyOutlineProperty",
    header: "vtkBoxRepresentation.h".}
proc GetnameHandlePropertySelectedHandlePropertyFacePropertySelectedFacePropertyOutlinePropertySelectedOutlineProperty*(
    this: var vtkBoxRepresentation): ptr vtkProperty {.importcpp: "GetnameHandlePropertySelectedHandlePropertyFacePropertySelectedFacePropertyOutlinePropertySelectedOutlineProperty",
    header: "vtkBoxRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Control the representation of the outline. This flag enables
  ##  face wires. By default face wires are off.
  ##
proc SetOutlineFaceWires*(this: var vtkBoxRepresentation; a2: cint) {.
    importcpp: "SetOutlineFaceWires", header: "vtkBoxRepresentation.h".}
## !!!Ignored construct:  virtual int GetInsideOutOutlineFaceWires ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutlineFaceWires  of  << this -> OutlineFaceWires ) ; return this -> OutlineFaceWires ; } ;
## Error: expected ';'!!!

proc OutlineFaceWiresOn*(this: var vtkBoxRepresentation) {.
    importcpp: "OutlineFaceWiresOn", header: "vtkBoxRepresentation.h".}
proc OutlineFaceWiresOff*(this: var vtkBoxRepresentation) {.
    importcpp: "OutlineFaceWiresOff", header: "vtkBoxRepresentation.h".}
proc SetOutlineCursorWires*(this: var vtkBoxRepresentation; a2: cint) {.
    importcpp: "SetOutlineCursorWires", header: "vtkBoxRepresentation.h".}
## !!!Ignored construct:  virtual int GetInsideOutOutlineFaceWiresOutlineCursorWires ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutlineCursorWires  of  << this -> OutlineCursorWires ) ; return this -> OutlineCursorWires ; } ;
## Error: expected ';'!!!

proc OutlineCursorWiresOn*(this: var vtkBoxRepresentation) {.
    importcpp: "OutlineCursorWiresOn", header: "vtkBoxRepresentation.h".}
proc OutlineCursorWiresOff*(this: var vtkBoxRepresentation) {.
    importcpp: "OutlineCursorWiresOff", header: "vtkBoxRepresentation.h".}
proc HandlesOn*(this: var vtkBoxRepresentation) {.importcpp: "HandlesOn",
    header: "vtkBoxRepresentation.h".}
proc HandlesOff*(this: var vtkBoxRepresentation) {.importcpp: "HandlesOff",
    header: "vtkBoxRepresentation.h".}
proc PlaceWidget*(this: var vtkBoxRepresentation; bounds: array[6, cdouble]) {.
    importcpp: "PlaceWidget", header: "vtkBoxRepresentation.h".}
proc BuildRepresentation*(this: var vtkBoxRepresentation) {.
    importcpp: "BuildRepresentation", header: "vtkBoxRepresentation.h".}
proc ComputeInteractionState*(this: var vtkBoxRepresentation; X: cint; Y: cint;
                             modify: cint = 0): cint {.
    importcpp: "ComputeInteractionState", header: "vtkBoxRepresentation.h".}
proc StartWidgetInteraction*(this: var vtkBoxRepresentation; e: array[2, cdouble]) {.
    importcpp: "StartWidgetInteraction", header: "vtkBoxRepresentation.h".}
proc WidgetInteraction*(this: var vtkBoxRepresentation; e: array[2, cdouble]) {.
    importcpp: "WidgetInteraction", header: "vtkBoxRepresentation.h".}
## !!!Ignored construct:  double * GetBounds ( ) VTK_SIZEHINT ( 6 ) override ;
## Error: expected ';'!!!

proc StartComplexInteraction*(this: var vtkBoxRepresentation;
                             iren: ptr vtkRenderWindowInteractor;
                             widget: ptr vtkAbstractWidget; event: culong;
                             calldata: pointer) {.
    importcpp: "StartComplexInteraction", header: "vtkBoxRepresentation.h".}
proc ComplexInteraction*(this: var vtkBoxRepresentation;
                        iren: ptr vtkRenderWindowInteractor;
                        widget: ptr vtkAbstractWidget; event: culong;
                        calldata: pointer) {.importcpp: "ComplexInteraction",
    header: "vtkBoxRepresentation.h".}
proc ComputeComplexInteractionState*(this: var vtkBoxRepresentation;
                                    iren: ptr vtkRenderWindowInteractor;
                                    widget: ptr vtkAbstractWidget; event: culong;
                                    calldata: pointer; modify: cint = 0): cint {.
    importcpp: "ComputeComplexInteractionState", header: "vtkBoxRepresentation.h".}
proc EndComplexInteraction*(this: var vtkBoxRepresentation;
                           iren: ptr vtkRenderWindowInteractor;
                           widget: ptr vtkAbstractWidget; event: culong;
                           calldata: pointer) {.
    importcpp: "EndComplexInteraction", header: "vtkBoxRepresentation.h".}
proc ReleaseGraphicsResources*(this: var vtkBoxRepresentation; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkBoxRepresentation.h".}
proc RenderOpaqueGeometry*(this: var vtkBoxRepresentation; a2: ptr vtkViewport): cint {.
    importcpp: "RenderOpaqueGeometry", header: "vtkBoxRepresentation.h".}
proc RenderTranslucentPolygonalGeometry*(this: var vtkBoxRepresentation;
                                        a2: ptr vtkViewport): cint {.
    importcpp: "RenderTranslucentPolygonalGeometry",
    header: "vtkBoxRepresentation.h".}
proc HasTranslucentPolygonalGeometry*(this: var vtkBoxRepresentation): vtkTypeBool {.
    importcpp: "HasTranslucentPolygonalGeometry", header: "vtkBoxRepresentation.h".}
const
  vtkBoxRepresentationOutside* = 0
  vtkBoxRepresentationMoveF0* = 1
  vtkBoxRepresentationMoveF1* = 2
  vtkBoxRepresentationMoveF2* = 3
  vtkBoxRepresentationMoveF3* = 4
  vtkBoxRepresentationMoveF4* = 5
  vtkBoxRepresentationMoveF5* = 6
  vtkBoxRepresentationTranslating* = 7
  vtkBoxRepresentationRotating* = 8
  vtkBoxRepresentationScaling* = 9

proc SetInteractionState*(this: var vtkBoxRepresentation; state: cint) {.
    importcpp: "SetInteractionState", header: "vtkBoxRepresentation.h".}
## !!!Ignored construct:  /@{ *
##  In two plane mode only the X planes are shown
##  this is useful for defining thick slabs
##  virtual bool GetInsideOutOutlineFaceWiresOutlineCursorWiresTwoPlaneModeTwoPlaneMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TwoPlaneMode  of  << this -> TwoPlaneMode ) ; return this -> TwoPlaneMode ; } ;
## Error: expected ';'!!!

proc SetTwoPlaneMode*(this: var vtkBoxRepresentation; a2: bool) {.
    importcpp: "SetTwoPlaneMode", header: "vtkBoxRepresentation.h".}
## !!!Ignored construct:  /@} /@{ *
##  For complex events should we snap orientations to
##  be aligned with the x y z axes
##  virtual bool GetInsideOutOutlineFaceWiresOutlineCursorWiresTwoPlaneModeTwoPlaneModeSnapToAxesSnapToAxes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SnapToAxes  of  << this -> SnapToAxes ) ; return this -> SnapToAxes ; } ;
## Error: expected ';'!!!

proc SetInsideOutSnapToAxes*(this: var vtkBoxRepresentation; _arg: bool) {.
    importcpp: "SetInsideOutSnapToAxes", header: "vtkBoxRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  For complex events should we snap orientations to
  ##  be aligned with the x y z axes
  ##
proc StepForward*(this: var vtkBoxRepresentation) {.importcpp: "StepForward",
    header: "vtkBoxRepresentation.h".}
proc StepBackward*(this: var vtkBoxRepresentation) {.importcpp: "StepBackward",
    header: "vtkBoxRepresentation.h".}
proc RegisterPickers*(this: var vtkBoxRepresentation) {.
    importcpp: "RegisterPickers", header: "vtkBoxRepresentation.h".}
## !!!Ignored construct:  /@{ *
##  Gets/Sets the constraint axis for translations. Returns Axis::NONE
##  if none.
##  virtual int GetInsideOutOutlineFaceWiresOutlineCursorWiresTwoPlaneModeTwoPlaneModeSnapToAxesSnapToAxesTranslationAxisTranslationAxis ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TranslationAxis  of  << this -> TranslationAxis ) ; return this -> TranslationAxis ; } ;
## Error: expected ';'!!!

proc SetTranslationAxis*(this: var vtkBoxRepresentation; _arg: cint) {.
    importcpp: "SetTranslationAxis", header: "vtkBoxRepresentation.h".}
proc GetTranslationAxisMinValue*(this: var vtkBoxRepresentation): cint {.
    importcpp: "GetTranslationAxisMinValue", header: "vtkBoxRepresentation.h".}
proc GetTranslationAxisMaxValue*(this: var vtkBoxRepresentation): cint {.
    importcpp: "GetTranslationAxisMaxValue", header: "vtkBoxRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Toggles constraint translation axis on/off.
  ##
proc SetXTranslationAxisOn*(this: var vtkBoxRepresentation) {.
    importcpp: "SetXTranslationAxisOn", header: "vtkBoxRepresentation.h".}
proc SetYTranslationAxisOn*(this: var vtkBoxRepresentation) {.
    importcpp: "SetYTranslationAxisOn", header: "vtkBoxRepresentation.h".}
proc SetZTranslationAxisOn*(this: var vtkBoxRepresentation) {.
    importcpp: "SetZTranslationAxisOn", header: "vtkBoxRepresentation.h".}
proc SetTranslationAxisOff*(this: var vtkBoxRepresentation) {.
    importcpp: "SetTranslationAxisOff", header: "vtkBoxRepresentation.h".}
proc IsTranslationConstrained*(this: var vtkBoxRepresentation): bool {.
    importcpp: "IsTranslationConstrained", header: "vtkBoxRepresentation.h".}
proc GetActors*(this: var vtkBoxRepresentation; a2: ptr vtkPropCollection) {.
    importcpp: "GetActors", header: "vtkBoxRepresentation.h".}