## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGlyphSource2D.h
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
##  @class   vtkGlyphSource2D
##  @brief   create 2D glyphs represented by vtkPolyData
##
##  vtkGlyphSource2D can generate a family of 2D glyphs each of which lies
##  in the x-y plane (i.e., the z-coordinate is zero). The class is a helper
##  class to be used with vtkGlyph2D and vtkXYPlotActor.
##
##  To use this class, specify the glyph type to use and its
##  attributes. Attributes include its position (i.e., center point), scale,
##  color, and whether the symbol is filled or not (a polygon or closed line
##  sequence). You can also put a short line through the glyph running from -x
##  to +x (the glyph looks like it's on a line), or a cross.
##

import
  vtkFiltersSourcesModule, vtkPolyDataAlgorithm

const
  VTK_NO_GLYPH* = 0
  VTK_VERTEX_GLYPH* = 1
  VTK_DASH_GLYPH* = 2
  VTK_CROSS_GLYPH* = 3
  VTK_THICKCROSS_GLYPH* = 4
  VTK_TRIANGLE_GLYPH* = 5
  VTK_SQUARE_GLYPH* = 6
  VTK_CIRCLE_GLYPH* = 7
  VTK_DIAMOND_GLYPH* = 8
  VTK_ARROW_GLYPH* = 9
  VTK_THICKARROW_GLYPH* = 10
  VTK_HOOKEDARROW_GLYPH* = 11
  VTK_EDGEARROW_GLYPH* = 12
  VTK_MAX_CIRCLE_RESOLUTION* = 1024

discard "forward decl of vtkPoints"
discard "forward decl of vtkUnsignedCharArray"
discard "forward decl of vtkCellArray"
type
  vtkGlyphSource2D* {.importcpp: "vtkGlyphSource2D", header: "vtkGlyphSource2D.h",
                     bycopy.} = object of vtkPolyDataAlgorithm
    vtkGlyphSource2D* {.importc: "vtkGlyphSource2D".}: VTK_NEWINSTANCE

  vtkGlyphSource2DSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGlyphSource2D::IsTypeOf(@)", header: "vtkGlyphSource2D.h".}
