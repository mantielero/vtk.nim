## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOSPRayPointGaussianMapperNode.h
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
##  @class   vtkOSPRayPointGaussianMapperNode
##  @brief   links vtkActor and vtkMapper to OSPRay
##
##  Translates vtkActor/Mapper state into OSPRay rendering calls
##

import
  vtkOSPRayPolyDataMapperNode, vtkRenderingRayTracingModule

discard "forward decl of vtkOSPRayActorNode"
discard "forward decl of vtkPolyData"
type
  vtkOSPRayPointGaussianMapperNode* {.importcpp: "vtkOSPRayPointGaussianMapperNode", header: "vtkOSPRayPointGaussianMapperNode.h",
                                     bycopy.} = object of vtkOSPRayPolyDataMapperNode
    vtkOSPRayPointGaussianMapperNode* {.importc: "vtkOSPRayPointGaussianMapperNode".}: VTK_NEWINSTANCE


proc New*(): ptr vtkOSPRayPointGaussianMapperNode {.
    importcpp: "vtkOSPRayPointGaussianMapperNode::New(@)",
    header: "vtkOSPRayPointGaussianMapperNode.h".}
type
  vtkOSPRayPointGaussianMapperNodeSuperclass* = vtkOSPRayPolyDataMapperNode

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOSPRayPointGaussianMapperNode::IsTypeOf(@)",
    header: "vtkOSPRayPointGaussianMapperNode.h".}
proc IsA*(this: var vtkOSPRayPointGaussianMapperNode; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkOSPRayPointGaussianMapperNode.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOSPRayPointGaussianMapperNode {.
    importcpp: "vtkOSPRayPointGaussianMapperNode::SafeDownCast(@)",
    header: "vtkOSPRayPointGaussianMapperNode.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOSPRayPointGaussianMapperNode :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkOSPRayPolyDataMapperNode :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOSPRayPointGaussianMapperNode :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOSPRayPointGaussianMapperNode :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkOSPRayPointGaussianMapperNode; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkOSPRayPointGaussianMapperNode.h".}
proc Render*(this: var vtkOSPRayPointGaussianMapperNode; prepass: bool) {.
    importcpp: "Render", header: "vtkOSPRayPointGaussianMapperNode.h".}