## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkViewTheme.h
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
##  @class   vtkViewTheme
##  @brief   Sets theme colors for a graphical view.
##
##
##  This may be set on any subclass of vtkView.  The view class will attempt
##  to use the values set in the theme to customize the view.  Views will not
##  generally use every aspect of the theme.
##  NOTICE: This class will be deprecated in favor of a more robust
##  solution based on style sheets.  Do not become overly-dependent on the
##  functionality of themes.
##

import
  vtkObject, vtkViewsCoreModule

discard "forward decl of vtkScalarsToColors"
discard "forward decl of vtkTextProperty"
type
  vtkViewTheme* {.importcpp: "vtkViewTheme", header: "vtkViewTheme.h", bycopy.} = object of vtkObject
    vtkViewTheme* {.importc: "vtkViewTheme".}: VTK_NEWINSTANCE


proc New*(): ptr vtkViewTheme {.importcpp: "vtkViewTheme::New(@)",
                            header: "vtkViewTheme.h".}
type
  vtkViewThemeSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkViewTheme::IsTypeOf(@)", header: "vtkViewTheme.h".}
proc IsA*(this: var vtkViewTheme; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkViewTheme.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkViewTheme {.
    importcpp: "vtkViewTheme::SafeDownCast(@)", header: "vtkViewTheme.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkViewTheme :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkViewTheme :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkViewTheme :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkViewTheme; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkViewTheme.h".}
proc SetPointSize*(this: var vtkViewTheme; _arg: cdouble) {.importcpp: "SetPointSize",
    header: "vtkViewTheme.h".}
## !!!Ignored construct:  virtual double GetPointSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PointSize  of  << this -> PointSize ) ; return this -> PointSize ; } ;
## Error: expected ';'!!!

proc SetPointSizeLineWidth*(this: var vtkViewTheme; _arg: cdouble) {.
    importcpp: "SetPointSizeLineWidth", header: "vtkViewTheme.h".}
## !!!Ignored construct:  virtual double GetPointSizeLineWidth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LineWidth  of  << this -> LineWidth ) ; return this -> LineWidth ; } ;
## Error: expected ';'!!!

proc SetPointColor*(this: var vtkViewTheme; _arg1: cdouble; _arg2: cdouble;
                   _arg3: cdouble) {.importcpp: "SetPointColor",
                                   header: "vtkViewTheme.h".}
proc SetPointColor*(this: var vtkViewTheme; _arg: array[3, cdouble]) {.
    importcpp: "SetPointColor", header: "vtkViewTheme.h".}
## !!!Ignored construct:  virtual double * GetPointColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << PointColor  pointer  << this -> PointColor ) ; return this -> PointColor ; } VTK_WRAPEXCLUDE virtual void GetPointColor ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> PointColor [ 0 ] ; _arg2 = this -> PointColor [ 1 ] ; _arg3 = this -> PointColor [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << PointColor  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetPointColor ( double _arg [ 3 ] ) { this -> GetPointColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetPointSizeLineWidthPointOpacity*(this: var vtkViewTheme; _arg: cdouble) {.
    importcpp: "SetPointSizeLineWidthPointOpacity", header: "vtkViewTheme.h".}
## !!!Ignored construct:  virtual double GetPointSizeLineWidthPointOpacity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PointOpacity  of  << this -> PointOpacity ) ; return this -> PointOpacity ; } ;
## Error: expected ';'!!!

proc SetPointHueRange*(this: var vtkViewTheme; mn: cdouble; mx: cdouble) {.
    importcpp: "SetPointHueRange", header: "vtkViewTheme.h".}
proc SetPointHueRange*(this: var vtkViewTheme; rng: array[2, cdouble]) {.
    importcpp: "SetPointHueRange", header: "vtkViewTheme.h".}
proc GetPointHueRange*(this: var vtkViewTheme): ptr cdouble {.
    importcpp: "GetPointHueRange", header: "vtkViewTheme.h".}
