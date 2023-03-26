## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLineIntegralConvolution2D.h
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
##  @class   vtkLineIntegralConvolution2D
##  @brief   GPU-based implementation of Line
##   Integral Convolution (LIC)
##
##
##   This class resorts to GLSL to implement GPU-based Line Integral Convolution
##   (LIC) for visualizing a 2D vector field that may be obtained by projecting
##   an original 3D vector field onto a surface (such that the resulting 2D
##   vector at each grid point on the surface is tangential to the local normal,
##   as done in vtkSurfaceLICPainter).
##
##   As an image-based technique, 2D LIC works by (1) integrating a bidirectional
##   streamline from the center of each pixel (of the LIC output image), (2)
##   locating the pixels along / hit by this streamline as the correlated pixels
##   of the starting pixel (seed point / pixel), (3) indexing a (usually white)
##   noise texture (another input to LIC, in addition to the 2D vector field,
##   usually with the same size as that of the 2D vector field) to determine the
##   values (colors) of these pixels (the starting and the correlated pixels),
##   typically through bi-linear interpolation, and (4) performing convolution
##   (weighted averaging) on these values, by adopting a low-pass filter (such
##   as box, ramp, and Hanning kernels), to obtain the result value (color) that
##   is then assigned to the seed pixel.
##
##   The GLSL-based GPU implementation herein maps the aforementioned pipeline to
##   fragment shaders and a box kernel is employed. Both the white noise and the
##   vector field are provided to the GPU as texture objects (supported by the
##   multi-texturing capability). In addition, there are four texture objects
##   (color buffers) allocated to constitute two pairs that work in a ping-pong
##   fashion, with one as the read buffers and the other as the write / render
##   targets. Maintained by a frame buffer object (GL_EXT_framebuffer_object),
##   each pair employs one buffer to store the current (dynamically updated)
##   position (by means of the texture coordinate that keeps being warped by the
##   underlying vector) of the (virtual) particle initially released from each
##   fragment while using the bother buffer to store the current (dynamically
##   updated too) accumulated texture value that each seed fragment (before the
##   'mesh' is warped) collects. Given NumberOfSteps integration steps in each
##   direction, there are a total of (2 * NumberOfSteps + 1) fragments (including
##   the seed fragment) are convolved and each contributes 1 / (2 * NumberOfSteps
##   + 1) of the associated texture value to fulfill the box filter.
##
##   One pass of LIC (basic LIC) tends to produce low-contrast / blurred images and
##   vtkLineIntegralConvolution2D provides an option for creating enhanced LIC
##   images. Enhanced LIC improves image quality by increasing inter-streamline
##   contrast while suppressing artifacts. It performs two passes of LIC, with a
##   3x3 Laplacian high-pass filter in between that processes the output of pass
##   #1 LIC and forwards the result as the input 'noise' to pass #2 LIC.
##
##   vtkLineIntegralConvolution2D applies masking to zero-vector fragments so
##   that un-filtered white noise areas are made totally transparent by class
##   vtkSurfaceLICPainter to show the underlying geometry surface.
##
##   The convolution process tends to decrease both contrast and dynamic range,
##   sometimes leading to dull dark images. In order to counteract this, optional
##   contrast ehnancement stages have been added. These increase the dynamic range and
##   contrast and sharpen streaking patterns that emerge from the LIC process.
##
##   Under some circumstances, typically depending on the contrast and dynamic
##   range and graininess of the noise texture, jagged or pixelated patterns emerge
##   in the LIC. These can be reduced by enabling the optional anti-aliasing pass.
##
##   The internal pipeline is as follows, with optional stages denoted by ()
##   nested optional stages depend on their parent stage.
##   <pre>
##    noise texture
##            |
##            [ LIC ((CE) HPF LIC) (AA) (CE) ]
##            |                              |
##   vector field                       LIC'd image
##  </pre>
##   where LIC is the LIC stage, HPF is the high-pass filter stage, CE is the
##   contrast ehnacement stage, and AA is the antialias stage.
##
##  @sa
##   vtkImageDataLIC2D vtkStructuredGridLIC2D
##

import
  vtkObject, vtkRenderingLICOpenGL2Module, vtkWeakPointer

