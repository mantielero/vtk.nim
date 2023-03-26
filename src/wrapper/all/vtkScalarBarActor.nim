## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkScalarBarActor.h
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
##  @class   vtkScalarBarActor
##  @brief   Create a scalar bar with labels
##
##  vtkScalarBarActor creates a scalar bar with tick marks. A scalar
##  bar is a legend that indicates to the viewer the correspondence between
##  color value and data value. The legend consists of a rectangular bar
##  made of rectangular pieces each colored a constant value. Since
##  vtkScalarBarActor is a subclass of vtkActor2D, it is drawn in the image
##  plane (i.e., in the renderer's viewport) on top of the 3D graphics window.
##
##  To use vtkScalarBarActor you must associate a vtkScalarsToColors (or
##  subclass) with it. The lookup table defines the colors and the
##  range of scalar values used to map scalar data.  Typically, the
##  number of colors shown in the scalar bar is not equal to the number
##  of colors in the lookup table, in which case sampling of
##  the lookup table is performed.
##
##  Other optional capabilities include specifying the fraction of the
##  viewport size (both x and y directions) which will control the size
##  of the scalar bar and the number of tick labels. The actual position
##  of the scalar bar on the screen is controlled by using the
##  vtkActor2D::SetPosition() method (by default the scalar bar is
##  centered in the viewport).  Other features include the ability to
##  orient the scalar bar horizontally of vertically and controlling
##  the format (printf style) with which to print the labels on the
##  scalar bar. Also, the vtkScalarBarActor's property is applied to
##  the scalar bar and annotations (including layer, and
##  compositing operator).
##
##  Set the text property/attributes of the title and the labels through the
##  vtkTextProperty objects associated to this actor.
##
##  @warning
##  If a vtkLogLookupTable is specified as the lookup table to use, then the
##  labels are created using a logarithmic scale.
##
##  @sa
##  vtkActor2D vtkTextProperty vtkTextMapper vtkPolyDataMapper2D
##

import
  vtkActor2D, vtkDoubleArray, vtkRenderingAnnotationModule

discard "forward decl of vtkColor3ub"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkPolyDataMapper2D"
discard "forward decl of vtkProperty2D"
discard "forward decl of vtkScalarsToColors"
discard "forward decl of vtkScalarBarActorInternal"
discard "forward decl of vtkTextActor"
discard "forward decl of vtkTextMapper"
discard "forward decl of vtkTextProperty"
discard "forward decl of vtkTexture"
discard "forward decl of vtkTexturedActor2D"
const
  VTK_ORIENT_HORIZONTAL* = 0
  VTK_ORIENT_VERTICAL* = 1

