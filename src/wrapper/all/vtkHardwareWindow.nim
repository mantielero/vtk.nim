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
## *
##  @class   vtkHardwareWindow
##  @brief   create a window for renderers to draw into
##
##  vtkHardwareWindow is an abstract object representing a UI based
##  window that can be drawn to. This class is defines an interface that
##  GUI specific subclasses (Win32, X, Cocoa) should support.
##
##  This class is meant to be Graphics library agnostic. In that it should
##  contain as little graphics library specific code as possible, ideally none.
##  In contrast to classes such as vtkWinOpenGLRenderWindow which contain
##  significant ties to OpenGL.
##
##

import
  vtkRenderingCoreModule, vtkWindow

type
  vtkHardwareWindow* {.importcpp: "vtkHardwareWindow",
                      header: "vtkHardwareWindow.h", bycopy.} = object of vtkWindow
    vtkHardwareWindow* {.importc: "vtkHardwareWindow".}: VTK_NEWINSTANCE


proc New*(): ptr vtkHardwareWindow {.importcpp: "vtkHardwareWindow::New(@)",
                                 header: "vtkHardwareWindow.h".}
type
  vtkHardwareWindowSuperclass* = vtkWindow

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkHardwareWindow::IsTypeOf(@)", header: "vtkHardwareWindow.h".}
proc IsA*(this: var vtkHardwareWindow; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkHardwareWindow.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkHardwareWindow {.
    importcpp: "vtkHardwareWindow::SafeDownCast(@)", header: "vtkHardwareWindow.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkHardwareWindow :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWindow :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHardwareWindow :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHardwareWindow :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkHardwareWindow; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkHardwareWindow.h".}
proc Create*(this: var vtkHardwareWindow) {.importcpp: "Create",
                                        header: "vtkHardwareWindow.h".}
  ##  destroy the window (not the instance)
proc Destroy*(this: var vtkHardwareWindow) {.importcpp: "Destroy",
    header: "vtkHardwareWindow.h".}