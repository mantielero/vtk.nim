## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCubeAxesActor.h
##   Language:  C++
##
## Copyright (c) 1993-2001 Ken Martin, Will Schroeder, Bill Lorensen
## All rights reserve
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
## =========================================================================
## *
##  @class   vtkPolarAxesActor
##  @brief   create an actor of a polar axes -
##
##
##  vtkPolarAxesActor is a composite actor that draws polar axes in a
##  specified plane for a give pole.
##  Currently the plane has to be the xy plane.
##
##  @par Thanks:
##  This class was written by Philippe Pebay, Kitware SAS 2011.
##  This work was supported by CEA/DIF - Commissariat a l'Energie Atomique,
##  Centre DAM Ile-De-France, BP12, F-91297 Arpajon, France.
##
##  @sa
##  vtkActor vtkAxisActor vtkPolarAxesActor
##

const
  VTK_MAXIMUM_NUMBER_OF_RADIAL_AXES* = 50
  VTK_DEFAULT_NUMBER_OF_RADIAL_AXES* = 5
  VTK_MAXIMUM_NUMBER_OF_POLAR_AXIS_TICKS* = 200
  VTK_MAXIMUM_RATIO* = 1000.0
  VTK_POLAR_ARC_RESOLUTION_PER_DEG* = 0.2

import
  vtkActor, vtkAxisActor, vtkRenderingAnnotationModule

discard "forward decl of vtkCamera"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkPolyDataMapper"
discard "forward decl of vtkProperty"
discard "forward decl of vtkStringArray"
discard "forward decl of vtkTextProperty"
type
  vtkPolarAxesActor* {.importcpp: "vtkPolarAxesActor",
                      header: "vtkPolarAxesActor.h", bycopy.} = object of vtkActor
    vtkPolarAxesActor* {.importc: "vtkPolarAxesActor".}: VTK_NEWINSTANCE
    ## *
    ##  Number of radial axes
    ##
    ## *
    ##  Requested Number of radial axes
    ##
    ## *
    ##  Whether the number of polar axis ticks and arcs should be automatically calculated.
    ##  Default: TRUE
    ##
    ## *
    ##  Ratio for elliptical representation of the polar axes actor.
    ##
    ## *
    ##  Define the range values displayed on the polar Axis.
    ##
    ## *
    ##  Step between 2 minor ticks, in range value (values displayed on the axis).
    ##
    ## *
    ##  Step between 2 major ticks, in range value (values displayed on the axis).
    ##
    ## *
    ##  Angle between 2 minor ticks on the last arc.
    ##
    ## *
    ##  Angle between 2 major ticks on the last arc.
    ##
    ## *
    ##  Angle between 2 radial Axes.
    ##
    ## *
    ##  Minimum polar radius.
    ##  Default: 0.0
    ##
    ## *
    ##  Maximum polar radius.
    ##  Default: 1
    ##
    ## *
    ##  Enable/Disable log scale
    ##  Default: 0
    ##
    ## *
    ##  Auto-scale polar radius (with respect to average length scale of x-y bounding box).
    ##
    ## *
    ##  Minimum polar angle
    ##  Default: 0.
    ##
    ## *
    ##  Maximum polar angle
    ##  Default: 90.
    ##
    ## *
    ##  Smallest radial angle distinguishable from polar axis
    ##
    ##  Structures for principal polar arc
    ## /@{
    ## *
    ##  Structures for secondary polar arcs
    ##
    ## /@}
    ## *
    ##  Camera attached to the polar axes system
    ##
    ## *
    ##  Control variables for polar axis
    ##
    ## *
    ##  Control variables for non-polar radial axes
    ##
    ## /@{
    ## *
    ##  Title to be used for the polar axis
    ##  NB: Non-polar radial axes use the polar angle as title and have no labels
    ##
    ## /@}
    ## *
    ##  String to format angle values displayed on the radial axes.
    ##
    ## *
    ##  Display angle units (degrees) to label radial axes
    ##  Default is true
    ##
    ## *
    ##  If enabled the actor will not be visible at a certain distance from the camera.
    ##  Default is true
    ##
    ## *
    ##  Default is 0.80
    ##  This determines at what fraction of camera far clip range, actor is not visible.
    ##
    ## *
    ##  If enabled the actor will not be visible at a certain view angle.
    ##  Default is true.
    ##
    ## *
    ##  This determines at what view angle to geometry will make the geometry not visible.
    ##  Default is 0.3.
    ##
    ## /@{
    ## *
    ##  Visibility of polar axis and its title, labels, ticks (major only)
    ##
    ## /@}
    ## *
    ##  Describes the tick orientation for the graph elements involved by this property.
    ##  The ticks are drawn according to the direction of the 2 orthogonal axes, of the axisBase
    ##  defined for a vtkAxisActor.
    ##  For an ellipse, tick directions are defined from ellipse center to tick origin and
    ##  the orthogonal direction of the ellipse plane.
    ##
    ## *
    ##  Hold visibility for all present ticks
    ##
    ## *
    ##  If On, the ticks are drawn from the angle of the polarAxis (i.e. this->MinimumAngle)
    ##  and continue counterclockwise with the step DeltaAngle Major/Minor. if Off, the start angle is
    ##  0.0, i.e.
    ##  the angle on the major radius of the ellipse.
    ##
    ## *
    ##  If On, the radial axes are drawn from the angle of the polarAxis (i.e. this->MinimalRadius)
    ##  and continue counterclockwise with the step DeltaAngleRadialAxes. if Off, the start angle is
    ##  0.0, i.e.
    ##  the angle on the major radius of the ellipse.
    ##
    ## *
    ##  Hold visibility of major/minor ticks for the polar axis and the last radial axis
    ##
    ## *
    ##  Enable / Disable major/minor tick visibility on the last arc displayed
    ##
    ## *
    ##  Defines the length of the ticks located on the last arc
    ##
    ## *
    ##  Set the ratios between major tick Size for each ticks location
    ##
    ## *
    ##  Defines the tickness of the major ticks.
    ##
    ## *
    ##  Set the ratios between major tick thickness for each ticks location
    ##
    ## /@{
    ## *
    ##  Visibility of radial axes and their titles
    ##
    ## /@}
    ## *
    ##  Define the alignment of the title related to the radial axis. (BOTTOM or EXTERN)
    ##
    ## *
    ##  Define the alignment of the title related to the polar axis. (BOTTOM or EXTERN)
    ##
    ## *
    ##  Define the location of the exponent of the labels values, located on the polar axis.
    ##  it could be: LABEL, EXTERN, BOTTOM
    ##
    ## *
    ##  Visibility of polar arcs
    ##
    ## *
    ##  Visibility of the inner axes (overridden to 0 if RadialAxesVisibility is set to 0)
    ##
    ## *
    ##  Visibility of the inner arcs (overridden to 0 if PolarArcsVisibility is set to 0)
    ##
    ## *
    ##  Keep the arc major ticks vtkPoints instances
    ##
    ## *
    ##  Keep the arc minor ticks vtkPoints instances
    ##
    ## /@{
    ## *
    ##  vtk object for arc Ticks
    ##
    ## /@}
    ## /@{
    ## *
    ##  Text properties of polar axis title and labels
    ##
    ## /@}
    ## *
    ##  Text properties of last radial axis
    ##
    ## *
    ##  Text properties of secondary radial axes
    ##
    ## *
    ##  General properties of polar axis
    ##  Behavior may be override by polar axis ticks 's actor property.
    ##
    ## *
    ##  General properties of last radial axis
    ##
    ## *
    ##  General properties of radial axes
    ##
    ## *
    ##  Title scale factor
    ##
    ## *
    ##  Label scale factor
    ##
    ## *
    ##  Text screen size
    ##

  vtkPolarAxesActorSuperclass* = vtkActor

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPolarAxesActor::IsTypeOf(@)", header: "vtkPolarAxesActor.h".}
proc IsA*(this: var vtkPolarAxesActor; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPolarAxesActor.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPolarAxesActor {.
    importcpp: "vtkPolarAxesActor::SafeDownCast(@)", header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPolarAxesActor :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkActor :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPolarAxesActor :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPolarAxesActor :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPolarAxesActor; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPolarAxesActor.h".}
proc New*(): ptr vtkPolarAxesActor {.importcpp: "vtkPolarAxesActor::New(@)",
                                 header: "vtkPolarAxesActor.h".}
proc RenderOpaqueGeometry*(this: var vtkPolarAxesActor; a2: ptr vtkViewport): cint {.
    importcpp: "RenderOpaqueGeometry", header: "vtkPolarAxesActor.h".}
proc RenderOverlay*(this: var vtkPolarAxesActor; a2: ptr vtkViewport): cint {.
    importcpp: "RenderOverlay", header: "vtkPolarAxesActor.h".}
proc RenderTranslucentPolygonalGeometry*(this: var vtkPolarAxesActor;
                                        a2: ptr vtkViewport): cint {.
    importcpp: "RenderTranslucentPolygonalGeometry", header: "vtkPolarAxesActor.h".}
proc SetPole*(this: var vtkPolarAxesActor; a2: array[3, cdouble]) {.
    importcpp: "SetPole", header: "vtkPolarAxesActor.h".}
proc SetPole*(this: var vtkPolarAxesActor; a2: cdouble; a3: cdouble; a4: cdouble) {.
    importcpp: "SetPole", header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual double * GetPole ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Pole  pointer  << this -> Pole ) ; return this -> Pole ; } VTK_WRAPEXCLUDE virtual void GetPole ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Pole [ 0 ] ; _arg2 = this -> Pole [ 1 ] ; _arg3 = this -> Pole [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Pole  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetPole ( double _arg [ 3 ] ) { this -> GetPole ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetLog*(this: var vtkPolarAxesActor; _arg: bool) {.importcpp: "SetLog",
    header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual bool GetLog ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Log  of  << this -> Log ) ; return this -> Log ; } ;
## Error: expected ';'!!!

proc LogOn*(this: var vtkPolarAxesActor) {.importcpp: "LogOn",
                                       header: "vtkPolarAxesActor.h".}
proc LogOff*(this: var vtkPolarAxesActor) {.importcpp: "LogOff",
                                        header: "vtkPolarAxesActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Gets/Sets the number of radial axes
  ##
proc SetRequestedNumberOfRadialAxes*(this: var vtkPolarAxesActor; _arg: vtkIdType) {.
    importcpp: "SetRequestedNumberOfRadialAxes", header: "vtkPolarAxesActor.h".}
proc GetRequestedNumberOfRadialAxesMinValue*(this: var vtkPolarAxesActor): vtkIdType {.
    importcpp: "GetRequestedNumberOfRadialAxesMinValue",
    header: "vtkPolarAxesActor.h".}
proc GetRequestedNumberOfRadialAxesMaxValue*(this: var vtkPolarAxesActor): vtkIdType {.
    importcpp: "GetRequestedNumberOfRadialAxesMaxValue",
    header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual vtkIdType GetLogRequestedNumberOfRadialAxes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RequestedNumberOfRadialAxes  of  << this -> RequestedNumberOfRadialAxes ) ; return this -> RequestedNumberOfRadialAxes ; } ;
## Error: expected ';'!!!

proc SetNumberOfPolarAxisTicks*(this: var vtkPolarAxesActor; a2: cint) {.
    importcpp: "SetNumberOfPolarAxisTicks", header: "vtkPolarAxesActor.h".}
proc GetNumberOfPolarAxisTicks*(this: var vtkPolarAxesActor): cint {.
    importcpp: "GetNumberOfPolarAxisTicks", header: "vtkPolarAxesActor.h".}
proc SetLogAutoSubdividePolarAxis*(this: var vtkPolarAxesActor; _arg: bool) {.
    importcpp: "SetLogAutoSubdividePolarAxis", header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual bool GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxis ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AutoSubdividePolarAxis  of  << this -> AutoSubdividePolarAxis ) ; return this -> AutoSubdividePolarAxis ; } ;
## Error: expected ';'!!!

proc AutoSubdividePolarAxisOn*(this: var vtkPolarAxesActor) {.
    importcpp: "AutoSubdividePolarAxisOn", header: "vtkPolarAxesActor.h".}
proc AutoSubdividePolarAxisOff*(this: var vtkPolarAxesActor) {.
    importcpp: "AutoSubdividePolarAxisOff", header: "vtkPolarAxesActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Define the range values displayed on the polar Axis.
  ##
proc SetRange*(this: var vtkPolarAxesActor; _arg1: cdouble; _arg2: cdouble) {.
    importcpp: "SetRange", header: "vtkPolarAxesActor.h".}
proc SetRange*(this: var vtkPolarAxesActor; _arg: array[2, cdouble]) {.
    importcpp: "SetRange", header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual double * GetRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Range  pointer  << this -> Range ) ; return this -> Range ; } VTK_WRAPEXCLUDE virtual void GetRange ( double data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> Range [ i ] ; } } ;
