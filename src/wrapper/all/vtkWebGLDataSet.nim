## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkWebGLDataSet.h
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
##  @class   vtkWebGLDataSet
##  @brief   vtkWebGLDataSet represent vertices, lines, polygons, and triangles.
##

import
  vtkObject, vtkWebGLExporterModule, vtkWebGLObject

type
  vtkWebGLDataSet* {.importcpp: "vtkWebGLDataSet", header: "vtkWebGLDataSet.h",
                    bycopy.} = object of vtkObject
    vtkWebGLDataSet* {.importc: "vtkWebGLDataSet".}: VTK_NEWINSTANCE
    ##  Data in binary
    ##  Size of the data in binary


proc New*(): ptr vtkWebGLDataSet {.importcpp: "vtkWebGLDataSet::New(@)",
                               header: "vtkWebGLDataSet.h".}
type
  vtkWebGLDataSetSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkWebGLDataSet::IsTypeOf(@)", header: "vtkWebGLDataSet.h".}
proc IsA*(this: var vtkWebGLDataSet; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkWebGLDataSet.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkWebGLDataSet {.
    importcpp: "vtkWebGLDataSet::SafeDownCast(@)", header: "vtkWebGLDataSet.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkWebGLDataSet :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkWebGLDataSet :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkWebGLDataSet :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkWebGLDataSet; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkWebGLDataSet.h".}
proc SetVertices*(this: var vtkWebGLDataSet; v: ptr cfloat; size: cint) {.
    importcpp: "SetVertices", header: "vtkWebGLDataSet.h".}
proc SetIndexes*(this: var vtkWebGLDataSet; i: ptr cshort; size: cint) {.
    importcpp: "SetIndexes", header: "vtkWebGLDataSet.h".}
proc SetNormals*(this: var vtkWebGLDataSet; n: ptr cfloat) {.importcpp: "SetNormals",
    header: "vtkWebGLDataSet.h".}
proc SetColors*(this: var vtkWebGLDataSet; c: ptr cuchar) {.importcpp: "SetColors",
    header: "vtkWebGLDataSet.h".}
proc SetPoints*(this: var vtkWebGLDataSet; p: ptr cfloat; size: cint) {.
    importcpp: "SetPoints", header: "vtkWebGLDataSet.h".}
proc SetTCoords*(this: var vtkWebGLDataSet; t: ptr cfloat) {.importcpp: "SetTCoords",
    header: "vtkWebGLDataSet.h".}
proc SetMatrix*(this: var vtkWebGLDataSet; m: ptr cfloat) {.importcpp: "SetMatrix",
    header: "vtkWebGLDataSet.h".}
proc SetType*(this: var vtkWebGLDataSet; t: WebGLObjectTypes) {.importcpp: "SetType",
    header: "vtkWebGLDataSet.h".}
proc GetBinaryData*(this: var vtkWebGLDataSet): ptr cuchar {.
    importcpp: "GetBinaryData", header: "vtkWebGLDataSet.h".}
proc GetBinarySize*(this: var vtkWebGLDataSet): cint {.importcpp: "GetBinarySize",
    header: "vtkWebGLDataSet.h".}
proc GenerateBinaryData*(this: var vtkWebGLDataSet) {.
    importcpp: "GenerateBinaryData", header: "vtkWebGLDataSet.h".}
proc HasChanged*(this: var vtkWebGLDataSet): bool {.importcpp: "HasChanged",
    header: "vtkWebGLDataSet.h".}
proc GetMD5*(this: var vtkWebGLDataSet): string {.importcpp: "GetMD5",
    header: "vtkWebGLDataSet.h".}