## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCameraWidget.h
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
##  @class   vtkCameraWidget
##  @brief   2D widget for saving a series of camera views
##
##  This class provides support for interactively saving a series of camera
##  views into an interpolated path (using vtkCameraInterpolator). To use the
##  class start by specifying a camera to interpolate, and then simply start
##  recording by hitting the "record" button, manipulate the camera (by using
##  an interactor, direct scripting, or any other means), and then save the
##  camera view. Repeat this process to record a series of views.  The user
##  can then play back interpolated camera views using the
##  vtkCameraInterpolator.
##
##  @sa
##  vtkBorderWidget vtkCameraInterpolator
##

import
  vtkBorderWidget, vtkInteractionWidgetsModule

discard "forward decl of vtkCameraRepresentation"
type
  vtkCameraWidget* {.importcpp: "vtkCameraWidget", header: "vtkCameraWidget.h",
                    bycopy.} = object of vtkBorderWidget ## *
                                                    ##  Instantiate this class.
                                                    ##
    vtkCameraWidget* {.importc: "vtkCameraWidget".}: VTK_NEWINSTANCE


proc New*(): ptr vtkCameraWidget {.importcpp: "vtkCameraWidget::New(@)",
                               header: "vtkCameraWidget.h".}
type
  vtkCameraWidgetSuperclass* = vtkBorderWidget

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCameraWidget::IsTypeOf(@)", header: "vtkCameraWidget.h".}
proc IsA*(this: var vtkCameraWidget; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkCameraWidget.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCameraWidget {.
    importcpp: "vtkCameraWidget::SafeDownCast(@)", header: "vtkCameraWidget.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCameraWidget :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkBorderWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCameraWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCameraWidget :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCameraWidget; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCameraWidget.h".}
proc SetRepresentation*(this: var vtkCameraWidget; r: ptr vtkCameraRepresentation) {.
    importcpp: "SetRepresentation", header: "vtkCameraWidget.h".}
proc CreateDefaultRepresentation*(this: var vtkCameraWidget) {.
    importcpp: "CreateDefaultRepresentation", header: "vtkCameraWidget.h".}