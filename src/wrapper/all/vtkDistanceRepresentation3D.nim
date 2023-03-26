## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDistanceRepresentation3D.h
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
##  @class   vtkDistanceRepresentation3D
##  @brief   represent the vtkDistanceWidget
##
##  The vtkDistanceRepresentation3D is a representation for the
##  vtkDistanceWidget. This representation consists of a measuring line (axis)
##  and two vtkHandleWidgets to place the end points of the line. Note that
##  this particular widget draws its representation in 3D space, so the widget
##  can be occluded.
##
##  @sa
##  vtkDistanceWidget vtkDistanceRepresentation vtkDistanceRepresentation2D
##

import
  vtkDistanceRepresentation, vtkInteractionWidgetsModule

discard "forward decl of vtkPoints"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkPolyDataMapper"
discard "forward decl of vtkActor"
discard "forward decl of vtkVectorText"
discard "forward decl of vtkFollower"
discard "forward decl of vtkBox"
discard "forward decl of vtkCylinderSource"
discard "forward decl of vtkGlyph3D"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkTransformPolyDataFilter"
discard "forward decl of vtkProperty"
type
  vtkDistanceRepresentation3D* {.importcpp: "vtkDistanceRepresentation3D",
                                header: "vtkDistanceRepresentation3D.h", bycopy.} = object of vtkDistanceRepresentation ## *
                                                                                                                 ##  Instantiate class.
                                                                                                                 ##
    vtkDistanceRepresentation3D* {.importc: "vtkDistanceRepresentation3D".}: VTK_NEWINSTANCE
    ##  The distance label
    ##  Support internal operations
    ##  The 3D disk tick marks
    ##  Glyph3D scale
    ##  The distance between the two points
    ##  Support GetBounds() method
    ##  Maximum number of ticks on the 3d ruler
    ##  Label title position


proc New*(): ptr vtkDistanceRepresentation3D {.
    importcpp: "vtkDistanceRepresentation3D::New(@)",
    header: "vtkDistanceRepresentation3D.h".}
type
  vtkDistanceRepresentation3DSuperclass* = vtkDistanceRepresentation

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkDistanceRepresentation3D::IsTypeOf(@)",
    header: "vtkDistanceRepresentation3D.h".}
