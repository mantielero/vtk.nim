## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkChartXY.h
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
##  @class   vtkChartXY
##  @brief   Factory class for drawing XY charts
##
##
##  This class implements an XY chart.
##
##  @sa
##  vtkBarChartActor
##

## !!!Ignored construct:  # vtkChartXY_h [NewLine] # vtkChartXY_h [NewLine] # vtkChart.h [NewLine] # vtkChartsCoreModule.h  For export macro # vtkContextPolygon.h  For vtkContextPolygon # vtkSmartPointer.h  For SP ivars # vtkVector.h  For vtkVector2f in struct [NewLine] # < vector >  for std::vector [NewLine] class vtkAxis ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkChartLegend"
discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkMultiBlockDataSet"
discard "forward decl of vtkPlot"
discard "forward decl of vtkPlotGrid"
discard "forward decl of vtkTooltipItem"
discard "forward decl of vtkChartXYPrivate"
## !!!Ignored construct:  class VTKCHARTSCORE_EXPORT vtkChartXY : public vtkChart { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkChart Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkChart :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkChartXY :: IsTypeOf ( type ) ; } static vtkChartXY * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkChartXY * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkChartXY * NewInstance ( ) const { return vtkChartXY :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkChart :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkChartXY :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkChartXY :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Creates a 2D Chart object.
##  static vtkChartXY * New ( ) ; *
##  Perform any updates to the item that may be necessary before rendering.
##  The scene should take care of calling this on all items before their
##  Paint function is invoked.
##  void Update ( ) override ; *
##  Paint event for the chart, called whenever the chart needs to be drawn
##  bool Paint ( vtkContext2D * painter ) override ; *
##  Add a plot to the chart, defaults to using the name of the y column
##  vtkPlot * AddPlot ( int type ) override ; *
##  Adds a plot to the chart holding data specific to a block in a vtkMultiBlockDataSet.
##  virtual vtkPlot * AddPlot ( int type , unsigned int blockIndex ) ; *
##  Adds a plot to the chart
##  vtkIdType AddPlot ( vtkPlot * plot ) override ; *
##  Adds a plot to the chart holding data specific to a block in a vtkMultiBlockDataSet.
##  virtual vtkIdType AddPlot ( vtkPlot * plot , unsigned int blockIndex ) ; *
##  Remove the plot at the specified index, returns true if successful,
##  false if the index was invalid.
##  bool RemovePlot ( vtkIdType index ) override ; *
##  Remove all plots from the chart.
##  void ClearPlots ( ) override ; *
##  Get the plot at the specified index, returns null if the index is invalid.
##  vtkPlot * GetPlot ( vtkIdType index ) override ; *
##  Get the index of the specified plot, returns -1 if the plot does not
##  belong to the chart.
##  virtual vtkIdType GetPlotIndex ( vtkPlot * ) ; *
##  Raises the \a plot to the top of the plot's stack.
##  \return The new index of the plot
##  \sa StackPlotAbove(), LowerPlot(), StackPlotUnder()
##  vtkIdType RaisePlot ( vtkPlot * plot ) ; *
##  Raises the \a plot above the \a under plot. If \a under is null,
##  the plot is raised to the top of the plot's stack.
##  \return The new index of the plot
##  \sa RaisePlot(), LowerPlot(), StackPlotUnder()
##  virtual vtkIdType StackPlotAbove ( vtkPlot * plot , vtkPlot * under ) ; *
##  Lowers the \a plot to the bottom of the plot's stack.
##  \return The new index of the plot
##  \sa StackPlotUnder(), RaisePlot(), StackPlotAbove()
##  vtkIdType LowerPlot ( vtkPlot * plot ) ; *
##  Lowers the \a plot under the \a above plot. If \a above is null,
##  the plot is lowered to the bottom of the plot's stack
##  \return The new index of the plot
##  \sa StackPlotUnder(), RaisePlot(), StackPlotAbove()
##  virtual vtkIdType StackPlotUnder ( vtkPlot * plot , vtkPlot * above ) ; *
##  Get the number of plots the chart contains.
##  vtkIdType GetNumberOfPlots ( ) override ; *
##  Figure out which quadrant the plot is in.
##  int GetPlotCorner ( vtkPlot * plot ) ; *
##  Figure out which quadrant the plot is in.
##  void SetPlotCorner ( vtkPlot * plot , int corner ) ; *
##  Get the axis specified by axisIndex. This is specified with the vtkAxis
##  position enum, valid values are vtkAxis::LEFT, vtkAxis::BOTTOM,
##  vtkAxis::RIGHT and vtkAxis::TOP.
##  vtkAxis * GetAxis ( int axisIndex ) override ; *
##  Set the axis specified by axisIndex. This is specified with the vtkAxis
##  position enum, valid values are vtkAxis::LEFT, vtkAxis::BOTTOM,
##  vtkAxis::RIGHT and vtkAxis::TOP.
##  void SetAxis ( int axisIndex , vtkAxis * ) override ; *
##  Set whether the chart should draw a legend.
##  void SetShowLegend ( bool visible ) override ; *
##  Get the vtkChartLegend object that will be displayed by the chart.
##  vtkChartLegend * GetLegend ( ) override ; *
##  Set the vtkTooltipItem object that will be displayed by the chart.
##  virtual void SetTooltip ( vtkTooltipItem * tooltip ) ; *
##  Get the vtkTooltipItem object that will be displayed by the chart.
##  virtual vtkTooltipItem * GetTooltip ( ) ; *
##  Get the number of axes in the current chart.
##  vtkIdType GetNumberOfAxes ( ) override ; *
##  Request that the chart recalculates the range of its axes. Especially
##  useful in applications after the parameters of plots have been modified.
##  void RecalculateBounds ( ) override ; *
##  Set the selection method, which controls how selections are handled by the
##  chart. The default is SELECTION_ROWS which selects all points in all plots
##  in a chart that have values in the rows selected. SELECTION_PLOTS allows
##  for finer-grained selections specific to each plot, and so to each XY
##  column pair.
##  void SetSelectionMethod ( int method ) override ; *
##  Remove all the selection from Plots
##  void RemovePlotSelections ( ) ; /@{ *
##  If true then the axes will be drawn at the origin (scientific style).
##  virtual void SetDrawAxesAtOrigin ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  DrawAxesAtOrigin  to  << _arg ) ; if ( this -> DrawAxesAtOrigin != _arg ) { this -> DrawAxesAtOrigin = _arg ; this -> Modified ( ) ; } } ; virtual bool GetDrawAxesAtOrigin ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DrawAxesAtOrigin  of  << this -> DrawAxesAtOrigin ) ; return this -> DrawAxesAtOrigin ; } ; virtual void DrawAxesAtOriginOn ( ) { this -> SetDrawAxesAtOrigin ( static_cast < bool > ( 1 ) ) ; } virtual void DrawAxesAtOriginOff ( ) { this -> SetDrawAxesAtOrigin ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  If true then the axes will be turned on and off depending upon whether
##  any plots are in that corner. Defaults to true.
##  virtual void SetDrawAxesAtOriginAutoAxes ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  AutoAxes  to  << _arg ) ; if ( this -> AutoAxes != _arg ) { this -> AutoAxes = _arg ; this -> Modified ( ) ; } } ; virtual bool GetDrawAxesAtOriginAutoAxes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AutoAxes  of  << this -> AutoAxes ) ; return this -> AutoAxes ; } ; virtual void AutoAxesOn ( ) { this -> SetDrawAxesAtOriginAutoAxes ( static_cast < bool > ( 1 ) ) ; } virtual void AutoAxesOff ( ) { this -> SetDrawAxesAtOriginAutoAxes ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Border size of the axes that are hidden (vtkAxis::GetVisible())
##  virtual void SetDrawAxesAtOriginAutoAxesHiddenAxisBorder ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  HiddenAxisBorder  to  << _arg ) ; if ( this -> HiddenAxisBorder != _arg ) { this -> HiddenAxisBorder = _arg ; this -> Modified ( ) ; } } ; virtual int GetDrawAxesAtOriginAutoAxesHiddenAxisBorder ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HiddenAxisBorder  of  << this -> HiddenAxisBorder ) ; return this -> HiddenAxisBorder ; } ; /@} /@{ *
##  Force the axes to have their Minimum and Maximum properties inside the
##  plot boundaries. It constrains pan and zoom interaction.
##  False by default.
##  virtual void SetDrawAxesAtOriginAutoAxesHiddenAxisBorderForceAxesToBounds ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ForceAxesToBounds  to  << _arg ) ; if ( this -> ForceAxesToBounds != _arg ) { this -> ForceAxesToBounds = _arg ; this -> Modified ( ) ; } } ; virtual bool GetDrawAxesAtOriginAutoAxesHiddenAxisBorderForceAxesToBounds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ForceAxesToBounds  of  << this -> ForceAxesToBounds ) ; return this -> ForceAxesToBounds ; } ; virtual void ForceAxesToBoundsOn ( ) { this -> SetDrawAxesAtOriginAutoAxesForceAxesToBounds ( static_cast < bool > ( 1 ) ) ; } virtual void ForceAxesToBoundsOff ( ) { this -> SetDrawAxesAtOriginAutoAxesForceAxesToBounds ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Ignore NaN in RecalculateBounds().
##  Prevents the final bounds to contain NaN if one of the plots contains NaN
##  in its bounds.
##  False by default.
##  virtual void SetDrawAxesAtOriginAutoAxesHiddenAxisBorderForceAxesToBoundsIgnoreNanInBounds ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  IgnoreNanInBounds  to  << _arg ) ; if ( this -> IgnoreNanInBounds != _arg ) { this -> IgnoreNanInBounds = _arg ; this -> Modified ( ) ; } } ; virtual bool GetDrawAxesAtOriginAutoAxesHiddenAxisBorderForceAxesToBoundsIgnoreNanInBounds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IgnoreNanInBounds  of  << this -> IgnoreNanInBounds ) ; return this -> IgnoreNanInBounds ; } ; virtual void IgnoreNanInBoundsOn ( ) { this -> SetDrawAxesAtOriginAutoAxesForceAxesToBoundsIgnoreNanInBounds ( static_cast < bool > ( 1 ) ) ; } virtual void IgnoreNanInBoundsOff ( ) { this -> SetDrawAxesAtOriginAutoAxesForceAxesToBoundsIgnoreNanInBounds ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Set the width fraction for any bar charts drawn in this chart. It is
##  assumed that all bar plots will use the same array for the X axis, and that
##  this array is regularly spaced. The delta between the first two x values is
##  used to calculated the width of the bars, and subdivided between each bar.
##  The default value is 0.8, 1.0 would lead to bars that touch.
##  virtual void SetDrawAxesAtOriginAutoAxesHiddenAxisBorderForceAxesToBoundsIgnoreNanInBoundsBarWidthFraction ( float _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  BarWidthFraction  to  << _arg ) ; if ( this -> BarWidthFraction != _arg ) { this -> BarWidthFraction = _arg ; this -> Modified ( ) ; } } ; virtual float GetDrawAxesAtOriginAutoAxesHiddenAxisBorderForceAxesToBoundsIgnoreNanInBoundsBarWidthFraction ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BarWidthFraction  of  << this -> BarWidthFraction ) ; return this -> BarWidthFraction ; } ; /@} /@{ *
##  Set the behavior of the mouse wheel.  If true, the mouse wheel zooms in/out
##  on the chart.  Otherwise, unless MouseWheelEvent is overridden by a subclass
##  the mouse wheel does nothing.
##  The default value is true.
##  virtual void SetDrawAxesAtOriginAutoAxesHiddenAxisBorderForceAxesToBoundsIgnoreNanInBoundsBarWidthFractionZoomWithMouseWheel ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ZoomWithMouseWheel  to  << _arg ) ; if ( this -> ZoomWithMouseWheel != _arg ) { this -> ZoomWithMouseWheel = _arg ; this -> Modified ( ) ; } } ; virtual bool GetDrawAxesAtOriginAutoAxesHiddenAxisBorderForceAxesToBoundsIgnoreNanInBoundsBarWidthFractionZoomWithMouseWheel ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ZoomWithMouseWheel  of  << this -> ZoomWithMouseWheel ) ; return this -> ZoomWithMouseWheel ; } ; virtual void ZoomWithMouseWheelOn ( ) { this -> SetDrawAxesAtOriginAutoAxesForceAxesToBoundsIgnoreNanInBoundsZoomWithMouseWheel ( static_cast < bool > ( 1 ) ) ; } virtual void ZoomWithMouseWheelOff ( ) { this -> SetDrawAxesAtOriginAutoAxesForceAxesToBoundsIgnoreNanInBoundsZoomWithMouseWheel ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Set the behavior of the mouse wheel for individual axes. ZoomWithMouseWheel
##  must be enabled to allow zooming; individual axes can be set to ignore zoom.
##  The default value for all axes is true.
##  void SetAxisZoom ( int index , bool v ) ; bool GetAxisZoom ( int index ) ; /@} /@{ *
##  Adjust the minimum of a logarithmic axis to be greater than 0, regardless
##  of the minimum data value.
##  False by default.
##  virtual void SetDrawAxesAtOriginAutoAxesHiddenAxisBorderForceAxesToBoundsIgnoreNanInBoundsBarWidthFractionZoomWithMouseWheelAdjustLowerBoundForLogPlot ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  AdjustLowerBoundForLogPlot  to  << _arg ) ; if ( this -> AdjustLowerBoundForLogPlot != _arg ) { this -> AdjustLowerBoundForLogPlot = _arg ; this -> Modified ( ) ; } } ; virtual bool GetDrawAxesAtOriginAutoAxesHiddenAxisBorderForceAxesToBoundsIgnoreNanInBoundsBarWidthFractionZoomWithMouseWheelAdjustLowerBoundForLogPlot ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AdjustLowerBoundForLogPlot  of  << this -> AdjustLowerBoundForLogPlot ) ; return this -> AdjustLowerBoundForLogPlot ; } ; virtual void AdjustLowerBoundForLogPlotOn ( ) { this -> SetDrawAxesAtOriginAutoAxesForceAxesToBoundsIgnoreNanInBoundsZoomWithMouseWheelAdjustLowerBoundForLogPlot ( static_cast < bool > ( 1 ) ) ; } virtual void AdjustLowerBoundForLogPlotOff ( ) { this -> SetDrawAxesAtOriginAutoAxesForceAxesToBoundsIgnoreNanInBoundsZoomWithMouseWheelAdjustLowerBoundForLogPlot ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Set if the point can be dragged along X
##  by the ClickAndDrag Action
##  True by default.
##  virtual void SetDrawAxesAtOriginAutoAxesHiddenAxisBorderForceAxesToBoundsIgnoreNanInBoundsBarWidthFractionZoomWithMouseWheelAdjustLowerBoundForLogPlotDragPointAlongX ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  DragPointAlongX  to  << _arg ) ; if ( this -> DragPointAlongX != _arg ) { this -> DragPointAlongX = _arg ; this -> Modified ( ) ; } } ; virtual bool GetDrawAxesAtOriginAutoAxesHiddenAxisBorderForceAxesToBoundsIgnoreNanInBoundsBarWidthFractionZoomWithMouseWheelAdjustLowerBoundForLogPlotDragPointAlongX ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DragPointAlongX  of  << this -> DragPointAlongX ) ; return this -> DragPointAlongX ; } ; virtual void DragPointAlongXOn ( ) { this -> SetDrawAxesAtOriginAutoAxesForceAxesToBoundsIgnoreNanInBoundsZoomWithMouseWheelAdjustLowerBoundForLogPlotDragPointAlongX ( static_cast < bool > ( 1 ) ) ; } virtual void DragPointAlongXOff ( ) { this -> SetDrawAxesAtOriginAutoAxesForceAxesToBoundsIgnoreNanInBoundsZoomWithMouseWheelAdjustLowerBoundForLogPlotDragPointAlongX ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Set if the point can be dragged along Y
##  by the ClickAndDrag Action
##  True by default.
##  virtual void SetDrawAxesAtOriginAutoAxesHiddenAxisBorderForceAxesToBoundsIgnoreNanInBoundsBarWidthFractionZoomWithMouseWheelAdjustLowerBoundForLogPlotDragPointAlongXDragPointAlongY ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  DragPointAlongY  to  << _arg ) ; if ( this -> DragPointAlongY != _arg ) { this -> DragPointAlongY = _arg ; this -> Modified ( ) ; } } ; virtual bool GetDrawAxesAtOriginAutoAxesHiddenAxisBorderForceAxesToBoundsIgnoreNanInBoundsBarWidthFractionZoomWithMouseWheelAdjustLowerBoundForLogPlotDragPointAlongXDragPointAlongY ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DragPointAlongY  of  << this -> DragPointAlongY ) ; return this -> DragPointAlongY ; } ; virtual void DragPointAlongYOn ( ) { this -> SetDrawAxesAtOriginAutoAxesForceAxesToBoundsIgnoreNanInBoundsZoomWithMouseWheelAdjustLowerBoundForLogPlotDragPointAlongXDragPointAlongY ( static_cast < bool > ( 1 ) ) ; } virtual void DragPointAlongYOff ( ) { this -> SetDrawAxesAtOriginAutoAxesForceAxesToBoundsIgnoreNanInBoundsZoomWithMouseWheelAdjustLowerBoundForLogPlotDragPointAlongXDragPointAlongY ( static_cast < bool > ( 0 ) ) ; } ; /@} *
##  Set the information passed to the tooltip.
##  virtual void SetTooltipInfo ( const vtkContextMouseEvent & , const vtkVector2d & , vtkIdType , vtkPlot * , vtkIdType segmentIndex = - 1 ) ; *
##  Return true if the supplied x, y coordinate is inside the item.
##  bool Hit ( const vtkContextMouseEvent & mouse ) override ; *
##  Mouse enter event.
##  bool MouseEnterEvent ( const vtkContextMouseEvent & mouse ) override ; *
##  Mouse move event.
##  bool MouseMoveEvent ( const vtkContextMouseEvent & mouse ) override ; *
##  Mouse leave event.
##  bool MouseLeaveEvent ( const vtkContextMouseEvent & mouse ) override ; *
##  Mouse button down event
##  bool MouseButtonPressEvent ( const vtkContextMouseEvent & mouse ) override ; *
##  Mouse button release event.
##  bool MouseButtonReleaseEvent ( const vtkContextMouseEvent & mouse ) override ; *
##  Mouse wheel event, positive delta indicates forward movement of the wheel.
##  bool MouseWheelEvent ( const vtkContextMouseEvent & mouse , int delta ) override ; *
##  Key press event.
##  bool KeyPressEvent ( const vtkContextKeyEvent & key ) override ; typedef std :: map < unsigned int , vtkSmartPointer < vtkIdTypeArray >> MapIndexToIds ; *
##  Populate the selection node in the annotation link coressponding to the give node
##  with the supplied selectionIds array for a standard row based selections.
##  static void MakeSelection ( vtkAnnotationLink * link , const MapIndexToIds & selection ) ; *
##   Get the vector of vtkContextTransform
##  const std :: vector < vtkContextTransform * > & GetTransforms ( ) const ; *
##  Populate the annotation link with the supplied selectionIds array, and set
##  the appropriate node properties for a plot based chart selection.
##  static void MakeSelection ( vtkAnnotationLink * link , vtkIdTypeArray * selectionIds , vtkPlot * plot ) ; *
##  Subtract the supplied selection from the oldSelection.
##  static void MinusSelection ( vtkIdTypeArray * selection , vtkIdTypeArray * oldSelection ) ; *
##  Add the supplied selection from the oldSelection.
##  static void AddSelection ( vtkIdTypeArray * selection , vtkIdTypeArray * oldSelection ) ; *
##  Toggle the supplied selection from the oldSelection.
##  static void ToggleSelection ( vtkIdTypeArray * selection , vtkIdTypeArray * oldSelection ) ; *
##  Build a selection based on the supplied selectionMode using the new
##  plotSelection and combining it with the oldSelection. If link is not nullptr
##  then the resulting selection will be set on the link.
##  This is used in the plot or the column based selection.
##  static void BuildSelection ( vtkAnnotationLink * link , int selectionMode , vtkIdTypeArray * plotSelection , vtkIdTypeArray * oldSelection , vtkPlot * plot ) ; *
##  Build a selection based on the supplied selectionMode using the new
##  plotSelection and combining it with the oldSelection. If link is not nullptr
##  then the resulting selection will be set on the link. This is used in the
##  standard row based selection, and supports multi-block selection.
##  static void BuildSelection ( int selectionMode , MapIndexToIds & selection , const MapIndexToIds & oldSelection ) ; *
##  Combine the SelectionMode with any mouse modifiers to get an effective
##  selection mode for this click event.
##  static int GetMouseSelectionMode ( const vtkContextMouseEvent & mouse , int selectionMode ) ; protected : vtkChartXY ( ) ; ~ vtkChartXY ( ) override ; *
##  Recalculate the necessary transforms.
##  void RecalculatePlotTransforms ( ) ; *
##  Calculate the optimal zoom level such that all of the points to be plotted
##  will fit into the plot area.
##  void RecalculatePlotBounds ( ) ; *
##  Update the layout of the chart, this may require the vtkContext2D in order
##  to get font metrics etc. Initially this was added to resize the charts
##  according in response to the size of the axes.
##  virtual bool UpdateLayout ( vtkContext2D * painter ) ; *
##  Layout for the legend if it is visible. This is run after the axes layout
##  and will adjust the borders to account for the legend position.
##  \return The required space in the specified border.
##  virtual int GetLegendBorder ( vtkContext2D * painter , int axisPosition ) ; *
##  Called after the edges of the chart are decided, set the position of the
##  legend, depends upon its alignment.
##  virtual void SetLegendPosition ( const vtkRectf & rect ) ; *
##  The legend for the chart.
##  vtkSmartPointer < vtkChartLegend > Legend ; *
##  The tooltip item for the chart - can be used to display extra information.
##  vtkSmartPointer < vtkTooltipItem > Tooltip ; *
##  Does the plot area transform need to be recalculated?
##  bool PlotTransformValid ; *
##  The box created as the mouse is dragged around the screen.
##  vtkRectf MouseBox ; *
##  Should the box be drawn (could be selection, zoom etc).
##  bool DrawBox ; *
##  The polygon created as the mouse is dragged around the screen when in
##  polygonal selection mode.
##  vtkContextPolygon SelectionPolygon ; *
##  Should the selection polygon be drawn.
##  bool DrawSelectionPolygon ; *
##  Should we draw the location of the nearest point on the plot?
##  bool DrawNearestPoint ; *
##  Keep the axes drawn at the origin? This will attempt to keep the axes drawn
##  at the origin, i.e. 0.0, 0.0 for the chart. This is often the preferred
##  way of drawing scientific/mathematical charts.
##  bool DrawAxesAtOrigin ; *
##  Should axes be turned on and off automatically - defaults to on.
##  bool AutoAxes ; *
##  Size of the border when an axis is hidden
##  int HiddenAxisBorder ; *
##  The fraction of the interval taken up along the x axis by any bars that are
##  drawn on the chart.
##  float BarWidthFraction ; *
##  Property to force the axes to have their Minimum and Maximum properties
##  inside the plot boundaries. It constrains pan and zoom interaction.
##  False by default.
##  bool ForceAxesToBounds ; *
##  Property to ignore NaN in RecalculateBounds().
##  Prevents the final bounds to contain NaN if one of the plots contains NaN
##  in its bounds.
##  False by default.
##  bool IgnoreNanInBounds ; *
##  Property to enable zooming the chart with the mouse wheel.
##  True by default.
##  bool ZoomWithMouseWheel ; *
##  Property to enable zooming of individual axes with the mouse wheel.
##  True by default.
##  bool AxisZoom [ 4 ] ; *
##  Property to adjust the minimum of a logarithmic axis to be greater than 0,
##  regardless of the minimum data value.
##  bool AdjustLowerBoundForLogPlot ; *
##  Properties to enable the drag of a point for the ClickAndDrag Action
##  bool DragPointAlongX ; bool DragPointAlongY ; private : vtkChartXY ( const vtkChartXY & ) = delete ; void operator = ( const vtkChartXY & ) = delete ; vtkChartXYPrivate * ChartPrivate ;  Private class where I hide my STL containers *
##  Internal variable to handle update of drag:
##  true if a point has been selected by the user click.
##  bool DragPoint ; *
##  Figure out the spacing between the bar chart plots, and their offsets.
##  void CalculateBarPlots ( ) ; *
##  Try to locate a point within the plots to display in a tooltip.
##  If invokeEvent is greater than 0, then an event will be invoked if a point
##  is at that mouse position.
##  bool LocatePointInPlots ( const vtkContextMouseEvent & mouse , int invokeEvent = - 1 ) ; int LocatePointInPlot ( const vtkVector2f & position , const vtkVector2f & tolerance , vtkVector2f & plotPos , vtkPlot * plot , vtkIdType & segmentIndex ) ; *
##  Remove the plot from the plot corners list.
##  bool RemovePlotFromCorners ( vtkPlot * plot ) ; void ZoomInAxes ( vtkAxis * x , vtkAxis * y , float * originf , float * max ) ; *
##  Remove all the selection from Plots.
##  The method does not call InvokeEvent(vtkCommand::SelectionChangedEvent)
##  void ReleasePlotSelections ( ) ; *
##  Transform the selection box or polygon.
##  void TransformBoxOrPolygon ( bool polygonMode , vtkTransform2D * transform , const vtkVector2f & mousePosition , vtkVector2f & min , vtkVector2f & max , vtkContextPolygon & polygon ) ; } ;
## Error: token expected: ; but got: [identifier]!!!

## /@{
## *
##  Small struct used by InvokeEvent to send some information about the point
##  that was clicked on. This is an experimental part of the API, subject to
##  change.
##

type
  VTKCHARTSCORE_EXPORTVTKCHARTSCORE_EXPORTvtkChartPlotData* {.importcpp: "VTKCHARTSCORE_EXPORT::VTKCHARTSCORE_EXPORT::vtkChartPlotData",
      header: "vtkChartXY.h", bycopy.} = object
    SeriesName* {.importc: "SeriesName".}: vtkStdString
    Position* {.importc: "Position".}: vtkVector2f
    ScreenPosition* {.importc: "ScreenPosition".}: vtkVector2i
    Index* {.importc: "Index".}: cint


## /@}
