## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkVolumeNode.h
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
##  @class   vtkVolumeNode
##  @brief   vtkViewNode specialized for vtkActors
##
##  State storage and graph traversal for vtkActor/Mapper and Property
##  Made a choice to merge actor, mapper and property together. If there
##  is a compelling reason to separate them we can.
##

import
  vtkRenderingSceneGraphModule, vtkViewNode

type
  vtkVolumeNode* {.importcpp: "vtkVolumeNode", header: "vtkVolumeNode.h", bycopy.} = object of vtkViewNode
    vtkVolumeNode* {.importc: "vtkVolumeNode".}: VTK_NEWINSTANCE


proc New*(): ptr vtkVolumeNode {.importcpp: "vtkVolumeNode::New(@)",
                             header: "vtkVolumeNode.h".}
type
  vtkVolumeNodeSuperclass* = vtkViewNode

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkVolumeNode::IsTypeOf(@)", header: "vtkVolumeNode.h".}
proc IsA*(this: var vtkVolumeNode; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkVolumeNode.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkVolumeNode {.
    importcpp: "vtkVolumeNode::SafeDownCast(@)", header: "vtkVolumeNode.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkVolumeNode :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkViewNode :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkVolumeNode :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkVolumeNode :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkVolumeNode; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkVolumeNode.h".}
proc Build*(this: var vtkVolumeNode; prepass: bool) {.importcpp: "Build",
    header: "vtkVolumeNode.h".}