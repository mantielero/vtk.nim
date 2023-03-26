## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBiDimensionalRepresentation2D.h
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
##  @class   vtkBiDimensionalRepresentation2D
##  @brief   represent the vtkBiDimensionalWidget
##
##  The vtkBiDimensionalRepresentation2D is used to represent the
##  bi-dimensional measure in a 2D (overlay) context. This representation
##  consists of two perpendicular lines defined by four
##  vtkHandleRepresentations. The four handles can be independently
##  manipulated consistent with the orthogonal constraint on the lines. (Note:
##  the four points are referred to as Point1, Point2, Point3 and
##  Point4. Point1 and Point2 define the first line; and Point3 and Point4
##  define the second orthogonal line.)
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
##  vtkAngleWidget vtkHandleRepresentation vtkBiDimensionalRepresentation
##

import
  vtkBiDimensionalRepresentation, vtkInteractionWidgetsModule

discard "forward decl of vtkHandleRepresentation"
discard "forward decl of vtkCellArray"
discard "forward decl of vtkPoints"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkPolyDataMapper2D"
discard "forward decl of vtkTextMapper"
discard "forward decl of vtkActor2D"
discard "forward decl of vtkProperty2D"
discard "forward decl of vtkTextProperty"
type
  vtkBiDimensionalRepresentation2D* {.importcpp: "vtkBiDimensionalRepresentation2D", header: "vtkBiDimensionalRepresentation2D.h",
                                     bycopy.} = object of vtkBiDimensionalRepresentation ## *
                                                                                    ##  Instantiate the class.
                                                                                    ##
    vtkBiDimensionalRepresentation2D* {.importc: "vtkBiDimensionalRepresentation2D".}: VTK_NEWINSTANCE
    ##  The labels for the line lengths
    ##  Helper method


proc New*(): ptr vtkBiDimensionalRepresentation2D {.
    importcpp: "vtkBiDimensionalRepresentation2D::New(@)",
    header: "vtkBiDimensionalRepresentation2D.h".}
type
  vtkBiDimensionalRepresentation2DSuperclass* = vtkBiDimensionalRepresentation

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkBiDimensionalRepresentation2D::IsTypeOf(@)",
    header: "vtkBiDimensionalRepresentation2D.h".}
proc IsA*(this: var vtkBiDimensionalRepresentation2D; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkBiDimensionalRepresentation2D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkBiDimensionalRepresentation2D {.
    importcpp: "vtkBiDimensionalRepresentation2D::SafeDownCast(@)",
    header: "vtkBiDimensionalRepresentation2D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkBiDimensionalRepresentation2D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkBiDimensionalRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBiDimensionalRepresentation2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBiDimensionalRepresentation2D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkBiDimensionalRepresentation2D; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkBiDimensionalRepresentation2D.h".}
proc GetnameLineProperty*(this: var vtkBiDimensionalRepresentation2D): ptr vtkProperty2D {.
    importcpp: "GetnameLineProperty", header: "vtkBiDimensionalRepresentation2D.h".}
proc GetnameLinePropertySelectedLineProperty*(
    this: var vtkBiDimensionalRepresentation2D): ptr vtkProperty2D {.
    importcpp: "GetnameLinePropertySelectedLineProperty",
    header: "vtkBiDimensionalRepresentation2D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Retrieve the property used to control the appearance of the text
  ##  labels.
  ##
proc GetnameLinePropertySelectedLinePropertyTextProperty*(
    this: var vtkBiDimensionalRepresentation2D): ptr vtkTextProperty {.
    importcpp: "GetnameLinePropertySelectedLinePropertyTextProperty",
    header: "vtkBiDimensionalRepresentation2D.h".}
  ## /@}
  ##  Used to communicate about the state of the representation
const
  vtkBiDimensionalRepresentation2DOutside* = 0
  vtkBiDimensionalRepresentation2DNearP1* = 1
  vtkBiDimensionalRepresentation2DNearP2* = 2
  vtkBiDimensionalRepresentation2DNearP3* = 3
  vtkBiDimensionalRepresentation2DNearP4* = 4
  vtkBiDimensionalRepresentation2DOnL1Inner* = 5
  vtkBiDimensionalRepresentation2DOnL1Outer* = 6
  vtkBiDimensionalRepresentation2DOnL2Inner* = 7
  vtkBiDimensionalRepresentation2DOnL2Outer* = 8
  vtkBiDimensionalRepresentation2DOnCenter* = 9

proc BuildRepresentation*(this: var vtkBiDimensionalRepresentation2D) {.
    importcpp: "BuildRepresentation", header: "vtkBiDimensionalRepresentation2D.h".}
proc ComputeInteractionState*(this: var vtkBiDimensionalRepresentation2D; X: cint;
                             Y: cint; modify: cint = 0): cint {.
    importcpp: "ComputeInteractionState",
    header: "vtkBiDimensionalRepresentation2D.h".}
proc StartWidgetDefinition*(this: var vtkBiDimensionalRepresentation2D;
                           e: array[2, cdouble]) {.
    importcpp: "StartWidgetDefinition",
    header: "vtkBiDimensionalRepresentation2D.h".}
proc Point2WidgetInteraction*(this: var vtkBiDimensionalRepresentation2D;
                             e: array[2, cdouble]) {.
    importcpp: "Point2WidgetInteraction",
    header: "vtkBiDimensionalRepresentation2D.h".}
proc Point3WidgetInteraction*(this: var vtkBiDimensionalRepresentation2D;
                             e: array[2, cdouble]) {.
    importcpp: "Point3WidgetInteraction",
    header: "vtkBiDimensionalRepresentation2D.h".}
proc StartWidgetManipulation*(this: var vtkBiDimensionalRepresentation2D;
                             e: array[2, cdouble]) {.
    importcpp: "StartWidgetManipulation",
    header: "vtkBiDimensionalRepresentation2D.h".}
proc WidgetInteraction*(this: var vtkBiDimensionalRepresentation2D;
                       e: array[2, cdouble]) {.importcpp: "WidgetInteraction",
    header: "vtkBiDimensionalRepresentation2D.h".}
proc Highlight*(this: var vtkBiDimensionalRepresentation2D; highlightOn: cint) {.
    importcpp: "Highlight", header: "vtkBiDimensionalRepresentation2D.h".}
proc ReleaseGraphicsResources*(this: var vtkBiDimensionalRepresentation2D;
                              w: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources",
    header: "vtkBiDimensionalRepresentation2D.h".}
proc RenderOverlay*(this: var vtkBiDimensionalRepresentation2D;
                   viewport: ptr vtkViewport): cint {.importcpp: "RenderOverlay",
    header: "vtkBiDimensionalRepresentation2D.h".}
proc GetLabelText*(this: var vtkBiDimensionalRepresentation2D): cstring {.
    importcpp: "GetLabelText", header: "vtkBiDimensionalRepresentation2D.h".}
proc GetLabelPosition*(this: var vtkBiDimensionalRepresentation2D): ptr cdouble {.
    importcpp: "GetLabelPosition", header: "vtkBiDimensionalRepresentation2D.h".}
proc GetLabelPosition*(this: var vtkBiDimensionalRepresentation2D;
                      pos: array[3, cdouble]) {.importcpp: "GetLabelPosition",
    header: "vtkBiDimensionalRepresentation2D.h".}
proc GetWorldLabelPosition*(this: var vtkBiDimensionalRepresentation2D;
                           pos: array[3, cdouble]) {.
    importcpp: "GetWorldLabelPosition",
    header: "vtkBiDimensionalRepresentation2D.h".}