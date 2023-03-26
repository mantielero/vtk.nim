## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSplineWidget.h
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
##  @class   vtkSplineWidget
##  @brief   3D widget for manipulating a spline
##
##  This 3D widget defines a spline that can be interactively placed in a
##  scene. The spline has handles, the number of which can be changed, plus it
##  can be picked on the spline itself to translate or rotate it in the scene.
##  A nice feature of the object is that the vtkSplineWidget, like any 3D
##  widget, will work with the current interactor style. That is, if
##  vtkSplineWidget does not handle an event, then all other registered
##  observers (including the interactor style) have an opportunity to process
##  the event. Otherwise, the vtkSplineWidget will terminate the processing of
##  the event that it handles.
##
##  To use this object, just invoke SetInteractor() with the argument of the
##  method a vtkRenderWindowInteractor.  You may also wish to invoke
##  "PlaceWidget()" to initially position the widget. The interactor will act
##  normally until the "i" key (for "interactor") is pressed, at which point the
##  vtkSplineWidget will appear. (See superclass documentation for information
##  about changing this behavior.) Events that occur outside of the widget
##  (i.e., no part of the widget is picked) are propagated to any other
##  registered obsevers (such as the interaction style).  Turn off the widget
##  by pressing the "i" key again (or invoke the Off() method).
##
##  The button actions and key modifiers are as follows for controlling the
##  widget:
##  1) left button down on and drag one of the spherical handles to change the
##  shape of the spline: the handles act as "control points".
##  2) left button or middle button down on a line segment forming the spline
##  allows uniform translation of the widget.
##  3) ctrl + middle button down on the widget enables spinning of the widget
##  about its center.
##  4) right button down on the widget enables scaling of the widget. By moving
##  the mouse "up" the render window the spline will be made bigger; by moving
##  "down" the render window the widget will be made smaller.
##  5) ctrl key + right button down on any handle will erase it providing there
##  will be two or more points remaining to form a spline.
##  6) shift key + right button down on any line segment will insert a handle
##  onto the spline at the cursor position.
##
##  The vtkSplineWidget has several methods that can be used in conjunction with
##  other VTK objects. The Set/GetResolution() methods control the number of
##  subdivisions of the spline; the GetPolyData() method can be used to get the
##  polygonal representation and can be used for things like seeding
##  streamlines or probing other data sets. Typical usage of the widget is to
##  make use of the StartInteractionEvent, InteractionEvent, and
##  EndInteractionEvent events. The InteractionEvent is called on mouse motion;
##  the other two events are called on button down and button up (either left or
##  right button).
##
##  Some additional features of this class include the ability to control the
##  properties of the widget. You can set the properties of the selected and
##  unselected representations of the spline. For example, you can set the
##  property for the handles and spline. In addition there are methods to
##  constrain the spline so that it is aligned with a plane.  Note that a simple
##  ruler widget can be derived by setting the resolution to 1, the number of
##  handles to 2, and calling the GetSummedLength method!
##
##  @par Thanks:
##  Thanks to Dean Inglis for developing and contributing this class.
##
##  @sa
##  vtk3DWidget vtkBoxWidget vtkLineWidget vtkPointWidget vtkSphereWidget
##  vtkImagePlaneWidget vtkImplicitPlaneWidget vtkPlaneWidget
##

## !!!Ignored construct:  # vtkSplineWidget_h [NewLine] # vtkSplineWidget_h [NewLine] # vtk3DWidget.h [NewLine] # vtkInteractionWidgetsModule.h  For export macro [NewLine] class vtkActor ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkCellPicker"
discard "forward decl of vtkParametricSpline"
discard "forward decl of vtkParametricFunctionSource"
discard "forward decl of vtkPlaneSource"
discard "forward decl of vtkPoints"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkProp"
discard "forward decl of vtkProperty"
discard "forward decl of vtkSphereSource"
discard "forward decl of vtkTransform"
const
  VTK_PROJECTION_YZ* = 0
  VTK_PROJECTION_XZ* = 1
  VTK_PROJECTION_XY* = 2
  VTK_PROJECTION_OBLIQUE* = 3

