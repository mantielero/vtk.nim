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
##  @class   vtkOpenGLShaderCache
##  @brief   manage Shader Programs within a context
##
##  vtkOpenGLShaderCache manages shader program compilation and binding
##

import
  vtkObject, vtkRenderingOpenGL2Module, vtkShader

discard "forward decl of vtkTransformFeedback"
discard "forward decl of vtkShaderProgram"
discard "forward decl of vtkWindow"
discard "forward decl of vtkOpenGLRenderWindow"
type
  vtkOpenGLShaderCache* {.importcpp: "vtkOpenGLShaderCache",
                         header: "vtkOpenGLShaderCache.h", bycopy.} = object of vtkObject
    vtkOpenGLShaderCache* {.importc: "vtkOpenGLShaderCache".}: VTK_NEWINSTANCE


proc New*(): ptr vtkOpenGLShaderCache {.importcpp: "vtkOpenGLShaderCache::New(@)",
                                    header: "vtkOpenGLShaderCache.h".}
type
  vtkOpenGLShaderCacheSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOpenGLShaderCache::IsTypeOf(@)",
    header: "vtkOpenGLShaderCache.h".}
proc IsA*(this: var vtkOpenGLShaderCache; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkOpenGLShaderCache.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOpenGLShaderCache {.
    importcpp: "vtkOpenGLShaderCache::SafeDownCast(@)",
    header: "vtkOpenGLShaderCache.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOpenGLShaderCache :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOpenGLShaderCache :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOpenGLShaderCache :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkOpenGLShaderCache; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkOpenGLShaderCache.h".}
proc ReadyShaderProgram*(this: var vtkOpenGLShaderCache; vertexCode: cstring;
                        fragmentCode: cstring; geometryCode: cstring;
                        cap: ptr vtkTransformFeedback = nil): ptr vtkShaderProgram {.
    importcpp: "ReadyShaderProgram", header: "vtkOpenGLShaderCache.h".}
proc ReadyShaderProgram*(this: var vtkOpenGLShaderCache;
                        shaders: map[Type, ptr vtkShader];
                        cap: ptr vtkTransformFeedback = nil): ptr vtkShaderProgram {.
    importcpp: "ReadyShaderProgram", header: "vtkOpenGLShaderCache.h".}
proc ReadyShaderProgram*(this: var vtkOpenGLShaderCache;
                        shader: ptr vtkShaderProgram;
                        cap: ptr vtkTransformFeedback = nil): ptr vtkShaderProgram {.
    importcpp: "ReadyShaderProgram", header: "vtkOpenGLShaderCache.h".}
proc ReleaseCurrentShader*(this: var vtkOpenGLShaderCache) {.
    importcpp: "ReleaseCurrentShader", header: "vtkOpenGLShaderCache.h".}
proc ReleaseGraphicsResources*(this: var vtkOpenGLShaderCache; win: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkOpenGLShaderCache.h".}
proc ClearLastShaderBound*(this: var vtkOpenGLShaderCache) {.
    importcpp: "ClearLastShaderBound", header: "vtkOpenGLShaderCache.h".}
proc GetnameLastShaderBound*(this: var vtkOpenGLShaderCache): ptr vtkShaderProgram {.
    importcpp: "GetnameLastShaderBound", header: "vtkOpenGLShaderCache.h".}
  ##  Set the time in seconds elapsed since the first render
proc SetElapsedTime*(this: var vtkOpenGLShaderCache; val: cfloat) {.
    importcpp: "SetElapsedTime", header: "vtkOpenGLShaderCache.h".}