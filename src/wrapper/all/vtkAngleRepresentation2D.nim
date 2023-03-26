## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAngleRepresentation2D.h
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
##  @class   vtkAngleRepresentation2D
##  @brief   represent the vtkAngleWidget
##
##  The vtkAngleRepresentation2D is a representation for the
##  vtkAngleWidget. This representation consists of two rays and three
##  vtkHandleRepresentations to place and manipulate the three points defining
##  the angle representation. (Note: the three points are referred to as Point1,
##  Center, and Point2, at the two end points (Point1 and Point2) and Center
##  (around which the angle is measured). This particular implementation is a
##  2D representation, meaning that it draws in the overlay plane.
##
##  @sa
##  vtkAngleWidget vtkHandleRepresentation
##

import
  vtkAngleRepresentation, vtkInteractionWidgetsModule

discard "forward decl of vtkLeaderActor2D"
discard "forward decl of vtkProperty2D"
type
  vtkAngleRepresentation2D* {.importcpp: "vtkAngleRepresentation2D",
                             header: "vtkAngleRepresentation2D.h", bycopy.} = object of vtkAngleRepresentation ## *
                                                                                                        ##  Instantiate class.
                                                                                                        ##
    vtkAngleRepresentation2D* {.importc: "vtkAngleRepresentation2D".}: VTK_NEWINSTANCE


proc New*(): ptr vtkAngleRepresentation2D {.importcpp: "vtkAngleRepresentation2D::New(@)",
                                        header: "vtkAngleRepresentation2D.h".}
type
  vtkAngleRepresentation2DSuperclass* = vtkAngleRepresentation

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAngleRepresentation2D::IsTypeOf(@)",
    header: "vtkAngleRepresentation2D.h".}
proc IsA*(this: var vtkAngleRepresentation2D; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkAngleRepresentation2D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAngleRepresentation2D {.
    importcpp: "vtkAngleRepresentation2D::SafeDownCast(@)",
    header: "vtkAngleRepresentation2D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAngleRepresentation2D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAngleRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAngleRepresentation2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAngleRepresentation2D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAngleRepresentation2D; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkAngleRepresentation2D.h".}
proc GetAngle*(this: var vtkAngleRepresentation2D): cdouble {.importcpp: "GetAngle",
    header: "vtkAngleRepresentation2D.h".}
proc GetPoint1WorldPosition*(this: var vtkAngleRepresentation2D;
                            pos: array[3, cdouble]) {.
    importcpp: "GetPoint1WorldPosition", header: "vtkAngleRepresentation2D.h".}
proc GetCenterWorldPosition*(this: var vtkAngleRepresentation2D;
                            pos: array[3, cdouble]) {.
    importcpp: "GetCenterWorldPosition", header: "vtkAngleRepresentation2D.h".}
proc GetPoint2WorldPosition*(this: var vtkAngleRepresentation2D;
                            pos: array[3, cdouble]) {.
    importcpp: "GetPoint2WorldPosition", header: "vtkAngleRepresentation2D.h".}
proc SetPoint1DisplayPosition*(this: var vtkAngleRepresentation2D;
                              pos: array[3, cdouble]) {.
    importcpp: "SetPoint1DisplayPosition", header: "vtkAngleRepresentation2D.h".}
proc SetCenterDisplayPosition*(this: var vtkAngleRepresentation2D;
                              pos: array[3, cdouble]) {.
    importcpp: "SetCenterDisplayPosition", header: "vtkAngleRepresentation2D.h".}
proc SetPoint2DisplayPosition*(this: var vtkAngleRepresentation2D;
                              pos: array[3, cdouble]) {.
    importcpp: "SetPoint2DisplayPosition", header: "vtkAngleRepresentation2D.h".}
proc GetPoint1DisplayPosition*(this: var vtkAngleRepresentation2D;
                              pos: array[3, cdouble]) {.
    importcpp: "GetPoint1DisplayPosition", header: "vtkAngleRepresentation2D.h".}
proc GetCenterDisplayPosition*(this: var vtkAngleRepresentation2D;
                              pos: array[3, cdouble]) {.
    importcpp: "GetCenterDisplayPosition", header: "vtkAngleRepresentation2D.h".}
proc GetPoint2DisplayPosition*(this: var vtkAngleRepresentation2D;
                              pos: array[3, cdouble]) {.
    importcpp: "GetPoint2DisplayPosition", header: "vtkAngleRepresentation2D.h".}
proc GetnameRay1*(this: var vtkAngleRepresentation2D): ptr vtkLeaderActor2D {.
    importcpp: "GetnameRay1", header: "vtkAngleRepresentation2D.h".}
proc GetnameRay1Ray2*(this: var vtkAngleRepresentation2D): ptr vtkLeaderActor2D {.
    importcpp: "GetnameRay1Ray2", header: "vtkAngleRepresentation2D.h".}
proc GetnameRay1Ray2Arc*(this: var vtkAngleRepresentation2D): ptr vtkLeaderActor2D {.
    importcpp: "GetnameRay1Ray2Arc", header: "vtkAngleRepresentation2D.h".}
  ## /@}
  ## *
  ##  Method defined by vtkWidgetRepresentation superclass and
  ##  needed here.
  ##
proc BuildRepresentation*(this: var vtkAngleRepresentation2D) {.
    importcpp: "BuildRepresentation", header: "vtkAngleRepresentation2D.h".}
proc ReleaseGraphicsResources*(this: var vtkAngleRepresentation2D; w: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkAngleRepresentation2D.h".}
proc RenderOverlay*(this: var vtkAngleRepresentation2D; viewport: ptr vtkViewport): cint {.
    importcpp: "RenderOverlay", header: "vtkAngleRepresentation2D.h".}