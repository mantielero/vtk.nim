## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkResliceCursorRepresentation.h
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
##  @class   vtkResliceCursorRepresentation
##  @brief   represent the vtkResliceCursorWidget
##
##  This class is the base class for the reslice cursor representation
##  subclasses. It represents a cursor that may be interactively translated,
##  rotated through an image and perform thick / thick reformats.
##  @sa
##  vtkResliceCursorLineRepresentation vtkResliceCursorThickLineRepresentation
##  vtkResliceCursorWidget vtkResliceCursor
##

## !!!Ignored construct:  # vtkResliceCursorRepresentation_h [NewLine] # vtkResliceCursorRepresentation_h [NewLine] # vtkInteractionWidgetsModule.h  For export macro # vtkWidgetRepresentation.h [NewLine] class vtkTextProperty ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkActor2D"
discard "forward decl of vtkTextMapper"
discard "forward decl of vtkImageData"
discard "forward decl of vtkImageReslice"
discard "forward decl of vtkPlane"
discard "forward decl of vtkPlaneSource"
discard "forward decl of vtkResliceCursorPolyDataAlgorithm"
discard "forward decl of vtkResliceCursor"
discard "forward decl of vtkMatrix4x4"
discard "forward decl of vtkScalarsToColors"
discard "forward decl of vtkImageMapToColors"
discard "forward decl of vtkActor"
discard "forward decl of vtkImageActor"
discard "forward decl of vtkTexture"
discard "forward decl of vtkTextActor"
discard "forward decl of vtkImageAlgorithm"
const
  VTK_RESLICE_CURSOR_REPRESENTATION_MAX_TEXTBUFF* = 128

