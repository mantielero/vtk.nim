## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImagePlaneWidget.h
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
##  @class   vtkImagePlaneWidget
##  @brief   3D widget for reslicing image data
##
##  This 3D widget defines a plane that can be interactively placed in an
##  image volume. A nice feature of the object is that the
##  vtkImagePlaneWidget, like any 3D widget, will work with the current
##  interactor style. That is, if vtkImagePlaneWidget does not handle an
##  event, then all other registered observers (including the interactor
##  style) have an opportunity to process the event. Otherwise, the
##  vtkImagePlaneWidget will terminate the processing of the event that it
##  handles.
##
##  The core functionality of the widget is provided by a vtkImageReslice
##  object which passes its output onto a texture mapping pipeline for fast
##  slicing through volumetric data. See the key methods: GenerateTexturePlane()
##  and UpdatePlane() for implementation details.
##
##  To use this object, just invoke SetInteractor() with the argument of the
##  method a vtkRenderWindowInteractor.  You may also wish to invoke
##  "PlaceWidget()" to initially position the widget. If the "i" key (for
##  "interactor") is pressed, the vtkImagePlaneWidget will appear. (See
##  superclass documentation for information about changing this behavior.)
##
##  Selecting the widget with the middle mouse button with and without holding
##  the shift or control keys enables complex reslicing capablilites.
##  To facilitate use, a set of 'margins' (left, right, top, bottom) are shown as
##  a set of plane-axes aligned lines, the properties of which can be changed
##  as a group.
##  Without keyboard modifiers: selecting in the middle of the margins
##  enables translation of the plane along its normal. Selecting one of the
##  corners within the margins enables spinning around the plane's normal at its
##  center.  Selecting within a margin allows rotating about the center of the
##  plane around an axis aligned with the margin (i.e., selecting left margin
##  enables rotating around the plane's local y-prime axis).
##  With control key modifier: margin selection enables edge translation (i.e., a
##  constrained form of scaling). Selecting within the margins enables
##  translation of the entire plane.
##  With shift key modifier: uniform plane scaling is enabled.  Moving the mouse
##  up enlarges the plane while downward movement shrinks it.
##
##  Window-level is achieved by using the right mouse button.  Window-level
##  values can be reset by shift + 'r' or control + 'r' while regular reset
##  camera is maintained with 'r' or 'R'.
##  The left mouse button can be used to query the underlying image data
##  with a snap-to cross-hair cursor.  Currently, the nearest point in the input
##  image data to the mouse cursor generates the cross-hairs.  With oblique
##  slicing, this behaviour may appear unsatisfactory. Text display of
##  window-level and image coordinates/data values are provided by a text
##  actor/mapper pair.
##
##  Events that occur outside of the widget (i.e., no part of the widget is
##  picked) are propagated to any other registered obsevers (such as the
##  interaction style). Turn off the widget by pressing the "i" key again
##  (or invoke the Off() method). To support interactive manipulation of
##  objects, this class invokes the events StartInteractionEvent,
##  InteractionEvent, and EndInteractionEvent as well as StartWindowLevelEvent,
##  WindowLevelEvent, EndWindowLevelEvent and ResetWindowLevelEvent.
##
##  The vtkImagePlaneWidget has several methods that can be used in
##  conjunction with other VTK objects. The GetPolyData() method can be used
##  to get the polygonal representation of the plane and can be used as input
##  for other VTK objects. Typical usage of the widget is to make use of the
##  StartInteractionEvent, InteractionEvent, and EndInteractionEvent
##  events. The InteractionEvent is called on mouse motion; the other two
##  events are called on button down and button up (either left or right
##  button).
##
##  Some additional features of this class include the ability to control the
##  properties of the widget. You can set the properties of: the selected and
##  unselected representations of the plane's outline; the text actor via its
##  vtkTextProperty; the cross-hair cursor. In addition there are methods to
##  constrain the plane so that it is aligned along the x-y-z axes.  Finally,
##  one can specify the degree of interpolation (vtkImageReslice): nearest
##  neighbour, linear, and cubic.
##
##  A simpler version of this widget is the combination of
##  vtkImplicitPlaneWidget2 combined with the representation
##  vtkImplicitImageRepresentation.
##
##  @par Thanks:
##  Thanks to Dean Inglis for developing and contributing this class.
##  Based on the Python SlicePlaneFactory from Atamai, Inc.
##
##  @sa
##  vtk3DWidget vtkBoxWidget vtkLineWidget  vtkPlaneWidget vtkPointWidget
##  vtkPolyDataSourceWidget vtkSphereWidget vtkImplicitPlaneWidget
##  vtkImplicitPlaneWidget2 vtkImplicitImageRepresentation
##

## !!!Ignored construct:  # vtkImagePlaneWidget_h [NewLine] # vtkImagePlaneWidget_h [NewLine] # vtkInteractionWidgetsModule.h  For export macro # vtkPolyDataSourceWidget.h [NewLine] class vtkActor ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkAbstractPropPicker"
discard "forward decl of vtkDataSetMapper"
discard "forward decl of vtkImageData"
discard "forward decl of vtkImageMapToColors"
discard "forward decl of vtkImageReslice"
discard "forward decl of vtkLookupTable"
discard "forward decl of vtkMatrix4x4"
discard "forward decl of vtkPlaneSource"
discard "forward decl of vtkPoints"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkProperty"
discard "forward decl of vtkTextActor"
discard "forward decl of vtkTextProperty"
discard "forward decl of vtkTexture"
discard "forward decl of vtkTransform"
const
  VTK_NEAREST_RESLICE* = 0
  VTK_LINEAR_RESLICE* = 1
  VTK_CUBIC_RESLICE* = 2

