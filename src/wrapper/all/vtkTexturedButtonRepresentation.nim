## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTexturedButtonRepresentation.h
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
##  @class   vtkTexturedButtonRepresentation
##  @brief   defines a representation for a vtkButtonWidget
##
##  This class implements one type of vtkButtonRepresentation. It changes the
##  appearance of a user-provided polydata by assigning textures according to the
##  current button state. It also provides highlighting (when hovering and
##  selecting the button) by fiddling with the actor's property.
##
##  To use this representation, always begin by specifying the number of
##  button states.  Then provide a polydata (the polydata should have associated
##  texture coordinates), and a list of textures cooresponding to the button
##  states. Optionally, the HoveringProperty and SelectionProperty can be
##  adjusted to obtain the appropriate appearance.
##
##  This widget representation has two placement methods. The conventional
##  PlaceWidget() method is used to locate the textured button inside of a
##  user-specified bounding box (note that the button geometry is uniformly
##  scaled to fit, thus two of the three dimensions can be "large" and the
##  third used to perform the scaling). However this PlaceWidget() method will
##  align the geometry within x-y-z oriented bounds. To further control the
##  placement, use the additional PlaceWidget(scale,point,normal) method. This
##  scales the geometry, places its center at the specified point position,
##  and orients the geometry's z-direction parallel to the specified normal.
##  This can be used to attach "sticky notes" or "sticky buttons" to the
##  surface of objects.
##
##  @sa
##  vtkButtonWidget vtkButtonRepresentation vtkButtonSource vtkEllipticalButtonSource
##  vtkRectangularButtonSource
##

import
  vtkButtonRepresentation, vtkInteractionWidgetsModule

discard "forward decl of vtkCellPicker"
discard "forward decl of vtkActor"
discard "forward decl of vtkProperty"
discard "forward decl of vtkImageData"
discard "forward decl of vtkTextureArray"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkPolyDataMapper"
discard "forward decl of vtkAlgorithmOutput"
discard "forward decl of vtkTexture"
discard "forward decl of vtkFollower"
type
  vtkTexturedButtonRepresentation* {.importcpp: "vtkTexturedButtonRepresentation", header: "vtkTexturedButtonRepresentation.h",
                                    bycopy.} = object of vtkButtonRepresentation ## *
                                                                            ##  Instantiate the class.
                                                                            ##
    vtkTexturedButtonRepresentation* {.importc: "vtkTexturedButtonRepresentation".}: VTK_NEWINSTANCE
    ##  Camera
    ##  Properties of the button
    ##  For picking the button


proc New*(): ptr vtkTexturedButtonRepresentation {.
    importcpp: "vtkTexturedButtonRepresentation::New(@)",
    header: "vtkTexturedButtonRepresentation.h".}
type
  vtkTexturedButtonRepresentationSuperclass* = vtkButtonRepresentation

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTexturedButtonRepresentation::IsTypeOf(@)",
    header: "vtkTexturedButtonRepresentation.h".}
