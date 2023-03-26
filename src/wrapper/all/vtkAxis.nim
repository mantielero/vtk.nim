## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAxis.h
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
##  @class   vtkAxis
##  @brief   takes care of drawing 2D axes
##
##
##  The vtkAxis is drawn in screen coordinates. It is usually one of the last
##  elements of a chart to be drawn. It renders the axis label, tick marks and
##  tick labels.
##  The tick marks and labels span the range of values between
##  \a Minimum and \a Maximum.
##  The \a Minimum and \a Maximum values are not allowed to extend beyond the
##  \a MinimumLimit and \a MaximumLimit values, respectively.
##
##  Note that many other chart elements (e.g., vtkPlotPoints) refer to
##  vtkAxis instances to determine how to scale raw data for presentation.
##  In particular, care must be taken with logarithmic scaling.
##  The axis Minimum, Maximum, and Limit values are stored both unscaled
##  and scaled (with log(x) applied when GetLogScaleActive() returns true).
##  User interfaces will most likely present the unscaled values as they
##  represent the values provided by the user.
##  Other chart elements may need the scaled values in order to draw
##  in the same coordinate system.
##
##  Just because LogScale is set to true does not guarantee that the axis
##  will use logarithmic scaling -- the Minimum and Maximum values for the
##  axis must both lie to the same side of origin (and not include the origin).
##  Also, this switch from linear- to log-scaling may occur during a rendering
##  pass if autoscaling is enabled.
##  Because the log and pow functions are not invertible and the axis itself
##  decides when to switch between them without offering any external class
##  managing the axis a chance to save the old values, it saves
##  old Limit values in NonLogUnscaled{Min,Max}Limit so that behavior is
##  consistent when LogScale is changed from false to true and back again.
##

import
  vtkChartsCoreModule, vtkContextItem, vtkPen, vtkRect, vtkSmartPointer,
  vtkStdString, vtkVector

discard "forward decl of vtkContext2D"
discard "forward decl of vtkFloatArray"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkStringArray"
discard "forward decl of vtkTextProperty"
type
  vtkAxis* {.importcpp: "vtkAxis", header: "vtkAxis.h", bycopy.} = object of vtkContextItem
    vtkAxis* {.importc: "vtkAxis".}: VTK_NEWINSTANCE
    ##  The position of the axis (LEFT, BOTTOM, RIGHT, TOP)
    ##  The position of point 1 (usually the origin)
    ##  The position of point 2 (usually the terminus)
    ##  Interval between tick marks in plot space
    ##  The number of tick marks to draw
    ##  The length of the tick marks
    ##  Text properties for the labels.
    ##  Minimum value of the axis
    ##  Maximum values of the axis
    ##  Lowest possible value for Minimum
    ##  Highest possible value for Maximum
    ##  UnscaledMinimum value of the axis
    ##  UnscaledMaximum values of the axis
    ##  Lowest possible value for UnscaledMinimum
    ##  Highest possible value for UnscaledMaximum
    ##  Saved UnscaledMinimumLimit (when !LogActive)
    ##  Saved UnscaledMinimumLimit (when !LogActive)
    ##  Horizontal/vertical margins for the axis
    ##  The text label drawn on the axis
    ##  Text properties for the axis title
    ##  *Should* the axis use a log scale?
    ##  *Is* the axis using a log scale?
    ##  Whether the grid for the axis should be drawn
    ##  Should the axis labels be visible
    ##  Should range labels be visible?
    ##  Offset of label from the tick mark
    ##  Should the tick marks be visible.
    ##  Should the axis line be visible.
    ##  Should the title be visible.
    ##  Numerical precision to use, defaults to 2.
    ##  The notation to use (standard, scientific, mixed)
    ##  The printf-style format string used for labels.
    ##  The printf-style format string used for range labels.
    ##  The behaviour of the axis (auto, fixed, custom).
    ##  The widest/tallest axis label.
    ##  Track if the title is updated when the label formats
    ##  are changed in the Extended Axis Labeling algorithm
    ## /@{
    ## *
    ##  Scaling factor used on this axis, this is used to accurately render very
    ##  small/large numbers accurately by converting the underlying range by the
    ##  scaling factor.
    ##
    ## /@}
    ## *
    ##  Are we using custom tick labels, or should the axis generate them?
    ##
    ## *
    ##  This object stores the vtkPen that controls how the axis is drawn.
    ##
    ## *
    ##  This object stores the vtkPen that controls how the grid lines are drawn.
    ##
    ## *
    ##  Position of tick marks in screen coordinates
    ##
    ## *
    ##  Position of tick marks in screen coordinates
    ##
    ## *
    ##  The labels for the tick marks
    ##
    ## *
    ##  Hint as to whether a nice min/max was set, otherwise labels may not be
    ##  present at the top/bottom of the axis.
    ##
    ## *
    ##  Mark the tick labels as dirty when the min/max value is changed.
    ##
    ## *
    ##  Flag to indicate that the axis has been resized.
    ##
    ## *
    ##  The algorithm being used to tick label placement.
    ##
    ## *
    ##  The point cache is marked dirty until it has been initialized.
    ##

  vtkAxisSuperclass* = vtkContextItem

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkAxis::IsTypeOf(@)",
    header: "vtkAxis.h".}
