## =========================================================================
##
##   Program:   Visualization Toolkit
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

import
  vtkRenderingOpenGL2Module, vtkTimeStamp

discard "forward decl of vtkOpenGLIndexBufferObject"
discard "forward decl of vtkOpenGLShaderCache"
discard "forward decl of vtkOpenGLVertexArrayObject"
discard "forward decl of vtkShaderProgram"
discard "forward decl of vtkWindow"
type
  vtkOpenGLHelper* {.importcpp: "vtkOpenGLHelper", header: "vtkOpenGLHelper.h",
                    bycopy.} = object
    Program* {.importc: "Program".}: ptr vtkShaderProgram
    ShaderSourceTime* {.importc: "ShaderSourceTime".}: vtkTimeStamp
    VAO* {.importc: "VAO".}: ptr vtkOpenGLVertexArrayObject
    AttributeUpdateTime* {.importc: "AttributeUpdateTime".}: vtkTimeStamp
    PrimitiveType* {.importc: "PrimitiveType".}: cint
    ShaderChangeValue* {.importc: "ShaderChangeValue".}: cuint
    IBO* {.importc: "IBO".}: ptr vtkOpenGLIndexBufferObject


proc constructvtkOpenGLHelper*(): vtkOpenGLHelper {.constructor,
    importcpp: "vtkOpenGLHelper(@)", header: "vtkOpenGLHelper.h".}
proc destroyvtkOpenGLHelper*(this: var vtkOpenGLHelper) {.
    importcpp: "#.~vtkOpenGLHelper()", header: "vtkOpenGLHelper.h".}
proc ReleaseGraphicsResources*(this: var vtkOpenGLHelper; win: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkOpenGLHelper.h".}
##  VTK-HeaderTest-Exclude: vtkOpenGLHelper.h
