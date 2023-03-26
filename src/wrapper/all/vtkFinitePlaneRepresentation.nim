## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFinitePlaneRepresentation.h
##
##   Copyright (c)
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkFinitePlaneRepresentation
##  @brief   represent the vtkFinitePlaneWidget.
##
##  This class is a concrete representation for the vtkFinitePlaneWidget. It
##  represents a plane with three handles: one on two faces, plus a
##  center handle. Through interaction with the widget, the plane
##  representation can be arbitrarily positioned and modified in the 3D space.
##
##  To use this representation, you normally use the PlaceWidget() method
##  to position the widget at a specified region in space.
##
##  @sa
##  vtkFinitePlaneWidget vtkImplicitPlaneWidget2
##

import
  vtkDeprecation, vtkInteractionWidgetsModule, vtkWidgetRepresentation

discard "forward decl of vtkActor"
discard "forward decl of vtkBox"
discard "forward decl of vtkCellPicker"
discard "forward decl of vtkConeSource"
discard "forward decl of vtkFeatureEdges"
discard "forward decl of vtkLineSource"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkPolyDataMapper"
discard "forward decl of vtkProperty"
discard "forward decl of vtkSphereSource"
discard "forward decl of vtkTransform"
discard "forward decl of vtkTubeFilter"
type
  vtkFinitePlaneRepresentation* {.importcpp: "vtkFinitePlaneRepresentation",
                                 header: "vtkFinitePlaneRepresentation.h", bycopy.} = object of vtkWidgetRepresentation ## *
                                                                                                                 ##  Instantiate the class.
                                                                                                                 ##
    vtkFinitePlaneRepresentation* {.importc: "vtkFinitePlaneRepresentation".}: VTK_NEWINSTANCE
    ##  the representation state
    ##  the origin
    ##  the normal
    ##  the previous normal
    ##  the rotation transform
    ##  the X Vector
    ##  the Y Vector
    ##  The + normal cone
    ##  The + normal line
    ##  The - normal cone
    ##  The - normal line
    ##  The finite plane
    ##  Optional tubes are represented by extracting boundary edges
    ##  control whether tubing is on
    ##  control whether plane is on
    ##  Picking objects
    ##  Transform the planes (used for rotations)
    ##  Support GetBounds() method
    ##  Properties used to control the appearance of selected objects and
    ##  the manipulator in general.


proc New*(): ptr vtkFinitePlaneRepresentation {.
    importcpp: "vtkFinitePlaneRepresentation::New(@)",
    header: "vtkFinitePlaneRepresentation.h".}
type
  vtkFinitePlaneRepresentationSuperclass* = vtkWidgetRepresentation

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkFinitePlaneRepresentation::IsTypeOf(@)",
    header: "vtkFinitePlaneRepresentation.h".}
