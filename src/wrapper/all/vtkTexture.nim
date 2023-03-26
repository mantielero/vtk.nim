## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTexture.h
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
##  @class   vtkTexture
##  @brief   handles properties associated with a texture map
##
##  vtkTexture is an image algorithm that handles loading and binding of
##  texture maps. It obtains its data from an input image data dataset type.
##  Thus you can create visualization pipelines to read, process, and
##  construct textures. Note that textures will only work if texture
##  coordinates are also defined, and if the rendering system supports
##  texture.
##
##  Instances of vtkTexture are associated with actors via the actor's
##  SetTexture() method. Actors can share texture maps (this is encouraged
##  to save memory resources.)
##
##  @warning
##  Currently only 2D texture maps are supported, even though the data pipeline
##  supports 1,2, and 3D texture coordinates.
##
##  @warning
##  Some renderers such as old OpenGL require that the texture map dimensions
##  are a power of two in each direction. If a non-power of two texture map is
##  used, it is automatically resampled to a power of two in one or more
##  directions, at the cost of an expensive computation. If the OpenGL
##  implementation is recent enough (OpenGL>=2.0 or
##  extension GL_ARB_texture_non_power_of_two exists) there is no such
##  restriction and no extra computational cost.
##  @sa
##  vtkActor vtkRenderer vtkOpenGLTexture
##

import
  vtkImageAlgorithm, vtkRenderingCoreModule, vtkSystemIncludes

discard "forward decl of vtkImageData"
discard "forward decl of vtkScalarsToColors"
discard "forward decl of vtkRenderer"
discard "forward decl of vtkUnsignedCharArray"
discard "forward decl of vtkWindow"
discard "forward decl of vtkDataArray"
discard "forward decl of vtkTransform"
const
  VTK_TEXTURE_QUALITY_DEFAULT* = 0
  VTK_TEXTURE_QUALITY_16BIT* = 16
  VTK_TEXTURE_QUALITY_32BIT* = 32

type
  vtkTexture* {.importcpp: "vtkTexture", header: "vtkTexture.h", bycopy.} = object of vtkImageAlgorithm
    vtkTexture* {.importc: "vtkTexture".}: VTK_NEWINSTANCE
    ##  this is to duplicated the previous behavior of SelfCreatedLookUpTable
    ##  the result of HasTranslucentPolygonalGeometry is cached


proc New*(): ptr vtkTexture {.importcpp: "vtkTexture::New(@)", header: "vtkTexture.h".}
type
  vtkTextureSuperclass* = vtkImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkTexture::IsTypeOf(@)",
    header: "vtkTexture.h".}