## Error: expected ';'!!!

proc SetMinimumRadius*(this: var vtkPolarAxesActor; a2: cdouble) {.
    importcpp: "SetMinimumRadius", header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual double GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MinimumRadius  of  << this -> MinimumRadius ) ; return this -> MinimumRadius ; } ;
## Error: expected ';'!!!

proc SetMaximumRadius*(this: var vtkPolarAxesActor; a2: cdouble) {.
    importcpp: "SetMaximumRadius", header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual double GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumRadius  of  << this -> MaximumRadius ) ; return this -> MaximumRadius ; } ;
## Error: expected ';'!!!

proc SetMinimumAngle*(this: var vtkPolarAxesActor; a2: cdouble) {.
    importcpp: "SetMinimumAngle", header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual double GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MinimumAngle  of  << this -> MinimumAngle ) ; return this -> MinimumAngle ; } ;
## Error: expected ';'!!!

proc SetMaximumAngle*(this: var vtkPolarAxesActor; a2: cdouble) {.
    importcpp: "SetMaximumAngle", header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual double GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumAngle  of  << this -> MaximumAngle ) ; return this -> MaximumAngle ; } ;
## Error: expected ';'!!!

proc SetRequestedNumberOfRadialAxesSmallestVisiblePolarAngle*(
    this: var vtkPolarAxesActor; _arg: cdouble) {.
    importcpp: "SetRequestedNumberOfRadialAxesSmallestVisiblePolarAngle",
    header: "vtkPolarAxesActor.h".}
proc GetRequestedNumberOfRadialAxesMinValueSmallestVisiblePolarAngleMinValue*(
    this: var vtkPolarAxesActor): cdouble {.importcpp: "GetRequestedNumberOfRadialAxesMinValueSmallestVisiblePolarAngleMinValue",
                                        header: "vtkPolarAxesActor.h".}
proc GetRequestedNumberOfRadialAxesMaxValueSmallestVisiblePolarAngleMaxValue*(
    this: var vtkPolarAxesActor): cdouble {.importcpp: "GetRequestedNumberOfRadialAxesMaxValueSmallestVisiblePolarAngleMaxValue",
                                        header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual double GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SmallestVisiblePolarAngle  of  << this -> SmallestVisiblePolarAngle ) ; return this -> SmallestVisiblePolarAngle ; } ;
## Error: expected ';'!!!

proc SetRequestedNumberOfRadialAxesSmallestVisiblePolarAngleTickLocation*(
    this: var vtkPolarAxesActor; _arg: cint) {.importcpp: "SetRequestedNumberOfRadialAxesSmallestVisiblePolarAngleTickLocation",
    header: "vtkPolarAxesActor.h".}
proc GetRequestedNumberOfRadialAxesMinValueSmallestVisiblePolarAngleMinValueTickLocationMinValue*(
    this: var vtkPolarAxesActor): cint {.importcpp: "GetRequestedNumberOfRadialAxesMinValueSmallestVisiblePolarAngleMinValueTickLocationMinValue",
                                     header: "vtkPolarAxesActor.h".}
proc GetRequestedNumberOfRadialAxesMaxValueSmallestVisiblePolarAngleMaxValueTickLocationMaxValue*(
    this: var vtkPolarAxesActor): cint {.importcpp: "GetRequestedNumberOfRadialAxesMaxValueSmallestVisiblePolarAngleMaxValueTickLocationMaxValue",
                                     header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual int GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TickLocation  of  << this -> TickLocation ) ; return this -> TickLocation ; } ;
## Error: expected ';'!!!

proc SetLogAutoSubdividePolarAxisRadialUnits*(this: var vtkPolarAxesActor;
    _arg: bool) {.importcpp: "SetLogAutoSubdividePolarAxisRadialUnits",
                header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual bool GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnits ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RadialUnits  of  << this -> RadialUnits ) ; return this -> RadialUnits ; } ;
## Error: expected ';'!!!

proc SetLogAutoSubdividePolarAxisRadialUnitsScreenSize*(
    this: var vtkPolarAxesActor; _arg: cdouble) {.
    importcpp: "SetLogAutoSubdividePolarAxisRadialUnitsScreenSize",
    header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual double GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScreenSize  of  << this -> ScreenSize ) ; return this -> ScreenSize ; } ;
## Error: expected ';'!!!

proc SetCamera*(this: var vtkPolarAxesActor; a2: ptr vtkCamera) {.
    importcpp: "SetCamera", header: "vtkPolarAxesActor.h".}
