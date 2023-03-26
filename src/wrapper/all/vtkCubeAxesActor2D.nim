## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCubeAxesActor2D.h
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
##  @class   vtkCubeAxesActor2D
##  @brief   create a 2D plot of a bounding box edges - used for navigation
##
##  vtkCubeAxesActor2D is a composite actor that draws three axes of the
##  bounding box of an input dataset. The axes include labels and titles
##  for the x-y-z axes. The algorithm selects the axes that are on the
##  "exterior" of the bounding box, exterior as determined from examining
##  outer edges of the bounding box in projection (display) space. Alternatively,
##  the edges closest to the viewer (i.e., camera position) can be drawn.
##
##  To use this object you must define a bounding box and the camera used
##  to render the vtkCubeAxesActor2D. The camera is used to control the
##  scaling and position of the vtkCubeAxesActor2D so that it fits in the
##  viewport and always remains visible.)
##
##  The font property of the axes titles and labels can be modified through the
##  AxisTitleTextProperty and AxisLabelTextProperty attributes. You may also
##  use the GetXAxisActor2D, GetYAxisActor2D or GetZAxisActor2D methods
##  to access each individual axis actor to modify their font properties.
##
##  The bounding box to use is defined in one of three ways. First, if the Input
##  ivar is defined, then the input dataset's bounds is used. If the Input is
##  not defined, and the Prop (superclass of all actors) is defined, then the
##  Prop's bounds is used. If neither the Input or Prop is defined, then the
##  Bounds instance variable (an array of six doubles) is used.
##
##  @sa
##  vtkActor2D vtkAxisActor2D vtkXYPlotActor vtkTextProperty
##

import
  vtkActor2D, vtkRenderingAnnotationModule

