## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPBRLUTTexture.h
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
##  @class   vtkPBRLUTTexture
##  @brief   precompute BRDF look-up table texture used in physically based rendering
##
##  This texture is a 2D texture which precompute Fresnel response scale (red) and bias (green)
##  based on roughness (x) and angle between light and normal (y).
##

import
  vtkOpenGLTexture, vtkRenderingOpenGL2Module, vtkSmartPointer

discard "forward decl of vtkOpenGLFramebufferObject"
discard "forward decl of vtkOpenGLRenderWindow"
discard "forward decl of vtkOpenGLTexture"
discard "forward decl of vtkRenderWindow"
type
  vtkPBRLUTTexture* {.importcpp: "vtkPBRLUTTexture", header: "vtkPBRLUTTexture.h",
                     bycopy.} = object of vtkOpenGLTexture
    vtkPBRLUTTexture* {.importc: "vtkPBRLUTTexture".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPBRLUTTexture {.importcpp: "vtkPBRLUTTexture::New(@)",
                                header: "vtkPBRLUTTexture.h".}
type
  vtkPBRLUTTextureSuperclass* = vtkOpenGLTexture

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPBRLUTTexture::IsTypeOf(@)", header: "vtkPBRLUTTexture.h".}
proc IsA*(this: var vtkPBRLUTTexture; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkPBRLUTTexture.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPBRLUTTexture {.
    importcpp: "vtkPBRLUTTexture::SafeDownCast(@)", header: "vtkPBRLUTTexture.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPBRLUTTexture :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkOpenGLTexture :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPBRLUTTexture :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPBRLUTTexture :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPBRLUTTexture; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPBRLUTTexture.h".}
proc Load*(this: var vtkPBRLUTTexture; a2: ptr vtkRenderer) {.importcpp: "Load",
    header: "vtkPBRLUTTexture.h".}
proc Render*(this: var vtkPBRLUTTexture; ren: ptr vtkRenderer) {.importcpp: "Render",
    header: "vtkPBRLUTTexture.h".}
## !!!Ignored construct:  /@{ *
##  Set/Get size of texture.
##  Default is 1024.
##  virtual unsigned int GetLUTSizeLUTSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LUTSize  of  << this -> LUTSize ) ; return this -> LUTSize ; } ;
## Error: expected ';'!!!

proc SetLUTSize*(this: var vtkPBRLUTTexture; _arg: cuint) {.importcpp: "SetLUTSize",
    header: "vtkPBRLUTTexture.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the number of samples used during Monte-Carlo integration.
  ##  Default is 512.
  ##
## !!!Ignored construct:  virtual unsigned int GetLUTSizeLUTSizeLUTSamples ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LUTSamples  of  << this -> LUTSamples ) ; return this -> LUTSamples ; } ;
## Error: expected ';'!!!

proc SetLUTSizeLUTSamples*(this: var vtkPBRLUTTexture; _arg: cuint) {.
    importcpp: "SetLUTSizeLUTSamples", header: "vtkPBRLUTTexture.h".}
  ## /@}