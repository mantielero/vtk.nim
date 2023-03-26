## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSphereRepresentation.h
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
##  @class   vtkSphereRepresentation
##  @brief   a class defining the representation for the vtkSphereWidget2
##
##  This class is a concrete representation for the vtkSphereWidget2. It
##  represents a sphere with an optional handle.  Through interaction with the
##  widget, the sphere can be arbitrarily positioned and scaled in 3D space;
##  and the handle can be moved on the surface of the sphere. Typically the
##  vtkSphereWidget2/vtkSphereRepresentation are used to position a sphere for
##  the purpose of extracting, cutting or clipping data; or the handle is
##  moved on the sphere to position a light or camera.
##
##  To use this representation, you normally use the PlaceWidget() method
##  to position the widget at a specified region in space. It is also possible
##  to set the center of the sphere, a radius, and/or a handle position.
##
##  @warning
##  Note that the representation is overconstrained in that the center and radius
##  of the sphere can be defined, this information plus the handle direction defines
##  the geometry of the representation. Alternatively, the user may specify the center
##  of the sphere plus the handle position.
##
##  @warning
##  This class, and vtkSphereWidget2, are second generation VTK widgets. An
##  earlier version of this functionality was defined in the class
##  vtkSphereWidget.
##
##  @sa
##  vtkSphereWidget2 vtkSphereWidget
##

## !!!Ignored construct:  # vtkSphereRepresentation_h [NewLine] # vtkSphereRepresentation_h [NewLine] # vtkInteractionWidgetsModule.h  For export macro # vtkSphereSource.h  Needed for fast access to the sphere source # vtkWidgetRepresentation.h [NewLine] class vtkActor ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkPolyDataMapper"
discard "forward decl of vtkSphere"
discard "forward decl of vtkSphereSource"
discard "forward decl of vtkCellPicker"
discard "forward decl of vtkProperty"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkPoints"
discard "forward decl of vtkPolyDataAlgorithm"
discard "forward decl of vtkTransform"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkMatrix4x4"
discard "forward decl of vtkTextMapper"
discard "forward decl of vtkActor2D"
discard "forward decl of vtkTextProperty"
discard "forward decl of vtkLineSource"
discard "forward decl of vtkCursor3D"
const
  VTK_SPHERE_OFF* = 0
  VTK_SPHERE_WIREFRAME* = 1
  VTK_SPHERE_SURFACE* = 2

