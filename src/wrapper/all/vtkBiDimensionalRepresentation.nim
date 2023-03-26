## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBiDimensionalRepresentation.h
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
##  @class   vtkBiDimensionalRepresentation
##  @brief   represent the vtkBiDimensionalWidget
##
##  The vtkBiDimensionalRepresentation is used to represent the
##  bi-dimensional measure of an object. This representation
##  consists of two perpendicular lines defined by four
##  vtkHandleRepresentations. The four handles can be independently
##  manipulated consistent with the orthogonal constraint on the lines. (Note:
##  the four points are referred to as Point1, Point2, Point3 and
##  Point4. Point1 and Point2 define the first line; and Point3 and Point4
##  define the second orthogonal line.) This particular class is an abstract
##  class, contrete subclasses (e.g., vtkBiDimensionalRepresentation2D) actual
##  implement the widget.
##
##  To create this widget, you click to place the first two points. The third
##  point is mirrored with the fourth point; when you place the third point
##  (which is orthogonal to the lined defined by the first two points), the
##  fourth point is dropped as well. After definition, the four points can be
##  moved (in constrained fashion, preserving orthogonality). Further, the
##  entire widget can be translated by grabbing the center point of the widget;
##  each line can be moved along the other line; and the entire widget can be
##  rotated around its center point.
##
##  @sa
##  vtkAngleWidget vtkHandleRepresentation vtkBiDimensionalRepresentation2D
##

import
  vtkInteractionWidgetsModule, vtkWidgetRepresentation

discard "forward decl of vtkHandleRepresentation"
type
  vtkBiDimensionalRepresentation* {.importcpp: "vtkBiDimensionalRepresentation",
                                   header: "vtkBiDimensionalRepresentation.h",
                                   bycopy.} = object of vtkWidgetRepresentation ## /@{
                                                                           ## *
                                                                           ##  Standard VTK methods.
                                                                           ##
    vtkBiDimensionalRepresentation* {.importc: "vtkBiDimensionalRepresentation".}: VTK_NEWINSTANCE
    ##  The handle and the rep used to close the handles
    ##  Selection tolerance for the handles
    ##  Visibility of the lines
    ##  Internal variables
    ##  Format for printing the distance
    ##  toggle to determine whether to place text above or below widget

  vtkBiDimensionalRepresentationSuperclass* = vtkWidgetRepresentation

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkBiDimensionalRepresentation::IsTypeOf(@)",
    header: "vtkBiDimensionalRepresentation.h".}
