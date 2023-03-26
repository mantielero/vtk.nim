## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCoordinate.h
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
##  @class   vtkCoordinate
##  @brief   perform coordinate transformation, and represent position, in a variety of vtk
##  coordinate systems
##
##  vtkCoordinate represents position in a variety of coordinate systems, and
##  converts position to other coordinate systems. It also supports relative
##  positioning, so you can create a cascade of vtkCoordinate objects (no loops
##  please!) that refer to each other. The typical usage of this object is
##  to set the coordinate system in which to represent a position (e.g.,
##  SetCoordinateSystemToNormalizedDisplay()), set the value of the coordinate
##  (e.g., SetValue()), and then invoke the appropriate method to convert to
##  another coordinate system (e.g., GetComputedWorldValue()).
##
##  The coordinate systems in vtk are as follows:
##  <PRE>
##    DISPLAY -             x-y pixel values in window
##       0, 0 is the lower left of the first pixel,
##       size, size is the upper right of the last pixel
##    NORMALIZED DISPLAY -  x-y (0,1) normalized values
##       0, 0 is the lower left of the first pixel,
##       1, 1 is the upper right of the last pixel
##    VIEWPORT -            x-y pixel values in viewport
##       0, 0 is the lower left of the first pixel,
##       size, size is the upper right of the last pixel
##    NORMALIZED VIEWPORT - x-y (0,1) normalized value in viewport
##       0, 0 is the lower left of the first pixel,
##       1, 1 is the upper right of the last pixel
##    VIEW -                x-y-z (-1,1) values in pose coordinates. (z is depth)
##    POSE -                world coords translated and rotated to the camera
##                          position and view direction
##    WORLD -               x-y-z global coordinate values
##    USERDEFINED -         x-y-z in User defined space
##  </PRE>
##
##  If you cascade vtkCoordinate objects, you refer to another vtkCoordinate
##  object which in turn can refer to others, and so on. This allows you to
##  create composite groups of things like vtkActor2D that are positioned
##  relative to one another. Note that in cascaded sequences, each
##  vtkCoordinate object may be specified in different coordinate systems!
##
##  @sa
##  vtkActor2D vtkScalarBarActor
##

## !!!Ignored construct:  # vtkCoordinate_h [NewLine] # vtkCoordinate_h [NewLine] # vtkObject.h [NewLine] # vtkRenderingCoreModule.h  For export macro class vtkViewport ;
## Error: did not expect [NewLine]!!!