proc IsA*(this: var vtkTexture; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkTexture.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTexture {.
    importcpp: "vtkTexture::SafeDownCast(@)", header: "vtkTexture.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTexture :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTexture :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTexture :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTexture; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTexture.h".}
proc Render*(this: var vtkTexture; ren: ptr vtkRenderer) {.importcpp: "Render",
    header: "vtkTexture.h".}
proc PostRender*(this: var vtkTexture; a2: ptr vtkRenderer) {.importcpp: "PostRender",
    header: "vtkTexture.h".}
proc ReleaseGraphicsResources*(this: var vtkTexture; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkTexture.h".}
proc Load*(this: var vtkTexture; a2: ptr vtkRenderer) {.importcpp: "Load",
    header: "vtkTexture.h".}
## !!!Ignored construct:  /@{ *
##  Turn on/off linear interpolation of the texture map when rendering.
##  virtual vtkTypeBool GetInterpolateInterpolate ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Interpolate  of  << this -> Interpolate ) ; return this -> Interpolate ; } ;
## Error: expected ';'!!!

proc SetInterpolate*(this: var vtkTexture; _arg: vtkTypeBool) {.
    importcpp: "SetInterpolate", header: "vtkTexture.h".}
proc InterpolateOn*(this: var vtkTexture) {.importcpp: "InterpolateOn",
                                        header: "vtkTexture.h".}
proc InterpolateOff*(this: var vtkTexture) {.importcpp: "InterpolateOff",
    header: "vtkTexture.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off use of mipmaps when rendering.
  ##
## !!!Ignored construct:  virtual bool GetInterpolateInterpolateMipmap ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Mipmap  of  << this -> Mipmap ) ; return this -> Mipmap ; } ;
## Error: expected ';'!!!

proc SetInterpolateMipmap*(this: var vtkTexture; _arg: bool) {.
    importcpp: "SetInterpolateMipmap", header: "vtkTexture.h".}
proc MipmapOn*(this: var vtkTexture) {.importcpp: "MipmapOn", header: "vtkTexture.h".}
proc MipmapOff*(this: var vtkTexture) {.importcpp: "MipmapOff", header: "vtkTexture.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the maximum anisotropic filtering to use. 1.0 means use no
  ##  anisotropic filtering. The default value is 4.0 and a high value would
  ##  be 16. This setting is only applied when mipmaps are used. This might
  ##  not be supported on all machines.
  ##
proc SetInterpolateMipmapMaximumAnisotropicFiltering*(this: var vtkTexture;
    _arg: cfloat) {.importcpp: "SetInterpolateMipmapMaximumAnisotropicFiltering",
                  header: "vtkTexture.h".}
## !!!Ignored construct:  virtual float GetInterpolateInterpolateMipmapMaximumAnisotropicFiltering ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumAnisotropicFiltering  of  << this -> MaximumAnisotropicFiltering ) ; return this -> MaximumAnisotropicFiltering ; } ;
## Error: expected ';'!!!

proc SetInterpolateMipmapMaximumAnisotropicFilteringQuality*(
    this: var vtkTexture; _arg: cint) {.importcpp: "SetInterpolateMipmapMaximumAnisotropicFilteringQuality",
                                   header: "vtkTexture.h".}
## !!!Ignored construct:  virtual int GetInterpolateInterpolateMipmapMaximumAnisotropicFilteringQuality ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Quality  of  << this -> Quality ) ; return this -> Quality ; } ;
## Error: expected ';'!!!

proc SetQualityToDefault*(this: var vtkTexture) {.importcpp: "SetQualityToDefault",
    header: "vtkTexture.h".}
proc SetQualityTo16Bit*(this: var vtkTexture) {.importcpp: "SetQualityTo16Bit",
    header: "vtkTexture.h".}
proc SetQualityTo32Bit*(this: var vtkTexture) {.importcpp: "SetQualityTo32Bit",
    header: "vtkTexture.h".}
proc SetInterpolateMipmapMaximumAnisotropicFilteringQualityColorMode*(
    this: var vtkTexture; _arg: cint) {.importcpp: "SetInterpolateMipmapMaximumAnisotropicFilteringQualityColorMode",
                                   header: "vtkTexture.h".}
## !!!Ignored construct:  virtual int GetInterpolateInterpolateMipmapMaximumAnisotropicFilteringQualityColorMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ColorMode  of  << this -> ColorMode ) ; return this -> ColorMode ; } ;
## Error: expected ';'!!!

proc SetColorModeToDefault*(this: var vtkTexture) {.
    importcpp: "SetColorModeToDefault", header: "vtkTexture.h".}
proc SetColorModeToMapScalars*(this: var vtkTexture) {.
    importcpp: "SetColorModeToMapScalars", header: "vtkTexture.h".}
proc SetColorModeToDirectScalars*(this: var vtkTexture) {.
    importcpp: "SetColorModeToDirectScalars", header: "vtkTexture.h".}
proc GetInput*(this: var vtkTexture): ptr vtkImageData {.importcpp: "GetInput",
    header: "vtkTexture.h".}
proc SetLookupTable*(this: var vtkTexture; a2: ptr vtkScalarsToColors) {.
    importcpp: "SetLookupTable", header: "vtkTexture.h".}
proc GetnameLookupTable*(this: var vtkTexture): ptr vtkScalarsToColors {.
    importcpp: "GetnameLookupTable", header: "vtkTexture.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get Mapped Scalars
  ##
proc GetnameLookupTableMappedScalars*(this: var vtkTexture): ptr vtkUnsignedCharArray {.
    importcpp: "GetnameLookupTableMappedScalars", header: "vtkTexture.h".}
  ## /@}
  ## *
  ##  Map scalar values into color scalars.
  ##
proc MapScalarsToColors*(this: var vtkTexture; scalars: ptr vtkDataArray): ptr cuchar {.
    importcpp: "MapScalarsToColors", header: "vtkTexture.h".}
proc SetTransform*(this: var vtkTexture; transform: ptr vtkTransform) {.
    importcpp: "SetTransform", header: "vtkTexture.h".}
proc GetnameLookupTableMappedScalarsTransform*(this: var vtkTexture): ptr vtkTransform {.
    importcpp: "GetnameLookupTableMappedScalarsTransform", header: "vtkTexture.h".}
  ## /@}
  ## *
  ##  Used to specify how the texture will blend its RGB and Alpha values
  ##  with other textures and the fragment the texture is rendered upon.
  ##
type
  vtkTextureVTKTextureBlendingMode* {.size: sizeof(cint), importcpp: "vtkTexture::VTKTextureBlendingMode",
                                     header: "vtkTexture.h".} = enum
    VTK_TEXTURE_BLENDING_MODE_NONE = 0, VTK_TEXTURE_BLENDING_MODE_REPLACE,
    VTK_TEXTURE_BLENDING_MODE_MODULATE, VTK_TEXTURE_BLENDING_MODE_ADD,
    VTK_TEXTURE_BLENDING_MODE_ADD_SIGNED, VTK_TEXTURE_BLENDING_MODE_INTERPOLATE,
    VTK_TEXTURE_BLENDING_MODE_SUBTRACT


## !!!Ignored construct:  /@{ *
##  Used to specify how the texture will blend its RGB and Alpha values
##  with other textures and the fragment the texture is rendered upon.
##  virtual int GetInterpolateInterpolateMipmapMaximumAnisotropicFilteringQualityColorModeBlendingModeBlendingMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BlendingMode  of  << this -> BlendingMode ) ; return this -> BlendingMode ; } ;
## Error: expected ';'!!!

proc SetInterpolateMipmapMaximumAnisotropicFilteringQualityColorModeBlendingMode*(
    this: var vtkTexture; _arg: cint) {.importcpp: "SetInterpolateMipmapMaximumAnisotropicFilteringQualityColorModeBlendingMode",
                                   header: "vtkTexture.h".}
  ## /@}
  ## /@{
  ## *
  ##  Whether the texture colors are premultiplied by alpha.
  ##  Initial value is false.
  ##
## !!!Ignored construct:  virtual bool GetInterpolateInterpolateMipmapMaximumAnisotropicFilteringQualityColorModeBlendingModeBlendingModePremultipliedAlpha ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PremultipliedAlpha  of  << this -> PremultipliedAlpha ) ; return this -> PremultipliedAlpha ; } ;
## Error: expected ';'!!!

proc SetInterpolateMipmapMaximumAnisotropicFilteringQualityColorModeBlendingModePremultipliedAlpha*(
    this: var vtkTexture; _arg: bool) {.importcpp: "SetInterpolateMipmapMaximumAnisotropicFilteringQualityColorModeBlendingModePremultipliedAlpha",
                                   header: "vtkTexture.h".}
proc PremultipliedAlphaOn*(this: var vtkTexture) {.
    importcpp: "PremultipliedAlphaOn", header: "vtkTexture.h".}
proc PremultipliedAlphaOff*(this: var vtkTexture) {.
    importcpp: "PremultipliedAlphaOff", header: "vtkTexture.h".}
  ## /@}
  ## /@{
  ## *
  ##  When the texture is forced to be a power of 2, the default behavior is
  ##  for the "new" image's dimensions to be greater than or equal to with
  ##  respects to the original.  Setting RestrictPowerOf2ImageSmaller to be
  ##  1 (or ON) with force the new image's dimensions to be less than or equal
  ##  to with respects to the original.
  ##
## !!!Ignored construct:  virtual vtkTypeBool GetInterpolateInterpolateMipmapMaximumAnisotropicFilteringQualityColorModeBlendingModeBlendingModePremultipliedAlphaRestrictPowerOf2ImageSmaller ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RestrictPowerOf2ImageSmaller  of  << this -> RestrictPowerOf2ImageSmaller ) ; return this -> RestrictPowerOf2ImageSmaller ; } ;
## Error: expected ';'!!!

proc SetInterpolateMipmapMaximumAnisotropicFilteringQualityColorModeBlendingModePremultipliedAlphaRestrictPowerOf2ImageSmaller*(
    this: var vtkTexture; _arg: vtkTypeBool) {.importcpp: "SetInterpolateMipmapMaximumAnisotropicFilteringQualityColorModeBlendingModePremultipliedAlphaRestrictPowerOf2ImageSmaller",
    header: "vtkTexture.h".}
proc RestrictPowerOf2ImageSmallerOn*(this: var vtkTexture) {.
    importcpp: "RestrictPowerOf2ImageSmallerOn", header: "vtkTexture.h".}
proc RestrictPowerOf2ImageSmallerOff*(this: var vtkTexture) {.
    importcpp: "RestrictPowerOf2ImageSmallerOff", header: "vtkTexture.h".}
  ## /@}
  ## *
  ##  Is this Texture Translucent?
  ##  returns false (0) if the texture is either fully opaque or has
  ##  only fully transparent pixels and fully opaque pixels and the
  ##  Interpolate flag is turn off.
  ##
proc IsTranslucent*(this: var vtkTexture): cint {.importcpp: "IsTranslucent",
    header: "vtkTexture.h".}
proc GetTextureUnit*(this: var vtkTexture): cint {.importcpp: "GetTextureUnit",
    header: "vtkTexture.h".}
## !!!Ignored construct:  /@{ *
##  Is this texture a cube map, if so it needs 6 inputs
##  one for each side of the cube. You must set this before
##  connecting the inputs. The inputs must all have the same
##  size, data type, and depth
##  virtual bool GetInterpolateInterpolateMipmapMaximumAnisotropicFilteringQualityColorModeBlendingModeBlendingModePremultipliedAlphaRestrictPowerOf2ImageSmallerCubeMapCubeMap ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CubeMap  of  << this -> CubeMap ) ; return this -> CubeMap ; } ;
## Error: expected ';'!!!

proc CubeMapOn*(this: var vtkTexture) {.importcpp: "CubeMapOn", header: "vtkTexture.h".}
proc CubeMapOff*(this: var vtkTexture) {.importcpp: "CubeMapOff",
                                     header: "vtkTexture.h".}
proc SetCubeMap*(this: var vtkTexture; val: bool) {.importcpp: "SetCubeMap",
    header: "vtkTexture.h".}
## !!!Ignored construct:  /@} /@{ *
##  Is this texture using the sRGB color space. If you are using a
##  sRGB framebuffer or window then you probably also want to be
##  using sRGB color textures for proper handling of gamma and
##  associated color mixing.
##  virtual bool GetInterpolateInterpolateMipmapMaximumAnisotropicFilteringQualityColorModeBlendingModeBlendingModePremultipliedAlphaRestrictPowerOf2ImageSmallerCubeMapCubeMapUseSRGBColorSpaceUseSRGBColorSpace ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseSRGBColorSpace  of  << this -> UseSRGBColorSpace ) ; return this -> UseSRGBColorSpace ; } ;
## Error: expected ';'!!!

proc SetInterpolateMipmapMaximumAnisotropicFilteringQualityColorModeBlendingModePremultipliedAlphaRestrictPowerOf2ImageSmallerUseSRGBColorSpace*(
    this: var vtkTexture; _arg: bool) {.importcpp: "SetInterpolateMipmapMaximumAnisotropicFilteringQualityColorModeBlendingModePremultipliedAlphaRestrictPowerOf2ImageSmallerUseSRGBColorSpace",
                                   header: "vtkTexture.h".}
proc UseSRGBColorSpaceOn*(this: var vtkTexture) {.importcpp: "UseSRGBColorSpaceOn",
    header: "vtkTexture.h".}
proc UseSRGBColorSpaceOff*(this: var vtkTexture) {.
    importcpp: "UseSRGBColorSpaceOff", header: "vtkTexture.h".}
  ## /@}
  ## /@{
  ## *
  ##  Border Color (RGBA). The values can be any valid float value,
  ##  if the gpu supports it. Initial value is (0.0f, 0.0f, 0.0f, 0.0f),
  ##  as in the OpenGL spec.
  ##
  ##  \note
  ##  This property is ignored for OpenGL ES <= 3.2
  ##
proc SetBorderColor*(this: var vtkTexture; _arg1: cfloat; _arg2: cfloat; _arg3: cfloat;
                    _arg4: cfloat) {.importcpp: "SetBorderColor",
                                   header: "vtkTexture.h".}
proc SetBorderColor*(this: var vtkTexture; _arg: array[4, cfloat]) {.
    importcpp: "SetBorderColor", header: "vtkTexture.h".}
## !!!Ignored construct:  virtual float * GetBorderColor ( ) VTK_SIZEHINT ( 4 ) { vtkDebugWithObjectMacro ( this , <<  returning  << BorderColor  pointer  << this -> BorderColor ) ; return this -> BorderColor ; } VTK_WRAPEXCLUDE virtual void GetBorderColor ( float & _arg1 , float & _arg2 , float & _arg3 , float & _arg4 ) { _arg1 = this -> BorderColor [ 0 ] ; _arg2 = this -> BorderColor [ 1 ] ; _arg3 = this -> BorderColor [ 2 ] ; _arg4 = this -> BorderColor [ 3 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << BorderColor  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetBorderColor ( float _arg [ 4 ] ) { this -> GetBorderColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] ) ; } ;
## Error: expected ';'!!!

const
  vtkTextureClampToEdge* = 0
  vtkTextureRepeat* = 1
  vtkTextureMirroredRepeat* = 2
  vtkTextureClampToBorder* = 3
  vtkTextureNumberOfWrapModes* = 4

## !!!Ignored construct:  /@{ *
##  Wrap mode for the texture coordinates
##  Valid values are:
##  - ClampToEdge
##  - Repeat
##  - MirroredRepeat
##  - ClampToBorder
##  Initial value is Repeat (as in OpenGL spec)
##
##  \note
##  ClampToBorder is not supported with OpenGL ES <= 3.2.
##  Wrap will default to ClampToEdge if it is set to ClampToBorder in this case.
##  virtual int GetInterpolateInterpolateMipmapMaximumAnisotropicFilteringQualityColorModeBlendingModeBlendingModePremultipliedAlphaRestrictPowerOf2ImageSmallerCubeMapCubeMapUseSRGBColorSpaceUseSRGBColorSpaceWrapWrap ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Wrap  of  << this -> Wrap ) ; return this -> Wrap ; } ;
## Error: expected ';'!!!

proc SetWrap*(this: var vtkTexture; _arg: cint) {.importcpp: "SetWrap",
    header: "vtkTexture.h".}
proc GetWrapMinValue*(this: var vtkTexture): cint {.importcpp: "GetWrapMinValue",
    header: "vtkTexture.h".}
proc GetWrapMaxValue*(this: var vtkTexture): cint {.importcpp: "GetWrapMaxValue",
    header: "vtkTexture.h".}
  ## /@}
  ## /@{
  ## *
  ##  Convenience functions to maintain backwards compatibility.
  ##  For new code, use the SetWrap API.
  ##
proc SetRepeat*(this: var vtkTexture; r: vtkTypeBool) {.importcpp: "SetRepeat",
    header: "vtkTexture.h".}
proc GetRepeat*(this: var vtkTexture): vtkTypeBool {.importcpp: "GetRepeat",
    header: "vtkTexture.h".}
proc RepeatOn*(this: var vtkTexture) {.importcpp: "RepeatOn", header: "vtkTexture.h".}
proc RepeatOff*(this: var vtkTexture) {.importcpp: "RepeatOff", header: "vtkTexture.h".}
proc SetEdgeClamp*(this: var vtkTexture; a2: vtkTypeBool) {.importcpp: "SetEdgeClamp",
    header: "vtkTexture.h".}
proc GetEdgeClamp*(this: var vtkTexture): vtkTypeBool {.importcpp: "GetEdgeClamp",
    header: "vtkTexture.h".}
proc EdgeClampOn*(this: var vtkTexture) {.importcpp: "EdgeClampOn",
                                      header: "vtkTexture.h".}
proc EdgeClampOff*(this: var vtkTexture) {.importcpp: "EdgeClampOff",
                                       header: "vtkTexture.h".}