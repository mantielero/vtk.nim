## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTexturedButtonRepresentation2D.h
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
##  @class   vtkTexturedButtonRepresentation2D
##  @brief   defines a representation for a vtkButtonWidget
##
##  This class implements one type of vtkButtonRepresentation. It changes the
##  appearance of a user-provided polydata by assigning textures according to
##  the current button state. It also provides highlighting (when hovering and
##  selecting the button) by fiddling with the actor's property. Since this is
##  a 2D version, the button is rendered in the overlay plane. Typically it is
##  positioned in display coordinates, but it can be anchored to a world
##  position so it will appear to move as the camera moves.
##
##  To use this representation, always begin by specifying the number of
##  button states.  Then provide a polydata (the polydata should have associated
##  texture coordinates), and a list of textures cooresponding to the button
##  states. Optionally, the HoveringProperty and SelectionProperty can be
##  adjusted to obtain the appropriate appearance.
##
##  @warning
##  There are two variants of the PlaceWidget() method. The first PlaceWidget(bds[6])
##  allows the widget to be placed in the display coordinates fixed to the overlay
##  plane. The second PlaceWidget(anchor[3],size[2]) places the widget in world space;
##  hence it will appear to move as the camera moves around the scene.
##
##  @sa
##  vtkButtonWidget vtkButtonRepresentation vtkTexturedButtonRepresentation
##  vtkProp3DButtonRepresentation
##

import
  vtkButtonRepresentation, vtkInteractionWidgetsModule

discard "forward decl of vtkProperty2D"
discard "forward decl of vtkImageData"
discard "forward decl of vtkTextureArray"
discard "forward decl of vtkProperty2D"
discard "forward decl of vtkAlgorithmOutput"
discard "forward decl of vtkBalloonRepresentation"
discard "forward decl of vtkCoordinate"
type
  vtkTexturedButtonRepresentation2D* {.importcpp: "vtkTexturedButtonRepresentation2D", header: "vtkTexturedButtonRepresentation2D.h",
                                      bycopy.} = object of vtkButtonRepresentation ## *
                                                                              ##  Instantiate the class.
                                                                              ##
    vtkTexturedButtonRepresentation2D* {.importc: "vtkTexturedButtonRepresentation2D".}: VTK_NEWINSTANCE
    ##  Properties of the button
    ##  Tracking world position


proc New*(): ptr vtkTexturedButtonRepresentation2D {.
    importcpp: "vtkTexturedButtonRepresentation2D::New(@)",
    header: "vtkTexturedButtonRepresentation2D.h".}
type
  vtkTexturedButtonRepresentation2DSuperclass* = vtkButtonRepresentation

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTexturedButtonRepresentation2D::IsTypeOf(@)",
    header: "vtkTexturedButtonRepresentation2D.h".}
