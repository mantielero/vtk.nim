## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOpenGLHardwareSelector.h
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
##  @class   vtkOpenGLHardwareSelector
##  @brief   implements the device specific code of
##   vtkOpenGLHardwareSelector.
##
##
##  Implements the device specific code of vtkOpenGLHardwareSelector.
##
##  @sa
##  vtkHardwareSelector
##

import
  vtkHardwareSelector, vtkRenderingOpenGL2Module

type
  vtkOpenGLHardwareSelector* {.importcpp: "vtkOpenGLHardwareSelector",
                              header: "vtkOpenGLHardwareSelector.h", bycopy.} = object of vtkHardwareSelector
    vtkOpenGLHardwareSelector* {.importc: "vtkOpenGLHardwareSelector".}: VTK_NEWINSTANCE


proc New*(): ptr vtkOpenGLHardwareSelector {.
    importcpp: "vtkOpenGLHardwareSelector::New(@)",
    header: "vtkOpenGLHardwareSelector.h".}
type
  vtkOpenGLHardwareSelectorSuperclass* = vtkHardwareSelector

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOpenGLHardwareSelector::IsTypeOf(@)",
    header: "vtkOpenGLHardwareSelector.h".}
proc IsA*(this: var vtkOpenGLHardwareSelector; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkOpenGLHardwareSelector.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOpenGLHardwareSelector {.
    importcpp: "vtkOpenGLHardwareSelector::SafeDownCast(@)",
    header: "vtkOpenGLHardwareSelector.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOpenGLHardwareSelector :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHardwareSelector :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOpenGLHardwareSelector :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOpenGLHardwareSelector :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkOpenGLHardwareSelector; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkOpenGLHardwareSelector.h".}
proc BeginRenderProp*(this: var vtkOpenGLHardwareSelector) {.
    importcpp: "BeginRenderProp", header: "vtkOpenGLHardwareSelector.h".}
proc EndRenderProp*(this: var vtkOpenGLHardwareSelector) {.
    importcpp: "EndRenderProp", header: "vtkOpenGLHardwareSelector.h".}
proc RenderCompositeIndex*(this: var vtkOpenGLHardwareSelector; index: cuint) {.
    importcpp: "RenderCompositeIndex", header: "vtkOpenGLHardwareSelector.h".}
proc RenderProcessId*(this: var vtkOpenGLHardwareSelector; processid: cuint) {.
    importcpp: "RenderProcessId", header: "vtkOpenGLHardwareSelector.h".}
proc BeginSelection*(this: var vtkOpenGLHardwareSelector) {.
    importcpp: "BeginSelection", header: "vtkOpenGLHardwareSelector.h".}
proc EndSelection*(this: var vtkOpenGLHardwareSelector) {.importcpp: "EndSelection",
    header: "vtkOpenGLHardwareSelector.h".}