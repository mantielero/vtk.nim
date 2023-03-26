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
##  @class   vtkCubeAxesActor
##  @brief   create a plot of a bounding box edges -
##  used for navigation
##
##  vtkCubeAxesActor is a composite actor that draws axes of the
##  bounding box of an input dataset. The axes include labels and titles
##  for the x-y-z axes. The algorithm selects which axes to draw based
##  on the user-defined 'fly' mode.  (STATIC is default).
##  'STATIC' constructs axes from all edges of the bounding box.
##  'CLOSEST_TRIAD' consists of the three axes x-y-z forming a triad that
##  lies closest to the specified camera.
##  'FURTHEST_TRIAD' consists of the three axes x-y-z forming a triad that
##  lies furthest from the specified camera.
##  'OUTER_EDGES' is constructed from edges that are on the "exterior" of the
##  bounding box, exterior as determined from examining outer edges of the
##  bounding box in projection (display) space.
##
##  To use this object you must define a bounding box and the camera used
##  to render the vtkCubeAxesActor. You can optionally turn on/off labels,
##  ticks, gridlines, and set tick location, number of labels, and text to
##  use for axis-titles.  A 'corner offset' can also be set.  This allows
##  the axes to be set partially away from the actual bounding box to perhaps
##  prevent overlap of labels between the various axes.
##
##  The Bounds instance variable (an array of six doubles) is used to determine
##  the bounding box.
##
##  @par Thanks:
##  This class was written by:
##  Hank Childs, Kathleen Bonnell, Amy Squillacote, Brad Whitlock, Will Schroeder,
##  Eric Brugger, Daniel Aguilera, Claire Guilbaud, Nicolas Dolegieviez,
##  Aashish Chaudhary, Philippe Pebay, David Gobbi, David Partyka, Utkarsh Ayachit
##  David Cole, Francois Bertel, and Mark Olesen
##  Part of this work was supported by CEA/DIF - Commissariat a l'Energie Atomique,
##  Centre DAM Ile-De-France, BP12, F-91297 Arpajon, France.
##
##  @sa
##  vtkActor vtkAxisActor vtkCubeAxesActor2D
##

import
  vtkActor, vtkRenderingAnnotationModule