proc IsA*(this: var vtkGlyphSource2D; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkGlyphSource2D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGlyphSource2D {.
    importcpp: "vtkGlyphSource2D::SafeDownCast(@)", header: "vtkGlyphSource2D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGlyphSource2D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGlyphSource2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGlyphSource2D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGlyphSource2D; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGlyphSource2D.h".}
proc New*(): ptr vtkGlyphSource2D {.importcpp: "vtkGlyphSource2D::New(@)",
                                header: "vtkGlyphSource2D.h".}
proc SetCenter*(this: var vtkGlyphSource2D; _arg1: cdouble; _arg2: cdouble;
               _arg3: cdouble) {.importcpp: "SetCenter",
                               header: "vtkGlyphSource2D.h".}
proc SetCenter*(this: var vtkGlyphSource2D; _arg: array[3, cdouble]) {.
    importcpp: "SetCenter", header: "vtkGlyphSource2D.h".}
## !!!Ignored construct:  virtual double * GetCenter ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Center  pointer  << this -> Center ) ; return this -> Center ; } VTK_WRAPEXCLUDE virtual void GetCenter ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Center [ i ] ; } } ;
## Error: expected ';'!!!

proc SetScale*(this: var vtkGlyphSource2D; _arg: cdouble) {.importcpp: "SetScale",
    header: "vtkGlyphSource2D.h".}
proc GetScaleMinValue*(this: var vtkGlyphSource2D): cdouble {.
    importcpp: "GetScaleMinValue", header: "vtkGlyphSource2D.h".}
proc GetScaleMaxValue*(this: var vtkGlyphSource2D): cdouble {.
    importcpp: "GetScaleMaxValue", header: "vtkGlyphSource2D.h".}
## !!!Ignored construct:  virtual double GetScale ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Scale  of  << this -> Scale ) ; return this -> Scale ; } ;
## Error: expected ';'!!!

proc SetScaleScale2*(this: var vtkGlyphSource2D; _arg: cdouble) {.
    importcpp: "SetScaleScale2", header: "vtkGlyphSource2D.h".}
proc GetScaleMinValueScale2MinValue*(this: var vtkGlyphSource2D): cdouble {.
    importcpp: "GetScaleMinValueScale2MinValue", header: "vtkGlyphSource2D.h".}
proc GetScaleMaxValueScale2MaxValue*(this: var vtkGlyphSource2D): cdouble {.
    importcpp: "GetScaleMaxValueScale2MaxValue", header: "vtkGlyphSource2D.h".}
## !!!Ignored construct:  virtual double GetScaleScale2 ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Scale2  of  << this -> Scale2 ) ; return this -> Scale2 ; } ;
## Error: expected ';'!!!

proc SetCenterColor*(this: var vtkGlyphSource2D; _arg1: cdouble; _arg2: cdouble;
                    _arg3: cdouble) {.importcpp: "SetCenterColor",
                                    header: "vtkGlyphSource2D.h".}
proc SetCenterColor*(this: var vtkGlyphSource2D; _arg: array[3, cdouble]) {.
    importcpp: "SetCenterColor", header: "vtkGlyphSource2D.h".}
## !!!Ignored construct:  virtual double * GetCenterColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Color  pointer  << this -> Color ) ; return this -> Color ; } VTK_WRAPEXCLUDE virtual void GetCenterColor ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Color [ i ] ; } } ;
## Error: expected ';'!!!

proc SetFilled*(this: var vtkGlyphSource2D; _arg: vtkTypeBool) {.
    importcpp: "SetFilled", header: "vtkGlyphSource2D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetScaleScale2Filled ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Filled  of  << this -> Filled ) ; return this -> Filled ; } ;
## Error: expected ';'!!!

proc FilledOn*(this: var vtkGlyphSource2D) {.importcpp: "FilledOn",
    header: "vtkGlyphSource2D.h".}
proc FilledOff*(this: var vtkGlyphSource2D) {.importcpp: "FilledOff",
    header: "vtkGlyphSource2D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify whether a short line segment is drawn through the
  ##  glyph. (This is in addition to the glyph. If the glyph type
  ##  is set to "Dash" there is no need to enable this flag.)
  ##
proc SetFilledDash*(this: var vtkGlyphSource2D; _arg: vtkTypeBool) {.
    importcpp: "SetFilledDash", header: "vtkGlyphSource2D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetScaleScale2FilledDash ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Dash  of  << this -> Dash ) ; return this -> Dash ; } ;
## Error: expected ';'!!!

proc DashOn*(this: var vtkGlyphSource2D) {.importcpp: "DashOn",
                                       header: "vtkGlyphSource2D.h".}
proc DashOff*(this: var vtkGlyphSource2D) {.importcpp: "DashOff",
                                        header: "vtkGlyphSource2D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify whether a cross is drawn as part of the glyph. (This
  ##  is in addition to the glyph. If the glyph type is set to
  ##  "Cross" there is no need to enable this flag.)
  ##
proc SetFilledDashCross*(this: var vtkGlyphSource2D; _arg: vtkTypeBool) {.
    importcpp: "SetFilledDashCross", header: "vtkGlyphSource2D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetScaleScale2FilledDashCross ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Cross  of  << this -> Cross ) ; return this -> Cross ; } ;
## Error: expected ';'!!!

proc CrossOn*(this: var vtkGlyphSource2D) {.importcpp: "CrossOn",
                                        header: "vtkGlyphSource2D.h".}
proc CrossOff*(this: var vtkGlyphSource2D) {.importcpp: "CrossOff",
    header: "vtkGlyphSource2D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify an angle (in degrees) to rotate the glyph around
  ##  the z-axis. Using this ivar, it is possible to generate
  ##  rotated glyphs (e.g., crosses, arrows, etc.)
  ##
proc SetFilledDashCrossRotationAngle*(this: var vtkGlyphSource2D; _arg: cdouble) {.
    importcpp: "SetFilledDashCrossRotationAngle", header: "vtkGlyphSource2D.h".}
## !!!Ignored construct:  virtual double GetScaleScale2FilledDashCrossRotationAngle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RotationAngle  of  << this -> RotationAngle ) ; return this -> RotationAngle ; } ;
## Error: expected ';'!!!

proc SetScaleScale2Resolution*(this: var vtkGlyphSource2D; _arg: cint) {.
    importcpp: "SetScaleScale2Resolution", header: "vtkGlyphSource2D.h".}
proc GetScaleMinValueScale2MinValueResolutionMinValue*(this: var vtkGlyphSource2D): cint {.
    importcpp: "GetScaleMinValueScale2MinValueResolutionMinValue",
    header: "vtkGlyphSource2D.h".}
proc GetScaleMaxValueScale2MaxValueResolutionMaxValue*(this: var vtkGlyphSource2D): cint {.
    importcpp: "GetScaleMaxValueScale2MaxValueResolutionMaxValue",
    header: "vtkGlyphSource2D.h".}
## !!!Ignored construct:  virtual int GetScaleScale2FilledDashCrossRotationAngleResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Resolution  of  << this -> Resolution ) ; return this -> Resolution ; } ;
## Error: expected ';'!!!

proc SetScaleScale2ResolutionGlyphType*(this: var vtkGlyphSource2D; _arg: cint) {.
    importcpp: "SetScaleScale2ResolutionGlyphType", header: "vtkGlyphSource2D.h".}
proc GetScaleMinValueScale2MinValueResolutionMinValueGlyphTypeMinValue*(
    this: var vtkGlyphSource2D): cint {.importcpp: "GetScaleMinValueScale2MinValueResolutionMinValueGlyphTypeMinValue",
                                    header: "vtkGlyphSource2D.h".}
proc GetScaleMaxValueScale2MaxValueResolutionMaxValueGlyphTypeMaxValue*(
    this: var vtkGlyphSource2D): cint {.importcpp: "GetScaleMaxValueScale2MaxValueResolutionMaxValueGlyphTypeMaxValue",
                                    header: "vtkGlyphSource2D.h".}
## !!!Ignored construct:  virtual int GetScaleScale2FilledDashCrossRotationAngleResolutionGlyphType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GlyphType  of  << this -> GlyphType ) ; return this -> GlyphType ; } ;
## Error: expected ';'!!!

proc SetGlyphTypeToNone*(this: var vtkGlyphSource2D) {.
    importcpp: "SetGlyphTypeToNone", header: "vtkGlyphSource2D.h".}
proc SetGlyphTypeToVertex*(this: var vtkGlyphSource2D) {.
    importcpp: "SetGlyphTypeToVertex", header: "vtkGlyphSource2D.h".}
proc SetGlyphTypeToDash*(this: var vtkGlyphSource2D) {.
    importcpp: "SetGlyphTypeToDash", header: "vtkGlyphSource2D.h".}
proc SetGlyphTypeToCross*(this: var vtkGlyphSource2D) {.
    importcpp: "SetGlyphTypeToCross", header: "vtkGlyphSource2D.h".}
proc SetGlyphTypeToThickCross*(this: var vtkGlyphSource2D) {.
    importcpp: "SetGlyphTypeToThickCross", header: "vtkGlyphSource2D.h".}
proc SetGlyphTypeToTriangle*(this: var vtkGlyphSource2D) {.
    importcpp: "SetGlyphTypeToTriangle", header: "vtkGlyphSource2D.h".}
proc SetGlyphTypeToSquare*(this: var vtkGlyphSource2D) {.
    importcpp: "SetGlyphTypeToSquare", header: "vtkGlyphSource2D.h".}
proc SetGlyphTypeToCircle*(this: var vtkGlyphSource2D) {.
    importcpp: "SetGlyphTypeToCircle", header: "vtkGlyphSource2D.h".}
proc SetGlyphTypeToDiamond*(this: var vtkGlyphSource2D) {.
    importcpp: "SetGlyphTypeToDiamond", header: "vtkGlyphSource2D.h".}
proc SetGlyphTypeToArrow*(this: var vtkGlyphSource2D) {.
    importcpp: "SetGlyphTypeToArrow", header: "vtkGlyphSource2D.h".}
proc SetGlyphTypeToThickArrow*(this: var vtkGlyphSource2D) {.
    importcpp: "SetGlyphTypeToThickArrow", header: "vtkGlyphSource2D.h".}
proc SetGlyphTypeToHookedArrow*(this: var vtkGlyphSource2D) {.
    importcpp: "SetGlyphTypeToHookedArrow", header: "vtkGlyphSource2D.h".}
proc SetGlyphTypeToEdgeArrow*(this: var vtkGlyphSource2D) {.
    importcpp: "SetGlyphTypeToEdgeArrow", header: "vtkGlyphSource2D.h".}
proc SetFilledDashCrossRotationAngleOutputPointsPrecision*(
    this: var vtkGlyphSource2D; _arg: cint) {.
    importcpp: "SetFilledDashCrossRotationAngleOutputPointsPrecision",
    header: "vtkGlyphSource2D.h".}
## !!!Ignored construct:  virtual int GetScaleScale2FilledDashCrossRotationAngleResolutionGlyphTypeOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ;
## Error: expected ';'!!!