proc GetnameCamera*(this: var vtkPolarAxesActor): ptr vtkCamera {.
    importcpp: "GetnameCamera", header: "vtkPolarAxesActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the labels for the polar axis.
  ##  Default: "Radial Distance".
  ##
proc SetPolarAxisTitle*(this: var vtkPolarAxesActor; _arg: cstring) {.
    importcpp: "SetPolarAxisTitle", header: "vtkPolarAxesActor.h".}
proc GetPolarAxisTitle*(this: var vtkPolarAxesActor): cstring {.
    importcpp: "GetPolarAxisTitle", header: "vtkPolarAxesActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the format with which to print the polar axis labels.
  ##
proc SetPolarAxisTitlePolarLabelFormat*(this: var vtkPolarAxesActor; _arg: cstring) {.
    importcpp: "SetPolarAxisTitlePolarLabelFormat", header: "vtkPolarAxesActor.h".}
proc GetPolarAxisTitlePolarLabelFormat*(this: var vtkPolarAxesActor): cstring {.
    importcpp: "GetPolarAxisTitlePolarLabelFormat", header: "vtkPolarAxesActor.h".}
  ## /@}
type
  vtkPolarAxesActorExponentLocation* {.size: sizeof(cint), importcpp: "vtkPolarAxesActor::ExponentLocation",
                                      header: "vtkPolarAxesActor.h".} = enum
    VTK_EXPONENT_BOTTOM = 0, VTK_EXPONENT_EXTERN = 1, VTK_EXPONENT_LABELS = 2


proc SetRequestedNumberOfRadialAxesSmallestVisiblePolarAngleTickLocationExponentLocation*(
    this: var vtkPolarAxesActor; _arg: cint) {.importcpp: "SetRequestedNumberOfRadialAxesSmallestVisiblePolarAngleTickLocationExponentLocation",
    header: "vtkPolarAxesActor.h".}
proc GetRequestedNumberOfRadialAxesMinValueSmallestVisiblePolarAngleMinValueTickLocationMinValueExponentLocationMinValue*(
    this: var vtkPolarAxesActor): cint {.importcpp: "GetRequestedNumberOfRadialAxesMinValueSmallestVisiblePolarAngleMinValueTickLocationMinValueExponentLocationMinValue",
                                     header: "vtkPolarAxesActor.h".}
proc GetRequestedNumberOfRadialAxesMaxValueSmallestVisiblePolarAngleMaxValueTickLocationMaxValueExponentLocationMaxValue*(
    this: var vtkPolarAxesActor): cint {.importcpp: "GetRequestedNumberOfRadialAxesMaxValueSmallestVisiblePolarAngleMaxValueTickLocationMaxValueExponentLocationMaxValue",
                                     header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual int GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSizeExponentLocation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ExponentLocation  of  << this -> ExponentLocation ) ; return this -> ExponentLocation ; } ;
## Error: expected ';'!!!

proc SetPolarAxisTitlePolarLabelFormatRadialAngleFormat*(
    this: var vtkPolarAxesActor; _arg: cstring) {.
    importcpp: "SetPolarAxisTitlePolarLabelFormatRadialAngleFormat",
    header: "vtkPolarAxesActor.h".}
proc GetPolarAxisTitlePolarLabelFormatRadialAngleFormat*(
    this: var vtkPolarAxesActor): cstring {.importcpp: "GetPolarAxisTitlePolarLabelFormatRadialAngleFormat",
                                        header: "vtkPolarAxesActor.h".}
  ## /@}
  ## *
  ##  Release any graphics resources that are being consumed by this actor.
  ##  The parameter window could be used to determine which graphic
  ##  resources to release.
  ##
proc ReleaseGraphicsResources*(this: var vtkPolarAxesActor; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkPolarAxesActor.h".}
proc SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLOD*(
    this: var vtkPolarAxesActor; _arg: cint) {.importcpp: "SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLOD",
    header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual int GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSizeExponentLocationEnableDistanceLOD ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EnableDistanceLOD  of  << this -> EnableDistanceLOD ) ; return this -> EnableDistanceLOD ; } ;
## Error: expected ';'!!!

proc SetRequestedNumberOfRadialAxesSmallestVisiblePolarAngleTickLocationExponentLocationDistanceLODThreshold*(
    this: var vtkPolarAxesActor; _arg: cdouble) {.importcpp: "SetRequestedNumberOfRadialAxesSmallestVisiblePolarAngleTickLocationExponentLocationDistanceLODThreshold",
    header: "vtkPolarAxesActor.h".}
proc GetRequestedNumberOfRadialAxesMinValueSmallestVisiblePolarAngleMinValueTickLocationMinValueExponentLocationMinValueDistanceLODThresholdMinValue*(
    this: var vtkPolarAxesActor): cdouble {.importcpp: "GetRequestedNumberOfRadialAxesMinValueSmallestVisiblePolarAngleMinValueTickLocationMinValueExponentLocationMinValueDistanceLODThresholdMinValue",
                                        header: "vtkPolarAxesActor.h".}
proc GetRequestedNumberOfRadialAxesMaxValueSmallestVisiblePolarAngleMaxValueTickLocationMaxValueExponentLocationMaxValueDistanceLODThresholdMaxValue*(
    this: var vtkPolarAxesActor): cdouble {.importcpp: "GetRequestedNumberOfRadialAxesMaxValueSmallestVisiblePolarAngleMaxValueTickLocationMaxValueExponentLocationMaxValueDistanceLODThresholdMaxValue",
                                        header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual double GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSizeExponentLocationEnableDistanceLODDistanceLODThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DistanceLODThreshold  of  << this -> DistanceLODThreshold ) ; return this -> DistanceLODThreshold ; } ;
## Error: expected ';'!!!

proc SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLOD*(
    this: var vtkPolarAxesActor; _arg: cint) {.importcpp: "SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLOD",
    header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual int GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSizeExponentLocationEnableDistanceLODDistanceLODThresholdEnableViewAngleLOD ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EnableViewAngleLOD  of  << this -> EnableViewAngleLOD ) ; return this -> EnableViewAngleLOD ; } ;
## Error: expected ';'!!!

proc SetRequestedNumberOfRadialAxesSmallestVisiblePolarAngleTickLocationExponentLocationDistanceLODThresholdViewAngleLODThreshold*(
    this: var vtkPolarAxesActor; _arg: cdouble) {.importcpp: "SetRequestedNumberOfRadialAxesSmallestVisiblePolarAngleTickLocationExponentLocationDistanceLODThresholdViewAngleLODThreshold",
    header: "vtkPolarAxesActor.h".}
proc GetRequestedNumberOfRadialAxesMinValueSmallestVisiblePolarAngleMinValueTickLocationMinValueExponentLocationMinValueDistanceLODThresholdMinValueViewAngleLODThresholdMinValue*(
    this: var vtkPolarAxesActor): cdouble {.importcpp: "GetRequestedNumberOfRadialAxesMinValueSmallestVisiblePolarAngleMinValueTickLocationMinValueExponentLocationMinValueDistanceLODThresholdMinValueViewAngleLODThresholdMinValue",
                                        header: "vtkPolarAxesActor.h".}
proc GetRequestedNumberOfRadialAxesMaxValueSmallestVisiblePolarAngleMaxValueTickLocationMaxValueExponentLocationMaxValueDistanceLODThresholdMaxValueViewAngleLODThresholdMaxValue*(
    this: var vtkPolarAxesActor): cdouble {.importcpp: "GetRequestedNumberOfRadialAxesMaxValueSmallestVisiblePolarAngleMaxValueTickLocationMaxValueExponentLocationMaxValueDistanceLODThresholdMaxValueViewAngleLODThresholdMaxValue",
                                        header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual double GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSizeExponentLocationEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ViewAngleLODThreshold  of  << this -> ViewAngleLODThreshold ) ; return this -> ViewAngleLODThreshold ; } ;
## Error: expected ';'!!!

proc SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibility*(
    this: var vtkPolarAxesActor; _arg: vtkTypeBool) {.importcpp: "SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibility",
    header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSizeExponentLocationEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdPolarAxisVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PolarAxisVisibility  of  << this -> PolarAxisVisibility ) ; return this -> PolarAxisVisibility ; } ;
## Error: expected ';'!!!

proc PolarAxisVisibilityOn*(this: var vtkPolarAxesActor) {.
    importcpp: "PolarAxisVisibilityOn", header: "vtkPolarAxesActor.h".}
