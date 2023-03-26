## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLeaderActor2D.h
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
##  @class   vtkLeaderActor2D
##  @brief   create a leader with optional label and arrows
##
##  vtkLeaderActor2D creates a leader with an optional label and arrows. (A
##  leader is typically used to indicate distance between points.)
##  vtkLeaderActor2D is a type of vtkActor2D; that is, it is drawn on the
##  overlay plane and is not occluded by 3D geometry. To use this class, you
##  typically specify two points defining the start and end points of the line
##  (x-y definition using vtkCoordinate class), whether to place arrows on one
##  or both end points, and whether to label the leader. Also, this class has a
##  special feature that allows curved leaders to be created by specifying a
##  radius.
##
##  Use the vtkLeaderActor2D uses its superclass vtkActor2D instance variables
##  Position and Position2 vtkCoordinates to place an instance of
##  vtkLeaderActor2D (i.e., these two data members represent the start and end
##  points of the leader).  Using these vtkCoordinates you can specify the position
##  of the leader in a variety of coordinate systems.
##
##  To control the appearance of the actor, use the superclasses
##  vtkActor2D::vtkProperty2D and the vtkTextProperty objects associated with
##  this actor.
##
##  @sa
##  vtkAxisActor2D vtkActor2D vtkCoordinate vtkTextProperty
##