proc IsA*(this: var vtkAxis; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkAxis.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAxis {.
    importcpp: "vtkAxis::SafeDownCast(@)", header: "vtkAxis.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAxis :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkContextItem :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAxis :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAxis :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAxis; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkAxis.h".}
type
  vtkAxisLocation* {.size: sizeof(cint), importcpp: "vtkAxis::Location",
                    header: "vtkAxis.h".} = enum
    LEFT = 0, BOTTOM, RIGHT, TOP, PARALLEL


const
  vtkAxisTICK_SIMPLE* = 0
  vtkAxisTICK_WILKINSON_EXTENDED* = 1

proc New*(): ptr vtkAxis {.importcpp: "vtkAxis::New(@)", header: "vtkAxis.h".}
proc SetPosition*(this: var vtkAxis; position: cint) {.importcpp: "SetPosition",
    header: "vtkAxis.h".}
## !!!Ignored construct:  virtual int GetPosition ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Position  of  << this -> Position ) ; return this -> Position ; } ;
## Error: expected ';'!!!

proc SetPoint1*(this: var vtkAxis; pos: vtkVector2f) {.importcpp: "SetPoint1",
    header: "vtkAxis.h".}
proc SetPoint1*(this: var vtkAxis; x: cfloat; y: cfloat) {.importcpp: "SetPoint1",
    header: "vtkAxis.h".}
## !!!Ignored construct:  /@} /@{ *
##  Get point 1 of the axis (in pixels), this is usually the origin.
##  virtual float * GetPoint1Point1 ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Point1  pointer  << this -> Point1 ) ; return this -> Point1 ; } VTK_WRAPEXCLUDE virtual void GetPoint1Point1 ( float & _arg1 , float & _arg2 ) { _arg1 = this -> Point1 [ 0 ] ; _arg2 = this -> Point1 [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Point1  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetPoint1Point1 ( float _arg [ 2 ] ) { this -> GetPoint1Point1 ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc GetPosition1*(this: var vtkAxis): vtkVector2f {.importcpp: "GetPosition1",
    header: "vtkAxis.h".}
proc SetPoint2*(this: var vtkAxis; pos: vtkVector2f) {.importcpp: "SetPoint2",
    header: "vtkAxis.h".}
proc SetPoint2*(this: var vtkAxis; x: cfloat; y: cfloat) {.importcpp: "SetPoint2",
    header: "vtkAxis.h".}
## !!!Ignored construct:  /@} /@{ *
##  Get point 2 of the axis (in pixels), this is usually the terminus.
##  virtual float * GetPoint1Point1Point2Point2 ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Point2  pointer  << this -> Point2 ) ; return this -> Point2 ; } VTK_WRAPEXCLUDE virtual void GetPoint1Point1Point2Point2 ( float & _arg1 , float & _arg2 ) { _arg1 = this -> Point2 [ 0 ] ; _arg2 = this -> Point2 [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Point2  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetPoint1Point1Point2Point2 ( float _arg [ 2 ] ) { this -> GetPoint1Point1Point2Point2 ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc GetPosition2*(this: var vtkAxis): vtkVector2f {.importcpp: "GetPosition2",
    header: "vtkAxis.h".}
proc SetNumberOfTicks*(this: var vtkAxis; numberOfTicks: cint) {.
    importcpp: "SetNumberOfTicks", header: "vtkAxis.h".}
## !!!Ignored construct:  /@{ *
##  Get the number of tick marks for this axis.
##  virtual int GetPositionNumberOfTicksNumberOfTicks ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfTicks  of  << this -> NumberOfTicks ) ; return this -> NumberOfTicks ; } ;
## Error: expected ';'!!!

proc SetTickLength*(this: var vtkAxis; _arg: cfloat) {.importcpp: "SetTickLength",
    header: "vtkAxis.h".}
## !!!Ignored construct:  virtual float GetPositionNumberOfTicksNumberOfTicksTickLength ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TickLength  of  << this -> TickLength ) ; return this -> TickLength ; } ;
## Error: expected ';'!!!

proc GetnameLabelProperties*(this: var vtkAxis): ptr vtkTextProperty {.
    importcpp: "GetnameLabelProperties", header: "vtkAxis.h".}
  ## /@}
  ## *
  ##  Set the logical minimum value of the axis, in plot coordinates.
  ##  If LogScaleActive is true (not just LogScale), then this
  ##  sets the minimum base-10 <b>exponent</b>.
  ##
proc SetMinimum*(this: var vtkAxis; minimum: cdouble) {.importcpp: "SetMinimum",
    header: "vtkAxis.h".}
## !!!Ignored construct:  /@{ *
##  Get the logical minimum value of the axis, in plot coordinates.
##  If LogScaleActive is true (not just LogScale), then this
##  returns the minimum base-10 <b>exponent</b>.
##  virtual double GetPositionNumberOfTicksNumberOfTicksTickLengthMinimumMinimum ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Minimum  of  << this -> Minimum ) ; return this -> Minimum ; } ;
## Error: expected ';'!!!

