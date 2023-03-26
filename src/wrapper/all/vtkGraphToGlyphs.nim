## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGraphToGlyphs.h
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
##  @class   vtkGraphToGlyphs
##  @brief   create glyphs for graph vertices
##
##
##  Converts a vtkGraph to a vtkPolyData containing a glyph for each vertex.
##  This assumes that the points
##  of the graph have already been filled (perhaps by vtkGraphLayout).
##  The glyphs will automatically be scaled to be the same size in screen
##  coordinates. To do this the filter requires a pointer to the renderer
##  into which the glyphs will be rendered.
##

import
  vtkPolyDataAlgorithm, vtkRenderingCoreModule, vtkSmartPointer

discard "forward decl of vtkDistanceToCamera"
discard "forward decl of vtkGraphToPoints"
discard "forward decl of vtkGlyph3D"
discard "forward decl of vtkGlyphSource2D"
discard "forward decl of vtkRenderer"
discard "forward decl of vtkSphereSource"
type
  vtkGraphToGlyphs* {.importcpp: "vtkGraphToGlyphs", header: "vtkGraphToGlyphs.h",
                     bycopy.} = object of vtkPolyDataAlgorithm
    vtkGraphToGlyphs* {.importc: "vtkGraphToGlyphs".}: VTK_NEWINSTANCE


proc New*(): ptr vtkGraphToGlyphs {.importcpp: "vtkGraphToGlyphs::New(@)",
                                header: "vtkGraphToGlyphs.h".}
type
  vtkGraphToGlyphsSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGraphToGlyphs::IsTypeOf(@)", header: "vtkGraphToGlyphs.h".}
proc IsA*(this: var vtkGraphToGlyphs; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkGraphToGlyphs.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGraphToGlyphs {.
    importcpp: "vtkGraphToGlyphs::SafeDownCast(@)", header: "vtkGraphToGlyphs.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGraphToGlyphs :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGraphToGlyphs :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGraphToGlyphs :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGraphToGlyphs; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGraphToGlyphs.h".}
const
  vtkGraphToGlyphsVERTEX* = 1
  vtkGraphToGlyphsDASH* = 2
  vtkGraphToGlyphsCROSS* = 3
  vtkGraphToGlyphsTHICKCROSS* = 4
  vtkGraphToGlyphsTRIANGLE* = 5
  vtkGraphToGlyphsSQUARE* = 6
  vtkGraphToGlyphsCIRCLE* = 7
  vtkGraphToGlyphsDIAMOND* = 8
  vtkGraphToGlyphsSPHERE* = 9

proc SetGlyphType*(this: var vtkGraphToGlyphs; _arg: cint) {.
    importcpp: "SetGlyphType", header: "vtkGraphToGlyphs.h".}
## !!!Ignored construct:  virtual int GetGlyphType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GlyphType  of  << this -> GlyphType ) ; return this -> GlyphType ; } ;
## Error: expected ';'!!!

proc SetGlyphTypeFilled*(this: var vtkGraphToGlyphs; _arg: bool) {.
    importcpp: "SetGlyphTypeFilled", header: "vtkGraphToGlyphs.h".}
## !!!Ignored construct:  virtual bool GetGlyphTypeFilled ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Filled  of  << this -> Filled ) ; return this -> Filled ; } ;
## Error: expected ';'!!!

proc FilledOn*(this: var vtkGraphToGlyphs) {.importcpp: "FilledOn",
    header: "vtkGraphToGlyphs.h".}
proc FilledOff*(this: var vtkGraphToGlyphs) {.importcpp: "FilledOff",
    header: "vtkGraphToGlyphs.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set the desired screen size of each glyph. If you are using scaling,
  ##  this will be the size of the glyph when rendering an object with
  ##  scaling value 1.0.
  ##
proc SetGlyphTypeFilledScreenSize*(this: var vtkGraphToGlyphs; _arg: cdouble) {.
    importcpp: "SetGlyphTypeFilledScreenSize", header: "vtkGraphToGlyphs.h".}
## !!!Ignored construct:  virtual double GetGlyphTypeFilledScreenSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScreenSize  of  << this -> ScreenSize ) ; return this -> ScreenSize ; } ;
## Error: expected ';'!!!

proc SetRenderer*(this: var vtkGraphToGlyphs; ren: ptr vtkRenderer) {.
    importcpp: "SetRenderer", header: "vtkGraphToGlyphs.h".}
proc GetRenderer*(this: var vtkGraphToGlyphs): ptr vtkRenderer {.
    importcpp: "GetRenderer", header: "vtkGraphToGlyphs.h".}
proc SetScaling*(this: var vtkGraphToGlyphs; b: bool) {.importcpp: "SetScaling",
    header: "vtkGraphToGlyphs.h".}
proc GetScaling*(this: var vtkGraphToGlyphs): bool {.importcpp: "GetScaling",
    header: "vtkGraphToGlyphs.h".}
proc GetMTime*(this: var vtkGraphToGlyphs): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkGraphToGlyphs.h".}