discard "forward decl of vtkAxisActor"
discard "forward decl of vtkCamera"
discard "forward decl of vtkTextProperty"
discard "forward decl of vtkStringArray"
type
  vtkCubeAxesActor* {.importcpp: "vtkCubeAxesActor", header: "vtkCubeAxesActor.h",
                     bycopy.} = object of vtkActor
    vtkCubeAxesActor* {.importc: "vtkCubeAxesActor".}: VTK_NEWINSTANCE
    ##  Expose internally closest axis index computation
    ## *
    ##  Flag for axes stickiness
    ##
    ## *
    ##  Flag for centering sticky axes
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
    ## /@}
    ## /@{
    ## *
    ##  Major start and delta values, in each direction.
    ##  These values are needed for inner grid lines generation
    ##
    ## /@}

  vtkCubeAxesActorSuperclass* = vtkActor

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCubeAxesActor::IsTypeOf(@)", header: "vtkCubeAxesActor.h".}
proc IsA*(this: var vtkCubeAxesActor; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkCubeAxesActor.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCubeAxesActor {.
    importcpp: "vtkCubeAxesActor::SafeDownCast(@)", header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCubeAxesActor :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkActor :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCubeAxesActor :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCubeAxesActor :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCubeAxesActor; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCubeAxesActor.h".}
proc New*(): ptr vtkCubeAxesActor {.importcpp: "vtkCubeAxesActor::New(@)",
                                header: "vtkCubeAxesActor.h".}
proc RenderOpaqueGeometry*(this: var vtkCubeAxesActor; a2: ptr vtkViewport): cint {.
    importcpp: "RenderOpaqueGeometry", header: "vtkCubeAxesActor.h".}
proc RenderTranslucentGeometry*(this: var vtkCubeAxesActor; a2: ptr vtkViewport): cint {.
    importcpp: "RenderTranslucentGeometry", header: "vtkCubeAxesActor.h".}
proc RenderTranslucentPolygonalGeometry*(this: var vtkCubeAxesActor;
                                        a2: ptr vtkViewport): cint {.
    importcpp: "RenderTranslucentPolygonalGeometry", header: "vtkCubeAxesActor.h".}
proc RenderOverlay*(this: var vtkCubeAxesActor; a2: ptr vtkViewport): cint {.
    importcpp: "RenderOverlay", header: "vtkCubeAxesActor.h".}
proc HasTranslucentPolygonalGeometry*(this: var vtkCubeAxesActor): vtkTypeBool {.
    importcpp: "HasTranslucentPolygonalGeometry", header: "vtkCubeAxesActor.h".}
proc SetRebuildAxes*(this: var vtkCubeAxesActor; _arg: bool) {.
    importcpp: "SetRebuildAxes", header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual bool GetRebuildAxes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RebuildAxes  of  << this -> RebuildAxes ) ; return this -> RebuildAxes ; } ;
## Error: expected ';'!!!

proc SetBounds*(this: var vtkCubeAxesActor; _arg1: cdouble; _arg2: cdouble;
               _arg3: cdouble; _arg4: cdouble; _arg5: cdouble; _arg6: cdouble) {.
    importcpp: "SetBounds", header: "vtkCubeAxesActor.h".}
proc SetBounds*(this: var vtkCubeAxesActor; _arg: array[6, cdouble]) {.
    importcpp: "SetBounds", header: "vtkCubeAxesActor.h".}
## using statement

## !!!Ignored construct:  double * GetBounds ( ) VTK_SIZEHINT ( 6 ) override { return this -> Bounds ; } /@} /@{ *
##  Method used to properly return the bounds of the cube axis itself with all
##  its labels.
##  virtual void GetRenderedBounds ( double rBounds [ 6 ] ) ;
## Error: expected ';'!!!

proc GetRenderedBounds*(this: var vtkCubeAxesActor): ptr cdouble {.
    importcpp: "GetRenderedBounds", header: "vtkCubeAxesActor.h".}
proc SetXAxisRange*(this: var vtkCubeAxesActor; _arg1: cdouble; _arg2: cdouble) {.
    importcpp: "SetXAxisRange", header: "vtkCubeAxesActor.h".}
proc SetXAxisRange*(this: var vtkCubeAxesActor; _arg: array[2, cdouble]) {.
    importcpp: "SetXAxisRange", header: "vtkCubeAxesActor.h".}
proc SetXAxisRangeYAxisRange*(this: var vtkCubeAxesActor; _arg1: cdouble;
                             _arg2: cdouble) {.
    importcpp: "SetXAxisRangeYAxisRange", header: "vtkCubeAxesActor.h".}
proc SetXAxisRangeYAxisRange*(this: var vtkCubeAxesActor; _arg: array[2, cdouble]) {.
    importcpp: "SetXAxisRangeYAxisRange", header: "vtkCubeAxesActor.h".}
proc SetXAxisRangeYAxisRangeZAxisRange*(this: var vtkCubeAxesActor; _arg1: cdouble;
                                       _arg2: cdouble) {.
    importcpp: "SetXAxisRangeYAxisRangeZAxisRange", header: "vtkCubeAxesActor.h".}
proc SetXAxisRangeYAxisRangeZAxisRange*(this: var vtkCubeAxesActor;
                                       _arg: array[2, cdouble]) {.
    importcpp: "SetXAxisRangeYAxisRangeZAxisRange", header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual double * GetXAxisRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << XAxisRange  pointer  << this -> XAxisRange ) ; return this -> XAxisRange ; } VTK_WRAPEXCLUDE virtual void GetXAxisRange ( double & _arg1 , double & _arg2 ) { _arg1 = this -> XAxisRange [ 0 ] ; _arg2 = this -> XAxisRange [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << XAxisRange  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetXAxisRange ( double _arg [ 2 ] ) { this -> GetXAxisRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual double * GetXAxisRangeYAxisRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << YAxisRange  pointer  << this -> YAxisRange ) ; return this -> YAxisRange ; } VTK_WRAPEXCLUDE virtual void GetXAxisRangeYAxisRange ( double & _arg1 , double & _arg2 ) { _arg1 = this -> YAxisRange [ 0 ] ; _arg2 = this -> YAxisRange [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << YAxisRange  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetXAxisRangeYAxisRange ( double _arg [ 2 ] ) { this -> GetXAxisRangeYAxisRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc GetAxisLabels*(this: var vtkCubeAxesActor; axis: cint): ptr vtkStringArray {.
    importcpp: "GetAxisLabels", header: "vtkCubeAxesActor.h".}
proc SetAxisLabels*(this: var vtkCubeAxesActor; axis: cint; value: ptr vtkStringArray) {.
    importcpp: "SetAxisLabels", header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  /@} virtual double * GetXAxisRangeYAxisRangeZAxisRangeZAxisRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ZAxisRange  pointer  << this -> ZAxisRange ) ; return this -> ZAxisRange ; } VTK_WRAPEXCLUDE virtual void GetXAxisRangeYAxisRangeZAxisRangeZAxisRange ( double & _arg1 , double & _arg2 ) { _arg1 = this -> ZAxisRange [ 0 ] ; _arg2 = this -> ZAxisRange [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << ZAxisRange  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetXAxisRangeYAxisRangeZAxisRangeZAxisRange ( double _arg [ 2 ] ) { this -> GetXAxisRangeYAxisRangeZAxisRangeZAxisRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetScreenSize*(this: var vtkCubeAxesActor; screenSize: cdouble) {.
    importcpp: "SetScreenSize", header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual double GetRebuildAxesScreenSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScreenSize  of  << this -> ScreenSize ) ; return this -> ScreenSize ; } ;
## Error: expected ';'!!!

proc SetLabelOffset*(this: var vtkCubeAxesActor; offset: cdouble) {.
    importcpp: "SetLabelOffset", header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual double GetRebuildAxesScreenSizeLabelOffset ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LabelOffset  of  << this -> LabelOffset ) ; return this -> LabelOffset ; } ;
## Error: expected ';'!!!

proc SetTitleOffset*(this: var vtkCubeAxesActor; offset: cdouble) {.
    importcpp: "SetTitleOffset", header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual double GetRebuildAxesScreenSizeLabelOffsetTitleOffset ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TitleOffset  of  << this -> TitleOffset ) ; return this -> TitleOffset ; } ;
## Error: expected ';'!!!

proc SetCamera*(this: var vtkCubeAxesActor; a2: ptr vtkCamera) {.
    importcpp: "SetCamera", header: "vtkCubeAxesActor.h".}
proc GetnameCamera*(this: var vtkCubeAxesActor): ptr vtkCamera {.
    importcpp: "GetnameCamera", header: "vtkCubeAxesActor.h".}
  ## /@}
type
  vtkCubeAxesActorFlyMode* {.size: sizeof(cint),
                            importcpp: "vtkCubeAxesActor::FlyMode",
                            header: "vtkCubeAxesActor.h".} = enum
    VTK_FLY_OUTER_EDGES = 0, VTK_FLY_CLOSEST_TRIAD = 1, VTK_FLY_FURTHEST_TRIAD = 2,
    VTK_FLY_STATIC_TRIAD = 3, VTK_FLY_STATIC_EDGES = 4


proc SetFlyMode*(this: var vtkCubeAxesActor; _arg: cint) {.importcpp: "SetFlyMode",
    header: "vtkCubeAxesActor.h".}
proc GetFlyModeMinValue*(this: var vtkCubeAxesActor): cint {.
    importcpp: "GetFlyModeMinValue", header: "vtkCubeAxesActor.h".}
proc GetFlyModeMaxValue*(this: var vtkCubeAxesActor): cint {.
    importcpp: "GetFlyModeMaxValue", header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual int GetRebuildAxesScreenSizeLabelOffsetTitleOffsetFlyMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FlyMode  of  << this -> FlyMode ) ; return this -> FlyMode ; } ;
## Error: expected ';'!!!

proc SetFlyModeToOuterEdges*(this: var vtkCubeAxesActor) {.
    importcpp: "SetFlyModeToOuterEdges", header: "vtkCubeAxesActor.h".}
proc SetFlyModeToClosestTriad*(this: var vtkCubeAxesActor) {.
    importcpp: "SetFlyModeToClosestTriad", header: "vtkCubeAxesActor.h".}
proc SetFlyModeToFurthestTriad*(this: var vtkCubeAxesActor) {.
    importcpp: "SetFlyModeToFurthestTriad", header: "vtkCubeAxesActor.h".}
proc SetFlyModeToStaticTriad*(this: var vtkCubeAxesActor) {.
    importcpp: "SetFlyModeToStaticTriad", header: "vtkCubeAxesActor.h".}
proc SetFlyModeToStaticEdges*(this: var vtkCubeAxesActor) {.
    importcpp: "SetFlyModeToStaticEdges", header: "vtkCubeAxesActor.h".}
proc SetXTitle*(this: var vtkCubeAxesActor; _arg: cstring) {.importcpp: "SetXTitle",
    header: "vtkCubeAxesActor.h".}
proc GetXTitle*(this: var vtkCubeAxesActor): cstring {.importcpp: "GetXTitle",
    header: "vtkCubeAxesActor.h".}
proc SetXTitleXUnits*(this: var vtkCubeAxesActor; _arg: cstring) {.
    importcpp: "SetXTitleXUnits", header: "vtkCubeAxesActor.h".}
proc GetXTitleXUnits*(this: var vtkCubeAxesActor): cstring {.
    importcpp: "GetXTitleXUnits", header: "vtkCubeAxesActor.h".}
proc SetXTitleXUnitsYTitle*(this: var vtkCubeAxesActor; _arg: cstring) {.
    importcpp: "SetXTitleXUnitsYTitle", header: "vtkCubeAxesActor.h".}
proc GetXTitleXUnitsYTitle*(this: var vtkCubeAxesActor): cstring {.
    importcpp: "GetXTitleXUnitsYTitle", header: "vtkCubeAxesActor.h".}
proc SetXTitleXUnitsYTitleYUnits*(this: var vtkCubeAxesActor; _arg: cstring) {.
    importcpp: "SetXTitleXUnitsYTitleYUnits", header: "vtkCubeAxesActor.h".}
proc GetXTitleXUnitsYTitleYUnits*(this: var vtkCubeAxesActor): cstring {.
    importcpp: "GetXTitleXUnitsYTitleYUnits", header: "vtkCubeAxesActor.h".}
proc SetXTitleXUnitsYTitleYUnitsZTitle*(this: var vtkCubeAxesActor; _arg: cstring) {.
    importcpp: "SetXTitleXUnitsYTitleYUnitsZTitle", header: "vtkCubeAxesActor.h".}
proc GetXTitleXUnitsYTitleYUnitsZTitle*(this: var vtkCubeAxesActor): cstring {.
    importcpp: "GetXTitleXUnitsYTitleYUnitsZTitle", header: "vtkCubeAxesActor.h".}
proc SetXTitleXUnitsYTitleYUnitsZTitleZUnits*(this: var vtkCubeAxesActor;
    _arg: cstring) {.importcpp: "SetXTitleXUnitsYTitleYUnitsZTitleZUnits",
                   header: "vtkCubeAxesActor.h".}
proc GetXTitleXUnitsYTitleYUnitsZTitleZUnits*(this: var vtkCubeAxesActor): cstring {.
    importcpp: "GetXTitleXUnitsYTitleYUnitsZTitleZUnits",
    header: "vtkCubeAxesActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the format with which to print the labels on each of the
  ##  x-y-z axes.
  ##
proc SetXTitleXUnitsYTitleYUnitsZTitleZUnitsXLabelFormat*(
    this: var vtkCubeAxesActor; _arg: cstring) {.
    importcpp: "SetXTitleXUnitsYTitleYUnitsZTitleZUnitsXLabelFormat",
    header: "vtkCubeAxesActor.h".}
proc GetXTitleXUnitsYTitleYUnitsZTitleZUnitsXLabelFormat*(
    this: var vtkCubeAxesActor): cstring {.importcpp: "GetXTitleXUnitsYTitleYUnitsZTitleZUnitsXLabelFormat",
                                       header: "vtkCubeAxesActor.h".}
proc SetXTitleXUnitsYTitleYUnitsZTitleZUnitsXLabelFormatYLabelFormat*(
    this: var vtkCubeAxesActor; _arg: cstring) {.importcpp: "SetXTitleXUnitsYTitleYUnitsZTitleZUnitsXLabelFormatYLabelFormat",
    header: "vtkCubeAxesActor.h".}
proc GetXTitleXUnitsYTitleYUnitsZTitleZUnitsXLabelFormatYLabelFormat*(
    this: var vtkCubeAxesActor): cstring {.importcpp: "GetXTitleXUnitsYTitleYUnitsZTitleZUnitsXLabelFormatYLabelFormat",
                                       header: "vtkCubeAxesActor.h".}
proc SetXTitleXUnitsYTitleYUnitsZTitleZUnitsXLabelFormatYLabelFormatZLabelFormat*(
    this: var vtkCubeAxesActor; _arg: cstring) {.importcpp: "SetXTitleXUnitsYTitleYUnitsZTitleZUnitsXLabelFormatYLabelFormatZLabelFormat",
    header: "vtkCubeAxesActor.h".}
proc GetXTitleXUnitsYTitleYUnitsZTitleZUnitsXLabelFormatYLabelFormatZLabelFormat*(
    this: var vtkCubeAxesActor): cstring {.importcpp: "GetXTitleXUnitsYTitleYUnitsZTitleZUnitsXLabelFormatYLabelFormatZLabelFormat",
                                       header: "vtkCubeAxesActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the inertial factor that controls how often (i.e, how
  ##  many renders) the axes can switch position (jump from one axes
  ##  to another).
  ##
proc SetFlyModeInertia*(this: var vtkCubeAxesActor; _arg: cint) {.
    importcpp: "SetFlyModeInertia", header: "vtkCubeAxesActor.h".}
proc GetFlyModeMinValueInertiaMinValue*(this: var vtkCubeAxesActor): cint {.
    importcpp: "GetFlyModeMinValueInertiaMinValue", header: "vtkCubeAxesActor.h".}
proc GetFlyModeMaxValueInertiaMaxValue*(this: var vtkCubeAxesActor): cint {.
    importcpp: "GetFlyModeMaxValueInertiaMaxValue", header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual int GetRebuildAxesScreenSizeLabelOffsetTitleOffsetFlyModeInertia ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Inertia  of  << this -> Inertia ) ; return this -> Inertia ; } ;
## Error: expected ';'!!!

proc SetRebuildAxesCornerOffset*(this: var vtkCubeAxesActor; _arg: cdouble) {.
    importcpp: "SetRebuildAxesCornerOffset", header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual double GetRebuildAxesScreenSizeLabelOffsetTitleOffsetFlyModeInertiaCornerOffset ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CornerOffset  of  << this -> CornerOffset ) ; return this -> CornerOffset ; } ;
## Error: expected ';'!!!

proc ReleaseGraphicsResources*(this: var vtkCubeAxesActor; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkCubeAxesActor.h".}
proc SetRebuildAxesCornerOffsetEnableDistanceLOD*(this: var vtkCubeAxesActor;
    _arg: cint) {.importcpp: "SetRebuildAxesCornerOffsetEnableDistanceLOD",
                header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual int GetRebuildAxesScreenSizeLabelOffsetTitleOffsetFlyModeInertiaCornerOffsetEnableDistanceLOD ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EnableDistanceLOD  of  << this -> EnableDistanceLOD ) ; return this -> EnableDistanceLOD ; } ;
## Error: expected ';'!!!

proc SetFlyModeInertiaDistanceLODThreshold*(this: var vtkCubeAxesActor;
    _arg: cdouble) {.importcpp: "SetFlyModeInertiaDistanceLODThreshold",
                   header: "vtkCubeAxesActor.h".}
proc GetFlyModeMinValueInertiaMinValueDistanceLODThresholdMinValue*(
    this: var vtkCubeAxesActor): cdouble {.importcpp: "GetFlyModeMinValueInertiaMinValueDistanceLODThresholdMinValue",
                                       header: "vtkCubeAxesActor.h".}
proc GetFlyModeMaxValueInertiaMaxValueDistanceLODThresholdMaxValue*(
    this: var vtkCubeAxesActor): cdouble {.importcpp: "GetFlyModeMaxValueInertiaMaxValueDistanceLODThresholdMaxValue",
                                       header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual double GetRebuildAxesScreenSizeLabelOffsetTitleOffsetFlyModeInertiaCornerOffsetEnableDistanceLODDistanceLODThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DistanceLODThreshold  of  << this -> DistanceLODThreshold ) ; return this -> DistanceLODThreshold ; } ;
