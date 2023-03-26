## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOpenGLContextActor.h
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
##  @class   vtkOpenGLContextActor
##  @brief   provides a vtkProp derived object.
##
##  This object provides the entry point for the vtkContextScene to be rendered
##  in a vtkRenderer. Uses the RenderOverlay pass to render the 2D
##  vtkContextScene.
##

import
  vtkContextActor, vtkRenderingContextOpenGL2Module

type
  vtkOpenGLContextActor* {.importcpp: "vtkOpenGLContextActor",
                          header: "vtkOpenGLContextActor.h", bycopy.} = object of vtkContextActor
    vtkOpenGLContextActor* {.importc: "vtkOpenGLContextActor".}: VTK_NEWINSTANCE


proc PrintSelf*(this: var vtkOpenGLContextActor; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkOpenGLContextActor.h".}
type
  vtkOpenGLContextActorSuperclass* = vtkContextActor

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOpenGLContextActor::IsTypeOf(@)",
    header: "vtkOpenGLContextActor.h".}
proc IsA*(this: var vtkOpenGLContextActor; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkOpenGLContextActor.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOpenGLContextActor {.
    importcpp: "vtkOpenGLContextActor::SafeDownCast(@)",
    header: "vtkOpenGLContextActor.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOpenGLContextActor :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkContextActor :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOpenGLContextActor :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOpenGLContextActor :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc New*(): ptr vtkOpenGLContextActor {.importcpp: "vtkOpenGLContextActor::New(@)",
                                     header: "vtkOpenGLContextActor.h".}
proc ReleaseGraphicsResources*(this: var vtkOpenGLContextActor;
                              window: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkOpenGLContextActor.h".}
proc RenderOverlay*(this: var vtkOpenGLContextActor; viewport: ptr vtkViewport): cint {.
    importcpp: "RenderOverlay", header: "vtkOpenGLContextActor.h".}