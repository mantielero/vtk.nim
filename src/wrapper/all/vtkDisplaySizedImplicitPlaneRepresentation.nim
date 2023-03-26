## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDisplaySizedImplicitPlaneRepresentation.h
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
##  @class   vtkDisplaySizedImplicitPlaneRepresentation
##  @brief   a class defining the representation for a vtkDisplaySizedImplicitPlaneWidget
##
##  This class is a concrete representation for the
##  vtkDisplaySizedImplicitPlaneWidget. It represents an display sized disk plane defined
##  by a normal and point. Through interaction with the widget, the plane can be manipulated
##  by adjusting the plane normal, disk radius or moving/picking the origin point.
##
##  To use this representation, you normally define a (plane) origin and (plane)
##  normal. The PlaceWidget() method is also used to initially position the
##  representation.
##
##  @warning
##  This class, and vtkDisplaySizedImplicitPlaneWidget, are next generation VTK
##  widgets.
##
##  @sa
##  vtkDisplaySizedImplicitPlaneWidget vtkImplicitPlaneWidget2 vtkImplicitPlaneWidget
##  vtkImplicitImageRepresentation
##

## !!!Ignored construct:  # vtkDisplaySizedImplicitPlaneRepresentation_h [NewLine] # vtkDisplaySizedImplicitPlaneRepresentation_h [NewLine] # vtkDeprecation.h  For VTK_DEPRECATED_IN_9_2_0 # vtkInteractionWidgetsModule.h  For export macro # vtkNew.h  For vtkNew command # vtkWidgetRepresentation.h [NewLine] class vtkActor ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkBox"
discard "forward decl of vtkCellPicker"
discard "forward decl of vtkConeSource"
discard "forward decl of vtkCutter"
discard "forward decl of vtkDiskSource"
discard "forward decl of vtkFeatureEdges"
discard "forward decl of vtkHardwarePicker"
discard "forward decl of vtkImageData"
discard "forward decl of vtkLineSource"
discard "forward decl of vtkLookupTable"
discard "forward decl of vtkOutlineFilter"
discard "forward decl of vtkPlane"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkPolyDataAlgorithm"
discard "forward decl of vtkPolyDataMapper"
discard "forward decl of vtkProperty"
discard "forward decl of vtkSphereSource"
discard "forward decl of vtkTransform"
discard "forward decl of vtkTubeFilter"
## !!!Ignored construct:  class VTKINTERACTIONWIDGETS_EXPORT vtkDisplaySizedImplicitPlaneRepresentation : public vtkWidgetRepresentation { public : *
##  Instantiate the class.
##  static vtkDisplaySizedImplicitPlaneRepresentation * New ( ) ; /@{ *
##  Standard methods for the class.
##  protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkWidgetRepresentation Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkWidgetRepresentation :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkDisplaySizedImplicitPlaneRepresentation :: IsTypeOf ( type ) ; } static vtkDisplaySizedImplicitPlaneRepresentation * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkDisplaySizedImplicitPlaneRepresentation * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkDisplaySizedImplicitPlaneRepresentation * NewInstance ( ) const { return vtkDisplaySizedImplicitPlaneRepresentation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWidgetRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDisplaySizedImplicitPlaneRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDisplaySizedImplicitPlaneRepresentation :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Set/Get the origin of the plane.
##  void SetOrigin ( double x , double y , double z ) ; void SetOrigin ( double x [ 3 ] ) ; double * GetOrigin ( ) VTK_SIZEHINT ( 3 ) ; void GetOrigin ( double xyz [ 3 ] ) ; /@} /@{ *
##  Set/Get the normal to the plane.
##  void SetNormal ( double x , double y , double z ) ; void SetNormal ( double n [ 3 ] ) ; void SetNormalToCamera ( ) ; double * GetNormal ( ) VTK_SIZEHINT ( 3 ) ; void GetNormal ( double xyz [ 3 ] ) ; /@} /@{ *
##  Force the plane widget to be aligned with one of the x-y-z axes.
##  If one axis is set on, the other two will be set off.
##  Remember that when the state changes, a ModifiedEvent is invoked.
##  This can be used to snap the plane to the axes if it is originally
##  not aligned.
##  void SetNormalToXAxis ( vtkTypeBool ) ; virtual vtkTypeBool GetNormalToXAxis ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NormalToXAxis  of  << this -> NormalToXAxis ) ; return this -> NormalToXAxis ; } ; virtual void NormalToXAxisOn ( ) { this -> SetNormalToXAxis ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void NormalToXAxisOff ( ) { this -> SetNormalToXAxis ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; void SetNormalToYAxis ( vtkTypeBool ) ; virtual vtkTypeBool GetNormalToXAxisNormalToYAxis ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NormalToYAxis  of  << this -> NormalToYAxis ) ; return this -> NormalToYAxis ; } ; virtual void NormalToYAxisOn ( ) { this -> SetNormalToXAxisNormalToYAxis ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void NormalToYAxisOff ( ) { this -> SetNormalToXAxisNormalToYAxis ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; void SetNormalToZAxis ( vtkTypeBool ) ; virtual vtkTypeBool GetNormalToXAxisNormalToYAxisNormalToZAxis ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NormalToZAxis  of  << this -> NormalToZAxis ) ; return this -> NormalToZAxis ; } ; virtual void NormalToZAxisOn ( ) { this -> SetNormalToXAxisNormalToYAxisNormalToZAxis ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void NormalToZAxisOff ( ) { this -> SetNormalToXAxisNormalToYAxisNormalToZAxis ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  If enabled, and a vtkCamera is available through the renderer, then
##  LockNormalToCamera will cause the normal to follow the camera's
##  normal.
##  virtual void SetLockNormalToCamera ( vtkTypeBool ) ; virtual vtkTypeBool GetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCamera ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LockNormalToCamera  of  << this -> LockNormalToCamera ) ; return this -> LockNormalToCamera ; } ; virtual void LockNormalToCameraOn ( ) { this -> SetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCamera ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void LockNormalToCameraOff ( ) { this -> SetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCamera ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the Radius Multiplier value. Default is 1.0.
##  virtual void SetRadiusMultiplier ( double radiusMultiplier ) ; virtual double GetRadiusMultiplierMinValue ( ) { return 0.000001 ; } virtual double GetRadiusMultiplierMaxValue ( ) { return VTK_DOUBLE_MAX ; } virtual double GetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraRadiusMultiplier ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RadiusMultiplier  of  << this -> RadiusMultiplier ) ; return this -> RadiusMultiplier ; } ; /@} /@{ *
##  Enable/disable the drawing of the plane. In some cases the plane
##  interferes with the object that it is operating on (i.e., the
##  plane interferes with the cut surface it produces producing
##  z-buffer artifacts.)
##  void SetDrawPlane ( vtkTypeBool plane ) ; virtual vtkTypeBool GetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraRadiusMultiplierDrawPlane ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DrawPlane  of  << this -> DrawPlane ) ; return this -> DrawPlane ; } ; virtual void DrawPlaneOn ( ) { this -> SetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraDrawPlane ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void DrawPlaneOff ( ) { this -> SetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraDrawPlane ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Enable/disable the drawing of the outline. Default is off.
##  void SetDrawOutline ( vtkTypeBool outline ) ; virtual vtkTypeBool GetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraRadiusMultiplierDrawPlaneDrawOutline ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DrawOutline  of  << this -> DrawOutline ) ; return this -> DrawOutline ; } ; virtual void DrawOutlineOn ( ) { this -> SetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraDrawPlaneDrawOutline ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void DrawOutlineOff ( ) { this -> SetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraDrawPlaneDrawOutline ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Enable/disable the drawing of the intersection edges. Default is off.
##
##  Note: drawing the intersection edges requires DrawOutline to be on.
##  void SetDrawIntersectionEdges ( vtkTypeBool intersectionEdges ) ; virtual vtkTypeBool GetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraRadiusMultiplierDrawPlaneDrawOutlineDrawIntersectionEdges ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DrawIntersectionEdges  of  << this -> DrawIntersectionEdges ) ; return this -> DrawIntersectionEdges ; } ; virtual void DrawIntersectionEdgesOn ( ) { this -> SetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraDrawPlaneDrawOutlineDrawIntersectionEdges ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void DrawIntersectionEdgesOff ( ) { this -> SetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraDrawPlaneDrawOutlineDrawIntersectionEdges ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off the ability to translate the bounding box by grabbing it
##  with the left mouse button. Default is off.
##  virtual void SetOutlineTranslation ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutlineTranslation  to  << _arg ) ; if ( this -> OutlineTranslation != _arg ) { this -> OutlineTranslation = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraRadiusMultiplierDrawPlaneDrawOutlineDrawIntersectionEdgesOutlineTranslation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutlineTranslation  of  << this -> OutlineTranslation ) ; return this -> OutlineTranslation ; } ; virtual void OutlineTranslationOn ( ) { this -> SetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraDrawPlaneDrawOutlineDrawIntersectionEdgesOutlineTranslation ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void OutlineTranslationOff ( ) { this -> SetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraDrawPlaneDrawOutlineDrawIntersectionEdgesOutlineTranslation ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off the ability to move the widget outside of the bounds
##  specified in the initial PlaceWidget() invocation.
##  virtual void SetOutlineTranslationOutsideBounds ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutsideBounds  to  << _arg ) ; if ( this -> OutsideBounds != _arg ) { this -> OutsideBounds = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraRadiusMultiplierDrawPlaneDrawOutlineDrawIntersectionEdgesOutlineTranslationOutsideBounds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutsideBounds  of  << this -> OutsideBounds ) ; return this -> OutsideBounds ; } ; virtual void OutsideBoundsOn ( ) { this -> SetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraDrawPlaneDrawOutlineDrawIntersectionEdgesOutlineTranslationOutsideBounds ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void OutsideBoundsOff ( ) { this -> SetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraDrawPlaneDrawOutlineDrawIntersectionEdgesOutlineTranslationOutsideBounds ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Toggles constraint translation axis on/off.
##  void SetXTranslationAxisOn ( ) { this -> TranslationAxis = Axis :: XAxis ; } void SetYTranslationAxisOn ( ) { this -> TranslationAxis = Axis :: YAxis ; } void SetZTranslationAxisOn ( ) { this -> TranslationAxis = Axis :: ZAxis ; } void SetTranslationAxisOff ( ) { this -> TranslationAxis = Axis :: NONE ; } /@} /@{ *
##  Returns true if ContrainedAxis
##  bool IsTranslationConstrained ( ) { return this -> TranslationAxis != Axis :: NONE ; } /@} /@{ *
##  Set/Get the bounds of the widget representation. PlaceWidget can also be
##  used to set the bounds of the widget but it may also have other effects
##  on the internal state of the representation. Use this function when only
##  the widget bounds need to be modified.
##  virtual void SetWidgetBounds ( double _arg1 , double _arg2 , double _arg3 , double _arg4 , double _arg5 , double _arg6 ) { vtkDebugWithObjectMacro ( this , <<  setting  << WidgetBounds  to ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; if ( ( this -> WidgetBounds [ 0 ] != _arg1 ) || ( this -> WidgetBounds [ 1 ] != _arg2 ) || ( this -> WidgetBounds [ 2 ] != _arg3 ) || ( this -> WidgetBounds [ 3 ] != _arg4 ) || ( this -> WidgetBounds [ 4 ] != _arg5 ) || ( this -> WidgetBounds [ 5 ] != _arg6 ) ) { this -> WidgetBounds [ 0 ] = _arg1 ; this -> WidgetBounds [ 1 ] = _arg2 ; this -> WidgetBounds [ 2 ] = _arg3 ; this -> WidgetBounds [ 3 ] = _arg4 ; this -> WidgetBounds [ 4 ] = _arg5 ; this -> WidgetBounds [ 5 ] = _arg6 ; this -> Modified ( ) ; } } virtual void SetWidgetBounds ( const double _arg [ 6 ] ) { this -> SetWidgetBounds ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; virtual double * GetWidgetBounds ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << WidgetBounds  pointer  << this -> WidgetBounds ) ; return this -> WidgetBounds ; } VTK_WRAPEXCLUDE virtual void GetWidgetBounds ( double & _arg1 , double & _arg2 , double & _arg3 , double & _arg4 , double & _arg5 , double & _arg6 ) { _arg1 = this -> WidgetBounds [ 0 ] ; _arg2 = this -> WidgetBounds [ 1 ] ; _arg3 = this -> WidgetBounds [ 2 ] ; _arg4 = this -> WidgetBounds [ 3 ] ; _arg5 = this -> WidgetBounds [ 4 ] ; _arg6 = this -> WidgetBounds [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << WidgetBounds  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetWidgetBounds ( double _arg [ 6 ] ) { this -> GetWidgetBounds ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; /@} /@{ *
##  Turn on/off whether the plane should be constrained to the widget bounds.
##  If on, the origin will not be allowed to move outside the set widget bounds.
##  The default behaviour is off.
##  If off, the origin can be freely moved and the widget outline will change
##  accordingly.
##  virtual void SetOutlineTranslationOutsideBoundsConstrainToWidgetBounds ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ConstrainToWidgetBounds  to  << _arg ) ; if ( this -> ConstrainToWidgetBounds != _arg ) { this -> ConstrainToWidgetBounds = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraRadiusMultiplierDrawPlaneDrawOutlineDrawIntersectionEdgesOutlineTranslationOutsideBoundsConstrainToWidgetBounds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ConstrainToWidgetBounds  of  << this -> ConstrainToWidgetBounds ) ; return this -> ConstrainToWidgetBounds ; } ; virtual void ConstrainToWidgetBoundsOn ( ) { this -> SetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraDrawPlaneDrawOutlineDrawIntersectionEdgesOutlineTranslationOutsideBoundsConstrainToWidgetBounds ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ConstrainToWidgetBoundsOff ( ) { this -> SetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraDrawPlaneDrawOutlineDrawIntersectionEdgesOutlineTranslationOutsideBoundsConstrainToWidgetBounds ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off whether the maximum widget size should be constrained to the widget bounds.
##  If on, the radius of the disk plane and plane normal arrow will not be allowed to be larger
##  than the half diagonal of the bounding box formed by the widget bounds.
##  If off, the radius of the disk plane and plane normal arrow can be arbitrary big
##  The default behaviour is off.
##  virtual void SetOutlineTranslationOutsideBoundsConstrainToWidgetBoundsConstrainMaximumSizeToWidgetBounds ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ConstrainMaximumSizeToWidgetBounds  to  << _arg ) ; if ( this -> ConstrainMaximumSizeToWidgetBounds != _arg ) { this -> ConstrainMaximumSizeToWidgetBounds = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraRadiusMultiplierDrawPlaneDrawOutlineDrawIntersectionEdgesOutlineTranslationOutsideBoundsConstrainToWidgetBoundsConstrainMaximumSizeToWidgetBounds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ConstrainMaximumSizeToWidgetBounds  of  << this -> ConstrainMaximumSizeToWidgetBounds ) ; return this -> ConstrainMaximumSizeToWidgetBounds ; } ; virtual void ConstrainMaximumSizeToWidgetBoundsOn ( ) { this -> SetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraDrawPlaneDrawOutlineDrawIntersectionEdgesOutlineTranslationOutsideBoundsConstrainToWidgetBoundsConstrainMaximumSizeToWidgetBounds ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ConstrainMaximumSizeToWidgetBoundsOff ( ) { this -> SetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraDrawPlaneDrawOutlineDrawIntersectionEdgesOutlineTranslationOutsideBoundsConstrainToWidgetBoundsConstrainMaximumSizeToWidgetBounds ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@{ *
##  Turn on/off the ability to scale the widget with the mouse.
##  virtual void SetOutlineTranslationOutsideBoundsConstrainToWidgetBoundsConstrainMaximumSizeToWidgetBoundsScaleEnabled ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ScaleEnabled  to  << _arg ) ; if ( this -> ScaleEnabled != _arg ) { this -> ScaleEnabled = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraRadiusMultiplierDrawPlaneDrawOutlineDrawIntersectionEdgesOutlineTranslationOutsideBoundsConstrainToWidgetBoundsConstrainMaximumSizeToWidgetBoundsScaleEnabled ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScaleEnabled  of  << this -> ScaleEnabled ) ; return this -> ScaleEnabled ; } ; virtual void ScaleEnabledOn ( ) { this -> SetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraDrawPlaneDrawOutlineDrawIntersectionEdgesOutlineTranslationOutsideBoundsConstrainToWidgetBoundsConstrainMaximumSizeToWidgetBoundsScaleEnabled ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ScaleEnabledOff ( ) { this -> SetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraDrawPlaneDrawOutlineDrawIntersectionEdgesOutlineTranslationOutsideBoundsConstrainToWidgetBoundsConstrainMaximumSizeToWidgetBoundsScaleEnabled ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} *
##  Grab the polydata that defines the plane. The polydata contains a single
##  polygon that is clipped by the bounding box.
##  void GetPolyData ( vtkPolyData * pd ) ; *
##  Satisfies superclass API.  This returns a pointer to the underlying
##  PolyData (which represents the plane).
##  vtkPolyDataAlgorithm * GetPolyDataAlgorithm ( ) ; *
##  Get the implicit function for the plane by copying the origin and normal
##  of the cut plane into the provided vtkPlane. The user must provide the
##  instance of the class vtkPlane. Note that vtkPlane is a subclass of
##  vtkImplicitFunction, meaning that it can be used by a variety of filters
##  to perform clipping, cutting, and selection of data.
##  void GetPlane ( vtkPlane * plane ) ; *
##  Alternative way to define the cutting plane. The normal and origin of
##  the plane provided is copied into the internal instance of the class
##  cutting vtkPlane.
##  void SetPlane ( vtkPlane * plane ) ; *
##  Satisfies the superclass API.  This will change the state of the widget
##  to match changes that have been made to the underlying PolyDataSource
##  void UpdatePlacement ( ) ; /@{ *
##  Get the properties on the normal (line and cone). The properties of the normal when selected
##  and unselected can be manipulated.
##  virtual vtkProperty * GetnameNormalProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  NormalProperty  address  << static_cast < vtkProperty * > ( this -> NormalProperty ) ) ; return this -> NormalProperty ; } ; virtual vtkProperty * GetnameNormalPropertySelectedNormalProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  SelectedNormalProperty  address  << static_cast < vtkProperty * > ( this -> SelectedNormalProperty ) ) ; return this -> SelectedNormalProperty ; } ; /@} /@{ *
##  Get the properties on the sphere. The properties of the sphere when selected
##  and unselected can be manipulated.
##  virtual vtkProperty * GetnameNormalPropertySelectedNormalPropertySphereProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  SphereProperty  address  << static_cast < vtkProperty * > ( this -> SphereProperty ) ) ; return this -> SphereProperty ; } ; virtual vtkProperty * GetnameNormalPropertySelectedNormalPropertySpherePropertySelectedSphereProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  SelectedSphereProperty  address  << static_cast < vtkProperty * > ( this -> SelectedSphereProperty ) ) ; return this -> SelectedSphereProperty ; } ; /@} /@{ *
##  Get the plane properties. The properties of the plane when selected
##  and unselected can be manipulated.
##  virtual vtkProperty * GetnameNormalPropertySelectedNormalPropertySpherePropertySelectedSpherePropertyPlaneProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  PlaneProperty  address  << static_cast < vtkProperty * > ( this -> PlaneProperty ) ) ; return this -> PlaneProperty ; } ; virtual vtkProperty * GetnameNormalPropertySelectedNormalPropertySpherePropertySelectedSpherePropertyPlanePropertySelectedPlaneProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  SelectedPlaneProperty  address  << static_cast < vtkProperty * > ( this -> SelectedPlaneProperty ) ) ; return this -> SelectedPlaneProperty ; } ; /@} /@{ *
##  Get the property of the outline.
##  virtual vtkProperty * GetnameNormalPropertySelectedNormalPropertySpherePropertySelectedSpherePropertyPlanePropertySelectedPlanePropertyOutlineProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  OutlineProperty  address  << static_cast < vtkProperty * > ( this -> OutlineProperty ) ) ; return this -> OutlineProperty ; } ; virtual vtkProperty * GetnameNormalPropertySelectedNormalPropertySpherePropertySelectedSpherePropertyPlanePropertySelectedPlanePropertyOutlinePropertySelectedOutlineProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  SelectedOutlineProperty  address  << static_cast < vtkProperty * > ( this -> SelectedOutlineProperty ) ) ; return this -> SelectedOutlineProperty ; } ; /@} /@{ *
##  Get the property of the disk edges. The properties of the edges when selected
##  and unselected can be manipulated.
##  virtual vtkProperty * GetnameNormalPropertySelectedNormalPropertySpherePropertySelectedSpherePropertyPlanePropertySelectedPlanePropertyOutlinePropertySelectedOutlinePropertyEdgesProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  EdgesProperty  address  << static_cast < vtkProperty * > ( this -> EdgesProperty ) ) ; return this -> EdgesProperty ; } ; virtual vtkProperty * GetnameNormalPropertySelectedNormalPropertySpherePropertySelectedSpherePropertyPlanePropertySelectedPlanePropertyOutlinePropertySelectedOutlinePropertyEdgesPropertySelectedEdgesProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  SelectedEdgesProperty  address  << static_cast < vtkProperty * > ( this -> SelectedEdgesProperty ) ) ; return this -> SelectedEdgesProperty ; } ; /@} /@{ *
##  Get the property of the intersection edges of the plane with the outline.
##  virtual vtkProperty * GetnameNormalPropertySelectedNormalPropertySpherePropertySelectedSpherePropertyPlanePropertySelectedPlanePropertyOutlinePropertySelectedOutlinePropertyEdgesPropertySelectedEdgesPropertyIntersectionEdgesProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  IntersectionEdgesProperty  address  << static_cast < vtkProperty * > ( this -> IntersectionEdgesProperty ) ) ; return this -> IntersectionEdgesProperty ; } ; /@} /@{ *
##  Set the color of all the widgets objects (edges, cone1, cone2, line, sphere, except plane)
##  when unselected or selected.
##  void SetSelectedWidgetColor ( double , double , double ) ; void SetSelectedWidgetColor ( double c [ 3 ] ) ; void SetUnselectedWidgetColor ( double , double , double ) ; void SetUnselectedWidgetColor ( double c [ 3 ] ) ; /@} /@{ *
##  Specify a translation distance used by the BumpPlane() method. Note that the
##  distance is normalized; it is the fraction of the length of the bounding
##  box of the wire outline.
##  virtual void SetBumpDistance ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << BumpDistance  to  << _arg ) ; if ( this -> BumpDistance != ( _arg < 0.000001 ? 0.000001 : ( _arg > 1 ? 1 : _arg ) ) ) { this -> BumpDistance = ( _arg < 0.000001 ? 0.000001 : ( _arg > 1 ? 1 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetBumpDistanceMinValue ( ) { return 0.000001 ; } virtual double GetBumpDistanceMaxValue ( ) { return 1 ; } ; virtual double GetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraRadiusMultiplierDrawPlaneDrawOutlineDrawIntersectionEdgesOutlineTranslationOutsideBoundsConstrainToWidgetBoundsConstrainMaximumSizeToWidgetBoundsScaleEnabledBumpDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BumpDistance  of  << this -> BumpDistance ) ; return this -> BumpDistance ; } ; /@} *
##  Translate the plane in the direction of the normal by the
##  specified BumpDistance.  The dir parameter controls which
##  direction the pushing occurs, either in the same direction
##  as the normal, or when negative, in the opposite direction.
##  The factor controls whether what percentage of the bump is
##  used.
##  void BumpPlane ( int dir , double factor ) ; *
##  Push the plane the distance specified along the normal. Positive
##  values are in the direction of the normal; negative values are
##  in the opposite direction of the normal. The distance value is
##  expressed in world coordinates.
##  void PushPlane ( double distance ) ; /@{ *
##  Enable/Disable picking camera focal info if no result is available for PickOrigin and
##  PickNormal. The default is disabled.
##  virtual bool GetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraRadiusMultiplierDrawPlaneDrawOutlineDrawIntersectionEdgesOutlineTranslationOutsideBoundsConstrainToWidgetBoundsConstrainMaximumSizeToWidgetBoundsScaleEnabledBumpDistancePickCameraFocalInfo ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PickCameraFocalInfo  of  << this -> PickCameraFocalInfo ) ; return this -> PickCameraFocalInfo ; } ; virtual void SetOutlineTranslationOutsideBoundsConstrainToWidgetBoundsConstrainMaximumSizeToWidgetBoundsScaleEnabledPickCameraFocalInfo ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PickCameraFocalInfo  to  << _arg ) ; if ( this -> PickCameraFocalInfo != _arg ) { this -> PickCameraFocalInfo = _arg ; this -> Modified ( ) ; } } ; virtual void PickCameraFocalInfoOn ( ) { this -> SetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraDrawPlaneDrawOutlineDrawIntersectionEdgesOutlineTranslationOutsideBoundsConstrainToWidgetBoundsConstrainMaximumSizeToWidgetBoundsScaleEnabledPickCameraFocalInfo ( static_cast < bool > ( 1 ) ) ; } virtual void PickCameraFocalInfoOff ( ) { this -> SetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraDrawPlaneDrawOutlineDrawIntersectionEdgesOutlineTranslationOutsideBoundsConstrainToWidgetBoundsConstrainMaximumSizeToWidgetBoundsScaleEnabledPickCameraFocalInfo ( static_cast < bool > ( 0 ) ) ; } ; /@} *
##  Given the X, Y display coordinates, pick a new origin for the plane
##  from a point that is on the objects rendered by the renderer.
##
##  Note: if a point from a rendered object is not picked, the camera focal point can optionally be
##  set.
##  bool PickOrigin ( int X , int Y , bool snapToMeshPoint = false ) ; *
##  Given the X, Y display coordinates, pick a new normal for the plane
##  from a point that is on the objects rendered by the renderer.
##
##  Note: if a normal from a rendered object is not picked, the camera plane normal can optionally
##  be set.
##  bool PickNormal ( int X , int Y , bool snapToMeshPoint = false ) ; /@{ *
##  Methods to interface with the vtkDisplaySizedImplicitPlaneWidget.
##  int ComputeInteractionState ( int X , int Y , int modify = 0 ) override ; void PlaceWidget ( double bounds [ 6 ] ) override ; void BuildRepresentation ( ) override ; void StartWidgetInteraction ( double eventPos [ 2 ] ) override ; void WidgetInteraction ( double newEventPos [ 2 ] ) override ; void EndWidgetInteraction ( double newEventPos [ 2 ] ) override ; void StartComplexInteraction ( vtkRenderWindowInteractor * iren , vtkAbstractWidget * widget , unsigned long event , void * calldata ) override ; void ComplexInteraction ( vtkRenderWindowInteractor * iren , vtkAbstractWidget * widget , unsigned long event , void * calldata ) override ; int ComputeComplexInteractionState ( vtkRenderWindowInteractor * iren , vtkAbstractWidget * widget , unsigned long event , void * calldata , int modify = 0 ) override ; void EndComplexInteraction ( vtkRenderWindowInteractor * iren , vtkAbstractWidget * widget , unsigned long event , void * calldata ) override ; /@} /@{ *
##  Methods supporting the rendering process.
##  double * GetBounds ( ) VTK_SIZEHINT ( 6 ) override ; void GetActors ( vtkPropCollection * pc ) override ; void ReleaseGraphicsResources ( vtkWindow * ) override ; int RenderOpaqueGeometry ( vtkViewport * ) override ; int RenderTranslucentPolygonalGeometry ( vtkViewport * ) override ; vtkTypeBool HasTranslucentPolygonalGeometry ( ) override ; /@}  Manage the state of the widget enum InteractionStateType { Outside = 0 , Moving , MovingOutline , MovingOrigin , Rotating , Pushing , ResizeDiskRadius , Scaling } ; # ! defined ( VTK_LEGACY_REMOVE ) [NewLine] VTK_DEPRECATED_IN_9_2_0 ( because leading underscore is reserved ) typedef InteractionStateType _InteractionState ; # [NewLine] /@{ *
##  The interaction state may be set from a widget (e.g.,
##  vtkDisplaySizedImplicitPlaneWidget) or other object. This controls how the
##  interaction with the widget proceeds. Normally this method is used as
##  part of a handshaking process with the widget: First
##  ComputeInteractionState() is invoked that returns a state based on
##  geometric considerations (i.e., cursor near a widget feature), then
##  based on events, the widget may modify this further.
##  virtual void SetBumpDistanceInteractionState ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << InteractionState  to  << _arg ) ; if ( this -> InteractionState != ( _arg < Outside ? Outside : ( _arg > Scaling ? Scaling : _arg ) ) ) { this -> InteractionState = ( _arg < Outside ? Outside : ( _arg > Scaling ? Scaling : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetBumpDistanceMinValueInteractionStateMinValue ( ) { return Outside ; } virtual int GetBumpDistanceMaxValueInteractionStateMaxValue ( ) { return Scaling ; } ; /@} /@{ *
##  Sets the visual appearance of the representation based on the
##  state it is in. This state is usually the same as InteractionState.
##  virtual void SetRepresentationState ( int ) ; virtual int GetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraRadiusMultiplierDrawPlaneDrawOutlineDrawIntersectionEdgesOutlineTranslationOutsideBoundsConstrainToWidgetBoundsConstrainMaximumSizeToWidgetBoundsScaleEnabledBumpDistancePickCameraFocalInfoRepresentationState ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RepresentationState  of  << this -> RepresentationState ) ; return this -> RepresentationState ; } ; /@}  Get the underlying implicit plane object used by this rep
##  that can be used as a cropping plane in vtkMapper. vtkPlane * GetUnderlyingPlane ( ) { return this -> Plane ; } /@{ *
##  For complex events should we snap orientations to
##  be aligned with the x y z axes.
##  virtual bool GetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraRadiusMultiplierDrawPlaneDrawOutlineDrawIntersectionEdgesOutlineTranslationOutsideBoundsConstrainToWidgetBoundsConstrainMaximumSizeToWidgetBoundsScaleEnabledBumpDistancePickCameraFocalInfoRepresentationStateSnapToAxes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SnapToAxes  of  << this -> SnapToAxes ) ; return this -> SnapToAxes ; } ; virtual void SetOutlineTranslationOutsideBoundsConstrainToWidgetBoundsConstrainMaximumSizeToWidgetBoundsScaleEnabledPickCameraFocalInfoSnapToAxes ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SnapToAxes  to  << _arg ) ; if ( this -> SnapToAxes != _arg ) { this -> SnapToAxes = _arg ; this -> Modified ( ) ; } } ; virtual void SnapToAxesOn ( ) { this -> SetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraDrawPlaneDrawOutlineDrawIntersectionEdgesOutlineTranslationOutsideBoundsConstrainToWidgetBoundsConstrainMaximumSizeToWidgetBoundsScaleEnabledPickCameraFocalInfoSnapToAxes ( static_cast < bool > ( 1 ) ) ; } virtual void SnapToAxesOff ( ) { this -> SetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraDrawPlaneDrawOutlineDrawIntersectionEdgesOutlineTranslationOutsideBoundsConstrainToWidgetBoundsConstrainMaximumSizeToWidgetBoundsScaleEnabledPickCameraFocalInfoSnapToAxes ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Forces the plane's normal to be aligned with x, y or z axis.
##  The alignment happens when calling SetNormal.
##  It defers with SnapToAxes from it is always applicable, and SnapToAxes
##  only snaps when the angle difference exceeds 16 degrees in complex interactions.
##  virtual bool GetNormalToXAxisNormalToYAxisNormalToZAxisLockNormalToCameraRadiusMultiplierDrawPlaneDrawOutlineDrawIntersectionEdgesOutlineTranslationOutsideBoundsConstrainToWidgetBoundsConstrainMaximumSizeToWidgetBoundsScaleEnabledBumpDistancePickCameraFocalInfoRepresentationStateSnapToAxesAlwaysSnapToNearestAxis ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AlwaysSnapToNearestAxis  of  << this -> AlwaysSnapToNearestAxis ) ; return this -> AlwaysSnapToNearestAxis ; } ; virtual void SetAlwaysSnapToNearestAxis ( bool snap ) { this -> AlwaysSnapToNearestAxis = snap ; this -> SetNormal ( this -> GetNormal ( ) ) ; } /@} protected : vtkDisplaySizedImplicitPlaneRepresentation ( ) ; ~ vtkDisplaySizedImplicitPlaneRepresentation ( ) override ; int RepresentationState ;  Keep track of event positions double LastEventPosition [ 3 ] ; double LastEventOrientation [ 4 ] ; double StartEventOrientation [ 4 ] ;  Controlling ivars vtkTypeBool NormalToXAxis ; vtkTypeBool NormalToYAxis ; vtkTypeBool NormalToZAxis ; double SnappedEventOrientation [ 4 ] ; bool SnappedOrientation ; bool SnapToAxes ; bool AlwaysSnapToNearestAxis ; bool PickCameraFocalInfo ;  Locking normal to camera vtkTypeBool LockNormalToCamera ;  Controlling the push operation double BumpDistance ; int TranslationAxis ;  The bounding box is represented by a single voxel image data vtkNew < vtkImageData > Box ; vtkNew < vtkOutlineFilter > Outline ; vtkNew < vtkPolyDataMapper > OutlineMapper ; vtkNew < vtkActor > OutlineActor ; vtkTypeBool OutlineTranslation ;  whether the outline can be moved vtkTypeBool ScaleEnabled ;  whether the widget can be scaled vtkTypeBool OutsideBounds ;  whether the widget can be moved outside input's bounds double WidgetBounds [ 6 ] ; vtkTypeBool ConstrainToWidgetBounds ;  whether the widget can be moved outside input's bounds vtkTypeBool ConstrainMaximumSizeToWidgetBounds ;  whether the maximum widget size is constrained vtkTypeBool DrawOutline ;  whether to draw the outline void HighlightOutline ( int highlight ) ;  The plane double RadiusMultiplier ; vtkNew < vtkPlane > Plane ; vtkNew < vtkDiskSource > DiskPlaneSource ; vtkNew < vtkPolyDataMapper > PlaneMapper ; vtkNew < vtkActor > PlaneActor ; vtkTypeBool DrawPlane ; void HighlightPlane ( int highlight ) ;  plane boundary edges are represented as tubes vtkNew < vtkFeatureEdges > Edges ; vtkNew < vtkTubeFilter > EdgesTuber ; vtkNew < vtkPolyDataMapper > EdgesMapper ; vtkNew < vtkActor > EdgesActor ; void HighlightEdges ( int highlight ) ; /@{ *
##  Set color to the edges
##  void SetEdgesColor ( vtkLookupTable * ) ; void SetEdgesColor ( double , double , double ) ; void SetEdgesColor ( double c [ 3 ] ) ; /@}  The intersection edges with the outline vtkNew < vtkCutter > Cutter ; vtkNew < vtkFeatureEdges > IntersectionEdges ; vtkNew < vtkTubeFilter > IntersectionEdgesTuber ; vtkNew < vtkPolyDataMapper > IntersectionEdgesMapper ; vtkNew < vtkActor > IntersectionEdgesActor ; vtkTypeBool DrawIntersectionEdges ; /@{ *
##  Set color to the intersection edges
##  void SetIntersectionEdgesColor ( vtkLookupTable * ) ; void SetIntersectionEdgesColor ( double , double , double ) ; void SetIntersectionEdgesColor ( double c [ 3 ] ) ; /@}  The + normal cone vtkNew < vtkConeSource > ConeSource ; vtkNew < vtkPolyDataMapper > ConeMapper ; vtkNew < vtkActor > ConeActor ; void HighlightNormal ( int highlight ) ;  The normal line vtkNew < vtkLineSource > LineSource ; vtkNew < vtkPolyDataMapper > LineMapper ; vtkNew < vtkActor > LineActor ;  The - normal cone vtkNew < vtkConeSource > ConeSource2 ; vtkNew < vtkPolyDataMapper > ConeMapper2 ; vtkNew < vtkActor > ConeActor2 ;  The origin positioning handle vtkNew < vtkSphereSource > Sphere ; vtkNew < vtkPolyDataMapper > SphereMapper ; vtkNew < vtkActor > SphereActor ; void HighlightSphere ( int highlight ) ;  Do the picking vtkNew < vtkHardwarePicker > HardwarePicker ;  Used for picking rendered props (screen) vtkNew < vtkCellPicker > CellPicker ;  Used for picking widget props (screen and VR)  Compute Cell Picker tolerance void ComputeAdaptivePickerTolerance ( ) ;  Register internal Pickers within PickingManager void RegisterPickers ( ) override ;  Transform the normal (used for rotation) vtkNew < vtkTransform > Transform ;  Methods to manipulate the plane void Rotate ( double X , double Y , double * p1 , double * p2 , double * vpn ) ; void Rotate3D ( double * p1 , double * p2 ) ; void TranslateOutline ( double * p1 , double * p2 ) ; void TranslateOrigin ( double * p1 , double * p2 ) ; void UpdatePose ( double * p1 , double * d1 , double * p2 , double * d2 ) ; void Push ( double * p1 , double * p2 ) ; void ResizeRadius ( double * p1 , double * p2 , double * vpn ) ; void ResizeRadius3D ( double * p1 , double * p2 ) ; void Scale ( double * p1 , double * p2 , double X , double Y ) ; void SizeHandles ( ) ;  Properties used to control the appearance of selected objects and
##  the manipulator in general. vtkNew < vtkProperty > NormalProperty ; vtkNew < vtkProperty > SelectedNormalProperty ; vtkNew < vtkProperty > SphereProperty ; vtkNew < vtkProperty > SelectedSphereProperty ; vtkNew < vtkProperty > PlaneProperty ; vtkNew < vtkProperty > SelectedPlaneProperty ; vtkNew < vtkProperty > OutlineProperty ; vtkNew < vtkProperty > SelectedOutlineProperty ; vtkNew < vtkProperty > EdgesProperty ; vtkNew < vtkProperty > SelectedEdgesProperty ; vtkNew < vtkProperty > IntersectionEdgesProperty ; virtual void CreateDefaultProperties ( ) ;  Support GetBounds() method vtkNew < vtkBox > BoundingBox ; private : vtkDisplaySizedImplicitPlaneRepresentation ( const vtkDisplaySizedImplicitPlaneRepresentation & ) = delete ; void operator = ( const vtkDisplaySizedImplicitPlaneRepresentation & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