##  Private.

const
  VTK_IMAGE_PLANE_WIDGET_MAX_TEXTBUFF* = 128

## !!!Ignored construct:  class VTKINTERACTIONWIDGETS_EXPORT vtkImagePlaneWidget : public vtkPolyDataSourceWidget { public : *
##  Instantiate the object.
##  static vtkImagePlaneWidget * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataSourceWidget Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataSourceWidget :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImagePlaneWidget :: IsTypeOf ( type ) ; } static vtkImagePlaneWidget * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImagePlaneWidget * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImagePlaneWidget * NewInstance ( ) const { return vtkImagePlaneWidget :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataSourceWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImagePlaneWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImagePlaneWidget :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Methods that satisfy the superclass' API.
##  void SetEnabled ( int ) override ; void PlaceWidget ( double bounds [ 6 ] ) override ; void PlaceWidget ( ) override { this -> Superclass :: PlaceWidget ( ) ; } void PlaceWidget ( double xmin , double xmax , double ymin , double ymax , double zmin , double zmax ) override { this -> Superclass :: PlaceWidget ( xmin , xmax , ymin , ymax , zmin , zmax ) ; } /@} *
##  Set the vtkImageData* input for the vtkImageReslice.
##  void SetInputConnection ( vtkAlgorithmOutput * aout ) override ; /@{ *
##  Set/Get the origin of the plane.
##  void SetOrigin ( double x , double y , double z ) ; void SetOrigin ( double xyz [ 3 ] ) ; double * GetOrigin ( ) VTK_SIZEHINT ( 3 ) ; void GetOrigin ( double xyz [ 3 ] ) ; /@} /@{ *
##  Set/Get the position of the point defining the first axis of the plane.
##  void SetPoint1 ( double x , double y , double z ) ; void SetPoint1 ( double xyz [ 3 ] ) ; double * GetPoint1 ( ) VTK_SIZEHINT ( 3 ) ; void GetPoint1 ( double xyz [ 3 ] ) ; /@} /@{ *
##  Set/Get the position of the point defining the second axis of the plane.
##  void SetPoint2 ( double x , double y , double z ) ; void SetPoint2 ( double xyz [ 3 ] ) ; double * GetPoint2 ( ) VTK_SIZEHINT ( 3 ) ; void GetPoint2 ( double xyz [ 3 ] ) ; /@} /@{ *
##  Get the center of the plane.
##  double * GetCenter ( ) VTK_SIZEHINT ( 3 ) ; void GetCenter ( double xyz [ 3 ] ) ; /@} /@{ *
##  Get the normal to the plane.
##  double * GetNormal ( ) VTK_SIZEHINT ( 3 ) ; void GetNormal ( double xyz [ 3 ] ) ; /@} *
##  Get the vector from the plane origin to point1.
##  void GetVector1 ( double v1 [ 3 ] ) ; *
##  Get the vector from the plane origin to point2.
##  void GetVector2 ( double v2 [ 3 ] ) ; *
##  Get the slice position in terms of the data extent.
##  int GetSliceIndex ( ) ; *
##  Set the slice position in terms of the data extent.
##  void SetSliceIndex ( int index ) ; *
##  Get the position of the slice along its normal.
##  double GetSlicePosition ( ) ; *
##  Set the position of the slice along its normal.
##  void SetSlicePosition ( double position ) ; /@{ *
##  Set the interpolation to use when texturing the plane.
##  void SetResliceInterpolate ( int ) ; virtual int GetResliceInterpolate ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ResliceInterpolate  of  << this -> ResliceInterpolate ) ; return this -> ResliceInterpolate ; } ; void SetResliceInterpolateToNearestNeighbour ( ) { this -> SetResliceInterpolate ( VTK_NEAREST_RESLICE ) ; } void SetResliceInterpolateToLinear ( ) { this -> SetResliceInterpolate ( VTK_LINEAR_RESLICE ) ; } void SetResliceInterpolateToCubic ( ) { this -> SetResliceInterpolate ( VTK_CUBIC_RESLICE ) ; } /@} *
##  Convenience method to get the vtkImageReslice output.
##  vtkImageData * GetResliceOutput ( ) ; /@{ *
##  Make sure that the plane remains within the volume.
##  Default is On.
##  virtual void SetRestrictPlaneToVolume ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  RestrictPlaneToVolume  to  << _arg ) ; if ( this -> RestrictPlaneToVolume != _arg ) { this -> RestrictPlaneToVolume = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetResliceInterpolateRestrictPlaneToVolume ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RestrictPlaneToVolume  of  << this -> RestrictPlaneToVolume ) ; return this -> RestrictPlaneToVolume ; } ; virtual void RestrictPlaneToVolumeOn ( ) { this -> SetRestrictPlaneToVolume ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void RestrictPlaneToVolumeOff ( ) { this -> SetRestrictPlaneToVolume ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Let the user control the lookup table. NOTE: apply this method BEFORE
##  applying the SetLookupTable method.
##  Default is Off.
##  virtual void SetRestrictPlaneToVolumeUserControlledLookupTable ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UserControlledLookupTable  to  << _arg ) ; if ( this -> UserControlledLookupTable != _arg ) { this -> UserControlledLookupTable = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetResliceInterpolateRestrictPlaneToVolumeUserControlledLookupTable ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UserControlledLookupTable  of  << this -> UserControlledLookupTable ) ; return this -> UserControlledLookupTable ; } ; virtual void UserControlledLookupTableOn ( ) { this -> SetRestrictPlaneToVolumeUserControlledLookupTable ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void UserControlledLookupTableOff ( ) { this -> SetRestrictPlaneToVolumeUserControlledLookupTable ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify whether to interpolate the texture or not. When off, the
##  reslice interpolation is nearest neighbour regardless of how the
##  interpolation is set through the API. Set before setting the
##  vtkImageData input. Default is On.
##  virtual void SetRestrictPlaneToVolumeUserControlledLookupTableTextureInterpolate ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  TextureInterpolate  to  << _arg ) ; if ( this -> TextureInterpolate != _arg ) { this -> TextureInterpolate = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetResliceInterpolateRestrictPlaneToVolumeUserControlledLookupTableTextureInterpolate ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TextureInterpolate  of  << this -> TextureInterpolate ) ; return this -> TextureInterpolate ; } ; virtual void TextureInterpolateOn ( ) { this -> SetRestrictPlaneToVolumeUserControlledLookupTableTextureInterpolate ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void TextureInterpolateOff ( ) { this -> SetRestrictPlaneToVolumeUserControlledLookupTableTextureInterpolate ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Control the visibility of the actual texture mapped reformatted plane.
##  in some cases you may only want the plane outline for example.
##  virtual void SetTextureVisibility ( vtkTypeBool ) ; virtual vtkTypeBool GetResliceInterpolateRestrictPlaneToVolumeUserControlledLookupTableTextureInterpolateTextureVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TextureVisibility  of  << this -> TextureVisibility ) ; return this -> TextureVisibility ; } ; virtual void TextureVisibilityOn ( ) { this -> SetRestrictPlaneToVolumeUserControlledLookupTableTextureInterpolateTextureVisibility ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void TextureVisibilityOff ( ) { this -> SetRestrictPlaneToVolumeUserControlledLookupTableTextureInterpolateTextureVisibility ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} *
##  Grab the polydata (including points) that defines the plane.  The
##  polydata consists of (res+1)*(res+1) points, and res*res quadrilateral
##  polygons, where res is the resolution of the plane. These point values
##  are guaranteed to be up-to-date when either the InteractionEvent or
##  EndInteraction events are invoked. The user provides the vtkPolyData and
##  the points and polygons are added to it.
##  void GetPolyData ( vtkPolyData * pd ) ; *
##  Satisfies superclass API.  This returns a pointer to the underlying
##  vtkPolyData.  Make changes to this before calling the initial PlaceWidget()
##  to have the initial placement follow suit.  Or, make changes after the
##  widget has been initialised and call UpdatePlacement() to realise.
##  vtkPolyDataAlgorithm * GetPolyDataAlgorithm ( ) override ; *
##  Satisfies superclass API.  This will change the state of the widget to
##  match changes that have been made to the underlying vtkPolyDataSource
##  void UpdatePlacement ( void ) override ; *
##  Convenience method to get the texture used by this widget.  This can be
##  used in external slice viewers.
##  vtkTexture * GetTexture ( ) ; /@{ *
##  Convenience method to get the vtkImageMapToColors filter used by this
##  widget.  The user can properly render other transparent actors in a
##  scene by calling the filter's SetOutputFormatToRGB and
##  PassAlphaToOutputOff.
##  virtual vtkImageMapToColors * GetnameColorMap ( ) { vtkDebugWithObjectMacro ( this , <<  returning  ColorMap  address  << static_cast < vtkImageMapToColors * > ( this -> ColorMap ) ) ; return this -> ColorMap ; } ; virtual void SetColorMap ( vtkImageMapToColors * ) ; /@} /@{ *
##  Set/Get the plane's outline properties. The properties of the plane's
##  outline when selected and unselected can be manipulated.
##  virtual void SetPlaneProperty ( vtkProperty * ) ; virtual vtkProperty * GetnameColorMapPlaneProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  PlaneProperty  address  << static_cast < vtkProperty * > ( this -> PlaneProperty ) ) ; return this -> PlaneProperty ; } ; virtual void SetSelectedPlaneProperty ( vtkProperty * ) ; virtual vtkProperty * GetnameColorMapPlanePropertySelectedPlaneProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  SelectedPlaneProperty  address  << static_cast < vtkProperty * > ( this -> SelectedPlaneProperty ) ) ; return this -> SelectedPlaneProperty ; } ; /@} /@{ *
##  Convenience method sets the plane orientation normal to the
##  x, y, or z axes.  Default is XAxes (0).
##  void SetPlaneOrientation ( int ) ; virtual int GetResliceInterpolateRestrictPlaneToVolumeUserControlledLookupTableTextureInterpolateTextureVisibilityPlaneOrientation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PlaneOrientation  of  << this -> PlaneOrientation ) ; return this -> PlaneOrientation ; } ; void SetPlaneOrientationToXAxes ( ) { this -> SetPlaneOrientation ( 0 ) ; } void SetPlaneOrientationToYAxes ( ) { this -> SetPlaneOrientation ( 1 ) ; } void SetPlaneOrientationToZAxes ( ) { this -> SetPlaneOrientation ( 2 ) ; } /@} *
##  Set the internal picker to one defined by the user.  In this way,
##  a set of three orthogonal planes can share the same picker so that
##  picking is performed correctly.  The default internal picker can be
##  re-set/allocated by setting to 0 (nullptr).
##  void SetPicker ( vtkAbstractPropPicker * ) ; /@{ *
##  Set/Get the internal lookuptable (lut) to one defined by the user, or,
##  alternatively, to the lut of another vtkImgePlaneWidget.  In this way,
##  a set of three orthogonal planes can share the same lut so that
##  window-levelling is performed uniformly among planes.  The default
##  internal lut can be re- set/allocated by setting to 0 (nullptr).
##  virtual void SetLookupTable ( vtkLookupTable * ) ; virtual vtkLookupTable * GetnameColorMapPlanePropertySelectedPlanePropertyLookupTable ( ) { vtkDebugWithObjectMacro ( this , <<  returning  LookupTable  address  << static_cast < vtkLookupTable * > ( this -> LookupTable ) ) ; return this -> LookupTable ; } ; /@} /@{ *
##  Enable/disable text display of window-level, image coordinates and
##  scalar values in a render window.
##  virtual void SetRestrictPlaneToVolumeUserControlledLookupTableTextureInterpolateDisplayText ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  DisplayText  to  << _arg ) ; if ( this -> DisplayText != _arg ) { this -> DisplayText = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetResliceInterpolateRestrictPlaneToVolumeUserControlledLookupTableTextureInterpolateTextureVisibilityPlaneOrientationDisplayText ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DisplayText  of  << this -> DisplayText ) ; return this -> DisplayText ; } ; virtual void DisplayTextOn ( ) { this -> SetRestrictPlaneToVolumeUserControlledLookupTableTextureInterpolateTextureVisibilityDisplayText ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void DisplayTextOff ( ) { this -> SetRestrictPlaneToVolumeUserControlledLookupTableTextureInterpolateTextureVisibilityDisplayText ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set the properties of the cross-hair cursor.
##  virtual void SetCursorProperty ( vtkProperty * ) ; virtual vtkProperty * GetnameColorMapPlanePropertySelectedPlanePropertyLookupTableCursorProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  CursorProperty  address  << static_cast < vtkProperty * > ( this -> CursorProperty ) ) ; return this -> CursorProperty ; } ; /@} /@{ *
##  Set the properties of the margins.
##  virtual void SetMarginProperty ( vtkProperty * ) ; virtual vtkProperty * GetnameColorMapPlanePropertySelectedPlanePropertyLookupTableCursorPropertyMarginProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  MarginProperty  address  << static_cast < vtkProperty * > ( this -> MarginProperty ) ) ; return this -> MarginProperty ; } ; /@} /@{ *
##  Set the size of the margins based on a percentage of the
##  plane's width and height, limited between 0 and 50%.
##  virtual void SetMarginSizeX ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << MarginSizeX  to  << _arg ) ; if ( this -> MarginSizeX != ( _arg < 0.0 ? 0.0 : ( _arg > 0.5 ? 0.5 : _arg ) ) ) { this -> MarginSizeX = ( _arg < 0.0 ? 0.0 : ( _arg > 0.5 ? 0.5 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetMarginSizeXMinValue ( ) { return 0.0 ; } virtual double GetMarginSizeXMaxValue ( ) { return 0.5 ; } ; virtual double GetResliceInterpolateRestrictPlaneToVolumeUserControlledLookupTableTextureInterpolateTextureVisibilityPlaneOrientationDisplayTextMarginSizeX ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MarginSizeX  of  << this -> MarginSizeX ) ; return this -> MarginSizeX ; } ; virtual void SetMarginSizeXMarginSizeY ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << MarginSizeY  to  << _arg ) ; if ( this -> MarginSizeY != ( _arg < 0.0 ? 0.0 : ( _arg > 0.5 ? 0.5 : _arg ) ) ) { this -> MarginSizeY = ( _arg < 0.0 ? 0.0 : ( _arg > 0.5 ? 0.5 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetMarginSizeXMinValueMarginSizeYMinValue ( ) { return 0.0 ; } virtual double GetMarginSizeXMaxValueMarginSizeYMaxValue ( ) { return 0.5 ; } ; virtual double GetResliceInterpolateRestrictPlaneToVolumeUserControlledLookupTableTextureInterpolateTextureVisibilityPlaneOrientationDisplayTextMarginSizeXMarginSizeY ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MarginSizeY  of  << this -> MarginSizeY ) ; return this -> MarginSizeY ; } ; /@} /@{ *
##  Set/Get the text property for the image data and window-level annotation.
##  void SetTextProperty ( vtkTextProperty * tprop ) ; vtkTextProperty * GetTextProperty ( ) ; /@} /@{ *
##  Set/Get the property for the resliced image.
##  virtual void SetTexturePlaneProperty ( vtkProperty * ) ; virtual vtkProperty * GetnameColorMapPlanePropertySelectedPlanePropertyLookupTableCursorPropertyMarginPropertyTexturePlaneProperty ( ) { vtkDebugWithObjectMacro ( this , <<  returning  TexturePlaneProperty  address  << static_cast < vtkProperty * > ( this -> TexturePlaneProperty ) ) ; return this -> TexturePlaneProperty ; } ; /@} /@{ *
##  Set/Get the current window and level values.  SetWindowLevel should
##  only be called after SetInput.  If a shared lookup table is being used,
##  a callback is required to update the window level values without having
##  to update the lookup table again.
##  void SetWindowLevel ( double window , double level , int copy = 0 ) ; void GetWindowLevel ( double wl [ 2 ] ) ; double GetWindow ( ) { return this -> CurrentWindow ; } double GetLevel ( ) { return this -> CurrentLevel ; } /@} *
##  Get the image coordinate position and voxel value.  Currently only
##  supports single component image data.
##  int GetCursorData ( double xyzv [ 4 ] ) ; *
##  Get the status of the cursor data.  If this returns 1 the
##  CurrentCursorPosition and CurrentImageValue will have current
##  data.  If it returns 0, these values are invalid.
##  int GetCursorDataStatus ( ) ; /@{ *
##  Get the current cursor position.  To be used in conjunction with
##  GetCursorDataStatus.
##  virtual double * GetCurrentCursorPosition ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << CurrentCursorPosition  pointer  << this -> CurrentCursorPosition ) ; return this -> CurrentCursorPosition ; } VTK_WRAPEXCLUDE virtual void GetCurrentCursorPosition ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> CurrentCursorPosition [ i ] ; } } ; /@} /@{ *
##  Get the current image value at the current cursor position.  To
##  be used in conjunction with GetCursorDataStatus.  The value is
##  VTK_DOUBLE_MAX when the data is invalid.
##  virtual double GetResliceInterpolateRestrictPlaneToVolumeUserControlledLookupTableTextureInterpolateTextureVisibilityPlaneOrientationDisplayTextMarginSizeXMarginSizeYCurrentImageValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CurrentImageValue  of  << this -> CurrentImageValue ) ; return this -> CurrentImageValue ; } ; /@} /@{ *
##  Get the current reslice class and reslice axes
##  virtual vtkMatrix4x4 * GetnameColorMapPlanePropertySelectedPlanePropertyLookupTableCursorPropertyMarginPropertyTexturePlanePropertyResliceAxes ( ) { vtkDebugWithObjectMacro ( this , <<  returning  ResliceAxes  address  << static_cast < vtkMatrix4x4 * > ( this -> ResliceAxes ) ) ; return this -> ResliceAxes ; } ; virtual vtkImageReslice * GetnameColorMapPlanePropertySelectedPlanePropertyLookupTableCursorPropertyMarginPropertyTexturePlanePropertyResliceAxesReslice ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Reslice  address  << static_cast < vtkImageReslice * > ( this -> Reslice ) ) ; return this -> Reslice ; } ; /@} /@{ *
##  Choose between voxel centered or continuous cursor probing.  With voxel
##  centered probing, the cursor snaps to the nearest voxel and the reported
##  cursor coordinates are extent based.  With continuous probing, voxel data
##  is interpolated using vtkDataSetAttributes' InterpolatePoint method and
##  the reported coordinates are 3D spatial continuous.
##  virtual void SetRestrictPlaneToVolumeUserControlledLookupTableTextureInterpolateDisplayTextUseContinuousCursor ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseContinuousCursor  to  << _arg ) ; if ( this -> UseContinuousCursor != _arg ) { this -> UseContinuousCursor = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetResliceInterpolateRestrictPlaneToVolumeUserControlledLookupTableTextureInterpolateTextureVisibilityPlaneOrientationDisplayTextMarginSizeXMarginSizeYCurrentImageValueUseContinuousCursor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseContinuousCursor  of  << this -> UseContinuousCursor ) ; return this -> UseContinuousCursor ; } ; virtual void UseContinuousCursorOn ( ) { this -> SetRestrictPlaneToVolumeUserControlledLookupTableTextureInterpolateTextureVisibilityDisplayTextUseContinuousCursor ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void UseContinuousCursorOff ( ) { this -> SetRestrictPlaneToVolumeUserControlledLookupTableTextureInterpolateTextureVisibilityDisplayTextUseContinuousCursor ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Enable/disable mouse interaction so the widget remains on display.
##  void SetInteraction ( vtkTypeBool interact ) ; virtual vtkTypeBool GetResliceInterpolateRestrictPlaneToVolumeUserControlledLookupTableTextureInterpolateTextureVisibilityPlaneOrientationDisplayTextMarginSizeXMarginSizeYCurrentImageValueUseContinuousCursorInteraction ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Interaction  of  << this -> Interaction ) ; return this -> Interaction ; } ; virtual void InteractionOn ( ) { this -> SetRestrictPlaneToVolumeUserControlledLookupTableTextureInterpolateTextureVisibilityDisplayTextUseContinuousCursorInteraction ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void InteractionOff ( ) { this -> SetRestrictPlaneToVolumeUserControlledLookupTableTextureInterpolateTextureVisibilityDisplayTextUseContinuousCursorInteraction ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set action associated to buttons.
##  enum { VTK_CURSOR_ACTION = 0 , VTK_SLICE_MOTION_ACTION = 1 , VTK_WINDOW_LEVEL_ACTION = 2 } ; virtual void SetMarginSizeXMarginSizeYLeftButtonAction ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << LeftButtonAction  to  << _arg ) ; if ( this -> LeftButtonAction != ( _arg < VTK_CURSOR_ACTION ? VTK_CURSOR_ACTION : ( _arg > VTK_WINDOW_LEVEL_ACTION ? VTK_WINDOW_LEVEL_ACTION : _arg ) ) ) { this -> LeftButtonAction = ( _arg < VTK_CURSOR_ACTION ? VTK_CURSOR_ACTION : ( _arg > VTK_WINDOW_LEVEL_ACTION ? VTK_WINDOW_LEVEL_ACTION : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetMarginSizeXMinValueMarginSizeYMinValueLeftButtonActionMinValue ( ) { return VTK_CURSOR_ACTION ; } virtual int GetMarginSizeXMaxValueMarginSizeYMaxValueLeftButtonActionMaxValue ( ) { return VTK_WINDOW_LEVEL_ACTION ; } ; virtual int GetResliceInterpolateRestrictPlaneToVolumeUserControlledLookupTableTextureInterpolateTextureVisibilityPlaneOrientationDisplayTextMarginSizeXMarginSizeYCurrentImageValueUseContinuousCursorInteractionLeftButtonAction ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LeftButtonAction  of  << this -> LeftButtonAction ) ; return this -> LeftButtonAction ; } ; virtual void SetMarginSizeXMarginSizeYLeftButtonActionMiddleButtonAction ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << MiddleButtonAction  to  << _arg ) ; if ( this -> MiddleButtonAction != ( _arg < VTK_CURSOR_ACTION ? VTK_CURSOR_ACTION : ( _arg > VTK_WINDOW_LEVEL_ACTION ? VTK_WINDOW_LEVEL_ACTION : _arg ) ) ) { this -> MiddleButtonAction = ( _arg < VTK_CURSOR_ACTION ? VTK_CURSOR_ACTION : ( _arg > VTK_WINDOW_LEVEL_ACTION ? VTK_WINDOW_LEVEL_ACTION : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetMarginSizeXMinValueMarginSizeYMinValueLeftButtonActionMinValueMiddleButtonActionMinValue ( ) { return VTK_CURSOR_ACTION ; } virtual int GetMarginSizeXMaxValueMarginSizeYMaxValueLeftButtonActionMaxValueMiddleButtonActionMaxValue ( ) { return VTK_WINDOW_LEVEL_ACTION ; } ; virtual int GetResliceInterpolateRestrictPlaneToVolumeUserControlledLookupTableTextureInterpolateTextureVisibilityPlaneOrientationDisplayTextMarginSizeXMarginSizeYCurrentImageValueUseContinuousCursorInteractionLeftButtonActionMiddleButtonAction ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MiddleButtonAction  of  << this -> MiddleButtonAction ) ; return this -> MiddleButtonAction ; } ; virtual void SetMarginSizeXMarginSizeYLeftButtonActionMiddleButtonActionRightButtonAction ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << RightButtonAction  to  << _arg ) ; if ( this -> RightButtonAction != ( _arg < VTK_CURSOR_ACTION ? VTK_CURSOR_ACTION : ( _arg > VTK_WINDOW_LEVEL_ACTION ? VTK_WINDOW_LEVEL_ACTION : _arg ) ) ) { this -> RightButtonAction = ( _arg < VTK_CURSOR_ACTION ? VTK_CURSOR_ACTION : ( _arg > VTK_WINDOW_LEVEL_ACTION ? VTK_WINDOW_LEVEL_ACTION : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetMarginSizeXMinValueMarginSizeYMinValueLeftButtonActionMinValueMiddleButtonActionMinValueRightButtonActionMinValue ( ) { return VTK_CURSOR_ACTION ; } virtual int GetMarginSizeXMaxValueMarginSizeYMaxValueLeftButtonActionMaxValueMiddleButtonActionMaxValueRightButtonActionMaxValue ( ) { return VTK_WINDOW_LEVEL_ACTION ; } ; virtual int GetResliceInterpolateRestrictPlaneToVolumeUserControlledLookupTableTextureInterpolateTextureVisibilityPlaneOrientationDisplayTextMarginSizeXMarginSizeYCurrentImageValueUseContinuousCursorInteractionLeftButtonActionMiddleButtonActionRightButtonAction ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RightButtonAction  of  << this -> RightButtonAction ) ; return this -> RightButtonAction ; } ; /@} /@{ *
##  Set the auto-modifiers associated to buttons.
##  This allows users to bind some buttons to actions that are usually
##  triggered by a key modifier. For example, if you do not need cursoring,
##  you can bind the left button action to VTK_SLICE_MOTION_ACTION (see above)
##  and the left button auto modifier to VTK_CONTROL_MODIFIER: you end up with
##  the left button controlling panning without pressing a key.
##  enum { VTK_NO_MODIFIER = 0 , VTK_SHIFT_MODIFIER = 1 , VTK_CONTROL_MODIFIER = 2 } ; virtual void SetMarginSizeXMarginSizeYLeftButtonActionMiddleButtonActionRightButtonActionLeftButtonAutoModifier ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << LeftButtonAutoModifier  to  << _arg ) ; if ( this -> LeftButtonAutoModifier != ( _arg < VTK_NO_MODIFIER ? VTK_NO_MODIFIER : ( _arg > VTK_CONTROL_MODIFIER ? VTK_CONTROL_MODIFIER : _arg ) ) ) { this -> LeftButtonAutoModifier = ( _arg < VTK_NO_MODIFIER ? VTK_NO_MODIFIER : ( _arg > VTK_CONTROL_MODIFIER ? VTK_CONTROL_MODIFIER : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetMarginSizeXMinValueMarginSizeYMinValueLeftButtonActionMinValueMiddleButtonActionMinValueRightButtonActionMinValueLeftButtonAutoModifierMinValue ( ) { return VTK_NO_MODIFIER ; } virtual int GetMarginSizeXMaxValueMarginSizeYMaxValueLeftButtonActionMaxValueMiddleButtonActionMaxValueRightButtonActionMaxValueLeftButtonAutoModifierMaxValue ( ) { return VTK_CONTROL_MODIFIER ; } ; virtual int GetResliceInterpolateRestrictPlaneToVolumeUserControlledLookupTableTextureInterpolateTextureVisibilityPlaneOrientationDisplayTextMarginSizeXMarginSizeYCurrentImageValueUseContinuousCursorInteractionLeftButtonActionMiddleButtonActionRightButtonActionLeftButtonAutoModifier ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LeftButtonAutoModifier  of  << this -> LeftButtonAutoModifier ) ; return this -> LeftButtonAutoModifier ; } ; virtual void SetMarginSizeXMarginSizeYLeftButtonActionMiddleButtonActionRightButtonActionLeftButtonAutoModifierMiddleButtonAutoModifier ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << MiddleButtonAutoModifier  to  << _arg ) ; if ( this -> MiddleButtonAutoModifier != ( _arg < VTK_NO_MODIFIER ? VTK_NO_MODIFIER : ( _arg > VTK_CONTROL_MODIFIER ? VTK_CONTROL_MODIFIER : _arg ) ) ) { this -> MiddleButtonAutoModifier = ( _arg < VTK_NO_MODIFIER ? VTK_NO_MODIFIER : ( _arg > VTK_CONTROL_MODIFIER ? VTK_CONTROL_MODIFIER : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetMarginSizeXMinValueMarginSizeYMinValueLeftButtonActionMinValueMiddleButtonActionMinValueRightButtonActionMinValueLeftButtonAutoModifierMinValueMiddleButtonAutoModifierMinValue ( ) { return VTK_NO_MODIFIER ; } virtual int GetMarginSizeXMaxValueMarginSizeYMaxValueLeftButtonActionMaxValueMiddleButtonActionMaxValueRightButtonActionMaxValueLeftButtonAutoModifierMaxValueMiddleButtonAutoModifierMaxValue ( ) { return VTK_CONTROL_MODIFIER ; } ; virtual int GetResliceInterpolateRestrictPlaneToVolumeUserControlledLookupTableTextureInterpolateTextureVisibilityPlaneOrientationDisplayTextMarginSizeXMarginSizeYCurrentImageValueUseContinuousCursorInteractionLeftButtonActionMiddleButtonActionRightButtonActionLeftButtonAutoModifierMiddleButtonAutoModifier ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MiddleButtonAutoModifier  of  << this -> MiddleButtonAutoModifier ) ; return this -> MiddleButtonAutoModifier ; } ; virtual void SetMarginSizeXMarginSizeYLeftButtonActionMiddleButtonActionRightButtonActionLeftButtonAutoModifierMiddleButtonAutoModifierRightButtonAutoModifier ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << RightButtonAutoModifier  to  << _arg ) ; if ( this -> RightButtonAutoModifier != ( _arg < VTK_NO_MODIFIER ? VTK_NO_MODIFIER : ( _arg > VTK_CONTROL_MODIFIER ? VTK_CONTROL_MODIFIER : _arg ) ) ) { this -> RightButtonAutoModifier = ( _arg < VTK_NO_MODIFIER ? VTK_NO_MODIFIER : ( _arg > VTK_CONTROL_MODIFIER ? VTK_CONTROL_MODIFIER : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetMarginSizeXMinValueMarginSizeYMinValueLeftButtonActionMinValueMiddleButtonActionMinValueRightButtonActionMinValueLeftButtonAutoModifierMinValueMiddleButtonAutoModifierMinValueRightButtonAutoModifierMinValue ( ) { return VTK_NO_MODIFIER ; } virtual int GetMarginSizeXMaxValueMarginSizeYMaxValueLeftButtonActionMaxValueMiddleButtonActionMaxValueRightButtonActionMaxValueLeftButtonAutoModifierMaxValueMiddleButtonAutoModifierMaxValueRightButtonAutoModifierMaxValue ( ) { return VTK_CONTROL_MODIFIER ; } ; virtual int GetResliceInterpolateRestrictPlaneToVolumeUserControlledLookupTableTextureInterpolateTextureVisibilityPlaneOrientationDisplayTextMarginSizeXMarginSizeYCurrentImageValueUseContinuousCursorInteractionLeftButtonActionMiddleButtonActionRightButtonActionLeftButtonAutoModifierMiddleButtonAutoModifierRightButtonAutoModifier ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RightButtonAutoModifier  of  << this -> RightButtonAutoModifier ) ; return this -> RightButtonAutoModifier ; } ; /@} protected : vtkImagePlaneWidget ( ) ; ~ vtkImagePlaneWidget ( ) override ; vtkTypeBool TextureVisibility ; int LeftButtonAction ; int MiddleButtonAction ; int RightButtonAction ; int LeftButtonAutoModifier ; int MiddleButtonAutoModifier ; int RightButtonAutoModifier ; enum { VTK_NO_BUTTON = 0 , VTK_LEFT_BUTTON = 1 , VTK_MIDDLE_BUTTON = 2 , VTK_RIGHT_BUTTON = 3 } ; int LastButtonPressed ;  Manage the state of the widget int State ; enum WidgetState { Start = 0 , Cursoring , WindowLevelling , Pushing , Spinning , Rotating , Moving , Scaling , Outside } ;  Handles the events static void ProcessEvents ( vtkObject * object , unsigned long event , void * clientdata , void * calldata ) ;  internal utility method that adds observers to the RenderWindowInteractor
##  so that our ProcessEvents is eventually called.  this method is called
##  by SetEnabled as well as SetInteraction void AddObservers ( ) ;  ProcessEvents() dispatches to these methods. virtual void OnMouseMove ( ) ; virtual void OnLeftButtonDown ( ) ; virtual void OnLeftButtonUp ( ) ; virtual void OnMiddleButtonDown ( ) ; virtual void OnMiddleButtonUp ( ) ; virtual void OnRightButtonDown ( ) ; virtual void OnRightButtonUp ( ) ; void OnChar ( ) override ; virtual void StartCursor ( ) ; virtual void StopCursor ( ) ; virtual void StartSliceMotion ( ) ; virtual void StopSliceMotion ( ) ; virtual void StartWindowLevel ( ) ; virtual void StopWindowLevel ( ) ;  controlling ivars vtkTypeBool Interaction ;  Is the widget responsive to mouse events int PlaneOrientation ; vtkTypeBool RestrictPlaneToVolume ; double OriginalWindow ; double OriginalLevel ; double CurrentWindow ; double CurrentLevel ; double InitialWindow ; double InitialLevel ; int StartWindowLevelPositionX ; int StartWindowLevelPositionY ; int ResliceInterpolate ; vtkTypeBool TextureInterpolate ; vtkTypeBool UserControlledLookupTable ; vtkTypeBool DisplayText ;  The geometric representation of the plane and it's outline vtkPlaneSource * PlaneSource ; vtkPolyData * PlaneOutlinePolyData ; vtkActor * PlaneOutlineActor ; void HighlightPlane ( int highlight ) ; void GeneratePlaneOutline ( ) ;  Re-builds the plane outline based on the plane source void BuildRepresentation ( ) ;  Do the picking vtkAbstractPropPicker * PlanePicker ;  Register internal Pickers within PickingManager void RegisterPickers ( ) override ;  for negative window values. void InvertTable ( ) ;  Methods to manipulate the plane void WindowLevel ( int X , int Y ) ; void Push ( double * p1 , double * p2 ) ; void Spin ( double * p1 , double * p2 ) ; void Rotate ( double * p1 , double * p2 , double * vpn ) ; void Scale ( double * p1 , double * p2 , int X , int Y ) ; void Translate ( double * p1 , double * p2 ) ; vtkImageData * ImageData ; vtkImageReslice * Reslice ; vtkMatrix4x4 * ResliceAxes ; vtkTransform * Transform ; vtkActor * TexturePlaneActor ; vtkImageMapToColors * ColorMap ; vtkTexture * Texture ; vtkLookupTable * LookupTable ; vtkLookupTable * CreateDefaultLookupTable ( ) ;  Properties used to control the appearance of selected objects and
##  the manipulator in general.  The plane property is actually that for
##  the outline.  The TexturePlaneProperty can be used to control the
##  lighting etc. of the resliced image data. vtkProperty * PlaneProperty ; vtkProperty * SelectedPlaneProperty ; vtkProperty * CursorProperty ; vtkProperty * MarginProperty ; vtkProperty * TexturePlaneProperty ; void CreateDefaultProperties ( ) ;  Reslice and texture management void UpdatePlane ( ) ; void GenerateTexturePlane ( ) ;  The cross-hair cursor vtkPolyData * CursorPolyData ; vtkActor * CursorActor ; double CurrentCursorPosition [ 3 ] ; double CurrentImageValue ;  Set to VTK_DOUBLE_MAX when invalid void GenerateCursor ( ) ; void UpdateCursor ( int , int ) ; void ActivateCursor ( int ) ; int UpdateContinuousCursor ( double * q ) ; int UpdateDiscreteCursor ( double * q ) ; vtkTypeBool UseContinuousCursor ;  The text to display W/L, image data vtkTextActor * TextActor ; char TextBuff [ VTK_IMAGE_PLANE_WIDGET_MAX_TEXTBUFF ] ; void GenerateText ( ) ; void ManageTextDisplay ( ) ; void ActivateText ( int ) ;  Oblique reslice control double RotateAxis [ 3 ] ; double RadiusVector [ 3 ] ; void AdjustState ( ) ;  Visible margins to assist user interaction vtkPolyData * MarginPolyData ; vtkActor * MarginActor ; int MarginSelectMode ; void GenerateMargins ( ) ; void UpdateMargins ( ) ; void ActivateMargins ( int ) ; double MarginSizeX ; double MarginSizeY ; private : vtkImagePlaneWidget ( const vtkImagePlaneWidget & ) = delete ; void operator = ( const vtkImagePlaneWidget & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
