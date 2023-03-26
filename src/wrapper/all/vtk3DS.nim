## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtk3DS.h
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

## !!!Ignored construct:  # vtk3DS_h [NewLine] # vtk3DS_h [NewLine] # < ctype . h > [NewLine] class vtkLight ;
## Error: did not expect [NewLine]!!!

discard "forward decl of vtkCamera"
discard "forward decl of vtkProperty"
type
  vtk3DSVector* = array[3, cfloat]

##  A generic list type

template VTK_LIST_INSERT*(root, node: untyped): untyped =
  list_insert(cast[ptr ptr vtk3DSList](addr(root)),
              reinterpret_cast[ptr vtk3DSList](node))

template VTK_LIST_FIND*(root, name: untyped): untyped =
  list_find(cast[ptr ptr vtk3DSList](addr(root)), name)

template VTK_LIST_DELETE*(root, node: untyped): untyped =
  list_delete(cast[ptr ptr vtk3DSList](addr(root)), cast[ptr vtk3DSList](node))

template VTK_LIST_KILL*(root: untyped): untyped =
  list_kill(cast[ptr ptr vtk3DSList](addr(root)))

const
  VTK_LIST_FIELDS* = char

name[80]
var next* {.importcpp: "next", header: "vtk3DS.h".}: pointer

## !!!Ignored construct:  [NewLine] typedef unsigned char byte ;
## Error: did not expect [NewLine]!!!

type
  word* = cushort
  dword* = cuint
  vtk3DSList_t* {.importcpp: "vtk3DSList_t", header: "vtk3DS.h", bycopy.} = object


## !!!Ignored construct:  VTK_LIST_FIELDS }
## Error: identifier expected, but got: }!!!

type
  vtk3DSList* = vtk3DSList_t

## ignored statement

type
  vtk3DSFace_t* {.importcpp: "vtk3DSFace_t", header: "vtk3DS.h", bycopy.} = object
    a* {.importc: "a".}: cint
    b* {.importc: "b".}: cint
    c* {.importc: "c".}: cint

  vtk3DSFace* = vtk3DSFace_t

## ignored statement

type
  vtk3DSColour_t* {.importcpp: "vtk3DSColour_t", header: "vtk3DS.h", bycopy.} = object
    red* {.importc: "red".}: cfloat
    green* {.importc: "green".}: cfloat
    blue* {.importc: "blue".}: cfloat

  vtk3DSColour* = vtk3DSColour_t

##  Omni light command

type
  vtk3DSOmniLight_t* {.importcpp: "vtk3DSOmniLight_t", header: "vtk3DS.h", bycopy.} = object
    vtk3DSVector* {.importc: "vtk3DSVector".}: VTK_LIST_FIELDS
    col* {.importc: "col".}: vtk3DSColour ##  Light colour
    aLight* {.importc: "aLight".}: ptr vtkLight


## !!!Ignored construct:  pos ;
## Error: identifier expected, but got: ;!!!

type
  vtk3DSOmniLight* = vtk3DSOmniLight_t

##  Spotlight command

type
  vtk3DSSpotLight_t* {.importcpp: "vtk3DSSpotLight_t", header: "vtk3DS.h", bycopy.} = object
    vtk3DSVector* {.importc: "vtk3DSVector".}: VTK_LIST_FIELDS
    target* {.importc: "target".}: vtk3DSVector ##  Spotlight target location
    col* {.importc: "col".}: vtk3DSColour ##  Spotlight colour
    hotspot* {.importc: "hotspot".}: cfloat ##  Hotspot angle (degrees)
    falloff* {.importc: "falloff".}: cfloat ##  Falloff angle (degrees)
    shadow_flag* {.importc: "shadow_flag".}: cint ##  Shadow flag (not used)
    aLight* {.importc: "aLight".}: ptr vtkLight


## !!!Ignored construct:  pos ;
## Error: identifier expected, but got: ;!!!

type
  vtk3DSSpotLight* = vtk3DSSpotLight_t

##  Camera command

type
  vtk3DSCamera_t* {.importcpp: "vtk3DSCamera_t", header: "vtk3DS.h", bycopy.} = object
    vtk3DSVector* {.importc: "vtk3DSVector".}: VTK_LIST_FIELDS
    target* {.importc: "target".}: vtk3DSVector ##  Camera target
    bank* {.importc: "bank".}: cfloat ##  Banking angle (degrees)
    lens* {.importc: "lens".}: cfloat ##  Camera lens size (mm)
    aCamera* {.importc: "aCamera".}: ptr vtkCamera


## !!!Ignored construct:  pos ;
## Error: identifier expected, but got: ;!!!

