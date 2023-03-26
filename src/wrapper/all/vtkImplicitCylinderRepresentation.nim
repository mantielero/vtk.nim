## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImplicitCylinderRepresentation.h
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
##  @class   vtkImplicitCylinderRepresentation
##  @brief   defining the representation for a vtkImplicitCylinderWidget
##
##  This class is a concrete representation for the
##  vtkImplicitCylinderWidget. It represents an infinite cylinder
##  defined by a radius, a center, and an axis. The cylinder is placed
##  within its associated bounding box and the intersection of the
##  cylinder with the bounding box is shown to visually indicate the
##  orientation and position of the representation. This cylinder
##  representation can be manipulated by using the
##  vtkImplicitCylinderWidget to adjust the cylinder radius, axis,
##  and/or center point. (Note that the bounding box is defined during
##  invocation of the superclass' PlaceWidget() method.)
##
##  To use this representation, you normally specify a radius, center,
##  and axis. Optionally you can specify a minimum and maximum radius,
##  and a resolution for the cylinder. Finally, place the widget and
##  its representation in the scene using PlaceWidget().
##
##  @sa
##  vtkImplicitCylinderWidget vtkImplicitPlaneWidget vtkImplicitPlaneWidget
##

## !!!Ignored construct:  # vtkImplicitCylinderRepresentation_h [NewLine] # vtkImplicitCylinderRepresentation_h [NewLine] # vtkDeprecation.h  For VTK_DEPRECATED_IN_9_2_0 # vtkInteractionWidgetsModule.h  For export macro # vtkWidgetRepresentation.h [NewLine] class vtkActor ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkPolyDataMapper"
discard "forward decl of vtkCellPicker"
discard "forward decl of vtkConeSource"
discard "forward decl of vtkLineSource"
discard "forward decl of vtkSphereSource"
discard "forward decl of vtkTubeFilter"
discard "forward decl of vtkCylinder"
discard "forward decl of vtkProperty"
discard "forward decl of vtkImageData"
discard "forward decl of vtkOutlineFilter"
discard "forward decl of vtkFeatureEdges"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkPolyDataAlgorithm"
discard "forward decl of vtkTransform"
discard "forward decl of vtkBox"
discard "forward decl of vtkLookupTable"
const
  VTK_MAX_CYL_RESOLUTION* = 2048