## !!!Ignored construct:  # vtkLeaderActor2D_h [NewLine] # vtkLeaderActor2D_h [NewLine] # vtkActor2D.h [NewLine] # vtkRenderingAnnotationModule.h  For export macro [NewLine] class vtkPoints ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkCellArray"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkPolyDataMapper2D"
discard "forward decl of vtkTextMapper"
discard "forward decl of vtkTextProperty"
## !!!Ignored construct:  class VTKRENDERINGANNOTATION_EXPORT vtkLeaderActor2D : public vtkActor2D { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkActor2D Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkActor2D :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkLeaderActor2D :: IsTypeOf ( type ) ; } static vtkLeaderActor2D * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkLeaderActor2D * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkLeaderActor2D * NewInstance ( ) const { return vtkLeaderActor2D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkActor2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLeaderActor2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLeaderActor2D :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Instantiate object.
##  static vtkLeaderActor2D * New ( ) ; /@{ *
##  Set/Get a radius which can be used to curve the leader.  If a radius is
##  specified whose absolute value is greater than one half the distance
##  between the two points defined by the superclasses' Position and
##  Position2 ivars, then the leader will be curved. A positive radius will
##  produce a curve such that the center is to the right of the line from
##  Position and Position2; a negative radius will produce a curve in the
##  opposite sense. By default, the radius is set to zero and thus there
##  is no curvature. Note that the radius is expresses as a multiple of
##  the distance between (Position,Position2); this avoids issues relative
##  to coordinate system transformations.
##  virtual void SetRadius ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Radius  to  << _arg ) ; if ( this -> Radius != _arg ) { this -> Radius = _arg ; this -> Modified ( ) ; } } ; virtual double GetRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Radius  of  << this -> Radius ) ; return this -> Radius ; } ; /@} /@{ *
##  Set/Get the label for the leader. If the label is an empty string, then
##  it will not be drawn.
##  virtual void SetLabel ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Label  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> Label == nullptr && _arg == nullptr ) { return ; } if ( this -> Label && _arg && ( ! strcmp ( this -> Label , _arg ) ) ) { return ; } delete [ ] this -> Label ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> Label = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> Label = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetLabel ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << Label  of  << ( this -> Label ? this -> Label : (null) ) ) ; return this -> Label ; } ; /@} /@{ *
##  Set/Get the text property of the label.
##  virtual void SetLabelTextProperty ( vtkTextProperty * p ) ; virtual vtkTextProperty * GetnameLabelTextProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  LabelTextProperty  address  << static_cast < vtkTextProperty * > ( this -> LabelTextProperty ) ) ; return this -> LabelTextProperty ; } ; /@} /@{ *
##  Set/Get the factor that controls the overall size of the fonts used
##  to label the leader.
##  virtual void SetLabelFactor ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << LabelFactor  to  << _arg ) ; if ( this -> LabelFactor != ( _arg < 0.1 ? 0.1 : ( _arg > 2.0 ? 2.0 : _arg ) ) ) { this -> LabelFactor = ( _arg < 0.1 ? 0.1 : ( _arg > 2.0 ? 2.0 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetLabelFactorMinValue ( ) { return 0.1 ; } virtual double GetLabelFactorMaxValue ( ) { return 2.0 ; } ; virtual double GetRadiusLabelFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LabelFactor  of  << this -> LabelFactor ) ; return this -> LabelFactor ; } ; /@}  Enums defined to support methods for control of arrow placement and
##  and appearance of arrow heads. enum { VTK_ARROW_NONE = 0 , VTK_ARROW_POINT1 , VTK_ARROW_POINT2 , VTK_ARROW_BOTH } ; enum { VTK_ARROW_FILLED = 0 , VTK_ARROW_OPEN , VTK_ARROW_HOLLOW } ; /@{ *
##  Control whether arrow heads are drawn on the leader. Arrows may be
##  drawn on one end, both ends, or not at all.
##  virtual void SetLabelFactorArrowPlacement ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ArrowPlacement  to  << _arg ) ; if ( this -> ArrowPlacement != ( _arg < VTK_ARROW_NONE ? VTK_ARROW_NONE : ( _arg > VTK_ARROW_BOTH ? VTK_ARROW_BOTH : _arg ) ) ) { this -> ArrowPlacement = ( _arg < VTK_ARROW_NONE ? VTK_ARROW_NONE : ( _arg > VTK_ARROW_BOTH ? VTK_ARROW_BOTH : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetLabelFactorMinValueArrowPlacementMinValue ( ) { return VTK_ARROW_NONE ; } virtual int GetLabelFactorMaxValueArrowPlacementMaxValue ( ) { return VTK_ARROW_BOTH ; } ; virtual int GetRadiusLabelFactorArrowPlacement ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ArrowPlacement  of  << this -> ArrowPlacement ) ; return this -> ArrowPlacement ; } ; void SetArrowPlacementToNone ( ) { this -> SetArrowPlacement ( VTK_ARROW_NONE ) ; } void SetArrowPlacementToPoint1 ( ) { this -> SetArrowPlacement ( VTK_ARROW_POINT1 ) ; } void SetArrowPlacementToPoint2 ( ) { this -> SetArrowPlacement ( VTK_ARROW_POINT2 ) ; } void SetArrowPlacementToBoth ( ) { this -> SetArrowPlacement ( VTK_ARROW_BOTH ) ; } /@} /@{ *
##  Control the appearance of the arrow heads. A solid arrow head is a filled
##  triangle; a open arrow looks like a "V"; and a hollow arrow looks like a
##  non-filled triangle.
##  virtual void SetLabelFactorArrowPlacementArrowStyle ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ArrowStyle  to  << _arg ) ; if ( this -> ArrowStyle != ( _arg < VTK_ARROW_FILLED ? VTK_ARROW_FILLED : ( _arg > VTK_ARROW_HOLLOW ? VTK_ARROW_HOLLOW : _arg ) ) ) { this -> ArrowStyle = ( _arg < VTK_ARROW_FILLED ? VTK_ARROW_FILLED : ( _arg > VTK_ARROW_HOLLOW ? VTK_ARROW_HOLLOW : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetLabelFactorMinValueArrowPlacementMinValueArrowStyleMinValue ( ) { return VTK_ARROW_FILLED ; } virtual int GetLabelFactorMaxValueArrowPlacementMaxValueArrowStyleMaxValue ( ) { return VTK_ARROW_HOLLOW ; } ; virtual int GetRadiusLabelFactorArrowPlacementArrowStyle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ArrowStyle  of  << this -> ArrowStyle ) ; return this -> ArrowStyle ; } ; void SetArrowStyleToFilled ( ) { this -> SetArrowStyle ( VTK_ARROW_FILLED ) ; } void SetArrowStyleToOpen ( ) { this -> SetArrowStyle ( VTK_ARROW_OPEN ) ; } void SetArrowStyleToHollow ( ) { this -> SetArrowStyle ( VTK_ARROW_HOLLOW ) ; } /@} /@{ *
##  Specify the arrow length and base width (in normalized viewport
##  coordinates).
##  virtual void SetLabelFactorArrowPlacementArrowStyleArrowLength ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ArrowLength  to  << _arg ) ; if ( this -> ArrowLength != ( _arg < 0.0 ? 0.0 : ( _arg > 1.0 ? 1.0 : _arg ) ) ) { this -> ArrowLength = ( _arg < 0.0 ? 0.0 : ( _arg > 1.0 ? 1.0 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetLabelFactorMinValueArrowPlacementMinValueArrowStyleMinValueArrowLengthMinValue ( ) { return 0.0 ; } virtual double GetLabelFactorMaxValueArrowPlacementMaxValueArrowStyleMaxValueArrowLengthMaxValue ( ) { return 1.0 ; } ; virtual double GetRadiusLabelFactorArrowPlacementArrowStyleArrowLength ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ArrowLength  of  << this -> ArrowLength ) ; return this -> ArrowLength ; } ; virtual void SetLabelFactorArrowPlacementArrowStyleArrowLengthArrowWidth ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ArrowWidth  to  << _arg ) ; if ( this -> ArrowWidth != ( _arg < 0.0 ? 0.0 : ( _arg > 1.0 ? 1.0 : _arg ) ) ) { this -> ArrowWidth = ( _arg < 0.0 ? 0.0 : ( _arg > 1.0 ? 1.0 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetLabelFactorMinValueArrowPlacementMinValueArrowStyleMinValueArrowLengthMinValueArrowWidthMinValue ( ) { return 0.0 ; } virtual double GetLabelFactorMaxValueArrowPlacementMaxValueArrowStyleMaxValueArrowLengthMaxValueArrowWidthMaxValue ( ) { return 1.0 ; } ; virtual double GetRadiusLabelFactorArrowPlacementArrowStyleArrowLengthArrowWidth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ArrowWidth  of  << this -> ArrowWidth ) ; return this -> ArrowWidth ; } ; /@} /@{ *
##  Limit the minimum and maximum size of the arrows. These values are
##  expressed in pixels and clamp the minimum/maximum possible size for the
##  width/length of the arrow head. (When clamped, the ratio between length
##  and width is preserved.)
##  virtual void SetLabelFactorArrowPlacementArrowStyleArrowLengthArrowWidthMinimumArrowSize ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << MinimumArrowSize  to  << _arg ) ; if ( this -> MinimumArrowSize != ( _arg < 1.0 ? 1.0 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ) { this -> MinimumArrowSize = ( _arg < 1.0 ? 1.0 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetLabelFactorMinValueArrowPlacementMinValueArrowStyleMinValueArrowLengthMinValueArrowWidthMinValueMinimumArrowSizeMinValue ( ) { return 1.0 ; } virtual double GetLabelFactorMaxValueArrowPlacementMaxValueArrowStyleMaxValueArrowLengthMaxValueArrowWidthMaxValueMinimumArrowSizeMaxValue ( ) { return VTK_FLOAT_MAX ; } ; virtual double GetRadiusLabelFactorArrowPlacementArrowStyleArrowLengthArrowWidthMinimumArrowSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MinimumArrowSize  of  << this -> MinimumArrowSize ) ; return this -> MinimumArrowSize ; } ; virtual void SetLabelFactorArrowPlacementArrowStyleArrowLengthArrowWidthMinimumArrowSizeMaximumArrowSize ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << MaximumArrowSize  to  << _arg ) ; if ( this -> MaximumArrowSize != ( _arg < 1.0 ? 1.0 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ) { this -> MaximumArrowSize = ( _arg < 1.0 ? 1.0 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetLabelFactorMinValueArrowPlacementMinValueArrowStyleMinValueArrowLengthMinValueArrowWidthMinValueMinimumArrowSizeMinValueMaximumArrowSizeMinValue ( ) { return 1.0 ; } virtual double GetLabelFactorMaxValueArrowPlacementMaxValueArrowStyleMaxValueArrowLengthMaxValueArrowWidthMaxValueMinimumArrowSizeMaxValueMaximumArrowSizeMaxValue ( ) { return VTK_FLOAT_MAX ; } ; virtual double GetRadiusLabelFactorArrowPlacementArrowStyleArrowLengthArrowWidthMinimumArrowSizeMaximumArrowSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumArrowSize  of  << this -> MaximumArrowSize ) ; return this -> MaximumArrowSize ; } ; /@} /@{ *
##  Enable auto-labelling. In this mode, the label is automatically updated
##  based on distance (in world coordinates) between the two end points; or
##  if a curved leader is being generated, the angle in degrees between the
##  two points.
##  virtual void SetRadiusAutoLabel ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  AutoLabel  to  << _arg ) ; if ( this -> AutoLabel != _arg ) { this -> AutoLabel = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetRadiusLabelFactorArrowPlacementArrowStyleArrowLengthArrowWidthMinimumArrowSizeMaximumArrowSizeAutoLabel ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AutoLabel  of  << this -> AutoLabel ) ; return this -> AutoLabel ; } ; virtual void AutoLabelOn ( ) { this -> SetAutoLabel ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void AutoLabelOff ( ) { this -> SetAutoLabel ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify the format to use for auto-labelling.
##  virtual void SetLabelLabelFormat ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << LabelFormat  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> LabelFormat == nullptr && _arg == nullptr ) { return ; } if ( this -> LabelFormat && _arg && ( ! strcmp ( this -> LabelFormat , _arg ) ) ) { return ; } delete [ ] this -> LabelFormat ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> LabelFormat = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> LabelFormat = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetLabelLabelFormat ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << LabelFormat  of  << ( this -> LabelFormat ? this -> LabelFormat : (null) ) ) ; return this -> LabelFormat ; } ; /@} /@{ *
##  Obtain the length of the leader if the leader is not curved,
##  otherwise obtain the angle that the leader circumscribes.
##  virtual double GetRadiusLabelFactorArrowPlacementArrowStyleArrowLengthArrowWidthMinimumArrowSizeMaximumArrowSizeAutoLabelLength ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Length  of  << this -> Length ) ; return this -> Length ; } ; virtual double GetRadiusLabelFactorArrowPlacementArrowStyleArrowLengthArrowWidthMinimumArrowSizeMaximumArrowSizeAutoLabelLengthAngle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Angle  of  << this -> Angle ) ; return this -> Angle ; } ; /@} /@{ *
##  Methods required by vtkProp and vtkActor2D superclasses.
##  int RenderOverlay ( vtkViewport * viewport ) override ; int RenderOpaqueGeometry ( vtkViewport * viewport ) override ; int RenderTranslucentPolygonalGeometry ( vtkViewport * ) override { return 0 ; } /@} *
##  Does this prop have some translucent polygonal geometry?
##  vtkTypeBool HasTranslucentPolygonalGeometry ( ) override ; void ReleaseGraphicsResources ( vtkWindow * ) override ; void ShallowCopy ( vtkProp * prop ) override ; /@{ *
##  By default the LeaderActor2D controls the font size of the label. If this
##  option is set to true, it will instead use whatever font size is set in the
##  vtkTextProperty, allowing external control of the font size.
##  virtual void SetRadiusAutoLabelUseFontSizeFromProperty ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseFontSizeFromProperty  to  << _arg ) ; if ( this -> UseFontSizeFromProperty != _arg ) { this -> UseFontSizeFromProperty = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetRadiusLabelFactorArrowPlacementArrowStyleArrowLengthArrowWidthMinimumArrowSizeMaximumArrowSizeAutoLabelLengthAngleUseFontSizeFromProperty ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseFontSizeFromProperty  of  << this -> UseFontSizeFromProperty ) ; return this -> UseFontSizeFromProperty ; } ; virtual void UseFontSizeFromPropertyOn ( ) { this -> SetAutoLabelUseFontSizeFromProperty ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void UseFontSizeFromPropertyOff ( ) { this -> SetAutoLabelUseFontSizeFromProperty ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkLeaderActor2D ( ) ; ~ vtkLeaderActor2D ( ) override ;  Internal helper methods virtual void BuildLeader ( vtkViewport * viewport ) ; int SetFontSize ( vtkViewport * viewport , vtkTextMapper * textMapper , const int * targetSize , double factor , int * stringSize ) ; int ClipLeader ( double xL [ 3 ] , int stringSize [ 2 ] , double p1 [ 3 ] , double ray [ 3 ] , double c1 [ 3 ] , double c2 [ 3 ] ) ; void BuildCurvedLeader ( double p1 [ 3 ] , double p2 [ 3 ] , double ray [ 3 ] , double rayLength , double theta , vtkViewport * viewport , int viewportChanged ) ; int InStringBox ( double center [ 3 ] , int stringSize [ 2 ] , double x [ 3 ] ) ;  Characteristics of the leader double Radius ; double Length ; double Angle ; vtkTypeBool AutoLabel ; char * LabelFormat ; char * Label ; double LabelFactor ; vtkTextMapper * LabelMapper ; vtkActor2D * LabelActor ; vtkTextProperty * LabelTextProperty ; vtkTypeBool UseFontSizeFromProperty ; int ArrowPlacement ; int ArrowStyle ; double ArrowLength ; double ArrowWidth ; double MinimumArrowSize ; double MaximumArrowSize ; vtkPoints * LeaderPoints ; vtkCellArray * LeaderLines ; vtkCellArray * LeaderArrows ; vtkPolyData * Leader ; vtkPolyDataMapper2D * LeaderMapper ; vtkActor2D * LeaderActor ;  Internal ivars for tracking whether to rebuild int LastPosition [ 2 ] ; int LastPosition2 [ 2 ] ; int LastSize [ 2 ] ; vtkTimeStamp BuildTime ; private : vtkLeaderActor2D ( const vtkLeaderActor2D & ) = delete ; void operator = ( const vtkLeaderActor2D & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