proc IsA*(this: var vtkDistanceRepresentation3D; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkDistanceRepresentation3D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkDistanceRepresentation3D {.
    importcpp: "vtkDistanceRepresentation3D::SafeDownCast(@)",
    header: "vtkDistanceRepresentation3D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkDistanceRepresentation3D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDistanceRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDistanceRepresentation3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDistanceRepresentation3D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkDistanceRepresentation3D; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkDistanceRepresentation3D.h".}
proc GetDistance*(this: var vtkDistanceRepresentation3D): cdouble {.
    importcpp: "GetDistance", header: "vtkDistanceRepresentation3D.h".}
proc SetGlyphScale*(this: var vtkDistanceRepresentation3D; scale: cdouble) {.
    importcpp: "SetGlyphScale", header: "vtkDistanceRepresentation3D.h".}
## !!!Ignored construct:  virtual double GetGlyphScale ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GlyphScale  of  << this -> GlyphScale ) ; return this -> GlyphScale ; } ;
## Error: expected ';'!!!

proc GetLineProperty*(this: var vtkDistanceRepresentation3D): ptr vtkProperty {.
    importcpp: "GetLineProperty", header: "vtkDistanceRepresentation3D.h".}
proc SetLabelPosition*(this: var vtkDistanceRepresentation3D; labelPosition: cdouble) {.
    importcpp: "SetLabelPosition", header: "vtkDistanceRepresentation3D.h".}
## !!!Ignored construct:  virtual double GetGlyphScaleLabelPosition ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LabelPosition  of  << this -> LabelPosition ) ; return this -> LabelPosition ; } ;
## Error: expected ';'!!!

proc SetMaximumNumberOfRulerTicks*(this: var vtkDistanceRepresentation3D; _arg: cint) {.
    importcpp: "SetMaximumNumberOfRulerTicks",
    header: "vtkDistanceRepresentation3D.h".}
proc GetMaximumNumberOfRulerTicksMinValue*(this: var vtkDistanceRepresentation3D): cint {.
    importcpp: "GetMaximumNumberOfRulerTicksMinValue",
    header: "vtkDistanceRepresentation3D.h".}
proc GetMaximumNumberOfRulerTicksMaxValue*(this: var vtkDistanceRepresentation3D): cint {.
    importcpp: "GetMaximumNumberOfRulerTicksMaxValue",
    header: "vtkDistanceRepresentation3D.h".}
## !!!Ignored construct:  virtual int GetGlyphScaleLabelPositionMaximumNumberOfRulerTicks ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumNumberOfRulerTicks  of  << this -> MaximumNumberOfRulerTicks ) ; return this -> MaximumNumberOfRulerTicks ; } ;
## Error: expected ';'!!!

proc GetnameGlyphActor*(this: var vtkDistanceRepresentation3D): ptr vtkActor {.
    importcpp: "GetnameGlyphActor", header: "vtkDistanceRepresentation3D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Convenience method Get the label actor. It is possible to
  ##  control the appearance of the label.
  ##
proc GetnameGlyphActorLabelActor*(this: var vtkDistanceRepresentation3D): ptr vtkFollower {.
    importcpp: "GetnameGlyphActorLabelActor",
    header: "vtkDistanceRepresentation3D.h".}
proc SetLabelActor*(this: var vtkDistanceRepresentation3D; a2: ptr vtkFollower) {.
    importcpp: "SetLabelActor", header: "vtkDistanceRepresentation3D.h".}
proc GetPoint1WorldPosition*(this: var vtkDistanceRepresentation3D): ptr cdouble {.
    importcpp: "GetPoint1WorldPosition", header: "vtkDistanceRepresentation3D.h".}
proc GetPoint2WorldPosition*(this: var vtkDistanceRepresentation3D): ptr cdouble {.
    importcpp: "GetPoint2WorldPosition", header: "vtkDistanceRepresentation3D.h".}
proc GetPoint1WorldPosition*(this: var vtkDistanceRepresentation3D;
                            pos: array[3, cdouble]) {.
    importcpp: "GetPoint1WorldPosition", header: "vtkDistanceRepresentation3D.h".}
proc GetPoint2WorldPosition*(this: var vtkDistanceRepresentation3D;
                            pos: array[3, cdouble]) {.
    importcpp: "GetPoint2WorldPosition", header: "vtkDistanceRepresentation3D.h".}
proc SetPoint1WorldPosition*(this: var vtkDistanceRepresentation3D;
                            pos: array[3, cdouble]) {.
    importcpp: "SetPoint1WorldPosition", header: "vtkDistanceRepresentation3D.h".}
proc SetPoint2WorldPosition*(this: var vtkDistanceRepresentation3D;
                            pos: array[3, cdouble]) {.
    importcpp: "SetPoint2WorldPosition", header: "vtkDistanceRepresentation3D.h".}
proc SetPoint1DisplayPosition*(this: var vtkDistanceRepresentation3D;
                              pos: array[3, cdouble]) {.
    importcpp: "SetPoint1DisplayPosition", header: "vtkDistanceRepresentation3D.h".}
proc SetPoint2DisplayPosition*(this: var vtkDistanceRepresentation3D;
                              pos: array[3, cdouble]) {.
    importcpp: "SetPoint2DisplayPosition", header: "vtkDistanceRepresentation3D.h".}
proc GetPoint1DisplayPosition*(this: var vtkDistanceRepresentation3D;
                              pos: array[3, cdouble]) {.
    importcpp: "GetPoint1DisplayPosition", header: "vtkDistanceRepresentation3D.h".}
proc GetPoint2DisplayPosition*(this: var vtkDistanceRepresentation3D;
                              pos: array[3, cdouble]) {.
    importcpp: "GetPoint2DisplayPosition", header: "vtkDistanceRepresentation3D.h".}
proc BuildRepresentation*(this: var vtkDistanceRepresentation3D) {.
    importcpp: "BuildRepresentation", header: "vtkDistanceRepresentation3D.h".}
proc GetBounds*(this: var vtkDistanceRepresentation3D): ptr cdouble {.
    importcpp: "GetBounds", header: "vtkDistanceRepresentation3D.h".}
proc ReleaseGraphicsResources*(this: var vtkDistanceRepresentation3D;
                              w: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkDistanceRepresentation3D.h".}
proc RenderOpaqueGeometry*(this: var vtkDistanceRepresentation3D;
                          viewport: ptr vtkViewport): cint {.
    importcpp: "RenderOpaqueGeometry", header: "vtkDistanceRepresentation3D.h".}
proc RenderTranslucentPolygonalGeometry*(this: var vtkDistanceRepresentation3D;
                                        viewport: ptr vtkViewport): cint {.
    importcpp: "RenderTranslucentPolygonalGeometry",
    header: "vtkDistanceRepresentation3D.h".}
proc SetLabelScale*(this: var vtkDistanceRepresentation3D; x: cdouble; y: cdouble;
                   z: cdouble) {.importcpp: "SetLabelScale",
                               header: "vtkDistanceRepresentation3D.h".}
proc SetLabelScale*(this: var vtkDistanceRepresentation3D; scale: array[3, cdouble]) {.
    importcpp: "SetLabelScale", header: "vtkDistanceRepresentation3D.h".}
proc GetLabelScale*(this: var vtkDistanceRepresentation3D): ptr cdouble {.
    importcpp: "GetLabelScale", header: "vtkDistanceRepresentation3D.h".}
proc GetLabelProperty*(this: var vtkDistanceRepresentation3D): ptr vtkProperty {.
    importcpp: "GetLabelProperty", header: "vtkDistanceRepresentation3D.h".}