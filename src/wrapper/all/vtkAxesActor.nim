## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAxesActor.h
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
##  @class   vtkAxesActor
##  @brief   a 3D axes representation
##
##  vtkAxesActor is a hybrid 2D/3D actor used to represent 3D axes in a scene.
##  The user can define the geometry to use for the shaft or the tip, and the
##  user can set the text for the three axes. The text will appear to follow the
##  camera since it is implemented by means of vtkCaptionActor2D.  All of the
##  functionality of the underlying vtkCaptionActor2D objects are accessible so
##  that, for instance, the font attributes of the axes text can be manipulated
##  through vtkTextProperty. Since this class inherits from vtkProp3D, one can
##  apply a user transform to the underlying geometry and the positioning of the
##  labels. For example, a rotation transform could be used to generate a
##  left-handed axes representation.
##
##  @par Thanks:
##  Thanks to Goodwin Lawlor for posting a tcl script which featured the
##  use of vtkCaptionActor2D to implement the text labels.  This class is
##  based on Paraview's vtkPVAxesActor.
##
##  @warning
##  vtkAxesActor is primarily intended for use with vtkOrientationMarkerWidget.
##  The bounds of this actor are calculated as though the geometry of the axes
##  were symmetric: that is, although only positive axes are visible, bounds
##  are calculated as though negative axes are present too.  This is done
##  intentionally to implement functionality of the camera update mechanism
##  in vtkOrientationMarkerWidget.
##
##  @sa
##  vtkAnnotatedCubeActor vtkOrientationMarkerWidget vtkCaptionActor2D
##  vtkTextProperty
##

