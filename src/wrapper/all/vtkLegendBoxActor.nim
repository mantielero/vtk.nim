## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLegendBoxActor.h
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
##  @class   vtkLegendBoxActor
##  @brief   draw symbols with text
##
##  vtkLegendBoxActor is used to associate a symbol with a text string.
##  The user specifies a vtkPolyData to use as the symbol, and a string
##  associated with the symbol. The actor can then be placed in the scene
##  in the same way that any other vtkActor2D can be used.
##
##  To use this class, you must define the position of the legend box by using
##  the superclasses' vtkActor2D::Position coordinate and
##  Position2 coordinate. Then define the set of symbols and text strings that
##  make up the menu box. The font attributes of the entries can be set through
##  the vtkTextProperty associated to this actor. The class will
##  scale the symbols and text to fit in the legend box defined by
##  (Position,Position2). Optional features like turning on a border line and
##  setting the spacing between the border and the symbols/text can also be
##  set.
##
##  @sa
##  vtkXYPlotActor vtkActor2D vtkGlyphSource2D
##

import
  vtkActor2D, vtkRenderingAnnotationModule

discard "forward decl of vtkActor"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkImageData"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkPolyDataMapper2D"
discard "forward decl of vtkPolyDataMapper"
discard "forward decl of vtkPlaneSource"
discard "forward decl of vtkTextMapper"
discard "forward decl of vtkTextProperty"
discard "forward decl of vtkTexturedActor2D"
discard "forward decl of vtkTransform"
discard "forward decl of vtkTransformPolyDataFilter"
discard "forward decl of vtkProperty2D"
type
  vtkLegendBoxActor* {.importcpp: "vtkLegendBoxActor",
                      header: "vtkLegendBoxActor.h", bycopy.} = object of vtkActor2D
    vtkLegendBoxActor* {.importc: "vtkLegendBoxActor".}: VTK_NEWINSTANCE
    ##  Internal actors, mappers, data to represent the legend
    ##  allocation size
    ##  Background plane.
    ##  May use texture.
    ##  Used to control whether the stuff is recomputed

  vtkLegendBoxActorSuperclass* = vtkActor2D

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkLegendBoxActor::IsTypeOf(@)", header: "vtkLegendBoxActor.h".}
proc IsA*(this: var vtkLegendBoxActor; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkLegendBoxActor.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkLegendBoxActor {.
    importcpp: "vtkLegendBoxActor::SafeDownCast(@)", header: "vtkLegendBoxActor.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkLegendBoxActor :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkActor2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLegendBoxActor :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLegendBoxActor :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkLegendBoxActor; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkLegendBoxActor.h".}
proc New*(): ptr vtkLegendBoxActor {.importcpp: "vtkLegendBoxActor::New(@)",
                                 header: "vtkLegendBoxActor.h".}
proc SetNumberOfEntries*(this: var vtkLegendBoxActor; num: cint) {.
    importcpp: "SetNumberOfEntries", header: "vtkLegendBoxActor.h".}
proc GetNumberOfEntries*(this: var vtkLegendBoxActor): cint {.
    importcpp: "GetNumberOfEntries", header: "vtkLegendBoxActor.h".}
proc SetEntry*(this: var vtkLegendBoxActor; i: cint; symbol: ptr vtkPolyData;
              string: cstring; color: array[3, cdouble]) {.importcpp: "SetEntry",
    header: "vtkLegendBoxActor.h".}
proc SetEntry*(this: var vtkLegendBoxActor; i: cint; symbol: ptr vtkImageData;
              string: cstring; color: array[3, cdouble]) {.importcpp: "SetEntry",
    header: "vtkLegendBoxActor.h".}
proc SetEntry*(this: var vtkLegendBoxActor; i: cint; symbol: ptr vtkPolyData;
              icon: ptr vtkImageData; string: cstring; color: array[3, cdouble]) {.
    importcpp: "SetEntry", header: "vtkLegendBoxActor.h".}
proc SetEntrySymbol*(this: var vtkLegendBoxActor; i: cint; symbol: ptr vtkPolyData) {.
    importcpp: "SetEntrySymbol", header: "vtkLegendBoxActor.h".}
proc SetEntryIcon*(this: var vtkLegendBoxActor; i: cint; icon: ptr vtkImageData) {.
    importcpp: "SetEntryIcon", header: "vtkLegendBoxActor.h".}
proc SetEntryString*(this: var vtkLegendBoxActor; i: cint; string: cstring) {.
    importcpp: "SetEntryString", header: "vtkLegendBoxActor.h".}
proc SetEntryColor*(this: var vtkLegendBoxActor; i: cint; color: array[3, cdouble]) {.
    importcpp: "SetEntryColor", header: "vtkLegendBoxActor.h".}
proc SetEntryColor*(this: var vtkLegendBoxActor; i: cint; r: cdouble; g: cdouble;
                   b: cdouble) {.importcpp: "SetEntryColor",
                               header: "vtkLegendBoxActor.h".}
proc GetEntrySymbol*(this: var vtkLegendBoxActor; i: cint): ptr vtkPolyData {.
    importcpp: "GetEntrySymbol", header: "vtkLegendBoxActor.h".}
proc GetEntryIcon*(this: var vtkLegendBoxActor; i: cint): ptr vtkImageData {.
    importcpp: "GetEntryIcon", header: "vtkLegendBoxActor.h".}
proc GetEntryString*(this: var vtkLegendBoxActor; i: cint): cstring {.
    importcpp: "GetEntryString", header: "vtkLegendBoxActor.h".}
## !!!Ignored construct:  double * GetEntryColor ( int i ) VTK_SIZEHINT ( 3 ) ;
## Error: expected ';'!!!

proc SetEntryTextProperty*(this: var vtkLegendBoxActor; p: ptr vtkTextProperty) {.
    importcpp: "SetEntryTextProperty", header: "vtkLegendBoxActor.h".}
proc GetnameEntryTextProperty*(this: var vtkLegendBoxActor): ptr vtkTextProperty {.
    importcpp: "GetnameEntryTextProperty", header: "vtkLegendBoxActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the flag that controls whether a border will be drawn
  ##  around the legend box.
  ##
proc SetBorder*(this: var vtkLegendBoxActor; _arg: vtkTypeBool) {.
    importcpp: "SetBorder", header: "vtkLegendBoxActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetBorder ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Border  of  << this -> Border ) ; return this -> Border ; } ;
## Error: expected ';'!!!

proc BorderOn*(this: var vtkLegendBoxActor) {.importcpp: "BorderOn",
    header: "vtkLegendBoxActor.h".}
proc BorderOff*(this: var vtkLegendBoxActor) {.importcpp: "BorderOff",
    header: "vtkLegendBoxActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the flag that controls whether the border and legend
  ##  placement is locked into the rectangle defined by (Position,Position2).
  ##  If off, then the legend box will adjust its size so that the border
  ##  fits nicely around the text and symbols. (The ivar is off by default.)
  ##  Note: the legend box is guaranteed to lie within the original border
  ##  definition.
  ##
proc SetBorderLockBorder*(this: var vtkLegendBoxActor; _arg: vtkTypeBool) {.
    importcpp: "SetBorderLockBorder", header: "vtkLegendBoxActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetBorderLockBorder ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LockBorder  of  << this -> LockBorder ) ; return this -> LockBorder ; } ;
## Error: expected ';'!!!

proc LockBorderOn*(this: var vtkLegendBoxActor) {.importcpp: "LockBorderOn",
    header: "vtkLegendBoxActor.h".}
proc LockBorderOff*(this: var vtkLegendBoxActor) {.importcpp: "LockBorderOff",
    header: "vtkLegendBoxActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the flag that controls whether a box will be drawn/filled
  ##  corresponding to the legend box.
  ##
proc SetBorderLockBorderBox*(this: var vtkLegendBoxActor; _arg: vtkTypeBool) {.
    importcpp: "SetBorderLockBorderBox", header: "vtkLegendBoxActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetBorderLockBorderBox ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Box  of  << this -> Box ) ; return this -> Box ; } ;
## Error: expected ';'!!!

proc BoxOn*(this: var vtkLegendBoxActor) {.importcpp: "BoxOn",
                                       header: "vtkLegendBoxActor.h".}
proc BoxOff*(this: var vtkLegendBoxActor) {.importcpp: "BoxOff",
                                        header: "vtkLegendBoxActor.h".}
  ## /@}
  ## *
  ##  Get the box vtkProperty2D.
  ##
proc GetBoxProperty*(this: var vtkLegendBoxActor): ptr vtkProperty2D {.
    importcpp: "GetBoxProperty", header: "vtkLegendBoxActor.h".}
proc SetPadding*(this: var vtkLegendBoxActor; _arg: cint) {.importcpp: "SetPadding",
    header: "vtkLegendBoxActor.h".}
proc GetPaddingMinValue*(this: var vtkLegendBoxActor): cint {.
    importcpp: "GetPaddingMinValue", header: "vtkLegendBoxActor.h".}
proc GetPaddingMaxValue*(this: var vtkLegendBoxActor): cint {.
    importcpp: "GetPaddingMaxValue", header: "vtkLegendBoxActor.h".}
## !!!Ignored construct:  virtual int GetBorderLockBorderBoxPadding ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Padding  of  << this -> Padding ) ; return this -> Padding ; } ;
## Error: expected ';'!!!

proc SetBorderLockBorderBoxScalarVisibility*(this: var vtkLegendBoxActor;
    _arg: vtkTypeBool) {.importcpp: "SetBorderLockBorderBoxScalarVisibility",
                       header: "vtkLegendBoxActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetBorderLockBorderBoxPaddingScalarVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarVisibility  of  << this -> ScalarVisibility ) ; return this -> ScalarVisibility ; } ;
## Error: expected ';'!!!

proc ScalarVisibilityOn*(this: var vtkLegendBoxActor) {.
    importcpp: "ScalarVisibilityOn", header: "vtkLegendBoxActor.h".}
proc ScalarVisibilityOff*(this: var vtkLegendBoxActor) {.
    importcpp: "ScalarVisibilityOff", header: "vtkLegendBoxActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off background.
  ##
proc SetBorderLockBorderBoxScalarVisibilityUseBackground*(
    this: var vtkLegendBoxActor; _arg: vtkTypeBool) {.
    importcpp: "SetBorderLockBorderBoxScalarVisibilityUseBackground",
    header: "vtkLegendBoxActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetBorderLockBorderBoxPaddingScalarVisibilityUseBackground ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseBackground  of  << this -> UseBackground ) ; return this -> UseBackground ; } ;
## Error: expected ';'!!!

proc UseBackgroundOn*(this: var vtkLegendBoxActor) {.importcpp: "UseBackgroundOn",
    header: "vtkLegendBoxActor.h".}
proc UseBackgroundOff*(this: var vtkLegendBoxActor) {.importcpp: "UseBackgroundOff",
    header: "vtkLegendBoxActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get background color.
  ##  Default is: (0.3, 0.3, 0.3).
  ##
proc SetBackgroundColor*(this: var vtkLegendBoxActor; _arg1: cdouble; _arg2: cdouble;
                        _arg3: cdouble) {.importcpp: "SetBackgroundColor",
                                        header: "vtkLegendBoxActor.h".}
proc SetBackgroundColor*(this: var vtkLegendBoxActor; _arg: array[3, cdouble]) {.
    importcpp: "SetBackgroundColor", header: "vtkLegendBoxActor.h".}
## !!!Ignored construct:  virtual double * GetBackgroundColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << BackgroundColor  pointer  << this -> BackgroundColor ) ; return this -> BackgroundColor ; } VTK_WRAPEXCLUDE virtual void GetBackgroundColor ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> BackgroundColor [ 0 ] ; _arg2 = this -> BackgroundColor [ 1 ] ; _arg3 = this -> BackgroundColor [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << BackgroundColor  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetBackgroundColor ( double _arg [ 3 ] ) { this -> GetBackgroundColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetPaddingBackgroundOpacity*(this: var vtkLegendBoxActor; _arg: cdouble) {.
    importcpp: "SetPaddingBackgroundOpacity", header: "vtkLegendBoxActor.h".}
proc GetPaddingMinValueBackgroundOpacityMinValue*(this: var vtkLegendBoxActor): cdouble {.
    importcpp: "GetPaddingMinValueBackgroundOpacityMinValue",
    header: "vtkLegendBoxActor.h".}
proc GetPaddingMaxValueBackgroundOpacityMaxValue*(this: var vtkLegendBoxActor): cdouble {.
    importcpp: "GetPaddingMaxValueBackgroundOpacityMaxValue",
    header: "vtkLegendBoxActor.h".}
## !!!Ignored construct:  virtual double GetBorderLockBorderBoxPaddingScalarVisibilityUseBackgroundBackgroundOpacity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BackgroundOpacity  of  << this -> BackgroundOpacity ) ; return this -> BackgroundOpacity ; } ;
## Error: expected ';'!!!

proc ShallowCopy*(this: var vtkLegendBoxActor; prop: ptr vtkProp) {.
    importcpp: "ShallowCopy", header: "vtkLegendBoxActor.h".}
proc ReleaseGraphicsResources*(this: var vtkLegendBoxActor; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkLegendBoxActor.h".}
proc RenderOpaqueGeometry*(this: var vtkLegendBoxActor; viewport: ptr vtkViewport): cint {.
    importcpp: "RenderOpaqueGeometry", header: "vtkLegendBoxActor.h".}
proc RenderTranslucentPolygonalGeometry*(this: var vtkLegendBoxActor;
                                        a2: ptr vtkViewport): cint {.
    importcpp: "RenderTranslucentPolygonalGeometry", header: "vtkLegendBoxActor.h".}
proc RenderOverlay*(this: var vtkLegendBoxActor; viewport: ptr vtkViewport): cint {.
    importcpp: "RenderOverlay", header: "vtkLegendBoxActor.h".}
proc HasTranslucentPolygonalGeometry*(this: var vtkLegendBoxActor): vtkTypeBool {.
    importcpp: "HasTranslucentPolygonalGeometry", header: "vtkLegendBoxActor.h".}