proc PolarAxisVisibilityOff*(this: var vtkPolarAxesActor) {.
    importcpp: "PolarAxisVisibilityOff", header: "vtkPolarAxesActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on and off the visibility of inner radial grid lines
  ##
proc SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlines*(
    this: var vtkPolarAxesActor; _arg: vtkTypeBool) {.importcpp: "SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlines",
    header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSizeExponentLocationEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdPolarAxisVisibilityDrawRadialGridlines ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DrawRadialGridlines  of  << this -> DrawRadialGridlines ) ; return this -> DrawRadialGridlines ; } ;
## Error: expected ';'!!!

proc DrawRadialGridlinesOn*(this: var vtkPolarAxesActor) {.
    importcpp: "DrawRadialGridlinesOn", header: "vtkPolarAxesActor.h".}
proc DrawRadialGridlinesOff*(this: var vtkPolarAxesActor) {.
    importcpp: "DrawRadialGridlinesOff", header: "vtkPolarAxesActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on and off the visibility of inner polar arcs grid lines
  ##
proc SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlines*(
    this: var vtkPolarAxesActor; _arg: vtkTypeBool) {.importcpp: "SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlines",
    header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSizeExponentLocationEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlines ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DrawPolarArcsGridlines  of  << this -> DrawPolarArcsGridlines ) ; return this -> DrawPolarArcsGridlines ; } ;
## Error: expected ';'!!!

proc DrawPolarArcsGridlinesOn*(this: var vtkPolarAxesActor) {.
    importcpp: "DrawPolarArcsGridlinesOn", header: "vtkPolarAxesActor.h".}
proc DrawPolarArcsGridlinesOff*(this: var vtkPolarAxesActor) {.
    importcpp: "DrawPolarArcsGridlinesOff", header: "vtkPolarAxesActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on and off the visibility of titles for polar axis.
  ##
proc SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibility*(
    this: var vtkPolarAxesActor; _arg: vtkTypeBool) {.importcpp: "SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibility",
    header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSizeExponentLocationEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PolarTitleVisibility  of  << this -> PolarTitleVisibility ) ; return this -> PolarTitleVisibility ; } ;
## Error: expected ';'!!!

proc PolarTitleVisibilityOn*(this: var vtkPolarAxesActor) {.
    importcpp: "PolarTitleVisibilityOn", header: "vtkPolarAxesActor.h".}
proc PolarTitleVisibilityOff*(this: var vtkPolarAxesActor) {.
    importcpp: "PolarTitleVisibilityOff", header: "vtkPolarAxesActor.h".}
  ## /@}
type
  vtkPolarAxesActorTitleLocation* {.size: sizeof(cint), importcpp: "vtkPolarAxesActor::TitleLocation",
                                   header: "vtkPolarAxesActor.h".} = enum
    VTK_TITLE_BOTTOM = 0, VTK_TITLE_EXTERN = 1


proc SetRequestedNumberOfRadialAxesSmallestVisiblePolarAngleTickLocationExponentLocationDistanceLODThresholdViewAngleLODThresholdRadialAxisTitleLocation*(
    this: var vtkPolarAxesActor; _arg: cint) {.importcpp: "SetRequestedNumberOfRadialAxesSmallestVisiblePolarAngleTickLocationExponentLocationDistanceLODThresholdViewAngleLODThresholdRadialAxisTitleLocation",
    header: "vtkPolarAxesActor.h".}
proc GetRequestedNumberOfRadialAxesMinValueSmallestVisiblePolarAngleMinValueTickLocationMinValueExponentLocationMinValueDistanceLODThresholdMinValueViewAngleLODThresholdMinValueRadialAxisTitleLocationMinValue*(
    this: var vtkPolarAxesActor): cint {.importcpp: "GetRequestedNumberOfRadialAxesMinValueSmallestVisiblePolarAngleMinValueTickLocationMinValueExponentLocationMinValueDistanceLODThresholdMinValueViewAngleLODThresholdMinValueRadialAxisTitleLocationMinValue",
                                     header: "vtkPolarAxesActor.h".}
proc GetRequestedNumberOfRadialAxesMaxValueSmallestVisiblePolarAngleMaxValueTickLocationMaxValueExponentLocationMaxValueDistanceLODThresholdMaxValueViewAngleLODThresholdMaxValueRadialAxisTitleLocationMaxValue*(
    this: var vtkPolarAxesActor): cint {.importcpp: "GetRequestedNumberOfRadialAxesMaxValueSmallestVisiblePolarAngleMaxValueTickLocationMaxValueExponentLocationMaxValueDistanceLODThresholdMaxValueViewAngleLODThresholdMaxValueRadialAxisTitleLocationMaxValue",
                                     header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual int GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSizeExponentLocationEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityRadialAxisTitleLocation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RadialAxisTitleLocation  of  << this -> RadialAxisTitleLocation ) ; return this -> RadialAxisTitleLocation ; } ;
## Error: expected ';'!!!

proc SetRequestedNumberOfRadialAxesSmallestVisiblePolarAngleTickLocationExponentLocationDistanceLODThresholdViewAngleLODThresholdRadialAxisTitleLocationPolarAxisTitleLocation*(
    this: var vtkPolarAxesActor; _arg: cint) {.importcpp: "SetRequestedNumberOfRadialAxesSmallestVisiblePolarAngleTickLocationExponentLocationDistanceLODThresholdViewAngleLODThresholdRadialAxisTitleLocationPolarAxisTitleLocation",
    header: "vtkPolarAxesActor.h".}
proc GetRequestedNumberOfRadialAxesMinValueSmallestVisiblePolarAngleMinValueTickLocationMinValueExponentLocationMinValueDistanceLODThresholdMinValueViewAngleLODThresholdMinValueRadialAxisTitleLocationMinValuePolarAxisTitleLocationMinValue*(
    this: var vtkPolarAxesActor): cint {.importcpp: "GetRequestedNumberOfRadialAxesMinValueSmallestVisiblePolarAngleMinValueTickLocationMinValueExponentLocationMinValueDistanceLODThresholdMinValueViewAngleLODThresholdMinValueRadialAxisTitleLocationMinValuePolarAxisTitleLocationMinValue",
                                     header: "vtkPolarAxesActor.h".}
proc GetRequestedNumberOfRadialAxesMaxValueSmallestVisiblePolarAngleMaxValueTickLocationMaxValueExponentLocationMaxValueDistanceLODThresholdMaxValueViewAngleLODThresholdMaxValueRadialAxisTitleLocationMaxValuePolarAxisTitleLocationMaxValue*(
    this: var vtkPolarAxesActor): cint {.importcpp: "GetRequestedNumberOfRadialAxesMaxValueSmallestVisiblePolarAngleMaxValueTickLocationMaxValueExponentLocationMaxValueDistanceLODThresholdMaxValueViewAngleLODThresholdMaxValueRadialAxisTitleLocationMaxValuePolarAxisTitleLocationMaxValue",
                                     header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual int GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSizeExponentLocationEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityRadialAxisTitleLocationPolarAxisTitleLocation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PolarAxisTitleLocation  of  << this -> PolarAxisTitleLocation ) ; return this -> PolarAxisTitleLocation ; } ;
## Error: expected ';'!!!

proc SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibility*(
    this: var vtkPolarAxesActor; _arg: vtkTypeBool) {.importcpp: "SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibility",
    header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSizeExponentLocationEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityRadialAxisTitleLocationPolarAxisTitleLocationPolarLabelVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PolarLabelVisibility  of  << this -> PolarLabelVisibility ) ; return this -> PolarLabelVisibility ; } ;
## Error: expected ';'!!!

proc PolarLabelVisibilityOn*(this: var vtkPolarAxesActor) {.
    importcpp: "PolarLabelVisibilityOn", header: "vtkPolarAxesActor.h".}
proc PolarLabelVisibilityOff*(this: var vtkPolarAxesActor) {.
    importcpp: "PolarLabelVisibilityOff", header: "vtkPolarAxesActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  If On, the ticks are drawn from the angle of the polarAxis (i.e. this->MinimalRadius)
  ##  and continue counterclockwise with the step DeltaAngle Major/Minor. if Off, the start angle is
  ##  0.0, i.e.
  ##  the angle on the major radius of the ellipse.
  ##
proc SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxis*(
    this: var vtkPolarAxesActor; _arg: vtkTypeBool) {.importcpp: "SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxis",
    header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSizeExponentLocationEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityRadialAxisTitleLocationPolarAxisTitleLocationPolarLabelVisibilityArcTicksOriginToPolarAxis ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ArcTicksOriginToPolarAxis  of  << this -> ArcTicksOriginToPolarAxis ) ; return this -> ArcTicksOriginToPolarAxis ; } ;
## Error: expected ';'!!!

proc ArcTicksOriginToPolarAxisOn*(this: var vtkPolarAxesActor) {.
    importcpp: "ArcTicksOriginToPolarAxisOn", header: "vtkPolarAxesActor.h".}
