## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCompositeDataDisplayAttributes.h
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
##  @class   vtkCompositeDataDisplayAttributes
##  @brief   Rendering attributes for a multi-block dataset.
##
##  The vtkCompositeDataDisplayAttributes class stores display attributes
##  for individual blocks in a multi-block dataset. It uses the actual data
##  block's pointer as a key (vtkDataObject*).
##
##  @warning It is considered unsafe to dereference key pointers at any time,
##  they should only serve as keys to access the internal map.
##

import
  vtkColor, vtkObject, vtkRenderingCoreModule

discard "forward decl of vtkBoundingBox"
discard "forward decl of vtkDataObject"
type
  vtkCompositeDataDisplayAttributes* {.importcpp: "vtkCompositeDataDisplayAttributes", header: "vtkCompositeDataDisplayAttributes.h",
                                      bycopy.} = object of vtkObject
    vtkCompositeDataDisplayAttributes* {.importc: "vtkCompositeDataDisplayAttributes".}: VTK_NEWINSTANCE


proc New*(): ptr vtkCompositeDataDisplayAttributes {.
    importcpp: "vtkCompositeDataDisplayAttributes::New(@)",
    header: "vtkCompositeDataDisplayAttributes.h".}
type
  vtkCompositeDataDisplayAttributesSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCompositeDataDisplayAttributes::IsTypeOf(@)",
    header: "vtkCompositeDataDisplayAttributes.h".}
