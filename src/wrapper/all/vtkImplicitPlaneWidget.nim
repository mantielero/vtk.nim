## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImplicitPlaneWidget.h
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
##  @class   vtkImplicitPlaneWidget
##  @brief   3D widget for manipulating an infinite plane
##
##  This 3D widget defines an infinite plane that can be interactively placed
##  in a scene. The widget is represented by a plane with a normal vector; the
##  plane is contained by a bounding box, and where the plane intersects the
##  bounding box the edges are shown (possibly tubed). The normal can be
##  selected and moved to rotate the plane; the plane itself can be selected
##  and translated in various directions. As the plane is moved, the implicit
##  plane function and polygon (representing the plane cut against the bounding
##  box) is updated.
##
##  To use this object, just invoke SetInteractor() with the argument of the
##  method a vtkRenderWindowInteractor.  You may also wish to invoke
##  "PlaceWidget()" to initially position the widget. If the "i" key (for
##  "interactor") is pressed, the vtkImplicitPlaneWidget will appear. (See
##  superclass documentation for information about changing this behavior.)
##  If you select the normal vector, the plane can be arbitrarily rotated. The
##  plane can be translated along the normal by selecting the plane and moving
##  it. The plane (the plane origin) can also be arbitrary moved by selecting
##  the plane with the middle mouse button. The right mouse button can be used
##  to uniformly scale the bounding box (moving "up" the box scales larger;
##  moving "down" the box scales smaller). Events that occur outside of the
##  widget (i.e., no part of the widget is picked) are propagated to any other
##  registered obsevers (such as the interaction style).  Turn off the widget
##  by pressing the "i" key again (or invoke the Off() method).
##
##  The vtkImplicitPlaneWidget has several methods that can be used in
##  conjunction with other VTK objects.  The GetPolyData() method can be used
##  to get a polygonal representation (the single polygon clipped by the
##  bounding box).  Typical usage of the widget is to make use of the
##  StartInteractionEvent, InteractionEvent, and EndInteractionEvent
##  events. The InteractionEvent is called on mouse motion; the other two
##  events are called on button down and button up (either left or right
##  button). (Note: there is also a PlaceWidgetEvent that is invoked when
##  the widget is placed with PlaceWidget().)
##
##  Some additional features of this class include the ability to control the
##  properties of the widget. You do this by setting property values on the
##  normal vector (selected and unselected properties); the plane (selected
##  and unselected properties); the outline (selected and unselected
##  properties); and the edges. The edges may also be tubed or not.
##
##  @sa
##  vtk3DWidget vtkBoxWidget vtkPlaneWidget vtkLineWidget vtkPointWidget
##  vtkSphereWidget vtkImagePlaneWidget
##

