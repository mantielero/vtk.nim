## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCurveRepresentation
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
##  @class   vtkCurveRepresentation
##  @brief   vtkWidgetRepresentation
##  base class for a widget that represents an curve that connects control
##  points.
##
##  Base class for widgets used to define curves from points, such as
##  vtkPolyLineRepresentation and vtkSplineRepresentation.  This class
##  uses handles, the number of which can be changed, to represent the
##  points that define the curve. The handles can be picked can be
##  picked on the curve itself to translate or rotate it in the scene.
##

## !!!Ignored construct:  # vtkCurveRepresentation_h [NewLine] # vtkCurveRepresentation_h [NewLine] # vtkDeprecation.h  For VTK_DEPRECATED_IN_9_2_0 # vtkInteractionWidgetsModule.h  For export macro # vtkPolyDataAlgorithm.h  needed for vtkPolyDataAlgorithm # vtkWidgetRepresentation.h [NewLine] class vtkActor ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkCellPicker"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkHandleSource"
discard "forward decl of vtkPlaneSource"
discard "forward decl of vtkPoints"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkProp"
discard "forward decl of vtkProperty"
discard "forward decl of vtkTransform"
const
  VTK_PROJECTION_YZ* = 0
  VTK_PROJECTION_XZ* = 1
  VTK_PROJECTION_XY* = 2
  VTK_PROJECTION_OBLIQUE* = 3