## !!!Ignored construct:  class VTKINTERACTIONWIDGETS_EXPORT vtkSplineWidget : public vtk3DWidget { public : *
##  Instantiate the object.
##  static vtkSplineWidget * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtk3DWidget Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtk3DWidget :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkSplineWidget :: IsTypeOf ( type ) ; } static vtkSplineWidget * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkSplineWidget * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkSplineWidget * NewInstance ( ) const { return vtkSplineWidget :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtk3DWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSplineWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSplineWidget :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Methods that satisfy the superclass' API.
##  void SetEnabled ( int ) override ; void PlaceWidget ( double bounds [ 6 ] ) override ; void PlaceWidget ( ) override { this -> Superclass :: PlaceWidget ( ) ; } void PlaceWidget ( double xmin , double xmax , double ymin , double ymax , double zmin , double zmax ) override { this -> Superclass :: PlaceWidget ( xmin , xmax , ymin , ymax , zmin , zmax ) ; } /@} /@{ *
##  Force the spline widget to be projected onto one of the orthogonal planes.
##  Remember that when the state changes, a ModifiedEvent is invoked.
##  This can be used to snap the spline to the plane if it is originally
##  not aligned.  The normal in SetProjectionNormal is 0,1,2 for YZ,XZ,XY
##  planes respectively and 3 for arbitrary oblique planes when the widget
##  is tied to a vtkPlaneSource.
##  virtual void SetProjectToPlane ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ProjectToPlane  to  << _arg ) ; if ( this -> ProjectToPlane != _arg ) { this -> ProjectToPlane = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetProjectToPlane ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ProjectToPlane  of  << this -> ProjectToPlane ) ; return this -> ProjectToPlane ; } ; virtual void ProjectToPlaneOn ( ) { this -> SetProjectToPlane ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ProjectToPlaneOff ( ) { this -> SetProjectToPlane ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} *
##  Set up a reference to a vtkPlaneSource that could be from another widget
##  object, e.g. a vtkPolyDataSourceWidget.
##  void SetPlaneSource ( vtkPlaneSource * plane ) ; virtual void SetProjectionNormal ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ProjectionNormal  to  << _arg ) ; if ( this -> ProjectionNormal != ( _arg < VTK_PROJECTION_YZ ? VTK_PROJECTION_YZ : ( _arg > VTK_PROJECTION_OBLIQUE ? VTK_PROJECTION_OBLIQUE : _arg ) ) ) { this -> ProjectionNormal = ( _arg < VTK_PROJECTION_YZ ? VTK_PROJECTION_YZ : ( _arg > VTK_PROJECTION_OBLIQUE ? VTK_PROJECTION_OBLIQUE : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetProjectionNormalMinValue ( ) { return VTK_PROJECTION_YZ ; } virtual int GetProjectionNormalMaxValue ( ) { return VTK_PROJECTION_OBLIQUE ; } ; virtual int GetProjectToPlaneProjectionNormal ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ProjectionNormal  of  << this -> ProjectionNormal ) ; return this -> ProjectionNormal ; } ; void SetProjectionNormalToXAxes ( ) { this -> SetProjectionNormal ( 0 ) ; } void SetProjectionNormalToYAxes ( ) { this -> SetProjectionNormal ( 1 ) ; } void SetProjectionNormalToZAxes ( ) { this -> SetProjectionNormal ( 2 ) ; } void SetProjectionNormalToOblique ( ) { this -> SetProjectionNormal ( 3 ) ; } /@{ *
##  Set the position of spline handles and points in terms of a plane's
##  position. i.e., if ProjectionNormal is 0, all of the x-coordinate
##  values of the points are set to position. Any value can be passed (and is
##  ignored) to update the spline points when Projection normal is set to 3
##  for arbitrary plane orientations.
##  void SetProjectionPosition ( double position ) ; virtual double GetProjectToPlaneProjectionNormalProjectionPosition ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ProjectionPosition  of  << this -> ProjectionPosition ) ; return this -> ProjectionPosition ; } ; /@} *
##  Grab the polydata (including points) that defines the spline.  The
##  polydata consists of points and line segments numbering Resolution + 1
##  and Resoltuion, respectively. Points are guaranteed to be up-to-date when
##  either the InteractionEvent or EndInteraction events are invoked. The
##  user provides the vtkPolyData and the points and polyline are added to it.
##  void GetPolyData ( vtkPolyData * pd ) ; /@{ *
##  Set/Get the handle properties (the spheres are the handles). The
##  properties of the handles when selected and unselected can be manipulated.
##  virtual void SetHandleProperty ( vtkProperty * ) ; virtual vtkProperty * GetnameHandleProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  HandleProperty  address  << static_cast < vtkProperty * > ( this -> HandleProperty ) ) ; return this -> HandleProperty ; } ; virtual void SetSelectedHandleProperty ( vtkProperty * ) ; virtual vtkProperty * GetnameHandlePropertySelectedHandleProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  SelectedHandleProperty  address  << static_cast < vtkProperty * > ( this -> SelectedHandleProperty ) ) ; return this -> SelectedHandleProperty ; } ; /@} /@{ *
##  Set/Get the line properties. The properties of the line when selected
##  and unselected can be manipulated.
##  virtual void SetLineProperty ( vtkProperty * ) ; virtual vtkProperty * GetnameHandlePropertySelectedHandlePropertyLineProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  LineProperty  address  << static_cast < vtkProperty * > ( this -> LineProperty ) ) ; return this -> LineProperty ; } ; virtual void SetSelectedLineProperty ( vtkProperty * ) ; virtual vtkProperty * GetnameHandlePropertySelectedHandlePropertyLinePropertySelectedLineProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  SelectedLineProperty  address  << static_cast < vtkProperty * > ( this -> SelectedLineProperty ) ) ; return this -> SelectedLineProperty ; } ; /@} /@{ *
##  Set/Get the number of handles for this widget.
##  virtual void SetNumberOfHandles ( int npts ) ; virtual int GetProjectToPlaneProjectionNormalProjectionPositionNumberOfHandles ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfHandles  of  << this -> NumberOfHandles ) ; return this -> NumberOfHandles ; } ; /@} /@{ *
##  Set/Get the number of line segments representing the spline for
##  this widget.
##  void SetResolution ( int resolution ) ; virtual int GetProjectToPlaneProjectionNormalProjectionPositionNumberOfHandlesResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Resolution  of  << this -> Resolution ) ; return this -> Resolution ; } ; /@} /@{ *
##  Set the parametric spline object. Through vtkParametricSpline's API, the
##  user can supply and configure one of currently two types of spline:
##  vtkCardinalSpline, vtkKochanekSpline. The widget controls the open
##  or closed configuration of the spline.
##  WARNING: The widget does not enforce internal consistency so that all
##  three are of the same type.
##  virtual void SetParametricSpline ( vtkParametricSpline * ) ; virtual vtkParametricSpline * GetnameHandlePropertySelectedHandlePropertyLinePropertySelectedLinePropertyParametricSpline ( ) { vtkDebugWithObjectMacro ( this , <<  returning  ParametricSpline  address  << static_cast < vtkParametricSpline * > ( this -> ParametricSpline ) ) ; return this -> ParametricSpline ; } ; /@} /@{ *
##  Set/Get the position of the spline handles. Call GetNumberOfHandles
##  to determine the valid range of handle indices.
##  void SetHandlePosition ( int handle , double x , double y , double z ) ; void SetHandlePosition ( int handle , double xyz [ 3 ] ) ; void GetHandlePosition ( int handle , double xyz [ 3 ] ) ; double * GetHandlePosition ( int handle ) VTK_SIZEHINT ( 3 ) ; /@} /@{ *
##  Control whether the spline is open or closed. A closed spline forms
##  a continuous loop: the first and last points are the same, and
##  derivatives are continuous.  A minimum of 3 handles are required to
##  form a closed loop.  This method enforces consistency with
##  user supplied subclasses of vtkSpline.
##  void SetClosed ( vtkTypeBool closed ) ; virtual vtkTypeBool GetProjectToPlaneProjectionNormalProjectionPositionNumberOfHandlesResolutionClosed ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Closed  of  << this -> Closed ) ; return this -> Closed ; } ; virtual void ClosedOn ( ) { this -> SetProjectToPlaneClosed ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ClosedOff ( ) { this -> SetProjectToPlaneClosed ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} *
##  Convenience method to determine whether the spline is
##  closed in a geometric sense.  The widget may be set "closed" but still
##  be geometrically open (e.g., a straight line).
##  int IsClosed ( ) ; *
##  Get the approximate vs. the true arc length of the spline. Calculated as
##  the summed lengths of the individual straight line segments. Use
##  SetResolution to control the accuracy.
##  double GetSummedLength ( ) ; *
##  Convenience method to allocate and set the handles from a vtkPoints
##  instance.  If the first and last points are the same, the spline sets
##  Closed to the on state and disregards the last point, otherwise Closed
##  remains unchanged.
##  void InitializeHandles ( vtkPoints * points ) ; /@{ *
##  Turn on / off event processing for this widget. If off, the widget will
##  not respond to user interaction
##  virtual void SetProjectionNormalProcessEvents ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ProcessEvents  to  << _arg ) ; if ( this -> ProcessEvents != ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ) { this -> ProcessEvents = ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ; this -> Modified ( ) ; } } virtual vtkTypeBool GetProjectionNormalMinValueProcessEventsMinValue ( ) { return 0 ; } virtual vtkTypeBool GetProjectionNormalMaxValueProcessEventsMaxValue ( ) { return 1 ; } ; virtual vtkTypeBool GetProjectToPlaneProjectionNormalProjectionPositionNumberOfHandlesResolutionClosedProcessEvents ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ProcessEvents  of  << this -> ProcessEvents ) ; return this -> ProcessEvents ; } ; virtual void ProcessEventsOn ( ) { this -> SetProjectToPlaneClosedProcessEvents ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ProcessEventsOff ( ) { this -> SetProjectToPlaneClosedProcessEvents ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkSplineWidget ( ) ; ~ vtkSplineWidget ( ) override ;  Manage the state of the widget int State ; enum WidgetState { Start = 0 , Moving , Scaling , Spinning , Inserting , Erasing , Outside } ;  handles the events static void ProcessEventsHandler ( vtkObject * object , unsigned long event , void * clientdata , void * calldata ) ;  ProcessEventsHandler() dispatches to these methods. void OnLeftButtonDown ( ) ; void OnLeftButtonUp ( ) ; void OnMiddleButtonDown ( ) ; void OnMiddleButtonUp ( ) ; void OnRightButtonDown ( ) ; void OnRightButtonUp ( ) ; void OnMouseMove ( ) ;  Controlling vars int ProjectionNormal ; double ProjectionPosition ; vtkTypeBool ProjectToPlane ; vtkPlaneSource * PlaneSource ;  Projection capabilities void ProjectPointsToPlane ( ) ; void ProjectPointsToOrthoPlane ( ) ; void ProjectPointsToObliquePlane ( ) ;  The spline vtkParametricSpline * ParametricSpline ; vtkParametricFunctionSource * ParametricFunctionSource ; int NumberOfHandles ; vtkTypeBool Closed ; void BuildRepresentation ( ) ;  The line segments vtkActor * LineActor ; void HighlightLine ( int highlight ) ; int Resolution ;  Glyphs representing hot spots (e.g., handles) vtkActor * * Handle ; vtkSphereSource * * HandleGeometry ; void Initialize ( ) ; int HighlightHandle ( vtkProp * prop ) ;  returns handle index or -1 on fail void SizeHandles ( ) override ; void InsertHandleOnLine ( double * pos ) ; void EraseHandle ( const int & ) ;  Do the picking vtkCellPicker * HandlePicker ; vtkCellPicker * LinePicker ; vtkActor * CurrentHandle ; int CurrentHandleIndex ;  Register internal Pickers within PickingManager void RegisterPickers ( ) override ;  Methods to manipulate the spline. void MovePoint ( double * p1 , double * p2 ) ; void Scale ( double * p1 , double * p2 , int X , int Y ) ; void Translate ( double * p1 , double * p2 ) ; void Spin ( double * p1 , double * p2 , double * vpn ) ;  Transform the control points (used for spinning) vtkTransform * Transform ;  Properties used to control the appearance of selected objects and
##  the manipulator in general. vtkProperty * HandleProperty ; vtkProperty * SelectedHandleProperty ; vtkProperty * LineProperty ; vtkProperty * SelectedLineProperty ; void CreateDefaultProperties ( ) ;  For efficient spinning double Centroid [ 3 ] ; void CalculateCentroid ( ) ; vtkTypeBool ProcessEvents ; private : vtkSplineWidget ( const vtkSplineWidget & ) = delete ; void operator = ( const vtkSplineWidget & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