## Error: expected ';'!!!

proc SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLOD*(
    this: var vtkCubeAxesActor; _arg: cint) {.
    importcpp: "SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLOD",
    header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual int GetRebuildAxesScreenSizeLabelOffsetTitleOffsetFlyModeInertiaCornerOffsetEnableDistanceLODDistanceLODThresholdEnableViewAngleLOD ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EnableViewAngleLOD  of  << this -> EnableViewAngleLOD ) ; return this -> EnableViewAngleLOD ; } ;
## Error: expected ';'!!!

proc SetFlyModeInertiaDistanceLODThresholdViewAngleLODThreshold*(
    this: var vtkCubeAxesActor; _arg: cdouble) {.
    importcpp: "SetFlyModeInertiaDistanceLODThresholdViewAngleLODThreshold",
    header: "vtkCubeAxesActor.h".}
proc GetFlyModeMinValueInertiaMinValueDistanceLODThresholdMinValueViewAngleLODThresholdMinValue*(
    this: var vtkCubeAxesActor): cdouble {.importcpp: "GetFlyModeMinValueInertiaMinValueDistanceLODThresholdMinValueViewAngleLODThresholdMinValue",
                                       header: "vtkCubeAxesActor.h".}
proc GetFlyModeMaxValueInertiaMaxValueDistanceLODThresholdMaxValueViewAngleLODThresholdMaxValue*(
    this: var vtkCubeAxesActor): cdouble {.importcpp: "GetFlyModeMaxValueInertiaMaxValueDistanceLODThresholdMaxValueViewAngleLODThresholdMaxValue",
                                       header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual double GetRebuildAxesScreenSizeLabelOffsetTitleOffsetFlyModeInertiaCornerOffsetEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ViewAngleLODThreshold  of  << this -> ViewAngleLODThreshold ) ; return this -> ViewAngleLODThreshold ; } ;
## Error: expected ';'!!!

proc SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibility*(
    this: var vtkCubeAxesActor; _arg: vtkTypeBool) {.importcpp: "SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibility",
    header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetRebuildAxesScreenSizeLabelOffsetTitleOffsetFlyModeInertiaCornerOffsetEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdXAxisVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << XAxisVisibility  of  << this -> XAxisVisibility ) ; return this -> XAxisVisibility ; } ;
## Error: expected ';'!!!

proc XAxisVisibilityOn*(this: var vtkCubeAxesActor) {.
    importcpp: "XAxisVisibilityOn", header: "vtkCubeAxesActor.h".}
proc XAxisVisibilityOff*(this: var vtkCubeAxesActor) {.
    importcpp: "XAxisVisibilityOff", header: "vtkCubeAxesActor.h".}
proc SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibility*(
    this: var vtkCubeAxesActor; _arg: vtkTypeBool) {.importcpp: "SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibility",
    header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetRebuildAxesScreenSizeLabelOffsetTitleOffsetFlyModeInertiaCornerOffsetEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdXAxisVisibilityYAxisVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << YAxisVisibility  of  << this -> YAxisVisibility ) ; return this -> YAxisVisibility ; } ;
## Error: expected ';'!!!

proc YAxisVisibilityOn*(this: var vtkCubeAxesActor) {.
    importcpp: "YAxisVisibilityOn", header: "vtkCubeAxesActor.h".}
proc YAxisVisibilityOff*(this: var vtkCubeAxesActor) {.
    importcpp: "YAxisVisibilityOff", header: "vtkCubeAxesActor.h".}
proc SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibility*(
    this: var vtkCubeAxesActor; _arg: vtkTypeBool) {.importcpp: "SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibility",
    header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetRebuildAxesScreenSizeLabelOffsetTitleOffsetFlyModeInertiaCornerOffsetEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdXAxisVisibilityYAxisVisibilityZAxisVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ZAxisVisibility  of  << this -> ZAxisVisibility ) ; return this -> ZAxisVisibility ; } ;