## !!!Ignored construct:  class VTKINTERACTIONWIDGETS_EXPORT vtkCurveRepresentation : public vtkWidgetRepresentation { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkWidgetRepresentation Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkWidgetRepresentation :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkCurveRepresentation :: IsTypeOf ( type ) ; } static vtkCurveRepresentation * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkCurveRepresentation * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkCurveRepresentation * NewInstance ( ) const { return vtkCurveRepresentation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWidgetRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCurveRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCurveRepresentation :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ;  Used to manage the InteractionState of the widget enum InteractionStateType { Outside = 0 , OnHandle , OnLine , Moving , Scaling , Spinning , Inserting , Erasing , Pushing } ; # ! defined ( VTK_LEGACY_REMOVE ) [NewLine] VTK_DEPRECATED_IN_9_2_0 ( because leading underscore is reserved ) typedef InteractionStateType _InteractionState ; # [NewLine] /@{ *
##  Set the interaction state
##  virtual void SetInteractionState ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  InteractionState  to  << _arg ) ; if ( this -> InteractionState != _arg ) { this -> InteractionState = _arg ; this -> Modified ( ) ; } } ; /@} /@{ *
##  Force the widget to be projected onto one of the orthogonal
##  planes.  Remember that when the InteractionState changes, a
##  ModifiedEvent is invoked.  This can be used to snap the curve to
##  the plane if it is originally not aligned.  The normal in
##  SetProjectionNormal is 0,1,2 for YZ,XZ,XY planes respectively and
##  3 for arbitrary oblique planes when the widget is tied to a
##  vtkPlaneSource.
##  virtual void SetInteractionStateProjectToPlane ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ProjectToPlane  to  << _arg ) ; if ( this -> ProjectToPlane != _arg ) { this -> ProjectToPlane = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetProjectToPlane ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ProjectToPlane  of  << this -> ProjectToPlane ) ; return this -> ProjectToPlane ; } ; virtual void ProjectToPlaneOn ( ) { this -> SetProjectToPlane ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ProjectToPlaneOff ( ) { this -> SetProjectToPlane ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} *
##  Set up a reference to a vtkPlaneSource that could be from another widget
##  object, e.g. a vtkPolyDataSourceWidget.
##  void SetPlaneSource ( vtkPlaneSource * plane ) ; virtual void SetProjectionNormal ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ProjectionNormal  to  << _arg ) ; if ( this -> ProjectionNormal != ( _arg < VTK_PROJECTION_YZ ? VTK_PROJECTION_YZ : ( _arg > VTK_PROJECTION_OBLIQUE ? VTK_PROJECTION_OBLIQUE : _arg ) ) ) { this -> ProjectionNormal = ( _arg < VTK_PROJECTION_YZ ? VTK_PROJECTION_YZ : ( _arg > VTK_PROJECTION_OBLIQUE ? VTK_PROJECTION_OBLIQUE : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetProjectionNormalMinValue ( ) { return VTK_PROJECTION_YZ ; } virtual int GetProjectionNormalMaxValue ( ) { return VTK_PROJECTION_OBLIQUE ; } ; virtual int GetProjectToPlaneProjectionNormal ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ProjectionNormal  of  << this -> ProjectionNormal ) ; return this -> ProjectionNormal ; } ; void SetProjectionNormalToXAxes ( ) { this -> SetProjectionNormal ( 0 ) ; } void SetProjectionNormalToYAxes ( ) { this -> SetProjectionNormal ( 1 ) ; } void SetProjectionNormalToZAxes ( ) { this -> SetProjectionNormal ( 2 ) ; } void SetProjectionNormalToOblique ( ) { this -> SetProjectionNormal ( 3 ) ; } /@{ *
##  Set the position of poly line handles and points in terms of a plane's
##  position. i.e., if ProjectionNormal is 0, all of the x-coordinate
##  values of the points are set to position. Any value can be passed (and is
##  ignored) to update the poly line points when Projection normal is set to 3
##  for arbitrary plane orientations.
##  void SetProjectionPosition ( double position ) ; virtual double GetProjectToPlaneProjectionNormalProjectionPosition ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ProjectionPosition  of  << this -> ProjectionPosition ) ; return this -> ProjectionPosition ; } ; /@} *
##  Grab the polydata (including points) that defines the
##  interpolating curve. Points are guaranteed to be up-to-date when
##  either the InteractionEvent or EndInteraction events are
##  invoked. The user provides the vtkPolyData and the points and
##  polyline are added to it.
##  virtual void GetPolyData ( vtkPolyData * pd ) = 0 ; /@{ *
##  Set/Get the handle properties (the spheres are the handles). The
##  properties of the handles when selected and unselected can be manipulated.
##  virtual vtkProperty * GetnameHandleProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  HandleProperty  address  << static_cast < vtkProperty * > ( this -> HandleProperty ) ) ; return this -> HandleProperty ; } ; virtual vtkProperty * GetnameHandlePropertySelectedHandleProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  SelectedHandleProperty  address  << static_cast < vtkProperty * > ( this -> SelectedHandleProperty ) ) ; return this -> SelectedHandleProperty ; } ; /@} /@{ *
##  Set/Get the line properties. The properties of the line when selected
##  and unselected can be manipulated.
##  virtual vtkProperty * GetnameHandlePropertySelectedHandlePropertyLineProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  LineProperty  address  << static_cast < vtkProperty * > ( this -> LineProperty ) ) ; return this -> LineProperty ; } ; virtual vtkProperty * GetnameHandlePropertySelectedHandlePropertyLinePropertySelectedLineProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  SelectedLineProperty  address  << static_cast < vtkProperty * > ( this -> SelectedLineProperty ) ) ; return this -> SelectedLineProperty ; } ; /@} /@{ *
##  Set/Get the number of handles for this widget.
##  virtual void SetNumberOfHandles ( int npts ) = 0 ; virtual int GetProjectToPlaneProjectionNormalProjectionPositionNumberOfHandles ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfHandles  of  << this -> NumberOfHandles ) ; return this -> NumberOfHandles ; } ; /@} /@{ *
##  @deprecated VTK 9.1. Use `GetDirectional`  and `SetDirectional` instead.
##  VTK_DEPRECATED_IN_9_1_0 ( renamed to SetDirectional ) virtual void SetDirectionalLine ( bool val ) ; VTK_DEPRECATED_IN_9_1_0 ( renamed to GetDirectional ) virtual bool GetDirectionalLine ( ) ; VTK_DEPRECATED_IN_9_1_0 ( renamed to DirectionalOn ) virtual void DirectionalLineOn ( ) ; VTK_DEPRECATED_IN_9_1_0 ( renamed to DirectionalOff ) virtual void DirectionalLineOff ( ) ; /@} /@{ *
##  Set the representation to be directional or not.
##  The meaning of being directional depends on the representation and
##  its handles implementations in the subclasses.
##  virtual void SetDirectional ( bool val ) ; virtual bool GetProjectToPlaneProjectionNormalProjectionPositionNumberOfHandlesDirectional ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Directional  of  << this -> Directional ) ; return this -> Directional ; } ; virtual void DirectionalOn ( ) { this -> SetProjectToPlaneDirectional ( static_cast < bool > ( 1 ) ) ; } virtual void DirectionalOff ( ) { this -> SetProjectToPlaneDirectional ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the position of the handles. Call GetNumberOfHandles
##  to determine the valid range of handle indices.
##  virtual void SetHandlePosition ( int handle , double x , double y , double z ) ; virtual void SetHandlePosition ( int handle , double xyz [ 3 ] ) ; virtual void GetHandlePosition ( int handle , double xyz [ 3 ] ) ; virtual double * GetHandlePosition ( int handle ) ; virtual vtkDoubleArray * GetHandlePositions ( ) = 0 ; /@} /@{ *
##  Control whether the curve is open or closed. A closed forms a
##  continuous loop: the first and last points are the same.  A
##  minimum of 3 handles are required to form a closed loop.
##  void SetClosed ( vtkTypeBool closed ) ; virtual vtkTypeBool GetProjectToPlaneProjectionNormalProjectionPositionNumberOfHandlesDirectionalClosed ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Closed  of  << this -> Closed ) ; return this -> Closed ; } ; virtual void ClosedOn ( ) { this -> SetProjectToPlaneDirectionalClosed ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ClosedOff ( ) { this -> SetProjectToPlaneDirectionalClosed ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} *
##  Convenience method to determine whether the curve is
##  closed in a geometric sense.  The widget may be set "closed" but still
##  be geometrically open (e.g., a straight line).
##  vtkTypeBool IsClosed ( ) ; *
##  Get the approximate vs. the true arc length of the curve. Calculated as
##  the summed lengths of the individual straight line segments. Use
##  SetResolution to control the accuracy.
##  virtual double GetSummedLength ( ) = 0 ; *
##  Convenience method to allocate and set the handles from a
##  vtkPoints instance.  If the first and last points are the same,
##  the curve sets Closed to the on InteractionState and disregards
##  the last point, otherwise Closed remains unchanged.
##  virtual void InitializeHandles ( vtkPoints * points ) = 0 ; /@{ *
##  These are methods that satisfy vtkWidgetRepresentation
##  API. Note that a version of place widget is available where the
##  center and handle position are specified.
##  void BuildRepresentation ( ) override = 0 ; int ComputeInteractionState ( int X , int Y , int modify = 0 ) override ; void StartWidgetInteraction ( double e [ 2 ] ) override ; void WidgetInteraction ( double e [ 2 ] ) override ; void EndWidgetInteraction ( double e [ 2 ] ) override ; double * GetBounds ( ) override ; /@} /@{ *
##  Methods supporting, and required by, the rendering process.
##  void ReleaseGraphicsResources ( vtkWindow * ) override ; int RenderOpaqueGeometry ( vtkViewport * ) override ; int RenderTranslucentPolygonalGeometry ( vtkViewport * ) override ; int RenderOverlay ( vtkViewport * ) override ; vtkTypeBool HasTranslucentPolygonalGeometry ( ) override ; /@} *
##  Convenience method to set the line color.
##  Ideally one should use GetLineProperty()->SetColor().
##  void SetLineColor ( double r , double g , double b ) ;
##  Register internal Pickers within PickingManager
##  void RegisterPickers ( ) override ; /@{ *
##  Get/Set the current handle index. Setting the current handle index will
##  also result in the handle being highlighted. Set to `-1` to remove the
##  highlight.
##  void SetCurrentHandleIndex ( int index ) ; virtual int GetProjectToPlaneProjectionNormalProjectionPositionNumberOfHandlesDirectionalClosedCurrentHandleIndex ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CurrentHandleIndex  of  << this -> CurrentHandleIndex ) ; return this -> CurrentHandleIndex ; } ; /@} /@{ *
##  Gets/Sets the constraint axis for translations. Returns Axis::NONE
##  if none.
##  virtual int GetProjectToPlaneProjectionNormalProjectionPositionNumberOfHandlesDirectionalClosedCurrentHandleIndexTranslationAxis ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TranslationAxis  of  << this -> TranslationAxis ) ; return this -> TranslationAxis ; } ; virtual void SetProjectionNormalTranslationAxis ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << TranslationAxis  to  << _arg ) ; if ( this -> TranslationAxis != ( _arg < - 1 ? - 1 : ( _arg > 2 ? 2 : _arg ) ) ) { this -> TranslationAxis = ( _arg < - 1 ? - 1 : ( _arg > 2 ? 2 : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetProjectionNormalMinValueTranslationAxisMinValue ( ) { return - 1 ; } virtual int GetProjectionNormalMaxValueTranslationAxisMaxValue ( ) { return 2 ; } ; /@} /@{ *
##  Toggles constraint translation axis on/off.
##  void SetXTranslationAxisOn ( ) { this -> TranslationAxis = Axis :: XAxis ; } void SetYTranslationAxisOn ( ) { this -> TranslationAxis = Axis :: YAxis ; } void SetZTranslationAxisOn ( ) { this -> TranslationAxis = Axis :: ZAxis ; } void SetTranslationAxisOff ( ) { this -> TranslationAxis = Axis :: NONE ; } /@} /@{ *
##  Returns true if ContrainedAxis
##  bool IsTranslationConstrained ( ) { return this -> TranslationAxis != Axis :: NONE ; } /@} *
##  Methods to make this class behave as a vtkProp. They are repeated here (from the
##  vtkProp superclass) as a reminder to the widget implementor. Failure to implement
##  these methods properly may result in the representation not appearing in the scene
##  (i.e., not implementing the Render() methods properly) or leaking graphics resources
##  (i.e., not implementing ReleaseGraphicsResources() properly).
##  void GetActors ( vtkPropCollection * ) override ; protected : vtkCurveRepresentation ( ) ; ~ vtkCurveRepresentation ( ) override ; double LastEventPosition [ 3 ] ; double Bounds [ 6 ] ;  Controlling vars int ProjectionNormal ; double ProjectionPosition ; vtkTypeBool ProjectToPlane ; vtkPlaneSource * PlaneSource ;  Projection capabilities void ProjectPointsToPlane ( ) ; void ProjectPointsToOrthoPlane ( ) ; void ProjectPointsToObliquePlane ( ) ; int NumberOfHandles = 0 ; vtkTypeBool Closed ;  The line segments vtkActor * LineActor ; void HighlightLine ( int highlight ) ; int HighlightHandle ( vtkProp * prop ) ;  returns handle index or -1 on fail  accessors to glyphs representing hot spots (e.g., handles) virtual vtkActor * GetHandleActor ( int index ) = 0 ; virtual vtkHandleSource * GetHandleSource ( int index ) = 0 ; *
##  returns handle index or -1 on fail
##  virtual int GetHandleIndex ( vtkProp * prop ) = 0 ; virtual void SizeHandles ( ) ; *
##  Returns the position of insertion or -1 on fail.
##  virtual int InsertHandleOnLine ( double * pos ) = 0 ; virtual void PushHandle ( double * pos ) ; virtual void EraseHandle ( const int & ) ;  Do the picking vtkCellPicker * HandlePicker ; vtkCellPicker * LinePicker ; double LastPickPosition [ 3 ] ; vtkActor * CurrentHandle ; int CurrentHandleIndex ; bool FirstSelected ;  Methods to manipulate the curve. void MovePoint ( double * p1 , double * p2 ) ; void Scale ( double * p1 , double * p2 , int X , int Y ) ; void Translate ( double * p1 , double * p2 ) ; void Spin ( double * p1 , double * p2 , double * vpn ) ;  Transform the control points (used for spinning) vtkTransform * Transform ;  Manage how the representation appears bool Directional = false ;  Properties used to control the appearance of selected objects and
##  the manipulator in general. vtkProperty * HandleProperty ; vtkProperty * SelectedHandleProperty ; vtkProperty * LineProperty ; vtkProperty * SelectedLineProperty ; void CreateDefaultProperties ( ) ;  For efficient spinning double Centroid [ 3 ] ; void CalculateCentroid ( ) ; int TranslationAxis ; private : vtkCurveRepresentation ( const vtkCurveRepresentation & ) = delete ; void operator = ( const vtkCurveRepresentation & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
