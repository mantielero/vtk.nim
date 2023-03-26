## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHandleRepresentation.h
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
##  @class   vtkHandleRepresentation
##  @brief   abstract class for representing widget handles
##
##  This class defines an API for widget handle representations. These
##  representations interact with vtkHandleWidget. Various representations
##  can be used depending on the nature of the handle. The basic functionality
##  of the handle representation is to maintain a position. The position is
##  represented via a vtkCoordinate, meaning that the position can be easily
##  obtained in a variety of coordinate systems.
##
##  Optional features for this representation include an active mode (the widget
##  appears only when the mouse pointer is close to it). The active distance is
##  expressed in pixels and represents a circle in display space.
##
##  The class may be subclassed so that alternative representations can
##  be created.  The class defines an API and a default implementation that
##  the vtkHandleWidget interacts with to render itself in the scene.
##
##  @warning
##  The separation of the widget event handling and representation enables
##  users and developers to create new appearances for the widget. It also
##  facilitates parallel processing, where the client application handles
##  events, and remote representations of the widget are slaves to the
##  client (and do not handle events).
##
##  @sa
##  vtkRectilinearWipeWidget vtkWidgetRepresentation vtkAbstractWidget
##

import
  vtkDeprecation, vtkInteractionWidgetsModule, vtkWidgetRepresentation

discard "forward decl of vtkCoordinate"
discard "forward decl of vtkRenderer"
discard "forward decl of vtkPointPlacer"
type
  vtkHandleRepresentation* {.importcpp: "vtkHandleRepresentation",
                            header: "vtkHandleRepresentation.h", bycopy.} = object of vtkWidgetRepresentation ## /@{
                                                                                                       ## *
                                                                                                       ##  Standard methods for instances of this class.
                                                                                                       ##
    vtkHandleRepresentation* {.importc: "vtkHandleRepresentation".}: VTK_NEWINSTANCE
    ##  Two vtkCoordinates are available to subclasses, one in display
    ##  coordinates and the other in world coordinates. These facilitate
    ##  the conversion between these two systems. Note that the WorldPosition
    ##  is the ultimate maintainer of position.
    ##  Keep track of when coordinates were changed
    ##  Constraint the placement of handles.
    ##  Constraint axis translation

  vtkHandleRepresentationSuperclass* = vtkWidgetRepresentation

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkHandleRepresentation::IsTypeOf(@)",
    header: "vtkHandleRepresentation.h".}