proc SetMaximum*(this: var vtkAxis; maximum: cdouble) {.importcpp: "SetMaximum",
    header: "vtkAxis.h".}
## !!!Ignored construct:  /@{ *
##  Get the logical maximum value of the axis, in plot coordinates.
##  If LogScaleActive is true (not just LogScale), then this
##  returns the maximum base-10 <b>exponent</b>.
##  virtual double GetPositionNumberOfTicksNumberOfTicksTickLengthMinimumMinimumMaximumMaximum ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Maximum  of  << this -> Maximum ) ; return this -> Maximum ; } ;
## Error: expected ';'!!!

proc SetUnscaledMinimum*(this: var vtkAxis; minimum: cdouble) {.
    importcpp: "SetUnscaledMinimum", header: "vtkAxis.h".}
## !!!Ignored construct:  /@{ *
##  Get the logical minimum value of the axis, in plot coordinates.
##  virtual double GetPositionNumberOfTicksNumberOfTicksTickLengthMinimumMinimumMaximumMaximumUnscaledMinimumUnscaledMinimum ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UnscaledMinimum  of  << this -> UnscaledMinimum ) ; return this -> UnscaledMinimum ; } ;
## Error: expected ';'!!!

proc SetUnscaledMaximum*(this: var vtkAxis; maximum: cdouble) {.
    importcpp: "SetUnscaledMaximum", header: "vtkAxis.h".}
## !!!Ignored construct:  /@{ *
##  Get the logical maximum value of the axis, in plot coordinates.
##  virtual double GetPositionNumberOfTicksNumberOfTicksTickLengthMinimumMinimumMaximumMaximumUnscaledMinimumUnscaledMinimumUnscaledMaximumUnscaledMaximum ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UnscaledMaximum  of  << this -> UnscaledMaximum ) ; return this -> UnscaledMaximum ; } ;
## Error: expected ';'!!!

proc SetRange*(this: var vtkAxis; minimum: cdouble; maximum: cdouble) {.
    importcpp: "SetRange", header: "vtkAxis.h".}
proc SetRange*(this: var vtkAxis; range: array[2, cdouble]) {.importcpp: "SetRange",
    header: "vtkAxis.h".}
proc SetUnscaledRange*(this: var vtkAxis; minimum: cdouble; maximum: cdouble) {.
    importcpp: "SetUnscaledRange", header: "vtkAxis.h".}
proc SetUnscaledRange*(this: var vtkAxis; range: array[2, cdouble]) {.
    importcpp: "SetUnscaledRange", header: "vtkAxis.h".}
proc GetRange*(this: var vtkAxis; range: ptr cdouble) {.importcpp: "GetRange",
    header: "vtkAxis.h".}
proc GetUnscaledRange*(this: var vtkAxis; range: ptr cdouble) {.
    importcpp: "GetUnscaledRange", header: "vtkAxis.h".}
proc SetMinimumLimit*(this: var vtkAxis; lowest: cdouble) {.
    importcpp: "SetMinimumLimit", header: "vtkAxis.h".}
## !!!Ignored construct:  /@{ *
##  Get the logical lowest possible value for \a Minimum, in plot coordinates.
##  virtual double GetPositionNumberOfTicksNumberOfTicksTickLengthMinimumMinimumMaximumMaximumUnscaledMinimumUnscaledMinimumUnscaledMaximumUnscaledMaximumMinimumLimitMinimumLimit ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MinimumLimit  of  << this -> MinimumLimit ) ; return this -> MinimumLimit ; } ;
## Error: expected ';'!!!

proc SetMaximumLimit*(this: var vtkAxis; highest: cdouble) {.
    importcpp: "SetMaximumLimit", header: "vtkAxis.h".}
## !!!Ignored construct:  /@{ *
##  Get the logical highest possible value for \a Maximum, in plot coordinates.
##  virtual double GetPositionNumberOfTicksNumberOfTicksTickLengthMinimumMinimumMaximumMaximumUnscaledMinimumUnscaledMinimumUnscaledMaximumUnscaledMaximumMinimumLimitMinimumLimitMaximumLimitMaximumLimit ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumLimit  of  << this -> MaximumLimit ) ; return this -> MaximumLimit ; } ;
## Error: expected ';'!!!

proc SetUnscaledMinimumLimit*(this: var vtkAxis; lowest: cdouble) {.
    importcpp: "SetUnscaledMinimumLimit", header: "vtkAxis.h".}
## !!!Ignored construct:  /@{ *
##  Get the logical lowest possible value for \a Minimum, in plot coordinates.
##  virtual double GetPositionNumberOfTicksNumberOfTicksTickLengthMinimumMinimumMaximumMaximumUnscaledMinimumUnscaledMinimumUnscaledMaximumUnscaledMaximumMinimumLimitMinimumLimitMaximumLimitMaximumLimitUnscaledMinimumLimitUnscaledMinimumLimit ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UnscaledMinimumLimit  of  << this -> UnscaledMinimumLimit ) ; return this -> UnscaledMinimumLimit ; } ;
## Error: expected ';'!!!