proc GetPointHueRange*(this: var vtkViewTheme; mn: var cdouble; mx: var cdouble) {.
    importcpp: "GetPointHueRange", header: "vtkViewTheme.h".}
proc GetPointHueRange*(this: var vtkViewTheme; rng: array[2, cdouble]) {.
    importcpp: "GetPointHueRange", header: "vtkViewTheme.h".}
proc SetPointSaturationRange*(this: var vtkViewTheme; mn: cdouble; mx: cdouble) {.
    importcpp: "SetPointSaturationRange", header: "vtkViewTheme.h".}
proc SetPointSaturationRange*(this: var vtkViewTheme; rng: array[2, cdouble]) {.
    importcpp: "SetPointSaturationRange", header: "vtkViewTheme.h".}
proc GetPointSaturationRange*(this: var vtkViewTheme): ptr cdouble {.
    importcpp: "GetPointSaturationRange", header: "vtkViewTheme.h".}
proc GetPointSaturationRange*(this: var vtkViewTheme; mn: var cdouble; mx: var cdouble) {.
    importcpp: "GetPointSaturationRange", header: "vtkViewTheme.h".}
proc GetPointSaturationRange*(this: var vtkViewTheme; rng: array[2, cdouble]) {.
    importcpp: "GetPointSaturationRange", header: "vtkViewTheme.h".}
proc SetPointValueRange*(this: var vtkViewTheme; mn: cdouble; mx: cdouble) {.
    importcpp: "SetPointValueRange", header: "vtkViewTheme.h".}
proc SetPointValueRange*(this: var vtkViewTheme; rng: array[2, cdouble]) {.
    importcpp: "SetPointValueRange", header: "vtkViewTheme.h".}
proc GetPointValueRange*(this: var vtkViewTheme): ptr cdouble {.
    importcpp: "GetPointValueRange", header: "vtkViewTheme.h".}
proc GetPointValueRange*(this: var vtkViewTheme; mn: var cdouble; mx: var cdouble) {.
    importcpp: "GetPointValueRange", header: "vtkViewTheme.h".}
proc GetPointValueRange*(this: var vtkViewTheme; rng: array[2, cdouble]) {.
    importcpp: "GetPointValueRange", header: "vtkViewTheme.h".}
proc SetPointAlphaRange*(this: var vtkViewTheme; mn: cdouble; mx: cdouble) {.
    importcpp: "SetPointAlphaRange", header: "vtkViewTheme.h".}
proc SetPointAlphaRange*(this: var vtkViewTheme; rng: array[2, cdouble]) {.
    importcpp: "SetPointAlphaRange", header: "vtkViewTheme.h".}
proc GetPointAlphaRange*(this: var vtkViewTheme): ptr cdouble {.
    importcpp: "GetPointAlphaRange", header: "vtkViewTheme.h".}
proc GetPointAlphaRange*(this: var vtkViewTheme; mn: var cdouble; mx: var cdouble) {.
    importcpp: "GetPointAlphaRange", header: "vtkViewTheme.h".}
proc GetPointAlphaRange*(this: var vtkViewTheme; rng: array[2, cdouble]) {.
    importcpp: "GetPointAlphaRange", header: "vtkViewTheme.h".}
proc GetnamePointLookupTable*(this: var vtkViewTheme): ptr vtkScalarsToColors {.
    importcpp: "GetnamePointLookupTable", header: "vtkViewTheme.h".}
proc SetPointLookupTable*(this: var vtkViewTheme; lut: ptr vtkScalarsToColors) {.
    importcpp: "SetPointLookupTable", header: "vtkViewTheme.h".}
proc SetPointSizeLineWidthPointOpacityScalePointLookupTable*(
    this: var vtkViewTheme; _arg: bool) {.importcpp: "SetPointSizeLineWidthPointOpacityScalePointLookupTable",
                                     header: "vtkViewTheme.h".}
## !!!Ignored construct:  virtual bool GetPointSizeLineWidthPointOpacityScalePointLookupTable ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalePointLookupTable  of  << this -> ScalePointLookupTable ) ; return this -> ScalePointLookupTable ; } ;
## Error: expected ';'!!!

