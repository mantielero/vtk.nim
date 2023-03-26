## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAssembly.h
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
##  @class   vtkAssembly
##  @brief   create hierarchies of vtkProp3Ds (transformable props)
##
##  vtkAssembly is an object that groups vtkProp3Ds, its subclasses, and
##  other assemblies into a tree-like hierarchy. The vtkProp3Ds and
##  assemblies can then be transformed together by transforming just the root
##  assembly of the hierarchy.
##
##  A vtkAssembly object can be used in place of an vtkProp3D since it is a
##  subclass of vtkProp3D. The difference is that vtkAssembly maintains a list
##  of vtkProp3D instances (its "parts") that form the assembly. Then, any
##  operation that transforms (i.e., scales, rotates, translates) the parent
##  assembly will transform all its parts.  Note that this process is
##  recursive: you can create groups consisting of assemblies and/or
##  vtkProp3Ds to arbitrary depth.
##
##  To add an assembly to the renderer's list of props, you only need to
##  add the root of the assembly. During rendering, the parts of the
##  assembly are rendered during a hierarchical traversal process.
##
##  @warning
##  Collections of assemblies are slower to render than an equivalent list
##  of actors. This is because to support arbitrary nesting of assemblies,
##  the state of the assemblies (i.e., transformation matrices) must
##  be propagated through the assembly hierarchy.
##
##  @warning
##  Assemblies can consist of hierarchies of assemblies, where one actor or
##  assembly used in one hierarchy is also used in other hierarchies. However,
##  make that there are no cycles (e.g., parent->child->parent), this will
##  cause program failure.
##
##  @warning
##  If you wish to create assemblies without any transformation (using the
##  assembly strictly as a grouping mechanism), then you may wish to
##  consider using vtkPropAssembly.
##
##  @sa
##  vtkActor vtkTransform vtkMapper vtkPolyDataMapper vtkPropAssembly
##

import
  vtkProp3D, vtkRenderingCoreModule

discard "forward decl of vtkAssemblyPaths"
discard "forward decl of vtkProp3DCollection"
discard "forward decl of vtkMapper"
discard "forward decl of vtkProperty"
discard "forward decl of vtkActor"
type
  vtkAssembly* {.importcpp: "vtkAssembly", header: "vtkAssembly.h", bycopy.} = object of vtkProp3D
    vtkAssembly* {.importc: "vtkAssembly".}: VTK_NEWINSTANCE
    ##  Support the BuildPaths() method. Caches last paths built for
    ##  performance.


proc New*(): ptr vtkAssembly {.importcpp: "vtkAssembly::New(@)",
                           header: "vtkAssembly.h".}
type
  vtkAssemblySuperclass* = vtkProp3D

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAssembly::IsTypeOf(@)", header: "vtkAssembly.h".}
proc IsA*(this: var vtkAssembly; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkAssembly.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAssembly {.
    importcpp: "vtkAssembly::SafeDownCast(@)", header: "vtkAssembly.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAssembly :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkProp3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAssembly :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAssembly :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAssembly; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkAssembly.h".}
proc AddPart*(this: var vtkAssembly; a2: ptr vtkProp3D) {.importcpp: "AddPart",
    header: "vtkAssembly.h".}
proc RemovePart*(this: var vtkAssembly; a2: ptr vtkProp3D) {.importcpp: "RemovePart",
    header: "vtkAssembly.h".}
proc GetParts*(this: var vtkAssembly): ptr vtkProp3DCollection {.
    importcpp: "GetParts", header: "vtkAssembly.h".}
proc GetActors*(this: var vtkAssembly; a2: ptr vtkPropCollection) {.
    importcpp: "GetActors", header: "vtkAssembly.h".}
proc GetVolumes*(this: var vtkAssembly; a2: ptr vtkPropCollection) {.
    importcpp: "GetVolumes", header: "vtkAssembly.h".}
proc RenderOpaqueGeometry*(this: var vtkAssembly; ren: ptr vtkViewport): cint {.
    importcpp: "RenderOpaqueGeometry", header: "vtkAssembly.h".}
proc RenderTranslucentPolygonalGeometry*(this: var vtkAssembly; ren: ptr vtkViewport): cint {.
    importcpp: "RenderTranslucentPolygonalGeometry", header: "vtkAssembly.h".}
proc RenderVolumetricGeometry*(this: var vtkAssembly; ren: ptr vtkViewport): cint {.
    importcpp: "RenderVolumetricGeometry", header: "vtkAssembly.h".}
proc HasTranslucentPolygonalGeometry*(this: var vtkAssembly): vtkTypeBool {.
    importcpp: "HasTranslucentPolygonalGeometry", header: "vtkAssembly.h".}
proc ReleaseGraphicsResources*(this: var vtkAssembly; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkAssembly.h".}
proc InitPathTraversal*(this: var vtkAssembly) {.importcpp: "InitPathTraversal",
    header: "vtkAssembly.h".}
proc GetNextPath*(this: var vtkAssembly): ptr vtkAssemblyPath {.
    importcpp: "GetNextPath", header: "vtkAssembly.h".}
proc GetNumberOfPaths*(this: var vtkAssembly): cint {.importcpp: "GetNumberOfPaths",
    header: "vtkAssembly.h".}
proc GetBounds*(this: var vtkAssembly; bounds: array[6, cdouble]) {.
    importcpp: "GetBounds", header: "vtkAssembly.h".}
## !!!Ignored construct:  double * GetBounds ( ) VTK_SIZEHINT ( 6 ) override ;
## Error: expected ';'!!!

proc GetMTime*(this: var vtkAssembly): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkAssembly.h".}
proc ShallowCopy*(this: var vtkAssembly; prop: ptr vtkProp) {.importcpp: "ShallowCopy",
    header: "vtkAssembly.h".}
proc BuildPaths*(this: var vtkAssembly; paths: ptr vtkAssemblyPaths;
                path: ptr vtkAssemblyPath) {.importcpp: "BuildPaths",
    header: "vtkAssembly.h".}