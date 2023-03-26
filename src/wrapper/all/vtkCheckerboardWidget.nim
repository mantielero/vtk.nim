## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCheckerboardWidget.h
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
##  @class   vtkCheckerboardWidget
##  @brief   interactively set the number of divisions in 2D image checkerboard
##
##  The vtkCheckerboardWidget is used to interactively control an instance of
##  vtkImageCheckerboard (and an associated vtkImageActor used to display the
##  checkerboard). The user can adjust the number of divisions in each of the
##  i-j directions in a 2D image. A frame appears around the vtkImageActor
##  with sliders along each side of the frame. The user can interactively
##  adjust the sliders to the desired number of checkerboard subdivisions.
##
##  To use this widget, specify an instance of vtkImageCheckerboard and an
##  instance of vtkImageActor. By default, the widget responds to the
##  following events:
##  <pre>
##  If the slider bead is selected:
##    LeftButtonPressEvent - select slider (if on slider)
##    LeftButtonReleaseEvent - release slider
##    MouseMoveEvent - move slider
##  If the end caps or slider tube of a slider are selected:
##    LeftButtonPressEvent - jump (or animate) to cap or point on tube;
##  </pre>
##  It is possible to change these event bindings. Please refer to the
##  documentation for vtkSliderWidget for more information. Advanced users may
##  directly access and manipulate the sliders by obtaining the instances of
##  vtkSliderWidget composing the vtkCheckerboard widget.
##
##  @sa
##  vtkImageCheckerboard vtkImageActor vtkSliderWidget vtkRectilinearWipeWidget
##

import
  vtkAbstractWidget, vtkInteractionWidgetsModule

discard "forward decl of vtkCheckerboardRepresentation"
discard "forward decl of vtkSliderWidget"
type
  vtkCheckerboardWidget* {.importcpp: "vtkCheckerboardWidget",
                          header: "vtkCheckerboardWidget.h", bycopy.} = object of vtkAbstractWidget ## *
                                                                                             ##  Instantiate this class.
                                                                                             ##
    vtkCheckerboardWidget* {.importc: "vtkCheckerboardWidget".}: VTK_NEWINSTANCE
    ##  Callback interface


proc New*(): ptr vtkCheckerboardWidget {.importcpp: "vtkCheckerboardWidget::New(@)",
                                     header: "vtkCheckerboardWidget.h".}
type
  vtkCheckerboardWidgetSuperclass* = vtkAbstractWidget

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCheckerboardWidget::IsTypeOf(@)",
    header: "vtkCheckerboardWidget.h".}
proc IsA*(this: var vtkCheckerboardWidget; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkCheckerboardWidget.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCheckerboardWidget {.
    importcpp: "vtkCheckerboardWidget::SafeDownCast(@)",
    header: "vtkCheckerboardWidget.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCheckerboardWidget :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCheckerboardWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCheckerboardWidget :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCheckerboardWidget; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCheckerboardWidget.h".}
proc SetEnabled*(this: var vtkCheckerboardWidget; a2: cint) {.importcpp: "SetEnabled",
    header: "vtkCheckerboardWidget.h".}
proc SetRepresentation*(this: var vtkCheckerboardWidget;
                       r: ptr vtkCheckerboardRepresentation) {.
    importcpp: "SetRepresentation", header: "vtkCheckerboardWidget.h".}
proc GetCheckerboardRepresentation*(this: var vtkCheckerboardWidget): ptr vtkCheckerboardRepresentation {.
    importcpp: "GetCheckerboardRepresentation", header: "vtkCheckerboardWidget.h".}
proc CreateDefaultRepresentation*(this: var vtkCheckerboardWidget) {.
    importcpp: "CreateDefaultRepresentation", header: "vtkCheckerboardWidget.h".}