proc IsA*(this: var vtkCompositeDataDisplayAttributes; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkCompositeDataDisplayAttributes.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCompositeDataDisplayAttributes {.
    importcpp: "vtkCompositeDataDisplayAttributes::SafeDownCast(@)",
    header: "vtkCompositeDataDisplayAttributes.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCompositeDataDisplayAttributes :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCompositeDataDisplayAttributes :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCompositeDataDisplayAttributes :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCompositeDataDisplayAttributes; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkCompositeDataDisplayAttributes.h".}
proc HasBlockVisibilities*(this: vtkCompositeDataDisplayAttributes): bool {.
    noSideEffect, importcpp: "HasBlockVisibilities",
    header: "vtkCompositeDataDisplayAttributes.h".}
proc SetBlockVisibility*(this: var vtkCompositeDataDisplayAttributes;
                        data_object: ptr vtkDataObject; visible: bool) {.
    importcpp: "SetBlockVisibility", header: "vtkCompositeDataDisplayAttributes.h".}
proc GetBlockVisibility*(this: vtkCompositeDataDisplayAttributes;
                        data_object: ptr vtkDataObject): bool {.noSideEffect,
    importcpp: "GetBlockVisibility", header: "vtkCompositeDataDisplayAttributes.h".}
proc HasBlockVisibility*(this: vtkCompositeDataDisplayAttributes;
                        data_object: ptr vtkDataObject): bool {.noSideEffect,
    importcpp: "HasBlockVisibility", header: "vtkCompositeDataDisplayAttributes.h".}
proc RemoveBlockVisibility*(this: var vtkCompositeDataDisplayAttributes;
                           data_object: ptr vtkDataObject) {.
    importcpp: "RemoveBlockVisibility",
    header: "vtkCompositeDataDisplayAttributes.h".}
proc RemoveBlockVisibilities*(this: var vtkCompositeDataDisplayAttributes) {.
    importcpp: "RemoveBlockVisibilities",
    header: "vtkCompositeDataDisplayAttributes.h".}
proc HasBlockPickabilities*(this: vtkCompositeDataDisplayAttributes): bool {.
    noSideEffect, importcpp: "HasBlockPickabilities",
    header: "vtkCompositeDataDisplayAttributes.h".}
proc SetBlockPickability*(this: var vtkCompositeDataDisplayAttributes;
                         data_object: ptr vtkDataObject; visible: bool) {.
    importcpp: "SetBlockPickability",
    header: "vtkCompositeDataDisplayAttributes.h".}
proc GetBlockPickability*(this: vtkCompositeDataDisplayAttributes;
                         data_object: ptr vtkDataObject): bool {.noSideEffect,
    importcpp: "GetBlockPickability",
    header: "vtkCompositeDataDisplayAttributes.h".}
proc HasBlockPickability*(this: vtkCompositeDataDisplayAttributes;
                         data_object: ptr vtkDataObject): bool {.noSideEffect,
    importcpp: "HasBlockPickability",
    header: "vtkCompositeDataDisplayAttributes.h".}
proc RemoveBlockPickability*(this: var vtkCompositeDataDisplayAttributes;
                            data_object: ptr vtkDataObject) {.
    importcpp: "RemoveBlockPickability",
    header: "vtkCompositeDataDisplayAttributes.h".}
proc RemoveBlockPickabilities*(this: var vtkCompositeDataDisplayAttributes) {.
    importcpp: "RemoveBlockPickabilities",
    header: "vtkCompositeDataDisplayAttributes.h".}
proc SetBlockColor*(this: var vtkCompositeDataDisplayAttributes;
                   data_object: ptr vtkDataObject; color: array[3, cdouble]) {.
    importcpp: "SetBlockColor", header: "vtkCompositeDataDisplayAttributes.h".}
proc GetBlockColor*(this: vtkCompositeDataDisplayAttributes;
                   data_object: ptr vtkDataObject; color: array[3, cdouble]) {.
    noSideEffect, importcpp: "GetBlockColor",
    header: "vtkCompositeDataDisplayAttributes.h".}
proc GetBlockColor*(this: vtkCompositeDataDisplayAttributes;
                   data_object: ptr vtkDataObject): vtkColor3d {.noSideEffect,
    importcpp: "GetBlockColor", header: "vtkCompositeDataDisplayAttributes.h".}
proc HasBlockColors*(this: vtkCompositeDataDisplayAttributes): bool {.noSideEffect,
    importcpp: "HasBlockColors", header: "vtkCompositeDataDisplayAttributes.h".}
proc HasBlockColor*(this: vtkCompositeDataDisplayAttributes;
                   data_object: ptr vtkDataObject): bool {.noSideEffect,
    importcpp: "HasBlockColor", header: "vtkCompositeDataDisplayAttributes.h".}
proc RemoveBlockColor*(this: var vtkCompositeDataDisplayAttributes;
                      data_object: ptr vtkDataObject) {.
    importcpp: "RemoveBlockColor", header: "vtkCompositeDataDisplayAttributes.h".}
proc RemoveBlockColors*(this: var vtkCompositeDataDisplayAttributes) {.
    importcpp: "RemoveBlockColors", header: "vtkCompositeDataDisplayAttributes.h".}
proc SetBlockOpacity*(this: var vtkCompositeDataDisplayAttributes;
                     data_object: ptr vtkDataObject; opacity: cdouble) {.
    importcpp: "SetBlockOpacity", header: "vtkCompositeDataDisplayAttributes.h".}
proc GetBlockOpacity*(this: vtkCompositeDataDisplayAttributes;
                     data_object: ptr vtkDataObject): cdouble {.noSideEffect,
    importcpp: "GetBlockOpacity", header: "vtkCompositeDataDisplayAttributes.h".}
proc HasBlockOpacities*(this: vtkCompositeDataDisplayAttributes): bool {.
    noSideEffect, importcpp: "HasBlockOpacities",
    header: "vtkCompositeDataDisplayAttributes.h".}
proc HasBlockOpacity*(this: vtkCompositeDataDisplayAttributes;
                     data_object: ptr vtkDataObject): bool {.noSideEffect,
    importcpp: "HasBlockOpacity", header: "vtkCompositeDataDisplayAttributes.h".}
proc RemoveBlockOpacity*(this: var vtkCompositeDataDisplayAttributes;
                        data_object: ptr vtkDataObject) {.
    importcpp: "RemoveBlockOpacity", header: "vtkCompositeDataDisplayAttributes.h".}
proc RemoveBlockOpacities*(this: var vtkCompositeDataDisplayAttributes) {.
    importcpp: "RemoveBlockOpacities",
    header: "vtkCompositeDataDisplayAttributes.h".}
proc SetBlockMaterial*(this: var vtkCompositeDataDisplayAttributes;
                      data_object: ptr vtkDataObject; material: string) {.
    importcpp: "SetBlockMaterial", header: "vtkCompositeDataDisplayAttributes.h".}
proc GetBlockMaterial*(this: vtkCompositeDataDisplayAttributes;
                      data_object: ptr vtkDataObject): string {.noSideEffect,
    importcpp: "GetBlockMaterial", header: "vtkCompositeDataDisplayAttributes.h".}
proc HasBlockMaterials*(this: vtkCompositeDataDisplayAttributes): bool {.
    noSideEffect, importcpp: "HasBlockMaterials",
    header: "vtkCompositeDataDisplayAttributes.h".}
proc HasBlockMaterial*(this: vtkCompositeDataDisplayAttributes;
                      data_object: ptr vtkDataObject): bool {.noSideEffect,
    importcpp: "HasBlockMaterial", header: "vtkCompositeDataDisplayAttributes.h".}
proc RemoveBlockMaterial*(this: var vtkCompositeDataDisplayAttributes;
                         data_object: ptr vtkDataObject) {.
    importcpp: "RemoveBlockMaterial",
    header: "vtkCompositeDataDisplayAttributes.h".}
proc RemoveBlockMaterials*(this: var vtkCompositeDataDisplayAttributes) {.
    importcpp: "RemoveBlockMaterials",
    header: "vtkCompositeDataDisplayAttributes.h".}
proc ComputeVisibleBounds*(cda: ptr vtkCompositeDataDisplayAttributes;
                          dobj: ptr vtkDataObject; bounds: array[6, cdouble]) {.
    importcpp: "vtkCompositeDataDisplayAttributes::ComputeVisibleBounds(@)",
    header: "vtkCompositeDataDisplayAttributes.h".}
proc DataObjectFromIndex*(flat_index: cuint; parent_obj: ptr vtkDataObject;
                         current_flat_index: cuint = 0): ptr vtkDataObject {.
    importcpp: "vtkCompositeDataDisplayAttributes::DataObjectFromIndex(@)",
    header: "vtkCompositeDataDisplayAttributes.h".}
proc VisitVisibilities*(this: var vtkCompositeDataDisplayAttributes; visitor: function[
    proc (a1: ptr vtkDataObject; a2: bool): bool]) {.importcpp: "VisitVisibilities",
    header: "vtkCompositeDataDisplayAttributes.h".}
type
  BoolMap* = unordered_map[ptr vtkDataObject, bool]
  DoubleMap* = unordered_map[ptr vtkDataObject, cdouble]
  ColorMap* = unordered_map[ptr vtkDataObject, vtkColor3d]
  StringMap* = unordered_map[ptr vtkDataObject, string]