type
  vtkScalarBarActor* {.importcpp: "vtkScalarBarActor",
                      header: "vtkScalarBarActor.h", bycopy.} = object of vtkActor2D
    vtkScalarBarActor* {.importc: "vtkScalarBarActor".}: VTK_NEWINSTANCE
    ##  off by default
    ##  off by default
    ##  on by default
    ##  on by default
    ##  off by default
    ##  off by default
    ##  off by default
    ## /@}
    ## / Internal state used for rendering
    ## /@{
    ## !< Last time internal state changed.
    ## !< Projected size in viewport coordinates of last build.
    ## !< Projected origin (viewport coordinates) of last build.
    ## !< Containers shared with subclasses
    ## !< The object this actor illustrates
    ## !< Font for the legend title.
    ## !< Font for tick labels.
    ## !< Font for annotation labels.
    ## !< The legend title text renderer.
    ## !< Polygon(s) colored by \a LookupTable.
    ## !< Mapper for \a ScalarBar.
    ## !< Actor for \a ScalarBar.
    ## !< Polygon colored when UseOpacity is true.
    ## !< Color data for \a TexturePolyData.
    ## !< Actor for \a TexturePolyData.
    ## !< Polygon used to fill the background.
    ## !< Mapper for \a Background.
    ## !< Actor for \a Background.
    ## !< Polyline used to highlight frame.
    ## !< Mapper for \a Frame.
    ## !< Actor for \a Frame.
    ## /@}

  vtkScalarBarActorSuperclass* = vtkActor2D

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkScalarBarActor::IsTypeOf(@)", header: "vtkScalarBarActor.h".}
proc IsA*(this: var vtkScalarBarActor; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkScalarBarActor.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkScalarBarActor {.
    importcpp: "vtkScalarBarActor::SafeDownCast(@)", header: "vtkScalarBarActor.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkScalarBarActor :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkActor2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkScalarBarActor :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkScalarBarActor :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkScalarBarActor; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkScalarBarActor.h".}
proc New*(): ptr vtkScalarBarActor {.importcpp: "vtkScalarBarActor::New(@)",
                                 header: "vtkScalarBarActor.h".}
proc RenderOpaqueGeometry*(this: var vtkScalarBarActor; viewport: ptr vtkViewport): cint {.
    importcpp: "RenderOpaqueGeometry", header: "vtkScalarBarActor.h".}
proc RenderTranslucentPolygonalGeometry*(this: var vtkScalarBarActor;
                                        a2: ptr vtkViewport): cint {.
    importcpp: "RenderTranslucentPolygonalGeometry", header: "vtkScalarBarActor.h".}
proc RenderOverlay*(this: var vtkScalarBarActor; viewport: ptr vtkViewport): cint {.
    importcpp: "RenderOverlay", header: "vtkScalarBarActor.h".}
proc HasTranslucentPolygonalGeometry*(this: var vtkScalarBarActor): vtkTypeBool {.
    importcpp: "HasTranslucentPolygonalGeometry", header: "vtkScalarBarActor.h".}
proc ReleaseGraphicsResources*(this: var vtkScalarBarActor; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkScalarBarActor.h".}
proc GetScalarBarRect*(this: var vtkScalarBarActor; rect: array[4, cint];
                      viewport: ptr vtkViewport) {.importcpp: "GetScalarBarRect",
    header: "vtkScalarBarActor.h".}
proc SetLookupTable*(this: var vtkScalarBarActor; a2: ptr vtkScalarsToColors) {.
    importcpp: "SetLookupTable", header: "vtkScalarBarActor.h".}
proc GetnameLookupTable*(this: var vtkScalarBarActor): ptr vtkScalarsToColors {.
    importcpp: "GetnameLookupTable", header: "vtkScalarBarActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Should be display the opacity as well. This is displayed by changing
  ##  the opacity of the scalar bar in accordance with the opacity of the
  ##  given color. For clarity, a texture grid is placed in the background
  ##  if Opacity is ON. You might also want to play with SetTextureGridWith
  ##  in that case. [Default: off]
  ##
proc SetUseOpacity*(this: var vtkScalarBarActor; _arg: vtkTypeBool) {.
    importcpp: "SetUseOpacity", header: "vtkScalarBarActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetUseOpacity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseOpacity  of  << this -> UseOpacity ) ; return this -> UseOpacity ; } ;
## Error: expected ';'!!!

proc UseOpacityOn*(this: var vtkScalarBarActor) {.importcpp: "UseOpacityOn",
    header: "vtkScalarBarActor.h".}
proc UseOpacityOff*(this: var vtkScalarBarActor) {.importcpp: "UseOpacityOff",
    header: "vtkScalarBarActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the maximum number of scalar bar segments to show. This may
  ##  differ from the number of colors in the lookup table, in which case
  ##  the colors are samples from the lookup table.
  ##
proc SetMaximumNumberOfColors*(this: var vtkScalarBarActor; _arg: cint) {.
    importcpp: "SetMaximumNumberOfColors", header: "vtkScalarBarActor.h".}
proc GetMaximumNumberOfColorsMinValue*(this: var vtkScalarBarActor): cint {.
    importcpp: "GetMaximumNumberOfColorsMinValue", header: "vtkScalarBarActor.h".}
proc GetMaximumNumberOfColorsMaxValue*(this: var vtkScalarBarActor): cint {.
    importcpp: "GetMaximumNumberOfColorsMaxValue", header: "vtkScalarBarActor.h".}
## !!!Ignored construct:  virtual int GetUseOpacityMaximumNumberOfColors ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumNumberOfColors  of  << this -> MaximumNumberOfColors ) ; return this -> MaximumNumberOfColors ; } ;
## Error: expected ';'!!!

proc SetMaximumNumberOfColorsNumberOfLabels*(this: var vtkScalarBarActor; _arg: cint) {.
    importcpp: "SetMaximumNumberOfColorsNumberOfLabels",
    header: "vtkScalarBarActor.h".}
proc GetMaximumNumberOfColorsMinValueNumberOfLabelsMinValue*(
    this: var vtkScalarBarActor): cint {.importcpp: "GetMaximumNumberOfColorsMinValueNumberOfLabelsMinValue",
                                     header: "vtkScalarBarActor.h".}
proc GetMaximumNumberOfColorsMaxValueNumberOfLabelsMaxValue*(
    this: var vtkScalarBarActor): cint {.importcpp: "GetMaximumNumberOfColorsMaxValueNumberOfLabelsMaxValue",
                                     header: "vtkScalarBarActor.h".}
## !!!Ignored construct:  virtual int GetUseOpacityMaximumNumberOfColorsNumberOfLabels ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfLabels  of  << this -> NumberOfLabels ) ; return this -> NumberOfLabels ; } ;
## Error: expected ';'!!!

proc SetCustomLabels*(this: var vtkScalarBarActor; labels: ptr vtkDoubleArray) {.
    importcpp: "SetCustomLabels", header: "vtkScalarBarActor.h".}
proc GetnameLookupTableCustomLabels*(this: var vtkScalarBarActor): ptr vtkDoubleArray {.
    importcpp: "GetnameLookupTableCustomLabels", header: "vtkScalarBarActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get/Set whether custom labels will be used.
  ##  bonds. Default: Off.
  ##
## !!!Ignored construct:  virtual bool GetUseOpacityMaximumNumberOfColorsNumberOfLabelsUseCustomLabels ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseCustomLabels  of  << this -> UseCustomLabels ) ; return this -> UseCustomLabels ; } ;
## Error: expected ';'!!!

proc SetUseOpacityUseCustomLabels*(this: var vtkScalarBarActor; _arg: bool) {.
    importcpp: "SetUseOpacityUseCustomLabels", header: "vtkScalarBarActor.h".}
proc UseCustomLabelsOn*(this: var vtkScalarBarActor) {.
    importcpp: "UseCustomLabelsOn", header: "vtkScalarBarActor.h".}
proc UseCustomLabelsOff*(this: var vtkScalarBarActor) {.
    importcpp: "UseCustomLabelsOff", header: "vtkScalarBarActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Control the orientation of the scalar bar.
  ##
proc SetMaximumNumberOfColorsNumberOfLabelsOrientation*(
    this: var vtkScalarBarActor; _arg: cint) {.
    importcpp: "SetMaximumNumberOfColorsNumberOfLabelsOrientation",
    header: "vtkScalarBarActor.h".}
proc GetMaximumNumberOfColorsMinValueNumberOfLabelsMinValueOrientationMinValue*(
    this: var vtkScalarBarActor): cint {.importcpp: "GetMaximumNumberOfColorsMinValueNumberOfLabelsMinValueOrientationMinValue",
                                     header: "vtkScalarBarActor.h".}
proc GetMaximumNumberOfColorsMaxValueNumberOfLabelsMaxValueOrientationMaxValue*(
    this: var vtkScalarBarActor): cint {.importcpp: "GetMaximumNumberOfColorsMaxValueNumberOfLabelsMaxValueOrientationMaxValue",
                                     header: "vtkScalarBarActor.h".}
## !!!Ignored construct:  virtual int GetUseOpacityMaximumNumberOfColorsNumberOfLabelsUseCustomLabelsOrientation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Orientation  of  << this -> Orientation ) ; return this -> Orientation ; } ;
## Error: expected ';'!!!

proc SetOrientationToHorizontal*(this: var vtkScalarBarActor) {.
    importcpp: "SetOrientationToHorizontal", header: "vtkScalarBarActor.h".}
proc SetOrientationToVertical*(this: var vtkScalarBarActor) {.
    importcpp: "SetOrientationToVertical", header: "vtkScalarBarActor.h".}
proc SetTitleTextProperty*(this: var vtkScalarBarActor; p: ptr vtkTextProperty) {.
    importcpp: "SetTitleTextProperty", header: "vtkScalarBarActor.h".}
proc GetnameLookupTableCustomLabelsTitleTextProperty*(this: var vtkScalarBarActor): ptr vtkTextProperty {.
    importcpp: "GetnameLookupTableCustomLabelsTitleTextProperty",
    header: "vtkScalarBarActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the labels text property.
  ##
proc SetLabelTextProperty*(this: var vtkScalarBarActor; p: ptr vtkTextProperty) {.
    importcpp: "SetLabelTextProperty", header: "vtkScalarBarActor.h".}
proc GetnameLookupTableCustomLabelsTitleTextPropertyLabelTextProperty*(
    this: var vtkScalarBarActor): ptr vtkTextProperty {.importcpp: "GetnameLookupTableCustomLabelsTitleTextPropertyLabelTextProperty",
    header: "vtkScalarBarActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the annotation text property.
  ##
proc SetAnnotationTextProperty*(this: var vtkScalarBarActor; p: ptr vtkTextProperty) {.
    importcpp: "SetAnnotationTextProperty", header: "vtkScalarBarActor.h".}
proc GetnameLookupTableCustomLabelsTitleTextPropertyLabelTextPropertyAnnotationTextProperty*(
    this: var vtkScalarBarActor): ptr vtkTextProperty {.importcpp: "GetnameLookupTableCustomLabelsTitleTextPropertyLabelTextPropertyAnnotationTextProperty",
    header: "vtkScalarBarActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the format with which to print the labels on the scalar
  ##  bar.
  ##
proc SetLabelFormat*(this: var vtkScalarBarActor; _arg: cstring) {.
    importcpp: "SetLabelFormat", header: "vtkScalarBarActor.h".}
proc GetLabelFormat*(this: var vtkScalarBarActor): cstring {.
    importcpp: "GetLabelFormat", header: "vtkScalarBarActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the title of the scalar bar actor,
  ##
proc SetLabelFormatTitle*(this: var vtkScalarBarActor; _arg: cstring) {.
    importcpp: "SetLabelFormatTitle", header: "vtkScalarBarActor.h".}
proc GetLabelFormatTitle*(this: var vtkScalarBarActor): cstring {.
    importcpp: "GetLabelFormatTitle", header: "vtkScalarBarActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the title for the component that is selected,
  ##
proc SetLabelFormatTitleComponentTitle*(this: var vtkScalarBarActor; _arg: cstring) {.
    importcpp: "SetLabelFormatTitleComponentTitle", header: "vtkScalarBarActor.h".}
proc GetLabelFormatTitleComponentTitle*(this: var vtkScalarBarActor): cstring {.
    importcpp: "GetLabelFormatTitleComponentTitle", header: "vtkScalarBarActor.h".}
  ## /@}
  ## *
  ##  Shallow copy of a scalar bar actor. Overloads the virtual vtkProp method.
  ##
proc ShallowCopy*(this: var vtkScalarBarActor; prop: ptr vtkProp) {.
    importcpp: "ShallowCopy", header: "vtkScalarBarActor.h".}
proc SetUseOpacityUseCustomLabelsTextureGridWidth*(this: var vtkScalarBarActor;
    _arg: cdouble) {.importcpp: "SetUseOpacityUseCustomLabelsTextureGridWidth",
                   header: "vtkScalarBarActor.h".}
## !!!Ignored construct:  virtual double GetUseOpacityMaximumNumberOfColorsNumberOfLabelsUseCustomLabelsOrientationTextureGridWidth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TextureGridWidth  of  << this -> TextureGridWidth ) ; return this -> TextureGridWidth ; } ;
## Error: expected ';'!!!

proc GetnameLookupTableCustomLabelsTitleTextPropertyLabelTextPropertyAnnotationTextPropertyTextureActor*(
    this: var vtkScalarBarActor): ptr vtkTexturedActor2D {.importcpp: "GetnameLookupTableCustomLabelsTitleTextPropertyLabelTextPropertyAnnotationTextPropertyTextureActor",
    header: "vtkScalarBarActor.h".}
  ## /@}
const
  vtkScalarBarActorPrecedeScalarBar* = 0
  vtkScalarBarActorSucceedScalarBar* = 1

proc SetMaximumNumberOfColorsNumberOfLabelsOrientationTextPosition*(
    this: var vtkScalarBarActor; _arg: cint) {.
    importcpp: "SetMaximumNumberOfColorsNumberOfLabelsOrientationTextPosition",
    header: "vtkScalarBarActor.h".}
proc GetMaximumNumberOfColorsMinValueNumberOfLabelsMinValueOrientationMinValueTextPositionMinValue*(
    this: var vtkScalarBarActor): cint {.importcpp: "GetMaximumNumberOfColorsMinValueNumberOfLabelsMinValueOrientationMinValueTextPositionMinValue",
                                     header: "vtkScalarBarActor.h".}
proc GetMaximumNumberOfColorsMaxValueNumberOfLabelsMaxValueOrientationMaxValueTextPositionMaxValue*(
    this: var vtkScalarBarActor): cint {.importcpp: "GetMaximumNumberOfColorsMaxValueNumberOfLabelsMaxValueOrientationMaxValueTextPositionMaxValue",
                                     header: "vtkScalarBarActor.h".}
## !!!Ignored construct:  virtual int GetUseOpacityMaximumNumberOfColorsNumberOfLabelsUseCustomLabelsOrientationTextureGridWidthTextPosition ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TextPosition  of  << this -> TextPosition ) ; return this -> TextPosition ; } ;
## Error: expected ';'!!!

proc SetTextPositionToPrecedeScalarBar*(this: var vtkScalarBarActor) {.
    importcpp: "SetTextPositionToPrecedeScalarBar", header: "vtkScalarBarActor.h".}
proc SetTextPositionToSucceedScalarBar*(this: var vtkScalarBarActor) {.
    importcpp: "SetTextPositionToSucceedScalarBar", header: "vtkScalarBarActor.h".}
proc SetUseOpacityUseCustomLabelsTextureGridWidthMaximumWidthInPixels*(
    this: var vtkScalarBarActor; _arg: cint) {.importcpp: "SetUseOpacityUseCustomLabelsTextureGridWidthMaximumWidthInPixels",
    header: "vtkScalarBarActor.h".}
## !!!Ignored construct:  virtual int GetUseOpacityMaximumNumberOfColorsNumberOfLabelsUseCustomLabelsOrientationTextureGridWidthTextPositionMaximumWidthInPixels ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumWidthInPixels  of  << this -> MaximumWidthInPixels ) ; return this -> MaximumWidthInPixels ; } ;
## Error: expected ';'!!!

proc SetUseOpacityUseCustomLabelsTextureGridWidthMaximumWidthInPixelsMaximumHeightInPixels*(
    this: var vtkScalarBarActor; _arg: cint) {.importcpp: "SetUseOpacityUseCustomLabelsTextureGridWidthMaximumWidthInPixelsMaximumHeightInPixels",
    header: "vtkScalarBarActor.h".}
## !!!Ignored construct:  virtual int GetUseOpacityMaximumNumberOfColorsNumberOfLabelsUseCustomLabelsOrientationTextureGridWidthTextPositionMaximumWidthInPixelsMaximumHeightInPixels ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumHeightInPixels  of  << this -> MaximumHeightInPixels ) ; return this -> MaximumHeightInPixels ; } ;
## Error: expected ';'!!!

proc SetUseOpacityUseCustomLabelsTextureGridWidthMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPadding*(
    this: var vtkScalarBarActor; _arg: cdouble) {.importcpp: "SetUseOpacityUseCustomLabelsTextureGridWidthMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPadding",
    header: "vtkScalarBarActor.h".}
## !!!Ignored construct:  virtual double GetUseOpacityMaximumNumberOfColorsNumberOfLabelsUseCustomLabelsOrientationTextureGridWidthTextPositionMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPadding ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AnnotationLeaderPadding  of  << this -> AnnotationLeaderPadding ) ; return this -> AnnotationLeaderPadding ; } ;
## Error: expected ';'!!!

proc SetUseOpacityUseCustomLabelsTextureGridWidthMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotations*(
    this: var vtkScalarBarActor; _arg: vtkTypeBool) {.importcpp: "SetUseOpacityUseCustomLabelsTextureGridWidthMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotations",
    header: "vtkScalarBarActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetUseOpacityMaximumNumberOfColorsNumberOfLabelsUseCustomLabelsOrientationTextureGridWidthTextPositionMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotations ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DrawAnnotations  of  << this -> DrawAnnotations ) ; return this -> DrawAnnotations ; } ;
## Error: expected ';'!!!

proc DrawAnnotationsOn*(this: var vtkScalarBarActor) {.
    importcpp: "DrawAnnotationsOn", header: "vtkScalarBarActor.h".}
proc DrawAnnotationsOff*(this: var vtkScalarBarActor) {.
    importcpp: "DrawAnnotationsOff", header: "vtkScalarBarActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get whether the NaN annotation should be rendered or not.
  ##  This only affects rendering when \a DrawAnnotations is true.
  ##  The default is false.
  ##
proc SetUseOpacityUseCustomLabelsTextureGridWidthMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotationsDrawNanAnnotation*(
    this: var vtkScalarBarActor; _arg: vtkTypeBool) {.importcpp: "SetUseOpacityUseCustomLabelsTextureGridWidthMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotationsDrawNanAnnotation",
    header: "vtkScalarBarActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetUseOpacityMaximumNumberOfColorsNumberOfLabelsUseCustomLabelsOrientationTextureGridWidthTextPositionMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotationsDrawNanAnnotation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DrawNanAnnotation  of  << this -> DrawNanAnnotation ) ; return this -> DrawNanAnnotation ; } ;
## Error: expected ';'!!!

proc DrawNanAnnotationOn*(this: var vtkScalarBarActor) {.
    importcpp: "DrawNanAnnotationOn", header: "vtkScalarBarActor.h".}
proc DrawNanAnnotationOff*(this: var vtkScalarBarActor) {.
    importcpp: "DrawNanAnnotationOff", header: "vtkScalarBarActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get whether the Below range swatch should be rendered or not.
  ##  This only affects rendering when \a DrawAnnotations is true.
  ##  The default is false.
  ##
proc SetUseOpacityUseCustomLabelsTextureGridWidthMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotationsDrawNanAnnotationDrawBelowRangeSwatch*(
    this: var vtkScalarBarActor; _arg: bool) {.importcpp: "SetUseOpacityUseCustomLabelsTextureGridWidthMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotationsDrawNanAnnotationDrawBelowRangeSwatch",
    header: "vtkScalarBarActor.h".}
## !!!Ignored construct:  virtual bool GetUseOpacityMaximumNumberOfColorsNumberOfLabelsUseCustomLabelsOrientationTextureGridWidthTextPositionMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotationsDrawNanAnnotationDrawBelowRangeSwatch ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DrawBelowRangeSwatch  of  << this -> DrawBelowRangeSwatch ) ; return this -> DrawBelowRangeSwatch ; } ;
## Error: expected ';'!!!

proc DrawBelowRangeSwatchOn*(this: var vtkScalarBarActor) {.
    importcpp: "DrawBelowRangeSwatchOn", header: "vtkScalarBarActor.h".}
proc DrawBelowRangeSwatchOff*(this: var vtkScalarBarActor) {.
    importcpp: "DrawBelowRangeSwatchOff", header: "vtkScalarBarActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get the annotation text for "Below Range" values.
  ##
proc SetLabelFormatTitleComponentTitleBelowRangeAnnotation*(
    this: var vtkScalarBarActor; _arg: cstring) {.
    importcpp: "SetLabelFormatTitleComponentTitleBelowRangeAnnotation",
    header: "vtkScalarBarActor.h".}
proc GetLabelFormatTitleComponentTitleBelowRangeAnnotation*(
    this: var vtkScalarBarActor): cstring {.importcpp: "GetLabelFormatTitleComponentTitleBelowRangeAnnotation",
                                        header: "vtkScalarBarActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get whether the Above range swatch should be rendered or not.
  ##  This only affects rendering when \a DrawAnnotations is true.
  ##  The default is false.
  ##
proc SetUseOpacityUseCustomLabelsTextureGridWidthMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotationsDrawNanAnnotationDrawBelowRangeSwatchDrawAboveRangeSwatch*(
    this: var vtkScalarBarActor; _arg: bool) {.importcpp: "SetUseOpacityUseCustomLabelsTextureGridWidthMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotationsDrawNanAnnotationDrawBelowRangeSwatchDrawAboveRangeSwatch",
    header: "vtkScalarBarActor.h".}
## !!!Ignored construct:  virtual bool GetUseOpacityMaximumNumberOfColorsNumberOfLabelsUseCustomLabelsOrientationTextureGridWidthTextPositionMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotationsDrawNanAnnotationDrawBelowRangeSwatchDrawAboveRangeSwatch ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DrawAboveRangeSwatch  of  << this -> DrawAboveRangeSwatch ) ; return this -> DrawAboveRangeSwatch ; } ;
## Error: expected ';'!!!

proc DrawAboveRangeSwatchOn*(this: var vtkScalarBarActor) {.
    importcpp: "DrawAboveRangeSwatchOn", header: "vtkScalarBarActor.h".}
proc DrawAboveRangeSwatchOff*(this: var vtkScalarBarActor) {.
    importcpp: "DrawAboveRangeSwatchOff", header: "vtkScalarBarActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get the annotation text for "Above Range Swatch" values.
  ##
proc SetLabelFormatTitleComponentTitleBelowRangeAnnotationAboveRangeAnnotation*(
    this: var vtkScalarBarActor; _arg: cstring) {.importcpp: "SetLabelFormatTitleComponentTitleBelowRangeAnnotationAboveRangeAnnotation",
    header: "vtkScalarBarActor.h".}
proc GetLabelFormatTitleComponentTitleBelowRangeAnnotationAboveRangeAnnotation*(
    this: var vtkScalarBarActor): cstring {.importcpp: "GetLabelFormatTitleComponentTitleBelowRangeAnnotationAboveRangeAnnotation",
                                        header: "vtkScalarBarActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get how leader lines connecting annotations to values should be colored.
  ##
  ##  When true, leader lines are all the same color (and match the LabelTextProperty color).
  ##  When false, leader lines take on the color of the value they correspond to.
  ##  This only affects rendering when \a DrawAnnotations is true.
  ##  The default is false.
  ##
proc SetUseOpacityUseCustomLabelsTextureGridWidthMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotationsDrawNanAnnotationDrawBelowRangeSwatchDrawAboveRangeSwatchFixedAnnotationLeaderLineColor*(
    this: var vtkScalarBarActor; _arg: vtkTypeBool) {.importcpp: "SetUseOpacityUseCustomLabelsTextureGridWidthMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotationsDrawNanAnnotationDrawBelowRangeSwatchDrawAboveRangeSwatchFixedAnnotationLeaderLineColor",
    header: "vtkScalarBarActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetUseOpacityMaximumNumberOfColorsNumberOfLabelsUseCustomLabelsOrientationTextureGridWidthTextPositionMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotationsDrawNanAnnotationDrawBelowRangeSwatchDrawAboveRangeSwatchFixedAnnotationLeaderLineColor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FixedAnnotationLeaderLineColor  of  << this -> FixedAnnotationLeaderLineColor ) ; return this -> FixedAnnotationLeaderLineColor ; } ;
## Error: expected ';'!!!

proc FixedAnnotationLeaderLineColorOn*(this: var vtkScalarBarActor) {.
    importcpp: "FixedAnnotationLeaderLineColorOn", header: "vtkScalarBarActor.h".}
proc FixedAnnotationLeaderLineColorOff*(this: var vtkScalarBarActor) {.
    importcpp: "FixedAnnotationLeaderLineColorOff", header: "vtkScalarBarActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get the annotation text for "NaN" values.
  ##
proc SetLabelFormatTitleComponentTitleBelowRangeAnnotationAboveRangeAnnotationNanAnnotation*(
    this: var vtkScalarBarActor; _arg: cstring) {.importcpp: "SetLabelFormatTitleComponentTitleBelowRangeAnnotationAboveRangeAnnotationNanAnnotation",
    header: "vtkScalarBarActor.h".}
proc GetLabelFormatTitleComponentTitleBelowRangeAnnotationAboveRangeAnnotationNanAnnotation*(
    this: var vtkScalarBarActor): cstring {.importcpp: "GetLabelFormatTitleComponentTitleBelowRangeAnnotationAboveRangeAnnotationNanAnnotation",
                                        header: "vtkScalarBarActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get whether annotation labels should be scaled with the viewport.
  ##
  ##  The default value is 0 (no scaling).
  ##  If non-zero, the vtkTextActor instances used to render annotation
  ##  labels will have their TextScaleMode set to viewport-based scaling,
  ##  which nonlinearly scales font size with the viewport size.
  ##
proc SetUseOpacityUseCustomLabelsTextureGridWidthMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotationsDrawNanAnnotationDrawBelowRangeSwatchDrawAboveRangeSwatchFixedAnnotationLeaderLineColorAnnotationTextScaling*(
    this: var vtkScalarBarActor; _arg: vtkTypeBool) {.importcpp: "SetUseOpacityUseCustomLabelsTextureGridWidthMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotationsDrawNanAnnotationDrawBelowRangeSwatchDrawAboveRangeSwatchFixedAnnotationLeaderLineColorAnnotationTextScaling",
    header: "vtkScalarBarActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetUseOpacityMaximumNumberOfColorsNumberOfLabelsUseCustomLabelsOrientationTextureGridWidthTextPositionMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotationsDrawNanAnnotationDrawBelowRangeSwatchDrawAboveRangeSwatchFixedAnnotationLeaderLineColorAnnotationTextScaling ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AnnotationTextScaling  of  << this -> AnnotationTextScaling ) ; return this -> AnnotationTextScaling ; } ;
## Error: expected ';'!!!

proc AnnotationTextScalingOn*(this: var vtkScalarBarActor) {.
    importcpp: "AnnotationTextScalingOn", header: "vtkScalarBarActor.h".}
proc AnnotationTextScalingOff*(this: var vtkScalarBarActor) {.
    importcpp: "AnnotationTextScalingOff", header: "vtkScalarBarActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get whether a background should be drawn around the scalar bar.
  ##  Default is off.
  ##
proc SetUseOpacityUseCustomLabelsTextureGridWidthMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotationsDrawNanAnnotationDrawBelowRangeSwatchDrawAboveRangeSwatchFixedAnnotationLeaderLineColorAnnotationTextScalingDrawBackground*(
    this: var vtkScalarBarActor; _arg: vtkTypeBool) {.importcpp: "SetUseOpacityUseCustomLabelsTextureGridWidthMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotationsDrawNanAnnotationDrawBelowRangeSwatchDrawAboveRangeSwatchFixedAnnotationLeaderLineColorAnnotationTextScalingDrawBackground",
    header: "vtkScalarBarActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetUseOpacityMaximumNumberOfColorsNumberOfLabelsUseCustomLabelsOrientationTextureGridWidthTextPositionMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotationsDrawNanAnnotationDrawBelowRangeSwatchDrawAboveRangeSwatchFixedAnnotationLeaderLineColorAnnotationTextScalingDrawBackground ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DrawBackground  of  << this -> DrawBackground ) ; return this -> DrawBackground ; } ;
## Error: expected ';'!!!

proc DrawBackgroundOn*(this: var vtkScalarBarActor) {.importcpp: "DrawBackgroundOn",
    header: "vtkScalarBarActor.h".}
proc DrawBackgroundOff*(this: var vtkScalarBarActor) {.
    importcpp: "DrawBackgroundOff", header: "vtkScalarBarActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get whether a frame should be drawn around the scalar bar.
  ##  Default is off.
  ##
proc SetUseOpacityUseCustomLabelsTextureGridWidthMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotationsDrawNanAnnotationDrawBelowRangeSwatchDrawAboveRangeSwatchFixedAnnotationLeaderLineColorAnnotationTextScalingDrawBackgroundDrawFrame*(
    this: var vtkScalarBarActor; _arg: vtkTypeBool) {.importcpp: "SetUseOpacityUseCustomLabelsTextureGridWidthMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotationsDrawNanAnnotationDrawBelowRangeSwatchDrawAboveRangeSwatchFixedAnnotationLeaderLineColorAnnotationTextScalingDrawBackgroundDrawFrame",
    header: "vtkScalarBarActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetUseOpacityMaximumNumberOfColorsNumberOfLabelsUseCustomLabelsOrientationTextureGridWidthTextPositionMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotationsDrawNanAnnotationDrawBelowRangeSwatchDrawAboveRangeSwatchFixedAnnotationLeaderLineColorAnnotationTextScalingDrawBackgroundDrawFrame ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DrawFrame  of  << this -> DrawFrame ) ; return this -> DrawFrame ; } ;
## Error: expected ';'!!!

proc DrawFrameOn*(this: var vtkScalarBarActor) {.importcpp: "DrawFrameOn",
    header: "vtkScalarBarActor.h".}
proc DrawFrameOff*(this: var vtkScalarBarActor) {.importcpp: "DrawFrameOff",
    header: "vtkScalarBarActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get whether the color bar should be drawn. If off, only the tickmarks
  ##  and text will be drawn. Default is on.
  ##
proc SetUseOpacityUseCustomLabelsTextureGridWidthMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotationsDrawNanAnnotationDrawBelowRangeSwatchDrawAboveRangeSwatchFixedAnnotationLeaderLineColorAnnotationTextScalingDrawBackgroundDrawFrameDrawColorBar*(
    this: var vtkScalarBarActor; _arg: vtkTypeBool) {.importcpp: "SetUseOpacityUseCustomLabelsTextureGridWidthMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotationsDrawNanAnnotationDrawBelowRangeSwatchDrawAboveRangeSwatchFixedAnnotationLeaderLineColorAnnotationTextScalingDrawBackgroundDrawFrameDrawColorBar",
    header: "vtkScalarBarActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetUseOpacityMaximumNumberOfColorsNumberOfLabelsUseCustomLabelsOrientationTextureGridWidthTextPositionMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotationsDrawNanAnnotationDrawBelowRangeSwatchDrawAboveRangeSwatchFixedAnnotationLeaderLineColorAnnotationTextScalingDrawBackgroundDrawFrameDrawColorBar ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DrawColorBar  of  << this -> DrawColorBar ) ; return this -> DrawColorBar ; } ;
## Error: expected ';'!!!

proc DrawColorBarOn*(this: var vtkScalarBarActor) {.importcpp: "DrawColorBarOn",
    header: "vtkScalarBarActor.h".}
proc DrawColorBarOff*(this: var vtkScalarBarActor) {.importcpp: "DrawColorBarOff",
    header: "vtkScalarBarActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get whether the tick labels should be drawn. Default is on.
  ##
proc SetUseOpacityUseCustomLabelsTextureGridWidthMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotationsDrawNanAnnotationDrawBelowRangeSwatchDrawAboveRangeSwatchFixedAnnotationLeaderLineColorAnnotationTextScalingDrawBackgroundDrawFrameDrawColorBarDrawTickLabels*(
    this: var vtkScalarBarActor; _arg: vtkTypeBool) {.importcpp: "SetUseOpacityUseCustomLabelsTextureGridWidthMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotationsDrawNanAnnotationDrawBelowRangeSwatchDrawAboveRangeSwatchFixedAnnotationLeaderLineColorAnnotationTextScalingDrawBackgroundDrawFrameDrawColorBarDrawTickLabels",
    header: "vtkScalarBarActor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetUseOpacityMaximumNumberOfColorsNumberOfLabelsUseCustomLabelsOrientationTextureGridWidthTextPositionMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotationsDrawNanAnnotationDrawBelowRangeSwatchDrawAboveRangeSwatchFixedAnnotationLeaderLineColorAnnotationTextScalingDrawBackgroundDrawFrameDrawColorBarDrawTickLabels ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DrawTickLabels  of  << this -> DrawTickLabels ) ; return this -> DrawTickLabels ; } ;
## Error: expected ';'!!!

proc DrawTickLabelsOn*(this: var vtkScalarBarActor) {.importcpp: "DrawTickLabelsOn",
    header: "vtkScalarBarActor.h".}
proc DrawTickLabelsOff*(this: var vtkScalarBarActor) {.
    importcpp: "DrawTickLabelsOff", header: "vtkScalarBarActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the background property.
  ##
proc SetBackgroundProperty*(this: var vtkScalarBarActor; p: ptr vtkProperty2D) {.
    importcpp: "SetBackgroundProperty", header: "vtkScalarBarActor.h".}
proc GetnameLookupTableCustomLabelsTitleTextPropertyLabelTextPropertyAnnotationTextPropertyTextureActorBackgroundProperty*(
    this: var vtkScalarBarActor): ptr vtkProperty2D {.importcpp: "GetnameLookupTableCustomLabelsTitleTextPropertyLabelTextPropertyAnnotationTextPropertyTextureActorBackgroundProperty",
    header: "vtkScalarBarActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the frame property.
  ##
proc SetFrameProperty*(this: var vtkScalarBarActor; p: ptr vtkProperty2D) {.
    importcpp: "SetFrameProperty", header: "vtkScalarBarActor.h".}
proc GetnameLookupTableCustomLabelsTitleTextPropertyLabelTextPropertyAnnotationTextPropertyTextureActorBackgroundPropertyFrameProperty*(
    this: var vtkScalarBarActor): ptr vtkProperty2D {.importcpp: "GetnameLookupTableCustomLabelsTitleTextPropertyLabelTextPropertyAnnotationTextPropertyTextureActorBackgroundPropertyFrameProperty",
    header: "vtkScalarBarActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get the amount of padding around text boxes.
  ##  The default is 1 pixel.
  ##
## !!!Ignored construct:  virtual int GetUseOpacityMaximumNumberOfColorsNumberOfLabelsUseCustomLabelsOrientationTextureGridWidthTextPositionMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotationsDrawNanAnnotationDrawBelowRangeSwatchDrawAboveRangeSwatchFixedAnnotationLeaderLineColorAnnotationTextScalingDrawBackgroundDrawFrameDrawColorBarDrawTickLabelsTextPad ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TextPad  of  << this -> TextPad ) ; return this -> TextPad ; } ;
## Error: expected ';'!!!

proc SetUseOpacityUseCustomLabelsTextureGridWidthMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotationsDrawNanAnnotationDrawBelowRangeSwatchDrawAboveRangeSwatchFixedAnnotationLeaderLineColorAnnotationTextScalingDrawBackgroundDrawFrameDrawColorBarDrawTickLabelsTextPad*(
    this: var vtkScalarBarActor; _arg: cint) {.importcpp: "SetUseOpacityUseCustomLabelsTextureGridWidthMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotationsDrawNanAnnotationDrawBelowRangeSwatchDrawAboveRangeSwatchFixedAnnotationLeaderLineColorAnnotationTextScalingDrawBackgroundDrawFrameDrawColorBarDrawTickLabelsTextPad",
    header: "vtkScalarBarActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get the margin in pixels, between the title and the bar,
  ##  when the \a Orientation is vertical.
  ##  The default is 0 pixels.
  ##
## !!!Ignored construct:  virtual int GetUseOpacityMaximumNumberOfColorsNumberOfLabelsUseCustomLabelsOrientationTextureGridWidthTextPositionMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotationsDrawNanAnnotationDrawBelowRangeSwatchDrawAboveRangeSwatchFixedAnnotationLeaderLineColorAnnotationTextScalingDrawBackgroundDrawFrameDrawColorBarDrawTickLabelsTextPadVerticalTitleSeparation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << VerticalTitleSeparation  of  << this -> VerticalTitleSeparation ) ; return this -> VerticalTitleSeparation ; } ;
## Error: expected ';'!!!

proc SetUseOpacityUseCustomLabelsTextureGridWidthMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotationsDrawNanAnnotationDrawBelowRangeSwatchDrawAboveRangeSwatchFixedAnnotationLeaderLineColorAnnotationTextScalingDrawBackgroundDrawFrameDrawColorBarDrawTickLabelsTextPadVerticalTitleSeparation*(
    this: var vtkScalarBarActor; _arg: cint) {.importcpp: "SetUseOpacityUseCustomLabelsTextureGridWidthMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotationsDrawNanAnnotationDrawBelowRangeSwatchDrawAboveRangeSwatchFixedAnnotationLeaderLineColorAnnotationTextScalingDrawBackgroundDrawFrameDrawColorBarDrawTickLabelsTextPadVerticalTitleSeparation",
    header: "vtkScalarBarActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get the thickness of the color bar relative to the widget frame.
  ##  The default is 0.375 and must always be in the range ]0, 1[.
  ##
## !!!Ignored construct:  virtual double GetUseOpacityMaximumNumberOfColorsNumberOfLabelsUseCustomLabelsOrientationTextureGridWidthTextPositionMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotationsDrawNanAnnotationDrawBelowRangeSwatchDrawAboveRangeSwatchFixedAnnotationLeaderLineColorAnnotationTextScalingDrawBackgroundDrawFrameDrawColorBarDrawTickLabelsTextPadVerticalTitleSeparationBarRatio ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BarRatio  of  << this -> BarRatio ) ; return this -> BarRatio ; } ;
## Error: expected ';'!!!

proc SetMaximumNumberOfColorsNumberOfLabelsOrientationTextPositionBarRatio*(
    this: var vtkScalarBarActor; _arg: cdouble) {.importcpp: "SetMaximumNumberOfColorsNumberOfLabelsOrientationTextPositionBarRatio",
    header: "vtkScalarBarActor.h".}
proc GetMaximumNumberOfColorsMinValueNumberOfLabelsMinValueOrientationMinValueTextPositionMinValueBarRatioMinValue*(
    this: var vtkScalarBarActor): cdouble {.importcpp: "GetMaximumNumberOfColorsMinValueNumberOfLabelsMinValueOrientationMinValueTextPositionMinValueBarRatioMinValue",
                                        header: "vtkScalarBarActor.h".}
proc GetMaximumNumberOfColorsMaxValueNumberOfLabelsMaxValueOrientationMaxValueTextPositionMaxValueBarRatioMaxValue*(
    this: var vtkScalarBarActor): cdouble {.importcpp: "GetMaximumNumberOfColorsMaxValueNumberOfLabelsMaxValueOrientationMaxValueTextPositionMaxValueBarRatioMaxValue",
                                        header: "vtkScalarBarActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get the ratio of the title height to the tick label height
  ##  (used only when the \a Orientation is horizontal).
  ##  The default is 0.5, which attempts to make the labels and title
  ##  the same size. This must be a number in the range ]0, 1[.
  ##
## !!!Ignored construct:  virtual double GetUseOpacityMaximumNumberOfColorsNumberOfLabelsUseCustomLabelsOrientationTextureGridWidthTextPositionMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotationsDrawNanAnnotationDrawBelowRangeSwatchDrawAboveRangeSwatchFixedAnnotationLeaderLineColorAnnotationTextScalingDrawBackgroundDrawFrameDrawColorBarDrawTickLabelsTextPadVerticalTitleSeparationBarRatioTitleRatio ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TitleRatio  of  << this -> TitleRatio ) ; return this -> TitleRatio ; } ;
## Error: expected ';'!!!

proc SetMaximumNumberOfColorsNumberOfLabelsOrientationTextPositionBarRatioTitleRatio*(
    this: var vtkScalarBarActor; _arg: cdouble) {.importcpp: "SetMaximumNumberOfColorsNumberOfLabelsOrientationTextPositionBarRatioTitleRatio",
    header: "vtkScalarBarActor.h".}
proc GetMaximumNumberOfColorsMinValueNumberOfLabelsMinValueOrientationMinValueTextPositionMinValueBarRatioMinValueTitleRatioMinValue*(
    this: var vtkScalarBarActor): cdouble {.importcpp: "GetMaximumNumberOfColorsMinValueNumberOfLabelsMinValueOrientationMinValueTextPositionMinValueBarRatioMinValueTitleRatioMinValue",
                                        header: "vtkScalarBarActor.h".}
proc GetMaximumNumberOfColorsMaxValueNumberOfLabelsMaxValueOrientationMaxValueTextPositionMaxValueBarRatioMaxValueTitleRatioMaxValue*(
    this: var vtkScalarBarActor): cdouble {.importcpp: "GetMaximumNumberOfColorsMaxValueNumberOfLabelsMaxValueOrientationMaxValueTextPositionMaxValueBarRatioMaxValueTitleRatioMaxValue",
                                        header: "vtkScalarBarActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get whether the font size of title and labels is unconstrained. Default is off.
  ##  When it is constrained, the size of the scalar bar will constrain the font size.
  ##  When it is not, the size of the font will always be respected.
  ##  Using custom labels will force this mode to be on.
  ##
proc SetUseOpacityUseCustomLabelsTextureGridWidthMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotationsDrawNanAnnotationDrawBelowRangeSwatchDrawAboveRangeSwatchFixedAnnotationLeaderLineColorAnnotationTextScalingDrawBackgroundDrawFrameDrawColorBarDrawTickLabelsTextPadVerticalTitleSeparationUnconstrainedFontSize*(
    this: var vtkScalarBarActor; _arg: bool) {.importcpp: "SetUseOpacityUseCustomLabelsTextureGridWidthMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotationsDrawNanAnnotationDrawBelowRangeSwatchDrawAboveRangeSwatchFixedAnnotationLeaderLineColorAnnotationTextScalingDrawBackgroundDrawFrameDrawColorBarDrawTickLabelsTextPadVerticalTitleSeparationUnconstrainedFontSize",
    header: "vtkScalarBarActor.h".}
## !!!Ignored construct:  virtual bool GetUseOpacityMaximumNumberOfColorsNumberOfLabelsUseCustomLabelsOrientationTextureGridWidthTextPositionMaximumWidthInPixelsMaximumHeightInPixelsAnnotationLeaderPaddingDrawAnnotationsDrawNanAnnotationDrawBelowRangeSwatchDrawAboveRangeSwatchFixedAnnotationLeaderLineColorAnnotationTextScalingDrawBackgroundDrawFrameDrawColorBarDrawTickLabelsTextPadVerticalTitleSeparationBarRatioTitleRatioUnconstrainedFontSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UnconstrainedFontSize  of  << this -> UnconstrainedFontSize ) ; return this -> UnconstrainedFontSize ; } ;
## Error: expected ';'!!!

proc UnconstrainedFontSizeOn*(this: var vtkScalarBarActor) {.
    importcpp: "UnconstrainedFontSizeOn", header: "vtkScalarBarActor.h".}
proc UnconstrainedFontSizeOff*(this: var vtkScalarBarActor) {.
    importcpp: "UnconstrainedFontSizeOff", header: "vtkScalarBarActor.h".}
  ## /@}