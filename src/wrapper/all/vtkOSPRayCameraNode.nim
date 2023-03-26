## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOSPRayCameraNode.h
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
##  @class   vtkOSPRayCameraNode
##  @brief   links vtkCamera to OSPRay
##
##  Translates vtkCamera state into OSPRay rendering calls
##

import
  vtkCameraNode, vtkRenderingRayTracingModule, RTWrapper/RTWrapper

discard "forward decl of vtkInformationIntegerKey"
discard "forward decl of vtkCamera"
type
  vtkOSPRayCameraNode* {.importcpp: "vtkOSPRayCameraNode",
                        header: "vtkOSPRayCameraNode.h", bycopy.} = object of vtkCameraNode
    vtkOSPRayCameraNode* {.importc: "vtkOSPRayCameraNode".}: VTK_NEWINSTANCE


proc New*(): ptr vtkOSPRayCameraNode {.importcpp: "vtkOSPRayCameraNode::New(@)",
                                   header: "vtkOSPRayCameraNode.h".}
type
  vtkOSPRayCameraNodeSuperclass* = vtkCameraNode

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOSPRayCameraNode::IsTypeOf(@)", header: "vtkOSPRayCameraNode.h".}
proc IsA*(this: var vtkOSPRayCameraNode; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkOSPRayCameraNode.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOSPRayCameraNode {.
    importcpp: "vtkOSPRayCameraNode::SafeDownCast(@)",
    header: "vtkOSPRayCameraNode.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOSPRayCameraNode :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCameraNode :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOSPRayCameraNode :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOSPRayCameraNode :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkOSPRayCameraNode; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkOSPRayCameraNode.h".}
proc Render*(this: var vtkOSPRayCameraNode; prepass: bool) {.importcpp: "Render",
    header: "vtkOSPRayCameraNode.h".}
proc GetOCamera*(this: var vtkOSPRayCameraNode): OSPCamera {.importcpp: "GetOCamera",
    header: "vtkOSPRayCameraNode.h".}
## !!!Ignored construct:  { nullptr } ;
## Error: identifier expected, but got: {!!!
