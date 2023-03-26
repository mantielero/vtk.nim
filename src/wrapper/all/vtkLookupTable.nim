## =========================================================================
##
##  Program:   Visualization Toolkit
##  Module:    vtkLookupTable.h
##
##  Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##  All rights reserved.
##  See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##     This software is distributed WITHOUT ANY WARRANTY; without even
##     the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##     PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkLookupTable
##  @brief   map scalar values into colors via a lookup table
##
##  vtkLookupTable is an object that is used by mapper objects to map scalar
##  values into RGBA (red-green-blue-alpha) color specification,
##  or RGBA into scalar values. The color table can be created by direct
##  insertion of color values, or by specifying a hue, saturation, value, and
##  alpha range and generating a table.
##
##  A special color for NaN values in the data can be specified via
##  SetNanColor(). In addition, a color for data values below the
##  lookup table range minimum can be specified with
##  SetBelowRangeColor(), and that color will be used for values below
##  the range minimum when UseBelowRangeColor is on.  Likewise, a color
##  for data values above the lookup table range maximum can be
##  specified with SetAboveRangeColor(), and it is used when
##  UseAboveRangeColor is on.
##
##  This class behaves differently depending on how \a IndexedLookup is set.
##  When true, vtkLookupTable enters a mode for representing categorical color maps.
##  By setting \a IndexedLookup to true, you indicate that the annotated
##  values are the only valid values for which entries in the color table
##  should be returned. The colors in the lookup \a Table are assigned
##  to annotated values by taking the modulus of their index in the list
##  of annotations. \a IndexedLookup changes the behavior of \a GetIndex,
##  which in turn changes the way \a MapScalarsThroughTable2 behaves;
##  when \a IndexedLookup is true, \a MapScalarsThroughTable2 will search for
##  scalar values in \a AnnotatedValues and use the resulting index to
##  determine the color. If a scalar value is not present in \a AnnotatedValues,
##  then \a NanColor will be used.
##
##  @warning
##  You need to explicitly call Build() when constructing the LUT by hand.
##
##  @sa
##  vtkLogLookupTable vtkWindowLevelLookupTable
##

