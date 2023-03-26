## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkActor.h
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
##  @class   vtkActor
##  @brief   represents an object (geometry & properties) in a rendered scene
##
##
##  vtkActor is used to represent an entity in a rendering scene.  It inherits
##  functions related to the actors position, and orientation from
##  vtkProp3D. The actor also has scaling and maintains a reference to the
##  defining geometry (i.e., the mapper), rendering properties, and possibly a
##  texture map. vtkActor combines these instance variables into one 4x4
##  transformation matrix as follows: [x y z 1] = [x y z 1] Translate(-origin)
##  Scale(scale) Rot(y) Rot(x) Rot (z) Trans(origin) Trans(position)
##
##  @sa
##  vtkProperty vtkTexture vtkMapper vtkAssembly vtkFollower vtkLODActor
##

import
  vtkProp3D, vtkRenderingCoreModule

discard "forward decl of vtkRenderer"
discard "forward decl of vtkPropCollection"
discard "forward decl of vtkActorCollection"
discard "forward decl of vtkTexture"
discard "forward decl of vtkMapper"
discard "forward decl of vtkProperty"
type
  vtkActor* {.importcpp: "vtkActor", header: "vtkActor.h", bycopy.} = object of vtkProp3D
    vtkActor* {.importc: "vtkActor".}: VTK_NEWINSTANCE
    ##  Bounds are cached in an actor - the MapperBounds are also cache to
    ##  help know when the Bounds need to be recomputed.

  vtkActorSuperclass* = vtkProp3D

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkActor::IsTypeOf(@)",
    header: "vtkActor.h".}
