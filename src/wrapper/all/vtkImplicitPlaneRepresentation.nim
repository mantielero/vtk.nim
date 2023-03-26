## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImplicitPlaneRepresentation.h
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
##  @class   vtkImplicitPlaneRepresentation
##  @brief   a class defining the representation for a vtkImplicitPlaneWidget2
##
##  This class is a concrete representation for the
##  vtkImplicitPlaneWidget2. It represents an infinite plane defined by a
##  normal and point in the context of a bounding box. Through interaction
##  with the widget, the plane can be manipulated by adjusting the plane
##  normal or moving the origin point.
##
##  To use this representation, you normally define a (plane) origin and (plane)
##  normal. The PlaceWidget() method is also used to initially position the
##  representation.
##
##  @warning
##  This class, and vtkImplicitPlaneWidget2, are next generation VTK
##  widgets. An earlier version of this functionality was defined in the
##  class vtkImplicitPlaneWidget.
##
##  @sa
##  vtkImplicitPlaneWidget2 vtkImplicitPlaneWidget vtkImplicitImageRepresentation
##

import
  vtkDeprecation, vtkInteractionWidgetsModule, vtkWidgetRepresentation

discard "forward decl of vtkActor"
discard "forward decl of vtkBox"
discard "forward decl of vtkCellPicker"
discard "forward decl of vtkConeSource"
discard "forward decl of vtkCutter"
discard "forward decl of vtkFeatureEdges"
discard "forward decl of vtkImageData"
discard "forward decl of vtkLineSource"
discard "forward decl of vtkLookupTable"
discard "forward decl of vtkOutlineFilter"
discard "forward decl of vtkPlane"
discard "forward decl of vtkPlaneSource"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkPolyDataAlgorithm"
discard "forward decl of vtkPolyDataMapper"
discard "forward decl of vtkProperty"
discard "forward decl of vtkSphereSource"
discard "forward decl of vtkTransform"
discard "forward decl of vtkTubeFilter"
type
  vtkImplicitPlaneRepresentation* {.importcpp: "vtkImplicitPlaneRepresentation",
                                   header: "vtkImplicitPlaneRepresentation.h",
                                   bycopy.} = object of vtkWidgetRepresentation ## *
                                                                           ##  Instantiate the class.
                                                                           ##
    vtkImplicitPlaneRepresentation* {.importc: "vtkImplicitPlaneRepresentation".}: VTK_NEWINSTANCE
    ##  Keep track of event positions
    ##  Controlling ivars
    ##  Locking normal to camera
    ##  Controlling the push operation
    ##  The actual plane which is being manipulated
    ##  The bounding box is represented by a single voxel image data
    ##  whether the outline can be moved
    ##  whether the widget can be scaled
    ##  whether the widget can be moved outside input's bounds
    ##  The cut plane is produced with a vtkCutter
    ##  used when plane cropping disabled
    ##  control whether tubing is on
    ##  The + normal cone
    ##  The - normal cone
    ##  The origin positioning handle
    ##  Do the picking
    ##  Register internal Pickers within PickingManager
    ##  Methods to manipulate the plane
    ##  Support GetBounds() method


proc New*(): ptr vtkImplicitPlaneRepresentation {.
    importcpp: "vtkImplicitPlaneRepresentation::New(@)",
    header: "vtkImplicitPlaneRepresentation.h".}
type
  vtkImplicitPlaneRepresentationSuperclass* = vtkWidgetRepresentation

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImplicitPlaneRepresentation::IsTypeOf(@)",
    header: "vtkImplicitPlaneRepresentation.h".}
