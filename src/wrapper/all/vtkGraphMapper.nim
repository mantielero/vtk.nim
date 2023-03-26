## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGraphMapper.h
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
##  @class   vtkGraphMapper
##  @brief   map vtkGraph and derived
##  classes to graphics primitives
##
##
##  vtkGraphMapper is a mapper to map vtkGraph
##  (and all derived classes) to graphics primitives.
##

import
  vtkMapper, vtkRenderingCoreModule, vtkSmartPointer

discard "forward decl of vtkActor2D"
discard "forward decl of vtkMapArrayValues"
discard "forward decl of vtkCamera"
discard "forward decl of vtkFollower"
discard "forward decl of vtkGraph"
discard "forward decl of vtkGlyph3D"
discard "forward decl of vtkGraphToPolyData"
discard "forward decl of vtkIconGlyphFilter"
discard "forward decl of vtkCellCenters"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkPolyDataMapper"
discard "forward decl of vtkPolyDataMapper2D"
discard "forward decl of vtkLookupTable"
discard "forward decl of vtkTransformCoordinateSystems"
discard "forward decl of vtkTexture"
discard "forward decl of vtkTexturedActor2D"
discard "forward decl of vtkVertexGlyphFilter"
type
  vtkGraphMapper* {.importcpp: "vtkGraphMapper", header: "vtkGraphMapper.h", bycopy.} = object of vtkMapper
    vtkGraphMapper* {.importc: "vtkGraphMapper".}: VTK_NEWINSTANCE
    ## /@}
    ##  Color maps


proc New*(): ptr vtkGraphMapper {.importcpp: "vtkGraphMapper::New(@)",
                              header: "vtkGraphMapper.h".}
