## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkColorTransferFunction.h
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
##  @class   vtkColorTransferFunction
##  @brief   Defines a transfer function for mapping a
##  property to an RGB color value.
##
##
##  vtkColorTransferFunction is a color mapping in RGB or HSV space that
##  uses piecewise hermite functions to allow interpolation that can be
##  piecewise constant, piecewise linear, or somewhere in-between
##  (a modified piecewise hermite function that squishes the function
##  according to a sharpness parameter). The function also allows for
##  the specification of the midpoint (the place where the function
##  reaches the average of the two bounding nodes) as a normalize distance
##  between nodes.
##  See the description of class vtkPiecewiseFunction for an explanation of
##  midpoint and sharpness.
##
##  @sa
##  vtkPiecewiseFunction
##

import
  vtkRenderingCoreModule, vtkScalarsToColors

discard "forward decl of vtkColorTransferFunctionInternals"
discard "forward decl of vtkDoubleArray"
const
  VTK_CTF_RGB* = 0
  VTK_CTF_HSV* = 1
  VTK_CTF_LAB* = 2
  VTK_CTF_DIVERGING* = 3
  VTK_CTF_LAB_CIEDE2000* = 4
  VTK_CTF_STEP* = 5
  VTK_CTF_LINEAR* = 0
  VTK_CTF_LOG10* = 1

type
  vtkColorTransferFunction* {.importcpp: "vtkColorTransferFunction",
                             header: "vtkColorTransferFunction.h", bycopy.} = object of vtkScalarsToColors
    vtkColorTransferFunction* {.importc: "vtkColorTransferFunction".}: VTK_NEWINSTANCE
    ## *
    ##  Determines the function value outside of defined points
    ##  Zero = always return 0.0 outside of defined points
    ##  One  = clamp to the lowest value below defined points and
    ##  highest value above defined points
    ##
    ## *
    ##  The color space in which interpolation is performed.
    ##
    ## *
    ##  Specify if HSV is wrap or not
    ##
    ## *
    ##  The color interpolation scale (linear or logarithmic).
    ##
    ## *
    ##  The color to use for not-a-number.
    ##
    ## *
    ##  The opacity to use for not-a-number.
    ##
    ## *
    ##  The below-range color.
    ##
    ## *
    ##  Flag indicating whether below-range color should be used.
    ##
    ## *
    ##  The above-range color.
    ##
    ## *
    ##  Flag indicating whether below-range color should be used.
    ##
    ## *
    ##  Temporary array to store data from the nodes.
    ##
    ## *
    ##  The min and max node locations
    ##
    ## *
    ##  Temporary storage for an evaluated color (0 to 255 RGBA A=255)
    ##
    ## *
    ##  If on, the same scalar value may have more than one node assigned to it.
    ##
    ## *
    ##  Temporary storage for the size of the table. Set in the method GetTable()
    ##  and queried in GetNumberOfAvailableColors().
    ##
    ## *
    ##  Set the range of scalars being mapped. This method has no functionality
    ##  in this subclass of vtkScalarsToColors.
    ##


proc New*(): ptr vtkColorTransferFunction {.importcpp: "vtkColorTransferFunction::New(@)",
                                        header: "vtkColorTransferFunction.h".}
type
  vtkColorTransferFunctionSuperclass* = vtkScalarsToColors

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkColorTransferFunction::IsTypeOf(@)",
    header: "vtkColorTransferFunction.h".}
