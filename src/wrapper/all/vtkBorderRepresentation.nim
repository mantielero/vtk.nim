## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBorderRepresentation.h
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
##  @class   vtkBorderRepresentation
##  @brief   represent a vtkBorderWidget
##
##  This class is used to represent and render a vtBorderWidget. To
##  use this class, you need to specify the two corners of a rectangular
##  region.
##
##  The class is typically subclassed so that specialized representations can
##  be created.  The class defines an API and a default implementation that
##  the vtkBorderRepresentation interacts with to render itself in the scene.
##
##  @warning
##  The separation of the widget event handling (e.g., vtkBorderWidget) from
##  the representation (vtkBorderRepresentation) enables users and developers
##  to create new appearances for the widget. It also facilitates parallel
##  processing, where the client application handles events, and remote
##  representations of the widget are slaves to the client (and do not handle
##  events).
##
##  @sa
##  vtkBorderWidget vtkTextWidget
##

## !!!Ignored construct:  # vtkBorderRepresentation_h [NewLine] # vtkBorderRepresentation_h [NewLine] # vtkCoordinate.h Because of the viewport coordinate macro # vtkDeprecation.h  For VTK_DEPRECATED_IN_9_2_0 # vtkInteractionWidgetsModule.h  For export macro # vtkWidgetRepresentation.h [NewLine] # vtkNew.h  for ivars [NewLine] class vtkPoints ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkPolyData"
discard "forward decl of vtkTransform"
discard "forward decl of vtkTransformPolyDataFilter"
discard "forward decl of vtkPolyDataMapper2D"
discard "forward decl of vtkActor2D"
discard "forward decl of vtkProperty2D"
discard "forward decl of vtkCellArray"
## !!!Ignored construct:  class VTKINTERACTIONWIDGETS_EXPORT vtkBorderRepresentation : public vtkWidgetRepresentation { public : *
##  Instantiate this class.
##  static vtkBorderRepresentation * New ( ) ; /@{ *
##  Define standard methods.
##  protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkWidgetRepresentation Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkWidgetRepresentation :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkBorderRepresentation :: IsTypeOf ( type ) ; } static vtkBorderRepresentation * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkBorderRepresentation * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkBorderRepresentation * NewInstance ( ) const { return vtkBorderRepresentation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWidgetRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBorderRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBorderRepresentation :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Specify opposite corners of the box defining the boundary of the
##  widget. By default, these coordinates are in the normalized viewport
##  coordinate system, with Position the lower left of the outline, and
##  Position2 relative to Position. Note that using these methods are
##  affected by the ProportionalResize flag. That is, if the aspect ratio of
##  the representation is to be preserved (e.g., ProportionalResize is on),
##  then the rectangle (Position,Position2) is a bounding rectangle.
##  virtual vtkCoordinate * GetPositionCoordinate ( ) { vtkDebugWithObjectMacro ( this , << this -> GetClassName ( ) <<  ( << this << ): returning  Position Coordinate address  << this -> PositionCoordinate ) ; return this -> PositionCoordinate ; } virtual void SetPosition ( double x [ 2 ] ) { this -> SetPosition ( x [ 0 ] , x [ 1 ] ) ; } virtual void SetPosition ( double x , double y ) { this -> PositionCoordinate -> SetValue ( x , y ) ; } virtual double * GetPosition ( ) VTK_SIZEHINT ( 2 ) { return this -> PositionCoordinate -> GetValue ( ) ; } ; virtual vtkCoordinate * GetPositionCoordinatePosition2Coordinate ( ) { vtkDebugWithObjectMacro ( this , << this -> GetClassName ( ) <<  ( << this << ): returning  Position2 Coordinate address  << this -> Position2Coordinate ) ; return this -> Position2Coordinate ; } virtual void SetPositionPosition2 ( double x [ 2 ] ) { this -> SetPositionPosition2 ( x [ 0 ] , x [ 1 ] ) ; } virtual void SetPositionPosition2 ( double x , double y ) { this -> Position2Coordinate -> SetValue ( x , y ) ; } virtual double * GetPositionPosition2 ( ) VTK_SIZEHINT ( 2 ) { return this -> Position2Coordinate -> GetValue ( ) ; } ; /@} enum { BORDER_OFF = 0 , BORDER_ON , BORDER_ACTIVE } ; /@{ *
##  Specify when and if the border should appear. If ShowBorder is "on",
##  then the border will always appear. If ShowBorder is "off" then the
##  border will never appear.  If ShowBorder is "active" then the border
##  will appear when the mouse pointer enters the region bounded by the
##  border widget.
##  This method is provided as conveniency to set both horizontal and
##  vertical borders, and the polygon background.
##  BORDER_ON by default.
##  See Also: SetShowHorizontalBorder(), SetShowVerticalBorder(), SetShowPolygon()
##  virtual void SetShowBorder ( int border ) ; virtual int GetShowBorderMinValue ( ) ; virtual int GetShowBorderMaxValue ( ) ; virtual int GetShowBorder ( ) ; void SetShowBorderToOff ( ) { this -> SetShowBorder ( BORDER_OFF ) ; } void SetShowBorderToOn ( ) { this -> SetShowBorder ( BORDER_ON ) ; } void SetShowBorderToActive ( ) { this -> SetShowBorder ( BORDER_ACTIVE ) ; } /@} /@{ *
##  Specify when and if the vertical border should appear.
##  BORDER_ON by default.
##  See Also: SetShowBorder(), SetShowHorizontalBorder()
##  virtual void SetShowVerticalBorder ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ShowVerticalBorder  to  << _arg ) ; if ( this -> ShowVerticalBorder != ( _arg < BORDER_OFF ? BORDER_OFF : ( _arg > BORDER_ACTIVE ? BORDER_ACTIVE : _arg ) ) ) { this -> ShowVerticalBorder = ( _arg < BORDER_OFF ? BORDER_OFF : ( _arg > BORDER_ACTIVE ? BORDER_ACTIVE : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetShowVerticalBorderMinValue ( ) { return BORDER_OFF ; } virtual int GetShowVerticalBorderMaxValue ( ) { return BORDER_ACTIVE ; } ; virtual int GetShowVerticalBorder ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ShowVerticalBorder  of  << this -> ShowVerticalBorder ) ; return this -> ShowVerticalBorder ; } ; /@} /@{ *
##  Specify when and if the horizontal border should appear.
##  BORDER_ON by default.
##  See Also: SetShowBorder(), SetShowVerticalBorder()
##  virtual void SetShowVerticalBorderShowHorizontalBorder ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ShowHorizontalBorder  to  << _arg ) ; if ( this -> ShowHorizontalBorder != ( _arg < BORDER_OFF ? BORDER_OFF : ( _arg > BORDER_ACTIVE ? BORDER_ACTIVE : _arg ) ) ) { this -> ShowHorizontalBorder = ( _arg < BORDER_OFF ? BORDER_OFF : ( _arg > BORDER_ACTIVE ? BORDER_ACTIVE : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetShowVerticalBorderMinValueShowHorizontalBorderMinValue ( ) { return BORDER_OFF ; } virtual int GetShowVerticalBorderMaxValueShowHorizontalBorderMaxValue ( ) { return BORDER_ACTIVE ; } ; virtual int GetShowVerticalBorderShowHorizontalBorder ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ShowHorizontalBorder  of  << this -> ShowHorizontalBorder ) ; return this -> ShowHorizontalBorder ; } ; /@} /@{ *
##  Specify the properties of the border.
##  virtual vtkProperty2D * GetnameBorderProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  BorderProperty  address  << static_cast < vtkProperty2D * > ( this -> BorderProperty ) ) ; return this -> BorderProperty ; } ; /@} /@{ *
##  Specify when and if the border's polygon background should appear.
##  BORDER_ON by default.
##  See Also: SetShowBorder()
##  virtual void SetShowPolygon ( int border ) ; virtual int GetShowPolygon ( ) ; void SetShowPolygonToOff ( ) { this -> SetShowPolygon ( BORDER_OFF ) ; } void SetShowPolygonToOn ( ) { this -> SetShowPolygon ( BORDER_ON ) ; } void SetShowPolygonToActive ( ) { this -> SetShowPolygon ( BORDER_ACTIVE ) ; } /@} /@{ *
##  Specify when and if the border polygon background should appear.
##  BORDER_ON by default.
##  See Also: SetShowBorder(), SetShowPolygon()
##  virtual void SetShowVerticalBorderShowHorizontalBorderShowPolygonBackground ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ShowPolygonBackground  to  << _arg ) ; if ( this -> ShowPolygonBackground != ( _arg < BORDER_OFF ? BORDER_OFF : ( _arg > BORDER_ACTIVE ? BORDER_ACTIVE : _arg ) ) ) { this -> ShowPolygonBackground = ( _arg < BORDER_OFF ? BORDER_OFF : ( _arg > BORDER_ACTIVE ? BORDER_ACTIVE : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetShowVerticalBorderMinValueShowHorizontalBorderMinValueShowPolygonBackgroundMinValue ( ) { return BORDER_OFF ; } virtual int GetShowVerticalBorderMaxValueShowHorizontalBorderMaxValueShowPolygonBackgroundMaxValue ( ) { return BORDER_ACTIVE ; } ; virtual int GetShowVerticalBorderShowHorizontalBorderShowPolygonBackground ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ShowPolygonBackground  of  << this -> ShowPolygonBackground ) ; return this -> ShowPolygonBackground ; } ; /@} /@{ *
##  Whether to enforce the minimum normalized viewport size and limit
##  the normalized viewport coordinates to [0.0 -> 1.0]. This keeps
##  widgets from being moved offscreen or being scaled down past their
##  minimum viewport size.
##
##  Off by Default.
##
##  Note: ProportionalResize must be off for this function to take effect.
##  virtual void SetEnforceNormalizedViewportBounds ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  EnforceNormalizedViewportBounds  to  << _arg ) ; if ( this -> EnforceNormalizedViewportBounds != _arg ) { this -> EnforceNormalizedViewportBounds = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetShowVerticalBorderShowHorizontalBorderShowPolygonBackgroundEnforceNormalizedViewportBounds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EnforceNormalizedViewportBounds  of  << this -> EnforceNormalizedViewportBounds ) ; return this -> EnforceNormalizedViewportBounds ; } ; virtual void EnforceNormalizedViewportBoundsOn ( ) { this -> SetEnforceNormalizedViewportBounds ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void EnforceNormalizedViewportBoundsOff ( ) { this -> SetEnforceNormalizedViewportBounds ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; @} @{ *
##  Indicate whether resizing operations should keep the x-y directions
##  proportional to one another. Also, if ProportionalResize is on, then
##  the rectangle (Position,Position2) is a bounding rectangle, and the
##  representation will be placed in the rectangle in such a way as to
##  preserve the aspect ratio of the representation.
##
##  Off by Default.
##  virtual void SetEnforceNormalizedViewportBoundsProportionalResize ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ProportionalResize  to  << _arg ) ; if ( this -> ProportionalResize != _arg ) { this -> ProportionalResize = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetShowVerticalBorderShowHorizontalBorderShowPolygonBackgroundEnforceNormalizedViewportBoundsProportionalResize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ProportionalResize  of  << this -> ProportionalResize ) ; return this -> ProportionalResize ; } ; virtual void ProportionalResizeOn ( ) { this -> SetEnforceNormalizedViewportBoundsProportionalResize ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ProportionalResizeOff ( ) { this -> SetEnforceNormalizedViewportBoundsProportionalResize ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify a minimum and/or maximum size [0.0 -> 1.0] that this representation
##  can take. These methods require two values: size values in the x and y
##  directions, respectively.
##
##  Default is { 0.0, 0.0 }.
##  virtual void SetMinimumNormalizedViewportSize ( double _arg1 , double _arg2 ) { vtkDebugWithObjectMacro ( this , <<  setting  << MinimumNormalizedViewportSize  to ( << _arg1 << , << _arg2 << ) ) ; if ( ( this -> MinimumNormalizedViewportSize [ 0 ] != _arg1 ) || ( this -> MinimumNormalizedViewportSize [ 1 ] != _arg2 ) ) { this -> MinimumNormalizedViewportSize [ 0 ] = _arg1 ; this -> MinimumNormalizedViewportSize [ 1 ] = _arg2 ; this -> Modified ( ) ; } } void SetMinimumNormalizedViewportSize ( const double _arg [ 2 ] ) { this -> SetMinimumNormalizedViewportSize ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; virtual double * GetMinimumNormalizedViewportSize ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << MinimumNormalizedViewportSize  pointer  << this -> MinimumNormalizedViewportSize ) ; return this -> MinimumNormalizedViewportSize ; } VTK_WRAPEXCLUDE virtual void GetMinimumNormalizedViewportSize ( double & _arg1 , double & _arg2 ) { _arg1 = this -> MinimumNormalizedViewportSize [ 0 ] ; _arg2 = this -> MinimumNormalizedViewportSize [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << MinimumNormalizedViewportSize  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetMinimumNormalizedViewportSize ( double _arg [ 2 ] ) { this -> GetMinimumNormalizedViewportSize ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; @} @{ *
##  Specify a minimum and/or maximum size (in pixels) that this representation
##  can take. These methods require two values: size values in the x and y
##  directions, respectively.
##
##  Default is { 1, 1 }.
##  virtual void SetMinimumNormalizedViewportSizeMinimumSize ( int _arg1 , int _arg2 ) { vtkDebugWithObjectMacro ( this , <<  setting  << MinimumSize  to ( << _arg1 << , << _arg2 << ) ) ; if ( ( this -> MinimumSize [ 0 ] != _arg1 ) || ( this -> MinimumSize [ 1 ] != _arg2 ) ) { this -> MinimumSize [ 0 ] = _arg1 ; this -> MinimumSize [ 1 ] = _arg2 ; this -> Modified ( ) ; } } void SetMinimumNormalizedViewportSizeMinimumSize ( const int _arg [ 2 ] ) { this -> SetMinimumNormalizedViewportSizeMinimumSize ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; virtual int * GetMinimumNormalizedViewportSizeMinimumSize ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << MinimumSize  pointer  << this -> MinimumSize ) ; return this -> MinimumSize ; } VTK_WRAPEXCLUDE virtual void GetMinimumNormalizedViewportSizeMinimumSize ( int & _arg1 , int & _arg2 ) { _arg1 = this -> MinimumSize [ 0 ] ; _arg2 = this -> MinimumSize [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << MinimumSize  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetMinimumNormalizedViewportSizeMinimumSize ( int _arg [ 2 ] ) { this -> GetMinimumNormalizedViewportSizeMinimumSize ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; virtual void SetMinimumNormalizedViewportSizeMinimumSizeMaximumSize ( int _arg1 , int _arg2 ) { vtkDebugWithObjectMacro ( this , <<  setting  << MaximumSize  to ( << _arg1 << , << _arg2 << ) ) ; if ( ( this -> MaximumSize [ 0 ] != _arg1 ) || ( this -> MaximumSize [ 1 ] != _arg2 ) ) { this -> MaximumSize [ 0 ] = _arg1 ; this -> MaximumSize [ 1 ] = _arg2 ; this -> Modified ( ) ; } } void SetMinimumNormalizedViewportSizeMinimumSizeMaximumSize ( const int _arg [ 2 ] ) { this -> SetMinimumNormalizedViewportSizeMinimumSizeMaximumSize ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; virtual int * GetMinimumNormalizedViewportSizeMinimumSizeMaximumSize ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumSize  pointer  << this -> MaximumSize ) ; return this -> MaximumSize ; } VTK_WRAPEXCLUDE virtual void GetMinimumNormalizedViewportSizeMinimumSizeMaximumSize ( int & _arg1 , int & _arg2 ) { _arg1 = this -> MaximumSize [ 0 ] ; _arg2 = this -> MaximumSize [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << MaximumSize  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetMinimumNormalizedViewportSizeMinimumSizeMaximumSize ( int _arg [ 2 ] ) { this -> GetMinimumNormalizedViewportSizeMinimumSizeMaximumSize ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; /@} /@{ *
##  The tolerance representing the distance to the widget (in pixels)
##  in which the cursor is considered to be on the widget, or on a
##  widget feature (e.g., a corner point or edge).
##
##  Default is 3.
##  virtual void SetShowVerticalBorderShowHorizontalBorderShowPolygonBackgroundTolerance ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Tolerance  to  << _arg ) ; if ( this -> Tolerance != ( _arg < 1 ? 1 : ( _arg > 10 ? 10 : _arg ) ) ) { this -> Tolerance = ( _arg < 1 ? 1 : ( _arg > 10 ? 10 : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetShowVerticalBorderMinValueShowHorizontalBorderMinValueShowPolygonBackgroundMinValueToleranceMinValue ( ) { return 1 ; } virtual int GetShowVerticalBorderMaxValueShowHorizontalBorderMaxValueShowPolygonBackgroundMaxValueToleranceMaxValue ( ) { return 10 ; } ; virtual int GetShowVerticalBorderShowHorizontalBorderShowPolygonBackgroundEnforceNormalizedViewportBoundsProportionalResizeTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tolerance  of  << this -> Tolerance ) ; return this -> Tolerance ; } ; /@} /@{ *
##  After a selection event within the region interior to the border; the
##  normalized selection coordinates may be obtained.
##  virtual double * GetSelectionPoint ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << SelectionPoint  pointer  << this -> SelectionPoint ) ; return this -> SelectionPoint ; } VTK_WRAPEXCLUDE virtual void GetSelectionPoint ( double data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> SelectionPoint [ i ] ; } } ; /@} /@{ *
##  This is a modifier of the interaction state. When set, widget interaction
##  allows the border (and stuff inside of it) to be translated with mouse
##  motion.
##  virtual void SetEnforceNormalizedViewportBoundsProportionalResizeMoving ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Moving  to  << _arg ) ; if ( this -> Moving != _arg ) { this -> Moving = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetShowVerticalBorderShowHorizontalBorderShowPolygonBackgroundEnforceNormalizedViewportBoundsProportionalResizeToleranceMoving ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Moving  of  << this -> Moving ) ; return this -> Moving ; } ; virtual void MovingOn ( ) { this -> SetEnforceNormalizedViewportBoundsProportionalResizeMoving ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void MovingOff ( ) { this -> SetEnforceNormalizedViewportBoundsProportionalResizeMoving ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} enum { AnyLocation = 0 , LowerLeftCorner , LowerRightCorner , LowerCenter , UpperLeftCorner , UpperRightCorner , UpperCenter } ; /@{ *
##  Set the representation position, by enumeration (
##  AnyLocation = 0,
##  LowerLeftCorner,
##  LowerRightCorner,
##  LowerCenter,
##  UpperLeftCorner,
##  UpperRightCorner,
##  UpperCenter)
##  related to the render window
##  virtual void SetWindowLocation ( int enumLocation ) ; virtual int GetShowVerticalBorderShowHorizontalBorderShowPolygonBackgroundEnforceNormalizedViewportBoundsProportionalResizeToleranceMovingWindowLocation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WindowLocation  of  << this -> WindowLocation ) ; return this -> WindowLocation ; } ; /@} *
##  Define the various states that the representation can be in.
##  enum InteractionStateType { Outside = 0 , Inside , AdjustingP0 , AdjustingP1 , AdjustingP2 , AdjustingP3 , AdjustingE0 , AdjustingE1 , AdjustingE2 , AdjustingE3 } ; # ! defined ( VTK_LEGACY_REMOVE ) [NewLine] VTK_DEPRECATED_IN_9_2_0 ( because leading underscore is reserved ) typedef InteractionStateType _InteractionState ; # [NewLine] virtual void SetShowVerticalBorderShowHorizontalBorderShowPolygonBackgroundToleranceInteractionState ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << InteractionState  to  << _arg ) ; if ( this -> InteractionState != ( _arg < 0 ? 0 : ( _arg > AdjustingE3 ? AdjustingE3 : _arg ) ) ) { this -> InteractionState = ( _arg < 0 ? 0 : ( _arg > AdjustingE3 ? AdjustingE3 : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetShowVerticalBorderMinValueShowHorizontalBorderMinValueShowPolygonBackgroundMinValueToleranceMinValueInteractionStateMinValue ( ) { return 0 ; } virtual int GetShowVerticalBorderMaxValueShowHorizontalBorderMaxValueShowPolygonBackgroundMaxValueToleranceMaxValueInteractionStateMaxValue ( ) { return AdjustingE3 ; } ; *
##  Return the MTime of this object. It takes into account MTimes
##  of position coordinates and border's property.
##  vtkMTimeType GetMTime ( ) override ; /@{ *
##  Subclasses should implement these methods. See the superclasses'
##  documentation for more information.
##  void BuildRepresentation ( ) override ; void StartWidgetInteraction ( double eventPos [ 2 ] ) override ; void WidgetInteraction ( double eventPos [ 2 ] ) override ; virtual void GetSize ( double size [ 2 ] ) { size [ 0 ] = 1.0 ; size [ 1 ] = 1.0 ; } int ComputeInteractionState ( int X , int Y , int modify = 0 ) override ; /@} /@{ *
##  These methods are necessary to make this representation behave as
##  a vtkProp.
##  void GetActors2D ( vtkPropCollection * ) override ; void ReleaseGraphicsResources ( vtkWindow * ) override ; int RenderOverlay ( vtkViewport * ) override ; int RenderOpaqueGeometry ( vtkViewport * ) override ; int RenderTranslucentPolygonalGeometry ( vtkViewport * ) override ; vtkTypeBool HasTranslucentPolygonalGeometry ( ) override ; /@} VTK_DEPRECATED_IN_9_2_0 ( SetBWActorDisplayOverlay is deprecated. Use  SetBWActorDisplayOverlayEdges or SetBWActorDisplayOverlayPolygon instead. ) void SetBWActorDisplayOverlay ( bool ) ; void SetBWActorDisplayOverlayEdges ( bool ) ; void SetBWActorDisplayOverlayPolygon ( bool ) ; /@{ *
##  Set/Get the RGB color of the border.
##  Default is white (1.0, 1.0, 1.0).
##  virtual void SetBorderColor ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << BorderColor  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> BorderColor [ 0 ] != _arg1 ) || ( this -> BorderColor [ 1 ] != _arg2 ) || ( this -> BorderColor [ 2 ] != _arg3 ) ) { this -> BorderColor [ 0 ] = _arg1 ; this -> BorderColor [ 1 ] = _arg2 ; this -> BorderColor [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetBorderColor ( const double _arg [ 3 ] ) { this -> SetBorderColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetBorderColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << BorderColor  pointer  << this -> BorderColor ) ; return this -> BorderColor ; } VTK_WRAPEXCLUDE virtual void GetBorderColor ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> BorderColor [ 0 ] ; _arg2 = this -> BorderColor [ 1 ] ; _arg3 = this -> BorderColor [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << BorderColor  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetBorderColor ( double _arg [ 3 ] ) { this -> GetBorderColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  Set/Get the thickness of the border in screen units.
##  Default is 1.0.
##  virtual void SetShowVerticalBorderShowHorizontalBorderShowPolygonBackgroundToleranceInteractionStateBorderThickness ( float _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << BorderThickness  to  << _arg ) ; if ( this -> BorderThickness != ( _arg < 0 ? 0 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ) { this -> BorderThickness = ( _arg < 0 ? 0 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual float GetShowVerticalBorderMinValueShowHorizontalBorderMinValueShowPolygonBackgroundMinValueToleranceMinValueInteractionStateMinValueBorderThicknessMinValue ( ) { return 0 ; } virtual float GetShowVerticalBorderMaxValueShowHorizontalBorderMaxValueShowPolygonBackgroundMaxValueToleranceMaxValueInteractionStateMaxValueBorderThicknessMaxValue ( ) { return VTK_FLOAT_MAX ; } ; virtual float GetShowVerticalBorderShowHorizontalBorderShowPolygonBackgroundEnforceNormalizedViewportBoundsProportionalResizeToleranceMovingWindowLocationBorderThickness ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BorderThickness  of  << this -> BorderThickness ) ; return this -> BorderThickness ; } ; /@} /@{ *
##  Set/Get the ratio between no radius and maximum radius.
##  In order to compute round corners, we create 2 points
##  in each side of the corner. The maximum radius is then
##  the minimum length of the two sides of each corners.
##  This maximum radius is scaled by the CornerRadiusStrength.
##  Default is 0.0 (no radius).
##  virtual void SetShowVerticalBorderShowHorizontalBorderShowPolygonBackgroundToleranceInteractionStateBorderThicknessCornerRadiusStrength ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << CornerRadiusStrength  to  << _arg ) ; if ( this -> CornerRadiusStrength != ( _arg < 0.0 ? 0.0 : ( _arg > 1.0 ? 1.0 : _arg ) ) ) { this -> CornerRadiusStrength = ( _arg < 0.0 ? 0.0 : ( _arg > 1.0 ? 1.0 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetShowVerticalBorderMinValueShowHorizontalBorderMinValueShowPolygonBackgroundMinValueToleranceMinValueInteractionStateMinValueBorderThicknessMinValueCornerRadiusStrengthMinValue ( ) { return 0.0 ; } virtual double GetShowVerticalBorderMaxValueShowHorizontalBorderMaxValueShowPolygonBackgroundMaxValueToleranceMaxValueInteractionStateMaxValueBorderThicknessMaxValueCornerRadiusStrengthMaxValue ( ) { return 1.0 ; } ; virtual double GetShowVerticalBorderShowHorizontalBorderShowPolygonBackgroundEnforceNormalizedViewportBoundsProportionalResizeToleranceMovingWindowLocationBorderThicknessCornerRadiusStrength ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CornerRadiusStrength  of  << this -> CornerRadiusStrength ) ; return this -> CornerRadiusStrength ; } ; /@} /@{ *
##  Set/Get the number of points that define each round corners.
##  A high value increase the resolution of the corners.
##  Default is 20.
##  virtual void SetShowVerticalBorderShowHorizontalBorderShowPolygonBackgroundToleranceInteractionStateBorderThicknessCornerRadiusStrengthCornerResolution ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << CornerResolution  to  << _arg ) ; if ( this -> CornerResolution != ( _arg < 0 ? 0 : ( _arg > 1000 ? 1000 : _arg ) ) ) { this -> CornerResolution = ( _arg < 0 ? 0 : ( _arg > 1000 ? 1000 : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetShowVerticalBorderMinValueShowHorizontalBorderMinValueShowPolygonBackgroundMinValueToleranceMinValueInteractionStateMinValueBorderThicknessMinValueCornerRadiusStrengthMinValueCornerResolutionMinValue ( ) { return 0 ; } virtual int GetShowVerticalBorderMaxValueShowHorizontalBorderMaxValueShowPolygonBackgroundMaxValueToleranceMaxValueInteractionStateMaxValueBorderThicknessMaxValueCornerRadiusStrengthMaxValueCornerResolutionMaxValue ( ) { return 1000 ; } ; virtual int GetShowVerticalBorderShowHorizontalBorderShowPolygonBackgroundEnforceNormalizedViewportBoundsProportionalResizeToleranceMovingWindowLocationBorderThicknessCornerRadiusStrengthCornerResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CornerResolution  of  << this -> CornerResolution ) ; return this -> CornerResolution ; } ; /@} /@{ *
##  Set/Get the RGB color of the background polygon.
##  Default is white (1.0, 1.0, 1.0).
##  virtual void SetBorderColorPolygonColor ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << PolygonColor  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> PolygonColor [ 0 ] != _arg1 ) || ( this -> PolygonColor [ 1 ] != _arg2 ) || ( this -> PolygonColor [ 2 ] != _arg3 ) ) { this -> PolygonColor [ 0 ] = _arg1 ; this -> PolygonColor [ 1 ] = _arg2 ; this -> PolygonColor [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetBorderColorPolygonColor ( const double _arg [ 3 ] ) { this -> SetBorderColorPolygonColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetBorderColorPolygonColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << PolygonColor  pointer  << this -> PolygonColor ) ; return this -> PolygonColor ; } VTK_WRAPEXCLUDE virtual void GetBorderColorPolygonColor ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> PolygonColor [ 0 ] ; _arg2 = this -> PolygonColor [ 1 ] ; _arg3 = this -> PolygonColor [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << PolygonColor  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetBorderColorPolygonColor ( double _arg [ 3 ] ) { this -> GetBorderColorPolygonColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  Set/Get the opacity of the background color.
##  Default is 0.0.
##  virtual void SetShowVerticalBorderShowHorizontalBorderShowPolygonBackgroundToleranceInteractionStateBorderThicknessCornerRadiusStrengthCornerResolutionPolygonOpacity ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << PolygonOpacity  to  << _arg ) ; if ( this -> PolygonOpacity != ( _arg < 0.0 ? 0.0 : ( _arg > 1.0 ? 1.0 : _arg ) ) ) { this -> PolygonOpacity = ( _arg < 0.0 ? 0.0 : ( _arg > 1.0 ? 1.0 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetShowVerticalBorderMinValueShowHorizontalBorderMinValueShowPolygonBackgroundMinValueToleranceMinValueInteractionStateMinValueBorderThicknessMinValueCornerRadiusStrengthMinValueCornerResolutionMinValuePolygonOpacityMinValue ( ) { return 0.0 ; } virtual double GetShowVerticalBorderMaxValueShowHorizontalBorderMaxValueShowPolygonBackgroundMaxValueToleranceMaxValueInteractionStateMaxValueBorderThicknessMaxValueCornerRadiusStrengthMaxValueCornerResolutionMaxValuePolygonOpacityMaxValue ( ) { return 1.0 ; } ; virtual double GetShowVerticalBorderShowHorizontalBorderShowPolygonBackgroundEnforceNormalizedViewportBoundsProportionalResizeToleranceMovingWindowLocationBorderThicknessCornerRadiusStrengthCornerResolutionPolygonOpacity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PolygonOpacity  of  << this -> PolygonOpacity ) ; return this -> PolygonOpacity ; } ; /@} /@{ *
##  Convenience method to set the background color and the opacity at once
##  void SetPolygonRGBA ( double rgba [ 4 ] ) ; void SetPolygonRGBA ( double r , double g , double b , double a ) ; *
##  Convenience method to get the background color and the opacity at once
##  void GetPolygonRGBA ( double rgba [ 4 ] ) ; void GetPolygonRGBA ( double & r , double & g , double & b , double & a ) ; /@} protected : vtkBorderRepresentation ( ) ; ~ vtkBorderRepresentation ( ) override ;  Ivars int ShowVerticalBorder = BORDER_ON ; int ShowHorizontalBorder = BORDER_ON ; int ShowPolygonBackground = BORDER_ON ; vtkNew < vtkProperty2D > BorderProperty ; vtkNew < vtkProperty2D > PolygonProperty ; vtkTypeBool EnforceNormalizedViewportBounds = 0 ; vtkTypeBool ProportionalResize = 0 ; int Tolerance = 3 ; vtkTypeBool Moving = 0 ; double SelectionPoint [ 2 ] = { 0.0 , 0.0 } ;  Layout (position of lower left and upper right corners of border) vtkNew < vtkCoordinate > PositionCoordinate ; vtkNew < vtkCoordinate > Position2Coordinate ;  Window location by enumeration int WindowLocation = AnyLocation ; virtual void UpdateWindowLocation ( ) ;  Sometimes subclasses must negotiate with their superclasses
##  to achieve the correct layout. int Negotiated ; virtual void NegotiateLayout ( ) ;  Update the border visibility based on InteractionState.
##  See Also: SetShowHorizontalBorder(), SetShowHorizontalBorder(),
##  ComputeInteractionState() virtual void UpdateShowBorder ( ) ;  Keep track of start position when moving border double StartPosition [ 2 ] ;  Border representation. Subclasses may use the BWTransform class
##  to transform their geometry into the region surrounded by the border. vtkNew < vtkPoints > BWPoints ; vtkNew < vtkPolyData > BWPolyData ; vtkNew < vtkPolyData > PolyDataEdges ; vtkNew < vtkPolyData > PolyDataPolygon ; vtkNew < vtkTransform > BWTransform ; vtkNew < vtkTransformPolyDataFilter > BWTransformFilter ; vtkNew < vtkPolyDataMapper2D > BWMapperEdges ; vtkNew < vtkPolyDataMapper2D > BWMapperPolygon ; vtkNew < vtkActor2D > BWActorEdges ; vtkNew < vtkActor2D > BWActorPolygon ;  Constraints on size double MinimumNormalizedViewportSize [ 2 ] = { 0.0 , 0.0 } ; int MinimumSize [ 2 ] = { 1 , 1 } ; int MaximumSize [ 2 ] = { VTK_INT_MAX , VTK_INT_MAX } ;  Properties of the border double BorderColor [ 3 ] = { 1.0 , 1.0 , 1.0 } ; float BorderThickness = 1.0 ; double CornerRadiusStrength = 0.0 ; int CornerResolution = 20 ;  Properties of the inner polygon (ie. the background) double PolygonColor [ 3 ] = { 1.0 , 1.0 , 1.0 } ; double PolygonOpacity = 0.0 ; *
##  Create all 4 round corners with the specified radius and resolution.
##  void ComputeRoundCorners ( ) ; *
##  Create a quarter circle centered in point[idCenterX].x, point[idCenterY].y),
##  of radius 'radius' with a starting angle 'startAngle' ending in
##  'startAngle + PI/2' with CornerResolution number of points.
##  Computed points are stored in the vtkPoints 'points' and
##  inserted in the vtkCellArray 'polys'
##  void ComputeOneRoundCorner ( vtkCellArray * polys , vtkPoints * points , const double radius , vtkIdType xPt , vtkIdType yPt , const double startAngle ) ; private : vtkBorderRepresentation ( const vtkBorderRepresentation & ) = delete ; void operator = ( const vtkBorderRepresentation & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
