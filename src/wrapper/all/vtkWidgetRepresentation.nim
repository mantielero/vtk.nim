## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkWidgetRepresentation.h
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
##  @class   vtkWidgetRepresentation
##  @brief   abstract class defines interface between the widget and widget representation classes
##
##  This class is used to define the API for, and partially implement, a
##  representation for different types of widgets. Note that the widget
##  representation (i.e., subclasses of vtkWidgetRepresentation) are a type of
##  vtkProp; meaning that they can be associated with a vtkRenderer end
##  embedded in a scene like any other vtkActor. However,
##  vtkWidgetRepresentation also defines an API that enables it to be paired
##  with a subclass vtkAbstractWidget, meaning that it can be driven by a
##  widget, serving to represent the widget as the widget responds to
##  registered events.
##
##  The API defined here should be regarded as a guideline for implementing
##  widgets and widget representations. Widget behavior is complex, as is the
##  way the representation responds to the registered widget events, so the API
##  may vary from widget to widget to reflect this complexity.
##
##  @warning
##  The separation of the widget event handling and representation enables
##  users and developers to create new appearances for the widget. It also
##  facilitates parallel processing, where the client application handles
##  events, and remote representations of the widget are slaves to the
##  client (and do not handle events).
##

import
  vtkInteractionWidgetsModule, vtkNew, vtkProp, vtkWeakPointer

discard "forward decl of vtkAbstractPropPicker"
discard "forward decl of vtkAbstractWidget"
discard "forward decl of vtkMatrix4x4"
discard "forward decl of vtkPickingManager"
discard "forward decl of vtkProp3D"
discard "forward decl of vtkRenderWindowInteractor"
discard "forward decl of vtkRenderer"
discard "forward decl of vtkTransform"
type
  vtkWidgetRepresentation* {.importcpp: "vtkWidgetRepresentation",
                            header: "vtkWidgetRepresentation.h", bycopy.} = object of vtkProp ## /@{
                                                                                       ## *
                                                                                       ##  Standard methods for instances of this class.
                                                                                       ##
    vtkWidgetRepresentation* {.importc: "vtkWidgetRepresentation".}: VTK_NEWINSTANCE
    ##  The state of this representation based on a recent event
    ##  These are used to track the beginning of interaction with the representation
    ##  It's dimensioned [3] because some events re processed in 3D.
    ##  Instance variable and members supporting suclasses
    ##  Used to control how widget is placed around bounding box
    ##  Indicate whether widget has been placed
    ##  initial bounds on place widget (valid after PlaceWidget)
    ##  initial length on place widget
    ##  Sizing handles is tricky because the procedure requires information
    ##  relative to the last pick, as well as a live renderer to perform
    ##  coordinate conversions. In some cases, a pick is never made so handle
    ##  sizing has to follow a different path. The following ivars help with
    ##  this process.
    ##  indicate when valid picks are made
    ##  This variable controls whether the picking is managed by the Picking
    ##  Manager or not. True by default.
    ## *
    ##  Return the picking manager associated on the context on which the widget
    ##  representation currently belong.
    ##
    ##  controlling relative size of widget handles
    ##  This is the time that the representation was built. This data member
    ##  can be used to reduce the time spent building the widget.
    ##  update the pose of a prop based on two sets of
    ##  position, orientation vectors

  vtkWidgetRepresentationSuperclass* = vtkProp

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkWidgetRepresentation::IsTypeOf(@)",
    header: "vtkWidgetRepresentation.h".}
