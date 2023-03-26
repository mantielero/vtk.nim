## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLineRepresentation.h
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
##  @class   vtkLineRepresentation
##  @brief   a class defining the representation for a vtkLineWidget2
##
##  This class is a concrete representation for the vtkLineWidget2. It
##  represents a straight line with three handles: one at the beginning and
##  ending of the line, and one used to translate the line. Through
##  interaction with the widget, the line representation can be arbitrarily
##  placed in the 3D space.
##
##  To use this representation, you normally specify the position of the two
##  end points (either in world or display coordinates). The PlaceWidget()
##  method is also used to initially position the representation.
##
##  @warning
##  This class, and vtkLineWidget2, are next generation VTK
##  widgets. An earlier version of this functionality was defined in the
##  class vtkLineWidget.
##
##  @sa
##  vtkLineWidget2 vtkLineWidget
##

## !!!Ignored construct:  # vtkLineRepresentation_h [NewLine] # vtkLineRepresentation_h [NewLine] # vtkInteractionWidgetsModule.h  For export macro # vtkWidgetRepresentation.h [NewLine] class vtkActor ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkConeSource"
discard "forward decl of vtkPolyDataMapper"
discard "forward decl of vtkLineSource"
discard "forward decl of vtkProperty"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkPolyDataAlgorithm"
discard "forward decl of vtkPointHandleRepresentation3D"
discard "forward decl of vtkBox"
discard "forward decl of vtkFollower"
discard "forward decl of vtkVectorText"
discard "forward decl of vtkPolyDataMapper"
discard "forward decl of vtkCellPicker"
## !!!Ignored construct:  class VTKINTERACTIONWIDGETS_EXPORT vtkLineRepresentation : public vtkWidgetRepresentation { public : *
##  Instantiate the class.
##  static vtkLineRepresentation * New ( ) ; /@{ *
##  Standard methods for the class.
##  protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkWidgetRepresentation Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkWidgetRepresentation :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkLineRepresentation :: IsTypeOf ( type ) ; } static vtkLineRepresentation * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkLineRepresentation * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkLineRepresentation * NewInstance ( ) const { return vtkLineRepresentation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWidgetRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLineRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLineRepresentation :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Methods to Set/Get the coordinates of the two points defining
##  this representation. Note that methods are available for both
##  display and world coordinates.
##  void GetPoint1WorldPosition ( double pos [ 3 ] ) ; double * GetPoint1WorldPosition ( ) VTK_SIZEHINT ( 3 ) ; void GetPoint1DisplayPosition ( double pos [ 3 ] ) ; double * GetPoint1DisplayPosition ( ) VTK_SIZEHINT ( 3 ) ; void SetPoint1WorldPosition ( double pos [ 3 ] ) ; void SetPoint1DisplayPosition ( double pos [ 3 ] ) ; void GetPoint2DisplayPosition ( double pos [ 3 ] ) ; double * GetPoint2DisplayPosition ( ) VTK_SIZEHINT ( 3 ) ; void GetPoint2WorldPosition ( double pos [ 3 ] ) ; double * GetPoint2WorldPosition ( ) VTK_SIZEHINT ( 3 ) ; void SetPoint2WorldPosition ( double pos [ 3 ] ) ; void SetPoint2DisplayPosition ( double pos [ 3 ] ) ; /@} /@{ *
##  This method is used to specify the type of handle representation to
##  use for the three internal vtkHandleWidgets within vtkLineWidget2.
##  To use this method, create a dummy vtkHandleWidget (or subclass),
##  and then invoke this method with this dummy. Then the
##  vtkLineRepresentation uses this dummy to clone three vtkHandleWidgets
##  of the same type. Make sure you set the handle representation before
##  the widget is enabled. (The method InstantiateHandleRepresentation()
##  is invoked by the vtkLineWidget2.)
##  void SetHandleRepresentation ( vtkPointHandleRepresentation3D * handle ) ; void InstantiateHandleRepresentation ( ) ; /@} /@{ *
##  Get the three handle representations used for the vtkLineWidget2.
##  virtual vtkPointHandleRepresentation3D * GetnamePoint1Representation ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Point1Representation  address  << static_cast < vtkPointHandleRepresentation3D * > ( this -> Point1Representation ) ) ; return this -> Point1Representation ; } ; virtual vtkPointHandleRepresentation3D * GetnamePoint1RepresentationPoint2Representation ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Point2Representation  address  << static_cast < vtkPointHandleRepresentation3D * > ( this -> Point2Representation ) ) ; return this -> Point2Representation ; } ; virtual vtkPointHandleRepresentation3D * GetnamePoint1RepresentationPoint2RepresentationLineHandleRepresentation ( ) { vtkDebugWithObjectMacro ( this , <<  returning  LineHandleRepresentation  address  << static_cast < vtkPointHandleRepresentation3D * > ( this -> LineHandleRepresentation ) ) ; return this -> LineHandleRepresentation ; } ; /@} /@{ *
##  Get the end-point (sphere) properties. The properties of the end-points
##  when selected and unselected can be manipulated.
##  virtual vtkProperty * GetnamePoint1RepresentationPoint2RepresentationLineHandleRepresentationEndPointProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  EndPointProperty  address  << static_cast < vtkProperty * > ( this -> EndPointProperty ) ) ; return this -> EndPointProperty ; } ; virtual vtkProperty * GetnamePoint1RepresentationPoint2RepresentationLineHandleRepresentationEndPointPropertySelectedEndPointProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  SelectedEndPointProperty  address  << static_cast < vtkProperty * > ( this -> SelectedEndPointProperty ) ) ; return this -> SelectedEndPointProperty ; } ; /@} /@{ *
##  Get the end-point (sphere) properties. The properties of the end-points
##  when selected and unselected can be manipulated.
##  virtual vtkProperty * GetnamePoint1RepresentationPoint2RepresentationLineHandleRepresentationEndPointPropertySelectedEndPointPropertyEndPoint2Property ( ) { vtkDebugWithObjectMacro ( this , <<  returning  EndPoint2Property  address  << static_cast < vtkProperty * > ( this -> EndPoint2Property ) ) ; return this -> EndPoint2Property ; } ; virtual vtkProperty * GetnamePoint1RepresentationPoint2RepresentationLineHandleRepresentationEndPointPropertySelectedEndPointPropertyEndPoint2PropertySelectedEndPoint2Property ( ) { vtkDebugWithObjectMacro ( this , <<  returning  SelectedEndPoint2Property  address  << static_cast < vtkProperty * > ( this -> SelectedEndPoint2Property ) ) ; return this -> SelectedEndPoint2Property ; } ; /@} /@{ *
##  Get the line properties. The properties of the line when selected
##  and unselected can be manipulated.
##  virtual vtkProperty * GetnamePoint1RepresentationPoint2RepresentationLineHandleRepresentationEndPointPropertySelectedEndPointPropertyEndPoint2PropertySelectedEndPoint2PropertyLineProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  LineProperty  address  << static_cast < vtkProperty * > ( this -> LineProperty ) ) ; return this -> LineProperty ; } ; virtual vtkProperty * GetnamePoint1RepresentationPoint2RepresentationLineHandleRepresentationEndPointPropertySelectedEndPointPropertyEndPoint2PropertySelectedEndPoint2PropertyLinePropertySelectedLineProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  SelectedLineProperty  address  << static_cast < vtkProperty * > ( this -> SelectedLineProperty ) ) ; return this -> SelectedLineProperty ; } ; /@} /@{ *
##  The tolerance representing the distance to the widget (in pixels) in
##  which the cursor is considered near enough to the line or end point
##  to be active.
##  virtual void SetTolerance ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Tolerance  to  << _arg ) ; if ( this -> Tolerance != ( _arg < 1 ? 1 : ( _arg > 100 ? 100 : _arg ) ) ) { this -> Tolerance = ( _arg < 1 ? 1 : ( _arg > 100 ? 100 : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetToleranceMinValue ( ) { return 1 ; } virtual int GetToleranceMaxValue ( ) { return 100 ; } ; virtual int GetTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tolerance  of  << this -> Tolerance ) ; return this -> Tolerance ; } ; /@} /@{ *
##  Set/Get the resolution (number of subdivisions) of the line. A line with
##  resolution greater than one is useful when points along the line are
##  desired; e.g., generating a rake of streamlines.
##  void SetResolution ( int res ) ; int GetResolution ( ) ; /@} *
##  Retrieve the polydata (including points) that defines the line.  The
##  polydata consists of n+1 points, where n is the resolution of the
##  line. These point values are guaranteed to be up-to-date whenever any
##  one of the three handles are moved. To use this method, the user
##  provides the vtkPolyData as an input argument, and the points and
##  polyline are copied into it.
##  void GetPolyData ( vtkPolyData * pd ) ; /@{ *
##  These are methods that satisfy vtkWidgetRepresentation's API.
##  void PlaceWidget ( double bounds [ 6 ] ) override ; void BuildRepresentation ( ) override ; int ComputeInteractionState ( int X , int Y , int modify = 0 ) override ; void StartWidgetInteraction ( double e [ 2 ] ) override ; void WidgetInteraction ( double e [ 2 ] ) override ; double * GetBounds ( ) VTK_SIZEHINT ( 6 ) override ; /@} /@{ *
##  Methods supporting the rendering process.
##  void GetActors ( vtkPropCollection * pc ) override ; void ReleaseGraphicsResources ( vtkWindow * ) override ; int RenderOpaqueGeometry ( vtkViewport * ) override ; int RenderTranslucentPolygonalGeometry ( vtkViewport * ) override ; vtkTypeBool HasTranslucentPolygonalGeometry ( ) override ; /@}  Manage the state of the widget enum { Outside = 0 , OnP1 , OnP2 , TranslatingP1 , TranslatingP2 , OnLine , Scaling } ; /@{ *
##  The interaction state may be set from a widget (e.g., vtkLineWidget2) or
##  other object. This controls how the interaction with the widget
##  proceeds. Normally this method is used as part of a handshaking
##  process with the widget: First ComputeInteractionState() is invoked that
##  returns a state based on geometric considerations (i.e., cursor near a
##  widget feature), then based on events, the widget may modify this
##  further.
##  virtual void SetToleranceInteractionState ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << InteractionState  to  << _arg ) ; if ( this -> InteractionState != ( _arg < Outside ? Outside : ( _arg > Scaling ? Scaling : _arg ) ) ) { this -> InteractionState = ( _arg < Outside ? Outside : ( _arg > Scaling ? Scaling : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetToleranceMinValueInteractionStateMinValue ( ) { return Outside ; } virtual int GetToleranceMaxValueInteractionStateMaxValue ( ) { return Scaling ; } ; /@} /@{ *
##  Sets the visual appearance of the representation based on the
##  state it is in. This state is usually the same as InteractionState.
##  virtual void SetRepresentationState ( int ) ; virtual int GetToleranceRepresentationState ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RepresentationState  of  << this -> RepresentationState ) ; return this -> RepresentationState ; } ; /@} /@{ *
##  Sets the representation to be a directional line with point 1 represented
##  as a cone.
##  void SetDirectionalLine ( bool val ) ; virtual bool GetToleranceRepresentationStateDirectionalLine ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DirectionalLine  of  << this -> DirectionalLine ) ; return this -> DirectionalLine ; } ; virtual void DirectionalLineOn ( ) { this -> SetDirectionalLine ( static_cast < bool > ( 1 ) ) ; } virtual void DirectionalLineOff ( ) { this -> SetDirectionalLine ( static_cast < bool > ( 0 ) ) ; } ; /@} *
##  Overload the superclasses' GetMTime() because internal classes
##  are used to keep the state of the representation.
##  vtkMTimeType GetMTime ( ) override ; *
##  Overridden to set the rendererer on the internal representations.
##  void SetRenderer ( vtkRenderer * ren ) override ; /@{ *
##  Show the distance between the points.
##  virtual void SetDistanceAnnotationVisibility ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  DistanceAnnotationVisibility  to  << _arg ) ; if ( this -> DistanceAnnotationVisibility != _arg ) { this -> DistanceAnnotationVisibility = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetToleranceRepresentationStateDirectionalLineDistanceAnnotationVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DistanceAnnotationVisibility  of  << this -> DistanceAnnotationVisibility ) ; return this -> DistanceAnnotationVisibility ; } ; virtual void DistanceAnnotationVisibilityOn ( ) { this -> SetDirectionalLineDistanceAnnotationVisibility ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void DistanceAnnotationVisibilityOff ( ) { this -> SetDirectionalLineDistanceAnnotationVisibility ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify the format to use for labelling the line. Note that an empty
##  string results in no label, or a format string without a "%" character
##  will not print the angle value.
##  virtual void SetDistanceAnnotationFormat ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << DistanceAnnotationFormat  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> DistanceAnnotationFormat == nullptr && _arg == nullptr ) { return ; } if ( this -> DistanceAnnotationFormat && _arg && ( ! strcmp ( this -> DistanceAnnotationFormat , _arg ) ) ) { return ; } delete [ ] this -> DistanceAnnotationFormat ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> DistanceAnnotationFormat = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> DistanceAnnotationFormat = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetDistanceAnnotationFormat ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << DistanceAnnotationFormat  of  << ( this -> DistanceAnnotationFormat ? this -> DistanceAnnotationFormat : (null) ) ) ; return this -> DistanceAnnotationFormat ; } ; /@} /@{ *
##  Scale text (font size along each dimension).
##  void SetDistanceAnnotationScale ( double x , double y , double z ) { double scale [ 3 ] ; scale [ 0 ] = x ; scale [ 1 ] = y ; scale [ 2 ] = z ; this -> SetDistanceAnnotationScale ( scale ) ; } virtual void SetDistanceAnnotationScale ( double scale [ 3 ] ) ; virtual double * GetDistanceAnnotationScale ( ) VTK_SIZEHINT ( 3 ) ; /@} *
##  Get the distance between the points.
##  double GetDistance ( ) ; *
##  Convenience method to set the line color.
##  Ideally one should use GetLineProperty()->SetColor().
##  void SetLineColor ( double r , double g , double b ) ; *
##  Get the distance annotation property
##  virtual vtkProperty * GetDistanceAnnotationProperty ( ) ; /@{ *
##  Get the text actor
##  virtual vtkFollower * GetnamePoint1RepresentationPoint2RepresentationLineHandleRepresentationEndPointPropertySelectedEndPointPropertyEndPoint2PropertySelectedEndPoint2PropertyLinePropertySelectedLinePropertyTextActor ( ) { vtkDebugWithObjectMacro ( this , <<  returning  TextActor  address  << static_cast < vtkFollower * > ( this -> TextActor ) ) ; return this -> TextActor ; } ; /@} enum { RestrictNone = 0 , RestrictToX , RestrictToY , RestrictToZ } ; protected : vtkLineRepresentation ( ) ; ~ vtkLineRepresentation ( ) override ;  The handle and the rep used to close the handles vtkPointHandleRepresentation3D * HandleRepresentation ; vtkPointHandleRepresentation3D * Point1Representation ; vtkPointHandleRepresentation3D * Point2Representation ; vtkPointHandleRepresentation3D * LineHandleRepresentation ;  Manage how the representation appears int RepresentationState ; bool DirectionalLine ;  the line vtkActor * LineActor ; vtkPolyDataMapper * LineMapper ; vtkLineSource * LineSource ;  glyphs representing hot spots (e.g., handles) vtkActor * * Handle ; vtkPolyDataMapper * * HandleMapper ; vtkPolyDataAlgorithm * * HandleGeometry ;  Properties used to control the appearance of selected objects and
##  the manipulator in general. vtkProperty * EndPointProperty ; vtkProperty * SelectedEndPointProperty ; vtkProperty * EndPoint2Property ; vtkProperty * SelectedEndPoint2Property ; vtkProperty * LineProperty ; vtkProperty * SelectedLineProperty ; void CreateDefaultProperties ( ) ;  Selection tolerance for the handles and the line int Tolerance ;  Helper members int ClampToBounds ; void ClampPosition ( double x [ 3 ] ) ; void HighlightPoint ( int ptId , int highlight ) ; void HighlightLine ( int highlight ) ; int InBounds ( double x [ 3 ] ) ; void SizeHandles ( ) ;  Ivars used during widget interaction to hold initial positions double StartP1 [ 3 ] ; double StartP2 [ 3 ] ; double StartLineHandle [ 3 ] ; double Length ; double LastEventPosition [ 3 ] ;  Support GetBounds() method vtkBox * BoundingBox ;  Need to keep track if we have successfully initialized the display position.
##  The widget tends to do stuff in world coordinates, put if the renderer has
##  not been assigned, then certain operations do not properly update the display
##  position. int InitializedDisplayPosition ;  Format for the label vtkTypeBool DistanceAnnotationVisibility ; char * DistanceAnnotationFormat ; vtkFollower * TextActor ; vtkPolyDataMapper * TextMapper ; vtkVectorText * TextInput ; double Distance ; bool AnnotationTextScaleInitialized ; vtkCellPicker * LinePicker ; private : vtkLineRepresentation ( const vtkLineRepresentation & ) = delete ; void operator = ( const vtkLineRepresentation & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
