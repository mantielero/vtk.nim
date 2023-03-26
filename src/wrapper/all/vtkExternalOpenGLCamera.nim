## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExternalOpenGLCamera.h
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
##  @class   vtkExternalOpenGLCamera
##  @brief   OpenGL camera
##
##  vtkExternalOpenGLCamera is a concrete implementation of the abstract class
##  vtkCamera.  vtkExternalOpenGLCamera interfaces to the OpenGL rendering library.
##  This class extends vtkOpenGLCamera by introducing API wherein the camera
##  matrices can be set explicitly by the application.
##

import
  vtkOpenGLCamera, vtkRenderingExternalModule

type
  vtkExternalOpenGLCamera* {.importcpp: "vtkExternalOpenGLCamera",
                            header: "vtkExternalOpenGLCamera.h", bycopy.} = object of vtkOpenGLCamera
    vtkExternalOpenGLCamera* {.importc: "vtkExternalOpenGLCamera".}: VTK_NEWINSTANCE


proc New*(): ptr vtkExternalOpenGLCamera {.importcpp: "vtkExternalOpenGLCamera::New(@)",
                                       header: "vtkExternalOpenGLCamera.h".}
type
  vtkExternalOpenGLCameraSuperclass* = vtkOpenGLCamera

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkExternalOpenGLCamera::IsTypeOf(@)",
    header: "vtkExternalOpenGLCamera.h".}
proc IsA*(this: var vtkExternalOpenGLCamera; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkExternalOpenGLCamera.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkExternalOpenGLCamera {.
    importcpp: "vtkExternalOpenGLCamera::SafeDownCast(@)",
    header: "vtkExternalOpenGLCamera.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkExternalOpenGLCamera :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkOpenGLCamera :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExternalOpenGLCamera :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExternalOpenGLCamera :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkExternalOpenGLCamera; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkExternalOpenGLCamera.h".}
proc SetViewTransformMatrix*(this: var vtkExternalOpenGLCamera;
                            elements: array[16, cdouble]) {.
    importcpp: "SetViewTransformMatrix", header: "vtkExternalOpenGLCamera.h".}
proc SetProjectionTransformMatrix*(this: var vtkExternalOpenGLCamera;
                                  elements: array[16, cdouble]) {.
    importcpp: "SetProjectionTransformMatrix", header: "vtkExternalOpenGLCamera.h".}