## !!!Ignored construct:  # vtkAxesActor_h [NewLine] # vtkAxesActor_h [NewLine] # vtkProp3D.h [NewLine] # vtkRenderingAnnotationModule.h  For export macro [NewLine] class vtkActor ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkCaptionActor2D"
discard "forward decl of vtkConeSource"
discard "forward decl of vtkCylinderSource"
discard "forward decl of vtkLineSource"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkPropCollection"
discard "forward decl of vtkProperty"
discard "forward decl of vtkRenderer"
discard "forward decl of vtkSphereSource"
## !!!Ignored construct:  class VTKRENDERINGANNOTATION_EXPORT vtkAxesActor : public vtkProp3D { public : static vtkAxesActor * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkProp3D Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkProp3D :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkAxesActor :: IsTypeOf ( type ) ; } static vtkAxesActor * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkAxesActor * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkAxesActor * NewInstance ( ) const { return vtkAxesActor :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkProp3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAxesActor :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAxesActor :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  For some exporters and other other operations we must be
##  able to collect all the actors or volumes. These methods
##  are used in that process.
##  void GetActors ( vtkPropCollection * ) override ; /@{ *
##  Support the standard render methods.
##  int RenderOpaqueGeometry ( vtkViewport * viewport ) override ; int RenderTranslucentPolygonalGeometry ( vtkViewport * viewport ) override ; int RenderOverlay ( vtkViewport * viewport ) override ; /@} *
##  Does this prop have some translucent polygonal geometry?
##  vtkTypeBool HasTranslucentPolygonalGeometry ( ) override ; *
##  Shallow copy of an axes actor. Overloads the virtual vtkProp method.
##  void ShallowCopy ( vtkProp * prop ) override ; *
##  Release any graphics resources that are being consumed by this actor.
##  The parameter window could be used to determine which graphic
##  resources to release.
##  void ReleaseGraphicsResources ( vtkWindow * ) override ; /@{ *
##  Get the bounds for this Actor as (Xmin,Xmax,Ymin,Ymax,Zmin,Zmax). (The
##  method GetBounds(double bounds[6]) is available from the superclass.)
##  void GetBounds ( double bounds [ 6 ] ) ; double * GetBounds ( ) VTK_SIZEHINT ( 6 ) override ; /@} *
##  Get the actors mtime plus consider its properties and texture if set.
##  vtkMTimeType GetMTime ( ) override ; *
##  Return the mtime of anything that would cause the rendered image to
##  appear differently. Usually this involves checking the mtime of the
##  prop plus anything else it depends on such as properties, textures
##  etc.
##  vtkMTimeType GetRedrawMTime ( ) override ; /@{ *
##  Set the total length of the axes in 3 dimensions.
##  void SetTotalLength ( double v [ 3 ] ) { this -> SetTotalLength ( v [ 0 ] , v [ 1 ] , v [ 2 ] ) ; } void SetTotalLength ( double x , double y , double z ) ; virtual double * GetTotalLength ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << TotalLength  pointer  << this -> TotalLength ) ; return this -> TotalLength ; } VTK_WRAPEXCLUDE virtual void GetTotalLength ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> TotalLength [ i ] ; } } ; /@} /@{ *
##  Set the normalized (0-1) length of the shaft.
##  void SetNormalizedShaftLength ( double v [ 3 ] ) { this -> SetNormalizedShaftLength ( v [ 0 ] , v [ 1 ] , v [ 2 ] ) ; } void SetNormalizedShaftLength ( double x , double y , double z ) ; virtual double * GetTotalLengthNormalizedShaftLength ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << NormalizedShaftLength  pointer  << this -> NormalizedShaftLength ) ; return this -> NormalizedShaftLength ; } VTK_WRAPEXCLUDE virtual void GetTotalLengthNormalizedShaftLength ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> NormalizedShaftLength [ i ] ; } } ; /@} /@{ *
##  Set the normalized (0-1) length of the tip.  Normally, this would be
##  1 - the normalized length of the shaft.
##  void SetNormalizedTipLength ( double v [ 3 ] ) { this -> SetNormalizedTipLength ( v [ 0 ] , v [ 1 ] , v [ 2 ] ) ; } void SetNormalizedTipLength ( double x , double y , double z ) ; virtual double * GetTotalLengthNormalizedShaftLengthNormalizedTipLength ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << NormalizedTipLength  pointer  << this -> NormalizedTipLength ) ; return this -> NormalizedTipLength ; } VTK_WRAPEXCLUDE virtual void GetTotalLengthNormalizedShaftLengthNormalizedTipLength ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> NormalizedTipLength [ i ] ; } } ; /@} /@{ *
##  Set the normalized (0-1) position of the label along the length of
##  the shaft.  A value > 1 is permissible.
##  void SetNormalizedLabelPosition ( double v [ 3 ] ) { this -> SetNormalizedLabelPosition ( v [ 0 ] , v [ 1 ] , v [ 2 ] ) ; } void SetNormalizedLabelPosition ( double x , double y , double z ) ; virtual double * GetTotalLengthNormalizedShaftLengthNormalizedTipLengthNormalizedLabelPosition ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << NormalizedLabelPosition  pointer  << this -> NormalizedLabelPosition ) ; return this -> NormalizedLabelPosition ; } VTK_WRAPEXCLUDE virtual void GetTotalLengthNormalizedShaftLengthNormalizedTipLengthNormalizedLabelPosition ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> NormalizedLabelPosition [ i ] ; } } ; /@} /@{ *
##  Set/get the resolution of the pieces of the axes actor.
##  virtual void SetConeResolution ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ConeResolution  to  << _arg ) ; if ( this -> ConeResolution != ( _arg < 3 ? 3 : ( _arg > 128 ? 128 : _arg ) ) ) { this -> ConeResolution = ( _arg < 3 ? 3 : ( _arg > 128 ? 128 : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetConeResolutionMinValue ( ) { return 3 ; } virtual int GetConeResolutionMaxValue ( ) { return 128 ; } ; virtual int GetConeResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ConeResolution  of  << this -> ConeResolution ) ; return this -> ConeResolution ; } ; virtual void SetConeResolutionSphereResolution ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << SphereResolution  to  << _arg ) ; if ( this -> SphereResolution != ( _arg < 3 ? 3 : ( _arg > 128 ? 128 : _arg ) ) ) { this -> SphereResolution = ( _arg < 3 ? 3 : ( _arg > 128 ? 128 : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetConeResolutionMinValueSphereResolutionMinValue ( ) { return 3 ; } virtual int GetConeResolutionMaxValueSphereResolutionMaxValue ( ) { return 128 ; } ; virtual int GetConeResolutionSphereResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SphereResolution  of  << this -> SphereResolution ) ; return this -> SphereResolution ; } ; virtual void SetConeResolutionSphereResolutionCylinderResolution ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << CylinderResolution  to  << _arg ) ; if ( this -> CylinderResolution != ( _arg < 3 ? 3 : ( _arg > 128 ? 128 : _arg ) ) ) { this -> CylinderResolution = ( _arg < 3 ? 3 : ( _arg > 128 ? 128 : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetConeResolutionMinValueSphereResolutionMinValueCylinderResolutionMinValue ( ) { return 3 ; } virtual int GetConeResolutionMaxValueSphereResolutionMaxValueCylinderResolutionMaxValue ( ) { return 128 ; } ; virtual int GetConeResolutionSphereResolutionCylinderResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CylinderResolution  of  << this -> CylinderResolution ) ; return this -> CylinderResolution ; } ; /@} /@{ *
##  Set/get the radius of the pieces of the axes actor.
##  virtual void SetConeResolutionSphereResolutionCylinderResolutionConeRadius ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ConeRadius  to  << _arg ) ; if ( this -> ConeRadius != ( _arg < 0 ? 0 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ) { this -> ConeRadius = ( _arg < 0 ? 0 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetConeResolutionMinValueSphereResolutionMinValueCylinderResolutionMinValueConeRadiusMinValue ( ) { return 0 ; } virtual double GetConeResolutionMaxValueSphereResolutionMaxValueCylinderResolutionMaxValueConeRadiusMaxValue ( ) { return VTK_FLOAT_MAX ; } ; virtual double GetConeResolutionSphereResolutionCylinderResolutionConeRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ConeRadius  of  << this -> ConeRadius ) ; return this -> ConeRadius ; } ; virtual void SetConeResolutionSphereResolutionCylinderResolutionConeRadiusSphereRadius ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << SphereRadius  to  << _arg ) ; if ( this -> SphereRadius != ( _arg < 0 ? 0 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ) { this -> SphereRadius = ( _arg < 0 ? 0 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetConeResolutionMinValueSphereResolutionMinValueCylinderResolutionMinValueConeRadiusMinValueSphereRadiusMinValue ( ) { return 0 ; } virtual double GetConeResolutionMaxValueSphereResolutionMaxValueCylinderResolutionMaxValueConeRadiusMaxValueSphereRadiusMaxValue ( ) { return VTK_FLOAT_MAX ; } ; virtual double GetConeResolutionSphereResolutionCylinderResolutionConeRadiusSphereRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SphereRadius  of  << this -> SphereRadius ) ; return this -> SphereRadius ; } ; virtual void SetConeResolutionSphereResolutionCylinderResolutionConeRadiusSphereRadiusCylinderRadius ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << CylinderRadius  to  << _arg ) ; if ( this -> CylinderRadius != ( _arg < 0 ? 0 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ) { this -> CylinderRadius = ( _arg < 0 ? 0 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetConeResolutionMinValueSphereResolutionMinValueCylinderResolutionMinValueConeRadiusMinValueSphereRadiusMinValueCylinderRadiusMinValue ( ) { return 0 ; } virtual double GetConeResolutionMaxValueSphereResolutionMaxValueCylinderResolutionMaxValueConeRadiusMaxValueSphereRadiusMaxValueCylinderRadiusMaxValue ( ) { return VTK_FLOAT_MAX ; } ; virtual double GetConeResolutionSphereResolutionCylinderResolutionConeRadiusSphereRadiusCylinderRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CylinderRadius  of  << this -> CylinderRadius ) ; return this -> CylinderRadius ; } ; /@} /@{ *
##  Set the type of the shaft to a cylinder, line, or user defined geometry.
##  void SetShaftType ( int type ) ; void SetShaftTypeToCylinder ( ) { this -> SetShaftType ( vtkAxesActor :: CYLINDER_SHAFT ) ; } void SetShaftTypeToLine ( ) { this -> SetShaftType ( vtkAxesActor :: LINE_SHAFT ) ; } void SetShaftTypeToUserDefined ( ) { this -> SetShaftType ( vtkAxesActor :: USER_DEFINED_SHAFT ) ; } virtual int GetConeResolutionSphereResolutionCylinderResolutionConeRadiusSphereRadiusCylinderRadiusShaftType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ShaftType  of  << this -> ShaftType ) ; return this -> ShaftType ; } ; /@} /@{ *
##  Set the type of the tip to a cone, sphere, or user defined geometry.
##  void SetTipType ( int type ) ; void SetTipTypeToCone ( ) { this -> SetTipType ( vtkAxesActor :: CONE_TIP ) ; } void SetTipTypeToSphere ( ) { this -> SetTipType ( vtkAxesActor :: SPHERE_TIP ) ; } void SetTipTypeToUserDefined ( ) { this -> SetTipType ( vtkAxesActor :: USER_DEFINED_TIP ) ; } virtual int GetConeResolutionSphereResolutionCylinderResolutionConeRadiusSphereRadiusCylinderRadiusShaftTypeTipType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TipType  of  << this -> TipType ) ; return this -> TipType ; } ; /@} /@{ *
##  Set the user defined tip polydata.
##  void SetUserDefinedTip ( vtkPolyData * ) ; virtual vtkPolyData * GetnameUserDefinedTip ( ) { vtkDebugWithObjectMacro ( this , <<  returning  UserDefinedTip  address  << static_cast < vtkPolyData * > ( this -> UserDefinedTip ) ) ; return this -> UserDefinedTip ; } ; /@} /@{ *
##  Set the user defined shaft polydata.
##  void SetUserDefinedShaft ( vtkPolyData * ) ; virtual vtkPolyData * GetnameUserDefinedTipUserDefinedShaft ( ) { vtkDebugWithObjectMacro ( this , <<  returning  UserDefinedShaft  address  << static_cast < vtkPolyData * > ( this -> UserDefinedShaft ) ) ; return this -> UserDefinedShaft ; } ; /@} /@{ *
##  Get the tip properties.
##  vtkProperty * GetXAxisTipProperty ( ) ; vtkProperty * GetYAxisTipProperty ( ) ; vtkProperty * GetZAxisTipProperty ( ) ; /@} /@{ *
##  Get the shaft properties.
##  vtkProperty * GetXAxisShaftProperty ( ) ; vtkProperty * GetYAxisShaftProperty ( ) ; vtkProperty * GetZAxisShaftProperty ( ) ; /@} *
##  Retrieve handles to the X, Y and Z axis (so that you can set their text
##  properties for example)
##  vtkCaptionActor2D * GetXAxisCaptionActor2D ( ) { return this -> XAxisLabel ; } vtkCaptionActor2D * GetYAxisCaptionActor2D ( ) { return this -> YAxisLabel ; } vtkCaptionActor2D * GetZAxisCaptionActor2D ( ) { return this -> ZAxisLabel ; } /@{ *
##  Set/get the label text.
##  virtual void SetXAxisLabelText ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << XAxisLabelText  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> XAxisLabelText == nullptr && _arg == nullptr ) { return ; } if ( this -> XAxisLabelText && _arg && ( ! strcmp ( this -> XAxisLabelText , _arg ) ) ) { return ; } delete [ ] this -> XAxisLabelText ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> XAxisLabelText = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> XAxisLabelText = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetXAxisLabelText ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << XAxisLabelText  of  << ( this -> XAxisLabelText ? this -> XAxisLabelText : (null) ) ) ; return this -> XAxisLabelText ; } ; virtual void SetXAxisLabelTextYAxisLabelText ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << YAxisLabelText  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> YAxisLabelText == nullptr && _arg == nullptr ) { return ; } if ( this -> YAxisLabelText && _arg && ( ! strcmp ( this -> YAxisLabelText , _arg ) ) ) { return ; } delete [ ] this -> YAxisLabelText ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> YAxisLabelText = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> YAxisLabelText = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetXAxisLabelTextYAxisLabelText ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << YAxisLabelText  of  << ( this -> YAxisLabelText ? this -> YAxisLabelText : (null) ) ) ; return this -> YAxisLabelText ; } ; virtual void SetXAxisLabelTextYAxisLabelTextZAxisLabelText ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ZAxisLabelText  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> ZAxisLabelText == nullptr && _arg == nullptr ) { return ; } if ( this -> ZAxisLabelText && _arg && ( ! strcmp ( this -> ZAxisLabelText , _arg ) ) ) { return ; } delete [ ] this -> ZAxisLabelText ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> ZAxisLabelText = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> ZAxisLabelText = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetXAxisLabelTextYAxisLabelTextZAxisLabelText ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << ZAxisLabelText  of  << ( this -> ZAxisLabelText ? this -> ZAxisLabelText : (null) ) ) ; return this -> ZAxisLabelText ; } ; /@} /@{ *
##  Enable/disable drawing the axis labels.
##  virtual void SetAxisLabels ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  AxisLabels  to  << _arg ) ; if ( this -> AxisLabels != _arg ) { this -> AxisLabels = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetConeResolutionSphereResolutionCylinderResolutionConeRadiusSphereRadiusCylinderRadiusShaftTypeTipTypeAxisLabels ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AxisLabels  of  << this -> AxisLabels ) ; return this -> AxisLabels ; } ; virtual void AxisLabelsOn ( ) { this -> SetAxisLabels ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void AxisLabelsOff ( ) { this -> SetAxisLabels ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} enum { CYLINDER_SHAFT , LINE_SHAFT , USER_DEFINED_SHAFT } ; enum { CONE_TIP , SPHERE_TIP , USER_DEFINED_TIP } ; protected : vtkAxesActor ( ) ; ~ vtkAxesActor ( ) override ; vtkCylinderSource * CylinderSource ; vtkLineSource * LineSource ; vtkConeSource * ConeSource ; vtkSphereSource * SphereSource ; vtkActor * XAxisShaft ; vtkActor * YAxisShaft ; vtkActor * ZAxisShaft ; vtkActor * XAxisTip ; vtkActor * YAxisTip ; vtkActor * ZAxisTip ; void UpdateProps ( ) ; double TotalLength [ 3 ] ; double NormalizedShaftLength [ 3 ] ; double NormalizedTipLength [ 3 ] ; double NormalizedLabelPosition [ 3 ] ; int ShaftType ; int TipType ; vtkPolyData * UserDefinedTip ; vtkPolyData * UserDefinedShaft ; char * XAxisLabelText ; char * YAxisLabelText ; char * ZAxisLabelText ; vtkCaptionActor2D * XAxisLabel ; vtkCaptionActor2D * YAxisLabel ; vtkCaptionActor2D * ZAxisLabel ; vtkTypeBool AxisLabels ; int ConeResolution ; int SphereResolution ; int CylinderResolution ; double ConeRadius ; double SphereRadius ; double CylinderRadius ; private : vtkAxesActor ( const vtkAxesActor & ) = delete ; void operator = ( const vtkAxesActor & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