## Error: expected ';'!!!

proc ZAxisVisibilityOn*(this: var vtkCubeAxesActor) {.
    importcpp: "ZAxisVisibilityOn", header: "vtkCubeAxesActor.h".}
proc ZAxisVisibilityOff*(this: var vtkCubeAxesActor) {.
    importcpp: "ZAxisVisibilityOff", header: "vtkCubeAxesActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on and off the visibility of labels for each axis.
  ##
proc SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibility*(
    this: var vtkCubeAxesActor; _arg: vtkTypeBool) {.importcpp: "SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibility",
    header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetRebuildAxesScreenSizeLabelOffsetTitleOffsetFlyModeInertiaCornerOffsetEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << XAxisLabelVisibility  of  << this -> XAxisLabelVisibility ) ; return this -> XAxisLabelVisibility ; } ;
## Error: expected ';'!!!

proc XAxisLabelVisibilityOn*(this: var vtkCubeAxesActor) {.
    importcpp: "XAxisLabelVisibilityOn", header: "vtkCubeAxesActor.h".}
proc XAxisLabelVisibilityOff*(this: var vtkCubeAxesActor) {.
    importcpp: "XAxisLabelVisibilityOff", header: "vtkCubeAxesActor.h".}
  ## /@}
proc SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibility*(
    this: var vtkCubeAxesActor; _arg: vtkTypeBool) {.importcpp: "SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibility",
    header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetRebuildAxesScreenSizeLabelOffsetTitleOffsetFlyModeInertiaCornerOffsetEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << YAxisLabelVisibility  of  << this -> YAxisLabelVisibility ) ; return this -> YAxisLabelVisibility ; } ;
## Error: expected ';'!!!

proc YAxisLabelVisibilityOn*(this: var vtkCubeAxesActor) {.
    importcpp: "YAxisLabelVisibilityOn", header: "vtkCubeAxesActor.h".}
proc YAxisLabelVisibilityOff*(this: var vtkCubeAxesActor) {.
    importcpp: "YAxisLabelVisibilityOff", header: "vtkCubeAxesActor.h".}
proc SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibility*(
    this: var vtkCubeAxesActor; _arg: vtkTypeBool) {.importcpp: "SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibility",
    header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetRebuildAxesScreenSizeLabelOffsetTitleOffsetFlyModeInertiaCornerOffsetEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ZAxisLabelVisibility  of  << this -> ZAxisLabelVisibility ) ; return this -> ZAxisLabelVisibility ; } ;
## Error: expected ';'!!!

proc ZAxisLabelVisibilityOn*(this: var vtkCubeAxesActor) {.
    importcpp: "ZAxisLabelVisibilityOn", header: "vtkCubeAxesActor.h".}
proc ZAxisLabelVisibilityOff*(this: var vtkCubeAxesActor) {.
    importcpp: "ZAxisLabelVisibilityOff", header: "vtkCubeAxesActor.h".}
  ## /@{
  ## *
  ##  Turn on and off the visibility of ticks for each axis.
  ##
proc SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibility*(
    this: var vtkCubeAxesActor; _arg: vtkTypeBool) {.importcpp: "SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibility",
    header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetRebuildAxesScreenSizeLabelOffsetTitleOffsetFlyModeInertiaCornerOffsetEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << XAxisTickVisibility  of  << this -> XAxisTickVisibility ) ; return this -> XAxisTickVisibility ; } ;
## Error: expected ';'!!!

proc XAxisTickVisibilityOn*(this: var vtkCubeAxesActor) {.
    importcpp: "XAxisTickVisibilityOn", header: "vtkCubeAxesActor.h".}
proc XAxisTickVisibilityOff*(this: var vtkCubeAxesActor) {.
    importcpp: "XAxisTickVisibilityOff", header: "vtkCubeAxesActor.h".}
  ## /@}
proc SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibility*(
    this: var vtkCubeAxesActor; _arg: vtkTypeBool) {.importcpp: "SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibility",
    header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetRebuildAxesScreenSizeLabelOffsetTitleOffsetFlyModeInertiaCornerOffsetEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << YAxisTickVisibility  of  << this -> YAxisTickVisibility ) ; return this -> YAxisTickVisibility ; } ;
## Error: expected ';'!!!

proc YAxisTickVisibilityOn*(this: var vtkCubeAxesActor) {.
    importcpp: "YAxisTickVisibilityOn", header: "vtkCubeAxesActor.h".}
proc YAxisTickVisibilityOff*(this: var vtkCubeAxesActor) {.
    importcpp: "YAxisTickVisibilityOff", header: "vtkCubeAxesActor.h".}
proc SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibility*(
    this: var vtkCubeAxesActor; _arg: vtkTypeBool) {.importcpp: "SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibility",
    header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetRebuildAxesScreenSizeLabelOffsetTitleOffsetFlyModeInertiaCornerOffsetEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ZAxisTickVisibility  of  << this -> ZAxisTickVisibility ) ; return this -> ZAxisTickVisibility ; } ;
## Error: expected ';'!!!

proc ZAxisTickVisibilityOn*(this: var vtkCubeAxesActor) {.
    importcpp: "ZAxisTickVisibilityOn", header: "vtkCubeAxesActor.h".}
proc ZAxisTickVisibilityOff*(this: var vtkCubeAxesActor) {.
    importcpp: "ZAxisTickVisibilityOff", header: "vtkCubeAxesActor.h".}
  ## /@{
  ## *
  ##  Turn on and off the visibility of minor ticks for each axis.
  ##
proc SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibility*(
    this: var vtkCubeAxesActor; _arg: vtkTypeBool) {.importcpp: "SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibility",
    header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetRebuildAxesScreenSizeLabelOffsetTitleOffsetFlyModeInertiaCornerOffsetEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << XAxisMinorTickVisibility  of  << this -> XAxisMinorTickVisibility ) ; return this -> XAxisMinorTickVisibility ; } ;
## Error: expected ';'!!!

proc XAxisMinorTickVisibilityOn*(this: var vtkCubeAxesActor) {.
    importcpp: "XAxisMinorTickVisibilityOn", header: "vtkCubeAxesActor.h".}
proc XAxisMinorTickVisibilityOff*(this: var vtkCubeAxesActor) {.
    importcpp: "XAxisMinorTickVisibilityOff", header: "vtkCubeAxesActor.h".}
  ## /@}
proc SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibility*(
    this: var vtkCubeAxesActor; _arg: vtkTypeBool) {.importcpp: "SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibility",
    header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetRebuildAxesScreenSizeLabelOffsetTitleOffsetFlyModeInertiaCornerOffsetEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << YAxisMinorTickVisibility  of  << this -> YAxisMinorTickVisibility ) ; return this -> YAxisMinorTickVisibility ; } ;
## Error: expected ';'!!!

proc YAxisMinorTickVisibilityOn*(this: var vtkCubeAxesActor) {.
    importcpp: "YAxisMinorTickVisibilityOn", header: "vtkCubeAxesActor.h".}
proc YAxisMinorTickVisibilityOff*(this: var vtkCubeAxesActor) {.
    importcpp: "YAxisMinorTickVisibilityOff", header: "vtkCubeAxesActor.h".}
proc SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibility*(
    this: var vtkCubeAxesActor; _arg: vtkTypeBool) {.importcpp: "SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibility",
    header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetRebuildAxesScreenSizeLabelOffsetTitleOffsetFlyModeInertiaCornerOffsetEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ZAxisMinorTickVisibility  of  << this -> ZAxisMinorTickVisibility ) ; return this -> ZAxisMinorTickVisibility ; } ;
## Error: expected ';'!!!

proc ZAxisMinorTickVisibilityOn*(this: var vtkCubeAxesActor) {.
    importcpp: "ZAxisMinorTickVisibilityOn", header: "vtkCubeAxesActor.h".}
proc ZAxisMinorTickVisibilityOff*(this: var vtkCubeAxesActor) {.
    importcpp: "ZAxisMinorTickVisibilityOff", header: "vtkCubeAxesActor.h".}
