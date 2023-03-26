## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTensorRepresentation.h
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
##  @class   vtkTensorRepresentation
##  @brief   class defining a representation for the vtkTensorWidget
##
##  This class is a concrete representation for the vtkTensorWidget. In
##  summary, it allows the editing of a tensor glyph (by modifying the
##  underlying tensor value). This includes controlling the position, scaling,
##  and rotation of the glyph. The representation is simply an oriented,
##  scaled box which can be manipulated to transform the tensor. Optionally,
##  an ellipsoid defined by the tensor eigenvectors can be shown for
##  informational purposes.
##
##  To use this representation, specify a 3x3 real, symmetric matrix defining
##  the tensor. (This implicitly defines an orthogonal basis from the three
##  tensor eigenvectors.) Then use PlaceWidget() to define a bounding box: the
##  bounding box defines a position for the tensor from its center point, and
##  the representation is scaled to fit in the bounding box.
##
##  Note: typical usage is to place a tensor glyph inside of the
##  representation (i.e., the box) which is updated as the representation is
##  manipulated by the user. The built-in ellipsoid can be used for this;
##  alternatively through callbacks and such, it is possible to place
##  other glyph types such as superquadrics.
##
##  @sa
##  vtkTensorWidget vtkBoxRepresentation
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
discard "forward decl of vtkMatrix4x4"
discard "forward decl of vtkPlane"
discard "forward decl of vtkPlanes"
discard "forward decl of vtkBox"
discard "forward decl of vtkDoubleArray"
type
  vtkTensorRepresentation* {.importcpp: "vtkTensorRepresentation",
                            header: "vtkTensorRepresentation.h", bycopy.} = object of vtkWidgetRepresentation ## /@{
                                                                                                       ## *
                                                                                                       ##  Standard methods for instantiation, obtaining type information, and printing.
                                                                                                       ##
    vtkTensorRepresentation* {.importc: "vtkTensorRepresentation".}: VTK_NEWINSTANCE
    ##  stored as 3x3 symmetric matrix
    ##  Manage how the representation appears
    ##  Constraint axis translation
    ##  the hexahedron (6 faces)
    ##  used by others as well
    ##  the normals of the faces
    ##  A face of the hexahedron
    ##  glyphs representing hot spots (e.g., handles)
    ##  the tensor ellipsoid and transforms
    ##  Do the picking
    ##  Transform the hexahedral points (used for rotations)
    ##  Support GetBounds() method
    ##  Properties used to control the appearance of selected objects and
    ##  the manipulator in general.
    ##  The actual planes which are being manipulated
    ## "dir" is the direction in which the face can be moved i.e. the axis passing
    ##  through the center


proc New*(): ptr vtkTensorRepresentation {.importcpp: "vtkTensorRepresentation::New(@)",
                                       header: "vtkTensorRepresentation.h".}
type
  vtkTensorRepresentationSuperclass* = vtkWidgetRepresentation

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTensorRepresentation::IsTypeOf(@)",
    header: "vtkTensorRepresentation.h".}