discard "forward decl of vtkOpenGLFramebufferObject"
discard "forward decl of vtkOpenGLHelper"
discard "forward decl of vtkOpenGLRenderWindow"
discard "forward decl of vtkPainterCommunicator"
discard "forward decl of vtkPixelExtent"
discard "forward decl of vtkRenderWindow"
discard "forward decl of vtkShaderProgram"
discard "forward decl of vtkTextureObject"
type
  vtkLineIntegralConvolution2D* {.importcpp: "vtkLineIntegralConvolution2D",
                                 header: "vtkLineIntegralConvolution2D.h", bycopy.} = object of vtkObject
    vtkLineIntegralConvolution2D* {.importc: "vtkLineIntegralConvolution2D".}: VTK_NEWINSTANCE


proc New*(): ptr vtkLineIntegralConvolution2D {.
    importcpp: "vtkLineIntegralConvolution2D::New(@)",
    header: "vtkLineIntegralConvolution2D.h".}
type
  vtkLineIntegralConvolution2DSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkLineIntegralConvolution2D::IsTypeOf(@)",
    header: "vtkLineIntegralConvolution2D.h".}
proc IsA*(this: var vtkLineIntegralConvolution2D; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkLineIntegralConvolution2D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkLineIntegralConvolution2D {.
    importcpp: "vtkLineIntegralConvolution2D::SafeDownCast(@)",
    header: "vtkLineIntegralConvolution2D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkLineIntegralConvolution2D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLineIntegralConvolution2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLineIntegralConvolution2D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkLineIntegralConvolution2D; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkLineIntegralConvolution2D.h".}
proc IsSupported*(renWin: ptr vtkRenderWindow): bool {.
    importcpp: "vtkLineIntegralConvolution2D::IsSupported(@)",
    header: "vtkLineIntegralConvolution2D.h".}
proc SetContext*(this: var vtkLineIntegralConvolution2D;
                context: ptr vtkOpenGLRenderWindow) {.importcpp: "SetContext",
    header: "vtkLineIntegralConvolution2D.h".}
proc GetContext*(this: var vtkLineIntegralConvolution2D): ptr vtkOpenGLRenderWindow {.
    importcpp: "GetContext", header: "vtkLineIntegralConvolution2D.h".}
proc SetEnhancedLIC*(this: var vtkLineIntegralConvolution2D; _arg: cint) {.
    importcpp: "SetEnhancedLIC", header: "vtkLineIntegralConvolution2D.h".}
proc GetEnhancedLICMinValue*(this: var vtkLineIntegralConvolution2D): cint {.
    importcpp: "GetEnhancedLICMinValue", header: "vtkLineIntegralConvolution2D.h".}
proc GetEnhancedLICMaxValue*(this: var vtkLineIntegralConvolution2D): cint {.
    importcpp: "GetEnhancedLICMaxValue", header: "vtkLineIntegralConvolution2D.h".}
## !!!Ignored construct:  virtual int GetEnhancedLIC ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EnhancedLIC  of  << this -> EnhancedLIC ) ; return this -> EnhancedLIC ; } ;
## Error: expected ';'!!!

proc EnhancedLICOn*(this: var vtkLineIntegralConvolution2D) {.
    importcpp: "EnhancedLICOn", header: "vtkLineIntegralConvolution2D.h".}
proc EnhancedLICOff*(this: var vtkLineIntegralConvolution2D) {.
    importcpp: "EnhancedLICOff", header: "vtkLineIntegralConvolution2D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Enable/Disable contrast and dynamic range correction stages. Stage 1 is applied
  ##  on the input to the high-pass filter when the high-pass filter is enabled and
  ##  skipped otherwise. Stage 2, when enabled is the final stage in the internal
  ##  pipeline. Both stages are implemented by a histogram stretching of the gray scale
  ##  colors in the LIC'd image as follows:
  ##
  ##  c = (c-m)/(M-m)
  ##
  ##  where, c is the fragment color, m is the color value to map to 0, M is the
  ##  color value to map to 1. The default values of m and M are the min and max
  ##  over all fragments.
  ##
  ##  This increase the dynamic range and contrast in the LIC'd image, both of which
  ##  are naturally attenuated by the LI convolution process.
  ##
  ##  ENHANCE_CONTRAST_OFF  -- don't enhance contrast
  ##  ENHANCE_CONTRAST_ON   -- enhance high-pass input and final stage output
  ##
  ##  This feature is disabled by default.
  ##
const
  vtkLineIntegralConvolution2DENHANCE_CONTRAST_OFF* = 0
  vtkLineIntegralConvolution2DENHANCE_CONTRAST_ON* = 1

proc SetEnhancedLICEnhanceContrast*(this: var vtkLineIntegralConvolution2D;
                                   _arg: cint) {.
    importcpp: "SetEnhancedLICEnhanceContrast",
    header: "vtkLineIntegralConvolution2D.h".}
proc GetEnhancedLICMinValueEnhanceContrastMinValue*(
    this: var vtkLineIntegralConvolution2D): cint {.
    importcpp: "GetEnhancedLICMinValueEnhanceContrastMinValue",
    header: "vtkLineIntegralConvolution2D.h".}
proc GetEnhancedLICMaxValueEnhanceContrastMaxValue*(
    this: var vtkLineIntegralConvolution2D): cint {.
    importcpp: "GetEnhancedLICMaxValueEnhanceContrastMaxValue",
    header: "vtkLineIntegralConvolution2D.h".}
## !!!Ignored construct:  virtual int GetEnhancedLICEnhanceContrast ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EnhanceContrast  of  << this -> EnhanceContrast ) ; return this -> EnhanceContrast ; } ;
## Error: expected ';'!!!

proc EnhanceContrastOn*(this: var vtkLineIntegralConvolution2D) {.
    importcpp: "EnhanceContrastOn", header: "vtkLineIntegralConvolution2D.h".}
proc EnhanceContrastOff*(this: var vtkLineIntegralConvolution2D) {.
    importcpp: "EnhanceContrastOff", header: "vtkLineIntegralConvolution2D.h".}
  ## /@}
  ## /@{
  ## *
  ##  This feature is used to fine tune the contrast enhancement. Values are provided
  ##  indicating the fraction of the range to adjust m and M by during contrast enahncement
  ##  histogram stretching.  M and m are the intensity/lightness values that map to 1 and 0.
  ##  (see EnhanceContrast for an explanation of the mapping procedure). m and M are computed
  ##  using the factors as follows:
  ##
  ##  m = min(C) - mFactor * (max(C) - min(C))
  ##  M = max(C) - MFactor * (max(C) - min(C))
  ##
  ##  the default values for mFactor and MFactor are 0 which result in
  ##  m = min(C), M = max(C), where C is all of the colors in the image. Adjusting
  ##  mFactor and MFactor above zero provide a means to control the saturation of
  ##  normalization. These settings only affect the final normalization, the
  ##  normalization that occurs on the input to the high-pass filter always uses
  ##  the min and max.
  ##
proc SetEnhancedLICEnhanceContrastLowContrastEnhancementFactor*(
    this: var vtkLineIntegralConvolution2D; _arg: cdouble) {.
    importcpp: "SetEnhancedLICEnhanceContrastLowContrastEnhancementFactor",
    header: "vtkLineIntegralConvolution2D.h".}
proc GetEnhancedLICMinValueEnhanceContrastMinValueLowContrastEnhancementFactorMinValue*(
    this: var vtkLineIntegralConvolution2D): cdouble {.importcpp: "GetEnhancedLICMinValueEnhanceContrastMinValueLowContrastEnhancementFactorMinValue",
    header: "vtkLineIntegralConvolution2D.h".}
proc GetEnhancedLICMaxValueEnhanceContrastMaxValueLowContrastEnhancementFactorMaxValue*(
    this: var vtkLineIntegralConvolution2D): cdouble {.importcpp: "GetEnhancedLICMaxValueEnhanceContrastMaxValueLowContrastEnhancementFactorMaxValue",
    header: "vtkLineIntegralConvolution2D.h".}
## !!!Ignored construct:  virtual double GetEnhancedLICEnhanceContrastLowContrastEnhancementFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LowContrastEnhancementFactor  of  << this -> LowContrastEnhancementFactor ) ; return this -> LowContrastEnhancementFactor ; } ;
## Error: expected ';'!!!

proc SetEnhancedLICEnhanceContrastLowContrastEnhancementFactorHighContrastEnhancementFactor*(
    this: var vtkLineIntegralConvolution2D; _arg: cdouble) {.importcpp: "SetEnhancedLICEnhanceContrastLowContrastEnhancementFactorHighContrastEnhancementFactor",
    header: "vtkLineIntegralConvolution2D.h".}
proc GetEnhancedLICMinValueEnhanceContrastMinValueLowContrastEnhancementFactorMinValueHighContrastEnhancementFactorMinValue*(
    this: var vtkLineIntegralConvolution2D): cdouble {.importcpp: "GetEnhancedLICMinValueEnhanceContrastMinValueLowContrastEnhancementFactorMinValueHighContrastEnhancementFactorMinValue",
    header: "vtkLineIntegralConvolution2D.h".}
proc GetEnhancedLICMaxValueEnhanceContrastMaxValueLowContrastEnhancementFactorMaxValueHighContrastEnhancementFactorMaxValue*(
    this: var vtkLineIntegralConvolution2D): cdouble {.importcpp: "GetEnhancedLICMaxValueEnhanceContrastMaxValueLowContrastEnhancementFactorMaxValueHighContrastEnhancementFactorMaxValue",
    header: "vtkLineIntegralConvolution2D.h".}
## !!!Ignored construct:  virtual double GetEnhancedLICEnhanceContrastLowContrastEnhancementFactorHighContrastEnhancementFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HighContrastEnhancementFactor  of  << this -> HighContrastEnhancementFactor ) ; return this -> HighContrastEnhancementFactor ; } ;
## Error: expected ';'!!!

proc SetEnhancedLICEnhanceContrastLowContrastEnhancementFactorHighContrastEnhancementFactorAntiAlias*(
    this: var vtkLineIntegralConvolution2D; _arg: cint) {.importcpp: "SetEnhancedLICEnhanceContrastLowContrastEnhancementFactorHighContrastEnhancementFactorAntiAlias",
    header: "vtkLineIntegralConvolution2D.h".}
proc GetEnhancedLICMinValueEnhanceContrastMinValueLowContrastEnhancementFactorMinValueHighContrastEnhancementFactorMinValueAntiAliasMinValue*(
    this: var vtkLineIntegralConvolution2D): cint {.importcpp: "GetEnhancedLICMinValueEnhanceContrastMinValueLowContrastEnhancementFactorMinValueHighContrastEnhancementFactorMinValueAntiAliasMinValue",
    header: "vtkLineIntegralConvolution2D.h".}
proc GetEnhancedLICMaxValueEnhanceContrastMaxValueLowContrastEnhancementFactorMaxValueHighContrastEnhancementFactorMaxValueAntiAliasMaxValue*(
    this: var vtkLineIntegralConvolution2D): cint {.importcpp: "GetEnhancedLICMaxValueEnhanceContrastMaxValueLowContrastEnhancementFactorMaxValueHighContrastEnhancementFactorMaxValueAntiAliasMaxValue",
    header: "vtkLineIntegralConvolution2D.h".}
## !!!Ignored construct:  virtual int GetEnhancedLICEnhanceContrastLowContrastEnhancementFactorHighContrastEnhancementFactorAntiAlias ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AntiAlias  of  << this -> AntiAlias ) ; return this -> AntiAlias ; } ;
## Error: expected ';'!!!

proc AntiAliasOn*(this: var vtkLineIntegralConvolution2D) {.
    importcpp: "AntiAliasOn", header: "vtkLineIntegralConvolution2D.h".}
proc AntiAliasOff*(this: var vtkLineIntegralConvolution2D) {.
    importcpp: "AntiAliasOff", header: "vtkLineIntegralConvolution2D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Number of streamline integration steps (initial value is 1).
  ##  In term of visual quality, the greater (within some range) the better.
  ##
proc SetEnhancedLICEnhanceContrastLowContrastEnhancementFactorHighContrastEnhancementFactorAntiAliasNumberOfSteps*(
    this: var vtkLineIntegralConvolution2D; _arg: cint) {.importcpp: "SetEnhancedLICEnhanceContrastLowContrastEnhancementFactorHighContrastEnhancementFactorAntiAliasNumberOfSteps",
    header: "vtkLineIntegralConvolution2D.h".}
proc GetEnhancedLICMinValueEnhanceContrastMinValueLowContrastEnhancementFactorMinValueHighContrastEnhancementFactorMinValueAntiAliasMinValueNumberOfStepsMinValue*(
    this: var vtkLineIntegralConvolution2D): cint {.importcpp: "GetEnhancedLICMinValueEnhanceContrastMinValueLowContrastEnhancementFactorMinValueHighContrastEnhancementFactorMinValueAntiAliasMinValueNumberOfStepsMinValue",
    header: "vtkLineIntegralConvolution2D.h".}
proc GetEnhancedLICMaxValueEnhanceContrastMaxValueLowContrastEnhancementFactorMaxValueHighContrastEnhancementFactorMaxValueAntiAliasMaxValueNumberOfStepsMaxValue*(
    this: var vtkLineIntegralConvolution2D): cint {.importcpp: "GetEnhancedLICMaxValueEnhanceContrastMaxValueLowContrastEnhancementFactorMaxValueHighContrastEnhancementFactorMaxValueAntiAliasMaxValueNumberOfStepsMaxValue",
    header: "vtkLineIntegralConvolution2D.h".}
## !!!Ignored construct:  virtual int GetEnhancedLICEnhanceContrastLowContrastEnhancementFactorHighContrastEnhancementFactorAntiAliasNumberOfSteps ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfSteps  of  << this -> NumberOfSteps ) ; return this -> NumberOfSteps ; } ;
## Error: expected ';'!!!

proc SetEnhancedLICEnhanceContrastLowContrastEnhancementFactorHighContrastEnhancementFactorAntiAliasNumberOfStepsStepSize*(
    this: var vtkLineIntegralConvolution2D; _arg: cdouble) {.importcpp: "SetEnhancedLICEnhanceContrastLowContrastEnhancementFactorHighContrastEnhancementFactorAntiAliasNumberOfStepsStepSize",
    header: "vtkLineIntegralConvolution2D.h".}
proc GetEnhancedLICMinValueEnhanceContrastMinValueLowContrastEnhancementFactorMinValueHighContrastEnhancementFactorMinValueAntiAliasMinValueNumberOfStepsMinValueStepSizeMinValue*(
    this: var vtkLineIntegralConvolution2D): cdouble {.importcpp: "GetEnhancedLICMinValueEnhanceContrastMinValueLowContrastEnhancementFactorMinValueHighContrastEnhancementFactorMinValueAntiAliasMinValueNumberOfStepsMinValueStepSizeMinValue",
    header: "vtkLineIntegralConvolution2D.h".}
proc GetEnhancedLICMaxValueEnhanceContrastMaxValueLowContrastEnhancementFactorMaxValueHighContrastEnhancementFactorMaxValueAntiAliasMaxValueNumberOfStepsMaxValueStepSizeMaxValue*(
    this: var vtkLineIntegralConvolution2D): cdouble {.importcpp: "GetEnhancedLICMaxValueEnhanceContrastMaxValueLowContrastEnhancementFactorMaxValueHighContrastEnhancementFactorMaxValueAntiAliasMaxValueNumberOfStepsMaxValueStepSizeMaxValue",
    header: "vtkLineIntegralConvolution2D.h".}
## !!!Ignored construct:  virtual double GetEnhancedLICEnhanceContrastLowContrastEnhancementFactorHighContrastEnhancementFactorAntiAliasNumberOfStepsStepSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << StepSize  of  << this -> StepSize ) ; return this -> StepSize ; } ;
## Error: expected ';'!!!

proc SetComponentIds*(this: var vtkLineIntegralConvolution2D; c0: cint; c1: cint) {.
    importcpp: "SetComponentIds", header: "vtkLineIntegralConvolution2D.h".}
proc SetComponentIds*(this: var vtkLineIntegralConvolution2D; c: array[2, cint]) {.
    importcpp: "SetComponentIds", header: "vtkLineIntegralConvolution2D.h".}
## !!!Ignored construct:  virtual int * GetComponentIds ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ComponentIds  pointer  << this -> ComponentIds ) ; return this -> ComponentIds ; } VTK_WRAPEXCLUDE virtual void GetComponentIds ( int & _arg1 , int & _arg2 ) { _arg1 = this -> ComponentIds [ 0 ] ; _arg2 = this -> ComponentIds [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << ComponentIds  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetComponentIds ( int _arg [ 2 ] ) { this -> GetComponentIds ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetEnhancedLICEnhanceContrastLowContrastEnhancementFactorHighContrastEnhancementFactorAntiAliasNumberOfStepsStepSizeMaxNoiseValue*(
    this: var vtkLineIntegralConvolution2D; _arg: cdouble) {.importcpp: "SetEnhancedLICEnhanceContrastLowContrastEnhancementFactorHighContrastEnhancementFactorAntiAliasNumberOfStepsStepSizeMaxNoiseValue",
    header: "vtkLineIntegralConvolution2D.h".}
proc GetEnhancedLICMinValueEnhanceContrastMinValueLowContrastEnhancementFactorMinValueHighContrastEnhancementFactorMinValueAntiAliasMinValueNumberOfStepsMinValueStepSizeMinValueMaxNoiseValueMinValue*(
    this: var vtkLineIntegralConvolution2D): cdouble {.importcpp: "GetEnhancedLICMinValueEnhanceContrastMinValueLowContrastEnhancementFactorMinValueHighContrastEnhancementFactorMinValueAntiAliasMinValueNumberOfStepsMinValueStepSizeMinValueMaxNoiseValueMinValue",
    header: "vtkLineIntegralConvolution2D.h".}
proc GetEnhancedLICMaxValueEnhanceContrastMaxValueLowContrastEnhancementFactorMaxValueHighContrastEnhancementFactorMaxValueAntiAliasMaxValueNumberOfStepsMaxValueStepSizeMaxValueMaxNoiseValueMaxValue*(
    this: var vtkLineIntegralConvolution2D): cdouble {.importcpp: "GetEnhancedLICMaxValueEnhanceContrastMaxValueLowContrastEnhancementFactorMaxValueHighContrastEnhancementFactorMaxValueAntiAliasMaxValueNumberOfStepsMaxValueStepSizeMaxValueMaxNoiseValueMaxValue",
    header: "vtkLineIntegralConvolution2D.h".}
## !!!Ignored construct:  virtual double GetEnhancedLICEnhanceContrastLowContrastEnhancementFactorHighContrastEnhancementFactorAntiAliasNumberOfStepsStepSizeMaxNoiseValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaxNoiseValue  of  << this -> MaxNoiseValue ) ; return this -> MaxNoiseValue ; } ;
## Error: expected ';'!!!

proc SetTransformVectors*(this: var vtkLineIntegralConvolution2D; val: cint) {.
    importcpp: "SetTransformVectors", header: "vtkLineIntegralConvolution2D.h".}
## !!!Ignored construct:  virtual int GetEnhancedLICEnhanceContrastLowContrastEnhancementFactorHighContrastEnhancementFactorAntiAliasNumberOfStepsStepSizeMaxNoiseValueTransformVectors ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TransformVectors  of  << this -> TransformVectors ) ; return this -> TransformVectors ; } ;
## Error: expected ';'!!!

proc SetNormalizeVectors*(this: var vtkLineIntegralConvolution2D; val: cint) {.
    importcpp: "SetNormalizeVectors", header: "vtkLineIntegralConvolution2D.h".}
## !!!Ignored construct:  virtual int GetEnhancedLICEnhanceContrastLowContrastEnhancementFactorHighContrastEnhancementFactorAntiAliasNumberOfStepsStepSizeMaxNoiseValueTransformVectorsNormalizeVectors ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NormalizeVectors  of  << this -> NormalizeVectors ) ; return this -> NormalizeVectors ; } ;
## Error: expected ';'!!!

proc SetEnhancedLICEnhanceContrastLowContrastEnhancementFactorHighContrastEnhancementFactorAntiAliasNumberOfStepsStepSizeMaxNoiseValueMaskThreshold*(
    this: var vtkLineIntegralConvolution2D; _arg: cdouble) {.importcpp: "SetEnhancedLICEnhanceContrastLowContrastEnhancementFactorHighContrastEnhancementFactorAntiAliasNumberOfStepsStepSizeMaxNoiseValueMaskThreshold",
    header: "vtkLineIntegralConvolution2D.h".}
proc GetEnhancedLICMinValueEnhanceContrastMinValueLowContrastEnhancementFactorMinValueHighContrastEnhancementFactorMinValueAntiAliasMinValueNumberOfStepsMinValueStepSizeMinValueMaxNoiseValueMinValueMaskThresholdMinValue*(
    this: var vtkLineIntegralConvolution2D): cdouble {.importcpp: "GetEnhancedLICMinValueEnhanceContrastMinValueLowContrastEnhancementFactorMinValueHighContrastEnhancementFactorMinValueAntiAliasMinValueNumberOfStepsMinValueStepSizeMinValueMaxNoiseValueMinValueMaskThresholdMinValue",
    header: "vtkLineIntegralConvolution2D.h".}
proc GetEnhancedLICMaxValueEnhanceContrastMaxValueLowContrastEnhancementFactorMaxValueHighContrastEnhancementFactorMaxValueAntiAliasMaxValueNumberOfStepsMaxValueStepSizeMaxValueMaxNoiseValueMaxValueMaskThresholdMaxValue*(
    this: var vtkLineIntegralConvolution2D): cdouble {.importcpp: "GetEnhancedLICMaxValueEnhanceContrastMaxValueLowContrastEnhancementFactorMaxValueHighContrastEnhancementFactorMaxValueAntiAliasMaxValueNumberOfStepsMaxValueStepSizeMaxValueMaxNoiseValueMaxValueMaskThresholdMaxValue",
    header: "vtkLineIntegralConvolution2D.h".}
## !!!Ignored construct:  virtual double GetEnhancedLICEnhanceContrastLowContrastEnhancementFactorHighContrastEnhancementFactorAntiAliasNumberOfStepsStepSizeMaxNoiseValueTransformVectorsNormalizeVectorsMaskThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaskThreshold  of  << this -> MaskThreshold ) ; return this -> MaskThreshold ; } ;
## Error: expected ';'!!!

proc Execute*(this: var vtkLineIntegralConvolution2D;
             vectorTex: ptr vtkTextureObject; noiseTex: ptr vtkTextureObject): ptr vtkTextureObject {.
    importcpp: "Execute", header: "vtkLineIntegralConvolution2D.h".}
proc Execute*(this: var vtkLineIntegralConvolution2D; extent: array[4, cint];
             vectorTex: ptr vtkTextureObject; noiseTex: ptr vtkTextureObject): ptr vtkTextureObject {.
    importcpp: "Execute", header: "vtkLineIntegralConvolution2D.h".}
proc Execute*(this: var vtkLineIntegralConvolution2D;
             inputTexExtent: vtkPixelExtent; vectorExtent: deque[vtkPixelExtent];
             licExtent: deque[vtkPixelExtent]; vectorTex: ptr vtkTextureObject;
             maskVectorTex: ptr vtkTextureObject; noiseTex: ptr vtkTextureObject): ptr vtkTextureObject {.
    importcpp: "Execute", header: "vtkLineIntegralConvolution2D.h".}
proc SetVectorTexParameters*(vectors: ptr vtkTextureObject) {.
    importcpp: "vtkLineIntegralConvolution2D::SetVectorTexParameters(@)",
    header: "vtkLineIntegralConvolution2D.h".}
proc SetNoiseTexParameters*(noise: ptr vtkTextureObject) {.
    importcpp: "vtkLineIntegralConvolution2D::SetNoiseTexParameters(@)",
    header: "vtkLineIntegralConvolution2D.h".}
proc SetCommunicator*(this: var vtkLineIntegralConvolution2D;
                     a2: ptr vtkPainterCommunicator) {.
    importcpp: "SetCommunicator", header: "vtkLineIntegralConvolution2D.h".}
proc GetCommunicator*(this: var vtkLineIntegralConvolution2D): ptr vtkPainterCommunicator {.
    importcpp: "GetCommunicator", header: "vtkLineIntegralConvolution2D.h".}
proc GetGlobalMinMax*(this: var vtkLineIntegralConvolution2D;
                     a2: ptr vtkPainterCommunicator; a3: var cfloat; a4: var cfloat) {.
    importcpp: "GetGlobalMinMax", header: "vtkLineIntegralConvolution2D.h".}
proc WriteTimerLog*(this: var vtkLineIntegralConvolution2D; a2: cstring) {.
    importcpp: "WriteTimerLog", header: "vtkLineIntegralConvolution2D.h".}