proc IsA*(this: var vtkTexturedButtonRepresentation2D; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTexturedButtonRepresentation2D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTexturedButtonRepresentation2D {.
    importcpp: "vtkTexturedButtonRepresentation2D::SafeDownCast(@)",
    header: "vtkTexturedButtonRepresentation2D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTexturedButtonRepresentation2D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkButtonRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTexturedButtonRepresentation2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTexturedButtonRepresentation2D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTexturedButtonRepresentation2D; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkTexturedButtonRepresentation2D.h".}
proc SetProperty*(this: var vtkTexturedButtonRepresentation2D; p: ptr vtkProperty2D) {.
    importcpp: "SetProperty", header: "vtkTexturedButtonRepresentation2D.h".}
proc GetnameProperty*(this: var vtkTexturedButtonRepresentation2D): ptr vtkProperty2D {.
    importcpp: "GetnameProperty", header: "vtkTexturedButtonRepresentation2D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify the property to use when the hovering over the button.
  ##
proc SetHoveringProperty*(this: var vtkTexturedButtonRepresentation2D;
                         p: ptr vtkProperty2D) {.importcpp: "SetHoveringProperty",
    header: "vtkTexturedButtonRepresentation2D.h".}
proc GetnamePropertyHoveringProperty*(this: var vtkTexturedButtonRepresentation2D): ptr vtkProperty2D {.
    importcpp: "GetnamePropertyHoveringProperty",
    header: "vtkTexturedButtonRepresentation2D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify the property to use when selecting the button.
  ##
proc SetSelectingProperty*(this: var vtkTexturedButtonRepresentation2D;
                          p: ptr vtkProperty2D) {.
    importcpp: "SetSelectingProperty",
    header: "vtkTexturedButtonRepresentation2D.h".}
proc GetnamePropertyHoveringPropertySelectingProperty*(
    this: var vtkTexturedButtonRepresentation2D): ptr vtkProperty2D {.
    importcpp: "GetnamePropertyHoveringPropertySelectingProperty",
    header: "vtkTexturedButtonRepresentation2D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Add the ith texture corresponding to the ith button state.
  ##  The parameter i should be 0<=i<NumberOfStates.
  ##
proc SetButtonTexture*(this: var vtkTexturedButtonRepresentation2D; i: cint;
                      image: ptr vtkImageData) {.importcpp: "SetButtonTexture",
    header: "vtkTexturedButtonRepresentation2D.h".}
proc GetButtonTexture*(this: var vtkTexturedButtonRepresentation2D; i: cint): ptr vtkImageData {.
    importcpp: "GetButtonTexture", header: "vtkTexturedButtonRepresentation2D.h".}
proc GetBalloon*(this: var vtkTexturedButtonRepresentation2D): ptr vtkBalloonRepresentation {.
    importcpp: "GetBalloon", header: "vtkTexturedButtonRepresentation2D.h".}
proc ComputeInteractionState*(this: var vtkTexturedButtonRepresentation2D; X: cint;
                             Y: cint; modify: cint = 0): cint {.
    importcpp: "ComputeInteractionState",
    header: "vtkTexturedButtonRepresentation2D.h".}
proc BuildRepresentation*(this: var vtkTexturedButtonRepresentation2D) {.
    importcpp: "BuildRepresentation",
    header: "vtkTexturedButtonRepresentation2D.h".}
proc Highlight*(this: var vtkTexturedButtonRepresentation2D; state: cint) {.
    importcpp: "Highlight", header: "vtkTexturedButtonRepresentation2D.h".}
proc PlaceWidget*(this: var vtkTexturedButtonRepresentation2D;
                 bounds: array[6, cdouble]) {.importcpp: "PlaceWidget",
    header: "vtkTexturedButtonRepresentation2D.h".}
proc PlaceWidget*(this: var vtkTexturedButtonRepresentation2D;
                 anchor: array[3, cdouble]; size: array[2, cint]) {.
    importcpp: "PlaceWidget", header: "vtkTexturedButtonRepresentation2D.h".}
proc ShallowCopy*(this: var vtkTexturedButtonRepresentation2D; prop: ptr vtkProp) {.
    importcpp: "ShallowCopy", header: "vtkTexturedButtonRepresentation2D.h".}
proc GetBounds*(this: var vtkTexturedButtonRepresentation2D): ptr cdouble {.
    importcpp: "GetBounds", header: "vtkTexturedButtonRepresentation2D.h".}
proc GetActors*(this: var vtkTexturedButtonRepresentation2D;
               pc: ptr vtkPropCollection) {.importcpp: "GetActors",
    header: "vtkTexturedButtonRepresentation2D.h".}
proc ReleaseGraphicsResources*(this: var vtkTexturedButtonRepresentation2D;
                              a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources",
    header: "vtkTexturedButtonRepresentation2D.h".}
proc RenderOverlay*(this: var vtkTexturedButtonRepresentation2D; a2: ptr vtkViewport): cint {.
    importcpp: "RenderOverlay", header: "vtkTexturedButtonRepresentation2D.h".}
proc HasTranslucentPolygonalGeometry*(this: var vtkTexturedButtonRepresentation2D): vtkTypeBool {.
    importcpp: "HasTranslucentPolygonalGeometry",
    header: "vtkTexturedButtonRepresentation2D.h".}