proc SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlines*(
    this: var vtkCubeAxesActor; _arg: vtkTypeBool) {.importcpp: "SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlines",
    header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetRebuildAxesScreenSizeLabelOffsetTitleOffsetFlyModeInertiaCornerOffsetEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlines ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DrawXGridlines  of  << this -> DrawXGridlines ) ; return this -> DrawXGridlines ; } ;
## Error: expected ';'!!!

proc DrawXGridlinesOn*(this: var vtkCubeAxesActor) {.importcpp: "DrawXGridlinesOn",
    header: "vtkCubeAxesActor.h".}
proc DrawXGridlinesOff*(this: var vtkCubeAxesActor) {.
    importcpp: "DrawXGridlinesOff", header: "vtkCubeAxesActor.h".}
proc SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlinesDrawYGridlines*(
    this: var vtkCubeAxesActor; _arg: vtkTypeBool) {.importcpp: "SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlinesDrawYGridlines",
    header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetRebuildAxesScreenSizeLabelOffsetTitleOffsetFlyModeInertiaCornerOffsetEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlinesDrawYGridlines ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DrawYGridlines  of  << this -> DrawYGridlines ) ; return this -> DrawYGridlines ; } ;
## Error: expected ';'!!!

proc DrawYGridlinesOn*(this: var vtkCubeAxesActor) {.importcpp: "DrawYGridlinesOn",
    header: "vtkCubeAxesActor.h".}
proc DrawYGridlinesOff*(this: var vtkCubeAxesActor) {.
    importcpp: "DrawYGridlinesOff", header: "vtkCubeAxesActor.h".}
proc SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlinesDrawYGridlinesDrawZGridlines*(
    this: var vtkCubeAxesActor; _arg: vtkTypeBool) {.importcpp: "SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlinesDrawYGridlinesDrawZGridlines",
    header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetRebuildAxesScreenSizeLabelOffsetTitleOffsetFlyModeInertiaCornerOffsetEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlinesDrawYGridlinesDrawZGridlines ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DrawZGridlines  of  << this -> DrawZGridlines ) ; return this -> DrawZGridlines ; } ;
## Error: expected ';'!!!

proc DrawZGridlinesOn*(this: var vtkCubeAxesActor) {.importcpp: "DrawZGridlinesOn",
    header: "vtkCubeAxesActor.h".}
proc DrawZGridlinesOff*(this: var vtkCubeAxesActor) {.
    importcpp: "DrawZGridlinesOff", header: "vtkCubeAxesActor.h".}
proc SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlinesDrawYGridlinesDrawZGridlinesDrawXInnerGridlines*(
    this: var vtkCubeAxesActor; _arg: vtkTypeBool) {.importcpp: "SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlinesDrawYGridlinesDrawZGridlinesDrawXInnerGridlines",
    header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetRebuildAxesScreenSizeLabelOffsetTitleOffsetFlyModeInertiaCornerOffsetEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlinesDrawYGridlinesDrawZGridlinesDrawXInnerGridlines ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DrawXInnerGridlines  of  << this -> DrawXInnerGridlines ) ; return this -> DrawXInnerGridlines ; } ;
## Error: expected ';'!!!

proc DrawXInnerGridlinesOn*(this: var vtkCubeAxesActor) {.
    importcpp: "DrawXInnerGridlinesOn", header: "vtkCubeAxesActor.h".}
proc DrawXInnerGridlinesOff*(this: var vtkCubeAxesActor) {.
    importcpp: "DrawXInnerGridlinesOff", header: "vtkCubeAxesActor.h".}
proc SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlinesDrawYGridlinesDrawZGridlinesDrawXInnerGridlinesDrawYInnerGridlines*(
    this: var vtkCubeAxesActor; _arg: vtkTypeBool) {.importcpp: "SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlinesDrawYGridlinesDrawZGridlinesDrawXInnerGridlinesDrawYInnerGridlines",
    header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetRebuildAxesScreenSizeLabelOffsetTitleOffsetFlyModeInertiaCornerOffsetEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlinesDrawYGridlinesDrawZGridlinesDrawXInnerGridlinesDrawYInnerGridlines ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DrawYInnerGridlines  of  << this -> DrawYInnerGridlines ) ; return this -> DrawYInnerGridlines ; } ;
## Error: expected ';'!!!

proc DrawYInnerGridlinesOn*(this: var vtkCubeAxesActor) {.
    importcpp: "DrawYInnerGridlinesOn", header: "vtkCubeAxesActor.h".}
proc DrawYInnerGridlinesOff*(this: var vtkCubeAxesActor) {.
    importcpp: "DrawYInnerGridlinesOff", header: "vtkCubeAxesActor.h".}
proc SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlinesDrawYGridlinesDrawZGridlinesDrawXInnerGridlinesDrawYInnerGridlinesDrawZInnerGridlines*(
    this: var vtkCubeAxesActor; _arg: vtkTypeBool) {.importcpp: "SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlinesDrawYGridlinesDrawZGridlinesDrawXInnerGridlinesDrawYInnerGridlinesDrawZInnerGridlines",
    header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetRebuildAxesScreenSizeLabelOffsetTitleOffsetFlyModeInertiaCornerOffsetEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlinesDrawYGridlinesDrawZGridlinesDrawXInnerGridlinesDrawYInnerGridlinesDrawZInnerGridlines ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DrawZInnerGridlines  of  << this -> DrawZInnerGridlines ) ; return this -> DrawZInnerGridlines ; } ;
## Error: expected ';'!!!

proc DrawZInnerGridlinesOn*(this: var vtkCubeAxesActor) {.
    importcpp: "DrawZInnerGridlinesOn", header: "vtkCubeAxesActor.h".}
proc DrawZInnerGridlinesOff*(this: var vtkCubeAxesActor) {.
    importcpp: "DrawZInnerGridlinesOff", header: "vtkCubeAxesActor.h".}
proc SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlinesDrawYGridlinesDrawZGridlinesDrawXInnerGridlinesDrawYInnerGridlinesDrawZInnerGridlinesDrawXGridpolys*(
    this: var vtkCubeAxesActor; _arg: vtkTypeBool) {.importcpp: "SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlinesDrawYGridlinesDrawZGridlinesDrawXInnerGridlinesDrawYInnerGridlinesDrawZInnerGridlinesDrawXGridpolys",
    header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetRebuildAxesScreenSizeLabelOffsetTitleOffsetFlyModeInertiaCornerOffsetEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlinesDrawYGridlinesDrawZGridlinesDrawXInnerGridlinesDrawYInnerGridlinesDrawZInnerGridlinesDrawXGridpolys ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DrawXGridpolys  of  << this -> DrawXGridpolys ) ; return this -> DrawXGridpolys ; } ;
## Error: expected ';'!!!

proc DrawXGridpolysOn*(this: var vtkCubeAxesActor) {.importcpp: "DrawXGridpolysOn",
    header: "vtkCubeAxesActor.h".}
proc DrawXGridpolysOff*(this: var vtkCubeAxesActor) {.
    importcpp: "DrawXGridpolysOff", header: "vtkCubeAxesActor.h".}
proc SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlinesDrawYGridlinesDrawZGridlinesDrawXInnerGridlinesDrawYInnerGridlinesDrawZInnerGridlinesDrawXGridpolysDrawYGridpolys*(
    this: var vtkCubeAxesActor; _arg: vtkTypeBool) {.importcpp: "SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlinesDrawYGridlinesDrawZGridlinesDrawXInnerGridlinesDrawYInnerGridlinesDrawZInnerGridlinesDrawXGridpolysDrawYGridpolys",
    header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetRebuildAxesScreenSizeLabelOffsetTitleOffsetFlyModeInertiaCornerOffsetEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlinesDrawYGridlinesDrawZGridlinesDrawXInnerGridlinesDrawYInnerGridlinesDrawZInnerGridlinesDrawXGridpolysDrawYGridpolys ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DrawYGridpolys  of  << this -> DrawYGridpolys ) ; return this -> DrawYGridpolys ; } ;
## Error: expected ';'!!!

proc DrawYGridpolysOn*(this: var vtkCubeAxesActor) {.importcpp: "DrawYGridpolysOn",
    header: "vtkCubeAxesActor.h".}
proc DrawYGridpolysOff*(this: var vtkCubeAxesActor) {.
    importcpp: "DrawYGridpolysOff", header: "vtkCubeAxesActor.h".}
