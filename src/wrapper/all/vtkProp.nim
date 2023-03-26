## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkProp.h
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
##  @class   vtkProp
##  @brief   abstract superclass for all actors, volumes and annotations
##
##  vtkProp is an abstract superclass for any objects that can exist in a
##  rendered scene (either 2D or 3D). Instances of vtkProp may respond to
##  various render methods (e.g., RenderOpaqueGeometry()). vtkProp also
##  defines the API for picking, LOD manipulation, and common instance
##  variables that control visibility, picking, and dragging.
##  @sa
##  vtkActor2D vtkActor vtkVolume vtkProp3D
##

import
  vtkObject, vtkRenderingCoreModule

discard "forward decl of vtkAssemblyPath"
discard "forward decl of vtkAssemblyPaths"
discard "forward decl of vtkHardwareSelector"
discard "forward decl of vtkMatrix4x4"
discard "forward decl of vtkPropCollection"
discard "forward decl of vtkViewport"
discard "forward decl of vtkWindow"
discard "forward decl of vtkInformation"
discard "forward decl of vtkInformationIntegerKey"
discard "forward decl of vtkInformationDoubleVectorKey"
discard "forward decl of vtkShaderProperty"
type
  vtkProp* {.importcpp: "vtkProp", header: "vtkProp.h", bycopy.} = object of vtkObject
    vtkProp* {.importc: "vtkProp".}: VTK_NEWINSTANCE
    ##  how many consumers does this object have
    ##  support multi-part props and access to paths of prop
    ##  stuff that follows is used to build the assembly hierarchy
    ##  User-defined shader replacement and uniform variables

  vtkPropSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkProp::IsTypeOf(@)",
    header: "vtkProp.h".}
