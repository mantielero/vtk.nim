## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOpenGLProperty.h
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
##  @class   vtkOpenGLProperty
##  @brief   OpenGL property
##
##  vtkOpenGLProperty is a concrete implementation of the abstract class
##  vtkProperty. vtkOpenGLProperty interfaces to the OpenGL rendering library.
##

import
  vtkProperty, vtkRenderingOpenGL2Module

type
  vtkOpenGLProperty* {.importcpp: "vtkOpenGLProperty",
                      header: "vtkOpenGLProperty.h", bycopy.} = object of vtkProperty
    vtkOpenGLProperty* {.importc: "vtkOpenGLProperty".}: VTK_NEWINSTANCE


proc New*(): ptr vtkOpenGLProperty {.importcpp: "vtkOpenGLProperty::New(@)",
                                 header: "vtkOpenGLProperty.h".}
type
  vtkOpenGLPropertySuperclass* = vtkProperty

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOpenGLProperty::IsTypeOf(@)", header: "vtkOpenGLProperty.h".}
proc IsA*(this: var vtkOpenGLProperty; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkOpenGLProperty.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOpenGLProperty {.
    importcpp: "vtkOpenGLProperty::SafeDownCast(@)", header: "vtkOpenGLProperty.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOpenGLProperty :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkProperty :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOpenGLProperty :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOpenGLProperty :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkOpenGLProperty; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkOpenGLProperty.h".}
proc Render*(this: var vtkOpenGLProperty; a: ptr vtkActor; ren: ptr vtkRenderer) {.
    importcpp: "Render", header: "vtkOpenGLProperty.h".}
proc BackfaceRender*(this: var vtkOpenGLProperty; a: ptr vtkActor; ren: ptr vtkRenderer) {.
    importcpp: "BackfaceRender", header: "vtkOpenGLProperty.h".}
proc PostRender*(this: var vtkOpenGLProperty; a: ptr vtkActor; r: ptr vtkRenderer) {.
    importcpp: "PostRender", header: "vtkOpenGLProperty.h".}
proc ReleaseGraphicsResources*(this: var vtkOpenGLProperty; win: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkOpenGLProperty.h".}