proc SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlinesDrawYGridlinesDrawZGridlinesDrawXInnerGridlinesDrawYInnerGridlinesDrawZInnerGridlinesDrawXGridpolysDrawYGridpolysDrawZGridpolys*(
    this: var vtkCubeAxesActor; _arg: vtkTypeBool) {.importcpp: "SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlinesDrawYGridlinesDrawZGridlinesDrawXInnerGridlinesDrawYInnerGridlinesDrawZInnerGridlinesDrawXGridpolysDrawYGridpolysDrawZGridpolys",
    header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetRebuildAxesScreenSizeLabelOffsetTitleOffsetFlyModeInertiaCornerOffsetEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlinesDrawYGridlinesDrawZGridlinesDrawXInnerGridlinesDrawYInnerGridlinesDrawZInnerGridlinesDrawXGridpolysDrawYGridpolysDrawZGridpolys ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DrawZGridpolys  of  << this -> DrawZGridpolys ) ; return this -> DrawZGridpolys ; } ;
## Error: expected ';'!!!

proc DrawZGridpolysOn*(this: var vtkCubeAxesActor) {.importcpp: "DrawZGridpolysOn",
    header: "vtkCubeAxesActor.h".}
proc DrawZGridpolysOff*(this: var vtkCubeAxesActor) {.
    importcpp: "DrawZGridpolysOff", header: "vtkCubeAxesActor.h".}
  ## *
  ##  Returns the text property for the title on an axis.
  ##
proc GetTitleTextProperty*(this: var vtkCubeAxesActor; a2: cint): ptr vtkTextProperty {.
    importcpp: "GetTitleTextProperty", header: "vtkCubeAxesActor.h".}
proc GetLabelTextProperty*(this: var vtkCubeAxesActor; a2: cint): ptr vtkTextProperty {.
    importcpp: "GetLabelTextProperty", header: "vtkCubeAxesActor.h".}
proc SetXAxesLinesProperty*(this: var vtkCubeAxesActor; a2: ptr vtkProperty) {.
    importcpp: "SetXAxesLinesProperty", header: "vtkCubeAxesActor.h".}
proc GetXAxesLinesProperty*(this: var vtkCubeAxesActor): ptr vtkProperty {.
    importcpp: "GetXAxesLinesProperty", header: "vtkCubeAxesActor.h".}
proc SetYAxesLinesProperty*(this: var vtkCubeAxesActor; a2: ptr vtkProperty) {.
    importcpp: "SetYAxesLinesProperty", header: "vtkCubeAxesActor.h".}
proc GetYAxesLinesProperty*(this: var vtkCubeAxesActor): ptr vtkProperty {.
    importcpp: "GetYAxesLinesProperty", header: "vtkCubeAxesActor.h".}
proc SetZAxesLinesProperty*(this: var vtkCubeAxesActor; a2: ptr vtkProperty) {.
    importcpp: "SetZAxesLinesProperty", header: "vtkCubeAxesActor.h".}
proc GetZAxesLinesProperty*(this: var vtkCubeAxesActor): ptr vtkProperty {.
    importcpp: "GetZAxesLinesProperty", header: "vtkCubeAxesActor.h".}
proc SetXAxesGridlinesProperty*(this: var vtkCubeAxesActor; a2: ptr vtkProperty) {.
    importcpp: "SetXAxesGridlinesProperty", header: "vtkCubeAxesActor.h".}
proc GetXAxesGridlinesProperty*(this: var vtkCubeAxesActor): ptr vtkProperty {.
    importcpp: "GetXAxesGridlinesProperty", header: "vtkCubeAxesActor.h".}
proc SetYAxesGridlinesProperty*(this: var vtkCubeAxesActor; a2: ptr vtkProperty) {.
    importcpp: "SetYAxesGridlinesProperty", header: "vtkCubeAxesActor.h".}
proc GetYAxesGridlinesProperty*(this: var vtkCubeAxesActor): ptr vtkProperty {.
    importcpp: "GetYAxesGridlinesProperty", header: "vtkCubeAxesActor.h".}
proc SetZAxesGridlinesProperty*(this: var vtkCubeAxesActor; a2: ptr vtkProperty) {.
    importcpp: "SetZAxesGridlinesProperty", header: "vtkCubeAxesActor.h".}
proc GetZAxesGridlinesProperty*(this: var vtkCubeAxesActor): ptr vtkProperty {.
    importcpp: "GetZAxesGridlinesProperty", header: "vtkCubeAxesActor.h".}
proc SetXAxesInnerGridlinesProperty*(this: var vtkCubeAxesActor; a2: ptr vtkProperty) {.
    importcpp: "SetXAxesInnerGridlinesProperty", header: "vtkCubeAxesActor.h".}
proc GetXAxesInnerGridlinesProperty*(this: var vtkCubeAxesActor): ptr vtkProperty {.
    importcpp: "GetXAxesInnerGridlinesProperty", header: "vtkCubeAxesActor.h".}
proc SetYAxesInnerGridlinesProperty*(this: var vtkCubeAxesActor; a2: ptr vtkProperty) {.
    importcpp: "SetYAxesInnerGridlinesProperty", header: "vtkCubeAxesActor.h".}
proc GetYAxesInnerGridlinesProperty*(this: var vtkCubeAxesActor): ptr vtkProperty {.
    importcpp: "GetYAxesInnerGridlinesProperty", header: "vtkCubeAxesActor.h".}
proc SetZAxesInnerGridlinesProperty*(this: var vtkCubeAxesActor; a2: ptr vtkProperty) {.
    importcpp: "SetZAxesInnerGridlinesProperty", header: "vtkCubeAxesActor.h".}
proc GetZAxesInnerGridlinesProperty*(this: var vtkCubeAxesActor): ptr vtkProperty {.
    importcpp: "GetZAxesInnerGridlinesProperty", header: "vtkCubeAxesActor.h".}
proc SetXAxesGridpolysProperty*(this: var vtkCubeAxesActor; a2: ptr vtkProperty) {.
    importcpp: "SetXAxesGridpolysProperty", header: "vtkCubeAxesActor.h".}
proc GetXAxesGridpolysProperty*(this: var vtkCubeAxesActor): ptr vtkProperty {.
    importcpp: "GetXAxesGridpolysProperty", header: "vtkCubeAxesActor.h".}
proc SetYAxesGridpolysProperty*(this: var vtkCubeAxesActor; a2: ptr vtkProperty) {.
    importcpp: "SetYAxesGridpolysProperty", header: "vtkCubeAxesActor.h".}
proc GetYAxesGridpolysProperty*(this: var vtkCubeAxesActor): ptr vtkProperty {.
    importcpp: "GetYAxesGridpolysProperty", header: "vtkCubeAxesActor.h".}
proc SetZAxesGridpolysProperty*(this: var vtkCubeAxesActor; a2: ptr vtkProperty) {.
    importcpp: "SetZAxesGridpolysProperty", header: "vtkCubeAxesActor.h".}
proc GetZAxesGridpolysProperty*(this: var vtkCubeAxesActor): ptr vtkProperty {.
    importcpp: "GetZAxesGridpolysProperty", header: "vtkCubeAxesActor.h".}
type
  vtkCubeAxesActorTickLocation* {.size: sizeof(cint),
                                 importcpp: "vtkCubeAxesActor::TickLocation",
                                 header: "vtkCubeAxesActor.h".} = enum
    VTK_TICKS_INSIDE = 0, VTK_TICKS_OUTSIDE = 1, VTK_TICKS_BOTH = 2


proc SetFlyModeInertiaDistanceLODThresholdViewAngleLODThresholdTickLocation*(
    this: var vtkCubeAxesActor; _arg: cint) {.importcpp: "SetFlyModeInertiaDistanceLODThresholdViewAngleLODThresholdTickLocation",
    header: "vtkCubeAxesActor.h".}
proc GetFlyModeMinValueInertiaMinValueDistanceLODThresholdMinValueViewAngleLODThresholdMinValueTickLocationMinValue*(
    this: var vtkCubeAxesActor): cint {.importcpp: "GetFlyModeMinValueInertiaMinValueDistanceLODThresholdMinValueViewAngleLODThresholdMinValueTickLocationMinValue",
                                    header: "vtkCubeAxesActor.h".}