## !!!Ignored construct:  # vtkImplicitPlaneWidget_h [NewLine] # vtkImplicitPlaneWidget_h [NewLine] # vtkInteractionWidgetsModule.h  For export macro # vtkPolyDataSourceWidget.h [NewLine] class vtkActor ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkPolyDataMapper"
discard "forward decl of vtkCellPicker"
discard "forward decl of vtkConeSource"
discard "forward decl of vtkLineSource"
discard "forward decl of vtkSphereSource"
discard "forward decl of vtkTubeFilter"
discard "forward decl of vtkPlane"
discard "forward decl of vtkCutter"
discard "forward decl of vtkProperty"
discard "forward decl of vtkImageData"
discard "forward decl of vtkOutlineFilter"
discard "forward decl of vtkFeatureEdges"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkTransform"
## !!!Ignored construct:  class VTKINTERACTIONWIDGETS_EXPORT vtkImplicitPlaneWidget : public vtkPolyDataSourceWidget { public : *
##  Instantiate the object.
##  static vtkImplicitPlaneWidget * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataSourceWidget Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataSourceWidget :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImplicitPlaneWidget :: IsTypeOf ( type ) ; } static vtkImplicitPlaneWidget * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImplicitPlaneWidget * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImplicitPlaneWidget * NewInstance ( ) const { return vtkImplicitPlaneWidget :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataSourceWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImplicitPlaneWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImplicitPlaneWidget :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Methods that satisfy the superclass' API.
##  void SetEnabled ( int ) override ; void PlaceWidget ( double bounds [ 6 ] ) override ; void PlaceWidget ( ) override { this -> Superclass :: PlaceWidget ( ) ; } void PlaceWidget ( double xmin , double xmax , double ymin , double ymax , double zmin , double zmax ) override { this -> Superclass :: PlaceWidget ( xmin , xmax , ymin , ymax , zmin , zmax ) ; } /@} /@{ *
##  Get the origin of the plane.
##  virtual void SetOrigin ( double x , double y , double z ) ; virtual void SetOrigin ( double x [ 3 ] ) ; double * GetOrigin ( ) VTK_SIZEHINT ( 3 ) ; void GetOrigin ( double xyz [ 3 ] ) ; /@} /@{ *
##  Get the normal to the plane.
##  void SetNormal ( double x , double y , double z ) ; void SetNormal ( double n [ 3 ] ) ; double * GetNormal ( ) VTK_SIZEHINT ( 3 ) ; void GetNormal ( double xyz [ 3 ] ) ; /@} /@{ *
##  Force the plane widget to be aligned with one of the x-y-z axes.
##  If one axis is set on, the other two will be set off.
##  Remember that when the state changes, a ModifiedEvent is invoked.
##  This can be used to snap the plane to the axes if it is originally
##  not aligned.
##  void SetNormalToXAxis ( vtkTypeBool ) ; virtual vtkTypeBool GetNormalToXAxis ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NormalToXAxis  of  << this -> NormalToXAxis ) ; return this -> NormalToXAxis ; } ; virtual void NormalToXAxisOn ( ) { this -> SetNormalToXAxis ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void NormalToXAxisOff ( ) { this -> SetNormalToXAxis ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; void SetNormalToYAxis ( vtkTypeBool ) ; virtual vtkTypeBool GetNormalToXAxisNormalToYAxis ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NormalToYAxis  of  << this -> NormalToYAxis ) ; return this -> NormalToYAxis ; } ; virtual void NormalToYAxisOn ( ) { this -> SetNormalToXAxisNormalToYAxis ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void NormalToYAxisOff ( ) { this -> SetNormalToXAxisNormalToYAxis ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; void SetNormalToZAxis ( vtkTypeBool ) ; virtual vtkTypeBool GetNormalToXAxisNormalToYAxisNormalToZAxis ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NormalToZAxis  of  << this -> NormalToZAxis ) ; return this -> NormalToZAxis ; } ; virtual void NormalToZAxisOn ( ) { this -> SetNormalToXAxisNormalToYAxisNormalToZAxis ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void NormalToZAxisOff ( ) { this -> SetNormalToXAxisNormalToYAxisNormalToZAxis ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off tubing of the wire outline of the plane. The tube thickens
##  the line by wrapping with a vtkTubeFilter.
##  virtual void SetTubing ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Tubing  to  << _arg ) ; if ( this -> Tubing != _arg ) { this -> Tubing = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetNormalToXAxisNormalToYAxisNormalToZAxisTubing ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tubing  of  << this -> Tubing ) ; return this -> Tubing ; } ; virtual void TubingOn ( ) { this -> SetNormalToXAxisNormalToYAxisNormalToZAxisTubing ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void TubingOff ( ) { this -> SetNormalToXAxisNormalToYAxisNormalToZAxisTubing ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Enable/disable the drawing of the plane. In some cases the plane
##  interferes with the object that it is operating on (i.e., the
##  plane interferes with the cut surface it produces producing
##  z-buffer artifacts.)
##  void SetDrawPlane ( vtkTypeBool plane ) ; virtual vtkTypeBool GetNormalToXAxisNormalToYAxisNormalToZAxisTubingDrawPlane ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DrawPlane  of  << this -> DrawPlane ) ; return this -> DrawPlane ; } ; virtual void DrawPlaneOn ( ) { this -> SetNormalToXAxisNormalToYAxisNormalToZAxisTubingDrawPlane ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void DrawPlaneOff ( ) { this -> SetNormalToXAxisNormalToYAxisNormalToZAxisTubingDrawPlane ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off the ability to translate the bounding box by grabbing it
##  with the left mouse button.
##  virtual void SetTubingOutlineTranslation ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutlineTranslation  to  << _arg ) ; if ( this -> OutlineTranslation != _arg ) { this -> OutlineTranslation = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetNormalToXAxisNormalToYAxisNormalToZAxisTubingDrawPlaneOutlineTranslation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutlineTranslation  of  << this -> OutlineTranslation ) ; return this -> OutlineTranslation ; } ; virtual void OutlineTranslationOn ( ) { this -> SetNormalToXAxisNormalToYAxisNormalToZAxisTubingDrawPlaneOutlineTranslation ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void OutlineTranslationOff ( ) { this -> SetNormalToXAxisNormalToYAxisNormalToZAxisTubingDrawPlaneOutlineTranslation ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off the ability to move the widget outside of the input's bound
##  virtual void SetTubingOutlineTranslationOutsideBounds ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutsideBounds  to  << _arg ) ; if ( this -> OutsideBounds != _arg ) { this -> OutsideBounds = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetNormalToXAxisNormalToYAxisNormalToZAxisTubingDrawPlaneOutlineTranslationOutsideBounds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutsideBounds  of  << this -> OutsideBounds ) ; return this -> OutsideBounds ; } ; virtual void OutsideBoundsOn ( ) { this -> SetNormalToXAxisNormalToYAxisNormalToZAxisTubingDrawPlaneOutlineTranslationOutsideBounds ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void OutsideBoundsOff ( ) { this -> SetNormalToXAxisNormalToYAxisNormalToZAxisTubingDrawPlaneOutlineTranslationOutsideBounds ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off the ability to scale with the mouse
##  virtual void SetTubingOutlineTranslationOutsideBoundsScaleEnabled ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ScaleEnabled  to  << _arg ) ; if ( this -> ScaleEnabled != _arg ) { this -> ScaleEnabled = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetNormalToXAxisNormalToYAxisNormalToZAxisTubingDrawPlaneOutlineTranslationOutsideBoundsScaleEnabled ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScaleEnabled  of  << this -> ScaleEnabled ) ; return this -> ScaleEnabled ; } ; virtual void ScaleEnabledOn ( ) { this -> SetNormalToXAxisNormalToYAxisNormalToZAxisTubingDrawPlaneOutlineTranslationOutsideBoundsScaleEnabled ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ScaleEnabledOff ( ) { this -> SetNormalToXAxisNormalToYAxisNormalToZAxisTubingDrawPlaneOutlineTranslationOutsideBoundsScaleEnabled ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off the ability to translate the origin (sphere)
##  with the left mouse button.
##  virtual void SetTubingOutlineTranslationOutsideBoundsScaleEnabledOriginTranslation ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OriginTranslation  to  << _arg ) ; if ( this -> OriginTranslation != _arg ) { this -> OriginTranslation = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetNormalToXAxisNormalToYAxisNormalToZAxisTubingDrawPlaneOutlineTranslationOutsideBoundsScaleEnabledOriginTranslation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OriginTranslation  of  << this -> OriginTranslation ) ; return this -> OriginTranslation ; } ; virtual void OriginTranslationOn ( ) { this -> SetNormalToXAxisNormalToYAxisNormalToZAxisTubingDrawPlaneOutlineTranslationOutsideBoundsScaleEnabledOriginTranslation ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void OriginTranslationOff ( ) { this -> SetNormalToXAxisNormalToYAxisNormalToZAxisTubingDrawPlaneOutlineTranslationOutsideBoundsScaleEnabledOriginTranslation ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  By default the arrow is 30% of the diagonal length. DiagonalRatio control
##  this ratio in the interval [0-2]
##  virtual void SetDiagonalRatio ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << DiagonalRatio  to  << _arg ) ; if ( this -> DiagonalRatio != ( _arg < 0 ? 0 : ( _arg > 2 ? 2 : _arg ) ) ) { this -> DiagonalRatio = ( _arg < 0 ? 0 : ( _arg > 2 ? 2 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetDiagonalRatioMinValue ( ) { return 0 ; } virtual double GetDiagonalRatioMaxValue ( ) { return 2 ; } ; virtual double GetNormalToXAxisNormalToYAxisNormalToZAxisTubingDrawPlaneOutlineTranslationOutsideBoundsScaleEnabledOriginTranslationDiagonalRatio ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DiagonalRatio  of  << this -> DiagonalRatio ) ; return this -> DiagonalRatio ; } ; /@} *
##  Grab the polydata that defines the plane. The polydata contains a single
##  polygon that is clipped by the bounding box.
##  void GetPolyData ( vtkPolyData * pd ) ; *
##  Satisfies superclass API.  This returns a pointer to the underlying
##  PolyData (which represents the plane).
##  vtkPolyDataAlgorithm * GetPolyDataAlgorithm ( ) override ; *
##  Get the implicit function for the plane. The user must provide the
##  instance of the class vtkPlane. Note that vtkPlane is a subclass of
##  vtkImplicitFunction, meaning that it can be used by a variety of filters
##  to perform clipping, cutting, and selection of data.
##  void GetPlane ( vtkPlane * plane ) ; *
##  Satisfies the superclass API.  This will change the state of the widget
##  to match changes that have been made to the underlying PolyDataSource
##  void UpdatePlacement ( ) override ; *
##  Control widget appearance
##  void SizeHandles ( ) override ; /@{ *
##  Get the properties on the normal (line and cone).
##  virtual vtkProperty * GetnameNormalProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  NormalProperty  address  << static_cast < vtkProperty * > ( this -> NormalProperty ) ) ; return this -> NormalProperty ; } ; virtual vtkProperty * GetnameNormalPropertySelectedNormalProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  SelectedNormalProperty  address  << static_cast < vtkProperty * > ( this -> SelectedNormalProperty ) ) ; return this -> SelectedNormalProperty ; } ; /@} /@{ *
##  Get the plane properties. The properties of the plane when selected
##  and unselected can be manipulated.
##  virtual vtkProperty * GetnameNormalPropertySelectedNormalPropertyPlaneProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  PlaneProperty  address  << static_cast < vtkProperty * > ( this -> PlaneProperty ) ) ; return this -> PlaneProperty ; } ; virtual vtkProperty * GetnameNormalPropertySelectedNormalPropertyPlanePropertySelectedPlaneProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  SelectedPlaneProperty  address  << static_cast < vtkProperty * > ( this -> SelectedPlaneProperty ) ) ; return this -> SelectedPlaneProperty ; } ; /@} /@{ *
##  Get the property of the outline.
##  virtual vtkProperty * GetnameNormalPropertySelectedNormalPropertyPlanePropertySelectedPlanePropertyOutlineProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  OutlineProperty  address  << static_cast < vtkProperty * > ( this -> OutlineProperty ) ) ; return this -> OutlineProperty ; } ; virtual vtkProperty * GetnameNormalPropertySelectedNormalPropertyPlanePropertySelectedPlanePropertyOutlinePropertySelectedOutlineProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  SelectedOutlineProperty  address  << static_cast < vtkProperty * > ( this -> SelectedOutlineProperty ) ) ; return this -> SelectedOutlineProperty ; } ; /@} /@{ *
##  Get the property of the intersection edges. (This property also
##  applies to the edges when tubed.)
##  virtual vtkProperty * GetnameNormalPropertySelectedNormalPropertyPlanePropertySelectedPlanePropertyOutlinePropertySelectedOutlinePropertyEdgesProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  EdgesProperty  address  << static_cast < vtkProperty * > ( this -> EdgesProperty ) ) ; return this -> EdgesProperty ; } ; /@} protected : vtkImplicitPlaneWidget ( ) ; ~ vtkImplicitPlaneWidget ( ) override ;  Manage the state of the widget int State ; enum WidgetState { Start = 0 , MovingPlane , MovingOutline , MovingOrigin , Scaling , Pushing , Rotating , Outside } ;  handles the events static void ProcessEvents ( vtkObject * object , unsigned long event , void * clientdata , void * calldata ) ;  ProcessEvents() dispatches to these methods. void OnLeftButtonDown ( ) ; void OnLeftButtonUp ( ) ; void OnMiddleButtonDown ( ) ; void OnMiddleButtonUp ( ) ; void OnRightButtonDown ( ) ; void OnRightButtonUp ( ) ; void OnMouseMove ( ) ;  Controlling ivars vtkTypeBool NormalToXAxis ; vtkTypeBool NormalToYAxis ; vtkTypeBool NormalToZAxis ; void UpdateRepresentation ( ) ;  The actual plane which is being manipulated vtkPlane * Plane ;  The bounding box is represented by a single voxel image data vtkImageData * Box ; vtkOutlineFilter * Outline ; vtkPolyDataMapper * OutlineMapper ; vtkActor * OutlineActor ; void HighlightOutline ( int highlight ) ; vtkTypeBool OutlineTranslation ;  whether the outline can be moved vtkTypeBool ScaleEnabled ;  whether the widget can be scaled vtkTypeBool OutsideBounds ;  whether the widget can be moved outside input's bounds  The cut plane is produced with a vtkCutter vtkCutter * Cutter ; vtkPolyDataMapper * CutMapper ; vtkActor * CutActor ; vtkTypeBool DrawPlane ; virtual void HighlightPlane ( int highlight ) ;  Optional tubes are represented by extracting boundary edges and tubing vtkFeatureEdges * Edges ; vtkTubeFilter * EdgesTuber ; vtkPolyDataMapper * EdgesMapper ; vtkActor * EdgesActor ; vtkTypeBool Tubing ;  control whether tubing is on  Control final length of the arrow: double DiagonalRatio ;  The + normal cone vtkConeSource * ConeSource ; vtkPolyDataMapper * ConeMapper ; vtkActor * ConeActor ; void HighlightNormal ( int highlight ) ;  The + normal line vtkLineSource * LineSource ; vtkPolyDataMapper * LineMapper ; vtkActor * LineActor ;  The - normal cone vtkConeSource * ConeSource2 ; vtkPolyDataMapper * ConeMapper2 ; vtkActor * ConeActor2 ;  The - normal line vtkLineSource * LineSource2 ; vtkPolyDataMapper * LineMapper2 ; vtkActor * LineActor2 ;  The origin positioning handle vtkSphereSource * Sphere ; vtkPolyDataMapper * SphereMapper ; vtkActor * SphereActor ; vtkTypeBool OriginTranslation ;  whether the origin (sphere) can be moved  Do the picking vtkCellPicker * Picker ;  Register internal Pickers within PickingManager void RegisterPickers ( ) override ;  Transform the normal (used for rotation) vtkTransform * Transform ;  Methods to manipulate the plane void ConstrainOrigin ( double x [ 3 ] ) ; void Rotate ( int X , int Y , double * p1 , double * p2 , double * vpn ) ; void TranslatePlane ( double * p1 , double * p2 ) ; void TranslateOutline ( double * p1 , double * p2 ) ; void TranslateOrigin ( double * p1 , double * p2 ) ; void Push ( double * p1 , double * p2 ) ; void Scale ( double * p1 , double * p2 , int X , int Y ) ;  Properties used to control the appearance of selected objects and
##  the manipulator in general. vtkProperty * NormalProperty ; vtkProperty * SelectedNormalProperty ; vtkProperty * PlaneProperty ; vtkProperty * SelectedPlaneProperty ; vtkProperty * OutlineProperty ; vtkProperty * SelectedOutlineProperty ; vtkProperty * EdgesProperty ; void CreateDefaultProperties ( ) ; void GeneratePlane ( ) ; private : vtkImplicitPlaneWidget ( const vtkImplicitPlaneWidget & ) = delete ; void operator = ( const vtkImplicitPlaneWidget & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
