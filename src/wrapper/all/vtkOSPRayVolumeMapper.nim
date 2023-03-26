## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOSPRayVolumeMapper.h
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkOSPRayVolumeMapper
##  @brief   Standalone OSPRayVolumeMapper.
##
##  This is a standalone interface for ospray volume rendering to be used
##  within otherwise OpenGL rendering contexts such as within the
##  SmartVolumeMapper.
##

import
  vtkOSPRayVolumeInterface, vtkRenderingRayTracingModule

discard "forward decl of vtkOSPRayPass"
discard "forward decl of vtkRenderer"
discard "forward decl of vtkWindow"
type
  vtkOSPRayVolumeMapper* {.importcpp: "vtkOSPRayVolumeMapper",
                          header: "vtkOSPRayVolumeMapper.h", bycopy.} = object of vtkOSPRayVolumeInterface
    vtkOSPRayVolumeMapper* {.importc: "vtkOSPRayVolumeMapper".}: VTK_NEWINSTANCE


proc New*(): ptr vtkOSPRayVolumeMapper {.importcpp: "vtkOSPRayVolumeMapper::New(@)",
                                     header: "vtkOSPRayVolumeMapper.h".}
type
  vtkOSPRayVolumeMapperSuperclass* = vtkOSPRayVolumeInterface

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOSPRayVolumeMapper::IsTypeOf(@)",
    header: "vtkOSPRayVolumeMapper.h".}
proc IsA*(this: var vtkOSPRayVolumeMapper; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkOSPRayVolumeMapper.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOSPRayVolumeMapper {.
    importcpp: "vtkOSPRayVolumeMapper::SafeDownCast(@)",
    header: "vtkOSPRayVolumeMapper.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOSPRayVolumeMapper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkOSPRayVolumeInterface :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOSPRayVolumeMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOSPRayVolumeMapper :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkOSPRayVolumeMapper; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkOSPRayVolumeMapper.h".}
proc ReleaseGraphicsResources*(this: var vtkOSPRayVolumeMapper; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkOSPRayVolumeMapper.h".}
proc Init*(this: var vtkOSPRayVolumeMapper) {.importcpp: "Init",
    header: "vtkOSPRayVolumeMapper.h".}
proc Render*(this: var vtkOSPRayVolumeMapper; a2: ptr vtkRenderer; a3: ptr vtkVolume) {.
    importcpp: "Render", header: "vtkOSPRayVolumeMapper.h".}