proc IsA*(this: var vtkColorTransferFunction; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkColorTransferFunction.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkColorTransferFunction {.
    importcpp: "vtkColorTransferFunction::SafeDownCast(@)",
    header: "vtkColorTransferFunction.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkColorTransferFunction :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkScalarsToColors :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkColorTransferFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkColorTransferFunction :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc DeepCopy*(this: var vtkColorTransferFunction; f: ptr vtkScalarsToColors) {.
    importcpp: "DeepCopy", header: "vtkColorTransferFunction.h".}
proc ShallowCopy*(this: var vtkColorTransferFunction;
                 f: ptr vtkColorTransferFunction) {.importcpp: "ShallowCopy",
    header: "vtkColorTransferFunction.h".}
proc PrintSelf*(this: var vtkColorTransferFunction; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkColorTransferFunction.h".}
proc GetSize*(this: var vtkColorTransferFunction): cint {.importcpp: "GetSize",
    header: "vtkColorTransferFunction.h".}
proc AddRGBPoint*(this: var vtkColorTransferFunction; x: cdouble; r: cdouble;
                 g: cdouble; b: cdouble): cint {.importcpp: "AddRGBPoint",
    header: "vtkColorTransferFunction.h".}
proc AddRGBPoint*(this: var vtkColorTransferFunction; x: cdouble; r: cdouble;
                 g: cdouble; b: cdouble; midpoint: cdouble; sharpness: cdouble): cint {.
    importcpp: "AddRGBPoint", header: "vtkColorTransferFunction.h".}
proc AddRGBPoints*(this: var vtkColorTransferFunction; x: ptr vtkDoubleArray;
                  rgbColors: ptr vtkDoubleArray): cint {.importcpp: "AddRGBPoints",
    header: "vtkColorTransferFunction.h".}
proc AddRGBPoints*(this: var vtkColorTransferFunction; x: ptr vtkDoubleArray;
                  rgbColors: ptr vtkDoubleArray; midpoint: cdouble;
                  sharpness: cdouble): cint {.importcpp: "AddRGBPoints",
    header: "vtkColorTransferFunction.h".}
proc AddHSVPoint*(this: var vtkColorTransferFunction; x: cdouble; h: cdouble;
                 s: cdouble; v: cdouble): cint {.importcpp: "AddHSVPoint",
    header: "vtkColorTransferFunction.h".}
proc AddHSVPoint*(this: var vtkColorTransferFunction; x: cdouble; h: cdouble;
                 s: cdouble; v: cdouble; midpoint: cdouble; sharpness: cdouble): cint {.
    importcpp: "AddHSVPoint", header: "vtkColorTransferFunction.h".}
proc RemovePoint*(this: var vtkColorTransferFunction; x: cdouble): cint {.
    importcpp: "RemovePoint", header: "vtkColorTransferFunction.h".}
proc AddRGBSegment*(this: var vtkColorTransferFunction; x1: cdouble; r1: cdouble;
                   g1: cdouble; b1: cdouble; x2: cdouble; r2: cdouble; g2: cdouble;
                   b2: cdouble) {.importcpp: "AddRGBSegment",
                                header: "vtkColorTransferFunction.h".}
proc AddHSVSegment*(this: var vtkColorTransferFunction; x1: cdouble; h1: cdouble;
                   s1: cdouble; v1: cdouble; x2: cdouble; h2: cdouble; s2: cdouble;
                   v2: cdouble) {.importcpp: "AddHSVSegment",
                                header: "vtkColorTransferFunction.h".}
proc RemoveAllPoints*(this: var vtkColorTransferFunction) {.
    importcpp: "RemoveAllPoints", header: "vtkColorTransferFunction.h".}
## !!!Ignored construct:  *
##  Returns an RGB color for the specified scalar value
##  double * GetColor ( double x ) VTK_SIZEHINT ( 3 ) { return vtkScalarsToColors :: GetColor ( x ) ; } void GetColor ( double x , double rgb [ 3 ] ) override ;
## Error: expected ';'!!!

proc GetRedValue*(this: var vtkColorTransferFunction; x: cdouble): cdouble {.
    importcpp: "GetRedValue", header: "vtkColorTransferFunction.h".}
proc GetGreenValue*(this: var vtkColorTransferFunction; x: cdouble): cdouble {.
    importcpp: "GetGreenValue", header: "vtkColorTransferFunction.h".}
proc GetBlueValue*(this: var vtkColorTransferFunction; x: cdouble): cdouble {.
    importcpp: "GetBlueValue", header: "vtkColorTransferFunction.h".}
proc GetNodeValue*(this: var vtkColorTransferFunction; index: cint;
                  val: array[6, cdouble]): cint {.importcpp: "GetNodeValue",
    header: "vtkColorTransferFunction.h".}
proc SetNodeValue*(this: var vtkColorTransferFunction; index: cint;
                  val: array[6, cdouble]): cint {.importcpp: "SetNodeValue",
    header: "vtkColorTransferFunction.h".}
proc MapValue*(this: var vtkColorTransferFunction; v: cdouble): ptr cuchar {.
    importcpp: "MapValue", header: "vtkColorTransferFunction.h".}
## !!!Ignored construct:  /@{ *
##  Returns min and max position of all function points.
##  double * GetRange ( ) VTK_SIZEHINT ( 2 ) override { return this -> Range ; } virtual void GetRange ( double & arg1 , double & arg2 ) { arg1 = this -> Range [ 0 ] ; arg2 = this -> Range [ 1 ] ; } virtual void GetRange ( double _arg [ 2 ] ) { this -> GetRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } /@} *
##  Remove all points out of the new range, and make sure there is a point
##  at each end of that range.
##  Returns 1 on success, 0 otherwise.
##  int AdjustRange ( double range [ 2 ] ) ;
## Error: expected ';'!!!

proc GetTable*(this: var vtkColorTransferFunction; x1: cdouble; x2: cdouble; n: cint;
              table: ptr cdouble) {.importcpp: "GetTable",
                                 header: "vtkColorTransferFunction.h".}
proc GetTable*(this: var vtkColorTransferFunction; x1: cdouble; x2: cdouble; n: cint;
              table: ptr cfloat) {.importcpp: "GetTable",
                                header: "vtkColorTransferFunction.h".}
proc GetTable*(this: var vtkColorTransferFunction; x1: cdouble; x2: cdouble; n: cint): ptr cuchar {.
    importcpp: "GetTable", header: "vtkColorTransferFunction.h".}
proc BuildFunctionFromTable*(this: var vtkColorTransferFunction; x1: cdouble;
                            x2: cdouble; size: cint; table: ptr cdouble) {.
    importcpp: "BuildFunctionFromTable", header: "vtkColorTransferFunction.h".}
proc SetClamping*(this: var vtkColorTransferFunction; _arg: vtkTypeBool) {.
    importcpp: "SetClamping", header: "vtkColorTransferFunction.h".}
proc GetClampingMinValue*(this: var vtkColorTransferFunction): vtkTypeBool {.
    importcpp: "GetClampingMinValue", header: "vtkColorTransferFunction.h".}
proc GetClampingMaxValue*(this: var vtkColorTransferFunction): vtkTypeBool {.
    importcpp: "GetClampingMaxValue", header: "vtkColorTransferFunction.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetClamping ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Clamping  of  << this -> Clamping ) ; return this -> Clamping ; } ;
## Error: expected ';'!!!

proc ClampingOn*(this: var vtkColorTransferFunction) {.importcpp: "ClampingOn",
    header: "vtkColorTransferFunction.h".}
proc ClampingOff*(this: var vtkColorTransferFunction) {.importcpp: "ClampingOff",
    header: "vtkColorTransferFunction.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the color space used for interpolation: RGB, HSV, CIELAB,
  ##  Diverging or Step.  In HSV mode, if HSVWrap is on, it will take the shortest path
  ##  in Hue (going back through 0 if that is the shortest way around the hue
  ##  circle) whereas if HSVWrap is off it will not go through 0 (in order the
  ##  match the current functionality of vtkLookupTable).  In Lab/CIEDE2000 mode,
  ##  it will take the shortest path in the Lab color space with respect to the
  ##  CIE Delta E 2000 color distance measure. Diverging is a special
  ##  mode where colors will pass through white when interpolating between two
  ##  saturated colors. Step is a mode where the color of an interval is the
  ##  color of the second color of the interval.
  ##
proc SetClampingColorSpace*(this: var vtkColorTransferFunction; _arg: cint) {.
    importcpp: "SetClampingColorSpace", header: "vtkColorTransferFunction.h".}
proc GetClampingMinValueColorSpaceMinValue*(this: var vtkColorTransferFunction): cint {.
    importcpp: "GetClampingMinValueColorSpaceMinValue",
    header: "vtkColorTransferFunction.h".}
proc GetClampingMaxValueColorSpaceMaxValue*(this: var vtkColorTransferFunction): cint {.
    importcpp: "GetClampingMaxValueColorSpaceMaxValue",
    header: "vtkColorTransferFunction.h".}
proc SetColorSpaceToRGB*(this: var vtkColorTransferFunction) {.
    importcpp: "SetColorSpaceToRGB", header: "vtkColorTransferFunction.h".}
proc SetColorSpaceToHSV*(this: var vtkColorTransferFunction) {.
    importcpp: "SetColorSpaceToHSV", header: "vtkColorTransferFunction.h".}
proc SetColorSpaceToLab*(this: var vtkColorTransferFunction) {.
    importcpp: "SetColorSpaceToLab", header: "vtkColorTransferFunction.h".}
proc SetColorSpaceToLabCIEDE2000*(this: var vtkColorTransferFunction) {.
    importcpp: "SetColorSpaceToLabCIEDE2000", header: "vtkColorTransferFunction.h".}
proc SetColorSpaceToDiverging*(this: var vtkColorTransferFunction) {.
    importcpp: "SetColorSpaceToDiverging", header: "vtkColorTransferFunction.h".}
proc SetColorSpaceToStep*(this: var vtkColorTransferFunction) {.
    importcpp: "SetColorSpaceToStep", header: "vtkColorTransferFunction.h".}
## !!!Ignored construct:  virtual int GetClampingColorSpace ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ColorSpace  of  << this -> ColorSpace ) ; return this -> ColorSpace ; } ;
## Error: expected ';'!!!

proc SetHSVWrap*(this: var vtkColorTransferFunction; _arg: vtkTypeBool) {.
    importcpp: "SetHSVWrap", header: "vtkColorTransferFunction.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetClampingColorSpaceHSVWrap ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HSVWrap  of  << this -> HSVWrap ) ; return this -> HSVWrap ; } ;
## Error: expected ';'!!!

proc HSVWrapOn*(this: var vtkColorTransferFunction) {.importcpp: "HSVWrapOn",
    header: "vtkColorTransferFunction.h".}
proc HSVWrapOff*(this: var vtkColorTransferFunction) {.importcpp: "HSVWrapOff",
    header: "vtkColorTransferFunction.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set the type of scale to use, linear or logarithmic.  The default
  ##  is linear.  If the scale is logarithmic, and the range contains
  ##  zero, the color mapping will be linear.
  ##
proc SetHSVWrapScale*(this: var vtkColorTransferFunction; _arg: cint) {.
    importcpp: "SetHSVWrapScale", header: "vtkColorTransferFunction.h".}
proc SetScaleToLinear*(this: var vtkColorTransferFunction) {.
    importcpp: "SetScaleToLinear", header: "vtkColorTransferFunction.h".}
proc SetScaleToLog10*(this: var vtkColorTransferFunction) {.
    importcpp: "SetScaleToLog10", header: "vtkColorTransferFunction.h".}
## !!!Ignored construct:  virtual int GetClampingColorSpaceHSVWrapScale ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Scale  of  << this -> Scale ) ; return this -> Scale ; } ;
## Error: expected ';'!!!

proc SetNanColor*(this: var vtkColorTransferFunction; _arg1: cdouble; _arg2: cdouble;
                 _arg3: cdouble) {.importcpp: "SetNanColor",
                                 header: "vtkColorTransferFunction.h".}
proc SetNanColor*(this: var vtkColorTransferFunction; _arg: array[3, cdouble]) {.
    importcpp: "SetNanColor", header: "vtkColorTransferFunction.h".}
## !!!Ignored construct:  virtual double * GetNanColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << NanColor  pointer  << this -> NanColor ) ; return this -> NanColor ; } VTK_WRAPEXCLUDE virtual void GetNanColor ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> NanColor [ 0 ] ; _arg2 = this -> NanColor [ 1 ] ; _arg3 = this -> NanColor [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << NanColor  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetNanColor ( double _arg [ 3 ] ) { this -> GetNanColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetHSVWrapScaleNanOpacity*(this: var vtkColorTransferFunction; _arg: cdouble) {.
    importcpp: "SetHSVWrapScaleNanOpacity", header: "vtkColorTransferFunction.h".}
## !!!Ignored construct:  virtual double GetClampingColorSpaceHSVWrapScaleNanOpacity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NanOpacity  of  << this -> NanOpacity ) ; return this -> NanOpacity ; } ;
## Error: expected ';'!!!

proc SetNanColorRGBA*(this: var vtkColorTransferFunction; r: cdouble; g: cdouble;
                     b: cdouble; a: cdouble) {.importcpp: "SetNanColorRGBA",
    header: "vtkColorTransferFunction.h".}
proc SetNanColorRGBA*(this: var vtkColorTransferFunction; rgba: array[4, cdouble]) {.
    importcpp: "SetNanColorRGBA", header: "vtkColorTransferFunction.h".}
proc SetNanColorBelowRangeColor*(this: var vtkColorTransferFunction; _arg1: cdouble;
                                _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetNanColorBelowRangeColor", header: "vtkColorTransferFunction.h".}
proc SetNanColorBelowRangeColor*(this: var vtkColorTransferFunction;
                                _arg: array[3, cdouble]) {.
    importcpp: "SetNanColorBelowRangeColor", header: "vtkColorTransferFunction.h".}
## !!!Ignored construct:  virtual double * GetNanColorBelowRangeColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << BelowRangeColor  pointer  << this -> BelowRangeColor ) ; return this -> BelowRangeColor ; } VTK_WRAPEXCLUDE virtual void GetNanColorBelowRangeColor ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> BelowRangeColor [ 0 ] ; _arg2 = this -> BelowRangeColor [ 1 ] ; _arg3 = this -> BelowRangeColor [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << BelowRangeColor  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetNanColorBelowRangeColor ( double _arg [ 3 ] ) { this -> GetNanColorBelowRangeColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetHSVWrapScaleNanOpacityUseBelowRangeColor*(
    this: var vtkColorTransferFunction; _arg: vtkTypeBool) {.
    importcpp: "SetHSVWrapScaleNanOpacityUseBelowRangeColor",
    header: "vtkColorTransferFunction.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetClampingColorSpaceHSVWrapScaleNanOpacityUseBelowRangeColor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseBelowRangeColor  of  << this -> UseBelowRangeColor ) ; return this -> UseBelowRangeColor ; } ;
## Error: expected ';'!!!

proc UseBelowRangeColorOn*(this: var vtkColorTransferFunction) {.
    importcpp: "UseBelowRangeColorOn", header: "vtkColorTransferFunction.h".}
proc UseBelowRangeColorOff*(this: var vtkColorTransferFunction) {.
    importcpp: "UseBelowRangeColorOff", header: "vtkColorTransferFunction.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set the color to use when a value above the range is
  ##  encountered. This is an RGB 3-tuple of doubles in the range [0, 1].
  ##
proc SetNanColorBelowRangeColorAboveRangeColor*(
    this: var vtkColorTransferFunction; _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetNanColorBelowRangeColorAboveRangeColor",
    header: "vtkColorTransferFunction.h".}
proc SetNanColorBelowRangeColorAboveRangeColor*(
    this: var vtkColorTransferFunction; _arg: array[3, cdouble]) {.
    importcpp: "SetNanColorBelowRangeColorAboveRangeColor",
    header: "vtkColorTransferFunction.h".}
## !!!Ignored construct:  virtual double * GetNanColorBelowRangeColorAboveRangeColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << AboveRangeColor  pointer  << this -> AboveRangeColor ) ; return this -> AboveRangeColor ; } VTK_WRAPEXCLUDE virtual void GetNanColorBelowRangeColorAboveRangeColor ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> AboveRangeColor [ 0 ] ; _arg2 = this -> AboveRangeColor [ 1 ] ; _arg3 = this -> AboveRangeColor [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << AboveRangeColor  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetNanColorBelowRangeColorAboveRangeColor ( double _arg [ 3 ] ) { this -> GetNanColorBelowRangeColorAboveRangeColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetHSVWrapScaleNanOpacityUseBelowRangeColorUseAboveRangeColor*(
    this: var vtkColorTransferFunction; _arg: vtkTypeBool) {.
    importcpp: "SetHSVWrapScaleNanOpacityUseBelowRangeColorUseAboveRangeColor",
    header: "vtkColorTransferFunction.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetClampingColorSpaceHSVWrapScaleNanOpacityUseBelowRangeColorUseAboveRangeColor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseAboveRangeColor  of  << this -> UseAboveRangeColor ) ; return this -> UseAboveRangeColor ; } ;
## Error: expected ';'!!!

proc UseAboveRangeColorOn*(this: var vtkColorTransferFunction) {.
    importcpp: "UseAboveRangeColorOn", header: "vtkColorTransferFunction.h".}
proc UseAboveRangeColorOff*(this: var vtkColorTransferFunction) {.
    importcpp: "UseAboveRangeColorOff", header: "vtkColorTransferFunction.h".}
  ## /@}
  ## *
  ##  Returns a pointer to an array of all node values in an
  ##  interleaved array with the layout [X1, R1, G1, B1, X2, R2, G2,
  ##  B2, ..., Xn, Rn, Gn, Bn] where n is the number of nodes defining
  ##  the transfer function. The returned pointer points to an array
  ##  that is managed by this class, so callers should not free it.
  ##
proc GetDataPointer*(this: var vtkColorTransferFunction): ptr cdouble {.
    importcpp: "GetDataPointer", header: "vtkColorTransferFunction.h".}
proc FillFromDataPointer*(this: var vtkColorTransferFunction; n: cint;
                         `ptr`: ptr cdouble) {.importcpp: "FillFromDataPointer",
    header: "vtkColorTransferFunction.h".}
proc MapScalarsThroughTable2*(this: var vtkColorTransferFunction; input: pointer;
                             output: ptr cuchar; inputDataType: cint;
                             numberOfValues: cint; inputIncrement: cint;
                             outputIncrement: cint) {.
    importcpp: "MapScalarsThroughTable2", header: "vtkColorTransferFunction.h".}
proc SetHSVWrapScaleNanOpacityUseBelowRangeColorUseAboveRangeColorAllowDuplicateScalars*(
    this: var vtkColorTransferFunction; _arg: vtkTypeBool) {.importcpp: "SetHSVWrapScaleNanOpacityUseBelowRangeColorUseAboveRangeColorAllowDuplicateScalars",
    header: "vtkColorTransferFunction.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetClampingColorSpaceHSVWrapScaleNanOpacityUseBelowRangeColorUseAboveRangeColorAllowDuplicateScalars ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AllowDuplicateScalars  of  << this -> AllowDuplicateScalars ) ; return this -> AllowDuplicateScalars ; } ;
## Error: expected ';'!!!

proc AllowDuplicateScalarsOn*(this: var vtkColorTransferFunction) {.
    importcpp: "AllowDuplicateScalarsOn", header: "vtkColorTransferFunction.h".}
proc AllowDuplicateScalarsOff*(this: var vtkColorTransferFunction) {.
    importcpp: "AllowDuplicateScalarsOff", header: "vtkColorTransferFunction.h".}
  ## /@}
  ## *
  ##  Get the number of available colors for mapping to.
  ##
proc GetNumberOfAvailableColors*(this: var vtkColorTransferFunction): vtkIdType {.
    importcpp: "GetNumberOfAvailableColors", header: "vtkColorTransferFunction.h".}
proc GetIndexedColor*(this: var vtkColorTransferFunction; idx: vtkIdType;
                     rgba: array[4, cdouble]) {.importcpp: "GetIndexedColor",
    header: "vtkColorTransferFunction.h".}
proc EstimateMinNumberOfSamples*(this: var vtkColorTransferFunction; x1: cdouble;
                                x2: cdouble): cint {.
    importcpp: "EstimateMinNumberOfSamples", header: "vtkColorTransferFunction.h".}