## !!!Ignored construct:  class VTKINTERACTIONWIDGETS_EXPORT vtkImplicitCylinderRepresentation : public vtkWidgetRepresentation { public : *
##  Instantiate the class.
##  static vtkImplicitCylinderRepresentation * New ( ) ; /@{ *
##  Standard methods for the class.
##  protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkWidgetRepresentation Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkWidgetRepresentation :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImplicitCylinderRepresentation :: IsTypeOf ( type ) ; } static vtkImplicitCylinderRepresentation * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImplicitCylinderRepresentation * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImplicitCylinderRepresentation * NewInstance ( ) const { return vtkImplicitCylinderRepresentation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWidgetRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImplicitCylinderRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImplicitCylinderRepresentation :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Get the center of the cylinder. The center is located along the
##  cylinder axis.
##  void SetCenter ( double x , double y , double z ) ; void SetCenter ( double x [ 3 ] ) ; double * GetCenter ( ) VTK_SIZEHINT ( 3 ) ; void GetCenter ( double xyz [ 3 ] ) ; /@} /@{ *
##  Set/Get the axis of rotation for the cylinder. If the axis is not
##  specified as a unit vector, it will be normalized.
##  void SetAxis ( double x , double y , double z ) ; void SetAxis ( double a [ 3 ] ) ; double * GetAxis ( ) VTK_SIZEHINT ( 3 ) ; void GetAxis ( double a [ 3 ] ) ; /@} /@{ *
##  Set/Get the radius of the cylinder. Note that if the radius is
##  too big the cylinder will be outside of the bounding box.
##  void SetRadius ( double r ) ; double GetRadius ( ) ; /@} /@{ *
##  Set/Get the minimum and maximum radius of the cylinder. This
##  helps prevent the cylinder from "disappearing" during
##  interaction.  Note that the minimum and maximum radius is
##  specified as a fraction of the diagonal length of the widget
##  bounding box.
##  virtual void SetMinRadius ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << MinRadius  to  << _arg ) ; if ( this -> MinRadius != ( _arg < 0.001 ? 0.001 : ( _arg > 0.25 ? 0.25 : _arg ) ) ) { this -> MinRadius = ( _arg < 0.001 ? 0.001 : ( _arg > 0.25 ? 0.25 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetMinRadiusMinValue ( ) { return 0.001 ; } virtual double GetMinRadiusMaxValue ( ) { return 0.25 ; } ; virtual double GetMinRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MinRadius  of  << this -> MinRadius ) ; return this -> MinRadius ; } ; virtual void SetMinRadiusMaxRadius ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << MaxRadius  to  << _arg ) ; if ( this -> MaxRadius != ( _arg < 0.25 ? 0.25 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ) { this -> MaxRadius = ( _arg < 0.25 ? 0.25 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetMinRadiusMinValueMaxRadiusMinValue ( ) { return 0.25 ; } virtual double GetMinRadiusMaxValueMaxRadiusMaxValue ( ) { return VTK_FLOAT_MAX ; } ; virtual double GetMinRadiusMaxRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaxRadius  of  << this -> MaxRadius ) ; return this -> MaxRadius ; } ; /@} /@{ *
##  Force the cylinder widget to be aligned with one of the x-y-z axes.
##  If one axis is set on, the other two will be set off.
##  Remember that when the state changes, a ModifiedEvent is invoked.
##  This can be used to snap the cylinder to the axes if it is originally
##  not aligned.
##  void SetAlongXAxis ( vtkTypeBool ) ; virtual vtkTypeBool GetMinRadiusMaxRadiusAlongXAxis ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AlongXAxis  of  << this -> AlongXAxis ) ; return this -> AlongXAxis ; } ; virtual void AlongXAxisOn ( ) { this -> SetAlongXAxis ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void AlongXAxisOff ( ) { this -> SetAlongXAxis ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; void SetAlongYAxis ( vtkTypeBool ) ; virtual vtkTypeBool GetMinRadiusMaxRadiusAlongXAxisAlongYAxis ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AlongYAxis  of  << this -> AlongYAxis ) ; return this -> AlongYAxis ; } ; virtual void AlongYAxisOn ( ) { this -> SetAlongXAxisAlongYAxis ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void AlongYAxisOff ( ) { this -> SetAlongXAxisAlongYAxis ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; void SetAlongZAxis ( vtkTypeBool ) ; virtual vtkTypeBool GetMinRadiusMaxRadiusAlongXAxisAlongYAxisAlongZAxis ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AlongZAxis  of  << this -> AlongZAxis ) ; return this -> AlongZAxis ; } ; virtual void AlongZAxisOn ( ) { this -> SetAlongXAxisAlongYAxisAlongZAxis ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void AlongZAxisOff ( ) { this -> SetAlongXAxisAlongYAxisAlongZAxis ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Enable/disable the drawing of the cylinder. In some cases the cylinder
##  interferes with the object that it is operating on (e.g., the
##  cylinder interferes with the cut surface it produces resulting in
##  z-buffer artifacts.) By default it is off.
##  void SetDrawCylinder ( vtkTypeBool drawCyl ) ; virtual vtkTypeBool GetMinRadiusMaxRadiusAlongXAxisAlongYAxisAlongZAxisDrawCylinder ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DrawCylinder  of  << this -> DrawCylinder ) ; return this -> DrawCylinder ; } ; virtual void DrawCylinderOn ( ) { this -> SetAlongXAxisAlongYAxisAlongZAxisDrawCylinder ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void DrawCylinderOff ( ) { this -> SetAlongXAxisAlongYAxisAlongZAxisDrawCylinder ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the resolution of the cylinder. This is the number of
##  polygonal facets used to approximate the curved cylindrical
##  surface (for rendering purposes). An vtkCylinder is used under
##  the hood to provide an exact surface representation.
##  virtual void SetMinRadiusMaxRadiusResolution ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Resolution  to  << _arg ) ; if ( this -> Resolution != ( _arg < 8 ? 8 : ( _arg > VTK_MAX_CYL_RESOLUTION ? VTK_MAX_CYL_RESOLUTION : _arg ) ) ) { this -> Resolution = ( _arg < 8 ? 8 : ( _arg > VTK_MAX_CYL_RESOLUTION ? VTK_MAX_CYL_RESOLUTION : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetMinRadiusMinValueMaxRadiusMinValueResolutionMinValue ( ) { return 8 ; } virtual int GetMinRadiusMaxValueMaxRadiusMaxValueResolutionMaxValue ( ) { return VTK_MAX_CYL_RESOLUTION ; } ; virtual int GetMinRadiusMaxRadiusAlongXAxisAlongYAxisAlongZAxisDrawCylinderResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Resolution  of  << this -> Resolution ) ; return this -> Resolution ; } ; /@} /@{ *
##  Turn on/off tubing of the wire outline of the cylinder
##  intersection (against the bounding box). The tube thickens the
##  line by wrapping with a vtkTubeFilter.
##  virtual void SetTubing ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Tubing  to  << _arg ) ; if ( this -> Tubing != _arg ) { this -> Tubing = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetMinRadiusMaxRadiusAlongXAxisAlongYAxisAlongZAxisDrawCylinderResolutionTubing ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tubing  of  << this -> Tubing ) ; return this -> Tubing ; } ; virtual void TubingOn ( ) { this -> SetAlongXAxisAlongYAxisAlongZAxisDrawCylinderTubing ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void TubingOff ( ) { this -> SetAlongXAxisAlongYAxisAlongZAxisDrawCylinderTubing ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off the ability to translate the bounding box by moving it
##  with the mouse.
##  virtual void SetTubingOutlineTranslation ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutlineTranslation  to  << _arg ) ; if ( this -> OutlineTranslation != _arg ) { this -> OutlineTranslation = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetMinRadiusMaxRadiusAlongXAxisAlongYAxisAlongZAxisDrawCylinderResolutionTubingOutlineTranslation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutlineTranslation  of  << this -> OutlineTranslation ) ; return this -> OutlineTranslation ; } ; virtual void OutlineTranslationOn ( ) { this -> SetAlongXAxisAlongYAxisAlongZAxisDrawCylinderTubingOutlineTranslation ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void OutlineTranslationOff ( ) { this -> SetAlongXAxisAlongYAxisAlongZAxisDrawCylinderTubingOutlineTranslation ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off the ability to move the widget outside of the bounds
##  specified in the PlaceWidget() invocation.
##  virtual void SetTubingOutlineTranslationOutsideBounds ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutsideBounds  to  << _arg ) ; if ( this -> OutsideBounds != _arg ) { this -> OutsideBounds = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetMinRadiusMaxRadiusAlongXAxisAlongYAxisAlongZAxisDrawCylinderResolutionTubingOutlineTranslationOutsideBounds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutsideBounds  of  << this -> OutsideBounds ) ; return this -> OutsideBounds ; } ; virtual void OutsideBoundsOn ( ) { this -> SetAlongXAxisAlongYAxisAlongZAxisDrawCylinderTubingOutlineTranslationOutsideBounds ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void OutsideBoundsOff ( ) { this -> SetAlongXAxisAlongYAxisAlongZAxisDrawCylinderTubingOutlineTranslationOutsideBounds ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the bounds of the widget representation. PlaceWidget can also be
##  used to set the bounds of the widget but it may also have other effects
##  on the internal state of the representation. Use this function when only
##  the widget bounds are needs to be modified.
##  virtual void SetWidgetBounds ( double _arg1 , double _arg2 , double _arg3 , double _arg4 , double _arg5 , double _arg6 ) { vtkDebugWithObjectMacro ( this , <<  setting  << WidgetBounds  to ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; if ( ( this -> WidgetBounds [ 0 ] != _arg1 ) || ( this -> WidgetBounds [ 1 ] != _arg2 ) || ( this -> WidgetBounds [ 2 ] != _arg3 ) || ( this -> WidgetBounds [ 3 ] != _arg4 ) || ( this -> WidgetBounds [ 4 ] != _arg5 ) || ( this -> WidgetBounds [ 5 ] != _arg6 ) ) { this -> WidgetBounds [ 0 ] = _arg1 ; this -> WidgetBounds [ 1 ] = _arg2 ; this -> WidgetBounds [ 2 ] = _arg3 ; this -> WidgetBounds [ 3 ] = _arg4 ; this -> WidgetBounds [ 4 ] = _arg5 ; this -> WidgetBounds [ 5 ] = _arg6 ; this -> Modified ( ) ; } } virtual void SetWidgetBounds ( const double _arg [ 6 ] ) { this -> SetWidgetBounds ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; virtual double * GetWidgetBounds ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << WidgetBounds  pointer  << this -> WidgetBounds ) ; return this -> WidgetBounds ; } VTK_WRAPEXCLUDE virtual void GetWidgetBounds ( double & _arg1 , double & _arg2 , double & _arg3 , double & _arg4 , double & _arg5 , double & _arg6 ) { _arg1 = this -> WidgetBounds [ 0 ] ; _arg2 = this -> WidgetBounds [ 1 ] ; _arg3 = this -> WidgetBounds [ 2 ] ; _arg4 = this -> WidgetBounds [ 3 ] ; _arg5 = this -> WidgetBounds [ 4 ] ; _arg6 = this -> WidgetBounds [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << WidgetBounds  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetWidgetBounds ( double _arg [ 6 ] ) { this -> GetWidgetBounds ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; /@} /@{ *
##  Turn on/off whether the cylinder should be constrained to the widget bounds.
##  If on, the center will not be allowed to move outside the set widget bounds
##  and the radius will be limited by MinRadius and MaxRadius. This is the
##  default behaviour.
##  If off, the center can be freely moved and the radius can be set to
##  arbitrary values. The widget outline will change accordingly.
##  virtual void SetTubingOutlineTranslationOutsideBoundsConstrainToWidgetBounds ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ConstrainToWidgetBounds  to  << _arg ) ; if ( this -> ConstrainToWidgetBounds != _arg ) { this -> ConstrainToWidgetBounds = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetMinRadiusMaxRadiusAlongXAxisAlongYAxisAlongZAxisDrawCylinderResolutionTubingOutlineTranslationOutsideBoundsConstrainToWidgetBounds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ConstrainToWidgetBounds  of  << this -> ConstrainToWidgetBounds ) ; return this -> ConstrainToWidgetBounds ; } ; virtual void ConstrainToWidgetBoundsOn ( ) { this -> SetAlongXAxisAlongYAxisAlongZAxisDrawCylinderTubingOutlineTranslationOutsideBoundsConstrainToWidgetBounds ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ConstrainToWidgetBoundsOff ( ) { this -> SetAlongXAxisAlongYAxisAlongZAxisDrawCylinderTubingOutlineTranslationOutsideBoundsConstrainToWidgetBounds ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off the ability to scale the widget with the mouse.
##  virtual void SetTubingOutlineTranslationOutsideBoundsConstrainToWidgetBoundsScaleEnabled ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ScaleEnabled  to  << _arg ) ; if ( this -> ScaleEnabled != _arg ) { this -> ScaleEnabled = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetMinRadiusMaxRadiusAlongXAxisAlongYAxisAlongZAxisDrawCylinderResolutionTubingOutlineTranslationOutsideBoundsConstrainToWidgetBoundsScaleEnabled ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScaleEnabled  of  << this -> ScaleEnabled ) ; return this -> ScaleEnabled ; } ; virtual void ScaleEnabledOn ( ) { this -> SetAlongXAxisAlongYAxisAlongZAxisDrawCylinderTubingOutlineTranslationOutsideBoundsConstrainToWidgetBoundsScaleEnabled ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ScaleEnabledOff ( ) { this -> SetAlongXAxisAlongYAxisAlongZAxisDrawCylinderTubingOutlineTranslationOutsideBoundsConstrainToWidgetBoundsScaleEnabled ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} *
##  Get the implicit function for the cylinder. The user must provide the
##  instance of the class vtkCylinder. Note that vtkCylinder is a subclass of
##  vtkImplicitFunction, meaning that it can be used by a variety of filters
##  to perform clipping, cutting, and selection of data.
##  void GetCylinder ( vtkCylinder * cyl ) ; *
##  Grab the polydata that defines the cylinder. The polydata contains
##  polygons that are clipped by the bounding box.
##  void GetPolyData ( vtkPolyData * pd ) ; *
##  Satisfies the superclass API.  This will change the state of the widget
##  to match changes that have been made to the underlying PolyDataSource.
##  void UpdatePlacement ( void ) ; /@{ *
##  Get the properties on the axis (line and cone).
##  virtual vtkProperty * GetnameAxisProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  AxisProperty  address  << static_cast < vtkProperty * > ( this -> AxisProperty ) ) ; return this -> AxisProperty ; } ; virtual vtkProperty * GetnameAxisPropertySelectedAxisProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  SelectedAxisProperty  address  << static_cast < vtkProperty * > ( this -> SelectedAxisProperty ) ) ; return this -> SelectedAxisProperty ; } ; /@} /@{ *
##  Get the cylinder properties. The properties of the cylinder when selected
##  and unselected can be manipulated.
##  virtual vtkProperty * GetnameAxisPropertySelectedAxisPropertyCylinderProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  CylinderProperty  address  << static_cast < vtkProperty * > ( this -> CylinderProperty ) ) ; return this -> CylinderProperty ; } ; virtual vtkProperty * GetnameAxisPropertySelectedAxisPropertyCylinderPropertySelectedCylinderProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  SelectedCylinderProperty  address  << static_cast < vtkProperty * > ( this -> SelectedCylinderProperty ) ) ; return this -> SelectedCylinderProperty ; } ; /@} /@{ *
##  Get the property of the outline.
##  virtual vtkProperty * GetnameAxisPropertySelectedAxisPropertyCylinderPropertySelectedCylinderPropertyOutlineProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  OutlineProperty  address  << static_cast < vtkProperty * > ( this -> OutlineProperty ) ) ; return this -> OutlineProperty ; } ; virtual vtkProperty * GetnameAxisPropertySelectedAxisPropertyCylinderPropertySelectedCylinderPropertyOutlinePropertySelectedOutlineProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  SelectedOutlineProperty  address  << static_cast < vtkProperty * > ( this -> SelectedOutlineProperty ) ) ; return this -> SelectedOutlineProperty ; } ; /@} /@{ *
##  Get the property of the intersection edges. (This property also
##  applies to the edges when tubed.)
##  virtual vtkProperty * GetnameAxisPropertySelectedAxisPropertyCylinderPropertySelectedCylinderPropertyOutlinePropertySelectedOutlinePropertyEdgesProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  EdgesProperty  address  << static_cast < vtkProperty * > ( this -> EdgesProperty ) ) ; return this -> EdgesProperty ; } ; /@}
## /@{ *
##  Set color to the edge
##  void SetEdgeColor ( vtkLookupTable * ) ; void SetEdgeColor ( double , double , double ) ; void SetEdgeColor ( double c [ 3 ] ) ; /@} /@{ *
##  Methods to interface with the vtkImplicitCylinderWidget.
##  int ComputeInteractionState ( int X , int Y , int modify = 0 ) override ; void PlaceWidget ( double bounds [ 6 ] ) override ; void BuildRepresentation ( ) override ; void StartWidgetInteraction ( double eventPos [ 2 ] ) override ; void WidgetInteraction ( double newEventPos [ 2 ] ) override ; void EndWidgetInteraction ( double newEventPos [ 2 ] ) override ; /@} /@{ *
##  Methods supporting the rendering process.
##  double * GetBounds ( ) override ; void GetActors ( vtkPropCollection * pc ) override ; void ReleaseGraphicsResources ( vtkWindow * ) override ; int RenderOpaqueGeometry ( vtkViewport * ) override ; int RenderTranslucentPolygonalGeometry ( vtkViewport * ) override ; vtkTypeBool HasTranslucentPolygonalGeometry ( ) override ; /@} /@{ *
##  Specify a translation distance used by the BumpCylinder() method. Note that the
##  distance is normalized; it is the fraction of the length of the bounding
##  box of the wire outline.
##  virtual void SetMinRadiusMaxRadiusResolutionBumpDistance ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << BumpDistance  to  << _arg ) ; if ( this -> BumpDistance != ( _arg < 0.000001 ? 0.000001 : ( _arg > 1 ? 1 : _arg ) ) ) { this -> BumpDistance = ( _arg < 0.000001 ? 0.000001 : ( _arg > 1 ? 1 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetMinRadiusMinValueMaxRadiusMinValueResolutionMinValueBumpDistanceMinValue ( ) { return 0.000001 ; } virtual double GetMinRadiusMaxValueMaxRadiusMaxValueResolutionMaxValueBumpDistanceMaxValue ( ) { return 1 ; } ; virtual double GetMinRadiusMaxRadiusAlongXAxisAlongYAxisAlongZAxisDrawCylinderResolutionTubingOutlineTranslationOutsideBoundsConstrainToWidgetBoundsScaleEnabledBumpDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BumpDistance  of  << this -> BumpDistance ) ; return this -> BumpDistance ; } ; /@} *
##  Translate the cylinder in the direction of the view vector by the
##  specified BumpDistance. The dir parameter controls which
##  direction the pushing occurs, either in the same direction as the
##  view vector, or when negative, in the opposite direction.  The factor
##  controls what percentage of the bump is used.
##  void BumpCylinder ( int dir , double factor ) ; *
##  Push the cylinder the distance specified along the view
##  vector. Positive values are in the direction of the view vector;
##  negative values are in the opposite direction. The distance value
##  is expressed in world coordinates.
##  void PushCylinder ( double distance ) ;  Manage the state of the widget enum InteractionStateType { Outside = 0 , Moving , MovingOutline , MovingCenter , RotatingAxis , AdjustingRadius , Scaling , TranslatingCenter } ; # ! defined ( VTK_LEGACY_REMOVE ) [NewLine] VTK_DEPRECATED_IN_9_2_0 ( because leading underscore is reserved ) typedef InteractionStateType _InteractionState ; # [NewLine] /@{ *
##  The interaction state may be set from a widget (e.g.,
##  vtkImplicitCylinderWidget) or other object. This controls how the
##  interaction with the widget proceeds. Normally this method is used as
##  part of a handshaking process with the widget: First
##  ComputeInteractionState() is invoked that returns a state based on
##  geometric considerations (i.e., cursor near a widget feature), then
##  based on events, the widget may modify this further.
##  virtual void SetMinRadiusMaxRadiusResolutionBumpDistanceInteractionState ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << InteractionState  to  << _arg ) ; if ( this -> InteractionState != ( _arg < Outside ? Outside : ( _arg > TranslatingCenter ? TranslatingCenter : _arg ) ) ) { this -> InteractionState = ( _arg < Outside ? Outside : ( _arg > TranslatingCenter ? TranslatingCenter : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetMinRadiusMinValueMaxRadiusMinValueResolutionMinValueBumpDistanceMinValueInteractionStateMinValue ( ) { return Outside ; } virtual int GetMinRadiusMaxValueMaxRadiusMaxValueResolutionMaxValueBumpDistanceMaxValueInteractionStateMaxValue ( ) { return TranslatingCenter ; } ; /@} /@{ *
##  Sets the visual appearance of the representation based on the
##  state it is in. This state is usually the same as InteractionState.
##  virtual void SetRepresentationState ( int ) ; virtual int GetMinRadiusMaxRadiusAlongXAxisAlongYAxisAlongZAxisDrawCylinderResolutionTubingOutlineTranslationOutsideBoundsConstrainToWidgetBoundsScaleEnabledBumpDistanceRepresentationState ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RepresentationState  of  << this -> RepresentationState ) ; return this -> RepresentationState ; } ; /@}
##  Register internal Pickers within PickingManager
##  void RegisterPickers ( ) override ; /@{ *
##  Gets/Sets the constraint axis for translations. Returns Axis::NONE
##  if none.
##  virtual int GetMinRadiusMaxRadiusAlongXAxisAlongYAxisAlongZAxisDrawCylinderResolutionTubingOutlineTranslationOutsideBoundsConstrainToWidgetBoundsScaleEnabledBumpDistanceRepresentationStateTranslationAxis ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TranslationAxis  of  << this -> TranslationAxis ) ; return this -> TranslationAxis ; } ; virtual void SetMinRadiusMaxRadiusResolutionBumpDistanceInteractionStateTranslationAxis ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << TranslationAxis  to  << _arg ) ; if ( this -> TranslationAxis != ( _arg < - 1 ? - 1 : ( _arg > 2 ? 2 : _arg ) ) ) { this -> TranslationAxis = ( _arg < - 1 ? - 1 : ( _arg > 2 ? 2 : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetMinRadiusMinValueMaxRadiusMinValueResolutionMinValueBumpDistanceMinValueInteractionStateMinValueTranslationAxisMinValue ( ) { return - 1 ; } virtual int GetMinRadiusMaxValueMaxRadiusMaxValueResolutionMaxValueBumpDistanceMaxValueInteractionStateMaxValueTranslationAxisMaxValue ( ) { return 2 ; } ; /@} /@{ *
##  Toggles constraint translation axis on/off.
##  void SetXTranslationAxisOn ( ) { this -> TranslationAxis = Axis :: XAxis ; } void SetYTranslationAxisOn ( ) { this -> TranslationAxis = Axis :: YAxis ; } void SetZTranslationAxisOn ( ) { this -> TranslationAxis = Axis :: ZAxis ; } void SetTranslationAxisOff ( ) { this -> TranslationAxis = Axis :: NONE ; } /@} /@{ *
##  Returns true if ContrainedAxis
##  bool IsTranslationConstrained ( ) { return this -> TranslationAxis != Axis :: NONE ; } /@} protected : vtkImplicitCylinderRepresentation ( ) ; ~ vtkImplicitCylinderRepresentation ( ) override ; int RepresentationState ; int TranslationAxis ;  Keep track of event positions double LastEventPosition [ 3 ] ;  Control the radius double MinRadius ; double MaxRadius ;  Controlling the push operation double BumpDistance ;  Controlling ivars vtkTypeBool AlongXAxis ; vtkTypeBool AlongYAxis ; vtkTypeBool AlongZAxis ;  The actual cylinder which is being manipulated vtkCylinder * Cylinder ;  The facet resolution for rendering purposes. int Resolution ;  The bounding box is represented by a single voxel image data vtkImageData * Box ; vtkOutlineFilter * Outline ; vtkPolyDataMapper * OutlineMapper ; vtkActor * OutlineActor ; void HighlightOutline ( int highlight ) ; vtkTypeBool OutlineTranslation ;  whether the outline can be moved vtkTypeBool ScaleEnabled ;  whether the widget can be scaled vtkTypeBool OutsideBounds ;  whether the widget can be moved outside input's bounds double WidgetBounds [ 6 ] ; int ConstrainToWidgetBounds ;  The cut cylinder is produced with a vtkCutter vtkPolyData * Cyl ; vtkPolyDataMapper * CylMapper ; vtkActor * CylActor ; vtkTypeBool DrawCylinder ; void HighlightCylinder ( int highlight ) ;  Optional tubes are represented by extracting boundary edges and tubing vtkFeatureEdges * Edges ; vtkTubeFilter * EdgesTuber ; vtkPolyDataMapper * EdgesMapper ; vtkActor * EdgesActor ; vtkTypeBool Tubing ;  control whether tubing is on  The + normal cone (i.e., in positive direction along normal) vtkConeSource * ConeSource ; vtkPolyDataMapper * ConeMapper ; vtkActor * ConeActor ; void HighlightNormal ( int highlight ) ;  The + normal line vtkLineSource * LineSource ; vtkPolyDataMapper * LineMapper ; vtkActor * LineActor ;  The - normal cone vtkConeSource * ConeSource2 ; vtkPolyDataMapper * ConeMapper2 ; vtkActor * ConeActor2 ;  The - normal line vtkLineSource * LineSource2 ; vtkPolyDataMapper * LineMapper2 ; vtkActor * LineActor2 ;  The center positioning handle vtkSphereSource * Sphere ; vtkPolyDataMapper * SphereMapper ; vtkActor * SphereActor ;  Do the picking vtkCellPicker * Picker ; vtkCellPicker * CylPicker ;  Transform the normal (used for rotation) vtkTransform * Transform ;  Methods to manipulate the cylinder void Rotate ( double X , double Y , double * p1 , double * p2 , double * vpn ) ; void TranslateCylinder ( double * p1 , double * p2 ) ; void TranslateOutline ( double * p1 , double * p2 ) ; void TranslateCenter ( double * p1 , double * p2 ) ; void TranslateCenterOnAxis ( double * p1 , double * p2 ) ; void ScaleRadius ( double * p1 , double * p2 ) ; void AdjustRadius ( double X , double Y , double * p1 , double * p2 ) ; void Scale ( double * p1 , double * p2 , double X , double Y ) ; void SizeHandles ( ) ;  Properties used to control the appearance of selected objects and
##  the manipulator in general. vtkProperty * AxisProperty ; vtkProperty * SelectedAxisProperty ; vtkProperty * CylinderProperty ; vtkProperty * SelectedCylinderProperty ; vtkProperty * OutlineProperty ; vtkProperty * SelectedOutlineProperty ; vtkProperty * EdgesProperty ; void CreateDefaultProperties ( ) ;  Intersect oriented infinite cylinder against bounding box void BuildCylinder ( ) ;  Support GetBounds() method vtkBox * BoundingBox ; private : vtkImplicitCylinderRepresentation ( const vtkImplicitCylinderRepresentation & ) = delete ; void operator = ( const vtkImplicitCylinderRepresentation & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
