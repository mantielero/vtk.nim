## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAssemblyPaths.h
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
##  @class   vtkAssemblyPaths
##  @brief   a list of lists of props representing an assembly hierarchy
##
##  vtkAssemblyPaths represents an assembly hierarchy as a list of
##  vtkAssemblyPath. Each path represents the complete path from the
##  top level assembly (if any) down to the leaf prop.
##
##  @sa
##  vtkAssemblyPath vtkAssemblyNode vtkPicker vtkAssembly vtkProp
##

import
  vtkCollection, vtkRenderingCoreModule, vtkAssemblyPath

discard "forward decl of vtkProp"
type
  vtkAssemblyPaths* {.importcpp: "vtkAssemblyPaths", header: "vtkAssemblyPaths.h",
                     bycopy.} = object of vtkCollection ##  hide the standard AddItem from the user and the compiler.
    vtkAssemblyPaths* {.importc: "vtkAssemblyPaths".}: VTK_NEWINSTANCE


proc New*(): ptr vtkAssemblyPaths {.importcpp: "vtkAssemblyPaths::New(@)",
                                header: "vtkAssemblyPaths.h".}
type
  vtkAssemblyPathsSuperclass* = vtkCollection

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAssemblyPaths::IsTypeOf(@)", header: "vtkAssemblyPaths.h".}
proc IsA*(this: var vtkAssemblyPaths; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkAssemblyPaths.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAssemblyPaths {.
    importcpp: "vtkAssemblyPaths::SafeDownCast(@)", header: "vtkAssemblyPaths.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAssemblyPaths :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAssemblyPaths :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAssemblyPaths :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAssemblyPaths; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkAssemblyPaths.h".}
proc AddItem*(this: var vtkAssemblyPaths; p: ptr vtkAssemblyPath) {.
    importcpp: "AddItem", header: "vtkAssemblyPaths.h".}
proc RemoveItem*(this: var vtkAssemblyPaths; p: ptr vtkAssemblyPath) {.
    importcpp: "RemoveItem", header: "vtkAssemblyPaths.h".}
proc IsItemPresent*(this: var vtkAssemblyPaths; p: ptr vtkAssemblyPath): cint {.
    importcpp: "IsItemPresent", header: "vtkAssemblyPaths.h".}
proc GetNextItem*(this: var vtkAssemblyPaths): ptr vtkAssemblyPath {.
    importcpp: "GetNextItem", header: "vtkAssemblyPaths.h".}
proc GetMTime*(this: var vtkAssemblyPaths): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkAssemblyPaths.h".}
proc GetNextPath*(this: var vtkAssemblyPaths;
                 cookie: var vtkCollectionSimpleIterator): ptr vtkAssemblyPath {.
    importcpp: "GetNextPath", header: "vtkAssemblyPaths.h".}
proc AddItem*(this: var vtkAssemblyPaths; p: ptr vtkAssemblyPath) {.
    importcpp: "AddItem", header: "vtkAssemblyPaths.h".}
proc RemoveItem*(this: var vtkAssemblyPaths; p: ptr vtkAssemblyPath) {.
    importcpp: "RemoveItem", header: "vtkAssemblyPaths.h".}
proc IsItemPresent*(this: var vtkAssemblyPaths; p: ptr vtkAssemblyPath): cint {.
    importcpp: "IsItemPresent", header: "vtkAssemblyPaths.h".}
proc GetNextItem*(this: var vtkAssemblyPaths): ptr vtkAssemblyPath {.
    importcpp: "GetNextItem", header: "vtkAssemblyPaths.h".}