proc ArcTicksOriginToPolarAxisOff*(this: var vtkPolarAxesActor) {.
    importcpp: "ArcTicksOriginToPolarAxisOff", header: "vtkPolarAxesActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  If On, the radial axes are drawn from the angle of the polarAxis (i.e. this->MinimalRadius)
  ##  and continue counterclockwise with the step DeltaAngleRadialAxes. if Off, the start angle is
  ##  0.0, i.e.
  ##  the angle on the major radius of the ellipse.
  ##
proc SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxis*(
    this: var vtkPolarAxesActor; _arg: vtkTypeBool) {.importcpp: "SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxis",
    header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSizeExponentLocationEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityRadialAxisTitleLocationPolarAxisTitleLocationPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxis ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RadialAxesOriginToPolarAxis  of  << this -> RadialAxesOriginToPolarAxis ) ; return this -> RadialAxesOriginToPolarAxis ; } ;
## Error: expected ';'!!!

proc RadialAxesOriginToPolarAxisOn*(this: var vtkPolarAxesActor) {.
    importcpp: "RadialAxesOriginToPolarAxisOn", header: "vtkPolarAxesActor.h".}
proc RadialAxesOriginToPolarAxisOff*(this: var vtkPolarAxesActor) {.
    importcpp: "RadialAxesOriginToPolarAxisOff", header: "vtkPolarAxesActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on and off the overall visibility of ticks.
  ##
proc SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibility*(
    this: var vtkPolarAxesActor; _arg: vtkTypeBool) {.importcpp: "SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibility",
    header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSizeExponentLocationEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityRadialAxisTitleLocationPolarAxisTitleLocationPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PolarTickVisibility  of  << this -> PolarTickVisibility ) ; return this -> PolarTickVisibility ; } ;
## Error: expected ';'!!!

proc PolarTickVisibilityOn*(this: var vtkPolarAxesActor) {.
    importcpp: "PolarTickVisibilityOn", header: "vtkPolarAxesActor.h".}
proc PolarTickVisibilityOff*(this: var vtkPolarAxesActor) {.
    importcpp: "PolarTickVisibilityOff", header: "vtkPolarAxesActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on and off the visibility of major ticks on polar axis and last radial axis.
  ##
proc SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibility*(
    this: var vtkPolarAxesActor; _arg: vtkTypeBool) {.importcpp: "SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibility",
    header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSizeExponentLocationEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityRadialAxisTitleLocationPolarAxisTitleLocationPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AxisTickVisibility  of  << this -> AxisTickVisibility ) ; return this -> AxisTickVisibility ; } ;
## Error: expected ';'!!!

proc AxisTickVisibilityOn*(this: var vtkPolarAxesActor) {.
    importcpp: "AxisTickVisibilityOn", header: "vtkPolarAxesActor.h".}
proc AxisTickVisibilityOff*(this: var vtkPolarAxesActor) {.
    importcpp: "AxisTickVisibilityOff", header: "vtkPolarAxesActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on and off the visibility of minor ticks on polar axis and last radial axis.
  ##
proc SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibility*(
    this: var vtkPolarAxesActor; _arg: vtkTypeBool) {.importcpp: "SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibility",
    header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSizeExponentLocationEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityRadialAxisTitleLocationPolarAxisTitleLocationPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AxisMinorTickVisibility  of  << this -> AxisMinorTickVisibility ) ; return this -> AxisMinorTickVisibility ; } ;
## Error: expected ';'!!!

proc AxisMinorTickVisibilityOn*(this: var vtkPolarAxesActor) {.
    importcpp: "AxisMinorTickVisibilityOn", header: "vtkPolarAxesActor.h".}
proc AxisMinorTickVisibilityOff*(this: var vtkPolarAxesActor) {.
    importcpp: "AxisMinorTickVisibilityOff", header: "vtkPolarAxesActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on and off the visibility of major ticks on the last arc.
  ##
proc SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibility*(
    this: var vtkPolarAxesActor; _arg: vtkTypeBool) {.importcpp: "SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibility",
    header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSizeExponentLocationEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityRadialAxisTitleLocationPolarAxisTitleLocationPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ArcTickVisibility  of  << this -> ArcTickVisibility ) ; return this -> ArcTickVisibility ; } ;
## Error: expected ';'!!!

proc ArcTickVisibilityOn*(this: var vtkPolarAxesActor) {.
    importcpp: "ArcTickVisibilityOn", header: "vtkPolarAxesActor.h".}
proc ArcTickVisibilityOff*(this: var vtkPolarAxesActor) {.
    importcpp: "ArcTickVisibilityOff", header: "vtkPolarAxesActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on and off the visibility of minor ticks on the last arc.
  ##
proc SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibility*(
    this: var vtkPolarAxesActor; _arg: vtkTypeBool) {.importcpp: "SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibility",
    header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSizeExponentLocationEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityRadialAxisTitleLocationPolarAxisTitleLocationPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ArcMinorTickVisibility  of  << this -> ArcMinorTickVisibility ) ; return this -> ArcMinorTickVisibility ; } ;
## Error: expected ';'!!!

proc ArcMinorTickVisibilityOn*(this: var vtkPolarAxesActor) {.
    importcpp: "ArcMinorTickVisibilityOn", header: "vtkPolarAxesActor.h".}
proc ArcMinorTickVisibilityOff*(this: var vtkPolarAxesActor) {.
    importcpp: "ArcMinorTickVisibilityOff", header: "vtkPolarAxesActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the size of the major ticks on the last arc.
  ##
proc SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSize*(
    this: var vtkPolarAxesActor; _arg: cdouble) {.importcpp: "SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSize",
    header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual double GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSizeExponentLocationEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityRadialAxisTitleLocationPolarAxisTitleLocationPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ArcMajorTickSize  of  << this -> ArcMajorTickSize ) ; return this -> ArcMajorTickSize ; } ;
## Error: expected ';'!!!

proc SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSize*(
    this: var vtkPolarAxesActor; _arg: cdouble) {.importcpp: "SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSize",
    header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual double GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSizeExponentLocationEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityRadialAxisTitleLocationPolarAxisTitleLocationPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PolarAxisMajorTickSize  of  << this -> PolarAxisMajorTickSize ) ; return this -> PolarAxisMajorTickSize ; } ;
## Error: expected ';'!!!

proc SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSize*(
    this: var vtkPolarAxesActor; _arg: cdouble) {.importcpp: "SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSize",
    header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual double GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSizeExponentLocationEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityRadialAxisTitleLocationPolarAxisTitleLocationPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LastRadialAxisMajorTickSize  of  << this -> LastRadialAxisMajorTickSize ) ; return this -> LastRadialAxisMajorTickSize ; } ;
## Error: expected ';'!!!

proc SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSize*(
    this: var vtkPolarAxesActor; _arg: cdouble) {.importcpp: "SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSize",
    header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual double GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSizeExponentLocationEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityRadialAxisTitleLocationPolarAxisTitleLocationPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PolarAxisTickRatioSize  of  << this -> PolarAxisTickRatioSize ) ; return this -> PolarAxisTickRatioSize ; } ;
## Error: expected ';'!!!

proc SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSize*(
    this: var vtkPolarAxesActor; _arg: cdouble) {.importcpp: "SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSize",
    header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual double GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSizeExponentLocationEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityRadialAxisTitleLocationPolarAxisTitleLocationPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LastAxisTickRatioSize  of  << this -> LastAxisTickRatioSize ) ; return this -> LastAxisTickRatioSize ; } ;
## Error: expected ';'!!!

proc SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSize*(
    this: var vtkPolarAxesActor; _arg: cdouble) {.importcpp: "SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSize",
    header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual double GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSizeExponentLocationEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityRadialAxisTitleLocationPolarAxisTitleLocationPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ArcTickRatioSize  of  << this -> ArcTickRatioSize ) ; return this -> ArcTickRatioSize ; } ;
## Error: expected ';'!!!

proc SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThickness*(
    this: var vtkPolarAxesActor; _arg: cdouble) {.importcpp: "SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThickness",
    header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual double GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSizeExponentLocationEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityRadialAxisTitleLocationPolarAxisTitleLocationPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThickness ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PolarAxisMajorTickThickness  of  << this -> PolarAxisMajorTickThickness ) ; return this -> PolarAxisMajorTickThickness ; } ;
## Error: expected ';'!!!

proc SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThicknessLastRadialAxisMajorTickThickness*(
    this: var vtkPolarAxesActor; _arg: cdouble) {.importcpp: "SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThicknessLastRadialAxisMajorTickThickness",
    header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual double GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSizeExponentLocationEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityRadialAxisTitleLocationPolarAxisTitleLocationPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThicknessLastRadialAxisMajorTickThickness ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LastRadialAxisMajorTickThickness  of  << this -> LastRadialAxisMajorTickThickness ) ; return this -> LastRadialAxisMajorTickThickness ; } ;
