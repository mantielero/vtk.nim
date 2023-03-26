## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLightNode.h
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
##  @class   vtkLightNode
##  @brief   vtkViewNode specialized for vtkLights
##
##  State storage and graph traversal for vtkLight
##

import
  vtkRenderingSceneGraphModule, vtkViewNode

type
  vtkLightNode* {.importcpp: "vtkLightNode", header: "vtkLightNode.h", bycopy.} = object of vtkViewNode
    vtkLightNode* {.importc: "vtkLightNode".}: VTK_NEWINSTANCE


proc New*(): ptr vtkLightNode {.importcpp: "vtkLightNode::New(@)",
                            header: "vtkLightNode.h".}
type
  vtkLightNodeSuperclass* = vtkViewNode

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkLightNode::IsTypeOf(@)", header: "vtkLightNode.h".}
proc IsA*(this: var vtkLightNode; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkLightNode.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkLightNode {.
    importcpp: "vtkLightNode::SafeDownCast(@)", header: "vtkLightNode.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkLightNode :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkViewNode :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLightNode :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLightNode :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkLightNode; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkLightNode.h".}