## !!!Ignored construct:  # vtkLookupTable_h [NewLine] # vtkLookupTable_h [NewLine] # vtkCommonCoreModule.h  For export macro # vtkScalarsToColors.h [NewLine] # vtkUnsignedCharArray.h  Needed for inline method [NewLine] # VTK_RAMP_LINEAR 0 [NewLine] # VTK_RAMP_SCURVE 1 [NewLine] # VTK_RAMP_SQRT 2 [NewLine] # VTK_SCALE_LINEAR 0 [NewLine] # VTK_SCALE_LOG10 1 [NewLine] class VTKCOMMONCORE_EXPORT vtkLookupTable : public vtkScalarsToColors { public : /@{ *
##  Constants for offsets of special colors (e.g., NanColor, BelowRangeColor,
##  AboveRangeColor) from the maximum index in the lookup table.
##  These should be considered private and not be used by clients of this class.
##  static const vtkIdType REPEATED_LAST_COLOR_INDEX ; static const vtkIdType BELOW_RANGE_COLOR_INDEX ; static const vtkIdType ABOVE_RANGE_COLOR_INDEX ; static const vtkIdType NAN_COLOR_INDEX ; static const vtkIdType NUMBER_OF_SPECIAL_COLORS ; /@} *
##  Construct with range=[0,1]; and hsv ranges set up for rainbow color table
##  (from red to blue).
##  static vtkLookupTable * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkScalarsToColors Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkScalarsToColors :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkLookupTable :: IsTypeOf ( type ) ; } static vtkLookupTable * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkLookupTable * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkLookupTable * NewInstance ( ) const { return vtkLookupTable :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkScalarsToColors :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLookupTable :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLookupTable :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Return true if all of the values defining the mapping have an opacity
##  equal to 1.
##  int IsOpaque ( ) override ; int IsOpaque ( vtkAbstractArray * scalars , int colorMode , int component ) override ; int IsOpaque ( vtkAbstractArray * scalars , int colorMode , int component , vtkUnsignedCharArray * ghosts , unsigned char ghostsToSkip = 0xff ) override ; /@} *
##  Allocate a color table of specified size.
##  Note that ext is no longer used.
##  int Allocate ( int sz = 256 , int ext = 256 ) ; *
##  Generate lookup table from hue, saturation, value, alpha min/max values.
##  Table is built from linear ramp of each value.
##  void Build ( ) override ; *
##  Force the lookup table to regenerate from hue, saturation, value,
##  and alpha min/max values.  Table is built from a linear ramp of
##  each value.  ForceBuild() is useful if a lookup table has been
##  defined manually (using SetTableValue) and then an application
##  decides to rebuild the lookup table using the implicit process.
##  virtual void ForceBuild ( ) ; *
##  Copies the "special" colors into the given table.
##  void BuildSpecialColors ( ) ; /@{ *
##  Set the shape of the table ramp to either S-curve, linear, or sqrt.
##  The default is S-curve, which tails off gradually at either end.
##
##  The equation used for the S-curve is y = (sin((x - 1/2)*pi) + 1)/2,
##  For an S-curve greyscale ramp, you should set NumberOfTableValues
##  to 402 (which is 256*pi/2) to provide room for the tails of the ramp.
##
##  The equation for the linear ramp is simply y = x.
##
##  The equation for the SQRT is y = sqrt(x).
##  virtual void SetRamp ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Ramp  to  << _arg ) ; if ( this -> Ramp != _arg ) { this -> Ramp = _arg ; this -> Modified ( ) ; } } ; void SetRampToLinear ( ) { this -> SetRamp ( VTK_RAMP_LINEAR ) ; } void SetRampToSCurve ( ) { this -> SetRamp ( VTK_RAMP_SCURVE ) ; } void SetRampToSQRT ( ) { this -> SetRamp ( VTK_RAMP_SQRT ) ; } virtual int GetRamp ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Ramp  of  << this -> Ramp ) ; return this -> Ramp ; } ; /@} /@{ *
##  Set the type of scale to use, linear or logarithmic.  The default
##  is linear.  If the scale is logarithmic, then the TableRange must not
##  cross the value zero.
##  void SetScale ( int scale ) ; void SetScaleToLinear ( ) { this -> SetScale ( VTK_SCALE_LINEAR ) ; } void SetScaleToLog10 ( ) { this -> SetScale ( VTK_SCALE_LOG10 ) ; } virtual int GetRampScale ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Scale  of  << this -> Scale ) ; return this -> Scale ; } ; /@} /@{ *
##  Set/Get the minimum/maximum scalar values for scalar mapping. Scalar
##  values less than minimum range value are clamped to minimum range value.
##  Scalar values greater than maximum range value are clamped to maximum
##  range value.
##
##  The \a TableRange values are only used when \a IndexedLookup is false.
##  virtual void SetTableRange ( const double r [ 2 ] ) ; virtual void SetTableRange ( double min , double max ) ; virtual double * GetTableRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << TableRange  pointer  << this -> TableRange ) ; return this -> TableRange ; } VTK_WRAPEXCLUDE virtual void GetTableRange ( double data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> TableRange [ i ] ; } } ; /@} /@{ *
##  Set the range in hue (using automatic generation). Hue ranges
##  between [0,1].
##  virtual void SetHueRange ( double _arg1 , double _arg2 ) { vtkDebugWithObjectMacro ( this , <<  setting  << HueRange  to ( << _arg1 << , << _arg2 << ) ) ; if ( ( this -> HueRange [ 0 ] != _arg1 ) || ( this -> HueRange [ 1 ] != _arg2 ) ) { this -> HueRange [ 0 ] = _arg1 ; this -> HueRange [ 1 ] = _arg2 ; this -> Modified ( ) ; } } void SetHueRange ( const double _arg [ 2 ] ) { this -> SetHueRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; virtual double * GetHueRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << HueRange  pointer  << this -> HueRange ) ; return this -> HueRange ; } VTK_WRAPEXCLUDE virtual void GetHueRange ( double & _arg1 , double & _arg2 ) { _arg1 = this -> HueRange [ 0 ] ; _arg2 = this -> HueRange [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << HueRange  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetHueRange ( double _arg [ 2 ] ) { this -> GetHueRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; /@} /@{ *
##  Set the range in saturation (using automatic generation). Saturation
##  ranges between [0,1].
##  virtual void SetHueRangeSaturationRange ( double _arg1 , double _arg2 ) { vtkDebugWithObjectMacro ( this , <<  setting  << SaturationRange  to ( << _arg1 << , << _arg2 << ) ) ; if ( ( this -> SaturationRange [ 0 ] != _arg1 ) || ( this -> SaturationRange [ 1 ] != _arg2 ) ) { this -> SaturationRange [ 0 ] = _arg1 ; this -> SaturationRange [ 1 ] = _arg2 ; this -> Modified ( ) ; } } void SetHueRangeSaturationRange ( const double _arg [ 2 ] ) { this -> SetHueRangeSaturationRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; virtual double * GetHueRangeSaturationRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << SaturationRange  pointer  << this -> SaturationRange ) ; return this -> SaturationRange ; } VTK_WRAPEXCLUDE virtual void GetHueRangeSaturationRange ( double & _arg1 , double & _arg2 ) { _arg1 = this -> SaturationRange [ 0 ] ; _arg2 = this -> SaturationRange [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << SaturationRange  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetHueRangeSaturationRange ( double _arg [ 2 ] ) { this -> GetHueRangeSaturationRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; /@} /@{ *
##  Set the range in value (using automatic generation). Value ranges
##  between [0,1].
##  virtual void SetHueRangeSaturationRangeValueRange ( double _arg1 , double _arg2 ) { vtkDebugWithObjectMacro ( this , <<  setting  << ValueRange  to ( << _arg1 << , << _arg2 << ) ) ; if ( ( this -> ValueRange [ 0 ] != _arg1 ) || ( this -> ValueRange [ 1 ] != _arg2 ) ) { this -> ValueRange [ 0 ] = _arg1 ; this -> ValueRange [ 1 ] = _arg2 ; this -> Modified ( ) ; } } void SetHueRangeSaturationRangeValueRange ( const double _arg [ 2 ] ) { this -> SetHueRangeSaturationRangeValueRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; virtual double * GetHueRangeSaturationRangeValueRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ValueRange  pointer  << this -> ValueRange ) ; return this -> ValueRange ; } VTK_WRAPEXCLUDE virtual void GetHueRangeSaturationRangeValueRange ( double & _arg1 , double & _arg2 ) { _arg1 = this -> ValueRange [ 0 ] ; _arg2 = this -> ValueRange [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << ValueRange  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetHueRangeSaturationRangeValueRange ( double _arg [ 2 ] ) { this -> GetHueRangeSaturationRangeValueRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; /@} /@{ *
##  Set the range in alpha (using automatic generation). Alpha ranges from
##  [0,1].
##  virtual void SetHueRangeSaturationRangeValueRangeAlphaRange ( double _arg1 , double _arg2 ) { vtkDebugWithObjectMacro ( this , <<  setting  << AlphaRange  to ( << _arg1 << , << _arg2 << ) ) ; if ( ( this -> AlphaRange [ 0 ] != _arg1 ) || ( this -> AlphaRange [ 1 ] != _arg2 ) ) { this -> AlphaRange [ 0 ] = _arg1 ; this -> AlphaRange [ 1 ] = _arg2 ; this -> Modified ( ) ; } } void SetHueRangeSaturationRangeValueRangeAlphaRange ( const double _arg [ 2 ] ) { this -> SetHueRangeSaturationRangeValueRangeAlphaRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; virtual double * GetHueRangeSaturationRangeValueRangeAlphaRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << AlphaRange  pointer  << this -> AlphaRange ) ; return this -> AlphaRange ; } VTK_WRAPEXCLUDE virtual void GetHueRangeSaturationRangeValueRangeAlphaRange ( double & _arg1 , double & _arg2 ) { _arg1 = this -> AlphaRange [ 0 ] ; _arg2 = this -> AlphaRange [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << AlphaRange  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetHueRangeSaturationRangeValueRangeAlphaRange ( double _arg [ 2 ] ) { this -> GetHueRangeSaturationRangeValueRangeAlphaRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; /@} /@{ *
##  Set the color to use when a NaN (not a number) is encountered.  This is an
##  RGBA 4-tuple of doubles in the range [0,1].
##  virtual void SetNanColor ( double _arg1 , double _arg2 , double _arg3 , double _arg4 ) { vtkDebugWithObjectMacro ( this , <<  setting  << NanColor  to ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << ) ) ; if ( ( this -> NanColor [ 0 ] != _arg1 ) || ( this -> NanColor [ 1 ] != _arg2 ) || ( this -> NanColor [ 2 ] != _arg3 ) || ( this -> NanColor [ 3 ] != _arg4 ) ) { this -> NanColor [ 0 ] = _arg1 ; this -> NanColor [ 1 ] = _arg2 ; this -> NanColor [ 2 ] = _arg3 ; this -> NanColor [ 3 ] = _arg4 ; this -> Modified ( ) ; } } virtual void SetNanColor ( const double _arg [ 4 ] ) { this -> SetNanColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] ) ; } ; virtual double * GetNanColor ( ) VTK_SIZEHINT ( 4 ) { vtkDebugWithObjectMacro ( this , <<  returning  << NanColor  pointer  << this -> NanColor ) ; return this -> NanColor ; } VTK_WRAPEXCLUDE virtual void GetNanColor ( double & _arg1 , double & _arg2 , double & _arg3 , double & _arg4 ) { _arg1 = this -> NanColor [ 0 ] ; _arg2 = this -> NanColor [ 1 ] ; _arg3 = this -> NanColor [ 2 ] ; _arg4 = this -> NanColor [ 3 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << NanColor  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetNanColor ( double _arg [ 4 ] ) { this -> GetNanColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] ) ; } ; /@} *
##  Return the \a NanColor as a pointer to 4 unsigned chars. This
##  will overwrite any data returned by previous calls to MapValue.
##  unsigned char * GetNanColorAsUnsignedChars ( ) ; *
##  Given an RGBA[4] color in the [0,1] range, convert it to RGBA[4] in the [0,255] range.
##  static void GetColorAsUnsignedChars ( const double colorIn [ 4 ] , unsigned char colorOut [ 4 ] ) ; /@{ *
##  Set the color to use when a value below the range is
##  encountered. This is an RGBA 4-tuple of doubles in the range [0, 1].
##  virtual void SetNanColorBelowRangeColor ( double _arg1 , double _arg2 , double _arg3 , double _arg4 ) { vtkDebugWithObjectMacro ( this , <<  setting  << BelowRangeColor  to ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << ) ) ; if ( ( this -> BelowRangeColor [ 0 ] != _arg1 ) || ( this -> BelowRangeColor [ 1 ] != _arg2 ) || ( this -> BelowRangeColor [ 2 ] != _arg3 ) || ( this -> BelowRangeColor [ 3 ] != _arg4 ) ) { this -> BelowRangeColor [ 0 ] = _arg1 ; this -> BelowRangeColor [ 1 ] = _arg2 ; this -> BelowRangeColor [ 2 ] = _arg3 ; this -> BelowRangeColor [ 3 ] = _arg4 ; this -> Modified ( ) ; } } virtual void SetNanColorBelowRangeColor ( const double _arg [ 4 ] ) { this -> SetNanColorBelowRangeColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] ) ; } ; virtual double * GetNanColorBelowRangeColor ( ) VTK_SIZEHINT ( 4 ) { vtkDebugWithObjectMacro ( this , <<  returning  << BelowRangeColor  pointer  << this -> BelowRangeColor ) ; return this -> BelowRangeColor ; } VTK_WRAPEXCLUDE virtual void GetNanColorBelowRangeColor ( double & _arg1 , double & _arg2 , double & _arg3 , double & _arg4 ) { _arg1 = this -> BelowRangeColor [ 0 ] ; _arg2 = this -> BelowRangeColor [ 1 ] ; _arg3 = this -> BelowRangeColor [ 2 ] ; _arg4 = this -> BelowRangeColor [ 3 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << BelowRangeColor  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetNanColorBelowRangeColor ( double _arg [ 4 ] ) { this -> GetNanColorBelowRangeColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] ) ; } ; /@} /@{ *
##  Set whether the below range color should be used.
##  virtual void SetRampUseBelowRangeColor ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseBelowRangeColor  to  << _arg ) ; if ( this -> UseBelowRangeColor != _arg ) { this -> UseBelowRangeColor = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetRampScaleUseBelowRangeColor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseBelowRangeColor  of  << this -> UseBelowRangeColor ) ; return this -> UseBelowRangeColor ; } ; virtual void UseBelowRangeColorOn ( ) { this -> SetUseBelowRangeColor ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void UseBelowRangeColorOff ( ) { this -> SetUseBelowRangeColor ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set the color to use when a value above the range is
##  encountered. This is an RGBA 4-tuple of doubles in the range [0, 1].
##  virtual void SetNanColorBelowRangeColorAboveRangeColor ( double _arg1 , double _arg2 , double _arg3 , double _arg4 ) { vtkDebugWithObjectMacro ( this , <<  setting  << AboveRangeColor  to ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << ) ) ; if ( ( this -> AboveRangeColor [ 0 ] != _arg1 ) || ( this -> AboveRangeColor [ 1 ] != _arg2 ) || ( this -> AboveRangeColor [ 2 ] != _arg3 ) || ( this -> AboveRangeColor [ 3 ] != _arg4 ) ) { this -> AboveRangeColor [ 0 ] = _arg1 ; this -> AboveRangeColor [ 1 ] = _arg2 ; this -> AboveRangeColor [ 2 ] = _arg3 ; this -> AboveRangeColor [ 3 ] = _arg4 ; this -> Modified ( ) ; } } virtual void SetNanColorBelowRangeColorAboveRangeColor ( const double _arg [ 4 ] ) { this -> SetNanColorBelowRangeColorAboveRangeColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] ) ; } ; virtual double * GetNanColorBelowRangeColorAboveRangeColor ( ) VTK_SIZEHINT ( 4 ) { vtkDebugWithObjectMacro ( this , <<  returning  << AboveRangeColor  pointer  << this -> AboveRangeColor ) ; return this -> AboveRangeColor ; } VTK_WRAPEXCLUDE virtual void GetNanColorBelowRangeColorAboveRangeColor ( double & _arg1 , double & _arg2 , double & _arg3 , double & _arg4 ) { _arg1 = this -> AboveRangeColor [ 0 ] ; _arg2 = this -> AboveRangeColor [ 1 ] ; _arg3 = this -> AboveRangeColor [ 2 ] ; _arg4 = this -> AboveRangeColor [ 3 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << AboveRangeColor  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetNanColorBelowRangeColorAboveRangeColor ( double _arg [ 4 ] ) { this -> GetNanColorBelowRangeColorAboveRangeColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] ) ; } ; /@} /@{ *
##  Set whether the above range color should be used.
##  virtual void SetRampUseBelowRangeColorUseAboveRangeColor ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseAboveRangeColor  to  << _arg ) ; if ( this -> UseAboveRangeColor != _arg ) { this -> UseAboveRangeColor = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetRampScaleUseBelowRangeColorUseAboveRangeColor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseAboveRangeColor  of  << this -> UseAboveRangeColor ) ; return this -> UseAboveRangeColor ; } ; virtual void UseAboveRangeColorOn ( ) { this -> SetUseBelowRangeColorUseAboveRangeColor ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void UseAboveRangeColorOff ( ) { this -> SetUseBelowRangeColorUseAboveRangeColor ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} *
##  Map one value through the lookup table, returning an RBGA[4] color.
##  const unsigned char * MapValue ( double v ) override ; *
##  Map one value through the lookup table and return the color as
##  an RGB[3] array of doubles between 0 and 1. Note lack of alpha.
##  void GetColor ( double v , double rgb [ 3 ] ) override ; *
##  Map one value through the lookup table and return the alpha value
##  (the opacity) as a double between 0 and 1.
##  double GetOpacity ( double v ) override ; *
##  Return the table index associated with a particular value.
##  Returns -1 if \a v is NaN.
##
##  Do not use this function when \a IndexedLookup is true:
##  in that case, the set of values \a v may take on is exactly the integers
##  from 0 to \a GetNumberOfTableValues() - 1;
##  and \a v serves directly as an index into \a TableValues.
##  virtual vtkIdType GetIndex ( double v ) ; /@{ *
##  Specify the number of values (i.e., colors) in the lookup table.
##  void SetNumberOfTableValues ( vtkIdType number ) ; vtkIdType GetNumberOfTableValues ( ) { return this -> NumberOfColors ; } /@} *
##  Directly load color into lookup table. Use [0,1] double values for color
##  component specification. Make sure that you've either used the
##  Build() method or used SetNumberOfTableValues() prior to using this
##  method.
##  virtual void SetTableValue ( vtkIdType indx , const double rgba [ 4 ] ) ; *
##  Directly load color into lookup table. Use [0,1] double values for color
##  component specification. Alpha defaults to 1 if unspecified.
##  virtual void SetTableValue ( vtkIdType indx , double r , double g , double b , double a = 1.0 ) ; *
##  Return an RGBA color value for the given index into the lookup table. Color
##  components are expressed as [0,1] double values.
##  double * GetTableValue ( vtkIdType indx ) VTK_SIZEHINT ( 4 ) ; *
##  Return an RGBA color value for the given index into the lookup table. Color
##  components are expressed as [0,1] double values.
##  void GetTableValue ( vtkIdType indx , double rgba [ 4 ] ) ; *
##  Get pointer to color table data. Format is array of unsigned char
##  R-G-B-A...R-G-B-A.
##  unsigned char * GetPointer ( vtkIdType id ) { return this -> Table -> GetPointer ( 4 * id ) ; } *
##  Get pointer to data. Useful for direct writes into object. MaxId is bumped
##  by number (and memory allocated if necessary). Id is the location you
##  wish to write into; number is the number of rgba values to write.
##
##  \warning If you modify the table data via the pointer returned by this
##  member function, you must call vtkLookupTable::BuildSpecialColors()
##  afterwards to ensure that the special colors (below/above range and NaN
##  value) are up-to-date.
##  unsigned char * WritePointer ( vtkIdType id , int number ) ; /@{ *
##  Sets/Gets the range of scalars which will be mapped.  This is a duplicate
##  of Get/SetTableRange.
##  double * GetRange ( ) VTK_SIZEHINT ( 2 ) override { return this -> GetTableRange ( ) ; } void SetRange ( double min , double max ) override { this -> SetTableRange ( min , max ) ; } void SetRange ( const double rng [ 2 ] ) override { this -> SetRange ( rng [ 0 ] , rng [ 1 ] ) ; } /@} *
##  Returns the log of \c range in \c log_range.
##  There is a little more to this than simply taking the log10 of the
##  two range values: we do conversion of negative ranges to positive
##  ranges, and conversion of zero to a 'very small number'.
##  static void GetLogRange ( const double range [ 2 ] , double log_range [ 2 ] ) ; *
##  Apply log to value, with appropriate constraints.
##  static double ApplyLogScale ( double v , const double range [ 2 ] , const double log_range [ 2 ] ) ; /@{ *
##  Set the number of colors in the lookup table.  Use
##  SetNumberOfTableValues() instead, it can be used both before and
##  after the table has been built whereas SetNumberOfColors() has no
##  effect after the table has been built.
##  virtual void SetNumberOfColors ( vtkIdType _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << NumberOfColors  to  << _arg ) ; if ( this -> NumberOfColors != ( _arg < 2 ? 2 : ( _arg > VTK_ID_MAX ? VTK_ID_MAX : _arg ) ) ) { this -> NumberOfColors = ( _arg < 2 ? 2 : ( _arg > VTK_ID_MAX ? VTK_ID_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual vtkIdType GetNumberOfColorsMinValue ( ) { return 2 ; } virtual vtkIdType GetNumberOfColorsMaxValue ( ) { return VTK_ID_MAX ; } ; virtual vtkIdType GetRampScaleUseBelowRangeColorUseAboveRangeColorNumberOfColors ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfColors  of  << this -> NumberOfColors ) ; return this -> NumberOfColors ; } ; /@} /@{ *
##  Set/Get the internal table array that is used to map the scalars
##  to colors.  The table array is an unsigned char array with 4
##  components representing RGBA.
##  void SetTable ( vtkUnsignedCharArray * ) ; virtual vtkUnsignedCharArray * GetnameTable ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Table  address  << static_cast < vtkUnsignedCharArray * > ( this -> Table ) ) ; return this -> Table ; } ; /@} *
##  Map a set of scalars through the lookup table.
##
##  This member function is thread safe.
##  void MapScalarsThroughTable2 ( void * input , unsigned char * output , int inputDataType , int numberOfValues , int inputIncrement , int outputFormat ) override ; *
##  Copy the contents from another LookupTable.
##  void DeepCopy ( vtkScalarsToColors * obj ) override ; *
##  This should return 1 if the subclass is using log scale for mapping scalars
##  to colors. Returns 1 is scale == VTK_SCALE_LOG10.
##  int UsingLogScale ( ) override { return ( this -> GetScale ( ) == VTK_SCALE_LOG10 ) ? 1 : 0 ; } *
##  Get the number of available colors for mapping to.
##  vtkIdType GetNumberOfAvailableColors ( ) override ; *
##  Return a color given an integer index.
##
##  This is used to assign colors to annotations (given an offset into the
##  list of annotations).
##  If the table is empty or \a idx < 0, then NanColor is returned.
##  void GetIndexedColor ( vtkIdType idx , double rgba [ 4 ] ) override ; protected : vtkLookupTable ( int sze = 256 , int ext = 256 ) ; ~ vtkLookupTable ( ) override ; vtkIdType NumberOfColors ; vtkUnsignedCharArray * Table ; double TableRange [ 2 ] ; double HueRange [ 2 ] ; double SaturationRange [ 2 ] ; double ValueRange [ 2 ] ; double AlphaRange [ 2 ] ; double NanColor [ 4 ] ; double BelowRangeColor [ 4 ] ; vtkTypeBool UseBelowRangeColor ; double AboveRangeColor [ 4 ] ; vtkTypeBool UseAboveRangeColor ; int Scale ; int Ramp ; vtkTimeStamp InsertTime ; vtkTimeStamp BuildTime ; double RGBA [ 4 ] ;  used during conversion process unsigned char NanColorChar [ 4 ] ; int OpaqueFlag ; vtkTimeStamp OpaqueFlagBuildTime ; vtkTimeStamp SpecialColorsBuildTime ; *
##  Resize the LookupTable to have enough room for the out-of-range colors
##  void ResizeTableForSpecialColors ( ) ; private : vtkLookupTable ( const vtkLookupTable & ) = delete ; void operator = ( const vtkLookupTable & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## ----------------------------------------------------------------------------

proc WritePointer*(id: vtkIdType; number: cint): ptr cuchar {.
    importcpp: "VTKCOMMONCORE_EXPORT::WritePointer(@)", header: "vtkLookupTable.h".}