## !!!Ignored construct:  class VTKINTERACTIONWIDGETS_EXPORT vtkResliceCursorRepresentation : public vtkWidgetRepresentation { public : /@{ *
##  Standard VTK methods.
##  protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkWidgetRepresentation Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkWidgetRepresentation :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkResliceCursorRepresentation :: IsTypeOf ( type ) ; } static vtkResliceCursorRepresentation * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkResliceCursorRepresentation * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkResliceCursorRepresentation * NewInstance ( ) const { return vtkResliceCursorRepresentation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWidgetRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkResliceCursorRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkResliceCursorRepresentation :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  The tolerance representing the distance to the representation (in
##  pixels) in which the cursor is considered near enough to the
##  representation to be active.
##  virtual void SetTolerance ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Tolerance  to  << _arg ) ; if ( this -> Tolerance != ( _arg < 1 ? 1 : ( _arg > 100 ? 100 : _arg ) ) ) { this -> Tolerance = ( _arg < 1 ? 1 : ( _arg > 100 ? 100 : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetToleranceMinValue ( ) { return 1 ; } virtual int GetToleranceMaxValue ( ) { return 100 ; } ; virtual int GetTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tolerance  of  << this -> Tolerance ) ; return this -> Tolerance ; } ; /@} /@{ *
##  Show the resliced image ?
##  virtual void SetShowReslicedImage ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ShowReslicedImage  to  << _arg ) ; if ( this -> ShowReslicedImage != _arg ) { this -> ShowReslicedImage = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetToleranceShowReslicedImage ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ShowReslicedImage  of  << this -> ShowReslicedImage ) ; return this -> ShowReslicedImage ; } ; virtual void ShowReslicedImageOn ( ) { this -> SetShowReslicedImage ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ShowReslicedImageOff ( ) { this -> SetShowReslicedImage ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Make sure that the resliced image remains within the volume.
##  Default is On.
##  virtual void SetShowReslicedImageRestrictPlaneToVolume ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  RestrictPlaneToVolume  to  << _arg ) ; if ( this -> RestrictPlaneToVolume != _arg ) { this -> RestrictPlaneToVolume = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetToleranceShowReslicedImageRestrictPlaneToVolume ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RestrictPlaneToVolume  of  << this -> RestrictPlaneToVolume ) ; return this -> RestrictPlaneToVolume ; } ; virtual void RestrictPlaneToVolumeOn ( ) { this -> SetShowReslicedImageRestrictPlaneToVolume ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void RestrictPlaneToVolumeOff ( ) { this -> SetShowReslicedImageRestrictPlaneToVolume ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify the format to use for labelling the distance. Note that an empty
##  string results in no label, or a format string without a "%" character
##  will not print the thickness value.
##  virtual void SetThicknessLabelFormat ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ThicknessLabelFormat  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> ThicknessLabelFormat == nullptr && _arg == nullptr ) { return ; } if ( this -> ThicknessLabelFormat && _arg && ( ! strcmp ( this -> ThicknessLabelFormat , _arg ) ) ) { return ; } delete [ ] this -> ThicknessLabelFormat ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> ThicknessLabelFormat = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> ThicknessLabelFormat = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetThicknessLabelFormat ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << ThicknessLabelFormat  of  << ( this -> ThicknessLabelFormat ? this -> ThicknessLabelFormat : (null) ) ) ; return this -> ThicknessLabelFormat ; } ; /@}  Used to communicate about the state of the representation enum { Outside = 0 , NearCenter , NearAxis1 , NearAxis2 , OnCenter , OnAxis1 , OnAxis2 } ; enum { None = 0 , PanAndRotate , RotateBothAxes , ResizeThickness , WindowLevelling , TranslateSingleAxis } ; *
##  Get the text shown in the widget's label.
##  virtual char * GetThicknessLabelText ( ) ; /@{ *
##  Get the position of the widget's label in display coordinates.
##  virtual double * GetThicknessLabelPosition ( ) ; virtual void GetThicknessLabelPosition ( double pos [ 3 ] ) ; virtual void GetWorldThicknessLabelPosition ( double pos [ 3 ] ) ; /@} *
##  These are methods that satisfy vtkWidgetRepresentation's API.
##  void BuildRepresentation ( ) override ; /@{ *
##  Get the current reslice class and reslice axes
##  virtual vtkMatrix4x4 * GetnameResliceAxes ( ) { vtkDebugWithObjectMacro ( this , <<  returning  ResliceAxes  address  << static_cast < vtkMatrix4x4 * > ( this -> ResliceAxes ) ) ; return this -> ResliceAxes ; } ; virtual vtkImageAlgorithm * GetnameResliceAxesReslice ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Reslice  address  << static_cast < vtkImageAlgorithm * > ( this -> Reslice ) ) ; return this -> Reslice ; } ; /@} /@{ *
##  Get the displayed image actor
##  virtual vtkImageActor * GetnameResliceAxesResliceImageActor ( ) { vtkDebugWithObjectMacro ( this , <<  returning  ImageActor  address  << static_cast < vtkImageActor * > ( this -> ImageActor ) ) ; return this -> ImageActor ; } ; /@} /@{ *
##  Set/Get the internal lookuptable (lut) to one defined by the user, or,
##  alternatively, to the lut of another Reslice cusror widget.  In this way,
##  a set of three orthogonal planes can share the same lut so that
##  window-levelling is performed uniformly among planes.  The default
##  internal lut can be re- set/allocated by setting to 0 (nullptr).
##  virtual void SetLookupTable ( vtkScalarsToColors * ) ; virtual vtkScalarsToColors * GetnameResliceAxesResliceImageActorLookupTable ( ) { vtkDebugWithObjectMacro ( this , <<  returning  LookupTable  address  << static_cast < vtkScalarsToColors * > ( this -> LookupTable ) ) ; return this -> LookupTable ; } ; /@} /@{ *
##  Convenience method to get the vtkImageMapToColors filter used by this
##  widget.  The user can properly render other transparent actors in a
##  scene by calling the filter's SetOutputFormatToRGB and
##  PassAlphaToOutputOff.
##  virtual vtkImageMapToColors * GetnameResliceAxesResliceImageActorLookupTableColorMap ( ) { vtkDebugWithObjectMacro ( this , <<  returning  ColorMap  address  << static_cast < vtkImageMapToColors * > ( this -> ColorMap ) ) ; return this -> ColorMap ; } ; virtual void SetColorMap ( vtkImageMapToColors * ) ; /@} /@{ *
##  Set/Get the current window and level values.  SetWindowLevel should
##  only be called after SetInput.  If a shared lookup table is being used,
##  a callback is required to update the window level values without having
##  to update the lookup table again.
##  void SetWindowLevel ( double window , double level , int copy = 0 ) ; void GetWindowLevel ( double wl [ 2 ] ) ; double GetWindow ( ) { return this -> CurrentWindow ; } double GetLevel ( ) { return this -> CurrentLevel ; } /@} virtual vtkResliceCursor * GetResliceCursor ( ) = 0 ; /@{ *
##  Enable/disable text display of window-level, image coordinates and
##  scalar values in a render window.
##  virtual void SetShowReslicedImageRestrictPlaneToVolumeDisplayText ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  DisplayText  to  << _arg ) ; if ( this -> DisplayText != _arg ) { this -> DisplayText = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetToleranceShowReslicedImageRestrictPlaneToVolumeDisplayText ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DisplayText  of  << this -> DisplayText ) ; return this -> DisplayText ; } ; virtual void DisplayTextOn ( ) { this -> SetShowReslicedImageRestrictPlaneToVolumeDisplayText ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void DisplayTextOff ( ) { this -> SetShowReslicedImageRestrictPlaneToVolumeDisplayText ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the text property for the image data and window-level annotation.
##  void SetTextProperty ( vtkTextProperty * tprop ) ; vtkTextProperty * GetTextProperty ( ) ; /@} /@{ *
##  Render as a 2D image, or render as a plane with a texture in physical
##  space.
##  virtual void SetShowReslicedImageRestrictPlaneToVolumeDisplayTextUseImageActor ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseImageActor  to  << _arg ) ; if ( this -> UseImageActor != _arg ) { this -> UseImageActor = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetToleranceShowReslicedImageRestrictPlaneToVolumeDisplayTextUseImageActor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseImageActor  of  << this -> UseImageActor ) ; return this -> UseImageActor ; } ; virtual void UseImageActorOn ( ) { this -> SetShowReslicedImageRestrictPlaneToVolumeDisplayTextUseImageActor ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void UseImageActorOff ( ) { this -> SetShowReslicedImageRestrictPlaneToVolumeDisplayTextUseImageActor ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  INTERNAL - Do not use
##  Set the manipulation mode. This is done by the widget
##  void SetManipulationMode ( int m ) ; virtual int GetToleranceShowReslicedImageRestrictPlaneToVolumeDisplayTextUseImageActorManipulationMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ManipulationMode  of  << this -> ManipulationMode ) ; return this -> ManipulationMode ; } ; /@} /@{ *
##  INTERNAL - Do not use.
##  Internal methods used by the widget to manage text displays
##  for annotations.
##  void ActivateText ( int ) ; void ManageTextDisplay ( ) ; /@} /@{ *
##  Initialize the reslice planes and the camera center. This is done
##  automatically, the first time we render.
##  virtual void InitializeReslicePlane ( ) ; virtual void ResetCamera ( ) ; /@} *
##  Get the underlying cursor source.
##  virtual vtkResliceCursorPolyDataAlgorithm * GetCursorAlgorithm ( ) = 0 ; /@{ *
##  Get the plane source on which the texture (the thin/thick resliced
##  image is displayed)
##  virtual vtkPlaneSource * GetnameResliceAxesResliceImageActorLookupTableColorMapPlaneSource ( ) { vtkDebugWithObjectMacro ( this , <<  returning  PlaneSource  address  << static_cast < vtkPlaneSource * > ( this -> PlaneSource ) ) ; return this -> PlaneSource ; } ; /@} *
##  Fit the plane defined by origin, p1, p2 onto the bounds.
##  Plane is untouched if does not intersect bounds.
##  return 1 if the bounds is intersected, else 0
##  static int BoundPlane ( double bounds [ 6 ] , double origin [ 3 ] , double p1 [ 3 ] , double p2 [ 3 ] ) ; *
##  First rotate planeToTransform to match targetPlane normal.
##  Then rotate around targetNormal to enforce targetViewUp "up" vector (i.e. Origin->p2 ).
##  There is an infinite number of options to rotate a plane normal to another. Here we attempt to
##  preserve Origin, P1 and P2 when rotating around targetPlane.
##  static void TransformPlane ( vtkPlaneSource * planeToTransform , double targetCenter [ 3 ] , double targetNormal [ 3 ] , double targetViewUp [ 3 ] ) ; protected : vtkResliceCursorRepresentation ( ) ; ~ vtkResliceCursorRepresentation ( ) override ; /@{ *
##  Create New Reslice plane. Allows subclasses to override and crate
##  their own reslice filters to respond to the widget.
##  virtual void CreateDefaultResliceAlgorithm ( ) ; virtual void SetResliceParameters ( double outputSpacingX , double outputSpacingY , int extentX , int extentY ) ; /@} *
##  Process window level
##  virtual void WindowLevel ( double x , double y ) ; *
##  Update the reslice plane
##  virtual void UpdateReslicePlane ( ) ; *
##  Compute the origin of the planes so as to capture the entire image.
##  virtual void ComputeReslicePlaneOrigin ( ) ;  for negative window values. void InvertTable ( ) ;  recompute origin to make the location of the reslice cursor consistent
##  with its physical location virtual void ComputeOrigin ( vtkMatrix4x4 * ) ; /@{ void GetVector1 ( double d [ 3 ] ) ; void GetVector2 ( double d [ 3 ] ) ; /@} *
##  The widget sets the manipulation mode. This can be one of :
##  None, PanAndRotate, RotateBothAxes, ResizeThickness
##  int ManipulationMode ;  Keep track if modifier is set int Modifier ;  Selection tolerance for the handles int Tolerance ;  Format for printing the distance char * ThicknessLabelFormat ; vtkImageAlgorithm * Reslice ; vtkPlaneSource * PlaneSource ; vtkTypeBool RestrictPlaneToVolume ; vtkTypeBool ShowReslicedImage ; vtkTextProperty * ThicknessTextProperty ; vtkTextMapper * ThicknessTextMapper ; vtkActor2D * ThicknessTextActor ; vtkMatrix4x4 * ResliceAxes ; vtkMatrix4x4 * NewResliceAxes ; vtkImageMapToColors * ColorMap ; vtkActor * TexturePlaneActor ; vtkTexture * Texture ; vtkScalarsToColors * LookupTable ; vtkImageActor * ImageActor ; vtkTextActor * TextActor ; double OriginalWindow ; double OriginalLevel ; double CurrentWindow ; double CurrentLevel ; double InitialWindow ; double InitialLevel ; double LastEventPosition [ 2 ] ; vtkTypeBool UseImageActor ; char TextBuff [ VTK_RESLICE_CURSOR_REPRESENTATION_MAX_TEXTBUFF ] ; vtkTypeBool DisplayText ; vtkScalarsToColors * CreateDefaultLookupTable ( ) ; void GenerateText ( ) ; private : vtkResliceCursorRepresentation ( const vtkResliceCursorRepresentation & ) = delete ; void operator = ( const vtkResliceCursorRepresentation & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