proc ScalePointLookupTableOn*(this: var vtkViewTheme) {.
    importcpp: "ScalePointLookupTableOn", header: "vtkViewTheme.h".}
proc ScalePointLookupTableOff*(this: var vtkViewTheme) {.
    importcpp: "ScalePointLookupTableOff", header: "vtkViewTheme.h".}
  ## /@}
  ## /@{
  ## *
  ##  The color and opacity of cells or edges when not mapped through
  ##  a lookup table.
  ##
proc SetPointColorCellColor*(this: var vtkViewTheme; _arg1: cdouble; _arg2: cdouble;
                            _arg3: cdouble) {.importcpp: "SetPointColorCellColor",
    header: "vtkViewTheme.h".}
proc SetPointColorCellColor*(this: var vtkViewTheme; _arg: array[3, cdouble]) {.
    importcpp: "SetPointColorCellColor", header: "vtkViewTheme.h".}
## !!!Ignored construct:  virtual double * GetPointColorCellColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << CellColor  pointer  << this -> CellColor ) ; return this -> CellColor ; } VTK_WRAPEXCLUDE virtual void GetPointColorCellColor ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> CellColor [ 0 ] ; _arg2 = this -> CellColor [ 1 ] ; _arg3 = this -> CellColor [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << CellColor  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetPointColorCellColor ( double _arg [ 3 ] ) { this -> GetPointColorCellColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetPointSizeLineWidthPointOpacityScalePointLookupTableCellOpacity*(
    this: var vtkViewTheme; _arg: cdouble) {.importcpp: "SetPointSizeLineWidthPointOpacityScalePointLookupTableCellOpacity",
                                        header: "vtkViewTheme.h".}
## !!!Ignored construct:  virtual double GetPointSizeLineWidthPointOpacityScalePointLookupTableCellOpacity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CellOpacity  of  << this -> CellOpacity ) ; return this -> CellOpacity ; } ;
## Error: expected ';'!!!

proc SetCellHueRange*(this: var vtkViewTheme; mn: cdouble; mx: cdouble) {.
    importcpp: "SetCellHueRange", header: "vtkViewTheme.h".}
proc SetCellHueRange*(this: var vtkViewTheme; rng: array[2, cdouble]) {.
    importcpp: "SetCellHueRange", header: "vtkViewTheme.h".}
proc GetCellHueRange*(this: var vtkViewTheme): ptr cdouble {.
    importcpp: "GetCellHueRange", header: "vtkViewTheme.h".}
proc GetCellHueRange*(this: var vtkViewTheme; mn: var cdouble; mx: var cdouble) {.
    importcpp: "GetCellHueRange", header: "vtkViewTheme.h".}
proc GetCellHueRange*(this: var vtkViewTheme; rng: array[2, cdouble]) {.
    importcpp: "GetCellHueRange", header: "vtkViewTheme.h".}
proc SetCellSaturationRange*(this: var vtkViewTheme; mn: cdouble; mx: cdouble) {.
    importcpp: "SetCellSaturationRange", header: "vtkViewTheme.h".}
proc SetCellSaturationRange*(this: var vtkViewTheme; rng: array[2, cdouble]) {.
    importcpp: "SetCellSaturationRange", header: "vtkViewTheme.h".}
proc GetCellSaturationRange*(this: var vtkViewTheme): ptr cdouble {.
    importcpp: "GetCellSaturationRange", header: "vtkViewTheme.h".}
proc GetCellSaturationRange*(this: var vtkViewTheme; mn: var cdouble; mx: var cdouble) {.
    importcpp: "GetCellSaturationRange", header: "vtkViewTheme.h".}
proc GetCellSaturationRange*(this: var vtkViewTheme; rng: array[2, cdouble]) {.
    importcpp: "GetCellSaturationRange", header: "vtkViewTheme.h".}
