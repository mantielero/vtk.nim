## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLabeledTreeMapDataMapper.h
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
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkLabeledTreeMapDataMapper
##  @brief   draw text labels on a tree map
##
##
##  vtkLabeledTreeMapDataMapper is a mapper that renders text on a tree map.
##  A tree map is a vtkTree with an associated 4-tuple array
##  used for storing the boundary rectangle for each vertex in the tree.
##  The user must specify the array name used for storing the rectangles.
##
##  The mapper iterates through the tree and attempts and renders a label
##  inside the vertex's rectangle as long as the following conditions hold:
##  1. The vertex level is within the range of levels specified for labeling.
##  2. The label can fully fit inside its box.
##  3. The label does not overlap an ancestor's label.
##
##  @sa
##  vtkLabeledDataMapper
##
##  @par Thanks:
##  Thanks to Patricia Crossno, Ken Moreland, Andrew Wilson and Brian Wylie from
##  Sandia National Laboratories for their help in developing this class.
##

import
  vtkLabeledDataMapper, vtkRenderingLabelModule

discard "forward decl of vtkTree"
discard "forward decl of vtkPoints"
discard "forward decl of vtkCoordinate"
discard "forward decl of vtkFloatArray"
discard "forward decl of vtkStringArray"
discard "forward decl of vtkIdList"
type
  vtkLabeledTreeMapDataMapper* {.importcpp: "vtkLabeledTreeMapDataMapper",
                                header: "vtkLabeledTreeMapDataMapper.h", bycopy.} = object of vtkLabeledDataMapper
    vtkLabeledTreeMapDataMapper* {.importc: "vtkLabeledTreeMapDataMapper".}: VTK_NEWINSTANCE


proc New*(): ptr vtkLabeledTreeMapDataMapper {.
    importcpp: "vtkLabeledTreeMapDataMapper::New(@)",
    header: "vtkLabeledTreeMapDataMapper.h".}
type
  vtkLabeledTreeMapDataMapperSuperclass* = vtkLabeledDataMapper

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkLabeledTreeMapDataMapper::IsTypeOf(@)",
    header: "vtkLabeledTreeMapDataMapper.h".}
proc IsA*(this: var vtkLabeledTreeMapDataMapper; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkLabeledTreeMapDataMapper.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkLabeledTreeMapDataMapper {.
    importcpp: "vtkLabeledTreeMapDataMapper::SafeDownCast(@)",
    header: "vtkLabeledTreeMapDataMapper.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkLabeledTreeMapDataMapper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkLabeledDataMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLabeledTreeMapDataMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLabeledTreeMapDataMapper :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkLabeledTreeMapDataMapper; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkLabeledTreeMapDataMapper.h".}
proc RenderOpaqueGeometry*(this: var vtkLabeledTreeMapDataMapper;
                          viewport: ptr vtkViewport; actor: ptr vtkActor2D) {.
    importcpp: "RenderOpaqueGeometry", header: "vtkLabeledTreeMapDataMapper.h".}
proc RenderOverlay*(this: var vtkLabeledTreeMapDataMapper;
                   viewport: ptr vtkViewport; actor: ptr vtkActor2D) {.
    importcpp: "RenderOverlay", header: "vtkLabeledTreeMapDataMapper.h".}
proc GetInputTree*(this: var vtkLabeledTreeMapDataMapper): ptr vtkTree {.
    importcpp: "GetInputTree", header: "vtkLabeledTreeMapDataMapper.h".}
proc SetRectanglesArrayName*(this: var vtkLabeledTreeMapDataMapper; name: cstring) {.
    importcpp: "SetRectanglesArrayName", header: "vtkLabeledTreeMapDataMapper.h".}
## !!!Ignored construct:  /@{ *
##  Indicates if the label can be displayed clipped by the Window
##  mode = 0 - ok to clip labels
##  1 - auto center labels w/r to the area of the vertex's clipped region
##  virtual int GetClipTextModeClipTextMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ClipTextMode  of  << this -> ClipTextMode ) ; return this -> ClipTextMode ; } ;
## Error: expected ';'!!!

proc SetClipTextMode*(this: var vtkLabeledTreeMapDataMapper; _arg: cint) {.
    importcpp: "SetClipTextMode", header: "vtkLabeledTreeMapDataMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  Indicates if the label can be moved by its ancestors
  ##
## !!!Ignored construct:  virtual int GetClipTextModeClipTextModeChildMotion ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ChildMotion  of  << this -> ChildMotion ) ; return this -> ChildMotion ; } ;
## Error: expected ';'!!!

proc SetClipTextModeChildMotion*(this: var vtkLabeledTreeMapDataMapper; _arg: cint) {.
    importcpp: "SetClipTextModeChildMotion",
    header: "vtkLabeledTreeMapDataMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  Indicates at which level labeling should be dynamic
  ##
## !!!Ignored construct:  virtual int GetClipTextModeClipTextModeChildMotionDynamicLevel ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DynamicLevel  of  << this -> DynamicLevel ) ; return this -> DynamicLevel ; } ;
## Error: expected ';'!!!

proc SetClipTextModeChildMotionDynamicLevel*(
    this: var vtkLabeledTreeMapDataMapper; _arg: cint) {.
    importcpp: "SetClipTextModeChildMotionDynamicLevel",
    header: "vtkLabeledTreeMapDataMapper.h".}
  ## /@}
  ## *
  ##  Release any graphics resources that are being consumed by this actor.
  ##
proc ReleaseGraphicsResources*(this: var vtkLabeledTreeMapDataMapper;
                              a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkLabeledTreeMapDataMapper.h".}
proc SetFontSizeRange*(this: var vtkLabeledTreeMapDataMapper; maxSize: cint;
                      minSize: cint; delta: cint = 4) {.importcpp: "SetFontSizeRange",
    header: "vtkLabeledTreeMapDataMapper.h".}
proc GetFontSizeRange*(this: var vtkLabeledTreeMapDataMapper; range: array[3, cint]) {.
    importcpp: "GetFontSizeRange", header: "vtkLabeledTreeMapDataMapper.h".}
proc SetLevelRange*(this: var vtkLabeledTreeMapDataMapper; startLevel: cint;
                   endLevel: cint) {.importcpp: "SetLevelRange",
                                   header: "vtkLabeledTreeMapDataMapper.h".}
proc GetLevelRange*(this: var vtkLabeledTreeMapDataMapper; range: array[2, cint]) {.
    importcpp: "GetLevelRange", header: "vtkLabeledTreeMapDataMapper.h".}