proc IsA*(this: var vtkWidgetRepresentation; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkWidgetRepresentation.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkWidgetRepresentation {.
    importcpp: "vtkWidgetRepresentation::SafeDownCast(@)",
    header: "vtkWidgetRepresentation.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkWidgetRepresentation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkProp :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkWidgetRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkWidgetRepresentation :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkWidgetRepresentation; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkWidgetRepresentation.h".}
proc PickingManagedOn*(this: var vtkWidgetRepresentation) {.
    importcpp: "PickingManagedOn", header: "vtkWidgetRepresentation.h".}
proc PickingManagedOff*(this: var vtkWidgetRepresentation) {.
    importcpp: "PickingManagedOff", header: "vtkWidgetRepresentation.h".}
proc SetPickingManaged*(this: var vtkWidgetRepresentation; managed: bool) {.
    importcpp: "SetPickingManaged", header: "vtkWidgetRepresentation.h".}
## !!!Ignored construct:  virtual bool GetPickingManaged ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PickingManaged  of  << this -> PickingManaged ) ; return this -> PickingManaged ; } ;
## Error: expected ';'!!!

proc SetRenderer*(this: var vtkWidgetRepresentation; ren: ptr vtkRenderer) {.
    importcpp: "SetRenderer", header: "vtkWidgetRepresentation.h".}
proc GetRenderer*(this: var vtkWidgetRepresentation): ptr vtkRenderer {.
    importcpp: "GetRenderer", header: "vtkWidgetRepresentation.h".}
proc BuildRepresentation*(this: var vtkWidgetRepresentation) {.
    importcpp: "BuildRepresentation", header: "vtkWidgetRepresentation.h".}
proc PlaceWidget*(this: var vtkWidgetRepresentation;
                 vtkNotUsed: array[6, proc (a1: bounds): cdouble]) {.
    importcpp: "PlaceWidget", header: "vtkWidgetRepresentation.h".}
proc StartWidgetInteraction*(this: var vtkWidgetRepresentation;
                            eventPos: array[2, cdouble]) {.
    importcpp: "StartWidgetInteraction", header: "vtkWidgetRepresentation.h".}
proc WidgetInteraction*(this: var vtkWidgetRepresentation;
                       newEventPos: array[2, cdouble]) {.
    importcpp: "WidgetInteraction", header: "vtkWidgetRepresentation.h".}
proc EndWidgetInteraction*(this: var vtkWidgetRepresentation;
                          newEventPos: array[2, cdouble]) {.
    importcpp: "EndWidgetInteraction", header: "vtkWidgetRepresentation.h".}
proc ComputeInteractionState*(this: var vtkWidgetRepresentation; X: cint; Y: cint;
                             modify: cint = 0): cint {.
    importcpp: "ComputeInteractionState", header: "vtkWidgetRepresentation.h".}
proc GetInteractionState*(this: var vtkWidgetRepresentation): cint {.
    importcpp: "GetInteractionState", header: "vtkWidgetRepresentation.h".}
proc Highlight*(this: var vtkWidgetRepresentation;
               vtkNotUsed: proc (a1: highlightOn): cint) {.importcpp: "Highlight",
    header: "vtkWidgetRepresentation.h".}
proc StartComplexInteraction*(this: var vtkWidgetRepresentation;
                             a2: ptr vtkRenderWindowInteractor;
                             a3: ptr vtkAbstractWidget; a4: culong; a5: pointer) {.
    importcpp: "StartComplexInteraction", header: "vtkWidgetRepresentation.h".}
proc ComplexInteraction*(this: var vtkWidgetRepresentation;
                        a2: ptr vtkRenderWindowInteractor;
                        a3: ptr vtkAbstractWidget; a4: culong; a5: pointer) {.
    importcpp: "ComplexInteraction", header: "vtkWidgetRepresentation.h".}
proc EndComplexInteraction*(this: var vtkWidgetRepresentation;
                           a2: ptr vtkRenderWindowInteractor;
                           a3: ptr vtkAbstractWidget; a4: culong; a5: pointer) {.
    importcpp: "EndComplexInteraction", header: "vtkWidgetRepresentation.h".}
proc ComputeComplexInteractionState*(this: var vtkWidgetRepresentation;
                                    iren: ptr vtkRenderWindowInteractor;
                                    widget: ptr vtkAbstractWidget; event: culong;
                                    callData: pointer; modify: cint = 0): cint {.
    importcpp: "ComputeComplexInteractionState",
    header: "vtkWidgetRepresentation.h".}
proc SetPlaceFactor*(this: var vtkWidgetRepresentation; _arg: cdouble) {.
    importcpp: "SetPlaceFactor", header: "vtkWidgetRepresentation.h".}
proc GetPlaceFactorMinValue*(this: var vtkWidgetRepresentation): cdouble {.
    importcpp: "GetPlaceFactorMinValue", header: "vtkWidgetRepresentation.h".}
proc GetPlaceFactorMaxValue*(this: var vtkWidgetRepresentation): cdouble {.
    importcpp: "GetPlaceFactorMaxValue", header: "vtkWidgetRepresentation.h".}
## !!!Ignored construct:  virtual double GetPickingManagedPlaceFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PlaceFactor  of  << this -> PlaceFactor ) ; return this -> PlaceFactor ; } ;
## Error: expected ';'!!!

proc SetPlaceFactorHandleSize*(this: var vtkWidgetRepresentation; _arg: cdouble) {.
    importcpp: "SetPlaceFactorHandleSize", header: "vtkWidgetRepresentation.h".}
proc GetPlaceFactorMinValueHandleSizeMinValue*(this: var vtkWidgetRepresentation): cdouble {.
    importcpp: "GetPlaceFactorMinValueHandleSizeMinValue",
    header: "vtkWidgetRepresentation.h".}
proc GetPlaceFactorMaxValueHandleSizeMaxValue*(this: var vtkWidgetRepresentation): cdouble {.
    importcpp: "GetPlaceFactorMaxValueHandleSizeMaxValue",
    header: "vtkWidgetRepresentation.h".}
## !!!Ignored construct:  virtual double GetPickingManagedPlaceFactorHandleSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HandleSize  of  << this -> HandleSize ) ; return this -> HandleSize ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Some subclasses use this data member to keep track of whether to render
##  or not (i.e., to minimize the total number of renders).
##  virtual vtkTypeBool GetPickingManagedPlaceFactorHandleSizeNeedToRenderNeedToRender ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NeedToRender  of  << this -> NeedToRender ) ; return this -> NeedToRender ; } ;
## Error: expected ';'!!!

proc SetPlaceFactorHandleSizeNeedToRender*(this: var vtkWidgetRepresentation;
    _arg: vtkTypeBool) {.importcpp: "SetPlaceFactorHandleSizeNeedToRender",
                       header: "vtkWidgetRepresentation.h".}
proc GetPlaceFactorMinValueHandleSizeMinValueNeedToRenderMinValue*(
    this: var vtkWidgetRepresentation): vtkTypeBool {.
    importcpp: "GetPlaceFactorMinValueHandleSizeMinValueNeedToRenderMinValue",
    header: "vtkWidgetRepresentation.h".}
proc GetPlaceFactorMaxValueHandleSizeMaxValueNeedToRenderMaxValue*(
    this: var vtkWidgetRepresentation): vtkTypeBool {.
    importcpp: "GetPlaceFactorMaxValueHandleSizeMaxValueNeedToRenderMaxValue",
    header: "vtkWidgetRepresentation.h".}
proc NeedToRenderOn*(this: var vtkWidgetRepresentation) {.
    importcpp: "NeedToRenderOn", header: "vtkWidgetRepresentation.h".}
proc NeedToRenderOff*(this: var vtkWidgetRepresentation) {.
    importcpp: "NeedToRenderOff", header: "vtkWidgetRepresentation.h".}
  ## /@}
  ## *
  ##  Methods to make this class behave as a vtkProp. They are repeated here (from the
  ##  vtkProp superclass) as a reminder to the widget implementor. Failure to implement
  ##  these methods properly may result in the representation not appearing in the scene
  ##  (i.e., not implementing the Render() methods properly) or leaking graphics resources
  ##  (i.e., not implementing ReleaseGraphicsResources() properly).
  ##
## !!!Ignored construct:  double * GetBounds ( ) VTK_SIZEHINT ( 6 ) override { return nullptr ; } void ShallowCopy ( vtkProp * prop ) override ;
## Error: expected ';'!!!

proc GetActors*(this: var vtkWidgetRepresentation; a2: ptr vtkPropCollection) {.
    importcpp: "GetActors", header: "vtkWidgetRepresentation.h".}
proc GetActors2D*(this: var vtkWidgetRepresentation; a2: ptr vtkPropCollection) {.
    importcpp: "GetActors2D", header: "vtkWidgetRepresentation.h".}
proc GetVolumes*(this: var vtkWidgetRepresentation; a2: ptr vtkPropCollection) {.
    importcpp: "GetVolumes", header: "vtkWidgetRepresentation.h".}
proc ReleaseGraphicsResources*(this: var vtkWidgetRepresentation; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkWidgetRepresentation.h".}
proc RenderOverlay*(this: var vtkWidgetRepresentation;
                   vtkNotUsed: proc (a1: viewport): ptr vtkViewport): cint {.
    importcpp: "RenderOverlay", header: "vtkWidgetRepresentation.h".}
proc RenderOpaqueGeometry*(this: var vtkWidgetRepresentation;
                          vtkNotUsed: proc (a1: viewport): ptr vtkViewport): cint {.
    importcpp: "RenderOpaqueGeometry", header: "vtkWidgetRepresentation.h".}
proc RenderTranslucentPolygonalGeometry*(this: var vtkWidgetRepresentation;
    vtkNotUsed: proc (a1: viewport): ptr vtkViewport): cint {.
    importcpp: "RenderTranslucentPolygonalGeometry",
    header: "vtkWidgetRepresentation.h".}
proc RenderVolumetricGeometry*(this: var vtkWidgetRepresentation;
                              vtkNotUsed: proc (a1: viewport): ptr vtkViewport): cint {.
    importcpp: "RenderVolumetricGeometry", header: "vtkWidgetRepresentation.h".}
proc HasTranslucentPolygonalGeometry*(this: var vtkWidgetRepresentation): vtkTypeBool {.
    importcpp: "HasTranslucentPolygonalGeometry",
    header: "vtkWidgetRepresentation.h".}
proc RegisterPickers*(this: var vtkWidgetRepresentation) {.
    importcpp: "RegisterPickers", header: "vtkWidgetRepresentation.h".}
proc UnRegisterPickers*(this: var vtkWidgetRepresentation) {.
    importcpp: "UnRegisterPickers", header: "vtkWidgetRepresentation.h".}
type
  vtkWidgetRepresentationAxis* {.size: sizeof(cint),
                                importcpp: "vtkWidgetRepresentation::Axis",
                                header: "vtkWidgetRepresentation.h".} = enum
    NONE = -1, XAxis = 0, YAxis = 1, ZAxis = 2

