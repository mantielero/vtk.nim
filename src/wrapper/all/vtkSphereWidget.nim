## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSphereWidget.h
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
##  @class   vtkSphereWidget
##  @brief   3D widget for manipulating a sphere
##
##  This 3D widget defines a sphere that can be interactively placed in a
##  scene.
##
##  To use this object, just invoke SetInteractor() with the argument of the
##  method a vtkRenderWindowInteractor.  You may also wish to invoke
##  "PlaceWidget()" to initially position the widget. The interactor will act
##  normally until the "i" key (for "interactor") is pressed, at which point the
##  vtkSphereWidget will appear. (See superclass documentation for information
##  about changing this behavior.)
##  Events that occur outside of the widget (i.e., no part of
##  the widget is picked) are propagated to any other registered obsevers
##  (such as the interaction style).  Turn off the widget by pressing the "i"
##  key again (or invoke the Off() method).
##
##  The vtkSphereWidget has several methods that can be used in conjunction
##  with other VTK objects. The Set/GetThetaResolution() and
##  Set/GetPhiResolution() methods control the number of subdivisions of the
##  sphere in the theta and phi directions; the GetPolyData() method can be
##  used to get the polygonal representation and can be used for things like
##  seeding streamlines. The GetSphere() method returns a sphere implicit
##  function that can be used for cutting and clipping. Typical usage of the
##  widget is to make use of the StartInteractionEvent, InteractionEvent, and
##  EndInteractionEvent events. The InteractionEvent is called on mouse
##  motion; the other two events are called on button down and button up
##  (any mouse button).
##
##  Some additional features of this class include the ability to control the
##  properties of the widget. You can set the properties of the selected and
##  unselected representations of the sphere.
##
##  @sa
##  vtk3DWidget vtkLineWidget vtkBoxWidget vtkPlaneWidget
##

import
  vtk3DWidget, vtkInteractionWidgetsModule, vtkSphereSource

discard "forward decl of vtkActor"
discard "forward decl of vtkPolyDataMapper"
discard "forward decl of vtkPoints"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkSphereSource"
discard "forward decl of vtkSphere"
discard "forward decl of vtkCellPicker"
discard "forward decl of vtkProperty"
const
  VTK_SPHERE_OFF* = 0
  VTK_SPHERE_WIREFRAME* = 1
  VTK_SPHERE_SURFACE* = 2

type
  vtkSphereWidget* {.importcpp: "vtkSphereWidget", header: "vtkSphereWidget.h",
                    bycopy.} = object of vtk3DWidget ## *
                                                ##  Instantiate the object.
                                                ##
    vtkSphereWidget* {.importc: "vtkSphereWidget".}: VTK_NEWINSTANCE
    ##  Do the picking
    ##  Register internal Pickers within PickingManager


proc New*(): ptr vtkSphereWidget {.importcpp: "vtkSphereWidget::New(@)",
                               header: "vtkSphereWidget.h".}