## Error: expected ';'!!!

proc SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThicknessLastRadialAxisMajorTickThicknessArcMajorTickThickness*(
    this: var vtkPolarAxesActor; _arg: cdouble) {.importcpp: "SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThicknessLastRadialAxisMajorTickThicknessArcMajorTickThickness",
    header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual double GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSizeExponentLocationEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityRadialAxisTitleLocationPolarAxisTitleLocationPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThicknessLastRadialAxisMajorTickThicknessArcMajorTickThickness ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ArcMajorTickThickness  of  << this -> ArcMajorTickThickness ) ; return this -> ArcMajorTickThickness ; } ;
## Error: expected ';'!!!

proc SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThicknessLastRadialAxisMajorTickThicknessArcMajorTickThicknessPolarAxisTickRatioThickness*(
    this: var vtkPolarAxesActor; _arg: cdouble) {.importcpp: "SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThicknessLastRadialAxisMajorTickThicknessArcMajorTickThicknessPolarAxisTickRatioThickness",
    header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual double GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSizeExponentLocationEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityRadialAxisTitleLocationPolarAxisTitleLocationPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThicknessLastRadialAxisMajorTickThicknessArcMajorTickThicknessPolarAxisTickRatioThickness ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PolarAxisTickRatioThickness  of  << this -> PolarAxisTickRatioThickness ) ; return this -> PolarAxisTickRatioThickness ; } ;
## Error: expected ';'!!!

proc SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThicknessLastRadialAxisMajorTickThicknessArcMajorTickThicknessPolarAxisTickRatioThicknessLastAxisTickRatioThickness*(
    this: var vtkPolarAxesActor; _arg: cdouble) {.importcpp: "SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThicknessLastRadialAxisMajorTickThicknessArcMajorTickThicknessPolarAxisTickRatioThicknessLastAxisTickRatioThickness",
    header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual double GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSizeExponentLocationEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityRadialAxisTitleLocationPolarAxisTitleLocationPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThicknessLastRadialAxisMajorTickThicknessArcMajorTickThicknessPolarAxisTickRatioThicknessLastAxisTickRatioThickness ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LastAxisTickRatioThickness  of  << this -> LastAxisTickRatioThickness ) ; return this -> LastAxisTickRatioThickness ; } ;
## Error: expected ';'!!!

proc SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThicknessLastRadialAxisMajorTickThicknessArcMajorTickThicknessPolarAxisTickRatioThicknessLastAxisTickRatioThicknessArcTickRatioThickness*(
    this: var vtkPolarAxesActor; _arg: cdouble) {.importcpp: "SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThicknessLastRadialAxisMajorTickThicknessArcMajorTickThicknessPolarAxisTickRatioThicknessLastAxisTickRatioThicknessArcTickRatioThickness",
    header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual double GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSizeExponentLocationEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityRadialAxisTitleLocationPolarAxisTitleLocationPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThicknessLastRadialAxisMajorTickThicknessArcMajorTickThicknessPolarAxisTickRatioThicknessLastAxisTickRatioThicknessArcTickRatioThickness ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ArcTickRatioThickness  of  << this -> ArcTickRatioThickness ) ; return this -> ArcTickRatioThickness ; } ;
## Error: expected ';'!!!

proc SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThicknessLastRadialAxisMajorTickThicknessArcMajorTickThicknessPolarAxisTickRatioThicknessLastAxisTickRatioThicknessArcTickRatioThicknessDeltaRangeMajor*(
    this: var vtkPolarAxesActor; _arg: cdouble) {.importcpp: "SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThicknessLastRadialAxisMajorTickThicknessArcMajorTickThicknessPolarAxisTickRatioThicknessLastAxisTickRatioThicknessArcTickRatioThicknessDeltaRangeMajor",
    header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual double GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSizeExponentLocationEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityRadialAxisTitleLocationPolarAxisTitleLocationPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThicknessLastRadialAxisMajorTickThicknessArcMajorTickThicknessPolarAxisTickRatioThicknessLastAxisTickRatioThicknessArcTickRatioThicknessDeltaRangeMajor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DeltaRangeMajor  of  << this -> DeltaRangeMajor ) ; return this -> DeltaRangeMajor ; } ;
## Error: expected ';'!!!

proc SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThicknessLastRadialAxisMajorTickThicknessArcMajorTickThicknessPolarAxisTickRatioThicknessLastAxisTickRatioThicknessArcTickRatioThicknessDeltaRangeMajorDeltaRangeMinor*(
    this: var vtkPolarAxesActor; _arg: cdouble) {.importcpp: "SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThicknessLastRadialAxisMajorTickThicknessArcMajorTickThicknessPolarAxisTickRatioThicknessLastAxisTickRatioThicknessArcTickRatioThicknessDeltaRangeMajorDeltaRangeMinor",
    header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual double GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSizeExponentLocationEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityRadialAxisTitleLocationPolarAxisTitleLocationPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThicknessLastRadialAxisMajorTickThicknessArcMajorTickThicknessPolarAxisTickRatioThicknessLastAxisTickRatioThicknessArcTickRatioThicknessDeltaRangeMajorDeltaRangeMinor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DeltaRangeMinor  of  << this -> DeltaRangeMinor ) ; return this -> DeltaRangeMinor ; } ;
## Error: expected ';'!!!

proc SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThicknessLastRadialAxisMajorTickThicknessArcMajorTickThicknessPolarAxisTickRatioThicknessLastAxisTickRatioThicknessArcTickRatioThicknessDeltaRangeMajorDeltaRangeMinorDeltaAngleMajor*(
    this: var vtkPolarAxesActor; _arg: cdouble) {.importcpp: "SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThicknessLastRadialAxisMajorTickThicknessArcMajorTickThicknessPolarAxisTickRatioThicknessLastAxisTickRatioThicknessArcTickRatioThicknessDeltaRangeMajorDeltaRangeMinorDeltaAngleMajor",
    header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual double GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSizeExponentLocationEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityRadialAxisTitleLocationPolarAxisTitleLocationPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThicknessLastRadialAxisMajorTickThicknessArcMajorTickThicknessPolarAxisTickRatioThicknessLastAxisTickRatioThicknessArcTickRatioThicknessDeltaRangeMajorDeltaRangeMinorDeltaAngleMajor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DeltaAngleMajor  of  << this -> DeltaAngleMajor ) ; return this -> DeltaAngleMajor ; } ;
## Error: expected ';'!!!

proc SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThicknessLastRadialAxisMajorTickThicknessArcMajorTickThicknessPolarAxisTickRatioThicknessLastAxisTickRatioThicknessArcTickRatioThicknessDeltaRangeMajorDeltaRangeMinorDeltaAngleMajorDeltaAngleMinor*(
    this: var vtkPolarAxesActor; _arg: cdouble) {.importcpp: "SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThicknessLastRadialAxisMajorTickThicknessArcMajorTickThicknessPolarAxisTickRatioThicknessLastAxisTickRatioThicknessArcTickRatioThicknessDeltaRangeMajorDeltaRangeMinorDeltaAngleMajorDeltaAngleMinor",
    header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual double GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSizeExponentLocationEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityRadialAxisTitleLocationPolarAxisTitleLocationPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThicknessLastRadialAxisMajorTickThicknessArcMajorTickThicknessPolarAxisTickRatioThicknessLastAxisTickRatioThicknessArcTickRatioThicknessDeltaRangeMajorDeltaRangeMinorDeltaAngleMajorDeltaAngleMinor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DeltaAngleMinor  of  << this -> DeltaAngleMinor ) ; return this -> DeltaAngleMinor ; } ;
## Error: expected ';'!!!

proc SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThicknessLastRadialAxisMajorTickThicknessArcMajorTickThicknessPolarAxisTickRatioThicknessLastAxisTickRatioThicknessArcTickRatioThicknessDeltaRangeMajorDeltaRangeMinorDeltaAngleMajorDeltaAngleMinorDeltaAngleRadialAxes*(
    this: var vtkPolarAxesActor; _arg: cdouble) {.importcpp: "SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThicknessLastRadialAxisMajorTickThicknessArcMajorTickThicknessPolarAxisTickRatioThicknessLastAxisTickRatioThicknessArcTickRatioThicknessDeltaRangeMajorDeltaRangeMinorDeltaAngleMajorDeltaAngleMinorDeltaAngleRadialAxes",
    header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual double GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSizeExponentLocationEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityRadialAxisTitleLocationPolarAxisTitleLocationPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThicknessLastRadialAxisMajorTickThicknessArcMajorTickThicknessPolarAxisTickRatioThicknessLastAxisTickRatioThicknessArcTickRatioThicknessDeltaRangeMajorDeltaRangeMinorDeltaAngleMajorDeltaAngleMinorDeltaAngleRadialAxes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DeltaAngleRadialAxes  of  << this -> DeltaAngleRadialAxes ) ; return this -> DeltaAngleRadialAxes ; } ;