## !!!Ignored construct:  [NewLine] # VTK_DISPLAY 0 [NewLine] # VTK_NORMALIZED_DISPLAY 1 [NewLine] # VTK_VIEWPORT 2 [NewLine] # VTK_NORMALIZED_VIEWPORT 3 [NewLine] # VTK_VIEW 4 [NewLine] # VTK_POSE 5 [NewLine] # VTK_WORLD 6 [NewLine] # VTK_USERDEFINED 7 [NewLine] class vtkCoordinate : public vtkObject { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkCoordinate :: IsTypeOf ( type ) ; } static vtkCoordinate * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkCoordinate * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkCoordinate * NewInstance ( ) const { return vtkCoordinate :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCoordinate :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCoordinate :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Creates an instance of this class with the following defaults:
##  value of  (0,0,0) in world coordinates.
##  static vtkCoordinate * New ( ) ; /@{ *
##  Set/get the coordinate system which this coordinate
##  is defined in. The options are Display, Normalized Display,
##  Viewport, Normalized Viewport, View, and World.
##  virtual void SetCoordinateSystem ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CoordinateSystem  to  << _arg ) ; if ( this -> CoordinateSystem != _arg ) { this -> CoordinateSystem = _arg ; this -> Modified ( ) ; } } ; virtual int GetCoordinateSystem ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CoordinateSystem  of  << this -> CoordinateSystem ) ; return this -> CoordinateSystem ; } ; void SetCoordinateSystemToDisplay ( ) { this -> SetCoordinateSystem ( VTK_DISPLAY ) ; } void SetCoordinateSystemToNormalizedDisplay ( ) { this -> SetCoordinateSystem ( VTK_NORMALIZED_DISPLAY ) ; } void SetCoordinateSystemToViewport ( ) { this -> SetCoordinateSystem ( VTK_VIEWPORT ) ; } void SetCoordinateSystemToNormalizedViewport ( ) { this -> SetCoordinateSystem ( VTK_NORMALIZED_VIEWPORT ) ; } void SetCoordinateSystemToView ( ) { this -> SetCoordinateSystem ( VTK_VIEW ) ; } void SetCoordinateSystemToPose ( ) { this -> SetCoordinateSystem ( VTK_POSE ) ; } void SetCoordinateSystemToWorld ( ) { this -> SetCoordinateSystem ( VTK_WORLD ) ; } /@} const char * GetCoordinateSystemAsString ( ) ; /@{ *
##  Set/get the value of this coordinate. This can be thought of as
##  the position of this coordinate in its coordinate system.
##  virtual void SetValue ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Value  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> Value [ 0 ] != _arg1 ) || ( this -> Value [ 1 ] != _arg2 ) || ( this -> Value [ 2 ] != _arg3 ) ) { this -> Value [ 0 ] = _arg1 ; this -> Value [ 1 ] = _arg2 ; this -> Value [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetValue ( const double _arg [ 3 ] ) { this -> SetValue ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetValue ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Value  pointer  << this -> Value ) ; return this -> Value ; } VTK_WRAPEXCLUDE virtual void GetValue ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Value [ 0 ] ; _arg2 = this -> Value [ 1 ] ; _arg3 = this -> Value [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Value  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetValue ( double _arg [ 3 ] ) { this -> GetValue ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; void SetValue ( double a , double b ) { this -> SetValue ( a , b , 0.0 ) ; } /@} /@{ *
##  If this coordinate is relative to another coordinate,
##  then specify that coordinate as the ReferenceCoordinate.
##  If this is NULL the coordinate is assumed to be absolute.
##  virtual void SetReferenceCoordinate ( vtkCoordinate * ) ; virtual vtkCoordinate * GetnameReferenceCoordinate ( ) { vtkDebugWithObjectMacro ( this , <<  returning  ReferenceCoordinate  address  << static_cast < vtkCoordinate * > ( this -> ReferenceCoordinate ) ) ; return this -> ReferenceCoordinate ; } ; /@} /@{ *
##  If you want this coordinate to be relative to a specific
##  vtkViewport (vtkRenderer) then you can specify that here.
##  NOTE: this is a raw pointer, not a weak pointer nor a reference counted
##  object, to avoid reference cycle loop between rendering classes and filter
##  classes.
##  void SetViewport ( vtkViewport * viewport ) ; virtual vtkViewport * GetnameReferenceCoordinateViewport ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Viewport  address  << static_cast < vtkViewport * > ( this -> Viewport ) ) ; return this -> Viewport ; } ; /@} /@{ *
##  Return the computed value in a specified coordinate system.
##  double * GetComputedWorldValue ( vtkViewport * ) VTK_SIZEHINT ( 3 ) ; int * GetComputedViewportValue ( vtkViewport * ) VTK_SIZEHINT ( 2 ) ; int * GetComputedDisplayValue ( vtkViewport * ) VTK_SIZEHINT ( 2 ) ; int * GetComputedLocalDisplayValue ( vtkViewport * ) VTK_SIZEHINT ( 2 ) ; /@} double * GetComputedDoubleViewportValue ( vtkViewport * ) VTK_SIZEHINT ( 2 ) ; double * GetComputedDoubleDisplayValue ( vtkViewport * ) VTK_SIZEHINT ( 2 ) ; *
##  GetComputedValue() will return either World, Viewport or
##  Display based on what has been set as the coordinate system.
##  This is good for objects like vtkLineSource, where the
##  user might want to use them as World or Viewport coordinates.
##  double * GetComputedValue ( vtkViewport * ) VTK_SIZEHINT ( 3 ) ; *
##  GetComputedUserDefinedValue() is to be used only when
##  the coordinate system is VTK_USERDEFINED. The user
##  must subclass vtkCoordinate and override this function,
##  when set as the TransformCoordinate in 2D-Mappers, the user
##  can customize display of 2D polygons
##  virtual double * GetComputedUserDefinedValue ( vtkViewport * ) VTK_SIZEHINT ( 3 ) { return this -> Value ; } protected : vtkCoordinate ( ) ; ~ vtkCoordinate ( ) override ; double Value [ 3 ] ; int CoordinateSystem ; vtkCoordinate * ReferenceCoordinate ; vtkViewport * Viewport ; double ComputedWorldValue [ 3 ] ; int ComputedDisplayValue [ 2 ] ; int ComputedViewportValue [ 2 ] ; int Computing ; double ComputedDoubleDisplayValue [ 2 ] ; double ComputedDoubleViewportValue [ 2 ] ; double ComputedUserDefinedValue [ 3 ] ; private : vtkCoordinate ( const vtkCoordinate & ) = delete ; void operator = ( const vtkCoordinate & ) = delete ; } ;
## Error: did not expect [NewLine]!!!