proc IsA*(this: var vtkHandleRepresentation; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkHandleRepresentation.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkHandleRepresentation {.
    importcpp: "vtkHandleRepresentation::SafeDownCast(@)",
    header: "vtkHandleRepresentation.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkHandleRepresentation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWidgetRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHandleRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHandleRepresentation :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkHandleRepresentation; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkHandleRepresentation.h".}
proc SetDisplayPosition*(this: var vtkHandleRepresentation; pos: array[3, cdouble]) {.
    importcpp: "SetDisplayPosition", header: "vtkHandleRepresentation.h".}
proc GetDisplayPosition*(this: var vtkHandleRepresentation; pos: array[3, cdouble]) {.
    importcpp: "GetDisplayPosition", header: "vtkHandleRepresentation.h".}
## !!!Ignored construct:  virtual double * GetDisplayPosition ( ) VTK_SIZEHINT ( 3 ) ;
## Error: expected ';'!!!

proc SetWorldPosition*(this: var vtkHandleRepresentation; pos: array[3, cdouble]) {.
    importcpp: "SetWorldPosition", header: "vtkHandleRepresentation.h".}
proc GetWorldPosition*(this: var vtkHandleRepresentation; pos: array[3, cdouble]) {.
    importcpp: "GetWorldPosition", header: "vtkHandleRepresentation.h".}
## !!!Ignored construct:  virtual double * GetWorldPosition ( ) VTK_SIZEHINT ( 3 ) ;
## Error: expected ';'!!!

proc SetTolerance*(this: var vtkHandleRepresentation; _arg: cint) {.
    importcpp: "SetTolerance", header: "vtkHandleRepresentation.h".}
proc GetToleranceMinValue*(this: var vtkHandleRepresentation): cint {.
    importcpp: "GetToleranceMinValue", header: "vtkHandleRepresentation.h".}
proc GetToleranceMaxValue*(this: var vtkHandleRepresentation): cint {.
    importcpp: "GetToleranceMaxValue", header: "vtkHandleRepresentation.h".}
## !!!Ignored construct:  virtual int GetTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tolerance  of  << this -> Tolerance ) ; return this -> Tolerance ; } ;
## Error: expected ';'!!!

proc SetActiveRepresentation*(this: var vtkHandleRepresentation; _arg: vtkTypeBool) {.
    importcpp: "SetActiveRepresentation", header: "vtkHandleRepresentation.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetToleranceActiveRepresentation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ActiveRepresentation  of  << this -> ActiveRepresentation ) ; return this -> ActiveRepresentation ; } ;
## Error: expected ';'!!!

proc ActiveRepresentationOn*(this: var vtkHandleRepresentation) {.
    importcpp: "ActiveRepresentationOn", header: "vtkHandleRepresentation.h".}
proc ActiveRepresentationOff*(this: var vtkHandleRepresentation) {.
    importcpp: "ActiveRepresentationOff", header: "vtkHandleRepresentation.h".}
  ## /@}
  ##  Enums define the state of the representation relative to the mouse pointer
  ##  position. Used by ComputeInteractionState() to communicate with the
  ##  widget. Note that ComputeInteractionState() and several other methods
  ##  must be implemented by subclasses.
type
  vtkHandleRepresentationInteractionStateType* {.size: sizeof(cint),
      importcpp: "vtkHandleRepresentation::InteractionStateType",
      header: "vtkHandleRepresentation.h".} = enum
    Outside = 0, Nearby, Selecting, Translating, Scaling


## !!!Ignored construct:  # ! defined ( VTK_LEGACY_REMOVE ) [NewLine] VTK_DEPRECATED_IN_9_2_0 ( because leading underscore is reserved ) typedef InteractionStateType _InteractionState ;
## Error: identifier expected, but got: because leading underscore is reserved!!!

proc SetToleranceInteractionState*(this: var vtkHandleRepresentation; _arg: cint) {.
    importcpp: "SetToleranceInteractionState", header: "vtkHandleRepresentation.h".}
proc GetToleranceMinValueInteractionStateMinValue*(
    this: var vtkHandleRepresentation): cint {.
    importcpp: "GetToleranceMinValueInteractionStateMinValue",
    header: "vtkHandleRepresentation.h".}
proc GetToleranceMaxValueInteractionStateMaxValue*(
    this: var vtkHandleRepresentation): cint {.
    importcpp: "GetToleranceMaxValueInteractionStateMaxValue",
    header: "vtkHandleRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify whether any motions (such as scale, translate, etc.) are
  ##  constrained in some way (along an axis, etc.) Widgets can use this
  ##  to control the resulting motion.
  ##
proc SetActiveRepresentationConstrained*(this: var vtkHandleRepresentation;
                                        _arg: vtkTypeBool) {.
    importcpp: "SetActiveRepresentationConstrained",
    header: "vtkHandleRepresentation.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetToleranceActiveRepresentationConstrained ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Constrained  of  << this -> Constrained ) ; return this -> Constrained ; } ;
## Error: expected ';'!!!

proc ConstrainedOn*(this: var vtkHandleRepresentation) {.importcpp: "ConstrainedOn",
    header: "vtkHandleRepresentation.h".}
proc ConstrainedOff*(this: var vtkHandleRepresentation) {.
    importcpp: "ConstrainedOff", header: "vtkHandleRepresentation.h".}
  ## /@}
  ## *
  ##  Method has to be overridden in the subclasses which has
  ##  constraints on placing the handle
  ##  (Ex. vtkConstrainedPointHandleRepresentation). It should return 1
  ##  if the position is within the constraint, else it should return
  ##  0. By default it returns 1.
  ##
proc CheckConstraint*(this: var vtkHandleRepresentation; renderer: ptr vtkRenderer;
                     pos: array[2, cdouble]): cint {.importcpp: "CheckConstraint",
    header: "vtkHandleRepresentation.h".}
proc ShallowCopy*(this: var vtkHandleRepresentation; prop: ptr vtkProp) {.
    importcpp: "ShallowCopy", header: "vtkHandleRepresentation.h".}
proc DeepCopy*(this: var vtkHandleRepresentation; prop: ptr vtkProp) {.
    importcpp: "DeepCopy", header: "vtkHandleRepresentation.h".}
proc SetRenderer*(this: var vtkHandleRepresentation; ren: ptr vtkRenderer) {.
    importcpp: "SetRenderer", header: "vtkHandleRepresentation.h".}
proc GetMTime*(this: var vtkHandleRepresentation): vtkMTimeType {.
    importcpp: "GetMTime", header: "vtkHandleRepresentation.h".}
proc SetPointPlacer*(this: var vtkHandleRepresentation; a2: ptr vtkPointPlacer) {.
    importcpp: "SetPointPlacer", header: "vtkHandleRepresentation.h".}
proc GetnamePointPlacer*(this: var vtkHandleRepresentation): ptr vtkPointPlacer {.
    importcpp: "GetnamePointPlacer", header: "vtkHandleRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Gets the translation vector
  ##
proc GetTranslationVector*(this: vtkHandleRepresentation; p1: ptr cdouble;
                          p2: ptr cdouble; v: ptr cdouble) {.noSideEffect,
    importcpp: "GetTranslationVector", header: "vtkHandleRepresentation.h".}
proc Translate*(this: var vtkHandleRepresentation; p1: ptr cdouble; p2: ptr cdouble) {.
    importcpp: "Translate", header: "vtkHandleRepresentation.h".}
proc Translate*(this: var vtkHandleRepresentation; v: ptr cdouble) {.
    importcpp: "Translate", header: "vtkHandleRepresentation.h".}
## !!!Ignored construct:  /@} /@{ *
##  Gets/Sets the constraint axis for translations. Returns Axis::NONE
##  if none.
##  virtual int GetToleranceActiveRepresentationConstrainedTranslationAxisTranslationAxis ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TranslationAxis  of  << this -> TranslationAxis ) ; return this -> TranslationAxis ; } ;
## Error: expected ';'!!!

proc SetToleranceInteractionStateTranslationAxis*(
    this: var vtkHandleRepresentation; _arg: cint) {.
    importcpp: "SetToleranceInteractionStateTranslationAxis",
    header: "vtkHandleRepresentation.h".}
proc GetToleranceMinValueInteractionStateMinValueTranslationAxisMinValue*(
    this: var vtkHandleRepresentation): cint {.importcpp: "GetToleranceMinValueInteractionStateMinValueTranslationAxisMinValue",
    header: "vtkHandleRepresentation.h".}
proc GetToleranceMaxValueInteractionStateMaxValueTranslationAxisMaxValue*(
    this: var vtkHandleRepresentation): cint {.importcpp: "GetToleranceMaxValueInteractionStateMaxValueTranslationAxisMaxValue",
    header: "vtkHandleRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Toggles constraint translation axis on/off.
  ##
proc SetXTranslationAxisOn*(this: var vtkHandleRepresentation) {.
    importcpp: "SetXTranslationAxisOn", header: "vtkHandleRepresentation.h".}
proc SetYTranslationAxisOn*(this: var vtkHandleRepresentation) {.
    importcpp: "SetYTranslationAxisOn", header: "vtkHandleRepresentation.h".}
proc SetZTranslationAxisOn*(this: var vtkHandleRepresentation) {.
    importcpp: "SetZTranslationAxisOn", header: "vtkHandleRepresentation.h".}
proc SetTranslationAxisOff*(this: var vtkHandleRepresentation) {.
    importcpp: "SetTranslationAxisOff", header: "vtkHandleRepresentation.h".}
proc IsTranslationConstrained*(this: var vtkHandleRepresentation): bool {.
    importcpp: "IsTranslationConstrained", header: "vtkHandleRepresentation.h".}