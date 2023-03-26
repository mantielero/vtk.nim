## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCompositeDataDisplayAttributesLegacy.h
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
##  @class   vtkCompositeDataDisplayAttributesLegacy
##  @brief   rendering attributes for a
##  multi-block dataset.
##
##  The vtkCompositeDataDisplayAttributesLegacy class stores display attributes
##  for individual blocks in a multi-block dataset. Attributes are mapped to
##  blocks through their flat-index; This is the mechanism used in legacy
##  OpenGL classes.
##

import
  vtkColor, vtkObject, vtkRenderingCoreModule

discard "forward decl of vtkBoundingBox"
discard "forward decl of vtkDataObject"
type
  vtkCompositeDataDisplayAttributesLegacy* {.
      importcpp: "vtkCompositeDataDisplayAttributesLegacy",
      header: "vtkCompositeDataDisplayAttributesLegacy.h", bycopy.} = object of vtkObject
    vtkCompositeDataDisplayAttributesLegacy*
        {.importc: "vtkCompositeDataDisplayAttributesLegacy".}: VTK_NEWINSTANCE


proc New*(): ptr vtkCompositeDataDisplayAttributesLegacy {.
    importcpp: "vtkCompositeDataDisplayAttributesLegacy::New(@)",
    header: "vtkCompositeDataDisplayAttributesLegacy.h".}
type
  vtkCompositeDataDisplayAttributesLegacySuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCompositeDataDisplayAttributesLegacy::IsTypeOf(@)",
    header: "vtkCompositeDataDisplayAttributesLegacy.h".}
