## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTextureObject.h
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
##  @class   vtkTextureObject
##  @brief   abstracts an OpenGL texture object.
##
##  vtkTextureObject represents an OpenGL texture object. It provides API to
##  create textures using data already loaded into pixel buffer objects. It can
##  also be used to create textures without uploading any data.
##

import
  vtkObject, vtkRenderingOpenGL2Module, vtkWeakPointer

discard "forward decl of vtkOpenGLBufferObject"
discard "forward decl of vtkOpenGLHelper"
discard "forward decl of vtkOpenGLRenderWindow"
discard "forward decl of vtkOpenGLVertexArrayObject"
discard "forward decl of vtkPixelBufferObject"
discard "forward decl of vtkShaderProgram"
discard "forward decl of vtkWindow"
discard "forward decl of vtkGenericOpenGLResourceFreeCallback"
type
  vtkTextureObject* {.importcpp: "vtkTextureObject", header: "vtkTextureObject.h",
                     bycopy.} = object of vtkObject ##  DepthTextureCompareFunction values.
    vtkTextureObject* {.importc: "vtkTextureObject".}: VTK_NEWINSTANCE
    ## *
    ##  Creates a texture handle if not already created.
    ##
    ##  GLenum
    ##  GLenum
    ##  GLenum
    ##  GLenum
    ##  used for copying to framebuffer
    ##  for texturebuffers we hold on to the Buffer


const
  vtkTextureObjectLequal* = 0   ##  r=R<=Dt ? 1.0 : 0.0
  vtkTextureObjectGequal* = 1   ##  r=R>=Dt ? 1.0 : 0.0
  vtkTextureObjectLess* = 2     ##  r=R<D_t ? 1.0 : 0.0
  vtkTextureObjectGreater* = 3  ##  r=R>Dt ? 1.0 : 0.0
  vtkTextureObjectEqual* = 4    ##  r=R==Dt ? 1.0 : 0.0
  vtkTextureObjectNotEqual* = 5 ##  r=R!=Dt ? 1.0 : 0.0
  vtkTextureObjectAlwaysTrue* = 6 ##   r=1.0 // WARNING "Always" is macro defined in X11/X.h...
  vtkTextureObjectNever* = 7    ##  r=0.0
  vtkTextureObjectNumberOfDepthTextureCompareFunctions* = 8

when not defined(GL_ES_VERSION_3_0):
  const
    vtkTextureObjectClampToEdge* = 0
    vtkTextureObjectRepeat* = 1
    vtkTextureObjectMirroredRepeat* = 2
    vtkTextureObjectClampToBorder* = 3
    vtkTextureObjectNumberOfWrapModes* = 4
when not not defined(GL_ES_VERSION_3_0):
  const
    vtkTextureObjectClampToEdge* = 0
    vtkTextureObjectRepeat* = 1
    vtkTextureObjectMirroredRepeat* = 2
    vtkTextureObjectNumberOfWrapModes* = 3
const
  vtkTextureObjectNearest* = 0
  vtkTextureObjectLinear* = 1
  vtkTextureObjectNearestMipmapNearest* = 2
  vtkTextureObjectNearestMipmapLinear* = 3
  vtkTextureObjectLinearMipmapNearest* = 4
  vtkTextureObjectLinearMipmapLinear* = 5
  vtkTextureObjectNumberOfMinificationModes* = 6

const
  vtkTextureObjectNative* = 0   ##  will try to match with the depth buffer format.
  vtkTextureObjectFixed8* = 1
  vtkTextureObjectFixed16* = 2
  vtkTextureObjectFixed24* = 3
  vtkTextureObjectFixed32* = 4
  vtkTextureObjectFloat16* = 5
  vtkTextureObjectFloat32* = 6
  vtkTextureObjectNumberOfDepthFormats* = 7

proc New*(): ptr vtkTextureObject {.importcpp: "vtkTextureObject::New(@)",
                                header: "vtkTextureObject.h".}
type
  vtkTextureObjectSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTextureObject::IsTypeOf(@)", header: "vtkTextureObject.h".}
