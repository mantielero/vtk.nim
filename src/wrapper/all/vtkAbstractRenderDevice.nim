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
  vtkObject, vtkRenderingCoreModule

discard "forward decl of vtkRecti"
type
  vtkAbstractRenderDevice* {.importcpp: "vtkAbstractRenderDevice",
                            header: "vtkAbstractRenderDevice.h", bycopy.} = object of vtkObject
    vtkAbstractRenderDevice* {.importc: "vtkAbstractRenderDevice".}: VTK_NEWINSTANCE

  vtkAbstractRenderDeviceSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAbstractRenderDevice::IsTypeOf(@)",
    header: "vtkAbstractRenderDevice.h".}
proc IsA*(this: var vtkAbstractRenderDevice; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkAbstractRenderDevice.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAbstractRenderDevice {.
    importcpp: "vtkAbstractRenderDevice::SafeDownCast(@)",
    header: "vtkAbstractRenderDevice.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAbstractRenderDevice :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAbstractRenderDevice :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAbstractRenderDevice :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAbstractRenderDevice; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkAbstractRenderDevice.h".}
proc New*(): ptr vtkAbstractRenderDevice {.importcpp: "vtkAbstractRenderDevice::New(@)",
                                       header: "vtkAbstractRenderDevice.h".}
proc SetRequestedGLVersion*(this: var vtkAbstractRenderDevice; major: cint;
                           minor: cint) {.importcpp: "SetRequestedGLVersion",
                                        header: "vtkAbstractRenderDevice.h".}
proc CreateNewWindow*(this: var vtkAbstractRenderDevice; geometry: vtkRecti;
                     name: string): bool {.importcpp: "CreateNewWindow",
                                        header: "vtkAbstractRenderDevice.h".}
proc MakeCurrent*(this: var vtkAbstractRenderDevice) {.importcpp: "MakeCurrent",
    header: "vtkAbstractRenderDevice.h".}