proc IsA*(this: var vtkImplicitPlaneRepresentation; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImplicitPlaneRepresentation.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImplicitPlaneRepresentation {.
    importcpp: "vtkImplicitPlaneRepresentation::SafeDownCast(@)",
    header: "vtkImplicitPlaneRepresentation.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImplicitPlaneRepresentation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWidgetRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImplicitPlaneRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImplicitPlaneRepresentation :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImplicitPlaneRepresentation; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkImplicitPlaneRepresentation.h".}
proc SetOrigin*(this: var vtkImplicitPlaneRepresentation; x: cdouble; y: cdouble;
               z: cdouble) {.importcpp: "SetOrigin",
                           header: "vtkImplicitPlaneRepresentation.h".}
proc SetOrigin*(this: var vtkImplicitPlaneRepresentation; x: array[3, cdouble]) {.
    importcpp: "SetOrigin", header: "vtkImplicitPlaneRepresentation.h".}
## !!!Ignored construct:  double * GetOrigin ( ) VTK_SIZEHINT ( 3 ) ;
## Error: expected ';'!!!

proc GetOrigin*(this: var vtkImplicitPlaneRepresentation; xyz: array[3, cdouble]) {.
    importcpp: "GetOrigin", header: "vtkImplicitPlaneRepresentation.h".}
proc SetNormal*(this: var vtkImplicitPlaneRepresentation; x: cdouble; y: cdouble;
               z: cdouble) {.importcpp: "SetNormal",
                           header: "vtkImplicitPlaneRepresentation.h".}
proc SetNormal*(this: var vtkImplicitPlaneRepresentation; n: array[3, cdouble]) {.
    importcpp: "SetNormal", header: "vtkImplicitPlaneRepresentation.h".}
proc SetNormalToCamera*(this: var vtkImplicitPlaneRepresentation) {.
    importcpp: "SetNormalToCamera", header: "vtkImplicitPlaneRepresentation.h".}
## !!!Ignored construct:  double * GetNormal ( ) VTK_SIZEHINT ( 3 ) ;
## Error: expected ';'!!!

proc GetNormal*(this: var vtkImplicitPlaneRepresentation; xyz: array[3, cdouble]) {.
    importcpp: "GetNormal", header: "vtkImplicitPlaneRepresentation.h".}
proc SetNormalToXAxis*(this: var vtkImplicitPlaneRepresentation; a2: vtkTypeBool) {.
    importcpp: "SetNormalToXAxis", header: "vtkImplicitPlaneRepresentation.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetNormalToXAxis ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NormalToXAxis  of  << this -> NormalToXAxis ) ; return this -> NormalToXAxis ; } ;
## Error: expected ';'!!!

proc NormalToXAxisOn*(this: var vtkImplicitPlaneRepresentation) {.
    importcpp: "NormalToXAxisOn", header: "vtkImplicitPlaneRepresentation.h".}
proc NormalToXAxisOff*(this: var vtkImplicitPlaneRepresentation) {.
    importcpp: "NormalToXAxisOff", header: "vtkImplicitPlaneRepresentation.h".}
proc SetNormalToYAxis*(this: var vtkImplicitPlaneRepresentation; a2: vtkTypeBool) {.
    importcpp: "SetNormalToYAxis", header: "vtkImplicitPlaneRepresentation.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetNormalToXAxisNormalToYAxis ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NormalToYAxis  of  << this -> NormalToYAxis ) ; return this -> NormalToYAxis ; } ;
## Error: expected ';'!!!

proc NormalToYAxisOn*(this: var vtkImplicitPlaneRepresentation) {.
    importcpp: "NormalToYAxisOn", header: "vtkImplicitPlaneRepresentation.h".}
proc NormalToYAxisOff*(this: var vtkImplicitPlaneRepresentation) {.
    importcpp: "NormalToYAxisOff", header: "vtkImplicitPlaneRepresentation.h".}
proc SetNormalToZAxis*(this: var vtkImplicitPlaneRepresentation; a2: vtkTypeBool) {.
    importcpp: "SetNormalToZAxis", header: "vtkImplicitPlaneRepresentation.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetNormalToXAxisNormalToYAxisNormalToZAxis ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NormalToZAxis  of  << this -> NormalToZAxis ) ; return this -> NormalToZAxis ; } ;
## Error: expected ';'!!!

proc NormalToZAxisOn*(this: var vtkImplicitPlaneRepresentation) {.
    importcpp: "NormalToZAxisOn", header: "vtkImplicitPlaneRepresentation.h".}
proc NormalToZAxisOff*(this: var vtkImplicitPlaneRepresentation) {.
    importcpp: "NormalToZAxisOff", header: "vtkImplicitPlaneRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  If enabled, and a vtkCamera is available through the renderer, then
  ##  LockNormalToCamera will cause the normal to follow the camera's
  ##  normal.
  ##
proc SetLockNormalToCamera*(this: var vtkImplicitPlaneRepresentation;
                           a2: vtkTypeBool) {.importcpp: "SetLockNormalToCamera",
    header: "vtkImplicitPlaneRepresentation.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCamera ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LockNormalToCamera  of  << this -> LockNormalToCamera ) ; return this -> LockNormalToCamera ; } ;
## Error: expected ';'!!!

proc LockNormalToCameraOn*(this: var vtkImplicitPlaneRepresentation) {.
    importcpp: "LockNormalToCameraOn", header: "vtkImplicitPlaneRepresentation.h".}
proc LockNormalToCameraOff*(this: var vtkImplicitPlaneRepresentation) {.
    importcpp: "LockNormalToCameraOff", header: "vtkImplicitPlaneRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off tubing of the wire outline of the plane. The tube thickens
  ##  the line by wrapping with a vtkTubeFilter.
  ##
proc SetTubing*(this: var vtkImplicitPlaneRepresentation; _arg: vtkTypeBool) {.
    importcpp: "SetTubing", header: "vtkImplicitPlaneRepresentation.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraTubing ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tubing  of  << this -> Tubing ) ; return this -> Tubing ; } ;
## Error: expected ';'!!!

proc TubingOn*(this: var vtkImplicitPlaneRepresentation) {.importcpp: "TubingOn",
    header: "vtkImplicitPlaneRepresentation.h".}
proc TubingOff*(this: var vtkImplicitPlaneRepresentation) {.importcpp: "TubingOff",
    header: "vtkImplicitPlaneRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Enable/disable the drawing of the plane. In some cases the plane
  ##  interferes with the object that it is operating on (i.e., the
  ##  plane interferes with the cut surface it produces producing
  ##  z-buffer artifacts.)
  ##
proc SetDrawPlane*(this: var vtkImplicitPlaneRepresentation; plane: vtkTypeBool) {.
    importcpp: "SetDrawPlane", header: "vtkImplicitPlaneRepresentation.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraTubingDrawPlane ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DrawPlane  of  << this -> DrawPlane ) ; return this -> DrawPlane ; } ;
## Error: expected ';'!!!

proc DrawPlaneOn*(this: var vtkImplicitPlaneRepresentation) {.
    importcpp: "DrawPlaneOn", header: "vtkImplicitPlaneRepresentation.h".}
proc DrawPlaneOff*(this: var vtkImplicitPlaneRepresentation) {.
    importcpp: "DrawPlaneOff", header: "vtkImplicitPlaneRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Enable/disable the drawing of the outline.
  ##
proc SetDrawOutline*(this: var vtkImplicitPlaneRepresentation; plane: vtkTypeBool) {.
    importcpp: "SetDrawOutline", header: "vtkImplicitPlaneRepresentation.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraTubingDrawPlaneDrawOutline ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DrawOutline  of  << this -> DrawOutline ) ; return this -> DrawOutline ; } ;
## Error: expected ';'!!!

proc DrawOutlineOn*(this: var vtkImplicitPlaneRepresentation) {.
    importcpp: "DrawOutlineOn", header: "vtkImplicitPlaneRepresentation.h".}
proc DrawOutlineOff*(this: var vtkImplicitPlaneRepresentation) {.
    importcpp: "DrawOutlineOff", header: "vtkImplicitPlaneRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off the ability to translate the bounding box by grabbing it
  ##  with the left mouse button.
  ##
proc SetTubingOutlineTranslation*(this: var vtkImplicitPlaneRepresentation;
                                 _arg: vtkTypeBool) {.
    importcpp: "SetTubingOutlineTranslation",
    header: "vtkImplicitPlaneRepresentation.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraTubingDrawPlaneDrawOutlineOutlineTranslation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutlineTranslation  of  << this -> OutlineTranslation ) ; return this -> OutlineTranslation ; } ;
## Error: expected ';'!!!

proc OutlineTranslationOn*(this: var vtkImplicitPlaneRepresentation) {.
    importcpp: "OutlineTranslationOn", header: "vtkImplicitPlaneRepresentation.h".}
proc OutlineTranslationOff*(this: var vtkImplicitPlaneRepresentation) {.
    importcpp: "OutlineTranslationOff", header: "vtkImplicitPlaneRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off the ability to move the widget outside of the bounds
  ##  specified in the initial PlaceWidget() invocation.
  ##
proc SetTubingOutlineTranslationOutsideBounds*(
    this: var vtkImplicitPlaneRepresentation; _arg: vtkTypeBool) {.
    importcpp: "SetTubingOutlineTranslationOutsideBounds",
    header: "vtkImplicitPlaneRepresentation.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraTubingDrawPlaneDrawOutlineOutlineTranslationOutsideBounds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutsideBounds  of  << this -> OutsideBounds ) ; return this -> OutsideBounds ; } ;
## Error: expected ';'!!!

proc OutsideBoundsOn*(this: var vtkImplicitPlaneRepresentation) {.
    importcpp: "OutsideBoundsOn", header: "vtkImplicitPlaneRepresentation.h".}
proc OutsideBoundsOff*(this: var vtkImplicitPlaneRepresentation) {.
    importcpp: "OutsideBoundsOff", header: "vtkImplicitPlaneRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Toggles constraint translation axis on/off.
  ##
proc SetXTranslationAxisOn*(this: var vtkImplicitPlaneRepresentation) {.
    importcpp: "SetXTranslationAxisOn", header: "vtkImplicitPlaneRepresentation.h".}
proc SetYTranslationAxisOn*(this: var vtkImplicitPlaneRepresentation) {.
    importcpp: "SetYTranslationAxisOn", header: "vtkImplicitPlaneRepresentation.h".}
proc SetZTranslationAxisOn*(this: var vtkImplicitPlaneRepresentation) {.
    importcpp: "SetZTranslationAxisOn", header: "vtkImplicitPlaneRepresentation.h".}
proc SetTranslationAxisOff*(this: var vtkImplicitPlaneRepresentation) {.
    importcpp: "SetTranslationAxisOff", header: "vtkImplicitPlaneRepresentation.h".}
proc IsTranslationConstrained*(this: var vtkImplicitPlaneRepresentation): bool {.
    importcpp: "IsTranslationConstrained",
    header: "vtkImplicitPlaneRepresentation.h".}
proc SetWidgetBounds*(this: var vtkImplicitPlaneRepresentation; _arg1: cdouble;
                     _arg2: cdouble; _arg3: cdouble; _arg4: cdouble; _arg5: cdouble;
                     _arg6: cdouble) {.importcpp: "SetWidgetBounds",
                                     header: "vtkImplicitPlaneRepresentation.h".}
proc SetWidgetBounds*(this: var vtkImplicitPlaneRepresentation;
                     _arg: array[6, cdouble]) {.importcpp: "SetWidgetBounds",
    header: "vtkImplicitPlaneRepresentation.h".}
## !!!Ignored construct:  virtual double * GetWidgetBounds ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << WidgetBounds  pointer  << this -> WidgetBounds ) ; return this -> WidgetBounds ; } VTK_WRAPEXCLUDE virtual void GetWidgetBounds ( double & _arg1 , double & _arg2 , double & _arg3 , double & _arg4 , double & _arg5 , double & _arg6 ) { _arg1 = this -> WidgetBounds [ 0 ] ; _arg2 = this -> WidgetBounds [ 1 ] ; _arg3 = this -> WidgetBounds [ 2 ] ; _arg4 = this -> WidgetBounds [ 3 ] ; _arg5 = this -> WidgetBounds [ 4 ] ; _arg6 = this -> WidgetBounds [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << WidgetBounds  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetWidgetBounds ( double _arg [ 6 ] ) { this -> GetWidgetBounds ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ;
## Error: expected ';'!!!

proc SetTubingOutlineTranslationOutsideBoundsConstrainToWidgetBounds*(
    this: var vtkImplicitPlaneRepresentation; _arg: vtkTypeBool) {.importcpp: "SetTubingOutlineTranslationOutsideBoundsConstrainToWidgetBounds",
    header: "vtkImplicitPlaneRepresentation.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraTubingDrawPlaneDrawOutlineOutlineTranslationOutsideBoundsConstrainToWidgetBounds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ConstrainToWidgetBounds  of  << this -> ConstrainToWidgetBounds ) ; return this -> ConstrainToWidgetBounds ; } ;
## Error: expected ';'!!!

proc ConstrainToWidgetBoundsOn*(this: var vtkImplicitPlaneRepresentation) {.
    importcpp: "ConstrainToWidgetBoundsOn",
    header: "vtkImplicitPlaneRepresentation.h".}
proc ConstrainToWidgetBoundsOff*(this: var vtkImplicitPlaneRepresentation) {.
    importcpp: "ConstrainToWidgetBoundsOff",
    header: "vtkImplicitPlaneRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off the ability to scale the widget with the mouse.
  ##
proc SetTubingOutlineTranslationOutsideBoundsConstrainToWidgetBoundsScaleEnabled*(
    this: var vtkImplicitPlaneRepresentation; _arg: vtkTypeBool) {.importcpp: "SetTubingOutlineTranslationOutsideBoundsConstrainToWidgetBoundsScaleEnabled",
    header: "vtkImplicitPlaneRepresentation.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraTubingDrawPlaneDrawOutlineOutlineTranslationOutsideBoundsConstrainToWidgetBoundsScaleEnabled ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScaleEnabled  of  << this -> ScaleEnabled ) ; return this -> ScaleEnabled ; } ;
## Error: expected ';'!!!

proc ScaleEnabledOn*(this: var vtkImplicitPlaneRepresentation) {.
    importcpp: "ScaleEnabledOn", header: "vtkImplicitPlaneRepresentation.h".}
proc ScaleEnabledOff*(this: var vtkImplicitPlaneRepresentation) {.
    importcpp: "ScaleEnabledOff", header: "vtkImplicitPlaneRepresentation.h".}
  ## /@}
  ## *
  ##  Grab the polydata that defines the plane. The polydata contains a single
  ##  polygon that is clipped by the bounding box.
  ##
proc GetPolyData*(this: var vtkImplicitPlaneRepresentation; pd: ptr vtkPolyData) {.
    importcpp: "GetPolyData", header: "vtkImplicitPlaneRepresentation.h".}
proc GetPolyDataAlgorithm*(this: var vtkImplicitPlaneRepresentation): ptr vtkPolyDataAlgorithm {.
    importcpp: "GetPolyDataAlgorithm", header: "vtkImplicitPlaneRepresentation.h".}
proc GetPlane*(this: var vtkImplicitPlaneRepresentation; plane: ptr vtkPlane) {.
    importcpp: "GetPlane", header: "vtkImplicitPlaneRepresentation.h".}
proc SetPlane*(this: var vtkImplicitPlaneRepresentation; plane: ptr vtkPlane) {.
    importcpp: "SetPlane", header: "vtkImplicitPlaneRepresentation.h".}
proc UpdatePlacement*(this: var vtkImplicitPlaneRepresentation) {.
    importcpp: "UpdatePlacement", header: "vtkImplicitPlaneRepresentation.h".}
proc GetnameNormalProperty*(this: var vtkImplicitPlaneRepresentation): ptr vtkProperty {.
    importcpp: "GetnameNormalProperty", header: "vtkImplicitPlaneRepresentation.h".}
proc GetnameNormalPropertySelectedNormalProperty*(
    this: var vtkImplicitPlaneRepresentation): ptr vtkProperty {.
    importcpp: "GetnameNormalPropertySelectedNormalProperty",
    header: "vtkImplicitPlaneRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the plane properties. The properties of the plane when selected
  ##  and unselected can be manipulated.
  ##
proc GetnameNormalPropertySelectedNormalPropertyPlaneProperty*(
    this: var vtkImplicitPlaneRepresentation): ptr vtkProperty {.
    importcpp: "GetnameNormalPropertySelectedNormalPropertyPlaneProperty",
    header: "vtkImplicitPlaneRepresentation.h".}
proc GetnameNormalPropertySelectedNormalPropertyPlanePropertySelectedPlaneProperty*(
    this: var vtkImplicitPlaneRepresentation): ptr vtkProperty {.importcpp: "GetnameNormalPropertySelectedNormalPropertyPlanePropertySelectedPlaneProperty",
    header: "vtkImplicitPlaneRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the property of the outline.
  ##
proc GetnameNormalPropertySelectedNormalPropertyPlanePropertySelectedPlanePropertyOutlineProperty*(
    this: var vtkImplicitPlaneRepresentation): ptr vtkProperty {.importcpp: "GetnameNormalPropertySelectedNormalPropertyPlanePropertySelectedPlanePropertyOutlineProperty",
    header: "vtkImplicitPlaneRepresentation.h".}
proc GetnameNormalPropertySelectedNormalPropertyPlanePropertySelectedPlanePropertyOutlinePropertySelectedOutlineProperty*(
    this: var vtkImplicitPlaneRepresentation): ptr vtkProperty {.importcpp: "GetnameNormalPropertySelectedNormalPropertyPlanePropertySelectedPlanePropertyOutlinePropertySelectedOutlineProperty",
    header: "vtkImplicitPlaneRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the property of the intersection edges. (This property also
  ##  applies to the edges when tubed.)
  ##
proc GetnameNormalPropertySelectedNormalPropertyPlanePropertySelectedPlanePropertyOutlinePropertySelectedOutlinePropertyEdgesProperty*(
    this: var vtkImplicitPlaneRepresentation): ptr vtkProperty {.importcpp: "GetnameNormalPropertySelectedNormalPropertyPlanePropertySelectedPlanePropertyOutlinePropertySelectedOutlinePropertyEdgesProperty",
    header: "vtkImplicitPlaneRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set color to the edge
  ##
proc SetEdgeColor*(this: var vtkImplicitPlaneRepresentation; a2: ptr vtkLookupTable) {.
    importcpp: "SetEdgeColor", header: "vtkImplicitPlaneRepresentation.h".}
proc SetEdgeColor*(this: var vtkImplicitPlaneRepresentation; a2: cdouble; a3: cdouble;
                  a4: cdouble) {.importcpp: "SetEdgeColor",
                               header: "vtkImplicitPlaneRepresentation.h".}
proc SetEdgeColor*(this: var vtkImplicitPlaneRepresentation; c: array[3, cdouble]) {.
    importcpp: "SetEdgeColor", header: "vtkImplicitPlaneRepresentation.h".}
proc SetBumpDistance*(this: var vtkImplicitPlaneRepresentation; _arg: cdouble) {.
    importcpp: "SetBumpDistance", header: "vtkImplicitPlaneRepresentation.h".}
proc GetBumpDistanceMinValue*(this: var vtkImplicitPlaneRepresentation): cdouble {.
    importcpp: "GetBumpDistanceMinValue",
    header: "vtkImplicitPlaneRepresentation.h".}
proc GetBumpDistanceMaxValue*(this: var vtkImplicitPlaneRepresentation): cdouble {.
    importcpp: "GetBumpDistanceMaxValue",
    header: "vtkImplicitPlaneRepresentation.h".}
## !!!Ignored construct:  virtual double GetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraTubingDrawPlaneDrawOutlineOutlineTranslationOutsideBoundsConstrainToWidgetBoundsScaleEnabledBumpDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BumpDistance  of  << this -> BumpDistance ) ; return this -> BumpDistance ; } ;
## Error: expected ';'!!!

proc BumpPlane*(this: var vtkImplicitPlaneRepresentation; dir: cint; factor: cdouble) {.
    importcpp: "BumpPlane", header: "vtkImplicitPlaneRepresentation.h".}
proc PushPlane*(this: var vtkImplicitPlaneRepresentation; distance: cdouble) {.
    importcpp: "PushPlane", header: "vtkImplicitPlaneRepresentation.h".}
proc ComputeInteractionState*(this: var vtkImplicitPlaneRepresentation; X: cint;
                             Y: cint; modify: cint = 0): cint {.
    importcpp: "ComputeInteractionState",
    header: "vtkImplicitPlaneRepresentation.h".}
proc PlaceWidget*(this: var vtkImplicitPlaneRepresentation;
                 bounds: array[6, cdouble]) {.importcpp: "PlaceWidget",
    header: "vtkImplicitPlaneRepresentation.h".}
proc BuildRepresentation*(this: var vtkImplicitPlaneRepresentation) {.
    importcpp: "BuildRepresentation", header: "vtkImplicitPlaneRepresentation.h".}
proc StartWidgetInteraction*(this: var vtkImplicitPlaneRepresentation;
                            eventPos: array[2, cdouble]) {.
    importcpp: "StartWidgetInteraction",
    header: "vtkImplicitPlaneRepresentation.h".}
proc WidgetInteraction*(this: var vtkImplicitPlaneRepresentation;
                       newEventPos: array[2, cdouble]) {.
    importcpp: "WidgetInteraction", header: "vtkImplicitPlaneRepresentation.h".}
proc EndWidgetInteraction*(this: var vtkImplicitPlaneRepresentation;
                          newEventPos: array[2, cdouble]) {.
    importcpp: "EndWidgetInteraction", header: "vtkImplicitPlaneRepresentation.h".}
proc StartComplexInteraction*(this: var vtkImplicitPlaneRepresentation;
                             iren: ptr vtkRenderWindowInteractor;
                             widget: ptr vtkAbstractWidget; event: culong;
                             calldata: pointer) {.
    importcpp: "StartComplexInteraction",
    header: "vtkImplicitPlaneRepresentation.h".}
proc ComplexInteraction*(this: var vtkImplicitPlaneRepresentation;
                        iren: ptr vtkRenderWindowInteractor;
                        widget: ptr vtkAbstractWidget; event: culong;
                        calldata: pointer) {.importcpp: "ComplexInteraction",
    header: "vtkImplicitPlaneRepresentation.h".}
proc ComputeComplexInteractionState*(this: var vtkImplicitPlaneRepresentation;
                                    iren: ptr vtkRenderWindowInteractor;
                                    widget: ptr vtkAbstractWidget; event: culong;
                                    calldata: pointer; modify: cint = 0): cint {.
    importcpp: "ComputeComplexInteractionState",
    header: "vtkImplicitPlaneRepresentation.h".}
proc EndComplexInteraction*(this: var vtkImplicitPlaneRepresentation;
                           iren: ptr vtkRenderWindowInteractor;
                           widget: ptr vtkAbstractWidget; event: culong;
                           calldata: pointer) {.
    importcpp: "EndComplexInteraction", header: "vtkImplicitPlaneRepresentation.h".}
## !!!Ignored construct:  /@} /@{ *
##  Methods supporting the rendering process.
##  double * GetBounds ( ) VTK_SIZEHINT ( 6 ) override ;
## Error: expected ';'!!!

proc GetActors*(this: var vtkImplicitPlaneRepresentation; pc: ptr vtkPropCollection) {.
    importcpp: "GetActors", header: "vtkImplicitPlaneRepresentation.h".}
proc ReleaseGraphicsResources*(this: var vtkImplicitPlaneRepresentation;
                              a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources",
    header: "vtkImplicitPlaneRepresentation.h".}
proc RenderOpaqueGeometry*(this: var vtkImplicitPlaneRepresentation;
                          a2: ptr vtkViewport): cint {.
    importcpp: "RenderOpaqueGeometry", header: "vtkImplicitPlaneRepresentation.h".}
proc RenderTranslucentPolygonalGeometry*(this: var vtkImplicitPlaneRepresentation;
                                        a2: ptr vtkViewport): cint {.
    importcpp: "RenderTranslucentPolygonalGeometry",
    header: "vtkImplicitPlaneRepresentation.h".}
proc HasTranslucentPolygonalGeometry*(this: var vtkImplicitPlaneRepresentation): vtkTypeBool {.
    importcpp: "HasTranslucentPolygonalGeometry",
    header: "vtkImplicitPlaneRepresentation.h".}
type
  vtkImplicitPlaneRepresentationInteractionStateType* {.size: sizeof(cint),
      importcpp: "vtkImplicitPlaneRepresentation::InteractionStateType",
      header: "vtkImplicitPlaneRepresentation.h".} = enum
    Outside = 0, Moving, MovingOutline, MovingOrigin, Rotating, Pushing, Scaling


## !!!Ignored construct:  # ! defined ( VTK_LEGACY_REMOVE ) [NewLine] VTK_DEPRECATED_IN_9_2_0 ( because leading underscore is reserved ) typedef InteractionStateType _InteractionState ;
## Error: identifier expected, but got: because leading underscore is reserved!!!

proc SetBumpDistanceInteractionState*(this: var vtkImplicitPlaneRepresentation;
                                     _arg: cint) {.
    importcpp: "SetBumpDistanceInteractionState",
    header: "vtkImplicitPlaneRepresentation.h".}
proc GetBumpDistanceMinValueInteractionStateMinValue*(
    this: var vtkImplicitPlaneRepresentation): cint {.
    importcpp: "GetBumpDistanceMinValueInteractionStateMinValue",
    header: "vtkImplicitPlaneRepresentation.h".}
proc GetBumpDistanceMaxValueInteractionStateMaxValue*(
    this: var vtkImplicitPlaneRepresentation): cint {.
    importcpp: "GetBumpDistanceMaxValueInteractionStateMaxValue",
    header: "vtkImplicitPlaneRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Sets the visual appearance of the representation based on the
  ##  state it is in. This state is usually the same as InteractionState.
  ##
proc SetRepresentationState*(this: var vtkImplicitPlaneRepresentation; a2: cint) {.
    importcpp: "SetRepresentationState",
    header: "vtkImplicitPlaneRepresentation.h".}
## !!!Ignored construct:  virtual int GetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraTubingDrawPlaneDrawOutlineOutlineTranslationOutsideBoundsConstrainToWidgetBoundsScaleEnabledBumpDistanceRepresentationState ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RepresentationState  of  << this -> RepresentationState ) ; return this -> RepresentationState ; } ;
## Error: expected ';'!!!

proc GetUnderlyingPlane*(this: var vtkImplicitPlaneRepresentation): ptr vtkPlane {.
    importcpp: "GetUnderlyingPlane", header: "vtkImplicitPlaneRepresentation.h".}
proc SetCropPlaneToBoundingBox*(this: var vtkImplicitPlaneRepresentation; a2: bool) {.
    importcpp: "SetCropPlaneToBoundingBox",
    header: "vtkImplicitPlaneRepresentation.h".}
## !!!Ignored construct:  virtual bool GetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraTubingDrawPlaneDrawOutlineOutlineTranslationOutsideBoundsConstrainToWidgetBoundsScaleEnabledBumpDistanceRepresentationStateCropPlaneToBoundingBox ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CropPlaneToBoundingBox  of  << this -> CropPlaneToBoundingBox ) ; return this -> CropPlaneToBoundingBox ; } ;
## Error: expected ';'!!!

proc CropPlaneToBoundingBoxOn*(this: var vtkImplicitPlaneRepresentation) {.
    importcpp: "CropPlaneToBoundingBoxOn",
    header: "vtkImplicitPlaneRepresentation.h".}
proc CropPlaneToBoundingBoxOff*(this: var vtkImplicitPlaneRepresentation) {.
    importcpp: "CropPlaneToBoundingBoxOff",
    header: "vtkImplicitPlaneRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  For complex events should we snap orientations to
  ##  be aligned with the x y z axes
  ##
## !!!Ignored construct:  virtual bool GetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraTubingDrawPlaneDrawOutlineOutlineTranslationOutsideBoundsConstrainToWidgetBoundsScaleEnabledBumpDistanceRepresentationStateCropPlaneToBoundingBoxSnapToAxes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SnapToAxes  of  << this -> SnapToAxes ) ; return this -> SnapToAxes ; } ;
## Error: expected ';'!!!

proc SetTubingOutlineTranslationOutsideBoundsConstrainToWidgetBoundsScaleEnabledSnapToAxes*(
    this: var vtkImplicitPlaneRepresentation; _arg: bool) {.importcpp: "SetTubingOutlineTranslationOutsideBoundsConstrainToWidgetBoundsScaleEnabledSnapToAxes",
    header: "vtkImplicitPlaneRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Forces the plane's normal to be aligned with x, y or z axis.
  ##  The alignment happens when calling SetNormal.
  ##  It defers with SnapToAxes from it is always applicable, and SnapToAxes
  ##  only snaps when the angle difference exceeds 16 degrees in complex interactions.
  ##
## !!!Ignored construct:  virtual bool GetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraTubingDrawPlaneDrawOutlineOutlineTranslationOutsideBoundsConstrainToWidgetBoundsScaleEnabledBumpDistanceRepresentationStateCropPlaneToBoundingBoxSnapToAxesAlwaysSnapToNearestAxis ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AlwaysSnapToNearestAxis  of  << this -> AlwaysSnapToNearestAxis ) ; return this -> AlwaysSnapToNearestAxis ; } ;
## Error: expected ';'!!!

proc SetAlwaysSnapToNearestAxis*(this: var vtkImplicitPlaneRepresentation;
                                snap: bool) {.
    importcpp: "SetAlwaysSnapToNearestAxis",
    header: "vtkImplicitPlaneRepresentation.h".}