proc SetUnscaledMaximumLimit*(this: var vtkAxis; highest: cdouble) {.
    importcpp: "SetUnscaledMaximumLimit", header: "vtkAxis.h".}
## !!!Ignored construct:  /@{ *
##  Get the logical highest possible value for \a Maximum, in plot coordinates.
##  virtual double GetPositionNumberOfTicksNumberOfTicksTickLengthMinimumMinimumMaximumMaximumUnscaledMinimumUnscaledMinimumUnscaledMaximumUnscaledMaximumMinimumLimitMinimumLimitMaximumLimitMaximumLimitUnscaledMinimumLimitUnscaledMinimumLimitUnscaledMaximumLimitUnscaledMaximumLimit ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UnscaledMaximumLimit  of  << this -> UnscaledMaximumLimit ) ; return this -> UnscaledMaximumLimit ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get the margins of the axis, in pixels.
##  virtual int * GetPoint1Point1Point2Point2MarginsMargins ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Margins  pointer  << this -> Margins ) ; return this -> Margins ; } VTK_WRAPEXCLUDE virtual void GetPoint1Point1Point2Point2MarginsMargins ( int & _arg1 , int & _arg2 ) { _arg1 = this -> Margins [ 0 ] ; _arg2 = this -> Margins [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Margins  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetPoint1Point1Point2Point2MarginsMargins ( int _arg [ 2 ] ) { this -> GetPoint1Point1Point2Point2MarginsMargins ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetMargins*(this: var vtkAxis; _arg1: cint; _arg2: cint) {.importcpp: "SetMargins",
    header: "vtkAxis.h".}