## Error: expected ';'!!!

proc SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThicknessLastRadialAxisMajorTickThicknessArcMajorTickThicknessPolarAxisTickRatioThicknessLastAxisTickRatioThicknessArcTickRatioThicknessDeltaRangeMajorDeltaRangeMinorDeltaAngleMajorDeltaAngleMinorDeltaAngleRadialAxesRadialAxesVisibility*(
    this: var vtkPolarAxesActor; _arg: vtkTypeBool) {.importcpp: "SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThicknessLastRadialAxisMajorTickThicknessArcMajorTickThicknessPolarAxisTickRatioThicknessLastAxisTickRatioThicknessArcTickRatioThicknessDeltaRangeMajorDeltaRangeMinorDeltaAngleMajorDeltaAngleMinorDeltaAngleRadialAxesRadialAxesVisibility",
    header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSizeExponentLocationEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityRadialAxisTitleLocationPolarAxisTitleLocationPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThicknessLastRadialAxisMajorTickThicknessArcMajorTickThicknessPolarAxisTickRatioThicknessLastAxisTickRatioThicknessArcTickRatioThicknessDeltaRangeMajorDeltaRangeMinorDeltaAngleMajorDeltaAngleMinorDeltaAngleRadialAxesRadialAxesVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RadialAxesVisibility  of  << this -> RadialAxesVisibility ) ; return this -> RadialAxesVisibility ; } ;
## Error: expected ';'!!!

proc RadialAxesVisibilityOn*(this: var vtkPolarAxesActor) {.
    importcpp: "RadialAxesVisibilityOn", header: "vtkPolarAxesActor.h".}
proc RadialAxesVisibilityOff*(this: var vtkPolarAxesActor) {.
    importcpp: "RadialAxesVisibilityOff", header: "vtkPolarAxesActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on and off the visibility of titles for non-polar radial axes.
  ##
proc SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThicknessLastRadialAxisMajorTickThicknessArcMajorTickThicknessPolarAxisTickRatioThicknessLastAxisTickRatioThicknessArcTickRatioThicknessDeltaRangeMajorDeltaRangeMinorDeltaAngleMajorDeltaAngleMinorDeltaAngleRadialAxesRadialAxesVisibilityRadialTitleVisibility*(
    this: var vtkPolarAxesActor; _arg: vtkTypeBool) {.importcpp: "SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThicknessLastRadialAxisMajorTickThicknessArcMajorTickThicknessPolarAxisTickRatioThicknessLastAxisTickRatioThicknessArcTickRatioThicknessDeltaRangeMajorDeltaRangeMinorDeltaAngleMajorDeltaAngleMinorDeltaAngleRadialAxesRadialAxesVisibilityRadialTitleVisibility",
    header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSizeExponentLocationEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityRadialAxisTitleLocationPolarAxisTitleLocationPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThicknessLastRadialAxisMajorTickThicknessArcMajorTickThicknessPolarAxisTickRatioThicknessLastAxisTickRatioThicknessArcTickRatioThicknessDeltaRangeMajorDeltaRangeMinorDeltaAngleMajorDeltaAngleMinorDeltaAngleRadialAxesRadialAxesVisibilityRadialTitleVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RadialTitleVisibility  of  << this -> RadialTitleVisibility ) ; return this -> RadialTitleVisibility ; } ;
## Error: expected ';'!!!

proc RadialTitleVisibilityOn*(this: var vtkPolarAxesActor) {.
    importcpp: "RadialTitleVisibilityOn", header: "vtkPolarAxesActor.h".}
proc RadialTitleVisibilityOff*(this: var vtkPolarAxesActor) {.
    importcpp: "RadialTitleVisibilityOff", header: "vtkPolarAxesActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on and off the visibility of arcs for polar axis.
  ##
proc SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThicknessLastRadialAxisMajorTickThicknessArcMajorTickThicknessPolarAxisTickRatioThicknessLastAxisTickRatioThicknessArcTickRatioThicknessDeltaRangeMajorDeltaRangeMinorDeltaAngleMajorDeltaAngleMinorDeltaAngleRadialAxesRadialAxesVisibilityRadialTitleVisibilityPolarArcsVisibility*(
    this: var vtkPolarAxesActor; _arg: vtkTypeBool) {.importcpp: "SetLogAutoSubdividePolarAxisRadialUnitsScreenSizeEnableDistanceLODEnableViewAngleLODPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThicknessLastRadialAxisMajorTickThicknessArcMajorTickThicknessPolarAxisTickRatioThicknessLastAxisTickRatioThicknessArcTickRatioThicknessDeltaRangeMajorDeltaRangeMinorDeltaAngleMajorDeltaAngleMinorDeltaAngleRadialAxesRadialAxesVisibilityRadialTitleVisibilityPolarArcsVisibility",
    header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSizeExponentLocationEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityRadialAxisTitleLocationPolarAxisTitleLocationPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThicknessLastRadialAxisMajorTickThicknessArcMajorTickThicknessPolarAxisTickRatioThicknessLastAxisTickRatioThicknessArcTickRatioThicknessDeltaRangeMajorDeltaRangeMinorDeltaAngleMajorDeltaAngleMinorDeltaAngleRadialAxesRadialAxesVisibilityRadialTitleVisibilityPolarArcsVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PolarArcsVisibility  of  << this -> PolarArcsVisibility ) ; return this -> PolarArcsVisibility ; } ;
## Error: expected ';'!!!

proc PolarArcsVisibilityOn*(this: var vtkPolarAxesActor) {.
    importcpp: "PolarArcsVisibilityOn", header: "vtkPolarAxesActor.h".}