proc SetCellValueRange*(this: var vtkViewTheme; mn: cdouble; mx: cdouble) {.
    importcpp: "SetCellValueRange", header: "vtkViewTheme.h".}
proc SetCellValueRange*(this: var vtkViewTheme; rng: array[2, cdouble]) {.
    importcpp: "SetCellValueRange", header: "vtkViewTheme.h".}
proc GetCellValueRange*(this: var vtkViewTheme): ptr cdouble {.
    importcpp: "GetCellValueRange", header: "vtkViewTheme.h".}
proc GetCellValueRange*(this: var vtkViewTheme; mn: var cdouble; mx: var cdouble) {.
    importcpp: "GetCellValueRange", header: "vtkViewTheme.h".}
proc GetCellValueRange*(this: var vtkViewTheme; rng: array[2, cdouble]) {.
    importcpp: "GetCellValueRange", header: "vtkViewTheme.h".}
proc SetCellAlphaRange*(this: var vtkViewTheme; mn: cdouble; mx: cdouble) {.
    importcpp: "SetCellAlphaRange", header: "vtkViewTheme.h".}
proc SetCellAlphaRange*(this: var vtkViewTheme; rng: array[2, cdouble]) {.
    importcpp: "SetCellAlphaRange", header: "vtkViewTheme.h".}
proc GetCellAlphaRange*(this: var vtkViewTheme): ptr cdouble {.
    importcpp: "GetCellAlphaRange", header: "vtkViewTheme.h".}
proc GetCellAlphaRange*(this: var vtkViewTheme; mn: var cdouble; mx: var cdouble) {.
    importcpp: "GetCellAlphaRange", header: "vtkViewTheme.h".}
proc GetCellAlphaRange*(this: var vtkViewTheme; rng: array[2, cdouble]) {.
    importcpp: "GetCellAlphaRange", header: "vtkViewTheme.h".}
proc GetnamePointLookupTableCellLookupTable*(this: var vtkViewTheme): ptr vtkScalarsToColors {.
    importcpp: "GetnamePointLookupTableCellLookupTable", header: "vtkViewTheme.h".}
proc SetCellLookupTable*(this: var vtkViewTheme; lut: ptr vtkScalarsToColors) {.
    importcpp: "SetCellLookupTable", header: "vtkViewTheme.h".}
proc SetPointSizeLineWidthPointOpacityScalePointLookupTableCellOpacityScaleCellLookupTable*(
    this: var vtkViewTheme; _arg: bool) {.importcpp: "SetPointSizeLineWidthPointOpacityScalePointLookupTableCellOpacityScaleCellLookupTable",
                                     header: "vtkViewTheme.h".}
## !!!Ignored construct:  virtual bool GetPointSizeLineWidthPointOpacityScalePointLookupTableCellOpacityScaleCellLookupTable ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScaleCellLookupTable  of  << this -> ScaleCellLookupTable ) ; return this -> ScaleCellLookupTable ; } ;
## Error: expected ';'!!!

proc ScaleCellLookupTableOn*(this: var vtkViewTheme) {.
    importcpp: "ScaleCellLookupTableOn", header: "vtkViewTheme.h".}
proc ScaleCellLookupTableOff*(this: var vtkViewTheme) {.
    importcpp: "ScaleCellLookupTableOff", header: "vtkViewTheme.h".}
  ## /@}
  ## /@{
  ## *
  ##  The color of any outlines in the view.
  ##
