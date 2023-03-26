## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMapperNode.h
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
##  @class   vtkMapperNode
##  @brief   vtkViewNode specialized for vtkMappers
##
##  State storage and graph traversal for vtkMapper
##

import
  vtkRenderingSceneGraphModule, vtkViewNode

discard "forward decl of vtkAbstractArray"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkMapper"
discard "forward decl of vtkPolyData"
type
  vtkMapperNode* {.importcpp: "vtkMapperNode", header: "vtkMapperNode.h", bycopy.} = object of vtkViewNode
    vtkMapperNode* {.importc: "vtkMapperNode".}: VTK_NEWINSTANCE


proc New*(): ptr vtkMapperNode {.importcpp: "vtkMapperNode::New(@)",
                             header: "vtkMapperNode.h".}
type
  vtkMapperNodeSuperclass* = vtkViewNode

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkMapperNode::IsTypeOf(@)", header: "vtkMapperNode.h".}
proc IsA*(this: var vtkMapperNode; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkMapperNode.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkMapperNode {.
    importcpp: "vtkMapperNode::SafeDownCast(@)", header: "vtkMapperNode.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkMapperNode :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkViewNode :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMapperNode :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMapperNode :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkMapperNode; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkMapperNode.h".}