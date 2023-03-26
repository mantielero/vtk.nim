## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLightWidget.h
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
##  @class   vtkLightWidget
##  @brief   3D widget for showing a LightRepresentation
##
##  To use this widget, one generally pairs it with a
##  vtkLightRepresentation. Various options are available in the representation
##  for controlling how the widget appears, and how it functions.
##
##  @par Event Bindings:
##  By default, the widget responds to the following VTK events (i.e., it
##  watches the vtkRenderWindowInteractor for these events):
##  <pre>
##  Select and move the sphere to change the light position.
##  Select and move the cone or the line to change the focal point.
##  Right-Click and scale on the cone to change the cone angle.
##  </pre>
##
##  @warning
##  Note that the widget can be picked even when it is "behind"
##  other actors.  This is an intended feature and not a bug.
##
##  @warning
##  This class, and vtkLightRepresentation, are second generation VTK widgets.
##
##  @sa
##  vtkLightRepresentation vtkSphereWidget
##

import
  vtkAbstractWidget, vtkInteractionWidgetsModule

discard "forward decl of vtkHandleWidget"
discard "forward decl of vtkLightRepresentation"
type
  vtkLightWidget* {.importcpp: "vtkLightWidget", header: "vtkLightWidget.h", bycopy.} = object of vtkAbstractWidget
    vtkLightWidget* {.importc: "vtkLightWidget".}: VTK_NEWINSTANCE
    ##  These methods handle events


proc New*(): ptr vtkLightWidget {.importcpp: "vtkLightWidget::New(@)",
                              header: "vtkLightWidget.h".}
type
  vtkLightWidgetSuperclass* = vtkAbstractWidget

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkLightWidget::IsTypeOf(@)", header: "vtkLightWidget.h".}
proc IsA*(this: var vtkLightWidget; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkLightWidget.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkLightWidget {.
    importcpp: "vtkLightWidget::SafeDownCast(@)", header: "vtkLightWidget.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkLightWidget :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLightWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLightWidget :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkLightWidget; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkLightWidget.h".}
proc SetRepresentation*(this: var vtkLightWidget; r: ptr vtkLightRepresentation) {.
    importcpp: "SetRepresentation", header: "vtkLightWidget.h".}
proc GetLightRepresentation*(this: var vtkLightWidget): ptr vtkLightRepresentation {.
    importcpp: "GetLightRepresentation", header: "vtkLightWidget.h".}
proc CreateDefaultRepresentation*(this: var vtkLightWidget) {.
    importcpp: "CreateDefaultRepresentation", header: "vtkLightWidget.h".}