proc IsA*(this: var vtkBiDimensionalRepresentation; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkBiDimensionalRepresentation.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkBiDimensionalRepresentation {.
    importcpp: "vtkBiDimensionalRepresentation::SafeDownCast(@)",
    header: "vtkBiDimensionalRepresentation.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkBiDimensionalRepresentation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWidgetRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBiDimensionalRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBiDimensionalRepresentation :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkBiDimensionalRepresentation; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkBiDimensionalRepresentation.h".}
proc SetPoint1WorldPosition*(this: var vtkBiDimensionalRepresentation;
                            pos: array[3, cdouble]) {.
    importcpp: "SetPoint1WorldPosition",
    header: "vtkBiDimensionalRepresentation.h".}
proc SetPoint2WorldPosition*(this: var vtkBiDimensionalRepresentation;
                            pos: array[3, cdouble]) {.
    importcpp: "SetPoint2WorldPosition",
    header: "vtkBiDimensionalRepresentation.h".}
proc SetPoint3WorldPosition*(this: var vtkBiDimensionalRepresentation;
                            pos: array[3, cdouble]) {.
    importcpp: "SetPoint3WorldPosition",
    header: "vtkBiDimensionalRepresentation.h".}
proc SetPoint4WorldPosition*(this: var vtkBiDimensionalRepresentation;
                            pos: array[3, cdouble]) {.
    importcpp: "SetPoint4WorldPosition",
    header: "vtkBiDimensionalRepresentation.h".}
proc GetPoint1WorldPosition*(this: var vtkBiDimensionalRepresentation;
                            pos: array[3, cdouble]) {.
    importcpp: "GetPoint1WorldPosition",
    header: "vtkBiDimensionalRepresentation.h".}
proc GetPoint2WorldPosition*(this: var vtkBiDimensionalRepresentation;
                            pos: array[3, cdouble]) {.
    importcpp: "GetPoint2WorldPosition",
    header: "vtkBiDimensionalRepresentation.h".}
proc GetPoint3WorldPosition*(this: var vtkBiDimensionalRepresentation;
                            pos: array[3, cdouble]) {.
    importcpp: "GetPoint3WorldPosition",
    header: "vtkBiDimensionalRepresentation.h".}
proc GetPoint4WorldPosition*(this: var vtkBiDimensionalRepresentation;
                            pos: array[3, cdouble]) {.
    importcpp: "GetPoint4WorldPosition",
    header: "vtkBiDimensionalRepresentation.h".}
proc SetPoint1DisplayPosition*(this: var vtkBiDimensionalRepresentation;
                              pos: array[3, cdouble]) {.
    importcpp: "SetPoint1DisplayPosition",
    header: "vtkBiDimensionalRepresentation.h".}
proc SetPoint2DisplayPosition*(this: var vtkBiDimensionalRepresentation;
                              pos: array[3, cdouble]) {.
    importcpp: "SetPoint2DisplayPosition",
    header: "vtkBiDimensionalRepresentation.h".}
proc SetPoint3DisplayPosition*(this: var vtkBiDimensionalRepresentation;
                              pos: array[3, cdouble]) {.
    importcpp: "SetPoint3DisplayPosition",
    header: "vtkBiDimensionalRepresentation.h".}
proc SetPoint4DisplayPosition*(this: var vtkBiDimensionalRepresentation;
                              pos: array[3, cdouble]) {.
    importcpp: "SetPoint4DisplayPosition",
    header: "vtkBiDimensionalRepresentation.h".}
proc GetPoint1DisplayPosition*(this: var vtkBiDimensionalRepresentation;
                              pos: array[3, cdouble]) {.
    importcpp: "GetPoint1DisplayPosition",
    header: "vtkBiDimensionalRepresentation.h".}
proc GetPoint2DisplayPosition*(this: var vtkBiDimensionalRepresentation;
                              pos: array[3, cdouble]) {.
    importcpp: "GetPoint2DisplayPosition",
    header: "vtkBiDimensionalRepresentation.h".}
proc GetPoint3DisplayPosition*(this: var vtkBiDimensionalRepresentation;
                              pos: array[3, cdouble]) {.
    importcpp: "GetPoint3DisplayPosition",
    header: "vtkBiDimensionalRepresentation.h".}
proc GetPoint4DisplayPosition*(this: var vtkBiDimensionalRepresentation;
                              pos: array[3, cdouble]) {.
    importcpp: "GetPoint4DisplayPosition",
    header: "vtkBiDimensionalRepresentation.h".}
proc GetnamePoint1Representation*(this: var vtkBiDimensionalRepresentation): ptr vtkHandleRepresentation {.
    importcpp: "GetnamePoint1Representation",
    header: "vtkBiDimensionalRepresentation.h".}
proc GetnamePoint1RepresentationPoint2Representation*(
    this: var vtkBiDimensionalRepresentation): ptr vtkHandleRepresentation {.
    importcpp: "GetnamePoint1RepresentationPoint2Representation",
    header: "vtkBiDimensionalRepresentation.h".}
proc GetnamePoint1RepresentationPoint2RepresentationPoint3Representation*(
    this: var vtkBiDimensionalRepresentation): ptr vtkHandleRepresentation {.importcpp: "GetnamePoint1RepresentationPoint2RepresentationPoint3Representation",
    header: "vtkBiDimensionalRepresentation.h".}
proc GetnamePoint1RepresentationPoint2RepresentationPoint3RepresentationPoint4Representation*(
    this: var vtkBiDimensionalRepresentation): ptr vtkHandleRepresentation {.importcpp: "GetnamePoint1RepresentationPoint2RepresentationPoint3RepresentationPoint4Representation",
    header: "vtkBiDimensionalRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Special methods for turning off the lines that define the bi-dimensional
  ##  measure. Generally these methods are used by the vtkBiDimensionalWidget to
  ##  control the appearance of the widget. Note: turning off Line1 actually turns
  ##  off Line1 and Line2.
  ##
proc SetLine1Visibility*(this: var vtkBiDimensionalRepresentation; _arg: vtkTypeBool) {.
    importcpp: "SetLine1Visibility", header: "vtkBiDimensionalRepresentation.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetLine1Visibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Line1Visibility  of  << this -> Line1Visibility ) ; return this -> Line1Visibility ; } ;
## Error: expected ';'!!!

proc Line1VisibilityOn*(this: var vtkBiDimensionalRepresentation) {.
    importcpp: "Line1VisibilityOn", header: "vtkBiDimensionalRepresentation.h".}
proc Line1VisibilityOff*(this: var vtkBiDimensionalRepresentation) {.
    importcpp: "Line1VisibilityOff", header: "vtkBiDimensionalRepresentation.h".}
proc SetLine1VisibilityLine2Visibility*(this: var vtkBiDimensionalRepresentation;
                                       _arg: vtkTypeBool) {.
    importcpp: "SetLine1VisibilityLine2Visibility",
    header: "vtkBiDimensionalRepresentation.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetLine1VisibilityLine2Visibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Line2Visibility  of  << this -> Line2Visibility ) ; return this -> Line2Visibility ; } ;
## Error: expected ';'!!!

proc Line2VisibilityOn*(this: var vtkBiDimensionalRepresentation) {.
    importcpp: "Line2VisibilityOn", header: "vtkBiDimensionalRepresentation.h".}
proc Line2VisibilityOff*(this: var vtkBiDimensionalRepresentation) {.
    importcpp: "Line2VisibilityOff", header: "vtkBiDimensionalRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  This method is used to specify the type of handle representation to use
  ##  for the four internal vtkHandleRepresentations within
  ##  vtkBiDimensionalRepresentation.  To use this method, create a dummy
  ##  vtkHandleRepresentation (or subclass), and then invoke this method with
  ##  this dummy. Then the vtkBiDimensionalRepresentation uses this dummy to
  ##  clone four vtkHandleRepresentations of the same type. Make sure you set the
  ##  handle representation before the widget is enabled. (The method
  ##  InstantiateHandleRepresentation() is invoked by the vtkBiDimensionalWidget
  ##  for the purposes of cloning.)
  ##
proc SetHandleRepresentation*(this: var vtkBiDimensionalRepresentation;
                             handle: ptr vtkHandleRepresentation) {.
    importcpp: "SetHandleRepresentation",
    header: "vtkBiDimensionalRepresentation.h".}
proc InstantiateHandleRepresentation*(this: var vtkBiDimensionalRepresentation) {.
    importcpp: "InstantiateHandleRepresentation",
    header: "vtkBiDimensionalRepresentation.h".}
proc SetTolerance*(this: var vtkBiDimensionalRepresentation; _arg: cint) {.
    importcpp: "SetTolerance", header: "vtkBiDimensionalRepresentation.h".}
proc GetToleranceMinValue*(this: var vtkBiDimensionalRepresentation): cint {.
    importcpp: "GetToleranceMinValue", header: "vtkBiDimensionalRepresentation.h".}
proc GetToleranceMaxValue*(this: var vtkBiDimensionalRepresentation): cint {.
    importcpp: "GetToleranceMaxValue", header: "vtkBiDimensionalRepresentation.h".}
## !!!Ignored construct:  virtual int GetLine1VisibilityLine2VisibilityTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tolerance  of  << this -> Tolerance ) ; return this -> Tolerance ; } ;
## Error: expected ';'!!!

proc GetLength1*(this: var vtkBiDimensionalRepresentation): cdouble {.
    importcpp: "GetLength1", header: "vtkBiDimensionalRepresentation.h".}
proc GetLength2*(this: var vtkBiDimensionalRepresentation): cdouble {.
    importcpp: "GetLength2", header: "vtkBiDimensionalRepresentation.h".}
proc SetLabelFormat*(this: var vtkBiDimensionalRepresentation; _arg: cstring) {.
    importcpp: "SetLabelFormat", header: "vtkBiDimensionalRepresentation.h".}
proc GetLabelFormat*(this: var vtkBiDimensionalRepresentation): cstring {.
    importcpp: "GetLabelFormat", header: "vtkBiDimensionalRepresentation.h".}
  ## /@}
  ##  Used to communicate about the state of the representation
const
  vtkBiDimensionalRepresentationOutside* = 0
  vtkBiDimensionalRepresentationNearP1* = 1
  vtkBiDimensionalRepresentationNearP2* = 2
  vtkBiDimensionalRepresentationNearP3* = 3
  vtkBiDimensionalRepresentationNearP4* = 4
  vtkBiDimensionalRepresentationOnL1Inner* = 5
  vtkBiDimensionalRepresentationOnL1Outer* = 6
  vtkBiDimensionalRepresentationOnL2Inner* = 7
  vtkBiDimensionalRepresentationOnL2Outer* = 8
  vtkBiDimensionalRepresentationOnCenter* = 9

proc SetLine1VisibilityLine2VisibilityShowLabelAboveWidget*(
    this: var vtkBiDimensionalRepresentation; _arg: vtkTypeBool) {.
    importcpp: "SetLine1VisibilityLine2VisibilityShowLabelAboveWidget",
    header: "vtkBiDimensionalRepresentation.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetLine1VisibilityLine2VisibilityToleranceShowLabelAboveWidget ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ShowLabelAboveWidget  of  << this -> ShowLabelAboveWidget ) ; return this -> ShowLabelAboveWidget ; } ;
## Error: expected ';'!!!

proc ShowLabelAboveWidgetOn*(this: var vtkBiDimensionalRepresentation) {.
    importcpp: "ShowLabelAboveWidgetOn",
    header: "vtkBiDimensionalRepresentation.h".}
proc ShowLabelAboveWidgetOff*(this: var vtkBiDimensionalRepresentation) {.
    importcpp: "ShowLabelAboveWidgetOff",
    header: "vtkBiDimensionalRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get the id to display in the label.
  ##
proc SetID*(this: var vtkBiDimensionalRepresentation; id: vtkIdType) {.
    importcpp: "SetID", header: "vtkBiDimensionalRepresentation.h".}
## !!!Ignored construct:  virtual vtkIdType GetLine1VisibilityLine2VisibilityToleranceShowLabelAboveWidgetID ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ID  of  << this -> ID ) ; return this -> ID ; } ;
## Error: expected ';'!!!

proc GetLabelText*(this: var vtkBiDimensionalRepresentation): cstring {.
    importcpp: "GetLabelText", header: "vtkBiDimensionalRepresentation.h".}
proc GetLabelPosition*(this: var vtkBiDimensionalRepresentation): ptr cdouble {.
    importcpp: "GetLabelPosition", header: "vtkBiDimensionalRepresentation.h".}
proc GetLabelPosition*(this: var vtkBiDimensionalRepresentation;
                      pos: array[3, cdouble]) {.importcpp: "GetLabelPosition",
    header: "vtkBiDimensionalRepresentation.h".}
proc GetWorldLabelPosition*(this: var vtkBiDimensionalRepresentation;
                           pos: array[3, cdouble]) {.
    importcpp: "GetWorldLabelPosition", header: "vtkBiDimensionalRepresentation.h".}
proc StartWidgetDefinition*(this: var vtkBiDimensionalRepresentation;
                           e: array[2, cdouble]) {.
    importcpp: "StartWidgetDefinition", header: "vtkBiDimensionalRepresentation.h".}
proc Point2WidgetInteraction*(this: var vtkBiDimensionalRepresentation;
                             e: array[2, cdouble]) {.
    importcpp: "Point2WidgetInteraction",
    header: "vtkBiDimensionalRepresentation.h".}
proc Point3WidgetInteraction*(this: var vtkBiDimensionalRepresentation;
                             e: array[2, cdouble]) {.
    importcpp: "Point3WidgetInteraction",
    header: "vtkBiDimensionalRepresentation.h".}
proc StartWidgetManipulation*(this: var vtkBiDimensionalRepresentation;
                             e: array[2, cdouble]) {.
    importcpp: "StartWidgetManipulation",
    header: "vtkBiDimensionalRepresentation.h".}