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

discard "forward decl of vtkRenderWidget"
discard "forward decl of vtkAbstractRenderDevice"
type
  vtkAbstractInteractionDevice* {.importcpp: "vtkAbstractInteractionDevice",
                                 header: "vtkAbstractInteractionDevice.h", bycopy.} = object of vtkObject
    vtkAbstractInteractionDevice* {.importc: "vtkAbstractInteractionDevice".}: VTK_NEWINSTANCE

  vtkAbstractInteractionDeviceSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAbstractInteractionDevice::IsTypeOf(@)",
    header: "vtkAbstractInteractionDevice.h".}
proc IsA*(this: var vtkAbstractInteractionDevice; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkAbstractInteractionDevice.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAbstractInteractionDevice {.
    importcpp: "vtkAbstractInteractionDevice::SafeDownCast(@)",
    header: "vtkAbstractInteractionDevice.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAbstractInteractionDevice :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAbstractInteractionDevice :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAbstractInteractionDevice :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAbstractInteractionDevice; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkAbstractInteractionDevice.h".}
proc New*(): ptr vtkAbstractInteractionDevice {.
    importcpp: "vtkAbstractInteractionDevice::New(@)",
    header: "vtkAbstractInteractionDevice.h".}
proc Initialize*(this: var vtkAbstractInteractionDevice) {.importcpp: "Initialize",
    header: "vtkAbstractInteractionDevice.h".}
proc Start*(this: var vtkAbstractInteractionDevice) {.importcpp: "Start",
    header: "vtkAbstractInteractionDevice.h".}
proc ProcessEvents*(this: var vtkAbstractInteractionDevice) {.
    importcpp: "ProcessEvents", header: "vtkAbstractInteractionDevice.h".}
proc SetRenderWidget*(this: var vtkAbstractInteractionDevice;
                     widget: ptr vtkRenderWidget) {.importcpp: "SetRenderWidget",
    header: "vtkAbstractInteractionDevice.h".}
proc GetRenderWidget*(this: var vtkAbstractInteractionDevice): ptr vtkRenderWidget {.
    importcpp: "GetRenderWidget", header: "vtkAbstractInteractionDevice.h".}
proc SetRenderDevice*(this: var vtkAbstractInteractionDevice;
                     device: ptr vtkAbstractRenderDevice) {.
    importcpp: "SetRenderDevice", header: "vtkAbstractInteractionDevice.h".}
proc GetRenderDevice*(this: var vtkAbstractInteractionDevice): ptr vtkAbstractRenderDevice {.
    importcpp: "GetRenderDevice", header: "vtkAbstractInteractionDevice.h".}