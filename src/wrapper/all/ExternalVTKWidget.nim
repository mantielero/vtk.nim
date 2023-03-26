## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    ExternalVTKWidget.h
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
##  .NAME ExternalVTKWidget - Use VTK rendering in an external window/application
##  .SECTION Description
##  ExternalVTKWidget provides an easy way to render VTK objects in an external
##  environment using the VTK rendering framework without drawing a new window.

import
  vtkExternalOpenGLRenderWindow, vtkExternalOpenGLRenderer, vtkObject,
  vtkRenderingExternalModule

##  Class that maintains an external render window.

type
  ExternalVTKWidget* {.importcpp: "ExternalVTKWidget",
                      header: "ExternalVTKWidget.h", bycopy.} = object of vtkObject
    ExternalVTKWidget* {.importc: "ExternalVTKWidget".}: VTK_NEWINSTANCE


proc New*(): ptr ExternalVTKWidget {.importcpp: "ExternalVTKWidget::New(@)",
                                 header: "ExternalVTKWidget.h".}
type
  ExternalVTKWidgetSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "ExternalVTKWidget::IsTypeOf(@)", header: "ExternalVTKWidget.h".}
proc IsA*(this: var ExternalVTKWidget; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "ExternalVTKWidget.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr ExternalVTKWidget {.
    importcpp: "ExternalVTKWidget::SafeDownCast(@)", header: "ExternalVTKWidget.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return ExternalVTKWidget :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> ExternalVTKWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return ExternalVTKWidget :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var ExternalVTKWidget; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "ExternalVTKWidget.h".}
proc GetRenderWindow*(this: var ExternalVTKWidget): ptr vtkExternalOpenGLRenderWindow {.
    importcpp: "GetRenderWindow", header: "ExternalVTKWidget.h".}
proc SetRenderWindow*(this: var ExternalVTKWidget;
                     renWin: ptr vtkExternalOpenGLRenderWindow) {.
    importcpp: "SetRenderWindow", header: "ExternalVTKWidget.h".}
proc AddRenderer*(this: var ExternalVTKWidget): ptr vtkExternalOpenGLRenderer {.
    importcpp: "AddRenderer", header: "ExternalVTKWidget.h".}