## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSliderRepresentation3D.h
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
##  @class   vtkSliderRepresentation3D
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
  vtkCoordinate, vtkDeprecation, vtkInteractionWidgetsModule,
  vtkSliderRepresentation

discard "forward decl of vtkActor"
discard "forward decl of vtkPolyDataMapper"
discard "forward decl of vtkSphereSource"
discard "forward decl of vtkCellPicker"
discard "forward decl of vtkProperty"
discard "forward decl of vtkCylinderSource"
discard "forward decl of vtkVectorText"
discard "forward decl of vtkAssembly"
discard "forward decl of vtkTransform"
discard "forward decl of vtkTransformPolyDataFilter"
discard "forward decl of vtkMatrix4x4"
type
  vtkSliderRepresentation3D* {.importcpp: "vtkSliderRepresentation3D",
                              header: "vtkSliderRepresentation3D.h", bycopy.} = object of vtkSliderRepresentation ## *
                                                                                                           ##  Instantiate the class.
                                                                                                           ##
    vtkSliderRepresentation3D* {.importc: "vtkSliderRepresentation3D".}: VTK_NEWINSTANCE
    ##  These are the slider end points taking into account the thickness
    ##  of the slider
    ##  More ivars controlling the appearance of the widget
    ##  Do the picking
    ##  Determine the parameter t along the slider
    ##  Cylinder used by other objects
    ##  The tube
    ##  The slider
    ##  The left cap
    ##  The right cap
    ##  The text. There is an extra transform used to rotate
    ##  both the title and label
    ##  Transform used during slider motion
    ##  Manage the state of the widget


proc New*(): ptr vtkSliderRepresentation3D {.
    importcpp: "vtkSliderRepresentation3D::New(@)",
    header: "vtkSliderRepresentation3D.h".}
type
  vtkSliderRepresentation3DSuperclass* = vtkSliderRepresentation

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSliderRepresentation3D::IsTypeOf(@)",
    header: "vtkSliderRepresentation3D.h".}