proc SetPointColorCellColorOutlineColor*(this: var vtkViewTheme; _arg1: cdouble;
                                        _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetPointColorCellColorOutlineColor", header: "vtkViewTheme.h".}
proc SetPointColorCellColorOutlineColor*(this: var vtkViewTheme;
                                        _arg: array[3, cdouble]) {.
    importcpp: "SetPointColorCellColorOutlineColor", header: "vtkViewTheme.h".}
## !!!Ignored construct:  virtual double * GetPointColorCellColorOutlineColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << OutlineColor  pointer  << this -> OutlineColor ) ; return this -> OutlineColor ; } VTK_WRAPEXCLUDE virtual void GetPointColorCellColorOutlineColor ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> OutlineColor [ 0 ] ; _arg2 = this -> OutlineColor [ 1 ] ; _arg3 = this -> OutlineColor [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << OutlineColor  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetPointColorCellColorOutlineColor ( double _arg [ 3 ] ) { this -> GetPointColorCellColorOutlineColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetPointColorCellColorOutlineColorSelectedPointColor*(
    this: var vtkViewTheme; _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetPointColorCellColorOutlineColorSelectedPointColor",
    header: "vtkViewTheme.h".}
proc SetPointColorCellColorOutlineColorSelectedPointColor*(
    this: var vtkViewTheme; _arg: array[3, cdouble]) {.
    importcpp: "SetPointColorCellColorOutlineColorSelectedPointColor",
    header: "vtkViewTheme.h".}
## !!!Ignored construct:  virtual double * GetPointColorCellColorOutlineColorSelectedPointColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << SelectedPointColor  pointer  << this -> SelectedPointColor ) ; return this -> SelectedPointColor ; } VTK_WRAPEXCLUDE virtual void GetPointColorCellColorOutlineColorSelectedPointColor ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> SelectedPointColor [ 0 ] ; _arg2 = this -> SelectedPointColor [ 1 ] ; _arg3 = this -> SelectedPointColor [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << SelectedPointColor  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetPointColorCellColorOutlineColorSelectedPointColor ( double _arg [ 3 ] ) { this -> GetPointColorCellColorOutlineColorSelectedPointColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetPointSizeLineWidthPointOpacityScalePointLookupTableCellOpacityScaleCellLookupTableSelectedPointOpacity*(
    this: var vtkViewTheme; _arg: cdouble) {.importcpp: "SetPointSizeLineWidthPointOpacityScalePointLookupTableCellOpacityScaleCellLookupTableSelectedPointOpacity",
                                        header: "vtkViewTheme.h".}
## !!!Ignored construct:  virtual double GetPointSizeLineWidthPointOpacityScalePointLookupTableCellOpacityScaleCellLookupTableSelectedPointOpacity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SelectedPointOpacity  of  << this -> SelectedPointOpacity ) ; return this -> SelectedPointOpacity ; } ;
## Error: expected ';'!!!

proc SetPointColorCellColorOutlineColorSelectedPointColorSelectedCellColor*(
    this: var vtkViewTheme; _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.importcpp: "SetPointColorCellColorOutlineColorSelectedPointColorSelectedCellColor",
    header: "vtkViewTheme.h".}
proc SetPointColorCellColorOutlineColorSelectedPointColorSelectedCellColor*(
    this: var vtkViewTheme; _arg: array[3, cdouble]) {.importcpp: "SetPointColorCellColorOutlineColorSelectedPointColorSelectedCellColor",
    header: "vtkViewTheme.h".}
## !!!Ignored construct:  virtual double * GetPointColorCellColorOutlineColorSelectedPointColorSelectedCellColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << SelectedCellColor  pointer  << this -> SelectedCellColor ) ; return this -> SelectedCellColor ; } VTK_WRAPEXCLUDE virtual void GetPointColorCellColorOutlineColorSelectedPointColorSelectedCellColor ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> SelectedCellColor [ 0 ] ; _arg2 = this -> SelectedCellColor [ 1 ] ; _arg3 = this -> SelectedCellColor [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << SelectedCellColor  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetPointColorCellColorOutlineColorSelectedPointColorSelectedCellColor ( double _arg [ 3 ] ) { this -> GetPointColorCellColorOutlineColorSelectedPointColorSelectedCellColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetPointSizeLineWidthPointOpacityScalePointLookupTableCellOpacityScaleCellLookupTableSelectedPointOpacitySelectedCellOpacity*(
    this: var vtkViewTheme; _arg: cdouble) {.importcpp: "SetPointSizeLineWidthPointOpacityScalePointLookupTableCellOpacityScaleCellLookupTableSelectedPointOpacitySelectedCellOpacity",
                                        header: "vtkViewTheme.h".}