type
  vtkSphereWidgetSuperclass* = vtk3DWidget

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSphereWidget::IsTypeOf(@)", header: "vtkSphereWidget.h".}
proc IsA*(this: var vtkSphereWidget; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkSphereWidget.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSphereWidget {.
    importcpp: "vtkSphereWidget::SafeDownCast(@)", header: "vtkSphereWidget.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSphereWidget :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtk3DWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSphereWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSphereWidget :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSphereWidget; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkSphereWidget.h".}
proc SetEnabled*(this: var vtkSphereWidget; a2: cint) {.importcpp: "SetEnabled",
    header: "vtkSphereWidget.h".}
proc PlaceWidget*(this: var vtkSphereWidget; bounds: array[6, cdouble]) {.
    importcpp: "PlaceWidget", header: "vtkSphereWidget.h".}
proc PlaceWidget*(this: var vtkSphereWidget) {.importcpp: "PlaceWidget",
    header: "vtkSphereWidget.h".}
proc PlaceWidget*(this: var vtkSphereWidget; xmin: cdouble; xmax: cdouble;
                 ymin: cdouble; ymax: cdouble; zmin: cdouble; zmax: cdouble) {.
    importcpp: "PlaceWidget", header: "vtkSphereWidget.h".}
proc SetRepresentation*(this: var vtkSphereWidget; _arg: cint) {.
    importcpp: "SetRepresentation", header: "vtkSphereWidget.h".}
proc GetRepresentationMinValue*(this: var vtkSphereWidget): cint {.
    importcpp: "GetRepresentationMinValue", header: "vtkSphereWidget.h".}
proc GetRepresentationMaxValue*(this: var vtkSphereWidget): cint {.
    importcpp: "GetRepresentationMaxValue", header: "vtkSphereWidget.h".}
## !!!Ignored construct:  virtual int GetRepresentation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Representation  of  << this -> Representation ) ; return this -> Representation ; } ;
## Error: expected ';'!!!

proc SetRepresentationToOff*(this: var vtkSphereWidget) {.
    importcpp: "SetRepresentationToOff", header: "vtkSphereWidget.h".}
proc SetRepresentationToWireframe*(this: var vtkSphereWidget) {.
    importcpp: "SetRepresentationToWireframe", header: "vtkSphereWidget.h".}
proc SetRepresentationToSurface*(this: var vtkSphereWidget) {.
    importcpp: "SetRepresentationToSurface", header: "vtkSphereWidget.h".}
proc SetThetaResolution*(this: var vtkSphereWidget; r: cint) {.
    importcpp: "SetThetaResolution", header: "vtkSphereWidget.h".}
proc GetThetaResolution*(this: var vtkSphereWidget): cint {.
    importcpp: "GetThetaResolution", header: "vtkSphereWidget.h".}
proc SetPhiResolution*(this: var vtkSphereWidget; r: cint) {.
    importcpp: "SetPhiResolution", header: "vtkSphereWidget.h".}
proc GetPhiResolution*(this: var vtkSphereWidget): cint {.
    importcpp: "GetPhiResolution", header: "vtkSphereWidget.h".}
proc SetRadius*(this: var vtkSphereWidget; r: cdouble) {.importcpp: "SetRadius",
    header: "vtkSphereWidget.h".}
proc GetRadius*(this: var vtkSphereWidget): cdouble {.importcpp: "GetRadius",
    header: "vtkSphereWidget.h".}
proc SetCenter*(this: var vtkSphereWidget; x: cdouble; y: cdouble; z: cdouble) {.
    importcpp: "SetCenter", header: "vtkSphereWidget.h".}
proc SetCenter*(this: var vtkSphereWidget; x: array[3, cdouble]) {.
    importcpp: "SetCenter", header: "vtkSphereWidget.h".}
## !!!Ignored construct:  double * GetCenter ( ) VTK_SIZEHINT ( 3 ) { return this -> SphereSource -> GetCenter ( ) ; } void GetCenter ( double xyz [ 3 ] ) { this -> SphereSource -> GetCenter ( xyz ) ; } /@} /@{ *
##  Enable translation and scaling of the widget. By default, the widget
##  can be translated and rotated.
##  virtual void SetTranslation ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Translation  to  << _arg ) ; if ( this -> Translation != _arg ) { this -> Translation = _arg ; this -> Modified ( ) ; } } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual vtkTypeBool GetRepresentationTranslation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Translation  of  << this -> Translation ) ; return this -> Translation ; } ;
## Error: expected ';'!!!

proc TranslationOn*(this: var vtkSphereWidget) {.importcpp: "TranslationOn",
    header: "vtkSphereWidget.h".}
proc TranslationOff*(this: var vtkSphereWidget) {.importcpp: "TranslationOff",
    header: "vtkSphereWidget.h".}
proc SetTranslationScale*(this: var vtkSphereWidget; _arg: vtkTypeBool) {.
    importcpp: "SetTranslationScale", header: "vtkSphereWidget.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetRepresentationTranslationScale ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Scale  of  << this -> Scale ) ; return this -> Scale ; } ;
## Error: expected ';'!!!

proc ScaleOn*(this: var vtkSphereWidget) {.importcpp: "ScaleOn",
                                       header: "vtkSphereWidget.h".}
proc ScaleOff*(this: var vtkSphereWidget) {.importcpp: "ScaleOff",
                                        header: "vtkSphereWidget.h".}
  ## /@}
  ## /@{
  ## *
  ##  The handle sits on the surface of the sphere and may be moved around
  ##  the surface by picking (left mouse) and then moving. The position
  ##  of the handle can be retrieved, this is useful for positioning cameras
  ##  and lights. By default, the handle is turned off.
  ##
proc SetTranslationScaleHandleVisibility*(this: var vtkSphereWidget;
    _arg: vtkTypeBool) {.importcpp: "SetTranslationScaleHandleVisibility",
                       header: "vtkSphereWidget.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetRepresentationTranslationScaleHandleVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HandleVisibility  of  << this -> HandleVisibility ) ; return this -> HandleVisibility ; } ;
## Error: expected ';'!!!

proc HandleVisibilityOn*(this: var vtkSphereWidget) {.
    importcpp: "HandleVisibilityOn", header: "vtkSphereWidget.h".}
proc HandleVisibilityOff*(this: var vtkSphereWidget) {.
    importcpp: "HandleVisibilityOff", header: "vtkSphereWidget.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the direction vector of the handle relative to the center of
  ##  the sphere. The direction of the handle is from the sphere center to
  ##  the handle position.
  ##
proc SetHandleDirection*(this: var vtkSphereWidget; _arg1: cdouble; _arg2: cdouble;
                        _arg3: cdouble) {.importcpp: "SetHandleDirection",
                                        header: "vtkSphereWidget.h".}
proc SetHandleDirection*(this: var vtkSphereWidget; _arg: array[3, cdouble]) {.
    importcpp: "SetHandleDirection", header: "vtkSphereWidget.h".}
## !!!Ignored construct:  virtual double * GetHandleDirection ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << HandleDirection  pointer  << this -> HandleDirection ) ; return this -> HandleDirection ; } VTK_WRAPEXCLUDE virtual void GetHandleDirection ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> HandleDirection [ 0 ] ; _arg2 = this -> HandleDirection [ 1 ] ; _arg3 = this -> HandleDirection [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << HandleDirection  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetHandleDirection ( double _arg [ 3 ] ) { this -> GetHandleDirection ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get the position of the handle.
##  virtual double * GetHandleDirectionHandlePositionHandlePosition ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << HandlePosition  pointer  << this -> HandlePosition ) ; return this -> HandlePosition ; } VTK_WRAPEXCLUDE virtual void GetHandleDirectionHandlePositionHandlePosition ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> HandlePosition [ 0 ] ; _arg2 = this -> HandlePosition [ 1 ] ; _arg3 = this -> HandlePosition [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << HandlePosition  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetHandleDirectionHandlePositionHandlePosition ( double _arg [ 3 ] ) { this -> GetHandleDirectionHandlePositionHandlePosition ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc GetPolyData*(this: var vtkSphereWidget; pd: ptr vtkPolyData) {.
    importcpp: "GetPolyData", header: "vtkSphereWidget.h".}
proc GetSphere*(this: var vtkSphereWidget; sphere: ptr vtkSphere) {.
    importcpp: "GetSphere", header: "vtkSphereWidget.h".}
proc GetnameSphereProperty*(this: var vtkSphereWidget): ptr vtkProperty {.
    importcpp: "GetnameSphereProperty", header: "vtkSphereWidget.h".}
proc GetnameSpherePropertySelectedSphereProperty*(this: var vtkSphereWidget): ptr vtkProperty {.
    importcpp: "GetnameSpherePropertySelectedSphereProperty",
    header: "vtkSphereWidget.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the handle properties (the little ball on the sphere is the
  ##  handle). The properties of the handle when selected and unselected
  ##  can be manipulated.
  ##
proc GetnameSpherePropertySelectedSpherePropertyHandleProperty*(
    this: var vtkSphereWidget): ptr vtkProperty {.
    importcpp: "GetnameSpherePropertySelectedSpherePropertyHandleProperty",
    header: "vtkSphereWidget.h".}
proc GetnameSpherePropertySelectedSpherePropertyHandlePropertySelectedHandleProperty*(
    this: var vtkSphereWidget): ptr vtkProperty {.importcpp: "GetnameSpherePropertySelectedSpherePropertyHandlePropertySelectedHandleProperty",
    header: "vtkSphereWidget.h".}
  ## /@}