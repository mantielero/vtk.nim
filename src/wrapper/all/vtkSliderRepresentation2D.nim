## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSliderRepresentation2D.h
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
##  @class   vtkSliderRepresentation2D
##  @brief   provide the representation for a vtkSliderWidget with a 3D skin
##
##  This class is used to represent and render a vtkSliderWidget. To use this
##  class, you must at a minimum specify the end points of the
##  slider. Optional instance variable can be used to modify the appearance of
##  the widget.
##
##
##  @sa
##  vtkSliderWidget
##

import
  vtkCoordinate, vtkInteractionWidgetsModule, vtkSliderRepresentation

discard "forward decl of vtkPoints"
discard "forward decl of vtkCellArray"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkPolyDataMapper2D"
discard "forward decl of vtkActor2D"
discard "forward decl of vtkCoordinate"
discard "forward decl of vtkProperty2D"
discard "forward decl of vtkPropCollection"
discard "forward decl of vtkWindow"
discard "forward decl of vtkViewport"
discard "forward decl of vtkTransform"
discard "forward decl of vtkTransformPolyDataFilter"
discard "forward decl of vtkTextProperty"
discard "forward decl of vtkTextMapper"
discard "forward decl of vtkTextActor"
type
  vtkSliderRepresentation2D* {.importcpp: "vtkSliderRepresentation2D",
                              header: "vtkSliderRepresentation2D.h", bycopy.} = object of vtkSliderRepresentation ## *
                                                                                                           ##  Instantiate the class.
                                                                                                           ##
    vtkSliderRepresentation2D* {.importc: "vtkSliderRepresentation2D".}: VTK_NEWINSTANCE
    ##  Determine the parameter t along the slider
    ##  internal variables used for computation


proc New*(): ptr vtkSliderRepresentation2D {.
    importcpp: "vtkSliderRepresentation2D::New(@)",
    header: "vtkSliderRepresentation2D.h".}
type
  vtkSliderRepresentation2DSuperclass* = vtkSliderRepresentation

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSliderRepresentation2D::IsTypeOf(@)",
    header: "vtkSliderRepresentation2D.h".}
proc IsA*(this: var vtkSliderRepresentation2D; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkSliderRepresentation2D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSliderRepresentation2D {.
    importcpp: "vtkSliderRepresentation2D::SafeDownCast(@)",
    header: "vtkSliderRepresentation2D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSliderRepresentation2D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkSliderRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSliderRepresentation2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSliderRepresentation2D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSliderRepresentation2D; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkSliderRepresentation2D.h".}
proc GetPoint1Coordinate*(this: var vtkSliderRepresentation2D): ptr vtkCoordinate {.
    importcpp: "GetPoint1Coordinate", header: "vtkSliderRepresentation2D.h".}
proc GetPoint2Coordinate*(this: var vtkSliderRepresentation2D): ptr vtkCoordinate {.
    importcpp: "GetPoint2Coordinate", header: "vtkSliderRepresentation2D.h".}
proc SetTitleText*(this: var vtkSliderRepresentation2D; a2: cstring) {.
    importcpp: "SetTitleText", header: "vtkSliderRepresentation2D.h".}
proc GetTitleText*(this: var vtkSliderRepresentation2D): cstring {.
    importcpp: "GetTitleText", header: "vtkSliderRepresentation2D.h".}
proc GetnameSliderProperty*(this: var vtkSliderRepresentation2D): ptr vtkProperty2D {.
    importcpp: "GetnameSliderProperty", header: "vtkSliderRepresentation2D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the properties for the tube and end caps.
  ##
proc GetnameSliderPropertyTubeProperty*(this: var vtkSliderRepresentation2D): ptr vtkProperty2D {.
    importcpp: "GetnameSliderPropertyTubeProperty",
    header: "vtkSliderRepresentation2D.h".}
proc GetnameSliderPropertyTubePropertyCapProperty*(
    this: var vtkSliderRepresentation2D): ptr vtkProperty2D {.
    importcpp: "GetnameSliderPropertyTubePropertyCapProperty",
    header: "vtkSliderRepresentation2D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the selection property. This property is used to modify the appearance of
  ##  selected objects (e.g., the slider).
  ##
proc GetnameSliderPropertyTubePropertyCapPropertySelectedProperty*(
    this: var vtkSliderRepresentation2D): ptr vtkProperty2D {.
    importcpp: "GetnameSliderPropertyTubePropertyCapPropertySelectedProperty",
    header: "vtkSliderRepresentation2D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the properties for the label and title text.
  ##
proc GetnameSliderPropertyTubePropertyCapPropertySelectedPropertyLabelProperty*(
    this: var vtkSliderRepresentation2D): ptr vtkTextProperty {.importcpp: "GetnameSliderPropertyTubePropertyCapPropertySelectedPropertyLabelProperty",
    header: "vtkSliderRepresentation2D.h".}
proc GetnameSliderPropertyTubePropertyCapPropertySelectedPropertyLabelPropertyTitleProperty*(
    this: var vtkSliderRepresentation2D): ptr vtkTextProperty {.importcpp: "GetnameSliderPropertyTubePropertyCapPropertySelectedPropertyLabelPropertyTitleProperty",
    header: "vtkSliderRepresentation2D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Methods to interface with the vtkSliderWidget. The PlaceWidget() method
  ##  assumes that the parameter bounds[6] specifies the location in display space
  ##  where the widget should be placed.
  ##
proc PlaceWidget*(this: var vtkSliderRepresentation2D; bounds: array[6, cdouble]) {.
    importcpp: "PlaceWidget", header: "vtkSliderRepresentation2D.h".}
proc BuildRepresentation*(this: var vtkSliderRepresentation2D) {.
    importcpp: "BuildRepresentation", header: "vtkSliderRepresentation2D.h".}
proc StartWidgetInteraction*(this: var vtkSliderRepresentation2D;
                            eventPos: array[2, cdouble]) {.
    importcpp: "StartWidgetInteraction", header: "vtkSliderRepresentation2D.h".}
proc WidgetInteraction*(this: var vtkSliderRepresentation2D;
                       newEventPos: array[2, cdouble]) {.
    importcpp: "WidgetInteraction", header: "vtkSliderRepresentation2D.h".}
proc Highlight*(this: var vtkSliderRepresentation2D; a2: cint) {.
    importcpp: "Highlight", header: "vtkSliderRepresentation2D.h".}
proc GetActors2D*(this: var vtkSliderRepresentation2D; a2: ptr vtkPropCollection) {.
    importcpp: "GetActors2D", header: "vtkSliderRepresentation2D.h".}
proc ReleaseGraphicsResources*(this: var vtkSliderRepresentation2D;
                              a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkSliderRepresentation2D.h".}
proc RenderOverlay*(this: var vtkSliderRepresentation2D; a2: ptr vtkViewport): cint {.
    importcpp: "RenderOverlay", header: "vtkSliderRepresentation2D.h".}
proc RenderOpaqueGeometry*(this: var vtkSliderRepresentation2D; a2: ptr vtkViewport): cint {.
    importcpp: "RenderOpaqueGeometry", header: "vtkSliderRepresentation2D.h".}