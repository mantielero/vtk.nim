## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCaptionWidget.h
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
##  @class   vtkCaptionWidget
##  @brief   widget for placing a caption (text plus leader)
##
##  This class provides support for interactively placing a caption on the 2D
##  overlay plane. A caption is defined by some text with a leader (e.g.,
##  arrow) that points from the text to a point in the scene. The caption is
##  represented by a vtkCaptionRepresentation. It uses the event bindings of
##  its superclass (vtkBorderWidget) to control the placement of the text, and
##  adds the ability to move the attachment point around. In addition, when
##  the caption text is selected, the widget emits a ActivateEvent that
##  observers can watch for. This is useful for opening GUI dialogoues to
##  adjust font characteristics, etc. (Please see the superclass for a
##  description of event bindings.)
##
##  Note that this widget extends the behavior of its superclass
##  vtkBorderWidget. The end point of the leader can be selected and
##  moved around with an internal vtkHandleWidget.
##
##  @sa
##  vtkBorderWidget vtkTextWidget
##

import
  vtkBorderWidget, vtkInteractionWidgetsModule

discard "forward decl of vtkCaptionRepresentation"
discard "forward decl of vtkCaptionActor2D"
discard "forward decl of vtkHandleWidget"
discard "forward decl of vtkPointHandleRepresentation3D"
discard "forward decl of vtkCaptionAnchorCallback"
type
  vtkCaptionWidget* {.importcpp: "vtkCaptionWidget", header: "vtkCaptionWidget.h",
                     bycopy.} = object of vtkBorderWidget ## *
                                                     ##  Instantiate this class.
                                                     ##
    vtkCaptionWidget* {.importc: "vtkCaptionWidget".}: VTK_NEWINSTANCE
    ##  Widget for the anchor point
    ##  Special callbacks for the anchor interaction


proc New*(): ptr vtkCaptionWidget {.importcpp: "vtkCaptionWidget::New(@)",
                                header: "vtkCaptionWidget.h".}
type
  vtkCaptionWidgetSuperclass* = vtkBorderWidget

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCaptionWidget::IsTypeOf(@)", header: "vtkCaptionWidget.h".}
proc IsA*(this: var vtkCaptionWidget; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkCaptionWidget.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCaptionWidget {.
    importcpp: "vtkCaptionWidget::SafeDownCast(@)", header: "vtkCaptionWidget.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCaptionWidget :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkBorderWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCaptionWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCaptionWidget :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCaptionWidget; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCaptionWidget.h".}
proc SetEnabled*(this: var vtkCaptionWidget; enabling: cint) {.
    importcpp: "SetEnabled", header: "vtkCaptionWidget.h".}
proc SetRepresentation*(this: var vtkCaptionWidget; r: ptr vtkCaptionRepresentation) {.
    importcpp: "SetRepresentation", header: "vtkCaptionWidget.h".}
proc SetCaptionActor2D*(this: var vtkCaptionWidget; capActor: ptr vtkCaptionActor2D) {.
    importcpp: "SetCaptionActor2D", header: "vtkCaptionWidget.h".}
proc GetCaptionActor2D*(this: var vtkCaptionWidget): ptr vtkCaptionActor2D {.
    importcpp: "GetCaptionActor2D", header: "vtkCaptionWidget.h".}
proc CreateDefaultRepresentation*(this: var vtkCaptionWidget) {.
    importcpp: "CreateDefaultRepresentation", header: "vtkCaptionWidget.h".}