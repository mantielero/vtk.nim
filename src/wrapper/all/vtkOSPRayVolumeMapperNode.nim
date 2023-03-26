## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOSPRayVolumeMapperNode.h
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
##  @class   vtkOSPRayVolumeMapperNode
##  @brief   links vtkVolumeMapper  to OSPRay
##
##  Translates vtkVolumeMapper state into OSPRay rendering calls
##

import
  vtkOSPRayCache, vtkRenderingRayTracingModule, vtkVolumeMapperNode,
  RTWrapper/RTWrapper

discard "forward decl of vtkDataArray"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkVolume"
type
  vtkOSPRayVolumeMapperNode* {.importcpp: "vtkOSPRayVolumeMapperNode",
                              header: "vtkOSPRayVolumeMapperNode.h", bycopy.} = object of vtkVolumeMapperNode
    vtkOSPRayVolumeMapperNode* {.importc: "vtkOSPRayVolumeMapperNode".}: VTK_NEWINSTANCE
    ##  base sampling step of each voxel


proc New*(): ptr vtkOSPRayVolumeMapperNode {.
    importcpp: "vtkOSPRayVolumeMapperNode::New(@)",
    header: "vtkOSPRayVolumeMapperNode.h".}
type
  vtkOSPRayVolumeMapperNodeSuperclass* = vtkVolumeMapperNode

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOSPRayVolumeMapperNode::IsTypeOf(@)",
    header: "vtkOSPRayVolumeMapperNode.h".}
proc IsA*(this: var vtkOSPRayVolumeMapperNode; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkOSPRayVolumeMapperNode.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOSPRayVolumeMapperNode {.
    importcpp: "vtkOSPRayVolumeMapperNode::SafeDownCast(@)",
    header: "vtkOSPRayVolumeMapperNode.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOSPRayVolumeMapperNode :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkVolumeMapperNode :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOSPRayVolumeMapperNode :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOSPRayVolumeMapperNode :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkOSPRayVolumeMapperNode; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkOSPRayVolumeMapperNode.h".}
proc Render*(this: var vtkOSPRayVolumeMapperNode; prepass: bool) {.
    importcpp: "Render", header: "vtkOSPRayVolumeMapperNode.h".}
proc SetSamplingRate*(this: var vtkOSPRayVolumeMapperNode; rate: cdouble) {.
    importcpp: "SetSamplingRate", header: "vtkOSPRayVolumeMapperNode.h".}
proc GetSamplingRate*(this: var vtkOSPRayVolumeMapperNode): cdouble {.
    importcpp: "GetSamplingRate", header: "vtkOSPRayVolumeMapperNode.h".}