proc IsA*(this: var vtkFinitePlaneRepresentation; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkFinitePlaneRepresentation.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkFinitePlaneRepresentation {.
    importcpp: "vtkFinitePlaneRepresentation::SafeDownCast(@)",
    header: "vtkFinitePlaneRepresentation.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkFinitePlaneRepresentation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWidgetRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFinitePlaneRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFinitePlaneRepresentation :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkFinitePlaneRepresentation; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkFinitePlaneRepresentation.h".}
proc GetPolyData*(this: var vtkFinitePlaneRepresentation; pd: ptr vtkPolyData) {.
    importcpp: "GetPolyData", header: "vtkFinitePlaneRepresentation.h".}
proc GetnameV1HandleProperty*(this: var vtkFinitePlaneRepresentation): ptr vtkProperty {.
    importcpp: "GetnameV1HandleProperty", header: "vtkFinitePlaneRepresentation.h".}
proc GetnameV1HandlePropertyV2HandleProperty*(
    this: var vtkFinitePlaneRepresentation): ptr vtkProperty {.
    importcpp: "GetnameV1HandlePropertyV2HandleProperty",
    header: "vtkFinitePlaneRepresentation.h".}
proc GetnameV1HandlePropertyV2HandlePropertySelectedHandleProperty*(
    this: var vtkFinitePlaneRepresentation): ptr vtkProperty {.
    importcpp: "GetnameV1HandlePropertyV2HandlePropertySelectedHandleProperty",
    header: "vtkFinitePlaneRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the plane properties. The
  ##  properties of the plane when selected and normal can be
  ##  set.
  ##
proc GetnameV1HandlePropertyV2HandlePropertySelectedHandlePropertyPlaneProperty*(
    this: var vtkFinitePlaneRepresentation): ptr vtkProperty {.importcpp: "GetnameV1HandlePropertyV2HandlePropertySelectedHandlePropertyPlaneProperty",
    header: "vtkFinitePlaneRepresentation.h".}
proc GetnameV1HandlePropertyV2HandlePropertySelectedHandlePropertyPlanePropertySelectedPlaneProperty*(
    this: var vtkFinitePlaneRepresentation): ptr vtkProperty {.importcpp: "GetnameV1HandlePropertyV2HandlePropertySelectedHandlePropertyPlanePropertySelectedPlaneProperty",
    header: "vtkFinitePlaneRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off tubing of the wire outline of the plane. The tube thickens
  ##  the line by wrapping with a vtkTubeFilter.
  ##
proc SetTubing*(this: var vtkFinitePlaneRepresentation; _arg: bool) {.
    importcpp: "SetTubing", header: "vtkFinitePlaneRepresentation.h".}
## !!!Ignored construct:  virtual bool GetTubing ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tubing  of  << this -> Tubing ) ; return this -> Tubing ; } ;
## Error: expected ';'!!!

proc TubingOn*(this: var vtkFinitePlaneRepresentation) {.importcpp: "TubingOn",
    header: "vtkFinitePlaneRepresentation.h".}
proc TubingOff*(this: var vtkFinitePlaneRepresentation) {.importcpp: "TubingOff",
    header: "vtkFinitePlaneRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Enable/disable the drawing of the plane. In some cases the plane
  ##  interferes with the object that it is operating on (i.e., the
  ##  plane interferes with the cut surface it produces producing
  ##  z-buffer artifacts.)
  ##
proc SetDrawPlane*(this: var vtkFinitePlaneRepresentation; plane: bool) {.
    importcpp: "SetDrawPlane", header: "vtkFinitePlaneRepresentation.h".}
## !!!Ignored construct:  virtual bool GetTubingDrawPlane ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DrawPlane  of  << this -> DrawPlane ) ; return this -> DrawPlane ; } ;
## Error: expected ';'!!!

proc DrawPlaneOn*(this: var vtkFinitePlaneRepresentation) {.
    importcpp: "DrawPlaneOn", header: "vtkFinitePlaneRepresentation.h".}
proc DrawPlaneOff*(this: var vtkFinitePlaneRepresentation) {.
    importcpp: "DrawPlaneOff", header: "vtkFinitePlaneRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Switches handles (the spheres) on or off by manipulating the underlying
  ##  actor visibility.
  ##
proc SetHandles*(this: var vtkFinitePlaneRepresentation; handles: bool) {.
    importcpp: "SetHandles", header: "vtkFinitePlaneRepresentation.h".}
proc HandlesOn*(this: var vtkFinitePlaneRepresentation) {.importcpp: "HandlesOn",
    header: "vtkFinitePlaneRepresentation.h".}
proc HandlesOff*(this: var vtkFinitePlaneRepresentation) {.importcpp: "HandlesOff",
    header: "vtkFinitePlaneRepresentation.h".}
proc PlaceWidget*(this: var vtkFinitePlaneRepresentation; bounds: array[6, cdouble]) {.
    importcpp: "PlaceWidget", header: "vtkFinitePlaneRepresentation.h".}
proc BuildRepresentation*(this: var vtkFinitePlaneRepresentation) {.
    importcpp: "BuildRepresentation", header: "vtkFinitePlaneRepresentation.h".}
proc ComputeInteractionState*(this: var vtkFinitePlaneRepresentation; X: cint;
                             Y: cint; modify: cint = 0): cint {.
    importcpp: "ComputeInteractionState", header: "vtkFinitePlaneRepresentation.h".}
proc StartWidgetInteraction*(this: var vtkFinitePlaneRepresentation;
                            e: array[2, cdouble]) {.
    importcpp: "StartWidgetInteraction", header: "vtkFinitePlaneRepresentation.h".}
proc WidgetInteraction*(this: var vtkFinitePlaneRepresentation; e: array[2, cdouble]) {.
    importcpp: "WidgetInteraction", header: "vtkFinitePlaneRepresentation.h".}
proc GetBounds*(this: var vtkFinitePlaneRepresentation): ptr cdouble {.
    importcpp: "GetBounds", header: "vtkFinitePlaneRepresentation.h".}
proc ReleaseGraphicsResources*(this: var vtkFinitePlaneRepresentation;
                              a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources",
    header: "vtkFinitePlaneRepresentation.h".}
proc RenderOpaqueGeometry*(this: var vtkFinitePlaneRepresentation;
                          a2: ptr vtkViewport): cint {.
    importcpp: "RenderOpaqueGeometry", header: "vtkFinitePlaneRepresentation.h".}
proc RenderTranslucentPolygonalGeometry*(this: var vtkFinitePlaneRepresentation;
                                        a2: ptr vtkViewport): cint {.
    importcpp: "RenderTranslucentPolygonalGeometry",
    header: "vtkFinitePlaneRepresentation.h".}
proc HasTranslucentPolygonalGeometry*(this: var vtkFinitePlaneRepresentation): vtkTypeBool {.
    importcpp: "HasTranslucentPolygonalGeometry",
    header: "vtkFinitePlaneRepresentation.h".}
proc SetInteractionState*(this: var vtkFinitePlaneRepresentation; _arg: cint) {.
    importcpp: "SetInteractionState", header: "vtkFinitePlaneRepresentation.h".}
proc GetInteractionStateMinValue*(this: var vtkFinitePlaneRepresentation): cint {.
    importcpp: "GetInteractionStateMinValue",
    header: "vtkFinitePlaneRepresentation.h".}
proc GetInteractionStateMaxValue*(this: var vtkFinitePlaneRepresentation): cint {.
    importcpp: "GetInteractionStateMaxValue",
    header: "vtkFinitePlaneRepresentation.h".}
  ## /@{
  ## *
  ##  Set/Get the origin of the plane.
  ##
proc SetOrigin*(this: var vtkFinitePlaneRepresentation; x: cdouble; y: cdouble;
               z: cdouble) {.importcpp: "SetOrigin",
                           header: "vtkFinitePlaneRepresentation.h".}
proc SetOrigin*(this: var vtkFinitePlaneRepresentation; x: array[3, cdouble]) {.
    importcpp: "SetOrigin", header: "vtkFinitePlaneRepresentation.h".}
## !!!Ignored construct:  virtual double * GetOrigin ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Origin  pointer  << this -> Origin ) ; return this -> Origin ; } VTK_WRAPEXCLUDE virtual void GetOrigin ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Origin [ 0 ] ; _arg2 = this -> Origin [ 1 ] ; _arg3 = this -> Origin [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Origin  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetOrigin ( double _arg [ 3 ] ) { this -> GetOrigin ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetNormal*(this: var vtkFinitePlaneRepresentation; x: cdouble; y: cdouble;
               z: cdouble) {.importcpp: "SetNormal",
                           header: "vtkFinitePlaneRepresentation.h".}
proc SetNormal*(this: var vtkFinitePlaneRepresentation; n: array[3, cdouble]) {.
    importcpp: "SetNormal", header: "vtkFinitePlaneRepresentation.h".}
## !!!Ignored construct:  virtual double * GetOriginNormal ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Normal  pointer  << this -> Normal ) ; return this -> Normal ; } VTK_WRAPEXCLUDE virtual void GetOriginNormal ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Normal [ 0 ] ; _arg2 = this -> Normal [ 1 ] ; _arg3 = this -> Normal [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Normal  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetOriginNormal ( double _arg [ 3 ] ) { this -> GetOriginNormal ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetV1*(this: var vtkFinitePlaneRepresentation; x: cdouble; y: cdouble) {.
    importcpp: "SetV1", header: "vtkFinitePlaneRepresentation.h".}
proc SetV1*(this: var vtkFinitePlaneRepresentation; x: array[2, cdouble]) {.
    importcpp: "SetV1", header: "vtkFinitePlaneRepresentation.h".}
## !!!Ignored construct:  virtual double * GetV1 ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << V1  pointer  << this -> V1 ) ; return this -> V1 ; } VTK_WRAPEXCLUDE virtual void GetV1 ( double & _arg1 , double & _arg2 ) { _arg1 = this -> V1 [ 0 ] ; _arg2 = this -> V1 [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << V1  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetV1 ( double _arg [ 2 ] ) { this -> GetV1 ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetV2*(this: var vtkFinitePlaneRepresentation; x: cdouble; y: cdouble) {.
    importcpp: "SetV2", header: "vtkFinitePlaneRepresentation.h".}
proc SetV2*(this: var vtkFinitePlaneRepresentation; x: array[2, cdouble]) {.
    importcpp: "SetV2", header: "vtkFinitePlaneRepresentation.h".}
## !!!Ignored construct:  virtual double * GetV1V2 ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << V2  pointer  << this -> V2 ) ; return this -> V2 ; } VTK_WRAPEXCLUDE virtual void GetV1V2 ( double & _arg1 , double & _arg2 ) { _arg1 = this -> V2 [ 0 ] ; _arg2 = this -> V2 [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << V2  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetV1V2 ( double _arg [ 2 ] ) { this -> GetV1V2 ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetRepresentationState*(this: var vtkFinitePlaneRepresentation; a2: cint) {.
    importcpp: "SetRepresentationState", header: "vtkFinitePlaneRepresentation.h".}
## !!!Ignored construct:  virtual int GetTubingDrawPlaneRepresentationState ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RepresentationState  of  << this -> RepresentationState ) ; return this -> RepresentationState ; } ;
## Error: expected ';'!!!

proc GetnameV1HandlePropertyV2HandlePropertySelectedHandlePropertyPlanePropertySelectedPlanePropertyNormalProperty*(
    this: var vtkFinitePlaneRepresentation): ptr vtkProperty {.importcpp: "GetnameV1HandlePropertyV2HandlePropertySelectedHandlePropertyPlanePropertySelectedPlanePropertyNormalProperty",
    header: "vtkFinitePlaneRepresentation.h".}
proc GetnameV1HandlePropertyV2HandlePropertySelectedHandlePropertyPlanePropertySelectedPlanePropertyNormalPropertySelectedNormalProperty*(
    this: var vtkFinitePlaneRepresentation): ptr vtkProperty {.importcpp: "GetnameV1HandlePropertyV2HandlePropertySelectedHandlePropertyPlanePropertySelectedPlanePropertyNormalPropertySelectedNormalProperty",
    header: "vtkFinitePlaneRepresentation.h".}
  ## /@}
  ##  Methods to manipulate the plane
proc TranslateOrigin*(this: var vtkFinitePlaneRepresentation; p1: ptr cdouble;
                     p2: ptr cdouble) {.importcpp: "TranslateOrigin",
                                     header: "vtkFinitePlaneRepresentation.h".}
proc MovePoint1*(this: var vtkFinitePlaneRepresentation; p1: ptr cdouble;
                p2: ptr cdouble) {.importcpp: "MovePoint1",
                                header: "vtkFinitePlaneRepresentation.h".}
proc MovePoint2*(this: var vtkFinitePlaneRepresentation; p1: ptr cdouble;
                p2: ptr cdouble) {.importcpp: "MovePoint2",
                                header: "vtkFinitePlaneRepresentation.h".}
proc Push*(this: var vtkFinitePlaneRepresentation; p1: ptr cdouble; p2: ptr cdouble) {.
    importcpp: "Push", header: "vtkFinitePlaneRepresentation.h".}
proc Rotate*(this: var vtkFinitePlaneRepresentation; X: cint; Y: cint; p1: ptr cdouble;
            p2: ptr cdouble; vpn: ptr cdouble) {.importcpp: "Rotate",
    header: "vtkFinitePlaneRepresentation.h".}
type
  vtkFinitePlaneRepresentationInteractionStateType* {.size: sizeof(cint),
      importcpp: "vtkFinitePlaneRepresentation::InteractionStateType",
      header: "vtkFinitePlaneRepresentation.h".} = enum
    Outside = 0, MoveOrigin, ModifyV1, ModifyV2, Moving, Rotating, Pushing


## !!!Ignored construct:  # ! defined ( VTK_LEGACY_REMOVE ) [NewLine] VTK_DEPRECATED_IN_9_2_0 ( because leading underscore is reserved ) typedef InteractionStateType _InteractionState ;
## Error: identifier expected, but got: because leading underscore is reserved!!!

proc RegisterPickers*(this: var vtkFinitePlaneRepresentation) {.
    importcpp: "RegisterPickers", header: "vtkFinitePlaneRepresentation.h".}