proc IsA*(this: var vtkTextureObject; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkTextureObject.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTextureObject {.
    importcpp: "vtkTextureObject::SafeDownCast(@)", header: "vtkTextureObject.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTextureObject :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTextureObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTextureObject :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTextureObject; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTextureObject.h".}
proc SetContext*(this: var vtkTextureObject; a2: ptr vtkOpenGLRenderWindow) {.
    importcpp: "SetContext", header: "vtkTextureObject.h".}
proc GetContext*(this: var vtkTextureObject): ptr vtkOpenGLRenderWindow {.
    importcpp: "GetContext", header: "vtkTextureObject.h".}
## !!!Ignored construct:  /@} /@{ *
##  Get the texture dimensions.
##  These are the properties of the OpenGL texture this instance represents.
##  virtual unsigned int GetWidthWidth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Width  of  << this -> Width ) ; return this -> Width ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual unsigned int GetWidthWidthHeight ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Height  of  << this -> Height ) ; return this -> Height ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual unsigned int GetWidthWidthHeightDepth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Depth  of  << this -> Depth ) ; return this -> Depth ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual unsigned int GetWidthWidthHeightDepthSamples ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Samples  of  << this -> Samples ) ; return this -> Samples ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual int GetWidthWidthHeightDepthSamplesComponents ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Components  of  << this -> Components ) ; return this -> Components ; } ;
## Error: expected ';'!!!

proc GetTuples*(this: var vtkTextureObject): cuint {.importcpp: "GetTuples",
    header: "vtkTextureObject.h".}
## !!!Ignored construct:  /@} virtual int GetWidthWidthHeightDepthSamplesComponentsNumberOfDimensionsNumberOfDimensions ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfDimensions  of  << this -> NumberOfDimensions ) ; return this -> NumberOfDimensions ; } ;
## Error: expected ';'!!!

proc SetSamples*(this: var vtkTextureObject; _arg: cuint) {.importcpp: "SetSamples",
    header: "vtkTextureObject.h".}
  ## /@{
  ## *
  ##  Returns OpenGL texture target to which the texture is/can be bound.
  ##
## !!!Ignored construct:  virtual unsigned int GetWidthWidthHeightDepthSamplesComponentsNumberOfDimensionsNumberOfDimensionsTarget ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Target  of  << this -> Target ) ; return this -> Target ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Returns the OpenGL handle.
##  virtual unsigned int GetWidthWidthHeightDepthSamplesComponentsNumberOfDimensionsNumberOfDimensionsTargetHandleHandle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Handle  of  << this -> Handle ) ; return this -> Handle ; } ;
## Error: expected ';'!!!

proc GetTextureUnit*(this: var vtkTextureObject): cint {.importcpp: "GetTextureUnit",
    header: "vtkTextureObject.h".}
proc Bind*(this: var vtkTextureObject) {.importcpp: "Bind",
                                     header: "vtkTextureObject.h".}
proc Activate*(this: var vtkTextureObject) {.importcpp: "Activate",
    header: "vtkTextureObject.h".}
proc Deactivate*(this: var vtkTextureObject) {.importcpp: "Deactivate",
    header: "vtkTextureObject.h".}
proc ReleaseGraphicsResources*(this: var vtkTextureObject; win: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkTextureObject.h".}
proc IsBound*(this: var vtkTextureObject): bool {.importcpp: "IsBound",
    header: "vtkTextureObject.h".}
proc SendParameters*(this: var vtkTextureObject) {.importcpp: "SendParameters",
    header: "vtkTextureObject.h".}
proc SetSamplesAutoParameters*(this: var vtkTextureObject; _arg: cint) {.
    importcpp: "SetSamplesAutoParameters", header: "vtkTextureObject.h".}
## !!!Ignored construct:  virtual int GetWidthWidthHeightDepthSamplesComponentsNumberOfDimensionsNumberOfDimensionsTargetHandleHandleAutoParameters ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AutoParameters  of  << this -> AutoParameters ) ; return this -> AutoParameters ; } ;
## Error: expected ';'!!!

proc AutoParametersOn*(this: var vtkTextureObject) {.importcpp: "AutoParametersOn",
    header: "vtkTextureObject.h".}
proc AutoParametersOff*(this: var vtkTextureObject) {.
    importcpp: "AutoParametersOff", header: "vtkTextureObject.h".}
  ## /@}
  ## *
  ##  Create a 2D texture from client memory
  ##  numComps must be in [1-4].
  ##
proc Create2DFromRaw*(this: var vtkTextureObject; width: cuint; height: cuint;
                     numComps: cint; dataType: cint; data: pointer): bool {.
    importcpp: "Create2DFromRaw", header: "vtkTextureObject.h".}
proc CreateDepthFromRaw*(this: var vtkTextureObject; width: cuint; height: cuint;
                        internalFormat: cint; rawType: cint; raw: pointer): bool {.
    importcpp: "CreateDepthFromRaw", header: "vtkTextureObject.h".}
proc CreateTextureBuffer*(this: var vtkTextureObject; numValues: cuint;
                         numComps: cint; dataType: cint;
                         bo: ptr vtkOpenGLBufferObject): bool {.
    importcpp: "CreateTextureBuffer", header: "vtkTextureObject.h".}
proc CreateCubeFromRaw*(this: var vtkTextureObject; width: cuint; height: cuint;
                       numComps: cint; dataType: cint; data: array[6, pointer]): bool {.
    importcpp: "CreateCubeFromRaw", header: "vtkTextureObject.h".}
proc Create1D*(this: var vtkTextureObject; numComps: cint;
              pbo: ptr vtkPixelBufferObject; shaderSupportsTextureInt: bool): bool {.
    importcpp: "Create1D", header: "vtkTextureObject.h".}
proc Create1DFromRaw*(this: var vtkTextureObject; width: cuint; numComps: cint;
                     dataType: cint; data: pointer): bool {.
    importcpp: "Create1DFromRaw", header: "vtkTextureObject.h".}
proc Create2D*(this: var vtkTextureObject; width: cuint; height: cuint; numComps: cint;
              pbo: ptr vtkPixelBufferObject; shaderSupportsTextureInt: bool): bool {.
    importcpp: "Create2D", header: "vtkTextureObject.h".}
proc Create3D*(this: var vtkTextureObject; width: cuint; height: cuint; depth: cuint;
              numComps: cint; pbo: ptr vtkPixelBufferObject;
              shaderSupportsTextureInt: bool): bool {.importcpp: "Create3D",
    header: "vtkTextureObject.h".}
proc Create3DFromRaw*(this: var vtkTextureObject; width: cuint; height: cuint;
                     depth: cuint; numComps: cint; dataType: cint; data: pointer): bool {.
    importcpp: "Create3DFromRaw", header: "vtkTextureObject.h".}
proc AllocateProxyTexture3D*(this: var vtkTextureObject; width: cuint; height: cuint;
                            depth: cuint; numComps: cint; dataType: cint): bool {.
    importcpp: "AllocateProxyTexture3D", header: "vtkTextureObject.h".}
proc Download*(this: var vtkTextureObject): ptr vtkPixelBufferObject {.
    importcpp: "Download", header: "vtkTextureObject.h".}
proc Download*(this: var vtkTextureObject; target: cuint; level: cuint): ptr vtkPixelBufferObject {.
    importcpp: "Download", header: "vtkTextureObject.h".}
proc CreateDepth*(this: var vtkTextureObject; width: cuint; height: cuint;
                 internalFormat: cint; pbo: ptr vtkPixelBufferObject): bool {.
    importcpp: "CreateDepth", header: "vtkTextureObject.h".}
proc AllocateDepth*(this: var vtkTextureObject; width: cuint; height: cuint;
                   internalFormat: cint): bool {.importcpp: "AllocateDepth",
    header: "vtkTextureObject.h".}
proc AllocateDepthStencil*(this: var vtkTextureObject; width: cuint; height: cuint): bool {.
    importcpp: "AllocateDepthStencil", header: "vtkTextureObject.h".}
proc Allocate1D*(this: var vtkTextureObject; width: cuint; numComps: cint; vtkType: cint): bool {.
    importcpp: "Allocate1D", header: "vtkTextureObject.h".}
proc Allocate2D*(this: var vtkTextureObject; width: cuint; height: cuint;
                numComps: cint; vtkType: cint; level: cint = 0): bool {.
    importcpp: "Allocate2D", header: "vtkTextureObject.h".}
proc Allocate3D*(this: var vtkTextureObject; width: cuint; height: cuint; depth: cuint;
                numComps: cint; vtkType: cint): bool {.importcpp: "Allocate3D",
    header: "vtkTextureObject.h".}
proc Create2D*(this: var vtkTextureObject; width: cuint; height: cuint; numComps: cint;
              vtktype: cint; a6: bool): bool {.importcpp: "Create2D",
    header: "vtkTextureObject.h".}
proc Create3D*(this: var vtkTextureObject; width: cuint; height: cuint; depth: cuint;
              numComps: cint; vtktype: cint; a7: bool): bool {.importcpp: "Create3D",
    header: "vtkTextureObject.h".}
proc GetVTKDataType*(this: var vtkTextureObject): cint {.importcpp: "GetVTKDataType",
    header: "vtkTextureObject.h".}
proc GetDataType*(this: var vtkTextureObject; vtk_scalar_type: cint): cint {.
    importcpp: "GetDataType", header: "vtkTextureObject.h".}
proc SetDataType*(this: var vtkTextureObject; glType: cuint) {.
    importcpp: "SetDataType", header: "vtkTextureObject.h".}
proc GetDefaultDataType*(this: var vtkTextureObject; vtk_scalar_type: cint): cint {.
    importcpp: "GetDefaultDataType", header: "vtkTextureObject.h".}
proc GetInternalFormat*(this: var vtkTextureObject; vtktype: cint; numComps: cint;
                       shaderSupportsTextureInt: bool): cuint {.
    importcpp: "GetInternalFormat", header: "vtkTextureObject.h".}
proc SetInternalFormat*(this: var vtkTextureObject; glInternalFormat: cuint) {.
    importcpp: "SetInternalFormat", header: "vtkTextureObject.h".}
proc GetDefaultInternalFormat*(this: var vtkTextureObject; vtktype: cint;
                              numComps: cint; shaderSupportsTextureInt: bool): cuint {.
    importcpp: "GetDefaultInternalFormat", header: "vtkTextureObject.h".}
proc GetFormat*(this: var vtkTextureObject; vtktype: cint; numComps: cint;
               shaderSupportsTextureInt: bool): cuint {.importcpp: "GetFormat",
    header: "vtkTextureObject.h".}
proc SetFormat*(this: var vtkTextureObject; glFormat: cuint) {.importcpp: "SetFormat",
    header: "vtkTextureObject.h".}
proc GetDefaultFormat*(this: var vtkTextureObject; vtktype: cint; numComps: cint;
                      shaderSupportsTextureInt: bool): cuint {.
    importcpp: "GetDefaultFormat", header: "vtkTextureObject.h".}
proc ResetFormatAndType*(this: var vtkTextureObject) {.
    importcpp: "ResetFormatAndType", header: "vtkTextureObject.h".}
proc GetMinificationFilterMode*(this: var vtkTextureObject; vtktype: cint): cuint {.
    importcpp: "GetMinificationFilterMode", header: "vtkTextureObject.h".}
proc GetMagnificationFilterMode*(this: var vtkTextureObject; vtktype: cint): cuint {.
    importcpp: "GetMagnificationFilterMode", header: "vtkTextureObject.h".}
proc GetWrapSMode*(this: var vtkTextureObject; vtktype: cint): cuint {.
    importcpp: "GetWrapSMode", header: "vtkTextureObject.h".}
proc GetWrapTMode*(this: var vtkTextureObject; vtktype: cint): cuint {.
    importcpp: "GetWrapTMode", header: "vtkTextureObject.h".}
proc GetWrapRMode*(this: var vtkTextureObject; vtktype: cint): cuint {.
    importcpp: "GetWrapRMode", header: "vtkTextureObject.h".}
proc SetSamplesAutoParametersRequireDepthBufferFloat*(this: var vtkTextureObject;
    _arg: bool) {.importcpp: "SetSamplesAutoParametersRequireDepthBufferFloat",
                header: "vtkTextureObject.h".}
## !!!Ignored construct:  virtual bool GetWidthWidthHeightDepthSamplesComponentsNumberOfDimensionsNumberOfDimensionsTargetHandleHandleAutoParametersRequireDepthBufferFloat ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RequireDepthBufferFloat  of  << this -> RequireDepthBufferFloat ) ; return this -> RequireDepthBufferFloat ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual bool GetWidthWidthHeightDepthSamplesComponentsNumberOfDimensionsNumberOfDimensionsTargetHandleHandleAutoParametersRequireDepthBufferFloatSupportsDepthBufferFloat ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SupportsDepthBufferFloat  of  << this -> SupportsDepthBufferFloat ) ; return this -> SupportsDepthBufferFloat ; } ;
## Error: expected ';'!!!

proc SetSamplesAutoParametersRequireDepthBufferFloatRequireTextureFloat*(
    this: var vtkTextureObject; _arg: bool) {.importcpp: "SetSamplesAutoParametersRequireDepthBufferFloatRequireTextureFloat",
    header: "vtkTextureObject.h".}
## !!!Ignored construct:  virtual bool GetWidthWidthHeightDepthSamplesComponentsNumberOfDimensionsNumberOfDimensionsTargetHandleHandleAutoParametersRequireDepthBufferFloatSupportsDepthBufferFloatRequireTextureFloat ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RequireTextureFloat  of  << this -> RequireTextureFloat ) ; return this -> RequireTextureFloat ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual bool GetWidthWidthHeightDepthSamplesComponentsNumberOfDimensionsNumberOfDimensionsTargetHandleHandleAutoParametersRequireDepthBufferFloatSupportsDepthBufferFloatRequireTextureFloatSupportsTextureFloat ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SupportsTextureFloat  of  << this -> SupportsTextureFloat ) ; return this -> SupportsTextureFloat ; } ;
## Error: expected ';'!!!

proc SetSamplesAutoParametersRequireDepthBufferFloatRequireTextureFloatRequireTextureInteger*(
    this: var vtkTextureObject; _arg: bool) {.importcpp: "SetSamplesAutoParametersRequireDepthBufferFloatRequireTextureFloatRequireTextureInteger",
    header: "vtkTextureObject.h".}
## !!!Ignored construct:  virtual bool GetWidthWidthHeightDepthSamplesComponentsNumberOfDimensionsNumberOfDimensionsTargetHandleHandleAutoParametersRequireDepthBufferFloatSupportsDepthBufferFloatRequireTextureFloatSupportsTextureFloatRequireTextureInteger ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RequireTextureInteger  of  << this -> RequireTextureInteger ) ; return this -> RequireTextureInteger ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual bool GetWidthWidthHeightDepthSamplesComponentsNumberOfDimensionsNumberOfDimensionsTargetHandleHandleAutoParametersRequireDepthBufferFloatSupportsDepthBufferFloatRequireTextureFloatSupportsTextureFloatRequireTextureIntegerSupportsTextureInteger ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SupportsTextureInteger  of  << this -> SupportsTextureInteger ) ; return this -> SupportsTextureInteger ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Wrap mode for the first texture coordinate "s"
##  Valid values are:
##  - Clamp
##  - ClampToEdge
##  - Repeat
##  - ClampToBorder
##  - MirroredRepeat
##  Initial value is Repeat (as in OpenGL spec)
##  virtual int GetWidthWidthHeightDepthSamplesComponentsNumberOfDimensionsNumberOfDimensionsTargetHandleHandleAutoParametersRequireDepthBufferFloatSupportsDepthBufferFloatRequireTextureFloatSupportsTextureFloatRequireTextureIntegerSupportsTextureIntegerWrapSWrapS ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WrapS  of  << this -> WrapS ) ; return this -> WrapS ; } ;
## Error: expected ';'!!!

proc SetSamplesAutoParametersRequireDepthBufferFloatRequireTextureFloatRequireTextureIntegerWrapS*(
    this: var vtkTextureObject; _arg: cint) {.importcpp: "SetSamplesAutoParametersRequireDepthBufferFloatRequireTextureFloatRequireTextureIntegerWrapS",
    header: "vtkTextureObject.h".}
  ## /@}
  ## /@{
  ## *
  ##  Wrap mode for the first texture coordinate "t"
  ##  Valid values are:
  ##  - Clamp
  ##  - ClampToEdge
  ##  - Repeat
  ##  - ClampToBorder
  ##  - MirroredRepeat
  ##  Initial value is Repeat (as in OpenGL spec)
  ##
## !!!Ignored construct:  virtual int GetWidthWidthHeightDepthSamplesComponentsNumberOfDimensionsNumberOfDimensionsTargetHandleHandleAutoParametersRequireDepthBufferFloatSupportsDepthBufferFloatRequireTextureFloatSupportsTextureFloatRequireTextureIntegerSupportsTextureIntegerWrapSWrapSWrapT ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WrapT  of  << this -> WrapT ) ; return this -> WrapT ; } ;
## Error: expected ';'!!!

proc SetSamplesAutoParametersRequireDepthBufferFloatRequireTextureFloatRequireTextureIntegerWrapSWrapT*(
    this: var vtkTextureObject; _arg: cint) {.importcpp: "SetSamplesAutoParametersRequireDepthBufferFloatRequireTextureFloatRequireTextureIntegerWrapSWrapT",
    header: "vtkTextureObject.h".}
  ## /@}
  ## /@{
  ## *
  ##  Wrap mode for the first texture coordinate "r"
  ##  Valid values are:
  ##  - Clamp
  ##  - ClampToEdge
  ##  - Repeat
  ##  - ClampToBorder
  ##  - MirroredRepeat
  ##  Initial value is Repeat (as in OpenGL spec)
  ##
## !!!Ignored construct:  virtual int GetWidthWidthHeightDepthSamplesComponentsNumberOfDimensionsNumberOfDimensionsTargetHandleHandleAutoParametersRequireDepthBufferFloatSupportsDepthBufferFloatRequireTextureFloatSupportsTextureFloatRequireTextureIntegerSupportsTextureIntegerWrapSWrapSWrapTWrapR ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WrapR  of  << this -> WrapR ) ; return this -> WrapR ; } ;
## Error: expected ';'!!!

proc SetSamplesAutoParametersRequireDepthBufferFloatRequireTextureFloatRequireTextureIntegerWrapSWrapTWrapR*(
    this: var vtkTextureObject; _arg: cint) {.importcpp: "SetSamplesAutoParametersRequireDepthBufferFloatRequireTextureFloatRequireTextureIntegerWrapSWrapTWrapR",
    header: "vtkTextureObject.h".}
  ## /@}
  ## /@{
  ## *
  ##  Minification filter mode.
  ##  Valid values are:
  ##  - Nearest
  ##  - Linear
  ##  - NearestMipmapNearest
  ##  - NearestMipmapLinear
  ##  - LinearMipmapNearest
  ##  - LinearMipmapLinear
  ##  Initial value is Nearest (note initial value in OpenGL spec
  ##  is NearestMipMapLinear but this is error-prone because it makes the
  ##  texture object incomplete. ).
  ##
## !!!Ignored construct:  virtual int GetWidthWidthHeightDepthSamplesComponentsNumberOfDimensionsNumberOfDimensionsTargetHandleHandleAutoParametersRequireDepthBufferFloatSupportsDepthBufferFloatRequireTextureFloatSupportsTextureFloatRequireTextureIntegerSupportsTextureIntegerWrapSWrapSWrapTWrapRMinificationFilter ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MinificationFilter  of  << this -> MinificationFilter ) ; return this -> MinificationFilter ; } ;
## Error: expected ';'!!!

proc SetSamplesAutoParametersRequireDepthBufferFloatRequireTextureFloatRequireTextureIntegerWrapSWrapTWrapRMinificationFilter*(
    this: var vtkTextureObject; _arg: cint) {.importcpp: "SetSamplesAutoParametersRequireDepthBufferFloatRequireTextureFloatRequireTextureIntegerWrapSWrapTWrapRMinificationFilter",
    header: "vtkTextureObject.h".}
  ## /@}
  ## /@{
  ## *
  ##  Magnification filter mode.
  ##  Valid values are:
  ##  - Nearest
  ##  - Linear
  ##  Initial value is Nearest
  ##
## !!!Ignored construct:  virtual int GetWidthWidthHeightDepthSamplesComponentsNumberOfDimensionsNumberOfDimensionsTargetHandleHandleAutoParametersRequireDepthBufferFloatSupportsDepthBufferFloatRequireTextureFloatSupportsTextureFloatRequireTextureIntegerSupportsTextureIntegerWrapSWrapSWrapTWrapRMinificationFilterMagnificationFilter ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MagnificationFilter  of  << this -> MagnificationFilter ) ; return this -> MagnificationFilter ; } ;
## Error: expected ';'!!!

proc SetSamplesAutoParametersRequireDepthBufferFloatRequireTextureFloatRequireTextureIntegerWrapSWrapTWrapRMinificationFilterMagnificationFilter*(
    this: var vtkTextureObject; _arg: cint) {.importcpp: "SetSamplesAutoParametersRequireDepthBufferFloatRequireTextureFloatRequireTextureIntegerWrapSWrapTWrapRMinificationFilterMagnificationFilter",
    header: "vtkTextureObject.h".}
  ## /@}
  ## *
  ##  Tells if the magnification mode is linear (true) or nearest (false).
  ##  Initial value is false (initial value in OpenGL spec is true).
  ##
proc SetLinearMagnification*(this: var vtkTextureObject; val: bool) {.
    importcpp: "SetLinearMagnification", header: "vtkTextureObject.h".}
proc GetLinearMagnification*(this: var vtkTextureObject): bool {.
    importcpp: "GetLinearMagnification", header: "vtkTextureObject.h".}
proc SetBorderColor*(this: var vtkTextureObject; _arg1: cfloat; _arg2: cfloat;
                    _arg3: cfloat; _arg4: cfloat) {.importcpp: "SetBorderColor",
    header: "vtkTextureObject.h".}
proc SetBorderColor*(this: var vtkTextureObject; _arg: array[4, cfloat]) {.
    importcpp: "SetBorderColor", header: "vtkTextureObject.h".}
## !!!Ignored construct:  virtual float * GetBorderColor ( ) VTK_SIZEHINT ( 4 ) { vtkDebugWithObjectMacro ( this , <<  returning  << BorderColor  pointer  << this -> BorderColor ) ; return this -> BorderColor ; } VTK_WRAPEXCLUDE virtual void GetBorderColor ( float & _arg1 , float & _arg2 , float & _arg3 , float & _arg4 ) { _arg1 = this -> BorderColor [ 0 ] ; _arg2 = this -> BorderColor [ 1 ] ; _arg3 = this -> BorderColor [ 2 ] ; _arg4 = this -> BorderColor [ 3 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << BorderColor  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetBorderColor ( float _arg [ 4 ] ) { this -> GetBorderColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] ) ; } ;
## Error: expected ';'!!!

proc SetSamplesAutoParametersRequireDepthBufferFloatRequireTextureFloatRequireTextureIntegerWrapSWrapTWrapRMinificationFilterMagnificationFilterMinLOD*(
    this: var vtkTextureObject; _arg: cfloat) {.importcpp: "SetSamplesAutoParametersRequireDepthBufferFloatRequireTextureFloatRequireTextureIntegerWrapSWrapTWrapRMinificationFilterMagnificationFilterMinLOD",
    header: "vtkTextureObject.h".}
## !!!Ignored construct:  virtual float GetWidthWidthHeightDepthSamplesComponentsNumberOfDimensionsNumberOfDimensionsTargetHandleHandleAutoParametersRequireDepthBufferFloatSupportsDepthBufferFloatRequireTextureFloatSupportsTextureFloatRequireTextureIntegerSupportsTextureIntegerWrapSWrapSWrapTWrapRMinificationFilterMagnificationFilterMinLOD ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MinLOD  of  << this -> MinLOD ) ; return this -> MinLOD ; } ;
## Error: expected ';'!!!

proc SetSamplesAutoParametersRequireDepthBufferFloatRequireTextureFloatRequireTextureIntegerWrapSWrapTWrapRMinificationFilterMagnificationFilterMinLODMaxLOD*(
    this: var vtkTextureObject; _arg: cfloat) {.importcpp: "SetSamplesAutoParametersRequireDepthBufferFloatRequireTextureFloatRequireTextureIntegerWrapSWrapTWrapRMinificationFilterMagnificationFilterMinLODMaxLOD",
    header: "vtkTextureObject.h".}
## !!!Ignored construct:  virtual float GetWidthWidthHeightDepthSamplesComponentsNumberOfDimensionsNumberOfDimensionsTargetHandleHandleAutoParametersRequireDepthBufferFloatSupportsDepthBufferFloatRequireTextureFloatSupportsTextureFloatRequireTextureIntegerSupportsTextureIntegerWrapSWrapSWrapTWrapRMinificationFilterMagnificationFilterMinLODMaxLOD ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaxLOD  of  << this -> MaxLOD ) ; return this -> MaxLOD ; } ;
## Error: expected ';'!!!

proc SetSamplesAutoParametersRequireDepthBufferFloatRequireTextureFloatRequireTextureIntegerWrapSWrapTWrapRMinificationFilterMagnificationFilterMinLODMaxLODBaseLevel*(
    this: var vtkTextureObject; _arg: cint) {.importcpp: "SetSamplesAutoParametersRequireDepthBufferFloatRequireTextureFloatRequireTextureIntegerWrapSWrapTWrapRMinificationFilterMagnificationFilterMinLODMaxLODBaseLevel",
    header: "vtkTextureObject.h".}
## !!!Ignored construct:  virtual int GetWidthWidthHeightDepthSamplesComponentsNumberOfDimensionsNumberOfDimensionsTargetHandleHandleAutoParametersRequireDepthBufferFloatSupportsDepthBufferFloatRequireTextureFloatSupportsTextureFloatRequireTextureIntegerSupportsTextureIntegerWrapSWrapSWrapTWrapRMinificationFilterMagnificationFilterMinLODMaxLODBaseLevel ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BaseLevel  of  << this -> BaseLevel ) ; return this -> BaseLevel ; } ;
## Error: expected ';'!!!

proc SetSamplesAutoParametersRequireDepthBufferFloatRequireTextureFloatRequireTextureIntegerWrapSWrapTWrapRMinificationFilterMagnificationFilterMinLODMaxLODBaseLevelMaxLevel*(
    this: var vtkTextureObject; _arg: cint) {.importcpp: "SetSamplesAutoParametersRequireDepthBufferFloatRequireTextureFloatRequireTextureIntegerWrapSWrapTWrapRMinificationFilterMagnificationFilterMinLODMaxLODBaseLevelMaxLevel",
    header: "vtkTextureObject.h".}
## !!!Ignored construct:  virtual int GetWidthWidthHeightDepthSamplesComponentsNumberOfDimensionsNumberOfDimensionsTargetHandleHandleAutoParametersRequireDepthBufferFloatSupportsDepthBufferFloatRequireTextureFloatSupportsTextureFloatRequireTextureIntegerSupportsTextureIntegerWrapSWrapSWrapTWrapRMinificationFilterMagnificationFilterMinLODMaxLODBaseLevelMaxLevel ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaxLevel  of  << this -> MaxLevel ) ; return this -> MaxLevel ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Tells if the output of a texture unit with a depth texture uses
##  comparison or not.
##  Comparison happens between D_t the depth texture value in the range [0,1]
##  and with R the interpolated third texture coordinate clamped to range
##  [0,1]. The result of the comparison is noted `r'. If this flag is false,
##  r=D_t.
##  Initial value is false, as in OpenGL spec.
##  Ignored if the texture object is not a depth texture.
##  virtual bool GetWidthWidthHeightDepthSamplesComponentsNumberOfDimensionsNumberOfDimensionsTargetHandleHandleAutoParametersRequireDepthBufferFloatSupportsDepthBufferFloatRequireTextureFloatSupportsTextureFloatRequireTextureIntegerSupportsTextureIntegerWrapSWrapSWrapTWrapRMinificationFilterMagnificationFilterMinLODMaxLODBaseLevelMaxLevelDepthTextureCompareDepthTextureCompare ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DepthTextureCompare  of  << this -> DepthTextureCompare ) ; return this -> DepthTextureCompare ; } ;
## Error: expected ';'!!!

proc SetSamplesAutoParametersRequireDepthBufferFloatRequireTextureFloatRequireTextureIntegerWrapSWrapTWrapRMinificationFilterMagnificationFilterMinLODMaxLODBaseLevelMaxLevelDepthTextureCompare*(
    this: var vtkTextureObject; _arg: bool) {.importcpp: "SetSamplesAutoParametersRequireDepthBufferFloatRequireTextureFloatRequireTextureIntegerWrapSWrapTWrapRMinificationFilterMagnificationFilterMinLODMaxLODBaseLevelMaxLevelDepthTextureCompare",
    header: "vtkTextureObject.h".}
  ## /@}
  ## /@{
  ## *
  ##  In case DepthTextureCompare is true, specify the comparison function in
  ##  use. The result of the comparison is noted `r'.
  ##  Valid values are:
  ##  - Value
  ##  - Lequal: r=R<=Dt ? 1.0 : 0.0
  ##  - Gequal: r=R>=Dt ? 1.0 : 0.0
  ##  - Less: r=R<D_t ? 1.0 : 0.0
  ##  - Greater: r=R>Dt ? 1.0 : 0.0
  ##  - Equal: r=R==Dt ? 1.0 : 0.0
  ##  - NotEqual: r=R!=Dt ? 1.0 : 0.0
  ##  - AlwaysTrue: r=1.0
  ##  - Never: r=0.0
  ##  If the magnification of minification factor are not nearest, percentage
  ##  closer filtering (PCF) is used: R is compared to several D_t and r is
  ##  the average of the comparisons (it is NOT the average of D_t compared
  ##  once to R).
  ##  Initial value is Lequal, as in OpenGL spec.
  ##  Ignored if the texture object is not a depth texture.
  ##
## !!!Ignored construct:  virtual int GetWidthWidthHeightDepthSamplesComponentsNumberOfDimensionsNumberOfDimensionsTargetHandleHandleAutoParametersRequireDepthBufferFloatSupportsDepthBufferFloatRequireTextureFloatSupportsTextureFloatRequireTextureIntegerSupportsTextureIntegerWrapSWrapSWrapTWrapRMinificationFilterMagnificationFilterMinLODMaxLODBaseLevelMaxLevelDepthTextureCompareDepthTextureCompareDepthTextureCompareFunction ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DepthTextureCompareFunction  of  << this -> DepthTextureCompareFunction ) ; return this -> DepthTextureCompareFunction ; } ;
## Error: expected ';'!!!

proc SetSamplesAutoParametersRequireDepthBufferFloatRequireTextureFloatRequireTextureIntegerWrapSWrapTWrapRMinificationFilterMagnificationFilterMinLODMaxLODBaseLevelMaxLevelDepthTextureCompareDepthTextureCompareFunction*(
    this: var vtkTextureObject; _arg: cint) {.importcpp: "SetSamplesAutoParametersRequireDepthBufferFloatRequireTextureFloatRequireTextureIntegerWrapSWrapTWrapRMinificationFilterMagnificationFilterMinLODMaxLODBaseLevelMaxLevelDepthTextureCompareDepthTextureCompareFunction",
    header: "vtkTextureObject.h".}
  ## /@}
  ## /@{
  ## *
  ##  Tells the hardware to generate mipmap textures from the first texture
  ##  image at BaseLevel.
  ##  Initial value is false, as in OpenGL spec.
  ##
## !!!Ignored construct:  virtual bool GetWidthWidthHeightDepthSamplesComponentsNumberOfDimensionsNumberOfDimensionsTargetHandleHandleAutoParametersRequireDepthBufferFloatSupportsDepthBufferFloatRequireTextureFloatSupportsTextureFloatRequireTextureIntegerSupportsTextureIntegerWrapSWrapSWrapTWrapRMinificationFilterMagnificationFilterMinLODMaxLODBaseLevelMaxLevelDepthTextureCompareDepthTextureCompareDepthTextureCompareFunctionGenerateMipmap ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateMipmap  of  << this -> GenerateMipmap ) ; return this -> GenerateMipmap ; } ;
## Error: expected ';'!!!

proc SetSamplesAutoParametersRequireDepthBufferFloatRequireTextureFloatRequireTextureIntegerWrapSWrapTWrapRMinificationFilterMagnificationFilterMinLODMaxLODBaseLevelMaxLevelDepthTextureCompareDepthTextureCompareFunctionGenerateMipmap*(
    this: var vtkTextureObject; _arg: bool) {.importcpp: "SetSamplesAutoParametersRequireDepthBufferFloatRequireTextureFloatRequireTextureIntegerWrapSWrapTWrapRMinificationFilterMagnificationFilterMinLODMaxLODBaseLevelMaxLevelDepthTextureCompareDepthTextureCompareFunctionGenerateMipmap",
    header: "vtkTextureObject.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the maximum anisotropic filtering to use. 1.0 means use no
  ##  anisotropic filtering. The default value is 1.0 and a high value would
  ##  be 16. This might not be supported on all machines.
  ##
proc SetSamplesAutoParametersRequireDepthBufferFloatRequireTextureFloatRequireTextureIntegerWrapSWrapTWrapRMinificationFilterMagnificationFilterMinLODMaxLODBaseLevelMaxLevelDepthTextureCompareDepthTextureCompareFunctionGenerateMipmapMaximumAnisotropicFiltering*(
    this: var vtkTextureObject; _arg: cfloat) {.importcpp: "SetSamplesAutoParametersRequireDepthBufferFloatRequireTextureFloatRequireTextureIntegerWrapSWrapTWrapRMinificationFilterMagnificationFilterMinLODMaxLODBaseLevelMaxLevelDepthTextureCompareDepthTextureCompareFunctionGenerateMipmapMaximumAnisotropicFiltering",
    header: "vtkTextureObject.h".}
## !!!Ignored construct:  virtual float GetWidthWidthHeightDepthSamplesComponentsNumberOfDimensionsNumberOfDimensionsTargetHandleHandleAutoParametersRequireDepthBufferFloatSupportsDepthBufferFloatRequireTextureFloatSupportsTextureFloatRequireTextureIntegerSupportsTextureIntegerWrapSWrapSWrapTWrapRMinificationFilterMagnificationFilterMinLODMaxLODBaseLevelMaxLevelDepthTextureCompareDepthTextureCompareDepthTextureCompareFunctionGenerateMipmapMaximumAnisotropicFiltering ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumAnisotropicFiltering  of  << this -> MaximumAnisotropicFiltering ) ; return this -> MaximumAnisotropicFiltering ; } ;
## Error: expected ';'!!!

proc GetMaximumTextureSize*(context: ptr vtkOpenGLRenderWindow): cint {.
    importcpp: "vtkTextureObject::GetMaximumTextureSize(@)",
    header: "vtkTextureObject.h".}
proc GetMaximumTextureSize3D*(context: ptr vtkOpenGLRenderWindow): cint {.
    importcpp: "vtkTextureObject::GetMaximumTextureSize3D(@)",
    header: "vtkTextureObject.h".}
proc GetMaximumTextureSize3D*(this: var vtkTextureObject): cint {.
    importcpp: "GetMaximumTextureSize3D", header: "vtkTextureObject.h".}
proc IsSupported*(a1: ptr vtkOpenGLRenderWindow; a2: bool; ##  requireTexFloat
                 a3: bool;     ##  requireDepthFloat
                 a4: bool): bool {.importcpp: "vtkTextureObject::IsSupported(@)",
                                header: "vtkTextureObject.h".}
  ##  requireTexInt
proc IsSupported*(a1: ptr vtkOpenGLRenderWindow): bool {.
    importcpp: "vtkTextureObject::IsSupported(@)", header: "vtkTextureObject.h".}
proc CopyToFrameBuffer*(this: var vtkTextureObject; program: ptr vtkShaderProgram;
                       vao: ptr vtkOpenGLVertexArrayObject) {.
    importcpp: "CopyToFrameBuffer", header: "vtkTextureObject.h".}
proc CopyToFrameBuffer*(this: var vtkTextureObject; srcXmin: cint; srcYmin: cint;
                       srcXmax: cint; srcYmax: cint; dstXmin: cint; dstYmin: cint;
                       dstXmax: cint; dstYmax: cint; dstSizeX: cint; dstSizeY: cint;
                       program: ptr vtkShaderProgram;
                       vao: ptr vtkOpenGLVertexArrayObject) {.
    importcpp: "CopyToFrameBuffer", header: "vtkTextureObject.h".}
proc CopyToFrameBuffer*(this: var vtkTextureObject; srcXmin: cint; srcYmin: cint;
                       srcXmax: cint; srcYmax: cint; dstXmin: cint; dstYmin: cint;
                       dstSizeX: cint; dstSizeY: cint;
                       program: ptr vtkShaderProgram;
                       vao: ptr vtkOpenGLVertexArrayObject) {.
    importcpp: "CopyToFrameBuffer", header: "vtkTextureObject.h".}
proc CopyToFrameBuffer*(this: var vtkTextureObject; tcoords: ptr cfloat;
                       verts: ptr cfloat; program: ptr vtkShaderProgram;
                       vao: ptr vtkOpenGLVertexArrayObject) {.
    importcpp: "CopyToFrameBuffer", header: "vtkTextureObject.h".}
proc CopyFromFrameBuffer*(this: var vtkTextureObject; srcXmin: cint; srcYmin: cint;
                         dstXmin: cint; dstYmin: cint; width: cint; height: cint) {.
    importcpp: "CopyFromFrameBuffer", header: "vtkTextureObject.h".}
proc GetShiftAndScale*(this: var vtkTextureObject; shift: var cfloat; scale: var cfloat) {.
    importcpp: "GetShiftAndScale", header: "vtkTextureObject.h".}
proc Resize*(this: var vtkTextureObject; width: cuint; height: cuint) {.
    importcpp: "Resize", header: "vtkTextureObject.h".}
## !!!Ignored construct:  /@{ *
##  Is this texture using the sRGB color space. If you are using a
##  sRGB framebuffer or window then you probably also want to be
##  using sRGB color textures for proper handling of gamma and
##  associated color mixing.
##  virtual bool GetWidthWidthHeightDepthSamplesComponentsNumberOfDimensionsNumberOfDimensionsTargetHandleHandleAutoParametersRequireDepthBufferFloatSupportsDepthBufferFloatRequireTextureFloatSupportsTextureFloatRequireTextureIntegerSupportsTextureIntegerWrapSWrapSWrapTWrapRMinificationFilterMagnificationFilterMinLODMaxLODBaseLevelMaxLevelDepthTextureCompareDepthTextureCompareDepthTextureCompareFunctionGenerateMipmapMaximumAnisotropicFilteringUseSRGBColorSpaceUseSRGBColorSpace ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseSRGBColorSpace  of  << this -> UseSRGBColorSpace ) ; return this -> UseSRGBColorSpace ; } ;
## Error: expected ';'!!!

proc SetSamplesAutoParametersRequireDepthBufferFloatRequireTextureFloatRequireTextureIntegerWrapSWrapTWrapRMinificationFilterMagnificationFilterMinLODMaxLODBaseLevelMaxLevelDepthTextureCompareDepthTextureCompareFunctionGenerateMipmapMaximumAnisotropicFilteringUseSRGBColorSpace*(
    this: var vtkTextureObject; _arg: bool) {.importcpp: "SetSamplesAutoParametersRequireDepthBufferFloatRequireTextureFloatRequireTextureIntegerWrapSWrapTWrapRMinificationFilterMagnificationFilterMinLODMaxLODBaseLevelMaxLevelDepthTextureCompareDepthTextureCompareFunctionGenerateMipmapMaximumAnisotropicFilteringUseSRGBColorSpace",
    header: "vtkTextureObject.h".}
proc UseSRGBColorSpaceOn*(this: var vtkTextureObject) {.
    importcpp: "UseSRGBColorSpaceOn", header: "vtkTextureObject.h".}
proc UseSRGBColorSpaceOff*(this: var vtkTextureObject) {.
    importcpp: "UseSRGBColorSpaceOff", header: "vtkTextureObject.h".}
  ## /@}
  ## *
  ##  Assign the TextureObject to a externally provided
  ##  Handle and Target. This class will not delete the texture
  ##  referenced by the handle upon releasing. That is up to
  ##  whoever created it originally. Note that activating
  ##  and binding will work. Properties such as wrap/interpolate
  ##  will also work. But width/height/format etc are left unset.
  ##
proc AssignToExistingTexture*(this: var vtkTextureObject; handle: cuint; target: cuint) {.
    importcpp: "AssignToExistingTexture", header: "vtkTextureObject.h".}