## !!!Ignored construct:  virtual double GetPointSizeLineWidthPointOpacityScalePointLookupTableCellOpacityScaleCellLookupTableSelectedPointOpacitySelectedCellOpacity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SelectedCellOpacity  of  << this -> SelectedCellOpacity ) ; return this -> SelectedCellOpacity ; } ;
## Error: expected ';'!!!

proc SetPointColorCellColorOutlineColorSelectedPointColorSelectedCellColorBackgroundColor*(
    this: var vtkViewTheme; _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.importcpp: "SetPointColorCellColorOutlineColorSelectedPointColorSelectedCellColorBackgroundColor",
    header: "vtkViewTheme.h".}
proc SetPointColorCellColorOutlineColorSelectedPointColorSelectedCellColorBackgroundColor*(
    this: var vtkViewTheme; _arg: array[3, cdouble]) {.importcpp: "SetPointColorCellColorOutlineColorSelectedPointColorSelectedCellColorBackgroundColor",
    header: "vtkViewTheme.h".}
## !!!Ignored construct:  virtual double * GetPointColorCellColorOutlineColorSelectedPointColorSelectedCellColorBackgroundColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << BackgroundColor  pointer  << this -> BackgroundColor ) ; return this -> BackgroundColor ; } VTK_WRAPEXCLUDE virtual void GetPointColorCellColorOutlineColorSelectedPointColorSelectedCellColorBackgroundColor ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> BackgroundColor [ 0 ] ; _arg2 = this -> BackgroundColor [ 1 ] ; _arg3 = this -> BackgroundColor [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << BackgroundColor  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetPointColorCellColorOutlineColorSelectedPointColorSelectedCellColorBackgroundColor ( double _arg [ 3 ] ) { this -> GetPointColorCellColorOutlineColorSelectedPointColorSelectedCellColorBackgroundColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetPointColorCellColorOutlineColorSelectedPointColorSelectedCellColorBackgroundColorBackgroundColor2*(
    this: var vtkViewTheme; _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.importcpp: "SetPointColorCellColorOutlineColorSelectedPointColorSelectedCellColorBackgroundColorBackgroundColor2",
    header: "vtkViewTheme.h".}
proc SetPointColorCellColorOutlineColorSelectedPointColorSelectedCellColorBackgroundColorBackgroundColor2*(
    this: var vtkViewTheme; _arg: array[3, cdouble]) {.importcpp: "SetPointColorCellColorOutlineColorSelectedPointColorSelectedCellColorBackgroundColorBackgroundColor2",
    header: "vtkViewTheme.h".}
## !!!Ignored construct:  virtual double * GetPointColorCellColorOutlineColorSelectedPointColorSelectedCellColorBackgroundColorBackgroundColor2 ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << BackgroundColor2  pointer  << this -> BackgroundColor2 ) ; return this -> BackgroundColor2 ; } VTK_WRAPEXCLUDE virtual void GetPointColorCellColorOutlineColorSelectedPointColorSelectedCellColorBackgroundColorBackgroundColor2 ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> BackgroundColor2 [ 0 ] ; _arg2 = this -> BackgroundColor2 [ 1 ] ; _arg3 = this -> BackgroundColor2 [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << BackgroundColor2  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetPointColorCellColorOutlineColorSelectedPointColorSelectedCellColorBackgroundColorBackgroundColor2 ( double _arg [ 3 ] ) { this -> GetPointColorCellColorOutlineColorSelectedPointColorSelectedCellColorBackgroundColorBackgroundColor2 ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetPointTextProperty*(this: var vtkViewTheme; tprop: ptr vtkTextProperty) {.
    importcpp: "SetPointTextProperty", header: "vtkViewTheme.h".}
