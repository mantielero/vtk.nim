## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOpenGLRenderPass.h
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
##  @class   vtkOpenGLRenderPass
##  @brief   Abstract render pass with shader modifications.
##
##
##  Allows a render pass to update shader code using a new virtual API.
##

import
  vtkRenderPass, vtkRenderingOpenGL2Module

discard "forward decl of vtkAbstractMapper"
discard "forward decl of vtkInformationObjectBaseVectorKey"
discard "forward decl of vtkProp"
discard "forward decl of vtkShaderProgram"
discard "forward decl of vtkOpenGLVertexArrayObject"
type
  vtkOpenGLRenderPass* {.importcpp: "vtkOpenGLRenderPass",
                        header: "vtkOpenGLRenderPass.h", bycopy.} = object of vtkRenderPass
    vtkOpenGLRenderPass* {.importc: "vtkOpenGLRenderPass".}: VTK_NEWINSTANCE

  vtkOpenGLRenderPassSuperclass* = vtkRenderPass

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOpenGLRenderPass::IsTypeOf(@)", header: "vtkOpenGLRenderPass.h".}
proc IsA*(this: var vtkOpenGLRenderPass; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkOpenGLRenderPass.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOpenGLRenderPass {.
    importcpp: "vtkOpenGLRenderPass::SafeDownCast(@)",
    header: "vtkOpenGLRenderPass.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOpenGLRenderPass :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkRenderPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOpenGLRenderPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOpenGLRenderPass :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkOpenGLRenderPass; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkOpenGLRenderPass.h".}
proc PreReplaceShaderValues*(this: var vtkOpenGLRenderPass;
                            vertexShader: var string; geometryShader: var string;
                            fragmentShader: var string;
                            mapper: ptr vtkAbstractMapper; prop: ptr vtkProp): bool {.
    importcpp: "PreReplaceShaderValues", header: "vtkOpenGLRenderPass.h".}
proc PostReplaceShaderValues*(this: var vtkOpenGLRenderPass;
                             vertexShader: var string; geometryShader: var string;
                             fragmentShader: var string;
                             mapper: ptr vtkAbstractMapper; prop: ptr vtkProp): bool {.
    importcpp: "PostReplaceShaderValues", header: "vtkOpenGLRenderPass.h".}
proc SetShaderParameters*(this: var vtkOpenGLRenderPass;
                         program: ptr vtkShaderProgram;
                         mapper: ptr vtkAbstractMapper; prop: ptr vtkProp;
                         VAO: ptr vtkOpenGLVertexArrayObject = nil): bool {.
    importcpp: "SetShaderParameters", header: "vtkOpenGLRenderPass.h".}
proc GetShaderStageMTime*(this: var vtkOpenGLRenderPass): vtkMTimeType {.
    importcpp: "GetShaderStageMTime", header: "vtkOpenGLRenderPass.h".}
proc RenderPasses*(): ptr vtkInformationObjectBaseVectorKey {.
    importcpp: "vtkOpenGLRenderPass::RenderPasses(@)",
    header: "vtkOpenGLRenderPass.h".}
proc SetActiveDrawBuffers*(this: var vtkOpenGLRenderPass; _arg: cuint) {.
    importcpp: "SetActiveDrawBuffers", header: "vtkOpenGLRenderPass.h".}
## !!!Ignored construct:  virtual unsigned int GetActiveDrawBuffers ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ActiveDrawBuffers  of  << this -> ActiveDrawBuffers ) ; return this -> ActiveDrawBuffers ; } ;
## Error: expected ';'!!!