## !!!Ignored construct:  class VTKINTERACTIONWIDGETS_EXPORT vtkSphereRepresentation : public vtkWidgetRepresentation { public : *
##  Instantiate the class.
##  static vtkSphereRepresentation * New ( ) ; /@{ *
##  Standard methods for type information and to print out the contents of the class.
##  protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkWidgetRepresentation Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkWidgetRepresentation :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkSphereRepresentation :: IsTypeOf ( type ) ; } static vtkSphereRepresentation * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkSphereRepresentation * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkSphereRepresentation * NewInstance ( ) const { return vtkSphereRepresentation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWidgetRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSphereRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSphereRepresentation :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@}  Used to manage the state of the widget enum { Outside = 0 , MovingHandle , OnSphere , Translating , Scaling } ; /@{ *
##  Set the representation (i.e., appearance) of the sphere. Different
##  representations are useful depending on the application.
##  virtual void SetRepresentation ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Representation  to  << _arg ) ; if ( this -> Representation != ( _arg < VTK_SPHERE_OFF ? VTK_SPHERE_OFF : ( _arg > VTK_SPHERE_SURFACE ? VTK_SPHERE_SURFACE : _arg ) ) ) { this -> Representation = ( _arg < VTK_SPHERE_OFF ? VTK_SPHERE_OFF : ( _arg > VTK_SPHERE_SURFACE ? VTK_SPHERE_SURFACE : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetRepresentationMinValue ( ) { return VTK_SPHERE_OFF ; } virtual int GetRepresentationMaxValue ( ) { return VTK_SPHERE_SURFACE ; } ; virtual int GetRepresentation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Representation  of  << this -> Representation ) ; return this -> Representation ; } ; void SetRepresentationToOff ( ) { this -> SetRepresentation ( VTK_SPHERE_OFF ) ; } void SetRepresentationToWireframe ( ) { this -> SetRepresentation ( VTK_SPHERE_WIREFRAME ) ; } void SetRepresentationToSurface ( ) { this -> SetRepresentation ( VTK_SPHERE_SURFACE ) ; } /@} *
##  Set/Get the resolution of the sphere in the theta direction.
##  void SetThetaResolution ( int r ) { this -> SphereSource -> SetThetaResolution ( r ) ; } int GetThetaResolution ( ) { return this -> SphereSource -> GetThetaResolution ( ) ; } *
##  Set/Get the resolution of the sphere in the phi direction.
##  void SetPhiResolution ( int r ) { this -> SphereSource -> SetPhiResolution ( r ) ; } int GetPhiResolution ( ) { return this -> SphereSource -> GetPhiResolution ( ) ; } *
##  Set/Get the center position of the sphere. Note that this may
##  adjust the direction from the handle to the center, as well as
##  the radius of the sphere.
##  void SetCenter ( double c [ 3 ] ) ; void SetCenter ( double x , double y , double z ) { double c [ 3 ] ; c [ 0 ] = x ; c [ 1 ] = y ; c [ 2 ] = z ; this -> SetCenter ( c ) ; } double * GetCenter ( ) VTK_SIZEHINT ( 3 ) { return this -> SphereSource -> GetCenter ( ) ; } void GetCenter ( double xyz [ 3 ] ) { this -> SphereSource -> GetCenter ( xyz ) ; } *
##  Set/Get the radius of sphere. Default is 0.5. Note that this may
##  modify the position of the handle based on the handle direction.
##  void SetRadius ( double r ) ; double GetRadius ( ) { return this -> SphereSource -> GetRadius ( ) ; } /@{ *
##  The handle sits on the surface of the sphere and may be moved around
##  the surface by picking (left mouse) and then moving. The position
##  of the handle can be retrieved, this is useful for positioning cameras
##  and lights. By default, the handle is turned off.
##  virtual void SetHandleVisibility ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  HandleVisibility  to  << _arg ) ; if ( this -> HandleVisibility != _arg ) { this -> HandleVisibility = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetRepresentationHandleVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HandleVisibility  of  << this -> HandleVisibility ) ; return this -> HandleVisibility ; } ; virtual void HandleVisibilityOn ( ) { this -> SetHandleVisibility ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void HandleVisibilityOff ( ) { this -> SetHandleVisibility ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the position of the handle. Note that this may adjust the radius
##  of the sphere and the handle direction.
##  void SetHandlePosition ( double handle [ 3 ] ) ; void SetHandlePosition ( double x , double y , double z ) { double p [ 3 ] ; p [ 0 ] = x ; p [ 1 ] = y ; p [ 2 ] = z ; this -> SetHandlePosition ( p ) ; } virtual double * GetHandlePosition ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << HandlePosition  pointer  << this -> HandlePosition ) ; return this -> HandlePosition ; } VTK_WRAPEXCLUDE virtual void GetHandlePosition ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> HandlePosition [ 0 ] ; _arg2 = this -> HandlePosition [ 1 ] ; _arg3 = this -> HandlePosition [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << HandlePosition  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetHandlePosition ( double _arg [ 3 ] ) { this -> GetHandlePosition ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  Set/Get the direction vector of the handle relative to the center of
##  the sphere. Setting the direction may affect the position of the handle
##  but will not affect the radius or position of the sphere.
##  void SetHandleDirection ( double dir [ 3 ] ) ; void SetHandleDirection ( double dx , double dy , double dz ) { double d [ 3 ] ; d [ 0 ] = dx ; d [ 1 ] = dy ; d [ 2 ] = dz ; this -> SetHandleDirection ( d ) ; } virtual double * GetHandlePositionHandleDirection ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << HandleDirection  pointer  << this -> HandleDirection ) ; return this -> HandleDirection ; } VTK_WRAPEXCLUDE virtual void GetHandlePositionHandleDirection ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> HandleDirection [ 0 ] ; _arg2 = this -> HandleDirection [ 1 ] ; _arg3 = this -> HandleDirection [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << HandleDirection  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetHandlePositionHandleDirection ( double _arg [ 3 ] ) { this -> GetHandlePositionHandleDirection ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  Enable/disable a label that displays the location of the handle in
##  spherical coordinates (radius,theta,phi). The two angles, theta and
##  phi, are displayed in degrees. Note that phi is measured from the
##  north pole down towards the equator; and theta is the angle around
##  the north/south axis.
##  virtual void SetHandleVisibilityHandleText ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  HandleText  to  << _arg ) ; if ( this -> HandleText != _arg ) { this -> HandleText = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetRepresentationHandleVisibilityHandleText ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HandleText  of  << this -> HandleText ) ; return this -> HandleText ; } ; virtual void HandleTextOn ( ) { this -> SetHandleVisibilityHandleText ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void HandleTextOff ( ) { this -> SetHandleVisibilityHandleText ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Enable/disable a radial line segment that joins the center of the
##  outer sphere and the handle.
##  virtual void SetHandleVisibilityHandleTextRadialLine ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  RadialLine  to  << _arg ) ; if ( this -> RadialLine != _arg ) { this -> RadialLine = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetRepresentationHandleVisibilityHandleTextRadialLine ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RadialLine  of  << this -> RadialLine ) ; return this -> RadialLine ; } ; virtual void RadialLineOn ( ) { this -> SetHandleVisibilityHandleTextRadialLine ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void RadialLineOff ( ) { this -> SetHandleVisibilityHandleTextRadialLine ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Enable/disable a center cursor
##  Default is disabled
##  virtual void SetHandleVisibilityHandleTextRadialLineCenterCursor ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CenterCursor  to  << _arg ) ; if ( this -> CenterCursor != _arg ) { this -> CenterCursor = _arg ; this -> Modified ( ) ; } } ; virtual bool GetRepresentationHandleVisibilityHandleTextRadialLineCenterCursor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CenterCursor  of  << this -> CenterCursor ) ; return this -> CenterCursor ; } ; virtual void CenterCursorOn ( ) { this -> SetHandleVisibilityHandleTextRadialLineCenterCursor ( static_cast < bool > ( 1 ) ) ; } virtual void CenterCursorOff ( ) { this -> SetHandleVisibilityHandleTextRadialLineCenterCursor ( static_cast < bool > ( 0 ) ) ; } ; /@} *
##  Grab the polydata (including points) that defines the sphere.  The
##  polydata consists of n+1 points, where n is the resolution of the
##  sphere. These point values are guaranteed to be up-to-date when either the
##  InteractionEvent or EndInteraction events are invoked. The user provides
##  the vtkPolyData and the points and polysphere are added to it.
##  void GetPolyData ( vtkPolyData * pd ) ; *
##  Get the spherical implicit function defined by this widget.  Note that
##  vtkSphere is a subclass of vtkImplicitFunction, meaning that it can be
##  used by a variety of filters to perform clipping, cutting, and selection
##  of data.
##  void GetSphere ( vtkSphere * sphere ) ; /@{ *
##  Get the sphere properties. The properties of the sphere when selected
##  and unselected can be manipulated.
##  virtual vtkProperty * GetnameSphereProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  SphereProperty  address  << static_cast < vtkProperty * > ( this -> SphereProperty ) ) ; return this -> SphereProperty ; } ; virtual vtkProperty * GetnameSpherePropertySelectedSphereProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  SelectedSphereProperty  address  << static_cast < vtkProperty * > ( this -> SelectedSphereProperty ) ) ; return this -> SelectedSphereProperty ; } ; /@} /@{ *
##  Get the handle properties (the little ball on the sphere is the
##  handle). The properties of the handle when selected and unselected
##  can be manipulated.
##  virtual vtkProperty * GetnameSpherePropertySelectedSpherePropertyHandleProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  HandleProperty  address  << static_cast < vtkProperty * > ( this -> HandleProperty ) ) ; return this -> HandleProperty ; } ; virtual vtkProperty * GetnameSpherePropertySelectedSpherePropertyHandlePropertySelectedHandleProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  SelectedHandleProperty  address  << static_cast < vtkProperty * > ( this -> SelectedHandleProperty ) ) ; return this -> SelectedHandleProperty ; } ; /@} /@{ *
##  Get the handle text property. This can be used to control the appearance
##  of the handle text.
##  virtual vtkTextProperty * GetnameSpherePropertySelectedSpherePropertyHandlePropertySelectedHandlePropertyHandleTextProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  HandleTextProperty  address  << static_cast < vtkTextProperty * > ( this -> HandleTextProperty ) ) ; return this -> HandleTextProperty ; } ; /@} /@{ *
##  Get the property of the radial line. This can be used to control the
##  appearance of the optional line connecting the center to the handle.
##  virtual vtkProperty * GetnameSpherePropertySelectedSpherePropertyHandlePropertySelectedHandlePropertyHandleTextPropertyRadialLineProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  RadialLineProperty  address  << static_cast < vtkProperty * > ( this -> RadialLineProperty ) ) ; return this -> RadialLineProperty ; } ; /@} *
##  The interaction state may be set from a widget (e.g., vtkSphereWidget2) or
##  other object. This controls how the interaction with the widget
##  proceeds. Normally this method is used as part of a handshaking
##  process with the widget: First ComputeInteractionState() is invoked that
##  returns a state based on geometric considerations (i.e., cursor near a
##  widget feature), then based on events, the widget may modify this
##  further.
##  void SetInteractionState ( int state ) ; /@{ *
##  These are methods that satisfy vtkWidgetRepresentation's API. Note that a
##  version of place widget is available where the center and handle position
##  are specified.
##  void PlaceWidget ( double bounds [ 6 ] ) override ; virtual void PlaceWidget ( double center [ 3 ] , double handlePosition [ 3 ] ) ; void BuildRepresentation ( ) override ; int ComputeInteractionState ( int X , int Y , int modify = 0 ) override ; void StartWidgetInteraction ( double e [ 2 ] ) override ; void WidgetInteraction ( double e [ 2 ] ) override ; double * GetBounds ( ) override ; /@} /@{ *
##  Methods supporting, and required by, the rendering process.
##  void ReleaseGraphicsResources ( vtkWindow * ) override ; int RenderOpaqueGeometry ( vtkViewport * ) override ; int RenderTranslucentPolygonalGeometry ( vtkViewport * ) override ; int RenderOverlay ( vtkViewport * ) override ; vtkTypeBool HasTranslucentPolygonalGeometry ( ) override ; /@}
##  Register internal Pickers within PickingManager
##  void RegisterPickers ( ) override ; /@{ *
##  Gets/Sets the constraint axis for translations. Returns Axis::NONE
##  if none.
##  virtual int GetRepresentationHandleVisibilityHandleTextRadialLineCenterCursorTranslationAxis ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TranslationAxis  of  << this -> TranslationAxis ) ; return this -> TranslationAxis ; } ; virtual void SetRepresentationTranslationAxis ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << TranslationAxis  to  << _arg ) ; if ( this -> TranslationAxis != ( _arg < - 1 ? - 1 : ( _arg > 2 ? 2 : _arg ) ) ) { this -> TranslationAxis = ( _arg < - 1 ? - 1 : ( _arg > 2 ? 2 : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetRepresentationMinValueTranslationAxisMinValue ( ) { return - 1 ; } virtual int GetRepresentationMaxValueTranslationAxisMaxValue ( ) { return 2 ; } ; /@} /@{ *
##  Toggles constraint translation axis on/off.
##  void SetXTranslationAxisOn ( ) { this -> TranslationAxis = Axis :: XAxis ; } void SetYTranslationAxisOn ( ) { this -> TranslationAxis = Axis :: YAxis ; } void SetZTranslationAxisOn ( ) { this -> TranslationAxis = Axis :: ZAxis ; } void SetTranslationAxisOff ( ) { this -> TranslationAxis = Axis :: NONE ; } /@} /@{ *
##  Returns true if ContrainedAxis
##  bool IsTranslationConstrained ( ) { return this -> TranslationAxis != Axis :: NONE ; } /@} protected : vtkSphereRepresentation ( ) ; ~ vtkSphereRepresentation ( ) override ;  Manage how the representation appears double LastEventPosition [ 3 ] ; int TranslationAxis ;  the sphere vtkActor * SphereActor ; vtkPolyDataMapper * SphereMapper ; vtkSphereSource * SphereSource ; void HighlightSphere ( int highlight ) ;  The representation of the sphere int Representation ;  Do the picking vtkCellPicker * HandlePicker ; vtkCellPicker * SpherePicker ; double LastPickPosition [ 3 ] ;  Methods to manipulate the sphere widget void Translate ( const double * p1 , const double * p2 ) ; void Scale ( const double * p1 , const double * p2 , int X , int Y ) ; void PlaceHandle ( const double * center , double radius ) ; virtual void SizeHandles ( ) ;  Method to adapt the center cursor bounds
##  so it always have the same pixel size on screen virtual void AdaptCenterCursorBounds ( ) ;  Properties used to control the appearance of selected objects and
##  the manipulator in general. vtkProperty * SphereProperty ; vtkProperty * SelectedSphereProperty ; vtkProperty * HandleProperty ; vtkProperty * SelectedHandleProperty ; void CreateDefaultProperties ( ) ;  Managing the handle vtkActor * HandleActor ; vtkPolyDataMapper * HandleMapper ; vtkSphereSource * HandleSource ; void HighlightHandle ( int ) ; vtkTypeBool HandleVisibility ; double HandleDirection [ 3 ] ; double HandlePosition [ 3 ] ;  Manage the handle label vtkTypeBool HandleText ; vtkTextProperty * HandleTextProperty ; vtkTextMapper * HandleTextMapper ; vtkActor2D * HandleTextActor ;  Manage the radial line segment vtkTypeBool RadialLine ; vtkProperty * RadialLineProperty ; vtkLineSource * RadialLineSource ; vtkPolyDataMapper * RadialLineMapper ; vtkActor * RadialLineActor ;  Managing the center cursor vtkActor * CenterActor ; vtkPolyDataMapper * CenterMapper ; vtkCursor3D * CenterCursorSource ; bool CenterCursor ; private : vtkSphereRepresentation ( const vtkSphereRepresentation & ) = delete ; void operator = ( const vtkSphereRepresentation & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
