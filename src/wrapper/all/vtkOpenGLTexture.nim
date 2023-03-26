## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOpenGLTexture.h
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
##  @class   vtkOpenGLTexture
##  @brief   OpenGL texture map
##
##  vtkOpenGLTexture is a concrete implementation of the abstract class
##  vtkTexture. vtkOpenGLTexture interfaces to the OpenGL rendering library.
##

import
  vtkRenderingOpenGL2Module, vtkTexture, vtkWeakPointer

discard "forward decl of vtkRenderWindow"
discard "forward decl of vtkTextureObject"
type
  vtkOpenGLTexture* {.importcpp: "vtkOpenGLTexture", header: "vtkOpenGLTexture.h",
                     bycopy.} = object of vtkTexture
    vtkOpenGLTexture* {.importc: "vtkOpenGLTexture".}: VTK_NEWINSTANCE
    ##  RenderWindow used for previous render
    ##  used when the texture exceeds the GL limit


proc New*(): ptr vtkOpenGLTexture {.importcpp: "vtkOpenGLTexture::New(@)",
                                header: "vtkOpenGLTexture.h".}
type
  vtkOpenGLTextureSuperclass* = vtkTexture

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOpenGLTexture::IsTypeOf(@)", header: "vtkOpenGLTexture.h".}
proc IsA*(this: var vtkOpenGLTexture; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkOpenGLTexture.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOpenGLTexture {.
    importcpp: "vtkOpenGLTexture::SafeDownCast(@)", header: "vtkOpenGLTexture.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOpenGLTexture :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTexture :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOpenGLTexture :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOpenGLTexture :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkOpenGLTexture; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkOpenGLTexture.h".}
proc Render*(this: var vtkOpenGLTexture; ren: ptr vtkRenderer) {.importcpp: "Render",
    header: "vtkOpenGLTexture.h".}
proc Load*(this: var vtkOpenGLTexture; a2: ptr vtkRenderer) {.importcpp: "Load",
    header: "vtkOpenGLTexture.h".}
proc PostRender*(this: var vtkOpenGLTexture; a2: ptr vtkRenderer) {.
    importcpp: "PostRender", header: "vtkOpenGLTexture.h".}
proc ReleaseGraphicsResources*(this: var vtkOpenGLTexture; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkOpenGLTexture.h".}
proc CopyTexImage*(this: var vtkOpenGLTexture; x: cint; y: cint; width: cint; height: cint) {.
    importcpp: "CopyTexImage", header: "vtkOpenGLTexture.h".}
## !!!Ignored construct:  /@{ *
##  Provide for specifying a format for the texture
##  virtual int GetIsDepthTextureIsDepthTexture ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IsDepthTexture  of  << this -> IsDepthTexture ) ; return this -> IsDepthTexture ; } ;
## Error: expected ';'!!!

proc SetIsDepthTexture*(this: var vtkOpenGLTexture; _arg: cint) {.
    importcpp: "SetIsDepthTexture", header: "vtkOpenGLTexture.h".}
  ## /@}
  ## /@{
  ## *
  ##  What type of texture map GL_TEXTURE_2D versus GL_TEXTURE_RECTANGLE
  ##
## !!!Ignored construct:  virtual int GetIsDepthTextureIsDepthTextureTextureType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TextureType  of  << this -> TextureType ) ; return this -> TextureType ; } ;
## Error: expected ';'!!!

proc SetIsDepthTextureTextureType*(this: var vtkOpenGLTexture; _arg: cint) {.
    importcpp: "SetIsDepthTextureTextureType", header: "vtkOpenGLTexture.h".}
  ## /@}
proc GetnameTextureObject*(this: var vtkOpenGLTexture): ptr vtkTextureObject {.
    importcpp: "GetnameTextureObject", header: "vtkOpenGLTexture.h".}
proc SetTextureObject*(this: var vtkOpenGLTexture; a2: ptr vtkTextureObject) {.
    importcpp: "SetTextureObject", header: "vtkOpenGLTexture.h".}
proc GetTextureUnit*(this: var vtkOpenGLTexture): cint {.importcpp: "GetTextureUnit",
    header: "vtkOpenGLTexture.h".}
proc IsTranslucent*(this: var vtkOpenGLTexture): cint {.importcpp: "IsTranslucent",
    header: "vtkOpenGLTexture.h".}