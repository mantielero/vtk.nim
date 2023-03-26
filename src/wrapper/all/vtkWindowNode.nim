## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkWindowNode.h
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
##  @class   vtkWindowNode
##  @brief   vtkViewNode specialized for vtkRenderWindows
##
##  State storage and graph traversal for vtkRenderWindow
##

import
  vtkRenderingSceneGraphModule, vtkViewNode

discard "forward decl of vtkUnsignedCharArray"
discard "forward decl of vtkFloatArray"
type
  vtkWindowNode* {.importcpp: "vtkWindowNode", header: "vtkWindowNode.h", bycopy.} = object of vtkViewNode
    vtkWindowNode* {.importc: "vtkWindowNode".}: VTK_NEWINSTANCE
    ##  stores the results of a render


proc New*(): ptr vtkWindowNode {.importcpp: "vtkWindowNode::New(@)",
                             header: "vtkWindowNode.h".}
type
  vtkWindowNodeSuperclass* = vtkViewNode

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkWindowNode::IsTypeOf(@)", header: "vtkWindowNode.h".}
proc IsA*(this: var vtkWindowNode; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkWindowNode.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkWindowNode {.
    importcpp: "vtkWindowNode::SafeDownCast(@)", header: "vtkWindowNode.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkWindowNode :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkViewNode :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkWindowNode :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkWindowNode :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkWindowNode; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkWindowNode.h".}
proc Build*(this: var vtkWindowNode; prepass: bool) {.importcpp: "Build",
    header: "vtkWindowNode.h".}
proc Synchronize*(this: var vtkWindowNode; prepass: bool) {.importcpp: "Synchronize",
    header: "vtkWindowNode.h".}
proc GetSize*(this: var vtkWindowNode): ptr cint {.importcpp: "GetSize",
    header: "vtkWindowNode.h".}
proc GetColorBuffer*(this: var vtkWindowNode): ptr vtkUnsignedCharArray {.
    importcpp: "GetColorBuffer", header: "vtkWindowNode.h".}
proc GetZBuffer*(this: var vtkWindowNode): ptr vtkFloatArray {.
    importcpp: "GetZBuffer", header: "vtkWindowNode.h".}