proc SetMargins*(this: var vtkAxis; _arg: array[2, cint]) {.importcpp: "SetMargins",
    header: "vtkAxis.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get/set the title text of the axis.
  ##
proc SetTitle*(this: var vtkAxis; title: vtkStdString) {.importcpp: "SetTitle",
    header: "vtkAxis.h".}
proc GetTitle*(this: var vtkAxis): vtkStdString {.importcpp: "GetTitle",
    header: "vtkAxis.h".}
proc GetnameLabelPropertiesTitleProperties*(this: var vtkAxis): ptr vtkTextProperty {.
    importcpp: "GetnameLabelPropertiesTitleProperties", header: "vtkAxis.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get whether the axis is using a log scale.
  ##  This will always be false when LogScale is false.
  ##  It is only true when LogScale is true <b>and</b> the \a UnscaledRange
  ##  does not cross or include the origin (zero).
  ##
  ##  The limits (\a MinimumLimit, \a MaximumLimit, and their
  ##  unscaled counterparts) do not prevent LogScaleActive from becoming
  ##  true; they are adjusted if they cross or include the origin
  ##  and the original limits are preserved for when LogScaleActive
  ##  becomes false again.
  ##
## !!!Ignored construct:  virtual bool GetPositionNumberOfTicksNumberOfTicksTickLengthMinimumMinimumMaximumMaximumUnscaledMinimumUnscaledMinimumUnscaledMaximumUnscaledMaximumMinimumLimitMinimumLimitMaximumLimitMaximumLimitUnscaledMinimumLimitUnscaledMinimumLimitUnscaledMaximumLimitUnscaledMaximumLimitLogScaleActive ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LogScaleActive  of  << this -> LogScaleActive ) ; return this -> LogScaleActive ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get/set whether the axis should <b>attempt</b> to use a log scale.
##
##  The default is false.
##  \sa{LogScaleActive}.
##  virtual bool GetPositionNumberOfTicksNumberOfTicksTickLengthMinimumMinimumMaximumMaximumUnscaledMinimumUnscaledMinimumUnscaledMaximumUnscaledMaximumMinimumLimitMinimumLimitMaximumLimitMaximumLimitUnscaledMinimumLimitUnscaledMinimumLimitUnscaledMaximumLimitUnscaledMaximumLimitLogScaleActiveLogScaleLogScale ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LogScale  of  << this -> LogScale ) ; return this -> LogScale ; } ;
## Error: expected ';'!!!

proc SetLogScale*(this: var vtkAxis; logScale: bool) {.importcpp: "SetLogScale",
    header: "vtkAxis.h".}
proc LogScaleOn*(this: var vtkAxis) {.importcpp: "LogScaleOn", header: "vtkAxis.h".}
proc LogScaleOff*(this: var vtkAxis) {.importcpp: "LogScaleOff", header: "vtkAxis.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get/set whether the axis grid lines should be drawn, default is true.
  ##
proc SetTickLengthGridVisible*(this: var vtkAxis; _arg: bool) {.
    importcpp: "SetTickLengthGridVisible", header: "vtkAxis.h".}
## !!!Ignored construct:  virtual bool GetPositionNumberOfTicksNumberOfTicksTickLengthMinimumMinimumMaximumMaximumUnscaledMinimumUnscaledMinimumUnscaledMaximumUnscaledMaximumMinimumLimitMinimumLimitMaximumLimitMaximumLimitUnscaledMinimumLimitUnscaledMinimumLimitUnscaledMaximumLimitUnscaledMaximumLimitLogScaleActiveLogScaleLogScaleGridVisible ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GridVisible  of  << this -> GridVisible ) ; return this -> GridVisible ; } ;
## Error: expected ';'!!!

proc SetTickLengthGridVisibleLabelsVisible*(this: var vtkAxis; _arg: bool) {.
    importcpp: "SetTickLengthGridVisibleLabelsVisible", header: "vtkAxis.h".}
## !!!Ignored construct:  virtual bool GetPositionNumberOfTicksNumberOfTicksTickLengthMinimumMinimumMaximumMaximumUnscaledMinimumUnscaledMinimumUnscaledMaximumUnscaledMaximumMinimumLimitMinimumLimitMaximumLimitMaximumLimitUnscaledMinimumLimitUnscaledMinimumLimitUnscaledMaximumLimitUnscaledMaximumLimitLogScaleActiveLogScaleLogScaleGridVisibleLabelsVisible ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LabelsVisible  of  << this -> LabelsVisible ) ; return this -> LabelsVisible ; } ;
## Error: expected ';'!!!

proc SetTickLengthGridVisibleLabelsVisibleRangeLabelsVisible*(this: var vtkAxis;
    _arg: bool) {.importcpp: "SetTickLengthGridVisibleLabelsVisibleRangeLabelsVisible",
                header: "vtkAxis.h".}
## !!!Ignored construct:  virtual bool GetPositionNumberOfTicksNumberOfTicksTickLengthMinimumMinimumMaximumMaximumUnscaledMinimumUnscaledMinimumUnscaledMaximumUnscaledMaximumMinimumLimitMinimumLimitMaximumLimitMaximumLimitUnscaledMinimumLimitUnscaledMinimumLimitUnscaledMaximumLimitUnscaledMaximumLimitLogScaleActiveLogScaleLogScaleGridVisibleLabelsVisibleRangeLabelsVisible ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RangeLabelsVisible  of  << this -> RangeLabelsVisible ) ; return this -> RangeLabelsVisible ; } ;
## Error: expected ';'!!!

proc SetTickLengthGridVisibleLabelsVisibleRangeLabelsVisibleLabelOffset*(
    this: var vtkAxis; _arg: cfloat) {.importcpp: "SetTickLengthGridVisibleLabelsVisibleRangeLabelsVisibleLabelOffset",
                                  header: "vtkAxis.h".}
## !!!Ignored construct:  virtual float GetPositionNumberOfTicksNumberOfTicksTickLengthMinimumMinimumMaximumMaximumUnscaledMinimumUnscaledMinimumUnscaledMaximumUnscaledMaximumMinimumLimitMinimumLimitMaximumLimitMaximumLimitUnscaledMinimumLimitUnscaledMinimumLimitUnscaledMaximumLimitUnscaledMaximumLimitLogScaleActiveLogScaleLogScaleGridVisibleLabelsVisibleRangeLabelsVisibleLabelOffset ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LabelOffset  of  << this -> LabelOffset ) ; return this -> LabelOffset ; } ;
## Error: expected ';'!!!

proc SetTickLengthGridVisibleLabelsVisibleRangeLabelsVisibleLabelOffsetTicksVisible*(
    this: var vtkAxis; _arg: bool) {.importcpp: "SetTickLengthGridVisibleLabelsVisibleRangeLabelsVisibleLabelOffsetTicksVisible",
                                header: "vtkAxis.h".}
## !!!Ignored construct:  virtual bool GetPositionNumberOfTicksNumberOfTicksTickLengthMinimumMinimumMaximumMaximumUnscaledMinimumUnscaledMinimumUnscaledMaximumUnscaledMaximumMinimumLimitMinimumLimitMaximumLimitMaximumLimitUnscaledMinimumLimitUnscaledMinimumLimitUnscaledMaximumLimitUnscaledMaximumLimitLogScaleActiveLogScaleLogScaleGridVisibleLabelsVisibleRangeLabelsVisibleLabelOffsetTicksVisible ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TicksVisible  of  << this -> TicksVisible ) ; return this -> TicksVisible ; } ;
## Error: expected ';'!!!

proc SetTickLengthGridVisibleLabelsVisibleRangeLabelsVisibleLabelOffsetTicksVisibleAxisVisible*(
    this: var vtkAxis; _arg: bool) {.importcpp: "SetTickLengthGridVisibleLabelsVisibleRangeLabelsVisibleLabelOffsetTicksVisibleAxisVisible",
                                header: "vtkAxis.h".}
## !!!Ignored construct:  virtual bool GetPositionNumberOfTicksNumberOfTicksTickLengthMinimumMinimumMaximumMaximumUnscaledMinimumUnscaledMinimumUnscaledMaximumUnscaledMaximumMinimumLimitMinimumLimitMaximumLimitMaximumLimitUnscaledMinimumLimitUnscaledMinimumLimitUnscaledMaximumLimitUnscaledMaximumLimitLogScaleActiveLogScaleLogScaleGridVisibleLabelsVisibleRangeLabelsVisibleLabelOffsetTicksVisibleAxisVisible ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AxisVisible  of  << this -> AxisVisible ) ; return this -> AxisVisible ; } ;
## Error: expected ';'!!!

proc SetTickLengthGridVisibleLabelsVisibleRangeLabelsVisibleLabelOffsetTicksVisibleAxisVisibleTitleVisible*(
    this: var vtkAxis; _arg: bool) {.importcpp: "SetTickLengthGridVisibleLabelsVisibleRangeLabelsVisibleLabelOffsetTicksVisibleAxisVisibleTitleVisible",
                                header: "vtkAxis.h".}
## !!!Ignored construct:  virtual bool GetPositionNumberOfTicksNumberOfTicksTickLengthMinimumMinimumMaximumMaximumUnscaledMinimumUnscaledMinimumUnscaledMaximumUnscaledMaximumMinimumLimitMinimumLimitMaximumLimitMaximumLimitUnscaledMinimumLimitUnscaledMinimumLimitUnscaledMaximumLimitUnscaledMaximumLimitLogScaleActiveLogScaleLogScaleGridVisibleLabelsVisibleRangeLabelsVisibleLabelOffsetTicksVisibleAxisVisibleTitleVisible ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TitleVisible  of  << this -> TitleVisible ) ; return this -> TitleVisible ; } ;
## Error: expected ';'!!!

proc SetPrecision*(this: var vtkAxis; precision: cint) {.importcpp: "SetPrecision",
    header: "vtkAxis.h".}
## !!!Ignored construct:  virtual int GetPositionNumberOfTicksNumberOfTicksTickLengthMinimumMinimumMaximumMaximumUnscaledMinimumUnscaledMinimumUnscaledMaximumUnscaledMaximumMinimumLimitMinimumLimitMaximumLimitMaximumLimitUnscaledMinimumLimitUnscaledMinimumLimitUnscaledMaximumLimitUnscaledMaximumLimitLogScaleActiveLogScaleLogScaleGridVisibleLabelsVisibleRangeLabelsVisibleLabelOffsetTicksVisibleAxisVisibleTitleVisiblePrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Precision  of  << this -> Precision ) ; return this -> Precision ; } ;
## Error: expected ';'!!!

const
  vtkAxisSTANDARD_NOTATION* = 0
  vtkAxisSCIENTIFIC_NOTATION* = 1
  vtkAxisFIXED_NOTATION* = 2
  vtkAxisPRINTF_NOTATION* = 3

proc SetLabelFormat*(this: var vtkAxis; fmt: string) {.importcpp: "SetLabelFormat",
    header: "vtkAxis.h".}
## !!!Ignored construct:  virtual std :: string GetPositionNumberOfTicksNumberOfTicksTickLengthMinimumMinimumMaximumMaximumUnscaledMinimumUnscaledMinimumUnscaledMaximumUnscaledMaximumMinimumLimitMinimumLimitMaximumLimitMaximumLimitUnscaledMinimumLimitUnscaledMinimumLimitUnscaledMaximumLimitUnscaledMaximumLimitLogScaleActiveLogScaleLogScaleGridVisibleLabelsVisibleRangeLabelsVisibleLabelOffsetTicksVisibleAxisVisibleTitleVisiblePrecisionLabelFormat ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LabelFormat  of  << this -> LabelFormat ) ; return this -> LabelFormat ; } ;
## Error: expected ';'!!!

proc SetTickLengthGridVisibleLabelsVisibleRangeLabelsVisibleLabelOffsetTicksVisibleAxisVisibleTitleVisibleRangeLabelFormat*(
    this: var vtkAxis; _arg: string) {.importcpp: "SetTickLengthGridVisibleLabelsVisibleRangeLabelsVisibleLabelOffsetTicksVisibleAxisVisibleTitleVisibleRangeLabelFormat",
                                  header: "vtkAxis.h".}
## !!!Ignored construct:  virtual std :: string GetPositionNumberOfTicksNumberOfTicksTickLengthMinimumMinimumMaximumMaximumUnscaledMinimumUnscaledMinimumUnscaledMaximumUnscaledMaximumMinimumLimitMinimumLimitMaximumLimitMaximumLimitUnscaledMinimumLimitUnscaledMinimumLimitUnscaledMaximumLimitUnscaledMaximumLimitLogScaleActiveLogScaleLogScaleGridVisibleLabelsVisibleRangeLabelsVisibleLabelOffsetTicksVisibleAxisVisibleTitleVisiblePrecisionLabelFormatRangeLabelFormat ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RangeLabelFormat  of  << this -> RangeLabelFormat ) ; return this -> RangeLabelFormat ; } ;
## Error: expected ';'!!!

proc SetNotation*(this: var vtkAxis; notation: cint) {.importcpp: "SetNotation",
    header: "vtkAxis.h".}
## !!!Ignored construct:  virtual int GetPositionNumberOfTicksNumberOfTicksTickLengthMinimumMinimumMaximumMaximumUnscaledMinimumUnscaledMinimumUnscaledMaximumUnscaledMaximumMinimumLimitMinimumLimitMaximumLimitMaximumLimitUnscaledMinimumLimitUnscaledMinimumLimitUnscaledMaximumLimitUnscaledMaximumLimitLogScaleActiveLogScaleLogScaleGridVisibleLabelsVisibleRangeLabelsVisibleLabelOffsetTicksVisibleAxisVisibleTitleVisiblePrecisionLabelFormatRangeLabelFormatNotation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Notation  of  << this -> Notation ) ; return this -> Notation ; } ;
## Error: expected ';'!!!

const
  vtkAxisAUTO* = 0              ##  Automatically scale the axis to view all data that is visible.
  vtkAxisFIXED* = 1             ##  Use a fixed axis range and make no attempt to rescale.
  vtkAxisCUSTOM* = 2            ##  Deprecated, use the tick label settings instead.

proc SetTickLengthGridVisibleLabelsVisibleRangeLabelsVisibleLabelOffsetTicksVisibleAxisVisibleTitleVisibleRangeLabelFormatBehavior*(
    this: var vtkAxis; _arg: cint) {.importcpp: "SetTickLengthGridVisibleLabelsVisibleRangeLabelsVisibleLabelOffsetTicksVisibleAxisVisibleTitleVisibleRangeLabelFormatBehavior",
                                header: "vtkAxis.h".}
## !!!Ignored construct:  virtual int GetPositionNumberOfTicksNumberOfTicksTickLengthMinimumMinimumMaximumMaximumUnscaledMinimumUnscaledMinimumUnscaledMaximumUnscaledMaximumMinimumLimitMinimumLimitMaximumLimitMaximumLimitUnscaledMinimumLimitUnscaledMinimumLimitUnscaledMaximumLimitUnscaledMaximumLimitLogScaleActiveLogScaleLogScaleGridVisibleLabelsVisibleRangeLabelsVisibleLabelOffsetTicksVisibleAxisVisibleTitleVisiblePrecisionLabelFormatRangeLabelFormatNotationBehavior ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Behavior  of  << this -> Behavior ) ; return this -> Behavior ; } ;
## Error: expected ';'!!!

proc SetPen*(this: var vtkAxis; _arg: ptr vtkPen) {.importcpp: "SetPen",
    header: "vtkAxis.h".}
proc GetnameLabelPropertiesTitlePropertiesPen*(this: var vtkAxis): ptr vtkPen {.
    importcpp: "GetnameLabelPropertiesTitlePropertiesPen", header: "vtkAxis.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get the vtkPen object that controls the way this axis is drawn.
  ##
proc SetPenGridPen*(this: var vtkAxis; _arg: ptr vtkPen) {.importcpp: "SetPenGridPen",
    header: "vtkAxis.h".}
proc GetnameLabelPropertiesTitlePropertiesPenGridPen*(this: var vtkAxis): ptr vtkPen {.
    importcpp: "GetnameLabelPropertiesTitlePropertiesPenGridPen",
    header: "vtkAxis.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get/set the tick label algorithm that is used to calculate the min, max
  ##  and tick spacing. There are currently two algoriths, vtkAxis::TICK_SIMPLE
  ##  is the default and uses a simple algorithm. The second option is
  ##  vtkAxis::TICK_WILKINSON which uses an extended Wilkinson algorithm to find
  ##  the optimal range, spacing and font parameters.
  ##
proc SetTickLengthGridVisibleLabelsVisibleRangeLabelsVisibleLabelOffsetTicksVisibleAxisVisibleTitleVisibleRangeLabelFormatBehaviorTickLabelAlgorithm*(
    this: var vtkAxis; _arg: cint) {.importcpp: "SetTickLengthGridVisibleLabelsVisibleRangeLabelsVisibleLabelOffsetTicksVisibleAxisVisibleTitleVisibleRangeLabelFormatBehaviorTickLabelAlgorithm",
                                header: "vtkAxis.h".}
## !!!Ignored construct:  virtual int GetPositionNumberOfTicksNumberOfTicksTickLengthMinimumMinimumMaximumMaximumUnscaledMinimumUnscaledMinimumUnscaledMaximumUnscaledMaximumMinimumLimitMinimumLimitMaximumLimitMaximumLimitUnscaledMinimumLimitUnscaledMinimumLimitUnscaledMaximumLimitUnscaledMaximumLimitLogScaleActiveLogScaleLogScaleGridVisibleLabelsVisibleRangeLabelsVisibleLabelOffsetTicksVisibleAxisVisibleTitleVisiblePrecisionLabelFormatRangeLabelFormatNotationBehaviorTickLabelAlgorithm ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TickLabelAlgorithm  of  << this -> TickLabelAlgorithm ) ; return this -> TickLabelAlgorithm ; } ;
## Error: expected ';'!!!

proc SetTickLengthGridVisibleLabelsVisibleRangeLabelsVisibleLabelOffsetTicksVisibleAxisVisibleTitleVisibleRangeLabelFormatBehaviorTickLabelAlgorithmScalingFactor*(
    this: var vtkAxis; _arg: cdouble) {.importcpp: "SetTickLengthGridVisibleLabelsVisibleRangeLabelsVisibleLabelOffsetTicksVisibleAxisVisibleTitleVisibleRangeLabelFormatBehaviorTickLabelAlgorithmScalingFactor",
                                   header: "vtkAxis.h".}
## !!!Ignored construct:  virtual double GetPositionNumberOfTicksNumberOfTicksTickLengthMinimumMinimumMaximumMaximumUnscaledMinimumUnscaledMinimumUnscaledMaximumUnscaledMaximumMinimumLimitMinimumLimitMaximumLimitMaximumLimitUnscaledMinimumLimitUnscaledMinimumLimitUnscaledMaximumLimitUnscaledMaximumLimitLogScaleActiveLogScaleLogScaleGridVisibleLabelsVisibleRangeLabelsVisibleLabelOffsetTicksVisibleAxisVisibleTitleVisiblePrecisionLabelFormatRangeLabelFormatNotationBehaviorTickLabelAlgorithmScalingFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalingFactor  of  << this -> ScalingFactor ) ; return this -> ScalingFactor ; } ;
## Error: expected ';'!!!

proc SetTickLengthGridVisibleLabelsVisibleRangeLabelsVisibleLabelOffsetTicksVisibleAxisVisibleTitleVisibleRangeLabelFormatBehaviorTickLabelAlgorithmScalingFactorShift*(
    this: var vtkAxis; _arg: cdouble) {.importcpp: "SetTickLengthGridVisibleLabelsVisibleRangeLabelsVisibleLabelOffsetTicksVisibleAxisVisibleTitleVisibleRangeLabelFormatBehaviorTickLabelAlgorithmScalingFactorShift",
                                   header: "vtkAxis.h".}
## !!!Ignored construct:  virtual double GetPositionNumberOfTicksNumberOfTicksTickLengthMinimumMinimumMaximumMaximumUnscaledMinimumUnscaledMinimumUnscaledMaximumUnscaledMaximumMinimumLimitMinimumLimitMaximumLimitMaximumLimitUnscaledMinimumLimitUnscaledMinimumLimitUnscaledMaximumLimitUnscaledMaximumLimitLogScaleActiveLogScaleLogScaleGridVisibleLabelsVisibleRangeLabelsVisibleLabelOffsetTicksVisibleAxisVisibleTitleVisiblePrecisionLabelFormatRangeLabelFormatNotationBehaviorTickLabelAlgorithmScalingFactorShift ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Shift  of  << this -> Shift ) ; return this -> Shift ; } ;
## Error: expected ';'!!!

proc Update*(this: var vtkAxis) {.importcpp: "Update", header: "vtkAxis.h".}
proc Paint*(this: var vtkAxis; painter: ptr vtkContext2D): bool {.importcpp: "Paint",
    header: "vtkAxis.h".}
proc AutoScale*(this: var vtkAxis) {.importcpp: "AutoScale", header: "vtkAxis.h".}
proc RecalculateTickSpacing*(this: var vtkAxis) {.
    importcpp: "RecalculateTickSpacing", header: "vtkAxis.h".}
proc GetTickPositions*(this: var vtkAxis): ptr vtkDoubleArray {.
    importcpp: "GetTickPositions", header: "vtkAxis.h".}
proc GetTickScenePositions*(this: var vtkAxis): ptr vtkFloatArray {.
    importcpp: "GetTickScenePositions", header: "vtkAxis.h".}
proc GetTickLabels*(this: var vtkAxis): ptr vtkStringArray {.
    importcpp: "GetTickLabels", header: "vtkAxis.h".}
proc SetCustomTickPositions*(this: var vtkAxis; positions: ptr vtkDoubleArray;
                            labels: ptr vtkStringArray = nil): bool {.
    importcpp: "SetCustomTickPositions", header: "vtkAxis.h".}
proc GetBoundingRect*(this: var vtkAxis; painter: ptr vtkContext2D): vtkRectf {.
    importcpp: "GetBoundingRect", header: "vtkAxis.h".}
proc NiceNumber*(number: cdouble; roundUp: bool): cdouble {.
    importcpp: "vtkAxis::NiceNumber(@)", header: "vtkAxis.h".}
proc NiceMinMax*(min: var cdouble; max: var cdouble; pixelRange: cfloat;
                tickPixelSpacing: cfloat): cdouble {.
    importcpp: "vtkAxis::NiceMinMax(@)", header: "vtkAxis.h".}
proc GenerateSimpleLabel*(this: var vtkAxis; val: cdouble): vtkStdString {.
    importcpp: "GenerateSimpleLabel", header: "vtkAxis.h".}
proc Hit*(this: var vtkAxis; mouse: vtkContextMouseEvent): bool {.importcpp: "Hit",
    header: "vtkAxis.h".}