proc IsA*(this: var vtkProp; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkProp.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkProp {.
    importcpp: "vtkProp::SafeDownCast(@)", header: "vtkProp.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkProp :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkProp :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkProp :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkProp; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkProp.h".}
proc GetActors*(this: var vtkProp; a2: ptr vtkPropCollection) {.importcpp: "GetActors",
    header: "vtkProp.h".}
proc GetActors2D*(this: var vtkProp; a2: ptr vtkPropCollection) {.
    importcpp: "GetActors2D", header: "vtkProp.h".}
proc GetVolumes*(this: var vtkProp; a2: ptr vtkPropCollection) {.
    importcpp: "GetVolumes", header: "vtkProp.h".}
proc SetVisibility*(this: var vtkProp; _arg: vtkTypeBool) {.
    importcpp: "SetVisibility", header: "vtkProp.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Visibility  of  << this -> Visibility ) ; return this -> Visibility ; } ;
## Error: expected ';'!!!

proc VisibilityOn*(this: var vtkProp) {.importcpp: "VisibilityOn", header: "vtkProp.h".}
proc VisibilityOff*(this: var vtkProp) {.importcpp: "VisibilityOff",
                                     header: "vtkProp.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the pickable instance variable.  This determines if the vtkProp
  ##  can be picked (typically using the mouse). Also see dragable.
  ##  Initial value is true.
  ##
proc SetVisibilityPickable*(this: var vtkProp; _arg: vtkTypeBool) {.
    importcpp: "SetVisibilityPickable", header: "vtkProp.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetVisibilityPickable ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Pickable  of  << this -> Pickable ) ; return this -> Pickable ; } ;
## Error: expected ';'!!!

proc PickableOn*(this: var vtkProp) {.importcpp: "PickableOn", header: "vtkProp.h".}
proc PickableOff*(this: var vtkProp) {.importcpp: "PickableOff", header: "vtkProp.h".}
  ## /@}
  ## *
  ##  Method fires PickEvent if the prop is picked.
  ##
proc Pick*(this: var vtkProp) {.importcpp: "Pick", header: "vtkProp.h".}
proc SetVisibilityPickableDragable*(this: var vtkProp; _arg: vtkTypeBool) {.
    importcpp: "SetVisibilityPickableDragable", header: "vtkProp.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetVisibilityPickableDragable ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Dragable  of  << this -> Dragable ) ; return this -> Dragable ; } ;
## Error: expected ';'!!!

proc DragableOn*(this: var vtkProp) {.importcpp: "DragableOn", header: "vtkProp.h".}
proc DragableOff*(this: var vtkProp) {.importcpp: "DragableOff", header: "vtkProp.h".}
  ## /@}
  ## *
  ##  Return the mtime of anything that would cause the rendered image to
  ##  appear differently. Usually this involves checking the mtime of the
  ##  prop plus anything else it depends on such as properties, textures
  ##  etc.
  ##
proc GetRedrawMTime*(this: var vtkProp): vtkMTimeType {.importcpp: "GetRedrawMTime",
    header: "vtkProp.h".}
proc SetVisibilityPickableDragableUseBounds*(this: var vtkProp; _arg: bool) {.
    importcpp: "SetVisibilityPickableDragableUseBounds", header: "vtkProp.h".}
## !!!Ignored construct:  virtual bool GetVisibilityPickableDragableUseBounds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseBounds  of  << this -> UseBounds ) ; return this -> UseBounds ; } ;
## Error: expected ';'!!!

proc UseBoundsOn*(this: var vtkProp) {.importcpp: "UseBoundsOn", header: "vtkProp.h".}
proc UseBoundsOff*(this: var vtkProp) {.importcpp: "UseBoundsOff", header: "vtkProp.h".}
  ## /@}
  ## *
  ##  Get the bounds for this Prop as (Xmin,Xmax,Ymin,Ymax,Zmin,Zmax).
  ##  in world coordinates. NULL means that the bounds are not defined.
  ##
## !!!Ignored construct:  virtual double * GetBounds ( ) VTK_SIZEHINT ( 6 ) { return nullptr ; } *
##  Shallow copy of this vtkProp.
##  virtual void ShallowCopy ( vtkProp * prop ) ;
## Error: expected ';'!!!

proc InitPathTraversal*(this: var vtkProp) {.importcpp: "InitPathTraversal",
    header: "vtkProp.h".}
proc GetNextPath*(this: var vtkProp): ptr vtkAssemblyPath {.importcpp: "GetNextPath",
    header: "vtkProp.h".}
proc GetNumberOfPaths*(this: var vtkProp): cint {.importcpp: "GetNumberOfPaths",
    header: "vtkProp.h".}
proc PokeMatrix*(this: var vtkProp; vtkNotUsed: proc (a1: matrix): ptr vtkMatrix4x4) {.
    importcpp: "PokeMatrix", header: "vtkProp.h".}
proc GetMatrix*(this: var vtkProp): ptr vtkMatrix4x4 {.importcpp: "GetMatrix",
    header: "vtkProp.h".}
proc GetnamePropertyKeys*(this: var vtkProp): ptr vtkInformation {.
    importcpp: "GetnamePropertyKeys", header: "vtkProp.h".}
proc SetPropertyKeys*(this: var vtkProp; keys: ptr vtkInformation) {.
    importcpp: "SetPropertyKeys", header: "vtkProp.h".}
proc HasKeys*(this: var vtkProp; requiredKeys: ptr vtkInformation): bool {.
    importcpp: "HasKeys", header: "vtkProp.h".}
proc GeneralTextureUnit*(): ptr vtkInformationIntegerKey {.
    importcpp: "vtkProp::GeneralTextureUnit(@)", header: "vtkProp.h".}
proc GeneralTextureTransform*(): ptr vtkInformationDoubleVectorKey {.
    importcpp: "vtkProp::GeneralTextureTransform(@)", header: "vtkProp.h".}
proc RenderOpaqueGeometry*(this: var vtkProp; a2: ptr vtkViewport): cint {.
    importcpp: "RenderOpaqueGeometry", header: "vtkProp.h".}
proc RenderTranslucentPolygonalGeometry*(this: var vtkProp; a2: ptr vtkViewport): cint {.
    importcpp: "RenderTranslucentPolygonalGeometry", header: "vtkProp.h".}
proc RenderVolumetricGeometry*(this: var vtkProp; a2: ptr vtkViewport): cint {.
    importcpp: "RenderVolumetricGeometry", header: "vtkProp.h".}
proc RenderOverlay*(this: var vtkProp; a2: ptr vtkViewport): cint {.
    importcpp: "RenderOverlay", header: "vtkProp.h".}
proc RenderFilteredOpaqueGeometry*(this: var vtkProp; v: ptr vtkViewport;
                                  requiredKeys: ptr vtkInformation): bool {.
    importcpp: "RenderFilteredOpaqueGeometry", header: "vtkProp.h".}
proc RenderFilteredTranslucentPolygonalGeometry*(this: var vtkProp;
    v: ptr vtkViewport; requiredKeys: ptr vtkInformation): bool {.
    importcpp: "RenderFilteredTranslucentPolygonalGeometry", header: "vtkProp.h".}
proc RenderFilteredVolumetricGeometry*(this: var vtkProp; v: ptr vtkViewport;
                                      requiredKeys: ptr vtkInformation): bool {.
    importcpp: "RenderFilteredVolumetricGeometry", header: "vtkProp.h".}
proc RenderFilteredOverlay*(this: var vtkProp; v: ptr vtkViewport;
                           requiredKeys: ptr vtkInformation): bool {.
    importcpp: "RenderFilteredOverlay", header: "vtkProp.h".}
proc HasTranslucentPolygonalGeometry*(this: var vtkProp): vtkTypeBool {.
    importcpp: "HasTranslucentPolygonalGeometry", header: "vtkProp.h".}
proc HasOpaqueGeometry*(this: var vtkProp): vtkTypeBool {.
    importcpp: "HasOpaqueGeometry", header: "vtkProp.h".}
proc ReleaseGraphicsResources*(this: var vtkProp; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkProp.h".}
proc GetEstimatedRenderTime*(this: var vtkProp; a2: ptr vtkViewport): cdouble {.
    importcpp: "GetEstimatedRenderTime", header: "vtkProp.h".}
proc GetEstimatedRenderTime*(this: var vtkProp): cdouble {.
    importcpp: "GetEstimatedRenderTime", header: "vtkProp.h".}
proc SetEstimatedRenderTime*(this: var vtkProp; t: cdouble) {.
    importcpp: "SetEstimatedRenderTime", header: "vtkProp.h".}
proc RestoreEstimatedRenderTime*(this: var vtkProp) {.
    importcpp: "RestoreEstimatedRenderTime", header: "vtkProp.h".}
proc AddEstimatedRenderTime*(this: var vtkProp; t: cdouble;
                            vtkNotUsed: proc (a1: vp): ptr vtkViewport) {.
    importcpp: "AddEstimatedRenderTime", header: "vtkProp.h".}
proc SetAllocatedRenderTime*(this: var vtkProp; t: cdouble;
                            vtkNotUsed: proc (a1: v): ptr vtkViewport) {.
    importcpp: "SetAllocatedRenderTime", header: "vtkProp.h".}
## !!!Ignored construct:  /@} /@{ *
##  WARNING: INTERNAL METHOD - NOT INTENDED FOR GENERAL USE
##  DO NOT USE THIS METHOD OUTSIDE OF THE RENDERING PROCESS
##  virtual double GetVisibilityPickableDragableUseBoundsAllocatedRenderTimeAllocatedRenderTime ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AllocatedRenderTime  of  << this -> AllocatedRenderTime ) ; return this -> AllocatedRenderTime ; } ;
## Error: expected ';'!!!

proc SetRenderTimeMultiplier*(this: var vtkProp; t: cdouble) {.
    importcpp: "SetRenderTimeMultiplier", header: "vtkProp.h".}
## !!!Ignored construct:  virtual double GetVisibilityPickableDragableUseBoundsAllocatedRenderTimeAllocatedRenderTimeRenderTimeMultiplier ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RenderTimeMultiplier  of  << this -> RenderTimeMultiplier ) ; return this -> RenderTimeMultiplier ; } ;
## Error: expected ';'!!!

proc BuildPaths*(this: var vtkProp; paths: ptr vtkAssemblyPaths;
                path: ptr vtkAssemblyPath) {.importcpp: "BuildPaths",
    header: "vtkProp.h".}
proc GetSupportsSelection*(this: var vtkProp): bool {.
    importcpp: "GetSupportsSelection", header: "vtkProp.h".}
proc ProcessSelectorPixelBuffers*(this: var vtkProp; a2: ptr vtkHardwareSelector; ##  sel
                                 a3: var vector[cuint]) {.
    importcpp: "ProcessSelectorPixelBuffers", header: "vtkProp.h".}
  ##  pixeloffsets
## !!!Ignored construct:  /@{ *
##  Get the number of consumers
##  virtual int GetVisibilityPickableDragableUseBoundsAllocatedRenderTimeAllocatedRenderTimeRenderTimeMultiplierNumberOfConsumersNumberOfConsumers ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfConsumers  of  << this -> NumberOfConsumers ) ; return this -> NumberOfConsumers ; } ;
## Error: expected ';'!!!

proc AddConsumer*(this: var vtkProp; c: ptr vtkObject) {.importcpp: "AddConsumer",
    header: "vtkProp.h".}
proc RemoveConsumer*(this: var vtkProp; c: ptr vtkObject) {.
    importcpp: "RemoveConsumer", header: "vtkProp.h".}
proc GetConsumer*(this: var vtkProp; i: cint): ptr vtkObject {.importcpp: "GetConsumer",
    header: "vtkProp.h".}
proc IsConsumer*(this: var vtkProp; c: ptr vtkObject): cint {.importcpp: "IsConsumer",
    header: "vtkProp.h".}
proc SetShaderProperty*(this: var vtkProp; property: ptr vtkShaderProperty) {.
    importcpp: "SetShaderProperty", header: "vtkProp.h".}
proc GetShaderProperty*(this: var vtkProp): ptr vtkShaderProperty {.
    importcpp: "GetShaderProperty", header: "vtkProp.h".}
proc IsRenderingTranslucentPolygonalGeometry*(this: var vtkProp): bool {.
    importcpp: "IsRenderingTranslucentPolygonalGeometry", header: "vtkProp.h".}