proc GetnamePointLookupTableCellLookupTablePointTextProperty*(
    this: var vtkViewTheme): ptr vtkTextProperty {.
    importcpp: "GetnamePointLookupTableCellLookupTablePointTextProperty",
    header: "vtkViewTheme.h".}
  ## /@}
  ## /@{
  ## *
  ##  The text property to use for labeling edges/cells.
  ##
proc SetCellTextProperty*(this: var vtkViewTheme; tprop: ptr vtkTextProperty) {.
    importcpp: "SetCellTextProperty", header: "vtkViewTheme.h".}
proc GetnamePointLookupTableCellLookupTablePointTextPropertyCellTextProperty*(
    this: var vtkViewTheme): ptr vtkTextProperty {.importcpp: "GetnamePointLookupTableCellLookupTablePointTextPropertyCellTextProperty",
    header: "vtkViewTheme.h".}
  ## /@}
  ## /@{
  ## *
  ##  The color to use for labeling graph vertices.
  ##  This is deprecated. Use GetPointTextProperty()->SetColor() instead.
  ##
proc SetVertexLabelColor*(this: var vtkViewTheme; r: cdouble; g: cdouble; b: cdouble) {.
    importcpp: "SetVertexLabelColor", header: "vtkViewTheme.h".}
proc SetVertexLabelColor*(this: var vtkViewTheme; c: array[3, cdouble]) {.
    importcpp: "SetVertexLabelColor", header: "vtkViewTheme.h".}
proc GetVertexLabelColor*(this: var vtkViewTheme): ptr cdouble {.
    importcpp: "GetVertexLabelColor", header: "vtkViewTheme.h".}
proc GetVertexLabelColor*(this: var vtkViewTheme; r: var cdouble; g: var cdouble;
                         b: var cdouble) {.importcpp: "GetVertexLabelColor",
                                        header: "vtkViewTheme.h".}
proc GetVertexLabelColor*(this: var vtkViewTheme; c: array[3, cdouble]) {.
    importcpp: "GetVertexLabelColor", header: "vtkViewTheme.h".}
proc SetEdgeLabelColor*(this: var vtkViewTheme; r: cdouble; g: cdouble; b: cdouble) {.
    importcpp: "SetEdgeLabelColor", header: "vtkViewTheme.h".}
proc SetEdgeLabelColor*(this: var vtkViewTheme; c: array[3, cdouble]) {.
    importcpp: "SetEdgeLabelColor", header: "vtkViewTheme.h".}
proc GetEdgeLabelColor*(this: var vtkViewTheme): ptr cdouble {.
    importcpp: "GetEdgeLabelColor", header: "vtkViewTheme.h".}
proc GetEdgeLabelColor*(this: var vtkViewTheme; r: var cdouble; g: var cdouble;
                       b: var cdouble) {.importcpp: "GetEdgeLabelColor",
                                      header: "vtkViewTheme.h".}
proc GetEdgeLabelColor*(this: var vtkViewTheme; c: array[3, cdouble]) {.
    importcpp: "GetEdgeLabelColor", header: "vtkViewTheme.h".}
proc CreateOceanTheme*(): ptr vtkViewTheme {.
    importcpp: "vtkViewTheme::CreateOceanTheme(@)", header: "vtkViewTheme.h".}
proc CreateMellowTheme*(): ptr vtkViewTheme {.
    importcpp: "vtkViewTheme::CreateMellowTheme(@)", header: "vtkViewTheme.h".}
proc CreateNeonTheme*(): ptr vtkViewTheme {.importcpp: "vtkViewTheme::CreateNeonTheme(@)",
                                        header: "vtkViewTheme.h".}
proc LookupMatchesPointTheme*(this: var vtkViewTheme; s2c: ptr vtkScalarsToColors): bool {.
    importcpp: "LookupMatchesPointTheme", header: "vtkViewTheme.h".}
proc LookupMatchesCellTheme*(this: var vtkViewTheme; s2c: ptr vtkScalarsToColors): bool {.
    importcpp: "LookupMatchesCellTheme", header: "vtkViewTheme.h".}