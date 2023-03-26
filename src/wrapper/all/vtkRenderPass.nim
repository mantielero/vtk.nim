## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRenderPass.h
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
##  @class   vtkRenderPass
##  @brief   Perform part of the rendering of a vtkRenderer.
##
##  vtkRenderPass is a deferred class with a simple deferred method Render.
##  This method performs a rendering pass of the scene described in
##  vtkRenderState.
##  Subclasses define what really happens during rendering.
##
##  Directions to write a subclass of vtkRenderPass:
##  It is up to the subclass to decide if it needs to delegate part of its job
##  to some other vtkRenderPass objects ("delegates").
##  - The subclass has to define ivar to set/get its delegates.
##  - The documentation of the subclass has to describe:
##   - what each delegate is supposed to perform
##   - if a delegate is supposed to be used once or multiple times
##   - what it expects to have in the framebuffer before starting (status
##  of colorbuffers, depth buffer, stencil buffer)
##   - what it will change in the framebuffer.
##  - A pass cannot modify the vtkRenderState where it will perform but
##  it can build a new vtkRenderState (it can change the FrameBuffer, change the
##  prop array, changed the required prop properties keys (usually adding some
##  to a copy of the existing list) but it has to keep the same vtkRenderer
##  object), make it current and pass it to its delegate.
##  - at the end of the execution of Render, the pass has to ensure the
##  current vtkRenderState is the one it has in argument.
##  @sa
##  vtkRenderState vtkRenderer
##

import
  vtkObject, vtkRenderingCoreModule

discard "forward decl of vtkFrameBufferObjectBase"
discard "forward decl of vtkRenderState"
discard "forward decl of vtkWindow"
discard "forward decl of vtkRenderer"
type
  vtkRenderPass* {.importcpp: "vtkRenderPass", header: "vtkRenderPass.h", bycopy.} = object of vtkObject ## *
                                                                                               ##  Default constructor. Do nothing.
                                                                                               ##
    vtkRenderPass* {.importc: "vtkRenderPass".}: VTK_NEWINSTANCE

  vtkRenderPassSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkRenderPass::IsTypeOf(@)", header: "vtkRenderPass.h".}
proc IsA*(this: var vtkRenderPass; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkRenderPass.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkRenderPass {.
    importcpp: "vtkRenderPass::SafeDownCast(@)", header: "vtkRenderPass.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkRenderPass :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRenderPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRenderPass :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkRenderPass; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkRenderPass.h".}
proc Render*(this: var vtkRenderPass; s: ptr vtkRenderState) {.importcpp: "Render",
    header: "vtkRenderPass.h".}
## !!!Ignored construct:  /@{ *
##  Number of props rendered at the last Render call.
##  virtual int GetNumberOfRenderedPropsNumberOfRenderedProps ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfRenderedProps  of  << this -> NumberOfRenderedProps ) ; return this -> NumberOfRenderedProps ; } ;
## Error: expected ';'!!!

proc ReleaseGraphicsResources*(this: var vtkRenderPass; w: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkRenderPass.h".}