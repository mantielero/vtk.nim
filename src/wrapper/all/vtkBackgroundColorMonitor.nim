## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBackgroundColorMonitor
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
##  @class   vtkBackgroundColorMonitor
##  tracks state of background color(s).
##
##
##  vtkBackgroundColorMonitor -- A helper for painters that
##  tracks state of background color(s). A Painter could use this
##  to skip expensive processing that is only needed when
##  background color changes. This class queries VTK renderer
##  rather than OpenGL state in order to support VTK's gradient
##  background.
##
##  this is not intended to be shared. each object should use it's
##  own instance of this class. it's intended to be called once per
##  render.
##

import
  vtkObject, vtkRenderingCoreModule

discard "forward decl of vtkRenderer"
type
  vtkBackgroundColorMonitor* {.importcpp: "vtkBackgroundColorMonitor",
                              header: "vtkBackgroundColorMonitor.h", bycopy.} = object of vtkObject
    vtkBackgroundColorMonitor* {.importc: "vtkBackgroundColorMonitor".}: VTK_NEWINSTANCE


proc New*(): ptr vtkBackgroundColorMonitor {.
    importcpp: "vtkBackgroundColorMonitor::New(@)",
    header: "vtkBackgroundColorMonitor.h".}
type
  vtkBackgroundColorMonitorSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkBackgroundColorMonitor::IsTypeOf(@)",
    header: "vtkBackgroundColorMonitor.h".}
proc IsA*(this: var vtkBackgroundColorMonitor; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkBackgroundColorMonitor.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkBackgroundColorMonitor {.
    importcpp: "vtkBackgroundColorMonitor::SafeDownCast(@)",
    header: "vtkBackgroundColorMonitor.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkBackgroundColorMonitor :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBackgroundColorMonitor :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBackgroundColorMonitor :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkBackgroundColorMonitor; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkBackgroundColorMonitor.h".}
proc StateChanged*(this: var vtkBackgroundColorMonitor; ren: ptr vtkRenderer): bool {.
    importcpp: "StateChanged", header: "vtkBackgroundColorMonitor.h".}
proc Update*(this: var vtkBackgroundColorMonitor; ren: ptr vtkRenderer) {.
    importcpp: "Update", header: "vtkBackgroundColorMonitor.h".}