proc GetFlyModeMaxValueInertiaMaxValueDistanceLODThresholdMaxValueViewAngleLODThresholdMaxValueTickLocationMaxValue*(
    this: var vtkCubeAxesActor): cint {.importcpp: "GetFlyModeMaxValueInertiaMaxValueDistanceLODThresholdMaxValueViewAngleLODThresholdMaxValueTickLocationMaxValue",
                                    header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual int GetRebuildAxesScreenSizeLabelOffsetTitleOffsetFlyModeInertiaCornerOffsetEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlinesDrawYGridlinesDrawZGridlinesDrawXInnerGridlinesDrawYInnerGridlinesDrawZInnerGridlinesDrawXGridpolysDrawYGridpolysDrawZGridpolysTickLocation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TickLocation  of  << this -> TickLocation ) ; return this -> TickLocation ; } ;
## Error: expected ';'!!!

proc SetTickLocationToInside*(this: var vtkCubeAxesActor) {.
    importcpp: "SetTickLocationToInside", header: "vtkCubeAxesActor.h".}
proc SetTickLocationToOutside*(this: var vtkCubeAxesActor) {.
    importcpp: "SetTickLocationToOutside", header: "vtkCubeAxesActor.h".}
proc SetTickLocationToBoth*(this: var vtkCubeAxesActor) {.
    importcpp: "SetTickLocationToBoth", header: "vtkCubeAxesActor.h".}
proc SetLabelScaling*(this: var vtkCubeAxesActor; a2: bool; a3: cint; a4: cint; a5: cint) {.
    importcpp: "SetLabelScaling", header: "vtkCubeAxesActor.h".}
proc SetUseTextActor3D*(this: var vtkCubeAxesActor; val: cint) {.
    importcpp: "SetUseTextActor3D", header: "vtkCubeAxesActor.h".}
proc GetUseTextActor3D*(this: var vtkCubeAxesActor): cint {.
    importcpp: "GetUseTextActor3D", header: "vtkCubeAxesActor.h".}
proc SetUse2DMode*(this: var vtkCubeAxesActor; val: cint) {.importcpp: "SetUse2DMode",
    header: "vtkCubeAxesActor.h".}
proc GetUse2DMode*(this: var vtkCubeAxesActor): cint {.importcpp: "GetUse2DMode",
    header: "vtkCubeAxesActor.h".}
proc SetSaveTitlePosition*(this: var vtkCubeAxesActor; val: cint) {.
    importcpp: "SetSaveTitlePosition", header: "vtkCubeAxesActor.h".}
proc SetBoundsOrientedBounds*(this: var vtkCubeAxesActor; _arg1: cdouble;
                             _arg2: cdouble; _arg3: cdouble; _arg4: cdouble;
                             _arg5: cdouble; _arg6: cdouble) {.
    importcpp: "SetBoundsOrientedBounds", header: "vtkCubeAxesActor.h".}