proc PolarArcsVisibilityOff*(this: var vtkPolarAxesActor) {.
    importcpp: "PolarArcsVisibilityOff", header: "vtkPolarAxesActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Enable/Disable labels 2D mode (always facing the camera).
  ##
proc SetUse2DMode*(this: var vtkPolarAxesActor; val: cint) {.
    importcpp: "SetUse2DMode", header: "vtkPolarAxesActor.h".}
proc GetUse2DMode*(this: var vtkPolarAxesActor): cint {.importcpp: "GetUse2DMode",
    header: "vtkPolarAxesActor.h".}
proc SetPolarAxisTitleTextProperty*(this: var vtkPolarAxesActor;
                                   p: ptr vtkTextProperty) {.
    importcpp: "SetPolarAxisTitleTextProperty", header: "vtkPolarAxesActor.h".}
proc GetnameCameraPolarAxisTitleTextProperty*(this: var vtkPolarAxesActor): ptr vtkTextProperty {.
    importcpp: "GetnameCameraPolarAxisTitleTextProperty",
    header: "vtkPolarAxesActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the polar axis labels text property.
  ##
proc SetPolarAxisLabelTextProperty*(this: var vtkPolarAxesActor;
                                   p: ptr vtkTextProperty) {.
    importcpp: "SetPolarAxisLabelTextProperty", header: "vtkPolarAxesActor.h".}
proc GetnameCameraPolarAxisTitleTextPropertyPolarAxisLabelTextProperty*(
    this: var vtkPolarAxesActor): ptr vtkTextProperty {.importcpp: "GetnameCameraPolarAxisTitleTextPropertyPolarAxisLabelTextProperty",
    header: "vtkPolarAxesActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the last radial axis text property.
  ##
proc SetLastRadialAxisTextProperty*(this: var vtkPolarAxesActor;
                                   p: ptr vtkTextProperty) {.
    importcpp: "SetLastRadialAxisTextProperty", header: "vtkPolarAxesActor.h".}
proc GetnameCameraPolarAxisTitleTextPropertyPolarAxisLabelTextPropertyLastRadialAxisTextProperty*(
    this: var vtkPolarAxesActor): ptr vtkTextProperty {.importcpp: "GetnameCameraPolarAxisTitleTextPropertyPolarAxisLabelTextPropertyLastRadialAxisTextProperty",
    header: "vtkPolarAxesActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the secondary radial axes text property.
  ##
proc SetSecondaryRadialAxesTextProperty*(this: var vtkPolarAxesActor;
                                        p: ptr vtkTextProperty) {.
    importcpp: "SetSecondaryRadialAxesTextProperty", header: "vtkPolarAxesActor.h".}
proc GetnameCameraPolarAxisTitleTextPropertyPolarAxisLabelTextPropertyLastRadialAxisTextPropertySecondaryRadialAxesTextProperty*(
    this: var vtkPolarAxesActor): ptr vtkTextProperty {.importcpp: "GetnameCameraPolarAxisTitleTextPropertyPolarAxisLabelTextPropertyLastRadialAxisTextPropertySecondaryRadialAxesTextProperty",
    header: "vtkPolarAxesActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get/Set polar axis actor properties.
  ##
proc SetPolarAxisProperty*(this: var vtkPolarAxesActor; a2: ptr vtkProperty) {.
    importcpp: "SetPolarAxisProperty", header: "vtkPolarAxesActor.h".}
proc GetnameCameraPolarAxisTitleTextPropertyPolarAxisLabelTextPropertyLastRadialAxisTextPropertySecondaryRadialAxesTextPropertyPolarAxisProperty*(
    this: var vtkPolarAxesActor): ptr vtkProperty {.importcpp: "GetnameCameraPolarAxisTitleTextPropertyPolarAxisLabelTextPropertyLastRadialAxisTextPropertySecondaryRadialAxesTextPropertyPolarAxisProperty",
    header: "vtkPolarAxesActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get/Set last radial axis actor properties.
  ##
proc SetLastRadialAxisProperty*(this: var vtkPolarAxesActor; p: ptr vtkProperty) {.
    importcpp: "SetLastRadialAxisProperty", header: "vtkPolarAxesActor.h".}
proc GetnameCameraPolarAxisTitleTextPropertyPolarAxisLabelTextPropertyLastRadialAxisTextPropertySecondaryRadialAxesTextPropertyPolarAxisPropertyLastRadialAxisProperty*(
    this: var vtkPolarAxesActor): ptr vtkProperty {.importcpp: "GetnameCameraPolarAxisTitleTextPropertyPolarAxisLabelTextPropertyLastRadialAxisTextPropertySecondaryRadialAxesTextPropertyPolarAxisPropertyLastRadialAxisProperty",
    header: "vtkPolarAxesActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get/Set secondary radial axes actors properties.
  ##
proc SetSecondaryRadialAxesProperty*(this: var vtkPolarAxesActor; p: ptr vtkProperty) {.
    importcpp: "SetSecondaryRadialAxesProperty", header: "vtkPolarAxesActor.h".}
proc GetnameCameraPolarAxisTitleTextPropertyPolarAxisLabelTextPropertyLastRadialAxisTextPropertySecondaryRadialAxesTextPropertyPolarAxisPropertyLastRadialAxisPropertySecondaryRadialAxesProperty*(
    this: var vtkPolarAxesActor): ptr vtkProperty {.importcpp: "GetnameCameraPolarAxisTitleTextPropertyPolarAxisLabelTextPropertyLastRadialAxisTextPropertySecondaryRadialAxesTextPropertyPolarAxisPropertyLastRadialAxisPropertySecondaryRadialAxesProperty",
    header: "vtkPolarAxesActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get/Set principal polar arc actor property.
  ##
proc SetPolarArcsProperty*(this: var vtkPolarAxesActor; p: ptr vtkProperty) {.
    importcpp: "SetPolarArcsProperty", header: "vtkPolarAxesActor.h".}
proc GetPolarArcsProperty*(this: var vtkPolarAxesActor): ptr vtkProperty {.
    importcpp: "GetPolarArcsProperty", header: "vtkPolarAxesActor.h".}
proc SetSecondaryPolarArcsProperty*(this: var vtkPolarAxesActor; p: ptr vtkProperty) {.
    importcpp: "SetSecondaryPolarArcsProperty", header: "vtkPolarAxesActor.h".}
proc GetSecondaryPolarArcsProperty*(this: var vtkPolarAxesActor): ptr vtkProperty {.
    importcpp: "GetSecondaryPolarArcsProperty", header: "vtkPolarAxesActor.h".}
proc SetBounds*(this: var vtkPolarAxesActor; _arg1: cdouble; _arg2: cdouble;
               _arg3: cdouble; _arg4: cdouble; _arg5: cdouble; _arg6: cdouble) {.
    importcpp: "SetBounds", header: "vtkPolarAxesActor.h".}
proc SetBounds*(this: var vtkPolarAxesActor; _arg: array[6, cdouble]) {.
    importcpp: "SetBounds", header: "vtkPolarAxesActor.h".}
proc GetBounds*(this: var vtkPolarAxesActor): ptr cdouble {.importcpp: "GetBounds",
    header: "vtkPolarAxesActor.h".}
proc GetBounds*(this: var vtkPolarAxesActor; xmin: var cdouble; xmax: var cdouble;
               ymin: var cdouble; ymax: var cdouble; zmin: var cdouble; zmax: var cdouble) {.
    importcpp: "GetBounds", header: "vtkPolarAxesActor.h".}
proc GetBounds*(this: var vtkPolarAxesActor; bounds: array[6, cdouble]) {.
    importcpp: "GetBounds", header: "vtkPolarAxesActor.h".}
proc SetRequestedNumberOfRadialAxesSmallestVisiblePolarAngleTickLocationExponentLocationDistanceLODThresholdViewAngleLODThresholdRadialAxisTitleLocationPolarAxisTitleLocationRatio*(
    this: var vtkPolarAxesActor; _arg: cdouble) {.importcpp: "SetRequestedNumberOfRadialAxesSmallestVisiblePolarAngleTickLocationExponentLocationDistanceLODThresholdViewAngleLODThresholdRadialAxisTitleLocationPolarAxisTitleLocationRatio",
    header: "vtkPolarAxesActor.h".}
proc GetRequestedNumberOfRadialAxesMinValueSmallestVisiblePolarAngleMinValueTickLocationMinValueExponentLocationMinValueDistanceLODThresholdMinValueViewAngleLODThresholdMinValueRadialAxisTitleLocationMinValuePolarAxisTitleLocationMinValueRatioMinValue*(
    this: var vtkPolarAxesActor): cdouble {.importcpp: "GetRequestedNumberOfRadialAxesMinValueSmallestVisiblePolarAngleMinValueTickLocationMinValueExponentLocationMinValueDistanceLODThresholdMinValueViewAngleLODThresholdMinValueRadialAxisTitleLocationMinValuePolarAxisTitleLocationMinValueRatioMinValue",
                                        header: "vtkPolarAxesActor.h".}
proc GetRequestedNumberOfRadialAxesMaxValueSmallestVisiblePolarAngleMaxValueTickLocationMaxValueExponentLocationMaxValueDistanceLODThresholdMaxValueViewAngleLODThresholdMaxValueRadialAxisTitleLocationMaxValuePolarAxisTitleLocationMaxValueRatioMaxValue*(
    this: var vtkPolarAxesActor): cdouble {.importcpp: "GetRequestedNumberOfRadialAxesMaxValueSmallestVisiblePolarAngleMaxValueTickLocationMaxValueExponentLocationMaxValueDistanceLODThresholdMaxValueViewAngleLODThresholdMaxValueRadialAxisTitleLocationMaxValuePolarAxisTitleLocationMaxValueRatioMaxValue",
                                        header: "vtkPolarAxesActor.h".}
## !!!Ignored construct:  virtual double GetLogRequestedNumberOfRadialAxesAutoSubdividePolarAxisMinimumRadiusMaximumRadiusMinimumAngleMaximumAngleSmallestVisiblePolarAngleTickLocationRadialUnitsScreenSizeExponentLocationEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdPolarAxisVisibilityDrawRadialGridlinesDrawPolarArcsGridlinesPolarTitleVisibilityRadialAxisTitleLocationPolarAxisTitleLocationPolarLabelVisibilityArcTicksOriginToPolarAxisRadialAxesOriginToPolarAxisPolarTickVisibilityAxisTickVisibilityAxisMinorTickVisibilityArcTickVisibilityArcMinorTickVisibilityArcMajorTickSizePolarAxisMajorTickSizeLastRadialAxisMajorTickSizePolarAxisTickRatioSizeLastAxisTickRatioSizeArcTickRatioSizePolarAxisMajorTickThicknessLastRadialAxisMajorTickThicknessArcMajorTickThicknessPolarAxisTickRatioThicknessLastAxisTickRatioThicknessArcTickRatioThicknessDeltaRangeMajorDeltaRangeMinorDeltaAngleMajorDeltaAngleMinorDeltaAngleRadialAxesRadialAxesVisibilityRadialTitleVisibilityPolarArcsVisibilityRatio ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Ratio  of  << this -> Ratio ) ; return this -> Ratio ; } ;
## Error: expected ';'!!!
