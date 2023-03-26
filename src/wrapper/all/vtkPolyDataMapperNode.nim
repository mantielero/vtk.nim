## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPolyDataMapperNode.h
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
##  @class   vtkPolyDataMapperNode
##  @brief   vtkViewNode specialized for vtkPolyDataMappers
##
##  State storage and graph traversal for vtkPolyDataMapper/PolyDataMapper and Property
##  Made a choice to merge PolyDataMapper, PolyDataMapper and property together. If there
##  is a compelling reason to separate them we can.
##

import
  vtkMapperNode, vtkRenderingSceneGraphModule

discard "forward decl of vtkActor"
discard "forward decl of vtkPolyDataMapper"
discard "forward decl of vtkPolyData"
type
  vtkPolyDataMapperNode* {.importcpp: "vtkPolyDataMapperNode",
                          header: "vtkPolyDataMapperNode.h", bycopy.} = object of vtkMapperNode
    vtkPolyDataMapperNode* {.importc: "vtkPolyDataMapperNode".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPolyDataMapperNode {.importcpp: "vtkPolyDataMapperNode::New(@)",
                                     header: "vtkPolyDataMapperNode.h".}
type
  vtkPolyDataMapperNodeSuperclass* = vtkMapperNode

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPolyDataMapperNode::IsTypeOf(@)",
    header: "vtkPolyDataMapperNode.h".}
proc IsA*(this: var vtkPolyDataMapperNode; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPolyDataMapperNode.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPolyDataMapperNode {.
    importcpp: "vtkPolyDataMapperNode::SafeDownCast(@)",
    header: "vtkPolyDataMapperNode.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPolyDataMapperNode :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMapperNode :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPolyDataMapperNode :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPolyDataMapperNode :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPolyDataMapperNode; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPolyDataMapperNode.h".}
type
  vtkPolyDataMapperNodevtkPDConnectivity_t* {.
      importcpp: "vtkPolyDataMapperNode::vtkPDConnectivity_t",
      header: "vtkPolyDataMapperNode.h", bycopy.} = object
    vertex_index* {.importc: "vertex_index".}: vector[cuint]
    vertex_reverse* {.importc: "vertex_reverse".}: vector[cuint]
    line_index* {.importc: "line_index".}: vector[cuint]
    line_reverse* {.importc: "line_reverse".}: vector[cuint]
    triangle_index* {.importc: "triangle_index".}: vector[cuint]
    triangle_reverse* {.importc: "triangle_reverse".}: vector[cuint]
    strip_index* {.importc: "strip_index".}: vector[cuint]
    strip_reverse* {.importc: "strip_reverse".}: vector[cuint]

  vtkPDConnectivity* = vtkPolyDataMapperNodevtkPDConnectivity_t
