## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAssemblyPath.h
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
##  @class   vtkAssemblyPath
##  @brief   a list of nodes that form an assembly path
##
##  vtkAssemblyPath represents an ordered list of assembly nodes that
##  represent a fully evaluated assembly path. This class is used primarily
##  for picking. Note that the use of this class is to add one or more
##  assembly nodes to form the path. (An assembly node consists of an instance
##  of vtkProp and vtkMatrix4x4, the matrix may be NULL.) As each node is
##  added, the matrices are concatenated to create a final, evaluated matrix.
##
##  @sa
##  vtkAssemblyNode vtkAssembly vtkActor vtkMatrix4x4 vtkProp vtkAbstractPicker
##

import
  vtkAssemblyNode, vtkCollection, vtkRenderingCoreModule

discard "forward decl of vtkMatrix4x4"
discard "forward decl of vtkTransform"
discard "forward decl of vtkProp"
type
  vtkAssemblyPath* {.importcpp: "vtkAssemblyPath", header: "vtkAssemblyPath.h",
                    bycopy.} = object of vtkCollection ##  hide the standard AddItem from the user and the compiler.
    vtkAssemblyPath* {.importc: "vtkAssemblyPath".}: VTK_NEWINSTANCE
    ##  Used to perform matrix concatenation
    ##  A transformed prop used to do the rendering

  vtkAssemblyPathSuperclass* = vtkCollection

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAssemblyPath::IsTypeOf(@)", header: "vtkAssemblyPath.h".}
proc IsA*(this: var vtkAssemblyPath; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkAssemblyPath.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAssemblyPath {.
    importcpp: "vtkAssemblyPath::SafeDownCast(@)", header: "vtkAssemblyPath.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAssemblyPath :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAssemblyPath :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAssemblyPath :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAssemblyPath; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkAssemblyPath.h".}
proc New*(): ptr vtkAssemblyPath {.importcpp: "vtkAssemblyPath::New(@)",
                               header: "vtkAssemblyPath.h".}
proc AddNode*(this: var vtkAssemblyPath; p: ptr vtkProp; m: ptr vtkMatrix4x4) {.
    importcpp: "AddNode", header: "vtkAssemblyPath.h".}
proc GetNextNode*(this: var vtkAssemblyPath): ptr vtkAssemblyNode {.
    importcpp: "GetNextNode", header: "vtkAssemblyPath.h".}
proc GetFirstNode*(this: var vtkAssemblyPath): ptr vtkAssemblyNode {.
    importcpp: "GetFirstNode", header: "vtkAssemblyPath.h".}
proc GetLastNode*(this: var vtkAssemblyPath): ptr vtkAssemblyNode {.
    importcpp: "GetLastNode", header: "vtkAssemblyPath.h".}
proc DeleteLastNode*(this: var vtkAssemblyPath) {.importcpp: "DeleteLastNode",
    header: "vtkAssemblyPath.h".}
proc ShallowCopy*(this: var vtkAssemblyPath; path: ptr vtkAssemblyPath) {.
    importcpp: "ShallowCopy", header: "vtkAssemblyPath.h".}
proc GetMTime*(this: var vtkAssemblyPath): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkAssemblyPath.h".}
proc GetNextNode*(this: var vtkAssemblyPath; cookie: var vtkCollectionSimpleIterator): ptr vtkAssemblyNode {.
    importcpp: "GetNextNode", header: "vtkAssemblyPath.h".}