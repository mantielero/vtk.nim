## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPropAssembly.h
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
##  @class   vtkPropAssembly
##  @brief   create hierarchies of props
##
##  vtkPropAssembly is an object that groups props and other prop assemblies
##  into a tree-like hierarchy. The props can then be treated as a group
##  (e.g., turning visibility on and off).
##
##  A vtkPropAssembly object can be used in place of an vtkProp since it is a
##  subclass of vtkProp. The difference is that vtkPropAssembly maintains a
##  list of other prop and prop assembly instances (its "parts") that form the
##  assembly. Note that this process is recursive: you can create groups
##  consisting of prop assemblies to arbitrary depth.
##
##  vtkPropAssembly's and vtkProp's that compose a prop assembly need not be
##  added to a renderer's list of props, as long as the parent assembly is in
##  the prop list. This is because they are automatically rendered during
##  the hierarchical traversal process.
##
##  @warning
##  vtkPropAssemblies can consist of hierarchies of assemblies, where one
##  actor or assembly used in one hierarchy is also used in other
##  hierarchies. However, make that there are no cycles (e.g.,
##  parent->child->parent), this will cause program failure.
##
##  @sa
##  vtkProp3D vtkActor vtkAssembly vtkActor2D vtkVolume
##

import
  vtkProp, vtkRenderingCoreModule

type
  vtkPropAssembly* {.importcpp: "vtkPropAssembly", header: "vtkPropAssembly.h",
                    bycopy.} = object of vtkProp
    vtkPropAssembly* {.importc: "vtkPropAssembly".}: VTK_NEWINSTANCE
    ##  Support the BuildPaths() method,

  vtkPropAssemblySuperclass* = vtkProp

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPropAssembly::IsTypeOf(@)", header: "vtkPropAssembly.h".}
proc IsA*(this: var vtkPropAssembly; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkPropAssembly.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPropAssembly {.
    importcpp: "vtkPropAssembly::SafeDownCast(@)", header: "vtkPropAssembly.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPropAssembly :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkProp :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPropAssembly :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPropAssembly :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPropAssembly; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPropAssembly.h".}
proc New*(): ptr vtkPropAssembly {.importcpp: "vtkPropAssembly::New(@)",
                               header: "vtkPropAssembly.h".}
proc AddPart*(this: var vtkPropAssembly; a2: ptr vtkProp) {.importcpp: "AddPart",
    header: "vtkPropAssembly.h".}
proc RemovePart*(this: var vtkPropAssembly; a2: ptr vtkProp) {.importcpp: "RemovePart",
    header: "vtkPropAssembly.h".}
proc GetParts*(this: var vtkPropAssembly): ptr vtkPropCollection {.
    importcpp: "GetParts", header: "vtkPropAssembly.h".}
proc RenderOpaqueGeometry*(this: var vtkPropAssembly; ren: ptr vtkViewport): cint {.
    importcpp: "RenderOpaqueGeometry", header: "vtkPropAssembly.h".}
proc RenderTranslucentPolygonalGeometry*(this: var vtkPropAssembly;
                                        ren: ptr vtkViewport): cint {.
    importcpp: "RenderTranslucentPolygonalGeometry", header: "vtkPropAssembly.h".}
proc RenderVolumetricGeometry*(this: var vtkPropAssembly; ren: ptr vtkViewport): cint {.
    importcpp: "RenderVolumetricGeometry", header: "vtkPropAssembly.h".}
proc RenderOverlay*(this: var vtkPropAssembly; ren: ptr vtkViewport): cint {.
    importcpp: "RenderOverlay", header: "vtkPropAssembly.h".}
proc HasTranslucentPolygonalGeometry*(this: var vtkPropAssembly): vtkTypeBool {.
    importcpp: "HasTranslucentPolygonalGeometry", header: "vtkPropAssembly.h".}
proc ReleaseGraphicsResources*(this: var vtkPropAssembly; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkPropAssembly.h".}
## !!!Ignored construct:  *
##  Get the bounds for this prop assembly as (Xmin,Xmax,Ymin,Ymax,Zmin,Zmax).
##  May return NULL in some cases (meaning the bounds is undefined).
##  double * GetBounds ( ) VTK_SIZEHINT ( 6 ) override ;
## Error: expected ';'!!!

proc ShallowCopy*(this: var vtkPropAssembly; Prop: ptr vtkProp) {.
    importcpp: "ShallowCopy", header: "vtkPropAssembly.h".}
proc GetMTime*(this: var vtkPropAssembly): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkPropAssembly.h".}
proc InitPathTraversal*(this: var vtkPropAssembly) {.importcpp: "InitPathTraversal",
    header: "vtkPropAssembly.h".}
proc GetNextPath*(this: var vtkPropAssembly): ptr vtkAssemblyPath {.
    importcpp: "GetNextPath", header: "vtkPropAssembly.h".}
proc GetNumberOfPaths*(this: var vtkPropAssembly): cint {.
    importcpp: "GetNumberOfPaths", header: "vtkPropAssembly.h".}
proc BuildPaths*(this: var vtkPropAssembly; paths: ptr vtkAssemblyPaths;
                path: ptr vtkAssemblyPath) {.importcpp: "BuildPaths",
    header: "vtkPropAssembly.h".}