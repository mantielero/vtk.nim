## =========================================================================
##
##   Program:   Visualization Toolkit
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

import
  vtkNew, vtkObject, vtkRenderingCoreModule, vtkVector

discard "forward decl of vtkAbstractInteractionDevice"
discard "forward decl of vtkAbstractRenderDevice"
type
  vtkRenderWidget* {.importcpp: "vtkRenderWidget", header: "vtkRenderWidget.h",
                    bycopy.} = object of vtkObject
    vtkRenderWidget* {.importc: "vtkRenderWidget".}: VTK_NEWINSTANCE
    ##  Position of the widget in screen coordinates.
    ##  Position of the widget in screen coordinates.
    ##  The name of the widget.
    ##  Interaction device.
    ##  Render device target.

  vtkRenderWidgetSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkRenderWidget::IsTypeOf(@)", header: "vtkRenderWidget.h".}
proc IsA*(this: var vtkRenderWidget; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkRenderWidget.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkRenderWidget {.
    importcpp: "vtkRenderWidget::SafeDownCast(@)", header: "vtkRenderWidget.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkRenderWidget :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRenderWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRenderWidget :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkRenderWidget; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkRenderWidget.h".}
proc New*(): ptr vtkRenderWidget {.importcpp: "vtkRenderWidget::New(@)",
                               header: "vtkRenderWidget.h".}
proc SetPosition*(this: var vtkRenderWidget; pos: vtkVector2i) {.
    importcpp: "SetPosition", header: "vtkRenderWidget.h".}
proc GetPosition*(this: vtkRenderWidget): vtkVector2i {.noSideEffect,
    importcpp: "GetPosition", header: "vtkRenderWidget.h".}
proc SetSize*(this: var vtkRenderWidget; size: vtkVector2i) {.importcpp: "SetSize",
    header: "vtkRenderWidget.h".}
proc GetSize*(this: vtkRenderWidget): vtkVector2i {.noSideEffect,
    importcpp: "GetSize", header: "vtkRenderWidget.h".}
proc SetName*(this: var vtkRenderWidget; name: string) {.importcpp: "SetName",
    header: "vtkRenderWidget.h".}
proc GetName*(this: vtkRenderWidget): string {.noSideEffect, importcpp: "GetName",
    header: "vtkRenderWidget.h".}
proc Render*(this: var vtkRenderWidget) {.importcpp: "Render",
                                      header: "vtkRenderWidget.h".}
proc MakeCurrent*(this: var vtkRenderWidget) {.importcpp: "MakeCurrent",
    header: "vtkRenderWidget.h".}
proc Initialize*(this: var vtkRenderWidget) {.importcpp: "Initialize",
    header: "vtkRenderWidget.h".}
proc Start*(this: var vtkRenderWidget) {.importcpp: "Start",
                                     header: "vtkRenderWidget.h".}