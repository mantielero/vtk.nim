## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExternalOpenGLRenderer.h
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
##  @class   vtkExternalOpenGLRenderer
##  @brief   OpenGL renderer
##
##  vtkExternalOpenGLRenderer is a secondary implementation of the class
##  vtkOpenGLRenderer. vtkExternalOpenGLRenderer interfaces to the
##  OpenGL graphics library. This class provides API to preserve the color and
##  depth buffers, thereby allowing external applications to manage the OpenGL
##  buffers. This becomes very useful when there are multiple OpenGL applications
##  sharing the same OpenGL context.
##
##  vtkExternalOpenGLRenderer makes sure that the camera used in the scene if of
##  type vtkExternalOpenGLCamera. It manages light and camera transformations for
##  VTK objects in the OpenGL context.
##
##  \sa vtkExternalOpenGLCamera
##

import
  vtkOpenGLRenderer, vtkRenderingExternalModule

##  Forward declarations

discard "forward decl of vtkLightCollection"
discard "forward decl of vtkExternalLight"
type
  vtkExternalOpenGLRenderer* {.importcpp: "vtkExternalOpenGLRenderer",
                              header: "vtkExternalOpenGLRenderer.h", bycopy.} = object of vtkOpenGLRenderer
    vtkExternalOpenGLRenderer* {.importc: "vtkExternalOpenGLRenderer".}: VTK_NEWINSTANCE


proc New*(): ptr vtkExternalOpenGLRenderer {.
    importcpp: "vtkExternalOpenGLRenderer::New(@)",
    header: "vtkExternalOpenGLRenderer.h".}
type
  vtkExternalOpenGLRendererSuperclass* = vtkOpenGLRenderer

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkExternalOpenGLRenderer::IsTypeOf(@)",
    header: "vtkExternalOpenGLRenderer.h".}
proc IsA*(this: var vtkExternalOpenGLRenderer; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkExternalOpenGLRenderer.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkExternalOpenGLRenderer {.
    importcpp: "vtkExternalOpenGLRenderer::SafeDownCast(@)",
    header: "vtkExternalOpenGLRenderer.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkExternalOpenGLRenderer :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkOpenGLRenderer :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExternalOpenGLRenderer :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExternalOpenGLRenderer :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkExternalOpenGLRenderer; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkExternalOpenGLRenderer.h".}
proc Render*(this: var vtkExternalOpenGLRenderer) {.importcpp: "Render",
    header: "vtkExternalOpenGLRenderer.h".}
proc MakeCamera*(this: var vtkExternalOpenGLRenderer): ptr vtkCamera {.
    importcpp: "MakeCamera", header: "vtkExternalOpenGLRenderer.h".}
proc AddExternalLight*(this: var vtkExternalOpenGLRenderer; a2: ptr vtkExternalLight) {.
    importcpp: "AddExternalLight", header: "vtkExternalOpenGLRenderer.h".}
proc RemoveExternalLight*(this: var vtkExternalOpenGLRenderer;
                         a2: ptr vtkExternalLight) {.
    importcpp: "RemoveExternalLight", header: "vtkExternalOpenGLRenderer.h".}
proc RemoveAllExternalLights*(this: var vtkExternalOpenGLRenderer) {.
    importcpp: "RemoveAllExternalLights", header: "vtkExternalOpenGLRenderer.h".}
## !!!Ignored construct:  *
##  If PreserveGLCameraMatrices is set to true, VTK camera matrices
##  are copied from the current context GL_MODELVIEW_MATRIX and
##  GL_PROJECTION_MATRIX parameters before each render call.
##  This flag is on by default.
##  virtual vtkTypeBool GetPreserveGLCameraMatricesPreserveGLCameraMatrices ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PreserveGLCameraMatrices  of  << this -> PreserveGLCameraMatrices ) ; return this -> PreserveGLCameraMatrices ; } ;
## Error: expected ';'!!!

proc SetPreserveGLCameraMatrices*(this: var vtkExternalOpenGLRenderer;
                                 _arg: vtkTypeBool) {.
    importcpp: "SetPreserveGLCameraMatrices",
    header: "vtkExternalOpenGLRenderer.h".}
proc PreserveGLCameraMatricesOn*(this: var vtkExternalOpenGLRenderer) {.
    importcpp: "PreserveGLCameraMatricesOn", header: "vtkExternalOpenGLRenderer.h".}
proc PreserveGLCameraMatricesOff*(this: var vtkExternalOpenGLRenderer) {.
    importcpp: "PreserveGLCameraMatricesOff",
    header: "vtkExternalOpenGLRenderer.h".}
  ## *
  ##  If PreserveGLLights is set to true, existing GL lights are modified before
  ##  each render call to match the collection of lights added with
  ##  AddExternalLight(). This flag is on by default.
  ##
## !!!Ignored construct:  virtual vtkTypeBool GetPreserveGLCameraMatricesPreserveGLCameraMatricesPreserveGLLights ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PreserveGLLights  of  << this -> PreserveGLLights ) ; return this -> PreserveGLLights ; } ;
## Error: expected ';'!!!

proc SetPreserveGLCameraMatricesPreserveGLLights*(
    this: var vtkExternalOpenGLRenderer; _arg: vtkTypeBool) {.
    importcpp: "SetPreserveGLCameraMatricesPreserveGLLights",
    header: "vtkExternalOpenGLRenderer.h".}
proc PreserveGLLightsOn*(this: var vtkExternalOpenGLRenderer) {.
    importcpp: "PreserveGLLightsOn", header: "vtkExternalOpenGLRenderer.h".}
proc PreserveGLLightsOff*(this: var vtkExternalOpenGLRenderer) {.
    importcpp: "PreserveGLLightsOff", header: "vtkExternalOpenGLRenderer.h".}