type
  vtkGraphMapperSuperclass* = vtkMapper

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGraphMapper::IsTypeOf(@)", header: "vtkGraphMapper.h".}
proc IsA*(this: var vtkGraphMapper; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkGraphMapper.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGraphMapper {.
    importcpp: "vtkGraphMapper::SafeDownCast(@)", header: "vtkGraphMapper.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGraphMapper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGraphMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGraphMapper :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGraphMapper; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGraphMapper.h".}
proc Render*(this: var vtkGraphMapper; ren: ptr vtkRenderer; act: ptr vtkActor) {.
    importcpp: "Render", header: "vtkGraphMapper.h".}
proc SetVertexColorArrayName*(this: var vtkGraphMapper; name: cstring) {.
    importcpp: "SetVertexColorArrayName", header: "vtkGraphMapper.h".}
proc GetVertexColorArrayName*(this: var vtkGraphMapper): cstring {.
    importcpp: "GetVertexColorArrayName", header: "vtkGraphMapper.h".}
proc SetColorVertices*(this: var vtkGraphMapper; vis: bool) {.
    importcpp: "SetColorVertices", header: "vtkGraphMapper.h".}
proc GetColorVertices*(this: var vtkGraphMapper): bool {.
    importcpp: "GetColorVertices", header: "vtkGraphMapper.h".}
proc ColorVerticesOn*(this: var vtkGraphMapper) {.importcpp: "ColorVerticesOn",
    header: "vtkGraphMapper.h".}
proc ColorVerticesOff*(this: var vtkGraphMapper) {.importcpp: "ColorVerticesOff",
    header: "vtkGraphMapper.h".}
proc SetScaledGlyphs*(this: var vtkGraphMapper; arg: bool) {.
    importcpp: "SetScaledGlyphs", header: "vtkGraphMapper.h".}
## !!!Ignored construct:  virtual bool GetScaledGlyphs ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScaledGlyphs  of  << this -> ScaledGlyphs ) ; return this -> ScaledGlyphs ; } ;
## Error: expected ';'!!!

proc ScaledGlyphsOn*(this: var vtkGraphMapper) {.importcpp: "ScaledGlyphsOn",
    header: "vtkGraphMapper.h".}
proc ScaledGlyphsOff*(this: var vtkGraphMapper) {.importcpp: "ScaledGlyphsOff",
    header: "vtkGraphMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  Glyph scaling array name. Default is "scale"
  ##
proc SetScalingArrayName*(this: var vtkGraphMapper; _arg: cstring) {.
    importcpp: "SetScalingArrayName", header: "vtkGraphMapper.h".}
proc GetScalingArrayName*(this: var vtkGraphMapper): cstring {.
    importcpp: "GetScalingArrayName", header: "vtkGraphMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  Whether to show edges or not.  Default is on.
  ##
proc SetEdgeVisibility*(this: var vtkGraphMapper; vis: bool) {.
    importcpp: "SetEdgeVisibility", header: "vtkGraphMapper.h".}
proc GetEdgeVisibility*(this: var vtkGraphMapper): bool {.
    importcpp: "GetEdgeVisibility", header: "vtkGraphMapper.h".}
proc EdgeVisibilityOn*(this: var vtkGraphMapper) {.importcpp: "EdgeVisibilityOn",
    header: "vtkGraphMapper.h".}
proc EdgeVisibilityOff*(this: var vtkGraphMapper) {.importcpp: "EdgeVisibilityOff",
    header: "vtkGraphMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  The array to use for coloring edges.  Default is "color".
  ##
proc SetEdgeColorArrayName*(this: var vtkGraphMapper; name: cstring) {.
    importcpp: "SetEdgeColorArrayName", header: "vtkGraphMapper.h".}
proc GetEdgeColorArrayName*(this: var vtkGraphMapper): cstring {.
    importcpp: "GetEdgeColorArrayName", header: "vtkGraphMapper.h".}
proc SetColorEdges*(this: var vtkGraphMapper; vis: bool) {.importcpp: "SetColorEdges",
    header: "vtkGraphMapper.h".}
proc GetColorEdges*(this: var vtkGraphMapper): bool {.importcpp: "GetColorEdges",
    header: "vtkGraphMapper.h".}
proc ColorEdgesOn*(this: var vtkGraphMapper) {.importcpp: "ColorEdgesOn",
    header: "vtkGraphMapper.h".}
proc ColorEdgesOff*(this: var vtkGraphMapper) {.importcpp: "ColorEdgesOff",
    header: "vtkGraphMapper.h".}
proc SetScalingArrayNameEnabledEdgesArrayName*(this: var vtkGraphMapper;
    _arg: cstring) {.importcpp: "SetScalingArrayNameEnabledEdgesArrayName",
                   header: "vtkGraphMapper.h".}
proc GetScalingArrayNameEnabledEdgesArrayName*(this: var vtkGraphMapper): cstring {.
    importcpp: "GetScalingArrayNameEnabledEdgesArrayName",
    header: "vtkGraphMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  Whether to enable/disable edges using array values.  Default is off.
  ##
proc SetEnableEdgesByArray*(this: var vtkGraphMapper; _arg: vtkTypeBool) {.
    importcpp: "SetEnableEdgesByArray", header: "vtkGraphMapper.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetScaledGlyphsEnableEdgesByArray ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EnableEdgesByArray  of  << this -> EnableEdgesByArray ) ; return this -> EnableEdgesByArray ; } ;
## Error: expected ';'!!!

proc EnableEdgesByArrayOn*(this: var vtkGraphMapper) {.
    importcpp: "EnableEdgesByArrayOn", header: "vtkGraphMapper.h".}
proc EnableEdgesByArrayOff*(this: var vtkGraphMapper) {.
    importcpp: "EnableEdgesByArrayOff", header: "vtkGraphMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  The array to use for coloring edges.  Default is "color".
  ##
proc SetScalingArrayNameEnabledEdgesArrayNameEnabledVerticesArrayName*(
    this: var vtkGraphMapper; _arg: cstring) {.importcpp: "SetScalingArrayNameEnabledEdgesArrayNameEnabledVerticesArrayName",
    header: "vtkGraphMapper.h".}
proc GetScalingArrayNameEnabledEdgesArrayNameEnabledVerticesArrayName*(
    this: var vtkGraphMapper): cstring {.importcpp: "GetScalingArrayNameEnabledEdgesArrayNameEnabledVerticesArrayName",
                                     header: "vtkGraphMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  Whether to enable/disable vertices using array values.  Default is off.
  ##
proc SetEnableEdgesByArrayEnableVerticesByArray*(this: var vtkGraphMapper;
    _arg: vtkTypeBool) {.importcpp: "SetEnableEdgesByArrayEnableVerticesByArray",
                       header: "vtkGraphMapper.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetScaledGlyphsEnableEdgesByArrayEnableVerticesByArray ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EnableVerticesByArray  of  << this -> EnableVerticesByArray ) ; return this -> EnableVerticesByArray ; } ;
## Error: expected ';'!!!

proc EnableVerticesByArrayOn*(this: var vtkGraphMapper) {.
    importcpp: "EnableVerticesByArrayOn", header: "vtkGraphMapper.h".}
proc EnableVerticesByArrayOff*(this: var vtkGraphMapper) {.
    importcpp: "EnableVerticesByArrayOff", header: "vtkGraphMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  The array to use for assigning icons.
  ##
proc SetIconArrayName*(this: var vtkGraphMapper; name: cstring) {.
    importcpp: "SetIconArrayName", header: "vtkGraphMapper.h".}
proc GetIconArrayName*(this: var vtkGraphMapper): cstring {.
    importcpp: "GetIconArrayName", header: "vtkGraphMapper.h".}
proc AddIconType*(this: var vtkGraphMapper; `type`: cstring; index: cint) {.
    importcpp: "AddIconType", header: "vtkGraphMapper.h".}
proc ClearIconTypes*(this: var vtkGraphMapper) {.importcpp: "ClearIconTypes",
    header: "vtkGraphMapper.h".}
proc SetIconSize*(this: var vtkGraphMapper; size: ptr cint) {.importcpp: "SetIconSize",
    header: "vtkGraphMapper.h".}
proc GetIconSize*(this: var vtkGraphMapper): ptr cint {.importcpp: "GetIconSize",
    header: "vtkGraphMapper.h".}
proc SetIconAlignment*(this: var vtkGraphMapper; alignment: cint) {.
    importcpp: "SetIconAlignment", header: "vtkGraphMapper.h".}
proc GetIconTexture*(this: var vtkGraphMapper): ptr vtkTexture {.
    importcpp: "GetIconTexture", header: "vtkGraphMapper.h".}
proc SetIconTexture*(this: var vtkGraphMapper; texture: ptr vtkTexture) {.
    importcpp: "SetIconTexture", header: "vtkGraphMapper.h".}
proc SetIconVisibility*(this: var vtkGraphMapper; vis: bool) {.
    importcpp: "SetIconVisibility", header: "vtkGraphMapper.h".}
proc GetIconVisibility*(this: var vtkGraphMapper): bool {.
    importcpp: "GetIconVisibility", header: "vtkGraphMapper.h".}
proc IconVisibilityOn*(this: var vtkGraphMapper) {.importcpp: "IconVisibilityOn",
    header: "vtkGraphMapper.h".}
proc IconVisibilityOff*(this: var vtkGraphMapper) {.importcpp: "IconVisibilityOff",
    header: "vtkGraphMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get/Set the vertex point size
  ##
## !!!Ignored construct:  virtual float GetScaledGlyphsEnableEdgesByArrayEnableVerticesByArrayVertexPointSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << VertexPointSize  of  << this -> VertexPointSize ) ; return this -> VertexPointSize ; } ;
## Error: expected ';'!!!

proc SetVertexPointSize*(this: var vtkGraphMapper; size: cfloat) {.
    importcpp: "SetVertexPointSize", header: "vtkGraphMapper.h".}
## !!!Ignored construct:  /@} /@{ *
##  Get/Set the edge line width
##  virtual float GetScaledGlyphsEnableEdgesByArrayEnableVerticesByArrayVertexPointSizeEdgeLineWidthEdgeLineWidth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EdgeLineWidth  of  << this -> EdgeLineWidth ) ; return this -> EdgeLineWidth ; } ;
## Error: expected ';'!!!

proc SetEdgeLineWidth*(this: var vtkGraphMapper; width: cfloat) {.
    importcpp: "SetEdgeLineWidth", header: "vtkGraphMapper.h".}
proc ReleaseGraphicsResources*(this: var vtkGraphMapper; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkGraphMapper.h".}
proc GetMTime*(this: var vtkGraphMapper): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkGraphMapper.h".}
proc SetInputData*(this: var vtkGraphMapper; input: ptr vtkGraph) {.
    importcpp: "SetInputData", header: "vtkGraphMapper.h".}
proc GetInput*(this: var vtkGraphMapper): ptr vtkGraph {.importcpp: "GetInput",
    header: "vtkGraphMapper.h".}
## !!!Ignored construct:  /@} *
##  Return bounding box (array of six doubles) of data expressed as
##  (xmin,xmax, ymin,ymax, zmin,zmax).
##  double * GetBounds ( ) VTK_SIZEHINT ( 6 ) override ;
## Error: expected ';'!!!

proc GetBounds*(this: var vtkGraphMapper; bounds: ptr cdouble) {.
    importcpp: "GetBounds", header: "vtkGraphMapper.h".}
proc GetnameEdgeLookupTable*(this: var vtkGraphMapper): ptr vtkLookupTable {.
    importcpp: "GetnameEdgeLookupTable", header: "vtkGraphMapper.h".}
proc GetnameEdgeLookupTableVertexLookupTable*(this: var vtkGraphMapper): ptr vtkLookupTable {.
    importcpp: "GetnameEdgeLookupTableVertexLookupTable",
    header: "vtkGraphMapper.h".}
  ## /@}