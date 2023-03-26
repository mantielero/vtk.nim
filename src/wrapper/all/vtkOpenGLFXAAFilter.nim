## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOpenGLFXAAFilter.h
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
##  @class   vtkOpenGLFXAAFilter
##  @brief   Perform FXAA antialiasing on the current
##  framebuffer.
##
##
##  Call Execute() to run a FXAA antialiasing pass on the current OpenGL
##  framebuffer. See method documentation for tunable parameters.
##
##  Based on the following implementation and description:
##
##  Whitepaper:
##  http://developer.download.nvidia.com/assets/gamedev/files/sdk/11/FXAA_WhitePaper.pdf
##
##  Sample implementation:
##  https://github.com/NVIDIAGameWorks/GraphicsSamples/blob/master/samples/es3-kepler/FXAA/FXAA3_11.h
##
##  TODO there are currently some "banding" artifacts on some edges, particularly
##  single pixel lines. These seem to be caused by using a linear RGB input,
##  rather than a gamma-correct sRGB input. Future work should combine this pass
##  with a gamma correction pass to correct this. Bonus points for precomputing
##  luminosity into the sRGB's alpha channel to save cycles in the FXAA shader!
##

## !!!Ignored construct:  # vtkOpenGLFXAAFilter_h [NewLine] # vtkOpenGLFXAAFilter_h [NewLine] # vtkFXAAOptions.h  For DebugOptions enum # vtkObject.h [NewLine] # vtkRenderingOpenGL2Module.h  For export macro [NewLine] # < string >  For std::string [NewLine] class vtkFXAAOptions ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkOpenGLRenderer"
discard "forward decl of vtkOpenGLRenderTimer"
discard "forward decl of vtkShaderProgram"
discard "forward decl of vtkTextureObject"
discard "forward decl of vtkOpenGLQuadHelper"
## !!!Ignored construct:  class VTKRENDERINGOPENGL2_EXPORT vtkOpenGLFXAAFilter : public vtkObject { public : static vtkOpenGLFXAAFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkOpenGLFXAAFilter :: IsTypeOf ( type ) ; } static vtkOpenGLFXAAFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkOpenGLFXAAFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkOpenGLFXAAFilter * NewInstance ( ) const { return vtkOpenGLFXAAFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOpenGLFXAAFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOpenGLFXAAFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Perform FXAA on the current render buffer in @a ren.
##  void Execute ( vtkOpenGLRenderer * ren ) ; *
##  Release all OpenGL state.
##  void ReleaseGraphicsResources ( ) ; *
##  Copy the configuration values from @a opts into this filter. Note that
##  this copies the configuration values from opts -- it does not save the
##  @a opts pointer.
##  void UpdateConfiguration ( vtkFXAAOptions * opts ) ; /@{ *
##  Parameter for tuning the FXAA implementation. See vtkFXAAOptions for
##  details and suggested values.
##  virtual void SetRelativeContrastThreshold ( float _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << RelativeContrastThreshold  to  << _arg ) ; if ( this -> RelativeContrastThreshold != ( _arg < 0.f ? 0.f : ( _arg > 1.f ? 1.f : _arg ) ) ) { this -> RelativeContrastThreshold = ( _arg < 0.f ? 0.f : ( _arg > 1.f ? 1.f : _arg ) ) ; this -> Modified ( ) ; } } virtual float GetRelativeContrastThresholdMinValue ( ) { return 0.f ; } virtual float GetRelativeContrastThresholdMaxValue ( ) { return 1.f ; } ; virtual float GetRelativeContrastThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RelativeContrastThreshold  of  << this -> RelativeContrastThreshold ) ; return this -> RelativeContrastThreshold ; } ; virtual void SetRelativeContrastThresholdHardContrastThreshold ( float _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << HardContrastThreshold  to  << _arg ) ; if ( this -> HardContrastThreshold != ( _arg < 0.f ? 0.f : ( _arg > 1.f ? 1.f : _arg ) ) ) { this -> HardContrastThreshold = ( _arg < 0.f ? 0.f : ( _arg > 1.f ? 1.f : _arg ) ) ; this -> Modified ( ) ; } } virtual float GetRelativeContrastThresholdMinValueHardContrastThresholdMinValue ( ) { return 0.f ; } virtual float GetRelativeContrastThresholdMaxValueHardContrastThresholdMaxValue ( ) { return 1.f ; } ; virtual float GetRelativeContrastThresholdHardContrastThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HardContrastThreshold  of  << this -> HardContrastThreshold ) ; return this -> HardContrastThreshold ; } ; virtual void SetRelativeContrastThresholdHardContrastThresholdSubpixelBlendLimit ( float _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << SubpixelBlendLimit  to  << _arg ) ; if ( this -> SubpixelBlendLimit != ( _arg < 0.f ? 0.f : ( _arg > 1.f ? 1.f : _arg ) ) ) { this -> SubpixelBlendLimit = ( _arg < 0.f ? 0.f : ( _arg > 1.f ? 1.f : _arg ) ) ; this -> Modified ( ) ; } } virtual float GetRelativeContrastThresholdMinValueHardContrastThresholdMinValueSubpixelBlendLimitMinValue ( ) { return 0.f ; } virtual float GetRelativeContrastThresholdMaxValueHardContrastThresholdMaxValueSubpixelBlendLimitMaxValue ( ) { return 1.f ; } ; virtual float GetRelativeContrastThresholdHardContrastThresholdSubpixelBlendLimit ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SubpixelBlendLimit  of  << this -> SubpixelBlendLimit ) ; return this -> SubpixelBlendLimit ; } ; virtual void SetRelativeContrastThresholdHardContrastThresholdSubpixelBlendLimitSubpixelContrastThreshold ( float _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << SubpixelContrastThreshold  to  << _arg ) ; if ( this -> SubpixelContrastThreshold != ( _arg < 0.f ? 0.f : ( _arg > 1.f ? 1.f : _arg ) ) ) { this -> SubpixelContrastThreshold = ( _arg < 0.f ? 0.f : ( _arg > 1.f ? 1.f : _arg ) ) ; this -> Modified ( ) ; } } virtual float GetRelativeContrastThresholdMinValueHardContrastThresholdMinValueSubpixelBlendLimitMinValueSubpixelContrastThresholdMinValue ( ) { return 0.f ; } virtual float GetRelativeContrastThresholdMaxValueHardContrastThresholdMaxValueSubpixelBlendLimitMaxValueSubpixelContrastThresholdMaxValue ( ) { return 1.f ; } ; virtual float GetRelativeContrastThresholdHardContrastThresholdSubpixelBlendLimitSubpixelContrastThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SubpixelContrastThreshold  of  << this -> SubpixelContrastThreshold ) ; return this -> SubpixelContrastThreshold ; } ; virtual void SetUseHighQualityEndpoints ( bool val ) ; virtual bool GetRelativeContrastThresholdHardContrastThresholdSubpixelBlendLimitSubpixelContrastThresholdUseHighQualityEndpoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseHighQualityEndpoints  of  << this -> UseHighQualityEndpoints ) ; return this -> UseHighQualityEndpoints ; } ; virtual void UseHighQualityEndpointsOn ( ) { this -> SetUseHighQualityEndpoints ( static_cast < bool > ( 1 ) ) ; } virtual void UseHighQualityEndpointsOff ( ) { this -> SetUseHighQualityEndpoints ( static_cast < bool > ( 0 ) ) ; } ; virtual void SetRelativeContrastThresholdHardContrastThresholdSubpixelBlendLimitSubpixelContrastThresholdEndpointSearchIterations ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << EndpointSearchIterations  to  << _arg ) ; if ( this -> EndpointSearchIterations != ( _arg < 0 ? 0 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> EndpointSearchIterations = ( _arg < 0 ? 0 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetRelativeContrastThresholdMinValueHardContrastThresholdMinValueSubpixelBlendLimitMinValueSubpixelContrastThresholdMinValueEndpointSearchIterationsMinValue ( ) { return 0 ; } virtual int GetRelativeContrastThresholdMaxValueHardContrastThresholdMaxValueSubpixelBlendLimitMaxValueSubpixelContrastThresholdMaxValueEndpointSearchIterationsMaxValue ( ) { return VTK_INT_MAX ; } ; virtual int GetRelativeContrastThresholdHardContrastThresholdSubpixelBlendLimitSubpixelContrastThresholdUseHighQualityEndpointsEndpointSearchIterations ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EndpointSearchIterations  of  << this -> EndpointSearchIterations ) ; return this -> EndpointSearchIterations ; } ; virtual void SetDebugOptionValue ( vtkFXAAOptions :: DebugOption opt ) ; virtual vtkFXAAOptions :: DebugOption GetRelativeContrastThresholdHardContrastThresholdSubpixelBlendLimitSubpixelContrastThresholdUseHighQualityEndpointsEndpointSearchIterationsDebugOptionValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DebugOptionValue  of  << this -> DebugOptionValue ) ; return this -> DebugOptionValue ; } ; /@} protected : vtkOpenGLFXAAFilter ( ) ; ~ vtkOpenGLFXAAFilter ( ) override ; void Prepare ( ) ; void FreeGLObjects ( ) ; void CreateGLObjects ( ) ; void LoadInput ( ) ; void ApplyFilter ( ) ; void SubstituteFragmentShader ( std :: string & fragShader ) ; void Finalize ( ) ; void StartTimeQuery ( vtkOpenGLRenderTimer * timer ) ; void EndTimeQuery ( vtkOpenGLRenderTimer * timer ) ; void PrintBenchmark ( ) ;  Cache GL state that we modify bool BlendState ; bool DepthTestState ; int Viewport [ 4 ] ;  x, y, width, height  Used to measure execution time: vtkOpenGLRenderTimer * PreparationTimer ; vtkOpenGLRenderTimer * FXAATimer ;  Parameters: float RelativeContrastThreshold ; float HardContrastThreshold ; float SubpixelBlendLimit ; float SubpixelContrastThreshold ; int EndpointSearchIterations ; bool UseHighQualityEndpoints ; vtkFXAAOptions :: DebugOption DebugOptionValue ;  Set to true when the shader definitions change so we know when to rebuild. bool NeedToRebuildShader ; vtkOpenGLRenderer * Renderer ; vtkTextureObject * Input ; vtkOpenGLQuadHelper * QHelper ; private : vtkOpenGLFXAAFilter ( const vtkOpenGLFXAAFilter & ) = delete ; void operator = ( const vtkOpenGLFXAAFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