discard "forward decl of vtkAlgorithmOutput"
discard "forward decl of vtkAxisActor2D"
discard "forward decl of vtkCamera"
discard "forward decl of vtkCubeAxesActor2DConnection"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkTextProperty"
type
  vtkCubeAxesActor2D* {.importcpp: "vtkCubeAxesActor2D",
                       header: "vtkCubeAxesActor2D.h", bycopy.} = object of vtkActor2D ##  hide the superclass' ShallowCopy() from the user and the compiler.
    vtkCubeAxesActor2D* {.importc: "vtkCubeAxesActor2D".}: VTK_NEWINSTANCE
    ##  Define bounds from actor/assembly, or
    ##  Define bounds explicitly
    ##  Define ranges explicitly
    ##  Flag to use ranges or not
    ##  Always show the actual bounds of the object
    ##  various helper methods

  vtkCubeAxesActor2DSuperclass* = vtkActor2D

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCubeAxesActor2D::IsTypeOf(@)", header: "vtkCubeAxesActor2D.h".}
proc IsA*(this: var vtkCubeAxesActor2D; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkCubeAxesActor2D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCubeAxesActor2D {.
    importcpp: "vtkCubeAxesActor2D::SafeDownCast(@)",
    header: "vtkCubeAxesActor2D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCubeAxesActor2D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkActor2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCubeAxesActor2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCubeAxesActor2D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCubeAxesActor2D; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCubeAxesActor2D.h".}
proc New*(): ptr vtkCubeAxesActor2D {.importcpp: "vtkCubeAxesActor2D::New(@)",
                                  header: "vtkCubeAxesActor2D.h".}
proc RenderOverlay*(this: var vtkCubeAxesActor2D; a2: ptr vtkViewport): cint {.
    importcpp: "RenderOverlay", header: "vtkCubeAxesActor2D.h".}
proc RenderOpaqueGeometry*(this: var vtkCubeAxesActor2D; a2: ptr vtkViewport): cint {.
    importcpp: "RenderOpaqueGeometry", header: "vtkCubeAxesActor2D.h".}
proc RenderTranslucentPolygonalGeometry*(this: var vtkCubeAxesActor2D;
                                        a2: ptr vtkViewport): cint {.
    importcpp: "RenderTranslucentPolygonalGeometry",
    header: "vtkCubeAxesActor2D.h".}
proc HasTranslucentPolygonalGeometry*(this: var vtkCubeAxesActor2D): vtkTypeBool {.
    importcpp: "HasTranslucentPolygonalGeometry", header: "vtkCubeAxesActor2D.h".}
proc SetInputConnection*(this: var vtkCubeAxesActor2D; a2: ptr vtkAlgorithmOutput) {.
    importcpp: "SetInputConnection", header: "vtkCubeAxesActor2D.h".}
proc SetInputData*(this: var vtkCubeAxesActor2D; a2: ptr vtkDataSet) {.
    importcpp: "SetInputData", header: "vtkCubeAxesActor2D.h".}
proc GetInput*(this: var vtkCubeAxesActor2D): ptr vtkDataSet {.importcpp: "GetInput",
    header: "vtkCubeAxesActor2D.h".}
proc SetViewProp*(this: var vtkCubeAxesActor2D; prop: ptr vtkProp) {.
    importcpp: "SetViewProp", header: "vtkCubeAxesActor2D.h".}
proc GetnameViewProp*(this: var vtkCubeAxesActor2D): ptr vtkProp {.
    importcpp: "GetnameViewProp", header: "vtkCubeAxesActor2D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Explicitly specify the region in space around which to draw the bounds.
  ##  The bounds is used only when no Input or Prop is specified. The bounds
  ##  are specified according to (xmin,xmax, ymin,ymax, zmin,zmax), making
  ##  sure that the min's are less than the max's.
  ##
proc SetBounds*(this: var vtkCubeAxesActor2D; _arg1: cdouble; _arg2: cdouble;
               _arg3: cdouble; _arg4: cdouble; _arg5: cdouble; _arg6: cdouble) {.
    importcpp: "SetBounds", header: "vtkCubeAxesActor2D.h".}
proc SetBounds*(this: var vtkCubeAxesActor2D; _arg: array[6, cdouble]) {.
    importcpp: "SetBounds", header: "vtkCubeAxesActor2D.h".}
## !!!Ignored construct:  double * GetBounds ( ) VTK_SIZEHINT ( 6 ) override ;
## Error: expected ';'!!!

proc GetBounds*(this: var vtkCubeAxesActor2D; xmin: var cdouble; xmax: var cdouble;
               ymin: var cdouble; ymax: var cdouble; zmin: var cdouble; zmax: var cdouble) {.
    importcpp: "GetBounds", header: "vtkCubeAxesActor2D.h".}
proc GetBounds*(this: var vtkCubeAxesActor2D; bounds: array[6, cdouble]) {.
    importcpp: "GetBounds", header: "vtkCubeAxesActor2D.h".}
proc SetBoundsRanges*(this: var vtkCubeAxesActor2D; _arg1: cdouble; _arg2: cdouble;
                     _arg3: cdouble; _arg4: cdouble; _arg5: cdouble; _arg6: cdouble) {.
    importcpp: "SetBoundsRanges", header: "vtkCubeAxesActor2D.h".}
proc SetBoundsRanges*(this: var vtkCubeAxesActor2D; _arg: array[6, cdouble]) {.
    importcpp: "SetBoundsRanges", header: "vtkCubeAxesActor2D.h".}
## !!!Ignored construct:  double * GetRanges ( ) VTK_SIZEHINT ( 6 ) ;
## Error: expected ';'!!!

proc GetRanges*(this: var vtkCubeAxesActor2D; xmin: var cdouble; xmax: var cdouble;
               ymin: var cdouble; ymax: var cdouble; zmin: var cdouble; zmax: var cdouble) {.
    importcpp: "GetRanges", header: "vtkCubeAxesActor2D.h".}
proc GetRanges*(this: var vtkCubeAxesActor2D; ranges: array[6, cdouble]) {.
    importcpp: "GetRanges", header: "vtkCubeAxesActor2D.h".}
proc SetXOrigin*(this: var vtkCubeAxesActor2D; _arg: cdouble) {.
    importcpp: "SetXOrigin", header: "vtkCubeAxesActor2D.h".}
proc SetXOriginYOrigin*(this: var vtkCubeAxesActor2D; _arg: cdouble) {.
    importcpp: "SetXOriginYOrigin", header: "vtkCubeAxesActor2D.h".}
proc SetXOriginYOriginZOrigin*(this: var vtkCubeAxesActor2D; _arg: cdouble) {.
    importcpp: "SetXOriginYOriginZOrigin", header: "vtkCubeAxesActor2D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get a flag that controls whether the axes use the data ranges
  ##  or the ranges set by SetRanges. By default the axes use the data
  ##  ranges.
  ##
proc SetXOriginYOriginZOriginUseRanges*(this: var vtkCubeAxesActor2D;
                                       _arg: vtkTypeBool) {.
    importcpp: "SetXOriginYOriginZOriginUseRanges", header: "vtkCubeAxesActor2D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetUseRanges ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseRanges  of  << this -> UseRanges ) ; return this -> UseRanges ; } ;
## Error: expected ';'!!!

proc UseRangesOn*(this: var vtkCubeAxesActor2D) {.importcpp: "UseRangesOn",
    header: "vtkCubeAxesActor2D.h".}
proc UseRangesOff*(this: var vtkCubeAxesActor2D) {.importcpp: "UseRangesOff",
    header: "vtkCubeAxesActor2D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the camera to perform scaling and translation of the
  ##  vtkCubeAxesActor2D.
  ##
proc SetCamera*(this: var vtkCubeAxesActor2D; a2: ptr vtkCamera) {.
    importcpp: "SetCamera", header: "vtkCubeAxesActor2D.h".}
proc GetnameViewPropCamera*(this: var vtkCubeAxesActor2D): ptr vtkCamera {.
    importcpp: "GetnameViewPropCamera", header: "vtkCubeAxesActor2D.h".}
  ## /@}
type
  vtkCubeAxesActor2DFlyMode* {.size: sizeof(cint),
                              importcpp: "vtkCubeAxesActor2D::FlyMode",
                              header: "vtkCubeAxesActor2D.h".} = enum
    VTK_FLY_OUTER_EDGES = 0, VTK_FLY_CLOSEST_TRIAD = 1, VTK_FLY_NONE = 2


proc SetFlyMode*(this: var vtkCubeAxesActor2D; _arg: cint) {.importcpp: "SetFlyMode",
    header: "vtkCubeAxesActor2D.h".}
proc GetFlyModeMinValue*(this: var vtkCubeAxesActor2D): cint {.
    importcpp: "GetFlyModeMinValue", header: "vtkCubeAxesActor2D.h".}
proc GetFlyModeMaxValue*(this: var vtkCubeAxesActor2D): cint {.
    importcpp: "GetFlyModeMaxValue", header: "vtkCubeAxesActor2D.h".}
## !!!Ignored construct:  virtual int GetUseRangesFlyMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FlyMode  of  << this -> FlyMode ) ; return this -> FlyMode ; } ;
## Error: expected ';'!!!

proc SetFlyModeToOuterEdges*(this: var vtkCubeAxesActor2D) {.
    importcpp: "SetFlyModeToOuterEdges", header: "vtkCubeAxesActor2D.h".}
proc SetFlyModeToClosestTriad*(this: var vtkCubeAxesActor2D) {.
    importcpp: "SetFlyModeToClosestTriad", header: "vtkCubeAxesActor2D.h".}
proc SetFlyModeToNone*(this: var vtkCubeAxesActor2D) {.
    importcpp: "SetFlyModeToNone", header: "vtkCubeAxesActor2D.h".}
proc SetXOriginYOriginZOriginUseRangesScaling*(this: var vtkCubeAxesActor2D;
    _arg: vtkTypeBool) {.importcpp: "SetXOriginYOriginZOriginUseRangesScaling",
                       header: "vtkCubeAxesActor2D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetUseRangesFlyModeScaling ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Scaling  of  << this -> Scaling ) ; return this -> Scaling ; } ;
## Error: expected ';'!!!

proc ScalingOn*(this: var vtkCubeAxesActor2D) {.importcpp: "ScalingOn",
    header: "vtkCubeAxesActor2D.h".}
proc ScalingOff*(this: var vtkCubeAxesActor2D) {.importcpp: "ScalingOff",
    header: "vtkCubeAxesActor2D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the number of annotation labels to show along the x, y, and
  ##  z axes. This values is a suggestion: the number of labels may vary
  ##  depending on the particulars of the data.
  ##
proc SetFlyModeNumberOfLabels*(this: var vtkCubeAxesActor2D; _arg: cint) {.
    importcpp: "SetFlyModeNumberOfLabels", header: "vtkCubeAxesActor2D.h".}
proc GetFlyModeMinValueNumberOfLabelsMinValue*(this: var vtkCubeAxesActor2D): cint {.
    importcpp: "GetFlyModeMinValueNumberOfLabelsMinValue",
    header: "vtkCubeAxesActor2D.h".}
proc GetFlyModeMaxValueNumberOfLabelsMaxValue*(this: var vtkCubeAxesActor2D): cint {.
    importcpp: "GetFlyModeMaxValueNumberOfLabelsMaxValue",
    header: "vtkCubeAxesActor2D.h".}
## !!!Ignored construct:  virtual int GetUseRangesFlyModeScalingNumberOfLabels ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfLabels  of  << this -> NumberOfLabels ) ; return this -> NumberOfLabels ; } ;
## Error: expected ';'!!!

proc SetXLabel*(this: var vtkCubeAxesActor2D; _arg: cstring) {.importcpp: "SetXLabel",
    header: "vtkCubeAxesActor2D.h".}
proc GetXLabel*(this: var vtkCubeAxesActor2D): cstring {.importcpp: "GetXLabel",
    header: "vtkCubeAxesActor2D.h".}
proc SetXLabelYLabel*(this: var vtkCubeAxesActor2D; _arg: cstring) {.
    importcpp: "SetXLabelYLabel", header: "vtkCubeAxesActor2D.h".}
proc GetXLabelYLabel*(this: var vtkCubeAxesActor2D): cstring {.
    importcpp: "GetXLabelYLabel", header: "vtkCubeAxesActor2D.h".}
proc SetXLabelYLabelZLabel*(this: var vtkCubeAxesActor2D; _arg: cstring) {.
    importcpp: "SetXLabelYLabelZLabel", header: "vtkCubeAxesActor2D.h".}
proc GetXLabelYLabelZLabel*(this: var vtkCubeAxesActor2D): cstring {.
    importcpp: "GetXLabelYLabelZLabel", header: "vtkCubeAxesActor2D.h".}
  ## /@}
  ## *
  ##  Retrieve handles to the X, Y and Z axis (so that you can set their text
  ##  properties for example)
  ##
proc GetXAxisActor2D*(this: var vtkCubeAxesActor2D): ptr vtkAxisActor2D {.
    importcpp: "GetXAxisActor2D", header: "vtkCubeAxesActor2D.h".}
proc GetYAxisActor2D*(this: var vtkCubeAxesActor2D): ptr vtkAxisActor2D {.
    importcpp: "GetYAxisActor2D", header: "vtkCubeAxesActor2D.h".}
proc GetZAxisActor2D*(this: var vtkCubeAxesActor2D): ptr vtkAxisActor2D {.
    importcpp: "GetZAxisActor2D", header: "vtkCubeAxesActor2D.h".}
proc SetAxisTitleTextProperty*(this: var vtkCubeAxesActor2D; p: ptr vtkTextProperty) {.
    importcpp: "SetAxisTitleTextProperty", header: "vtkCubeAxesActor2D.h".}
proc GetnameViewPropCameraAxisTitleTextProperty*(this: var vtkCubeAxesActor2D): ptr vtkTextProperty {.
    importcpp: "GetnameViewPropCameraAxisTitleTextProperty",
    header: "vtkCubeAxesActor2D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the labels text property of all axes. Note that each axis can
  ##  be controlled individually through the GetX/Y/ZAxisActor2D() methods.
  ##
proc SetAxisLabelTextProperty*(this: var vtkCubeAxesActor2D; p: ptr vtkTextProperty) {.
    importcpp: "SetAxisLabelTextProperty", header: "vtkCubeAxesActor2D.h".}
proc GetnameViewPropCameraAxisTitleTextPropertyAxisLabelTextProperty*(
    this: var vtkCubeAxesActor2D): ptr vtkTextProperty {.importcpp: "GetnameViewPropCameraAxisTitleTextPropertyAxisLabelTextProperty",
    header: "vtkCubeAxesActor2D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the format with which to print the labels on each of the
  ##  x-y-z axes.
  ##
proc SetXLabelYLabelZLabelLabelFormat*(this: var vtkCubeAxesActor2D; _arg: cstring) {.
    importcpp: "SetXLabelYLabelZLabelLabelFormat", header: "vtkCubeAxesActor2D.h".}
proc GetXLabelYLabelZLabelLabelFormat*(this: var vtkCubeAxesActor2D): cstring {.
    importcpp: "GetXLabelYLabelZLabelLabelFormat", header: "vtkCubeAxesActor2D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the factor that controls the overall size of the fonts used
  ##  to label and title the axes.
  ##
proc SetFlyModeNumberOfLabelsFontFactor*(this: var vtkCubeAxesActor2D; _arg: cdouble) {.
    importcpp: "SetFlyModeNumberOfLabelsFontFactor",
    header: "vtkCubeAxesActor2D.h".}
proc GetFlyModeMinValueNumberOfLabelsMinValueFontFactorMinValue*(
    this: var vtkCubeAxesActor2D): cdouble {.
    importcpp: "GetFlyModeMinValueNumberOfLabelsMinValueFontFactorMinValue",
    header: "vtkCubeAxesActor2D.h".}
proc GetFlyModeMaxValueNumberOfLabelsMaxValueFontFactorMaxValue*(
    this: var vtkCubeAxesActor2D): cdouble {.
    importcpp: "GetFlyModeMaxValueNumberOfLabelsMaxValueFontFactorMaxValue",
    header: "vtkCubeAxesActor2D.h".}
## !!!Ignored construct:  virtual double GetUseRangesFlyModeScalingNumberOfLabelsFontFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FontFactor  of  << this -> FontFactor ) ; return this -> FontFactor ; } ;
## Error: expected ';'!!!

proc SetFlyModeNumberOfLabelsFontFactorInertia*(this: var vtkCubeAxesActor2D;
    _arg: cint) {.importcpp: "SetFlyModeNumberOfLabelsFontFactorInertia",
                header: "vtkCubeAxesActor2D.h".}
proc GetFlyModeMinValueNumberOfLabelsMinValueFontFactorMinValueInertiaMinValue*(
    this: var vtkCubeAxesActor2D): cint {.importcpp: "GetFlyModeMinValueNumberOfLabelsMinValueFontFactorMinValueInertiaMinValue",
                                      header: "vtkCubeAxesActor2D.h".}
proc GetFlyModeMaxValueNumberOfLabelsMaxValueFontFactorMaxValueInertiaMaxValue*(
    this: var vtkCubeAxesActor2D): cint {.importcpp: "GetFlyModeMaxValueNumberOfLabelsMaxValueFontFactorMaxValueInertiaMaxValue",
                                      header: "vtkCubeAxesActor2D.h".}
## !!!Ignored construct:  virtual int GetUseRangesFlyModeScalingNumberOfLabelsFontFactorInertia ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Inertia  of  << this -> Inertia ) ; return this -> Inertia ; } ;
## Error: expected ';'!!!

proc SetFlyModeNumberOfLabelsFontFactorInertiaShowActualBounds*(
    this: var vtkCubeAxesActor2D; _arg: cint) {.
    importcpp: "SetFlyModeNumberOfLabelsFontFactorInertiaShowActualBounds",
    header: "vtkCubeAxesActor2D.h".}
proc GetFlyModeMinValueNumberOfLabelsMinValueFontFactorMinValueInertiaMinValueShowActualBoundsMinValue*(
    this: var vtkCubeAxesActor2D): cint {.importcpp: "GetFlyModeMinValueNumberOfLabelsMinValueFontFactorMinValueInertiaMinValueShowActualBoundsMinValue",
                                      header: "vtkCubeAxesActor2D.h".}
proc GetFlyModeMaxValueNumberOfLabelsMaxValueFontFactorMaxValueInertiaMaxValueShowActualBoundsMaxValue*(
    this: var vtkCubeAxesActor2D): cint {.importcpp: "GetFlyModeMaxValueNumberOfLabelsMaxValueFontFactorMaxValueInertiaMaxValueShowActualBoundsMaxValue",
                                      header: "vtkCubeAxesActor2D.h".}
## !!!Ignored construct:  virtual int GetUseRangesFlyModeScalingNumberOfLabelsFontFactorInertiaShowActualBounds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ShowActualBounds  of  << this -> ShowActualBounds ) ; return this -> ShowActualBounds ; } ;
## Error: expected ';'!!!

proc SetXOriginYOriginZOriginUseRangesScalingCornerOffset*(
    this: var vtkCubeAxesActor2D; _arg: cdouble) {.
    importcpp: "SetXOriginYOriginZOriginUseRangesScalingCornerOffset",
    header: "vtkCubeAxesActor2D.h".}
## !!!Ignored construct:  virtual double GetUseRangesFlyModeScalingNumberOfLabelsFontFactorInertiaShowActualBoundsCornerOffset ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CornerOffset  of  << this -> CornerOffset ) ; return this -> CornerOffset ; } ;
## Error: expected ';'!!!

proc ReleaseGraphicsResources*(this: var vtkCubeAxesActor2D; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkCubeAxesActor2D.h".}
proc SetXOriginYOriginZOriginUseRangesScalingCornerOffsetXAxisVisibility*(
    this: var vtkCubeAxesActor2D; _arg: vtkTypeBool) {.importcpp: "SetXOriginYOriginZOriginUseRangesScalingCornerOffsetXAxisVisibility",
    header: "vtkCubeAxesActor2D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetUseRangesFlyModeScalingNumberOfLabelsFontFactorInertiaShowActualBoundsCornerOffsetXAxisVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << XAxisVisibility  of  << this -> XAxisVisibility ) ; return this -> XAxisVisibility ; } ;
## Error: expected ';'!!!

proc XAxisVisibilityOn*(this: var vtkCubeAxesActor2D) {.
    importcpp: "XAxisVisibilityOn", header: "vtkCubeAxesActor2D.h".}
proc XAxisVisibilityOff*(this: var vtkCubeAxesActor2D) {.
    importcpp: "XAxisVisibilityOff", header: "vtkCubeAxesActor2D.h".}
proc SetXOriginYOriginZOriginUseRangesScalingCornerOffsetXAxisVisibilityYAxisVisibility*(
    this: var vtkCubeAxesActor2D; _arg: vtkTypeBool) {.importcpp: "SetXOriginYOriginZOriginUseRangesScalingCornerOffsetXAxisVisibilityYAxisVisibility",
    header: "vtkCubeAxesActor2D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetUseRangesFlyModeScalingNumberOfLabelsFontFactorInertiaShowActualBoundsCornerOffsetXAxisVisibilityYAxisVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << YAxisVisibility  of  << this -> YAxisVisibility ) ; return this -> YAxisVisibility ; } ;
## Error: expected ';'!!!

proc YAxisVisibilityOn*(this: var vtkCubeAxesActor2D) {.
    importcpp: "YAxisVisibilityOn", header: "vtkCubeAxesActor2D.h".}
proc YAxisVisibilityOff*(this: var vtkCubeAxesActor2D) {.
    importcpp: "YAxisVisibilityOff", header: "vtkCubeAxesActor2D.h".}
proc SetXOriginYOriginZOriginUseRangesScalingCornerOffsetXAxisVisibilityYAxisVisibilityZAxisVisibility*(
    this: var vtkCubeAxesActor2D; _arg: vtkTypeBool) {.importcpp: "SetXOriginYOriginZOriginUseRangesScalingCornerOffsetXAxisVisibilityYAxisVisibilityZAxisVisibility",
    header: "vtkCubeAxesActor2D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetUseRangesFlyModeScalingNumberOfLabelsFontFactorInertiaShowActualBoundsCornerOffsetXAxisVisibilityYAxisVisibilityZAxisVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ZAxisVisibility  of  << this -> ZAxisVisibility ) ; return this -> ZAxisVisibility ; } ;
## Error: expected ';'!!!

proc ZAxisVisibilityOn*(this: var vtkCubeAxesActor2D) {.
    importcpp: "ZAxisVisibilityOn", header: "vtkCubeAxesActor2D.h".}
proc ZAxisVisibilityOff*(this: var vtkCubeAxesActor2D) {.
    importcpp: "ZAxisVisibilityOff", header: "vtkCubeAxesActor2D.h".}
  ## /@}
  ## *
  ##  Shallow copy of a CubeAxesActor2D.
  ##
proc ShallowCopy*(this: var vtkCubeAxesActor2D; actor: ptr vtkCubeAxesActor2D) {.
    importcpp: "ShallowCopy", header: "vtkCubeAxesActor2D.h".}