proc SetBoundsOrientedBounds*(this: var vtkCubeAxesActor; _arg: array[6, cdouble]) {.
    importcpp: "SetBoundsOrientedBounds", header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual double * GetOrientedBounds ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << OrientedBounds  pointer  << this -> OrientedBounds ) ; return this -> OrientedBounds ; } VTK_WRAPEXCLUDE virtual void GetOrientedBounds ( double & _arg1 , double & _arg2 , double & _arg3 , double & _arg4 , double & _arg5 , double & _arg6 ) { _arg1 = this -> OrientedBounds [ 0 ] ; _arg2 = this -> OrientedBounds [ 1 ] ; _arg3 = this -> OrientedBounds [ 2 ] ; _arg4 = this -> OrientedBounds [ 3 ] ; _arg5 = this -> OrientedBounds [ 4 ] ; _arg6 = this -> OrientedBounds [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << OrientedBounds  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetOrientedBounds ( double _arg [ 6 ] ) { this -> GetOrientedBounds ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ;
## Error: expected ';'!!!

proc SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlinesDrawYGridlinesDrawZGridlinesDrawXInnerGridlinesDrawYInnerGridlinesDrawZInnerGridlinesDrawXGridpolysDrawYGridpolysDrawZGridpolysUseOrientedBounds*(
    this: var vtkCubeAxesActor; _arg: cint) {.importcpp: "SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlinesDrawYGridlinesDrawZGridlinesDrawXInnerGridlinesDrawYInnerGridlinesDrawZInnerGridlinesDrawXGridpolysDrawYGridpolysDrawZGridpolysUseOrientedBounds",
    header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual int GetRebuildAxesScreenSizeLabelOffsetTitleOffsetFlyModeInertiaCornerOffsetEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlinesDrawYGridlinesDrawZGridlinesDrawXInnerGridlinesDrawYInnerGridlinesDrawZInnerGridlinesDrawXGridpolysDrawYGridpolysDrawZGridpolysTickLocationUseOrientedBounds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseOrientedBounds  of  << this -> UseOrientedBounds ) ; return this -> UseOrientedBounds ; } ;
## Error: expected ';'!!!

proc SetAxisBaseForX*(this: var vtkCubeAxesActor; _arg1: cdouble; _arg2: cdouble;
                     _arg3: cdouble) {.importcpp: "SetAxisBaseForX",
                                     header: "vtkCubeAxesActor.h".}
proc SetAxisBaseForX*(this: var vtkCubeAxesActor; _arg: array[3, cdouble]) {.
    importcpp: "SetAxisBaseForX", header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual double * GetAxisBaseForX ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << AxisBaseForX  pointer  << this -> AxisBaseForX ) ; return this -> AxisBaseForX ; } VTK_WRAPEXCLUDE virtual void GetAxisBaseForX ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> AxisBaseForX [ 0 ] ; _arg2 = this -> AxisBaseForX [ 1 ] ; _arg3 = this -> AxisBaseForX [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << AxisBaseForX  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetAxisBaseForX ( double _arg [ 3 ] ) { this -> GetAxisBaseForX ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetAxisBaseForXAxisBaseForY*(this: var vtkCubeAxesActor; _arg1: cdouble;
                                 _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetAxisBaseForXAxisBaseForY", header: "vtkCubeAxesActor.h".}
proc SetAxisBaseForXAxisBaseForY*(this: var vtkCubeAxesActor;
                                 _arg: array[3, cdouble]) {.
    importcpp: "SetAxisBaseForXAxisBaseForY", header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual double * GetAxisBaseForXAxisBaseForY ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << AxisBaseForY  pointer  << this -> AxisBaseForY ) ; return this -> AxisBaseForY ; } VTK_WRAPEXCLUDE virtual void GetAxisBaseForXAxisBaseForY ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> AxisBaseForY [ 0 ] ; _arg2 = this -> AxisBaseForY [ 1 ] ; _arg3 = this -> AxisBaseForY [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << AxisBaseForY  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetAxisBaseForXAxisBaseForY ( double _arg [ 3 ] ) { this -> GetAxisBaseForXAxisBaseForY ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetAxisBaseForXAxisBaseForYAxisBaseForZ*(this: var vtkCubeAxesActor;
    _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetAxisBaseForXAxisBaseForYAxisBaseForZ",
    header: "vtkCubeAxesActor.h".}
proc SetAxisBaseForXAxisBaseForYAxisBaseForZ*(this: var vtkCubeAxesActor;
    _arg: array[3, cdouble]) {.importcpp: "SetAxisBaseForXAxisBaseForYAxisBaseForZ",
                            header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual double * GetAxisBaseForXAxisBaseForYAxisBaseForZ ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << AxisBaseForZ  pointer  << this -> AxisBaseForZ ) ; return this -> AxisBaseForZ ; } VTK_WRAPEXCLUDE virtual void GetAxisBaseForXAxisBaseForYAxisBaseForZ ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> AxisBaseForZ [ 0 ] ; _arg2 = this -> AxisBaseForZ [ 1 ] ; _arg3 = this -> AxisBaseForZ [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << AxisBaseForZ  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetAxisBaseForXAxisBaseForYAxisBaseForZ ( double _arg [ 3 ] ) { this -> GetAxisBaseForXAxisBaseForYAxisBaseForZ ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetAxisBaseForXAxisBaseForYAxisBaseForZAxisOrigin*(
    this: var vtkCubeAxesActor; _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetAxisBaseForXAxisBaseForYAxisBaseForZAxisOrigin",
    header: "vtkCubeAxesActor.h".}
proc SetAxisBaseForXAxisBaseForYAxisBaseForZAxisOrigin*(
    this: var vtkCubeAxesActor; _arg: array[3, cdouble]) {.
    importcpp: "SetAxisBaseForXAxisBaseForYAxisBaseForZAxisOrigin",
    header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual double * GetAxisBaseForXAxisBaseForYAxisBaseForZAxisOrigin ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << AxisOrigin  pointer  << this -> AxisOrigin ) ; return this -> AxisOrigin ; } VTK_WRAPEXCLUDE virtual void GetAxisBaseForXAxisBaseForYAxisBaseForZAxisOrigin ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> AxisOrigin [ 0 ] ; _arg2 = this -> AxisOrigin [ 1 ] ; _arg3 = this -> AxisOrigin [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << AxisOrigin  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetAxisBaseForXAxisBaseForYAxisBaseForZAxisOrigin ( double _arg [ 3 ] ) { this -> GetAxisBaseForXAxisBaseForYAxisBaseForZAxisOrigin ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlinesDrawYGridlinesDrawZGridlinesDrawXInnerGridlinesDrawYInnerGridlinesDrawZInnerGridlinesDrawXGridpolysDrawYGridpolysDrawZGridpolysUseOrientedBoundsUseAxisOrigin*(
    this: var vtkCubeAxesActor; _arg: cint) {.importcpp: "SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlinesDrawYGridlinesDrawZGridlinesDrawXInnerGridlinesDrawYInnerGridlinesDrawZInnerGridlinesDrawXGridpolysDrawYGridpolysDrawZGridpolysUseOrientedBoundsUseAxisOrigin",
    header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual int GetRebuildAxesScreenSizeLabelOffsetTitleOffsetFlyModeInertiaCornerOffsetEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlinesDrawYGridlinesDrawZGridlinesDrawXInnerGridlinesDrawYInnerGridlinesDrawZInnerGridlinesDrawXGridpolysDrawYGridpolysDrawZGridpolysTickLocationUseOrientedBoundsUseAxisOrigin ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseAxisOrigin  of  << this -> UseAxisOrigin ) ; return this -> UseAxisOrigin ; } ;
## Error: expected ';'!!!

proc SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlinesDrawYGridlinesDrawZGridlinesDrawXInnerGridlinesDrawYInnerGridlinesDrawZInnerGridlinesDrawXGridpolysDrawYGridpolysDrawZGridpolysUseOrientedBoundsUseAxisOriginGridLineLocation*(
    this: var vtkCubeAxesActor; _arg: cint) {.importcpp: "SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlinesDrawYGridlinesDrawZGridlinesDrawXInnerGridlinesDrawYInnerGridlinesDrawZInnerGridlinesDrawXGridpolysDrawYGridpolysDrawZGridpolysUseOrientedBoundsUseAxisOriginGridLineLocation",
    header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual int GetRebuildAxesScreenSizeLabelOffsetTitleOffsetFlyModeInertiaCornerOffsetEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlinesDrawYGridlinesDrawZGridlinesDrawXInnerGridlinesDrawYInnerGridlinesDrawZInnerGridlinesDrawXGridpolysDrawYGridpolysDrawZGridpolysTickLocationUseOrientedBoundsUseAxisOriginGridLineLocation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GridLineLocation  of  << this -> GridLineLocation ) ; return this -> GridLineLocation ; } ;
## Error: expected ';'!!!

proc SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlinesDrawYGridlinesDrawZGridlinesDrawXInnerGridlinesDrawYInnerGridlinesDrawZInnerGridlinesDrawXGridpolysDrawYGridpolysDrawZGridpolysUseOrientedBoundsUseAxisOriginGridLineLocationStickyAxes*(
    this: var vtkCubeAxesActor; _arg: vtkTypeBool) {.importcpp: "SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlinesDrawYGridlinesDrawZGridlinesDrawXInnerGridlinesDrawYInnerGridlinesDrawZInnerGridlinesDrawXGridpolysDrawYGridpolysDrawZGridpolysUseOrientedBoundsUseAxisOriginGridLineLocationStickyAxes",
    header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetRebuildAxesScreenSizeLabelOffsetTitleOffsetFlyModeInertiaCornerOffsetEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlinesDrawYGridlinesDrawZGridlinesDrawXInnerGridlinesDrawYInnerGridlinesDrawZInnerGridlinesDrawXGridpolysDrawYGridpolysDrawZGridpolysTickLocationUseOrientedBoundsUseAxisOriginGridLineLocationStickyAxes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << StickyAxes  of  << this -> StickyAxes ) ; return this -> StickyAxes ; } ;
## Error: expected ';'!!!

proc StickyAxesOn*(this: var vtkCubeAxesActor) {.importcpp: "StickyAxesOn",
    header: "vtkCubeAxesActor.h".}
proc StickyAxesOff*(this: var vtkCubeAxesActor) {.importcpp: "StickyAxesOff",
    header: "vtkCubeAxesActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Enable/Disable centering of axes when the Sticky option is
  ##  on. If on, the axes bounds will be centered in the
  ##  viewport. Otherwise, the axes can move about the longer of the
  ##  horizontal or vertical directions of the viewport to follow the
  ##  data. Defaults to on.
  ##
proc SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlinesDrawYGridlinesDrawZGridlinesDrawXInnerGridlinesDrawYInnerGridlinesDrawZInnerGridlinesDrawXGridpolysDrawYGridpolysDrawZGridpolysUseOrientedBoundsUseAxisOriginGridLineLocationStickyAxesCenterStickyAxes*(
    this: var vtkCubeAxesActor; _arg: vtkTypeBool) {.importcpp: "SetRebuildAxesCornerOffsetEnableDistanceLODEnableViewAngleLODXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlinesDrawYGridlinesDrawZGridlinesDrawXInnerGridlinesDrawYInnerGridlinesDrawZInnerGridlinesDrawXGridpolysDrawYGridpolysDrawZGridpolysUseOrientedBoundsUseAxisOriginGridLineLocationStickyAxesCenterStickyAxes",
    header: "vtkCubeAxesActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetRebuildAxesScreenSizeLabelOffsetTitleOffsetFlyModeInertiaCornerOffsetEnableDistanceLODDistanceLODThresholdEnableViewAngleLODViewAngleLODThresholdXAxisVisibilityYAxisVisibilityZAxisVisibilityXAxisLabelVisibilityYAxisLabelVisibilityZAxisLabelVisibilityXAxisTickVisibilityYAxisTickVisibilityZAxisTickVisibilityXAxisMinorTickVisibilityYAxisMinorTickVisibilityZAxisMinorTickVisibilityDrawXGridlinesDrawYGridlinesDrawZGridlinesDrawXInnerGridlinesDrawYInnerGridlinesDrawZInnerGridlinesDrawXGridpolysDrawYGridpolysDrawZGridpolysTickLocationUseOrientedBoundsUseAxisOriginGridLineLocationStickyAxesCenterStickyAxes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CenterStickyAxes  of  << this -> CenterStickyAxes ) ; return this -> CenterStickyAxes ; } ;
## Error: expected ';'!!!

proc CenterStickyAxesOn*(this: var vtkCubeAxesActor) {.
    importcpp: "CenterStickyAxesOn", header: "vtkCubeAxesActor.h".}
proc CenterStickyAxesOff*(this: var vtkCubeAxesActor) {.
    importcpp: "CenterStickyAxesOff", header: "vtkCubeAxesActor.h".}
  ## /@}
type
  vtkCubeAxesActorGridVisibility* {.size: sizeof(cint), importcpp: "vtkCubeAxesActor::GridVisibility",
                                   header: "vtkCubeAxesActor.h".} = enum
    VTK_GRID_LINES_ALL = 0, VTK_GRID_LINES_CLOSEST = 1, VTK_GRID_LINES_FURTHEST = 2


## !!!Ignored construct:  int RenderGeometry ( bool & initialRender , vtkViewport * viewport , bool checkAxisVisibility , int ( vtkAxisActor :: * renderMethod ) ( vtkViewport * ) ) ;
## Error: token expected: ) but got: ::!!!