proc IsA*(this: var vtkTensorRepresentation; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTensorRepresentation.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTensorRepresentation {.
    importcpp: "vtkTensorRepresentation::SafeDownCast(@)",
    header: "vtkTensorRepresentation.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTensorRepresentation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWidgetRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTensorRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTensorRepresentation :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTensorRepresentation; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTensorRepresentation.h".}
proc SetTensor*(this: var vtkTensorRepresentation; tensor: array[9, cdouble]) {.
    importcpp: "SetTensor", header: "vtkTensorRepresentation.h".}
proc SetSymmetricTensor*(this: var vtkTensorRepresentation;
                        symTensor: array[6, cdouble]) {.
    importcpp: "SetSymmetricTensor", header: "vtkTensorRepresentation.h".}
proc GetTensor*(this: var vtkTensorRepresentation; tensor: array[9, cdouble]) {.
    importcpp: "GetTensor", header: "vtkTensorRepresentation.h".}
proc GetSymmetricTensor*(this: var vtkTensorRepresentation;
                        symTensor: array[6, cdouble]) {.
    importcpp: "GetSymmetricTensor", header: "vtkTensorRepresentation.h".}
proc GetEigenvalues*(this: var vtkTensorRepresentation; evals: array[3, cdouble]) {.
    importcpp: "GetEigenvalues", header: "vtkTensorRepresentation.h".}
proc GetEigenvector*(this: var vtkTensorRepresentation; n: cint; ev: array[3, cdouble]) {.
    importcpp: "GetEigenvector", header: "vtkTensorRepresentation.h".}
proc SetPosition*(this: var vtkTensorRepresentation; pos: array[3, cdouble]) {.
    importcpp: "SetPosition", header: "vtkTensorRepresentation.h".}
proc GetPosition*(this: var vtkTensorRepresentation; pos: array[3, cdouble]) {.
    importcpp: "GetPosition", header: "vtkTensorRepresentation.h".}
proc GetPolyData*(this: var vtkTensorRepresentation; pd: ptr vtkPolyData) {.
    importcpp: "GetPolyData", header: "vtkTensorRepresentation.h".}
proc GetnameHandleProperty*(this: var vtkTensorRepresentation): ptr vtkProperty {.
    importcpp: "GetnameHandleProperty", header: "vtkTensorRepresentation.h".}
proc GetnameHandlePropertySelectedHandleProperty*(
    this: var vtkTensorRepresentation): ptr vtkProperty {.
    importcpp: "GetnameHandlePropertySelectedHandleProperty",
    header: "vtkTensorRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the face properties (the faces of the box). The
  ##  properties of the face when selected and normal can be
  ##  set.
  ##
proc GetnameHandlePropertySelectedHandlePropertyFaceProperty*(
    this: var vtkTensorRepresentation): ptr vtkProperty {.
    importcpp: "GetnameHandlePropertySelectedHandlePropertyFaceProperty",
    header: "vtkTensorRepresentation.h".}
proc GetnameHandlePropertySelectedHandlePropertyFacePropertySelectedFaceProperty*(
    this: var vtkTensorRepresentation): ptr vtkProperty {.importcpp: "GetnameHandlePropertySelectedHandlePropertyFacePropertySelectedFaceProperty",
    header: "vtkTensorRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the outline properties (the outline of the box). The
  ##  properties of the outline when selected and normal can be
  ##  set.
  ##
proc GetnameHandlePropertySelectedHandlePropertyFacePropertySelectedFacePropertyOutlineProperty*(
    this: var vtkTensorRepresentation): ptr vtkProperty {.importcpp: "GetnameHandlePropertySelectedHandlePropertyFacePropertySelectedFacePropertyOutlineProperty",
    header: "vtkTensorRepresentation.h".}
proc GetnameHandlePropertySelectedHandlePropertyFacePropertySelectedFacePropertyOutlinePropertySelectedOutlineProperty*(
    this: var vtkTensorRepresentation): ptr vtkProperty {.importcpp: "GetnameHandlePropertySelectedHandlePropertyFacePropertySelectedFacePropertyOutlinePropertySelectedOutlineProperty",
    header: "vtkTensorRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the tensor ellipsoid properties. If visibility is enabled,
  ##  the ellipsoid will be rendered with this property.
  ##
proc GetnameHandlePropertySelectedHandlePropertyFacePropertySelectedFacePropertyOutlinePropertySelectedOutlinePropertyEllipsoidProperty*(
    this: var vtkTensorRepresentation): ptr vtkProperty {.importcpp: "GetnameHandlePropertySelectedHandlePropertyFacePropertySelectedFacePropertyOutlinePropertySelectedOutlinePropertyEllipsoidProperty",
    header: "vtkTensorRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Control the representation of the outline. This flag enables
  ##  face wires. By default face wires are off.
  ##
proc SetOutlineFaceWires*(this: var vtkTensorRepresentation; a2: bool) {.
    importcpp: "SetOutlineFaceWires", header: "vtkTensorRepresentation.h".}
## !!!Ignored construct:  virtual bool GetOutlineFaceWires ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutlineFaceWires  of  << this -> OutlineFaceWires ) ; return this -> OutlineFaceWires ; } ;
## Error: expected ';'!!!

proc OutlineFaceWiresOn*(this: var vtkTensorRepresentation) {.
    importcpp: "OutlineFaceWiresOn", header: "vtkTensorRepresentation.h".}
proc OutlineFaceWiresOff*(this: var vtkTensorRepresentation) {.
    importcpp: "OutlineFaceWiresOff", header: "vtkTensorRepresentation.h".}
proc SetOutlineCursorWires*(this: var vtkTensorRepresentation; a2: bool) {.
    importcpp: "SetOutlineCursorWires", header: "vtkTensorRepresentation.h".}
## !!!Ignored construct:  virtual bool GetOutlineFaceWiresOutlineCursorWires ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutlineCursorWires  of  << this -> OutlineCursorWires ) ; return this -> OutlineCursorWires ; } ;
## Error: expected ';'!!!

proc OutlineCursorWiresOn*(this: var vtkTensorRepresentation) {.
    importcpp: "OutlineCursorWiresOn", header: "vtkTensorRepresentation.h".}
proc OutlineCursorWiresOff*(this: var vtkTensorRepresentation) {.
    importcpp: "OutlineCursorWiresOff", header: "vtkTensorRepresentation.h".}
proc HandlesOn*(this: var vtkTensorRepresentation) {.importcpp: "HandlesOn",
    header: "vtkTensorRepresentation.h".}
proc HandlesOff*(this: var vtkTensorRepresentation) {.importcpp: "HandlesOff",
    header: "vtkTensorRepresentation.h".}
proc SetTensorEllipsoid*(this: var vtkTensorRepresentation; a2: bool) {.
    importcpp: "SetTensorEllipsoid", header: "vtkTensorRepresentation.h".}
## !!!Ignored construct:  virtual bool GetOutlineFaceWiresOutlineCursorWiresTensorEllipsoid ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TensorEllipsoid  of  << this -> TensorEllipsoid ) ; return this -> TensorEllipsoid ; } ;
## Error: expected ';'!!!

proc TensorEllipsoidOn*(this: var vtkTensorRepresentation) {.
    importcpp: "TensorEllipsoidOn", header: "vtkTensorRepresentation.h".}
proc TensorEllipsoidOff*(this: var vtkTensorRepresentation) {.
    importcpp: "TensorEllipsoidOff", header: "vtkTensorRepresentation.h".}
proc PlaceTensor*(this: var vtkTensorRepresentation; tensor: array[9, cdouble];
                 position: array[3, cdouble]) {.importcpp: "PlaceTensor",
    header: "vtkTensorRepresentation.h".}
proc PlaceWidget*(this: var vtkTensorRepresentation; bounds: array[6, cdouble]) {.
    importcpp: "PlaceWidget", header: "vtkTensorRepresentation.h".}
proc BuildRepresentation*(this: var vtkTensorRepresentation) {.
    importcpp: "BuildRepresentation", header: "vtkTensorRepresentation.h".}
proc ComputeInteractionState*(this: var vtkTensorRepresentation; X: cint; Y: cint;
                             modify: cint = 0): cint {.
    importcpp: "ComputeInteractionState", header: "vtkTensorRepresentation.h".}
proc StartWidgetInteraction*(this: var vtkTensorRepresentation; e: array[2, cdouble]) {.
    importcpp: "StartWidgetInteraction", header: "vtkTensorRepresentation.h".}
proc WidgetInteraction*(this: var vtkTensorRepresentation; e: array[2, cdouble]) {.
    importcpp: "WidgetInteraction", header: "vtkTensorRepresentation.h".}
## !!!Ignored construct:  double * GetBounds ( ) VTK_SIZEHINT ( 6 ) override ;
## Error: expected ';'!!!

proc StartComplexInteraction*(this: var vtkTensorRepresentation;
                             iren: ptr vtkRenderWindowInteractor;
                             widget: ptr vtkAbstractWidget; event: culong;
                             calldata: pointer) {.
    importcpp: "StartComplexInteraction", header: "vtkTensorRepresentation.h".}
proc ComplexInteraction*(this: var vtkTensorRepresentation;
                        iren: ptr vtkRenderWindowInteractor;
                        widget: ptr vtkAbstractWidget; event: culong;
                        calldata: pointer) {.importcpp: "ComplexInteraction",
    header: "vtkTensorRepresentation.h".}
proc ComputeComplexInteractionState*(this: var vtkTensorRepresentation;
                                    iren: ptr vtkRenderWindowInteractor;
                                    widget: ptr vtkAbstractWidget; event: culong;
                                    calldata: pointer; modify: cint = 0): cint {.
    importcpp: "ComputeComplexInteractionState",
    header: "vtkTensorRepresentation.h".}
proc EndComplexInteraction*(this: var vtkTensorRepresentation;
                           iren: ptr vtkRenderWindowInteractor;
                           widget: ptr vtkAbstractWidget; event: culong;
                           calldata: pointer) {.
    importcpp: "EndComplexInteraction", header: "vtkTensorRepresentation.h".}
proc ReleaseGraphicsResources*(this: var vtkTensorRepresentation; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkTensorRepresentation.h".}
proc RenderOpaqueGeometry*(this: var vtkTensorRepresentation; a2: ptr vtkViewport): cint {.
    importcpp: "RenderOpaqueGeometry", header: "vtkTensorRepresentation.h".}
proc RenderTranslucentPolygonalGeometry*(this: var vtkTensorRepresentation;
                                        a2: ptr vtkViewport): cint {.
    importcpp: "RenderTranslucentPolygonalGeometry",
    header: "vtkTensorRepresentation.h".}
proc HasTranslucentPolygonalGeometry*(this: var vtkTensorRepresentation): vtkTypeBool {.
    importcpp: "HasTranslucentPolygonalGeometry",
    header: "vtkTensorRepresentation.h".}
const
  vtkTensorRepresentationOutside* = 0
  vtkTensorRepresentationMoveF0* = 1
  vtkTensorRepresentationMoveF1* = 2
  vtkTensorRepresentationMoveF2* = 3
  vtkTensorRepresentationMoveF3* = 4
  vtkTensorRepresentationMoveF4* = 5
  vtkTensorRepresentationMoveF5* = 6
  vtkTensorRepresentationTranslating* = 7
  vtkTensorRepresentationRotating* = 8
  vtkTensorRepresentationScaling* = 9

proc SetInteractionState*(this: var vtkTensorRepresentation; state: cint) {.
    importcpp: "SetInteractionState", header: "vtkTensorRepresentation.h".}
## !!!Ignored construct:  /@{ *
##  For complex events should we snap orientations to
##  be aligned with the x y z axes
##  virtual bool GetOutlineFaceWiresOutlineCursorWiresTensorEllipsoidSnapToAxesSnapToAxes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SnapToAxes  of  << this -> SnapToAxes ) ; return this -> SnapToAxes ; } ;
## Error: expected ';'!!!

proc SetSnapToAxes*(this: var vtkTensorRepresentation; _arg: bool) {.
    importcpp: "SetSnapToAxes", header: "vtkTensorRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  For complex events should we snap orientations to
  ##  be aligned with the x y z axes
  ##
proc StepForward*(this: var vtkTensorRepresentation) {.importcpp: "StepForward",
    header: "vtkTensorRepresentation.h".}
proc StepBackward*(this: var vtkTensorRepresentation) {.importcpp: "StepBackward",
    header: "vtkTensorRepresentation.h".}
proc RegisterPickers*(this: var vtkTensorRepresentation) {.
    importcpp: "RegisterPickers", header: "vtkTensorRepresentation.h".}
## !!!Ignored construct:  /@{ *
##  Gets/Sets the constraint axis for translations. Returns Axis::NONE
##  if none.
##  virtual int GetOutlineFaceWiresOutlineCursorWiresTensorEllipsoidSnapToAxesSnapToAxesTranslationAxisTranslationAxis ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TranslationAxis  of  << this -> TranslationAxis ) ; return this -> TranslationAxis ; } ;
## Error: expected ';'!!!

proc SetTranslationAxis*(this: var vtkTensorRepresentation; _arg: cint) {.
    importcpp: "SetTranslationAxis", header: "vtkTensorRepresentation.h".}
proc GetTranslationAxisMinValue*(this: var vtkTensorRepresentation): cint {.
    importcpp: "GetTranslationAxisMinValue", header: "vtkTensorRepresentation.h".}
proc GetTranslationAxisMaxValue*(this: var vtkTensorRepresentation): cint {.
    importcpp: "GetTranslationAxisMaxValue", header: "vtkTensorRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Toggles constraint translation axis on/off.
  ##
proc SetXTranslationAxisOn*(this: var vtkTensorRepresentation) {.
    importcpp: "SetXTranslationAxisOn", header: "vtkTensorRepresentation.h".}
proc SetYTranslationAxisOn*(this: var vtkTensorRepresentation) {.
    importcpp: "SetYTranslationAxisOn", header: "vtkTensorRepresentation.h".}
proc SetZTranslationAxisOn*(this: var vtkTensorRepresentation) {.
    importcpp: "SetZTranslationAxisOn", header: "vtkTensorRepresentation.h".}
proc SetTranslationAxisOff*(this: var vtkTensorRepresentation) {.
    importcpp: "SetTranslationAxisOff", header: "vtkTensorRepresentation.h".}
proc IsTranslationConstrained*(this: var vtkTensorRepresentation): bool {.
    importcpp: "IsTranslationConstrained", header: "vtkTensorRepresentation.h".}