## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRenderState.h
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
##  @class   vtkRenderState
##  @brief   Context in which a vtkRenderPass will render.
##
##  vtkRenderState is a lightweight effective class which gather information
##  used by a vtkRenderPass to perform its execution.
##  @attention
##  Get methods are const to enforce that a renderpass cannot modify the
##  RenderPass object. It works in conjunction with vtkRenderPass::Render where
##  the argument vtkRenderState is const.
##  @sa
##  vtkRenderPass vtkRenderer vtkFrameBufferObject vtkProp
##

import
  vtkObject, vtkRenderingCoreModule

discard "forward decl of vtkRenderer"
discard "forward decl of vtkProp"
discard "forward decl of vtkFrameBufferObjectBase"
discard "forward decl of vtkInformation"
type
  vtkRenderState* {.importcpp: "vtkRenderState", header: "vtkRenderState.h", bycopy.} = object ## *
                                                                                       ##  Constructor. All values are initialized to 0 or NULL.
                                                                                       ##  \pre renderer_exists: renderer!=0
                                                                                       ##  \post renderer_is_set: GetRenderer()==renderer.
                                                                                       ##  \post valid_state: IsValid()
                                                                                       ##
                                                                                       ## *
                                                                                       ##  The renderer in which the render pass is performed.
                                                                                       ##  It gives access to the RenderWindow, to the props.
                                                                                       ##
    ## *
    ##  The framebuffer in use. NULL means the FrameBuffer provided by
    ##  the RenderWindow (it can actually be an FBO in case the RenderWindow
    ##  is in off screen mode).
    ##
    ## /@{
    ## *
    ##  Subset of props to render. A renderpass might ignore this filtered list
    ##  and access to all the props of the vtkRenderer object directly.
    ##  For example, a render pass may filter props that are visible and
    ##  not culled by the frustum, but a sub render pass building a shadow map may
    ##  need all the visible props.
    ##
    ## /@}
    ## *
    ##  It tells that the current render pass it supposed to render only props
    ##  that have all the RequiredKeys in their property keys.
    ##


proc constructvtkRenderState*(renderer: ptr vtkRenderer): vtkRenderState {.
    constructor, importcpp: "vtkRenderState(@)", header: "vtkRenderState.h".}
proc destroyvtkRenderState*(this: var vtkRenderState) {.
    importcpp: "#.~vtkRenderState()", header: "vtkRenderState.h".}
proc IsValid*(this: vtkRenderState): bool {.noSideEffect, importcpp: "IsValid",
                                        header: "vtkRenderState.h".}
proc GetRenderer*(this: vtkRenderState): ptr vtkRenderer {.noSideEffect,
    importcpp: "GetRenderer", header: "vtkRenderState.h".}
proc GetFrameBuffer*(this: vtkRenderState): ptr vtkFrameBufferObjectBase {.
    noSideEffect, importcpp: "GetFrameBuffer", header: "vtkRenderState.h".}
proc SetFrameBuffer*(this: var vtkRenderState; fbo: ptr vtkFrameBufferObjectBase) {.
    importcpp: "SetFrameBuffer", header: "vtkRenderState.h".}
proc GetWindowSize*(this: vtkRenderState; size: array[2, cint]) {.noSideEffect,
    importcpp: "GetWindowSize", header: "vtkRenderState.h".}
proc GetPropArray*(this: vtkRenderState): ptr ptr vtkProp {.noSideEffect,
    importcpp: "GetPropArray", header: "vtkRenderState.h".}
proc GetPropArrayCount*(this: vtkRenderState): cint {.noSideEffect,
    importcpp: "GetPropArrayCount", header: "vtkRenderState.h".}
proc SetPropArrayAndCount*(this: var vtkRenderState; propArray: ptr ptr vtkProp;
                          propArrayCount: cint) {.
    importcpp: "SetPropArrayAndCount", header: "vtkRenderState.h".}
proc GetRequiredKeys*(this: vtkRenderState): ptr vtkInformation {.noSideEffect,
    importcpp: "GetRequiredKeys", header: "vtkRenderState.h".}
proc SetRequiredKeys*(this: var vtkRenderState; keys: ptr vtkInformation) {.
    importcpp: "SetRequiredKeys", header: "vtkRenderState.h".}
##  VTK-HeaderTest-Exclude: vtkRenderState.h