proc IsA*(this: var vtkTexturedButtonRepresentation; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTexturedButtonRepresentation.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTexturedButtonRepresentation {.
    importcpp: "vtkTexturedButtonRepresentation::SafeDownCast(@)",
    header: "vtkTexturedButtonRepresentation.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTexturedButtonRepresentation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkButtonRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTexturedButtonRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTexturedButtonRepresentation :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTexturedButtonRepresentation; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkTexturedButtonRepresentation.h".}
proc SetButtonGeometry*(this: var vtkTexturedButtonRepresentation;
                       pd: ptr vtkPolyData) {.importcpp: "SetButtonGeometry",
    header: "vtkTexturedButtonRepresentation.h".}
proc SetButtonGeometryConnection*(this: var vtkTexturedButtonRepresentation;
                                 algOutput: ptr vtkAlgorithmOutput) {.
    importcpp: "SetButtonGeometryConnection",
    header: "vtkTexturedButtonRepresentation.h".}
proc GetButtonGeometry*(this: var vtkTexturedButtonRepresentation): ptr vtkPolyData {.
    importcpp: "GetButtonGeometry", header: "vtkTexturedButtonRepresentation.h".}
proc SetFollowCamera*(this: var vtkTexturedButtonRepresentation; _arg: vtkTypeBool) {.
    importcpp: "SetFollowCamera", header: "vtkTexturedButtonRepresentation.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetFollowCamera ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FollowCamera  of  << this -> FollowCamera ) ; return this -> FollowCamera ; } ;
## Error: expected ';'!!!

proc FollowCameraOn*(this: var vtkTexturedButtonRepresentation) {.
    importcpp: "FollowCameraOn", header: "vtkTexturedButtonRepresentation.h".}
proc FollowCameraOff*(this: var vtkTexturedButtonRepresentation) {.
    importcpp: "FollowCameraOff", header: "vtkTexturedButtonRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify the property to use when the button is to appear "normal"
  ##  i.e., the mouse pointer is not hovering or selecting the button.
  ##
proc SetProperty*(this: var vtkTexturedButtonRepresentation; p: ptr vtkProperty) {.
    importcpp: "SetProperty", header: "vtkTexturedButtonRepresentation.h".}
proc GetnameProperty*(this: var vtkTexturedButtonRepresentation): ptr vtkProperty {.
    importcpp: "GetnameProperty", header: "vtkTexturedButtonRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify the property to use when the hovering over the button.
  ##
proc SetHoveringProperty*(this: var vtkTexturedButtonRepresentation;
                         p: ptr vtkProperty) {.importcpp: "SetHoveringProperty",
    header: "vtkTexturedButtonRepresentation.h".}
proc GetnamePropertyHoveringProperty*(this: var vtkTexturedButtonRepresentation): ptr vtkProperty {.
    importcpp: "GetnamePropertyHoveringProperty",
    header: "vtkTexturedButtonRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify the property to use when selecting the button.
  ##
proc SetSelectingProperty*(this: var vtkTexturedButtonRepresentation;
                          p: ptr vtkProperty) {.importcpp: "SetSelectingProperty",
    header: "vtkTexturedButtonRepresentation.h".}
proc GetnamePropertyHoveringPropertySelectingProperty*(
    this: var vtkTexturedButtonRepresentation): ptr vtkProperty {.
    importcpp: "GetnamePropertyHoveringPropertySelectingProperty",
    header: "vtkTexturedButtonRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Add the ith texture corresponding to the ith button state.
  ##  The parameter i should be (0 <= i < NumberOfStates).
  ##
proc SetButtonTexture*(this: var vtkTexturedButtonRepresentation; i: cint;
                      image: ptr vtkImageData) {.importcpp: "SetButtonTexture",
    header: "vtkTexturedButtonRepresentation.h".}
proc GetButtonTexture*(this: var vtkTexturedButtonRepresentation; i: cint): ptr vtkImageData {.
    importcpp: "GetButtonTexture", header: "vtkTexturedButtonRepresentation.h".}
proc PlaceWidget*(this: var vtkTexturedButtonRepresentation; scale: cdouble;
                 point: array[3, cdouble]; normal: array[3, cdouble]) {.
    importcpp: "PlaceWidget", header: "vtkTexturedButtonRepresentation.h".}
proc ComputeInteractionState*(this: var vtkTexturedButtonRepresentation; X: cint;
                             Y: cint; modify: cint = 0): cint {.
    importcpp: "ComputeInteractionState",
    header: "vtkTexturedButtonRepresentation.h".}
proc PlaceWidget*(this: var vtkTexturedButtonRepresentation;
                 bounds: array[6, cdouble]) {.importcpp: "PlaceWidget",
    header: "vtkTexturedButtonRepresentation.h".}
proc BuildRepresentation*(this: var vtkTexturedButtonRepresentation) {.
    importcpp: "BuildRepresentation", header: "vtkTexturedButtonRepresentation.h".}
proc Highlight*(this: var vtkTexturedButtonRepresentation; state: cint) {.
    importcpp: "Highlight", header: "vtkTexturedButtonRepresentation.h".}
proc ShallowCopy*(this: var vtkTexturedButtonRepresentation; prop: ptr vtkProp) {.
    importcpp: "ShallowCopy", header: "vtkTexturedButtonRepresentation.h".}
proc GetBounds*(this: var vtkTexturedButtonRepresentation): ptr cdouble {.
    importcpp: "GetBounds", header: "vtkTexturedButtonRepresentation.h".}
proc GetActors*(this: var vtkTexturedButtonRepresentation; pc: ptr vtkPropCollection) {.
    importcpp: "GetActors", header: "vtkTexturedButtonRepresentation.h".}
proc ReleaseGraphicsResources*(this: var vtkTexturedButtonRepresentation;
                              a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources",
    header: "vtkTexturedButtonRepresentation.h".}
proc RenderOpaqueGeometry*(this: var vtkTexturedButtonRepresentation;
                          a2: ptr vtkViewport): cint {.
    importcpp: "RenderOpaqueGeometry", header: "vtkTexturedButtonRepresentation.h".}
proc RenderTranslucentPolygonalGeometry*(this: var vtkTexturedButtonRepresentation;
                                        a2: ptr vtkViewport): cint {.
    importcpp: "RenderTranslucentPolygonalGeometry",
    header: "vtkTexturedButtonRepresentation.h".}
proc HasTranslucentPolygonalGeometry*(this: var vtkTexturedButtonRepresentation): vtkTypeBool {.
    importcpp: "HasTranslucentPolygonalGeometry",
    header: "vtkTexturedButtonRepresentation.h".}
proc RegisterPickers*(this: var vtkTexturedButtonRepresentation) {.
    importcpp: "RegisterPickers", header: "vtkTexturedButtonRepresentation.h".}