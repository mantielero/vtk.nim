## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTextProperty.h
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
##  @class   vtkTextProperty
##  @brief   represent text properties.
##
##  vtkTextProperty is an object that represents text properties.
##  The primary properties that can be set are color, opacity, font size,
##  font family horizontal and vertical justification, bold/italic/shadow
##  styles.
##  @sa
##  vtkTextMapper vtkTextActor vtkLegendBoxActor vtkCaptionActor2D
##

import
  vtkObject, vtkRenderingCoreModule

type
  vtkTextProperty* {.importcpp: "vtkTextProperty", header: "vtkTextProperty.h",
                    bycopy.} = object of vtkObject
    vtkTextProperty* {.importc: "vtkTextProperty".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH

  vtkTextPropertySuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTextProperty::IsTypeOf(@)", header: "vtkTextProperty.h".}
proc IsA*(this: var vtkTextProperty; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkTextProperty.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTextProperty {.
    importcpp: "vtkTextProperty::SafeDownCast(@)", header: "vtkTextProperty.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTextProperty :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTextProperty :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTextProperty :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTextProperty; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTextProperty.h".}
proc New*(): ptr vtkTextProperty {.importcpp: "vtkTextProperty::New(@)",
                               header: "vtkTextProperty.h".}
proc SetColor*(this: var vtkTextProperty; _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetColor", header: "vtkTextProperty.h".}
proc SetColor*(this: var vtkTextProperty; _arg: array[3, cdouble]) {.
    importcpp: "SetColor", header: "vtkTextProperty.h".}
## !!!Ignored construct:  virtual double * GetColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Color  pointer  << this -> Color ) ; return this -> Color ; } VTK_WRAPEXCLUDE virtual void GetColor ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Color [ 0 ] ; _arg2 = this -> Color [ 1 ] ; _arg3 = this -> Color [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Color  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetColor ( double _arg [ 3 ] ) { this -> GetColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetOpacity*(this: var vtkTextProperty; _arg: cdouble) {.importcpp: "SetOpacity",
    header: "vtkTextProperty.h".}
proc GetOpacityMinValue*(this: var vtkTextProperty): cdouble {.
    importcpp: "GetOpacityMinValue", header: "vtkTextProperty.h".}
proc GetOpacityMaxValue*(this: var vtkTextProperty): cdouble {.
    importcpp: "GetOpacityMaxValue", header: "vtkTextProperty.h".}
## !!!Ignored construct:  virtual double GetOpacity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Opacity  of  << this -> Opacity ) ; return this -> Opacity ; } ;
## Error: expected ';'!!!

proc SetColorBackgroundColor*(this: var vtkTextProperty; _arg1: cdouble;
                             _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetColorBackgroundColor", header: "vtkTextProperty.h".}
proc SetColorBackgroundColor*(this: var vtkTextProperty; _arg: array[3, cdouble]) {.
    importcpp: "SetColorBackgroundColor", header: "vtkTextProperty.h".}
## !!!Ignored construct:  virtual double * GetColorBackgroundColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << BackgroundColor  pointer  << this -> BackgroundColor ) ; return this -> BackgroundColor ; } VTK_WRAPEXCLUDE virtual void GetColorBackgroundColor ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> BackgroundColor [ 0 ] ; _arg2 = this -> BackgroundColor [ 1 ] ; _arg3 = this -> BackgroundColor [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << BackgroundColor  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetColorBackgroundColor ( double _arg [ 3 ] ) { this -> GetColorBackgroundColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetOpacityBackgroundOpacity*(this: var vtkTextProperty; _arg: cdouble) {.
    importcpp: "SetOpacityBackgroundOpacity", header: "vtkTextProperty.h".}
proc GetOpacityMinValueBackgroundOpacityMinValue*(this: var vtkTextProperty): cdouble {.
    importcpp: "GetOpacityMinValueBackgroundOpacityMinValue",
    header: "vtkTextProperty.h".}
proc GetOpacityMaxValueBackgroundOpacityMaxValue*(this: var vtkTextProperty): cdouble {.
    importcpp: "GetOpacityMaxValueBackgroundOpacityMaxValue",
    header: "vtkTextProperty.h".}
## !!!Ignored construct:  virtual double GetOpacityBackgroundOpacity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BackgroundOpacity  of  << this -> BackgroundOpacity ) ; return this -> BackgroundOpacity ; } ;
## Error: expected ';'!!!

proc SetBackgroundRGBA*(this: var vtkTextProperty; rgba: array[4, cdouble]) {.
    importcpp: "SetBackgroundRGBA", header: "vtkTextProperty.h".}
proc SetBackgroundRGBA*(this: var vtkTextProperty; r: cdouble; g: cdouble; b: cdouble;
                       a: cdouble) {.importcpp: "SetBackgroundRGBA",
                                   header: "vtkTextProperty.h".}
proc GetBackgroundRGBA*(this: var vtkTextProperty; rgba: array[4, cdouble]) {.
    importcpp: "GetBackgroundRGBA", header: "vtkTextProperty.h".}
proc GetBackgroundRGBA*(this: var vtkTextProperty; r: var cdouble; g: var cdouble;
                       b: var cdouble; a: var cdouble) {.
    importcpp: "GetBackgroundRGBA", header: "vtkTextProperty.h".}
proc SetColorBackgroundColorFrameColor*(this: var vtkTextProperty; _arg1: cdouble;
                                       _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetColorBackgroundColorFrameColor", header: "vtkTextProperty.h".}
proc SetColorBackgroundColorFrameColor*(this: var vtkTextProperty;
                                       _arg: array[3, cdouble]) {.
    importcpp: "SetColorBackgroundColorFrameColor", header: "vtkTextProperty.h".}
## !!!Ignored construct:  virtual double * GetColorBackgroundColorFrameColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << FrameColor  pointer  << this -> FrameColor ) ; return this -> FrameColor ; } VTK_WRAPEXCLUDE virtual void GetColorBackgroundColorFrameColor ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> FrameColor [ 0 ] ; _arg2 = this -> FrameColor [ 1 ] ; _arg3 = this -> FrameColor [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << FrameColor  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetColorBackgroundColorFrameColor ( double _arg [ 3 ] ) { this -> GetColorBackgroundColorFrameColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetFrame*(this: var vtkTextProperty; _arg: vtkTypeBool) {.importcpp: "SetFrame",
    header: "vtkTextProperty.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetOpacityBackgroundOpacityFrame ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Frame  of  << this -> Frame ) ; return this -> Frame ; } ;
## Error: expected ';'!!!

proc FrameOn*(this: var vtkTextProperty) {.importcpp: "FrameOn",
                                       header: "vtkTextProperty.h".}
proc FrameOff*(this: var vtkTextProperty) {.importcpp: "FrameOff",
                                        header: "vtkTextProperty.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the width of the frame. The width is expressed in pixels.
  ##  The default is 1 pixel.
  ##
proc SetOpacityBackgroundOpacityFrameWidth*(this: var vtkTextProperty; _arg: cint) {.
    importcpp: "SetOpacityBackgroundOpacityFrameWidth",
    header: "vtkTextProperty.h".}
proc GetOpacityMinValueBackgroundOpacityMinValueFrameWidthMinValue*(
    this: var vtkTextProperty): cint {.importcpp: "GetOpacityMinValueBackgroundOpacityMinValueFrameWidthMinValue",
                                   header: "vtkTextProperty.h".}
proc GetOpacityMaxValueBackgroundOpacityMaxValueFrameWidthMaxValue*(
    this: var vtkTextProperty): cint {.importcpp: "GetOpacityMaxValueBackgroundOpacityMaxValueFrameWidthMaxValue",
                                   header: "vtkTextProperty.h".}
## !!!Ignored construct:  virtual int GetOpacityBackgroundOpacityFrameFrameWidth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FrameWidth  of  << this -> FrameWidth ) ; return this -> FrameWidth ; } ;
## Error: expected ';'!!!

proc GetFontFamilyAsString*(this: var vtkTextProperty): cstring {.
    importcpp: "GetFontFamilyAsString", header: "vtkTextProperty.h".}
proc SetFontFamilyAsString*(this: var vtkTextProperty; _arg: cstring) {.
    importcpp: "SetFontFamilyAsString", header: "vtkTextProperty.h".}
proc SetFontFamily*(this: var vtkTextProperty; t: cint) {.importcpp: "SetFontFamily",
    header: "vtkTextProperty.h".}
proc GetFontFamily*(this: var vtkTextProperty): cint {.importcpp: "GetFontFamily",
    header: "vtkTextProperty.h".}
proc GetFontFamilyMinValue*(this: var vtkTextProperty): cint {.
    importcpp: "GetFontFamilyMinValue", header: "vtkTextProperty.h".}
proc SetFontFamilyToArial*(this: var vtkTextProperty) {.
    importcpp: "SetFontFamilyToArial", header: "vtkTextProperty.h".}
proc SetFontFamilyToCourier*(this: var vtkTextProperty) {.
    importcpp: "SetFontFamilyToCourier", header: "vtkTextProperty.h".}
proc SetFontFamilyToTimes*(this: var vtkTextProperty) {.
    importcpp: "SetFontFamilyToTimes", header: "vtkTextProperty.h".}
proc GetFontFamilyFromString*(f: cstring): cint {.
    importcpp: "vtkTextProperty::GetFontFamilyFromString(@)",
    header: "vtkTextProperty.h".}
proc GetFontFamilyAsString*(f: cint): cstring {.
    importcpp: "vtkTextProperty::GetFontFamilyAsString(@)",
    header: "vtkTextProperty.h".}
## !!!Ignored construct:  char * GetFontFile ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FontFile  of  << ( this -> FontFile ? this -> FontFile : (null) ) ) ; return this -> FontFile ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual void SetFontFile ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FontFile  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FontFile == nullptr && _arg == nullptr ) { return ; } if ( this -> FontFile && _arg && ( ! strcmp ( this -> FontFile , _arg ) ) ) { return ; } delete [ ] this -> FontFile ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FontFile = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FontFile = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

proc SetOpacityBackgroundOpacityFrameWidthFontSize*(this: var vtkTextProperty;
    _arg: cint) {.importcpp: "SetOpacityBackgroundOpacityFrameWidthFontSize",
                header: "vtkTextProperty.h".}
proc GetOpacityMinValueBackgroundOpacityMinValueFrameWidthMinValueFontSizeMinValue*(
    this: var vtkTextProperty): cint {.importcpp: "GetOpacityMinValueBackgroundOpacityMinValueFrameWidthMinValueFontSizeMinValue",
                                   header: "vtkTextProperty.h".}
proc GetOpacityMaxValueBackgroundOpacityMaxValueFrameWidthMaxValueFontSizeMaxValue*(
    this: var vtkTextProperty): cint {.importcpp: "GetOpacityMaxValueBackgroundOpacityMaxValueFrameWidthMaxValueFontSizeMaxValue",
                                   header: "vtkTextProperty.h".}
## !!!Ignored construct:  virtual int GetOpacityBackgroundOpacityFrameFrameWidthFontSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FontSize  of  << this -> FontSize ) ; return this -> FontSize ; } ;
## Error: expected ';'!!!

proc SetFrameBold*(this: var vtkTextProperty; _arg: vtkTypeBool) {.
    importcpp: "SetFrameBold", header: "vtkTextProperty.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetOpacityBackgroundOpacityFrameFrameWidthFontSizeBold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Bold  of  << this -> Bold ) ; return this -> Bold ; } ;
## Error: expected ';'!!!

proc BoldOn*(this: var vtkTextProperty) {.importcpp: "BoldOn",
                                      header: "vtkTextProperty.h".}
proc BoldOff*(this: var vtkTextProperty) {.importcpp: "BoldOff",
                                       header: "vtkTextProperty.h".}
  ## /@}
  ## /@{
  ## *
  ##  Enable/disable text italic.
  ##
proc SetFrameBoldItalic*(this: var vtkTextProperty; _arg: vtkTypeBool) {.
    importcpp: "SetFrameBoldItalic", header: "vtkTextProperty.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetOpacityBackgroundOpacityFrameFrameWidthFontSizeBoldItalic ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Italic  of  << this -> Italic ) ; return this -> Italic ; } ;
## Error: expected ';'!!!

proc ItalicOn*(this: var vtkTextProperty) {.importcpp: "ItalicOn",
                                        header: "vtkTextProperty.h".}
proc ItalicOff*(this: var vtkTextProperty) {.importcpp: "ItalicOff",
    header: "vtkTextProperty.h".}
  ## /@}
  ## /@{
  ## *
  ##  Enable/disable text shadow.
  ##
proc SetFrameBoldItalicShadow*(this: var vtkTextProperty; _arg: vtkTypeBool) {.
    importcpp: "SetFrameBoldItalicShadow", header: "vtkTextProperty.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetOpacityBackgroundOpacityFrameFrameWidthFontSizeBoldItalicShadow ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Shadow  of  << this -> Shadow ) ; return this -> Shadow ; } ;
## Error: expected ';'!!!

proc ShadowOn*(this: var vtkTextProperty) {.importcpp: "ShadowOn",
                                        header: "vtkTextProperty.h".}
proc ShadowOff*(this: var vtkTextProperty) {.importcpp: "ShadowOff",
    header: "vtkTextProperty.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the shadow offset, i.e. the distance from the text to
  ##  its shadow, in the same unit as FontSize.
  ##
proc SetShadowOffset*(this: var vtkTextProperty; _arg1: cint; _arg2: cint) {.
    importcpp: "SetShadowOffset", header: "vtkTextProperty.h".}
proc SetShadowOffset*(this: var vtkTextProperty; _arg: array[2, cint]) {.
    importcpp: "SetShadowOffset", header: "vtkTextProperty.h".}
## !!!Ignored construct:  virtual int * GetShadowOffset ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ShadowOffset  pointer  << this -> ShadowOffset ) ; return this -> ShadowOffset ; } VTK_WRAPEXCLUDE virtual void GetShadowOffset ( int data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> ShadowOffset [ i ] ; } } ;
## Error: expected ';'!!!

proc GetShadowColor*(this: var vtkTextProperty; color: array[3, cdouble]) {.
    importcpp: "GetShadowColor", header: "vtkTextProperty.h".}
proc SetOpacityBackgroundOpacityFrameWidthFontSizeJustification*(
    this: var vtkTextProperty; _arg: cint) {.importcpp: "SetOpacityBackgroundOpacityFrameWidthFontSizeJustification",
                                        header: "vtkTextProperty.h".}
proc GetOpacityMinValueBackgroundOpacityMinValueFrameWidthMinValueFontSizeMinValueJustificationMinValue*(
    this: var vtkTextProperty): cint {.importcpp: "GetOpacityMinValueBackgroundOpacityMinValueFrameWidthMinValueFontSizeMinValueJustificationMinValue",
                                   header: "vtkTextProperty.h".}
proc GetOpacityMaxValueBackgroundOpacityMaxValueFrameWidthMaxValueFontSizeMaxValueJustificationMaxValue*(
    this: var vtkTextProperty): cint {.importcpp: "GetOpacityMaxValueBackgroundOpacityMaxValueFrameWidthMaxValueFontSizeMaxValueJustificationMaxValue",
                                   header: "vtkTextProperty.h".}
## !!!Ignored construct:  virtual int GetOpacityBackgroundOpacityFrameFrameWidthFontSizeBoldItalicShadowJustification ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Justification  of  << this -> Justification ) ; return this -> Justification ; } ;
## Error: expected ';'!!!

proc SetJustificationToLeft*(this: var vtkTextProperty) {.
    importcpp: "SetJustificationToLeft", header: "vtkTextProperty.h".}
proc SetJustificationToCentered*(this: var vtkTextProperty) {.
    importcpp: "SetJustificationToCentered", header: "vtkTextProperty.h".}
proc SetJustificationToRight*(this: var vtkTextProperty) {.
    importcpp: "SetJustificationToRight", header: "vtkTextProperty.h".}
proc GetJustificationAsString*(this: var vtkTextProperty): cstring {.
    importcpp: "GetJustificationAsString", header: "vtkTextProperty.h".}
proc SetOpacityBackgroundOpacityFrameWidthFontSizeJustificationVerticalJustification*(
    this: var vtkTextProperty; _arg: cint) {.importcpp: "SetOpacityBackgroundOpacityFrameWidthFontSizeJustificationVerticalJustification",
                                        header: "vtkTextProperty.h".}
proc GetOpacityMinValueBackgroundOpacityMinValueFrameWidthMinValueFontSizeMinValueJustificationMinValueVerticalJustificationMinValue*(
    this: var vtkTextProperty): cint {.importcpp: "GetOpacityMinValueBackgroundOpacityMinValueFrameWidthMinValueFontSizeMinValueJustificationMinValueVerticalJustificationMinValue",
                                   header: "vtkTextProperty.h".}
proc GetOpacityMaxValueBackgroundOpacityMaxValueFrameWidthMaxValueFontSizeMaxValueJustificationMaxValueVerticalJustificationMaxValue*(
    this: var vtkTextProperty): cint {.importcpp: "GetOpacityMaxValueBackgroundOpacityMaxValueFrameWidthMaxValueFontSizeMaxValueJustificationMaxValueVerticalJustificationMaxValue",
                                   header: "vtkTextProperty.h".}
## !!!Ignored construct:  virtual int GetOpacityBackgroundOpacityFrameFrameWidthFontSizeBoldItalicShadowJustificationVerticalJustification ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << VerticalJustification  of  << this -> VerticalJustification ) ; return this -> VerticalJustification ; } ;
## Error: expected ';'!!!

proc SetVerticalJustificationToBottom*(this: var vtkTextProperty) {.
    importcpp: "SetVerticalJustificationToBottom", header: "vtkTextProperty.h".}
proc SetVerticalJustificationToCentered*(this: var vtkTextProperty) {.
    importcpp: "SetVerticalJustificationToCentered", header: "vtkTextProperty.h".}
proc SetVerticalJustificationToTop*(this: var vtkTextProperty) {.
    importcpp: "SetVerticalJustificationToTop", header: "vtkTextProperty.h".}
proc GetVerticalJustificationAsString*(this: var vtkTextProperty): cstring {.
    importcpp: "GetVerticalJustificationAsString", header: "vtkTextProperty.h".}
proc SetFrameBoldItalicShadowUseTightBoundingBox*(this: var vtkTextProperty;
    _arg: vtkTypeBool) {.importcpp: "SetFrameBoldItalicShadowUseTightBoundingBox",
                       header: "vtkTextProperty.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetOpacityBackgroundOpacityFrameFrameWidthFontSizeBoldItalicShadowJustificationVerticalJustificationUseTightBoundingBox ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseTightBoundingBox  of  << this -> UseTightBoundingBox ) ; return this -> UseTightBoundingBox ; } ;
## Error: expected ';'!!!

proc UseTightBoundingBoxOn*(this: var vtkTextProperty) {.
    importcpp: "UseTightBoundingBoxOn", header: "vtkTextProperty.h".}
proc UseTightBoundingBoxOff*(this: var vtkTextProperty) {.
    importcpp: "UseTightBoundingBoxOff", header: "vtkTextProperty.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the text's orientation (in degrees).
  ##
proc SetFrameBoldItalicShadowUseTightBoundingBoxOrientation*(
    this: var vtkTextProperty; _arg: cdouble) {.
    importcpp: "SetFrameBoldItalicShadowUseTightBoundingBoxOrientation",
    header: "vtkTextProperty.h".}
## !!!Ignored construct:  virtual double GetOpacityBackgroundOpacityFrameFrameWidthFontSizeBoldItalicShadowJustificationVerticalJustificationUseTightBoundingBoxOrientation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Orientation  of  << this -> Orientation ) ; return this -> Orientation ; } ;
## Error: expected ';'!!!

proc SetFrameBoldItalicShadowUseTightBoundingBoxOrientationLineSpacing*(
    this: var vtkTextProperty; _arg: cdouble) {.importcpp: "SetFrameBoldItalicShadowUseTightBoundingBoxOrientationLineSpacing",
    header: "vtkTextProperty.h".}
## !!!Ignored construct:  virtual double GetOpacityBackgroundOpacityFrameFrameWidthFontSizeBoldItalicShadowJustificationVerticalJustificationUseTightBoundingBoxOrientationLineSpacing ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LineSpacing  of  << this -> LineSpacing ) ; return this -> LineSpacing ; } ;
## Error: expected ';'!!!

proc SetFrameBoldItalicShadowUseTightBoundingBoxOrientationLineSpacingLineOffset*(
    this: var vtkTextProperty; _arg: cdouble) {.importcpp: "SetFrameBoldItalicShadowUseTightBoundingBoxOrientationLineSpacingLineOffset",
    header: "vtkTextProperty.h".}
## !!!Ignored construct:  virtual double GetOpacityBackgroundOpacityFrameFrameWidthFontSizeBoldItalicShadowJustificationVerticalJustificationUseTightBoundingBoxOrientationLineSpacingLineOffset ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LineOffset  of  << this -> LineOffset ) ; return this -> LineOffset ; } ;
## Error: expected ';'!!!

proc SetFrameBoldItalicShadowUseTightBoundingBoxOrientationLineSpacingLineOffsetCellOffset*(
    this: var vtkTextProperty; _arg: cdouble) {.importcpp: "SetFrameBoldItalicShadowUseTightBoundingBoxOrientationLineSpacingLineOffsetCellOffset",
    header: "vtkTextProperty.h".}
## !!!Ignored construct:  virtual double GetOpacityBackgroundOpacityFrameFrameWidthFontSizeBoldItalicShadowJustificationVerticalJustificationUseTightBoundingBoxOrientationLineSpacingLineOffsetCellOffset ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CellOffset  of  << this -> CellOffset ) ; return this -> CellOffset ; } ;
## Error: expected ';'!!!

proc SetFrameBoldItalicShadowUseTightBoundingBoxOrientationLineSpacingLineOffsetCellOffsetInteriorLinesVisibility*(
    this: var vtkTextProperty; _arg: bool) {.importcpp: "SetFrameBoldItalicShadowUseTightBoundingBoxOrientationLineSpacingLineOffsetCellOffsetInteriorLinesVisibility",
                                        header: "vtkTextProperty.h".}
## !!!Ignored construct:  virtual bool GetOpacityBackgroundOpacityFrameFrameWidthFontSizeBoldItalicShadowJustificationVerticalJustificationUseTightBoundingBoxOrientationLineSpacingLineOffsetCellOffsetInteriorLinesVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InteriorLinesVisibility  of  << this -> InteriorLinesVisibility ) ; return this -> InteriorLinesVisibility ; } ;
## Error: expected ';'!!!

proc SetFrameBoldItalicShadowUseTightBoundingBoxOrientationLineSpacingLineOffsetCellOffsetInteriorLinesVisibilityInteriorLinesWidth*(
    this: var vtkTextProperty; _arg: cint) {.importcpp: "SetFrameBoldItalicShadowUseTightBoundingBoxOrientationLineSpacingLineOffsetCellOffsetInteriorLinesVisibilityInteriorLinesWidth",
                                        header: "vtkTextProperty.h".}
## !!!Ignored construct:  virtual int GetOpacityBackgroundOpacityFrameFrameWidthFontSizeBoldItalicShadowJustificationVerticalJustificationUseTightBoundingBoxOrientationLineSpacingLineOffsetCellOffsetInteriorLinesVisibilityInteriorLinesWidth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InteriorLinesWidth  of  << this -> InteriorLinesWidth ) ; return this -> InteriorLinesWidth ; } ;
## Error: expected ';'!!!

proc SetColorBackgroundColorFrameColorInteriorLinesColor*(
    this: var vtkTextProperty; _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetColorBackgroundColorFrameColorInteriorLinesColor",
    header: "vtkTextProperty.h".}
proc SetColorBackgroundColorFrameColorInteriorLinesColor*(
    this: var vtkTextProperty; _arg: array[3, cdouble]) {.
    importcpp: "SetColorBackgroundColorFrameColorInteriorLinesColor",
    header: "vtkTextProperty.h".}
## !!!Ignored construct:  virtual double * GetColorBackgroundColorFrameColorInteriorLinesColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << InteriorLinesColor  pointer  << this -> InteriorLinesColor ) ; return this -> InteriorLinesColor ; } VTK_WRAPEXCLUDE virtual void GetColorBackgroundColorFrameColorInteriorLinesColor ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> InteriorLinesColor [ 0 ] ; _arg2 = this -> InteriorLinesColor [ 1 ] ; _arg3 = this -> InteriorLinesColor [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << InteriorLinesColor  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetColorBackgroundColorFrameColorInteriorLinesColor ( double _arg [ 3 ] ) { this -> GetColorBackgroundColorFrameColorInteriorLinesColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc ShallowCopy*(this: var vtkTextProperty; tprop: ptr vtkTextProperty) {.
    importcpp: "ShallowCopy", header: "vtkTextProperty.h".}
proc GetFontFamilyAsString*(this: var vtkTextProperty; f: cint): cstring {.
    importcpp: "GetFontFamilyAsString", header: "vtkTextProperty.h".}
proc SetFontFamily*(this: var vtkTextProperty; t: cint) {.importcpp: "SetFontFamily",
    header: "vtkTextProperty.h".}
proc SetFontFamilyToArial*(this: var vtkTextProperty) {.
    importcpp: "SetFontFamilyToArial", header: "vtkTextProperty.h".}
proc SetFontFamilyToCourier*(this: var vtkTextProperty) {.
    importcpp: "SetFontFamilyToCourier", header: "vtkTextProperty.h".}
proc SetFontFamilyToTimes*(this: var vtkTextProperty) {.
    importcpp: "SetFontFamilyToTimes", header: "vtkTextProperty.h".}
proc GetFontFamilyFromString*(this: var vtkTextProperty; f: cstring): cint {.
    importcpp: "GetFontFamilyFromString", header: "vtkTextProperty.h".}
proc GetFontFamily*(this: var vtkTextProperty): cint {.importcpp: "GetFontFamily",
    header: "vtkTextProperty.h".}
proc GetJustificationAsString*(this: var vtkTextProperty): cstring {.
    importcpp: "GetJustificationAsString", header: "vtkTextProperty.h".}
proc GetVerticalJustificationAsString*(this: var vtkTextProperty): cstring {.
    importcpp: "GetVerticalJustificationAsString", header: "vtkTextProperty.h".}