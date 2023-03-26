## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPlotRangeHandlesItem.h
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
##  @class   vtkPlotRangeHandlesItem
##  @brief   item to show and control a range on vtkAxis
##
##  vtkPlotRangeHandlesItem provides range handles painting and management
##  for a provided extent.
##  Handles can be moved by clicking on them.
##  The range is shown when hovering or moving the handles.
##  It emits a StartInteractionEvent when starting to interact with a handle,
##  an InteractionEvent when interacting with a handle and an EndInteractionEvent
##  when releasing a handle.
##  It emits a LeftMouseButtonDoubleClickEvent when double clicked.
##  Options can be used to change the appearence or behavior of handles:
##  - SynchronizeHandlesRange: When enabled, moving the minimum handle triggers
##  the modification of the whole range, resulting in the maximum handle being
##  moved too. Disabled by default.
##  - Orientation: Choose between horizontal (Y axis) or vertical (X axis)
##  handles. Default is vertical.
##  - ExtentToAxis: When enabled, the height of handles span the range of the
##  opposite axis. If disabled, the height of handles is defined by the provided
##  extent. Enabled by default.
##

## !!!Ignored construct:  # vtkPlotRangeHandlesItem_h [NewLine] # vtkPlotRangeHandlesItem_h [NewLine] # vtkChartsCoreModule.h  For export macro # vtkCommand.h  For vtkCommand enum # vtkPlot.h [NewLine] class vtkBrush ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKCHARTSCORE_EXPORT vtkPlotRangeHandlesItem : public vtkPlot { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPlot Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPlot :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPlotRangeHandlesItem :: IsTypeOf ( type ) ; } static vtkPlotRangeHandlesItem * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPlotRangeHandlesItem * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPlotRangeHandlesItem * NewInstance ( ) const { return vtkPlotRangeHandlesItem :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPlot :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPlotRangeHandlesItem :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPlotRangeHandlesItem :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkPlotRangeHandlesItem * New ( ) ; enum Handle { NO_HANDLE = - 1 , LEFT_HANDLE = 0 , RIGHT_HANDLE = 1 } ; enum Orientation { VERTICAL = 0 , HORIZONTAL = 1 } ; *
##  Paint both handles and the range if
##  a handle is active or hovered
##  bool Paint ( vtkContext2D * painter ) override ; *
##  Recover the bounds of the item
##  void GetBounds ( double bounds [ 4 ] ) override ; *
##  Recover the range currently set by the handles
##  Use this method by observing EndInteractionEvent
##  virtual void GetHandlesRange ( double range [ 2 ] ) ; /@{ *
##  Set/Get the handles width in pixels.
##  Default is 2.
##  virtual void SetHandleWidth ( float _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  HandleWidth  to  << _arg ) ; if ( this -> HandleWidth != _arg ) { this -> HandleWidth = _arg ; this -> Modified ( ) ; } } ; virtual float GetHandleWidth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HandleWidth  of  << this -> HandleWidth ) ; return this -> HandleWidth ; } ; /@} /@{ *
##  Set/Get the handles orientation in the plot.
##  virtual void SetHandleOrientation ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << HandleOrientation  to  << _arg ) ; if ( this -> HandleOrientation != ( _arg < VERTICAL ? VERTICAL : ( _arg > HORIZONTAL ? HORIZONTAL : _arg ) ) ) { this -> HandleOrientation = ( _arg < VERTICAL ? VERTICAL : ( _arg > HORIZONTAL ? HORIZONTAL : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetHandleOrientationMinValue ( ) { return VERTICAL ; } virtual int GetHandleOrientationMaxValue ( ) { return HORIZONTAL ; } ; virtual int GetHandleWidthHandleOrientation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HandleOrientation  of  << this -> HandleOrientation ) ; return this -> HandleOrientation ; } ; void SetHandleOrientationToVertical ( ) { this -> SetHandleOrientation ( VERTICAL ) ; } void SetHandleOrientationToHorizontal ( ) { this -> SetHandleOrientation ( HORIZONTAL ) ; } /@} /@{ *
##  Set/Get the extent of the handles in data space (axis unscaled range).
##  The first two parameters define the left and right handles positions on
##  the axis. The last two parameters define the length of handles along the
##  opposite axis. Default values are set to (0, 1, 0, 1).
##  When using ExtentToAxisRangeOn(), the last two parameters don't have any
##  effect and handles span the axis range.
##  virtual void SetExtent ( double _arg1 , double _arg2 , double _arg3 , double _arg4 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Extent  to ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << ) ) ; if ( ( this -> Extent [ 0 ] != _arg1 ) || ( this -> Extent [ 1 ] != _arg2 ) || ( this -> Extent [ 2 ] != _arg3 ) || ( this -> Extent [ 3 ] != _arg4 ) ) { this -> Extent [ 0 ] = _arg1 ; this -> Extent [ 1 ] = _arg2 ; this -> Extent [ 2 ] = _arg3 ; this -> Extent [ 3 ] = _arg4 ; this -> Modified ( ) ; } } virtual void SetExtent ( const double _arg [ 4 ] ) { this -> SetExtent ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] ) ; } ; virtual double * GetExtent ( ) VTK_SIZEHINT ( 4 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Extent  pointer  << this -> Extent ) ; return this -> Extent ; } VTK_WRAPEXCLUDE virtual void GetExtent ( double & _arg1 , double & _arg2 , double & _arg3 , double & _arg4 ) { _arg1 = this -> Extent [ 0 ] ; _arg2 = this -> Extent [ 1 ] ; _arg3 = this -> Extent [ 2 ] ; _arg4 = this -> Extent [ 3 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Extent  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetExtent ( double _arg [ 4 ] ) { this -> GetExtent ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] ) ; } ; /@} /@{ *
##  Set/Get whether handles span the range of the axis. Default is On.
##  virtual void SetHandleWidthExtentToAxisRange ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ExtentToAxisRange  to  << _arg ) ; if ( this -> ExtentToAxisRange != _arg ) { this -> ExtentToAxisRange = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetHandleWidthHandleOrientationExtentToAxisRange ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ExtentToAxisRange  of  << this -> ExtentToAxisRange ) ; return this -> ExtentToAxisRange ; } ; virtual void ExtentToAxisRangeOn ( ) { this -> SetExtentToAxisRange ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ExtentToAxisRangeOff ( ) { this -> SetExtentToAxisRange ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get whether handles move together when one of them is update. Default is Off.
##  virtual void SetHandleWidthExtentToAxisRangeSynchronizeRangeHandles ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SynchronizeRangeHandles  to  << _arg ) ; if ( this -> SynchronizeRangeHandles != _arg ) { this -> SynchronizeRangeHandles = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetHandleWidthHandleOrientationExtentToAxisRangeSynchronizeRangeHandles ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SynchronizeRangeHandles  of  << this -> SynchronizeRangeHandles ) ; return this -> SynchronizeRangeHandles ; } ; virtual void SynchronizeRangeHandlesOn ( ) { this -> SetExtentToAxisRangeSynchronizeRangeHandles ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void SynchronizeRangeHandlesOff ( ) { this -> SetExtentToAxisRangeSynchronizeRangeHandles ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  If On, the range tooltip is always rendered using mouse position,
##  otherwise it is placed at the center of the x axis Default is On.
##  virtual void SetHandleWidthExtentToAxisRangeSynchronizeRangeHandlesLockTooltipToMouse ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  LockTooltipToMouse  to  << _arg ) ; if ( this -> LockTooltipToMouse != _arg ) { this -> LockTooltipToMouse = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetHandleWidthHandleOrientationExtentToAxisRangeSynchronizeRangeHandlesLockTooltipToMouse ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LockTooltipToMouse  of  << this -> LockTooltipToMouse ) ; return this -> LockTooltipToMouse ; } ; virtual void LockTooltipToMouseOn ( ) { this -> SetExtentToAxisRangeSynchronizeRangeHandlesLockTooltipToMouse ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void LockTooltipToMouseOff ( ) { this -> SetExtentToAxisRangeSynchronizeRangeHandlesLockTooltipToMouse ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} *
##  Return the brush used to paint handles being hovered
##  virtual vtkBrush * GetnameHighlightBrush ( ) { vtkDebugWithObjectMacro ( this , <<  returning  HighlightBrush  address  << static_cast < vtkBrush * > ( this -> HighlightBrush ) ) ; return this -> HighlightBrush ; } ; *
##  Compute the handles draw range by using the handle width and the transfer function
##  virtual void ComputeHandlesDrawRange ( ) ; protected : vtkPlotRangeHandlesItem ( ) ; ~ vtkPlotRangeHandlesItem ( ) override ; /@{ *
##  Get the logical range of abcissa or ordinate axis based on the handle
##  orientation, in plot coordinates.
##
##  The unscaled range will always be in the same coordinate system of
##  the data being plotted, regardless of whether LogScale is true or false.
##  Calling GetAxisRange() when LogScale is true will return the log10({min, max}).
##  void GetAxesRange ( double * abcissaRange , double * ordinateRange ) ; void GetAxesUnscaledRange ( double * abcissaRange , double * ordinateRange ) ; /@} *
##  Compute the range used for the handles.
##  void ComputeRange ( double * range ) ; *
##  Compute the delta used for the picking handle size.
##  void ComputeHandleDelta ( double screenBounds [ 4 ] ) ; /@{ *
##  Transform the mouse event in the control-points space. This is needed when
##  using logScale or shiftscale.
##  using vtkPlot :: TransformDataToScreen ; using vtkPlot :: TransformScreenToData ; void TransformScreenToData ( const double inX , const double inY , double & outX , double & outY ) override ; void TransformDataToScreen ( const double inX , const double inY , double & outX , double & outY ) override ; /@} *
##  Returns true if the supplied x, y coordinate is around a handle
##  bool Hit ( const vtkContextMouseEvent & mouse ) override ; /@{ *
##  Interaction methods to interact with the handles.
##  bool MouseButtonPressEvent ( const vtkContextMouseEvent & mouse ) override ; bool MouseButtonReleaseEvent ( const vtkContextMouseEvent & mouse ) override ; bool MouseMoveEvent ( const vtkContextMouseEvent & mouse ) override ; bool MouseEnterEvent ( const vtkContextMouseEvent & mouse ) override ; bool MouseLeaveEvent ( const vtkContextMouseEvent & mouse ) override ; bool MouseDoubleClickEvent ( const vtkContextMouseEvent & mouse ) override ; /@} *
##  Returns the handle the provided point is over with a provided tolerance,
##  it can be NO_HANDLE, LEFT_HANDLE or RIGHT_HANDLE
##  virtual int FindRangeHandle ( const vtkVector2f & point , const vtkVector2f & tolerance ) ; *
##  Internal method to set the ActiveHandlePosition
##  and compute the ActiveHandleRangeValue accordingly
##  virtual void SetActiveHandlePosition ( double position ) ; *
##  Internal method to check if the active handle have
##  actually been moved.
##  bool IsActiveHandleMoved ( double tolerance ) ; *
##  Set the cursor shape
##  void SetCursor ( int cursor ) ; vtkPlotRangeHandlesItem ( const vtkPlotRangeHandlesItem & ) = delete ; void operator = ( const vtkPlotRangeHandlesItem & ) = delete ; float HandleWidth = 2 ; float HandleDelta = 0 ; float LeftHandleDrawRange [ 2 ] = { 0 , 0 } ; float RightHandleDrawRange [ 2 ] = { 0 , 0 } ; int ActiveHandle = NO_HANDLE ; int HoveredHandle = NO_HANDLE ; float HoveredPosition [ 2 ] = { 0 , 0 } ; vtkTypeBool LockTooltipToMouse = true ; double ActiveHandlePosition = 0 ; double ActiveHandleRangeValue = 0 ; vtkNew < vtkBrush > HighlightBrush ; vtkNew < vtkBrush > RangeLabelBrush ; double Extent [ 4 ] = { 0 , 1 , 0 , 1 } ; vtkTypeBool ExtentToAxisRange = true ; vtkTypeBool SynchronizeRangeHandles = false ; int HandleOrientation = VERTICAL ; } ;
## Error: token expected: ; but got: [identifier]!!!
