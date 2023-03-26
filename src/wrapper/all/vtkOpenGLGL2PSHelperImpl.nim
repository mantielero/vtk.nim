## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOpenGLGL2PSHelperImpl.h
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
##  @class   vtkOpenGLGL2PSHelperImpl
##  @brief   vtkOpenGLGL2PSHelper override
##  implementation.
##

import
  vtkOpenGLGL2PSHelper, vtkRenderingGL2PSOpenGL2Module

discard "forward decl of vtkMatrix4x4"
discard "forward decl of vtkPoints"
type
  vtkOpenGLGL2PSHelperImpl* {.importcpp: "vtkOpenGLGL2PSHelperImpl",
                             header: "vtkOpenGLGL2PSHelperImpl.h", bycopy.} = object of vtkOpenGLGL2PSHelper
    vtkOpenGLGL2PSHelperImpl* {.importc: "vtkOpenGLGL2PSHelperImpl".}: VTK_NEWINSTANCE


proc New*(): ptr vtkOpenGLGL2PSHelperImpl {.importcpp: "vtkOpenGLGL2PSHelperImpl::New(@)",
                                        header: "vtkOpenGLGL2PSHelperImpl.h".}
type
  vtkOpenGLGL2PSHelperImplSuperclass* = vtkOpenGLGL2PSHelper

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOpenGLGL2PSHelperImpl::IsTypeOf(@)",
    header: "vtkOpenGLGL2PSHelperImpl.h".}
proc IsA*(this: var vtkOpenGLGL2PSHelperImpl; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkOpenGLGL2PSHelperImpl.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOpenGLGL2PSHelperImpl {.
    importcpp: "vtkOpenGLGL2PSHelperImpl::SafeDownCast(@)",
    header: "vtkOpenGLGL2PSHelperImpl.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOpenGLGL2PSHelperImpl :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkOpenGLGL2PSHelper :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOpenGLGL2PSHelperImpl :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOpenGLGL2PSHelperImpl :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkOpenGLGL2PSHelperImpl; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkOpenGLGL2PSHelperImpl.h".}
proc ProcessTransformFeedback*(this: var vtkOpenGLGL2PSHelperImpl;
                              tfc: ptr vtkTransformFeedback; ren: ptr vtkRenderer;
                              act: ptr vtkActor) {.
    importcpp: "ProcessTransformFeedback", header: "vtkOpenGLGL2PSHelperImpl.h".}
proc ProcessTransformFeedback*(this: var vtkOpenGLGL2PSHelperImpl;
                              tfc: ptr vtkTransformFeedback; ren: ptr vtkRenderer;
                              col: array[4, cuchar]) {.
    importcpp: "ProcessTransformFeedback", header: "vtkOpenGLGL2PSHelperImpl.h".}
proc ProcessTransformFeedback*(this: var vtkOpenGLGL2PSHelperImpl;
                              tfc: ptr vtkTransformFeedback; ren: ptr vtkRenderer;
                              col: array[4, cfloat]) {.
    importcpp: "ProcessTransformFeedback", header: "vtkOpenGLGL2PSHelperImpl.h".}
proc DrawString*(this: var vtkOpenGLGL2PSHelperImpl; str: string;
                tprop: ptr vtkTextProperty; pos: array[3, cdouble];
                backgroundDepth: cdouble; ren: ptr vtkRenderer) {.
    importcpp: "DrawString", header: "vtkOpenGLGL2PSHelperImpl.h".}
proc DrawPath*(this: var vtkOpenGLGL2PSHelperImpl; path: ptr vtkPath;
              rasterPos: array[3, cdouble]; windowPos: array[2, cdouble];
              rgba: array[4, cuchar]; scale: array[2, cdouble] = nil;
              rotateAngle: cdouble = 0.0; strokeWidth: cfloat = -1; label: cstring = nil) {.
    importcpp: "DrawPath", header: "vtkOpenGLGL2PSHelperImpl.h".}
proc Draw3DPath*(this: var vtkOpenGLGL2PSHelperImpl; path: ptr vtkPath;
                actorMatrix: ptr vtkMatrix4x4; rasterPos: array[3, cdouble];
                actorColor: array[4, cuchar]; ren: ptr vtkRenderer;
                label: cstring = nil) {.importcpp: "Draw3DPath",
                                    header: "vtkOpenGLGL2PSHelperImpl.h".}
proc DrawImage*(this: var vtkOpenGLGL2PSHelperImpl; input: ptr vtkImageData;
               pos: array[3, cdouble]) {.importcpp: "DrawImage",
                                      header: "vtkOpenGLGL2PSHelperImpl.h".}