proc IsA*(this: var vtkCompositeDataDisplayAttributesLegacy; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkCompositeDataDisplayAttributesLegacy.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCompositeDataDisplayAttributesLegacy {.
    importcpp: "vtkCompositeDataDisplayAttributesLegacy::SafeDownCast(@)",
    header: "vtkCompositeDataDisplayAttributesLegacy.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCompositeDataDisplayAttributesLegacy :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCompositeDataDisplayAttributesLegacy :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCompositeDataDisplayAttributesLegacy :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCompositeDataDisplayAttributesLegacy; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf", header: "vtkCompositeDataDisplayAttributesLegacy.h".}
proc HasBlockVisibilities*(this: vtkCompositeDataDisplayAttributesLegacy): bool {.
    noSideEffect, importcpp: "HasBlockVisibilities",
    header: "vtkCompositeDataDisplayAttributesLegacy.h".}
proc SetBlockVisibility*(this: var vtkCompositeDataDisplayAttributesLegacy;
                        flat_index: cuint; visible: bool) {.
    importcpp: "SetBlockVisibility",
    header: "vtkCompositeDataDisplayAttributesLegacy.h".}
proc GetBlockVisibility*(this: vtkCompositeDataDisplayAttributesLegacy;
                        flat_index: cuint): bool {.noSideEffect,
    importcpp: "GetBlockVisibility",
    header: "vtkCompositeDataDisplayAttributesLegacy.h".}
proc HasBlockVisibility*(this: vtkCompositeDataDisplayAttributesLegacy;
                        flat_index: cuint): bool {.noSideEffect,
    importcpp: "HasBlockVisibility",
    header: "vtkCompositeDataDisplayAttributesLegacy.h".}
proc RemoveBlockVisibility*(this: var vtkCompositeDataDisplayAttributesLegacy;
                           flat_index: cuint) {.
    importcpp: "RemoveBlockVisibility",
    header: "vtkCompositeDataDisplayAttributesLegacy.h".}
proc RemoveBlockVisibilities*(this: var vtkCompositeDataDisplayAttributesLegacy) {.
    importcpp: "RemoveBlockVisibilities",
    header: "vtkCompositeDataDisplayAttributesLegacy.h".}
proc HasBlockPickabilities*(this: vtkCompositeDataDisplayAttributesLegacy): bool {.
    noSideEffect, importcpp: "HasBlockPickabilities",
    header: "vtkCompositeDataDisplayAttributesLegacy.h".}
proc SetBlockPickability*(this: var vtkCompositeDataDisplayAttributesLegacy;
                         flat_index: cuint; visible: bool) {.
    importcpp: "SetBlockPickability",
    header: "vtkCompositeDataDisplayAttributesLegacy.h".}
proc GetBlockPickability*(this: vtkCompositeDataDisplayAttributesLegacy;
                         flat_index: cuint): bool {.noSideEffect,
    importcpp: "GetBlockPickability",
    header: "vtkCompositeDataDisplayAttributesLegacy.h".}
proc HasBlockPickability*(this: vtkCompositeDataDisplayAttributesLegacy;
                         flat_index: cuint): bool {.noSideEffect,
    importcpp: "HasBlockPickability",
    header: "vtkCompositeDataDisplayAttributesLegacy.h".}
proc RemoveBlockPickability*(this: var vtkCompositeDataDisplayAttributesLegacy;
                            flat_index: cuint) {.
    importcpp: "RemoveBlockPickability",
    header: "vtkCompositeDataDisplayAttributesLegacy.h".}
proc RemoveBlockPickabilities*(this: var vtkCompositeDataDisplayAttributesLegacy) {.
    importcpp: "RemoveBlockPickabilities",
    header: "vtkCompositeDataDisplayAttributesLegacy.h".}
proc SetBlockColor*(this: var vtkCompositeDataDisplayAttributesLegacy;
                   flat_index: cuint; color: array[3, cdouble]) {.
    importcpp: "SetBlockColor",
    header: "vtkCompositeDataDisplayAttributesLegacy.h".}
proc GetBlockColor*(this: vtkCompositeDataDisplayAttributesLegacy;
                   flat_index: cuint; color: array[3, cdouble]) {.noSideEffect,
    importcpp: "GetBlockColor",
    header: "vtkCompositeDataDisplayAttributesLegacy.h".}
proc GetBlockColor*(this: vtkCompositeDataDisplayAttributesLegacy;
                   flat_index: cuint): vtkColor3d {.noSideEffect,
    importcpp: "GetBlockColor",
    header: "vtkCompositeDataDisplayAttributesLegacy.h".}
proc HasBlockColors*(this: vtkCompositeDataDisplayAttributesLegacy): bool {.
    noSideEffect, importcpp: "HasBlockColors",
    header: "vtkCompositeDataDisplayAttributesLegacy.h".}
proc HasBlockColor*(this: vtkCompositeDataDisplayAttributesLegacy;
                   flat_index: cuint): bool {.noSideEffect,
    importcpp: "HasBlockColor",
    header: "vtkCompositeDataDisplayAttributesLegacy.h".}
proc RemoveBlockColor*(this: var vtkCompositeDataDisplayAttributesLegacy;
                      flat_index: cuint) {.importcpp: "RemoveBlockColor",
    header: "vtkCompositeDataDisplayAttributesLegacy.h".}
proc RemoveBlockColors*(this: var vtkCompositeDataDisplayAttributesLegacy) {.
    importcpp: "RemoveBlockColors",
    header: "vtkCompositeDataDisplayAttributesLegacy.h".}
proc SetBlockOpacity*(this: var vtkCompositeDataDisplayAttributesLegacy;
                     flat_index: cuint; opacity: cdouble) {.
    importcpp: "SetBlockOpacity",
    header: "vtkCompositeDataDisplayAttributesLegacy.h".}
proc GetBlockOpacity*(this: vtkCompositeDataDisplayAttributesLegacy;
                     flat_index: cuint): cdouble {.noSideEffect,
    importcpp: "GetBlockOpacity",
    header: "vtkCompositeDataDisplayAttributesLegacy.h".}
proc HasBlockOpacities*(this: vtkCompositeDataDisplayAttributesLegacy): bool {.
    noSideEffect, importcpp: "HasBlockOpacities",
    header: "vtkCompositeDataDisplayAttributesLegacy.h".}
proc HasBlockOpacity*(this: vtkCompositeDataDisplayAttributesLegacy;
                     flat_index: cuint): bool {.noSideEffect,
    importcpp: "HasBlockOpacity",
    header: "vtkCompositeDataDisplayAttributesLegacy.h".}
proc RemoveBlockOpacity*(this: var vtkCompositeDataDisplayAttributesLegacy;
                        flat_index: cuint) {.importcpp: "RemoveBlockOpacity",
    header: "vtkCompositeDataDisplayAttributesLegacy.h".}
proc RemoveBlockOpacities*(this: var vtkCompositeDataDisplayAttributesLegacy) {.
    importcpp: "RemoveBlockOpacities",
    header: "vtkCompositeDataDisplayAttributesLegacy.h".}
proc ComputeVisibleBounds*(cda: ptr vtkCompositeDataDisplayAttributesLegacy;
                          dobj: ptr vtkDataObject; bounds: array[6, cdouble]) {.importcpp: "vtkCompositeDataDisplayAttributesLegacy::ComputeVisibleBounds(@)",
    header: "vtkCompositeDataDisplayAttributesLegacy.h".}