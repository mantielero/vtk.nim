## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOpenGLTextActor3D.h
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
##  @class   vtkOpenGLTextActor3D
##  @brief   OpenGL2 override for vtkTextActor3D.
##

import
  vtkRenderingOpenGL2Module, vtkTextActor3D

discard "forward decl of vtkOpenGLGL2PSHelper"
type
  vtkOpenGLTextActor3D* {.importcpp: "vtkOpenGLTextActor3D",
                         header: "vtkOpenGLTextActor3D.h", bycopy.} = object of vtkTextActor3D
    vtkOpenGLTextActor3D* {.importc: "vtkOpenGLTextActor3D".}: VTK_NEWINSTANCE


proc New*(): ptr vtkOpenGLTextActor3D {.importcpp: "vtkOpenGLTextActor3D::New(@)",
                                    header: "vtkOpenGLTextActor3D.h".}
type
  vtkOpenGLTextActor3DSuperclass* = vtkTextActor3D

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOpenGLTextActor3D::IsTypeOf(@)",
    header: "vtkOpenGLTextActor3D.h".}
proc IsA*(this: var vtkOpenGLTextActor3D; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkOpenGLTextActor3D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOpenGLTextActor3D {.
    importcpp: "vtkOpenGLTextActor3D::SafeDownCast(@)",
    header: "vtkOpenGLTextActor3D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOpenGLTextActor3D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTextActor3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOpenGLTextActor3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOpenGLTextActor3D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkOpenGLTextActor3D; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkOpenGLTextActor3D.h".}
proc RenderTranslucentPolygonalGeometry*(this: var vtkOpenGLTextActor3D;
                                        viewport: ptr vtkViewport): cint {.
    importcpp: "RenderTranslucentPolygonalGeometry",
    header: "vtkOpenGLTextActor3D.h".}