type
  vtk3DSCamera* = vtk3DSCamera_t

##  Material list

type
  vtk3DSMaterial_t* {.importcpp: "vtk3DSMaterial_t", header: "vtk3DS.h", bycopy.} = object
    int* {.importc: "int".}: VTK_LIST_FIELDS


## !!!Ignored construct:  external ;
## Error: identifier expected, but got: ;!!!

type
  vtk3DSMaterial* = vtk3DSMaterial_t

##  Object summary

type
  vtk3DSSummary_t* {.importcpp: "vtk3DSSummary_t", header: "vtk3DS.h", bycopy.} = object
    vtk3DSVector* {.importc: "vtk3DSVector".}: VTK_LIST_FIELDS
    lengths* {.importc: "lengths".}: vtk3DSVector ##  Max value of object extents


## !!!Ignored construct:  center ;
## Error: identifier expected, but got: ;!!!

type
  vtk3DSSummary* = vtk3DSSummary_t

##  Material property

type
  vtk3DSMatProp_t* {.importcpp: "vtk3DSMatProp_t", header: "vtk3DS.h", bycopy.} = object
    vtk3DSColour* {.importc: "vtk3DSColour".}: VTK_LIST_FIELDS
    diffuse* {.importc: "diffuse".}: vtk3DSColour
    specular* {.importc: "specular".}: vtk3DSColour
    shininess* {.importc: "shininess".}: cfloat
    transparency* {.importc: "transparency".}: cfloat
    reflection* {.importc: "reflection".}: cfloat
    self_illum* {.importc: "self_illum".}: cint
    tex_map* {.importc: "tex_map".}: array[40, char]
    tex_strength* {.importc: "tex_strength".}: cfloat
    bump_map* {.importc: "bump_map".}: array[40, char]
    bump_strength* {.importc: "bump_strength".}: cfloat
    aProperty* {.importc: "aProperty".}: ptr vtkProperty


## !!!Ignored construct:  ambient ;
## Error: identifier expected, but got: ;!!!

type
  vtk3DSMatProp* = vtk3DSMatProp_t

## ignored statement

discard "forward decl of vtkActor"
discard "forward decl of vtkPolyDataMapper"
discard "forward decl of vtkPolyDataNormals"
discard "forward decl of vtkStripper"
discard "forward decl of vtkPoints"
discard "forward decl of vtkCellArray"
discard "forward decl of vtkPolyData"
type
  vtk3DSMesh_t* {.importcpp: "vtk3DSMesh_t", header: "vtk3DS.h", bycopy.} = object
    int* {.importc: "int".}: VTK_LIST_FIELDS
    vertex* {.importc: "vertex".}: ptr vtk3DSVector ##  List of object vertices
    faces* {.importc: "faces".}: cint ##  Number of faces
    face* {.importc: "face".}: ptr vtk3DSFace ##  List of object faces
    mtl* {.importc: "mtl".}: ptr ptr vtk3DSMaterial ##  Materials for each face
    hidden* {.importc: "hidden".}: cint ##  Hidden flag
    shadow* {.importc: "shadow".}: cint ##  Shadow flag
    anActor* {.importc: "anActor".}: ptr vtkActor
    aMapper* {.importc: "aMapper".}: ptr vtkPolyDataMapper
    aNormals* {.importc: "aNormals".}: ptr vtkPolyDataNormals
    aStripper* {.importc: "aStripper".}: ptr vtkStripper
    aPoints* {.importc: "aPoints".}: ptr vtkPoints
    aCellArray* {.importc: "aCellArray".}: ptr vtkCellArray
    aPolyData* {.importc: "aPolyData".}: ptr vtkPolyData


## !!!Ignored construct:  vertices ;
## Error: identifier expected, but got: ;!!!

type
  vtk3DSMesh* = vtk3DSMesh_t

## ignored statement

type
  vtk3DSChunk_t* {.importcpp: "vtk3DSChunk_t", header: "vtk3DS.h", bycopy.} = object
    start* {.importc: "start".}: dword
    `end`* {.importc: "end".}: dword
    length* {.importc: "length".}: dword
    tag* {.importc: "tag".}: word

  vtk3DSChunk* = vtk3DSChunk_t

## ignored statement

type
  vtk3DSColour_t_24* {.importcpp: "vtk3DSColour_t_24", header: "vtk3DS.h", bycopy.} = object
    red* {.importc: "red".}: byte
    green* {.importc: "green".}: byte
    blue* {.importc: "blue".}: byte

  vtk3DSColour_24* = vtk3DSColour_t_24

## ignored statement

##  VTK-HeaderTest-Exclude: vtk3DS.h