proc IsA*(this: var vtkActor; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkActor.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkActor {.
    importcpp: "vtkActor::SafeDownCast(@)", header: "vtkActor.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkActor :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkProp3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkActor :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkActor :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkActor; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkActor.h".}
proc New*(): ptr vtkActor {.importcpp: "vtkActor::New(@)", header: "vtkActor.h".}
proc GetActors*(this: var vtkActor; a2: ptr vtkPropCollection) {.
    importcpp: "GetActors", header: "vtkActor.h".}
proc RenderOpaqueGeometry*(this: var vtkActor; viewport: ptr vtkViewport): cint {.
    importcpp: "RenderOpaqueGeometry", header: "vtkActor.h".}
proc RenderTranslucentPolygonalGeometry*(this: var vtkActor;
                                        viewport: ptr vtkViewport): cint {.
    importcpp: "RenderTranslucentPolygonalGeometry", header: "vtkActor.h".}
proc HasTranslucentPolygonalGeometry*(this: var vtkActor): vtkTypeBool {.
    importcpp: "HasTranslucentPolygonalGeometry", header: "vtkActor.h".}
proc HasOpaqueGeometry*(this: var vtkActor): vtkTypeBool {.
    importcpp: "HasOpaqueGeometry", header: "vtkActor.h".}
proc Render*(this: var vtkActor; a2: ptr vtkRenderer; a3: ptr vtkMapper) {.
    importcpp: "Render", header: "vtkActor.h".}
proc ShallowCopy*(this: var vtkActor; prop: ptr vtkProp) {.importcpp: "ShallowCopy",
    header: "vtkActor.h".}
proc ReleaseGraphicsResources*(this: var vtkActor; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkActor.h".}
proc SetProperty*(this: var vtkActor; lut: ptr vtkProperty) {.importcpp: "SetProperty",
    header: "vtkActor.h".}
proc GetProperty*(this: var vtkActor): ptr vtkProperty {.importcpp: "GetProperty",
    header: "vtkActor.h".}
proc MakeProperty*(this: var vtkActor): ptr vtkProperty {.importcpp: "MakeProperty",
    header: "vtkActor.h".}
proc SetBackfaceProperty*(this: var vtkActor; lut: ptr vtkProperty) {.
    importcpp: "SetBackfaceProperty", header: "vtkActor.h".}
proc GetnameBackfaceProperty*(this: var vtkActor): ptr vtkProperty {.
    importcpp: "GetnameBackfaceProperty", header: "vtkActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the texture object to control rendering texture maps.  This will
  ##  be a vtkTexture object. An actor does not need to have an associated
  ##  texture map and multiple actors can share one texture.
  ##
proc SetTexture*(this: var vtkActor; a2: ptr vtkTexture) {.importcpp: "SetTexture",
    header: "vtkActor.h".}
proc GetnameBackfacePropertyTexture*(this: var vtkActor): ptr vtkTexture {.
    importcpp: "GetnameBackfacePropertyTexture", header: "vtkActor.h".}
  ## /@}
  ## *
  ##  This is the method that is used to connect an actor to the end of a
  ##  visualization pipeline, i.e. the mapper. This should be a subclass
  ##  of vtkMapper. Typically vtkPolyDataMapper and vtkDataSetMapper will
  ##  be used.
  ##
proc SetMapper*(this: var vtkActor; a2: ptr vtkMapper) {.importcpp: "SetMapper",
    header: "vtkActor.h".}
proc GetnameBackfacePropertyTextureMapper*(this: var vtkActor): ptr vtkMapper {.
    importcpp: "GetnameBackfacePropertyTextureMapper", header: "vtkActor.h".}
  ## /@}
  ## *
  ##  Get the bounds for this Actor as (Xmin,Xmax,Ymin,Ymax,Zmin,Zmax). (The
  ##  method GetBounds(double bounds[6]) is available from the superclass.)
  ##
## using statement

## !!!Ignored construct:  double * GetBounds ( ) VTK_SIZEHINT ( 6 ) override ;
## Error: expected ';'!!!

proc ApplyProperties*(this: var vtkActor) {.importcpp: "ApplyProperties",
                                        header: "vtkActor.h".}
proc GetMTime*(this: var vtkActor): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkActor.h".}
proc GetRedrawMTime*(this: var vtkActor): vtkMTimeType {.importcpp: "GetRedrawMTime",
    header: "vtkActor.h".}
## !!!Ignored construct:  /@{ *
##  Force the actor to be treated as opaque or translucent
##  virtual bool GetForceOpaqueForceOpaque ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ForceOpaque  of  << this -> ForceOpaque ) ; return this -> ForceOpaque ; } ;
## Error: expected ';'!!!

proc SetForceOpaque*(this: var vtkActor; _arg: bool) {.importcpp: "SetForceOpaque",
    header: "vtkActor.h".}
proc ForceOpaqueOn*(this: var vtkActor) {.importcpp: "ForceOpaqueOn",
                                      header: "vtkActor.h".}
proc ForceOpaqueOff*(this: var vtkActor) {.importcpp: "ForceOpaqueOff",
                                       header: "vtkActor.h".}
## !!!Ignored construct:  virtual bool GetForceOpaqueForceOpaqueForceTranslucent ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ForceTranslucent  of  << this -> ForceTranslucent ) ; return this -> ForceTranslucent ; } ;
## Error: expected ';'!!!

proc SetForceOpaqueForceTranslucent*(this: var vtkActor; _arg: bool) {.
    importcpp: "SetForceOpaqueForceTranslucent", header: "vtkActor.h".}
proc ForceTranslucentOn*(this: var vtkActor) {.importcpp: "ForceTranslucentOn",
    header: "vtkActor.h".}
proc ForceTranslucentOff*(this: var vtkActor) {.importcpp: "ForceTranslucentOff",
    header: "vtkActor.h".}
  ## /@}
  ## *
  ##  WARNING: INTERNAL METHOD - NOT INTENDED FOR GENERAL USE
  ##  DO NOT USE THIS METHOD OUTSIDE OF THE RENDERING PROCESS
  ##  Used by vtkHardwareSelector to determine if the prop supports hardware
  ##  selection.
  ##
proc GetSupportsSelection*(this: var vtkActor): bool {.
    importcpp: "GetSupportsSelection", header: "vtkActor.h".}
proc ProcessSelectorPixelBuffers*(this: var vtkActor; sel: ptr vtkHardwareSelector;
                                 pixeloffsets: var vector[cuint]) {.
    importcpp: "ProcessSelectorPixelBuffers", header: "vtkActor.h".}
proc IsRenderingTranslucentPolygonalGeometry*(this: var vtkActor): bool {.
    importcpp: "IsRenderingTranslucentPolygonalGeometry", header: "vtkActor.h".}
proc SetIsRenderingTranslucentPolygonalGeometry*(this: var vtkActor; val: bool) {.
    importcpp: "SetIsRenderingTranslucentPolygonalGeometry", header: "vtkActor.h".}