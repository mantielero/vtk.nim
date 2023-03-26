## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMeasurementCubeHandleRepresentation3D.h
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
##  @class   vtkMeasurementCubeHandleRepresentation3D
##  @brief   represent a unit cube for measuring/comparing to data.
##
##  @sa
##  vtkPolygonalHandleRepresentation3D vtkHandleRepresentation vtkHandleWidget
##

## !!!Ignored construct:  # vtkMeasurementCubeHandleRepresentation3D_h [NewLine] # vtkMeasurementCubeHandleRepresentation3D_h [NewLine] # vtkHandleRepresentation.h [NewLine] # vtkInteractionWidgetsModule.h  For export macro [NewLine] class vtkProperty ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkPolyDataMapper"
discard "forward decl of vtkCellPicker"
discard "forward decl of vtkTransformPolyDataFilter"
discard "forward decl of vtkMatrixToLinearTransform"
discard "forward decl of vtkMatrix4x4"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkAbstractTransform"
discard "forward decl of vtkActor"
discard "forward decl of vtkFollower"
discard "forward decl of vtkBillboardTextActor3D"
## !!!Ignored construct:  class VTKINTERACTIONWIDGETS_EXPORT vtkMeasurementCubeHandleRepresentation3D : public vtkHandleRepresentation { public : *
##  Instantiate this class.
##  static vtkMeasurementCubeHandleRepresentation3D * New ( ) ; /@{ *
##  Standard methods for instances of this class.
##  protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkHandleRepresentation Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkHandleRepresentation :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkMeasurementCubeHandleRepresentation3D :: IsTypeOf ( type ) ; } static vtkMeasurementCubeHandleRepresentation3D * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkMeasurementCubeHandleRepresentation3D * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkMeasurementCubeHandleRepresentation3D * NewInstance ( ) const { return vtkMeasurementCubeHandleRepresentation3D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHandleRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMeasurementCubeHandleRepresentation3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMeasurementCubeHandleRepresentation3D :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Set the position of the point in world and display coordinates.
##  void SetWorldPosition ( double p [ 3 ] ) override ; void SetDisplayPosition ( double p [ 3 ] ) override ; /@} /@{ *
##  Get the handle polydata.
##  vtkPolyData * GetHandle ( ) ; /@} /@{ *
##  Set/Get the handle properties when unselected and selected.
##  void SetProperty ( vtkProperty * ) ; void SetSelectedProperty ( vtkProperty * ) ; virtual vtkProperty * GetnameProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Property  address  << static_cast < vtkProperty * > ( this -> Property ) ) ; return this -> Property ; } ; virtual vtkProperty * GetnamePropertySelectedProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  SelectedProperty  address  << static_cast < vtkProperty * > ( this -> SelectedProperty ) ) ; return this -> SelectedProperty ; } ; /@} *
##  Get the transform used to transform the generic handle polydata before
##  placing it in the render window
##  virtual vtkAbstractTransform * GetTransform ( ) ; /@{ *
##  Methods to make this class properly act like a vtkWidgetRepresentation.
##  void BuildRepresentation ( ) override ; void StartWidgetInteraction ( double eventPos [ 2 ] ) override ; void WidgetInteraction ( double eventPos [ 2 ] ) override ; int ComputeInteractionState ( int X , int Y , int modify = 0 ) override ; /@} /@{ *
##  Methods to make this class behave as a vtkProp.
##  void ShallowCopy ( vtkProp * prop ) override ; void DeepCopy ( vtkProp * prop ) override ; void GetActors ( vtkPropCollection * ) override ; void ReleaseGraphicsResources ( vtkWindow * ) override ; int RenderOpaqueGeometry ( vtkViewport * viewport ) override ; int RenderTranslucentPolygonalGeometry ( vtkViewport * viewport ) override ; vtkTypeBool HasTranslucentPolygonalGeometry ( ) override ; double * GetBounds ( ) override ; /@} /@{ *
##  A label may be associated with the cube. The string can be set via
##  SetLabelText. The visibility of the label can be turned on / off.
##  virtual void SetLabelVisibility ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  LabelVisibility  to  << _arg ) ; if ( this -> LabelVisibility != _arg ) { this -> LabelVisibility = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetLabelVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LabelVisibility  of  << this -> LabelVisibility ) ; return this -> LabelVisibility ; } ; virtual void LabelVisibilityOn ( ) { this -> SetLabelVisibility ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void LabelVisibilityOff ( ) { this -> SetLabelVisibility ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual void SetLabelVisibilitySelectedLabelVisibility ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SelectedLabelVisibility  to  << _arg ) ; if ( this -> SelectedLabelVisibility != _arg ) { this -> SelectedLabelVisibility = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetLabelVisibilitySelectedLabelVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SelectedLabelVisibility  of  << this -> SelectedLabelVisibility ) ; return this -> SelectedLabelVisibility ; } ; virtual void SelectedLabelVisibilityOn ( ) { this -> SetLabelVisibilitySelectedLabelVisibility ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void SelectedLabelVisibilityOff ( ) { this -> SetLabelVisibilitySelectedLabelVisibility ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual void SetLabelTextInput ( const char * label ) ; virtual char * GetLabelTextInput ( ) ; /@} /@{ *
##  Get the label text actor
##  virtual vtkBillboardTextActor3D * GetnamePropertySelectedPropertyLabelText ( ) { vtkDebugWithObjectMacro ( this , <<  returning  LabelText  address  << static_cast < vtkBillboardTextActor3D * > ( this -> LabelText ) ) ; return this -> LabelText ; } ; /@} /@{ *
##  Toggle the visibility of the handle on and off
##  virtual void SetLabelVisibilitySelectedLabelVisibilityHandleVisibility ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  HandleVisibility  to  << _arg ) ; if ( this -> HandleVisibility != _arg ) { this -> HandleVisibility = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetLabelVisibilitySelectedLabelVisibilityHandleVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HandleVisibility  of  << this -> HandleVisibility ) ; return this -> HandleVisibility ; } ; virtual void HandleVisibilityOn ( ) { this -> SetLabelVisibilitySelectedLabelVisibilityHandleVisibility ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void HandleVisibilityOff ( ) { this -> SetLabelVisibilitySelectedLabelVisibilityHandleVisibility ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Toggle highlighting (used when the cube is selected).
##  void Highlight ( int highlight ) override ; /@} /@{ *
##  Turn on/off smooth motion of the handle. See the documentation of
##  MoveFocusRequest for details. By default, SmoothMotion is ON. However,
##  in certain applications the user may want to turn it off. For instance
##  when using certain specific PointPlacer's with the representation such
##  as the vtkCellCentersPointPlacer, which causes the representation to
##  snap to the center of cells. In such cases, inherent restrictions on
##  handle placement might conflict with a request for smooth motion of the
##  handles.
##  virtual void SetLabelVisibilitySelectedLabelVisibilityHandleVisibilitySmoothMotion ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SmoothMotion  to  << _arg ) ; if ( this -> SmoothMotion != _arg ) { this -> SmoothMotion = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetLabelVisibilitySelectedLabelVisibilityHandleVisibilitySmoothMotion ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SmoothMotion  of  << this -> SmoothMotion ) ; return this -> SmoothMotion ; } ; virtual void SmoothMotionOn ( ) { this -> SetLabelVisibilitySelectedLabelVisibilityHandleVisibilitySmoothMotion ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void SmoothMotionOff ( ) { this -> SetLabelVisibilitySelectedLabelVisibilityHandleVisibilitySmoothMotion ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set the length of a side of the cube (default is 1).
##  void SetSideLength ( double ) ; virtual double GetLabelVisibilitySelectedLabelVisibilityHandleVisibilitySmoothMotionSideLength ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SideLength  of  << this -> SideLength ) ; return this -> SideLength ; } ; /@} /@{ *
##  Turn on/off adaptive scaling for the cube.
##  virtual void SetLabelVisibilitySelectedLabelVisibilityHandleVisibilitySmoothMotionAdaptiveScaling ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  AdaptiveScaling  to  << _arg ) ; if ( this -> AdaptiveScaling != _arg ) { this -> AdaptiveScaling = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetLabelVisibilitySelectedLabelVisibilityHandleVisibilitySmoothMotionSideLengthAdaptiveScaling ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AdaptiveScaling  of  << this -> AdaptiveScaling ) ; return this -> AdaptiveScaling ; } ; virtual void AdaptiveScalingOn ( ) { this -> SetLabelVisibilitySelectedLabelVisibilityHandleVisibilitySmoothMotionAdaptiveScaling ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void AdaptiveScalingOff ( ) { this -> SetLabelVisibilitySelectedLabelVisibilityHandleVisibilitySmoothMotionAdaptiveScaling ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the rescaling increment for the cube. This value is applied to
##  each dimension, so volume scaling = std::pow(RescaleFactor, 3).
##  virtual void SetRescaleFactor ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << RescaleFactor  to  << _arg ) ; if ( this -> RescaleFactor != ( _arg < 1.0 ? 1.0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ) { this -> RescaleFactor = ( _arg < 1.0 ? 1.0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetRescaleFactorMinValue ( ) { return 1.0 ; } virtual double GetRescaleFactorMaxValue ( ) { return VTK_DOUBLE_MAX ; } ; virtual double GetLabelVisibilitySelectedLabelVisibilityHandleVisibilitySmoothMotionSideLengthAdaptiveScalingRescaleFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RescaleFactor  of  << this -> RescaleFactor ) ; return this -> RescaleFactor ; } ; /@} /@{ *
##  Set the min/max cube representational area relative to the render window
##  area. If adaptive scaling is on and the cube's image is outside of these
##  bounds, the cube is adaptively scaled. The max and min relative cube sizes
##  are clamped between 1. and 1.e-6, and MaxRelativeubeSize must be more than
##  \c RescaleFactor greater than MinRelativeCubeScreenArea.
##  void SetMinRelativeCubeScreenArea ( double ) ; virtual double GetLabelVisibilitySelectedLabelVisibilityHandleVisibilitySmoothMotionSideLengthAdaptiveScalingRescaleFactorMinRelativeCubeScreenArea ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MinRelativeCubeScreenArea  of  << this -> MinRelativeCubeScreenArea ) ; return this -> MinRelativeCubeScreenArea ; } ; void SetMaxRelativeCubeScreenArea ( double ) ; virtual double GetLabelVisibilitySelectedLabelVisibilityHandleVisibilitySmoothMotionSideLengthAdaptiveScalingRescaleFactorMinRelativeCubeScreenAreaMaxRelativeCubeScreenArea ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaxRelativeCubeScreenArea  of  << this -> MaxRelativeCubeScreenArea ) ; return this -> MaxRelativeCubeScreenArea ; } ; /@} /@{ *
##  Set the label for the unit of length of a side of the cube.
##  virtual void SetLengthUnit ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << LengthUnit  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> LengthUnit == nullptr && _arg == nullptr ) { return ; } if ( this -> LengthUnit && _arg && ( ! strcmp ( this -> LengthUnit , _arg ) ) ) { return ; } delete [ ] this -> LengthUnit ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> LengthUnit = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> LengthUnit = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetLengthUnit ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << LengthUnit  of  << ( this -> LengthUnit ? this -> LengthUnit : (null) ) ) ; return this -> LengthUnit ; } ; /@}
##  Register internal Pickers within PickingManager
##  void RegisterPickers ( ) override ; protected : vtkMeasurementCubeHandleRepresentation3D ( ) ; ~ vtkMeasurementCubeHandleRepresentation3D ( ) override ; vtkActor * Actor ; vtkPolyDataMapper * Mapper ; vtkTransformPolyDataFilter * HandleTransformFilter ; vtkMatrixToLinearTransform * HandleTransform ; vtkMatrix4x4 * HandleTransformMatrix ; vtkCellPicker * HandlePicker ; double LastPickPosition [ 3 ] ; double LastEventPosition [ 2 ] ; vtkProperty * Property ; vtkProperty * SelectedProperty ; int WaitingForMotion ; int WaitCount ; vtkTypeBool HandleVisibility ; double Offset [ 3 ] ; vtkTypeBool AdaptiveScaling ; double RescaleFactor ; double MinRelativeCubeScreenArea ; double MaxRelativeCubeScreenArea ; double SideLength ; char * LengthUnit ;  Methods to manipulate the cursor virtual void Scale ( const double * p1 , const double * p2 , const double eventPos [ 2 ] ) ; virtual void MoveFocus ( const double * p1 , const double * p2 ) ; void CreateDefaultProperties ( ) ; *
##  If adaptive scaling is enabled, rescale the cube so that its
##  representational area in the display window falls between
##  \c MinRelativeCubeScreenArea and \c MaxRelativeCubeScreenArea.
##  void ScaleIfNecessary ( vtkViewport * ) ; *
##  Given a motion vector defined by p1 --> p2 (p1 and p2 are in
##  world coordinates), the new display position of the handle center is
##  populated into requestedDisplayPos. This is again only a request for the
##  new display position. It is up to the point placer to deduce the
##  appropriate world co-ordinates that this display position will map into.
##  The placer may even disallow such a movement.
##  If "SmoothMotion" is OFF, the returned requestedDisplayPos is the same
##  as the event position, ie the location of the mouse cursor. If its OFF,
##  incremental offsets as described above are used to compute it.
##  void MoveFocusRequest ( const double * p1 , const double * p2 , const double eventPos [ 2 ] , double requestedDisplayPos [ 3 ] ) ; *
##  The handle may be scaled uniformly in all three dimensions using this
##  API. The handle can also be scaled interactively using the right
##  mouse button.
##  virtual void SetUniformScale ( double scale ) ; *
##  Update the actor position. Different subclasses handle this differently.
##  For instance vtkPolygonalHandleRepresentation3D updates the handle
##  transformation and sets this on the handle.
##  vtkOrientedPolygonalHandleRepresentation3D, which uses a vtkFollower to
##  keep the handle geometry facinig the camera handles this differently. This
##  is an opportunity for subclasses to update the actor's position etc each
##  time the handle is rendered.
##  virtual void UpdateHandle ( ) ; *
##  Opportunity to update the label position and text during each render.
##  virtual void UpdateLabel ( ) ;  Handle the label. vtkTypeBool LabelVisibility ; vtkTypeBool SelectedLabelVisibility ; vtkBillboardTextActor3D * LabelText ; bool LabelAnnotationTextScaleInitialized ; vtkTypeBool SmoothMotion ; private : vtkMeasurementCubeHandleRepresentation3D ( const vtkMeasurementCubeHandleRepresentation3D & ) = delete ; void operator = ( const vtkMeasurementCubeHandleRepresentation3D & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