proc IsA*(this: var vtkSliderRepresentation3D; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkSliderRepresentation3D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSliderRepresentation3D {.
    importcpp: "vtkSliderRepresentation3D::SafeDownCast(@)",
    header: "vtkSliderRepresentation3D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSliderRepresentation3D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkSliderRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSliderRepresentation3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSliderRepresentation3D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSliderRepresentation3D; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkSliderRepresentation3D.h".}
proc GetPoint1Coordinate*(this: var vtkSliderRepresentation3D): ptr vtkCoordinate {.
    importcpp: "GetPoint1Coordinate", header: "vtkSliderRepresentation3D.h".}
proc SetPoint1InWorldCoordinates*(this: var vtkSliderRepresentation3D; x: cdouble;
                                 y: cdouble; z: cdouble) {.
    importcpp: "SetPoint1InWorldCoordinates",
    header: "vtkSliderRepresentation3D.h".}
proc GetPoint2Coordinate*(this: var vtkSliderRepresentation3D): ptr vtkCoordinate {.
    importcpp: "GetPoint2Coordinate", header: "vtkSliderRepresentation3D.h".}
proc SetPoint2InWorldCoordinates*(this: var vtkSliderRepresentation3D; x: cdouble;
                                 y: cdouble; z: cdouble) {.
    importcpp: "SetPoint2InWorldCoordinates",
    header: "vtkSliderRepresentation3D.h".}
proc SetTitleText*(this: var vtkSliderRepresentation3D; a2: cstring) {.
    importcpp: "SetTitleText", header: "vtkSliderRepresentation3D.h".}
proc GetTitleText*(this: var vtkSliderRepresentation3D): cstring {.
    importcpp: "GetTitleText", header: "vtkSliderRepresentation3D.h".}
proc SetSliderShape*(this: var vtkSliderRepresentation3D; _arg: cint) {.
    importcpp: "SetSliderShape", header: "vtkSliderRepresentation3D.h".}
proc GetSliderShapeMinValue*(this: var vtkSliderRepresentation3D): cint {.
    importcpp: "GetSliderShapeMinValue", header: "vtkSliderRepresentation3D.h".}
proc GetSliderShapeMaxValue*(this: var vtkSliderRepresentation3D): cint {.
    importcpp: "GetSliderShapeMaxValue", header: "vtkSliderRepresentation3D.h".}
## !!!Ignored construct:  virtual int GetSliderShape ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SliderShape  of  << this -> SliderShape ) ; return this -> SliderShape ; } ;
## Error: expected ';'!!!

proc SetSliderShapeToSphere*(this: var vtkSliderRepresentation3D) {.
    importcpp: "SetSliderShapeToSphere", header: "vtkSliderRepresentation3D.h".}
proc SetSliderShapeToCylinder*(this: var vtkSliderRepresentation3D) {.
    importcpp: "SetSliderShapeToCylinder", header: "vtkSliderRepresentation3D.h".}
proc SetRotation*(this: var vtkSliderRepresentation3D; _arg: cdouble) {.
    importcpp: "SetRotation", header: "vtkSliderRepresentation3D.h".}
## !!!Ignored construct:  virtual double GetSliderShapeRotation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Rotation  of  << this -> Rotation ) ; return this -> Rotation ; } ;
## Error: expected ';'!!!

proc GetnameSliderProperty*(this: var vtkSliderRepresentation3D): ptr vtkProperty {.
    importcpp: "GetnameSliderProperty", header: "vtkSliderRepresentation3D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the properties for the tube and end caps.
  ##
proc GetnameSliderPropertyTubeProperty*(this: var vtkSliderRepresentation3D): ptr vtkProperty {.
    importcpp: "GetnameSliderPropertyTubeProperty",
    header: "vtkSliderRepresentation3D.h".}
proc GetnameSliderPropertyTubePropertyCapProperty*(
    this: var vtkSliderRepresentation3D): ptr vtkProperty {.
    importcpp: "GetnameSliderPropertyTubePropertyCapProperty",
    header: "vtkSliderRepresentation3D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the selection property. This property is used to modify the appearance of
  ##  selected objects (e.g., the slider).
  ##
proc GetnameSliderPropertyTubePropertyCapPropertySelectedProperty*(
    this: var vtkSliderRepresentation3D): ptr vtkProperty {.
    importcpp: "GetnameSliderPropertyTubePropertyCapPropertySelectedProperty",
    header: "vtkSliderRepresentation3D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Methods to interface with the vtkSliderWidget.
  ##
proc PlaceWidget*(this: var vtkSliderRepresentation3D; bounds: array[6, cdouble]) {.
    importcpp: "PlaceWidget", header: "vtkSliderRepresentation3D.h".}
proc BuildRepresentation*(this: var vtkSliderRepresentation3D) {.
    importcpp: "BuildRepresentation", header: "vtkSliderRepresentation3D.h".}
proc StartWidgetInteraction*(this: var vtkSliderRepresentation3D;
                            eventPos: array[2, cdouble]) {.
    importcpp: "StartWidgetInteraction", header: "vtkSliderRepresentation3D.h".}
proc WidgetInteraction*(this: var vtkSliderRepresentation3D;
                       newEventPos: array[2, cdouble]) {.
    importcpp: "WidgetInteraction", header: "vtkSliderRepresentation3D.h".}
proc Highlight*(this: var vtkSliderRepresentation3D; a2: cint) {.
    importcpp: "Highlight", header: "vtkSliderRepresentation3D.h".}
## !!!Ignored construct:  /@} /@{ *
##  Methods supporting the rendering process.
##  double * GetBounds ( ) VTK_SIZEHINT ( 6 ) override ;
## Error: expected ';'!!!

proc GetActors*(this: var vtkSliderRepresentation3D; a2: ptr vtkPropCollection) {.
    importcpp: "GetActors", header: "vtkSliderRepresentation3D.h".}
proc ReleaseGraphicsResources*(this: var vtkSliderRepresentation3D;
                              a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkSliderRepresentation3D.h".}
proc RenderOpaqueGeometry*(this: var vtkSliderRepresentation3D; a2: ptr vtkViewport): cint {.
    importcpp: "RenderOpaqueGeometry", header: "vtkSliderRepresentation3D.h".}
proc RenderTranslucentPolygonalGeometry*(this: var vtkSliderRepresentation3D;
                                        a2: ptr vtkViewport): cint {.
    importcpp: "RenderTranslucentPolygonalGeometry",
    header: "vtkSliderRepresentation3D.h".}
proc HasTranslucentPolygonalGeometry*(this: var vtkSliderRepresentation3D): vtkTypeBool {.
    importcpp: "HasTranslucentPolygonalGeometry",
    header: "vtkSliderRepresentation3D.h".}
proc GetMTime*(this: var vtkSliderRepresentation3D): vtkMTimeType {.
    importcpp: "GetMTime", header: "vtkSliderRepresentation3D.h".}
proc RegisterPickers*(this: var vtkSliderRepresentation3D) {.
    importcpp: "RegisterPickers", header: "vtkSliderRepresentation3D.h".}
## !!!Ignored construct:  # ! defined ( VTK_LEGACY_REMOVE ) [NewLine] VTK_DEPRECATED_IN_9_2_0 ( because leading underscore is reserved ) typedef SliderShapeType _SliderShape ;
## Error: identifier expected, but got: because leading underscore is reserved!!!
