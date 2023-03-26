## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAssemblyNode.h
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
##  @class   vtkAssemblyNode
##  @brief   represent a node in an assembly
##
##  vtkAssemblyNode represents a node in an assembly. It is used by
##  vtkAssemblyPath to create hierarchical assemblies of props. The
##  props can be either 2D or 3D.
##
##  An assembly node refers to a vtkProp, and possibly a vtkMatrix4x4.
##  Nodes are used by vtkAssemblyPath to build fully evaluated path
##  (matrices are concatenated through the path) that is used by picking
##  and other operations involving assemblies.
##
##  @warning
##  The assembly node is guaranteed to contain a reference to an instance
##  of vtkMatrix4x4 if the prop referred to by the node is of type
##  vtkProp3D (or subclass). The matrix is evaluated through the assembly
##  path, so the assembly node's matrix is a function of its location in
##  the vtkAssemblyPath.
##
##  @warning
##  vtkAssemblyNode does not reference count its association with vtkProp.
##  Therefore, do not create an assembly node, associate a prop with it,
##  delete the prop, and then try to dereference the prop. The program
##  will break! (Reason: vtkAssemblyPath (which uses vtkAssemblyNode)
##  create self-referencing loops that destroy reference counting.)
##
##  @sa
##  vtkAssemblyPath vtkProp vtkPicker vtkMatrix4x4
##

import
  vtkObject, vtkRenderingCoreModule

discard "forward decl of vtkProp"
discard "forward decl of vtkMatrix4x4"
type
  vtkAssemblyNode* {.importcpp: "vtkAssemblyNode", header: "vtkAssemblyNode.h",
                    bycopy.} = object of vtkObject ## *
                                              ##  Create an assembly node.
                                              ##
    vtkAssemblyNode* {.importc: "vtkAssemblyNode".}: VTK_NEWINSTANCE
    ##  reference to vtkProp
    ##  associated matrix


proc New*(): ptr vtkAssemblyNode {.importcpp: "vtkAssemblyNode::New(@)",
                               header: "vtkAssemblyNode.h".}
type
  vtkAssemblyNodeSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAssemblyNode::IsTypeOf(@)", header: "vtkAssemblyNode.h".}
proc IsA*(this: var vtkAssemblyNode; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkAssemblyNode.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAssemblyNode {.
    importcpp: "vtkAssemblyNode::SafeDownCast(@)", header: "vtkAssemblyNode.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAssemblyNode :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAssemblyNode :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAssemblyNode :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAssemblyNode; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkAssemblyNode.h".}
proc SetViewProp*(this: var vtkAssemblyNode; prop: ptr vtkProp) {.
    importcpp: "SetViewProp", header: "vtkAssemblyNode.h".}
proc GetnameViewProp*(this: var vtkAssemblyNode): ptr vtkProp {.
    importcpp: "GetnameViewProp", header: "vtkAssemblyNode.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify a transformation matrix associated with the prop.
  ##  Note: if the prop is not a type of vtkProp3D, then the
  ##  transformation matrix is ignored (and expected to be NULL).
  ##  Also, internal to this object the matrix is copied because
  ##  the matrix is used for computation by vtkAssemblyPath.
  ##
proc SetMatrix*(this: var vtkAssemblyNode; matrix: ptr vtkMatrix4x4) {.
    importcpp: "SetMatrix", header: "vtkAssemblyNode.h".}
proc GetnameViewPropMatrix*(this: var vtkAssemblyNode): ptr vtkMatrix4x4 {.
    importcpp: "GetnameViewPropMatrix", header: "vtkAssemblyNode.h".}
  ## /@}
  ## *
  ##  Override the standard GetMTime() to check for the modified times
  ##  of the prop and matrix.
  ##
proc GetMTime*(this: var vtkAssemblyNode): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkAssemblyNode.h".}